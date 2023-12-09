source src/cmd.sh
source src/system/drivers/nvidia.sh
source src/system/drivers/amd.sh
source src/system/drivers/intel.sh
source src/system/drivers/vm.sh

function video_drivers() {
    local -r valid_gpus="INTEL AMD NVIDIA VM"

    read -rp "What is your graphics card type ? (${valid_gpus}) : " choice
    choice="${choice^^}"
    while [[ ! ${valid_gpus} =~ (^|[[:space:]])"${choice}"($|[[:space:]]) ]]; do
        read -rp "What is your graphics card type ? (${valid_gpus}) : " choice
        choice="${choice^^}"
    done

    echo -e "${GREEN}You chose ${choice}${RESET}"
    case "${choice}" in
    "NVIDIA") nvidia_drivers ;;
    "AMD") amd_drivers ;;
    "INTEL") intel_drivers ;;
    "VM") vm_drivers ;;
    *) echo "Invalid graphics card type : ${choice}" ;;
    esac
}