#!/usr/bin/env bash

# ================================================================================================ #
export RESET=$(tput sgr0)
export RED=$(tput setaf 1)
export GREEN=$(tput setaf 2)
export YELLOW=$(tput setaf 3)
export BLUE=$(tput setaf 4)
export PURPLE=$(tput setaf 5)
# ================================================================================================ #
if sudo -v; then
    echo -e "\n${GREEN}Root privileges granted${RESET}"
else
    echo -e "\n${RED}Root privileges denied${RESET}"
    exit 1
fi
# ================================================================================================ #
if [[ $1 == "-v" ]]; then
    export VERBOSE=true
else
    export VERBOSE=false
fi
# ================================================================================================ #
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
# ================================================================================================ #
source src/init.sh
source src/end.sh
source src/de/detect.sh
source src/software/flatpak.sh
source src/software/install.sh
source src/system/config/aur.sh
source src/system/config/pacman.sh
source src/system/drivers/devices.sh
source src/system/drivers/gpu.sh
source src/system/kernel.sh
source src/system/other.sh
source src/system/packages.sh
source src/system/shell.sh
# ================================================================================================ #
function stepmsg() {
    echo "---------------------------------------------------------------------------------------------------------"
    echo -e "|                                               $1                                                      |"
    echo "---------------------------------------------------------------------------------------------------------"
}
# ================================================================================================ #
function main() {
    local -r start_time="$(date +%s)"
    # init
    stepmsg "Initialization"
    init_log
    header

    # system
    stepmsg "System preparation"
    config_pacman
    mirrorlist
    install_aur
    install_headers
    max_map_count
    sound_server
    setup_system_loaders
    usefull_package
    shell_config

    # drivers
    stepmsg "System configuration"
    video_drivers
    gamepad
    printer
    bluetooth

    # desktop environment
    stepmsg "Environment configuration"
    detect_de

    stepmsg "Software installation"
    # software
    support_flatpak
    install_software

    # end
    endscript "${start_time}"
}
# ================================================================================================ #
main
