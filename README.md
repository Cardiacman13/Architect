# 🐧 SCRIPT ARCHITECT

Un script de post-installation pour Arch Linux, conçu pour configurer un système Arch standard avec un ensemble minimal de paquets adapté à vos besoins juste après avoir utilisé `archinstall`. Orienté vers le gaming, ce script est idéal pour une expérience pure d'Arch Linux.

**[ENGLISH VERSION](https://github.com/Gaming-Linux-FR/Architect/blob/main/README-EN.md)**

---

## Table des Matières

- [Introduction](#introduction)
- [Avant de Commencer](#avant-de-commencer)
  - [Arch est-elle faite pour vous ?](#arch-est-elle-faite-pour-vous-)
  - [Archinstall](#archinstall)
  - [Le grand minimum à savoir](#le-grand-minimum-à-savoir)
- [Script Arch Linux](#script-arch-linux)
- [Principales Fonctionnalités](#principales-fonctionnalités)
- [Dépannage](#dépannage)
- [Sources](#sources)
- [Remerciements](#remerciements)

---

## Introduction

Ce README présente "SCRIPT ARCHITECT", un script de post-installation pour Arch Linux. Conçu spécifiquement pour les utilisateurs qui préfèrent une expérience pure d'Arch Linux, ce script vous aide à configurer rapidement un système Arch avec un ensemble minimal de paquets, en mettant un accent particulier sur le gaming.

---

## Avant de Commencer

### Arch est-elle faite pour vous ?

<img src="https://github.com/Cardiacman13/tuto-archlinux-fr/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Arch Linux : Introduction & démo d'installation ](https://www.youtube.com/watch?v=2B3Z0WiLT6A)

[![Arch Linux : Introduction & démo d'installation](https://img.youtube.com/vi/2B3Z0WiLT6A/0.jpg)](https://www.youtube.com/watch?v=2B3Z0WiLT6A)

### Archinstall

Avant de plonger dans le script, utilisez `archinstall`, le script est fait pour être utilisé après archinstall.

<img src="https://github.com/Cardiacman13/tuto-archlinux-fr/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutoriel Arch Linux Partie 1 : Archinstall ](https://www.youtube.com/watch?v=JE6VwNHLcyk)


[![Tutoriel Arch Linux Partie 1 : Archinstall](https://img.youtube.com/vi/JE6VwNHLcyk/0.jpg)](https://www.youtube.com/watch?v=JE6VwNHLcyk)

### Le grand minimum à savoir

<img src="https://github.com/Cardiacman13/tuto-archlinux-fr/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Arch Linux, les bonnes pratiques avec Antiz !](https://youtu.be/4CiGmS3UM3Y?si=FARbltfaw2oXVBpO)

[![Arch Linux, les bonnes pratiques avec Antiz !](https://img.youtube.com/vi/4CiGmS3UM3Y/0.jpg)](https://youtu.be/4CiGmS3UM3Y?si=FARbltfaw2oXVBpO)

---

## Script Arch Linux

Pour démarrer avec le script :

```bash
sudo pacman -S --needed git base-devel && git clone https://github.com/Cardiacman13/Architect.git ~/Architect && cd ~/Architect && chmod +x ./architect.sh && ./architect.sh
```

---

## Principales Fonctionnalités

1. **Configurer le gestionnaire de paquets** - Amélioration des fonctionnalités de Pacman.
2. **Ajout d'Alias Utiles** - Simplifiez vos commandes en ligne.
   - `update-arch` : Met à jour vos applications système en une seule fois.
   - `clean-arch` : Supprime les paquets inutilisés.
   - `fix-key` : Résout les problèmes liés aux clés lors des mises à jour.
   - `update-mirrors` : Rafraîchit la liste des miroirs de votre système.
4. **Configuration GPU pour le jeu** - Prise en charge optimale des pilotes AMD, NVIDIA, et Intel.
5. **Environnement de Bureau** - Choix entre GNOME, KDE Plasma, XFCE, et i3wm.
6. **Installer des paquets de base** - Installation des outils essentiels, y compris les aideurs AUR comme `yay` ou `paru`.
7. **Améliorations diverses** - Divers ajustements pour optimiser votre expérience Arch.
8. **Installation de logiciels supplémentaires** - Sélection de logiciels supplémentaires pour personnaliser votre installation.

---

## Dépannage

Pour toute question ou problème, n'hésitez pas à ouvrir une discussion dans la [section discussions](https://github.com/Cardiacman13/Architect/discussions) du projet.

---

## Sources

- [ArchWiki](https://wiki.archlinux.org/)
- [Site GLF](https://www.gaminglinux.fr/)
- [Discord GLF](http://discord.gg/EP3Jm8YMvj)
- [Chaîne YouTube de Cardiacman](https://www.youtube.com/@Cardiacman)

---

## Remerciements

Un grand merci à l'équipe d'Arch Linux, à la communauté Arch Linux, aux mainteneurs AUR, aux contributeurs et développeurs des paquets utilisés dans ce projet.Merci à toute la communauté du Discord GLF pour leurs tests et retours.
