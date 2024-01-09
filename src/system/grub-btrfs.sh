function grub-btrfs() {
    if ask_question "$(eval_gettext "Do you want to install and setup grub-btrfs and timeshift \${RED}say No if unsure\${RESET} /!\  ?")"; then
        install_lst "timeshift grub-btrfs timeshift-autosnap"
        exec_log "sudo systemctl enable cronie.service" "$(eval_gettext "Enable cronie")"
        exec_log "sudo systemctl enable grub-btrfsd" "$(eval_gettext "Enable grub-btrfsd")"
        exec_log "sudo sed -i 's|ExecStart=/usr/bin/grub-btrfsd --syslog /.snapshots|ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto|' /etc/systemd/system/multi-user.target.wants/grub-btrfsd.service" "$(eval_gettext "setup grub-btrfsd for timeshift")"
    fi
}
