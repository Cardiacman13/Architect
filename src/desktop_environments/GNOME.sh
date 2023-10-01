
RED="\033[1;31m"
RESET="\033[0m"

# Function to configure GNOME desktop environment
# Installs gnome-browser-connector package using yay package manager
function config_gnome() {
    echo -e "|- Configuration de Gnome. ${RED}(long)${RESET}"
    yay -S --needed --noconfirm gnome-browser-connector >> /dev/null 2>&1
}
