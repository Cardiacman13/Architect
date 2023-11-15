source src/cmd.sh

function check_internet() {
    tool='curl'
    tool_opts='-s --connect-timeout 8'

    if ! $tool $tool_opts https://archlinux.org/ >/dev/null 2>&1; then
        echo -e "${RED}Error: No Internet connection${RESET}"
        return 1
    fi

    return 0
}
