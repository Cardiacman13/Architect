#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

detect_graphics_card() {
    if lspci | grep -i "NVIDIA" >/dev/null; then
        echo "NVIDIA"
    elif lspci | grep -i "AMD" >/dev/null; then
        echo "AMD"
    elif lspci | grep -i "Intel" >/dev/null; then
        echo "Intel"
    else
        echo "Carte graphique non détectée."
        exit 1
    fi
}

install_yay() {
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si --noconfirm
    cd .. 
    rm -rf yay-bin
    yay
}

install_style() {
    sudo sed -i 's/#Color/Color/' /etc/pacman.conf
    sudo sed -i 's/#CheckSpace/CheckSpace/' /etc/pacman.conf
    sudo sed -i 's/#ParallelDownloads = 8/ParallelDownloads = 8/' /etc/pacman.conf

    echo 'alias u="sudo pacman -Syy && yay -S archlinux-keyring && yay && yay -Sc && sudo pacman -Rns \$(pacman -Qdtq)"' >> ~/.bashrc
}

install_base_components() {
    yay -S --noconfirm mkinitcpio-firmware xdg-desktop-portal neofetch power-profiles-daemon lib32-pipewire hunspell-fr p7zip unrar ttf-liberation noto-fonts noto-fonts-emoji ntfs-3g fuse2 bash-completion reflector-simple --needed
}

install_misc_software() {
    yay -S --noconfirm --needed libreoffice-fresh libreoffice-fresh-fr vlc discord gimp obs-studio gnome-disk-utility timeshift
}

install_kde_software() {
    yay -S --noconfirm xdg-desktop-portal-kde xdg-desktop-portal-gtk okular print-manager kdenlive gwenview spectacle partitionmanager ffmpegthumbs qt6-wayland
}

install_firewall() {
    sudo pacman -S --noconfirm ufw
    sudo systemctl enable --now ufw.service
}

install_nvidia_support() {
    echo "Installation des composants NVIDIA..."
    yay -S --needed --noconfirm nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader cuda
    echo "Activation de nvidia-drm.modeset=1..."
    sudo sed -i '/^options/ s/\"$/ nvidia-drm.modeset=1"/' /boot/loader/entries/*.conf
    echo "Configuration du module mkinitcpio..."
    sudo mkdir -p /etc/pacman.d/hooks/
    echo "[Trigger]
    Operation=Install
    Operation=Upgrade
    Operation=Remove
    Type=Package
    Target=nvidia-dkms
    Target = linux
    Target = linux-next*
    Target = linux-new*
    Target = linux-amd*
    Target = linux-lts*
    Target = linux-zen*
    Target = linux-rt*
    Target = linux-hardened*
    Target = linux-xanmod*
    Target = linux-tkg*
    Target = linux-raven*
    Target = linux-slim*
    Target = linux-test*
    Target = linux-main*
    Target = linux-dctxmei*
    Target = linux-froidzen*
    Target = linux-jwrdegoede*
    Target=nvidia
    Target=nvidia-lts
    Target=nvidia-dkms
    Target=nvidia-beta
    Target=nvidia-340xx
    Target=nvidia-390xx
    Target=dkms

    [Action]
    Description=Update NVIDIA module in initcpio
    Depends=mkinitcpio
    When=PostTransaction
    NeedsTargets
    Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'" | sudo tee /etc/pacman.d/hooks/nvidia.hook > /dev/null
    echo "Configuration terminée pour NVIDIA."
}

install_amd_support() {
    echo "Installation des composants AMD..."
    yay -S --needed --noconfirm mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
    echo "Configuration terminée pour AMD."
}

install_printer() {
    yay -S --noconfirm ghostscript gsfonts cups cups-filters cups-pdf system-config-printer
    avahi  --needed
    sudo systemctl enable --now avahi-daemon
    sudo systemctl enable --now cups
    yay -S --noconfirm foomatic-db-engine foomatic-db foomatic-db-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds gutenprint foomatic-db-gutenprint-ppds --needed

    read -p "Voulez-vous installer les drivers d'imprimantes HP ? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        yay -S python-pyqt5 hplip --needed
    fi
}

enable_bluetooth() {
    yay -S --needed --noconfirm bluez bluez-utils bluez-plugins
    sudo systemctl enable --now  bluetooth.service
}

install_pipewire() {
    sudo pacman -S --needed --noconfirm pipewire-pulse pipewire-alsa pipewire-jack wireplumber
}

install_game() {
    yay -S --needed --noconfirm lutris wine-staging winetricks wine-mono giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader steam goverlay

    sudo touch /etc/sysctl.d/99-sysctl.conf | echo 'vm.max_map_count=16777216' >> /etc/sysctl.d/99-sysctl.conf
}

install_bonus() {
    yay -S --noconfirm fish
    chsh -s $(which fish)
    fish -c "fish_update_completions | set -U fish_greeting"
    echo 'alias u="sudo pacman -Syy && yay -S archlinux-keyring && yay && yay -Sc && sudo pacman -Rns \$(pacman -Qdtq)"' >> ${HOME}/.config/fish/config.fish
}

main() {
    graphics_card=$(detect_graphics_card)
    echo "Carte graphique détectée : $graphics_card"

    install_style
    install_yay
    install_base_components
    install_misc_software
    install_kde_software
    install_firewall

    if [ "$graphics_card" == "NVIDIA" ]; then
        install_nvidia_support
    elif [ "$graphics_card" == "AMD" ]; then
        install_amd_support
    else
        echo "Carte graphique non prise en charge."
        exit 1
    fi

    install_printer
    read -p "Voulez-vous activer le bluethooth ? (y/N) " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        enable_bluetooth
    fi

    install_pipewire
    install_game

    read -p "Voulez-vous support manette xpadneo-dkms ? (y/N) " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        yay -S --noconfirm xpadneo-dkms
    fi
    
    read -p "Voulez-vous faire la partie BONUS ? (y/N) " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        install_bonus
    fi

    echo -e "${GREEN}Installation terminée.${NC}\nMaintenant, il ${RED}faut${NC} redémarrez le système."

    read -p "Voulez-vous redémarrer maintenant ? (y/N) " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        reboot
    fi

    exit 0
}

main
