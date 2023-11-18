# 🐧 ARCH LINUX POST-INSTALLATION TUTORIAL AND SCRIPT 📜

### Conditions

> **Note** 📝
> The script works regardless of your choices of DE (Desktop Environment) / BOOT LOADER / FS (File System).
> It's specifically designed for a pure Arch Linux experience (not tested on Garuda, EndeavourOS, Manjaro…)

## 🚀 Arch Linux Post-Install Script

This script is perfect for configuring a **stock Arch** system with a **minimal set of packages** tailored to your needs right after using `archinstall`. Specifically, it's **geared towards gaming**.

> **Before You Begin:**
> Intended for a fresh installation just set up with `archinstall`.
> Ensure you're not running as root and are in a Desktop Environment.
> Not suitable for outdated computers; requires compatibility with the latest NVIDIA drivers.

Execute the following in the terminal to run the script (*requires sudo access*):

```bash
sudo pacman -Sy git base-devel && git clone https://github.com/Cardiacman13/Architect.git ~/Architect && cd ~/Architect && chmod +x ./architect.sh && ./architect.sh
```

### 1. 🚀 Configure Pacman/AUR
Boost Pacman's functionality:
- 🎨 Enabling colored output.
- 📝 Detailed package lists.
- ⚡ Parallel downloads.
- 🔗 Multilib support.

### 2. ⌨️ Adding Useful Aliases
Ease your command-line tasks:
- `update-arch`: Updates your system apps in one go.
- `clean-arch`: Removes unused packages.
- `fix-key`: Solves key-related issues for updates.
- `update-mirrors`: Refreshes your system's mirror list.

### 3. 🎮 GPU Setup for Gaming (AMD, NVIDIA, Intel)
Prepare your system for gaming with :
- 🎮 Proton-GE (via [`GloriousEggroll/proton-ge-custom`](https://github.com/GloriousEggroll/proton-ge-custom) repo).
- 🎮 GPU drivers choises:
  - 📹 AMD and 32-bit library support.
  - 📹 Intel and 32-bit library support.
  - 🔄 NVIDIA choises:
    - **Nvidia**: Standard drivers (recommended for most) with custom hook based on startup system (GRUB or systemd-boot).
    - **Nvidia-all**: For advanced users (via [`Frogging-Family/nvidia-all`](https://github.com/Frogging-Family/nvidia-all) repo).

### 4. 🖥️ Desktop Environment
Choose your DE:
- 🖥️ `GNOME`.
- 🖥️ `KDE Plasma`.
- 🖥️ `XFCE`.
- 🖥️ `i3wm` (custom config coming soon...).

### 5. 📦 Install Base Packages
Essential packages for a rounded experience:
- AUR helpers: [`yay`](https://github.com/Jguer/yay) or [`paru`](https://github.com/Morganamilo/paru).
- 🖋️ Fonts, Emoji.
- 🎬 Codecs.
- ➕ Other crucial packages.

### 6. 🛠️ Miscellaneous Enhancements
Tune-up your system:
- 🎲 Boost `vm.max_map_count` for better Windows game compatibility. [Arch wiki about vm-max-map-count](https://wiki.archlinux.org/title/gaming#Increase_vm.max_map_count)
- 🖨️ Options for Print support.
- 🎵 Bluetooth configuration.
- 🎮 Enhanced support for Xbox, PS4/PS5, 8bitdo controllers.
- 🐟 Suggest Fish shell configuration. (zsh in WIP)

### 7. 🔄 Ask to Install Additional Software
Select additional software based on your needs:

| Name                    | Package                                 | Type    |
|-------------------------|-----------------------------------------|---------|
| Firefox                 | firefox firefox-i18n-fr                 | package |
| Brave                   | brave-bin                               | package |
| Chromium                | chromium                                | package |
| Discord                 | discord                                 | package |
| Steam                   | steam                                   | package |
| Lutris                  | lutris wine-staging                     | package |
| Heroic Games Launcher   | heroic-games-launcher-bin               | package |
| protonup-qt             | protonup-qt-bin                         | package |
| Spotify                 | spotify                                 | package |
| OBS Studio              | com.obsproject.Studio                   | flatpak |
| Kdenlive                | kdenlive                                | package |
| LibreOffice             | libreoffice-fresh libreoffice-fresh-fr  | package |
| Gimp                    | gimp                                    | package |
| VLC                     | vlc                                     | package |
| Visual Studio Code      | visual-studio-code-bin                  | package |
| Open RGB                | openrgb-bin                             | package |

## For developers

## Project Structure Overview

```graphql
.
├── architect.sh          # Main script file to kickstart the installation.
├── assets
│   └── data
│       ├── grub.hook     # GRUB configuration hook for system optimizations.
│       └── nvidia.hook   # NVIDIA driver hook for custom configurations.
├── LICENSE
├── README.md
└── src
    ├── cmd.sh                  # Script for executing common command-line tasks.
    ├── de
    │   ├── detect.sh           # Detects the current Desktop Environment.
    │   ├── gnome.sh            # GNOME setup script.
    │   ├── i3.sh               # i3 window manager setup script.
    │   ├── kde.sh              # KDE Plasma setup script.
    │   └── xfce4.sh            # XFCE setup script.
    ├── end.sh                  # Script executed at the end of the installation.
    ├── init.sh                 # Initial setup script.
    ├── software
    │   ├── flatpak.sh          # Script for installing Flatpak packages.
    │   └── install.sh          # General software installation script.
    └── system
        ├── config
        │   ├── aur.sh          # AUR (Arch User Repository) setup script.
        │   └── pacman.sh       # Pacman configuration script.
        ├── drivers
        │   ├── amd.sh          # AMD GPU drivers installation script.
        │   ├── devices.sh      # Script for detecting connected devices.
        │   ├── gpu.sh          # General GPU setup script.
        │   ├── intel.sh        # Intel GPU drivers installation script.
        │   ├── nvidia.sh       # NVIDIA GPU drivers installation script.
        │   └── vm.sh           # Virtual machine related configurations.
        ├── internet.sh         # Internet connectivity setup script.
        ├── kernel.sh           # Kernel optimization script.
        ├── other.sh            # Other miscellaneous scripts.
        ├── packages.sh         # Script for package installation.
        └── shell.sh            # Shell configuration script.
```

## 📄 Philosophy

This project must respect the [philosophical principles of Archlinux](https://wiki.archlinux.org/title/Arch_Linux#Principles). Please do your best to follow this guideline if you intend to make a pullrequest.

## 📝 License

This project is licensed under the GNU GPLv3 License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Thanks to the [Arch Linux](https://archlinux.org/) team for their amazing work.
- Thanks to the Arch Linux community for their amazing documentation.
- Thanks to the AUR maintainers for their hard work.
- Thanks to the developers of the packages used in this project.