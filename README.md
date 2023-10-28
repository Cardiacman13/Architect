# TUTO ET SCRIPT POST-INSTALLATION ARCH LINUX

[ **English version** ](https://github.com/Cardiacman13/post-install-arch)

**Dernière modification du tuto le : 28/10/2023**

## PREAMBULE
### IMPORTANT !! ###
**Ce tutoriel est à suivre absolument dans l'ordre indiqué !**

### Présentation

Arch est une distribution technique destinée à un public plus averti, composée de "blocs de construction". Pensez-y comme à un ensemble de Lego vierge, avec une base que vous devrez construire et façonner à votre guise, et si vous le faites mal, les choses peuvent se casser.

Le but de ce tutoriel est d’installer une Arch stock avec un minimum de paquets, selon nos besoins pour de la bureautique et/ou du gaming. 

<img src="assets/images/Cardiac-icon.png" width="30" height="30"> Cette icône vous redirige vers mes vidéos sur certaines parties de ce tuto.

<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [ Tuto Arch Linux Playlist ](https://www.youtube.com/watch?v=JE6VwNHLcyk&list=PLuIP_-MWRwtWEX0tyDpZPdwU6zCE1O1cY)

### Conditions

Le script que vous retrouverez plus loin fonctionne quelques soient vos choix DE / BOOT LOADER / FS.

Le tutoriel est optimisé pour les choix suivants : 

- systemd-boot
- Ext4
- KDE
- Une Arch pure (incompatible avec Garuda, EndeavourOS, Manjaro…) 

Néanmoins, si vous savez ce que vous faites, les modifications pour d’autres choix sont minimes.

Télécharger l’ISO : [**Arch Linux - Downloads**](https://archlinux.org/download/)

### Table des matières
1. [Installation](#section-1)
2. [Post installation](#section-2)
3. [Support matériel](#section-3)
4. [Logiciels de base](#section-4)
5. [Gaming](#section-5)
6. [Bonus](#section-6)

## INSTALLATION    <a name="section-1"></a>

**Suivre scrupuleusement cette video :** 
<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [ Tuto Arch Linux Partie 1 : Archinstall ](https://www.youtube.com/watch?v=JE6VwNHLcyk)

Pour toutes les étapes suivantes, lorsque vous aurez du texte dans ce type de présentation, cela indiquera une commande à taper dans votre terminal :
```
echo "Hello world !"            # Exemple de commande
```

1. **Mettre le clavier en FR**
    Attention ici : par défaut vous serez en QWERTY, le "a" sera donc, et uniquement pour cette commande, sur la touche "q" de votre clavier.
    ```
    loadkeys fr
    ```

2. **Paramétrer votre Wi-Fi**
    ```
    iwctl
    ```
    Puis (remplacez NOM-DE-VOTRE-WIFI par le nom de votre wifi)
    ```
    station wlan0 connect NOM-DE-VOTRE-WIFI (SSID)
    ```
    Entrez le mot de passe de votre wifi puis `quit` pour quitter iwctl.

3. **Archinstall**
    ```
    pacman -Syu archinstall      # mise à jour du script archinstall avant l’installation
    archinstall                 # pour lancer le script d'aide à l'installation de arch linux
    ```
    **/!\ Le menu d’archinstall est susceptible de changer au fil des mises à jour du script /!\\**
    
## POST INSTALLATION    <a name="section-2"></a>
<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [ Tuto Arch Linux Partie 2 : Post installation ](https://youtu.be/FEFhC46BkXo?si=Gi-6BOhqENLoh5Ak)

Script à exécuter sur une installation propre, **fraîchement installée avec archinstall**, il réalise le tutoriel pour vous quelques soient vos choix de DE, bootloader et file system.

Si Nvidia, s'assurer que sa carte est compatible avec les derniers drivers Nvidia en date, de manière générale ce script/tuto n'est pas pensé pour les ordinosaures.

**Script post installation :**

   ```
   sudo pacman -Syu git
   git clone https://github.com/Cardiacman13/Tuto-Arch.git
   cd Tuto-Arch
   ./post-installation
   ```
N'hésitez pas à faire remonter les bugs, merci :) 

### Optimiser pacman

1. Cette [modification](https://wiki.archlinux.org/title/Pacman#Enabling_parallel_downloads) permet la parallélisation du téléchargement des packages. (PS: avec kate, quand vous sauvegardez, il est possible qu'on vous demande d'entrer un mot de passe. Entrez votre mot de passe root/sudo.)

   ```
    kate /etc/pacman.conf
    ```

    Décommenter (enlevez les **#** des lignes suivantes):
        
    ```
    #Misc options
    #UseSyslog
    Color <-
    #NoProgressBar
    #CheckSpace
    VerbosePkgLists <- 
    ParallelDownloads = 5 <-
    ```

2. Installation de yay

   [Yay](https://github.com/Jguer/yay) est un outil pratique pour gérer l'installation et la mise à jour de logiciels sur les systèmes basés sur Arch Linux.
   Yay permet notamment de faciliter l'usage du dépôt AUR, dépôt géré par la communauté et agrandissant considérablement la bibliothèque de logiciels disponibles. Cela passe par la compilation de ces logiciels depuis leur source, à part s'il est spécifié "-bin" à la fin de leur nom.
   **/!\ Attention cependant /!\ Les paquets dans AUR étant fournis par la communauté, n'installez pas n'importe quoi !**
   
    ```
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
    ```

   Ajout du support pour les updates des paquets git. (Normalement à de faire q'une seule fois)
    ```
    yay -Y --gendb
    yay -Y --devel --save
    ```

3. Alias de maintenance :

   <img src="assets/images/Cardiac-icon.png" width="30" height="30"> [ Tuto Arch Linux Partie 4 : Maintenance ](https://www.youtube.com/watch?v=Z7POSK2jnII)

   Cette modification permet de n’avoir à taper que “update-arch” dans un terminal afin de mettre à jour le système, “clean-arch” pour le nettoyer ou “fix-key” en cas d'erreur avec les clés gpg.

    ```
    kate ~/.bashrc
    ```
    Ajouter chacune de ces lignes à la fin du fichier :
    ```
    alias update-arch='yay -Syu && flatpak update'
    ```
    ```
    alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'
    ```
    ```
    alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
    ```
    
   Relancer le terminal.

## SUPPORT MATÉRIEL    <a name="section-3"></a>

### NVIDIA (restez en X11 au moins jusqu’à la sortie de KDE 6)
Vidéo complémentaire expliquant comment à nouveau avoir accès à Wayland depuis GDM :
<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Debian et Arch Linux Gnome Wayland avec Nvidia (Debian dans le doc)](https://www.youtube.com/watch?v=DVkWLvwtQ18)

1. **Installer les composants core :**
    ```
    yay -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader cuda
    ```

2. **Activer nvidia-drm.modeset=1 :**

Ce paramètre permet de lancer le module Nvidia lors du démarrage.

   - **Si systemd boot**

Dans le dossier :

```
/boot/loader/entries/
```

   Il y a plusieurs fichiers .conf, il faut ajouter nvidia-drm.modeset=1 à la ligne “options” de chaque fichier,
   exemple : options                 root=PARTUUID=fb680c54-466d-4708-a1ac-fcc338ed57f1 rw rootfstype=ext4 nvidia-drm.modeset=1

- **Si grub**

    ```
    kate /etc/default/grub
    ```

    Ligne "grub_cmdline_linux_default=" ajouter **nvidia-drm.modeset=1**

    exemple : GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia-drm.modeset=1"

    puis :

    ```
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    ```
   
3. **Charger les modules Nvidia en priorité au lancement de Arch :**
    Cette étape est parfois nécessaire pour certains environnements de bureau ou gestionnaires de fenêtres.
    ```
    kate /etc/mkinitcpio.conf
    ```
    Modifier la ligne MODULES=() en :
    ```
    MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
    ```
    si btrfs :
    ```
    MODULES=(btrfs nvidia nvidia_modeset nvidia_uvm nvidia_drm)
    ```
4. **Hook mkinitcpio** :
    Le hook permet d'automatiser la reconstruction de l'initramfs (le fichier permettant le boot de base) à chaque modification du driver Nvidia.
    ```
    sudo mkdir /etc/pacman.d/hooks/
    kate /etc/pacman.d/hooks/nvidia.hook
    ```
    Ajouter :
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
    Description=Update NVIDIA module in initcpio
    Depends=mkinitcpio
    When=PostTransaction
    NeedsTargets
    Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
    ```

5. **Reconstruction de l'initramfs** :
    Comme nous avons déjà installé les drivers à l'étape 1, donc avant la mise en place du hook, nous allons lancer manuellement la reconstruction de l'initramfs :
    ```
    mkinitcpio -P
    ```

### AMD (ne pas faire si Nvidia)
Installer les composants core :
```
yay -S --needed mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader vulkan-mesa-layers lib32-vulkan-mesa-layers
```

### INTEL (ne pas faire si Nvidia)
Installer les composants core :
```
yay -S --needed mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader intel-media-driver
```

### Imprimantes
- Les indispensables
    ```
    yay -S ghostscript gsfonts cups cups-filters cups-pdf system-config-printer
    avahi  --needed
    sudo systemctl enable --now avahi-daemon cups
    ```
- Drivers
    ```
    yay -S foomatic-db-engine foomatic-db foomatic-db-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds gutenprint foomatic-db-gutenprint-ppds --needed
    ```
- Imprimantes HP
    ```
    yay -S python-pyqt5 hplip --needed
    ```
- Imprimantes Epson
    ```
    yay -S --needed epson-inkjet-printer-escpr  epson-inkjet-printer-escpr2  epson-inkjet-printer-201601w  epson-inkjet-printer-n10-nx127
    ```

### Bluetooth
La deuxième commande ci-dessous demande à systemd de démarrer immédiatement le service bluetooth, et aussi de l'activer pour chaque démarrage.
```
yay -S --needed bluez bluez-utils bluez-plugins
sudo systemctl enable --now  bluetooth.service
```
### [PipeWire](https://pipewire.org/) (son)
Pour avoir du son **/!\ Dire oui à tout pour bien tout écraser avec les nouveaux paquets. /!\\**
```
sudo pacman -S --needed pipewire lib32-pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber alsa-utils alsa-firmware alsa-tools
```

## LOGICIELS DE BASE    <a name="section-4"></a>

### Composants de base
Vous y trouverez des codecs, des utilitaires, des polices, des drivers :
```
yay -S gst-plugins-bad gst-plugins-base gst-plugins-ugly gst-plugin-pipewire gstreamer-vaapi gst-plugins-good gst-libav gstreamer reflector-simple downgrade rebuild-detector mkinitcpio-firmware xdg-desktop-portal-gtk xdg-desktop-portal neofetch power-profiles-daemon lib32-pipewire hunspell hunspell-fr p7zip unrar ttf-liberation noto-fonts noto-fonts-emoji adobe-source-code-pro-fonts otf-font-awesome ttf-droid ntfs-3g fuse2fs exfat-utils fuse2 fuse3 bash-completion man-db man-pages --needed
```
 
### Logiciels divers
```
yay -S libreoffice-fresh libreoffice-fresh-fr vlc discord gimp obs-studio gnome-disk-utility visual-studio-code-bin
```

### Logiciels KDE

Vous avez ici différents logiciels pour le graphisme, la vidéo (montage, prise en compte des codecs), des utilitaires avec interface graphique, etc.
```
yay -S xdg-desktop-portal-kde okular print-manager kdenlive gwenview spectacle partitionmanager ffmpegthumbs qt6-wayland kdeplasma-addons powerdevil kcalc plasma-systemmonitor qt6-multimedia qt6-multimedia-gstreamer qt6-multimedia-ffmpeg kwalletmanager
```

Vidéo complémentaire :
<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Customiser KDE Partie 1 Layout, Thème, Kvantum, bonnes pratiques !](https://www.youtube.com/watch?v=vdlj83sb84s&t=1240s)

### Pare-feu
La configuration par défaut peut entraîner le blocage de l'accès aux imprimantes et à d'autres appareils sur votre réseau local.
Voici donc un petit lien pour vous aider : https://www.dsfc.net/infra/securite/configurer-firewalld/
```
sudo pacman -S --needed --noconfirm firewalld python-pyqt5 python-capng
sudo systemctl enable --now firewalld.service
firewall-applet &
```

### Reflector pour update les miroirs automatiquement

```
yay -S reflector-simple
```

Une commande pour générer une liste de miroirs, à faire 1 fois après la première installation et à réitérer si vous voyagez, ou changez de pays, ou si vous voyez que le téléchargement des paquets est trop long, ou encore si vous avez une erreur qui vous dit que un miroir est down :

```
sudo reflector --score 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist
```

## GAMING    <a name="section-5"></a>

### Steam
A noter que les drivers AMD ou Nvidia doivent être installés précédemment comme mentionné dans la section [SUPPORT MATÉRIEL](#SUPPORT-MATÉRIEL)
```
yay -S steam
```

### Lutris

Lutris est un gestionnaire de jeux FOSS (libre, gratuit et open source) pour les systèmes d'exploitation basés sur Linux.
Lutris permet de rechercher un jeu ou une plateforme (Ubisoft Connect, EA Store, GOG, Battlenet, etc.) et de proposer un script d'installation qui paramètrera ce qu'il faut pour que votre choix fonctionne avec Wine ou Proton.

```
sudo pacman -S --needed lutris wine-staging
```

Vidéo complémentaire :
    <img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Paramétrer Lutris pour PC portable Intel/Nvidia ](https://www.youtube.com/watch?v=Am3pgTXiUAA)

### Support manettes avancé 

Pilote Linux avancé pour les manettes sans fil Xbox 360|One|S|X (livrée avec la Xbox One S) et tout un tas d’autres manettes comme la 8bitdo ([xpadneo](https://github.com/atar-axis/xpadneo)) ([xone](https://github.com/medusalix/xone))


```
yay -S --needed xpadneo-dkms 
```
Pilote Linux avancé pour les manettes PS4/PS5
```
yay -S --needed bluez-utils-compat ds4drv dualsencectl
```

### Afficher les performances en jeu

[MangoHud](https://wiki.archlinux.org/title/MangoHud) est une surcouche Vulkan et OpenGL permettant de surveiller les performances du système à l'intérieur des applications et d'enregistrer des métriques pour l'analyse comparative.
C'est l'outil qu'il vous faut si vous voulez voir en jeu vos FPS, la charge de votre processeur ou carte graphique, etc. Ou même enregistrer ces résultats dans un fichier.
Ici, nous installons GOverlay qui est une interface graphique pour paramétrer MangoHud.

```
yay -S goverlay --needed
```

### Augmenter la compatibilité des jeux Windows

Nous augmentons la valeur par défaut de cette variable, permettant de stocker davantage de "memory map areas". La valeur par défaut est très basse. L'objectif est d'améliorer la compatibilité avec les jeux Windows via Wine ou Steam (Voir [ProtonDB](https://www.protondb.com/)), sachant que certains jeux mal optimisés nécessitent ce changement afin de ne plus subir de crash.
    
<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Gaming LINUX supprimer les crashs / augmenter la compatibilité](https://youtu.be/sr4RgshrUYY)

    ```
    kate /etc/sysctl.d/99-sysctl.conf
    ```
    - Ajouter la ligne suivante :
    ```
    vm.max_map_count=16777216
    ```

## BONUS    <a name="section-6"></a>

### Timeshift

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
  
### Fish

[Fish](https://fishshell.com/) est un shell de ligne de commande conçu pour être interactif et convivial. Voir également [ArchWiki](https://wiki.archlinux.org/title/fish) sur le sujet. Il remplace le shell par défut qui est bash.

- Installer fish.
    ```
    yay -S fish                       # 1. Installer Fish
    chsh -s /usr/bin/fish             # 2. Le mettre par défaut.
    fish                              # 3. Lancer fish ou reboot et il sera par défaut.
    fish_update_completions           # 4. Mettre à jour les complétions.
    set -U fish_greeting              # 5. Enlever le message de bienvenue.
    kate ~/.config/fish/config.fish   # 6. Créer un alias comme pour bash en début de tuto.
    ```
- Puis rajouter les alias suivants entre if et end :
    ```
    alias update-arch='yay -Syu && flatpak update'
    ```
    ```
    alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'
    ```
    ```
    alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
    ```
- ***Reboot sauf si ça a été fait à l’étape 3***, les alias quels qu’ils soient ne fonctionnent qu’après avoir relancé le terminal.

### [Kernel TKG](https://github.com/Frogging-Family/linux-tkg) (WARNING utilisateurs avancés)

[TKG](https://github.com/Frogging-Family) propose un build de kernel hautement personnalisable qui fournit une sélection de corrections et d'ajustements visant à améliorer les performances des ordinateurs de bureau et des jeux.

Vidéo complémentaire :
<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Kernel TKG sur Arch + Booster ses perfs](https://youtu.be/43yYIWMnDJA)
```
git clone https://github.com/Frogging-Family/linux-tkg.git
cd linux-tkg
makepkg -si
```

### [MESA-TKG](https://github.com/Frogging-Family/mesa-git) (WARNING utilisateurs avancés)

Tout comme pour le kernel TkG, mais pour Mesa, une version patchée afin d'ajouter quelques correctifs et optimisations.
Très utile pour les joueurs AMD, n'a pas d'intérêt pour les joueurs Nvidia.
```
git clone https://github.com/Frogging-Family/mesa-git.git
cd mesa-git
makepkg -si
```
Dire oui à tout pour bien tout écraser avec les nouveaux paquets.

### [NVIDIA-ALL](https://github.com/Frogging-Family/nvidia-all) (WARNING utilisateurs avancés)

Nvidia-all est une intégration du driver nvidia par TkG. Il comporte des patchs de support pour les nouveaux kernels. Il permet de sélectionner la version du driver que l'on souhaite installer, que ce soit le dernier officiel, une version beta, la version Vulkan, etc.

<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Vous utilisez Arch et Nvidia regardez ça !](https://youtu.be/T0laE8gPtfY)
```
git clone https://github.com/Frogging-Family/nvidia-all.git
cd nvidia-all
makepkg -si
```

Dire oui à tout pour bien tout écraser avec les nouveaux paquets.


### Installation [Flatpak](https://wiki.archlinux.org/title/Flatpak)

Anciennement connu sous le nom de xdg-app, c'est un utilitaire de déploiement de logiciels et de gestion de paquets pour Linux. Il est présenté comme offrant un environnement "bac à sable" dans lequel les utilisateurs peuvent exécuter des logiciels de manière isolée du reste du système.

<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [MangoHUD, Goverlay, Steam, Lutris FLATPAK !](https://www.youtube.com/watch?v=1dha2UDSF4M)
```
yay -S flatpak flatpak-kcm
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install com.bitwarden.desktop com.discordapp.Discord com.github.tchx84.Flatseal com.gitlab.davem.ClamTk com.heroicgameslauncher.hgl com.microsoft.Edge com.moonlight_stream.Moonlight com.rtosta.zapzap com.spotify.Client com.sweethome3d.Sweethome3d com.tutanota.Tutanota com.valvesoftware.Steam com.visualstudio.code info.febvre.Komikku io.github.anirbandey1.ChatbotClient io.github.koromelodev.mindmate net.davidotek.pupgui2 net.lutris.Lutris one.flipperzero.qFlipper org.bleachbit.BleachBit org.gnome.Boxes org.gnome.OCRFeeder org.kde.gcompris org.kde.kdenlive org.libreoffice.LibreOffice org.videolan.VLC org.yuzu_emu.yuzu us.zoom.Zoom xyz.ketok.Speedtest
```

### [Chaotic AUR](https://aur.chaotic.cx/)
- Le chaotic AUR est un dépôt AUR qui contient des paquets binaires précompilés pour Arch Linux et ses dérivés.
    ```
    pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
    pacman-key --lsign-key 3056513887B78AEB
    pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
    kate /etc/pacman.conf
    ```
- Puis ajouter ceci à la fin du fichier :
    ```
    [chaotic-aur]
    Include = /etc/pacman.d/chaotic-mirrorlist
    ```

- Enfin mettez à jour la liste des repo sur votre machine:
    ```
    sudo pacman -Syy
    ```

### Problèmes récurrents :

 <img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Partie 3 les problèmes les plus courants.](https://youtu.be/vbOOQsYyPfc?si=wA2W8bOG1gtpfmnZ)

 <img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Partie 4 Maintenance / mise à jour](https://youtu.be/Z7POSK2jnII?si=SNwagGGJXRVkYPdc)
 
 <img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Partie 5 Arch-Chroot](https://youtu.be/iandJSjePiA?si=7uI8JZ-VxAVOsPTh)

- Si vous n’avez pas de son, tentez :
    ```
    yay -S sof-firmware
    ```

- Pour de l’aide, venez sur le Discord GLF (fr/en): [Discord GLF](http://discord.gg/EP3Jm8YMvj)

## Sources

Sources et liens utiles :
- [ArchWiki](https://wiki.archlinux.org/)
<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Fonctionnement du WIKI d'Arch.](https://www.youtube.com/watch?v=TQ3A9l2N5lI)
- [Site GLF](https://www.gaminglinux.fr/)
- [Discord GLF](http://discord.gg/EP3Jm8YMvj)
- [Ma chaine Youtube](https://www.youtube.com/@Cardiacman)
