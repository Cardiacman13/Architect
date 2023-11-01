source src/cmd.sh

function usefull_package() {
    local -r inlst="
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
        ffmpegthumbs
        man-db
        man-pages
    "

    install_lst "${inlst}"

    if [[ ${BTRFS} == true ]]; then
        install_lst "btrfs-progs btrfs-assistant"
    fi
}
