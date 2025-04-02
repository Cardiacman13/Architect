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
    # Define a list of KDE applications to uninstall
    local -r unlst="gnome-software"

    # Call the unistall_lst function to uninstall the listed applications
    uninstall_lst "${unlst}" "$(eval_gettext "Uninstall gnome-software")"

    # Call the install_lst function to install the listed applications
    install_lst "${inlst}"

    # Set the GTK theme to adw-gtk3
    exec_log "gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3" "$(eval_gettext "Setting gtk theme to adw-gtk3")"

    # Enable Numlock on startup
    exec_log "gsettings set org.gnome.desktop.peripherals.keyboard numlock-state true" "$(eval_gettext "Enabling numlock on startup")"

    # Disable GDM rules to unlock Wayland
    exec_log "sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules" "$(eval_gettext "Disable GDM rules to unlock Wayland")"

    # Ensure 'gnome-software' is added to the IgnorePkg line in /etc/pacman.conf
    #  1. If the line is commented (#IgnorePkg = ...), uncomment and add 'gnome-software' if missing
    #  2. If the line is already uncommented (IgnorePkg = ...), add 'gnome-software' if missing
    #  3. If the line does not exist at all, append "IgnorePkg = gnome-software" at the end of the file
    exec_log \
        "sed -i -E '
          /^[[:space:]]*#[[:space:]]*IgnorePkg[[:space:]]*=/ {
            s/^[[:space:]]*#[[:space:]]*//             # Remove the # and any leading spaces
            /(\s|^)gnome-software(\s|$)/! s/$/ gnome-software/   # Add gnome-software if it is not already present
            b
          }
          /^[[:space:]]*IgnorePkg[[:space:]]*=/ {
            /(\s|^)gnome-software(\s|$)/! s/$/ gnome-software/   # Add gnome-software if missing
            b
          }
          $ aIgnorePkg = gnome-software                # If no line found, append at EOF
        ' /etc/pacman.conf" \
        "$(eval_gettext "Adding 'gnome-software' to IgnorePkg in /etc/pacman.conf")"
}
