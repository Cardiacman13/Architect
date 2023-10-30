source src/cmd.sh
source src/system/drivers/nvidia.sh
source src/system/drivers/amd.sh
source src/system/drivers/intel.sh
source src/system/drivers/vm.sh

function video_drivers() {
    local user_gpu
    local -r valid_gpus="INTEL AMD NVIDIA VM"
    local packages=()

    while :; do
        read -rp "What type of graphics card do you use ? (INTEL/AMD/NVIDIA/VM) : " user_gpu
        user_gpu="${user_gpu^^}"
        
        if [[ " ${valid_gpus} " =~ " ${user_gpu} " ]]; then
            break
        else
            echo "Invalid graphics card type. Please enter INTEL, AMD, NVIDIA, or VM."
        fi
    done

    case "$user_gpu" in
        "NVIDIA") packages=nvidia_drivers ;;
        "AMD")    packages=amd_drivers ;;
        "INTEL")  packages=intel_drivers ;;
        "VM")     packages=vm_drivers ;;
        *)        echo "Invalid graphics card type : ${user_gpu}" ;;
    esac

    if [[ -z "${packages[*]}" ]]; then
        return
    fi

    for package in "${packages[@]}"; do
        exec_log "${AUR} -S --noconfirm --needed ${package}" "installation of ${package}"
    done
}
