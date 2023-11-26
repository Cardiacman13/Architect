source src/de/gnome.sh
source src/de/kde.sh
source src/de/xfce4.sh

function detect_de() {
    local -r message="What is your desktop environment"
    local -r valid_des="GNOME KDE XFCE OTHER"

    read -rp "${message} (${valid_des}) : " choice
    choice="${choice^^}"
    while [[ ! ${valid_des} =~ (^|[[:space:]])"${choice}"($|[[:space:]]) ]]; do
        read -rp "${message} (${valid_des}) : " choice
        choice="${choice^^}"
    done

    case "${choice}" in
    GNOME) install_gnome ;;
    KDE) install_kde ;;
    XFCE) install_xfce ;;
    OTHER) ;;
    *) echo "Invalid desktop environment : ${choice}" ;;
    esac
}
