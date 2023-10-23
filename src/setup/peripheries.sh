BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/utils.sh"

RED="\033[1;31m"
RESET="\033[0m"

# This function prompts the user to install xpadneo for Xbox Series X|S|Elite, 8BitDo gamepads and/or PS4 /PS5 drivers.
# If the user confirms, xpadneo and/or PS4/PS5 drivers are installed using yay package manager.
function gamepad() {
    if read_user "Voulez-vous installer Xpadneo pour manettes Xbox 360, Series X|S|Elite et 8BitDo ?"; then
        echo "|- Installation de Xpadneo."
        $AUR_HELPER -S --needed --noconfirm xpadneo-dkms >> /dev/null 2>&1
    fi
    if read_user "Avez-vous une manette PS4/PS5 ?"; then
        echo -e "|- Installation de bluez-utils-compat, ds4drv et dualsencectl. ${RED}(long)${RESET}"
        $AUR_HELPER -S --needed --noconfirm bluez-utils-compat ds4drv dualsensectl >> /dev/null 2>&1
    fi
    echo "--------------------------------------------------" 
}

# This function installs and configures printer-related packages on Arch Linux.
# It prompts the user to confirm if they want to support printers and then installs the necessary packages.
# If the user has an EPSON or HP printer, it installs the necessary packages for those printers as well.
# FILEPATH: src/setup/peripheries.sh
function printer() {
    if read_user "Voulez-vous le support des imprimantes ?"; then
        echo "|- Installation des paquets."
        $AUR_HELPER -S --needed --noconfirm ghostscript gsfonts cups cups-filters cups-pdf system-config-printer avahi foomatic-db-engine foomatic-db foomatic-db-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds gutenprint foomatic-db-gutenprint-ppds >> /dev/null 2>&1
        echo "|- Activation du service d'impression et de la découverte réseau."
        sudo systemctl enable --now avahi-daemon >> /dev/null 2>&1
        sudo systemctl enable --now cups >> /dev/null 2>&1
        
        if read_user "|- Avez-vous une imprimante EPSON ?"; then
            echo -e "|- Installation des paquets pour les imprimantes EPSON. ${RED}(long)${RESET}"
            $AUR_HELPER -S --needed --noconfirm epson-inkjet-printer-escpr  epson-inkjet-printer-escpr2  epson-inkjet-printer-201601w  epson-inkjet-printer-n10-nx127 >> /dev/null 2>&1
        fi           
        if read_user "|- Avez-vous une imprimante HP ?"; then
            echo "|- Installation des paquets pour les imprimantes HP."
            $AUR_HELPER -S --needed --noconfirm hplip python-pyqt5 >> /dev/null 2>&1
        fi
    fi
    echo "--------------------------------------------------"
}

# Enables Bluetooth if the user confirms. Installs necessary packages and activates the Bluetooth service.
function enable_bluetooth() {
    if read_user "Voulez-vous activer le bluetooth ?"; then
        echo "|- Installation des paquets."
        $AUR_HELPER -S --needed --noconfirm bluez bluez-utils bluez-plugins >> /dev/null 2>&1
        echo "|- Activation du service bluetooth."
        sudo systemctl enable --now bluetooth >> /dev/null 2>&1
    fi
    echo "--------------------------------------------------"
}

# Installs and enables various peripheries such as gamepad, printer, and bluetooth.
function install_peripheries() {
    gamepad
    printer
    enable_bluetooth
}
