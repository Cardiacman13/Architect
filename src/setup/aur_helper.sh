# Declare the global AUR helper variable
AUR_HELPER=""   

function install_aur_helper() {
    local git_repo

    # Always prompt the user for AUR helper choice
    echo "Choisissez un AUR helper (yay/paru):"
    read -p "Entrez votre choix: " AUR_HELPER 
    AUR_HELPER=$(echo "$AUR_HELPER" | tr '[:upper:]' '[:lower:]')  # Convert input to lowercase

    while [[ ! " yay paru " =~ " ${AUR_HELPER} " ]]; do
        echo "Choix invalide."
        read -p "Entrez yay ou paru: " AUR_HELPER
        AUR_HELPER=$(echo "$AUR_HELPER" | tr '[:upper:]' '[:lower:]')  # Convert input to lowercase
    done

    case "$AUR_HELPER" in
        yay)
            git_repo="https://aur.archlinux.org/yay-bin.git"
            ;;
        paru)
            git_repo="https://aur.archlinux.org/paru-bin.git"
            ;;
    esac

    echo "Installation de $AUR_HELPER."
    sudo pacman -S --noconfirm git >> /dev/null 2>&1
    git clone $git_repo >> /dev/null 2>&1
    cd "${AUR_HELPER}-bin" || exit
    echo "|- Compilation de $AUR_HELPER."
    makepkg -si --noconfirm >> /dev/null 2>&1
    cd .. || exit
    rm -rf "${AUR_HELPER}-bin" >> /dev/null 2>&1

    if [ "$AUR_HELPER" == "yay" ]; then
        yay -Y --gendb >> /dev/null 2>&1
        yay -Y --devel --save >> /dev/null 2>&1
    elif [ "$AUR_HELPER" == "paru" ]; then
        paru --gendb >> /dev/null 2>&1
    fi

    echo "--------------------------------------------------"
}
