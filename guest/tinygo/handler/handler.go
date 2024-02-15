package handler

import (
	"github.com/jcchavezs/http-wasm-tracing/guest/tinygo/handler/internal/imports"
)

func SetSpanAttribute(key, value string) {
	namePtr, nameLen := stringToPtr(key)
	valuePtr, valueLen := stringToPtr(value)
	imports.SetSpanAttribute(namePtr, nameLen, valuePtr, valueLen)
}
