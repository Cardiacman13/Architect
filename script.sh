#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

print_step() {
  echo -e "\e[34m============ $1 ============$NC"
}

# Mettre à jour le système\
print_step "Mise à jour du système"
sudo pacman -Syu --noconfirm

# Mettre à jour la configuration de pacman
print_step "Optimiser pacman"
sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
sudo sed -i 's/^#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf
sudo sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 5/' /etc/pacman.conf
echo "vm.max_map_count=16777216" | sudo tee -a /etc/sysctl.d/99-sysctl.conf

# Installer yay
print_step "Installation de yay"
sudo pacman -S --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin || exit 1
makepkg -si --noconfirm
cd .. || exit 1
rm -rf yay-bin

# Alias de maintenance
print_step "Alias maintenance"
echo 'alias u="sudo pacman -Syy && yay -S archlinux-keyring && yay && yay -Sc && sudo pacman -Rns \$(pacman -Qdtq)"' >> $HOME/.bashrc
source $HOME/.bashrc

# Détecter Nvidia ou AMD
nvidia=$(lspci | grep -i nvidia)
amd=$(lspci | grep -i amd)

if [[ $nvidia ]]; then
    print_step "Carte Nvidia détectée."
    print_step "Installation des pilotes NVIDIA"
    yay -S --needed --noconfirm nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader cuda
    echo "Activation de nvidia-drm.modeset=1..."
    sudo sed -i '/^options/ s/\"$/ nvidia-drm.modeset=1"/' /boot/loader/entries/*.conf
    echo "Charger les modules Nvidia en priorité au lancement de Arch"
    sudo sed -i '/^MODULES/ s/()/(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
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
fi

if [[ $amd ]]; then
    echo "Carte AMD détectée."
    echo "Installation des composants AMD..."
    yay -S --needed --noconfirm mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
    echo "Configuration terminée pour AMD."
fi

# Activation du bluetooth
read -p "Voulez-vous installer le support pour Bluetooth ? (y/n): " bluetooth
if [[ $bluetooth == "y" ]]; then
    yay -S --needed --noconfirm bluez bluez-utils bluez-plugins
    sudo systemctl enable --now bluetooth.service
fi

# Installation des drivers pour les imprimantes
read -p "Voulez-vous installer le support pour les imprimantes ? (y/n): " printer
if [[ $printer == "y" ]]; then
    print_step "Installation du support pour les imprimantes"
    yay -S --noconfirm ghostscript gsfonts cups cups-filters cups-pdf system-config-printer avahi --needed
    sudo systemctl enable --now avahi-daemon
    sudo systemctl enable --now cups
fi

# Installation des logiciels de tiers
read -p "Voulez-vous installer des logiciels divers ? (y/n): " software
if [[ $software == "y" ]]; then
    print_step "Installation de logiciels de base"
    yay -S --noconfirm libreoffice-fresh libreoffice-fresh-fr vlc discord gimp obs-studio gnome-disk-utility
fi

# Installation du shell Fish
read -p "Voulez-vous installer le shell Fish ? (y/n): " fish
if [[ $fish == "y" ]]; then
    print_step "Installation de Fish"
    yay -S --noconfirm fish
    chsh -s $(which fish)
    echo 'alias u="sudo pacman -Syy && yay -S archlinux-keyring && yay && yay -Sc && sudo pacman -Rns \$(pacman -Qdtq)"' >> $HOME/.config/fish/config.fish
fi

# Installation et configuration du pare-feu
sudo pacman -S --noconfirm ufw
sudo systemctl enable --now ufw.service

# Installation de Steam et Lutris
yay -S --noconfirm steam lutris

echo "Le script est terminé. N'oubliez pas de redémarrer votre système."
