function grub-btrfs() {
    read -rp "Do you want to install and setup grub-btrfs ${RED}say No if unsure${RESET} /!\  ? (y/N) : " choice
    choice="${choice,,}"

    if [[ $choice =~ ^(yes|y)$ ]]; then
        install_lst "snapper snapper-support snap-pac grub-btrfs "
        exec_log "sudo umount /.snapshots"
        exec_log "sudo rm -r /.snapshots"
        exec_log "sudo snapper -c root create-config /"
        exec_log "sudo systemctl enable --now grub-btrfsd"
    fi
}
