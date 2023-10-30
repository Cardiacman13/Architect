source src/de/gnome.sh
source src/de/kde.sh
source src/de/xfce.sh

function detect_de() {
    local -r valid_des="GNOME KDE XFCE"
    local user_de=""

    while :; do
        read -rp "What desktop environment do you use ? (GNOME/KDE/XFCE) : " user_de
        user_de="${user_de^^}"

        if [[ " ${valid_des} " =~ " ${user_de} " ]]; then
            break
        else
            echo "Invalid desktop environment. Please enter GNOME, KDE, or XFCE."
        fi
    done

    case "$user_de" in
    "GNOME") install_gnome ;;
    "KDE") install_kde ;;
    "XFCE") install_xfce ;;
    *) echo "Invalid desktop environment : ${user_de}" ;;
    esac

}
