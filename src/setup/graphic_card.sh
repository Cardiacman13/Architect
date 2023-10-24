# Détermine le répertoire de base du script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

# Inclusion des scripts de pilotes graphiques
source "$BASE_DIR/src/drivers/nvidia.sh"
source "$BASE_DIR/src/drivers/amd.sh"
source "$BASE_DIR/src/drivers/intel.sh"
source "$BASE_DIR/src/drivers/vm.sh"

# Cette fonction installe les pilotes vidéo en fonction de la sélection GPU de l'utilisateur.
# Elle demande à l'utilisateur de saisir le type de leur GPU (INTEL/AMD/NVIDIA) et installe les pilotes correspondants.
# Si un type de GPU invalide est saisi, elle affiche un message d'erreur et redemande.
function install_video_drivers() {
    read -p "Quel est le type de votre carte graphique ? (INTEL/AMD/NVIDIA/VM):" user_gpu
    user_gpu=$(echo "$user_gpu" | tr '[:lower:]' '[:upper:]')  # Conversion de la saisie en majuscules

    # Boucle tant que l'entrée de l'utilisateur n'est pas valide
    while [[ -z "$user_gpu" || ! " INTEL AMD NVIDIA VM " =~ " $user_gpu " ]]; do
        read -p "Type de carte graphique invalide. Veuillez saisir INTEL, AMD, NVIDIA ou VM:" user_gpu
        user_gpu=$(echo "$user_gpu" | tr '[:lower:]' '[:upper:]')  # Conversion de la saisie en majuscules
    done
    
    # Installation des pilotes en fonction du choix de l'utilisateur
    case "${user_gpu}" in
        "NVIDIA")
            nvidia_drivers
            ;;
        "AMD")
            amd_drivers
            ;;
        "INTEL")
            intel_drivers
            ;;
        "VM")
            vm_drivers
            ;;
        *)
            echo "Type de carte graphique invalide : ${user_gpu}"
            ;;
    esac

    echo "--------------------------------------------------"
}
