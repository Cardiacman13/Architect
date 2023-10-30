source src/cmd.sh

function support_flatpak() {
    exec_log "${AUR} -S --needed --noconfirm flatpak" "installing flatpak compatibility"
    exec_log "flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo" "add flathub repository"
}
