source src/cmd.sh

function gamepad() {
    read -rp "Do you want to use Xbox 360, Series X|S|Elite or 8BitDo controllers ? (y/N) : " choice
    choice="${choice^^}"

    if [[ $choice == "Y" ]]; then
        exec_log "${AUR} -S --noconfirm --needed xpadneo-dkms" "installation of xpadneo-dkms"
    fi

    read -rp "Do you want to use PS4 or PS5 controllers ? (y/N) : " choice
    choice="${choice^^}"

    if [[ $choice == "Y" ]]; then
        exec_log "${AUR} -Rdd --noconfirm bluez-utils" "removing of bluez-utils"
        exec_log "${AUR} -S --noconfirm --needed bluez-utils-compat ds4drv dualsensectl" "installation of playstation controllers support"
    fi
}

function printer() {
    read -rp "Do you want to use a printer ? (y/N) : " choice
    choice="${choice^^}"

    if [[ $choice == "Y" ]]; then
        local install_lst=(
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
        )
        read -rp "Do you want to use a EPSON printer ? (y/N) : " choice
        choice="${choice^^}"

        if [[ $choice == "Y" ]]; then
            install_lst+=(epson-inkjet-printer-escpr  epson-inkjet-printer-escpr2  epson-inkjet-printer-201601w  epson-inkjet-printer-n10-nx127)
        fi
        read -rp "Do you want to use a HP printer ? (y/N) : " choice
        choice="${choice^^}"

        if [[ $choice == "Y" ]]; then
            install_lst+=(hplip python-pyqt5)
        fi
    fi
}

function bluetooth() {
    read -rp "Do you want to use bluetooth ? (y/N) : " choice
    choice="${choice^^}"

    if [[ $choice == "Y" ]]; then
        local -r install_lst=(
            bluez
            bluez-utils
            bluez-plugins
        )
        for package in "${install_lst[@]}"; do
            exec_log "${AUR} -S --noconfirm --needed ${package}" "installation of ${package}"
        done

        exec_log "sudo systemctl enable --now bluetooth" "enabling bluetooth service"
    fi
}