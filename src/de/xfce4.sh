source src/cmd.sh

function install_xfce() {
    local -r inlst="
        xfce4
        xfce4-goodies
        pavucontrol
        gvfs
        xarchiver
        xfce4-battery-plugin
        xfce4-datetime-plugin
        xfce4-mount-plugin
        xfce4-netload-plugin
        xfce4-notifyd
        xfce4-pulseaudio-plugin
        xfce4-screensaver
        xfce4-screenshooter
        xfce4-taskmanager
        xfce4-wavelan-plugin
        xfce4-weather-plugin
        xfce4-whiskermenu-plugin
        xfce4-xkb-plugin
        xdg-desktop-portal-xapp
        xdg-user-dirs-gtk
        network-manager-applet
        xfce4-notifyd
        gnome-keyring
        xdg-user-dirs
        blueman
        file-roller
        galculator
        gvfs-afc
        gvfs-gphoto2
        gvfs-mtp
        gvfs-nfs
        gvfs-smb
        lightdm
        lightdm-slick-greeter
        network-manager-applet
        parole
        ristretto
        thunar-archive-plugin
        thunar-media-tags-plugin
        xed
    "

    install_lst "${inlst}"
    exec_log "xdg-user-dirs-update" "Updating user directories"
}
