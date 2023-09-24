BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/utils.sh"

function install_useful_software() {
    echo "Installation des logiciels utiles"
    local PACKAGE_LIST="discord"
    local FLATPAK_LIST=""
    

    if read_user "|- Voulez vous installer Steam ?"; then
        PACKAGE_LIST="${PACKAGE_LIST} steam"
    fi
    if read_user "|- Voulez vous installer Lutris ?"; then
        PACKAGE_LIST="${PACKAGE_LIST} lutris wine-staging"
    fi
    if read_user "|- Voulez vous installer Spotify ?"; then
        PACKAGE_LIST="${PACKAGE_LIST} spotify"
    fi
    if read_user "|- Voulez vous installer OBS ?"; then
        FLATPAK_LIST="${FLATPAK_LIST} com.obsproject.Studio"
    fi
    if read_user "|- Voulez vous installer Libreoffice ?"; then
        PACKAGE_LIST="${PACKAGE_LIST} libreoffice-fresh libreoffice-fresh-fr"
    fi
    if read_user "|- Voulez vous installer Gimp ?"; then
        PACKAGE_LIST="${PACKAGE_LIST} gimp"
    fi

    echo "|- Installation des paquets"
    yay -S --needed --noconfirm ${PACKAGE_LIST} >> /dev/null 2>&1
    echo "|- Installation des flatpaks"
    flatpak install -y ${FLATPAK_LIST} >> /dev/null 2>&1
    echo "--------------------------------------------------"
}
