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

    exec_log "sudo sed -i '/Numlock=/d' /etc/sddm.conf" "Removing existing Numlock entry if any"
    exec_log "echo 'Numlock=on' | sudo tee -a /etc/sddm.conf" "Enabling numlock on startup"

    exec_log "sudo sed -i '/Current=/d' /etc/sddm.conf" "Removing existing Current theme entry if any"
    exec_log "echo 'Current=breeze' | sudo tee -a /etc/sddm.conf" "Enabling Breeze SDDM theme"
}
