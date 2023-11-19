source src/cmd.sh

function install_kde() {
    local -r inlst="
        plasma-meta
        konsole
        kwrite
        dolphin
        ark
        plasma-wayland-session
        egl-wayland
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

    if [ ! -f /etc/sddm.conf ]; then
        exec_log "sudo touch /etc/sddm.conf" "Creating /etc/sddm.conf"
    fi
    exec_log "echo -e '[Theme]\nCurrent=breeze' | sudo tee -a /etc/sddm.conf"
    exec_log "echo -e '[General]\nNumlock=on' | sudo tee -a /etc/sddm.conf"
}
