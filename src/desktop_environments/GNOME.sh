# Fonction pour configurer et installer des paquets essentiels pour l'environnement GNOME.
function config_gnome() {
    echo -e "|- Configuration de Gnome. ${RED}(long)${RESET}"

    # Liste des paquets GNOME à installer.
    local packages=(
        adwaita-icon-theme eog evince file-roller gdm gnome-calculator gnome-console
        gnome-control-center gnome-disk-utility gnome-keyring gnome-nettool
        gnome-power-manager gnome-screenshot gnome-shell gnome-text-editor
        gnome-themes-extra gnome-tweaks gnome-usage gvfs gvfs-afc gvfs-gphoto2
        gvfs-mtp gvfs-nfs gvfs-smb nautilus nautilus-sendto sushi totem
        xdg-user-dirs-gtk gnome-browser-connector adw-gtk3
    )

    # Installe les paquets GNOME listés ci-dessus.
    $AUR_HELPER -S --needed --noconfirm "${packages[@]}" >> /dev/null 2>&1

    # Définit le thème GTK.
    gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3 >> /dev/null 2>&1

    # Active la touche Num Lock au démarrage.
    gsettings set org.gnome.desktop.peripherals.keyboard numlock-state true >> /dev/null 2>&1    
}
