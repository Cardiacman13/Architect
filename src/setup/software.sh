BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/utils.sh"

# This function installs useful software based on user input
function install_useful_software() {
    echo "Installation des logiciels utiles."
    local package_list=() # List of packages to be installed
    local flatpak_list=() # List of flatpaks to be installed

    # Ask user if they want to install Discord and add it to package_list if yes
    if read_user "|- Voulez-vous installer Discord ?"; then
        package_list+=("discord")
    fi

    # Ask user if they want to install Steam and add it to package_list if yes
    if read_user "|- Voulez-vous installer Steam ?"; then
        package_list+=("steam")
    fi

    # Ask user if they want to install Lutris and add it to package_list if yes
    if read_user "|- Voulez-vous installer Lutris ?"; then
        package_list+=("lutris" "wine-staging")
    fi

    # Ask user if they want to install Heroic Games Launcher and add it to package_list if yes
    if read_user "|- Voulez-vous installer Heroic Games Launcher (Epic Games/GOG) ?"; then
        package_list+=("heroic-games-launcher-bin")
    fi
      
        # Ask user if they want to install protonup-qt-bin and add it to package_list if yes
    if read_user "|- Voulez-vous installer protonup-qt ?"; then
        package_list+=("protonup-qt-bin")
    fi

    # Ask user if they want to install Spotify and add it to package_list if yes
    if read_user "|- Voulez-vous installer Spotify ?"; then
        package_list+=("spotify")
    fi

    # Ask user if they want to install OBS (flatpak) and add it to flatpak_list if yes
    if read_user "|- Voulez-vous installer OBS Studio (flatpak) ?"; then
        flatpak_list+=("com.obsproject.Studio")
    fi

    # Ask user if they want to install Libreoffice and add it to package_list if yes
    if read_user "|- Voulez-vous installer LibreOffice ?"; then
        package_list+=("libreoffice-fresh" "libreoffice-fresh-fr")
    fi

    # Ask user if they want to install Gimp and add it to package_list if yes
    if read_user "|- Voulez-vous installer Gimp ?"; then
        package_list+=("gimp")
    fi

    # Ask user if they want to install Visual Studio Code and add it to package_list if yes
    if read_user "|- Voulez-vous installer Visual Studio Code ?"; then
        package_list+=("visual-studio-code-bin")
    fi

    # Ask user if they want to install Open RGB and add it to package_list if yes
    if read_user "|- Voulez-vous installer Open RGB ?"; then
        package_list+=("openrgb-bin")
    fi

    # Install packages in package_list
    echo -e "|- Installation des paquets ${RED}(long)${RESET}"
    for package in "${package_list[@]}"; do
        echo "|- Installation de ${package}."
        yay -S --needed --noconfirm "${package}" >> /dev/null 2>&1
    done

    # Install flatpaks in flatpak_list
    echo "|- Installation des flatpaks."
    for flatpak in "${flatpak_list[@]}"; do
        echo "|- Installation de ${flatpak}"
        flatpak install flathub -y "${flatpak}" >> /dev/null 2>&1
    done

    echo "--------------------------------------------------"
}
