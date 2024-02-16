//go:build !tinygo.wasm

package imports

// setSpanStringAttribute is stubbed for compilation outside TinyGo.
func setSpanStringAttribute(keyPtr uintptr, keyLen uint32, valuePtr uintptr, valueLen uint32) {}
