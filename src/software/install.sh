source src/cmd.sh

function ask_to_add() {
    local -r name=$1
    local -r package=$2
    local answer

    read -rp "Do you want to install ${name} ? (y/N) " answer
    if [[ ${answer} =~ ^[Yy]$ ]]; then
        echo ${package}
    fi
}

function install_software() {
    local flatpak=$(ask_to_add "OBS Studio (flatpak)" "com.obsproject.Studio")
    
    packages+=" $(ask_to_add "Discord" "discord")"
    packages+=" $(ask_to_add "Steam" "steam proton-ge-custom-bin")"
    packages+=" $(ask_to_add "Lutris" "lutris wine-staging")"
    packages+=" $(ask_to_add "Heroic Games Launcher" "heroic-games-launcher-bin")"
    packages+=" $(ask_to_add "protonup-qt" "protonup-qt-bin")"
    packages+=" $(ask_to_add "Spotify" "spotify")"
    packages+=" $(ask_to_add "Kdenlive" "kdenlive")"
    packages+=" $(ask_to_add "LibreOffice" "libreoffice-fresh libreoffice-fresh-fr")"
    packages+=" $(ask_to_add "Gimp" "gimp")"
    packages+=" $(ask_to_add "VLC" "vlc")"
    packages+=" $(ask_to_add "Visual Studio Code" "visual-studio-code-bin")"
    packages+=" $(ask_to_add "Open RGB" "openrgb-bin")"

    if [[ -n ${flatpak} ]]; then
        install_lst "${flatpak}" "flatpak"
    fi
    if [[ -n ${packages} ]]; then
        install_lst "${packages}"
    fi
}
