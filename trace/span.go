package trace

import "context"

// Span is an interface for setting span attributes
type Span interface {
	SetStringAttribute(key string, value string)
}

// Extractor is a function that extracts a span from a context
type Extractor func(ctx context.Context) (Span, bool)
