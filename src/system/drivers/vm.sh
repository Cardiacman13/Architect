source src/cmd.sh

function vm_drivers() {
    local -r inlst="
        vulkan-swrast
        lib32-vulkan-swrast
        virtualbox-guest-utils
        spice-vdagent
        qemu-guest-agent
    "

    install_lst "${inlst}"
    exec_log "sudo systemctl enable --now vboxservice" "activation of vboxservice"
    exec_log "sudo VBoxClient-all" "activation of VBoxClient-all"
}
