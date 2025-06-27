#!/usr/bin/env bats

setup() {
    export PATH="$BATS_TEST_DIRNAME/../bin:$PATH"
}

@test "zj_clear shows help with -h flag" {
    run zj_clear -h
    [ "$status" -eq 0 ]
    [[ "$output" == *"Usage:"* ]]
    [[ "$output" == *"Options:"* ]]
    [[ "$output" == *"Description:"* ]]
}

@test "zj_clear shows help with --help flag" {
    run zj_clear --help
    [ "$status" -eq 0 ]
    [[ "$output" == *"Usage:"* ]]
}

@test "zj_clear fails with unknown option" {
    run zj_clear --unknown-option
    [ "$status" -eq 1 ]
    [[ "$output" == *"Unknown option: --unknown-option"* ]]
}