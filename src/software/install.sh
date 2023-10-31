source src/cmd.sh

function ask_to_add() {
    local prompt="$1"
    local type="$2"

    read -rp "Do you want to add ${prompt} (${type}) (y/N) : " choice
    choice="${choice,,}"

    echo "${choice}"
}

function install_software() {
    local -a packages_lst
    local -a flatpak_lst

    [[ $(ask_to_add "Firefox" "package") == "y" ]] && packages_lst+=("firefox" "firefox-i18n-fr")
    [[ $(ask_to_add "Brave" "package") == "y" ]] && packages_lst+=("brave-bin")
    [[ $(ask_to_add "Chromium" "package") == "y" ]] && packages_lst+=("chromium")
    [[ $(ask_to_add "Discord" "package") == "y" ]] && packages_lst+=("discord")
    [[ $(ask_to_add "Steam" "package") == "y" ]] && packages_lst+=("steam")
    [[ $(ask_to_add "Lutris" "package") == "y" ]] && packages_lst+=("lutris" "wine-staging")
    [[ $(ask_to_add "Heroic Games Launcher" "package") == "y" ]] && packages_lst+=("heroic-games-launcher-bin")
    [[ $(ask_to_add "protonup-qt" "package") == "y" ]] && packages_lst+=("protonup-qt-bin")
    [[ $(ask_to_add "Spotify" "package") == "y" ]] && packages_lst+=("spotify")
    [[ $(ask_to_add "OBS Studio" "flatpak") == "y" ]] && flatpak_lst+=("com.obsproject.Studio")
    [[ $(ask_to_add "Kdenlive" "package") == "y" ]] && packages_lst+=("kdenlive")
    [[ $(ask_to_add "LibreOffice" "package") == "y" ]] && packages_lst+=("libreoffice-fresh" "libreoffice-fresh-fr")
    [[ $(ask_to_add "Gimp" "package") == "y" ]] && packages_lst+=("gimp")
    [[ $(ask_to_add "VLC" "package") == "y" ]] && packages_lst+=("vlc")
    [[ $(ask_to_add "Visual Studio Code" "package") == "y" ]] && packages_lst+=("visual-studio-code-bin")
    [[ $(ask_to_add "Open RGB" "package") == "y" ]] && packages_lst+=("openrgb-bin")

    if [[ ${#packages_lst[@]} -gt 0 ]]; then
        install_lst "${packages_lst[@]}"
    fi

    if [[ ${#flatpak_lst[@]} -gt 0 ]]; then
        for package in "${flatpak_lst[@]}"; do
            exec_log "flatpak install -y flathub ${package}" "${BLUE}::${RESET} [+] Installing ${package}"
        done
    fi
}
