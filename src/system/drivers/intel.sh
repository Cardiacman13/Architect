source src/cmd.sh

function intel_drivers() {
    local -r inlst="
        mesa
        lib32-mesa
        vulkan-intel
        lib32-vulkan-intel
        vulkan-icd-loader
        lib32-vulkan-icd-loader
        intel-media-driver
        intel-gmmlib
        onevpl-intel-gpu
        vulkan-mesa-layers
        libva-mesa-driver
        lib32-libva-mesa-driver
    "

    install_lst "${inlst}"
}
