source src/cmd.sh

export AUR="yay"

function install_aur() {
    local -r git_url=(
        "https://aur.archlinux.org/yay-bin.git"
        "https://aur.archlinux.org/paru-bin.git"
    )
    local -r aur_name=(
        "yay-bin"
        "paru-bin"
    )
    local id=-1

    echo "Which AUR helper do you want to install (yay or paru)?"
    while true; do
        read -r -p "" choice
        case "$choice" in
        "yay")
            AUR="yay"
            id=0
            break
            ;;
        "paru")
            AUR="paru"
            id=1
            break
            ;;
        *)
            echo "Please enter a valid choice (yay or paru)"
            ;;
        esac
    done

    if [[ $id -eq -1 ]]; then
        echo "Error: Invalid choice"
        return 1
    fi

    exec_log "git clone ${git_url[$id]}" "Cloning of ${aur_name[$id]}"
    cd "${aur_name[$id]}" || return 1
    exec_log "makepkg -si --noconfirm" "Installation of ${aur_name[$id]}"
    cd .. || return 1
    exec_log "rm -rf ${aur_name[$id]}" "Removing ${aur_name[$id]}"
}
