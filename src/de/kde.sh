source src/cmd.sh

function install_kde() {
    local -r install_lst=(
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
    )

    for package in "${install_lst[@]}"; do
        exec_log "${AUR} -S --noconfirm --needed ${package}" "installing of ${package}"
    done

    exec_log "sudo echo "Numlock=on" >> /etc/sddm.conf" "Enabling numlock on startup"
}
