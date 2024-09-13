# SCRIPT ARCHITECT

[![lang-en](https://img.shields.io/badge/lang-en-blue.svg)](https://codeberg.org/Gaming-Linux-FR/Architect/src/branch/main/README-EN.md)

Un script de post-installation pour Arch Linux, conçu pour configurer un système Arch standard avec un ensemble minimal de paquets adapté à mes besoins juste après avoir utilisé `archinstall`. Orienté vers le gaming, ce script est pensé pour une expérience pure d'Arch Linux.

> [!WARNING]
> Ce script a été élaboré à partir de [ce tutoriel](https://github.com/Cardiacman13/tuto-archlinux-fr), initialement issu de notes personnelles pour répondre à mes besoins spécifiques. Je peux confirmer qu'il fonctionne parfaitement sur mon PC et me satisfait pleinement. **Cependant, je ne peux garantir qu'il donnera les mêmes résultats sur votre matériel ou qu'il répondra à vos besoins. Utilisez-le en toute connaissance de cause. Bon script !**
>
> Ce n'est pas une distribution mais bien un script de configuration pour gagner du temps en post-innstallation, la maintenance et la gestion de votre Arch linux vous incombe après son utilisation.
> 
> ArchLinux est une distribution DIY (Do It Yourself). Il est crucial d'avoir de solides compétences techniques ou d'être prêt à consulter abondamment la documentation. Il est impensable de rester sur Arch Linux si l'on dépend constamment de l'aide des autres. En cas de problème, il faut absolument être capable de trouver et de réparer soi-même rapidement. Sinon, on risque de devenir dépendant des autres ou de passer des heures à réparer ou réinstaller en boucle.
>
> Extrait **[du WIKI officiel de Arch Linux](https://wiki.archlinux.org/title/Arch_Linux_(Fran%C3%A7ais))** : "Tandis que de nombreuses distributions GNU/Linux tentent d'être plus conviviales, Arch Linux a toujours été, et restera toujours centrée sur l'utilisateur. Elle est destinée à répondre aux besoins de ceux qui y contribuent, plutôt que d'essayer d'attirer le plus grand nombre. Elle est destinée à l'utilisateur compétent de GNU/Linux ou à toute personne ayant une attitude de bricoleur et disposée à lire la documentation et à résoudre ses propres problèmes."
>
> Être sur Arch Linux sans lire la documentation et en étant dépendant des autres va à l'encontre de ce qu'est cette distribution.

## Avant de Commencer

### Arch est-elle faite pour vous ?

[ Arch Linux : Introduction & démo d'installation ](https://www.youtube.com/watch?v=2B3Z0WiLT6A)

[![Arch Linux : Introduction & démo d'installation](https://img.youtube.com/vi/2B3Z0WiLT6A/0.jpg)](https://www.youtube.com/watch?v=2B3Z0WiLT6A)

### Le grand minimum à savoir

#### Vidéo recommandée

[Arch Linux, les bonnes pratiques avec Antiz !](https://youtu.be/4CiGmS3UM3Y?si=FARbltfaw2oXVBpO)

[![Arch Linux, les bonnes pratiques avec Antiz !](https://img.youtube.com/vi/4CiGmS3UM3Y/0.jpg)](https://youtu.be/4CiGmS3UM3Y?si=FARbltfaw2oXVBpO)

## Script ARCHITECT

Pour démarrer avec le script :

```bash
sudo pacman -S --needed git base-devel \
  && git clone https://codeberg.org/Gaming-Linux-FR/Architect.git ~/Architect \
  && cd ~/Architect \
  && chmod +x ./architect.sh \
  && ./architect.sh
```

## Principales Fonctionnalités

1. **Configurer le gestionnaire de paquets** - Amélioration des fonctionnalités de Pacman.
2. **Ajout d'Alias Utiles** - Simplifiez vos commandes en ligne.
   - `update-arch` : Met à jour vos applications système en une seule fois.
   - `clean-arch` : Supprime les paquets inutilisés.
   - `fix-key` : Résout les problèmes liés aux clés lors des mises à jour.
   - `update-mirrors` : Rafraîchit la liste des miroirs de votre système.
3. **Configuration GPU pour le jeu** - Prise en charge optimale des pilotes AMD, NVIDIA, et Intel.
4. **Environnement de Bureau** - Choix entre GNOME, KDE Plasma, XFCE, et i3wm.
5. **Installer des paquets de base** - Installation des outils essentiels, y compris les aideurs AUR comme `yay` ou `paru`.
6. **Améliorations diverses** - Divers ajustements pour optimiser votre expérience Arch.
7. **Installation de logiciels supplémentaires** - Sélection de logiciels supplémentaires pour personnaliser votre installation.

## Sources

- [ArchWiki](https://wiki.archlinux.org/)
- [Site GLF](https://www.gaminglinux.fr/)
- [Discord GLF](http://discord.gg/EP3Jm8YMvj)
- [Chaîne YouTube de Cardiacman](https://www.youtube.com/@Cardiacman)

## Remerciements

Un grand merci à l'équipe d'Arch Linux, à la communauté Arch Linux, aux mainteneurs AUR, aux contributeurs et développeurs des paquets utilisés dans ce projet. Merci à toute la communauté du Discord GLF pour leurs tests et retours.
