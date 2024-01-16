source src/cmd.sh

function shell_config() {
    local -r config_file=(
        "${HOME}/.bashrc"
        "${HOME}/.zshrc"
        "${HOME}/.config/fish/config.fish"
    )
    local alias=(
        "alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'"
        "alias update-arch='${AUR}'"
        "alias update-mirrors='sudo reflector --verbose --score 100 --latest 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist && sudo pacman -Syyu'"
    )

    if [[ ${AUR} == yay ]]; then
        alias+=("alias clean-arch='yay -Sc && yay -Yc'")
    elif [[ ${AUR} == paru ]]; then
        alias+=("alias clean-arch='paru -Sc && paru -c'")
    fi

    for i in "${alias[@]}"; do
        if ! grep -q "${i}" "${HOME}/.bashrc"; then
            echo "${i}" >>"${HOME}/.bashrc"
        fi
    done

    local index=0
    local choice=""

    while [[ $choice != "bash" && $choice != "fish" && $choice != "zsh" ]]; do
        read -rp "$(eval_gettext "What is your default shell? (bash/fish/zsh) : ")" choice
        choice="${choice,,}"
    done

    eval_gettext "\${GREEN}You chose \${choice}\${RESET}"; echo
    case $choice in
    bash)
        touch "${HOME}/.bashrc"
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
    zsh)
        sudo pacman -Sy zsh
        chsh -s "$(which zsh)"
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        touch "${HOME}/.zshrc"
        index=1
        ;;
    *)
        eval_gettext "Invalid choice"; echo
        ;;
    esac

    if [[ $index -ne 3 ]]; then
        for i in "${alias[@]}"; do
            if ! grep -q "${i}" "${config_file[$index]}"; then
                echo "${i}" >>"${config_file[$index]}"
            fi
        done
    fi
}
