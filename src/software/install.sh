source src/cmd.sh

declare -A desktop_list
declare -A gaming_list
selected_packages=""

function set_software_list() {
    local -r lang=$(echo $LANG | cut -d_ -f1)

    desktop_list=(
        ["Firefox"]="firefox firefox-i18n-${lang}"
        ["Brave"]="brave-bin"
        ["Chromium"]="chromium"
        ["Vivaldi"]="vivaldi"
        ["Google Chrome"]=" google-chrome"
        ["Microsoft Edge"]=" microsoft-edge-stable-bin"
        ["Discord"]="discord"
        ["Spotify"]="spotify"
        ["Kdenlive"]="kdenlive"
        ["Davinci Resolve"]="davinci-resolve"
        ["LibreOffice"]="libreoffice-fresh libreoffice-fresh-${lang}"
        ["OnlyOffice"]="onlyoffice-bin"
        ["Gimp"]="gimp"
        ["Krita"]="krita"
        ["Inkscape"]="inkscape"
        ["Blender"]="blender"
        ["OBS Studio"]="obs-studio qt6-wayland"
        ["Audacity"]="audacity"
        ["Kazam"]="kazam"
        ["VLC"]="vlc"
        ["Visual Studio Code"]="visual-studio-code-bin"
        ["Virtualbox"]="virtualbox-host-dkms virtualbox-guest-iso"
        ["Open RGB"]="openrgb-bin"
    )

    gaming_list=(
        ["Steam"]="steam proton-ge-custom"
        ["Lutris (LOL, etc.)"]="lutris wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader"
        ["Heroic Games Launcher (Epic Games, GOG, etc.)"]="heroic-games-launcher-bin"
        ["Prism Launcher (Minecraft)"]="prismlauncher-qt5 jdk8-openjdk"
    )
}

function select_and_install() {
    declare -n software_list=$1
    local i=1
    local options=()
    local input

    echo "Available Software:"
    for software in "${!software_list[@]}"; do
        printf " ${PURPLE}%2d${RESET}) %s\n" "$i" "$software"
        options+=("$software")
        ((i++))
    done

    echo ":: Packages to install (e.g., 1 2 3, 1-3, all):"
    read -ra input

    for item in "${input[@]}"; do
        if [[ "$item" == "all" ]]; then
            for software in "${!software_list[@]}"; do
                selected_packages+=" ${software_list[$software]}"
            done
            break
        elif [[ $item =~ ^[0-9]+$ ]]; then
            selected_packages+=" ${software_list[${options[$item - 1]}]}"
        elif [[ $item =~ ^[0-9]+-[0-9]+$ ]]; then
            IFS='-' read -ra range <<<"$item"
            for ((j = ${range[0]}; j <= ${range[1]}; j++)); do
                selected_packages+=" ${software_list[${options[$j - 1]}]}"
            done
        else
            echo "Invalid option: $item"
        fi
    done
}

function install_software() {
    set_software_list

    select_and_install desktop_list
    select_and_install gaming_list

    install_lst "${selected_packages}" "aur"
}
