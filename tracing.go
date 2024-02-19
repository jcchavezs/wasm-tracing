package tracing

import (
	"context"

	"github.com/jcchavezs/wasm-tracing/internal/host/handler"
	"github.com/jcchavezs/wasm-tracing/trace"
	"github.com/tetratelabs/wazero"
)

func LoadModuleIntoRuntime(ctx context.Context, r wazero.Runtime) error {
	cm, err := handler.Module(r)
	if err != nil {
		return err
	}

	_, err = r.InstantiateModule(ctx, cm, wazero.NewModuleConfig())
	return err
}

var extractorSet bool

// SetExtractor sets the extractor to use for extracting spans from the context.
func SetExtractor(e trace.Extractor) {
	if !extractorSet {
		handler.Extractor = e
		extractorSet = true
	}
}
