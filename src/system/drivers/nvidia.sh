source src/cmd.sh

function nvidia_config() {
    # hook
    exec_log "sudo mkdir -p /etc/pacman.d/hooks/" "Creating hook folder"
    copy_bak "assets/data" "nvidia.hook" "/etc/pacman.d/hooks" true

    # bootloader
    if [[ ${BOOT_LOADER} == "grub" ]]; then
        exec_log "sudo sed -i '/^GRUB_CMDLINE_LINUX_DEFAULT=/ s/\"$/ nvidia-drm.modeset=1\"/' /etc/default/grub" "GRUB cmdline configuration"
        exec_log "sudo grub-mkconfig -o /boot/grub/grub.cfg" "GRUB update"
    else
        exec_log "sudo sed -i '/^options/ s/$/ nvidia-drm.modeset=1/' /boot/loader/entries/*.conf" "systemd-boot configuration"
    fi
}

function nvidia_drivers() {
    local -r unlst="
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

    uninstall_lst "${unlst}" "Clean old nvidia drivers dependencies"

    read -rp "Do you want to use NVIDIA-ALL ${RED}/!\ caution: if you choose nvidia-all, you'll need to know how to maintain it.${RESET} ? (y/N) : " user_nvidia_all
    user_nvidia_all="${user_nvidia_all^^}"

    nvidia_config
    if [[ ${user_nvidia_all} == "Y" ]]; then
        exec_log "git clone https://github.com/Frogging-Family/nvidia-all.git" "cloning nvidia-all repository"
        cd nvidia-all || exit
        makepkg -si --noconfirm
        cd .. || exit
        exec_log "rm -rf nvidia-all" "removal of nvidia-all repository"

    else
        local -r inlst="
            nvidia-dkms
            nvidia-utils
            lib32-nvidia-utils
            nvidia-settings
            vulkan-icd-loader
            lib32-vulkan-icd-loader
        "
        install_lst "${inlst}"
    fi
}
