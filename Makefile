.DEFAULT_GOAL := help

.PHONY: help
help: ## display command overview
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[35m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: cs
cs: ## enforce code style
	yamllint -c .yamllint.yml --strict .

.PHONY: clean
clean: ## cleanup mounted files
	rm -rf data

.PHONY: start
start: ## start docker environment
	docker compose up -d

.PHONY: stop
stop: ## stop docker environment
	docker compose down

.PHONY: restart
restart: stop start ## restart docker environment

.PHONY: build
build: stop clean ## rebuild and start docker environment
	docker compose up -d --build

