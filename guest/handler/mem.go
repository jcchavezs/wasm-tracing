package handler

import "unsafe"

var (
	// readBuf is sharable because there is no parallelism in wasm.
	readBuf = make([]byte, readBufLimit)
	// readBufPtr is used to avoid duplicate host function calls.
	readBufPtr = uintptr(unsafe.Pointer(&readBuf[0]))
	// readBufLimit is constant memory overhead for reading fields.
	readBufLimit = uint32(2048)
)

// stringToPtr returns a pointer and size pair for the given string in a way
// compatible with WebAssembly numeric types.
func stringToPtr(s string) (uintptr, uint32) {
	if s == "" {
		return readBufPtr, 0
	}
	buf := []byte(s)
	ptr := &buf[0]
	unsafePtr := uintptr(unsafe.Pointer(ptr))
	return unsafePtr, uint32(len(buf))
}
