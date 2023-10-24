# Fonction pour installer les pilotes nécessaires pour les machines virtuelles.
function vm_drivers() {
    echo "|- Installation des pilotes pour machines virtuelles."

    # Installe les paquets requis pour le support des machines virtuelles.
    $AUR_HELPER -S --needed --noconfirm vulkan-swrast lib32-vulkan-swrast virtualbox-guest-utils spice-vdagent qemu-guest-agent >> /dev/null 2>&1

    # Active et démarre le service VBox pour VirtualBox.
    sudo systemctl enable --now vboxservice >> /dev/null 2>&1

    # Lance tous les services client VirtualBox.
    sudo VBoxClient-all >> /dev/null 2>&1
}
