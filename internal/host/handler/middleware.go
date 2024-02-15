package handler

import (
	"context"
	"fmt"

	apihandler "github.com/jcchavezs/http-wasm-tracing/internal/host/api/handler"
	wazeroapi "github.com/tetratelabs/wazero/api"
)

type middleware struct {
	host apihandler.Host
}

func (m *middleware) setSpanAttribute(ctx context.Context, mod wazeroapi.Module, params []uint64) {
	key := uint32(params[1])
	keyLen := uint32(params[2])
	value := uint32(params[3])
	valueLen := uint32(params[4])

	if keyLen == 0 {
		panic("span attribute key cannot be empty")
	}
	m.host.SetSpanAttribute(ctx, mustReadString(mod.Memory(), "key", key, keyLen), mustReadString(mod.Memory(), "value", value, valueLen))
}

// mustReadString is a convenience function that casts mustRead
func mustReadString(mem wazeroapi.Memory, fieldName string, offset, byteCount uint32) string {
	if byteCount == 0 {
		return ""
	}
	return string(mustRead(mem, fieldName, offset, byteCount))
}

var emptyBody = make([]byte, 0)

// mustRead is like api.Memory except that it panics if the offset and byteCount are out of range.
func mustRead(mem wazeroapi.Memory, fieldName string, offset, byteCount uint32) []byte {
	if byteCount == 0 {
		return emptyBody
	}
	buf, ok := mem.Read(offset, byteCount)
	if !ok {
		panic(fmt.Errorf("out of memory reading %s", fieldName))
	}
	return buf
}
