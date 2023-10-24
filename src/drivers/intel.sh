# Fonction pour installer les pilotes nécessaires pour les cartes graphiques Intel.
function intel_drivers() {
    echo "|- Installation des pilotes pour la carte graphique Intel."

    # Liste des paquets à installer pour le support des cartes graphiques Intel
    local intel_packages=(
        mesa
        lib32-mesa
        vulkan-intel
        lib32-vulkan-intel
        vulkan-icd-loader
        lib32-vulkan-icd-loader
        intel-media-driver
    )

    # Installation de chaque paquet de la liste
    for package in "${intel_packages[@]}"; do
        echo "|- Installation du paquet ${package}."
        $AUR_HELPER -S --needed --noconfirm "${package}" >> /dev/null 2>&1
    done

    echo "|- Les pilotes Intel ont été installés avec succès."
}
