# Source the installation functions for known desktop environments
source src/de/gnome.sh
source src/de/kde.sh
source src/de/xfce4.sh

# Automatically detect and install the appropriate desktop environment configuration
function detect_de() {
    local detected=""
    
    # Get the current desktop environment from standard environment variables
    # Fallback to DESKTOP_SESSION if XDG_CURRENT_DESKTOP is not set
    local desktop_env="${XDG_CURRENT_DESKTOP,,}"
    desktop_env="${desktop_env:-${DESKTOP_SESSION,,}}"

    # Match known desktop environments and run the corresponding setup
    case "$desktop_env" in
        *gnome*)
            detected="GNOME"
            install_gnome
            ;;
        *plasma*|*kde*)
            detected="KDE"
            install_kde
            ;;
        *xfce*)
            detected="XFCE"
            install_xfce
            ;;
        *)
            detected="OTHER"
            echo "$(eval_gettext "No supported DE detected (GNOME, KDE, XFCE). Skipping DE configuration.")"
            return
            ;;
    esac

    # Output the detected environment for logging/debugging
    echo "$(eval_gettext "Detected desktop environment:") $detected"
}
