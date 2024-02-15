//go:generate tinygo build -o ../hello.wasm -scheduler=none --no-debug -target=wasi ./main.go

package main

import (
	"github.com/http-wasm/http-wasm-guest-tinygo/handler"
	"github.com/http-wasm/http-wasm-guest-tinygo/handler/api"
	tracinghandler "github.com/jcchavezs/http-wasm-tracing/guest/handler"
	tracingapi "github.com/jcchavezs/http-wasm-tracing/guest/handler/api"
)

func main() {
	handler.HandleRequestFn = handleRequest
	tracinghandler.AccessSpanContextFn = accessSpanContext
}

// handleRequest implements a simple HTTP router.
func handleRequest(req api.Request, resp api.Response) (next bool, reqCtx uint32) {
	resp.Headers().Set("Content-Type", "text/plain")
	resp.Body().WriteString("hello")
	return // skip the next handler, as we wrote a response.
}

func accessSpanContext(span tracingapi.Span) {
	span.SetAttribute("hello", "world")
}
