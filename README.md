# 🐧 ARCHITECT SCRIPT

A minimalist archlinux configuration script

## Table of Contents

<div align = center>

&ensp;[<kbd> <br> Install with archinstall <br> </kbd>](#archinstall)&ensp;
&ensp;[<kbd> <br> All-in-one script <br> </kbd>](#script)&ensp;
&ensp;[<kbd> <br> Community stuff <br> </kbd>](https://github.com/Cardiacman13/Architect/discussions)&ensp;
&ensp;[<kbd> <br> Wiki <br> </kbd>](https://github.com/Cardiacman13/Architect/wiki)&ensp;
<br><br><br><br></div>

## Before the script, here's a video from A1RM4X to assist you with archinstall <a name="archinstall"/>

<img src="https://github.com/Cardiacman13/tuto-archlinux-fr/blob/main/assets/images/LOGO-A1RM4X-2K.png" width="30" height="30"> [ Install Arch like a boss: Archinstall script ](https://youtu.be/56u5tddLxCI?si=0DKyfDp7hQGTfLny)

## 🚀 Arch Linux Script <a name="script"/>

<img src="https://github.com/Cardiacman13/tuto-archlinux-fr/blob/main/assets/images/LOGO-A1RM4X-2K.png" width="30" height="30"> [ Configure Arch the easy way: Architect project by Cardiac ](https://youtu.be/0MV3MxmO7ns?si=eOMc-e4wdSwv1Fbb)

This script is perfect for configuring a **stock Arch** system with a **minimal set of packages** tailored to your needs right after using [`archinstall`](https://github.com/archlinux/archinstall). Specifically, it's **geared towards gaming**.

> [!IMPORTANT]
> It's specifically designed for a pure Arch Linux experience (not tested on *Garuda*, *Manjaro*, etc.).
> We make all our test based on a fresh install of Arch Linux with [`archinstall`](https://github.com/archlinux/archinstall).
> It is not suitable for outdated computers. Ensure your hardware meets the requirements for the latest Nvidia drivers.

> [!CAUTION]
> The script modifies your system configuration, see the [wiki](https://github.com/Cardiacman13/Architect/wiki) or [community panel](https://github.com/Cardiacman13/Architect/discussions) for more informations.

Execute the following in the terminal to run the script (**requires sudo access**):

```bash
sudo pacman -S git base-devel && git clone https://github.com/Cardiacman13/Architect.git ~/Architect && cd ~/Architect && ./architect.sh
```

## 📝 Main Features

### 1. 🚀 Configure Package Manager
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
- 🎮 GPU drivers choises:
  - 📹 AMD and 32-bit library support.
  - 📹 Intel and 32-bit library support.
  - 🔄 NVIDIA choises:
    - **Nvidia**: Standard drivers **recommended for most**.
    - **Nvidia-all**: For advanced users (via [`Frogging-Family/nvidia-all`](https://github.com/Frogging-Family/nvidia-all) repo).

<img src="https://github.com/Cardiacman13/tuto-archlinux-fr/blob/main/assets/images/LOGO-A1RM4X-2K.png" width="30" height="30"> [ Never struggle again with Nvidia drivers on Linux! NVIDIA ALL by TkG on Arch / Arch based distros ](https://www.youtube.com/watch?v=QW2XGMAu6VE)

### 4. 🖥️ Desktop Environment
Choose your DE:
- 🖥️ `GNOME`.
- 🖥️ `KDE Plasma`.
- 🖥️ `XFCE`.
- 🖥️ `i3wm` ([custom config](https://github.com/wmemcpy/i3-config) coming soon... 😏).

### 5. 📦 Install Base Packages
Essential packages for a rounded experience:
- 📦 AUR helpers: [`yay`](https://github.com/Jguer/yay) or [`paru`](https://github.com/Morganamilo/paru).
- 🖋️ Fonts, Emoji.
- 🎬 Codecs.
- ➕ Other crucial packages.

### 6. 🛠️ Miscellaneous Enhancements
Tune-up your system:
- 🎲 Boost `vm.max_map_count` for better Windows game compatibility. [Arch wiki about vm-max-map-count](https://wiki.archlinux.org/title/gaming#Increase_vm.max_map_count)
- 🖨️ Options for Print support.
- 🎵 Bluetooth configuration.
- 🎮 Enhanced support for Xbox, PS5, 8bitdo controllers.
- 🐟 Suggest Fish shell configuration. (zsh in WIP)
- 📂 Btrfs support in GRUB with grub-btrfs.

---

### 7. 🔄 Ask to Install Additional Software

Select additional softwares based on your needs:

#### **Web Browsers:**
| Name                    | Package                                     | Type    |
|-------------------------|---------------------------------------------|---------|
| Firefox                 | firefox                                     | package |
| Brave                   | brave-bin                                   | package |
| Chromium                | chromium                                    | package |
| Vivaldi                 | vivaldi                                     | package |
| Google Chrome           | google-chrome                               | package |
| Microsoft Edge          | microsoft-edge-stable-bin                   | package |

#### **System Utilities:**
| Name                    | Package                                     | Type    |
|-------------------------|---------------------------------------------|---------|
| Arch Update             | arch-update                                 | package |
| PAMAC                   | pamac-all                                   | package |
| Open RGB                | openrgb                                     | package |

#### **Communication:**
| Name                    | Package                                     | Type    |
|-------------------------|---------------------------------------------|---------|
| Discord                 | discord                                     | package |
| Telegram                | telegram-desktop                            | package |

#### **Media and Design:**
| Name                    | Package                                     | Type    |
|-------------------------|---------------------------------------------|---------|
| OBS Studio              | obs-studio                                  | package |
| Kdenlive                | kdenlive                                    | package |
| Davinci Resolve         | davinci-resolve                             | package |
| Gimp                    | gimp                                        | package |
| Inkscape                | inkscape                                    | package |
| Krita                   | krita                                       | package |
| VLC                     | vlc                                         | package |
| MPV                     | mvp                                         | package |
| Kazam                   | kazam                                       | package |

#### **Productivity and Office:**
| Name                    | Package                                     | Type    |
|-------------------------|---------------------------------------------|---------|
| LibreOffice             | libreoffice-fresh                           | package |
| OnlyOffice              | onlyoffice-bin                              | package |
| Visual Studio Code      | visual-studio-code-bin                      | package |

#### **Entertainment and Gaming:**
| Name                    | Package                                     | Type    |
|-------------------------|---------------------------------------------|---------|
| Steam                   | steam                                       | package |
| Lutris                  | lutris wine-staging                         | package |
| Heroic Games Launcher   | heroic-games-launcher-bin                   | package |
| Goverlay                | goverlay                                    | package |
| Gamemode                | gamemode                                    | package |
| Spotify                 | spotify                                     | package |

---

## Troubleshooting

For help, open a conversation in the [conversation section](https://github.com/Cardiacman13/Architect/discussions)

## Sources

Sources and useful links :
- [ArchWiki](https://wiki.archlinux.org/)
- [Site GLF](https://www.gaminglinux.fr/)
- [GLF Discord](http://discord.gg/EP3Jm8YMvj)
- [My Youtube channel](https://www.youtube.com/@Cardiacman)

## 🙏 Acknowledgments

- [Arch Linux](https://archlinux.org/) team for their amazing work.
- Arch Linux community for their amazing documentation.
- AUR maintainers for their hard work.
- All contributors.
- Developers of the packages used in this project. Special mention to : 
- [Frogging Family](https://github.com/Frogging-Family)
- [OpenRGB](https://github.com/CalcProgrammer1/OpenRGB)
- Thanks to the [GLF Discord](https://discord.gg/6t4REDETJd) for the numerous tests and feedback.
- Huge thanks to [wmemcpy](https://github.com/wmemcpy) for all his work on this project.
- Thanks to [Skythrew](https://github.com/Skythrew) for his work on the French translation.
- Thanks to [A1RM4X](https://www.youtube.com/A1RM4X) for his videos about archinstall and this project.
