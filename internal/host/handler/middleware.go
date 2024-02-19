package handler

import (
	"context"
	"fmt"

	apihandler "github.com/jcchavezs/wasm-tracing/internal/host/api/handler"
	"github.com/tetratelabs/wazero"
	wazeroapi "github.com/tetratelabs/wazero/api"
)

type module struct {
	host apihandler.Host
}

const i32 = wazeroapi.ValueTypeI32

func Module(r wazero.Runtime) (wazero.CompiledModule, error) {
	m := &module{host: host{}}

	return r.NewHostModuleBuilder(apihandler.ModuleName).
		NewFunctionBuilder().
		WithGoModuleFunction(wazeroapi.GoModuleFunc(m.setSpanStringAttribute), []wazeroapi.ValueType{i32, i32, i32, i32}, []wazeroapi.ValueType{}).
		WithParameterNames("key", "key_len", "value", "value_len").
		Export(apihandler.FuncSetSpanStringAttribute).
		Compile(context.Background())
}

func (m *module) setSpanStringAttribute(ctx context.Context, mod wazeroapi.Module, params []uint64) {
	key := uint32(params[0])
	keyLen := uint32(params[1])
	value := uint32(params[2])
	valueLen := uint32(params[3])

	if keyLen == 0 {
		panic("span attribute key cannot be empty")
	}
	m.host.SetSpanStringAttribute(ctx, mustReadString(mod.Memory(), "key", key, keyLen), mustReadString(mod.Memory(), "value", value, valueLen))
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
