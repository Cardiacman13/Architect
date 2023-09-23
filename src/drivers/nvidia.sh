
function hook() {
    local HOOK_FODLER="/etc/pacman.d/hooks/"
    local HOOK_FILE="nvidia.hook"
    local HOOK_SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)/src/drivers/nvidia.hook"

    sudo mkdir -p "${HOOK_FODLER}"
    if [[ ! -f "${HOOK_FODLER}${HOOK_FILE}" ]]; then
        sudo cp "${HOOK_SRC}" "${HOOK_FODLER}"
    fi
}

function mkinitcpio() {
    local MKINITCPIO_CONF="/etc/mkinitcpio.conf"
    local NEW_MODULES="nvidia nvidia_modeset nvidia_uvm nvidia_drm"

    sudo sed -i "s/MODULES=()/MODULES=(${NEW_MODULES})/" "${MKINITCPIO_CONF}"
}

function bootloaders() {
    if [[ -d "/boot/loader/entries" ]]; then
        local BOOT_LOADER="systemd-boot"
    else
        local BOOT_LOADER="grub"
    fi

    if [[ "${BOOT_LOADER}" == "grub" ]]; then
        local BOOT_LOADER_ENTRIES="/etc/default/grub"

        if grep -q "GRUB_CMDLINE_LINUX_DEFAULT" "$BOOT_LOADER_ENTRIES"; then
            if ! grep -q "nvidia-drm.modeset=1" "$BOOT_LOADER_ENTRIES"; then
                sudo sed -i '/GRUB_CMDLINE_LINUX_DEFAULT/ s/\"$/ nvidia-drm.modeset=1\"/' "$BOOT_LOADER_ENTRIES"
            fi
        fi
        sudo grub-mkconfig -o /boot/grub/grub.cfg
    else
        local BOOT_LOADER_ENTRIES="/boot/loader/entries/*.conf"

        sudo sed -i '/^options root=/ s/$/ nvidia-drm.modeset=1/' "${BOOT_LOADER_ENTRIES}"
    fi
}

function nvidia_drivers() {
    bootloaders && mkinitcpio && hook

    yay -S --needed --noconfirm nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader # cuda
}
