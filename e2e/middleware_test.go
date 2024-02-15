package e2e

import (
	"context"
	_ "embed"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/http-wasm/http-wasm-host-go/handler"
	wasm "github.com/http-wasm/http-wasm-host-go/handler/nethttp"
	tracing "github.com/jcchavezs/http-wasm-tracing"
	"github.com/jcchavezs/http-wasm-tracing/trace"
	"github.com/stretchr/testify/require"
)

//go:embed testdata/hello.wasm
var helloGuest string

type Span struct {
	attrKey, attrValue string
}

func (s *Span) SetAttribute(key, value string) {
	s.attrKey = key
	s.attrValue = value
}

type spanKey struct{}

func inject(ctx context.Context, s *Span) context.Context {
	return context.WithValue(ctx, spanKey{}, s)
}

func extract(ctx context.Context) (trace.Span, bool) {
	s, ok := ctx.Value(spanKey{}).(*Span)
	return s, ok
}

func TestE2E(t *testing.T) {
	tracing.SetExtractor(extract)
	mw, err := wasm.NewMiddleware(
		context.Background(),
		[]byte(helloGuest),
		handler.Runtime(tracing.WrapNewRuntime(handler.DefaultRuntime)),
	)
	require.NoError(t, err)

	h := mw.NewHandler(context.Background(), http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Hello, world!"))
	}))

	s := &Span{}

	req, _ := http.NewRequest("GET", "/", nil)
	req = req.WithContext(inject(req.Context(), s))

	h.ServeHTTP(httptest.NewRecorder(), req)

	require.Equal(t, "hello", s.attrKey)
	require.Equal(t, "world", s.attrValue)
}
