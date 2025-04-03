source src/cmd.sh

function install_aur() {
    # Check if git is installed; if not, install it
    if ! command -v git &>/dev/null; then
        exec_log "sudo pacman -S --noconfirm --needed git" \
                 "$(eval_gettext "Installing git")"
    fi

    # Define AUR helper Git URLs and package names
    local -r git_url=(
        "https://aur.archlinux.org/yay-bin.git"
        "https://aur.archlinux.org/paru-bin.git"
    )
    local -r aur_name=(
        "yay-bin"
        "paru-bin"
    )

    # Prompt the user to choose which AUR helper to install
    local choice=""
    while [[ $choice != "yay" && $choice != "paru" ]]; do
        read -rp "$(eval_gettext "Which AUR helper do you want to install? (yay/paru): ")" choice
        choice="${choice,,}"  # Convert to lowercase
    done

    eval_gettext "\${GREEN}You chose \${choice}\${RESET}"
    echo

    # Set the index and global $AUR variable based on the choice
    local helper_index
    case "$choice" in
        yay)
            helper_index=0
            export AUR="yay"
            ;;
        paru)
            helper_index=1
            export AUR="paru"
            ;;
    esac

    # Install the chosen AUR helper if it is not already installed
    if ! pacman -Qi "${AUR}" &>/dev/null; then
        local dir="${aur_name[$helper_index]}"
        exec_log "git clone ${git_url[$helper_index]}" \
                 "$(eval_gettext "Cloning ${dir}")"
        cd "${dir}" || return 1
        exec_log "makepkg -si --noconfirm" \
                 "$(eval_gettext "Installing ${AUR}")"
        cd .. || return 1
        exec_log "rm -rf \"${dir}\"" \
                 "$(eval_gettext "Deleting directory ${dir}")"
    else
        eval_gettext "\${AUR} is already installed. Skipping build."
        echo
    fi

    # Post-installation configuration
    case "$AUR" in
        yay)
            exec_log "yay -Y --gendb" \
                     "$(eval_gettext "Configuring ${AUR}")"
            exec_log "yay -Y --devel --save" \
                     "$(eval_gettext "Configuring ${AUR}")"
            exec_log "sed -i 's/\"sudoloop\": false,/\"sudoloop\": true,/' ~/.config/yay/config.json" \
                     "$(eval_gettext "Enabling SudoLoop option for yay")"
            ;;
        paru)
            exec_log "paru --gendb" \
                     "$(eval_gettext "Configuring ${AUR}")"
            exec_log "sudo sed -i 's/#BottomUp/BottomUp/' /etc/paru.conf" \
                     "$(eval_gettext "Enabling BottomUp option for paru")"
            exec_log "sudo sed -i 's/#SudoLoop/SudoLoop/' /etc/paru.conf" \
                     "$(eval_gettext "Enabling SudoLoop option for paru")"
            exec_log "sudo sed -i 's/#CombinedUpgrade/CombinedUpgrade/' /etc/paru.conf" \
                     "$(eval_gettext "Enabling CombinedUpgrade option for paru")"
            exec_log "sudo sed -i 's/#UpgradeMenu/UpgradeMenu/' /etc/paru.conf" \
                     "$(eval_gettext "Enabling UpgradeMenu option for paru")"
            exec_log "sudo sed -i 's/#NewsOnUpgrade/NewsOnUpgrade/' /etc/paru.conf" \
                     "$(eval_gettext "Enabling NewsOnUpgrade option for paru")"
            exec_log "sudo sh -c 'echo SkipReview >> /etc/paru.conf'" \
                     "$(eval_gettext "Enabling SkipReview option for paru")"
            ;;
    esac
}
