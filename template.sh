#!/usr/bin/env sh
set -eu
IFS="$(printf '\n')"
template_script_dir="$(cd -- "$(dirname -- "${0}")" && pwd -P)"
## CLI
template_help() {
	printf 'POSIX shell script template\n\nUsage:\n\t%s' \
		'template.sh'
}
if [ 1 -eq "${#}" ] && [ "-h" = "${1}" ]; then
	template_help
	exit 0
fi
if ! [ 0 -eq "${#}" ]; then
	template_help
	exit 1
fi
## Process
echo 'Hello, World!'
exit 0
