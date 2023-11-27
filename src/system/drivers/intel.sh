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
        intel-media-driver
        onevpl-intel-gpu
        gstreamer-vaapi
        libva-mesa-driver
        lib32-libva-mesa-driver
        mesa-vdpau
        lib32-mesa-vdpau
    "

    install_lst "${inlst}"
}
