#!/usr/bin/env sh
## Strict mode
set -eu
IFS="$(printf "\n\t")"
readonly IFS
## Prologue
template_script_path="$(
    script_directory="$(dirname -- "${0}")"
    cd -- "${script_directory}" >/dev/null 2>&1
    pwd -P
)"
# shellcheck disable=SC2034
readonly template_script_path
## Help
template_print_help() {
    printf 'POSIX shell template script\n\nUsage:\n    %-40s\n' \
        'template.sh [-h, --help]'
}
## CLI
if [ 1 -lt "${#}" ]; then
    template_print_help
    exit 1
fi
if [ 1 -eq "${#}" ]; then
    case "${1}" in
        -h | --help)
            template_print_help
            exit 0
            ;;
        *)
            template_print_help
            exit 1
            ;;
    esac
fi
## Commands
# template_function
template_function() {
    (
        if [ 0 -ne "${#}" ]; then
            template_print_help
            exit 1
        fi

        printf 'Hello, World!\n'
    )
}
template_function "${@}"
exit 0
