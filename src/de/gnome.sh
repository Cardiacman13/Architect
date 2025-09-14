# Source the script from src/cmd.sh
source src/cmd.sh

# Function to install GNOME applications
function install_gnome() {
    # Define a list of GNOME applications to install
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
        papers
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
        adw-gtk-theme
        snapshot
        qt6-wayland
    "

    # Call the install_lst function to install the listed applications
    install_lst "${inlst}"

    # Set the GTK theme to adw-gtk3
    exec_log "gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3" "$(eval_gettext "Setting gtk theme to adw-gtk3")"

    # Enable Numlock on startup
    exec_log "gsettings set org.gnome.desktop.peripherals.keyboard numlock-state true" "$(eval_gettext "Enabling numlock on startup")"

    # Disable GDM rules to unlock Wayland
    exec_log "sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules" "$(eval_gettext "Disable GDM rules to unlock Wayland")"
}
