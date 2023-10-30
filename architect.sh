#!/usr/bin/env bash

# ================================================================================================ #
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi
# ================================================================================================ #
if [[ $1 == "-v" ]]; then
    export VERBOSE=true
else
    export VERBOSE=false
fi
export EXEC_LOG_COUNT=0
export ERROR_COUNT=0
# ================================================================================================ #
export LOG_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/logfile_$(date "+%Y%m%d-%H%M%S").log"
if [[ -f "/usr/bin/paru" ]]; then
    export AUR_HELPER="paru"
elif [[ -f "/usr/bin/yay" ]]; then
    export AUR_HELPER="yay"
fi
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
export GREEN=$(tput setaf 2)
export PURPLE=$(tput setaf 5)
export RED=$(tput setaf 1)
export RESET=$(tput sgr0)
# ================================================================================================ #
source src/init.sh
source src/end.sh
source src/de/detect.sh
source src/software/flatpak.sh
source src/software/install.sh
source src/system/config/aur.sh
source src/system/config/pacman.sh
source src/system/drivers/devices.sh
source src/system/kernel.sh
source src/system/other.sh
source src/system/packages.sh
source src/system/shell.sh
# ================================================================================================ #
function main() {
    local -r start_time="$(date +%s)"
    # init
    init_log
    header

    # system
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
    video_drivers
    gamepad
    printer
    bluetooth

    # desktop environment
    detect_de

    # software
    support_flatpak
    install_software

    # end
    endscript
}
# ================================================================================================ #
main