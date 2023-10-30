source src/cmd.sh

function intel_drivers() {
    local -r install_lst="
        mesa
        lib32-mesa
        vulkan-intel
        lib32-vulkan-intel
        vulkan-icd-loader
        lib32-vulkan-icd-loader
        intel-media-driver
    "

    install_lst "$install_lst"
}
