# 🐧 ARCHITECT SCRIPT ET TUTO 📜

<img src="https://github.com/Cardiacman13/Architect/blob/main/assets/images/desktop.png" width="1000" height="250">

## Table des Matières
1. [Script tout-en-un](#script)
2. [Tutoriel](#elevate)
3. [Jeux](#gaming)
4. [Optimisation](#optimization)
5. [Dépannage](#troubleshooting)
6. [Communauté](#community)

## 🚀 Script Post-Installation Arch Linux <a name="script"/>

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Welcome.png">

Ce script est parfait pour configurer un système **Arch pur** avec un **ensemble minimal de paquets** adaptés à vos besoins juste après l'utilisation de `archinstall`. il est **orienté gaming**.

> **Avertissement**
>
> Il est spécialement conçu pour une expérience pure d'Arch Linux (non testé sur *Garuda*, *Manjaro*, etc.).
>
> Nous réalisons tous nos tests sur une installation fraîche d'Arch Linux avec [`archinstall`](https://github.com/archlinux/archinstall).
>
> Assurez-vous de ne pas exécuter en tant que root et d'être dans un "Environnement de Bureau" (GNOME, KDE Plasma, i3wm, etc.).

Exécutez ce qui suit dans le terminal pour lancer le script (**nécessite l'accès sudo**):

```bash
sudo pacman -Sy git base-devel && git clone https://github.com/Cardiacman13/Architect.git ~/Architect && cd ~/Architect && ./architect.sh
```

## 📝 Principales Caractéristiques

### 1. 🚀 Configurer le Gestionnaire de Paquets
Améliorez les fonctionnalités de Pacman :
- 🎨 Activation de la sortie colorée.
- 📝 Listes de paquets détaillées.
- ⚡ Téléchargements parallèles.
- 🔗 Support Multilib.

### 2. ⌨️ Ajouter des Alias Utiles
Facilitez vos tâches en ligne de commande :
- `update-arch` : Met à jour vos applications système en une seule fois.
- `clean-arch` : Supprime les paquets inutilisés.
- `fix-key` : Résout les problèmes de clés pour les mises à jour.
- `update-mirrors` : Rafraîchit la liste des miroirs de votre système.

### 3. 🎮 Configuration GPU pour le Gaming (AMD, NVIDIA, Intel)
Préparez votre système pour le gaming avec :
- 🎮 Proton-GE (via le dépôt [`GloriousEggroll/proton-ge-custom`](https://github.com/GloriousEggroll/proton-ge-custom)).
- 🎮 Choix de pilotes GPU :
  - 📹 AMD et support de bibliothèque 32 bits.
  - 📹 Intel et support de bibliothèque 32 bits.
  - 🔄 Choix NVIDIA :
    - **Nvidia** : Pilotes standards (recommandés pour la plupart) avec crochet personnalisé basé sur le système de démarrage (GRUB ou systemd-boot).
    - **Nvidia-all** : Pour utilisateurs avancés (via le dépôt [`Frogging-Family/nvidia-all`](https://github.com/Frogging-Family/nvidia-all)).

### 4. 🖥️ Environnement de Bureau
Choisissez votre DE :
- 🖥️ `GNOME`.
- 🖥️ `KDE Plasma`.
- 🖥️ `XFCE`.
- 🖥️ `i3wm` ([configuration personnalisée](https://github.com/wmemcpy/i3-config) à venir... 😏).

### 5. 📦 Installer des Paquets de Base
Paquets essentiels pour une expérience complète :
- 📦 Aide à l'installation AUR : [`yay`](https://github.com/Jguer/yay) ou [`par

u`](https://github.com/Morganamilo/paru).
- 🖋️ Polices, Emoji.
- 🎬 Codecs.
- ➕ Autres paquets cruciaux.

### 6. 🛠️ Améliorations Diverses
Optimisez votre système :
- 🎲 Augmentez `vm.max_map_count` pour une meilleure compatibilité des jeux Windows. [Wiki Arch sur vm-max-map-count](https://wiki.archlinux.org/title/gaming#Increase_vm.max_map_count)
- 🖨️ Options pour le support d'impression.
- 🎵 Configuration Bluetooth.
- 🎮 Support amélioré pour les manettes Xbox, PS4/PS5, 8bitdo.
- 🐟 Configuration proposée pour le shell Fish. (zsh en cours de travail)

### 7. 🔄 Demander l'Installation de Logiciels Supplémentaires
Sélectionnez des logiciels supplémentaires en fonction de vos besoins :

| Nom                      | Paquet                                  | Type    |
|--------------------------|-----------------------------------------|---------|
| Firefox                  | firefox firefox-i18n-fr                 | paquet |
| Brave                    | brave-bin                               | paquet |
| Chromium                 | chromium                                | paquet |
| Discord                  | discord                                 | paquet |
| Steam                    | steam proton-ge-custom-bin              | paquet |
| Lutris                   | lutris wine-staging                     | paquet |
| Heroic Games Launcher    | heroic-games-launcher-bin               | paquet |
| protonup-qt              | protonup-qt-bin                         | paquet |
| Spotify                  | spotify                                 | paquet |
| OBS Studio               | com.obsproject.Studio                   | flatpak |
| Kdenlive                 | kdenlive                                | paquet |
| LibreOffice              | libreoffice-fresh libreoffice-fresh-fr  | paquet |
| Gimp                     | gimp                                    | paquet |
| VLC                      | vlc                                     | paquet |
| Visual Studio Code       | visual-studio-code-bin                  | paquet |
| Open RGB                 | openrgb-bin                             | paquet |

## 👨‍🔧 Pour les développeurs

### 🏭 Aperçu de la Structure du Projet

```graphql
.
├── architect.sh                # Fichier principal du script pour démarrer l'installation.
├── assets
│   └── data
│       └── hooks
│           ├── grub.hook       # Crochet de configuration GRUB pour les optimisations système.
│           └── nvidia.hook     # Crochet de pilote NVIDIA pour les configurations personnalisées.
├── LICENSE
├── README.md
└── src
    ├── cmd.sh                  # Script pour exécuter des tâches courantes en ligne de commande.
    ├── de
    │   ├── detect.sh           # Détecte l'Environnement de Bureau actuel.
    │   ├── gnome.sh            # Script de configuration GNOME.
    │   ├── i3.sh               # Script de configuration du gestionnaire de fenêtres i3.
    │   ├── kde.sh              # Script de configuration KDE Plasma.
    │   └── xfce4.sh            # Script de configuration XFCE.
    ├── end.sh                  # Script exécuté à la fin de l'installation.
    ├── init.sh                 # Script de configuration initiale.
    ├── software
    │   ├── flatpak.sh          # Script pour l'installation de paquets Flatpak.
    │   └── install.sh          # Script d'installation de logiciels général.
    └── system
        ├── config
        │   ├── aur.sh          # Script de configuration de l'AUR (Arch User Repository).
        │   └── pacman.sh       # Script de configuration de Pacman.
        ├── drivers
        │   ├── amd.sh          # Script d'installation des pilotes GPU AMD.
        │   ├── devices.sh      # Script pour la détection des appareils connectés.
        │   ├── gpu.sh          # Script de configuration générale du GPU.
        │   ├── intel.sh        # Script d'installation des pilotes GPU Intel.
        │   ├── nvidia.sh       # Script d'installation des pilotes GPU NVIDIA.
        │   └── vm.sh           # Configurations liées aux machines virtuelles.
        ├── internet.sh         # Script de configuration de la connectivité Internet.
        ├── kernel.sh           # Script d'optimisation du noyau.
        ├── other.sh            # Autres scripts divers.
        ├── packages.sh         # Script pour l'installation de paquets.
        └── shell.sh            # Script de configuration du shell.
```

### 📄 Philosophie

Ce projet doit respecter les [principes philosophiques d'Archlinux](https://wiki.archlinux.org/title/Arch_Linux#Principles). Veuillez faire de votre mieux pour suivre cette directive si vous envisagez de faire une pullrequest.

## 📝 Licence

Ce projet est sous licence GNU GPLv3 - voir le fichier [LICENSE](LICENSE) pour plus de détails.

## 🙏 Remerciements

- L'équipe d'[Arch Linux](https://archlinux.org/) pour leur travail remarquable.
- La communauté Arch Linux pour leur documentation exceptionnelle.
- Les mainteneurs de l'AUR pour leur travail acharné.
- Les développeurs des paquets utilisés dans ce projet. Mention spéciale à :
  - [Frogging Family](https://github.com/Frogging-Family)
  - [OpenRGB](https://github.com/CalcProgrammer1/OpenRGB)
- Merci au [Discord GLF](https://discord.gg/6t4REDETJd) pour les nombreux tests et retours.


## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/pc.png" width="30" height="30"> **TUTO** <a name="elevate"/>

### Installation

> [!IMPORTANT]
> Suivez les étapes avec minutie

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutoriel Arch Linux Partie 1 : Archinstall ](https://www.youtube.com/watch?v=JE6VwNHLcyk)

Pour toutes les étapes suivantes, lorsque vous avez un texte présenté de cette manière, cela indiquera une commande à taper dans votre terminal :
```
echo "Bonjour le monde !"       # Commande d'exemple
```

1. **Configurer le clavier en français**
    ```
    loadkeys fr
    ```

2. **Configurer votre Wi-Fi**
    ```
    iwctl
    ```
    Puis (remplacez VOTRE-NOM-WIFI par le nom de votre wifi)
    ```
    station wlan0 connect VOTRE-NOM-WIFI (SSID)
    ```
    Entrez votre mot de passe wifi puis tapez `quit` pour quitter iwctl.

3. **Archinstall**
    ```
    pacman -Syu archinstall      # mettre à jour le script archinstall avant l'installation
    archinstall                 # pour lancer le script d'aide à l'installation pour arch linux
    ```
    **/!\ Le menu archinstall est sujet à changement avec les mises à jour du script /!\\**
    
### Post-installation

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutoriel Arch Linux Partie 2 : Post Installation ](https://youtu.be/FEFhC46BkXo?si=Gi-6BOhqENLoh5Ak)

#### Optimiser pacman

1. Cette [modification](https://wiki.archlinux.org/title/Pacman#Enabling_parallel_downloads) permet la parallélisation des téléchargements de paquets.

   ```
   sudo nano /etc/pacman.conf
   ```

   Décommentez (retirez le **#** des lignes suivantes) :
   
   ```
   #Options diverses
   #UseSyslog
   Color <-
   #NoProgressBar
   #CheckSpace
   VerbosePkgLists <- 
   ParallelDownloads = 5 <-
   ```

2. Installer yay

   [Yay](https://github.com/Jguer/yay) est un outil pratique pour gérer l'installation et la mise à jour de logiciels sur les systèmes basés sur Arch Linux.
   Yay facilite notamment l'utilisation du dépôt AUR, un dépôt géré par la communauté qui élargit considérablement la bibliothèque logicielle disponible. Cela inclut la compilation de ces programmes à partir de leur source, à moins que "-bin" ne soit spécifié à la fin de leur nom.
   **/!\ Soyez prudent /!\ Les paquets dans AUR sont fournis par la communauté, n'installez pas n'importe quoi !**
   
   ```
   sudo pacman -S --needed git base-devel
   git clone https://aur.archlinux.org/yay-bin.git
   cd yay-bin
   makepkg -si
   ```

   Ajout du support pour les mises à jour des paquets git. (Normalement, cela ne doit être fait qu'une seule fois.)
   ```
   yay -Y --gendb
   yay -Y --devel --save
   ```

3. Alias de maintenance :
limine
  <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutoriel Arch Linux Partie 4 : Maintenance ](https://www.youtube.com/watch?v=Z7POSK2jnII)

   Cette modification vous permet de simplement taper « update-arch » dans un terminal pour mettre à jour le système, « clean-arch » pour le nettoyer, ou « fix-key » en cas d'erreur avec les clés gpg.

   ```
   nano ~/.bashrc
   ```
   Ajoutez chacune de ces lignes à la fin du fichier :
   ```
   alias update-arch='yay -Syu && flatpak update'
   ```
   ```
   alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'
   ```
   ```
   alias update-mirrors='sudo reflector --verbose --score 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist'
   ```
   ```
   alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
   ```
   
   Redémarrez le terminal.

4. Compilation multithread des paquets AUR :

   ```
   nano /etc/makepkg.conf
   ```

   Pour utiliser tous les threads, ajoutez :

   ```
   MAKEFLAGS="-j$(nproc)"
   ```

   Ou si, par exemple, vous souhaitez utiliser 6 threads :

   ```
   MAKEFLAGS="-j6"
   ```

   Remplacez le 6 par le nombre de threads que vous souhaitez utiliser. Il est conseillé d'avoir 2 Go de RAM par cœur utilisé.

   ### SUPPORT MATÉRIEL

#### NVIDIA (rester sur X11 au moins jusqu'à la sortie de KDE 6)
Vidéo supplémentaire expliquant comment retrouver l'accès à Wayland depuis GDM :
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Debian et Arch Linux Gnome Wayland avec Nvidia (Debian dans la doc)](https://www.youtube.com/watch?v=DVkWLvwtQ18)

1. **Installer les composants de base :**
    ```
    yay -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
    ```

2. **Activer nvidia-drm.modeset=1 :**

Ce paramètre permet de lancer le module Nvidia au démarrage.

   - **Si utilisation de systemd-boot**

Dans le dossier :

```
/boot/loader/entries/
```

   Il y a plusieurs fichiers .conf, vous devez ajouter nvidia-drm.modeset=1 à la ligne “options” de chaque fichier.
   Exemple : options root=PARTUUID=fb680c54-466d-4708-a1ac-fcc338ed57f1 rw rootfstype=ext4 nvidia-drm.modeset=1

- **Si utilisation de GRUB**

    ```
    sudo nano /etc/default/grub
    ```

    Ajouter **nvidia-drm.modeset=1** à la ligne "grub_cmdline_linux_default="

    Exemple : GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia-drm.modeset=1"

    Ensuite :

    ```
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    ```
   
3. **Charger les modules Nvidia en priorité au lancement d'Arch :**

   **Optionnel**, à ne faire que si on remarque des problèmes au boot.
   
    ```
    sudo nano /etc/mkinitcpio.conf
    ```
    Modifiez la ligne MODULES=() pour :
    ```
    MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
    ```
    Si utilisation de btrfs :
    ```
    MODULES=(btrfs nvidia nvidia_modeset nvidia_uvm nvidia_drm)
    ```

5. **Hook mkinitcpio :**
    Ce hook automatise la reconstruction d'initramfs (le fichier de base de démarrage) à chaque modification du pilote Nvidia.
    ```
    sudo mkdir /etc/pacman.d/hooks/
    sudo nano /etc/pacman.d/hooks/nvidia.hook
    ```
    Ajoutez :
    ```
    [Trigger]
    Operation=Install
    Operation=Upgrade
    Operation=Remove
    Type=Package
    Target=nvidia-dkms
    Target=nvidia-470xx-dkms
    Target=usr/lib/modules/*/vmlinuz

    [Action]
    Description=Mise à jour du module NVIDIA dans initcpio
    Depends=mkinitcpio
    When=PostTransaction
    NeedsTargets
    Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
    ```

6. **Reconstruction de l'initramfs :**
    Comme nous avons déjà installé les pilotes à l'étape 1, donc avant de configurer le hook, nous devons déclencher manuellement la reconstruction de l'initramfs :
    ```
    sudo mkinitcpio -P
    ```

#### AMD (ne pas faire si Nvidia)
Installer les composants de base :
```
yay -S --needed mesa lib32-mesa vulkan-radeon llimineib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader vulkan-mesa-layers lib32-vulkan-mesa-layers
```

#### INTEL (ne pas faire si Nvidia)
Installer les composants de base :
```
yay -S --needed mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader intel-media-driver
```

#### Imprimantes
- Essentiels
    ```
    yay -S --needed ghostscript gsfonts cups cups-filters cups-pdf system-config-printer
    avahi
    sudo systemctl enable --now avahi-daemon cups
    ```
- Pilotes
    ```
    yay -S foomatic-db-engine foomatic-db foomatic-db-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds gutenprint foomatic-db-gutenprint-ppds --needed
    ```
- Imprimantes HP
    ```
    yay -S --needed python-pyqt5 hplip
    ```
- Imprimantes Epson
    ```
    yay -S --needed epson-inkjet-printer-escpr epson-inkjet-printer-escpr2 epson-inkjet-printer-201601w epson-inkjet-printer-n10-nx127
    ```

#### Bluetooth
La seconde commande ci-dessous demande à systemd de démarrer immédiatement le service bluetooth, et aussi de l'activer à chaque démarrage.
```
yay -S --needed bluez bluez-utils bluez-plugins
sudo systemctl enable --now  bluetooth.service
```
#### [PipeWire](https://pipewire.org/) (son)
Pour avoir du son **/!\ Dites oui à tout pour écraser tout avec les nouveaux paquets. /!\**
```
sudo pacman -S --needed pipewire lib32-pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber alsa-utils alsa-firmware alsa-tools sof-firmware
```

### LOGICIEL DE BASE

#### Composants de base
Ici, vous trouverez des codecs, utilitaires, polices, pilotes :
```
yay -S --needed gst-plugins-bad gst-plugins-base gst-plugins-ugly gst-plugin-pipewire gstreamer-vaapi gst-plugins-good gst-libav gstreamer downgrade rebuild-detector mkinitcpio-firmware xdg-desktop-portal-gtk xdg-desktop-portal neofetch power-profiles-daemon lib32-pipewire hunspell hunspell-fr p7zip unrar ttf-liberation noto-fonts noto-fonts-emoji adobe-source-code-pro-fonts otf-font-awesome ttf-droid ntfs-3g fuse2fs exfat-utils fuse2 fuse3 bash-completion man-db man-pages
```

#### Logiciels divers
```
yay -S libreoffice-fresh libreoffice-fresh-fr vlc discord gimp obs-studio gnome-disk-utility visual-studio-code-bin openrgb-bin spotify
```

#### Logiciels KDE

Voici divers logiciels pour graphisme, vidéo (édition, support de codec), utilitaires d'interface graphique, etc.
```
yay -S --needed xdg-desktop-portal-kde okular print-manager kdenlive gwenview spectacle partitionmanager ffmpegthumbs qt6-wayland kdeplasma-addons powerdevil kcalc plasma-systemmonitor qt6-multimedia qt6-multimedia-gstreamer qt6-multimedia-ffmpeg kwalletmanager
```

Vidéo supplémentaire :
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Personnaliser KDE Partie 1 Disposition, Thème, Kvantum, meilleures pratiques !](https://www.youtube.com/watch?v=vdlj83sb84s&t=1240s)

#### Pare-feu
La configuration par défaut peut bloquer l'accès aux imprimantes et autres appareils sur votre réseau local.
Voici un petit lien pour vous aider : https://www.dsfc.net/infra/securite/configurer-firewalld/
```
sudo pacman -S --needed --noconfirm firewalld python-pyqt5 python-capng
sudo systemctl enable --now firewalld.service
firewall-applet &
```

#### Reflector pour la mise à jour automatique des miroirs

```
yay -S reflector-simple
```

Une commande pour générer une liste de miroirs, à faire une fois après la première installation et à répéter si vous voyagez, ou changez de pays, ou si vous trouvez le téléchargement des paquets trop lent, ou si vous rencontrez une erreur vous indiquant qu'un miroir est hors service :

```
sudo reflector --verbose --score 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist
```

#### Timeshift

- [Timeshift](https://github.com/linuxmint/timeshift) est un utilitaire Linux open source pour créer des sauvegardes de tout votre système.

**/!\ ATTENTION : par défaut, c'est uniquement le système qui est sauvegardé, pas votre dossier utilisateur (le /home/) ! /!\\**


```
yay -S timeshift
```

- Évitez timeshift et btrfs sur Arch, J’ai déjà eu de la [casse](https://github.com/linuxmint/timeshift).

    *“BTRFS snapshots are supported only on BTRFS systems having an Ubuntu-type subvolume layout ”*

- Pour bénéficier des sauvegardes automatiques, vous aurez besoin de démarrer cronie. (facultatif) 

  ```
  sudo systemctl enable --now cronie
  ```
  
#### Fish

[Fish](https://fishshell.com/) est un shell en ligne de commande conçu pour être interactif et convivial. Voir aussi [ArchWiki](https://wiki.archlinux.org/title/fish) sur le sujet. Il remplace le shell par défaut, bash.

- Installez fish.
    ```
    yay -S fish                             # 1. installez fish
    chsh -s /usr/bin/fish                   # 2. Définissez-le par défaut.
    fish                                    # 3. Lancez fish ou redémarrez et il sera par défaut.
    fish_update_completions                 # 4. Mettez à jour les complétions.
    set -U fish_greeting                    # 5. Supprimez le message de bienvenue.
    sudo nano ~/.config/fish/config.fish    # 6. Créez un alias comme pour bash au début de ce tutoriel.
    ```
- Ajoutez ensuite les alias suivants entre if et end :
    ```
    alias update-arch='yay -Syu && flatpak update'
    ```
    ```
    alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'
    ```
    ```
    alias update-mirrors='sudo reflector --score 10 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist'
    ```
    ```
    alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* et sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
    ```
- ***Redémarrez sauf si fait à l'étape 3***, les alias de tout type ne fonctionnent qu'après le redémarrage du terminal.

  ## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/game-console.png" width="30" height="30"> **Améliorez votre Expérience de Jeu** <a name="gaming"/>

### Steam
Notez que les pilotes AMD ou Nvidia doivent être installés au préalable comme mentionné dans la section [SUPPORT MATÉRIEL](#HARDWARE-SUPPORT).
```
yay -S steam
```

### Lutris

Lutris est un gestionnaire de jeux FOSS (Free, Open Source) pour les systèmes d'exploitation basés sur Linux.
Lutris permet de rechercher un jeu ou une plateforme (Ubisoft Connect, EA Store, GOG, Battlenet, etc.) et propose un script d'installation qui configurera ce qui est nécessaire pour que votre choix fonctionne avec Wine ou Proton.

```
sudo pacman -S lutris wine-staging
```

Vidéo supplémentaire :
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Configuration de Lutris pour ordinateur portable Intel/Nvidia](https://www.youtube.com/watch?v=Am3pgTXiUAA)

### Support avancé de manettes

Pilote Linux avancé pour manettes sans fil Xbox 360|One|S|X (fournies avec Xbox One S) et beaucoup d'autres manettes comme 8bitdo ([xpadneo](https://github.com/atar-axis/xpadneo)) ([xone](https://github.com/medusalix/xone))

```
yay -S xpadneo-dkms 
```
Pilote Linux avancé pour manettes PS4/PS5
```
yay -S ds4drv dualsensectl
```

### Affichage des performances en jeu

[MangoHud](https://wiki.archlinux.org/title/MangoHud) est une superposition Vulkan et OpenGL qui permet de surveiller les performances du système dans les applications et d'enregistrer des métriques pour le benchmarking.
C'est l'outil dont vous avez besoin si vous voulez voir vos FPS en jeu, votre charge CPU ou GPU, etc. Ou même enregistrer ces résultats dans un fichier.
Ici, nous installons GOverlay qui est une interface graphique pour configurer MangoHud.

```
yay -S goverlay
```

### Amélioration de la compatibilité des jeux Windows

Nous augmentons la valeur par défaut de cette variable, permettant le stockage de plus de "zones de mappage mémoire". La valeur par défaut est très basse. L'objectif est d'améliorer la compatibilité avec les jeux Windows via Wine ou Steam (Voir [ProtonDB](https://www.protondb.com/)), sachant que certains jeux mal optimisés ont tendance à atteindre rapidement cette limite, ce qui peut entraîner un crash.

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Gaming LINUX supprimer les crashs / augmenter la compatibilité](https://youtu.be/sr4RgshrUYY)

- Ajouter dans :

  ```
  sudo nano /etc/sysctl.d/99-sysctl.conf
  ``` 
    la ligne suivante:
      ` 
      vm.max_map_count=2147483642
      `


## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/speed.png" width="30" height="30"> **BONUS** : <a name="optimization"/>

### [Kernel TKG](https://github.com/Frogging-Family/linux-tkg)

> [!WARNING]
> Cette étape est destinée aux utilisateurs avancés :star:

[KERNEL TKG](https://github.com/Frogging-Family) est un noyau hautement personnalisable qui fournit une sélection de correctifs et d'ajustements pour améliorer les performances de bureau et de jeu.

Vidéo associée :
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Kernel TKG sur Arch + Améliorer ses perfs](https://youtu.be/43yYIWMnDJA)
```
git clone https://github.com/Frogging-Family/linux-tkg.git
cd linux-tkg
makepkg -si
```

### [MESA-TKG](https://github.com/Frogging-Family/mesa-git)

> [!WARNING]
> Cette étape est destinée aux utilisateurs avancés :star:

Comme le noyau TKG, mais pour Mesa, une version patchée pour ajouter quelques correctifs et optimisations.
Très utile pour les joueurs AMD, sans intérêt pour les joueurs Nvidia.
```
git clone https://github.com/Frogging-Family/mesa-git.git
cd mesa-git
makepkg -si
```

Dites oui à tout pour tout écraser avec les nouveaux paquets.

### [NVIDIA-ALL](https://github.com/Frogging-Family/nvidia-all)

> [!WARNING]
> Cette étape est destinée aux utilisateurs avancés :star:

Nvidia-all est une intégration du pilote nvidia par TkG. Il comprend des patchs de support pour les nouveaux noyaux. Il vous permet de sélectionner la version du pilote que vous souhaitez installer, qu'il s'agisse de la dernière version officielle, d'une version bêta, de la version Vulkan, etc.

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Vous utilisez Arch et Nvidia, regardez ça !](https://youtu.be/T0laE8gPtfY)
```
git clone https://github.com/Frogging-Family/nvidia-all.git
cd nvidia-all
makepkg -si
```

Dites oui à tout pour tout écraser avec les nouveaux paquets.


### Installation [Flatpak](https://wiki.archlinux.org/title/Flatpak)

Anciennement connu sous le nom de xdg-app, il s'agit d'un utilitaire de déploiement de logiciels et de gestion de paquets pour Linux. Il est promu comme offrant un environnement "sandbox" dans lequel les utilisateurs peuvent exécuter des logiciels isolément du reste du système.

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [MangoHUD, Goverlay, Steam, Lutris FLATPAK!](https://www.youtube.com/watch?v=1dha2UDSF4M)
```
yay -S flatpak flatpak-kcm
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

## Dépannage <a name="troubleshooting"/>
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Partie 3 les problèmes les plus communs.](https://youtu.be/vbOOQsYyPfc?si=wA2W8bOG1gtpfmnZ)

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Partie 4 Maintenance / mise à jour](https://youtu.be/Z7POSK2jnII?si=SNwagGGJXRVkYPdc)
 
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Partie 5 Arch-Chroot](https://youtu.be/iandJSjePiA?si=7uI8JZ-VxAVOsPTh)

- Pour de l'aide, visitez le Discord GLF (fr/en) : [Discord GLF](http://discord.gg/EP3Jm8YMvj)

## Sources <a name="community"/>

Sources et liens utiles :
- [ArchWiki](https://wiki.archlinux.org/)
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Fonctionnement du WIKI d'Arch.](https://www.youtube.com/watch?v=TQ3A9l2N5lI)
- [Site GLF](https://www.gaminglinux.fr/)
- [Discord GLF](http://discord.gg/EP3Jm8YMvj)
- [Ma chaîne Youtube](https://www.youtube.com/@Cardiacman)


## Contribution

Les contributions à ce projet sont les bienvenues ! Si vous avez des suggestions, des rapports de bugs ou des contributions, veuillez ouvrir une [issue](https://github.com/Cardiacman13/Architect/issues) ou une demande Pull Request dans le dépôt.

Comme vous pouvez le voir, ce projet est disponible en français, en anglais et en espagnol. Les traducteurs sont plus que bienvenus ! :people_holding_hands:

<!-- readme: contributors -start -->
<!-- readme: contributors -end -->
