# ZJ Unit Tests

This directory contains unit tests for the ZJ project scripts using the [Bats](https://github.com/bats-core/bats-core) testing framework.

## Test Files

- `test_zj.bats` - Tests for the main `zj` script
- `test_zj_clear.bats` - Tests for the `zj_clear` script
- `test_zj_tab_rename.bats` - Tests for the `zj_tab_rename` script
- `run_tests.sh` - Test runner script

## Running Tests

### Prerequisites

Install bats-core:

```bash
# On macOS with Homebrew
brew install bats-core

# On Ubuntu/Debian
sudo apt-get install bats

# Or install from source
git clone https://github.com/bats-core/bats-core.git
cd bats-core && sudo ./install.sh /usr/local
```

### Run All Tests

```bash
# From project root
make test

# Or directly
./tests/run_tests.sh
```

### Run Individual Test Files

```bash
bats tests/test_zj.bats
bats tests/test_zj_clear.bats
bats tests/test_zj_tab_rename.bats
```

## Test Coverage

### zj script tests (6 tests):
- Help text display (`-h`, `--help`)
- Error handling for invalid options and missing values
- Invalid directory handling

### zj_clear script tests (3 tests):
- Help text display
- Error handling for unknown options

### zj_tab_rename script tests (2 tests):
- Graceful handling when not in zellij session
- Empty path handling

## Test Results

✅ **All 11 tests pass reliably** without requiring external dependencies or complex mocking.

## Test Strategy

The tests focus on core functionality that can be reliably tested without external dependencies:
- Command-line argument parsing
- Help text generation
- Error handling and validation
- Basic script behavior

This approach ensures tests are fast, reliable, and don't require zellij or zoxide installations.