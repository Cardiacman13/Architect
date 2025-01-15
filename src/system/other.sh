source src/cmd.sh
source src/system/grub-btrfs.sh

function sound_server() {
    local -r inlst="
        pipewire
        wireplumber
        lib32-pipewire
        pipewire-alsa
        jack2
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

    exec_log "sudo mkdir -p /etc/pacman.d/hooks" "$(eval_gettext "Creating /etc/pacman.d/hooks")"
    
    if [ ! -f /etc/pacman.d/hooks/grub.hook ]; then
        exec_log "sudo touch /etc/pacman.d/hooks/grub.hook" "$(eval_gettext "Creating /etc/pacman.d/hooks/grub.hook")"
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
    fi

    install_one "os-prober"
    exec_log "sudo sed -i 's/#\s*GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/' '/etc/default/grub'" "$(eval_gettext "Enabling os-prober")"
    exec_log "sudo os-prober" "$(eval_gettext "Running os-prober")"
    exec_log "sudo grub-mkconfig -o /boot/grub/grub.cfg" "$(eval_gettext "Updating GRUB")"
    if ! pacman -Q grub-btrfs &> /dev/null && [[ ${BTRFS} == true ]]; then
        grub-btrfs
    fi
}

function firewall() {
    if ask_question "$(eval_gettext "Do you want to install a firewall /!\ Install and activate firewalld? The default configuration may block access to printers and other devices on your local network ?")"; then
        install_lst "firewalld python-pyqt5 python-capng"
        exec_log "sudo systemctl enable firewalld.service" "$(eval_gettext "Enabling firewalld")"
    fi
}

function performance-optimisation() {
    # exec_log "echo 'kernel.split_lock_mitigate=0' | sudo tee /etc/sysctl.d/99-split-lock.conf" "$(eval_gettext "Disable Intel split-lock")"
    exec_log "echo -e 'vm.swappiness=10' | sudo tee /etc/sysctl.d/99-swappiness.conf" "$(eval_gettext "Setting swappiness to 10")"
}

function add_groups_to_user() {
    local -r groups_lst="sys,network,wheel,audio,lp,storage,video,users,rfkill"
    exec_log "sudo usermod -aG ${groups_lst} $(whoami)" "$(eval_gettext "Adding user to groups: ${groups_lst}")"
}
