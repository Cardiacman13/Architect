# 🐧 SCRIPT E TUTORIAL ARCHITECT 📜


<img src="https://github.com/Cardiacman13/Architect/blob/main/assets/images/desktop.png" width="1000" height="250">

## Indice dei Contenuti
1. [Script tutto-in-uno](#script)
2. [Tutorial](#elevate)
3. [Gaming](#gaming)
4. [Ottimizzazione](#ottimizzazione)
5. [Risoluzione dei Problemi](#risoluzione-dei-problemi)
6. [Contenuti della Comunità](#comunità)

## 🚀 Script Post-Installazione di Arch Linux <a name="script"/>

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Welcome.png">

Questo script è perfetto per configurare un sistema **Arch stock** con un **set minimo di pacchetti** su misura per le tue esigenze subito dopo l'uso di `archinstall`. In particolare, è **orientato al gaming**.

>[!Attenzione]
> 
> È specificatamente progettato per una pura esperienza Arch Linux (non testato su *Garuda*, *Manjaro*, ecc.).
> 
> Effettuiamo tutti i nostri test basandoci su una nuova installazione di Arch Linux con [`archinstall`](https://github.com/archlinux/archinstall).
> 
> Assicurati di non eseguire come root e di trovarti in un "Ambiente Desktop" (GNOME, KDE Plasma, i3wm, ecc.).
>
> Non è adatto a computer datati. Assicuratevi che il vostro hardware soddisfi i requisiti per gli ultimi driver Nvidia.

Esegui il seguente comando nel terminale per eseguire lo script (**richiede l'accesso sudo**):

```bash
sudo pacman -Sy git base-devel && git clone https://github.com/Cardiacman13/Architect.git ~/Architect && cd ~/Architect && ./architect.sh
```

## 📝 Caratteristiche Principali

### 1. 🚀 Configurare il Gestore di Pacchetti
Potenzia la funzionalità di Pacman:
- 🎨 Abilitare l'output colorato.
- 📝 Liste dettagliate dei pacchetti.
- ⚡ Download paralleli.
- 🔗 Supporto Multilib.

### 2. ⌨️ Aggiungere Alias Utili
Facilita i tuoi compiti da linea di comando:
- `update-arch`: Aggiorna tutte le app del tuo sistema in un solo comando.
- `clean-arch`: Rimuove i pacchetti inutilizzati.
- `fix-key`: Risolve problemi legati alle chiavi per gli aggiornamenti.
- `update-mirrors`: Aggiorna la lista dei mirror del tuo sistema.

### 3. 🎮 Configurazione GPU per il Gaming (AMD, NVIDIA, Intel)
Prepara il tuo sistema per il gaming con:
- 🎮 Proton-GE (tramite il repo [`GloriousEggroll/proton-ge-custom`](https://github.com/GloriousEggroll/proton-ge-custom)).
- 🎮 Scelte dei driver GPU:
  - 📹 Supporto AMD e libreria a 32-bit.
  - 📹 Supporto Intel e libreria a 32-bit.
  - 🔄 Scelte NVIDIA:
    - **Nvidia**: Driver standard **consigliati per la maggior parte**.
    - **Nvidia-all**: Per utenti avanzati (tramite il repo [`Frogging-Family/nvidia-all`](https://github.com/Frogging-Family/nvidia-all)).

### 4. 🖥️ Ambiente Desktop
Scegli il tuo DE:
- 🖥️ `GNOME`.
- 🖥️ `KDE Plasma`.
- 🖥️ `XFCE`.
- 🖥️ `i3wm` ([configurazione personalizzata](https://github.com/wmemcpy/i3-config) in arrivo... 😏).

### 5. 📦 Installare Pacchetti Base
Pacchetti essenziali per

 un'esperienza completa:
- 📦 Aiutanti AUR: [`yay`](https://github.com/Jguer/yay) o [`paru`](https://github.com/Morganamilo/paru).
- 🖋️ Font, Emoji.
- 🎬 Codec.
- ➕ Altri pacchetti cruciali.

### 6. 🛠️ Miglioramenti Vari
Ottimizza il tuo sistema:
- 🎲 Aumenta `vm.max_map_count` per una migliore compatibilità con i giochi Windows. [Wiki di Arch su vm-max-map-count](https://wiki.archlinux.org/title/gaming#Increase_vm.max_map_count)
- 🖨️ Opzioni per il supporto alle stampanti.
- 🎵 Configurazione Bluetooth.
- 🎮 Supporto migliorato per i controller Xbox, PS4/PS5, 8bitdo.
- 🐟 Suggerimento per la configurazione della shell Fish. (zsh in lavorazione)

### 7. 🔄 Chiedere di Installare Software Aggiuntivo
Seleziona software aggiuntivo in base alle tue esigenze:

| Nome                    | Pacchetto                               | Tipo    |
|-------------------------|-----------------------------------------|---------|
| Discord                 | discord                                 | pacchetto |
| Steam                   | steam proton-ge-custom-bin              | pacchetto |
| Lutris                  | lutris wine-staging                     | pacchetto |
| Heroic Games Launcher   | heroic-games-launcher-bin               | pacchetto |
| protonup-qt             | protonup-qt-bin                         | pacchetto |
| Spotify                 | spotify                                 | pacchetto |
| OBS Studio              | com.obsproject.Studio                   | flatpak |
| Kdenlive                | kdenlive                                | pacchetto |
| LibreOffice             | libreoffice-fresh libreoffice-fresh-fr  | pacchetto |
| Gimp                    | gimp                                    | pacchetto |
| VLC                     | vlc                                     | pacchetto |
| Visual Studio Code      | visual-studio-code-bin                  | pacchetto |
| Open RGB                | openrgb-bin                             | pacchetto |


## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/pc.png" width="30" height="30"> **Eleva il Tuo Desktop** <a name="elevate"/>

### Installazione

> [!IMPORTANTE]
> Seguite i passaggi meticolosamente

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutorial Arch Linux Parte 1: Archinstall ](https://www.youtube.com/watch?v=JE6VwNHLcyk)

Per tutti i passaggi seguenti, quando avete un testo presentato in questo modo, questo indicherà un comando da digitare nel vostro terminale:

```
echo "Ciao mondo!"            # Esempio di comando
```

#### 1. Impostate la tastiera in inglese

```
loadkeys it
```

#### 2. Configurate il vostro Wi-Fi

```
iwctl
```
    
Poi (sostituire YOUR-WIFI-NAME con il nome del vostro wifi)

```
station wlan0 connect YOUR-WIFI-NAME (SSID)
```

Inserirete la password del wifi e poi `quit` per uscire da iwctl.

#### 3. Archinstall

```
pacman -Syu archinstall      # aggiornate lo script archinstall prima dell'installazione
archinstall                 # per avviate lo script di aiuto all'installazione di arch linux
```

**/!\ Il menu archinstall può cambiare con gli aggiornamenti dello script /!\\**
    
### Post-installazione

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutorial Arch Linux Parte 2: Post Installazione ](https://youtu.be/FEFhC46BkXo?si=Gi-6BOhqENLoh5Ak)

#### 1. Ottimizzare pacman  

Questa [modifica](https://wiki.archlinux.org/title/Pacman#Enabling_parallel_downloads) permette la parallelizzazione dei download dei pacchetti.

```
sudo nano /etc/pacman.conf
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

### 2. Installare AUR helper

Gli AUR helpers sono strumenti utili per gestire l'installazione e l'aggiornamento del software sui sistemi basati su Arch Linux. Yay e paru facilitano particolarmente l'utilizzo del repository AUR, un repository gestito dalla comunità che amplia notevolmente la libreria di software disponibile. Questo include la compilazione di questi programmi dalla loro fonte, a meno che non venga specificato '-bin' alla fine del loro nome.

**/!\ Siate prudenti /!\ Poiché i pacchetti nell'AUR sono forniti dalla comunità, non installate qualsiasi cosa!**

**Potete scegliere tra **YAY** o **Paru****.

[Yay](https://github.com/Jguer/yay) 
   
```
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```

Aggiunta del supporto per gli aggiornamenti dei pacchetti git. (Normalmente deve essere fatto solo una volta)

```
yay -Y --gendb
yay -Y --devel --save
```

[Paru](https://github.com/Morganamilo/paru)
   
```
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
```

Aggiunta del supporto per gli aggiornamenti dei pacchetti git. (Normalmente deve essere fatto solo una volta)

```
paru --gendb
```

### 3. Alias per la manutenzione:

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutorial Arch Linux Parte 4: Manutenzione ](https://www.youtube.com/watch?v=Z7POSK2jnII)

Questa modifica permette di digitare semplicemente “update-arch” in un terminale per aggiornare il sistema, “clean-arch” per pulirlo, o “fix-key” in caso di errore con le chiavi gpg.

```
sudo nano ~/.bashrc
```

Aggiungere ciascuna di queste righe alla fine del file:

Per yay:

```
alias update-arch='yay -Syu && flatpak update'
```

```
alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'
```


Per Paru:

```
alias update-arch='paru -Syu && flatpak update'
```

```
alias clean-arch='paru -Sc && paru -c && flatpak remove --unused'
```

Per tutti: 

```
alias update-mirrors='sudo reflector --verbose --score 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist'
```

```
alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
```
   
Riavviare il terminale.

#### 4. Compilazione multithread dei pacchetti AUR:

```
nano /etc/makepkg.conf
```

Per utilizzare tutti i thread, aggiungere:

```
MAKEFLAGS="-j$(nproc)"
```

Oppure, se ad esempio si desidera utilizzare 6 thread:

```
MAKEFLAGS="-j6"
```

Sostituire il 6 con il numero di thread che si desidera utilizzare. Si consiglia di avere 2 GB di RAM per ogni core utilizzato.

### SUPPORTO HARDWARE

#### NVIDIA (rimanetr su X11 almeno fino al rilascio di KDE 6)

Video supplementare che spiega come riaccedere a Wayland da GDM:

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Debian e Arch Linux Gnome Wayland con Nvidia (Debian nel documento)](https://www.youtube.com/watch?v=DVkWLvwtQ18)

#### 1. Installate i componenti principali:

```
yay -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
```

#### 2. Abilitate nvidia-drm.modeset=1:

Questa impostazione permette al modulo Nvidia di essere lanciato all'avvio.

- **Se usate systemd boot**

Nella cartella:

```
/boot/loader/entries/
```

Ci sono vari file .conf, dovete aggiungere nvidia-drm.modeset=1 alla riga “options” di ogni file.
Esempio: options root=PARTUUID=fb680c54-466d-4708-a1ac-fcc338ed57f1 rw rootfstype=ext4 nvidia-drm.modeset=1

- **Se usate GRUB**

```
sudo nano /etc/default/grub
```

Aggiungete **nvidia-drm.modeset=1** alla riga "grub_cmdline_linux_default="

Esempio: GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia-drm.modeset=1"

Poi:

```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
   
#### 3. Caricate i moduli Nvidia in priorità all'avvio di Arch:

**Opzionale**, da fare solo se si notano problemi durante l'avvio.
   

```
sudo nano /etc/mkinitcpio.conf
```

Modifica la riga MODULES=() in:

```
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```
Se usate btrfs:
```
MODULES=(btrfs nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```

#### 4. Hook mkinitcpio:

Questo hook automatizza la ricostruzione di initramfs (il file base di avvio) ad ogni modifica del driver Nvidia.
    
```
sudo mkdir /etc/pacman.d/hooks/
sudo nano /etc/pacman.d/hooks/nvidia.hook
```
    
Aggiungete:
    
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


#### 5. Ricostruzione di initramfs:

Poiché abbiamo già installato i driver al passaggio 1, prima di configurare l'hook, dobbiamo innescare manualmente la ricostruzione di initramfs:
    
```
sudo mkinitcpio -P
```

#### AMD (non fare se Nvidia)

Installatr i componenti principali:

```
yay -S --needed mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader vulkan-mesa-layers lib32-vulkan-mesa-layers
```

#### INTEL (non fare se Nvidia)

Installate i componenti principali:

```
yay -S --needed mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader intel-media-driver
```

#### Stampanti
- Essenziali
    
```
yay -S --needed ghostscript gsfonts cups cups-filters cups-pdf system-config-printer avahi
sudo systemctl enable --now avahi-daemon cups
```

- Driver
    
```
yay -S --needed foomatic-db-engine foomatic-db foomatic-db-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds gutenprint foomatic-db-gutenprint-ppds
```

- Stampanti HP

```
yay -S --needed python-pyqt5 hplip
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

**/!\ Rispondete sì a tutto per sostituire tutto con i nuovi pacchetti. /!\**

```
sudo pacman -S --needed pipewire lib32-pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber alsa-utils alsa-firmware alsa-tools sof-firmware
```

### SOFTWARE DI BASE

#### Componenti Base

Qui troverete codec, utility, font, driver:

```
yay -S --needed gst-plugins-bad gst-plugins-base gst-plugins-ugly gst-plugin-pipewire gstreamer-vaapi gst-plugins-good gst-libav gstreamer downgrade rebuild-detector mkinitcpio-firmware xdg-desktop-portal-gtk xdg-desktop-portal neofetch power-profiles-daemon lib32-pipewire hunspell hunspell-fr p7zip unrar ttf-liberation noto-fonts noto-fonts-emoji adobe-source-code-pro-fonts otf-font-awesome ttf-droid ntfs-3g fuse2fs exfat-utils fuse2 fuse3 bash-completion man-db man-pages
```

#### Software Vari

```
yay -S libreoffice-fresh libreoffice-fresh-fr vlc discord gimp obs-studio gnome-disk-utility visual-studio-code-bin
```

#### Software KDE

Ecco vari software per grafica, video (editing, supporto di codec), utilità dell'interfaccia grafica, ecc.

```
yay -S --needed xdg-desktop-portal-kde okular print-manager kdenlive gwenview spectacle partitionmanager ffmpegthumbs qt6-wayland kdeplasma-addons powerdevil kcalc plasma-systemmonitor qt6-multimedia qt6-multimedia-gstreamer qt6-multimedia-ffmpeg kwalletmanager
```

Video Aggiuntivo:

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Personalizzazione di KDE Parte 1 Layout, Tema, Kvantum, migliori pratiche!](https://www.youtube.com/watch?v=vdlj83sb84s&t=1240s)

#### Firewall

La configurazione predefinita potrebbe bloccare l'accesso a stampanti e altri dispositivi nella vostra rete locale.

Ecco un piccolo link per aiutarvi: https://www.dsfc.net/infra/securite/configurer-firewalld/

```
sudo pacman -S --needed --noconfirm firewalld python-pyqt5 python-capng
sudo systemctl enable --now firewalld.service
firewall-applet &
```

#### Reflector per aggiornamenti automatici dei mirror

```
yay -S reflector-simple
```

Un comando per generare una lista di mirror, da eseguire una volta dopo la prima installazione e da ripetere se viaggiate, se cambiate paese, se trovate lento il download dei pacchetti o se trovate un errore che vi dice che un mirror è offline:

```
sudo reflector --verbose --score 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist
```

#### Timeshift

- [Timeshift](https://github.com/linuxmint/timeshift) è un'utilità Linux open source per creare backup di tutto il tuo sistema.

**/!\ ATTENZIONE: di default, viene salvato solo il sistema, non la vostra cartella utente (il /home/) ! /!\\**


```
yay -S timeshift
```

- Evitate timeshift e btrfs su Arch, ho già avuto dei [problemi](https://github.com/linuxmint/timeshift).

*“Gli snapshot BTRFS sono supportati solo su sistemi BTRFS con un layout di sottovolumi di tipo Ubuntu”*

- Per beneficiare dei backup automatici, avrete bisogno di avviare cronie. (opzionale) 

```
sudo systemctl enable --now cronie
```
  
#### Fish

[Fish](https://fishshell.com/) è una shell a riga di comando progettata per essere interattiva e user-friendly. Vedi anche [ArchWiki](https://wiki.archlinux.org/title/fish) sull'argomento. Sostituisce la shell predefinita, bash.

- Installate fish.

```
yay -S fish                             # 1. installa fish
chsh -s /usr/bin/fish                   # 2. Impostatelo come predefinito.
fish                                    # 3. Eseguite fish o riavviate e sarà predefinito.
fish_update_completions                 # 4. Aggiornate i completamenti.
set -U fish_greeting                    # 5. Rimuovete il messaggio di benvenuto.
sudo nano ~/.config/fish/config.fish    # 6. Crea un alias come per bash all'inizio di questo tutorial.
```

- Poi aggiungete i seguenti alias tra if e end:

Per yay:

```
alias update-arch='yay -Syu && flatpak update'
```

```
alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'
```

Per Paru:

```
alias update-arch='paru -Syu && flatpak update'
```

```
alias clean-arch='paru -Sc && paru -c && flatpak remove --unused'
```

Per tutti: 

```
alias update-mirrors='sudo reflector --verbose --score 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist'
```

```
alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
```

***Riavviate a meno che non sia stato fatto al punto 3***, gli alias di qualsiasi tipo funzionano solo dopo aver riavviato il terminale.

## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/game-console.png" width="30" height="30"> **Potenzia il Tuo Gaming** <a name="gaming"/>

### Steam

Nota che i driver AMD o Nvidia devono essere installati in anticipo come menzionato nella sezione [SUPPORTO HARDWARE](#HARDWARE-SUPPORT).

```
yay -S steam
```

### Lutris

Lutris è un gestore di giochi FOSS (Free, Open Source) per sistemi operativi basati su Linux.
Lutris consente di cercare un gioco o una piattaforma (Ubisoft Connect, EA Store, GOG, Battlenet, ecc.) e propone uno script di installazione che configurerà ciò che è necessario affinché la vostra scelta funzioni con Wine o Proton.

```
sudo pacman -S lutris wine-staging
```

Video aggiuntivo:

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Configurazione di Lutris per laptop Intel/Nvidia](https://www.youtube.com/watch?v=Am3pgTXiUAA)

### Supporto avanzato per controller

Driver Linux avanzato per controller wireless Xbox 360|One|S|X (incluso con Xbox One S) e molti altri controller come 8bitdo ([xpadneo](https://github.com/atar-axis/xpadneo)) ([xone](https://github.com/medusalix/xone))

```
yay -S xpadneo-dkms 
```

Driver Linux avanzato per controller PS4/PS5

```
yay -S ds4drv dualsensectl
```

### Visualizzazione delle prestazioni di gioco

[MangoHud](https://wiki.archlinux.org/title/MangoHud) è un overlay per Vulkan e OpenGL che consente di monitorare le prestazioni del sistema all'interno delle applicazioni e registrare metriche per il benchmarking.
È lo strumento di cui avete bisogno se volete vedere i vostri FPS in gioco, il carico della vostra CPU o GPU, ecc. Oppure anche registrare questi risultati in un file.
Qui, installiamo GOverlay che è un'interfaccia grafica per configurare MangoHud.

```
yay -S goverlay
```

### Migliorare la compatibilità dei giochi Windows

Aumentiamo il valore predefinito di questa variabile, permettendo lo stoccaggio di più "aree di mappa della memoria". Il valore predefinito è molto basso. L'obiettivo è migliorare la compatibilità con i giochi Windows tramite Wine o Steam (vedi [ProtonDB](https://www.protondb.com/)), sapendo che alcuni giochi scarsamente ottimizzati tendono a raggiungere rapidamente questo limite, che può causare un crash.

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Gaming LINUX eliminare i crash / aumentare la compatibilità](https://youtu.be/sr4RgshrUYY)

- Aggiungere in:

```
sudo nano /etc/sysctl.d/99-sysctl.conf
```

la linea seguente:

`
vm.max_map_count=2147483642
`

## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/speed.png" width="30" height="30"> **Ottimizzazione di Precisione**: <a name="optimization"/>

### [Kernel TKG](https://github.com/Frogging-Family/linux-tkg)

> [!WARNING]
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

> [!WARNING]
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

> [!WARNING]
> Questo passaggio è destinato a utenti avanzati :star:

Nvidia-all è un'integrazione del driver nvidia di TkG. Include patch di supporto per nuovi kernel. Vi consente di selezionare la versione del driver che volete installare, sia che si tratti dell'ultima versione ufficiale, di una versione beta, della versione Vulkan, ecc.

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
```

## Risoluzione dei problemi <a name="troubleshooting"/>

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Parte 3 i problemi più comuni.](https://youtu.be/vbOOQsYyPfc?si=wA2W8bOG1gtpfmnZ)

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Parte 4 Manutenzione / aggiornamento](https://youtu.be/Z7POSK2jnII?si=SNwagGGJXRVkYPdc)
 
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Arch Linux Parte 5 Arch-Chroot](https://youtu.be/iandJSjePiA?si=7uI8JZ-VxAVOsPTh)

- Per aiuto, visita il Discord di GLF (fr/en): [Discord GLF](http://discord.gg/EP3Jm8YMvj)

## Fonti <a name="community"/>

Fonti e link utili :
- [ArchWiki](https://wiki.archlinux.org/)
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Funzionamento del WIKI di Arch.](https://www.youtube.com/watch?v=TQ3A9l2N5lI)
- [Sito GLF](https://www.gaminglinux.fr/)
- [Discord GLF](http://discord.gg/EP3Jm8YMvj)
- [Il mio canale Youtube](https://www.youtube.com/@Cardiacman)


## Contributo

I contributi a questo progetto sono benvenuti! Se avete suggerimenti, segnalazioni di bug o contributi, siete pregati di aprire un issue o una pull request nel repository.

Come potete vedere questo progetto è disponibile in francese, inglese e spagnolo. I traduttori sono più che benvenuti! :people_holding_hands:

## 🙏 Ringraziamenti

- Al team di [Arch Linux](https://archlinux.org/) per il loro incredibile lavoro.
- Alla comunità di Arch Linux per la loro eccezionale documentazione.
- Ai manutentori dell'AUR per il loro duro lavoro.
- Agli sviluppatori dei pacchetti utilizzati in questo progetto. Una menzione speciale a:
- [Frogging Family](https://github.com/Frogging-Family)
- [OpenRGB](https://github.com/CalcProgrammer1/OpenRGB)
- Grazie al [GLF Discord](https://discord.gg/6t4REDETJd) per i numerosi test e feedback.