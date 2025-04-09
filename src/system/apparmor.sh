source src/cmd.sh

# Fonction pour installer et activer AppArmor

function apparmor() {

    if ask_question "$(eval_gettext "Do you want to install apparmor security module /!\\ Install and activate apparmor? This is a layer with MAC model (high security, but can cause access problems)")"; then
        
        if [[ "$BOOT_LOADER" == "grub" ]]; then
            sudo sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT="/&lsm=landlock,lockdown,yama,integrity,apparmor,bpf /' '/etc/default/grub'
            BOOTLOADER_FOUND=true
        
        elif [[ "$BOOT_LOADER" == "systemd-boot" ]]; then
            sudo sed -i 's/^options="/&lsm=landlock,lockdown,yama,integrity,apparmor,bpf /' '/boot/loader/entries/*_linux.conf'
            BOOTLOADER_FOUND=true
        
        elif [[ "$BOOT_LOADER" == "0" ]]; then
            echo "$(eval_gettext "No valid bootloader detected, skipping ...")"
            BOOTLOADER_FOUND=false
        fi
        
        if [[ "$BOOTLOADER_FOUND" == true ]]; then
            install_lst "apparmor apparmor.d-git"
            sudo systemctl enable --now apparmor.service &> /dev/null
            sudo aa-enforce /etc/apparmor.d/*
        else
            echo "Skipping AppArmor installation due to invalid bootloader."
            exit 1
        fi
    fi
}
