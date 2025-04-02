# Load shared helper functions
source src/cmd.sh

# Configure GRUB-Btrfs integration with Timeshift
function grub-btrfs() {
    # Ask the user if they want to set up Timeshift and GRUB-Btrfs
    if ask_question "$(eval_gettext "Do you want to install and setup grub-btrfs and timeshift \${RED}say No if unsure\${RESET} /!\  ?")"; then
        
        # Install the required packages: Timeshift, Grub-Btrfs, and Timeshift autosnap
        install_lst "timeshift grub-btrfs timeshift-autosnap"

        # Enable cronie, needed for scheduled tasks like Timeshift autosnap
        exec_log "sudo systemctl enable cronie.service" "$(eval_gettext "Enable cronie")"

        # Enable the grub-btrfsd daemon, which generates GRUB entries for Timeshift snapshots
        exec_log "sudo systemctl enable grub-btrfsd" "$(eval_gettext "Enable grub-btrfsd")"

        # Modify the grub-btrfsd systemd unit to use Timeshift's snapshot directory automatically
        exec_log "sudo sed -i 's|ExecStart=/usr/bin/grub-btrfsd --syslog /.snapshots|ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto|' /etc/systemd/system/multi-user.target.wants/grub-btrfsd.service" "$(eval_gettext "setup grub-btrfsd for timeshift")"
    fi
}
