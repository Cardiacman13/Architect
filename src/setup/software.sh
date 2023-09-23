BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/utils.sh"

function install_useful_software() {
    local PACKAGE_LIST="steam lutris wine-staging protonup-qt discord"
    local FLATPAK_LIST=""

    if read_user "Voulez vous installer Spotify ?"; then
        PACKAGE_LIST="${PACKAGE_LIST} spotify"
    fi
    if read_user "Voulez vous installer OBS ?"; then
        FLATPAK_LIST="${FLATPAK_LIST} com.obsproject.Studio"
    fi
    if read_user "Voulez vous installer Libreoffice ?"; then
        PACKAGE_LIST="${PACKAGE_LIST} libreoffice-fresh libreoffice-fresh-fr"
    fi
    if read_user "Voulez vous installer Gimp ?"; then
        PACKAGE_LIST="${PACKAGE_LIST} gimp"
    fi

    yay -S --needed --noconfirm ${PACKAGE_LIST}
    flatpak install -y ${FLATPAK_LIST}
}