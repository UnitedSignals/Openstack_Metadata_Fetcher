# Define Go application names and targets
APP_NAME = meta
BUILD_TARGET = main.go
BUILD_DIR = bin

# Docker settings
DOCKER_IMAGE = golang:1.18
CONTAINER_NAME = go-build-container
WORK_DIR = /app

# HELP
# This will output the help for each task
.PHONY: help
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# GO TASKS

build: ## Build the Go application
	@echo "Building Go application in Docker..."
	docker run --rm -v $(shell pwd):$(WORK_DIR) -w $(WORK_DIR) $(DOCKER_IMAGE) \
		go build -o $(BUILD_DIR)/$(APP_NAME) $(BUILD_TARGET)
	@echo "Build completed."

run: build ## Run the Go application
	@echo "Running Go application in Docker..."
	docker run --rm -v $(shell pwd):$(WORK_DIR) -w $(WORK_DIR) $(DOCKER_IMAGE) \
		./$(BUILD_DIR)/$(APP_NAME)

test: ## Run tests
	@echo "Running tests in Docker..."
	docker run --rm -v $(shell pwd):$(WORK_DIR) -w $(WORK_DIR) $(DOCKER_IMAGE) \
		go test ./...
	@echo "Tests completed."

clean: ## Clean the build directory
	@echo "Cleaning build directory..."
	rm -rf $(BUILD_DIR)
	@echo "Clean completed."

release_build: ## Create a release build for different platforms
	@echo "Creating release builds..."
	docker run --rm -v $(shell pwd):$(WORK_DIR) -w $(WORK_DIR) $(DOCKER_IMAGE) \
		go build -o $(BUILD_DIR)/$(APP_NAME)_linux -v $(BUILD_TARGET)
	docker run --rm -v $(shell pwd):$(WORK_DIR) -w $(WORK_DIR) $(DOCKER_IMAGE) \
		env GOOS=darwin GOARCH=amd64 go build -o $(BUILD_DIR)/$(APP_NAME)_darwin -v $(BUILD_TARGET)
	docker run --rm -v $(shell pwd):$(WORK_DIR) -w $(WORK_DIR) $(DOCKER_IMAGE) \
		env GOOS=windows GOARCH=amd64 go build -o $(BUILD_DIR)/$(APP_NAME).exe -v $(BUILD_TARGET)
	@echo "Release builds completed."
