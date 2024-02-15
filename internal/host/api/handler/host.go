package handler

import "context"

type Host interface {
	// SetRequestHeaderValue supports the WebAssembly function export
	// FuncSetHeaderValue with HeaderKindRequest.
	SetSpanAttribute(ctx context.Context, key, value string)
}
