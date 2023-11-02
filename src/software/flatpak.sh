source src/cmd.sh

function support_flatpak() {
    install_one flatpak
    exec_log "flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo" "add flathub repository"
}
