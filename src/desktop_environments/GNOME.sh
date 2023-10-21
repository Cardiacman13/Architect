
RED="\033[1;31m"
RESET="\033[0m"

# Function to configure GNOME desktop environment
# Installs gnome-browser-connector and adw-gtk3 theme package using yay package manager
# Set the GTK theme to adw-gtk3 using gsettings
function config_gnome() {
    echo -e "|- Configuration de Gnome. ${RED}(long)${RESET}"
    yay -S --needed --noconfirm adwaita-icon-theme eog evince file-roller gdm gnome-calculator gnome-console gnome-control-center gnome-disk-utility gnome-keyring gnome-nettool gnome-power-manager gnome-screenshot gnome-shell gnome-text-editor gnome-themes-extra gnome-tweaks gnome-usage gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb nautilus nautilus-sendto sushi totem xdg-user-dirs-gtk gnome-browser-connector adw-gtk3 qgnomeplatform-qt5 qgnomeplatform-qt6 >> /dev/null 2>&1
    gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3 >> /dev/null 2>&1
    gsettings set org.gnome.desktop.peripherals.keyboard numlock-state true >> /dev/null 2>&1    
}
