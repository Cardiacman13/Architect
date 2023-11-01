function log_msg() {
    local -r comment="$1"

    printf "$s" "${comment}"
    echo "[$(date "+%Y-%m-%d %H:%M:%S")] ${comment}" >>"${LOG_FILE}"
}

function execute_command() {
    local -r command=("$@")

    if [[ ${VERBOSE} == true ]]; then
        "${command[@]}" 2>&1 | tee -a "${LOG_FILE}" &
    else
        "${command[@]}" >>"${LOG_FILE}" 2>&1 &
    fi
}

function spinner() {
    local -r pid=$1
    local -r package_name=$2
    local -r delay=0.1
    local -r spinners=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
    local i=0

    while kill -0 "$pid" 2>/dev/null; do
        printf "\r${BLUE}::${RESET} [%s] 📦 installing %s" "${spinners[$i]}" "$package_name"
        i=$(((i + 1) % ${#spinners[@]}))
        sleep "$delay"
    done

    printf "\r\033[K"
}

function exec_log() {
    log_msg "$2"
    execute_command "$1"
}

function install_sp() {
    local -r package_name=$1
    local -r flatpak=$2

    log_msg "${BLUE}::${RESET} [+] installing ${package_name}"
    if [[ $flatpak == true ]]; then
        execute_command flatpak install -y flathub "$package_name"
    else
        execute_command "$AUR" -S --noconfirm --needed "$package_name"
    fi

    spinner "$!" "$package_name"
    wait "$!"

    return $?
}

function install_lst() {
    local -a lst_split=($1)
    local -r type=$2

    for package in "${lst_split[@]}"; do
        install_sp "$package" [[ $type == "flatpak" ]]
        local exit_status=$?
        printf "\r\033[K"
        if ((exit_status == 0)); then
            printf "${BLUE}::${RESET} [${GREEN}✔${RESET}] 📦 %s\n" "$package"
        else
            printf "${BLUE}::${RESET} [${RED}✘${RESET}] 📦 %s\n" "$package"
        fi
    done
}

function uninstall_lst() {
    local -a lst_split=($1)
    local -r message=$2

    log_msg "${message}"
    for package in ${lst_split[@]}; do
        exec_log "sudo pacman -Rdd --noconfirm ${package}" "${YELLOW}::${RESET} [-] ${package}"
    done
}
