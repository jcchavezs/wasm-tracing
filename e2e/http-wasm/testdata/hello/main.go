//go:generate tinygo build -o ../hello.wasm -scheduler=none --no-debug -target=wasi ./main.go
//go:generate wasm2wat ../hello.wasm -o ../hello.wat

package main

import (
	"github.com/http-wasm/http-wasm-guest-tinygo/handler"
	"github.com/http-wasm/http-wasm-guest-tinygo/handler/api"
	tracinghandler "github.com/jcchavezs/wasm-tracing/guest/tinygo/handler"
)

func main() {
	handler.HandleRequestFn = handleRequest
}

// handleRequest implements a simple HTTP router.
func handleRequest(req api.Request, resp api.Response) (next bool, reqCtx uint32) {
	tracinghandler.SetSpanStringAttribute("greeting_id", "1")
	resp.Body().WriteString("hello")
	return // skip the next handler, as we wrote a response.
}
