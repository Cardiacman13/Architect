BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/utils.sh"

function gamepad() {
    if read_user "Voulez vous supporter les manettes de jeux ?"; then
        yay -S --needed --noconfirm xpadneo-dkms
    fi 
}

function printer() {
    if read_user "Voulez vous supporter les imprimantes ?"; then
        yay -S --needed --noconfirm python-pyqt5 hplip ghostscript gsfonts cups cups-filters cups-pdf system-config-printer avahi foomatic-db-engine foomatic-db foomatic-db-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds gutenprint foomatic-db-gutenprint-ppds
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
