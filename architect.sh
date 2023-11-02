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
    local -r message="$1"
    local -r line="==========================================================================================================="
    local -r line_length=${#line}
    local -r message_length=${#message}
    
    local -r total_padding=$((line_length - message_length))
    local -r padding_side=$((total_padding / 2))
    local padding_right=$padding_side

    if [ $((total_padding % 2)) -ne 0 ]; then
        ((padding_right++))
    fi

    echo -e "==========================================================================================================="
    printf "%s%b%s%b%s\n" \
        "${line:0:padding_side}" \
        "${PURPLE}" "$message" "${RESET}" \
        "${line:0:padding_right}"
    echo -e "==========================================================================================================="
}

function little_step() {
    local -r function="$1"
    local -r message="$2"
    local -r line="-----------------------------------------------------------------------------------------------------------"
    local -r line_length=${#line}
    local -r message_length=${#message}
    
    local -r total_padding=$((line_length - message_length))
    local -r padding_side=$((total_padding / 2))
    local padding_right=$padding_side

    if [ $((total_padding % 2)) -ne 0 ]; then
        ((padding_right++))
    fi

    printf "%s%b%s%b%s\n" \
        "${line:0:padding_side}" \
        "${BLUE}" "$message" "${RESET}" \
        "${line:0:padding_right}"

    ${function}
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
    little_step config_pacman           "Pacman configuration"
    little_step install_aur             "AUR helper installation"
    little_step mirrorlist              "Mirrorlist configuration"
    little_step install_headers         "Kernel headers installation"
    little_step max_map_count           "Max map count configuration"
    little_step sound_server            "Sound server configuration"
    little_step setup_system_loaders    "System loaders configuration"
    little_step usefull_package         "Usefull package installation"
    little_step shell_config            "Shell configuration"

    # drivers
    stepmsg "System configuration"
    little_step video_drivers           "Video drivers installation"
    little_step gamepad                 "Gamepad configuration"
    little_step printer                 "Printer configuration"
    little_step bluetooth               "Bluetooth configuration"

    # desktop environment
    stepmsg "Environment configuration"
    little_step detect_de               "Desktop environment detection"

    # software
    stepmsg "Software installation"
    little_step support_flatpak         "Flatpak support installation"
    little_step install_software        "Software installation"

    # end
    endscript "${start_time}"
}
# ================================================================================================ #
main
