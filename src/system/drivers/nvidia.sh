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

    # Remove existing file to ensure a clean configuration
    if [[ -f "$conf_file" ]]; then
        exec_log "sudo rm -f $conf_file" "$(eval_gettext "Removing old NVIDIA optimization file")"
    fi

    exec_log "echo '$options' | sudo tee $conf_file" \
    "$(eval_gettext "Applying NVIDIA Kernel optimizations (PAT, Vblank, Memory)")"
}

# Create a pacman hook to rebuild initramfs on driver updates
function nvidia_hook() {
    local hook_dir="/etc/pacman.d/hooks"
    local hook_file="${hook_dir}/nvidia.hook"

    exec_log "sudo mkdir -p $hook_dir" "$(eval_gettext "Creating pacman hooks directory")"

    local hook_content="[Trigger]
Operation = Install
Operation = Upgrade
Operation = Remove
Type = Package
Target = nvidia-open-dkms
Target = nvidia-utils

[Action]
Description = Update NVIDIA module in initcpio
Depends = mkinitcpio
When = PostTransaction
NeedsTargets
Exec = /usr/bin/mkinitcpio -P"

    exec_log "echo '$hook_content' | sudo tee $hook_file" \
    "$(eval_gettext "Creating NVIDIA pacman hook")"
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

    # Configurations and Optimizations
    nvidia_earlyloading
    nvidia_optimization
    nvidia_hook

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
        if ! lspci -d "10de:*:030x" -vm | grep -q 'Device:\s*TU'; then
            exec_log "sudo systemctl enable nvidia-powerd.service" \
                "$(eval_gettext "Enabling NVIDIA PowerD for supported laptop GPU")"
        fi
    fi

    # Final rebuild of initramfs to apply early loading
    exec_log "sudo mkinitcpio -P" "$(eval_gettext "Regenerating initramfs images")"
}
