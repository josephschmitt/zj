#!/usr/bin/env bash

# Test runner script for ZJ project
# Requires bats-core to be installed

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Running ZJ unit tests..."
echo "========================"

# Check if bats is available
if ! command -v bats >/dev/null 2>&1; then
    echo "Error: bats-core is not installed."
    echo "Please install it with:"
    echo "  # On macOS with Homebrew:"
    echo "  brew install bats-core"
    echo "  # On Ubuntu/Debian:"
    echo "  sudo apt-get install bats"
    echo "  # Or install from source:"
    echo "  git clone https://github.com/bats-core/bats-core.git"
    echo "  cd bats-core && sudo ./install.sh /usr/local"
    exit 1
fi

# Run all test files
echo "Running tests for zj script..."
bats "$SCRIPT_DIR/test_zj.bats"

echo ""
echo "Running tests for zj_clear script..."
bats "$SCRIPT_DIR/test_zj_clear.bats"

echo ""
echo "Running tests for zj_tab_rename script..."
bats "$SCRIPT_DIR/test_zj_tab_rename.bats"

echo ""
echo "All tests completed successfully!"