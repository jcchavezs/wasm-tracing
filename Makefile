generate:
	@cd ./e2e/testdata/hello && \
		go get github.com/http-wasm/http-wasm-guest-tinygo/handler && \
		go get github.com/http-wasm/http-wasm-guest-tinygo/handler/api && \
		go generate ./... && \
		go mod tidy

.PHONY: e2e
e2e:
	@echo "IMPORTANT: make sure you have run \`make generate\` before running the e2e\n"
	go test -v ./e2e/...