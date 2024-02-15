package tracing

import (
	"github.com/jcchavezs/http-wasm-tracing/internal/host/handler"
	"github.com/jcchavezs/http-wasm-tracing/tracing"
)

var WrapRuntime = handler.WrapRuntime

var extractorSet = false

func SetExtractor(e tracing.Extractor) {
	if !extractorSet {
		handler.Extractor = e
		extractorSet = true
	}
}
