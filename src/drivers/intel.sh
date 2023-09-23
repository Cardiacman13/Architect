
function intel_drivers() {
    echo "|- Carte graphique Intel détectée."
    yay -S --needed --noconfirm mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader >> /dev/null 2>&1
}
