function log_msg() {
    if [[ $# -ne 1 ]]; then
        echo -e "${RED}Usage: log_msg <message>${RESET}"
        exit 1
    fi

    local -r comment="$1"

    echo "${comment}"
    echo "[$(date "+%Y-%m-%d %H:%M:%S")] ${comment}" >>"${LOG_FILE}"
}

function exec_log() {
    if [[ $# -ne 2 ]]; then
        echo -e "${RED}Usage: exec_log <command> <message>${RESET}"
        exit 1
    fi

    local -r command="$1"
    local -r comment="$2"

    log_msg "${comment}"
    echo "${command}" >>"${LOG_FILE}"

    if [[ ${VERBOSE} == true ]]; then
        eval "${command}" 2>&1 | tee -a "${LOG_FILE}"
    else
        eval "${command}" >>"${LOG_FILE}" 2>&1
    fi
}

function install_lst() {
    local -r warning="
        cuda
    "
    local -r lst=$1
    local -r lst_split=(${lst// / })

    for package in ${lst_split[@]}; do
        if [[ ${warning} =~ (^|[[:space:]])${package}($|[[:space:]]) ]]; then
            log_msg "${RED}::${RESET} [!] ${package} ${RED}it will take a long time${RESET}"
        fi
        exec_log "${AUR} -S --noconfirm --needed ${package}" "${BLUE}::${RESET} [+] ${package}"
    done
}

function uninstall_lst() {
    local -r lst=$1
    local -r lst_split=(${lst// / })

    log_msg "$2"
    for package in ${lst_split[@]}; do
        exec_log "sudo pacman -Rdd --noconfirm ${package}" "${YELLOW}::${RESET} [-] ${package}"
    done
}
