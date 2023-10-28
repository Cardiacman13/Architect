# TUTORIAL Y SCRIPT POST-INSTALACIÓN DE ARCH LINUX

## PREÁMBULO
### ¡IMPORTANTE! ###
**¡Este tutorial debe seguirse exactamente en el orden dado!**

### Presentación

Arch es una distribución técnica dirigida a un público más avanzado, consistiendo en "bloques de construcción". Piensa en ello como un conjunto de Legos en blanco, con una base que necesitas construir y moldear como desees, y si lo haces mal, las cosas pueden romperse.

El propósito de este tutorial es instalar un Arch estándar con un mínimo de paquetes, según nuestras necesidades para el trabajo de oficina y/o juegos.

<img src="assets/images/Cardiac-icon.png" width="30" height="30"> Este icono te redirige a mis videos sobre ciertas partes de este tutorial.

<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [ Lista de Reproducción del Tutorial de Arch Linux ](https://www.youtube.com/watch?v=JE6VwNHLcyk&list=PLuIP_-MWRwtWEX0tyDpZPdwU6zCE1O1cY)

### Condiciones

El script que encontrarás más adelante funciona independientemente de tus elecciones de DE / GESTOR DE ARRANQUE / FS.

El tutorial está optimizado para las siguientes elecciones:

- systemd-boot
- Ext4
- KDE
- Un Arch puro (incompatible con Garuda, EndeavourOS, Manjaro…) 

Sin embargo, si sabes lo que estás haciendo, las modificaciones para otras elecciones son mínimas.

Descarga la ISO: [**Arch Linux - Descargas**](https://archlinux.org/download/)

### Tabla de Contenidos
1. [Instalación](#section-1)
2. [Post instalación](#section-2)
3. [Soporte de Hardware](#section-3)
4. [Software Básico](#section-4)
5. [Juegos](#section-5)
6. [Bonus](#section-6)

## INSTALACIÓN    <a name="section-1"></a>

**Sigue este video meticulosamente:**
<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutorial de Arch Linux Parte 1: Archinstall ](https://www.youtube.com/watch?v=JE6VwNHLcyk)

Para todos los siguientes pasos, cuando tengas texto presentado de esta manera, indicará un comando a escribir en tu terminal:
```
echo "¡Hola mundo!"            # Comando de ejemplo
```

1. **Configura el teclado en francés**
   Ten cuidado aquí: por defecto, estarás en QWERTY, así que la "a" estará, y solo para este comando, en la tecla "q" de tu teclado.
   ```
   loadkeys fr
   ```

2. **Configura tu Wi-Fi**
   ```
   iwctl
   ```
   Luego (reemplaza TU-NOMBRE-DE-WIFI por el nombre de tu wifi)
   ```
   station wlan0 connect TU-NOMBRE-DE-WIFI (SSID)
   ```
   Ingresa tu contraseña wifi y luego `quit` para salir de iwctl.

3. **Archinstall**
   ```
   pacman -Syu archinstall      # actualiza el script de archinstall antes de la instalación
   archinstall                 # para lanzar el script de ayuda de instalación para arch linux
   ```
   **/!\ El menú de archinstall está sujeto a cambios con las actualizaciones del script /!\\**

## POST INSTALACIÓN    <a name="section-2"></a>
<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutorial de Arch Linux Parte 2: Post Instalación ](https://youtu.be/FEFhC46BkXo?si=Gi-6BOhqENLoh5Ak)

Este script se debe ejecutar en una instalación limpia, **recién instalada con archinstall**; realizará el tutorial por ti independientemente de tus elecciones de DE, gestor de arranque y sistema de archivos.

Si tienes Nvidia, asegúrate de que tu tarjeta sea compatible con los últimos controladores de Nvidia. En general, este script/tutorial no está destinado para computadoras muy antiguas.

**Script de post-instalación:**

   ```
   sudo pacman -Syu git
   git clone https://github.com/Cardiacman13/Tuto-Arch.git
   cd Tuto-Arch
   ./post-instalación
   ```
Siéntete libre de informar cualquier error, gracias :)

### Optimizar pacman

1. Esta [modificación](https://wiki.archlinux.org/title/Pacman#Enabling_parallel_downloads) permite la paralelización de descargas de paquetes. (PD: con kate, cuando guardas, podrían pedirte que ingreses una contraseña. Introduce tu contraseña de root/sudo.)

   ```
   kate /etc/pacman.conf
   ```

   Descomenta (elimina el **#** de las siguientes líneas):
   
   ```
   #Opciones varias
   #UseSyslog
   Color <-
   #NoProgressBar
   #CheckSpace
   VerbosePkgLists <- 
   ParallelDownloads = 5 <-
   ```

2. Instalación de yay

   [Yay](https://github.com/Jguer/yay) es una herramienta útil para administrar la instalación y actualización de software en sistemas basados en Arch Linux.
   Yay facilita especialmente el uso del repositorio AUR, un repositorio gestionado por la comunidad que amplía significativamente la biblioteca de software disponible. Esto incluye la compilación de estos programas desde su fuente, a menos que se especifique "-bin" al final de su nombre.
   **/!\ Ten cuidado /!\ Como los paquetes en AUR son proporcionados por la comunidad, ¡no instales cualquier cosa!**
   
   ```
   sudo pacman -S --needed git base-devel
   git clone https://aur.archlinux.org/yay-bin.git
   cd yay-bin
   makepkg -si
   ```

   Añadiendo soporte para actualizaciones de paquetes git. (Normalmente solo necesita hacerse una vez)
   ```
   yay -Y --gendb
   yay -Y --devel --save
   ```

3. Alias de mantenimiento:

   <img src="assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutorial de Arch Linux Parte 4: Mantenimiento ](https://www.youtube.com/watch?v=Z7POSK2jnII)

   Esta modificación te permite simplemente escribir “update-arch” en una terminal para actualizar el sistema, “clean-arch” para limpiarlo, o “fix-key” en caso de un error con las llaves gpg.

   ```
   kate ~/.

bashrc
   ```
   Añade cada una de estas líneas al final del archivo:
   ```
   alias update-arch='yay -Syu && flatpak update'
   ```
   ```
   alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'
   ```
   ```
   alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring y sudo pacman --noconfirm -Su'
   ```
   
   Reinicia la terminal.

## SOPORTE DE HARDWARE <a name="section-3"></a>

### NVIDIA (mantente en X11 al menos hasta el lanzamiento de KDE 6)
Video complementario que explica cómo recuperar el acceso a Wayland desde GDM:
<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Debian y Arch Linux Gnome Wayland con Nvidia (Debian en la documentación)](https://www.youtube.com/watch?v=DVkWLvwtQ18)

1. **Instalar los componentes básicos:**
    ```
    yay -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader cuda
    ```

2. **Habilitar nvidia-drm.modeset=1:**

Esta configuración permite que el módulo Nvidia se lance al inicio.

   - **Si usas systemd-boot**

En la carpeta:

```
/boot/loader/entries/
```

   Hay varios archivos .conf, necesitas añadir nvidia-drm.modeset=1 en la línea “options” de cada archivo.
   Ejemplo: options root=PARTUUID=fb680c54-466d-4708-a1ac-fcc338ed57f1 rw rootfstype=ext4 nvidia-drm.modeset=1

- **Si usas GRUB**

    ```
    kate /etc/default/grub
    ```

    Agrega **nvidia-drm.modeset=1** en la línea "grub_cmdline_linux_default="

    Ejemplo: GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia-drm.modeset=1"

    Luego:

    ```
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    ```
   
3. **Cargar módulos Nvidia como prioridad al iniciar Arch:**
    Este paso a veces es necesario para ciertos entornos de escritorio o gestores de ventanas.
    ```
    kate /etc/mkinitcpio.conf
    ```
    Modifica la línea MODULES=() a:
    ```
    MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
    ```
    Si usas btrfs:
    ```
    MODULES=(btrfs nvidia nvidia_modeset nvidia_uvm nvidia_drm)
    ```

4. **Hook de mkinitcpio:**
    Este hook automatiza la reconstrucción de initramfs (el archivo básico de arranque) con cada modificación del controlador Nvidia.
    ```
    sudo mkdir /etc/pacman.d/hooks/
    kate /etc/pacman.d/hooks/nvidia.hook
    ```
    Añade:
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
    Description=Actualiza el módulo NVIDIA en initcpio
    Depends=mkinitcpio
    When=PostTransaction
    NeedsTargets
    Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
    ```

5. **Reconstrucción de initramfs:**
    Dado que ya hemos instalado los controladores en el paso 1, y antes de configurar el hook, necesitamos desencadenar manualmente la reconstrucción de initramfs:
    ```
    mkinitcpio -P
    ```

### AMD (no realizar si tienes Nvidia)
Instala los componentes básicos:
```
yay -S --needed mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader vulkan-mesa-layers lib32-vulkan-mesa-layers
```

### INTEL (no realizar si tienes Nvidia)
Instala los componentes básicos:
```
yay -S --needed mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader intel-media-driver
```

### Impresoras
- Esenciales
    ```
    yay -S ghostscript gsfonts cups cups-filters cups-pdf system-config-printer
    avahi --needed
    sudo systemctl enable --now avahi-daemon cups
    ```
- Drivers
    ```
    yay -S foomatic-db-engine foomatic-db foomatic-db-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds gutenprint foomatic-db-gutenprint-ppds --needed
    ```
- Impresoras HP
    ```
    yay -S python-pyqt5 hplip --needed
    ```
- Impresoras Epson
    ```
    yay -S --needed epson-inkjet-printer-escpr epson-inkjet-printer-escpr2 epson-inkjet-printer-201601w epson-inkjet-printer-n10-nx127
    ```

### Bluetooth
El segundo comando a continuación le pide a systemd que inicie inmediatamente el servicio bluetooth, y también que lo active en cada arranque.
```
yay -S --needed bluez bluez-utils bluez-plugins
sudo systemctl enable

## SOFTWARE BÁSICO <a name="section-4"></a>

### Componentes Básicos
Aquí encontrarás códecs, utilidades, fuentes, controladores:
```
yay -S gst-plugins-bad gst-plugins-base gst-plugins-ugly gst-plugin-pipewire gstreamer-vaapi gst-plugins-good gst-libav gstreamer reflector-simple downgrade rebuild-detector mkinitcpio-firmware xdg-desktop-portal-gtk xdg-desktop-portal neofetch power-profiles-daemon lib32-pipewire hunspell hunspell-fr p7zip unrar ttf-liberation noto-fonts noto-fonts-emoji adobe-source-code-pro-fonts otf-font-awesome ttf-droid ntfs-3g fuse2fs exfat-utils fuse2 fuse3 bash-completion man-db man-pages --needed
```

## SOFTWARE BÁSICO <a name="section-4"></a>

### Componentes Básicos
Aquí encontrarás códecs, utilidades, fuentes, controladores:
```
yay -S gst-plugins-bad gst-plugins-base gst-plugins-ugly gst-plugin-pipewire gstreamer-vaapi gst-plugins-good gst-libav gstreamer reflector-simple downgrade rebuild-detector mkinitcpio-firmware xdg-desktop-portal-gtk xdg-desktop-portal neofetch power-profiles-daemon lib32-pipewire hunspell hunspell-fr p7zip unrar ttf-liberation noto-fonts noto-fonts-emoji adobe-source-code-pro-fonts otf-font-awesome ttf-droid ntfs-3g fuse2fs exfat-utils fuse2 fuse3 bash-completion man-db man-pages --needed
```

### Software Misceláneo
```
yay -S libreoffice-fresh libreoffice-fresh-fr vlc discord gimp obs-studio gnome-disk-utility visual-studio-code-bin
```

### Software KDE

Aquí hay varios software para gráficos, video (edición, soporte de códecs), utilidades de interfaz gráfica, etc.
```
yay -S xdg-desktop-portal-kde okular print-manager kdenlive gwenview spectacle partitionmanager ffmpegthumbs qt6-wayland kdeplasma-addons powerdevil kcalc plasma-systemmonitor qt6-multimedia qt6-multimedia-gstreamer qt6-multimedia-ffmpeg kwalletmanager
```

Video adicional:
<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Personalizando KDE Parte 1 Layout, Tema, Kvantum, mejores prácticas!](https://www.youtube.com/watch?v=vdlj83sb84s&t=1240s)

### Cortafuegos
La configuración por defecto puede bloquear el acceso a impresoras y otros dispositivos en tu red local.
Aquí tienes un pequeño enlace para ayudarte: https://www.dsfc.net/infra/securite/configurer-firewalld/
```
sudo pacman -S --needed --noconfirm firewalld python-pyqt5 python-capng
sudo systemctl enable --now firewalld.service
firewall-applet &
```

### Reflector para actualizaciones automáticas de espejos

```
yay -S reflector-simple
```

Un comando para generar una lista de espejos, a realizar una vez después de la primera instalación y repetir si viajas, o cambias de país, o si encuentras la descarga de paquetes demasiado lenta, o si te encuentras con un error que te dice que un espejo está caído:

```
sudo reflector --score 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist
```

## JUEGOS <a name="section-5"></a>

### Steam
Nota que los controladores de AMD o Nvidia deben instalarse de antemano como se menciona en la sección [SOPORTE DE HARDWARE](#HARDWARE-SUPPORT).
```
yay -S steam
```

### Lutris

Lutris es un administrador de juegos FOSS (Free, Open Source) para sistemas operativos basados en Linux.
Lutris permite buscar un juego o una plataforma (Ubisoft Connect, EA Store, GOG, Battlenet, etc.) y propone un script de instalación que configurará lo necesario para que tu elección funcione con Wine o Proton.

```
sudo pacman -S --needed lutris wine-staging
```

Video adicional:
    <img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Configurando Lutris para laptop Intel/Nvidia ](https://www.youtube.com/watch?v=Am3pgTXiUAA)

### Soporte avanzado para controladores

Controlador Linux avanzado para controladores inalámbricos Xbox 360|One|S|X (suministrados con Xbox One S)

 y muchos otros controladores como 8bitdo ([xpadneo](https://github.com/atar-axis/xpadneo)) ([xone](https://github.com/medusalix/xone))


```
yay -S --needed xpadneo-dkms 
```
Controlador Linux avanzado para controladores PS4/PS5
```
yay -S --needed bluez-utils-compat ds4drv dualsencectl
```

### Mostrar rendimiento en juego

[MangoHud](https://wiki.archlinux.org/title/MangoHud) es una superposición para Vulkan y OpenGL que permite monitorear el rendimiento del sistema dentro de las aplicaciones y registrar métricas para el benchmarking.
Es la herramienta que necesitas si quieres ver tus FPS en juego, tu carga de CPU o GPU, etc. O incluso grabar estos resultados en un archivo.
Aquí, instalamos GOverlay que es una interfaz gráfica para configurar MangoHud.

```
yay -S goverlay --needed
```

### Mejorando la compatibilidad de juegos de Windows

Aumentamos el valor predeterminado de esta variable, permitiendo el almacenamiento de más "áreas de mapa de memoria". El valor predeterminado es muy bajo. El objetivo es mejorar la compatibilidad con juegos de Windows a través de Wine o Steam (ver [ProtonDB](https://www.protondb.com/)), sabiendo que algunos juegos mal optimizados tienden a alcanzar este límite rápidamente, lo que puede resultar en un bloqueo.

**Advertencia**: Esta operación debe realizarse después de la instalación de un Kernel, ya sea el kernel de stock o un TKG (ver sección [KERNEL](#section-7)). Tendrá que hacerse nuevamente en cada cambio de kernel.

Aquí tienes un pequeño script para automatizar esta operación:

```bash
sudo bash -c 'echo "vm.max_map_count=262144" >> /etc/sysctl.d/99-sysctl.conf'
sudo sysctl -p /etc/sysctl.d/99-sysctl.conf
```

## RENDIMIENTO DEL SISTEMA Y AJUSTES <a name="section-6"></a>

### Copia de seguridad del sistema con Timeshift

Timeshift está diseñado principalmente para proteger archivos y configuraciones del sistema. Los datos del usuario como documentos, imágenes, música y videos no se respaldan.

```
yay -S timeshift
```

### Kernel (Incluyendo versiones TKG PDS & BMQ)

```
yay -S linux-tkg-pds-zen linux-tkg-pds-zen-headers linux-tkg-muqss-zen linux-tkg-muqss-zen-headers linux-tkg-bmq-zen linux-tkg-bmq-zen-headers
```

### Mesa-tkg-git

Mesa-tkg-git es una versión de Mesa optimizada para el rendimiento.
Esto puede ser útil, especialmente si juegas usando Vulkan u OpenGL.
Solo para GPUs AMD:

```
yay -S mesa-tkg-git
```

### Optimizando el rendimiento del sistema

Cuando se trata del rendimiento del sistema, no solo el hardware, sino también la configuración importa. Aquí hay algunos trucos y herramientas para optimizar tu instalación de Arch Linux.

#### Modo de juego de Feral Interactive

[GameMode](https://github.com/FeralInteractive/gamemode) es un combo daemon/lib de código abierto para Linux que permite a los juegos solicitar que un conjunto de optimizaciones se aplique temporalmente al sistema operativo anfitrión y/o a un proceso de juego.
GameMode mejora el rendimiento de los juegos aplicando varias optimizaciones, como optimizar el gobernador de la CPU o el modo de rendimiento de la GPU, cuando se ejecuta un juego compatible.

```
yay -S gamemode
```

## MANTENIMIENTO DEL SISTEMA Y SOLUCIÓN DE PROBLEMAS <a name="section-7"></a>

### Enlaces a videos útiles para solucionar problemas en Arch Linux
- [Solucionando Problemas Comunes de Arch Linux](https://www.youtube.com/watch?v=hmZrJyFPc10)
- [Arreglando Errores Comunes de Instalación de Arch Linux](https://www.youtube.com/watch?v=ZrMNkrC3vYg)

Fuentes y enlaces útiles:
- [ArchWiki](https://wiki.archlinux.org/)
<img src="assets/images/Cardiac-icon.png" width="30" height="30"> [Funcionamiento del WIKI de Arch.](https://www.youtube.com/watch?v=TQ3A9l2N5lI)
- [Sitio GLF](https://www.gaminglinux.fr/)
- [Discord GLF](http://discord.gg/EP3Jm8YMvj)
- [Mi canal de Youtube](https://www.youtube.com/@Cardiacman)
