source src/cmd.sh

function install_headers() {
    local kernel_headers=()

    for kernel in /boot/vmlinuz-*; do
        [ -e "${kernel}" ] || continue
        kernel_headers+=("$(basename "${kernel}" | sed -e 's/vmlinuz-//')-headers")
    done

    install_lst "${kernel_headers[*]}"
}
