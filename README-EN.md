# ARCHITECT SCRIPT

[![fr](https://img.shields.io/badge/langue-français-blue.svg)](https://github.com/Cardiacman13/Architect)

A post-installation script for Arch Linux, designed to configure a standard Arch system with a minimal set of packages tailored to my needs right after using `archinstall`. Geared towards gaming, this script is intended for a pure Arch Linux experience.

> [!WARNING]  
> This script was developed based on [this tutorial](https://github.com/Cardiacman13/tuto-archlinux-fr), originally derived from personal notes to meet my specific needs. I can confirm that it works perfectly on my PC and fully satisfies me. **However, I cannot guarantee that it will yield the same results on your hardware or meet your needs. Use it at your own risk. Happy scripting!**
>
> This is not a distribution but a configuration script meant to save time in post-installation. The maintenance and management of your Arch Linux are your responsibility after using it.
>
> Arch Linux is a DIY (Do It Yourself) distribution. It's crucial to have solid technical skills or be ready to extensively consult the documentation. It is unrealistic to stick with Arch Linux if you constantly rely on others for help. In case of issues, you absolutely must be able to troubleshoot and fix them quickly on your own. Otherwise, you risk becoming dependent on others or spending hours repeatedly fixing or reinstalling.
>
> Excerpt from the [official Arch Linux WIKI](https://wiki.archlinux.org/title/Arch_Linux): "While many GNU/Linux distributions aim to be more user-friendly, Arch Linux has always been, and will remain, user-centric. It is designed to meet the needs of those who contribute to it, rather than trying to appeal to the masses. It is intended for competent GNU/Linux users or anyone with a do-it-yourself attitude willing to read documentation and solve their own problems."
>
> Being on Arch Linux without reading the documentation and relying on others goes against the very essence of this distribution.
>
> IMPORTANT: If you are using an Nvidia graphics card, it must be a 16xx or RTX generation (post-Pascal).

## Arch Linux Script

```bash
sudo pacman -S --needed git base-devel \
  && git clone https://github.com/Gaming-Linux-FR/Architect.git ~/Architect \
  && cd ~/Architect \
  && chmod +x ./architect.sh \
  && ./architect.sh
```

[ Configure Arch the easy way: Architect project by Cardiac ](https://youtu.be/0MV3MxmO7ns?si=eOMc-e4wdSwv1Fbb)

[![Configure Arch the easy way: Architect project by Cardiac](https://img.youtube.com/vi/0MV3MxmO7ns/0.jpg)](https://youtu.be/0MV3MxmO7ns?si=eOMc-e4wdSwv1Fbb)

## Main Features

1. **Configure Package Manager** - Enhance Pacman's functionalities.
2. **Adding Useful Aliases** - Simplify your command-line tasks.
   - `update-arch`: Updates your system apps in one go.
   - `clean-arch`: Removes unused packages.
   - `fix-key`: Solves key-related issues during updates.
   - `update-mirrors`: Refreshes your system's mirror list.
3. **GPU Configuration for Gaming** - Optimal support for AMD, NVIDIA, and Intel drivers
4. **Desktop Environment** - Choose between GNOME, KDE Plasma, XFCE, and i3wm.
5. **Install Base Packages** - Install essential tools, including AUR helpers like `yay` or `paru`.
6. **Miscellaneous Enhancements** - Various adjustments to optimize your Arch experience.
7. **Install Additional Software** - Selection of additional software to customize your installation.

## Sources

- [ArchWiki](https://wiki.archlinux.org/)
- [GLF Website](https://www.gaminglinux.fr/)
- [GLF Discord](http://discord.gg/EP3Jm8YMvj)
- [Cardiacman's YouTube Channel](https://www.youtube.com/@Cardiacman)

## Acknowledgments

A big thank you to the Arch Linux team, the Arch Linux community, AUR maintainers, contributors, and developers of the packages used in this project. Thanks to the entire GLF Discord community for their tests and feedback.
