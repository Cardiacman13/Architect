
function optimize_pacman() {
    echo "Optimisation de pacman..."
    local PACMAN_CONF="/etc/pacman.conf"

    if [[ -f "${PACMAN_CONF}" ]]; then
        echo "|- Activation des couleurs"
        sudo sed -i 's/^#Color$/Color/' "${PACMAN_CONF}"
        echo "|- Activation des listes de paquets détaillées"
        sudo sed -i 's/^#VerbosePkgLists$/VerbosePkgLists/' "${PACMAN_CONF}"
        echo "|- Activation du parallel download"
        sudo sed -i 's/^#\(ParallelDownloads.*\)/\1/' "${PACMAN_CONF}"
    fi
    echo "--------------------------------------------------"
}

function install_kernel_headers() {
    echo "Installation des headers des kernels"
    for kernel in $(ls /boot | grep vmlinuz); do
        local kernel_name=$(echo $kernel | sed -e 's/vmlinuz-//')
        echo "|- Installation des headers pour le kernel ${kernel_name}"
        sudo pacman -S --needed --noconfirm "${kernel_name}-headers" >> /dev/null 2>&1
    done
    echo "--------------------------------------------------"
}

function increase_vm_max_map_count() {
    echo "Augmentation de la valeur vm.max_map_count..."
    local SYSCTL_CONF="/etc/sysctl.d/99-sysctl.conf"

    if [[ ! -f "${SYSCTL_CONF}" ]]; then
        echo "|- Création du fichier ${SYSCTL_CONF}"
        sudo touch "${SYSCTL_CONF}"
    fi
    if [[ -z $(cat "${SYSCTL_CONF}") ]]; then
        echo "|- Ajout de la valeur vm.max_map_count=16777216 dans ${SYSCTL_CONF}"
        echo "vm.max_map_count=16777216" | sudo tee -a "${SYSCTL_CONF}" >> /dev/null 2>&1
    fi
    echo "--------------------------------------------------"
}

function install_server_sound() {
    echo "Installation du serveur audio..."
    echo "|- Suppression des paquets pulseaudio"
    sudo pacman -Rdd --noconfirm pulseaudio >> /dev/null 2>&1
    sudo pacman -Rdd --noconfirm jack2 >> /dev/null 2>&1
    sudo pacman -Rdd --noconfirm pipewire-media-session >> /dev/null 2>&1
    sudo pacman -Rdd --noconfirm pulseaudio-bluetooth >> /dev/null 2>&1
    sudo pacman -Rdd --noconfirm pulseaudio-alsa >> /dev/null 2>&1
    echo "|- Installation des paquets pipewire"
    sudo pacman -S --needed --noconfirm pipewire lib32-pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber >> /dev/null 2>&1
    echo "--------------------------------------------------"
}

function install_firewall() {
    echo "Installation du firewall..."
    yay -S --needed --noconfirm ufw >> /dev/null 2>&1
    if ! sudo systemctl is-active ufw.service &> /dev/null; then
        echo "|- Activation du firewall"
        sudo systemctl enable --now ufw.service >> /dev/null 2>&1
    fi
    echo "--------------------------------------------------"
}

function system_setup() {
    optimize_pacman
    install_kernel_headers
    increase_vm_max_map_count
    install_server_sound
    install_firewall
}
