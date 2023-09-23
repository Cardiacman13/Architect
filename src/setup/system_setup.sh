
function omptize_pacman() {
    local PACMAN_CONF="/etc/pacman.conf"

    if [[ -f "${PACMAN_CONF}" ]]; then
        sudo sed -i 's/^#Color$/Color/' "${PACMAN_CONF}"
        sudo sed -i 's/^#VerbosePkgLists$/VerbosePkgLists/' "${PACMAN_CONF}"
        sudo sed -i 's/^#\(ParallelDownloads.*\)/\1/' "${PACMAN_CONF}"
    fi
}

function install_kernel_headers() {
    for kernel in $(ls /boot | grep vmlinuz); do
        local kernel_name=$(echo $kernel | sed -e 's/vmlinuz-//')
        sudo pacman -S --needed --noconfirm "${kernel_name}-headers"
    done
}

function increase_vm_max_map_count() {
    local SYSCTL_CONF="/etc/sysctl.d/99-sysctl.conf"

    if [[ -f "${SYSCTL_CONF}" ]]; then
        local vm_max_map_count=$(cat "${SYSCTL_CONF}" | grep vm.max_map_count | awk '{print $3}')

        if [[ -z "${vm_max_map_count}" ]]; then
            sudo echo "vm.max_map_count=16777216" >> "${SYSCTL_CONF}"
        fi
    else
        sudo echo "vm.max_map_count=16777216" >> "${SYSCTL_CONF}"
    fi
}

function install_aur_helper() {
    if ! command -v yay &> /dev/null; then
        git clone https://aur.archlinux.org/yay-bin.git
        cd yay-bin
        makepkg -si --noconfirm
        cd ..
        rm -rf yay-bin
    fi
}

function install_server_sound() {
    if pacman -Qi pulseaudio &> /dev/null; then
        sudo pacman -Rns --noconfirm pulseaudio
    fi
    if pacman -Qi jack2 &> /dev/null; then
        sudo pacman -Rns --noconfirm jack2
    fi
    if pacman -Qi pipewire-media-session &> /dev/null; then
        sudo pacman -Rns --noconfirm pipewire-media-session
    fi
    sudo pacman -S --needed --noconfirm pipewire lib32-pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber
}

function install_firewall() {
    yay -S --needed --noconfirm gufw
    if ! sudo systemctl is-active ufw.service &> /dev/null; then
        sudo systemctl enable --now ufw.service
    fi
}

function system_setup() {
    optimize_pacman
    install_kernel_headers
    increase_vm_max_map_count
    install_aur_helper
    install_server_sound
    install_firewall
}