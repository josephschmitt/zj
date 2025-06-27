.PHONY: test install clean help shellcheck setup-hooks

# Default target
help:
	@echo "ZJ - Zellij Quality of Life Scripts"
	@echo "=================================="
	@echo ""
	@echo "Available targets:"
	@echo "  test        - Run unit tests (requires bats-core)"
	@echo "  shellcheck  - Run shellcheck on all scripts"
	@echo "  install     - Install scripts to ~/.local/bin"
	@echo "  setup-hooks - Install git hooks"
	@echo "  clean       - Remove test artifacts"
	@echo "  help        - Show this help message"

# Run unit tests
test:
	@./tests/run_tests.sh

# Run shellcheck on all scripts
shellcheck:
	@echo "Running shellcheck on all scripts..."
	@if ! command -v shellcheck >/dev/null 2>&1; then \
		echo "Error: shellcheck is not installed."; \
		echo "Please install it with:"; \
		echo "  # On macOS with Homebrew:"; \
		echo "  brew install shellcheck"; \
		echo "  # On Ubuntu/Debian:"; \
		echo "  sudo apt-get install shellcheck"; \
		exit 1; \
	fi
	@shellcheck bin/zj bin/zj_clear bin/zj_tab_rename tests/run_tests.sh
	@echo "Shellcheck passed!"

# Install scripts to user's local bin directory
install:
	@echo "Installing ZJ scripts to ~/.local/bin..."
	@mkdir -p ~/.local/bin
	@cp bin/zj ~/.local/bin/
	@cp bin/zj_clear ~/.local/bin/
	@cp bin/zj_tab_rename ~/.local/bin/
	@chmod +x ~/.local/bin/zj ~/.local/bin/zj_clear ~/.local/bin/zj_tab_rename
	@echo "Installation complete!"
	@echo "Make sure ~/.local/bin is in your PATH"

# Install git hooks
setup-hooks:
	@echo "Installing git hooks..."
	@mkdir -p .git/hooks
	@cp .githooks/pre-push .git/hooks/
	@chmod +x .git/hooks/pre-push
	@echo "Git hooks installed!"

# Clean up test artifacts
clean:
	@echo "Cleaning up test artifacts..."
	@find . -name "*.tmp" -delete 2>/dev/null || true
	@echo "Clean complete!"