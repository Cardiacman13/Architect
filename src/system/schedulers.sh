# Load shared helper functions
source src/cmd.sh

# Enable sched-ext scheduler via scx_loader + /etc/scx_loader.toml
function scx() {
    if ask_question "$(eval_gettext "Do you want to setup a low-latency scheduler for gaming? \${RED}say No if unsure\${RESET}")"; then

        # 1) Install required packages
        install_lst "scx-scheds scx-tools"

        # 2) Enable and start scx_loader (right after install)
        exec_log "sudo systemctl enable --now scx_loader.service" \
            "$(eval_gettext "Enabling and starting scx_loader.service")"

        # 3) Write /etc/scx_loader.toml (Cosmos + LowLatency)
        local conf="/etc/scx_loader.toml"

        cat <<'EOF' | sudo tee "$conf" > /dev/null
default_sched = "scx_cosmos"
default_mode = "LowLatency"
EOF

        # 4) Restart service to apply the config
        exec_log "sudo systemctl restart scx_loader.service" \
            "$(eval_gettext "Restarting scx_loader.service to apply /etc/scx_loader.toml")"

        echo -e "${GREEN}$(eval_gettext "scx_cosmos has been configured in LowLatency mode and applied successfully.")${RESET}"
    fi
}
