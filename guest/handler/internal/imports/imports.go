//go:build tinygo.wasm

package imports

//go:wasm-module http_handler
//go:export set_span_attribute
func setSpanAttribute(keyPtr uintptr, keySize uint32, valuePtr uintptr, valueLen uint32)
