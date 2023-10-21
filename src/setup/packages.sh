BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/desktop_environments/KDE.sh"
source "$BASE_DIR/src/desktop_environments/XFCE.sh"
source "$BASE_DIR/src/desktop_environments/GNOME.sh"

# This function detects the current desktop environment and calls the corresponding configuration function.
# It first checks the XDG_CURRENT_DESKTOP environment variable, then GDMSESSION, and finally DESKTOP_SESSION.
# If the detected environment is KDE, it calls the config_kde function.
# If the detected environment is XFCE, it calls the config_xfce function.
# If the detected environment is GNOME, it calls the config_gnome function.
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

    if [[ $de == "KDE" ]]; then
        config_kde
    elif [[ $de == "XFCE" ]]; then
        config_xfce
    elif [[ $de == "GNOME" ]]; then
        config_gnome
    fi
}

# Installs Flatpak compatibility and adds flathub remote repository.
function install_flatpak() {
    echo "|- Installation de la compatibilité Flatpak."
    sudo pacman -S --needed --noconfirm flatpak >> /dev/null 2>&1
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo >> /dev/null 2>&1
}

# Installs useful packages for the system.
# This function installs various packages, firmwares and codecs
# If the system uses BTRFS, it also installs btrfs-progs and btrfs-assistant.
# Finally, it calls the install_flatpak function.
function install_useful_packages() {
    echo "Installation des paquets utiles."
    desktop_environment_management

    yay -S --needed --noconfirm gstreamer gst-plugins-bad gst-plugins-base gst-plugins-ugly gst-plugin-pipewire gstreamer-vaapi gst-plugins-good gst-libav sof-firmware fwupd xdg-utils reflector-simple downgrade rebuild-detector mkinitcpio-firmware xdg-desktop-portal neofetch power-profiles-daemon hunspell hunspell-fr p7zip unrar ttf-liberation noto-fonts-emoji adobe-source-code-pro-fonts otf-font-awesome ttf-droid ttf-fantasque-sans-mono ttf-jetbrains-mono ttf-jetbrains-mono-nerd ntfs-3g fuse2 fuse2fs fuse3 exfat-utils bash-completion xdg-desktop-portal-gtk ffmpegthumbs vlc >> /dev/null 2>&1

    # sudo fwupdmgr get-devices -y && sudo fwupdmgr refresh -y --force && sudo fwupdmgr get-updates -y && sudo fwupdmgr update -y

    if [[ $(lsblk -f | grep btrfs) ]]; then
        echo "|- Installation des paquets pour BTRFS."
        yay -S --needed --noconfirm btrfs-progs btrfs-assistant >> /dev/null 2>&1
    fi

    install_flatpak
    echo "--------------------------------------------------"
}
