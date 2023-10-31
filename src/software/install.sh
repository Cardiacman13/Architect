source src/cmd.sh

function ask_to_add() {
    local -r prompt="$1"
    local -r type="$2"

    read -rp "Do you want to add ${prompt} (${type}) (y/N) : " choice
    choice="${choice,,}"

    echo "${choice}"
}

function install_software() {
    local packages_lst=""
    local flatpak_lst=""

    [ $(ask_to_add "Firefox"               "package") ] && packages_lst+="firefox firefox-i18n-fr"
    [ $(ask_to_add "Brave"                 "package") ] && packages_lst+="brave-bin"
    [ $(ask_to_add "Chromium"              "package") ] && packages_lst+="chromium"
    [ $(ask_to_add "Discord"               "package") ] && packages_lst+="discord"
    [ $(ask_to_add "Steam"                 "package") ] && packages_lst+="steam"
    [ $(ask_to_add "Lutris"                "package") ] && packages_lst+="lutris wine-staging"
    [ $(ask_to_add "Heroic Games Launcher" "package") ] && packages_lst+="heroic-games-launcher-bin"
    [ $(ask_to_add "protonup-qt"           "package") ] && packages_lst+="protonup-qt-bin"
    [ $(ask_to_add "Spotify"               "package") ] && packages_lst+="spotify"
    [ $(ask_to_add "OBS Studio"            "flatpak") ] && flatpak_lst+="com.obsproject.Studio"
    [ $(ask_to_add "Kdenlive"              "package") ] && packages_lst+="kdenlive"
    [ $(ask_to_add "LibreOffice"           "package") ] && packages_lst+="libreoffice-fresh libreoffice-fresh-fr"
    [ $(ask_to_add "Gimp"                  "package") ] && packages_lst+="gimp"
    [ $(ask_to_add "VLC"                   "package") ] && packages_lst+="vlc"
    [ $(ask_to_add "Visual Studio Code"    "package") ] && packages_lst+="visual-studio-code-bin"
    [ $(ask_to_add "Open RGB"              "package") ] && packages_lst+="openrgb-bin"

    if [[ ${#packages_lst[@]} -gt 0 ]]; then
        install_lst "${packages_lst[@]}"
    fi

    if [[ ${#flatpak_lst[@]} -gt 0 ]]; then
        for package in "${flatpak_lst[@]}"; do
            exec_log "flatpak install -y flathub ${package}" "${BLUE}::${RESET} [+] Installing ${package}"
        done
    fi
}