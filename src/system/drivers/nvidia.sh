source src/cmd.sh

function nvidia_config() {
    if [ -f /etc/modprobe.d/nvidia.conf ]; then
        exec_log "sudo rm /etc/modprobe.d/nvidia.conf" "$(eval_gettext "Removing existing nvidia.conf file")"
    fi
    exec_log "echo -e 'options nvidia NVreg_UsePageAttributeTable=1 NVreg_InitializeSystemMemoryAllocations=0 NVreg_DynamicPowerManagement=0x02' | sudo tee -a /etc/modprobe.d/nvidia.conf" "$(eval_gettext "Setting nvidia power management option")"
    exec_log "echo -e 'options nvidia_drm modeset=1 nvidia_drm fbdev=1 ' | sudo tee -a /etc/modprobe.d/nvidia.conf" "$(eval_gettext "Setting nvidia-drm modeset=1 nvidia_drm fbdev=1  option")"
    exec_log "sudo sed -i '/^MODULES=(/ s/)$/ nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf" "$(eval_gettext "Setting early loading")"
}

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

function nvidia_drivers() {
    local -r unlst="
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

    uninstall_lst "${unlst}" "$(eval_gettext "Clean old nvidia drivers dependencies")"

    nvidia_config
    local -r inlst="
        nvidia-dkms
        nvidia-utils
        lib32-nvidia-utils
        nvidia-settings
        vulkan-icd-loader
        lib32-vulkan-icd-loader
        egl-wayland
        opencl-nvidia
        lib32-opencl-nvidia
        libvdpau-va-gl
        libvdpau
        libva-nvidia-driver 
    "
    install_lst "${inlst}"

    nvidia_intel

    if ask_question "$(eval_gettext "Do you want to install CUDA (\${RED}say No if unsure\${RESET}) ?")"; then
        install_one "cuda"
    fi

    exec_log "sudo systemctl enable nvidia-suspend.service nvidia-hibernate.service nvidia-resume.service" "$(eval_gettext "Enabling nvidia services")"
}
