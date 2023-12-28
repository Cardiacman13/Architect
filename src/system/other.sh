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

    uninstall_lst "${unlst}" "$(eval_gettext "Cleaning old sound server dependencies")"
    install_lst "${inlst}"
}

function setup_system_loaders() {
    log_msg "$(eval_gettext "Checking if GRUB is installed")"
    if [[ $BOOT_LOADER != "grub" ]]; then
        return
    fi

    # copy_bak "assets/data/hooks" "grub.hook" "/etc/pacman.d/hooks" true
    
    exec_log "sudo mkdir -p /etc/pacman.d/hooks" "$(eval_gettext "Creating /etc/pacman.d/hooks")"
    if [ ! -f /etc/pacman.d/hooks/grub.hook ]; then
        exec_log "sudo touch /etc/pacman.d/hooks/grub.hook" "$(eval_gettext "Creating /etc/pacman.d/hooks/grub.hook")"
    fi
    exec_log "echo -e '[Trigger]
Type = File
Operation = Install
Operation = Upgrade
Operation = Remove
Target = usr/lib/modules/*/vmlinuz

[Action]
Description = Updating grub configuration ...
When = PostTransaction
Exec = /usr/bin/grub-mkconfig -o /boot/grub/grub.cfg
' | sudo tee -a /etc/pacman.d/hooks/grub.hook" "$(eval_gettext "Setting up GRUB hook")"

    install_lst "update-grub os-prober"
    exec_log "sudo sed -i 's/#\s*GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/' '/etc/default/grub'" "$(eval_gettext "Enabling os-prober")"
    exec_log "sudo os-prober" "$(eval_gettext "Running os-prober")"
    exec_log "sudo update-grub" "$(eval_gettext "Updating GRUB")"
}

function firewall() {
    read -rp "$(eval_gettext "Do you want to install a firewall /!\ Install and activate firewalld? The default configuration may block access to printers and other devices on your local network ? (y/N) : ")" choice
    choice="${choice,,}"

    if [[ $choice =~ ^(yes|y)$ ]]; then
        install_lst "firewalld python-pyqt5 python-capng"
        exec_log "sudo systemctl enable --now firewalld.service" "$(eval_gettext "Enabling firewalld")"
    fi
}
