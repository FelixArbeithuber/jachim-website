SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.ONESHELL:

.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

# Print all rules with a comment containing ' ## '.
# I have no clue how this works. It's from https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## show list of rules
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

update: ## move all files to the correct fileserver folder
	@sudo rm -r /var/www/html/opa/*
	@sudo cp -r ./ /var/www/html/opa/
	@sudo rm /var/www/html/opa/Makefile
	@sudo rm /var/www/html/opa/README.md

.PHONY: update
