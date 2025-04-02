source src/cmd.sh

# Configure pacman and makepkg with user-friendly and performance settings
function config_pacman() {
    # Enable color output in pacman
    exec_log "sudo sed -i 's/^#Color$/Color/' '/etc/pacman.conf'" "$(eval_gettext "Enabling color in pacman")"

    # Enable verbose package lists
    exec_log "sudo sed -i 's/^#VerbosePkgLists$/VerbosePkgLists/' '/etc/pacman.conf'" "$(eval_gettext "Enabling verbose package lists in pacman")"

    # Enable parallel downloads and ILoveCandy easter egg
    exec_log "sudo sed -i 's/^#\(ParallelDownloads.*\)/\1\nILoveCandy/' '/etc/pacman.conf'" "$(eval_gettext "Enabling parallel downloads and ILoveCandy in pacman")"

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
}

# Optimize and update mirrorlist using rate-mirrors with safe backup
function mirrorlist() {
    # Ensure rate-mirrors is installed
    install_one "rate-mirrors"

    # Create a temporary file path for the new mirrorlist (in subshell scope)
    local tmpfile=$(mktemp)
    log_msg "$(eval_gettext "Using temporary file: \${tmpfile}")"

    # Fetch and rate mirrors, storing output to the temporary file
    exec_log "rate-mirrors --save=${tmpfile} arch --max-delay=43200" "$(eval_gettext "Fetching and rating Arch Linux mirrors \${RED}(might be long)\${RESET}")"

    # Backup the existing mirrorlist
    exec_log "sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup" "$(eval_gettext "Backing up old mirrorlist")"

    # Replace with the new mirrorlist
    exec_log "sudo mv ${tmpfile} /etc/pacman.d/mirrorlist" "$(eval_gettext "Applying new mirrorlist")"

    # Refresh package database from new mirrors
    exec_log "sudo pacman -Syyu --noconfirm" "$(eval_gettext "Refreshing package database \${RED}(might be long)\${RESET}")"
}
