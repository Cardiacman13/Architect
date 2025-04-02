# Load shared functions
source src/cmd.sh

################################################################################
# Bluetooth-related installations
################################################################################
function bluetooth() {
    if ask_question "$(eval_gettext "Do you want to use Bluetooth?")"; then
        local -r inlst="
            bluez
            bluez-plugins
            bluez-utils
        "

        install_lst "${inlst}"

        # Enable the Bluetooth service
        exec_log "sudo systemctl enable bluetooth" "$(eval_gettext "Enabling bluetooth service")"
    fi
}
