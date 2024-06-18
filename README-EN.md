# 🐧 ARCHITECT SCRIPT

[![fr](https://img.shields.io/badge/langue-français-blue.svg)](https://github.com/Cardiacman13/Architect)

A post-installation script for Arch Linux, designed to configure a standard Arch system with a minimal set of packages tailored to my needs right after using `archinstall`. Geared towards gaming, this script is intended for a pure Arch Linux experience.

> [!WARNING]
> This script was developed based on [this tutorial](https://github.com/Cardiacman13/tuto-archlinux-fr), which originally came from personal notes to meet my specific needs. I can confirm that it works perfectly on my PC and meets my expectations. **However, I cannot guarantee that it will produce the same results on your hardware or meet your needs. Use it at your own risk. Happy scripting!**
> 
> This is not a distribution but a configuration script to save time in post-installation. The maintenance and management of your Arch Linux system are your responsibility after using this script.
>
> ArchLinux is a DIY (Do It Yourself) distribution. It is crucial to have strong technical skills or to be prepared to consult extensive documentation. It is unthinkable to stay on Arch Linux if you constantly rely on others' help. In case of a problem, you must be able to find and fix issues yourself quickly. Otherwise, you risk becoming dependent on others or spending hours fixing or reinstalling repeatedly.

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
