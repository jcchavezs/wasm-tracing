package handler

import (
	tracinghandler "github.com/jcchavezs/http-wasm-tracing/internal/host/api/handler"
	"github.com/tetratelabs/wazero"
	wazeroapi "github.com/tetratelabs/wazero/api"
)

type runtimeWrapper struct {
	wazero.Runtime
	mw *middleware
}

var _ wazero.Runtime = (*runtimeWrapper)(nil)

const i32 = wazeroapi.ValueTypeI32

func (w *runtimeWrapper) NewHostModuleBuilder(moduleName string) wazero.HostModuleBuilder {
	return w.Runtime.NewHostModuleBuilder(moduleName).
		NewFunctionBuilder().
		WithGoModuleFunction(wazeroapi.GoModuleFunc(w.mw.setSpanAttribute), []wazeroapi.ValueType{i32, i32, i32, i32, i32}, []wazeroapi.ValueType{}).
		WithParameterNames("key", "key_len", "value", "value_len").Export(tracinghandler.FuncSetSpanAttribute)
}

func WrapRuntime(r wazero.Runtime) wazero.Runtime {
	return &runtimeWrapper{
		Runtime: r,
		mw:      &middleware{host{}},
	}
}
