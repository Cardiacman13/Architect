source src/de/gnome.sh
source src/de/kde.sh
source src/de/xfce.sh

function detect_de() {
    local -r valid_des="GNOME KDE XFCE"
    local choice=""

    while [[ ! ${valid_des} =~ ${choice} ]]; do
        read -rp "What desktop environment do you want to install ? (GNOME/KDE/XFCE) : " choice
        choice="${choice^^}"
    done

    case "${choice}" in
    "GNOME") install_gnome ;;
    "KDE") install_kde ;;
    "XFCE") install_xfce ;;
    *) echo "Invalid desktop environment : ${choice}" ;;
    esac

}
