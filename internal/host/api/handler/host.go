package handler

import "context"

type Host interface {
	// SetSpanAttribute supports the WebAssembly function export
	// FuncSetSpanAttribute.
	SetSpanAttribute(ctx context.Context, key, value string)
}
