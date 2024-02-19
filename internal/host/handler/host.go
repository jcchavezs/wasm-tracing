package handler

import (
	"context"

	apihandler "github.com/jcchavezs/wasm-tracing/internal/host/api/handler"
	"github.com/jcchavezs/wasm-tracing/trace"
)

var Extractor = func(ctx context.Context) (trace.Span, bool) {
	return nil, false
}

type host struct{}

var _ apihandler.Host = host{}

func (host) SetSpanStringAttribute(ctx context.Context, key, value string) {
	if s, ok := Extractor(ctx); ok {
		s.SetStringAttribute(key, value)
	}
}
