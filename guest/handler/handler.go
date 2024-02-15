package handler

import (
	tracingapi "github.com/jcchavezs/http-wasm-tracing/guest/handler/api"
	"github.com/jcchavezs/http-wasm-tracing/guest/handler/internal/imports"
)

// HandleResponseFn defaults to no-op.
var AccessSpanContextFn tracingapi.AccessSpanContext = func(tracingapi.Span) {}

// accessSpanContext is only exported to the host.
//
//go:export access_span_context
func accessSpanContext() { //nolint
	AccessSpanContextFn(wasmSpan{})
}

type wasmSpan struct{}

func (wasmSpan) SetAttribute(key string, value string) {
	namePtr, nameSize := stringToPtr(key)
	valuePtr, valueSize := stringToPtr(value)
	imports.SetSpanAttribute(namePtr, nameSize, valuePtr, valueSize)
}
