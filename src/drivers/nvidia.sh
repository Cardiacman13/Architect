
RED='\033[0;31m'
RESET='\033[0m'

function hook() {
    echo "|- Configuration du hook nvidia"

    local hook_folder="/etc/pacman.d/hooks/"
    local hook_file="nvidia.hook"
    local hook_src="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)/data/nvidia.hook"

    sudo cp "${hook_src}" "${hook_folder}${hook_file}"
}

function mkinitcpio() {
    echo "|- Configuration de mkinitcpio."

    local mkinitcpio_src="/etc/mkinitcpio.conf"

    sudo sed -i '/MODULES=/ s/)/ nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' "${mkinitcpio_src}"
}

function bootloaders() {
    echo "|- Détection du bootloader."

    if [[ -d "/boot/loader/entries" ]]; then
        local boot_loader="systemd-boot"
    else
        local boot_loader="grub"
    fi

    if [[ "${boot_loader}" == "grub" ]]; then
        local boot_loader_src="/etc/default/grub"

        if grep -q "GRUB_CMDLINE_LINUX_DEFAULT" "${boot_loader_src}"; then
            if ! grep -q "nvidia-drm.modeset=1" "${boot_loader_src}"; then
                echo "   |- Ajout de nvidia-drm.modeset=1 dans les options de boot."
                sudo sed -i '/GRUB_CMDLINE_LINUX_DEFAULT/ s/\"$/ nvidia-drm.modeset=1\"/' "${boot_loader_src}"
            fi
        fi
        echo "|- Mise à jour de grub."
        sudo grub-mkconfig -o /boot/grub/grub.cfg >> /dev/null 2>&1
    else
        local boot_loader_src="/boot/loader/entries/*.conf"

        echo "|- Ajout de nvidia-drm.modeset=1 dans les options de boot."
        sudo sed -i '/^options root/ s/$/ nvidia-drm.modeset=1/' ${boot_loader_src}
    fi
}

function nvidia_drivers() {
    echo "|- Installation pilotes NVIDIA."

    bootloaders
    mkinitcpio
    hook

    echo -e "|- Installation des paquets nvidia. ${RED}(très long)${RESET}"
    yay -S --needed --noconfirm nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader cuda >> /dev/null 2>&1
    echo "--------------------------------------------------"
}
