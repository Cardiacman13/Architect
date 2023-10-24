# Fonction pour installer les pilotes nécessaires pour les cartes graphiques AMD.
function amd_drivers() {
    echo "|- Installation des pilotes pour la carte graphique AMD."

    # Liste des paquets à installer pour le support des cartes graphiques AMD
    local amd_packages=(
        mesa
        lib32-mesa
        vulkan-radeon
        lib32-vulkan-radeon
        vulkan-icd-loader
        lib32-vulkan-icd-loader
        vulkan-mesa-layers
        lib32-vulkan-mesa-layers
    )

    # Installation de chaque paquet de la liste
    for package in "${amd_packages[@]}"; do
        echo "|- Installation du paquet ${package}."
        $AUR_HELPER -S --needed --noconfirm "${package}" >> /dev/null 2>&1
    done

    echo "|- Les pilotes AMD ont été installés avec succès."
}
