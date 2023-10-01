BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/drivers/nvidia.sh"
source "$BASE_DIR/src/drivers/amd.sh"
source "$BASE_DIR/src/drivers/intel.sh"

# This function installs video drivers based on the user's GPU selection.
# It prompts the user to enter their GPU type (INTEL/AMD/NVIDIA) and installs the corresponding drivers.
# If an invalid GPU type is entered, it displays an error message.
function install_video_drivers() {
    read -p "Quel est votre GPU ? (INTEL/AMD/NVIDIA) : " user_gpu
    
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
            echo "Choix de GPU invalide ! ${user_gpu}"
            ;;
    esac

    echo "--------------------------------------------------"
}
