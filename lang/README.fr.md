# DIDACTICIEL ET SCRIPT POST-INSTALLATION D'ARCH LINUX

## Présentation

<img src="https://github.com/Cardiacman13/Architect/blob/main/assets/images/desktop.png" width="1000" height="250">

Arch est une distribution technique destinée à un public plus avancé, composée de "blocs de construction". Pensez-y comme à un ensemble de Lego vierges, avec une base que vous devez construire et façonner à votre guise, et si vous le faites mal, les choses peuvent se casser.

Le but de ce didacticiel est d'installer un Arch standard avec un minimum de paquets, selon nos besoins pour le travail de bureau et/ou le jeu.

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> Cette icône vous redirige vers mes vidéos sur certaines parties de ce didacticiel [**Playlist Tutoriel Arch Linux**](https://www.youtube.com/watch?v=JE6VwNHLcyk&list=PLuIP_-MWRwtWEX0tyDpZPdwU6zCE1O1cY)

### Conditions

> **Note**
> Le script que vous trouverez plus loin fonctionne quel que soit votre choix de DE / CHARGEUR DE DÉMARRAGE / FS.
> Didacticiel et script destinés à être utilisés avec une Arch pur (incompatible avec Garuda, EndeavourOS, Manjaro…)

Téléchargez l'ISO : [**Arch Linux - Téléchargements**](https://archlinux.org/download/)

## Table des Matières
1. [Script tout-en-un](#script)
2. [Améliorez votre bureau](#elevate)
3. [Montez en Niveau dans Votre Jeu](#gaming)
4. [Optimisation de Précision](#optimization)
5. [Dépannage](#troubleshooting)
6. [Communauté](#community)

## Script de Post-Installation pour Arch Linux <a name="script"/>

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Welcome.png">

L'objectif de ce script est de configurer un système **Arch de base** avec un **ensemble minimal de paquets** adaptés à vos besoins juste après l'utilisation d'archinstall. Ce script est **orienté vers le jeu**.

> [!NOTE]
> **Avant de commencer :**
> Ce script est basé sur un tutoriel qui en décrit toutes les étapes.
> Ce script est destiné à être utilisé sur une installation propre qui vient d'être configurée avec `archinstall`.
> Avant d'exécuter ce script, assurez-vous d'avoir démarré dans un environnement de bureau.
> Il n'est pas adapté aux ordinateurs obsolètes. Assurez-vous que votre matériel répond aux exigences pour les derniers pilotes Nvidia.

```bash
sudo pacman -Sy git
git clone https://github.com/Cardiacman13/Architect.git
cd Architect
./architect.sh
```

### 1. Optimisation de Pacman
Améliorez la fonctionnalité et l'expérience utilisateur de Pacman en effectuant les améliorations suivantes :

- Activation de la sortie colorée.
- Activation des listes détaillées de paquets.
- Activation des téléchargements parallèles.
- Activation du support multilib.

### 2. Ajout d'Alias Utiles
Simplifiez vos tâches en ligne de commande avec ces alias utiles :

- update-arch : Met à jour les applications de votre système avec une seule commande.
- clean-arch : Nettoie votre système en supprimant les paquets inutilisés.
- fix-key : Résout les problèmes liés aux clés, assurant un processus de mise à jour fluide.

### 3. Aide à l'Installation des GPU AMD, NVIDIA ou Intel pour le Jeu
Préparez votre jeu avec la configuration GPU, qui comprend :

- Installation de pilotes.
- Installation de bibliothèques Vulkan.
- Installation de bibliothèques 32 bits.
- Choix entre les pilotes Nvidia standard ou la variante `nvidia-all` :
  - **Nvidia** : C'est le choix recommandé pour la plupart des utilisateurs. Cela implique :
    - Installation des paquets Nvidia.
    - Installation de CUDA.
  - **Nvidia-all** : Pour les utilisateurs avancés qui savent comment le maintenir. Cela implique :
    - Clonage et installation à partir du dépôt `Frogging-Family/nvidia-all`.
    - Installation de CUDA.

### 4. Installation de Certains Paquets de Base
Installez des paquets fondamentaux pour une expérience complète :

- [yay](https://github.com/Jguer/yay) ou [paru](https://github.com/Morganamilo/paru) assistant AUR.
- Polices.
- Utilitaires de bureau.
- Codecs.
- Autres paquets essentiels.

### 5. Améliorations Diverses
Affinez votre système pour une expérience améliorée :

- Augmentation de `vm.max_map_count` pour améliorer la compatibilité avec les jeux Windows. [Arch wiki à propos de vm-max-map-count](https://wiki.archlinux.org/title/gaming#Increase_vm.max_map_count)
- Demande de configuration du support d'impression.
- Demande de configuration Bluetooth.
- Support avancé pour les manettes Xbox, PS4/PS5, 8bitdo
- Proposition de configurer Fish comme shell de ligne de commande.

### 6. Aide à l'Installation de Divers Logiciels
Vous avez la liberté de choisir quels logiciels supplémentaires installer en fonction de vos besoins spécifiques :

- `Discord`
- `Steam`
- `Lutris`
- `Heroic Games Launcher`
- `protonup-qt`
- `Spotify`
- `OBS Studio`
- `LibreOffice`
- `Gimp`
- `Visual Studio Code`
- `Open RGB`



## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/pc.png" width="30" height="30"> **Améliorez Votre Bureau** <a name="elevate"/>

### Installation

> [!IMPORTANT]
> Suivez les étapes avec minutie

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutoriel Arch Linux Partie 1 : Archinstall ](https://www.youtube.com/watch?v=JE6VwNHLcyk)

Pour toutes les étapes suivantes, lorsque vous avez un texte présenté de cette manière, cela indiquera une commande à taper dans votre terminal :
```
echo "Bonjour le monde !"       # Commande d'exemple
```

1. **Configurer le clavier en anglais**
    ```
    loadkeys en
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
   alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
   ```
   
   Redémarrez le terminal.

   ### SUPPORT MATÉRIEL

#### NVIDIA (rester sur X11 au moins jusqu'à la sortie de KDE 6)
Vidéo supplémentaire expliquant comment retrouver l'accès à Wayland depuis GDM :
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Debian et Arch Linux Gnome Wayland avec Nvidia (Debian dans la doc)](https://www.youtube.com/watch?v=DVkWLvwtQ18)

1. **Installer les composants de base :**
    ```
    yay -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader cuda
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
    Cette étape est parfois nécessaire pour certains environnements de bureau ou gestionnaires de fenêtres.
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

4. **Hook mkinitcpio :**
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

5. **Reconstruction de l'initramfs :**
    Comme nous avons déjà installé les pilotes à l'étape 1, donc avant de configurer le hook, nous devons déclencher manuellement la reconstruction de l'initramfs :
    ```
    mkinitcpio -P
    ```

#### AMD (ne pas faire si Nvidia)
Installer les composants de base :
```
yay -S --needed mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader vulkan-mesa-layers lib32-vulkan-mesa-layers
```

#### INTEL (ne pas faire si Nvidia)
Installer les composants de base :
```
yay -S --needed mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader intel-media-driver
```

#### Imprimantes
- Essentiels
    ```
    yay -S ghostscript gsfonts cups cups-filters cups-pdf system-config-printer
    avahi --needed
    sudo systemctl enable --now avahi-daemon cups
    ```
- Pilotes
    ```
    yay -S foomatic-db-engine foomatic-db foomatic-db-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds gutenprint foomatic-db-gutenprint-ppds --needed
    ```
- Imprimantes HP
    ```
    yay -S python-pyqt5 hplip --needed
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
sudo pacman -S --needed pipewire lib32-pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber alsa-utils alsa-firmware alsa-tools
```

### LOGICIEL DE BASE

#### Composants de base
Ici, vous trouverez des codecs, utilitaires, polices, pilotes :
```
yay -S gst-plugins-bad gst-plugins-base gst-plugins-ugly gst-plugin-pipewire gstreamer-vaapi gst-plugins-good gst-libav gstreamer reflector-simple downgrade rebuild-detector mkinitcpio-firmware xdg-desktop-portal-gtk xdg-desktop-portal neofetch power-profiles-daemon lib32-pipewire hunspell hunspell-fr p7zip unrar ttf-liberation noto-fonts noto-fonts-emoji adobe-source-code-pro-fonts otf-font-awesome ttf-droid ntfs-3g fuse2fs exfat-utils fuse2 fuse3 bash-completion man-db man-pages --needed
```

#### Logiciels divers
```
yay -S libreoffice-fresh libreoffice-fresh-fr vlc discord gimp obs-studio gnome-disk-utility visual-studio-code-bin
```

#### Logiciels KDE

Voici divers logiciels pour graphisme, vidéo (édition, support de codec), utilitaires d'interface graphique, etc.
```
yay -S xdg-desktop-portal-kde okular print-manager kdenlive gwenview spectacle partitionmanager ffmpegthumbs qt6-wayland kdeplasma-addons powerdevil kcalc plasma-systemmonitor qt6-multimedia qt6-multimedia-gstreamer qt6-multimedia-ffmpeg kwalletmanager
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
sudo reflector --score 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist
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
    yay -S fish                       # 1. installez fish
    chsh -s /usr/bin/fish             # 2. Définissez-le par défaut.
    fish                              # 3. Lancez fish ou redémarrez et il sera par défaut.
    fish_update_completions           # 4. Mettez à jour les complétions.
    set -U fish_greeting              # 5. Supprimez le message de bienvenue.
    sudo nano ~/.config/fish/config.fish   # 6. Créez un alias comme pour bash au début de ce tutoriel.
    ```
- Ajoutez ensuite les alias suivants entre if et end :
    ```
    alias update-arch='yay -Syu && flatpak update'
    ```
    ```
    alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'
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
sudo pacman -S --needed lutris wine-staging
```

Vidéo supplémentaire :
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Configuration de Lutris pour ordinateur portable Intel/Nvidia](https://www.youtube.com/watch?v=Am3pgTXiUAA)

### Support avancé de manettes

Pilote Linux avancé pour manettes sans fil Xbox 360|One|S|X (fournies avec Xbox One S) et beaucoup d'autres manettes comme 8bitdo ([xpadneo](https://github.com/atar-axis/xpadneo)) ([xone](https://github.com/medusalix/xone))

```
yay -S --needed xpadneo-dkms 
```
Pilote Linux avancé pour manettes PS4/PS5
```
yay -S --needed ds4drv dualsensectl
```

### Affichage des performances en jeu

[MangoHud](https://wiki.archlinux.org/title/MangoHud) est une superposition Vulkan et OpenGL qui permet de surveiller les performances du système dans les applications et d'enregistrer des métriques pour le benchmarking.
C'est l'outil dont vous avez besoin si vous voulez voir vos FPS en jeu, votre charge CPU ou GPU, etc. Ou même enregistrer ces résultats dans un fichier.
Ici, nous installons GOverlay qui est une interface graphique pour configurer MangoHud.

```
yay -S goverlay --needed
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
      vm.max_map_count=16777216
      `


## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/speed.png" width="30" height="30"> **Optimisation de Précision** : <a name="optimization"/>

### [Kernel TKG](https://github.com/Frogging-Family/linux-tkg)

> [!ATTENTION]
> Cette étape est destinée aux utilisateurs avancés :star:

[TKG](https://github.com/Frogging-Family) est une construction de noyau hautement personnalisable qui fournit une sélection de correctifs et d'ajustements pour améliorer les performances de bureau et de jeu.

Vidéo associée :
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Kernel TKG sur Arch + Améliorer ses perfs](https://youtu.be/43yYIWMnDJA)
```
git clone https://github.com/Frogging-Family/linux-tkg.git
cd linux-tkg
makepkg -si
```

### [MESA-TKG](https://github.com/Frogging-Family/mesa-git)

> [!ATTENTION]
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

> [!ATTENTION]
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
flatpak install com.bitwarden.desktop com.discordapp.Discord com.github.tchx84.Flatseal com.gitlab.davem.ClamTk com.heroicgameslauncher.hgl com.microsoft.Edge com. moonlight_stream.Moonlight com.rtosta.zapzap com.spotify.Client com.sweethome3d.Sweethome3d com.tutanota.Tutanota com.valvesoftware.Steam com.visualstudio.code info.febvre. Komikku io.github.anirbandey1.ChatbotClient io.github.koromelodev.mindmate net.davidotek.pupgui2 net.lutris.Lutris one.flipperzero.qFlipper org.bleachbit.BleachBit org. gnome.Boxes org.gnome.OCRFeeder org.kde.gcompris org.kde.kdenlive org.libreoffice.LibreOffice org.videolan.VLC org.yuzu_emu.yuzu us.zoom.Zoom xyz.ketok.Speedtest
```

## Dépannage <a name="troubleshooting"/>
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Partie 3 les problèmes les plus communs.](https://youtu.be/vbOOQsYyPfc?si=wA2W8bOG1gtpfmnZ)

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Partie 4 Maintenance / mise à jour](https://youtu.be/Z7POSK2jnII?si=SNwagGGJXRVkYPdc)
 
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Partie 5 Arch-Chroot](https://youtu.be/iandJSjePiA?si=7uI8JZ-VxAVOsPTh)

- Si vous n'avez pas de son, essayez :
    ```
    yay -S sof-firmware
    ```
- Pour de l'aide, visitez le Discord GLF (fr/en) : [Discord GLF](http://discord.gg/EP3Jm8YMvj)

## Sources <a name="community"/>

Sources et liens utiles :
- [ArchWiki](https://wiki.archlinux.org/)
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Fonctionnement du WIKI d'Arch.](https://www.youtube.com/watch?v=TQ3A9l2N5lI)
- [Site GLF](https://www.gaminglinux.fr/)
- [Discord GLF](http://discord.gg/EP3Jm8YMvj)
- [Ma chaîne Youtube](https://www.youtube.com/@Cardiacman)


## Contribution

Les contributions à ce projet sont les bienvenues ! Si vous avez des suggestions, des rapports de bugs ou des contributions, veuillez ouvrir un problème ou une demande de tirage dans le dépôt.

Comme vous pouvez le voir, ce projet est disponible en français, en anglais et en espagnol. Les traducteurs sont plus que bienvenus ! :people_holding_hands:

<!-- readme: contributors -start -->
<!-- readme: contributors -end -->
