# Load shared functions
source src/cmd.sh


function usefull_package() {
    local inlst="
        joystickwake
        gstreamer
        gst-plugins-bad
        gst-plugins-base
        gst-plugins-ugly
        gst-plugin-pipewire
        gstreamer-vaapi
        gst-plugins-good
        gst-libav
        gstreamer-vaapi
        libva-mesa-driver
        lib32-libva-mesa-driver
        mesa-vdpau
        lib32-mesa-vdpau
        xdg-utils
        rebuild-detector
        fastfetch
        power-profiles-daemon
        ttf-dejavu
        ttf-liberation
        ttf-meslo-nerd
        noto-fonts-emoji
        adobe-source-code-pro-fonts
        otf-font-awesome
        ttf-droid
        ntfs-3g
        fuse2
        fuse2fs
        fuse3
        exfatprogs
        bash-completion
        ffmpegthumbs
        man-db
        man-pages
    "

    if [[ ${BTRFS} == true ]]; then
        inlst+=" btrfs-progs btrfs-assistant btrfs-du btrfsmaintenance"
    fi

    install_lst "${inlst}"
}
