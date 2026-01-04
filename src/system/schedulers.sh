# Load shared helper functions
source src/cmd.sh

# enable scheduler https://sched-ext.com/docs/scheds/rust/
function lavd() {
    # Ask the user if they want to optimize for low latency
    if ask_question "$(eval_gettext "Do you want to setup a low-latency scheduler for gaming? \${RED}say No if unsure\${RESET}")"; then

        # 1. Ask about Intel Hybrid Architecture (P+E Cores)
        local sched_name="scx_bpfland"
        local sched_mode="0"

        if ask_question "$(eval_gettext "Do you have an Intel CPU with P-cores and E-cores")"; then
            sched_name="scx_bpfland"
            sched_mode="3"
        fi

        # 2. Install the required packages
        install_lst "scx-scheds scx-tools"

        # 3. Setup the systemd override directory
        local override_dir="/etc/systemd/system/scx_loader.service.d"
        local override_file="$override_dir/override.conf"

        exec_log "sudo mkdir -p $override_dir" "$(eval_gettext "Creating systemd override directory")"

        # 4. Create the override file with dynamic variables
        # Using the selected scheduler and mode (0 for default/LAVD, 3 for Flash latency)
        cat <<EOF | sudo tee "$override_file" > /dev/null
[Service]
ExecStartPost=/usr/bin/dbus-send --system --print-reply --dest=org.scx.Loader /org/scx/Loader org.scx.Loader.StartScheduler string:$sched_name uint32:$sched_mode
EOF
        exec_log "sudo chmod 644 $override_file" "$(eval_gettext "Setting permissions on override file")"

        # 5. Reload systemd daemon
        exec_log "sudo systemctl daemon-reload" "$(eval_gettext "Reloading systemd daemon")"

        # 6. Enable and Start the service
        exec_log "sudo systemctl enable --now scx_loader.service" "$(eval_gettext "Starting $sched_name via scx_loader")"

        echo -e "${GREEN}$(eval_gettext "$sched_name has been configured and started successfully.")${RESET}"
    fi
}
