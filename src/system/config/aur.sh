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
        read -rp "which aur helper do you want to install ? (yay/paru) : " choice
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

    exec_log "git clone ${git_url[$id]}" "Cloning ${aur_name[$id]}"
    cd "${aur_name[$id]}" || return 1
    exec_log "makepkg -si --noconfirm" "Installing ${AUR}"
    cd .. || return 1
    exec_log "rm -rf ${aur_name[$id]}" "Deleting directory ${aur_name[$id]}"

    if [[ $choice == "yay" ]]; then
        exec "yay -Y --gendb" "Configuring ${AUR}"
        exec "yay -Y --devel --save" "Configuring ${AUR}"
        exec_log "sed -i 's/"sudoloop": false,/"sudoloop": true,/' ~/.config/yay/config.json" "Enabling SudoLoop option for yay"
    elif [[ $choice == "paru" ]]; then
        exec "paru --gendb" "Configuring ${AUR}"
        exec_log "sudo sed -i 's/#BottomUp/BottomUp/' /etc/paru.conf" "Enabling BottomUp option for paru"
        exec_log "sudo sed -i 's/#SudoLoop/SudoLoop/' /etc/paru.conf" "Enabling SudoLoop option for paru"
        exec_log "sudo sed -i '$a SkipReview' /etc/paru.conf" "Enabling SkipReview option for paru"
    fi
}
