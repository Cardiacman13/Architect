source src/cmd.sh

function nvidia_config() {
    # hook
    exec_log "sudo mkdir -p /etc/pacman.d/hooks/" "Hook folder creation"
    exec_log "sudo cp assets/data/nvidia.hook /etc/pacman.d/hooks/nvidia.hook" "Hook file copy"

    # mkinitcpio
    exec_log "sudo sed -i '/MODULES=/ s/)/ nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' '/etc/mkinitcpio.conf'" "mkinitcpio configuration"

    # bootloader
    if [[ ${BOOT_LOADER} == "grub" ]]; then
        exec_log "sudo sed -i '/GRUB_CMDLINE_LINUX_DEFAULT/ s/\"$/ nvidia-drm.modeset=1\"/' '/etc/default/grub'" "GRUB_CMDLINE_LINUX_DEFAULT configuration"
        exec_log "sudo grub-mkconfig -o /boot/grub/grub.cfg" "GRUB update"
    else
        exec_log "sudo sed -i '/^options/ s/$/ nvidia-drm.modeset=1/' '/boot/loader/entries/*.conf'" "systemd-boot configuration"
    fi
}

function nvidia_drivers() {
    local -r remove_lst=(
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
    )

    for package in ${remove_lst[@]}; do
        exec_log "sudo pacman -Rdd --noconfirm ${package}" "removal of ${package}"
    done

    read -rp "Do you want to use NVIDIA-ALL ? (y/N) : " user_nvidia_all
    user_nvidia_all="${user_nvidia_all,,}"

    if [[ ${user_nvidia_all} == "y" ]]; then
        exec_log "git clone https://github.com/Frogging-Family/nvidia-all.git" "cloning of nvidia-all repository"
        cd nvidia-all || exit
        exec_log "makepkg -si --noconfirm" "installation of nvidia-all"
        cd .. || exit
        exec_log "rm -rf nvidia-all" "removal of nvidia-all repository"
        exec_log "${AUR} -S --noconfirm --needed cuda" "installation of cuda"

    else
        local -r install_lst=(
            nvidia-dkms
            nvidia-utils
            lib32-nvidia-utils
            nvidia-settings
            vulkan-icd-loader
            lib32-vulkan-icd-loader
            cuda
        )
        nvidia_config
    fi
    
    # systemctl
    exec_log "sudo systemctl enable nvidia-{hibernate,resume,suspend}" "activation of nvidia-{hibernate,resume,suspend}"
    echo ${install_lst[@]}
}
