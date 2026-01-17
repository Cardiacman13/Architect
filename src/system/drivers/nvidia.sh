source src/cmd.sh

# Ensure early loading of NVIDIA modules in initramfs
function nvidia_earlyloading () {
    if ! grep -q 'nvidia_drm' /etc/mkinitcpio.conf; then
        exec_log "sudo sed -i 's/^MODULES=(/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm /' /etc/mkinitcpio.conf" \
        "$(eval_gettext "Adding NVIDIA modules to mkinitcpio.conf")"
    else
        log "$(eval_gettext "NVIDIA modules already present in mkinitcpio.conf")"
    fi
}

# Optimization of NVIDIA kernel parameters
function nvidia_optimization() {
    local conf_file="/etc/modprobe.d/nvidia-optimizations.conf"
    local options="options nvidia NVreg_UsePageAttributeTable=1 NVreg_InitializeSystemMemoryAllocations=0 NVreg_RegistryDwords=RmEnableAggressiveVblank=1"

    # Supprime le fichier s'il existe déjà pour garantir une configuration propre
    if [[ -f "$conf_file" ]]; then
        exec_log "sudo rm -f $conf_file" "$(eval_gettext "Removing old NVIDIA optimization file")"
    fi

    exec_log "echo '$options' | sudo tee $conf_file" \
    "$(eval_gettext "Applying NVIDIA Kernel optimizations (PAT, Vblank, Memory)")"
}

# Optional installation of Intel GPU drivers for hybrid laptops
function nvidia_intel() {
    if ask_question "$(eval_gettext "Do you have an Intel/Nvidia Laptop ?")"; then
        local -r inlst="
            intel-media-driver
            intel-gmmlib
            onevpl-intel-gpu
        "
        install_lst "${inlst}"
    fi
}

# Main function to uninstall legacy NVIDIA drivers and install the correct set
function nvidia_drivers() {
    local -r unlst="
        nvidia-dkms
        nvidia
        nvidia-lts
        dxvk-nvapi-mingw
        lib32-nvidia-dev-utils-tkg
        lib32-opencl-nvidia-dev-tkg
        nvidia-dev-dkms-tkg
        nvidia-dev-egl-wayland-tkg
        nvidia-dev-settings-tkg
        nvidia-dev-utils-tkg
        opencl-nvidia-dev-tkg
    "

    uninstall_lst "${unlst}" "$(eval_gettext "Clean old NVIDIA driver dependencies")"

    # Install required NVIDIA packages
    local -r inlst="
        nvidia-open-dkms
        nvidia-utils
        lib32-nvidia-utils
        nvidia-settings
        vulkan-icd-loader
        lib32-vulkan-icd-loader
        egl-wayland
        opencl-nvidia
        lib32-opencl-nvidia
        libva-nvidia-driver
    "
    install_lst "${inlst}"

    # call early loading NVIDIA fonction and optimization
    nvidia_earlyloading
    nvidia_optimization

    # Optional Intel GPU driver installation for hybrid laptops
    nvidia_intel

    # Optional CUDA installation
    if ask_question "$(eval_gettext "Do you want to install CUDA (${RED}say No if unsure${RESET}) ?")"; then
        install_one "cuda"
    fi

    # Enable NVIDIA suspend/resume services
    exec_log "sudo systemctl enable nvidia-suspend.service nvidia-hibernate.service nvidia-resume.service" \
        "$(eval_gettext "Enabling NVIDIA suspend/resume services")"

    # Conditionally enable nvidia-powerd if on laptop and GPU is not Turing
    local device_type
    device_type="$(cat /sys/devices/virtual/dmi/id/chassis_type)"
    if ((device_type >= 8 && device_type <= 11)); then
        # Check for Turing GPUs (Device name starts with "TU")
        if ! lspci -d "10de:*:030x" -vm | grep -q 'Device:\s*TU'; then
            exec_log "sudo systemctl enable nvidia-powerd.service" \
                "$(eval_gettext "Enabling NVIDIA PowerD for supported laptop GPU")"
        else
            log "$(eval_gettext "NVIDIA PowerD is not supported on Turing GPUs")"
        fi
    else
        log "$(eval_gettext "Not a laptop chassis; skipping NVIDIA PowerD")"
    fi
}
