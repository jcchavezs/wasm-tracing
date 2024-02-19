# wasm-tracing

Adds tracing enrichment capabilities to wasm projects.

## Getting started

In order to load the wasm-tracing ABI we need to load its host and compile it with its guest:

In the host side we set the extractor globally first and then we wrap the runtime with the
tracing runtime.

```go
import (
    tracing "github.com/jcchavezs/wasm-tracing"
)

// we set the extractor globally
tracing.SetExtractor(myExtractor)

r, err := handler.DefaultRuntime(context.Background())

err = tracing.LoadModuleIntoRuntime(context.Background(), r)

mw, err := wasm.NewMiddleware(
  context.Background(),
  guestWasm,
  // we wrap the runtime creator with the tracing one
  handler.Runtime(func(ctx context.Context) (wazero.Runtime, error) {
  return r, nil
 }),
)
```

In the guest side we consume the tracing handler method:

```go
import (
    tracinghandler "github.com/jcchavezs/wasm-tracing/guest/tinygo/handler"
)

// handleRequest implements a simple HTTP router.
func handleRequest(req api.Request, resp api.Response) (next bool, reqCtx uint32) {
 tracinghandler.SetSpanStringAttribute("my_key", "my_value")
 // ...
}
```

## TODO

Although this library only support string attributes for span we might open this for other types.
