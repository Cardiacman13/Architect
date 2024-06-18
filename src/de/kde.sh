source src/cmd.sh

function install_kde() {
    local -r inlst="
        konsole
        kwrite
        dolphin
        ark
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
        kcalc
        plasma-systemmonitor
        kwalletmanager
    "

    install_lst "${inlst}"

    if [ ! -f /etc/sddm.conf ]; then
        exec_log "sudo touch /etc/sddm.conf" "$(eval_gettext "Creating /etc/sddm.conf")"
    fi
    exec_log "echo -e '[Theme]\nCurrent=breeze' | sudo tee -a /etc/sddm.conf" "$(eval_gettext "Setting Breeze theme for SDDM")"
    exec_log "echo -e '[General]\nNumlock=on' | sudo tee -a /etc/sddm.conf" "$(eval_gettext "Setting Numlock=on for SDDM")"
    exec_log "echo 'GTK_USE_PORTAL=1' | sudo tee -a /etc/environment" "$(eval_gettext "Setting GTK_USE_PORTAL=1")"
}
