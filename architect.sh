#!/usr/bin/env bash

# Load gettext for translations
. gettext.sh

# Get the script's base directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Set gettext domains for translation
export TEXTDOMAIN="architect"
export TEXTDOMAINDIR="$SCRIPT_DIR/po"

# Set up colors for terminal output
export RESET=$(tput sgr0)
export RED=$(tput setaf 1)
export GREEN=$(tput setaf 2)
export YELLOW=$(tput setaf 3)
export BLUE=$(tput setaf 4)
export PURPLE=$(tput setaf 5)

# Display usage information
function usage() {
    eval_gettext "Usage : ./architect.sh [OPTION]"; echo
    eval_gettext "Options :"; echo
    eval_gettext "  -h --help    : Display this help."; echo
    eval_gettext "  -v --verbose : Verbose mode."; echo
    eval_gettext "  --no-reboot  : Do not reboot the system at the end of the script."; echo
}

# Parse command-line arguments
VALID_ARGS=$(getopt -o hv --long help,verbose,no-reboot -- "$@")
if [[ $? -ne 0 ]]; then
    exit 1
fi

# Process parsed arguments
eval set -- "$VALID_ARGS"
while :; do
    case "$1" in
        -h | --help)
            usage
            exit 1
            ;;
        -v | --verbose)
            export VERBOSE=true
            shift
            ;;
        --no-reboot)
            export NOREBOOT=true
            shift
            ;;
        --)
            shift
            break
            ;;
    esac
done

# Set defaults if variables are not defined
export VERBOSE=${VERBOSE:-false}
export NOREBOOT=${NOREBOOT:-false}

# Ensure the script is not run as root
if [[ $(whoami) == 'root' ]]; then
    echo; eval_gettext "\${RED}Do not run this script as root, use a user with sudo rights\${RESET}"; echo
    exit 1
fi

# Prompt for sudo and test privileges
if sudo -v; then
    echo; eval_gettext "\${GREEN}Root privileges granted\${RESET}"; echo
else
    echo; eval_gettext "\${RED}Root privileges denied\${RESET}"; echo
    exit 1
fi

# Set log file path
export LOG_FILE="$SCRIPT_DIR/logfile_$(date "+%Y%m%d-%H%M%S").log"

# Detect the boot loader
# Detect the boot loader
if [[ -d "/boot/loader/entries" ]]; then
    export BOOT_LOADER="systemd-boot"
elif [[ -f "/boot/grub/grub.cfg" ]] || [[ -d "/boot/grub" ]]; then
    export BOOT_LOADER="grub"
else
    export BOOT_LOADER="other"
fi

# Detect Btrfs usage
if lsblk -o FSTYPE | grep -q btrfs; then
    export BTRFS=true
else
    export BTRFS=false
fi

# Source all modules
source src/init.sh
source src/end.sh
source src/de/detect.sh
source src/software/install.sh
source src/system/internet.sh
source src/system/config/aur.sh
source src/system/config/pacman.sh
source src/system/drivers/bluetooth.sh
source src/system/drivers/printer.sh
source src/system/drivers/gamepad.sh
source src/system/drivers/gpu.sh
source src/system/kernel.sh
source src/system/packages.sh
source src/system/shell.sh
source src/system/firewall.sh
source src/system/apparmor.sh
source src/system/usergroups.sh
source src/system/audio.sh
source src/system/bootloader.sh
source src/system/schedulers.sh
source src/system/zram.sh

# Display a big step with a visual separator
function display_step() {
    local -r message="$1"
    clear
    cat <<-EOF
${BLUE}-----------------------------------------------------------------------------------------------------------

                                   ${message}

-----------------------------------------------------------------------------------------------------------${RESET}
EOF
}

# Check if the OS is Arch Linux (not a derivative)
function check_os() {
    if [[ $(grep '^ID=' /etc/os-release) != "ID=arch" ]]; then
        echo "${RED}Error: This script is only compatible with Arch Linux and not its derivatives.${RESET}"
        exit 1
    fi
}

# Run a small step with a title and a function
function little_step() {
    local -r function=$1
    local -r message=$2

    echo -e "\n${YELLOW}${message}${RESET}"
    ${function}
}

# Main installation logic
function main() {
    check_os
    check_internet || exit 1

    local -r start_time="$(date +%s)"

    # Initialization
    display_step "$(eval_gettext "Initialization")"
    init_log
    header

    # System configuration
    display_step "$(eval_gettext "System preparation")"
    sleep 1
    little_step config_pacman            "$(eval_gettext "Pacman configuration")"
    little_step install_aur              "$(eval_gettext "AUR helper installation")"
    little_step mirrorlist               "$(eval_gettext "Mirrorlist configuration")"
    little_step install_headers          "$(eval_gettext "Kernel headers installation")"
    little_step configure_sysctl_tweaks  "$(eval_gettext "Kernel tweaks")"
    little_step configure_zram           "$(eval_gettext "ZRAM configuration")"
    little_step sound_server             "$(eval_gettext "Sound server configuration")"
    little_step setup_system_loaders     "$(eval_gettext "System loaders configuration")"
    little_step usefull_package          "$(eval_gettext "Useful package installation")"
    little_step configure_sysctl_tweaks  "$(eval_gettext "sysctl kernel tweaks")"
    little_step firewall                 "$(eval_gettext "Firewall installation")"
    # little_step schedulers               "$(eval_gettext "Low Latency Scheduler")"
    # little_step apparmor               "$(eval_gettext "Apparmor installation")"
    little_step shell_config             "$(eval_gettext "Shell configuration")"
    little_step add_groups_to_user       "$(eval_gettext "Adding user to necessary groups")"

    # Driver installation
    display_step "$(eval_gettext "System configuration")"
    sleep 1
    little_step video_drivers            "$(eval_gettext "Video drivers installation")"
    little_step gamepad                  "$(eval_gettext "Gamepad configuration")"
    little_step printer                  "$(eval_gettext "Printer configuration")"
    little_step bluetooth                "$(eval_gettext "Bluetooth configuration")"

    # Desktop environment configuration
    display_step "$(eval_gettext "Environment configuration")"
    sleep 1
    little_step detect_de                "$(eval_gettext "Desktop environment detection")"

    # Software installation
    sleep 1
    display_step "$(eval_gettext "Software installation")"
    little_step install_software         "$(eval_gettext "Software installation")"

    # Final wrap-up
    sleep 1
    endscript "${start_time}"
}

# Launch main procedure
main
