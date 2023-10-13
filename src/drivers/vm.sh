# This function installs the necessary drivers for Virtual Machine.
function vm_drivers() {
    echo "|- Installation pilotes pour machines virtuelles."
    yay -S --needed --noconfirm vulkan-swrast lib32-vulkan-swrast virtualbox-guest-utils >> /dev/null 2>&1
    sudo systemctl enable --now vboxservice >> /dev/null 2>&1
    sudo VBoxClient-all >> /dev/null 2>&1
}
