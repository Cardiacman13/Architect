source src/cmd.sh
source src/system/drivers/nvidia.sh
source src/system/drivers/amd.sh
source src/system/drivers/intel.sh
source src/system/drivers/vm.sh

function video_drivers() {
    local -r valid_gpus="INTEL AMD NVIDIA VM"
    local packages=()
    local choice=""

    while [[ ! ${valid_gpus} =~ ${choice} ]]; do
        read -rp "What is your graphics card type ? (INTEL/AMD/NVIDIA/VM) : " choice
        choice="${choice^^}"
    done

    case "${choice}" in
    "NVIDIA") packages=nvidia_drivers ;;
    "AMD") packages=amd_drivers ;;
    "INTEL") packages=intel_drivers ;;
    "VM") packages=vm_drivers ;;
    *) echo "Invalid graphics card type : ${choice}" ;;
    esac

    if [[ -z "${packages[*]}" ]]; then
        return
    fi

    for package in "${packages[@]}"; do
        exec_log "${AUR} -S --noconfirm --needed ${package}" "installing ${package}"
    done
}
