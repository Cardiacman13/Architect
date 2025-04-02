
# ARCHITECT SCRIPT

**[🇫🇷 Passer à la version française](#script-architect-fr)**

**[📚 Architect Wiki](https://github.com/Cardiacman13/Architect/wiki)**

A post-installation script for Arch Linux, designed to configure a standard Arch system with a minimal set of packages tailored to my needs right after using `archinstall`. Geared towards gaming, this script is intended for a pure Arch Linux experience.

> [!WARNING]  
> This script was originally derived from personal notes to meet my specific needs. I can confirm that it works perfectly on my PC and fully satisfies me. **However, I cannot guarantee that it will yield the same results on your hardware or meet your needs. Use it at your own risk.**
>
> This is not a distribution but a configuration script meant to save time in post-installation. The maintenance and management of your Arch Linux are your responsibility after using it.
>
> Arch Linux is a DIY (Do It Yourself) distribution. It's crucial to have solid technical skills or be ready to extensively consult the documentation. It is unrealistic to stick with Arch Linux if you constantly rely on others for help. In case of issues, you absolutely must be able to troubleshoot and fix them quickly on your own. Otherwise, you risk becoming dependent on others or spending hours repeatedly fixing or reinstalling.
>
> Excerpt from the [official Arch Linux WIKI](https://wiki.archlinux.org/title/Arch_Linux): "While many GNU/Linux distributions aim to be more user-friendly, Arch Linux has always been, and will remain, user-centric. It is designed to meet the needs of those who contribute to it, rather than trying to appeal to the masses. It is intended for competent GNU/Linux users or anyone with a do-it-yourself attitude willing to read documentation and solve their own problems."
>
> Being on Arch Linux without reading the documentation and relying on others goes against the very essence of this distribution.
>
> **IMPORTANT: If you are using an Nvidia graphics card, it must be from the 16xx generation or RTX (post-Pascal).** Note that you only need to run `sudo pacman -S nvidia-dkms` after the script and overwrite `nvidia-open-dkms` if you have a GTX 1000 or older.

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

---

<a name="script-architect-fr"></a>

# SCRIPT ARCHITECT

Un script de post-installation pour Arch Linux, conçu pour configurer un système Arch standard avec un ensemble minimal de paquets adapté à mes besoins juste après avoir utilisé `archinstall` et installé un DE. Orienté gaming, ce script est pensé pour une expérience pure d'Arch Linux.

> [!WARNING]
> Ce script est initialement issu de notes personnelles pour répondre à mes besoins spécifiques. Je peux confirmer qu'il fonctionne parfaitement sur mon PC et me satisfait pleinement. **Cependant, je ne peux garantir qu'il donnera les mêmes résultats sur votre matériel ou qu'il répondra à vos besoins. Utilisez-le en toute connaissance de cause.**
>
> **Architect** n'est pas une distribution mais bien un script de configuration pour gagner du temps en post-innstallation, la maintenance et la gestion de votre Arch linux vous incombe après son utilisation.
>
> Extrait **[du WIKI officiel de Arch Linux](https://wiki.archlinux.org/title/Arch_Linux_(Fran%C3%A7ais))** : "Tandis que de nombreuses distributions GNU/Linux tentent d'être plus conviviales, Arch Linux a toujours été, et restera toujours centrée sur l'utilisateur. Elle est destinée à répondre aux besoins de ceux qui y contribuent, plutôt que d'essayer d'attirer le plus grand nombre. Elle est destinée à l'utilisateur compétent de GNU/Linux ou à toute personne ayant une attitude de bricoleur et disposée à lire la documentation et à résoudre ses propres problèmes."
>
> En somme ArchLinux est une distribution DIY (Do It Yourself), être sur Arch Linux sans lire la documentation et en étant dépendant des autres va à l'encontre de ce qu'est cette distribution.
>
> **IMPORTANT : Si vous utilisez une carte graphique Nvidia, elle doit être d'une génération 16xx ou RTX (post-Pascal).** Note qu'il suffit de faire `sudo pacman -S nvidia-dkms` après le script et d'écraser `nvidia-open-dkms` si vous avez une gtx 1000 ou antérieure.

## Avant de Commencer

### Le grand minimum à savoir

#### Vidéo recommandée

[Arch Linux, les bonnes pratiques avec Antiz !](https://youtu.be/4CiGmS3UM3Y?si=FARbltfaw2oXVBpO)

[![Arch Linux, les bonnes pratiques avec Antiz !](https://img.youtube.com/vi/4CiGmS3UM3Y/0.jpg)](https://youtu.be/4CiGmS3UM3Y?si=FARbltfaw2oXVBpO)

## Script ARCHITECT

Pour démarrer avec le script :

```bash
sudo pacman -S --needed git base-devel \
  && git clone https://github.com/Gaming-Linux-FR/Architect.git ~/Architect \
  && cd ~/Architect \
  && chmod +x ./architect.sh \
  && ./architect.sh
```

Vous pouvez supprimer le dossier Architect dans votre home après l'utilisation du script.

## Principales Fonctionnalités

1. **Configurer le gestionnaire de paquets** - Amélioration des fonctionnalités de Pacman.
2. **Ajout d'Alias Utiles** - Simplifiez vos commandes en ligne.
   - `update-arch` : Met à jour vos applications système en une seule fois.
   - `clean-arch` : Supprime les paquets inutilisés.
   - `fix-key` : Résout les problèmes liés aux clés lors des mises à jour.
   - `update-mirrors` : Rafraîchit la liste des miroirs de votre système.
3. **Configuration GPU pour le jeu** - Prise en charge optimale des pilotes AMD, NVIDIA, et Intel.
4. **Environnement de Bureau** - Choix entre GNOME, KDE Plasma, XFCE, et i3wm.
5. **Installer des paquets de base** - Installation des outils essentiels.
6. **Améliorations diverses** - Divers ajustements pour optimiser votre expérience Arch.
7. **Installation de logiciels supplémentaires** - Sélection de logiciels supplémentaires pour personnaliser votre installation.

## Sources

- [ArchWiki](https://wiki.archlinux.org/)
- [Site GLF](https://www.gaminglinux.fr/)
- [Discord GLF](http://discord.gg/EP3Jm8YMvj)
- [Chaîne YouTube de Cardiacman](https://www.youtube.com/@Cardiacman)

## Remerciements

Un grand merci à l'équipe d'Arch Linux, à la communauté Arch Linux, aux mainteneurs AUR, aux contributeurs et développeurs des paquets utilisés dans ce projet. Merci à toute la communauté du Discord GLF pour leurs tests et retours.
