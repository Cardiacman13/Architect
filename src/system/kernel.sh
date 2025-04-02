# Load shared functions
source src/cmd.sh

# Install the correct kernel headers for all installed kernels
function install_headers() {
    local kernel_headers=()

    for kernel in /boot/vmlinuz-*; do
        [ -e "${kernel}" ] || continue
        kernel_headers+=("$(basename "${kernel}" | sed -e 's/vmlinuz-//')-headers")
    done

    install_lst "${kernel_headers[*]}"
}

# Apply sysctl performance and memory tuning settings
function configure_sysctl_tweaks() {
    local sysctl_file="/etc/sysctl.d/99-architect-kernel.conf"

    # Remove existing sysctl file if it exists
    if [ -f "$sysctl_file" ]; then
        exec_log "sudo rm $sysctl_file" "$(eval_gettext "Removing existing sysctl performance tweaks")"
    fi

    # Create new sysctl config with system performance optimizations
    exec_log "sudo tee $sysctl_file > /dev/null << 'EOF'
# Kernel performance and memory tuning for desktop systems

# Swap aggressiveness
vm.swappiness = 100

# Virtual file system cache pressure
vm.vfs_cache_pressure = 50

# Writeback thresholds
vm.dirty_bytes = 268435456
vm.dirty_background_bytes = 67108864
vm.dirty_writeback_centisecs = 1500

# Swap read-ahead pages (0 = minimal, better for SSD)
vm.page-cluster = 0

# Disable NMI watchdog
kernel.nmi_watchdog = 0

# Enable unprivileged user namespaces (containers, sandboxing)
kernel.unprivileged_userns_clone = 1

# Lower console log noise
kernel.printk = 3 3 3 3

# Restrict kernel pointer leaks
kernel.kptr_restrict = 2

# Disable kernel replacement at runtime
kernel.kexec_load_disabled = 1

# Increase network receive buffer queue
net.core.netdev_max_backlog = 4096

# Increase max open files / inode cache
fs.file-max = 2097152

# Lower frequency of XFS flusher threads
fs.xfs.xfssyncd_centisecs = 10000
EOF
" "$(eval_gettext "Applying sysctl memory and kernel performance tweaks")"

    # Reload sysctl settings
    exec_log "sudo sysctl --system" "$(eval_gettext "Reloading sysctl parameters")"
}
