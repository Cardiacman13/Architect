
function install_flatpak() {
    sudo pacman -S --needed --noconfirm flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

function install_useful_packages() {
    yay -S --needed --noconfirm powerdevil reflector-simple rebuild-detector mkinitcpio-firmware xdg-desktop-portal xdg-desktop-portal-gnome neofetch power-profiles-daemon hunspell-fr p7zip unrar ttf-liberation noto-fonts noto-fonts-emoji ntfs-3g fuse2 bash-completion xdg-desktop-portal-gtk ffmpegthumbs qt6-wayland vlc

    if [[ $(lsblk -f | grep btrfs) ]]; then
        yay -S --needed --noconfirm btrfs-progs btrfs-assistant
    fi

    install_flatpak
}