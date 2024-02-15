package trace

import "context"

type Span interface {
	SetAttribute(key string, value string)
}

type Extractor func(ctx context.Context) (Span, bool)
