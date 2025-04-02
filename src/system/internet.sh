# Load shared helper functions
source src/cmd.sh

# Function to check if the system has an active internet connection
function check_internet() {
    local -r tool='curl'                     # Tool used to perform the connection check
    local -r tool_opts='-s --connect-timeout 8'  # Silent mode, with an 8-second timeout

    # Attempt to connect to archlinux.org; if it fails, show an error and return 1
    if ! ${tool} ${tool_opts} https://archlinux.org/ >/dev/null 2>&1; then
        eval_gettext "\${RED}Error: No Internet connection\${RESET}"; echo
        return 1
    fi

    # Connection succeeded
    return 0
}
