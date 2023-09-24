
function config_kde() {
    echo "|- Configuration de KDE..."
    yay -S --needed --noconfirm powerdevil xdg-desktop-portal-kde xdg-desktop-portal-gtk okular print-manager gwenview spectacle partitionmanager ffmpegthumbs qt6-wayland kdeplasma-addons powerdevil kcalc plasma-systemmonitor >> /dev/null 2>&1
}
