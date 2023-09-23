
function optimize_pacman() {
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

    if [[ ! -f "${SYSCTL_CONF}" ]]; then
        sudo touch "${SYSCTL_CONF}"
    fi
    if [[ -z $(cat "${SYSCTL_CONF}") ]]; then
        echo "vm.max_map_count=16777216" | sudo tee -a "${SYSCTL_CONF}"
    fi
}

function install_server_sound() {
    sudo pacman -Rdd --noconfirm pulseaudio jack2 pipewire-media-session
    sudo pacman -S --needed --noconfirm pipewire lib32-pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber
}

function install_firewall() {
    yay -S --needed --noconfirm ufw
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
