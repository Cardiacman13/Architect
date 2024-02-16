# 🐧 SCRIPT ARCHITECT

Un script de post-installation pour Arch Linux

[ENGLISH VERSION](https://github.com/Gaming-Linux-FR/Architect/blob/main/README-EN.md)


## Table des matières

<div align="center">

&ensp;[<kbd> <br> Installer avec archinstall <br> </kbd>](#archinstall)&ensp;
&ensp;[<kbd> <br> Script tout-en-un <br> </kbd>](#script)&ensp;
&ensp;[<kbd> <br> Communauté <br> </kbd>](https://github.com/Cardiacman13/Architect/discussions)&ensp;
&ensp;[<kbd> <br> Wiki <br> </kbd>](https://github.com/Cardiacman13/Architect/wiki)&ensp;
<br><br><br><br></div>

## Tout d'abord Arch est-elle faite pour vous ?

<img src="https://github.com/Cardiacman13/tuto-archlinux-fr/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Arch Linux : Introduction & démo d'installation ](https://www.youtube.com/watch?v=2B3Z0WiLT6A)

## Avant le script, voici une vidéo pour vous aider avec archinstall <a name="archinstall"/>

<img src="https://github.com/Cardiacman13/tuto-archlinux-fr/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutoriel Arch Linux Partie 1 : Archinstall ](https://www.youtube.com/watch?v=JE6VwNHLcyk)

## ET, le grand minimum à savoir pour survivre sur Arch :

<img src="https://github.com/Cardiacman13/tuto-archlinux-fr/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Arch Linux, les bonnes pratiques avec Antiz !](https://youtu.be/4CiGmS3UM3Y?si=FARbltfaw2oXVBpO)

## 🚀 Script Arch Linux <a name="script"/>

<img src="https://github.com/Cardiacman13/tuto-archlinux-fr/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Mise à jour de Architect, la trad FR enfin disponible !](https://youtu.be/lxUpVr4xnes?si=iTLZx1Y12ddn60kv)

Ce script est parfait pour configurer un système **Arch standard** avec un **ensemble minimal de paquets** adapté à vos besoins juste après avoir utilisé [`archinstall`](https://github.com/archlinux/archinstall). Il est spécifiquement **orienté vers le gaming**.

> [!IMPORTANT]
> Il est spécifiquement conçu pour une expérience pure d'Arch Linux (non testé sur *Garuda*, *Manjaro*, etc.).
> Nous effectuons tous nos tests sur une installation fraîche d'Arch Linux avec [`archinstall`](https://github.com/archlinux/archinstall).
> Il n'est pas adapté aux ordinateurs de plus de 10 ans. Assurez-vous que votre matériel répond aux exigences des derniers pilotes Nvidia.

> [!WARNING]
> Le script modifie la configuration de votre système, consultez le [wiki](https://github.com/Cardiacman13/Architect/wiki) ou le [forum de la communauté](https://github.com/Cardiacman13/Architect/discussions) pour plus d'informations.

Exécutez la commande suivante dans le terminal pour lancer le script :

```bash
sudo pacman -S git base-devel && git clone https://github.com/Cardiacman13/Architect.git ~/Architect && cd ~/Architect && chmod +x ./architect.sh && ./architect.sh
```

## 📝 Principales fonctionnalités

### 1. 🚀 Configurer le gestionnaire de paquets
Améliorer les fonctionnalités de Pacman :
- 🎨 Activation de la sortie colorée.
- 📝 Listes détaillées des paquets.
- ⚡ Téléchargements parallèles.
- 🔗 Support multilib.

### 2. ⌨️ Ajout d'Alias Utiles
Faciliter vos tâches en ligne de commande :
- `update-arch` : Met à jour vos applications système en une seule fois.
- `clean-arch` : Supprime les paquets inutilisés.
- `fix-key` : Résout les problèmes liés aux clés lors des mises à jour.
- `update-mirrors` : Rafraîchit la liste des miroirs de votre système.

### 3. 🎮 Configuration GPU pour le jeu (AMD, NVIDIA, Intel)
Préparer votre système pour le jeu avec :
- 🎮 Choix des pilotes GPU :
  - 📹 Support AMD et bibliothèque 32 bits.
  - 📹 Support Intel et bibliothèque 32 bits.
  - 🔄 Choix NVIDIA :
    - **Nvidia** : Pilotes standard **recommandés pour la plupart**.
    - **Nvidia-all** : Pour les utilisateurs avancés (via le dépôt [`Frogging-Family/nvidia-all`](https://github.com/Frogging-Family/nvidia-all)).

<img src="https://github.com/Cardiacman13/tuto-archlinux-fr/blob/main/assets/images/LOGO-A1RM4X-2K.png" width="30" height="30"> [ Ne luttez plus avec les pilotes Nvidia sur Linux ! NVIDIA ALL par TkG sur Arch / Distributions basées sur Arch ](https://www.youtube.com/watch?v=QW2XGMAu6VE)

### 4. 🖥️ Environnement de Bureau
Choisissez votre DE :
- 🖥️ `GNOME`.
- 🖥️ `KDE Plasma`.
- 🖥️ `XFCE`.
- 🖥️ `i3wm` ( [configuration personnalisée](https://github.com/wmemcpy/i3-config) bientôt disponible... 😏).

### 5. 📦 Installer des paquets de base
Paquets essentiels pour une expérience complète :
- 📦 Aideurs AUR : [`yay`](https://github.com/Jguer/yay) ou [`paru`](https://github.com/Morganamilo/paru).
- 🖋️ Polices, Emoji.
- 🎬 Codecs.
- ➕ Autres paquets cruciaux.

### 6. 🛠️ Améliorations diverses
Optimisez votre système :
- 🎲 Augmentation de `vm.max_map_count` pour une meilleure compatibilité avec les jeux Windows. [Arch wiki sur vm-max-map-count](https://wiki.archlinux.org/title/gaming#Increase_vm.max_map_count)
- 🖨️ Options pour le support de l'impression.
- 🎵 Configuration Bluetooth.
- 🎮 Support amélioré pour les manettes Xbox, PS5, 8bitdo.
- 🐟 Suggérer la configuration de l'environnement Fish shell. (zsh en cours de réalisation)
- 📂 Support Btrfs dans GRUB avec grub-btrfs.

---

### 7. 🔄 Demander l'installation de logiciels supplémentaires

Sélectionnez des logiciels supplémentaires en fonction de vos besoins :

#### **Navigateurs Web :**
| Nom                     | Paquet                                     |
|-------------------------|--------------------------------------------|
| Firefox                 | firefox                                    |
| Brave                   | brave-bin                                  |
| Chromium                | chromium                                   |
| Vivaldi                 | vivaldi                                    |
| Google Chrome           | google-chrome                              |
| Microsoft Edge          | microsoft-edge-stable-bin                  |

#### **Utilitaires Système :**
| Nom                     | Paquet                                     |
|-------------------------|--------------------------------------------|
| Arch Update             | arch-update                                |
| Open RGB                | openrgb                                    |

#### **Communication :**
| Nom                     | Paquet                                     |
|-------------------------|--------------------------------------------|
| Discord                 | discord                                    |
| Telegram                | telegram-desktop                           |

#### **Médias et Design :**
| Nom                     | Paquet                                     |
|-------------------------|--------------------------------------------|
| OBS Studio              | obs-studio                                 |
| Kdenlive                | kdenlive                                   |
| Davinci Resolve         | davinci-resolve                            |
| Gimp                    | gimp                                       |
| Inkscape                | inkscape                                   |
| Krita                   | krita                                      |
| VLC                     | vlc                                        |
| MPV                     | mvp                                        |
| Kazam                   | kazam                                      |

#### **Productivité et Bureautique :**
| Nom                     | Paquet                                     |
|-------------------------|--------------------------------------------|
| LibreOffice             | libreoffice-fresh                          |
| OnlyOffice              | onlyoffice-bin                             |
| Visual Studio Code      | visual-studio-code-bin                     |
| VS Code Open Source     | code                                       |
| CrossOver               | crossover                                  |

#### **Divertissement et Jeu :**
| Nom                     | Paquet                                     |
|-------------------------|--------------------------------------------|
| Steam                   | steam                                      |
| Lutris                  | lutris wine-staging                        |
| Heroic Games Launcher   | heroic-games-launcher                      |
| Proton UP               | protonup-qt                                |
| Goverlay                | goverlay                                   |
| Gamemode                | gamemode                                   |
| Spotify                 | spotify                                    |

---

## Dépannage

Pour obtenir de l'aide, ouvrez une discussion dans la [section de discussion](https://github.com/Cardiacman13/Architect/discussions)

## Sources

Sources et liens utiles :
- [ArchWiki](https://wiki.archlinux.org/)
- [Site GLF](https://www.gaminglinux.fr/)
- [Discord GLF](http://discord.gg/EP3Jm8YMvj)
- [Ma chaîne YouTube](https://www.youtube.com/@Cardiacman)

## 🙏 Remerciements

- Équipe [Arch Linux](https://archlinux.org/) pour leur travail incroyable.
- Communauté Arch Linux pour leur documentation exceptionnelle.
- Mainteneurs AUR pour leur travail acharné.
- Tous les contributeurs.
- Développeurs des paquets utilisés dans ce projet. Mention spéciale à :
  - [Frogging Family](https://github.com/Frogging-Family)
  - [OpenRGB](https://github.com/CalcProgrammer1/OpenRGB)
- Merci au [Discord GLF](https://discord.gg/6t4REDETJd) pour les nombreux tests et retours.
- Un grand merci à [wmemcpy](https://github.com/wmemcpy) pour tout son travail sur ce projet.
- Merci à [Skythrew](https://github.com/Skythrew) pour son travail sur la traduction française.
- Merci à [A1RM4X](https://www.youtube.com/A1RM4X) pour ses vidéos en anglais sur archinstall et ce projet.
