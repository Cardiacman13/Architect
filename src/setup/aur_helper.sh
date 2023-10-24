# Déclare la variable globale de l'AUR helper
AUR_HELPER=""

install_aur_helper() {
    local git_repo

    # Assurer un choix valide de l'AUR helper
    while true; do
        echo "Choisissez un AUR helper (yay/paru):"
        read -p "Entrez votre choix: " AUR_HELPER 
        AUR_HELPER=$(echo "$AUR_HELPER" | tr '[:upper:]' '[:lower:]')  # Convertir la saisie en minuscules

        if [[ "yay" == "$AUR_HELPER" || "paru" == "$AUR_HELPER" ]]; then
            break
        else
            echo "Choix invalide."
        fi
    done

    # Déterminer le dépôt git en fonction du choix
    case "$AUR_HELPER" in
        yay)
            git_repo="https://aur.archlinux.org/yay-bin.git"
            ;;
        paru)
            git_repo="https://aur.archlinux.org/paru-bin.git"
            ;;
    esac

    # Installer l'AUR helper sélectionné
    echo "Installation de $AUR_HELPER."
    sudo pacman -S --noconfirm git >> /dev/null 2>&1
    git clone $git_repo >> /dev/null 2>&1
    cd "${AUR_HELPER}-bin" || exit
    echo "|- Compilation de $AUR_HELPER."
    makepkg -si --noconfirm >> /dev/null 2>&1
    cd .. || exit
    rm -rf "${AUR_HELPER}-bin" >> /dev/null 2>&1

    # Configurations post-installation
    if [ "$AUR_HELPER" == "yay" ]; then
        yay -Y --gendb >> /dev/null 2>&1
        yay -Y --devel --save >> /dev/null 2>&1
    elif [ "$AUR_HELPER" == "paru" ]; then
        paru --gendb >> /dev/null 2>&1
    fi

    echo "--------------------------------------------------"
}
