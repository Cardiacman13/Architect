source src/de/gnome.sh
source src/de/kde.sh
source src/de/xfce.sh

function detect_de() {
    local -r valid_des="GNOME KDE XFCE"

    read -rp "What is your graphics card type ? (${valid_des}) : " choice
    choice="${choice^^}"
    while [[ ! ${valid_des} =~ (^|[[:space:]])"${choice}"($|[[:space:]]) ]]; do
        read -rp "What is your graphics card type ? (${valid_des}) : " choice
        choice="${choice^^}"
    done

    case "${choice}" in
    "GNOME") install_gnome ;;
    "KDE") install_kde ;;
    "XFCE") install_xfce ;;
    *) echo "Invalid desktop environment : ${choice}" ;;
    esac

}
