# AGENTS.md - ZJ Project Guidelines

## Build/Test Commands
- `make test` - Run all unit tests (requires bats-core)
- `make shellcheck` - Run shellcheck on all scripts
- `./tests/run_tests.sh` - Run test suite directly
- `bats tests/test_zj.bats` - Run single test file for zj script
- `bats tests/test_zj_clear.bats` - Run single test file for zj_clear script
- `bats tests/test_zj_tab_rename.bats` - Run single test file for zj_tab_rename script
- `make install` - Install scripts to ~/.local/bin
- `make setup-hooks` - Install git hooks (pre-push runs tests + shellcheck)
- `make clean` - Remove test artifacts

## Project Structure
This is a Bash script collection for Zellij session management. Main scripts are in `bin/`:
- `bin/zj` - Main session launcher
- `bin/zj_clear` - Session cleanup utility
- `bin/zj_tab_rename` - Tab renaming utility

## Code Style Guidelines
- Use `#!/usr/bin/env bash` shebang
- Set `set -e` for error handling in test scripts
- Use double quotes for variable expansion: `"$variable"`
- Use `[[ ]]` for conditionals instead of `[ ]`
- Function names use snake_case
- Variables use camelCase for local vars, UPPER_CASE for env vars
- Prefer `command -v` over `which` for command existence checks
- Use heredoc for multi-line help text: `read -r -d '' HELP_TEXT <<EOF`
- Always validate required arguments and provide helpful error messages