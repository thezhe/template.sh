#!/usr/bin/env sh
# shellcheck disable=SC2251 # '!' should invert and override exit codes
set -eu
IFS="$(printf '\n')"
test_script_dir="$(cd -- "$(dirname -- "${0}")" && pwd -P)"
test_template_sh="${test_script_dir}/template.sh"
## Test
(
	set -x
	# Script
	"${test_template_sh}"
	# Help
	"${test_template_sh}" -h
	! "${test_template_sh}" --test
	! "${test_template_sh}" -h test
) >/dev/null
