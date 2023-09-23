
function hook() {
    echo "|- Configuration du hook nvidia"

    local HOOK_FODLER="/etc/pacman.d/hooks/"
    local HOOK_FILE="nvidia.hook"
    local HOOK_SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)/data/nvidia.hook"

    sudo mkdir -p "${HOOK_FODLER}"
    sudo cp "${HOOK_SRC}" "${HOOK_FODLER}${HOOK_FILE}"
}

function mkinitcpio() {
    echo "   |- Configuration de mkinitcpio."

    local MKINITCPIO_CONF="/etc/mkinitcpio.conf"

    sudo sed -i '/MODULES=/ s/)/ nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' "$MKINITCPIO_CONF"
}

function bootloaders() {
    echo "   |- Détection du bootloader."

    if [[ -d "/boot/loader/entries" ]]; then
        local BOOT_LOADER="systemd-boot"
    else
        local BOOT_LOADER="grub"
    fi

    if [[ "${BOOT_LOADER}" == "grub" ]]; then
        local BOOT_LOADER_ENTRIES="/etc/default/grub"

        if grep -q "GRUB_CMDLINE_LINUX_DEFAULT" "$BOOT_LOADER_ENTRIES"; then
            if ! grep -q "nvidia-drm.modeset=1" "$BOOT_LOADER_ENTRIES"; then
                echo "   |- Ajout de nvidia-drm.modeset=1 dans les options de boot."
                sudo sed -i '/GRUB_CMDLINE_LINUX_DEFAULT/ s/\"$/ nvidia-drm.modeset=1\"/' "$BOOT_LOADER_ENTRIES"
            fi
        fi
        echo "   |- Mise à jour de grub."
        sudo grub-mkconfig -o /boot/grub/grub.cfg >> /dev/null 2>&1
    else
        local BOOT_LOADER_ENTRIES="/boot/loader/entries/*.conf"

        echo "   |- Ajout de nvidia-drm.modeset=1 dans les options de boot."
        sudo sed -i '/^options root/ s/$/ nvidia-drm.modeset=1/' $BOOT_LOADER_ENTRIES
    fi
}

function nvidia_drivers() {
    echo "|- Carte graphique NVIDIA détectée."
    bootloaders
    mkinitcpio
    hook

    echo "   |- Installation des paquets nvidia"
    yay -S --needed --noconfirm nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader cuda >> /dev/null 2>&1
    echo "--------------------------------------------------"
}
