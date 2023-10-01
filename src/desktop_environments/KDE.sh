
RED="\033[1;31m"
RESET="\033[0m"

# Function to configure KDE desktop environment
# Installs necessary packages for KDE and redirects output to /dev/null
function config_kde() {
    echo -e "|- Configuration de KDE. ${RED}(long)${RESET}"
    yay -S --needed --noconfirm powerdevil xdg-desktop-portal-kde xdg-desktop-portal-gtk okular print-manager gwenview spectacle partitionmanager ffmpegthumbs qt6-wayland kdeplasma-addons powerdevil kcalc plasma-systemmonitor >> /dev/null 2>&1
}
