function grub-btrfs() {
    read -rp "Do you want to install and setup grub-btrfs and timeshift ${RED}say No if unsure${RESET} /!\  ? (y/N) : " choice
    choice="${choice,,}"

    if [[ $choice =~ ^(yes|y)$ ]]; then
        install_lst "timeshift grub-btrfs timeshift-autosnap"
        exec_log "sudo systemctl enable --now cronie.service" "Enable cronie"
        exec_log "sudo systemctl enable --now grub-btrfsd" "Enable grub-btrfsd"
        exec_log "sudo sed -i 's|ExecStart=/usr/bin/grub-btrfsd --syslog /.snapshots|ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto|' /usr/lib/systemd/system/grub-btrfsd.service" "setup grub-btrfsd for timeshift"
    fi
}
