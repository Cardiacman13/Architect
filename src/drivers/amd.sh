
function amd_drivers() {
    echo "|- Installation carte graphique AMD."
    yay -S --needed --noconfirm mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader >> /dev/null 2>&1
}
