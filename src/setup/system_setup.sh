
# This function optimizes pacman by enabling colored output, verbose package lists, and parallel downloads.
function optimize_pacman() {
    echo "Optimisation de pacman."
    local pacman_src="/etc/pacman.conf"

    if [[ -f "${pacman_src}" ]]; then
        echo "|- Activation des couleurs."
        sudo sed -i 's/^#Color$/Color/' "${pacman_src}"
        echo "|- Activation des listes de paquets détaillées."
        sudo sed -i 's/^#VerbosePkgLists$/VerbosePkgLists/' "${pacman_src}"
        echo "|- Activation du parallel download."
        sudo sed -i 's/^#\(ParallelDownloads.*\)/\1/' "${pacman_src}"
    fi
    echo "--------------------------------------------------"
}

# Installs kernel headers for all installed kernels
#
# This function installs kernel headers for all installed kernels. It loops through all the installed kernels in /boot
# and installs the corresponding headers package for each kernel using pacman. The function suppresses all output except
# for errors.
function install_kernel_headers() {
    echo "Installation des headers des kernels."
    for kernel in $(ls /boot | grep vmlinuz); do
        local kernel_name=$(echo $kernel | sed -e 's/vmlinuz-//')
        echo "|- Installation des headers pour le kernel. ${kernel_name}"
        sudo pacman -S --needed --noconfirm "${kernel_name}-headers" >> /dev/null 2>&1
    done
    echo "--------------------------------------------------"
}

# Function to increase the value of vm.max_map_count in the system
# This function creates a file /etc/sysctl.d/99-sysctl.conf if it doesn't exist
# and adds the value vm.max_map_count=16777216 to it if it's not already present
function increase_vm_max_map_count() {
    echo "Augmentation de la valeur vm.max_map_count."
    local sysctl_src="/etc/sysctl.d/99-sysctl.conf"

    if [[ ! -f "${sysctl_src}" ]]; then
        echo "|- Création du fichier .${sysctl_src}."
        sudo touch "${sysctl_src}"
    fi
    if [[ -z $(cat "${sysctl_src}") ]]; then
        echo "|- Ajout de la valeur vm.max_map_count=16777216 dans ${sysctl_src}"
        echo "vm.max_map_count=16777216" | sudo tee -a "${sysctl_src}" >> /dev/null 2>&1
    fi
    echo "--------------------------------------------------"
}

# Installs the server sound by removing pulseaudio packages and installing pipewire packages.
# This function installs the following packages:
# - pipewire
# - lib32-pipewire
# - pipewire-pulse
# - pipewire-alsa
# - pipewire-jack
# - wireplumber
# - alsa-utils
# - alsa-firmware
# - alsa-tools
function install_server_sound() {
    echo "Installation du serveur audio."
    echo "|- Suppression des paquets pulseaudio."
    sudo pacman -Rdd --noconfirm pulseaudio >> /dev/null 2>&1
    sudo pacman -Rdd --noconfirm jack2 >> /dev/null 2>&1
    sudo pacman -Rdd --noconfirm pipewire-media-session >> /dev/null 2>&1
    sudo pacman -Rdd --noconfirm pulseaudio-bluetooth >> /dev/null 2>&1
    sudo pacman -Rdd --noconfirm pulseaudio-alsa >> /dev/null 2>&1
    echo "|- Installation des paquets pipewire."
    sudo pacman -S --needed --noconfirm pipewire lib32-pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber alsa-utils alsa-firmware alsa-tools >> /dev/null 2>&1
    echo "--------------------------------------------------"
}

# Installs and activates the ufw firewall
function install_firewall() {
    echo "Installation du firewall."

    $AUR_HELPER -S --needed --noconfirm ufw >> /dev/null 2>&1
    if ! sudo systemctl is-active ufw.service &> /dev/null; then
        echo "|- Activation du firewall."
        sudo systemctl enable --now ufw.service >> /dev/null 2>&1
    fi

    echo "--------------------------------------------------"
}


# Sets up the bootloader configuration for the system.
# If the system uses systemd-boot, it does nothing.
# If the system uses grub, it copies a hook file to the pacman hooks folder.
# If the system uses grub, it installs "update-grub" to update grub easily
function setup_grub() {
    if [[ -d "/boot/loader/entries" ]]; then
        local boot_loader="systemd-boot"
    else
        local boot_loader="grub"
    fi

    if [[ "${boot_loader}" == "grub" ]]; then
        echo "Configuration de grub."
        local hook_folder="/etc/pacman.d/hooks/"
        local hook_file="grub.hook"
        local hook_src="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)/data/grub.hook"

        sudo mkdir -p "${hook_folder}"
        sudo cp "${hook_src}" "${hook_folder}${hook_file}"
        $AUR_HELPER -S --noconfirm update-grub >> /dev/null 2>&1
    fi
}

# This function performs system setup by optimizing pacman, installing kernel headers, increasing vm max map count,
# installing server sound, installing firewall, and setting up grub.
function system_setup() {
    optimize_pacman
    install_kernel_headers
    increase_vm_max_map_count
    install_server_sound
    install_firewall
    setup_grub
}
