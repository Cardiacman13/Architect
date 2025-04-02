# Load shared helper functions
source src/cmd.sh

# Function to detect the VM type and install appropriate drivers/tools
function vm_drivers() {
    # Install virt-what to detect the virtualization environment
    install_one "virt-what"

    # Use virt-what to get the VM type
    local -r vm="$(sudo virt-what)"

    # Install generic software rendering and Vulkan support for VMs
    local -r inlst_all="
        vulkan-swrast
        lib32-vulkan-swrast
        vulkan-icd-loader
        lib32-vulkan-icd-loader
    "
    install_lst "${inlst_all}"

    # If running under VirtualBox, install VirtualBox guest utilities
    if [[ ${vm} =~ (^|[[:space:]])virtualbox($|[[:space:]]) ]]; then
        local -r inlst="
            virtualbox-guest-utils
        "
        install_lst "${inlst}"

        # Enable VirtualBox guest service
        exec_log "sudo systemctl enable vboxservice" "$(eval_gettext "activation of vboxservice")"

        # Start VirtualBox client tools for resolution/sync
        exec_log "sudo VBoxClient-all" "$(eval_gettext "activation of VBoxClient-all")"

    # Otherwise, assume QEMU or similar and install its agents
    else
        local -r inlst="
            spice-vdagent
            qemu-guest-agent
        "
        install_lst "${inlst}"
    fi

    # Remove virt-what after use to keep the system clean
    uninstall_one "virt-what"
}
