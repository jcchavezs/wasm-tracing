# http-wasm-tracing

Adds tracing enrichment capabilities to `http-wasm`.

## Getting started

In order to load the http-wasm-tracing ABI we need to load its host and compile it with its
guest:

In the host side we set the extractor globally first and then we wrap the runtime with the
tracing runtime.

```go
import (
    tracing "github.com/jcchavezs/http-wasm-tracing"
)

// we set the extractor globally
tracing.SetExtractor(myExtractor)

mw, err := wasm.NewMiddleware(
  context.Background(),
  guestWasm,
  // we wrap the runtime creator with the tracing one
  handler.Runtime(tracing.WrapNewRuntime(handler.DefaultRuntime)),
)
```

In the guest side we consume the tracing handler method:

```go
import (
    tracinghandler "github.com/jcchavezs/http-wasm-tracing/guest/tinygo/handler"
)

// handleRequest implements a simple HTTP router.
func handleRequest(req api.Request, resp api.Response) (next bool, reqCtx uint32) {
 tracinghandler.SetSpanStringAttribute("my_key", "my_value")
 // ...
}
```

## Rationale

This approach is more sustainable when it comes to shape ABIs as it allows to load multiple ABIs along with http-wasm before this can become part of the standard.

## TODO

Although this library only support string attributes for span (which is the most )
