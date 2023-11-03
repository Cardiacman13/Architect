# ARCH LINUX NACHINSTALLATIONS-TUTORIAL UND SKRIPT

## Präsentation

<img src="https://github.com/Cardiacman13/Architect/blob/main/assets/images/desktop.png" width="1000" height="250">

Arch ist eine technische Distribution, die auf ein fortgeschritteneres Publikum abzielt und aus "Bausteinen" besteht. Stell es dir wie ein Set aus blanken Lego-Steinen vor, mit einer Basis, die du nach deinem Wunsch aufbauen und gestalten musst, und wenn du etwas falsch machst, kann es zu Brüchen kommen.

Der Zweck dieses Tutorials ist es, ein Standard-Arch mit einer Mindestanzahl von Paketen zu installieren, entsprechend unseren Bedürfnissen für Büroarbeit und/oder Gaming.

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> Dieses Icon leitet dich zu meinen Videos über bestimmte Teile dieses Tutorials weiter [**Arch Linux Tutorial Playlist**](https://www.youtube.com/watch?v=JE6VwNHLcyk&list=PLuIP_-MWRwtWEX0tyDpZPdwU6zCE1O1cY)

### Bedingungen

> **Hinweis**
> Das später zu findende Skript funktioniert unabhängig von deiner Auswahl an DE / BOOT LOADER / FS.
> Tutorial und Skript sind für die Verwendung mit einem reinen Arch gedacht (inkompatibel mit Garuda, EndeavourOS, Manjaro…)
> Wenn du jedoch weißt, was du tust, sind die Änderungen für andere Optionen minimal.

Lade das ISO herunter: [**Arch Linux - Downloads**](https://archlinux.org/download/)

## Inhaltsverzeichnis
1. [All-in-One-Skript](#script)
2. [Erweitere deinen Desktop](#elevate)
3. [Verbessere dein Gaming](#gaming)
4. [Präzise Optimierung](#optimization)
5. [Fehlerbehebung](#troubleshooting)
6. [Community-Dinge](#community)

## Arch Linux Nachinstallationsskript <a name="script"/>

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Welcome.png">

Der Zweck dieses Skripts ist es, ein **Standard-Arch**-System mit einem **minimalen Paketset** nach der Verwendung von archinstall an Ihre Bedürfnisse anzupassen. Dieses Skript ist **auf Gaming ausgerichtet**.

> [!HINWEIS]
> **Bevor Sie beginnen:**
> Dieses Skript basiert auf einem Tutorial, das alle Schritte beschreibt: [Tuto-Arch](https://github.com/Cardiacman13/Tuto-Arch/blob/main/lang/README.en.md)
> Dieses Skript ist für eine saubere Installation gedacht, die gerade mit `archinstall` eingerichtet wurde.
> Bevor Sie dieses Skript ausführen, stellen Sie sicher, dass Sie in einer Desktop-Umgebung gestartet haben.
> Es ist nicht für veraltete Computer geeignet. Stellen Sie sicher, dass Ihre Hardware den Anforderungen für die neuesten Nvidia-Treiber entspricht.

```bash
sudo pacman -Sy git
git clone https://github.com/Cardiacman13/Architect.git
cd Architect
./architect.sh
```

### 1. Optimierung von Pacman
Verbessern Sie die Funktionalität und Benutzererfahrung von Pacman durch folgende Verbesserungen:

- Aktivieren von farbiger Ausgabe.
- Aktivieren von detaillierten Paketlisten.
- Aktivieren von parallelen Downloads.
- Aktivieren der Multilib-Unterstützung.

### 2. Hinzufügen nützlicher Aliase
Vereinfachen Sie Ihre Befehlszeilenaufgaben mit diesen hilfreichen Aliasen:

- update-arch: Aktualisieren Sie Ihre System-Apps mit einem einzigen Befehl.
- clean-arch: Reinigen Sie Ihr System, indem Sie ungenutzte Pakete entfernen.
- fix-key: Behebt schlüsselbezogene Probleme und gewährleistet einen reibungslosen Aktualisierungsprozess.

### 3. Unterstützung bei der Installation von AMD-, NVIDIA- oder Intel-GPUs für Gaming
Machen Sie Ihr System mit der GPU-Einrichtung spielbereit, dazu gehören:

- Installation von Treibern.
- Installation von Vulkan-Bibliotheken.
- Installation von 32-Bit-Bibliotheken.
- Auswahl zwischen Standard-Nvidia-Treibern oder der Variante `nvidia-all`:
  - **Nvidia**: Dies ist die empfohlene Wahl für die meisten Benutzer. Dazu gehört:
    - Installation von Nvidia-Paketen.
    - Installation von CUDA.
  - **Nvidia-all**: Dies ist für fortgeschrittene Benutzer, die wissen, wie man es pflegt. Dazu gehört:
    - Klonen und Installieren aus dem `Frogging-Family/nvidia-all`-Repository.
    - Installation von CUDA.

### 4. Installation einiger Basispakete
Installieren Sie grundlegende Pakete für ein komplettes Erlebnis:

- [yay](https://github.com/Jguer/yay) oder [paru](https://github.com/Morganamilo/paru) AUR-Helfer.
- Schriftarten.
- Desktop-Utilities.
- Codecs.
- Andere wesentliche Pakete.

### 5. Verschiedene Verbesserungen
Feinabstimmung Ihres Systems für ein verbessertes Erlebnis:

- Erhöhung von `vm.max_map_count`, um die Kompatibilität mit Windows-Spielen zu verbessern. [Arch Wiki über vm-max-map-count](https://wiki.archlinux.org/title/gaming#Increase_vm.max_map_count)
- Anfrage zur Konfiguration des Drucker-Supports.
- Anfrage zur Konfiguration von Bluetooth.
- Erweiterte Unterstützung für Xbox-, PS4/PS5-, 8bitdo-Controller.
- Vorschlag zur Konfiguration von Fish als Befehlszeilenshell.

### 6. Unterstützung bei der Installation verschiedener Software
Sie haben die Freiheit, zusätzliche Software basierend auf Ihren spezifischen Bedürfnissen zu installieren:

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

## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/pc.png" width="30" height="30"> **Erweitere Deinen Desktop** <a name="elevate"/>

### Installation

> [!WICHTIG]
> Befolge die Schritte sorgfältig

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Arch Linux Tutorial Teil 1: Archinstall ](https://www.youtube.com/watch?v=JE6VwNHLcyk)

Bei allen folgenden Schritten wird Text, der so präsentiert wird, einen Befehl anzeigen, den du in deinem Terminal eingeben sollst:
```
echo "Hello world !"            # Beispielbefehl
```

1. **Tastatur auf Englisch einstellen**
    ```
    loadkeys en
    ```

2. **Dein WLAN einrichten**
    ```
    iwctl
    ```
    Danach (ersetze YOUR-WIFI-NAME mit dem Namen deines WLANs)
    ```
    station wlan0 connect YOUR-WIFI-NAME (SSID)
    ```
    Gib dein WLAN-Passwort ein, dann `quit`, um iwctl zu verlassen.

3. **Archinstall**
    ```
    pacman -Syu archinstall      # aktualisiere das Archinstall-Skript vor der Installation
    archinstall                 # um das Installationshilfeskript für Arch Linux zu starten
    ```
    **/!\ Das Archinstall-Menü kann sich mit Updates des Skripts ändern /!\\**
    
### Nachinstallation
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Arch Linux Tutorial Teil 2: Nach der Installation ](https://youtu.be/FEFhC46BkXo?si=Gi-6BOhqENLoh5Ak)

#### Pacman optimieren

1. Diese [Modifikation](https://wiki.archlinux.org/title/Pacman#Enabling_parallel_downloads) ermöglicht die Parallelisierung von Paketdownloads. (PS: Mit Kate wirst du beim Speichern eventuell aufgefordert, ein Passwort einzugeben. Gib dein Root-/Sudo-Passwort ein.)

   ```
   kate /etc/pacman.conf
   ```

   Kommentarzeichen entfernen (das **#** von den folgenden Zeilen entfernen):
   
   ```
   #Verschiedene Optionen
   #UseSyslog
   Color <-
   #NoProgressBar
   #CheckSpace
   VerbosePkgLists <- 
   ParallelDownloads = 5 <-
   ```

2. Yay installieren

   [Yay](https://github.com/Jguer/yay) ist ein praktisches Werkzeug zur Verwaltung der Installation und Aktualisierung von Software auf Arch Linux-basierten Systemen.
   Yay erleichtert insbesondere die Verwendung des AUR-Repositories, eines von der Community verwalteten Repositories, das die verfügbare Softwarebibliothek erheblich erweitert. Dies schließt das Kompilieren dieser Programme aus ihrem Quellcode ein, es sei denn, am Ende ihres Namens steht „-bin“.
   **/!\ Sei vorsichtig /!\ Da die Pakete in AUR von der Community bereitgestellt werden, installiere nicht einfach irgendwas!**
   
   ```
   sudo pacman -S --needed git base-devel
   git clone https://aur.archlinux.org/yay-bin.git
   cd yay-bin
   makepkg -si
   ```

   Unterstützung für Updates von Git-Paketen hinzufügen. (Normalerweise nur einmal erforderlich)
   ```
   yay -Y --gendb
   yay -Y --devel --save
   ```

3. Wartungs-Aliase:

  <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Arch Linux Tutorial Teil 4: Wartung ](https://www.youtube.com/watch?v=Z7POSK2jnII)

   Diese Modifikation ermöglicht es dir, einfach „update-arch“ in einem Terminal einzugeben, um das System zu aktualisieren, „clean-arch“, um es zu reinigen, oder „fix-key“ im Falle eines Fehlers mit den gpg-Schlüsseln.

   ```
   kate ~/.bashrc
   ```
   Füge jede dieser Zeilen am Ende der Datei hinzu:
   ```
   alias update-arch='yay -Syu && flatpak update'
   ```
   ```
   alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'
   ```
   ```
   alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring und sudo pacman --noconfirm -Su'
   ```
   
   Starte das Terminal neu.

   ### HARDWARE-UNTERSTÜTZUNG

#### NVIDIA (bleiben Sie bei X11, zumindest bis zur Veröffentlichung von KDE 6)
Ergänzendes Video, das erklärt, wie man von GDM aus wieder Zugang zu Wayland erhält:
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Debian und Arch Linux Gnome Wayland mit Nvidia (Debian im Dokument)](https://www.youtube.com/watch?v=DVkWLvwtQ18)

1. **Installieren Sie die Kernkomponenten:**
    ```
    yay -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader cuda
    ```

2. **Aktivieren von nvidia-drm.modeset=1:**

Diese Einstellung ermöglicht es dem Nvidia-Modul, beim Start gestartet zu werden.

   - **Bei Verwendung von systemd-boot**

Im Ordner:

```
/boot/loader/entries/
```

   Gibt es mehrere .conf-Dateien, Sie müssen nvidia-drm.modeset=1 zur "options"-Zeile jeder Datei hinzufügen.
   Beispiel: options root=PARTUUID=fb680c54-466d-4708-a1ac-fcc338ed57f1 rw rootfstype=ext4 nvidia-drm.modeset=1

- **Bei Verwendung von GRUB**

    ```
    kate /etc/default/grub
    ```

    Fügen Sie **nvidia-drm.modeset=1** zur Zeile "grub_cmdline_linux_default=" hinzu.

    Beispiel: GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia-drm.modeset=1"

    Dann:

    ```
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    ```
   
3. **Laden Sie Nvidia-Module als Priorität beim Arch-Start:**
    Dieser Schritt ist manchmal notwendig für bestimmte Desktop-Umgebungen oder Fenstermanager.
    ```
    kate /etc/mkinitcpio.conf
    ```
    Ändern Sie die Zeile MODULES=() zu:
    ```
    MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
    ```
    Bei Verwendung von btrfs:
    ```
    MODULES=(btrfs nvidia nvidia_modeset nvidia_uvm nvidia_drm)
    ```

4. **mkinitcpio Hook:**
    Dieser Hook automatisiert den Wiederaufbau von initramfs (der grundlegenden Boot-Datei) bei jeder Änderung des Nvidia-Treibers.
    ```
    sudo mkdir /etc/pacman.d/hooks/
    kate /etc/pacman.d/hooks/nvidia.hook
    ```
    Hinzufügen:
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

5. **Wiederaufbau von initramfs:**
    Da wir bereits in Schritt 1 die Treiber installiert haben, also bevor wir den Hook eingerichtet haben, müssen wir den Wiederaufbau von initramfs manuell auslösen:
    ```
    mkinitcpio -P
    ```

#### AMD (nicht machen, wenn Nvidia)
Installieren Sie die Kernkomponenten:
```
yay -S --needed mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader vulkan-mesa-layers lib32-vulkan-mesa-layers
```

#### INTEL (nicht machen, wenn Nvidia)
Installieren Sie die Kernkomponenten:
```
yay -S --needed mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader intel-media-driver
```

#### Drucker
- Grundlegendes
    ```
    yay -S ghostscript gsfonts cups cups-filters cups-pdf system-config-printer
    avahi --needed
    sudo systemctl enable --now avahi-daemon cups
    ```
- Treiber
    ```
    yay -S foomatic-db-engine foomatic-db foomatic-db-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds gutenprint foomatic-db-gutenprint-ppds --needed
    ```
- HP Drucker
    ```
    yay -S python-pyqt5 hplip --needed
    ```
- Epson Drucker
    ```
    yay -S --needed epson-inkjet-printer-escpr epson-inkjet-printer-escpr2 epson-inkjet-printer-201601w epson-inkjet-printer-n10-nx127
    ```

#### Bluetooth
Der zweite Befehl unten fordert systemd auf, den Bluetooth-Dienst sofort zu starten und ihn bei jedem Start zu aktivieren.
```
yay -S --needed bluez bluez-utils bluez-plugins
sudo systemctl enable --now  bluetooth.service
```
#### [PipeWire](https://pipewire.org/) (Sound)
Um Sound zu haben **/!\ Sagen Sie zu allem Ja, um alles mit den neuen Paketen zu überschreiben. /!\**
```
sudo pacman -S --needed pipewire lib32-pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber alsa-utils alsa-firmware alsa-tools
```

### GRUNDLEGENDE SOFTWARE

#### Basis-Komponenten
Hier finden Sie Codecs, Dienstprogramme, Schriftarten, Treiber:
```
yay -S gst-plugins-bad gst-plugins-base gst-plugins-ugly gst-plugin-pipewire gstreamer-vaapi gst-plugins-good gst-libav gstreamer reflector-simple downgrade rebuild-detector mkinitcpio-firmware xdg-desktop-portal-gtk xdg-desktop-portal neofetch power-profiles-daemon lib32-pipewire hunspell hunspell-fr p7zip unrar ttf-liberation noto-fonts noto-fonts-emoji adobe-source-code-pro-fonts otf-font-awesome ttf-droid ntfs-3g fuse2fs exfat-utils fuse2 fuse3 bash-completion man-db man-pages --needed
```

#### Verschiedene Software
```
yay -S libreoffice-fresh libreoffice-fresh-fr vlc discord gimp obs-studio gnome-disk-utility visual-studio-code-bin
```

#### KDE Software

Hier finden Sie verschiedene Software für Grafik, Video (Bearbeitung, Codec-Unterstützung), grafische Schnittstellendienstprogramme usw.
```
yay -S xdg-desktop-portal-kde okular print-manager kdenlive gwenview spectacle partitionmanager ffmpegthumbs qt6-wayland kdeplasma-addons powerdevil kcalc plasma-systemmonitor qt6-multimedia qt6-multimedia-gstreamer qt6-multimedia-ffmpeg kwalletmanager
```

Zusätzliches Video:
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [KDE anpassen Teil 1 Layout, Thema, Kvantum, beste Praktiken!](https://www.youtube.com/watch?v=vdlj83sb84s&t=1240s)

#### Firewall
Die Standardkonfiguration kann den Zugang zu Druckern und anderen Geräten in Ihrem lokalen Netzwerk blockieren.
Hier ist ein kleiner Link zur Hilfe: https://www.dsfc.net/infra/securite/configurer-firewalld/
```
sudo pacman -S --needed --noconfirm firewalld python-pyqt5 python-capng
sudo systemctl enable --now firewalld.service
firewall-applet &
```

#### Reflector für automatische Spiegelaktualisierungen

```
yay -S reflector-simple
```

Ein Befehl zur Generierung einer Liste von Spiegeln, einmal nach der ersten Installation und wiederholt bei Reisen, Länderwechseln, zu langsamen Paket-Downloads oder bei einer Meldung, dass ein Spiegel nicht erreichbar ist:

```
sudo reflector --score 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist
```

#### Timeshift

- [Timeshift](https://github.com/linuxmint/timeshift) ist ein Open-Source-Linux-Dienstprogramm zur Erstellung von Backups Ihres gesamten Systems.

**/!\ ACHTUNG: Standardmäßig wird nur das System gesichert, nicht Ihr Benutzerverzeichnis (das /home/)! /!\\**


```
yay -S timeshift
```

- Vermeiden Sie Timeshift und btrfs auf Arch, ich hatte bereits [Probleme](https://github.com/linuxmint/timeshift).

    *“BTRFS-Snapshots werden nur auf BTRFS-Systemen mit einem Ubuntu-Typ-Subvolumen-Layout unterstützt”*

- Für automatische Backups benötigen Sie cronie. (optional) 

  ```
  sudo systemctl enable --now cronie
  ```
  
#### Fish

[Fish](https://fishshell.com/) ist eine Kommandozeilenschale, die interaktiv und benutzerfreundlich konzipiert ist. Siehe auch [ArchWiki](https://wiki.archlinux.org/title/fish) zum Thema. Es ersetzt die Standard-Shell, bash.

- Fish installieren.
    ```
    yay -S fish                       # 1. Fish installieren
    chsh -s /usr/bin/fish             # 2. Als Standard festlegen.
    fish                              # 3. Fish starten oder neu starten, und es wird standardmäßig.
    fish_update_completions           # 4. Komplettierungen aktualisieren.
    set -U fish_greeting              # 5. Willkommensnachricht entfernen.
    kate ~/.config/fish/config.fish   # 6. Ein Alias wie zu Beginn dieses Tutorials für bash erstellen.
    ```
- Dann fügen Sie die folgenden Aliase zwischen if und end ein:
    ```
    alias update-arch='yay -Syu && flatpak update'
    ```
    ```
    alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'
    ```
    ```
    alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
    ```
- ***Neustart, es sei denn, es wurde in Schritt 3 erledigt***, Aliase jeglicher Art funktionieren erst nach dem Neustarten des Terminals.

## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/game-console.png" width="30" height="30"> **Verbessere dein Gaming** <a name="gaming"/>

### Steam
Beachte, dass AMD- oder Nvidia-Treiber vorher installiert sein müssen, wie im Abschnitt [HARDWARE-UNTERSTÜTZUNG](#HARDWARE-SUPPORT) erwähnt.
```
yay -S steam
```

### Lutris

Lutris ist ein FOSS (Freie, Open Source) Spielmanager für auf Linux basierende Betriebssysteme.
Lutris ermöglicht es, nach einem Spiel oder einer Plattform (Ubisoft Connect, EA Store, GOG, Battlenet usw.) zu suchen und schlägt ein Installationsskript vor, das konfiguriert, was für deine Wahl benötigt wird, um mit Wine oder Proton zu arbeiten.

```
sudo pacman -S --needed lutris wine-staging
```

Zusätzliches Video:
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Lutris auf Intel/Nvidia Laptop einrichten](https://www.youtube.com/watch?v=Am3pgTXiUAA)

### Fortgeschrittene Controller-Unterstützung

Fortgeschrittener Linux-Treiber für Xbox 360|One|S|X kabellose Controller (geliefert mit Xbox One S) und viele andere Controller wie 8bitdo ([xpadneo](https://github.com/atar-axis/xpadneo)) ([xone](https://github.com/medusalix/xone))


```
yay -S --needed xpadneo-dkms 
```
Fortgeschrittener Linux-Treiber für PS4/PS5-Controller
```
yay -S --needed ds4drv dualsensectl
```

### Anzeige der In-Game-Leistung

[MangoHud](https://wiki.archlinux.org/title/MangoHud) ist ein Vulkan- und OpenGL-Overlay, das das Monitoring der Systemleistung innerhalb von Anwendungen ermöglicht und Metriken für Benchmarking aufzeichnet.
Es ist das Werkzeug, das du benötigst, wenn du deine In-Game-FPS, deine CPU- oder GPU-Auslastung usw. sehen möchtest. Oder sogar diese Ergebnisse in einer Datei aufzeichnen möchtest.
Hier installieren wir GOverlay, das eine grafische Oberfläche ist, um MangoHud zu konfigurieren.

```
yay -S goverlay --needed
```

### Verbesserung der Kompatibilität von Windows-Spielen

Wir erhöhen den Standardwert dieser Variablen, um die Speicherung von mehr "Speicherzuordnungsbereichen" zu ermöglichen. Der Standardwert ist sehr niedrig. Das Ziel ist, die Kompatibilität mit Windows-Spielen über Wine oder Steam zu verbessern (siehe [ProtonDB](https://www.protondb.com/)), da einige schlecht optimierte Spiele dazu neigen, dieses Limit schnell zu erreichen, was zu einem Absturz führen kann.

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Gaming LINUX - Crashs entfernen / Kompatibilität erhöhen](https://youtu.be/sr4RgshrUYY)

- Füge in :

  ```
  kate /etc/sysctl.d/99-sysctl.conf
  ``` 
    die folgende Zeile hinzu:
      ` 
      vm.max_map_count=16777216
      `


## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/speed.png" width="30" height="30"> **Präzisionsoptimierung**: <a name="optimization"/>

### [Kernel TKG](https://github.com/Frogging-Family/linux-tkg)

> [!WARNUNG]
> Dieser Schritt ist für fortgeschrittene Nutzer gedacht :star:

[TKG](https://github.com/Frogging-Family) ist ein hochgradig anpassbarer Kernel-Build, der eine Auswahl an Fixes und Tweaks bietet, um die Desktop- und Gaming-Leistung zu verbessern.

Zugehöriges Video:
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Kernel TKG auf Arch + Leistung steigern](https://youtu.be/43yYIWMnDJA)
```
git clone https://github.com/Frogging-Family/linux-tkg.git
cd linux-tkg
makepkg -si
```

### [MESA-TKG](https://github.com/Frogging-Family/mesa-git)

> [!WARNUNG]
> Dieser Schritt ist für fortgeschrittene Nutzer gedacht :star:

Ähnlich wie der TKG-Kernel, aber für Mesa, eine gepatchte Version, um einige Fixes und Optimierungen hinzuzufügen.
Sehr nützlich für AMD-Spieler, für Nvidia-Spieler uninteressant.
```
git clone https://github.com/Frogging-Family/mesa-git.git
cd mesa-git
makepkg -si
```
Sage ja zu allem, um alles mit neuen Paketen zu überschreiben.

### [NVIDIA-ALL](https://github.com/Frogging-Family/nvidia-all)

> [!WARNUNG]
> Dieser Schritt ist für fortgeschrittene Nutzer gedacht :star:

Nvidia-all ist eine Integration des Nvidia-Treibers von TKG. Sie enthält Support-Patches für neue Kernel. Sie ermöglicht es dir, die zu installierende Treiberversion auszuwählen, egal ob es sich um die neueste offizielle Version, eine Beta-Version, die Vulkan-Version usw. handelt.

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Du verwendest Arch und Nvidia, sieh dir das an!](https://youtu.be/T0laE8gPtfY)
```
git clone https://github.com/Frogging-Family/nvidia-all.git
cd nvidia-all
makepkg -si
```

Sage ja zu allem, um alles mit neuen Paketen zu überschreiben.

### Installation [Flatpak](https://wiki.archlinux.org/title/Flatpak)

Ehemals als xdg-app bekannt, ist dies ein Software-Bereitstellungs- und Paketverwaltungsdienstprogramm für Linux. Es wird als Möglichkeit beworben, eine "Sandbox"-Umgebung anzubieten, in der Benutzer Software isoliert vom Rest des Systems ausführen können.

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [MangoHUD, Goverlay, Steam, Lutris FLATPAK!](https://www.youtube.com/watch?v=1dha2UDSF4M)
```
yay -S flatpak flatpak-kcm
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install com.bitwarden.desktop com.discordapp.Discord com.github.tchx84.Flatseal com.gitlab.davem.ClamTk com.heroicgameslauncher.hgl com.microsoft.Edge com.moonlight_stream.Moonlight com.rtosta.zapzap com.spotify.Client com.sweethome3d.Sweethome3d com.tutanota.Tutanota com.valvesoftware.Steam com.visualstudio.code info.febvre.Komikku io.github.anirbandey1.ChatbotClient io.github.koromelodev.mindmate net.davidotek.pupgui2 net.lutris.Lutris one.flipperzero.qFlipper org.bleachbit.BleachBit org.gnome.Boxes org.gnome.OCRFeeder org.kde.gcompris org.kde.kdenlive org.libreoffice.LibreOffice org.videolan.VLC org.yuzu_emu.yuzu us.zoom.Zoom xyz.ketok.Speedtest
```

## Fehlerbehebung <a name="troubleshooting"/>
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Teil 3 - die häufigsten Probleme.](https://youtu.be/vbOOQsYyPfc?si=wA2W8bOG1gtpfmnZ)

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Teil 4 - Wartung / Aktualisierung](https://youtu.be/Z7POSK2jnII?si=SNwagGGJXRVkYPdc)

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Teil 5 - Arch-Chroot](https://youtu.be/iandJSjePiA?si=7uI8JZ-VxAVOsPTh)

- Wenn Sie keinen Ton haben, versuchen Sie:
    ```
    yay -S sof-firmware
    ```

- Für Hilfe besuchen Sie das GLF Discord (fr/en): [Discord GLF](http://discord.gg/EP3Jm8YMvj)

## Quellen <a name="community"/>

Quellen und nützliche Links:
- [ArchWiki](https://wiki.archlinux.org/)
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Funktionsweise des Arch-WIKIs.](https://www.youtube.com/watch?v=TQ3A9l2N5lI)
- [GLF-Website](https://www.gaminglinux.fr/)
- [GLF-Discord](http://discord.gg/EP3Jm8YMvj)
- [Mein YouTube-Kanal](https://www.youtube.com/@Cardiacman)

## Beitrag

Beiträge zu diesem Projekt sind willkommen! Wenn Sie Vorschläge, Fehlermeldungen oder Beiträge haben, eröffnen Sie bitte ein Issue oder einen Pull Request im Repository.

Wie Sie sehen, ist dieses Projekt auf Französisch, Englisch und Spanisch verfügbar. Übersetzer sind mehr als willkommen! :people_holding_hands:

<!-- readme: Mitwirkende -start -->
<!-- readme: Mitwirkende -ende -->
