source src/cmd.sh

declare -A software_list=(
    ["1"]="OBS Studio (flatpak)|com.obsproject.Studio"
    ["2"]="Firefox|firefox firefox-i18n-fr"
    ["3"]="Brave|brave-bin"
    ["4"]="Chromium|chromium"
    ["5"]="Discord|discord"
    ["6"]="Steam|steam proton-ge-custom-bin"
    ["7"]="Lutris|lutris wine-staging"
    ["8"]="Heroic Games Launcher|heroic-games-launcher-bin"
    ["9"]="protonup-qt|protonup-qt-bin"
    ["10"]="Spotify|spotify"
    ["11"]="Kdenlive|kdenlive"
    ["12"]="LibreOffice|libreoffice-fresh libreoffice-fresh-fr"
    ["13"]="Gimp|gimp"
    ["14"]="VLC|vlc"
    ["15"]="Visual Studio Code|visual-studio-code-bin"
    ["16"]="Open RGB|openrgb-bin"
)

function display_software_list() {
    echo "Liste des logiciels disponibles à l'installation :"
    for key in "${!software_list[@]}"; do
        IFS='|' read -ra software <<<"${software_list[$key]}"
        echo "$key: ${software[0]}"
    done
}

function install_software() {
    display_software_list
    local choices
    read -rp ":: Packages to be installed (e.g. 1 2 3, 1-3, all) : " choices

    local packages=""
    local flatpak=""

    if [[ $choices == "all" ]]; then
        for key in "${!software_list[@]}"; do
            IFS='|' read -ra software <<<"${software_list[$key]}"
            [[ $key == "1" ]] && flatpak="${software[1]}" || packages+="${software[1]} "
        done
    else
        for choice in $choices; do
            if [[ $choice =~ ^[0-9]+-[0-9]+$ ]]; then
                IFS='-' read -ra range <<<"$choice"
                for ((i = ${range[0]}; i <= ${range[1]}; i++)); do
                    if [[ -n ${software_list[$i]} ]]; then
                        IFS='|' read -ra software <<<"${software_list[$i]}"
                        [[ $i == "1" ]] && flatpak="${software[1]}" || packages+="${software[1]} "
                    fi
                done
            elif [[ -n ${software_list[$choice]} ]]; then
                IFS='|' read -ra software <<<"${software_list[$choice]}"
                [[ $choice == "1" ]] && flatpak="${software[1]}" || packages+="${software[1]} "
            fi
        done
    fi

    if [[ -n ${flatpak} ]]; then
        install_lst "${flatpak}" "flatpak"
    fi
    if [[ -n ${packages} ]]; then
        install_lst "${packages}"
    fi
}
