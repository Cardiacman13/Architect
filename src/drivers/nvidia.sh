# Fonction pour configurer le hook Nvidia en copiant le fichier nvidia.hook dans /etc/pacman.d/hooks/
function hook() {
    echo "|- Configuration du hook Nvidia."

    local hook_folder="/etc/pacman.d/hooks/"
    local hook_file="nvidia.hook"
    local hook_src="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)/data/nvidia.hook"

    # Création du dossier des hooks si ce n'est pas déjà fait
    sudo mkdir -p "${hook_folder}"

    # Copie du fichier de hook
    if sudo cp "${hook_src}" "${hook_folder}${hook_file}"; then
        echo -e "${GREEN}Hook Nvidia configuré avec succès.${RESET}"
    else
        echo -e "${RED}Erreur lors de la configuration du hook Nvidia.${RESET}"
        exit 1
    fi
}

# Fonction pour mettre à jour le fichier de configuration mkinitcpio pour inclure les modules NVIDIA nécessaires.
function mkinitcpio() {
    echo "|- Configuration de mkinitcpio."

    local mkinitcpio_src="/etc/mkinitcpio.conf"
    # Ajout des modules NVIDIA à mkinitcpio
    if sudo sed -i '/MODULES=/ s/)/ nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' "${mkinitcpio_src}"; then
        echo -e "${GREEN}Configuration de mkinitcpio réussie.${RESET}"
    else
        echo -e "${RED}Erreur lors de la configuration de mkinitcpio.${RESET}"
        exit 1
    fi
}

# Fonction pour détecter le bootloader utilisé par le système et ajouter l'option "nvidia-drm.modeset=1" à la configuration de démarrage.
function bootloaders() {
    echo "|- Détection du bootloader."

    local boot_loader
    if [[ -d "/boot/loader/entries" ]]; then
        boot_loader="systemd-boot"
    else
        boot_loader="grub"
    fi

    echo "|- Bootloader détecté: ${boot_loader}"

    if [[ "${boot_loader}" == "grub" ]]; then
        local boot_loader_src="/etc/default/grub"

        # Ajout de l'option nvidia-drm.modeset=1 pour GRUB
        if grep -q "GRUB_CMDLINE_LINUX_DEFAULT" "${boot_loader_src}" && ! grep -q "nvidia-drm.modeset=1" "${boot_loader_src}"; then
            echo "   |- Ajout de nvidia-drm.modeset=1 aux options de démarrage pour GRUB."
            sudo sed -i '/GRUB_CMDLINE_LINUX_DEFAULT/ s/\"$/ nvidia-drm.modeset=1\"/' "${boot_loader_src}"
        fi

        # Mise à jour de GRUB
        echo "|- Mise à jour de grub."
        if ! sudo grub-mkconfig -o /boot/grub/grub.cfg >> /dev/null 2>&1; then
            echo -e "${RED}Erreur lors de la mise à jour de GRUB.${RESET}"
            exit 1
        fi
    else
        local boot_loader_src="/boot/loader/entries/*.conf"
        echo "|- Ajout de nvidia-drm.modeset=1 aux options de démarrage pour systemd-boot."
        if ! sudo sed -i '/^options root/ s/$/ nvidia-drm.modeset=1/' ${boot_loader_src}; then
            echo -e "${RED}Erreur lors de l'ajout de l'option de démarrage pour systemd-boot.${RESET}"
            exit 1
        fi
    fi
}
function nvidia_drivers() {
    echo "|- Installation des pilotes Nvidia."

    bootloaders
    mkinitcpio
    hook

    # Utilise une boucle while pour continuer à inviter l'utilisateur jusqu'à ce qu'un choix valide soit fait
    read -p "Choisissez entre 'nvidia' (Recommandé) ou 'nvidia-all' (Note : Si vous choisissez nvidia-all, vous devez savoir comment le maintenir) :" choice

    choice=$(echo "$choice" | tr '[:lower:]' '[:upper:]')  # Convertit la saisie en majuscules.

    while [[ -z "$choice" || ! " NVIDIA NVIDIA-ALL " =~ " $choice " ]]; do
        read -p "Option invalide ou vide. Veuillez choisir 'nvidia' ou 'nvidia-all':" choice
        choice=$(echo "$choice" | tr '[:lower:]' '[:upper:]')
    done

    case "${choice}" in
        "NVIDIA")
            echo -e "|- Installation des paquets Nvidia. ${RED}(long)${RESET}"
            $AUR_HELPER -S --needed --noconfirm nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader >> /dev/null 2>&1
            echo -e "|- Installation de CUDA. ${RED}(très long)${RESET}"
            $AUR_HELPER -S --needed --noconfirm cuda >> /dev/null 2>&1
            ;;

        "NVIDIA-ALL")
            $AUR_HELPER -Rdd --noconfirm egl-wayland >> /dev/null 2>&1
            echo -e "|- Installation de nvidia-all. ${RED}(long)${RESET}"
            git clone https://github.com/Frogging-Family/nvidia-all.git >> /dev/null 2>&1
            cd nvidia-all  || exit
            makepkg -si
            cd .. || exit
            rm -rf nvidia-all >> /dev/null 2>&1
            echo -e "|- Installation de CUDA. ${RED}(très long)${RESET}"
            $AUR_HELPER -S --needed --noconfirm cuda >> /dev/null 2>&1
            ;;

        *)
            echo "Erreur inattendue."
            ;;
    esac
}
