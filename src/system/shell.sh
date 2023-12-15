source src/cmd.sh

function shell_config() {
    local -r config_file=(
        "${HOME}/.bashrc"
        "${HOME}/.zshrc"
        "${HOME}/.config/fish/config.fish"
    )
    local alias=(
        "alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'"
        "alias update-arch='${AUR} && flatpak update'"
        "alias update-mirrors='sudo reflector --verbose --score 100 --latest 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist'"
    )

    if [[ ${AUR} == yay ]]; then
        alias+=("alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'")
    elif [[ ${AUR} == paru ]]; then
        alias+=("alias clean-arch='paru -Sc && paru -c && flatpak remove --unused'")
    fi

    for i in "${alias[@]}"; do
        if ! grep -q "${i}" "${HOME}/.bashrc"; then
            echo "${i}" >>"${HOME}/.bashrc"
        fi
    done

    local index=0
    local choice=""

    while [[ $choice != "bash" && $choice != "fish" ]]; do
        read -rp "What is your default shell ? (bash/fish) : " choice
        choice="${choice,,}"
    done

    echo -e "${GREEN}You chose ${choice}${RESET}"
    case $choice in
    bash)
        touch "${HOME}/.bashrc"
        ;;
    fish)
        install_one "fish"

        local current_shell=$(getent passwd $USER | cut -d: -f7)

        while [ "$current_shell" != "/usr/bin/fish" ]; do
            echo "Changement du shell par défaut en fish..."
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
        echo "Invalid choice"
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
