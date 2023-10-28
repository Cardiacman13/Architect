# TUTORIAL Y SCRIPT POST-INSTALACION ARCH LINUX

## PREÁMBULO
### ¡IMPORTANTE! ###
**¡Este tutorial debe seguirse en el orden indicado !

### Presentación

Arch es una distribución técnica diseñada para un público más avanzado, formada por "bloques de construcción". Piensa en ella como un juego de Lego en blanco, con una base que tienes que construir y moldear a tu antojo, y si lo haces mal, las cosas pueden romperse.

El objetivo de este tutorial es instalar un Arch stock con un mínimo de paquetes, en función de nuestras necesidades ofimáticas y/o de juego. 

<img src="assets/images/Cardiac-icon.png" width="30" height="30"> Este icono te redirige a mis vídeos sobre ciertas partes de este tutorial.

<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [ Tuto Arch Linux Playlist ](https://www.youtube.com/watch?v=JE6VwNHLcyk&list=PLuIP_-MWRwtWEX0tyDpZPdwU6zCE1O1cY)

### Condiciones

El script que encontrará a continuación funcionará independientemente de sus opciones DE / BOOT LOADER / FS.

El tutorial está optimizado para las siguientes opciones : 

- systemd-boot
- Ext4
- KDE
- Arch puro (incompatible con Garuda, EndeavourOS, Manjaro...) 

Sin embargo, si sabes lo que estás haciendo, las modificaciones para otras opciones son mínimas.

Descarga la ISO: [**Arch Linux - Descargas**](https://archlinux.org/download/)

### Table des matières
1. [Installation](#section-1)
2. [Post installation](#section-2)
3. [Support matériel](#section-3)
4. [Logiciels de base](#section-4)
5. [Gaming](#section-5)
6. [Bonus](#section-6)

## INSTALACIÓN <a name="section-1"></a>

**Sigue escrupulosamente este vídeo:** 
<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutorial Arch Linux Parte 1 : Archinstall ](https://www.youtube.com/watch?v=JE6VwNHLcyk)

Para todos los pasos siguientes, cuando tengas texto en este tipo de presentación, te indicará un comando a escribir en tu terminal:```echo "¡Hola mundo !"            # Ejemplo de comando
1. **Ponga el teclado en FR**.
    Nota aquí: por defecto estarás en QWERTY, así que la "a" estará en la tecla "q" de tu teclado sólo para este comando.
    ```
    loadkeys es
    ```

2. **Configura tu Wi-Fi
    ```
    iwctl
    ```
    A continuación (sustituye TU-NOMBRE-WIFI por el nombre de tu wifi)
    ```
    station wlan0 connect TU-NOMBRE-WIFI (SSID)
    ```
    Introduce la contraseña de tu wifi y luego `quit` para salir de iwctl.

3. **Archinstall**
    ```
    pacman -Syu archinstall # actualizar el script archinstall antes de la instalación
    archinstall # para ejecutar el script de ayuda para la instalación de arch linux
    ```
    **/El menú de archinstall puede cambiar a medida que se actualiza el script.

## POST INSTALACIÓN <a name="section-2"></a>
<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [ Tuto Arch Linux Parte 2 : Post instalación ](https://youtu.be/FEFhC46BkXo?si=Gi-6BOhqENLoh5Ak)

Script para ser ejecutado en una instalación limpia, **recién instalada con archinstall**, realiza el tutorial por ti sea cual sea tu elección de DE, gestor de arranque y sistema de archivos.

Si es Nvidia, asegúrese de que su tarjeta es compatible con los últimos drivers Nvidia, en general este script/tutorial no está diseñado para ordenadores.

**Script de post-instalación :**

   ```
   sudo pacman -Syu git
   git clone https://github.com/Cardiacman13/Tuto-Arch.git
   cd Tuto-Arch
   ./post-instalación
   ```
No dude en informar de errores, gracias :) 

### Optimizar pacman

1. Esta [modificación](https://wiki.archlinux.org/title/Pacman#Enabling_parallel_downloads) permite descargar paquetes en paralelo. (PS: con kate, cuando guardes, puede que se te pida que introduzcas una contraseña. Introduce tu contraseña de root/sudo).

   ```
    kate /etc/pacman.conf
    ```

    Descomente (elimine el **#** de las siguientes líneas):
        
    ```
    #Opciones
    #UsarSyslog
    Color <-
    #NoProgressBar
    #CheckSpace
    VerbosePkgLists <- 
    DescargasParalelas = 5 <-
    ```

2. Instalación de yay

   [Yay](https://github.com/Jguer/yay) es una práctica herramienta para gestionar la instalación y actualización de software en sistemas basados en Arch Linux.
   En particular, Yay facilita el uso del repositorio AUR, gestionado por la comunidad y que amplía considerablemente la biblioteca de software disponible. Esto implica compilar el software desde el código fuente, a menos que se especifique "-bin" al final del nombre del software.
   **/Sin embargo, ten cuidado, ya que los paquetes en AUR son proporcionados por la comunidad, ¡así que no instales cualquier cosa!
   
    ```
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
    ```

   Añadido soporte para actualizaciones de paquetes git. (Normalmente sólo se hace una vez)
    ```
    yay -Y --gendb
    yay -Y --devel --save
    ```

3. Alias de mantenimiento:

   <img src="assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutorial Arch Linux Parte 4: Mantenimiento ](https://www.youtube.com/watch?v=Z7POSK2jnII)

   Esta modificación significa que sólo hay que teclear "update-arch" en un terminal para actualizar el sistema, "clean-arch" para limpiarlo o "fix-key" en caso de error con las claves gpg.

    ```
    kate ~/.bashrc
    ```
    Añade cada una de estas líneas al final del archivo:
    ```
    alias update-arch='yay -Syu && flatpak update'
    ```
    ```
    alias clean-arch= 'yay -Sc && yay -Yc && flatpak remove --unused'
    ```
    ```
    alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
    ```
    
   Reinicie el terminal.

## SOPORTE DE HARDWARE <a name="section-3"></a>

### NVIDIA (permanece en X11 al menos hasta que salga KDE 6).
Vídeo adicional explicando cómo acceder de nuevo a Wayland desde GDM:
<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Debian y Arch Linux Gnome Wayland con Nvidia (Debian en doc)](https://www.youtube.com/watch?v=DVkWLvwtQ18)

1. **Instala los componentes principales:**
    ```
    yay -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader cuda
    ```

2. **Activar nvidia-drm.modeset=1 :**

Este parámetro permite lanzar el módulo Nvidia en el arranque.

   - Si systemd arranca**

En el :

```
/boot/loader/entradas/
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

3. **Cargar los módulos de Nvidia como prioridad al iniciar Arch:**.
    Este paso es a veces necesario para ciertos entornos de escritorio o gestores de ventanas.
    ```
    kate /etc/mkinitcpio.conf
    ```
    Cambia la línea MODULES=() por :
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

5. **Reconstruir initramfs** :
    Como ya hemos instalado los drivers en el paso 1, antes de instalar el hook, reconstruiremos manualmente el initramfs:
    ```
    mkinitcpio -P
    ```
### AMD (ne pas faire si Nvidia)
Instalar los componentes core :
```
yay -S --needed mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader vulkan-mesa-layers lib32-vulkan-mesa-layers
```

### INTEL (ne pas faire si Nvidia)
Instalar los componentes core :
```
yay -S --needed mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader intel-media-driver
```

### Imprimantes
- Los indispensables
    ```
    yay -S ghostscript gsfonts cups cups-filters cups-pdf system-config-printer
    avahi --needed
    sudo systemctl enable --now avahi-daemon cups
    ```
- Controladores
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

### Bluetooth
El segundo comando a continuación le dice a systemd que inicie el servicio bluetooth inmediatamente, y también que lo habilite cada vez que se inicie.
```
yay -S --needed bluez bluez-utils bluez-plugins
sudo systemctl enable --now bluetooth.service
```
### PipeWire](https://pipewire.org/) (sonido)
Para obtener sonido **/!\** Diga sí a todo para sobrescribir todo con los nuevos paquetes. /!\**
```
sudo pacman -S --needed pipewire lib32-pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber alsa-utils alsa-firmware alsa-tools
```

## LOGICIELS DE BASE <a name="section-4"></a>

### Componentes de base
Encontrarás códecs, utilidades, políticas, controladores..:
```
yay -S gst-plugins-bad gst-plugins-base gst-plugins-ugly gst-plugin-pipewire gstreamer-vaapi gst-plugins-good gst-libav gstreamer reflector-simple downgrade rebuild-detector mkinitcpio-firmware xdg-desktop-portal-gtk xdg-desktop-portal neofetch power- profiles-daemon lib32-pipewire hunspell hunspell-fr p7zip unrar ttf-liberation noto-fonts noto-fonts-emoji adobe-source-code-pro-fonts otf-font-awesome ttf-droid ntfs-3g fuse2fs exfat-utils fuse2 fuse3 bash-completion man-db man-pages --neededed
```
 
### Logiciels divers
```
yay -S libreoffice-fresh libreoffice-fresh-fr vlc discord gimp obs-studio gnome-disk-utility visual-studio-code-bin
```

### Logiciels KDE

Dispones de diferentes programas para gráficos, vídeo (montaje, gestión de códecs), utilidades con interfaz gráfica, etc.
```
yay -S xdg-desktop-portal-kde okular print-manager kdenlive gwenview spectacle partitionmanager ffmpegthumbs qt6-wayland kdeplasma-addons powerdevil kcalc plasma-systemmonitor qt6-multimedia qt6-multimedia-gstreamer qt6-multimedia-ffmpeg kwalletmanager
```

Vidéo complémentaire :
<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Customiser KDE Partie 1 Layout, Thème, Kvantum, bonnes pratiques !](https://www.youtube.com/watch?v=vdlj83sb84s&t=1240s)

### Cortafuegos
La configuración por defecto puede bloquear el acceso a impresoras y otros dispositivos de tu red local.
Aquí tienes un enlace que te ayudará: https://www.dsfc.net/infra/securite/configurer-firewalld/
```
sudo pacman -S --needed --noconfirm firewalld python-pyqt5 python-capng
sudo systemctl enable --now firewalld.service
firewall-applet &
```

### Reflector para actualizar las réplicas automáticamente

```
yay -S reflector-simple
```

Un comando para generar una lista de mirrors, que debe hacerse 1 vez después de la primera instalación y repetirse si viajas, o cambias de país, o si ves que la descarga de paquetes es demasiado larga, o si te da un error diciéndote que un mirror está caído:

```
sudo reflector --score 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist
```

## GAMING <a name="section-5"></a>

### Steam
Ten en cuenta que los drivers de AMD o Nvidia deben estar instalados previamente como se menciona en la sección [SOPORTE DE HARDWARE](#SOPORTE DE HARDWARE).
```
yay -S steam
```

### Lutris

Lutris es un gestor de juegos FOSS (free, open source) para sistemas operativos basados en Linux.
Lutris te permite buscar un juego o una plataforma (Ubisoft Connect, EA Store, GOG, Battlenet, etc.) y sugerirte un script de instalación que configurará lo que necesites para que tu elección funcione con Wine o Proton.

```
sudo pacman -S --needed lutris wine-staging
```

Vídeo relacionado:
    <img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Configuración de Lutris para portátiles Intel/Nvidia ](https://www.youtube.com/watch?v=Am3pgTXiUAA)


### Soporte avanzado para mandos 

Controlador Linux avanzado para mandos inalámbricos Xbox 360|One|S|X (incluido con Xbox One S) y otros mandos como 8bitdo ([xpadneo](https://github.com/atar-axis/xpadneo)) ([xone](https://github.com/medusalix/xone))


```
yay -S --needed xpadneo-dkms 
```
Controlador Linux avanzado para controladores PS4/PS5
```
yay -S --needed bluez-utils-compat ds4drv dualsencectl
```

### Mostrar el rendimiento en el juego

[MangoHud](https://wiki.archlinux.org/title/MangoHud) es un overlay Vulkan y OpenGL para monitorizar el rendimiento del sistema dentro de las aplicaciones y registrar métricas para benchmarking.
Es la herramienta que necesitas si quieres ver los FPS en el juego, la carga de la CPU o de la tarjeta gráfica, etc., o incluso guardar estos resultados en un archivo para compararlos. O incluso guardar estos resultados en un archivo.
Aquí instalamos GOverlay, que es una interfaz gráfica para configurar MangoHud.

```
yay -S goverlay --needed
```




   

