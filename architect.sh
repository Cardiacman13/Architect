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

if sudo -v; then
    echo; eval_gettext "\${GREEN}Root privileges granted\${RESET}"; echo
else
    echo; eval_gettext "\${RED}Root privileges denied\${RESET}"; echo
    exit 1
fi

if [[ $1 == "-v" ]]; then
    export VERBOSE=true
else
    export VERBOSE=false
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
source src/system/grub-btrfs.sh
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

function little_step() {
    local -r function=$1
    local -r message=$2

    echo -e "\n${YELLOW}${message}${RESET}"
    ${function}
}

function main() {
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
    little_step max_map_count           "$(eval_gettext "Max map count configuration")"
    little_step sound_server            "$(eval_gettext "Sound server configuration")"
    little_step setup_system_loaders    "$(eval_gettext "System loaders configuration")"
    little_step usefull_package         "$(eval_gettext "Useful package installation")"
    little_step grub-btrfs              "$(eval_gettext "grub-btrfs setup")"
    little_step firewall                "$(eval_gettext "Firewall installation")"
    little_step shell_config            "$(eval_gettext "Shell configuration")"

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
