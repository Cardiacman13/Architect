source src/cmd.sh

function amd_drivers() {
    local inlst="
        mesa
        lib32-mesa
        vulkan-radeon
        lib32-vulkan-radeon
        vulkan-icd-loader
        lib32-vulkan-icd-loader
        vulkan-mesa-layers
        lib32-vulkan-mesa-layers
        libva-mesa-driver
        lib32-libva-mesa-driver
        mesa-vdpau
        lib32-mesa-vdpau
    "

    read -rp "Would you like to install ROCM (${RED}say No if unsure${RESET}) (y/N) : " choice
    choice="${choice,,}"

    if [[ $choice =~ ^(yes|y)$ ]]; then
        inlst="${inlst} rocm-opencl-runtime rocm-hip-runtime"
    fi

    install_lst "${inlst}"
}
