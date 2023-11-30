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
        gnome-shell
        gnome-text-editor
        gnome-themes-extra
        gnome-usage
        gnome-browser-connector
        adwaita-icon-theme
        loupe
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
        extension-manager-git
    "

    install_lst "${inlst}"

    uninstall_lst "gnome-software gnome-usage file-roller"

    exec_log "gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3" "Setting gtk theme to adw-gtk3"
    exec_log "gsettings set org.gnome.desktop.peripherals.keyboard numlock-state true" "Enabling numlock on startup"
    exec_log "sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules" "Disable GDM rules to unlock Wayland"
}
