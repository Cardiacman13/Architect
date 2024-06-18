# SCRIPT ARCHITECT

[![lang-en](https://img.shields.io/badge/lang-en-blue.svg)](https://github.com/Cardiacman13/Architect/blob/main/README-EN.md)

Un script de post-installation pour Arch Linux, conçu pour configurer un système Arch standard avec un ensemble minimal de paquets adapté à mes besoins juste après avoir utilisé `archinstall`. Orienté vers le gaming, ce script est pensé pour une expérience pure d'Arch Linux.

> [!WARNING]
> Ce script a été élaboré à partir de [ce tutoriel](https://github.com/Cardiacman13/tuto-archlinux-fr), initialement issu de notes personnelles pour répondre à mes besoins spécifiques. Je peux confirmer qu'il fonctionne parfaitement sur mon PC et me satisfait pleinement. **Cependant, je ne peux garantir qu'il donnera les mêmes résultats sur votre matériel ou qu'il répondra à vos besoins. Utilisez-le en toute connaissance de cause. Bon script !**
>
> Ce n'est pas une distribution mais bien un script de configuration pour gagner du temps en post-innstallation, la maintenance et la gestion de votre Arch linux vous incombe après son utilisation.
> 
> ArchLinux est une distribution DIY (Do It Yourself). Il est crucial d'avoir de solides compétences techniques ou d'être prêt à consulter abondamment la documentation. Il est impensable de rester sur Arch Linux si l'on dépend constamment de l'aide des autres. En cas de problème, il faut absolument être capable de trouver et de réparer soi-même rapidement. Sinon, on risque de devenir dépendant des autres ou de passer des heures à réparer ou réinstaller en boucle.

## Avant de Commencer

### Arch est-elle faite pour vous ?

[ Arch Linux : Introduction & démo d'installation ](https://www.youtube.com/watch?v=2B3Z0WiLT6A)

[![Arch Linux : Introduction & démo d'installation](https://img.youtube.com/vi/2B3Z0WiLT6A/0.jpg)](https://www.youtube.com/watch?v=2B3Z0WiLT6A)

### Le grand minimum à savoir

#### Vidéo recommandée

[Arch Linux, les bonnes pratiques avec Antiz !](https://youtu.be/4CiGmS3UM3Y?si=FARbltfaw2oXVBpO)

[![Arch Linux, les bonnes pratiques avec Antiz !](https://img.youtube.com/vi/4CiGmS3UM3Y/0.jpg)](https://youtu.be/4CiGmS3UM3Y?si=FARbltfaw2oXVBpO)


#### Bases de l'administration **Arch** Linux

Pour bien administrer un système **Arch** Linux, il est important de maîtriser les concepts et outils suivants :

- **Gestionnaire de paquets :** Lire et comprendre la documentation de [pacman](https://wiki.archlinux.org/title/Pacman_(Fran%C3%A7ais)).

- **Bootloaders :** Lire et comprendre la documentation de votre bootloader, tel que [GRUB](https://wiki.archlinux.org/title/GRUB) ou [systemd-boot](https://wiki.archlinux.org/title/Systemd-boot).

- **Outil d'initramfs :** Lire et comprendre la documentation de [mkinitcpio](https://wiki.archlinux.org/title/Mkinitcpio).

- **Système d'initialisation et de gestion des services :** Lire et comprendre la documentation de [systemd](https://wiki.archlinux.org/title/Systemd_(Fran%C3%A7ais)).

- **Accélération matérielle :** Lire et comprendre la documentation relative au GPU et à l'accélération matérielle :
  - [NVIDIA](https://wiki.archlinux.org/title/NVIDIA)
  - [AMD](https://wiki.archlinux.org/title/AMDGPU)
  - [Intel](https://wiki.archlinux.org/title/Intel_graphics)
  - [Accélération graphique](https://wiki.archlinux.org/title/Hardware_video_acceleration)
 
  Mais aussi :

- **fstab :** Gestion des montages de partitions.
- **Formatage de partitions :** Création et gestion de systèmes de fichiers sur les partitions.
- **Arborescence de Linux :** Compréhension de la structure des répertoires et fichiers.
- **CUPS :** Système d'impression pour Unix.
- **Avahi :** Implémentation de zeroconf pour la découverte de services sur un réseau local.
- **Commandes de base :** Connaissance des commandes essentielles telles que :
  - `mkdir` : créer des répertoires.
  - `cd` : changer de répertoire.
  - `ls` : lister les fichiers et répertoires.
  - `mv` : déplacer ou renommer des fichiers et répertoires.
  - `cp` : copier des fichiers et répertoires.
  - `rm` : supprimer des fichiers et répertoires.
  - `touch` : créer des fichiers vides ou mettre à jour les horodatages de fichiers.
  - `chmod` : changer les permissions des fichiers et répertoires.
  - `chown` : changer le propriétaire et le groupe des fichiers et répertoires.
  - `find` : rechercher des fichiers et répertoires.
  - `grep` : rechercher du texte dans des fichiers.
  - `ps` : afficher les processus en cours d'exécution.
  - `top` : surveiller les processus en temps réel.
  - `kill` : terminer des processus.
  - `df` : afficher l'espace disque utilisé et disponible.
  - `du` : estimer l'utilisation de l'espace disque.
  - `tar` : archiver des fichiers.
  - `nano` / `vim` : éditeurs de texte pour modifier les fichiers de configuration.

Ces points sont cruciaux pour une administration de votre système Arch Linux.

## Script ARCHITECT

Pour démarrer avec le script :

```bash
sudo pacman -S --needed git base-devel \
  && git clone https://github.com/Gaming-Linux-FR/Architect.git ~/Architect \
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
