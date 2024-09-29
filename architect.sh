#!/usr/bin/env bash

. gettext.sh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export TEXTDOMAIN="architect"
export TEXTDOMAINDIR="$SCRIPT_DIR/po"

export RESET=$(tput sgr0)
export RED=$(tput setaf 1)
export GREEN=$(tput setaf 2)
export YELLOW=$(tput setaf 3)
export BLUE=$(tput setaf 4)
export PURPLE=$(tput setaf 5)

function usage() {
    eval_gettext "Usage : ./architect.sh [OPTION]"; echo
    eval_gettext "Options :"; echo
    eval_gettext "  -h --help    : Display this help."; echo
    eval_gettext "  -v --verbose : Verbose mode."; echo
    eval_gettext "  --no-reboot  : Do not reboot the system at the end of the script."; echo
}

VALID_ARGS=$(getopt -o hv --long help,verbose,no-reboot -- "$@")
if [[ $? -ne 0 ]]; then
    exit 1;
fi

eval set -- "$VALID_ARGS"
while [ : ]; do
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
    --) shift; 
        break 
        ;;
  esac
done

if [[ -z ${VERBOSE+x} ]]; then
    export VERBOSE=false
fi

if [[ -z ${NOREBOOT+x} ]]; then
    export NOREBOOT=false
fi

if [[ $(whoami) == 'root' ]]; then
    echo; eval_gettext "\${RED}Do not run this script as root, use a user with sudo rights\${RESET}"; echo
    exit 1
fi

if sudo -v; then
    echo; eval_gettext "\${GREEN}Root privileges granted\${RESET}"; echo
else
    echo; eval_gettext "\${RED}Root privileges denied\${RESET}"; echo
    exit 1
fi

export LOG_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/logfile_$(date "+%Y%m%d-%H%M%S").log"
if [[ -d "/boot/loader/entries" ]]; then
    export BOOT_LOADER="systemd-boot"
else
    export BOOT_LOADER="grub"
fi
if [[ $(lsblk -o FSTYPE | grep -c btrfs) -gt 0 ]]; then
    export BTRFS=true
else
    export BTRFS=false
fi

source src/init.sh
source src/end.sh
source src/de/detect.sh
source src/software/install.sh
source src/system/internet.sh
source src/system/config/aur.sh
source src/system/config/pacman.sh
source src/system/drivers/devices.sh
source src/system/drivers/gpu.sh
source src/system/kernel.sh
source src/system/other.sh
source src/system/packages.sh
source src/system/shell.sh

function display_step() {
    local -r message="$1"
    clear
    cat <<-EOF
${BLUE}-----------------------------------------------------------------------------------------------------------

                                   ${message}                                                        

-----------------------------------------------------------------------------------------------------------${RESET}
EOF
}

function check_os() {
    if [[ $(grep '^ID=' /etc/os-release) != "ID=arch" ]]; then
        echo "${RED}Error: This script is only compatible with Arch Linux and not its derivatives.${RESET}"
        exit 1
    fi

}

function little_step() {
    local -r function=$1
    local -r message=$2

    echo -e "\n${YELLOW}${message}${RESET}"
    ${function}
}

function main() {
    check_os
    check_internet || exit 1
    
    local -r start_time="$(date +%s)"
    # init
    display_step "$(eval_gettext "Initialization")"
    init_log
    header

    # system
    display_step "$(eval_gettext "System preparation")"
    sleep 1
    little_step config_pacman           "$(eval_gettext "Pacman configuration")"
    little_step install_aur             "$(eval_gettext "AUR helper installation")"
    little_step mirrorlist              "$(eval_gettext "Mirrorlist configuration")"
    little_step install_headers         "$(eval_gettext "Kernel headers installation")"
    little_step sound_server            "$(eval_gettext "Sound server configuration")"
    little_step setup_system_loaders    "$(eval_gettext "System loaders configuration")"
    little_step usefull_package         "$(eval_gettext "Useful package installation")"
    little_step performance-optimisation
    little_step firewall                "$(eval_gettext "Firewall installation")"
    little_step shell_config            "$(eval_gettext "Shell configuration")"
    little_step add_groups_to_user      "$(eval_gettext "Adding user to necessary groups")"

    # drivers
    display_step "$(eval_gettext "System configuration")"
    sleep 1
    little_step video_drivers           "$(eval_gettext "Video drivers installation")"
    little_step gamepad                 "$(eval_gettext "Gamepad configuration")"
    little_step printer                 "$(eval_gettext "Printer configuration")"
    little_step bluetooth               "$(eval_gettext "Bluetooth configuration")"

    # desktop environment
    display_step "$(eval_gettext "Environment configuration")"
    sleep 1
    little_step detect_de               "$(eval_gettext "Desktop environment detection")"

    # software
    sleep 1
    display_step "$(eval_gettext "Software installation")"
    little_step install_software        "$(eval_gettext "Software installation")"

    # end
    sleep 1
    endscript "${start_time}"
}

main
