# Load shared utility functions
source src/cmd.sh

# Function to configure the default shell and add useful aliases based on user preference
function shell_config() {
    # Define the paths to configuration files for each shell
    local -r config_file=(
        "${HOME}/.bashrc"
        "${HOME}/.zshrc"
        "${HOME}/.config/fish/config.fish"
    )

    # Define a list of helpful shell aliases
    local alias_list=(
        "alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'"
        "alias update-arch='${AUR}'"
        "alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'"
        "alias reinstall-all-pkg='sudo pacman -S \$(pacman -Qnq)'"
    )

    # Add a cleanup alias based on the selected AUR helper
    if [[ ${AUR} == yay ]]; then
        alias_list+=("alias clean-arch='yay -Sc && yay -Yc'")
    elif [[ ${AUR} == paru ]]; then
        alias_list+=("alias clean-arch='paru -Sc && paru -c'")
    fi

    # Always add aliases to .bashrc so they are accessible even if the user doesn't switch shell
    for alias_cmd in "${alias_list[@]}"; do
        if ! grep -q "${alias_cmd}" "${HOME}/.bashrc"; then
            echo "${alias_cmd}" >> "${HOME}/.bashrc"
        fi
    done

    # Ask the user to choose their default shell (bash, zsh, or fish)
    local index=0
    local choice=""

    while [[ $choice != "bash" && $choice != "zsh" && $choice != "fish" ]]; do
        read -rp "$(eval_gettext "What is your default shell ? (bash/zsh/fish) : ")" choice
        choice="${choice,,}"  # Convert to lowercase
    done

    eval_gettext "\${GREEN}You chose \${choice}\${RESET}"; echo

    # Configure shell environment and change default shell if needed
    case $choice in
        bash)
            touch "${HOME}/.bashrc"
            index=0
            ;;
        zsh)
            install_one "zsh"
            install_one "zsh-completions"

            local current_shell=$(getent passwd "$USER" | cut -d: -f7)
            while [[ "$current_shell" != "/usr/bin/zsh" ]]; do
                eval_gettext "Setting default shell to zsh..."; echo
                chsh -s "/usr/bin/zsh"
                current_shell=$(getent passwd "$USER" | cut -d: -f7)
            done

            if ask_question "$(eval_gettext "Do you want to install oh-my-zsh ? This will install the default oh-my-zsh's .zshrc configuration")"; then
                eval_gettext "You chose to install oh-my-zsh"; echo
                git clone https://github.com/ohmyzsh/ohmyzsh.git "${HOME}/.oh-my-zsh"
                cp "${HOME}/.oh-my-zsh/templates/zshrc.zsh-template" "${HOME}/.zshrc"
            fi

            index=1
            ;;
        fish)
            install_one "fish"

            local current_shell=$(getent passwd "$USER" | cut -d: -f7)
            while [[ "$current_shell" != "/usr/bin/fish" ]]; do
                eval_gettext "Setting default shell to fish..."; echo
                chsh -s "/usr/bin/fish"
                current_shell=$(getent passwd "$USER" | cut -d: -f7)
            done

            fish -c 'fish_update_completions'
            fish -c 'set -U fish_greeting'
            mkdir -p "${HOME}/.config/fish"
            touch "${HOME}/.config/fish/config.fish"

            index=2
            ;;
        *)
            eval_gettext "Invalid choice"; echo
            return 1
            ;;
    esac

    # Append aliases to the selected shell's config file if not already present
    for alias_cmd in "${alias_list[@]}"; do
        if ! grep -q "${alias_cmd}" "${config_file[$index]}"; then
            echo "${alias_cmd}" >> "${config_file[$index]}"
        fi
    done
}
