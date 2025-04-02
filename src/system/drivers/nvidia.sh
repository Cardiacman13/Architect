# Load shared commands (assumed to exist)
source src/cmd.sh

# Configure NVIDIA kernel module with advanced options
function nvidia_config() {
    local nvidia_config_file="/etc/modprobe.d/nvidia.conf"

    # Remove existing configuration if it exists
    if [ -f "$nvidia_config_file" ]; then
        exec_log "sudo rm $nvidia_config_file" "$(eval_gettext "Removing existing nvidia.conf file")"
    fi

    # Write optimized NVIDIA kernel module options with inline documentation
    exec_log "sudo tee $nvidia_config_file > /dev/null << 'EOF'
# NVIDIA kernel module parameters for optimized performance and Wayland support

# NVreg_UsePageAttributeTable=1
# Enables better memory management using PAT (Page Attribute Table).
# Can improve CPU-GPU communication performance on supported systems.

# NVreg_InitializeSystemMemoryAllocations=0
# Disables pre-clearing system memory used by the GPU. Gains performance but slightly lowers security.

# NVreg_DynamicPowerManagement=0x02
# Enables dynamic power management on mobile Turing and newer cards.
# Powers off the GPU when idle (for hybrid systems or laptops).

# NVreg_RegistryDwords=RMIntrLockingMode=1
# Experimental feature for better frame pacing, useful for high refresh-rate screens or VR.

# nvidia_drm.modeset=1
# Enables DRM kernel mode setting. Required for Wayland support and PRIME offloading.

options nvidia NVreg_UsePageAttributeTable=1 \\
    NVreg_InitializeSystemMemoryAllocations=0 \\
    NVreg_DynamicPowerManagement=0x02 \\
    NVreg_RegistryDwords=RMIntrLockingMode=1

options nvidia_drm modeset=1
EOF
" "$(eval_gettext "Setting advanced NVIDIA module options")"

    # Ensure early loading of NVIDIA kernel modules at boot
    exec_log "sudo sed -i '/^MODULES=(/ s/)$/ nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf" "$(eval_gettext "Setting early loading of NVIDIA modules")"
}

# Create udev rule to manage NVIDIA runtime power management
function nvidia_runtime_pm_udev_rule() {
    local udev_file="/etc/udev/rules.d/80-nvidia-pm.rules"

    # Remove existing rule if it exists
    if [ -f "$udev_file" ]; then
        exec_log "sudo rm $udev_file" "$(eval_gettext "Removing existing NVIDIA udev rule")"
    fi

    # Create new rule
    exec_log "sudo tee $udev_file > /dev/null << 'EOF'
# Enable runtime PM for NVIDIA VGA/3D controller devices on driver bind
ACTION==\"add|bind\", SUBSYSTEM==\"pci\", DRIVERS==\"nvidia\", \\
    ATTR{vendor}==\"0x10de\", ATTR{class}==\"0x03[0-9]*\", \\
    TEST==\"power/control\", ATTR{power/control}=\"auto\"

# Disable runtime PM for NVIDIA VGA/3D controller devices on driver unbind
ACTION==\"remove|unbind\", SUBSYSTEM==\"pci\", DRIVERS==\"nvidia\", \\
    ATTR{vendor}==\"0x10de\", ATTR{class}==\"0x03[0-9]*\", \\
    TEST==\"power/control\", ATTR{power/control}=\"on\"
EOF
" "$(eval_gettext "Creating NVIDIA udev rule for runtime power management")"
}

# Create a pacman hook to regenerate initramfs after NVIDIA-related changes
function create_pacman_hook() {
    local hook_file="/etc/pacman.d/hooks/nvidia.hook"

    # Remove existing hook if it exists
    if [ -f "$hook_file" ]; then
        exec_log "sudo rm $hook_file" "$(eval_gettext "Removing existing Nvidia pacman hook file")"
    fi

    # Create the new hook
    exec_log "sudo tee $hook_file > /dev/null << 'EOF'
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=File
Target=etc/modprobe.d/nvidia.conf
Target=usr/src/nvidia-*/dkms.conf
Target=usr/lib/modules/*/extramodules/nvidia.ko.*
Target=usr/lib/modules/*/nvidia.ko.*

[Action]
Description=Regenerating initramfs for NVIDIA modules (Wayland/PRIME ready)
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c '"'"'while read -r trg; do case \$trg in linux*) exit 0; esac; done; /usr/bin/mkinitcpio -P'"'"'
EOF
" "$(eval_gettext "Creating pacman hook for NVIDIA module regeneration")"
}

# Optional installation of Intel GPU drivers for hybrid laptops
function nvidia_intel() {
    if ask_question "$(eval_gettext "Do you have an Intel/Nvidia Laptop ?")"; then
        local -r inlst="
            intel-media-driver
            intel-gmmlib
            onevpl-intel-gpu
        "
        install_lst "${inlst}"
    fi
}

# Main function to uninstall legacy NVIDIA drivers and install the correct set
function nvidia_drivers() {
    local -r unlst="
        nvidia
        nvidia-lts
        dxvk-nvapi-mingw
        lib32-nvidia-dev-utils-tkg
        lib32-opencl-nvidia-dev-tkg
        nvidia-dev-dkms-tkg
        nvidia-dev-egl-wayland-tkg
        nvidia-dev-settings-tkg
        nvidia-dev-utils-tkg
        opencl-nvidia-dev-tkg
    "

    uninstall_lst "${unlst}" "$(eval_gettext "Clean old nvidia drivers dependencies")"

    nvidia_config

    local -r inlst="
        nvidia-open-dkms
        nvidia-utils
        lib32-nvidia-utils
        nvidia-settings
        vulkan-icd-loader
        lib32-vulkan-icd-loader
        egl-wayland
        opencl-nvidia
        lib32-opencl-nvidia
        libvdpau-va-gl
        libvdpau
        libva-nvidia-driver
    "
    install_lst "${inlst}"

    nvidia_intel

    if ask_question "$(eval_gettext "Do you want to install CUDA (\${RED}say No if unsure\${RESET}) ?")"; then
        install_one "cuda"
    fi

    exec_log "sudo systemctl enable nvidia-suspend.service nvidia-hibernate.service nvidia-resume.service" "$(eval_gettext "Enabling nvidia services")"

    create_pacman_hook
    nvidia_runtime_pm_udev_rule
}
