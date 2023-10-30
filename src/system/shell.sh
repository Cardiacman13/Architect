source src/cmd.sh

function shell_config() {
    local -r config_file=(
        "${HOME}/.bashrc"
        "${HOME}/.zshrc"
        "${HOME}/.config/fish/config.fish"
    )
    local alias=(
        "alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'"
        "alias update-arch='${AUR} -Syu && flatpak update'"
    )

    if [[ ${AUR} == yay ]]; then
        alias+=("alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'")
    elif [[ ${AUR} == paru ]]; then
        alias+=("alias clean-arch='paru -Sc && paru -c && flatpak remove --unused'")
    fi

    for i in "${alias[@]}"; do
        if ! grep -q "${i}" "${HOME}/.bashrc"; then
            echo "${i}" >> "${HOME}/.bashrc"
        fi
    done

    local index=0
    read -rp "What is your default shell ? (bash/fish) : " choice
    choice="${choice,,}"

    case $choice in
        bash)
            touch "${HOME}/.bashrc"
            ;;
        fish)
            exec_log "${AUR} -S --noconfirm fish" "Installing fish"
            exec_log "chsh -s /usr/bin/fish" "Changing default shell to fish"
            exec_log "fish -c 'fish_update_completions'" "Updating completions"
            exec_log "fish -c 'set -U fish_greeting'" "Updating completions"
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
                echo "${i}" >> "${config_file[$index]}"
            fi
        done
    fi
}
