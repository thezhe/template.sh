#!/usr/bin/env sh
# shellcheck disable=SC2251 # '&& exit 1' inverts errexit, but '!' also inverts exit codes
## Strict mode
set -eu
IFS="$(printf "\n\t")"
readonly IFS
## Prologue
test_script_path="$(
    script_directory="$(dirname -- "${0}")"
    cd -- "${script_directory}" >/dev/null 2>&1
    pwd -P
)"
test_template_sh="${test_script_path}/template.sh"
readonly test_template_sh test_script_path
## Pass-fail tests
(
    set -x
    # Help
    "${test_template_sh}" -h
    "${test_template_sh}" --help
    "${test_template_sh}"
    ! "${test_template_sh}" --test
    ! "${test_template_sh}" -h test
) >/dev/null
