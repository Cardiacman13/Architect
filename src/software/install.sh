source src/cmd.sh

declare -A desktop_list
declare -A browser_list
declare -A video_list
declare -A picture_list
declare -A gaming_list
declare -A flatpak_list

selected_packages=""

function set_software_list() {

    desktop_list=(
        ["Discord"]="discord"
        ["Spotify"]="spotify"
        ["LibreOffice"]="libreoffice-fresh"
        ["OnlyOffice"]="onlyoffice-bin"
        ["Audacity"]="audacity"
        ["Kazam"]="kazam"
        ["Visual Studio Code"]="visual-studio-code-bin"
        ["Virtualbox"]="virtualbox virtualbox-host-dkms virtualbox-guest-iso"
        ["Open RGB"]="openrgb-bin"
        ["Arch Update"]="arch-update"
    )

    picture_list=(
        ["Gimp"]="gimp"
        ["Krita"]="krita"
        ["Inkscape"]="inkscape"
        ["Blender"]="blender"
    )

    video_list=(
        ["Kdenlive"]="kdenlive"
        ["Davinci Resolve"]="davinci-resolve"
        ["Davinci Resolve (paid version)"]="davinci-resolve-studio"
        ["OBS Studio"]="obs-studio"
        ["VLC"]="vlc"
        ["MPV"]="mpv"
    )

    browser_list=(
        ["Firefox"]="firefox"
        ["Brave"]="brave-bin"
        ["Chromium"]="chromium"
        ["Vivaldi"]="vivaldi vivaldi-ffmpeg-codecs"
        ["Google Chrome"]="google-chrome"
        ["Microsoft Edge"]="microsoft-edge-stable-bin"
    )

    gaming_list=(
        ["Steam"]="steam"
        ["Lutris (LOL, etc.)"]="lutris wine-staging "
        ["Heroic Games Launcher (Epic Games, GOG, etc.)"]="heroic-games-launcher-bin"
        ["Prism Launcher (Minecraft)"]="prismlauncher-qt5 jdk8-openjdk"
        ["ProtonUp QT"]="protonup-qt-bin"
        ["Goverlay"]="goverlay"
        ["Gamemode"]="gamemode"
    )

    flatpak_list=(
        ["Firefox"]="org.mozilla.firefox"
        ["Google Chrome"]="com.google.Chrome"
        ["RetroArch"]="org.libretro.RetroArch"
        ["Discord"]="com.discordapp.Discord"
        ["Brave"]="com.brave.Browser"
        ["Spotify"]="com.spotify.Client"
        ["Deezer"]="dev.aunetx.deezer"
        ["Telegram"]="org.telegram.desktop"
        ["ProtonUP"]="net.davidotek.pupgui2"
        ["Lutris"]="net.lutris.Lutris"
        ["Steam"]="com.valvesoftware.Steam"
        ["OBS"]="com.obsproject.Studio"
    )
}

function select_and_install() {
    declare -n software_list=$1
    local -r software_type=$2
    local i=1
    local options=()
    local input

    echo "${GREEN}${software_type} software${RESET} :"
    for software in "${!software_list[@]}"; do
        printf " ${PURPLE}%2d${RESET}) %s\n" "$i" "$software"
        options+=("$software")
        ((i++))
    done

    echo -en "${BLUE}::${RESET} Packages to install (e.g., 1 2 3, 1-3, all or press enter to skip): "
    read -ra input

    for item in "${input[@]}"; do
        if [[ "$item" == "all" ]]; then
            for software in "${!software_list[@]}"; do
                selected_packages+=" ${software_list[$software]} "
            done
            break
        elif [[ $item =~ ^[0-9]+$ ]]; then
            selected_packages+=" ${software_list[${options[$item - 1]}]} "
        elif [[ $item =~ ^[0-9]+-[0-9]+$ ]]; then
            IFS='-' read -ra range <<<"$item"
            for ((j = ${range[0]}; j <= ${range[1]}; j++)); do
                selected_packages+=" ${software_list[${options[$j - 1]}]} "
            done
        fi
    done
}

function install_software() {
    set_software_list

    select_and_install browser_list "browsers"
    select_and_install desktop_list "desktop"
    select_and_install video_list "video"
    select_and_install picture_list "image"
    select_and_install gaming_list "gaming"

    local -r aur_packages="${selected_packages}"

    selected_packages=""

    select_and_install flatpak_list "flatpak"

    local -r flatpak_packages="${selected_packages}"

    install_lst "${aur_packages}" "aur"
    install_lst "${flatpak_packages}" "flatpak"
}