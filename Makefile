.PHONY: test install clean help

# Default target
help:
	@echo "ZJ - Zellij Quality of Life Scripts"
	@echo "=================================="
	@echo ""
	@echo "Available targets:"
	@echo "  test     - Run unit tests (requires bats-core)"
	@echo "  install  - Install scripts to ~/.local/bin"
	@echo "  clean    - Remove test artifacts"
	@echo "  help     - Show this help message"

# Run unit tests
test:
	@./tests/run_tests.sh

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

# Clean up test artifacts
clean:
	@echo "Cleaning up test artifacts..."
	@find . -name "*.tmp" -delete 2>/dev/null || true
	@echo "Clean complete!"