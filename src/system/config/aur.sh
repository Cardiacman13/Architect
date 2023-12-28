source src/cmd.sh

function install_aur() {
    
    exec_log "sudo pacman -S --noconfirm --needed git" "$(eval_gettext "Installing git")"
    
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
        read -rp "$(eval_gettext "which aur helper do you want to install ? (yay/paru) : ")" choice
        choice="${choice,,}"
    done
    eval_gettext "\${GREEN}You chose \${choice}\${RESET}"; echo

    if [[ $choice == "yay" ]]; then
        id=0
        export AUR="yay"
    elif [[ $choice == "paru" ]]; then
        id=1
        export AUR="paru"
    fi

    if ! pacman -Qi "${AUR}" &>/dev/null; then
        DIR=${aur_name[$id]}
        exec_log "git clone ${git_url[$id]}" "$(eval_gettext "Cloning \$DIR")"
        cd "$DIR" || return 1
        exec_log "makepkg -si --noconfirm" "$(eval_gettext "Installing \${AUR}")"
        cd .. || return 1
        exec_log "rm -rf $DIR" "$(eval_gettext "Deleting directory \$DIR")"
    fi

    if [[ $choice == "yay" ]]; then
        exec "yay -Y --gendb" "$(eval_gettext "Configuring ${AUR}")"
        exec "yay -Y --devel --save" "$(eval_gettext "Configuring \${AUR}")"
        exec_log "sed -i 's/\"sudoloop\": false,/\"sudoloop\": true,/' ~/.config/yay/config.json" "$(eval_gettext "Enabling SudoLoop option for yay")"
    elif [[ $choice == "paru" ]]; then
        exec "paru --gendb" "$(eval_gettext "Configuring \${AUR}")"
        exec_log "sudo sed -i 's/#BottomUp/BottomUp/' /etc/paru.conf" "$(eval_gettext "Enabling BottomUp option for paru")"
        exec_log "sudo sed -i 's/#SudoLoop/SudoLoop/' /etc/paru.conf" "$(eval_gettext "Enabling SudoLoop option for paru")"
        exec_log "sudo sed -i 's/#CombinedUpgrade/CombinedUpgrade/' /etc/paru.conf" "$(eval_gettext "Enabling CombinedUpgrade option for paru")"
        exec_log "sudo sed -i 's/#UpgradeMenu/UpgradeMenu/' /etc/paru.conf" "$(eval_gettext "Enabling UpgradeMenu option for paru")"
        exec_log "sudo sed -i 's/#NewsOnUpgrade/NewsOnUpgrade/' /etc/paru.conf" "$(eval_gettext "Enabling NewsOnUpgrade option for paru")"
        exec_log "sudo sh -c 'echo "SkipReview" >> /etc/paru.conf'" "$(eval_gettext "Enabling SkipReview option for paru")"
    fi
}
