# Setup ZRAM

source src/cmd.sh

function configure_zram() {
    # Ask the user before proceeding
    if ! ask_question "$(eval_gettext "Do you want to configure ZRAM ?")"; then
        log_msg "$(eval_gettext "Skipping ZRAM configuration.")"
        return 0
    fi

    # 1. Install necessary packages
    install_one "zram-generator"

    # 2. Clean old configurations to avoid conflicts
    local -r zram_conf="/etc/systemd/zram-generator.conf"
    local -r udev_rule="/etc/udev/rules.d/99-zram-swappiness.rules"

    if [[ -f "$zram_conf" ]]; then
        exec_log "sudo rm -f $zram_conf" "$(eval_gettext "Removing old zram configuration")"
    fi

    if [[ -f "$udev_rule" ]]; then
        exec_log "sudo rm -f $udev_rule" "$(eval_gettext "Removing old zram udev rule")"
    fi

    # 3. Zram-generator configuration
    # Set zram-size to 'ram' for 100% of RAM capacity
    log_msg "$(eval_gettext "Creating zram-generator configuration")"
    sudo bash -c "cat <<EOF > $zram_conf
[zram0]
compression-algorithm = zstd
zram-size = ram
swap-priority = 100
fs-type = swap
EOF"

    # 4. Udev rule configuration
    # Optimize swappiness and disable zswap to prevent interference with zram
    log_msg "$(eval_gettext "Creating udev rule for zram and swappiness")"
    sudo bash -c "cat <<EOF > $udev_rule
ACTION==\"change\", KERNEL==\"zram0\", ATTR{initstate}==\"1\", SYSCTL{vm.swappiness}=\"150\", \\
    RUN+=\"/bin/sh -c 'echo N > /sys/module/zswap/parameters/enabled'\"
EOF"

    # 5. Apply configuration
    exec_log "sudo systemctl daemon-reload" "$(eval_gettext "Reloading systemd daemon")"
    exec_log "sudo systemctl start /dev/zram0" "$(eval_gettext "Starting zram device")"
}
