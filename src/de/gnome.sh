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
        gnome-browser-connector
        adwaita-icon-theme
        loupe
        evince
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
        snapshot
        qt6-wayland
    "

    install_lst "${inlst}"

    exec_log "gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3" "$(eval_gettext "Setting gtk theme to adw-gtk3")"
    exec_log "gsettings set org.gnome.desktop.peripherals.keyboard numlock-state true" "$(eval_gettext "Enabling numlock on startup")"
    exec_log "sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules" "$(eval_gettext "Disable GDM rules to unlock Wayland")"
}
