source src/cmd.sh

function ask_to_add() {
    local -r message="$1"
    local -r package="$2"
    local -r type="$3"

    read -rp "Do you want to add ${message} ? (y/N) : " choice
    choice="${choice,,}"

    if [[ $choice == y ]]; then
        if [[ $type == "package" ]]; then
            exec_log "${AUR} -S --noconfirm ${package}" "Installing ${package}"
        elif [[ $type == "flatpak" ]]; then
            exec_log "flatpak install flathub ${package}" "Installing ${package}"
        fi
    fi
}

function install_software() {
    local packages_lst=()
    local flatpak_lst=()

    ask_to_add "firefox"               "firefox firefox-i18n-fr"                "package"
    ask_to_add "brave"                 "brave-bin"                              "package"
    ask_to_add "chromium"              "chromium"                               "package"
    ask_to_add "discord"               "discord"                                "package"
    ask_to_add "steam"                 "steam"                                  "package"
    ask_to_add "lutris"                "lutris wine-staging"                    "package"
    ask_to_add "heroic Games Launcher" "heroic-games-launcher-bin"              "package"
    ask_to_add "protonup-qt"           "protonup-qt-bin"                        "package"
    ask_to_add "spotify"               "spotify"                                "package"
    ask_to_add "OBS Studio"            "com.obsproject.Studio"                  "flatpak"
    ask_to_add "Kdenlive"              "org.kde.kdenlive"                       "flatpak"
    ask_to_add "libreOffice"           "libreoffice-fresh libreoffice-fresh-fr" "package"
    ask_to_add "gimp"                  "gimp"                                   "package"
    ask_to_add "VLC"                   "vlc"                                    "package"
    ask_to_add "Visual Studio Code"    "visual-studio-code-bin"                 "package"
    ask_to_add "openRGB"               "openrgb-bin"                            "package"
}