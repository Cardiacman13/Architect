# Déterminer le répertoire de base du script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

# Inclure les scripts des pilotes graphiques
source "$BASE_DIR/src/drivers/nvidia.sh"
source "$BASE_DIR/src/drivers/amd.sh"
source "$BASE_DIR/src/drivers/intel.sh"
source "$BASE_DIR/src/drivers/vm.sh"

function install_video_drivers() {
    local user_gpu valid_gpus
    valid_gpus="INTEL AMD NVIDIA VM"

    # Demander à l'utilisateur d'entrer le type de son GPU
    read -rp "Quel est le type de votre carte graphique ? (INTEL/AMD/NVIDIA/VM) : " user_gpu
    user_gpu=$(echo "$user_gpu" | tr '[:lower:]' '[:upper:]')  # Convertir l'entrée en majuscules

    # Boucler jusqu'à ce que l'utilisateur entre un type de GPU valide
    until [[ "$valid_gpus" =~ $user_gpu && -n "$user_gpu" ]]; do
        read -rp "Type de carte graphique invalide. Veuillez entrer INTEL, AMD, NVIDIA, ou VM : " user_gpu
        user_gpu=$(echo "$user_gpu" | tr '[:lower:]' '[:upper:]')  # Convertir l'entrée en majuscules
    done

    # Installer les pilotes en fonction du choix de l'utilisateur
    case "$user_gpu" in
        "NVIDIA") nvidia_drivers ;;
        "AMD")    amd_drivers ;;
        "INTEL")  intel_drivers ;;
        "VM")     vm_drivers ;;
        *)        echo "Type de carte graphique invalide : ${user_gpu}" ;;
    esac

    echo "--------------------------------------------------"
}
