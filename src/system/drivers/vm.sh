source src/cmd.sh

function vm_drivers() {
    install_one "virt-what"

    local -r vm="$(sudo virt-what)"

    local -r inlst_all="
        vulkan-swrast
        lib32-vulkan-swrast
    "

    install_lst "${inlst_all}"

    if [[ ${vm} =~ (^|[[:space:]])virtualbox($|[[:space:]]) ]]; then
        local -r inlst="
            virtualbox-guest-utils
        "

        install_lst "${inlst}"
        exec_log "sudo systemctl enable --now vboxservice" "activation of vboxservice"
        exec_log "sudo VBoxClient-all" "activation of VBoxClient-all"
    else
        local -r inlst="
            spice-vdagent
            qemu-guest-agent
        "

        install_lst "${inlst}"
    fi

    uninstall_one "virt-what"
}
