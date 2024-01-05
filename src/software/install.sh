# source src/cmd.sh

declare -A desktop_list
declare -A system_list
declare -A browser_list
declare -A video_list
declare -A picture_list
declare -A gaming_list

selected_packages=""

function set_software_list() {

    desktop_list=(
        ["Discord"]="discord"
        ["Telegram"]="telegram-desktop"
        ["Spotify"]="spotify"
        ["LibreOffice"]="libreoffice-fresh"
        ["OnlyOffice"]="onlyoffice-bin"
        ["Audacity"]="audacity"
        ["Kazam"]="kazam"
        ["Visual Studio Code"]="visual-studio-code-bin"
        ["Virtualbox"]="virtualbox virtualbox-host-dkms virtualbox-guest-iso virtualbox-ext-oracle"
    )

    system_list=(
        ["Open RGB"]="openrgb-bin"
        ["Arch Update"]="arch-update"
        ["PAMAC ALL"]="pamac-all"
        ["PAMAC tray icon for plasma"]="pamac-tray-icon-plasma"
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
        ["Davinci Resolve ($(eval_gettext "paid version"))"]="davinci-resolve-studio"
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
}

function select_and_install() {
    declare -n software_list=$1
    local -r software_type=$2
    local i=1
    local options=()
    local input

    eval_gettext "\${GREEN}\${software_type}\${RESET} :"; echo
    for software in "${!software_list[@]}"; do
        printf " ${PURPLE}%2d${RESET}) %s\n" "$i" "$software"
        options+=("$software")
        ((i++))
    done

    eval_gettext "\${BLUE}::\${RESET} Packages to install (e.g., 1 2 3, 1-3, all or press enter to skip): "
    read -ra input

    for item in "${input[@]}"; do
        if [[ "$item" == "$(eval_gettext "all")" ]]; then
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

    select_and_install browser_list "$(eval_gettext "Browsers")"
    select_and_install system_list "$(eval_gettext "System Software")"
    select_and_install desktop_list "$(eval_gettext "Desktop Apps")"
    select_and_install video_list "$(eval_gettext "Video Software")"
    select_and_install picture_list "$(eval_gettext "Image Editors")"
    select_and_install gaming_list "$(eval_gettext "Gaming Software")"

    local -r aur_packages="${selected_packages}"

    selected_packages=""

    install_lst "${aur_packages}" "aur"

    if [[ "${aur_packages}" =~ "arch-update" ]]; then
        exec_log "systemctl --user enable --now arch-update.timer" "$(eval_gettext "Enable arch-update.timer")"
    fi
    
    if [[ "${aur_packages}" =~ "virtualbox" ]]; then
        exec_log "sudo gpasswd -a $USER vboxusers" "$(eval_gettext "Add the current user to the vboxusers group")"
        exec_log "sudo systemctl enable vboxweb.service" "$(eval_gettext "Enable vboxweb")"
    fi
}
