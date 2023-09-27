function config_xfce() {
    echo -e "|- Configuration de KDE. ${RED}(long)${RESET}"
    yay -S --needed --noconfirm xfce4-goodies xdg-user-dirs >> /dev/null 2>&1
    xdg-user-dirs-update >> /dev/null 2>&1
}
