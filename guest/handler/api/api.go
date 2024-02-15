package api

type Span interface {
	SetAttribute(key string, value string)
}

type AccessSpanContext func(Span)
