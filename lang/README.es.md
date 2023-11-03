# TUTORIAL Y SCRIPT POST-INSTALACIÓN DE ARCH LINUX

## Presentación

<img src="https://github.com/Cardiacman13/Architect/blob/main/assets/images/desktop.png" width="1000" height="250">

Arch es una distribución técnica dirigida a un público más avanzado, consistente en "bloques de construcción". Piénsalo como un conjunto de Lego en blanco, con una base que necesitas construir y moldear como desees, y si lo haces mal, las cosas pueden romperse.

El propósito de este tutorial es instalar un Arch estándar con un mínimo de paquetes, según nuestras necesidades para trabajo de oficina y/o juegos.

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> Este icono te redirige a mis videos sobre ciertas partes de este tutorial [**Lista de Reproducción del Tutorial de Arch Linux**](https://www.youtube.com/watch?v=JE6VwNHLcyk&list=PLuIP_-MWRwtWEX0tyDpZPdwU6zCE1O1cY)

### Condiciones

> **Nota**
> El script que encontrarás más adelante funciona independientemente de tus elecciones de DE / BOOT LOADER / FS.
> Tutorial y script destinados a ser utilizados con un Arch puro (incompatible con Garuda, EndeavourOS, Manjaro…)
> Sin embargo, si sabes lo que estás haciendo, las modificaciones para otras opciones son mínimas.

Descarga el ISO: [**Arch Linux - Descargas**](https://archlinux.org/download/)

## Índice
1. [Script Todo-en-Uno](#script)
2. [Potencia tu escritorio](#elevate)
3. [Lleva tus Juegos a Otro Nivel](#gaming)
4. [Optimización de Precisión](#optimization)
5. [Solución de Problemas](#troubleshooting)
6. [Cosas de la Comunidad](#community)

## Script de Post-Instalación de Arch Linux <a name="script"/>

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Welcome.png">

El propósito de este script es configurar un sistema **Arch estándar** con un **conjunto mínimo de paquetes** adaptados a tus necesidades justo después de usar archinstall. Este script está **orientado hacia el gaming**.

> [!NOTA]
> **Antes de empezar:**
> Este script se basa en un tutorial que describe todos los pasos: [Tuto-Arch](https://github.com/Cardiacman13/Tuto-Arch/blob/main/lang/README.en.md)
> Este script está destinado para usarse en una instalación limpia que acaba de ser configurada con `archinstall`.
> Antes de ejecutar este script, asegúrate de haber iniciado sesión en un Entorno de Escritorio.
> No es adecuado para computadoras obsoletas. Asegúrate de que tu hardware cumpla con los requisitos para los últimos controladores de Nvidia.

```bash
sudo pacman -Sy git
git clone https://github.com/Cardiacman13/Architect.git
cd Architect
./architect.sh
```

### 1. Optimizando Pacman
Mejora la funcionalidad y experiencia de usuario de Pacman haciendo las siguientes mejoras:

- Habilitando la salida de color.
- Habilitando listas detalladas de paquetes.
- Habilitando descargas paralelas.
- Habilitando soporte multilib.

### 2. Añadiendo Alias Útiles
Simplifica tus tareas de línea de comandos con estos alias útiles:

- update-arch: Actualiza las aplicaciones de tu sistema con un solo comando.
- clean-arch: Limpia tu sistema eliminando paquetes no utilizados.
- fix-key: Soluciona problemas relacionados con claves, asegurando un proceso de actualización sin problemas.

### 3. Asistencia con la Instalación de GPU para Gaming de AMD, NVIDIA o Intel
Prepara tu sistema para el gaming con la configuración de GPU, que incluye:

- Instalación de controladores.
- Instalación de bibliotecas Vulkan.
- Instalación de bibliotecas de 32 bits.
- Elegir entre los controladores estándar de Nvidia o la variante `nvidia-all`:
  - **Nvidia**: Esta es la opción recomendada para la mayoría de los usuarios. Involucra:
    - Instalación de paquetes de Nvidia.
    - Instalación de CUDA.
  - **Nvidia-all**: Esto es para usuarios avanzados que saben cómo mantenerlo. Involucra:
    - Clonar e instalar desde el repositorio `Frogging-Family/nvidia-all`.
    - Instalación de CUDA.

### 4. Instalar Algunos Paquetes Básicos
Instala paquetes fundamentales para una experiencia completa:

- [yay](https://github.com/Jguer/yay) o [paru](https://github.com/Morganamilo/paru) ayudante AUR.
- Fuentes.
- Utilidades de escritorio.
- Códecs.
- Otros paquetes esenciales.

### 5. Mejoras Varias
Ajusta tu sistema para una experiencia mejorada:

- Aumentando `vm.max_map_count` para mejorar la compatibilidad con juegos de Windows. [Wiki de Arch sobre vm-max-map-count](https://wiki.archlinux.org/title/gaming#Increase_vm.max_map_count)
- Preguntándote sobre la configuración de soporte de impresión.
- Preguntándote sobre la configuración de Bluetooth.
- Soporte avanzado para controladores de Xbox, PS4/PS5, 8bitdo
- Propone configurar Fish como una shell de línea de comandos.

### 6. Asistencia con la Instalación de Varios Softwares
Tienes la libertad de elegir qué software adicional instalar según tus necesidades específicas:

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

## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/pc.png" width="30" height="30"> **Potencia tu Escritorio** <a name="elevate"/>

### Instalación

> [!IMPORTANTE]
> Sigue los pasos meticulosamente

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutorial de Arch Linux Parte 1: Archinstall ](https://www.youtube.com/watch?v=JE6VwNHLcyk)

Para todos los siguientes pasos, cuando veas texto presentado de esta manera, indicará un comando a teclear en tu terminal:
```
echo "¡Hola mundo!"            # Comando de ejemplo
```

1. **Configura el teclado en inglés**
    ```
    loadkeys en
    ```

2. **Configura tu Wi-Fi**
    ```
    iwctl
    ```
    Luego (reemplaza TU-NOMBRE-WIFI por el nombre de tu wifi)
    ```
    station wlan0 connect TU-NOMBRE-WIFI (SSID)
    ```
    Ingresa tu contraseña wifi y luego `quit` para salir de iwctl.

3. **Archinstall**
    ```
    pacman -Syu archinstall      # actualiza el script de archinstall antes de la instalación
    archinstall                 # para lanzar el script de ayuda para la instalación de arch linux
    ```
    **/!\ El menú de archinstall está sujeto a cambios con las actualizaciones del script /!\\**

   ### Post-instalación
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutorial de Arch Linux Parte 2: Post-instalación ](https://youtu.be/FEFhC46BkXo?si=Gi-6BOhqENLoh5Ak)

#### Optimizar pacman

1. Esta [modificación](https://wiki.archlinux.org/title/Pacman#Enabling_parallel_downloads) permite la paralelización de las descargas de paquetes. (PD: con kate, cuando guardes, es posible que te pidan ingresar una contraseña. Introduce tu contraseña de root/sudo.)

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

2. Instalando yay

   [Yay](https://github.com/Jguer/yay) es una herramienta útil para gestionar la instalación y actualización de software en sistemas basados en Arch Linux.
   Yay facilita especialmente el uso del repositorio AUR, un repositorio gestionado por la comunidad que amplía significativamente la biblioteca de software disponible. Esto incluye la compilación de estos programas desde su fuente, a menos que se especifique "-bin" al final de su nombre.
   **/!\ Ten cuidado /!\ Como los paquetes en AUR son proporcionados por la comunidad, ¡no instales cualquier cosa!**
   
   ```
   sudo pacman -S --needed git base-devel
   git clone https://aur.archlinux.org/yay-bin.git
   cd yay-bin
   makepkg -si
   ```

   Agregando soporte para actualizaciones de paquetes git. (Normalmente solo necesita hacerse una vez)
   ```
   yay -Y --gendb
   yay -Y --devel --save
   ```

3. Alias de mantenimiento:

  <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [ Tutorial de Arch Linux Parte 4: Mantenimiento ](https://www.youtube.com/watch?v=Z7POSK2jnII)

   Esta modificación te permite simplemente teclear “update-arch” en un terminal para actualizar el sistema, “clean-arch” para limpiarlo, o “fix-key” en caso de un error con las claves gpg.

   ```
   kate ~/.bashrc
   ```
   Añade cada una de estas líneas al final del archivo:
   ```
   alias update-arch='yay -Syu && flatpak update'
   ```
   ```
   alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'
   ```
   ```
   alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate y sudo pacman -Sy --noconfirm archlinux-keyring y sudo pacman --noconfirm -Su'
   ```
   
   Reinicia el terminal.

   ### SOPORTE DE HARDWARE

#### NVIDIA (mantente en X11 al menos hasta el lanzamiento de KDE 6)
Video adicional explicando cómo recuperar el acceso a Wayland desde GDM:
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Debian y Arch Linux Gnome Wayland con Nvidia (Debian en la documentación)](https://www.youtube.com/watch?v=DVkWLvwtQ18)

1. **Instalar los componentes principales:**
    ```
    yay -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader cuda
    ```

2. **Habilitar nvidia-drm.modeset=1:**

Esta configuración permite que el módulo Nvidia se lance al inicio.

   - **Si usas systemd boot**

En la carpeta:

```
/boot/loader/entries/
```

   Hay varios archivos .conf, debes agregar nvidia-drm.modeset=1 a la línea “options” de cada archivo.
   Ejemplo: options root=PARTUUID=fb680c54-466d-4708-a1ac-fcc338ed57f1 rw rootfstype=ext4 nvidia-drm.modeset=1

- **Si usas GRUB**

    ```
    kate /etc/default/grub
    ```

    Agrega **nvidia-drm.modeset=1** a la línea "grub_cmdline_linux_default="

    Ejemplo: GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia-drm.modeset=1"

    Luego:

    ```
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    ```
   
3. **Cargar los módulos de Nvidia como prioridad al inicio de Arch:**
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
    Este hook automatiza la reconstrucción del initramfs (el archivo básico de arranque) con cada modificación del controlador Nvidia.
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
    Description=Actualizar módulo NVIDIA en initcpio
    Depends=mkinitcpio
    When=PostTransaction
    NeedsTargets
    Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
    ```

5. **Reconstrucción del initramfs:**
    Ya que hemos instalado los controladores en el paso 1, así antes de configurar el hook, necesitamos activar manualmente la reconstrucción del initramfs:
    ```
    mkinitcpio -P
    ```

#### AMD (no hacer si Nvidia)
Instalar los componentes principales:
```
yay -S --needed mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader vulkan-mesa-layers lib32-vulkan-mesa-layers
```

#### INTEL (no hacer si Nvidia)
Instalar los componentes principales:
```
yay -S --needed mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader intel-media-driver
```

#### Impresoras
- Esenciales
    ```
    yay -S ghostscript gsfonts cups cups-filters cups-pdf system-config-printer
    avahi --needed
    sudo systemctl enable --now avahi-daemon cups
    ```
- Controladores
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

#### Bluetooth
El segundo comando a continuación solicita a systemd que inicie inmediatamente el servicio de bluetooth, y también que lo active en cada arranque.
```
yay -S --needed bluez bluez-utils bluez-plugins
sudo systemctl enable --now bluetooth.service
```
#### [PipeWire](https://pipewire.org/) (sonido)
Para tener sonido **/!\ Decir sí a todo para reemplazar todo con los nuevos paquetes. /!\**
```
sudo pacman -S --needed pipewire lib32-pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber alsa-utils alsa-firmware alsa
```
#### Software Variado
```
yay -S libreoffice-fresh libreoffice-fresh-fr vlc discord gimp obs-studio gnome-disk-utility visual-studio-code-bin
```

#### Software de KDE

Aquí hay varios software para gráficos, video (edición, soporte de códec), utilidades de interfaz gráfica, etc.
```
yay -S xdg-desktop-portal-kde okular print-manager kdenlive gwenview spectacle partitionmanager ffmpegthumbs qt6-wayland kdeplasma-addons powerdevil kcalc plasma-systemmonitor qt6-multimedia qt6-multimedia-gstreamer qt6-multimedia-ffmpeg kwalletmanager
```

Video Adicional:
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Personalización de KDE Parte 1 Diseño, Tema, Kvantum, mejores prácticas!](https://www.youtube.com/watch?v=vdlj83sb84s&t=1240s)

#### Cortafuegos
La configuración predeterminada puede bloquear el acceso a impresoras y otros dispositivos en tu red local.
Aquí tienes un enlace útil para ayudarte: https://www.dsfc.net/infra/securite/configurer-firewalld/
```
sudo pacman -S --needed --noconfirm firewalld python-pyqt5 python-capng
sudo systemctl enable --now firewalld.service
firewall-applet &
```

#### Reflector para actualizaciones automáticas de espejos

```
yay -S reflector-simple
```

Un comando para generar una lista de espejos, se debe realizar una vez después de la primera instalación y repetirse si viajas, cambias de país, si encuentras la descarga de paquetes lenta, o si encuentras un error que te dice que un espejo está caído:

```
sudo reflector --score 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist
```

#### Timeshift

- [Timeshift](https://github.com/linuxmint/timeshift) es una utilidad de Linux de código abierto para crear copias de seguridad de todo tu sistema.

**/!\ ATENCIÓN: por defecto, solo se guarda el sistema, no tu carpeta de usuario (el /home/)! /!\\**


```
yay -S timeshift
```

- Evita timeshift y btrfs en Arch, ya he tenido problemas [casse](https://github.com/linuxmint/timeshift).

    *“Las capturas de BTRFS solo son compatibles en sistemas BTRFS con un diseño de subvolumen tipo Ubuntu”*

- Para disfrutar de las copias de seguridad automáticas, necesitarás iniciar cronie. (opcional)

  ```
  sudo systemctl enable --now cronie
  ```

#### Fish

[Fish](https://fishshell.com/) es una shell de línea de comandos diseñada para ser interactiva y fácil de usar. Consulta también [ArchWiki](https://wiki.archlinux.org/title/fish) sobre el tema. Reemplaza la shell predeterminada, bash.

- Instalar fish.
    ```
    yay -S fish                       # 1. instalar fish
    chsh -s /usr/bin/fish             # 2. Configúrala como predeterminada.
    fish                              # 3. Ejecuta fish o reinicia y será la predeterminada.
    fish_update_completions           # 4. Actualiza completions.
    set -U fish_greeting              # 5. Elimina el mensaje de bienvenida.
    kate ~/.config/fish/config.fish   # 6. Crea un alias como en bash al principio de este tutorial.
    ```
- Luego agrega los siguientes alias entre if y end:
    ```
    alias update-arch='yay -Syu && flatpak update'
    ```
    ```
    alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'
    ```
    ```
    alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* y sudo pacman-key --init y sudo pacman-key --populate y sudo pacman -Sy --noconfirm archlinux-keyring y sudo pacman --noconfirm -Su'
    ```
- ***Reinicia a menos que se haya hecho en el paso 3***, los alias de cualquier tipo solo funcionan después de reiniciar el terminal.



## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/game-console.png" width="30" height="30"> **Mejora Tu Experiencia de Juego** <a name="gaming"/>

### Steam
Ten en cuenta que los controladores de AMD o Nvidia deben instalarse previamente como se menciona en la sección [SOPORTE DE HARDWARE](#HARDWARE-SUPPORT).
```
yay -S steam
```

### Lutris

Lutris es un gestor de juegos FOSS (Free, Open Source) para sistemas operativos basados en Linux.
Lutris permite buscar un juego o una plataforma (Ubisoft Connect, EA Store, GOG, Battlenet, etc.) y propone un guion de instalación que configurará lo necesario para que tu elección funcione con Wine o Proton.

```
sudo pacman -S --needed lutris wine-staging
```

Video Adicional:
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Configuración de Lutris para laptop Intel/Nvidia ](https://www.youtube.com/watch?v=Am3pgTXiUAA)

### Soporte avanzado para controladores

Controlador avanzado de Linux para controladores inalámbricos Xbox 360|One|S|X (incluidos con Xbox One S) y muchos otros controladores como 8bitdo ([xpadneo](https://github.com/atar-axis/xpadneo)) ([xone](https://github.com/medusalix/xone))

```
yay -S --needed xpadneo-dkms 
```
Controlador avanzado de Linux para controladores PS4/PS5
```
yay -S --needed ds4drv dualsensectl
```

### Mostrando el rendimiento en juegos

[MangoHud](https://wiki.archlinux.org/title/MangoHud) es una superposición para Vulkan y OpenGL que permite monitorear el rendimiento del sistema dentro de aplicaciones y grabar métricas para evaluaciones comparativas.
Es la herramienta que necesitas si quieres ver tus FPS en juegos, la carga de tu CPU o GPU, etc. O incluso grabar estos resultados en un archivo.
Aquí, instalamos GOverlay que es una interfaz gráfica para configurar MangoHud.

```
yay -S goverlay --needed
```

### Mejorando la compatibilidad de juegos de Windows

Incrementamos el valor por defecto de esta variable, permitiendo almacenar más "áreas de mapeo de memoria". El valor por defecto es muy bajo. El objetivo es mejorar la compatibilidad con juegos de Windows a través de Wine o Steam (Ver [ProtonDB](https://www.protondb.com/)), sabiendo que algunos juegos mal optimizados tienden a alcanzar rápidamente este límite, lo que puede resultar en un fallo.

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Gaming LINUX supprimer les crashs / augmenter la compatibilité](https://youtu.be/sr4RgshrUYY)

- Agregar en:

  ```
  kate /etc/sysctl.d/99-sysctl.conf
  ``` 
    la línea siguiente:
      ` 
      vm.max_map_count=16777216
      `


## <img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/speed.png" width="30" height="30"> **Optimización de Precisión**: <a name="optimization"/>

### [Kernel TKG](https://github.com/Frogging-Family/linux-tkg)

> [!ADVERTENCIA]
> Este paso está destinado a usuarios avanzados :star:

[TKG](https://github.com/Frogging-Family) es una compilación de kernel altamente personalizable que proporciona una selección de arreglos y ajustes para mejorar el rendimiento en escritorio y juegos.

Vídeo relacionado:
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Kernel TKG on Arch + Boost its perfs](https://youtu.be/43yYIWMnDJA)
```
git clone https://github.com/Frogging-Family/linux-tkg.git
cd linux-tkg
makepkg -si
```

### [MESA-TKG](https://github.com/Frogging-Family/mesa-git)

> [!ADVERTENCIA]
> Este paso está destinado a usuarios avanzados :star:

Al igual que el kernel TKG, pero para Mesa, una versión parcheada para añadir algunos arreglos y optimizaciones.
Muy útil para jugadores con AMD, sin interés para jugadores con Nvidia.
```
git clone https://github.com/Frogging-Family/mesa-git.git
cd mesa-git
makepkg -si
```
Decir sí a todo para sobrescribir todo con nuevos paquetes.

### [NVIDIA-ALL](https://github.com/Frogging-Family/nvidia-all)

> [!ADVERTENCIA]
> Este paso está destinado a usuarios avanzados :star:

Nvidia-all es una integración del controlador nvidia por TKG. Incluye parches de soporte para nuevos kernels. Te permite seleccionar la versión del controlador que deseas instalar, ya sea la última versión oficial, una versión beta, la versión Vulkan, etc.

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [You're using Arch and Nvidia check this out!](https://youtu.be/T0laE8gPtfY)
```
git clone https://github.com/Frogging-Family/nvidia-all.git
cd nvidia-all
makepkg -si
```

Decir sí a todo para sobrescribir todo con nuevos paquetes.


### Instalación de [Flatpak](https://wiki.archlinux.org/title/Flatpak)

Anteriormente conocido como xdg-app, es una utilidad de despliegue de software y gestión de paquetes para sistemas operativos basados en Linux. Se promociona como una oferta de un entorno "sandbox" en el cual los usuarios pueden ejecutar software aislado del resto del sistema.

<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [MangoHUD, Goverlay, Steam, Lutris FLATPAK!](https://www.youtube.com/watch?v=1dha2UDSF4M)
```
yay -S flatpak flatpak-kcm
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install com.bitwarden.desktop com.discordapp.Discord com.github.tchx84.Flatseal com.gitlab.davem.ClamTk com.heroicgames
```

## Fuentes <a name="community"/>

Fuentes y enlaces útiles :
- [ArchWiki](https://wiki.archlinux.org/)
<img src="https://github.com/Cardiacman13/Tuto-Arch/blob/main/assets/images/Cardiac-icon.png" width="30" height="30"> [Funcionamiento del WIKI de Arch.](https://www.youtube.com/watch?v=TQ3A9l2N5lI)
- [Sitio GLF](https://www.gaminglinux.fr/)
- [Discord de GLF](http://discord.gg/EP3Jm8YMvj)
- [Mi canal de Youtube](https://www.youtube.com/@Cardiacman)

## Contribución

¡Las contribuciones a este proyecto son bienvenidas! Si tienes sugerencias, informes de errores o contribuciones, por favor abre una issue o una pull request.

Como puedes ver, este proyecto está disponible en francés, inglés y español. ¡Los traductores son más que bienvenidos! :people_holding_hands:

<!-- readme: contributors -start -->
<!-- readme: contributors -end -->
