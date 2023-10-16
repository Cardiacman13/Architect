# This function installs the necessary drivers for Virtual Machine.
function vm_drivers() {
    echo "|- Installation des pilotes pour machines virtuelles."
    yay -S --needed --noconfirm vulkan-swrast lib32-vulkan-swrast virtualbox-guest-utils spice-vdagent qemu-guest-agent >> /dev/null 2>&1
    sudo systemctl enable --now vboxservice >> /dev/null 2>&1
    sudo VBoxClient-all >> /dev/null 2>&1
}
