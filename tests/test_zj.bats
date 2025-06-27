#!/usr/bin/env bats

setup() {
    export PATH="$BATS_TEST_DIRNAME/../bin:$PATH"
}

@test "zj shows help with -h flag" {
    run zj -h
    [ "$status" -eq 0 ]
    [[ "$output" == *"Usage:"* ]]
    [[ "$output" == *"Options:"* ]]
}

@test "zj shows help with --help flag" {
    run zj --help
    [ "$status" -eq 0 ]
    [[ "$output" == *"Usage:"* ]]
}

@test "zj fails with unknown option" {
    run zj --unknown-option
    [ "$status" -eq 1 ]
    [[ "$output" == *"Unknown option: --unknown-option"* ]]
}

@test "zj fails when layout option has no value" {
    run zj --layout
    [ "$status" -eq 1 ]
    [[ "$output" == *"Error: --layout requires a non-empty value."* ]]
}

@test "zj fails when name option has no value" {
    run zj --name
    [ "$status" -eq 1 ]
    [[ "$output" == *"Error: --name requires a non-empty value."* ]]
}

@test "zj fails with invalid directory" {
    run zj /nonexistent/directory/path
    [ "$status" -eq 1 ]
    [[ "$output" == *"No such file or directory"* || "$output" == *"zoxide: no match found"* ]]
}