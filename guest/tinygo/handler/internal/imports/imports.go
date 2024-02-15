//go:build tinygo.wasm

package imports

//go:wasm-module http_handler
//go:export set_span_attribute
func setSpanAttribute(keyPtr uintptr, keyLen uint32, valuePtr uintptr, valueLen uint32)
