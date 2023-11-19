source src/cmd.sh

function sound_server() {
    local -r unlst="
        pulseaudio
        pulseaudio-bluetooth
        pulseaudio-alsa
        pulseaudio-jack
        jack2
        pipewire-media-session 
    "
    local -r inlst="
        pipewire
        wireplumber
        lib32-pipewire
        pipewire-alsa
        pipewire-jack
        pipewire-pulse
        alsa-utils
        alsa-plugins
        alsa-firmware
        alsa-ucm-conf
        sof-firmware
    "

    uninstall_lst "${unlst}" "Cleaning old sound server dependencies"
    install_lst "${inlst}"
}

function setup_system_loaders() {
    log_msg "Checking if GRUB is installed"
    if [[ $BOOT_LOADER != "grub" ]]; then
        return
    fi

    copy_bak "assets/data/hooks" "grub.hook" "/etc/pacman.d/hooks" true
    install_one "update-grub"
}

function firewall() {
    read -rp "Do you want to install a firewall /!\ Install and activate firewalld? The default configuration may block access to printers and other devices on your local network ? (y/N) : " choice
    choice="${choice,,}"

    if [[ $choice =~ ^(yes|y)$ ]]; then
        install_lst "firewalld python-pyqt5 python-capng"
        exec_log "sudo systemctl enable --now firewalld.service" "Enabling firewalld"
    fi
}
