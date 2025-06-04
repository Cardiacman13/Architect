#!/bin/bash

source src/cmd.sh

function apparmor() {
    if ask_question "$(eval_gettext "Do you want to install apparmor security module /!\\ Install and activate apparmor? This is a layer with MAC model. High security, but ${RED}can cause access problems${RESET}")"; then

        if [[ "$BOOT_LOADER" == "grub" ]]; then
            if ! grep -q "lsm=landlock,lockdown,yama,integrity,apparmor,bpf" '/etc/default/grub'; then
                exec_log "sudo sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT=\"/&lsm=landlock,lockdown,yama,integrity,apparmor,bpf /' '/etc/default/grub'" \
                "$(eval_gettext "Adding AppArmor parameters to GRUB configuration")"
            fi
            BOOTLOADER_FOUND=true

        elif [[ "$BOOT_LOADER" == "systemd-boot" ]]; then
            if ! grep -q "lsm=landlock,lockdown,yama,integrity,apparmor,bpf" '/boot/loader/entries/*_linux.conf'; then
                exec_log "sudo sed -i 's/^options=\"/&lsm=landlock,lockdown,yama,integrity,apparmor,bpf /' '/boot/loader/entries/*_linux.conf'" \
                "$(eval_gettext "Adding AppArmor parameters to systemd-boot configuration")"
            fi
            BOOTLOADER_FOUND=true

        elif [[ "$BOOT_LOADER" == "0" ]]; then
            exec_log "echo \"$(eval_gettext "No valid bootloader detected, skipping ...")\"" \
            "$(eval_gettext "No valid bootloader detected")"
            BOOTLOADER_FOUND=false
        fi

        if [[ "$BOOT_LOADER" == "grub" && "$BOOTLOADER_FOUND" == true ]]; then
            if [ -d /sys/firmware/efi ]; then
                exec_log "sudo grub-mkconfig -o /boot/efi/EFI/arch/grub.cfg" \
                "$(eval_gettext "Updating GRUB configuration for EFI systems")"
            else
                exec_log "sudo grub-mkconfig -o /boot/grub/grub.cfg" \
                "$(eval_gettext "Updating GRUB configuration for BIOS systems")"
            fi
            exec_log "install_lst \"apparmor apparmor.d-git\"" \
            "$(eval_gettext "Installing AppArmor packages")"

            exec_log "sudo sed -i -e '\$a write-cache' -e 'Optimize=compress-fast' /etc/apparmor/parser.conf" \
            "$(eval_gettext 'Enabling caching for AppArmor profiles')"

            exec_log "sudo systemctl enable --now apparmor.service &> /dev/null" \
            "$(eval_gettext "Enabling and starting AppArmor service")"

            # Force user to read the important message
            while true; do
                echo "$(eval_gettext "Done! Profiles are in complain mode, to enforce the security reboot and use: ${RED}sudo aa-enforce /etc/apparmor.d/*${RESET}")"
                echo "$(eval_gettext "Type 'yes' to confirm you have read the above message:")"
                read -r confirmation
                if [[ "$confirmation" == "yes" || "$confirmation" == "oui" ]]; then
                    break
                else
                    echo "$(eval_gettext "Please read the message carefully and type 'yes' to confirm.")"
                fi
            done
        else
            exec_log "echo \"$(eval_gettext "Skipping AppArmor installation due to invalid bootloader.")\"" \
            "$(eval_gettext "Skipping AppArmor installation")"
        fi
    fi
}
