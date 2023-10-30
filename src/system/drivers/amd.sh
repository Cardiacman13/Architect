source src/cmd.sh

function amd_drivers() {
    local -r install_lst="
        mesa
        lib32-mesa
        vulkan-radeon
        lib32-vulkan-radeon
        vulkan-icd-loader
        lib32-vulkan-icd-loader
        vulkan-mesa-layers
        lib32-vulkan-mesa-layers"

    install_lst "$install_lst"
}
