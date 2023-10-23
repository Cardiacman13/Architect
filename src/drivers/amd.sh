
# This function installs the necessary drivers for AMD graphics cards.
# It installs mesa, lib32-mesa, vulkan-radeon, lib32-vulkan-radeon, vulkan-icd-loader, lib32-vulkan-icd-loader, vulkan-mesa-layers, and lib32-vulkan-mesa-layers.
function amd_drivers() {
    echo "|- Installation de la carte graphique AMD."
    $AUR_HELPER -S --needed --noconfirm mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader vulkan-mesa-layers lib32-vulkan-mesa-layers >> /dev/null 2>&1
}
