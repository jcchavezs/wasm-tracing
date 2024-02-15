package imports

func SetSpanAttribute(keyPtr uintptr, keySize uint32, valuePtr uintptr, valueSize uint32) {
	setSpanAttribute(keyPtr, keySize, valuePtr, valueSize)
}
