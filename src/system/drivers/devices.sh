source src/cmd.sh

function gamepad() {
    if ask_question "$(eval_gettext "Would you want to install xpadneo ? (Can improve xbox gamepad support, \${RED}say No if unsure\${RESET})")"; then
        install_one "xpadneo-dkms-git"
    fi

    if ask_question "$(eval_gettext "Would you want to install xone ? (For Xbox controler Bluetooth USB Dongle, \${RED}say No if unsure\${RESET})")"; then
        install_one "xone-dkms-git"
    fi

    if ask_question "$(eval_gettext "Do you want to use PS5 controllers ?")"; then
        install_one "dualsensectl-git"
    fi
}

function printer() {
    if ask_question "$(eval_gettext "Do you want to use a printer ?")"; then
        local inlst="
            ghostscript
            gsfonts
            cups
            cups-filters
            cups-pdf
            system-config-printer
            avahi
            foomatic-db-engine
            foomatic-db
            foomatic-db-ppds
            foomatic-db-nonfree
            foomatic-db-nonfree-ppds
            gutenprint
            foomatic-db-gutenprint-ppds
        "

        if ask_question "$(eval_gettext "Do you want to use a EPSON printer ?")"; then
            inlst+="
                epson-inkjet-printer-escpr
                epson-inkjet-printer-escpr2
            "
        fi

        if ask_question "$(eval_gettext "Do you want to use a HP printer ?")"; then
            inlst+="
                hplip
                python-pyqt5
            "
        fi

        install_lst "${inlst}"

        exec_log "sudo systemctl enable avahi-daemon" "$(eval_gettext "enabling avahi-daemon service")"
        exec_log "sudo systemctl enable cups" "$(eval_gettext "enabling cups service")"
    fi
}

function bluetooth() {
    if ask_question "$(eval_gettext "Do you want to use bluetooth ?")"; then
        local -r inlst="
            bluez
            bluez-plugins
            bluez-utils
        "

        install_lst "${inlst}"

        exec_log "sudo systemctl enable bluetooth" "$(eval_gettext "enabling bluetooth service")"
    fi
}
