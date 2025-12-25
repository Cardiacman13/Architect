# =============================================================================
# Software installation script with automatic configuration if needed
# =============================================================================

# Load shared functions
source src/cmd.sh

# Declare associative arrays for each software category
declare -A desktop_list
declare -A system_list
declare -A browser_list
declare -A video_list
declare -A picture_list
declare -A gaming_list

# Will store the complete list of packages to install
selected_packages=""

# -----------------------------------------------------------------------------
# Define software choices for each category
# -----------------------------------------------------------------------------
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
        ["Virtmanager"]="qemu-full virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat dmidecode libguestfs"
        ["CrossOver"]="crossover"
    )

    system_list=(
        ["Open RGB"]="openrgb i2c-tools"
        ["Open Razer"]="openrazer-daemon libnotify polychromatic"
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
        ["Lutris"]="lutris wine-staging"
        ["Heroic Games Launcher (Epic Games, GOG, etc.)"]="heroic-games-launcher-bin"
        ["Prism Launcher (Minecraft)"]="prismlauncher-qt5 jdk8-openjdk"
        ["ProtonUp QT"]="protonup-qt"
        ["Goverlay"]="goverlay lib32-mangohud"
        ["Gamemode"]="gamemode lib32-gamemode"
    )
}

# -----------------------------------------------------------------------------
# Display the available software, ask the user to make a choice, 
# and populate the global 'selected_packages' variable accordingly.
# -----------------------------------------------------------------------------
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

# -----------------------------------------------------------------------------
# Main function:
# 1. Initialize software lists
# 2. Let user select and install
# 3. Perform post-install actions (groups, timers, etc.)
# 4. Manage firewall configuration (firewalld and ufw) if needed
# -----------------------------------------------------------------------------
function install_software() {
    # 1. Initialize lists
    set_software_list

    # 2. Selection
    select_and_install browser_list "$(eval_gettext "Browsers")"
    select_and_install system_list "$(eval_gettext "System Software")"
    select_and_install desktop_list "$(eval_gettext "Desktop Apps")"
    select_and_install video_list "$(eval_gettext "Video Software")"
    select_and_install picture_list "$(eval_gettext "Image Editors")"
    select_and_install gaming_list "$(eval_gettext "Gaming Software")"

    # Retrieve selected packages to install
    local -r packages="${selected_packages}"
    selected_packages=""

    # Install via AUR helper previously chosen
    install_lst "${packages}" "aur"

    # 3. Post-install actions
    # -------------------------------------------------------------------------
    # Arch Update
    if [[ "${packages}" =~ "arch-update" ]]; then
        exec_log "systemctl --user enable arch-update.timer" "$(eval_gettext "Enable arch-update.timer")"
        exec_log "arch-update --tray --enable" "$(eval_gettext "Enable arch-update tray")"
    fi

    # Open Razer
    if [[ "${packages}" =~ "openrazer-daemon" ]]; then
        exec_log "sudo usermod -aG plugdev $(whoami)" "$(eval_gettext "Add the current user to the plugdev group")"
    fi

    # VirtualBox
    if [[ "${packages}" =~ "virtualbox" ]]; then
        exec_log "sudo usermod -aG vboxusers $(whoami)" "$(eval_gettext "Add the current user to the vboxusers group")"
        exec_log "sudo systemctl enable vboxweb.service" "$(eval_gettext "Enable vboxweb")"
    fi

    # Virt-Manager
    if [[ "${packages}" =~ "virt-manager" ]]; then
        exec_log "sudo usermod -aG libvirt $(whoami)" "$(eval_gettext "Add the current user to the libvirt group")"
        exec_log "sudo usermod -aG kvm $(whoami)" "$(eval_gettext "Add the current user to the kvm group")"
        exec_log "sudo systemctl enable --now libvirtd" "$(eval_gettext "Enable libvirtd")"

        # Configure libvirtd socket (permissions)
        sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/' /etc/libvirt/libvirtd.conf
        sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/' /etc/libvirt/libvirtd.conf

        # -- Open relevant ports if firewalld is installed
        if command -v firewall-cmd >/dev/null 2>&1; then
            sudo firewall-cmd --permanent --add-service=libvirt &> /dev/null
            sudo firewall-cmd --permanent --add-port=5900-5999/tcp &> /dev/null
            sudo firewall-cmd --permanent --add-port=16509/tcp &> /dev/null
            sudo firewall-cmd --permanent --add-port=5666/tcp &> /dev/null
            sudo firewall-cmd --reload &> /dev/null
        fi

        # -- Open the same ports if ufw is installed
        if command -v ufw >/dev/null 2>&1; then
            sudo ufw allow 5900:5999/tcp
            sudo ufw allow 16509/tcp
            sudo ufw allow 5666/tcp
            sudo ufw reload &> /dev/null
        fi
    fi

    # Gamemode
    if [[ "${packages}" =~ "gamemode" ]]; then
        exec_log "sudo usermod -aG gamemode $(whoami)" "$(eval_gettext "Add the current user to the gamemode group")"

        # Default configuration for /etc/gamemode.ini
        local config_content='[general]
reaper_freq=5
desiredgov=performance
igpu_desiredgov=powersave
igpu_power_threshold=0.3
softrealtime=off
renice=20
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
start=notify-send "GameMode: Performance Active" && powerprofilesctl set performance
end=notify-send "GameMode: Balanced Active" && powerprofilesctl set balanced
;start=notify-send "GameMode started"
;end=notify-send "GameMode ended"
;script_timeout=10'

        if [ ! -f /etc/gamemode.ini ]; then
            echo "$config_content" | sudo tee /etc/gamemode.ini > /dev/null
        fi
    fi

    # 4. Firewall configuration for Steam if necessary
    # -------------------------------------------------------------------------
    if [[ "${packages}" =~ "steam" ]]; then
        # -- firewalld
        if command -v firewall-cmd >/dev/null 2>&1; then
            # Steam Remote Play https://help.steampowered.com/en/faqs/view/0689-74B8-92AC-10F2
            sudo firewall-cmd --permanent --add-port=27031-27036/udp &> /dev/null
            sudo firewall-cmd --permanent --add-port=27036/tcp &> /dev/null
            sudo firewall-cmd --permanent --add-port=27037/tcp &> /dev/null
            # Apply changes
            sudo firewall-cmd --reload &> /dev/null
        fi

        # -- ufw
        if command -v ufw >/dev/null 2>&1; then
            # Steam Remote Play https://help.steampowered.com/en/faqs/view/0689-74B8-92AC-10F2
            sudo ufw allow 27031:27036/udp
            sudo ufw allow 27036/tcp
            sudo ufw allow 27037/tcp
            # Apply changes
            sudo ufw reload &> /dev/null
        fi
    fi
}
