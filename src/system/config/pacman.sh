# Load shared functions
source src/cmd.sh

# Configure pacman and makepkg with user-friendly and performance settings
function config_pacman() {
    # Enable color output in pacman
    exec_log "sudo sed -i 's/^#Color$/Color/' '/etc/pacman.conf'" "$(eval_gettext "Enabling color in pacman")"

    # Enable verbose package lists
    exec_log "sudo sed -i 's/^#VerbosePkgLists$/VerbosePkgLists/' '/etc/pacman.conf'" "$(eval_gettext "Enabling verbose package lists in pacman")"

    # Enable parallel downloads and ILoveCandy easter egg
    exec_log "sudo sed -i '/^#ParallelDownloads/s/^#//; /ParallelDownloads/a\ILoveCandy' '/etc/pacman.conf'" "$(eval_gettext "Enabling parallel downloads and ILoveCandy in pacman")"

    # Enable the multilib repository
    exec_log "sudo sed -i '/^#\[multilib\]/,/^#Include = \/etc\/pacman.d\/mirrorlist/ s/^#//' '/etc/pacman.conf'" "$(eval_gettext "Enabling multilib repository")"

    # Set MAKEFLAGS to use all available CPU cores for compilation
    exec_log "sudo sed -i 's/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j\$(nproc)\"/' /etc/makepkg.conf" "$(eval_gettext "Enabling multithread compilation")"

    # Full system upgrade
    exec_log "sudo pacman -Syyu --noconfirm" "$(eval_gettext "Updating full system \${RED}(might be long)\${RESET}")"

    # Install pacman-contrib for tools like paccache
    exec_log "sudo pacman -S pacman-contrib --noconfirm" "$(eval_gettext "Installing pacman-contrib")"

    # Enable automatic cleaning of old package versions
    exec_log "sudo systemctl enable paccache.timer" "$(eval_gettext "Enabling paccache timer")"

    # Remove existing update-mirrors script if it exists
    if [[ -f /usr/bin/update-mirrors ]]; then
        exec_log "sudo rm /usr/bin/update-mirrors" "$(eval_gettext "Removing existing update-mirrors script")"
    fi

    # Create /usr/bin/update-mirrors script using proper EOF formatting
    exec_log "sudo tee /usr/bin/update-mirrors > /dev/null << 'EOF'
#!/bin/bash
tmpfile=\$(mktemp)
echo \"Using temporary file: \$tmpfile\"
rate-mirrors --save=\$tmpfile arch --max-delay=43200 && \\
  sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup && \\
  sudo mv \$tmpfile /etc/pacman.d/mirrorlist && \\
  sudo pacman -Syyu
EOF" "$(eval_gettext "Creating update-mirrors script")"

    # Make it executable
    exec_log "sudo chmod +x /usr/bin/update-mirrors" "$(eval_gettext "Making update-mirrors script executable")"
}

# Optimize and update mirrorlist using rate-mirrors wrapper
function mirrorlist() {

    # Ensure rate-mirrors is installed
    install_one "rate-mirrors"

    # Use the new /usr/bin/update-mirrors binary
    exec_log "update-mirrors" "$(eval_gettext "Running update-mirrors")"
}
