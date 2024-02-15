//go:build !tinygo.wasm

package imports

// setSpanAttribute is stubbed for compilation outside TinyGo.
func setSpanAttribute(keyPtr uintptr, keyLen uint32, valuePtr uintptr, valueLen uint32) {}
