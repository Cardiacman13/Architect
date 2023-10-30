function exec_log() {
    if [[ $# -ne 2 ]]; then
        echo -e "${RED}Usage: exec_log <command> <message>${RESET}"
        exit 1
    fi

    local -r command="$1"
    local -r comment="$2"

    echo "${comment}"
    echo "[$(date "+%Y-%m-%d %H:%M:%S")] ${comment}" >>"${LOG_FILE}"
    echo "${command}" >>"${LOG_FILE}"

    if [[ ${VERBOSE} == true ]]; then
        eval "${command}" 2>&1 | tee -a "${LOG_FILE}"
    else
        eval "${command}" >>"${LOG_FILE}" 2>&1
    fi
}

function install_lst() {
    local -r lst=$1
    local -r lst_split=(${lst// / })

    for package in ${lst_split[@]}; do
        exec_log "${AUR} -S --noconfirm --needed ${package}" "installation of ${package}"
    done
}

function uninstall_lst() {
    local -r lst=$1
    local -r lst_split=(${lst// / })

    for package in ${lst_split[@]}; do
        exec_log "sudo pacman -Rdd --noconfirm ${package}" "uninstallation of ${package}"
    done
}
