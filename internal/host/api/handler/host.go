package handler

import "context"

// Host is the interface that the WebAssembly module expects to be
// implemented by the host.
type Host interface {
	// SetSpanStringAttribute supports the WebAssembly function export
	// FuncSetSpanStringAttribute.
	SetSpanStringAttribute(ctx context.Context, key, value string)
}
