BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/drivers/nvidia.sh"
source "$BASE_DIR/src/drivers/amd.sh"
source "$BASE_DIR/src/drivers/intel.sh"

function install_video_drivers() {
    read -p "Quel est votre GPU ? (INTEL/AMD/NVIDIA) " user_gpu
    
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
        *)
            echo "Invalid GPU choice: ${user_gpu}"
            ;;
    esac

    echo "--------------------------------------------------"
}
