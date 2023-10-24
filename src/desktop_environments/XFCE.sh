# Fonction pour configurer et installer des paquets essentiels pour l'environnement XFCE.
function config_xfce() {
    echo -e "|- Configuration de XFCE. ${RED}(long)${RESET}"

    # Liste des paquets XFCE à installer.
    local packages=(
        xdg-desktop-portal-xapp xdg-desktop-portal-gtk xfce4-goodies network-manager-applet 
        xfce4-notifyd gnome-keyring xdg-user-dirs blueman file-roller galculator gvfs gvfs-afc 
        gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb lightdm lightdm-slick-greeter network-manager-applet 
        parole ristretto thunar-archive-plugin thunar-media-tags-plugin xdg-user-dirs-gtk xed 
        xfce4 xfce4-battery-plugin xfce4-datetime-plugin xfce4-mount-plugin xfce4-netload-plugin 
        xfce4-notifyd xfce4-pulseaudio-plugin xfce4-screensaver xfce4-screenshooter xfce4-taskmanager 
        xfce4-wavelan-plugin xfce4-weather-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin
    )

    # Installe les paquets XFCE listés ci-dessus.
    $AUR_HELPER -S --needed --noconfirm "${packages[@]}" >> /dev/null 2>&1

    # Met à jour les dossiers utilisateurs (comme Documents, Téléchargements, etc.) selon les préférences locales.
    xdg-user-dirs-update >> /dev/null 2>&1
}
