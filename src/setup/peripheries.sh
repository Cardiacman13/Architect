# Détermine le répertoire de base du script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

# Inclusion des utilitaires
source "$BASE_DIR/src/utils.sh"

# Installe le support pour les manettes de jeu Xbox 360, Series X|S|Elite, 8BitDo, PS4 et PS5.
function gamepad() {
    if read_user "Voulez-vous installer Xpadneo pour manettes Xbox 360, Series X|S|Elite et 8BitDo ?"; then
        echo "|- Installation de Xpadneo."
        $AUR_HELPER -S --needed --noconfirm xpadneo-dkms >> /dev/null 2>&1
    fi

    if read_user "Avez-vous une manette PS4/PS5 ?"; then
        echo -e "|- Installation de bluez-utils-compat, ds4drv et dualsensectl. ${RED}(peut être long)${RESET}"
        $AUR_HELPER -S --needed --noconfirm bluez-utils ds4drv dualsensectl >> /dev/null 2>&1
    fi

    echo "--------------------------------------------------" 
}

# Installe et configure les paquets relatifs aux imprimantes sur Arch Linux.
function printer() {
    if read_user "Voulez-vous le support des imprimantes ?"; then
        echo "|- Installation des paquets nécessaires."
        $AUR_HELPER -S --needed --noconfirm ghostscript gsfonts cups cups-filters cups-pdf system-config-printer avahi foomatic-db-engine foomatic-db foomatic-db-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds gutenprint foomatic-db-gutenprint-ppds >> /dev/null 2>&1
        echo "|- Activation du service d'impression et de la découverte réseau."
        sudo systemctl enable --now avahi-daemon >> /dev/null 2>&1
        sudo systemctl enable --now cups >> /dev/null 2>&1
        
        if read_user "|- Avez-vous une imprimante EPSON ?"; then
            echo -e "|- Installation des paquets pour les imprimantes EPSON. ${RED}(peut être long)${RESET}"
            $AUR_HELPER -S --needed --noconfirm epson-inkjet-printer-escpr  epson-inkjet-printer-escpr2  epson-inkjet-printer-201601w  epson-inkjet-printer-n10-nx127 >> /dev/null 2>&1
        fi

        if read_user "|- Avez-vous une imprimante HP ?"; then
            echo "|- Installation des paquets pour les imprimantes HP."
            $AUR_HELPER -S --needed --noconfirm hplip python-pyqt5 >> /dev/null 2>&1
        fi
    fi

    echo "--------------------------------------------------"
}

# Active le Bluetooth en installant les paquets nécessaires et en activant le service correspondant.
function enable_bluetooth() {
    if read_user "Voulez-vous activer le bluetooth ?"; then
        echo "|- Installation des paquets pour le bluetooth."
        $AUR_HELPER -S --needed --noconfirm bluez bluez-utils bluez-plugins >> /dev/null 2>&1
        echo "|- Activation du service bluetooth."
        sudo systemctl enable --now bluetooth >> /dev/null 2>&1
    fi

    echo "--------------------------------------------------"
}

# Installe et active divers périphériques tels que les manettes de jeu, les imprimantes et le bluetooth.
function install_peripheries() {
    gamepad
    printer
    enable_bluetooth
}
