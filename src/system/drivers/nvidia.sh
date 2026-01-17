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
    local conf_file="/etc/modprobe.d/nvidia.conf"
    local options="options nvidia NVreg_UsePageAttributeTable=1 NVreg_InitializeSystemMemoryAllocations=0 NVreg_RegistryDwords=RmEnableAggressiveVblank=1"

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
Target = nvidia-550xx-dkms
Target = nvidia-550xx-utils

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

# Remove all to start clean
function nvidia_drivers() {
    local -r unlst="
        nvidia-dkms
        nvidia-open
        nvidia-open-dkms
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

    # Detect GPU Architecture
    if ! lspci -v | grep -Ei "VGA|3D" | grep -qi "NVIDIA"; then
        log "$(eval_gettext "No NVIDIA GPU detected. Skipping.")"
        return
    fi

    local is_legacy=false
    if lspci | grep -qiE "GeForce (GTX (4|5|6|7|9|10)|GT (4|5|6|7|10))"; then
        is_legacy=true
    fi

    local inlst
    if [[ "$is_legacy" == true ]]; then
        log "$(eval_gettext "Legacy NVIDIA GPU detected. Installing 550xx drivers.")"
        inlst="
            nvidia-550xx-dkms
            nvidia-550xx-utils
            lib32-nvidia-550xx-utils
            nvidia-550xx-settings
            opencl-nvidia-550xx
            lib32-opencl-nvidia-550xx
            vulkan-icd-loader
            lib32-vulkan-icd-loader
            egl-wayland
            libva-nvidia-driver
        "
    else
        log "$(eval_gettext "Modern NVIDIA GPU detected. Installing Open-DKMS drivers.")"
        inlst="
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
    fi

    install_lst "${inlst}"

    nvidia_earlyloading
    nvidia_optimization
    nvidia_hook
    nvidia_intel

    if ask_question "$(eval_gettext "Do you want to install CUDA ?")"; then
        install_one "cuda"
    fi

    exec_log "sudo systemctl enable nvidia-suspend.service nvidia-hibernate.service nvidia-resume.service" \
        "$(eval_gettext "Enabling NVIDIA suspend/resume services")"

    local device_type
    device_type="$(cat /sys/devices/virtual/dmi/id/chassis_type)"
    if ((device_type >= 8 && device_type <= 11)); then
        if ! lspci -d "10de:*:030x" -vm | grep -q 'Device:\s*TU'; then
            exec_log "sudo systemctl enable nvidia-powerd.service" \
                "$(eval_gettext "Enabling NVIDIA PowerD for supported laptop GPU")"
        fi
    fi

    exec_log "sudo mkinitcpio -P" "$(eval_gettext "Regenerating initramfs images")"
}
