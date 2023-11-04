function log() {
    local -r comment="$1"

    echo "[$(date "+%Y-%m-%d %H:%M:%S")] ${comment}" >>"${LOG_FILE}"
}

function log_msg() {
    local -r comment="$1"

    echo "${comment}"
    log "${comment}"
}

function exec() {
    local -r command="$1"

    if [[ ${VERBOSE} == true ]]; then
        eval "${command}" 2>&1 | tee -a "${LOG_FILE}"
    else
        eval "${command}" >>"${LOG_FILE}" 2>&1
    fi
}

function exec_log() {
    if [[ $# -ne 2 ]]; then
        echo -e "${RED}Usage: exec_log <command> <message>${RESET}"
        exit 1
    fi

    local -r command="$1"
    local -r comment="$2"

    log_msg "${comment}"
    exec "${command}"
}

function install_one() {
    local -r warning="
        cuda
        mkinitcpio-firmware
        nvidia-dkms
    "
    local -r package=$1
    local -r type=$2

    local warning_msg=""
    if [[ ${warning} =~ ${package} ]]; then
        warning_msg=" ${RED}might be long${RESET}"
    fi

    log_msg "${BLUE}::${RESET} [+] ${package}${warning_msg}"
    if [[ ${type} == "flatpak" ]]; then
        exec "flatpak install -y flathub ${package}"
    else
        exec "${AUR} -S --noconfirm --needed ${package}"
    fi

    local exit_status=$?

    echo "[INFO]: Exit status: ${exit_status}" >>"${LOG_FILE}"
    if [[ ${exit_status} -ne 0 ]]; then
        echo -e "${RED}Error: ${package} installation failed${RESET}"
    fi
}

function uninstall_one() {
    local -r package=$1

    log_msg "${YELLOW}::${RESET} [-] ${package}"
    exec "sudo pacman -Rdd --noconfirm ${package}"
}

function install_lst() {
    local -r lst=$1
    local -r type=$2
    local -r lst_split=(${lst// / })

    echo -e "${BLUE}::---- Installation of packages ----::${RESET}"
    for package in ${lst_split[@]}; do
        install_one "${package}" "${type}"
    done
}

function uninstall_lst() {
    local -r lst=$1
    local -r lst_split=(${lst// / })

    log_msg "$2"
    echo -e "${BLUE}::--- Uninstallation of packages ---::${RESET}"
    for package in ${lst_split[@]}; do
        uninstall_one "${package}"
    done
}

function copy_bak() {
    local -r file=$1
    local -r dest=$2
    local sudo_str=""

    if [[ $3 == true ]]; then
        sudo_str="sudo "
    fi
    if [[ -f "${dest}/${file}" ]]; then
        exec_log "${sudo_str}cp -f ${dest}/${file} ${dest}/${file}.bak" "Backup of ${file}"
    fi
    exec_log "${sudo_str}cp -f ${file} ${dest}" "Copy ${file} to ${dest}"
}