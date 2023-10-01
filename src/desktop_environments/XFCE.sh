
RED="\033[1;31m"
RESET="\033[0m"

# This function installs and configures XFCE desktop environment by installing necessary packages and updating user directories.
# It takes no arguments.
function config_xfce() {
    echo -e "|- Configuration de XFCE. ${RED}(long)${RESET}"
    yay -S --needed --noconfirm xfce4-goodies network-manager-applet xfce4-notifyd gnome-keyring xdg-user-dirs >> /dev/null 2>&1
    xdg-user-dirs-update >> /dev/null 2>&1
}
