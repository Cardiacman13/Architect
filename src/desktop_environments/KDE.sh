# Fonction pour configurer et installer des paquets essentiels pour l'environnement KDE Plasma.
function config_kde() {
    echo -e "|- Configuration de KDE. ${RED}(long)${RESET}"

    # Active la touche Num Lock au démarrage avec SDDM (le gestionnaire de connexion de KDE).
    echo "Numlock=on" | sudo tee -a /etc/sddm.conf >> /dev/null 2>&1

    # Liste des paquets KDE à installer.
    local packages=(
        powerdevil xdg-desktop-portal-kde okular print-manager gwenview
        spectacle partitionmanager ffmpegthumbs qt6-multimedia 
        qt6-multimedia-gstreamer qt6-multimedia-ffmpeg qt6-wayland 
        kdeplasma-addons powerdevil kcalc plasma-systemmonitor kwalletmanager
    )

    # Installe les paquets KDE listés ci-dessus.
    $AUR_HELPER -S --needed --noconfirm "${packages[@]}" >> /dev/null 2>&1
}
