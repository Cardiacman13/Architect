source src/cmd.sh

function usefull_package() {
    local -r install_lst=(
        gstreamer
        gst-plugins-bad
        gst-plugins-base
        gst-plugins-ugly
        gst-plugin-pipewire
        gstreamer-vaapi
        gst-plugins-good
        gst-libav
        sof-firmware
        fwupd
        xdg-utils
        reflector-simple
        downgrade
        rebuild-detector
        mkinitcpio-firmware
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        neofetch
        power-profiles-daemon
        hunspell
        hunspell-fr
        p7zip
        unrar
        ttf-liberation
        noto-fonts-emoji
        adobe-source-code-pro-fonts
        otf-font-awesome
        ttf-droid
        ntfs-3g
        fuse2
        fuse2fs
        fuse3
        exfat-utils
        bash-completion
        xdg-desktop-portal-gtk
        ffmpegthumbs
        man-db
        man-pages
    )

    for package in ${install_lst[@]}; do
        exec_log "${AUR} -S --noconfirm --needed ${package}" "installation of ${package}"
    done

    if [[ ${BTRFS} == true ]]; then
        exec_log "${AUR} -S --noconfirm --needed btrfs-progs btrfs-assistant" "installation of btrfs support"
    fi
}
