source src/de/gnome.sh
source src/de/kde.sh
source src/de/xfce4.sh

function detect_de() {
    other="$(eval_gettext "OTHER")"
    local -r valid_des="GNOME KDE XFCE $other"

    read -rp "$(eval_gettext "What is your desktop environment") (${valid_des}) : " choice
    choice="${choice^^}"
    while [[ ! ${valid_des} =~ (^|[[:space:]])"${choice}"($|[[:space:]]) ]]; do
        read -rp "$(eval_gettext "What is your desktop environment") (${valid_des}) : " choice
        choice="${choice^^}"
    done

    case "${choice}" in
    GNOME) install_gnome ;;
    KDE) install_kde ;;
    XFCE) install_xfce ;;
    $other) ;;
    *) eval_gettext "Invalid desktop environment : ${choice}"; echo ;; # Inutile ?
    esac
}
