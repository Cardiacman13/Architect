source src/cmd.sh

function install_gnome() {
    local -r inlst="
        gnome
        gnome-tweaks
        gnome-calculator
        gnome-console
        gnome-control-center
        gnome-disk-utility
        gnome-keyring
        gnome-nettool
        gnome-power-manager
        gnome-screenshot
        gnome-shell
        gnome-text-editor
        gnome-themes-extra
        gnome-usage
        gnome-browser-connector
        adwaita-icon-theme
        eog
        evince
        file-roller
        gdm
        gvfs
        gvfs-afc
        gvfs-gphoto2
        gvfs-mtp
        gvfs-nfs
        gvfs-smb
        nautilus
        nautilus-sendto
        sushi
        totem
        xdg-user-dirs-gtk
        adw-gtk3
    "

    install_lst "${inlst}"
    exec_log "gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3" "Setting gtk theme to adw-gtk3"
    exec_log "gsettings set org.gnome.desktop.peripherals.keyboard numlock-state true" "Enabling numlock on startup"
}
