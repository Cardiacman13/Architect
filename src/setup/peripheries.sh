BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/utils.sh"

function gamepad() {
    if read_user "Voulez vous supporter les manettes de jeux ?"; then
        yay -S --needed --noconfirm xpadneo-dkms
    fi 
}

function printer() {
    if read_user "Voulez vous supporter les imprimantes ?"; then
        yay -S --needed --noconfirm ghostscript gsfonts cups cups-filters cups-pdf system-config-printer avahi foomatic-db-engine foomatic-db foomatic-db-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds gutenprint foomatic-db-gutenprint-ppds

        read -p "Avec vous des imprimante parmi ces marques ? EPSON/HP" printer_type
        if [ "$printer_type" == "EPSON" ]; then
            yay -S --needed --noconfirm epson-inkjet-printer-escpr  epson-inkjet-printer-escpr2  epson-inkjet-printer-201601w  epson-inkjet-printer-n10-nx127
        elif [ "$printer_type" == "HP" ]; then
            yay -S --needed --noconfirm hplip python-pyqt5
        fi
    fi
}

function enable_bluethooth() {
    if lspci | grep -i bluetooth &> /dev/null; then
        yay -S --needed --noconfirm bluez bluez-utils bluez-plugins
        if ! systemctl is-active bluetooth &> /dev/null; then
            systemctl enable --now bluetooth.service
        fi
    fi
}

function install_peripheries() {
    gamepad
    printer
    enable_bluethooth
}
