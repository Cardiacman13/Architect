source src/cmd.sh

function gamepad() {
    read -rp "Would you want to install xpadneo ? (Can improve xbox gamepad support, ${RED}say No if unsure${RESET}) (y/N) : " choice
    choice="${choice^^}"

    if [[ $choice == "Y" ]]; then
        install_one "xpadneo-dkms-git"
    fi

    read -rp "Do you want to use PS5 controllers ? (y/N) : " choice
    choice="${choice^^}"

    if [[ $choice == "Y" ]]; then
        install_one "dualsensectl-git"
    fi
}

function printer() {
    read -rp "Do you want to use a printer ? (y/N) : " choice
    choice="${choice^^}"

    if [[ $choice == "Y" ]]; then
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
        read -rp "Do you want to use a EPSON printer ? (y/N) : " choice
        choice="${choice^^}"

        if [[ $choice == "Y" ]]; then
            inlst+="
                epson-inkjet-printer-escpr
                epson-inkjet-printer-escpr2
            "
        fi
        read -rp "Do you want to use a HP printer ? (y/N) : " choice
        choice="${choice^^}"

        if [[ $choice == "Y" ]]; then
            inlst+="
                hplip
                python-pyqt5
            "
        fi

        install_lst "${inlst}"

        exec_log "sudo systemctl enable --now avahi-daemon" "enabling avahi-daemon service"
        exec_log "sudo systemctl enable --now cups" "enabling cups service"
    fi
}

function bluetooth() {
    read -rp "Do you want to use bluetooth ? (y/N) : " choice
    choice="${choice^^}"

    if [[ $choice == "Y" ]]; then
        local -r inlst="
            bluez
            bluez-plugins
            bluez-utils
        "

        install_lst "${inlst}"

        exec_log "sudo systemctl enable --now bluetooth" "enabling bluetooth service"
    fi
}
