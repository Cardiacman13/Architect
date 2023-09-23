BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/drivers/nvidia.sh"
source "$BASE_DIR/src/drivers/amd.sh"
source "$BASE_DIR/src/drivers/intel.sh"

function install_video_drivers() {
    echo "Détection de la carte graphique..."
    while IFS= read -r video_driver; do
        case "${video_driver}" in
            "NVIDIA")
                nvidia_drivers
                ;;
            "AMD")
                amd_drivers
                ;;
            "Intel")
                intel_drivers
                ;;
            *)
                echo "|- Pas de carte graphique détectée."
                ;;
        esac
    done < <(lspci -vnn | grep VGA | grep -oE 'NVIDIA|AMD|Intel')
    echo "--------------------------------------------------"
}
