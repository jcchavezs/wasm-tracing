package tracing

import (
	"context"

	"github.com/http-wasm/http-wasm-host-go/handler"
	tracinghandler "github.com/jcchavezs/http-wasm-tracing/internal/host/handler"
	"github.com/jcchavezs/http-wasm-tracing/trace"
	"github.com/tetratelabs/wazero"
)

// WrapRuntime wraps a runtime with tracing middleware.
var WrapNewRuntime = func(nr handler.NewRuntime) handler.NewRuntime {
	return func(ctx context.Context) (wazero.Runtime, error) {
		r, err := nr(ctx)
		if err != nil {
			return nil, err
		}
		return tracinghandler.WrapRuntime(r), nil
	}
}

var extractorSet bool

// SetExtractor sets the extractor to use for extracting spans from the context.
func SetExtractor(e trace.Extractor) {
	if !extractorSet {
		tracinghandler.Extractor = e
		extractorSet = true
	}
}
