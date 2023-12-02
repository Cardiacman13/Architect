source src/cmd.sh

function nvidia_config() {
    exec_log "echo -e 'options nvidia-drm modeset=1' | sudo tee -a /etc/modprobe.d/nvidia.conf" "Setting nvidia-drm modeset=1 option"
}

function nvidia_intel() {
    read -rp "Do you have an Intel/Nvidia Laptop (y/N) : " user_intel
    user_intel="${user_intel,,}"

    if [[ ${user_intel} =~ ^(yes|y)$ ]]; then
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
            egl-wayland
            opencl-nvidia
            lib32-opencl-nvidia
        "
        install_lst "${inlst}"
    fi

    nvidia_intel
    read -rp "Do you want to install CUDA (${RED}say No if unsure${RESET}) (y/N) : " user_cuda
    user_cuda="${user_cuda,,}"

    if [[ ${user_cuda} =~ ^(yes|y)$ ]]; then
        install_one "cuda"
    fi
}
