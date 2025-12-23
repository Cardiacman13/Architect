# Load shared helper functions
source src/cmd.sh

# enable LAVD scheduler https://sched-ext.com/docs/scheds/rust/scx_lavd
function lavd() {
    # Ask the user if they want to set lavd
    if ask_question "$(eval_gettext "Do you want to install and setup LAVD scheduler for low latency task like gaming \${RED}say No if unsure\${RESET} /!\ ?")"; then

        # 1. Install the required packages: scx-scheds scx-tools
        install_lst "scx-scheds scx-tools"

        # 2. Setup the systemd override directory
        local override_dir="/etc/systemd/system/scx_loader.service.d"
        local override_file="$override_dir/override.conf"

        exec_log "sudo mkdir -p $override_dir" "$(eval_gettext "Creating systemd override directory")"

        # 3. Create the override file to auto-start scx_lavd via D-Bus
        # We use a heredoc to create the content
        cat <<EOF | sudo tee "$override_file" > /dev/null
[Service]
ExecStartPost=/usr/bin/dbus-send --system --print-reply --dest=org.scx.Loader /org/scx/Loader org.scx.Loader.StartScheduler string:scx_lavd uint32:0
EOF
        exec_log "sudo chmod 644 $override_file" "$(eval_gettext "Setting permissions on override file")"

        # 4. Reload systemd daemon to recognize the new override
        exec_log "sudo systemctl daemon-reload" "$(eval_gettext "Reloading systemd daemon")"

        # 5. Enable and Start the service
        # --now performs both enable and start in one command
        exec_log "sudo systemctl enable --now scx_loader.service" "$(eval_gettext "Enable and start scx_loader with LAVD")"

        echo -e "${GREEN}$(eval_gettext "LAVD scheduler has been configured and started successfully.")${RESET}"
    fi
}
