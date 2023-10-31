source src/cmd.sh

function vm_drivers() {
    exec_log "sudo pacman -S --noconfirm --needed virt-what" "installation of virt-what"

    local -r vm="$(sudo virt-what)"

    if [[ ${vm} =~ (^|[[:space:]])virtualbox($|[[:space:]]) ]]; then
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
    fi 

    exec_log "sudo pacman -Rdd --noconfirm virt-what" "uninstallation of virt-what"
}
