source src/cmd.sh

function gamepad() {
    read -rp "Do you want to use Xbox 360, Series X|S|Elite or 8BitDo controllers ? (y/N) : " choice
    choice="${choice^^}"

    if [[ $choice == "Y" ]]; then
        exec_log "${AUR} -S --noconfirm --needed xpadneo-dkms" "installing xpadneo-dkms"
    fi

    read -rp "Do you want to use PS4 or PS5 controllers ? (y/N) : " choice
    choice="${choice^^}"

    if [[ $choice == "Y" ]]; then
        exec_log "${AUR} -S --noconfirm --needed bluez-utils ds4drv dualsensectl" "installing playstation controllers support"
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
                epson-inkjet-printer-201601w
                epson-inkjet-printer-n10-nx127
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
            bluez-utils
            bluez-plugins
        "

        install_lst "${inlst}"
        exec_log "sudo systemctl enable --now bluetooth" "enabling bluetooth service"
    fi
}
