# TUTO ARCH LINUX 

**Dernière modification du tuto le : 16/09/2023**

## Fonctionnement du tuto

**À FAIRE DANS L'ORDRE ET VIDÉO OBLIGATOIRE !** (qui n’est pas encore sortie)

Le but de ce tuto est d’installer une Arch stock avec un minimum de paquets, selon nos besoins pour de la bureautique et ou du gaming. 

<img src="assets/images/Cardiac-icon.png" width="30" height="30"> Cette icône vous redirige vers mes vidéos sur certaines parties de ce tuto

## Conditions

Ce tuto est optimisé pour les choix suivant : 

- systemd-boot
- Ext4
- KDE
- Une Arch pure (incompatible avec Garuda, EndeavourOS, Manjaro…) Néanmoins, si vous savez ce que vous faites, les modifications pour d’autres choix sont minimes.

Télécharger l’ISO : [**Arch Linux - Downloads**](https://archlinux.org/download/)

## INSTALLATION

1. **Mettre le clavier en FR**
    ```bash
    loadkeys fr
    ```

2. **Paramétrer votre Wi-Fi**
    Tapez
    ```bash
    iwctl
    ```
    Puis (remplacez NOM-DE-VOTRE-WIFI par le nom de votre wifi)
    ```bash
    station wlan0 connect NOM-DE-VOTRE-WIFI (SSID)
    ```
    Entrer le mot de passe de votre wifi puis `quit` pour quitter iwctl

2. **Archinstall**
    ```bash
    pacman -Sy archinstall      # mise à jour du script archinstall avant l’installation
    archinstall                 # pour lancer le script d'aide à l'installation de arch linux
    ```
    **/!\ Le menu d’archinstall est susceptible de changer au fil des mises à jour du script /!\\**
    
    Si vous avez des difficultés avec archinstall, vous pouvez suivre cette video :  
    <img src="assets/images/Cardiac-icon.png" width="30" height="30"> [ Tuto Arch Linux Partie 1 : Archinstall ](https://www.youtube.com/watch?v=JE6VwNHLcyk)

## POST INSTALLATION

### Optimiser pacman

1. Cette [modification](https://wiki.archlinux.org/title/Pacman#Enabling_parallel_downloads) permet la parallélisation du téléchargement des packages. (PS: avec kate, quand vous sauvegardez, il est possible qu'on vous demande d'entrer un mot de passe, entrez votre mot de passe root/sudo)
    ```
    kate /etc/pacman.conf
    ```
2. Décommenter (enlever les **#** des lignes suivantes):
    ```bash
    #Misc options
    #UseSyslog
    Color <-
    #NoProgressBar
    #CheckSpace
    VerbosePkgLists <- 
    ParallelDownloads = 8 <-
    ```
3. Installation de yay
    [Yay](https://github.com/Jguer/yay) est un outil pratique pour gérer l'installation et la mise à jour de logiciels sur les systèmes basés sur Arch Linux.
    ```bash
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
    ```

4. Alias maintenance
    Cette modification permet de n’avoir à taper que “u” dans un terminal afin de faciliter la maintenance du système (inutile si vous comptez faire les bonus).
    ```bash
    kate ~/.bashrc
    ```
    Et ajouter ceci a la fin du fichier :
    ```bash
    alias u="sudo pacman -Syy && yay -S archlinux-keyring && yay && yay -Sc && sudo pacman -Rns $(pacman -Qdtq)"
    ```
    Relancer le terminal.
    Quand vous avez l'erreur : **“erreur : aucune cible spécifiée (utiliser -h pour l’aide)**” cela signifie que pacman ne trouve pas de dépendance orpheline, **tout va bien!**

## SUPPORT MATÉRIEL

### NVIDIA (restez en X11 au moins jusqu’à la sortie de KDE 6)

<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Debian et Arch Linux Gnome Wayland avec Nvidia (Debian dans le doc)](https://www.youtube.com/watch?v=DVkWLvwtQ18)

1. **Installer les composants core :**
    ```bash
    yay -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader cuda
    ```

2. **Activer nvidia-drm.modeset=1 :**
    ```bash
    kate /boot/loader/entries/NOMDELENTÉE.conf
    ```
    Et y ajouter :
    ```bash
    nvidia-drm.modeset=1
    ```
3. **Charger les modules Nvidia en priorité au lancement de Arch :**
    ```bash
    kate /etc/mkinitcpio.conf
    ```
    Puis modifier la ligne MODULES=() en :
    ```bash
    MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
    ```
    
4. **hook mkinitcpio** :
    ```bash
    sudo mkdir /etc/pacman.d/hooks/
    kate /etc/pacman.d/hooks/nvidia.hook
    ```
    - Puis y ajouter :
    ```bash
    [Trigger]
    Operation=Install
    Operation=Upgrade
    Operation=Remove
    Type=Package
    Target=VOTRE-DRIVER-ACTUEL # (nvidia ou nvidia-lts ou nvidia-dkms)
    Target=VOTRE-KERNEL-ACTUEL # (linux ou linux-lts ou linux-zen)
    Target=VOTRE-SECOND-KERNEL 

    [Action]
    Description=Update NVIDIA module in initcpio
    Depends=mkinitcpio
    When=PostTransaction
    NeedsTargets
    Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
    ```

### AMD
Installer les composants core :
```bash
yay -S --needed mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
```

### Imprimantes
- Les indispensables
    ```bash
    yay -S ghostscript gsfonts cups cups-filters cups-pdf system-config-printer
    avahi  --needed
    sudo systemctl enable --now avahi-daemon
    sudo systemctl enable --now cups
    ```
- Drivers
    ```bash
    yay -S foomatic-db-engine foomatic-db foomatic-db-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds gutenprint foomatic-db-gutenprint-ppds --needed
    ```
- Imprimantes HP
    ```bash
    yay -S python-pyqt5 hplip --needed
    ```
### Bluetooth
```bash
yay -S --needed bluez bluez-utils bluez-plugins
sudo systemctl enable --now  bluetooth.service
```
### [PipeWire](https://pipewire.org/)
- Pour avoir du son **/!\ Dire oui à tout pour bien tout écraser avec les nouveaux paquets. /!\\**
    ```bash
    sudo pacman -S --needed pipewire-pulse pipewire-alsa pipewire-jack wireplumber
    ```

## SOFTWARE CORE

### Composants de base
```bash
yay -S mkinitcpio-firmware xdg-desktop-portal neofetch power-profiles-daemon lib32-pipewire hunspell-fr p7zip unrar ttf-liberation noto-fonts noto-fonts-emoji ntfs-3g fuse2 bash-completion --needed
```

### Logiciels divers
```bash
yay -S libreoffice-fresh libreoffice-fresh-fr vlc discord gimp obs-studio gnome-disk-utility
```

### Logiciels KDE
<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Customiser KDE Partie 1 Layout, Thème, Kvantum, bonnes pratiques !](https://www.youtube.com/watch?v=vdlj83sb84s&t=1240s)
```bash
yay -S xdg-desktop-portal-kde xdg-desktop-portal-gtk okular print-manager kdenlive gwenview spectacle partitionmanager ffmpegthumbs qt6-wayland kdeplasma-addons
```

### Pare-feu
```bash
sudo pacman -S ufw
sudo systemctl enable --now ufw.service
```

### Reflector pour update les mirrors automatiquement
```bash
yay -S reflector-simple
```

## GAMING

### Steam
A noter que les drivers AMD ou Nvidia doivent être installés précédemment comme mentionné dans la section [SUPPORT MATÉRIEL](#SUPPORT-MATÉRIEL)
```bash
yay -S steam
```

### Lutris

- Lutris est un gestionnaire de jeux FOSS (libre, gratuit et open source) pour les systèmes d'exploitation basés sur Linux.

    <img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Paramétrer Lutris pour PC portable Intel/Nvidia ](https://www.youtube.com/watch?v=Am3pgTXiUAA)

    <img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Tuto Diablo IV bêta LINUX sur lutris ](https://www.youtube.com/watch?v=090SyVMtbCM)

    ```bash
    sudo pacman -S --needed lutris wine-staging winetricks wine-mono giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls
    mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error
    lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo
    sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama
    ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3
    lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader
    ```

### Support manettes Xbox

Pilote Linux avancé pour la manette sans fil Xbox One (livrée avec la Xbox One S) Et tout un tas d’autres manettes ([ce lien](https://github.com/atar-axis/xpadneo))

```bash
yay -S  xpadneo-dkms --needed
```

### Afficher les performances en jeu

[MagoHub](https://wiki.archlinux.org/title/MangoHud) est une surcouche Vulkan et OpenGL permettant de surveiller les performances du système à l'intérieur des applications et d'enregistrer des métriques pour l'analyse comparative.

```bash
yay -S goverlay --needed
```

### Augmentez  la compatibilité des jeux Windows

- L'objectif est d'améliorer la compatibilité avec les jeux Windows via Wine ou Steam. (Voir [ProtonDB](https://www.protondb.com/))
    
    <img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Gaming LINUX supprimer les crashs / augmenter la compatibilité](https://youtu.be/sr4RgshrUYY)

    ```bash
    kate /etc/sysctl.d/99-sysctl.conf
    ```
- Ajouter la ligne suivante
    ```bash
    vm.max_map_count=16777216
    ```

## BONUS

### Timeshift

- [Timeshift](https://github.com/linuxmint/timeshift) est un utilitaire Linux open source pour créer des sauvegardes systèmes.
    ```bash
    yay -S timeshift
    ```
- Évitez timeshift et btrfs sur Arch J’ai déjà eu de la [casse](https://github.com/linuxmint/timeshift).

    “BTRFS snapshots are supported only on BTRFS systems having an Ubuntu-type subvolume layout ”

### Fish

- [Fish](https://fishshell.com/) le shell interactif convivial, est un shell de ligne de commande conçu pour être interactif et convivial. Voir également [ArchWiki](https://wiki.archlinux.org/title/fish) sur le sujet.
Installer fish.
    ```bash
    yay -S fish                       # 1. Installer Fish
    chsh -s /usr/bin/fish             # 2. Le mettre par défaut.
    fish                              # 3. Lancez fish ou reboot et il sera par défaut.
    fish_update_completions           # 4. Mettre à jour les completions.
    set -U fish_greeting              # 5. Enlever le message de bienvenue
    kate ~/.config/fish/config.fish   # 6. Créer un alias comme pour bash en début de tuto
    ```
- Puis rajouter l'alias suivant entre if et end :
    ```bash
    alias u='sudo pacman -Syy && yay -S archlinux-keyring && yay && yay -Sc && sudo pacman -Rns $(pacman -Qdtq)'
    ```
- ***Reboot sauf si ça a été fait à l’étape 3***, les alias quels qu’ils soient, ne fonctionnent qu’après avoir relancer le terminal.

### [Kernel TKG](https://github.com/Frogging-Family/linux-tkg) (WARNING utilisateurs avancés)

[TKG](https://github.com/Frogging-Family) propose un build de kernel hautement personnalisable qui - fournit une sélection de corrections et d'ajustements visant à améliorer les performances des ordinateurs de bureau et des jeux.

<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Kernel TKG sur Arch + Booster ses perfs](https://youtu.be/43yYIWMnDJA)
```bash
git clone https://github.com/Frogging-Family/linux-tkg.git
cd linux-tkg
makepkg -si
```

### [MESA-TKG](https://github.com/Frogging-Family/mesa-git) (WARNING utilisateurs avancés)

Très utile pour les joueurs AMD.
```bash
git clone https://github.com/Frogging-Family/mesa-git.git
cd mesa-git
makepkg -si
```
Dire oui à tout pour bien tout écraser avec les nouveaux paquets.

### Installation [Flatpak](https://wiki.archlinux.org/title/Flatpak)

Anciennement connu sous le nom de xdg-app, est un utilitaire de déploiement de logiciels et de gestion de paquets pour Linux. Il est présenté comme offrant un environnement "bac à sable" dans lequel les utilisateurs peuvent exécuter des logiciels d'application de manière isolée du reste du système.

<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [MangoHUD, Goverlay, Steam, Lutris FLATPAK !](https://www.youtube.com/watch?v=1dha2UDSF4M)
```bash
yay -S flatpak flatpak-kcm
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

### [Chaotic AUR](https://aur.chaotic.cx/)
- Le chaotic AUR est un dépôt AUR qui contient des paquets binaires précompilés pour Arch Linux et ses dérivés.
    ```bash
    pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
    pacman-key --lsign-key 3056513887B78AEB
    pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
    kate /etc/pacman.conf
    ```
- Puis ajouter ceci a la fin du fichier :
    ```bash
    [chaotic-aur]
    Include = /etc/pacman.d/chaotic-mirrorlist
    ```

### Iso custom BETA WARNING

- ISO personnalisée, crée avec les outils de [Arco linux](https://arcolinuxb.com/byoi/). Téléchargez via ce lien Google drive : [ISO](https://drive.google.com/drive/folders/1oGaA9sNU0I4sArTlekiublxkkZSIkIvp?usp=sharing)

Surtout les Nvidia boys si vous testez cette iso n'hésitez pas à sélectionner X11 au lieu de Wayland en haut à gauche au login en attendant KDE 6.

### Problème récurrent :

- Si vous n’avez pas de son tentez :
    ```bash
    yay -S sof-firmware
    ```

- Pour de l’aide venez sur le Discord GLF (fr/en): [Discord GLF](http://discord.gg/EP3Jm8YMvj)

## Sources

Source et liens utiles
- [ArchWiki](https://wiki.archlinux.org/)

    <img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Fonctionnement du WIKI d'Arch.](https://www.youtube.com/watch?v=TQ3A9l2N5lI)

- [Site GLF](https://www.gaminglinux.fr/)
- [Discord GLF](http://discord.gg/EP3Jm8YMvj)
- [Ma chaine Youtube](https://www.youtube.com/@Cardiacman)
