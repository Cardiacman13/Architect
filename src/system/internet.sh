source src/cmd.sh

function check_internet() {
    local -r tool='curl'
    local -r tool_opts='-s --connect-timeout 8'

    if ! ${tool} ${tool_opts} https://archlinux.org/ >/dev/null 2>&1; then
        eval_gettext "\${RED}Error: No Internet connection\${RESET}"; echo
        return 1
    fi

    return 0
}