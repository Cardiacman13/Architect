source src/cmd.sh

function install_kde() {
    local -r inlst="
        powerdevil
        xdg-desktop-portal-kde
        okular
        print-manager
        gwenview
        spectacle
        partitionmanager
        ffmpegthumbs
        qt6-multimedia
        qt6-multimedia-gstreamer
        qt6-multimedia-ffmpeg
        qt6-wayland
        kdeplasma-addons
        powerdevil
        kcalc
        plasma-systemmonitor
        kwalletmanager
    "

    install_lst "${inlst}"
    exec_log "sudo echo "Numlock=on" >> /etc/sddm.conf" "Enabling numlock on startup"
}
