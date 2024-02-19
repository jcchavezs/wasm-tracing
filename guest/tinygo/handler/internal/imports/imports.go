//go:build tinygo.wasm

package imports

//go:wasm-module wasm_tracing
//go:export set_span_string_attribute
func setSpanStringAttribute(keyPtr uintptr, keyLen uint32, valuePtr uintptr, valueLen uint32)
