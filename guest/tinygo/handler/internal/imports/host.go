package imports

func SetSpanAttribute(keyPtr uintptr, keyLen uint32, valuePtr uintptr, valueLen uint32) {
	setSpanAttribute(keyPtr, keyLen, valuePtr, valueLen)
}
