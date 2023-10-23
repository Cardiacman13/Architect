
# This function installs the necessary drivers for Intel graphics cards.
# It installs mesa, lib32-mesa, vulkan-intel, lib32-vulkan-intel, vulkan-icd-loader, and lib32-vulkan-icd-loader.
function intel_drivers() {
    echo "|- Installation de la carte graphique Intel."
    $AUR_HELPER -S --needed --noconfirm mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader intel-media-driver >> /dev/null 2>&1
}
