# Définition du répertoire de base.
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

# Importation des scripts pour les différents environnements de bureau.
source "$BASE_DIR/src/desktop_environments/KDE.sh"
source "$BASE_DIR/src/desktop_environments/XFCE.sh"
source "$BASE_DIR/src/desktop_environments/GNOME.sh"

# Fonction pour gérer l'environnement de bureau en fonction de ce qui est détecté.
function desktop_environment_management() {
    local de=""

    echo "|- Détection de l'environnement de bureau."
    if [ "$XDG_CURRENT_DESKTOP" ]; then
        de=$XDG_CURRENT_DESKTOP
    elif [ "$GDMSESSION" ]; then
        de=$GDMSESSION
    elif [ "$DESKTOP_SESSION" ]; then
        de=$DESKTOP_SESSION
    fi

    # Configuration en fonction de l'environnement de bureau détecté.
    if [[ $de == "KDE" ]]; then
        config_kde
    elif [[ $de == "XFCE" ]]; then
        config_xfce
    elif [[ $de == "GNOME" ]]; then
        config_gnome
    fi
}

# Fonction pour installer la prise en charge de Flatpak.
function install_flatpak() {
    echo "|- Installation de la compatibilité Flatpak."
    sudo pacman -S --needed --noconfirm flatpak >> /dev/null 2>&1
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo >> /dev/null 2>&1
}

# Fonction pour installer divers paquets utiles.
function install_useful_packages() {
    echo "Installation des paquets utiles."
    desktop_environment_management

    # Liste des paquets utiles à installer.
    local packages=(
        gstreamer gst-plugins-bad gst-plugins-base gst-plugins-ugly gst-plugin-pipewire gstreamer-vaapi 
        gst-plugins-good gst-libav sof-firmware fwupd xdg-utils reflector-simple downgrade 
        rebuild-detector mkinitcpio-firmware xdg-desktop-portal xdg-desktop-portal-gtk neofetch 
        power-profiles-daemon hunspell hunspell-fr p7zip unrar ttf-liberation noto-fonts-emoji 
        adobe-source-code-pro-fonts otf-font-awesome ttf-droid ntfs-3g fuse2 fuse2fs fuse3 exfat-utils 
        bash-completion xdg-desktop-portal-gtk ffmpegthumbs man-db man-pages
    )

    # Installe les paquets utiles listés ci-dessus.
    $AUR_HELPER -S --needed --noconfirm "${packages[@]}" >> /dev/null 2>&1

    # Si BTRFS est utilisé, installe les paquets nécessaires.
    if [[ $(lsblk -f | grep btrfs) ]]; then
        echo "|- Installation des paquets pour BTRFS."
        $AUR_HELPER -S --needed --noconfirm btrfs-progs btrfs-assistant >> /dev/null 2>&1
    fi

    # Installation de Flatpak.
    install_flatpak
    echo "--------------------------------------------------"
}
