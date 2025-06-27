#!/usr/bin/env bats

setup() {
    export PATH="$BATS_TEST_DIRNAME/../bin:$PATH"
}

@test "zj_tab_rename does nothing when not in zellij session" {
    unset ZELLIJ
    run zj_tab_rename "/some/path"
    [ "$status" -eq 0 ]
    [[ "$output" == "" ]]
}

@test "zj_tab_rename handles empty path gracefully when not in zellij" {
    unset ZELLIJ
    run zj_tab_rename ""
    [ "$status" -eq 0 ]
    [[ "$output" == "" ]]
}