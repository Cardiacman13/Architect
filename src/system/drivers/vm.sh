function vm_drivers() {
    local -r install_lst=(
        vulkan-swrast
        lib32-vulkan-swrast
        virtualbox-guest-utils
        spice-vdagent
        qemu-guest-agent
    )

    exec_log "sudo systemctl enable --now vboxservice" "activation of vboxservice"
    exec_log "sudo VBoxClient-all" "activation of VBoxClient-all"
    echo ${install_lst[@]}
}
