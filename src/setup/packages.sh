BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/desktop_environments/KDE.sh"

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

    if [[ $de == "plasma" ]]; then
        config_kde
    fi
}

function install_flatpak() {
    echo "|- Installation de la compatibilité Flatpak."
    sudo pacman -S --needed --noconfirm flatpak >> /dev/null 2>&1
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo >> /dev/null 2>&1
}

function install_useful_packages() {
    echo "Installation des paquets utiles."
    desktop_environment_management

    yay -S --needed --noconfirm fwupd xdg-utils reflector-simple downgrade rebuild-detector mkinitcpio-firmware xdg-desktop-portal xdg-desktop-portal-gnome neofetch power-profiles-daemon hunspell-fr p7zip unrar ttf-liberation noto-fonts-emoji-flag ntfs-3g fuse2 bash-completion xdg-desktop-portal-gtk ffmpegthumbs vlc >> /dev/null 2>&1
    sudo systemctl enable reflector.service >> /dev/null 2>&1

    # sudo fwupdmgr get-devices -y && sudo fwupdmgr refresh -y --force && sudo fwupdmgr get-updates -y && sudo fwupdmgr update -y

    if [[ $(lsblk -f | grep btrfs) ]]; then
        echo "|- Installation des paquets pour BTRFS."
        yay -S --needed --noconfirm btrfs-progs btrfs-assistant >> /dev/null 2>&1
    fi

    install_flatpak
    echo "--------------------------------------------------"
}
