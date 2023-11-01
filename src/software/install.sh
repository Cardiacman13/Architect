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

# Asking to user if he want to install some software
# | type    | name                    | package                                 |
# |---------|-------------------------|-----------------------------------------|
# | package | Firefox                 | firefox firefox-i18n-fr                 |
# | package | Brave                   | brave-bin                               |
# | package | Chromium                | chromium                                |
# | package | Discord                 | discord                                 |
# | package | Steam                   | steam                                   |
# | package | Lutris                  | lutris wine-staging                     |
# | package | Heroic Games Launcher   | heroic-games-launcher-bin               |
# | package | protonup-qt             | protonup-qt-bin                         |
# | package | Spotify                 | spotify                                 |
# | flatpak | OBS Studio              | com.obsproject.Studio                   |
# | package | Kdenlive                | kdenlive                                |
# | package | LibreOffice             | libreoffice-fresh libreoffice-fresh-fr  |
# | package | Gimp                    | gimp                                    |
# | package | VLC                     | vlc                                     |
# | package | Visual Studio Code      | visual-studio-code-bin                  |
# | package | Open RGB                | openrgb-bin                             |
# |-----------------------------------------------------------------------------|
function install_software() {
    local flatpak=$(ask_to_add "OBS Studio (flatpak)" "com.obsproject.Studio")
    local packages=$(ask_to_add "Firefox" "firefox firefox-i18n-fr")

    packages+=" $(ask_to_add "Brave" "brave-bin")"
    packages+=" $(ask_to_add "Chromium" "chromium")"
    packages+=" $(ask_to_add "Discord" "discord")"
    packages+=" $(ask_to_add "Steam" "steam")"
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

    install_lst "${flatpak}" "flatpak"
    install_lst "${packages}"
}
