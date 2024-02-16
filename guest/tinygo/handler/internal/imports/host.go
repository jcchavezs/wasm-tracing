package imports

func SetSpanStringAttribute(keyPtr uintptr, keyLen uint32, valuePtr uintptr, valueLen uint32) {
	setSpanStringAttribute(keyPtr, keyLen, valuePtr, valueLen)
}
