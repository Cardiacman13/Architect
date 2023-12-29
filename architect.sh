#!/usr/bin/env bash

export RESET=$(tput sgr0)
export RED=$(tput setaf 1)
export GREEN=$(tput setaf 2)
export YELLOW=$(tput setaf 3)
export BLUE=$(tput setaf 4)
export PURPLE=$(tput setaf 5)

if sudo -v; then
    echo -e "\n${GREEN}Root privileges granted${RESET}"
else
    echo -e "\n${RED}Root privileges denied${RESET}"
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
    display_step "Initialization"
    init_log
    header

    # system
    display_step "System preparation"
    sleep 1
    little_step config_pacman           "Pacman configuration"
    little_step install_aur             "AUR helper installation"
    little_step mirrorlist              "Mirrorlist configuration"
    little_step install_headers         "Kernel headers installation"
    little_step max_map_count           "Max map count configuration"
    little_step sound_server            "Sound server configuration"
    little_step setup_system_loaders    "System loaders configuration"
    little_step usefull_package         "Usefull package installation"
    little_step grub-btrfs              "grub-btrfs setup"
    little_step firewall                "Firewall installation"
    little_step shell_config            "Shell configuration"

    # drivers
    display_step "System configuration"
    sleep 1
    little_step video_drivers           "Video drivers installation"
    little_step gamepad                 "Gamepad configuration"
    little_step printer                 "Printer configuration"
    little_step bluetooth               "Bluetooth configuration"

    # desktop environment
    display_step "Environment configuration"
    sleep 1
    little_step detect_de               "Desktop environment detection"

    # software
    sleep 1
    display_step "Software installation"
    little_step install_software        "Software installation"

    # end
    sleep 1
    endscript "${start_time}"
}

main
