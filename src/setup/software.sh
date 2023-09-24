BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/utils.sh"

function install_useful_software() {
    echo "Installation des logiciels utiles"
    local package_list="discord"
    local flatpak_list=""
    

    if read_user "|- Voulez vous installer Steam ?"; then
        package_list="${package_list} steam"
    fi
    if read_user "|- Voulez vous installer Lutris ?"; then
        package_list="${package_list} lutris wine-staging"
    fi
    if read_user "|- Voulez vous installer Spotify ?"; then
        package_list="${package_list} spotify"
    fi
    if read_user "|- Voulez vous installer OBS ?"; then
        flatpak_list="${flatpak_list} com.obsproject.Studio"
    fi
    if read_user "|- Voulez vous installer Libreoffice ?"; then
        package_list="${package_list} libreoffice-fresh libreoffice-fresh-fr"
    fi
    if read_user "|- Voulez vous installer Gimp ?"; then
        package_list="${package_list} gimp"
    fi

    echo "|- Installation des paquets"
    yay -S --needed --noconfirm ${package_list} >> /dev/null 2>&1
    echo "|- Installation des flatpaks"
    flatpak install -y ${flatpak_list} >> /dev/null 2>&1
    echo "--------------------------------------------------"
}
