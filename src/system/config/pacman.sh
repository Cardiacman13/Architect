source src/cmd.sh

function config_pacman() {
    exec_log "sudo sed -i 's/^#Color$/Color/' '/etc/pacman.conf'" "$(eval_gettext "Enabling color in pacman")"
    exec_log "sudo sed -i 's/^#VerbosePkgLists$/VerbosePkgLists/' '/etc/pacman.conf'" "$(eval_gettext "Enabling verbose package lists in pacman")"
    exec_log "sudo sed -i 's/^#\(ParallelDownloads.*\)/\1\nILoveCandy/' '/etc/pacman.conf'" "$(eval_gettext "Enabling parallel downloads and ILoveCandy in pacman")"
    exec_log "sudo sed -i '/^#\[multilib\]/,/^#Include = \/etc\/pacman.d\/mirrorlist/ s/^#//' '/etc/pacman.conf'" "$(eval_gettext "Enabling multilib repository")"
    exec_log "sudo sed -i 's/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j\$(nproc)\"/' /etc/makepkg.conf" "$(eval_gettext "Enabling multithread compilation")"
    exec_log "sudo systemctl enable --now paccache.timer" "$(eval_gettext "Enabling paccache timer")"
}

function mirrorlist() {
    install_one "reflector"
    exec_log "sudo reflector --verbose --score 100 --latest 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist" "$(eval_gettext "Updating mirrorlist \${RED}(might be long)\${RESET}")"
    exec_log "sudo pacman -Syyu --noconfirm" "$(eval_gettext "Updating full system \${RED}(might be long)\${RESET}")"
    exec_log "sudo pacman -S pacman-contrib --noconfirm" "$(eval_gettext "Installing pacman-contrib")"
}
