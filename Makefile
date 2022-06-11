.DEFAULT_GOAL := help

.PHONY: help
help: ## display command overview
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[35m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: cs
cs: ## enforce code style
	yamllint -c .yamllint.yml --strict .
