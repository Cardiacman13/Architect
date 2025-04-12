# Load shared functions
source src/cmd.sh

################################################################################
# Gamepad-related installations
################################################################################
function gamepad() {
    if ask_question "$(eval_gettext "Would you want to install xpadneo? (Can improve Xbox gamepad support. \${RED}Say No if unsure.\${RESET})")"; then
        install_one "xpadneo-dkms-git"
    fi

    if ask_question "$(eval_gettext "Would you want to install Xone? (Can improve Xbox gamepad support with a USB wireless dongle. \${RED}Say No if unsure.\${RESET})")"; then
        local -r inlst="
            xone-dkms-git
            xone-dongle-firmware
        "
        install_lst "${inlst}"
    fi

    if ask_question "$(eval_gettext "Do you want to use PS5 controllers?")"; then
        install_one "dualsensectl-git"
    fi
}
