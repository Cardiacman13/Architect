source src/cmd.sh

function nvidia_config() {
    exec_log "echo -e 'options nvidia NVreg_UsePageAttributeTable=1 NVreg_InitializeSystemMemoryAllocations=0 NVreg_DynamicPowerManagement=0x02' | sudo tee -a /etc/modprobe.d/nvidia.conf" "$(eval_gettext "Setting nvidia power management option")"
    exec_log "echo -e 'options nvidia_drm modeset=1' | sudo tee -a /etc/modprobe.d/nvidia.conf" "$(eval_gettext "Setting nvidia-drm modeset=1 option")"
    #exec_log "sudo sed -i '/^MODULES=(/ s/)$/ nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf" "$(eval_gettext "Setting early loading")"
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
        nvidia-dkms
        nvidia-settings
        nvidia-utils
        opencl-nvidia
        libvdpau
        lib32-libvdpau
        lib32-libvdpau
        lib32-nvidia-utils
        egl-wayland
        dxvk-nvapi-mingw
        libxnvctrl
        lib32-libxnvctrl
        vulkan-icd-loader
        lib32-vulkan-icd-loader
        lib32-opencl-nvidia
        opencl-headers
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
    if ask_question "$(eval_gettext "Do you want to use NVIDIA-ALL \${RED}/!\ caution: if you choose nvidia-all, you'll need to know how to maintain it.\${RESET} ?")"; then
        exec_log "git clone https://github.com/Frogging-Family/nvidia-all.git" "$(eval_gettext "cloning nvidia-all repository")"
        cd nvidia-all || exit
        makepkg -si --noconfirm
        cd .. || exit
        exec_log "rm -rf nvidia-all" "$(eval_gettext "removal of nvidia-all repository")"
    else
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
        "
        install_lst "${inlst}"
    fi

    nvidia_intel

    if ask_question "$(eval_gettext "Do you want to install CUDA (\${RED}say No if unsure\${RESET}) ?")"; then
        install_one "cuda"
    fi

exec_log "sudo systemctl enable nvidia-suspend.service nvidia-hibernate.service nvidia-resume.service" "$(eval_gettext "Enabling nvidia services")"

echo "GTK_USE_PORTAL=1
GBM_BACKEND=nvidia-drm
__GLX_VENDOR_LIBRARY_NAME=nvidia
QT_QPA_PLATFORM=wayland
ELECTRON_OZONE_PLATFORM_HINT=auto" | sudo tee -a /etc/environement

}
