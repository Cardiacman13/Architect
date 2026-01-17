# Load shared functions
source src/cmd.sh

# Configure pacman and makepkg with user-friendly and performance settings
function config_pacman() {
    # Enable color output in pacman
    exec_log "sudo sed -i 's/^#Color$/Color/' '/etc/pacman.conf'" "$(eval_gettext "Enabling color in pacman")"

    # Enable verbose package lists
    exec_log "sudo sed -i 's/^#VerbosePkgLists$/VerbosePkgLists/' '/etc/pacman.conf'" "$(eval_gettext "Enabling verbose package lists in pacman")"

    # Enable the multilib repository
    exec_log "sudo sed -i '/^#\[multilib\]/,/^#Include = \/etc\/pacman.d\/mirrorlist/ s/^#//' '/etc/pacman.conf'" "$(eval_gettext "Enabling multilib repository")"

    # Set MAKEFLAGS to use all available CPU cores for compilation
    exec_log "sudo sed -i 's/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j\$(nproc)\"/' /etc/makepkg.conf" "$(eval_gettext "Enabling multithread compilation")"

    # Install pacman-contrib for tools like paccache
    # We do a sync (-Syyu) first to ensure we can find the packages
    exec_log "sudo pacman -Syyu --noconfirm pacman-contrib" "$(eval_gettext "Installing pacman-contrib")"

    # Enable automatic cleaning of old package versions
    exec_log "sudo systemctl enable paccache.timer" "$(eval_gettext "Enabling paccache timer")"

    # Remove existing update-mirrors script if it exists
    if [[ -f /usr/bin/update-mirrors ]]; then
        exec_log "sudo rm /usr/bin/update-mirrors" "$(eval_gettext "Removing existing update-mirrors script")"
    fi

    # Create /usr/bin/update-mirrors script using proper EOF formatting
    exec_log "sudo install -m 755 /dev/stdin /usr/bin/update-mirrors << 'EOF'
#!/bin/bash
if [[ \$EUID -ne 0 ]]; then 
   echo \"Error: please run update-mirrors as root (sudo).\"
   exit 1
fi

tmpfile=\$(mktemp)
trap \"rm -f \$tmpfile\" EXIT

echo \"Ranking mirrors (max-delay: 6h)...\"
if rate-mirrors --save=\$tmpfile arch --max-delay=21600; then
    cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup
    mv \$tmpfile /etc/pacman.d/mirrorlist
    echo \"Mirrors optimized. Running system upgrade...\"
    pacman -Syyu --noconfirm
else
    echo \"Failed to rate mirrors. Current mirrorlist preserved.\"
    exit 1
fi
EOF" "$(eval_gettext "Creating update-mirrors script")"
}

# Optimize and update mirrorlist using rate-mirrors wrapper
function mirrorlist() {

    # Ensure rate-mirrors is installed
    install_one "rate-mirrors"

    # Use the new /usr/bin/update-mirrors binary
    # This now handles both mirror ranking AND the full system upgrade
    exec_log "sudo update-mirrors" "$(eval_gettext "Running update-mirrors and full system upgrade")"
}
