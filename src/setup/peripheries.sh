BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/utils.sh"

function gamepad() {
    if read_user "Voulez Xpadneo pour manettes Xbox Series X|S|Elite et 8BitDo ?"; then
        yay -S --needed --noconfirm xpadneo-dkms >> /dev/null 2>&1
    fi 
}

function printer() {
    if read_user "Voulez vous supporter les imprimantes ?"; then
        yay -S --needed --noconfirm ghostscript gsfonts cups cups-filters cups-pdf system-config-printer avahi foomatic-db-engine foomatic-db foomatic-db-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds gutenprint foomatic-db-gutenprint-ppds >> /dev/null 2>&1

        if read_user "Avec vous une imprimante EPSON ?"; then
            yay -S --needed --noconfirm epson-inkjet-printer-escpr  epson-inkjet-printer-escpr2  epson-inkjet-printer-201601w  epson-inkjet-printer-n10-nx127 >> /dev/null 2>&1
        fi           
        if read_user "Avec vous une imprimante HP ?"; then
            yay -S --needed --noconfirm hplip python-pyqt5 >> /dev/null 2>&1
        fi
    fi
}

function enable_bluethooth() {
    if lspci | grep -i bluetooth &> /dev/null; then
        yay -S --needed --noconfirm bluez bluez-utils bluez-plugins >> /dev/null 2>&1
        if ! systemctl is-active bluetooth &> /dev/null; then
            systemctl enable --now bluetooth.service >> /dev/null 2>&1
        fi
    fi
}

function install_peripheries() {
    gamepad
    printer
    enable_bluethooth
}
