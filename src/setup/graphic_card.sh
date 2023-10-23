BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/drivers/nvidia.sh"
source "$BASE_DIR/src/drivers/amd.sh"
source "$BASE_DIR/src/drivers/intel.sh"
source "$BASE_DIR/src/drivers/vm.sh"

# This function installs video drivers based on the user's GPU selection.
# It prompts the user to enter their GPU type (INTEL/AMD/NVIDIA) and installs the corresponding drivers.
# If an invalid GPU type is entered, it displays an error message and asks again.
function install_video_drivers() {
    read -p "What is your graphics card? (INTEL/AMD/NVIDIA/VM):" user_gpu
    user_gpu=$(echo "$user_gpu" | tr '[:lower:]' '[:upper:]')  # Converts the input to uppercase

    while [[ -z "$user_gpu" || ! " INTEL AMD NVIDIA VM " =~ " $user_gpu " ]]; do
        read -p "Invalid graphics card choice. Please enter INTEL, AMD, NVIDIA, or VM:" user_gpu
        user_gpu=$(echo "$user_gpu" | tr '[:lower:]' '[:upper:]')  # Converts the input to uppercase
    done
    
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
            echo "Invalid graphics card choice! ${user_gpu}"
            ;;
    esac

    echo "--------------------------------------------------"
}
