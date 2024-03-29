# 🐧 SCRIPT ARCHITECT

Un script de post-installation pour Arch Linux, conçu pour configurer un système Arch standard avec un ensemble minimal de paquets adapté à vos besoins juste après avoir utilisé `archinstall`. Orienté vers le gaming, ce script est idéal pour une expérience pure d'Arch Linux.

**[ENGLISH VERSION](https://github.com/Gaming-Linux-FR/Architect/blob/main/README-EN.md)**

---

## Avant de Commencer

### Arch est-elle faite pour vous ?

<img src="https://github.com/Cardiacman13/tuto-archlinux-fr/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Arch Linux : Introduction & démo d'installation ](https://www.youtube.com/watch?v=2B3Z0WiLT6A)

[![Arch Linux : Introduction & démo d'installation](https://img.youtube.com/vi/2B3Z0WiLT6A/0.jpg)](https://www.youtube.com/watch?v=2B3Z0WiLT6A)

### Archinstall

Avant de plonger dans le script, utilisez `archinstall`, le script est fait pour être utilisé après archinstall.

Pour lancer `archinstall`, commencez par mettre à jour `archinstall` pour vous assurer d'utiliser la version la plus récente. C'est important car, par exemple au moment où ces lignes sont écrites, la version de l'ISO d'Arch Linux 01/03/2024 tente d'installer le paquet "plasma-wayland" qui n'existe plus depuis la sortie de Plasma 6 et mène donc à une erreur qui plante archinstall. Ce problème est corrigé dans les versions plus récentes d'`archinstall`, donc mettre à jour avant de lancer l'installation est essentiel.

**Mise à jour de archinstall :**

```sh
pacman -Sy archinstall
```

D'autres erreurs de ce type peuvent arriver, il peut donc être parfois intéressant de prendre la dernière version de archinstall.

**Lancer archinstall**

```sh
archinstall
```

---

### Le grand minimum à savoir

<img src="https://github.com/Cardiacman13/tuto-archlinux-fr/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Arch Linux, les bonnes pratiques avec Antiz !](https://youtu.be/4CiGmS3UM3Y?si=FARbltfaw2oXVBpO)

[![Arch Linux, les bonnes pratiques avec Antiz !](https://img.youtube.com/vi/4CiGmS3UM3Y/0.jpg)](https://youtu.be/4CiGmS3UM3Y?si=FARbltfaw2oXVBpO)

---

## Script Arch Linux

Pour démarrer avec le script :

```bash
sudo pacman -S --needed git base-devel \
  && git clone https://github.com/Cardiacman13/Architect.git ~/Architect \
  && cd ~/Architect \
  && chmod +x ./architect.sh \
  && ./architect.sh
```

---

## Principales Fonctionnalités

1. **Configurer le gestionnaire de paquets** - Amélioration des fonctionnalités de Pacman.
2. **Ajout d'Alias Utiles** - Simplifiez vos commandes en ligne.
   - `update-arch` : Met à jour vos applications système en une seule fois.
   - `clean-arch` : Supprime les paquets inutilisés.
   - `fix-key` : Résout les problèmes liés aux clés lors des mises à jour.
   - `update-mirrors` : Rafraîchit la liste des miroirs de votre système.
3. **Activation de Zram** - Améliore les performances et réduit l'usure du SSD en compressant la RAM au lieu d'utiliser le swap sur disque.
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

Un grand merci à l'équipe d'Arch Linux, à la communauté Arch Linux, aux mainteneurs AUR, aux contributeurs et développeurs des paquets utilisés dans ce projet. Merci à toute la communauté du Discord GLF pour leurs tests et retours.
