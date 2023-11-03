# TUTORIAL E SCRIPT POST-INSTALLAZIONE DI ARCH LINUX

## Presentazione

<img src="https://github.com/Cardiacman13/Architect/blob/main/assets/images/desktop.png" width="1000" height="250">

Arch è una distribuzione tecnica rivolta a un pubblico più avanzato, composta da "blocchi di costruzione". Pensatela come un set di Lego bianchi, con una base che dovete costruire e modellare come desiderate, e se fate qualcosa di sbagliato, le cose possono rompersi.

Lo scopo di questo tutorial è installare un Arch standard con un minimo di pacchetti, secondo le nostre esigenze per il lavoro d'ufficio e/o il gioco.

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> Questa icona vi reindirizza ai miei video su alcune parti di questo tutorial [**Playlist Tutorial Arch Linux**](https://www.youtube.com/watch?v=JE6VwNHLcyk&list=PLuIP_-MWRwtWEX0tyDpZPdwU6zCE1O1cY)

### Condizioni

> **Nota**
> Lo script che troverete in seguito funziona indipendentemente dalle vostre scelte di DE / BOOT LOADER / FS.
> Tutorial e script mirati all'uso con un Arch puro (incompatibile con Garuda, EndeavourOS, Manjaro…)
> Tuttavia, se sapete cosa state facendo, le modifiche per altre scelte sono minime.

Scarica l'ISO: [**Arch Linux - Download**](https://archlinux.org/download/)

## Indice dei Contenuti
1. [Script Tutto-in-Uno](#script)
2. [Eleva il Tuo Desktop](#elevate)
3. [Porta il Tuo Gioco a un Nuovo Livello](#gaming)
4. [Ottimizzazione di Precisione](#optimization)
5. [Risoluzione dei Problemi](#troubleshooting)
6. [Materiale della Comunità](#community)

## Script Post-Installazione Arch Linux <a name="script"/>

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Welcome.png">

Lo scopo di questo script è configurare un sistema **Arch standard** con un **set minimo di pacchetti** personalizzati per le tue esigenze subito dopo aver utilizzato archinstall. Questo script è **orientato al gaming**.

> [!NOTA]
> **Prima di Iniziare:**
> Questo script si basa su un tutorial che descrive tutti i passaggi: [Tuto-Arch](https://github.com/Cardiacman13/Tuto-Arch/blob/main/lang/README.en.md)
> Questo script è destinato all'uso su un'installazione pulita che è stata appena configurata con `archinstall`.
> Prima di eseguire questo script, assicurati di aver avviato in un Ambiente Desktop.
> Non è adatto a computer datati. Assicurati che il tuo hardware soddisfi i requisiti per gli ultimi driver Nvidia.

```bash
sudo pacman -Sy git
git clone https://github.com/Cardiacman13/Architect.git
cd Architect
./architect.sh
```

### 1. Ottimizzazione di Pacman
Migliora la funzionalità e l'esperienza utente di Pacman apportando i seguenti miglioramenti:

- Abilitazione dell'output colorato.
- Abilitazione elenchi dettagliati dei pacchetti.
- Abilitazione download paralleli.
- Abilitazione supporto multilib.

### 2. Aggiunta di Alias Utili
Semplifica i tuoi compiti in linea di comando con questi utili alias:

- update-arch: Aggiorna le app del tuo sistema con un singolo comando.
- clean-arch: Pulisce il tuo sistema rimuovendo pacchetti inutilizzati.
- fix-key: Risolve problemi relativi alle chiavi, garantendo un processo di aggiornamento fluido.

### 3. Assistenza nell'installazione di GPU AMD, NVIDIA o Intel per il Gaming
Prepara il tuo PC per il gaming con la configurazione GPU, che include:

- Installazione driver.
- Installazione librerie Vulkan.
- Installazione librerie a 32 bit.
- Scelta tra driver Nvidia standard o la variante `nvidia-all

`:
  - **Nvidia**: Questa è la scelta consigliata per la maggior parte degli utenti. Comprende:
    - Installazione dei pacchetti Nvidia.
    - Installazione di CUDA.
  - **Nvidia-all**: Questa è per utenti avanzati che sanno come mantenerla. Comprende:
    - Clonazione e installazione dal repository `Frogging-Family/nvidia-all`.
    - Installazione di CUDA.

### 4. Installa Alcuni Pacchetti Base
Installa pacchetti fondamentali per un'esperienza completa:

- [yay](https://github.com/Jguer/yay) o [paru](https://github.com/Morganamilo/paru) helper AUR.
- Font.
- Utility desktop.
- Codec.
- Altri pacchetti essenziali.

### 5. Miglioramenti Vari
Regola il tuo sistema per un'esperienza migliorata:

- Aumento di `vm.max_map_count` per migliorare la compatibilità con i giochi Windows. [Wiki di Arch su vm-max-map-count](https://wiki.archlinux.org/title/gaming#Increase_vm.max_map_count)
- Richiesta di configurazione del supporto stampa.
- Richiesta di configurazione del Bluetooth.
- Supporto avanzato per controller Xbox, PS4/PS5, 8bitdo
- Proposta di configurare Fish come shell di comando.

### 6. Assistenza nell'installazione di Vari Software
Hai la libertà di scegliere quali software aggiuntivi installare in base alle tue esigenze specifiche:

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

## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/pc.png" width="30" height="30"> **Eleva il Tuo Desktop** <a name="elevate"/>

### Installazione

> [!IMPORTANTE]
> Seguite i passaggi meticolosamente

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutorial Arch Linux Parte 1: Archinstall ](https://www.youtube.com/watch?v=JE6VwNHLcyk)

Per tutti i passaggi seguenti, quando avete un testo presentato in questo modo, indicherà un comando da digitare nel vostro terminale:
```
echo "Ciao mondo!"            # Esempio di comando
```

1. **Imposta la tastiera in inglese**
    ```
    loadkeys en
    ```

2. **Configura il tuo Wi-Fi**
    ```
    iwctl
    ```
    Poi (sostituire YOUR-WIFI-NAME con il nome del vostro wifi)
    ```
    station wlan0 connect YOUR-WIFI-NAME (SSID)
    ```
    Inserire la password del wifi e poi `quit` per uscire da iwctl.

3. **Archinstall**
    ```
    pacman -Syu archinstall      # aggiorna lo script archinstall prima dell'installazione
    archinstall                 # per avviare lo script di aiuto all'installazione di arch linux
    ```
    **/!\ Il menu archinstall può cambiare con gli aggiornamenti dello script /!\\**
    
### Post-installazione
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutorial Arch Linux Parte 2: Post Installazione ](https://youtu.be/FEFhC46BkXo?si=Gi-6BOhqENLoh5Ak)

#### Ottimizzare pacman

1. Questa [modifica](https://wiki.archlinux.org/title/Pacman#Enabling_parallel_downloads) permette la parallelizzazione dei download dei pacchetti. (PS: con kate, quando salvate, potrebbe essere richiesto di inserire una password. Inserite la vostra password root/sudo.)

   ```
   kate /etc/pacman.conf
   ```

   Decommentare (rimuovere il **#** dalle seguenti righe):
   
   ```
   #Opzioni varie
   #UseSyslog
   Color <-
   #NoProgressBar
   #CheckSpace
   VerbosePkgLists <- 
   ParallelDownloads = 5 <-
   ```

2. Installare yay

   [Yay](https://github.com/Jguer/yay) è uno strumento utile per gestire l'installazione e l'aggiornamento del software sui sistemi basati su Arch Linux.
   Yay facilita specialmente l'uso del repository AUR, un repository gestito dalla comunità che espande notevolmente la libreria software disponibile. Questo include la compilazione di questi programmi dal loro codice sorgente, a meno che non sia specificato "-bin" alla fine del loro nome.
   **/!\ Siate cauti /!\ Poiché i pacchetti in AUR sono forniti dalla comunità, non installate nulla a caso!**
   
   ```
   sudo pacman -S --needed git base-devel
   git clone https://aur.archlinux.org/yay-bin.git
   cd yay-bin
   makepkg -si
   ```

   Aggiungendo il supporto per gli aggiornamenti dei pacchetti git. (Normalmente deve essere fatto solo una volta)
   ```
   yay -Y --gendb
   yay -Y --devel --save
   ```

3. Alias per la manutenzione:

  <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutorial Arch Linux Parte 4: Manutenzione ](https://www.youtube.com/watch?v=Z7POSK2jnII)

   Questa modifica permette di digitare semplicemente “update-arch” in un terminale per aggiornare il sistema, “clean-arch” per pulirlo, o “fix-key” in caso di errore con le chiavi gpg.

   ```
   kate ~/.bashrc
   ```
   Aggiungere ciascuna di queste righe alla fine del file:
   ```
   alias update-arch='yay -Syu && flatpak update'
   ```
   ```
   alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'
   ```
   ```
   alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
   ```
   
   Riavviare il terminale.

   ### SUPPORTO HARDWARE

#### NVIDIA (rimani su X11 almeno fino al rilascio di KDE 6)
Video supplementare che spiega come riaccedere a Wayland da GDM:
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Debian e Arch Linux Gnome Wayland con Nvidia (Debian nel documento)](https://www.youtube.com/watch?v=DVkWLvwtQ18)

1. **Installa i componenti principali:**
    ```
    yay -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader cuda
    ```

2. **Abilita nvidia-drm.modeset=1:**

Questa impostazione permette al modulo Nvidia di essere lanciato all'avvio.

   - **Se usi systemd boot**

Nella cartella:

```
/boot/loader/entries/
```

   Ci sono vari file .conf, devi aggiungere nvidia-drm.modeset=1 alla riga “options” di ogni file.
   Esempio: options root=PARTUUID=fb680c54-466d-4708-a1ac-fcc338ed57f1 rw rootfstype=ext4 nvidia-drm.modeset=1

- **Se usi GRUB**

    ```
    kate /etc/default/grub
    ```

    Aggiungi **nvidia-drm.modeset=1** alla riga "grub_cmdline_linux_default="

    Esempio: GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia-drm.modeset=1"

    Poi:

    ```
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    ```
   
3. **Carica i moduli Nvidia come priorità all'avvio di Arch:**
    Questo passaggio è talvolta necessario per certi ambienti desktop o window manager.
    ```
    kate /etc/mkinitcpio.conf
    ```
    Modifica la riga MODULES=() in:
    ```
    MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
    ```
    Se usi btrfs:
    ```
    MODULES=(btrfs nvidia nvidia_modeset nvidia_uvm nvidia_drm)
    ```

4. **Hook mkinitcpio:**
    Questo hook automatizza la ricostruzione di initramfs (il file base di avvio) ad ogni modifica del driver Nvidia.
    ```
    sudo mkdir /etc/pacman.d/hooks/
    kate /etc/pacman.d/hooks/nvidia.hook
    ```
    Aggiungi:
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
    Description=Aggiorna il modulo NVIDIA in initcpio
    Depends=mkinitcpio
    When=PostTransaction
    NeedsTargets
    Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
    ```

5. **Ricostruzione di initramfs:**
    Poiché abbiamo già installato i driver al passaggio 1, quindi prima di configurare l'hook, dobbiamo innescare manualmente la ricostruzione di initramfs:
    ```
    mkinitcpio -P
    ```

#### AMD (non fare se Nvidia)
Installa i componenti principali:
```
yay -S --needed mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader vulkan-mesa-layers lib32-vulkan-mesa-layers
```

#### INTEL (non fare se Nvidia)
Installa i componenti principali:
```
yay -S --needed mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader intel-media-driver
```

#### Stampanti
- Essenziali
    ```
    yay -S ghostscript gsfonts cups cups-filters cups-pdf system-config-printer
    avahi --needed
    sudo systemctl enable --now avahi-daemon cups
    ```
- Driver
    ```
    yay -S foomatic-db-engine foomatic-db foomatic-db-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds gutenprint foomatic-db-gutenprint-ppds --needed
    ```
- Stampanti HP
    ```
    yay -S python-pyqt5 hplip --needed
    ```
- Stampanti Epson
    ```
    yay -S --needed epson-inkjet-printer-escpr epson-inkjet-printer-escpr2 epson-inkjet-printer-201601w epson-inkjet-printer-n10-nx127
    ```

#### Bluetooth
Il secondo comando qui sotto chiede a systemd di avviare immediatamente il servizio bluetooth e di attivarlo ad ogni avvio.
```
yay -S --needed bluez bluez-utils bluez-plugins
sudo systemctl enable --now bluetooth.service
```
#### [PipeWire](https://pipewire.org/) (audio)
Per avere il suono **/!\ Rispondi sì a tutto per sostituire tutto con i nuovi pacchetti. /!\**
```
sudo pacman -S --needed pipewire lib32-pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber alsa-utils alsa-firmware alsa-tools
```

### SOFTWARE DI BASE

#### Componenti Base
Qui troverai codec, utility, font, driver:
```
yay -S gst-plugins-bad gst-plugins-base gst-plugins-ugly gst-plugin-pipewire gstreamer-vaapi gst-plugins-good gst-libav gstreamer reflector-simple downgrade rebuild-detector mkinitcpio-firmware xdg-desktop-portal-gtk xdg-desktop-portal neofetch power-profiles-daemon lib32-pipewire hunspell hunspell-fr p7zip unrar ttf-liberation noto-fonts noto-fonts-emoji adobe-source-code-pro-fonts otf-font-awesome ttf-droid ntfs-3g fuse2fs exfat-utils fuse2 fuse3 bash-completion man-db man-pages --needed
```

#### Software Vari
```
yay -S libreoffice-fresh libreoffice-fresh-fr vlc discord gimp obs-studio gnome-disk-utility visual-studio-code-bin
```

#### Software KDE

Ecco vari software per grafica, video (editing, supporto codec), utilità dell'interfaccia grafica, ecc.
```
yay -S xdg-desktop-portal-kde okular print-manager kdenlive gwenview spectacle partitionmanager ffmpegthumbs qt6-wayland kdeplasma-addons powerdevil kcalc plasma-systemmonitor qt6-multimedia qt6-multimedia-gstreamer qt6-multimedia-ffmpeg kwalletmanager
```

Video Aggiuntivo:
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Personalizzazione di KDE Parte 1 Layout, Tema, Kvantum, migliori pratiche!](https://www.youtube.com/watch?v=vdlj83sb84s&t=1240s)

#### Firewall
La configurazione predefinita potrebbe bloccare l'accesso a stampanti e altri dispositivi nella tua rete locale.
Ecco un piccolo link per aiutarti: https://www.dsfc.net/infra/securite/configurer-firewalld/
```
sudo pacman -S --needed --noconfirm firewalld python-pyqt5 python-capng
sudo systemctl enable --now firewalld.service
firewall-applet &
```

#### Reflector per aggiornamenti automatici dei mirror

```
yay -S reflector-simple
```

Un comando per generare una lista di mirror, da eseguire una volta dopo la prima installazione e da ripetere se viaggi, o cambi paese, o se trovi lento il download dei pacchetti, o se incontri un errore che ti dice che un mirror è offline:

```
sudo reflector --score 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist
```

#### Timeshift

- [Timeshift](https://github.com/linuxmint/timeshift) è un'utilità Linux open source per creare backup di tutto il tuo sistema.

**/!\ ATTENZIONE: di default, viene salvato solo il sistema, non la tua cartella utente (il /home/) ! /!\\**


```
yay -S timeshift
```

- Evita timeshift e btrfs su Arch, ho già avuto dei [problemi](https://github.com/linuxmint/timeshift).

    *“Gli snapshot BTRFS sono supportati solo su sistemi BTRFS con un layout di sottovolumi di tipo Ubuntu”*

- Per beneficiare dei backup automatici, avrai bisogno di avviare cronie. (opzionale) 

  ```
  sudo systemctl enable --now cronie
  ```
  
#### Fish

[Fish](https://fishshell.com/) è una shell a riga di comando progettata per essere interattiva e user-friendly. Vedi anche [ArchWiki](https://wiki.archlinux.org/title/fish) sull'argomento. Sostituisce la shell predefinita, bash.

- Installa fish.
    ```
    yay -S fish                       # 1. installa fish
    chsh -s /usr/bin/fish             # 2. Impostalo come predefinito.
    fish                              # 3. Esegui fish o riavvia e sarà predefinito.
    fish_update_completions           # 4. Aggiorna i completamenti.
    set -U fish_greeting              # 5. Rimuovi il messaggio di benvenuto.
    kate ~/.config/fish/config.fish   # 6. Crea un alias come per bash all'inizio di questo tutorial.
    ```
- Poi aggiungi i seguenti alias tra if e end:
    ```
    alias update-arch='yay -Syu && flatpak update'
    ```
    ```
    alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'
    ```
    ```
    alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate e sudo pacman -Sy --noconfirm archlinux-keyring e sudo pacman --noconfirm -Su'
    ```
- ***Riavvia a meno che non sia stato fatto al punto 3***, gli alias di qualsiasi tipo funzionano solo dopo aver riavviato il terminale.



## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/game-console.png" width="30" height="30"> **Potenzia il Tuo Gaming** <a name="gaming"/>

### Steam
Nota che i driver AMD o Nvidia devono essere installati in anticipo come menzionato nella sezione [SUPPORTO HARDWARE](#HARDWARE-SUPPORT).
```
yay -S steam
```

### Lutris

Lutris è un gestore di giochi FOSS (Free, Open Source) per sistemi operativi basati su Linux.
Lutris consente di cercare un gioco o una piattaforma (Ubisoft Connect, EA Store, GOG, Battlenet, ecc.) e propone uno script di installazione che configurerà ciò che è necessario affinché la tua scelta funzioni con Wine o Proton.

```
sudo pacman -S --needed lutris wine-staging
```

Video aggiuntivo:
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Configurazione di Lutris per laptop Intel/Nvidia](https://www.youtube.com/watch?v=Am3pgTXiUAA)

### Supporto avanzato per controller

Driver Linux avanzato per controller wireless Xbox 360|One|S|X (incluso con Xbox One S) e molti altri controller come 8bitdo ([xpadneo](https://github.com/atar-axis/xpadneo)) ([xone](https://github.com/medusalix/xone))

```
yay -S --needed xpadneo-dkms 
```

Driver Linux avanzato per controller PS4/PS5
```
yay -S --needed bluez-utils-compat ds4drv dualsencectl
```

### Visualizzazione delle prestazioni di gioco

[MangoHud](https://wiki.archlinux.org/title/MangoHud) è un overlay per Vulkan e OpenGL che consente di monitorare le prestazioni del sistema all'interno delle applicazioni e registrare metriche per il benchmarking.
È lo strumento di cui hai bisogno se vuoi vedere i tuoi FPS in gioco, il carico della tua CPU o GPU, ecc. Oppure anche registrare questi risultati in un file.
Qui, installiamo GOverlay che è un'interfaccia grafica per configurare MangoHud.

```
yay -S goverlay --needed
```

### Migliorare la compatibilità dei giochi Windows

Aumentiamo il valore predefinito di questa variabile, permettendo lo stoccaggio di più "aree di mappa della memoria". Il valore predefinito è molto basso. L'obiettivo è migliorare la compatibilità con i giochi Windows tramite Wine o Steam (vedi [ProtonDB](https://www.protondb.com/)), sapendo che alcuni giochi scarsamente ottimizzati tendono a raggiungere rapidamente questo limite, che può causare un crash.

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Gaming LINUX eliminare i crash / aumentare la compatibilità](https://youtu.be/sr4RgshrUYY)

- Aggiungere in:

  ```
  kate /etc/sysctl.d/99-sysctl.conf
  ```
    la linea seguente:
      `
      vm.max_map_count=16777216
      `


## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/speed.png" width="30" height="30"> **Ottimizzazione di Precisione**: <a name="optimization"/>

### [Kernel TKG](https://github.com/Frogging-Family/linux-tkg)

> [!ATTENZIONE]
> Questo passaggio è destinato a utenti avanzati :star:

[TKG](https://github.com/Frogging-Family) è una build di kernel altamente personalizzabile che offre una selezione di correzioni e ottimizzazioni per migliorare le prestazioni desktop e di gioco.

Video correlato:
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Kernel TKG su Arch + Migliorare le sue prestazioni](https://youtu.be/43yYIWMnDJA)
```
git clone https://github.com/Frogging-Family/linux-tkg.git
cd linux-tkg
makepkg -si
```

### [MESA-TKG](https://github.com/Frogging-Family/mesa-git)

> [!ATTENZIONE]
> Questo passaggio è destinato a utenti avanzati :star:

Come il kernel TkG, ma per Mesa, una versione patchata per aggiungere alcune correzioni e ottimizzazioni.
Molto utile per i giocatori AMD, di nessun interesse per i giocatori Nvidia.
```
git clone https://github.com/Frogging-Family/mesa-git.git
cd mesa-git
makepkg -si
```
Dire sì a tutto per sovrascrivere tutto con nuovi pacchetti.

### [NVIDIA-ALL](https://github.com/Frogging-Family/nvidia-all)

> [!ATTENZIONE]
> Questo passaggio è destinato a utenti avanzati :star:

Nvidia-all è un'integrazione del driver nvidia di TkG. Include patch di supporto per nuovi kernel. Ti consente di selezionare la versione del driver che vuoi installare, sia che si tratti dell'ultima versione ufficiale, di una versione beta, della versione Vulkan, ecc.

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Se usi Arch e Nvidia, dai un'occhiata!](https://youtu.be/T0laE8gPtfY)
```
git clone https://github.com/Frogging-Family/nvidia-all.git
cd nvidia-all
makepkg -si
```

Dire sì a tutto per sovrascrivere tutto con nuovi pacchetti.

### Installazione [Flatpak](https://wiki.archlinux.org/title/Flatpak)

In precedenza noto come xdg-app, si tratta di uno strumento di distribuzione software e di gestione dei pacchetti per Linux. È promosso come soluzione che offre un ambiente "sandbox" in cui gli utenti possono eseguire software in isolamento dal resto del sistema.

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [MangoHUD, Goverlay, Steam, Lutris FLATPAK!](https://www.youtube.com/watch?v=1dha2UDSF4M)
```
yay -S flatpak flatpak-kcm
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install com.bitwarden.desktop com.discordapp.Discord com.github.tchx84.Flatseal com.gitlab.davem.ClamTk com.heroicgameslauncher.hgl com.microsoft.Edge com. moonlight_stream.Moonlight com.rtosta.zapzap com.spotify.Client com.sweethome3d.Sweethome3d com.tutanota.Tutanota com.valvesoftware.Steam com.visualstudio.code info.febvre. Komikku io.github.anirbandey1.ChatbotClient io.github.koromelodev.mindmate net.davidotek.pupgui2 net.lutris.Lutris one.flipperzero.qFlipper org.bleachbit.BleachBit org. gnome.Boxes org.gnome.OCRFeeder org.kde.gcompris org.kde.kdenlive org.libreoffice.LibreOffice org.videolan.VLC org.yuzu_emu.yuzu us.zoom.Zoom xyz.ketok.Speedtest
```

## Risoluzione dei problemi <a name="troubleshooting"/>
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Parte 3 i problemi più comuni.](https://youtu.be/vbOOQsYyPfc?si=wA2W8bOG1gtpfmnZ)

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Parte 4 Manutenzione / aggiornamento](https://youtu.be/Z7POSK2jnII?si=SNwagGGJXRVkYPdc)
 
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Parte 5 Arch-Chroot](https://youtu.be/iandJSjePiA?si=7uI8JZ-VxAVOsPTh)

- Se non hai audio, prova:
    ```
    yay -S sof-firmware
    ```

- Per aiuto, visita il Discord di GLF (fr/en): [Discord GLF](http://discord.gg/EP3Jm8YMvj)

## Fonti <a name="community"/>

Fonti e link utili :
- [ArchWiki](https://wiki.archlinux.org/)
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Funzionamento del WIKI di Arch.](https://www.youtube.com/watch?v=TQ3A9l2N5lI)
- [Sito GLF](https://www.gaminglinux.fr/)
- [Discord GLF](http://discord.gg/EP3Jm8YMvj)
- [Il mio canale Youtube](https://www.youtube.com/@Cardiacman)


## Contributo

I contributi a questo progetto sono benvenuti! Se hai suggerimenti, segnalazioni di bug o contributi, si prega di aprire un issue o una pull request nel repository.

Come puoi vedere questo progetto è disponibile in francese, inglese e spagnolo. I traduttori sono più che benvenuti! :people_holding_hands:

<!-- readme: contributori -start -->
<!-- readme: contributori -end -->
