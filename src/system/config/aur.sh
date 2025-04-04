# Load shared utility functions
source src/cmd.sh

function install_aur() {
    # Ensure Git is installed (required to clone AUR helper repositories)
    exec_log "sudo pacman -S --noconfirm --needed git" "$(eval_gettext "Installing git")"

    # Define AUR helpers and their respective Git URLs
    local -r aur_helpers=("yay" "paru")
    local -r aur_repos=("https://aur.archlinux.org/yay-bin.git" "https://aur.archlinux.org/paru-bin.git")
    local -r aur_dirs=("yay-bin" "paru-bin")

    local choice=""
    local index=-1

    # Prompt user to choose an AUR helper
    while [[ $choice != "yay" && $choice != "paru" ]]; do
        read -rp "$(eval_gettext "Which AUR helper do you want to install? (yay/paru): ")" choice
        choice="${choice,,}"  # Convert to lowercase
    done

    eval_gettext "\${GREEN}You chose \${choice}\${RESET}"; echo

    # Determine index and export AUR helper name
    case "$choice" in
        yay) index=0 ;;
        paru) index=1 ;;
    esac

    export AUR="${aur_helpers[$index]}"

    # Install the chosen AUR helper if not already installed
    if ! pacman -Qi "$AUR" &>/dev/null; then
        local dir="${aur_dirs[$index]}"
        exec_log "git clone ${aur_repos[$index]}" "$(eval_gettext "Cloning $dir")"

        # Temporarily allow pacman to run without password
        exec_log "echo \"$USER ALL=(ALL) NOPASSWD: /usr/bin/pacman\" | sudo tee /etc/sudoers.d/99-pacman-nopasswd >/dev/null" \
            "$(eval_gettext "Allowing pacman without password temporarily")"

        pushd "$dir" >/dev/null || return 1
        exec_log "makepkg -si --noconfirm" "$(eval_gettext "Installing $AUR")"
        popd >/dev/null || return 1

        # Clean up
        exec_log "sudo rm -f /etc/sudoers.d/99-pacman-nopasswd" "$(eval_gettext "Removing temporary sudoers rule")"
        exec_log "rm -rf $dir" "$(eval_gettext "Deleting directory $dir")"
    fi

    # Post-install configuration
    case "$AUR" in
        yay)
            exec_log "yay -Y --gendb" "$(eval_gettext "Configuring $AUR")"
            exec_log "yay -Y --devel --save" "$(eval_gettext "Configuring $AUR")"
            exec_log "sed -i 's/\"sudoloop\": false,/\"sudoloop\": true,/' ~/.config/yay/config.json" \
                "$(eval_gettext "Enabling SudoLoop option for yay")"
            ;;
        paru)
            exec_log "paru --gendb" "$(eval_gettext "Configuring $AUR")"
            local paru_conf="/etc/paru.conf"
            exec_log "sudo sed -i 's/#BottomUp/BottomUp/' $paru_conf" "$(eval_gettext "Enabling BottomUp option for paru")"
            exec_log "sudo sed -i 's/#SudoLoop/SudoLoop/' $paru_conf" "$(eval_gettext "Enabling SudoLoop option for paru")"
            exec_log "sudo sed -i 's/#CombinedUpgrade/CombinedUpgrade/' $paru_conf" "$(eval_gettext "Enabling CombinedUpgrade option for paru")"
            exec_log "sudo sed -i 's/#UpgradeMenu/UpgradeMenu/' $paru_conf" "$(eval_gettext "Enabling UpgradeMenu option for paru")"
            exec_log "sudo sed -i 's/#NewsOnUpgrade/NewsOnUpgrade/' $paru_conf" "$(eval_gettext "Enabling NewsOnUpgrade option for paru")"
            exec_log "sudo sh -c 'echo \"SkipReview\" >> $paru_conf'" "$(eval_gettext "Enabling SkipReview option for paru")"
            ;;
    esac
}
