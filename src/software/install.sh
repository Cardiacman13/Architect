# Load shared functions
source src/cmd.sh

# Declare associative arrays to categorize software options
declare -A desktop_list
declare -A system_list
declare -A browser_list
declare -A video_list
declare -A picture_list
declare -A gaming_list

# Stores the full package string to install
selected_packages=""

# Define all available software choices for each category
function set_software_list() {
    desktop_list=(
        ["Discord"]="discord"
        ["Telegram"]="telegram-desktop"
        ["Spotify"]="spotify"
        ["LibreOffice en"]="libreoffice-fresh"
        ["LibreOffice fr"]="libreoffice-fresh libreoffice-fresh-fr"
        ["OnlyOffice"]="onlyoffice-bin"
        ["Audacity"]="audacity"
        ["Kazam"]="kazam"
        ["Visual Studio Code"]="visual-studio-code-bin"
        ["Visual Studio Code Open Source"]="code"
        ["Virtualbox"]="virtualbox virtualbox-host-dkms virtualbox-guest-iso"
        ["Virtmanager"]="virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat dmidecode libguestfs"
        ["CrossOver"]="crossover"
    )

    system_list=(
        ["Open RGB"]="openrgb"
        ["Arch Update"]="arch-update vim"
    )

    picture_list=(
        ["Gimp"]="gimp"
        ["Krita"]="krita"
        ["Inkscape"]="inkscape"
        ["Blender"]="blender"
    )

    video_list=(
        ["Kdenlive"]="kdenlive"
        ["OBS Studio"]="obs-studio"
        ["VLC"]="vlc"
        ["MPV"]="mpv"
    )

    browser_list=(
        ["Firefox en"]="firefox"
        ["Firefox fr"]="firefox firefox-i18n-fr"
        ["Brave"]="brave-bin"
        ["Chromium"]="chromium"
        ["Vivaldi"]="vivaldi vivaldi-ffmpeg-codecs"
        ["Google Chrome"]="google-chrome"
        ["Microsoft Edge"]="microsoft-edge-stable-bin"
    )

    gaming_list=(
        ["Steam"]="steam"
        ["Lutris (LOL, etc.)"]="lutris wine-staging"
        ["Heroic Games Launcher (Epic Games, GOG, etc.)"]="heroic-games-launcher-bin"
        ["Prism Launcher (Minecraft)"]="prismlauncher-qt5 jdk8-openjdk"
        ["ProtonUp QT"]="protonup-qt"
        ["Goverlay"]="goverlay lib32-mangohud"
        ["Gamemode"]="gamemode lib32-gamemode"
    )
}

# Display and let the user choose from the given software list
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

# Master function that runs software selection and handles post-install logic
function install_software() {
    # Initialize software lists
    set_software_list

    # Let user select software from each category
    select_and_install browser_list "$(eval_gettext "Browsers")"
    select_and_install system_list "$(eval_gettext "System Software")"
    select_and_install desktop_list "$(eval_gettext "Desktop Apps")"
    select_and_install video_list "$(eval_gettext "Video Software")"
    select_and_install picture_list "$(eval_gettext "Image Editors")"
    select_and_install gaming_list "$(eval_gettext "Gaming Software")"

    # We now have a single string of selected packages in $selected_packages
    local -r aur_packages="${selected_packages}"
    selected_packages=""

    # Install the selected packages via AUR (or your chosen method)
    install_lst "${aur_packages}" "aur"

    # Additional actions if certain packages were included
    if [[ "${aur_packages}" =~ "arch-update" ]]; then
        exec_log "systemctl --user enable arch-update.timer" "$(eval_gettext "Enable arch-update.timer")"
        exec_log "arch-update --tray --enable" "$(eval_gettext "Enable arch-update tray")"
    fi

    if [[ "${aur_packages}" =~ "virtualbox" ]]; then
        exec_log "sudo usermod -aG vboxusers $(whoami)" "$(eval_gettext "Add the current user to the vboxusers group")"
        exec_log "sudo systemctl enable vboxweb.service" "$(eval_gettext "Enable vboxweb")"
    fi

    if [[ "${aur_packages}" =~ "virt-manager" ]]; then
        exec_log "sudo usermod -aG libvirt $(whoami)" "$(eval_gettext "Add the current user to the libvirt group")"
        exec_log "sudo usermod -aG kvm $(whoami)" "$(eval_gettext "Add the current user to the kvm group")"
        exec_log "sudo systemctl enable --now libvirtd" "$(eval_gettext "Enable libvirtd")"

        # Configure libvirtd socket permissions
        sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/' /etc/libvirt/libvirtd.conf
        sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/' /etc/libvirt/libvirtd.conf

        # If firewalld is installed, open relevant Virt-Manager (libvirt) ports
        if command -v firewall-cmd >/dev/null 2>&1; then
            sudo firewall-cmd --permanent --add-service=libvirt
            sudo firewall-cmd --permanent --add-port=5900-5999/tcp
            sudo firewall-cmd --permanent --add-port=16509/tcp
            sudo firewall-cmd --permanent --add-port=5666/tcp
            sudo firewall-cmd --reload
        fi
    fi

    if [[ "${aur_packages}" =~ "gamemode" ]]; then
        exec_log "sudo usermod -aG gamemode $(whoami)" "$(eval_gettext "Add the current user to the gamemode group")"

        # GameMode configuration content
        config_content='[general]
reaper_freq=5
desiredgov=performance
igpu_desiredgov=powersave
igpu_power_threshold=0.3
softrealtime=off
renice=0
ioprio=0
inhibit_screensaver=1
disable_splitlock=1

[filter]
;whitelist=RiseOfTheTombRaider
;blacklist=HalfLife3

[gpu]
;apply_gpu_optimisations=0
;gpu_device=0
;nv_powermizer_mode=1
;nv_core_clock_mhz_offset=0
;nv_mem_clock_mhz_offset=0
;amd_performance_level=high

[cpu]
;park_cores=no
;pin_cores=yes

[supervisor]
;supervisor_whitelist=
;supervisor_blacklist=
;require_supervisor=0

[custom]
;start=notify-send "GameMode started"
;end=notify-send "GameMode ended"
;script_timeout=10'

        if [ ! -f /etc/gamemode.ini ]; then
            echo "$config_content" | sudo tee /etc/gamemode.ini > /dev/null
        fi
    fi

    # If the user selected Steam, open the relevant ports if firewalld is installed
    if [[ "${aur_packages}" =~ "steam" ]]; then
        if command -v firewall-cmd >/dev/null 2>&1; then
            # -- To log into Steam and download content
            sudo firewall-cmd --permanent --add-port=80/tcp
            sudo firewall-cmd --permanent --add-port=443/tcp
            sudo firewall-cmd --permanent --add-port=27015-27050/udp
            sudo firewall-cmd --permanent --add-port=27015-27050/tcp

            # Steam Client
            sudo firewall-cmd --permanent --add-port=27000-27100/udp
            sudo firewall-cmd --permanent --add-port=27031-27036/udp
            sudo firewall-cmd --permanent --add-port=27036/tcp
            sudo firewall-cmd --permanent --add-port=4380/udp
            
            # Dedicated or Listen Servers
            sudo firewall-cmd --permanent --add-port=27015/tcp
            sudo firewall-cmd --permanent --add-port=27015/udp

            # Steamworks P2P Networking and Steam Voice Chat
            sudo firewall-cmd --permanent --add-port=3478/udp
            sudo firewall-cmd --permanent --add-port=4379/udp
            sudo firewall-cmd --permanent --add-port=4380/udp
            sudo firewall-cmd --permanent --add-port=27014-27030/udp

            # Apply changes
            sudo firewall-cmd --reload
        fi
    fi
}
