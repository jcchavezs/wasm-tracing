package handler

import (
	"github.com/jcchavezs/http-wasm-tracing/guest/tinygo/handler/internal/imports"
)

// SetSpanStringAttribute sets an string attribute on the current span.
func SetSpanStringAttribute(key, value string) {
	namePtr, nameLen := stringToPtr(key)
	valuePtr, valueLen := stringToPtr(value)
	imports.SetSpanStringAttribute(namePtr, nameLen, valuePtr, valueLen)
}
