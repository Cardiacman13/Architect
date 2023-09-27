function config_gnome() {
    echo -e "|- Configuration de Gnome. ${RED}(long)${RESET}"
    yay -S --needed --noconfirm gnome-browser-connector >> /dev/null 2>&1
}
