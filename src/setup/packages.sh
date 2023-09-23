BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/desktop_environments/KDE.sh"

function desktop_environment_management() {
    local de=""
    if [ "$XDG_CURRENT_DESKTOP" ]; then
        de=$XDG_CURRENT_DESKTOP
    elif [ "$GDMSESSION" ]; then
        de=$GDMSESSION
    elif [ "$DESKTOP_SESSION" ]; then
        de=$DESKTOP_SESSION
    fi

    case $de in
        "KDE" | "kde" | "KDE Plasma" | "plasma" | "Plasma")
            config_kde
            ;;
        *)
            echo "Desktop environment not supported"
            ;;
    esac
}

function install_flatpak() {
    sudo pacman -S --needed --noconfirm flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

function install_useful_packages() {
    desktop_environment_management

    yay -S --needed --noconfirm xdg-utils reflector-simple downgrade rebuild-detector mkinitcpio-firmware xdg-desktop-portal xdg-desktop-portal-gnome neofetch power-profiles-daemon hunspell-fr p7zip unrar ttf-liberation noto-fonts noto-fonts-emoji ntfs-3g fuse2 bash-completion xdg-desktop-portal-gtk ffmpegthumbs vlc

    if [[ $(lsblk -f | grep btrfs) ]]; then
        yay -S --needed --noconfirm btrfs-progs btrfs-assistant
    fi

    install_flatpak
}
