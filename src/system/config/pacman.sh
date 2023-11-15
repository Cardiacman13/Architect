source src/cmd.sh

function config_pacman() {
    exec_log "sudo sed -i 's/^#Color$/Color/' '/etc/pacman.conf'" "Enabling color in pacman"
    exec_log "sudo sed -i 's/^#VerbosePkgLists$/VerbosePkgLists/' '/etc/pacman.conf'" "Enabling verbose package lists in pacman"
    exec_log "sudo sed -i 's/^#\(ParallelDownloads.*\)/\1/' '/etc/pacman.conf'" "Enabling parallel downloads in pacman"
    exec_log "sudo sed -i '/^#\[multilib\]/,/^#Include = \/etc\/pacman.d\/mirrorlist/ s/^#//' '/etc/pacman.conf'" "Enabling multilib repository"
    exec_log "sudo sed -i 's/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j\$(nproc)\"/' /etc/makepkg.conf" "Enabling multithread compilation"
    exec_log "sudo pacman --noconfirm -Syu" "Updating full system"
}

function mirrorlist() {
    install_one "reflector"
    exec_log "sudo reflector --verbose --score 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist" "Updating mirrorlist"
    exec_log "sudo pacman -Syy" "Updating pacman database"
}
