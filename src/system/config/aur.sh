source src/cmd.sh

export AUR="yay"

function install_aur() {
    local -r git_url=(
        "https://aur.archlinux.org/yay-bin.git"
        "https://aur.archlinux.org/paru-bin.git"
    )
    local -r aur_name=(
        yay-bin
        paru-bin
    )
    local id=0

    echo "Which AUR helper do you want to install (yay or paru)?"
    while true; do
        read -r -p "" choice
        if [[ $choice == "yay" ]]; then
            AUR="yay"
            break
        elif [[ $choice == "paru" ]]; then
            AUR="paru"
            break
        else
            echo "Please enter a valid choice (yay or paru)"
        fi
    done

    if [[ $AUR == "paru" ]]; then
        id=1
    fi

    exec_log "git clone $(git_url[$id])" "cloning of $(aur_name[$id])"
    cd "$(aur_name[$id])"
    exec_log "makepkg -si --noconfirm" "installation of $(aur_name[$id])"
    cd ..
    exec_log "rm -rf $(aur_name[$id])" "removing $(aur_name[$id])"
}