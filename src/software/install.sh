source src/cmd.sh

function ask_to_add() {
    local -r message="$1"
    local -r package="$2"
    local -r type="$3"

    read -rp "Do you want to add ${message} (${type}) ? (y/N) : " choice
    choice="${choice,,}"

    if [[ ${choice} == "y" ]]; then
        echo "${package}"
    fi
}

function install_software() {
    local packages_lst=""
    local flatpak_lst=""

    packages_lst += ask_to_add "firefox"               "firefox firefox-i18n-fr"                "package"
    packages_lst += ask_to_add "brave"                 "brave-bin"                              "package"
    packages_lst += ask_to_add "chromium"              "chromium"                               "package"
    packages_lst += ask_to_add "discord"               "discord"                                "package"
    packages_lst += ask_to_add "steam"                 "steam"                                  "package"
    packages_lst += ask_to_add "lutris"                "lutris wine-staging"                    "package"
    packages_lst += ask_to_add "heroic Games Launcher" "heroic-games-launcher-bin"              "package"
    packages_lst += ask_to_add "protonup-qt"           "protonup-qt-bin"                        "package"
    packages_lst += ask_to_add "spotify"               "spotify"                                "package"
    flatpak_lst  += ask_to_add "OBS Studio"            "com.obsproject.Studio"                  "flatpak"
    packages_lst += ask_to_add "Kdenlive"              "kdenlive"                               "package"
    packages_lst += ask_to_add "libreOffice"           "libreoffice-fresh libreoffice-fresh-fr" "package"
    packages_lst += ask_to_add "gimp"                  "gimp"                                   "package"
    packages_lst += ask_to_add "VLC"                   "vlc"                                    "package"
    packages_lst += ask_to_add "Visual Studio Code"    "visual-studio-code-bin"                 "package"
    packages_lst += ask_to_add "openRGB"               "openrgb-bin"                            "package"

    if [[ ${packages_lst} != "" ]]; then
        install_lst "${packages_lst}"
    fi
    if [[ ${flatpak_lst} != "" ]]; then
        for package in ${flatpak_lst[@]}; do
            exec_log "flatpak install -y flathub ${package}" "${BLUE}::${RESET} [+] ${package}"
        done
    fi
}