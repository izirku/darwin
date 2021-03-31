.DEFAULT_GOAL := test
.PHONY: tidy update reset lint test

# ==============================================================================
# manage dependencies

tidy: 
	go mod tidy

update:
	go get -u -t -d -v ./...

reset:
	git checkout -- go.mod
	go mod tidy

# ==============================================================================
# checks and balances

lint:
	staticcheck ./...
	golangci-lint run

test:
	go test -v ./... -count=1
