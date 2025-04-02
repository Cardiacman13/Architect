# Source the script from src/cmd.sh
source src/cmd.sh

# Function to install KDE applications
function install_kde() {
    # Define a list of KDE applications to install
    local -r inlst="
        konsole
        kwrite
        dolphin
        ark
        xdg-desktop-portal-kde
        okular
        print-manager
        gwenview
        spectacle
        partitionmanager
        ffmpegthumbs
        qt6-multimedia
        qt6-multimedia-gstreamer
        qt6-multimedia-ffmpeg
        qt6-wayland
        kdeplasma-addons
        kcalc
        plasma-systemmonitor
        kwalletmanager
    "
    # Define a list of KDE applications to uninstall
    local -r unlst="discover"

    # Call the unistall_lst function to uninstall the listed applications
    uninstall_lst "${unlst}" "$(eval_gettext "Uninstall discover")"

    # Call the install_lst function to install the listed applications
    install_lst "${inlst}"

    # Check if the SDDM configuration file exists
    if [ ! -f /etc/sddm.conf ]; then
        # Create the SDDM configuration file if it doesn't exist
        exec_log "sudo touch /etc/sddm.conf" "$(eval_gettext "Creating /etc/sddm.conf")"
    fi

    # Set the Breeze theme for SDDM
    exec_log "echo -e '[Theme]\nCurrent=breeze' | sudo tee -a /etc/sddm.conf" "$(eval_gettext "Setting Breeze theme for SDDM")"

    # Enable Numlock for SDDM
    exec_log "echo -e '[General]\nNumlock=on' | sudo tee -a /etc/sddm.conf" "$(eval_gettext "Setting Numlock=on for SDDM")"

    # Ensure 'discover' is added to the IgnorePkg line in /etc/pacman.conf
    #  1. If the line is commented (#IgnorePkg = ...), uncomment and add 'discover' if missing
    #  2. If the line is already uncommented (IgnorePkg = ...), add 'discover' if missing
    exec_log \
        "sudo sed -i -E '
          /^[[:space:]]*#[[:space:]]*IgnorePkg[[:space:]]*=/ {
            s/^[[:space:]]*#[[:space:]]*//            # Remove the # and any leading spaces
            /(\s|^)discover(\s|$)/! s/$/ discover/    # Add discover if it is not already present
            b
          }
          /^[[:space:]]*IgnorePkg[[:space:]]*=/ {
            /(\s|^)discover(\s|$)/! s/$/ discover/    # Add discover if missing
            b
          }
        ' /etc/pacman.conf" \
        "$(eval_gettext "Adding 'discover' to IgnorePkg in /etc/pacman.conf")"
}
