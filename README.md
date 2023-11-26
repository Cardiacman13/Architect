# 🐧 ARCHITECT SCRIPT AND TUTORIALS 📜

[**Version Française**](https://github.com/Cardiacman13/Tuto-Arch/blob/main/lang/README.fr.md) / [**Versión Española**](https://github.com/Cardiacman13/Tuto-Arch/blob/main/lang/README.es.md) / [**Versione italiana**](https://github.com/Cardiacman13/Tuto-Arch/blob/main/lang/README.it.md) / [**deutsche Version**](https://github.com/Cardiacman13/Tuto-Arch/blob/main/lang/README.de.md)


<img src="https://github.com/Cardiacman13/Architect/blob/main/assets/images/desktop.png" width="1000" height="250">


## Table of Contents
1. [All-in-one script](#script)
2. [Tutorial](#elevate)
3. [Gaming](#gaming)
4. [Optimization](#optimization)
5. [Troubleshooting](#troubleshooting)
6. [Community stuff](#community)

## 🚀 Arch Linux Post-Install Script <a name="script"/>

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Welcome.png">

This script is perfect for configuring a **stock Arch** system with a **minimal set of packages** tailored to your needs right after using `archinstall`. Specifically, it's **geared towards gaming**.

> [!IMPORTANT]
> 
> It's specifically designed for a pure Arch Linux experience (not tested on *Garuda*, *Manjaro*, etc.).
> 
> We make all our test based on a fresh install of Arch Linux with [`archinstall`](https://github.com/archlinux/archinstall).
> 
> Ensure you're not running as root and are in a "Desktop Environment" (GNOME, KDE Plasma, i3wm, etc.).
>
> It is not suitable for outdated computers. Ensure your hardware meets the requirements for the latest Nvidia drivers.

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
- 🎮 Proton-GE (via [`GloriousEggroll/proton-ge-custom`](https://github.com/GloriousEggroll/proton-ge-custom) repo).
- 🎮 GPU drivers choises:
  - 📹 AMD and 32-bit library support.
  - 📹 Intel and 32-bit library support.
  - 🔄 NVIDIA choises:
    - **Nvidia**: Standard drivers **recommended for most**.
    - **Nvidia-all**: For advanced users (via [`Frogging-Family/nvidia-all`](https://github.com/Frogging-Family/nvidia-all) repo).

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

### 7. 🔄 Ask to Install Additional Software
Select additional software based on your needs:

| Name                    | Package                                     | Type    |
|-------------------------|---------------------------------------------|---------|
| OBS Studio (flatpak)    | com.obsproject.Studio                       | flatpak |
| OBS Studio (from repo)  | obs-studio                                  | package |
| Firefox                 | firefox firefox-i18n-lang                   | package |
| Brave                   | brave-bin                                   | package |
| Chromium                | chromium                                    | package |
| Vivaldi                 | vivaldi                                     | package |
| Google Chrome           | google-chrome                               | package |
| Microsoft Edge          | microsoft-edge-stable-bin                   | package |
| Discord                 | discord                                     | package |
| Steam                   | steam                                       | package |
| Lastest proton GE       | proton-ge-custom-bin                        | package |
| Lutris                  | lutris wine-staging                         | package |
| Heroic Games Launcher   | heroic-games-launcher-bin                   | package |
| Goverlay                | goverlay                                    | package |
| protonup-qt             | protonup-qt-bin                             | package |
| Spotify                 | spotify                                     | package |
| Kdenlive                | kdenlive                                    | package |
| Davinci Resolve         | davinci-resolve                             | package |
| Davinci Resolve Studio  | davinci-resolve-studio                      | package |
| LibreOffice             | libreoffice-fresh libreoffice-fresh-lang    | package |
| OnlyOffice              | onlyoffice-bin                              | package |
| Gimp                    | gimp                                        | package |
| Inkscape                | inkscape                                    | package |
| Krita                   | krita                                       | package |
| VLC                     | vlc                                         | package |
| Visual Studio Code      | visual-studio-code-bin                      | package |
| Virtualbox              | virtualbox-host-dkms virtualbox-guest-iso   | package |
| Open RGB                | openrgb-bin                                 | package |
| Arch Update             | arch-update                                 | package |

## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/pc.png" width="30" height="30"> **Elevate Your Desktop** <a name="elevate"/>

### Installation

> [!IMPORTANT]
> Follow the steps meticulously

For all the following steps, when you have text presented in this way, it will indicate a command to type in your terminal:

```
echo "Hello world !"            # Example command
```

#### 1. Set up your Wi-Fi

```
iwctl
```

Then, replace `YOUR-WIFI-NAME` with the name of your wifi `(SSID)`

```
station wlan0 connect YOUR-WIFI-NAME
```

Enter your wifi password then `quit` to exit iwctl.

#### 2. Archinstall

```
pacman -Syu archinstall     # update the archinstall script before installation
archinstall                 # to launch the installation help script for arch linux
```

**/!\ The archinstall menu is subject to change with updates to the script /!\\**
    
### Post-installation

#### 1. Optimize pacman

This [modification](https://wiki.archlinux.org/title/Pacman#Enabling_parallel_downloads) allows for parallelization of package downloads.

```
sudo nano /etc/pacman.conf
```

Uncomment (remove the **#** from the following lines):
   
```
#Misc options
#UseSyslog
Color <-
#NoProgressBar
#CheckSpace
VerbosePkgLists <- 
ParallelDownloads = 5 <-
```

#### 2. Installing AUR helper

AUR helpers are handy tools for managing the installation and updating of software on Arch Linux-based systems.
Yay and paru especially make it easier to use the AUR repository, a community-managed repository that significantly expands the available software library. This includes compiling these programs from their source, unless "-bin" is specified at the end of their name.
**/!\ Be cautious /!\ As the packages in AUR are community-provided, don't install just anything!**

You can choose between **YAY** or **Paru**

[Yay](https://github.com/Jguer/yay)
   
```
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```

Adding support for updates of git packages. (Normally only needs to be done once)

```
yay -Y --gendb
yay -Y --devel --save
```

[Paru](https://github.com/Morganamilo/paru)
   
```
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
```

Adding support for updates of git packages. (Normally only needs to be done once)

```
paru --gendb
```

#### 3. Maintenance aliases:

This modification allows you to simply type “update-arch” in a terminal to update the system, “clean-arch” to clean it, or “fix-key” in case of an error with the gpg keys.

```
nano ~/.bashrc
```

Add each of these lines to the end of the file:

For yay :

```
alias update-arch='yay -Syu && flatpak update'
```

```
alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'
```

For Paru :

```
alias update-arch='paru -Syu && flatpak update'
```

```
alias clean-arch='paru -Sc && paru -c && flatpak remove --unused'
```

for everyone : 

```
alias update-mirrors='sudo reflector --verbose --score 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist'
```

```
alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
```

 Restart the terminal.

#### 4. multithread Compilation of AUR Packages:

```
nano /etc/makepkg.conf
```

To use all threads, add:

```
MAKEFLAGS="-j$(nproc)"
```

Or if, for example, you want to use 6 threads:

```
MAKEFLAGS="-j6"
```

Replace 6 with the number of thread you want to use, it is advisable to have 2GB of RAM per core used.

### HARDWARE SUPPORT

#### NVIDIA (stay on X11 at least until the release of KDE 6)

#### 1. Install the core components:

```
yay -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
```

#### 2. Enable nvidia-drm.modeset=1:

This setting allows the Nvidia module to be launched at startup.

- **If using systemd boot**

In the folder:

```
/boot/loader/entries/
```

There are several .conf files, you need to add nvidia-drm.modeset=1 to the “options” line of each file.
Example: options root=PARTUUID=fb680c54-466d-4708-a1ac-fcc338ed57f1 rw rootfstype=ext4 nvidia-drm.modeset=1

- **If using GRUB**

```
sudo nano /etc/default/grub
```

Add **nvidia-drm.modeset=1** to the "grub_cmdline_linux_default=" line

Example: GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia-drm.modeset=1"

Then:

```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
   
#### 3. Load Nvidia modules as a priority at Arch launch:

**Optional**, to be done only if you notice issues during boot.

```
sudo nano /etc/mkinitcpio.conf
```

Modify the MODULES=() line to:

```
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```

If using btrfs:

```
MODULES=(btrfs nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```

#### 4. Unlock Wayland if you are on Gnome:

sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules

#### 5. Rebuilding initramfs:

Since we've already installed the drivers at step 1, thus before setting up the hook, we need to manually trigger the initramfs rebuilding:

```
sudo mkinitcpio -P
```

#### AMD (do not do if Nvidia)

Install the core components:

```
sudo pacman -S --needed mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader vulkan-mesa-layers lib32-vulkan-mesa-layers
```

#### INTEL (do not do if Nvidia)

Install the core components:

```
sudo pacman -S --needed mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader intel-media-driver
```

#### Printers
- Essentials

```
sudo pacman -S --needed ghostscript gsfonts cups cups-filters cups-pdf system-config-printer avahi
sudo systemctl enable --now avahi-daemon cups
```

- Drivers

```
sudo pacman -S --needed foomatic-db-engine foomatic-db foomatic-db-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds gutenprint foomatic-db-gutenprint-ppds
```

- HP Printers
    
```
yay -S --needed python-pyqt5 hplip
```

- Epson Printers
    
```
yay -S --needed epson-inkjet-printer-escpr epson-inkjet-printer-escpr2 epson-inkjet-printer-201601w epson-inkjet-printer-n10-nx127
```

#### Bluetooth

The second command below asks systemd to immediately start the bluetooth service, and also to activate it on every boot.

```
sudo pacman -S --needed bluez bluez-utils bluez-plugins
sudo systemctl enable --now  bluetooth.service
```

#### [PipeWire](https://pipewire.org/) (son)

**/!\ Say yes to everything to crush everything with the new packages. /!\**

```
sudo pacman -S --needed pipewire lib32-pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber alsa-utils alsa-firmware alsa-tools sof-firmware
```

### BASIC SOFTWARE

#### Basic Components

Here you will find codecs, utilities, fonts, drivers:

```
yay -S --needed gst-plugins-bad gst-plugins-base gst-plugins-ugly gst-plugin-pipewire gstreamer-vaapi gst-plugins-good gst-libav gstreamer downgrade rebuild-detector mkinitcpio-firmware xdg-desktop-portal-gtk xdg-desktop-portal neofetch power-profiles-daemon lib32-pipewire hunspell hunspell-fr hunspell-en p7zip unrar ttf-liberation noto-fonts noto-fonts-emoji adobe-source-code-pro-fonts otf-font-awesome ttf-droid ntfs-3g fuse2fs exfat-utils fuse2 fuse3 bash-completion man-db man-pages
```

#### Miscellaneous Software

```
yay -S libreoffice-fresh libreoffice-fresh-fr vlc discord gimp obs-studio gnome-disk-utility visual-studio-code-bin
```

#### KDE Software

Here are various software for graphics, video (editing, codec support), graphical interface utilities, etc.

```
sudo pacman -S --needed xdg-desktop-portal-kde okular print-manager kdenlive gwenview spectacle partitionmanager ffmpegthumbs qt6-wayland kdeplasma-addons powerdevil kcalc plasma-systemmonitor qt6-multimedia qt6-multimedia-gstreamer qt6-multimedia-ffmpeg kwalletmanager
```

#### Firewall

The default configuration may block access to printers and other devices on your local network.
Here is a little link to help you: https://www.dsfc.net/infra/securite/configurer-firewalld/

```
sudo pacman -S --needed --noconfirm firewalld python-pyqt5 python-capng
sudo systemctl enable --now firewalld.service
firewall-applet &
```

#### Reflector for automatic mirror updates

```
yay -S reflector-simple
```

A command to generate a list of mirrors, to be done once after the first installation and repeated if you travel, or change countries, or if you find package downloading too slow, or if you encounter an error telling you that a mirror is down:

```
sudo reflector --verbose --score 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist
```

#### Arch Update

- [arch-update](https://github.com/Antiz96/arch-update)

An update notifier/applier for Arch Linux that assists you with important pre/post update tasks and that includes a (.desktop) clickeable icon that can easily be integrated with any DE/WM, dock, status/launch bar or app menu.
Optional support for AUR/Flatpak packages updates and desktop notifications.

```
yay -S arch-update
systemctl --user enable --now arch-update.timer
```

#### Timeshift

- [Timeshift](https://github.com/linuxmint/timeshift) is an open-source Linux utility for creating backups of your entire system.

**/!\ WARNING: By default, only the system is backed up, not your user folder (/home/)! /!\\**

```
sudo pacman -S timeshift
```

- Avoid timeshift and Btrfs on Arch, I've had [issues](https://github.com/linuxmint/timeshift) before.

*“BTRFS snapshots are supported only on BTRFS systems having an Ubuntu-type subvolume layout.”*

- To enable automatic backups, you will need to start cronie. (optional)

```
sudo systemctl enable --now cronie
```
  
#### Fish

[Fish](https://fishshell.com/) is a command-line shell designed to be interactive and user-friendly. See also [ArchWiki](https://wiki.archlinux.org/title/fish) on the subject. It replaces the default shell, bash.

- Install fish.

```
sudo pacman -S fish               # 1. install fish
chsh -s /usr/bin/fish             # 2. Set it as default.
fish                              # 3. Run fish or reboot and it will default.
fish_update_completions           # 4. Update completions.
set -U fish_greeting              # 5. Remove welcome message.
nano ~/.config/fish/config.fish   # 6. Create an alias as for bash at the beginning of this tutorial.
```

- Then add the following aliases between if and end:

For yay :

```
alias update-arch='yay -Syu && flatpak update'
```

```
alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'
```

For paru :

```
alias update-arch='paru -Syu && flatpak update'
```

```
alias clean-arch='paru -Sc && paru -c && flatpak remove --unused'
```

For everyone :

```
alias update-mirrors='sudo reflector --verbose --score 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist'
```

```
alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
```

- ***Reboot unless done in step 3***, aliases of any kind only work after restarting the terminal.

## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/game-console.png" width="30" height="30"> **Level Up Your Gaming** <a name="gaming"/>

### Steam

Note that AMD or Nvidia drivers must be installed beforehand as mentioned in the [HARDWARE SUPPORT](#HARDWARE-SUPPORT) section.

```
yay -S steam
```

### Lutris

Lutris is a FOSS (Free, Open Source) game manager for Linux-based operating systems.
Lutris allows searching for a game or a platform (Ubisoft Connect, EA Store, GOG, Battlenet, etc.) and proposes an installation script that will configure what's needed for your choice to work with Wine or Proton.

```
sudo pacman -S lutris wine-staging
```

### Advanced controller support

Advanced Linux driver for Xbox 360|One|S|X wireless controllers (supplied with Xbox One S) and a lot of other controllers like 8bitdo ([xpadneo](https://github.com/atar-axis/xpadneo)) ([xone](https://github.com/medusalix/xone))

```
yay -S xpadneo-dkms-git 
```

Advanced Linux driver for PS5 controllers:

```
yay -S dualsensectl-git
```

### Displaying in-game performance

[MangoHud](https://wiki.archlinux.org/title/MangoHud) is a Vulkan and OpenGL overlay that allows monitoring system performance within applications and recording metrics for benchmarking.
It's the tool you need if you want to see your in-game FPS, your CPU or GPU load, etc. Or even record these results in a file.
Here, we install GOverlay which is a graphical interface to configure MangoHud.

```
sudo pacman -S goverlay
```

### Improving compatibility of Windows games

We increase the default value of this variable, allowing for the storage of more "memory map areas". The default value is very low. The goal is to improve compatibility with Windows games via Wine or Steam (See [ProtonDB](https://www.protondb.com/)), knowing that some poorly optimized games tend to reach this limit quickly, which can result in a crash.

Ajouter dans :

```
sudo nano /etc/sysctl.d/99-sysctl.conf
``` 

la ligne suivante:

` 
vm.max_map_count=2147483642
`

## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/speed.png" width="30" height="30"> **Optimization**: <a name="optimization"/>

### [Kernel TKG](https://github.com/Frogging-Family/linux-tkg)

> [!WARNING]
> This step is intended for advanced users :star:

[TKG](https://github.com/Frogging-Family) is a highly customizable kernel build that provides a selection of fixes and tweaks to improve desktop and gaming performance.

```
git clone https://github.com/Frogging-Family/linux-tkg.git
cd linux-tkg
makepkg -si
```

### [MESA-TKG](https://github.com/Frogging-Family/mesa-git)

> [!WARNING]
> This step is intended for advanced users :star:

Just like the TkG kernel, but for Mesa, a patched version to add a few fixes and optimizations.
Very useful for AMD players, of no interest to Nvidia players.

```
git clone https://github.com/Frogging-Family/mesa-git.git
cd mesa-git
makepkg -si
```
Say yes to everything to overwrite everything with new packages.

### [NVIDIA-ALL](https://github.com/Frogging-Family/nvidia-all)

> [!WARNING]
> This step is intended for advanced users :star:

Nvidia-all is an integration of the nvidia driver by TkG. It includes support patches for new kernels. It lets you select the driver version you want to install, whether it's the latest official version, a beta version, the Vulkan version, etc.

```
git clone https://github.com/Frogging-Family/nvidia-all.git
cd nvidia-all
makepkg -si
```

Say yes to everything to overwrite everything with new packages.

### Installation [Flatpak](https://wiki.archlinux.org/title/Flatpak)

Formerly known as xdg-app, this is a software deployment and package management utility for Linux. It is promoted as offering a "sandbox" environment in which users can run software in isolation from the rest of the system.

```
sudo pacman -S flatpak flatpak-kcm
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

## Troubleshooting <a name="troubleshooting"/>

- For help, visit the GLF Discord (fr/en): [Discord GLF](http://discord.gg/EP3Jm8YMvj)

## Sources <a name="community"/>

Sources and useful links :
- [ArchWiki](https://wiki.archlinux.org/)
- [Site GLF](https://www.gaminglinux.fr/)
- [GLF Discord](http://discord.gg/EP3Jm8YMvj)
- [My Youtube channel](https://www.youtube.com/@Cardiacman)

## Contribution

Contributions to this project are welcome! If you have suggestions, bug reports, or contributions, please open an issue or a pull request in the repository.

As you can see this project is available in French, English, Spanish, Italian & German. Translators are more than welcome ! :people_holding_hands:

## 🙏 Acknowledgments

- [Arch Linux](https://archlinux.org/) team for their amazing work.
- Arch Linux community for their amazing documentation.
- AUR maintainers for their hard work.
- developers of the packages used in this project. Special mention to : 
- [Frogging Family](https://github.com/Frogging-Family)
- [OpenRGB](https://github.com/CalcProgrammer1/OpenRGB)
- Thanks to the [GLF Discord](https://discord.gg/6t4REDETJd) for the numerous tests and feedback.
- Huge thanks to [wmemcpy](https://github.com/wmemcpy) for all his work on this project.
