BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/drivers/nvidia.sh"
source "$BASE_DIR/src/drivers/amd.sh"
source "$BASE_DIR/src/drivers/intel.sh"

function install_video_drivers() {
    while IFS= read -r video_driver; do
        case "${video_driver}" in
            "NVIDIA")
                echo "Carte graphique NVIDIA détectée."
                install_nvidia
                ;;
            "AMD")
                echo "Carte graphique AMD détectée."
                install_amd
                ;;
            "Intel")
                echo "Carte graphique Intel détectée."
                install_intel
                ;;
            *)
                echo "Pas de carte graphique détectée."
                ;;
        esac
    done < <(lspci -vnn | grep VGA | grep -oE 'NVIDIA|AMD|Intel')
}
