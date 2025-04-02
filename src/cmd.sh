# Utility logging and command execution functions for the Architect installer

# Append a timestamped log entry to the logfile
function log() {
    local -r comment="$1"

    echo "[$(date "+%Y-%m-%d %H:%M:%S")] ${comment}" >>"${LOG_FILE}"
    # Clean escape characters, color codes, unicode, etc.
    sed -i -E "s/\x1B\[[0-9;]*[JKmsu]|\x1B\(B|\\u[0-9]{0,4}|\\n//g" ${LOG_FILE}
}

# Echo the message and write it to the log file
function log_msg() {
    local -r comment="$1"

    echo "${comment}"
    log "${comment}"
}

# Execute a shell command (with optional verbose and log mode)
function exec() {
    local -r command="$1"

    if [[ ${VERBOSE} == true ]]; then
        # Display output and log
        eval "${command}" 2>&1 | tee -a "${LOG_FILE}"
    else
        # Run in background and show spinner dots
        eval "${command}" >>"${LOG_FILE}" 2>&1 &
        job_pid=$!
        progress_dots
        wait -n
        exit_status "${comment}"
    fi
}

# Execute a command with a user-visible comment
function exec_log() {
    local -r command="$1"
    local -r comment="$2"

    log_msg "${comment}"
    exec "${command}"
}

# Install a single package via AUR helper
function install_one() {
    local -r warning="
        cuda
        nvidia-dkms
    "
    local -r package=$1
    local -r type=$2

    # Skip install if already installed
    if pacman -Qi ${package} &> /dev/null; then
        log_msg "$(eval_gettext "\${GREEN}[I]\${RESET} Package \${package} is already installed.")"
        return
    fi

    # Mark packages that may take longer to compile
    local warning_msg=""
    if [[ ${warning} =~ ${package} ]]; then
        warning_msg="$(eval_gettext " \${RED}(might be long)\${RESET}")"
    fi

    # Install via configured AUR helper
    exec_log "${AUR} -S --noconfirm --needed ${package}" "${GREEN}[+] ${RESET}${package}${warning_msg}"
}

# Uninstall a package if it is present
function uninstall_one() {
    local -r package=$1
    if pacman -Q ${package} &> /dev/null; then
        exec_log "sudo pacman -Rdd --noconfirm ${package}" "${RED}[-]${RESET} ${package}"
    else
        log_msg "$(eval_gettext "\${GREEN}[U]\${RESET} Package \${package} is not installed.")"
    fi
}

# Install a space-separated list of packages
function install_lst() {
    local -r lst=$1
    local -r type=$2
    local -r lst_split=(${lst// / })

    for package in ${lst_split[@]}; do
        install_one "${package}" "${type}"
    done
}

# Uninstall a space-separated list of packages
function uninstall_lst() {
    local -r lst=$1
    local -r lst_split=(${lst// / })

    for package in ${lst_split[@]}; do
        uninstall_one "${package}"
    done
}

# Ask a yes/no question, return 0 for yes, 1 for no
function ask_question() {
    yes="$(eval_gettext "y")"
    no="$(eval_gettext "n")"
    read -rp "$1 ($yes/${no^^}) : " choice

    if [ "${choice,,}" == "$yes" ]; then
        return 0
    else
        return 1
    fi
}

# Show animated progress dots while waiting on background command
function progress_dots() {
    local dots="....."

    while kill -0 $job_pid 2> /dev/null; do
        printf "%b [     ]%b\n" "\033[1A${comment}" "\033[6D${BOLD}${GREEN}${dots}${RESET}"
        sleep 0.5
        dots+="."
        if [[ ${dots} == "......" ]]; then
            dots=""
        fi
    done
}

# Display exit status of the last command with a visual checkmark or cross
function exit_status() {
    local exit_status=$?
    local -r comment="$1"

    echo "[INFO]: Exit status: ${exit_status}" >>"${LOG_FILE}"
    if [[ ${exit_status} -ne 0 ]]; then
        printf "%b\n" "\033[1A\033[2K${comment} ${RED}\u2718${RESET}"
        log_msg "$(eval_gettext "\${RED}Error: installation failed\${RESET}")"
    else
        printf "%b\n" "\033[1A\033[2K${comment} ${GREEN}\u2714${RESET}"
    fi
}
