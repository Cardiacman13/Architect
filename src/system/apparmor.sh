source src/cmd.sh

function apparmor() {
    
    if ask_question "$(eval_gettext "Do you want to install apparmor security module /!\\ Install and activate apparmor? This is a layer with MAC model (high security, but can cause access problems)")"; then
    
        if [[ "$BOOT_LOADER" == "grub" ]]; then
            if ! grep -q "lsm=landlock,lockdown,yama,integrity,apparmor,bpf" '/etc/default/grub'; then
            sudo sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT="/&lsm=landlock,lockdown,yama,integrity,apparmor,bpf /' '/etc/default/grub' ; fi
            BOOTLOADER_FOUND=true
        
        elif [[ "$BOOT_LOADER" == "systemd-boot" ]]; then
            if ! grep -q "lsm=landlock,lockdown,yama,integrity,apparmor,bpf" 'boot/loader/entries/*_linux.conf'; then
            sudo sed -i 's/^options="/&lsm=landlock,lockdown,yama,integrity,apparmor,bpf /' '/boot/loader/entries/*_linux.conf'; fi
            BOOTLOADER_FOUND=true
        
        elif [[ "$BOOT_LOADER" == "0" ]]; then
            echo "$(eval_gettext "No valid bootloader detected, skipping ...")"
            BOOTLOADER_FOUND=false
        fi
        
        if [[ "$BOOT_LOADER" == "grub" && "$BOOTLOADER_FOUND" == true ]]; then
            if [ -d /sys/firmware/efi ]; then
                sudo grub-mkconfig -o /boot/efi/EFI/arch/grub.cfg
            else
                sudo grub-mkconfig -o /boot/grub/grub.cfg
            fi
            install_lst "apparmor apparmor.d-git"
            sudo systemctl enable --now apparmor.service &> /dev/null
            echo "$(eval_gettext "Done ! Profiles are in complain mode, to enforce the security reboot and use : sudo aa-enforce /etc/apparmor.d/*")"
        else
            echo "$(eval_gettext "Skipping AppArmor installation due to invalid bootloader.")"
            exit 1
        fi
    fi
}
