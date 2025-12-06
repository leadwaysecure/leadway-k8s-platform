.PHONY: help validate test

help:
	@echo "Leadway K8s Platform"
	@echo "  make validate - Validate Terraform"
	@echo "  make test     - Run tests"

validate:
	terraform fmt -check -recursive terraform/
	
test:
	@echo "Running tests..."
