source src/cmd.sh

function install_headers() {
    local kernel_headers=()

    for kernel in /boot/vmlinuz-*; do
        [ -e "${kernel}" ] || continue
        kernel_headers+=("$(basename "${kernel}" | sed -e 's/vmlinuz-//')-headers")
    done

    install_lst "${kernel_headers[*]}"
}

function max_map_count() {
    local -r sysctl_src="/etc/sysctl.d/99-sysctl.conf"
    local -r key="vm.max_map_count"
    local -r value="2147483642"

    if ! grep -q "^${key}=" "${sysctl_src}" 2>/dev/null; then
        exec_log "sudo sh -c 'echo \"${key}=${value}\" >> ${sysctl_src}'" "Setting ${key} to ${value}"
    fi
}