//go:build e2e

package e2e

import (
	"context"
	_ "embed"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/http-wasm/http-wasm-host-go/handler"
	wasm "github.com/http-wasm/http-wasm-host-go/handler/nethttp"
	tracing "github.com/jcchavezs/wasm-tracing"
	"github.com/jcchavezs/wasm-tracing/trace"
	"github.com/stretchr/testify/require"
	"github.com/tetratelabs/wazero"
)

//go:embed testdata/hello.wasm
var helloGuest string

type Span struct {
	attrKey, attrValue string
}

func (s *Span) SetStringAttribute(key, value string) {
	s.attrKey = key
	s.attrValue = value
}

type spanKey struct{}

func inject(ctx context.Context, s *Span) context.Context {
	return context.WithValue(ctx, spanKey{}, s)
}

func MakeExtract(t *testing.T) trace.Extractor {
	t.Helper()
	return func(ctx context.Context) (trace.Span, bool) {
		s, ok := ctx.Value(spanKey{}).(*Span)
		require.True(t, ok)
		return s, ok
	}
}

func TestE2E(t *testing.T) {
	tracing.SetExtractor(MakeExtract(t))

	r, err := handler.DefaultRuntime(context.Background())
	require.NoError(t, err)

	err = tracing.LoadModuleIntoRuntime(context.Background(), r)
	require.NoError(t, err)

	mw, err := wasm.NewMiddleware(
		context.Background(),
		[]byte(helloGuest),
		handler.Runtime(func(ctx context.Context) (wazero.Runtime, error) {
			return r, nil
		}),
	)
	require.NoError(t, err)

	h := mw.NewHandler(context.Background(), http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("No hello"))
	}))

	s := &Span{}

	req, _ := http.NewRequest("GET", "/", nil)
	req = req.WithContext(inject(req.Context(), s))

	res := httptest.NewRecorder()

	h.ServeHTTP(res, req)

	require.Equal(t, "hello", res.Body.String()) // notice the change in the response body

	require.Equal(t, "greeting_id", s.attrKey)
	require.Equal(t, "1", s.attrValue)
}
