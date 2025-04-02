# Load shared functions
source src/cmd.sh

# Configure the system sound stack using PipeWire and ALSA
function sound_server() {
    # Packages to install for modern audio stack
    local -r inlst="
        pipewire
        wireplumber
        lib32-pipewire
        pipewire-alsa
        jack2
        pipewire-pulse
        alsa-utils
        alsa-plugins
        alsa-firmware
        alsa-ucm-conf
        sof-firmware
    "

    # Remove conflicting or outdated audio components
    local -r unlst="pipewire-jack"

    uninstall_lst "${unlst}" "$(eval_gettext "Cleaning old sound server dependencies")"
    install_lst "${inlst}"
}
