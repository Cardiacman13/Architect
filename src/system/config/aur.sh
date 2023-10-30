source src/cmd.sh

export AUR="yay"

function install_aur() {
    local -r git_url=(
        "https://aur.archlinux.org/yay-bin.git"
        "https://aur.archlinux.org/paru-bin.git"
    )
    local -r aur_name=(
        "yay-bin"
        "paru-bin"
    )
    local id=-1
    local choice=""

    while [[ $choice != "yay" && $choice != "paru" ]]; do
        read -rp "What aur helper do you want to install ? (yay/paru) : " choice
        choice="${choice,,}"
    done

    if [[ $choice == "yay" ]]; then
        id=0
    elif [[ $choice == "paru" ]]; then
        id=1
    fi

    exec_log "git clone ${git_url[$id]}" "Cloning of ${aur_name[$id]}"
    cd "${aur_name[$id]}" || return 1
    exec_log "makepkg -si --noconfirm" "Installation of ${aur_name[$id]}"
    cd .. || return 1
    exec_log "rm -rf ${aur_name[$id]}" "Removing ${aur_name[$id]}"
}
