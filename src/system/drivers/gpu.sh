source src/cmd.sh
source src/system/drivers/nvidia.sh
source src/system/drivers/amd.sh
source src/system/drivers/intel.sh
source src/system/drivers/vm.sh

function video_drivers() {
    local -r valid_gpus="INTEL AMD NVIDIA VM"

    local choice=""
    while [[ ! ${valid_gpus} =~ ${choice} ]]; do
        read -rp "What is your graphics card type ? (INTEL/AMD/NVIDIA/VM) : " choice
        choice="${choice^^}"
    done

    case "${choice}" in
    "NVIDIA") nvidia_drivers ;;
    "AMD") amd_drivers ;;
    "INTEL") intel_drivers ;;
    "VM") vm_drivers ;;
    *) echo "Invalid graphics card type : ${choice}" ;;
    esac
}
