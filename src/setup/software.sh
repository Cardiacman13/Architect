BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/utils.sh"

function install_useful_software() {
    echo "Installation des logiciels utiles"
    local package_list=("discord")
    local flatpak_list=()
    

    if read_user "|- Voulez vous installer Steam ?"; then
        package_list+=("steam")
    fi
    if read_user "|- Voulez vous installer Lutris ?"; then
        package_list+=("lutris" "wine-staging")
    fi
    if read_user "|- Voulez vous installer Heroic Games Launcher (Epic Games/Gog) ?"; then
        package_list+=("heroic-games-launcher-bin")
    fi
    if read_user "|- Voulez vous installer Spotify ?"; then
        package_list+=("spotify")
    fi
    if read_user "|- Voulez vous installer OBS ?"; then
        flatpak_list+=("com.obsproject.Studio")
    fi
    if read_user "|- Voulez vous installer Libreoffice ?"; then
        package_list+=("libreoffice-fresh" "libreoffice-fresh-fr")
    fi
    if read_user "|- Voulez vous installer Gimp ?"; then
        package_list+=("gimp")
    fi

    echo -e "|- Installation des paquets ${RED}(long)${RESET}"
    for package in "${package_list[@]}"; do
        echo "|- Installation de ${package}"
        yay -S --needed --noconfirm "${package}" >> /dev/null 2>&1
    done
    echo "|- Installation des flatpaks"
    for flatpak in "${flatpak_list[@]}"; do
        echo "|- Installation de ${flatpak}"
        flatpak install flathub -y "${flatpak}" >> /dev/null 2>&1
    done
    echo "--------------------------------------------------"
}
