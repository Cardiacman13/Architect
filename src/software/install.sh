source src/cmd.sh

function prompt_and_add() {
    local -r prompt="$1"
    local -r type="$2"
    local -r software=("$@")

    read -rp "Do you want to add ${prompt} (${type}) (y/N) : " choice
    choice="${choice,,}"
    
    if [[ ${choice} == "y" ]]; then
        if [[ "${type}" == "package" ]]; then
            packages_lst+=("${software[@]}")
        else
            flatpak_lst+=("${software[@]}")
        fi
    fi
}

function install_software() {
    local packages_lst=""
    local flatpak_lst=""

    prompt_and_add "Firefox"                "package" "firefox firefox-i18n-fr"
    prompt_and_add "Brave"                  "package" "brave-bin"
    prompt_and_add "Chromium"               "package" "chromium"
    prompt_and_add "Discord"                "package" "discord"
    prompt_and_add "Steam"                  "package" "steam"
    prompt_and_add "Lutris"                 "package" "lutris wine-staging"
    prompt_and_add "Heroic Games Launcher"  "package" "heroic-games-launcher-bin"
    prompt_and_add "protonup-qt"            "package" "protonup-qt-bin"
    prompt_and_add "Spotify"                "package" "spotify"
    prompt_and_add "OBS Studio (flatpak)"   "flatpak" "com.obsproject.Studio"
    prompt_and_add "Kdenlive"               "package" "kdenlive"
    prompt_and_add "LibreOffice"            "package" "libreoffice-fresh libreoffice-fresh-fr"
    prompt_and_add "Gimp"                   "package" "gimp"
    prompt_and_add "VLC"                    "package" "vlc"
    prompt_and_add "Visual Studio Code"     "package" "visual-studio-code-bin"
    prompt_and_add "Open RGB"               "package" "openrgb-bin"

    if [[ ${packages_lst} != "" ]]; then
        install_lst "${packages_lst}"
    fi
    if [[ ${flatpak_lst} != "" ]]; then
        for package in ${flatpak_lst[@]}; do
            exec_log "flatpak install -y flathub ${package}" "${BLUE}::${RESET} [+] ${package}"
        done
    fi
}