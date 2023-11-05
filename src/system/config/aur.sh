source src/cmd.sh

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
    echo -e "${GREEN}You chose ${choice}${RESET}"

    if [[ $choice == "yay" ]]; then
        id=0
        export AUR="yay"
    elif [[ $choice == "paru" ]]; then
        id=1
        export AUR="paru"
    fi

    exec_log "git clone ${git_url[$id]}" "Cloning of ${aur_name[$id]}"
    cd "${aur_name[$id]}" || return 1
    exec_log "makepkg -si --noconfirm" "installing ${AUR}"
    cd .. || return 1
    exec_log "rm -rf ${aur_name[$id]}" "Directory deletion ${aur_name[$id]}"

    if [[ $choice == "yay" ]]; then
        exec "yay -Y --gendb" "configuration of ${AUR}"
        exec "yay -Y --devel --save" "configuration of ${AUR}"
    elif [[ $choice == "paru" ]]; then
        exec "paru --gendb" "configuration of ${AUR}"
    fi
}
