BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/drivers/nvidia.sh"
source "$BASE_DIR/src/drivers/amd.sh"
source "$BASE_DIR/src/drivers/intel.sh"

function install_video_drivers() {
    while IFS= read -r video_driver; do
        case "${video_driver}" in
            "NVIDIA")
                echo "Carte graphique NVIDIA détectée."
                nvidia_drivers
                ;;
            "AMD")
                echo "Carte graphique AMD détectée."
                amd_drivers
                ;;
            "Intel")
                echo "Carte graphique Intel détectée."
                intel_drivers
                ;;
            *)
                echo "Pas de carte graphique détectée."
                ;;
        esac
    done < <(lspci -vnn | grep VGA | grep -oE 'NVIDIA|AMD|Intel')
}
