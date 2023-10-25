# Optimise pacman en activant la sortie colorée, les listes de paquets détaillées et les téléchargements en parallèle.
function optimize_pacman() {
    echo "Optimisation de pacman."

    local pacman_src="/etc/pacman.conf"
    if [[ -f "${pacman_src}" ]]; then
        # Activation des couleurs
        echo "|- Activation des couleurs."
        sudo sed -i 's/^#Color$/Color/' "${pacman_src}"

        # Activation des listes de paquets détaillées
        echo "|- Activation des listes de paquets détaillées."
        sudo sed -i 's/^#VerbosePkgLists$/VerbosePkgLists/' "${pacman_src}"

        # Activation du téléchargement parallèle
        echo "|- Activation du téléchargement parallèle."
        sudo sed -i 's/^#\(ParallelDownloads.*\)/\1/' "${pacman_src}"
    fi
    echo "--------------------------------------------------"
}

# Installe les headers du noyau pour chaque noyau installé.
function install_kernel_headers() {
    echo "Installation des headers des noyaux."

    for kernel in $(ls /boot | grep vmlinuz); do
        local kernel_name=$(echo $kernel | sed -e 's/vmlinuz-//')

        # Installation des headers pour le noyau actuel
        echo "|- Installation des headers pour le noyau ${kernel_name}."
        sudo pacman -S --needed --noconfirm "${kernel_name}-headers" >> /dev/null 2>&1
    done
    echo "--------------------------------------------------"
}

# Augmente la valeur de vm.max_map_count.
function increase_vm_max_map_count() {
    echo "Augmentation de la valeur vm.max_map_count."

    local sysctl_src="/etc/sysctl.d/99-sysctl.conf"
    if [[ ! -f "${sysctl_src}" ]]; then
        # Création du fichier si ce dernier n'existe pas
        echo "|- Création du fichier ${sysctl_src}."
        sudo touch "${sysctl_src}"
    fi
    if [[ -z $(cat "${sysctl_src}") ]]; then
        # Ajout de la valeur si elle n'est pas déjà présente
        echo "|- Ajout de la valeur vm.max_map_count=16777216 dans ${sysctl_src}."
        echo "vm.max_map_count=16777216" | sudo tee -a "${sysctl_src}" >> /dev/null 2>&1
    fi
    echo "--------------------------------------------------"
}

# Gère l'installation et la configuration du serveur audio.
function install_server_sound() {
    echo "Installation du serveur audio."

    # Suppression des paquets pulseaudio existants
    echo "|- Suppression des paquets pulseaudio."
    sudo pacman -Rdd --noconfirm pulseaudio >> /dev/null 2>&1
    sudo pacman -Rdd --noconfirm pulseaudio-bluetooth >> /dev/null 2>&1
    sudo pacman -Rdd --noconfirm pulseaudio-alsa >> /dev/null 2>&1
    sudo pacman -Rdd --noconfirm jack2 >> /dev/null 2>&1
    sudo pacman -Rdd --noconfirm pipewire-media-session >> /dev/null 2>&1

    # Installation des paquets pipewire
    echo "|- Installation des paquets pipewire."
    sudo pacman -S --needed --noconfirm pipewire lib32-pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber alsa-utils alsa-firmware alsa-tools >> /dev/null 2>&1
    echo "--------------------------------------------------"
}

# Installer et éventuellement activer le pare-feu firewalld.
function installer_firewalld() {
    echo "Considération de l'installation de firewalld."

    # Demander à l'utilisateur s'il souhaite installer firewalld
    if read_user "|- Voulez-vous installer et activer firewalld ? Note : Il peut bloquer des imprimantes ou votre réseau local sans configuration supplémentaire appropriée."; then
        # Installer firewalld
        $AUR_HELPER -S --needed --noconfirm firewalld python-pyqt5 python-capng >> /dev/null 2>&1

        # Activer firewalld s'il n'est pas déjà activé
        if ! sudo systemctl is-active firewalld.service &> /dev/null; then
            echo "|- Activation de firewalld."
            sudo systemctl enable --now firewalld.service >> /dev/null 2>&1
            firewall-applet &
        fi
    else
        echo "|- Passage de l'installation et de l'activation de firewalld."
    fi
    echo "--------------------------------------------------"
}

# Configure le chargeur de démarrage pour le système.
function setup_grub() {
    # Détermination du chargeur de démarrage actuel
    if [[ -d "/boot/loader/entries" ]]; then
        local boot_loader="systemd-boot"
    else
        local boot_loader="grub"
    fi


    if [[ "${boot_loader}" == "grub" ]]; then
        # Configuration pour GRUB
        echo "Configuration de grub."

        local hook_folder="/etc/pacman.d/hooks/"
        local hook_file="grub.hook"
        local hook_src="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)/data/grub.hook"

        sudo mkdir -p "${hook_folder}"
        sudo cp "${hook_src}" "${hook_folder}${hook_file}"
        $AUR_HELPER -S --noconfirm update-grub >> /dev/null 2>&1
    fi
}

# Fonction principale pour la configuration du système.
function system_setup() {
    optimize_pacman
    install_kernel_headers
    increase_vm_max_map_count
    install_server_sound
    installer_firewalld
    setup_grub
}
