source src/cmd.sh

function install_i3() {
    local -r inlst="
        i3-wm
        i3lock
        i3status
        i3blocks
        xterm
        lightdm-gtk-greeter
        lightdm
        dmenu
    "

    install_lst "${inlst}"
    exec_log "xdg-user-dirs-update" "Updating user directories"
}
