source src/cmd.sh
source src/system/drivers/nvidia.sh
source src/system/drivers/amd.sh
source src/system/drivers/intel.sh
source src/system/drivers/vm.sh

function video_drivers() {
    local -r valid_gpus="INTEL AMD NVIDIA VM"

    read -rp "$(eval_gettext "What is your graphics card type ?") (${valid_gpus}) : " choice
    choice="${choice^^}"
    while [[ ! ${valid_gpus} =~ (^|[[:space:]])"${choice}"($|[[:space:]]) ]]; do
        read -rp "$(eval_gettext "What is your graphics card type ?") (${valid_gpus}) : " choice
        choice="${choice^^}"
    done

    eval_gettext "\${GREEN}You chose \${choice}\${RESET}"; echo
    case "${choice}" in
    "NVIDIA") nvidia_drivers ;;
    "AMD") amd_drivers ;;
    "INTEL") intel_drivers ;;
    "VM") vm_drivers ;;
    *) echo "Invalid graphics card type : ${choice}" ;;
    esac
}