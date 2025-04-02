# Load shared functions
source src/cmd.sh

# Configure default shell and useful aliases based on user's shell preference
function shell_config() {
    # List of shell config files (bash, zsh, fish)
    local -r config_file=(
        "${HOME}/.bashrc"
        "${HOME}/.zshrc"
        "${HOME}/.config/fish/config.fish"
    )

    # Define commonly useful aliases
    local alias=(
        "alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'",
        "alias update-arch='${AUR}'",
        "alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'",
        "alias reinstall-all-pkg='sudo pacman -S  \$(pacman -Qnq)'"
    )

    # Add clean-arch alias based on AUR helper
    if [[ ${AUR} == yay ]]; then
        alias+=("alias clean-arch='yay -Sc && yay -Yc'")
    elif [[ ${AUR} == paru ]]; then
        alias+=("alias clean-arch='paru -Sc && paru -c'")
    fi

    # Add aliases to .bashrc to ensure availability even if shell is not changed
    for i in "${alias[@]}"; do
        if ! grep -q "${i}" "${HOME}/.bashrc"; then
            echo "${i}" >>"${HOME}/.bashrc"
        fi
    done

    # Ask the user what their default shell is
    local index=0
    local choice=""

    while [[ $choice != "bash" && $choice != "zsh" && $choice != "fish" ]]; do
        read -rp "$(eval_gettext "What is your default shell ? (bash/zsh/fish) : ")" choice
        choice="${choice,,}"
    done

    eval_gettext "\${GREEN}You chose \${choice}\${RESET}"; echo

    # Configure specific shell environment and change default shell if needed
    case $choice in
    bash)
        touch "${HOME}/.bashrc"
        ;;
    zsh)
        install_one "zsh"
        install_one "zsh-completions"

        local current_shell=$(getent passwd $USER | cut -d: -f7)

        while [ "$current_shell" != "/usr/bin/zsh" ]; do
            eval_gettext "Setting default shell to zsh..."; echo
            chsh -s "/usr/bin/zsh"
            current_shell=$(getent passwd $USER | cut -d: -f7)
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

        local current_shell=$(getent passwd $USER | cut -d: -f7)

        while [ "$current_shell" != "/usr/bin/fish" ]; do
            eval_gettext "Setting default shell to fish..."; echo
            chsh -s "/usr/bin/fish"
            current_shell=$(getent passwd $USER | cut -d: -f7)
        done

        fish -c 'fish_update_completions'
        fish -c 'set -U fish_greeting'
        mkdir -p "${HOME}/.config/fish"
        touch "${HOME}/.config/fish/config.fish"
        index=2
        ;;
    *)
        eval_gettext "Invalid choice"; echo
        ;;
    esac

    # Add aliases to the corresponding shell config file if not already present
    if [[ $index -ne 3 ]]; then
        for i in "${alias[@]}"; do
            if ! grep -q "${i}" "${config_file[$index]}"; then
                echo "${i}" >>"${config_file[$index]}"
            fi
        done
    fi
}
