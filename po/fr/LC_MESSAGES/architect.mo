��    �        �   �	      H  C   I  #   �     �     �  V   �  "   F  -   i  '   �  �   �  .   Q  #   �  <   �  8   �  I     +   d  (   �  $   �  ;   �       *   2  %   ]  )   �  )   �  +   �  2     8   6  (   o     �  ,   �     �  4   �  $   0     U     m     v  %   �  &   �     �     �  6        M  3   l     �     �     �     �  #     $   ,  _   Q  �   �  a   R  1   �     �  #         (     I  $   g  ,   �     �     �     �     �            !   *  (   L     u  &   �  #   �  !   �      �  $        A     _     z     �     �      �     �            4   .  (   c     �     �     �     �     �     �     �          (     7     S     a  '   }     �  1   �  G   �  *   8  	   c     m  <   �  K   �          !  "   =  )   `  "   �  +   �  '   �          !     3     J     j     �  &   �      �     �          *     ?  9   S     �  J   �     �     	            .      K   6   ^      �      �      �   2   �      !  !   !     >!     ^!     z!     �!  /   �!  !   �!  5   �!  ?   ,"  �   l"  ~   H#  f   �#     .$     M$     j$     �$     �$     �$     �$     �$  =  �$  D   �%  $   D&     i&      �&  d   �&  "   '  2   1'  6   d'  �   �'  -   B(  *   p(  >   �(  =   �(  O   )  /   h)  /   �)  3   �)  H   �)      E*  0   f*  +   �*  /   �*  /   �*  1   #+  6   U+  <   �+  +   �+  /   �+  3   %,     Y,  ?   q,  7   �,     �,     -  %   -  5   6-  2   l-      �-     �-  S   �-  (   0.  A   Y.  "   �.     �.  '   �.  #   �.  :   !/  $   \/  s   �/  �   �/  b   �0  >   1  #   T1  '   x1  (   �1  %   �1  +   �1  1   2  !   M2     o2     �2     �2     �2     �2  '   �2  .   3     B3  ,   a3  )   �3  '   �3  &   �3  *   4  "   24     U4  $   u4     �4     �4  (   �4  3   �4     15     I5  K   f5  9   �5      �5     6     '6     B6     Y6     m6     |6     �6     �6  .   �6     �6  (   7  +   -7  %   Y7  =   7  z   �7  :   88  	   s8     }8  E   �8  Y   �8  !   59  #   W9  .   {9  5   �9  +   �9  /   :  -   <:  +   j:     �:     �:      �:  (   �:  %   ;  4   :;  ,   o;  )   �;  "   �;     �;     <  P   <     l<  t   �<     �<     =     .=  )   H=     r=  B   �=     �=     �=     >  @   >  &   X>  3   >  %   �>     �>     �>     
?  5   *?  +   `?  >   �?  P   �?  �   @  �   A  �   �A  &   EB     lB     �B     �B     �B  +   �B     �B     �B         �   ?       R   '   K   M   I   t   �   �   6       9   /   0   z   o   4                     �   b      
   !      �      A   f   �   �   �       v   $       E       j      \   {   B   O   )       W   2          a       S          �   C   r   T   `       m   ,   �               �   8          [   h   H   �         n   ^      ;   :          �   1   <   �   	   3   e   s   d      �           V   U   �           c   y   @       �   L   Y       P       =   Q   N       _   i      �           >   �   �   "   �   *   #   D           5               �   ]          �              ~   (               �           %       l   -       Z   p           J   �          X   k   �   �      g   |   �       .   w       G   F   �       7   x       }      �   +                  u   q   &             �                    --no-reboot  : Do not reboot the system at the end of the script.   -h --help    : Display this help.   -v --verbose : Verbose mode.  ${RED}(might be long)${RESET} ${BLUE}::${RESET} Packages to install (e.g., 1 2 3, 1-3, all or press enter to skip):  ${GREEN}${software_type}${RESET} : ${GREEN}Restarting in ${i} seconds...${RESET} ${GREEN}Root privileges granted${RESET} ${GREEN}Script completed successfully, the system must restart${RESET}: Press ${GREEN}Enter${RESET} to restart or ${RED}Ctrl+C${RESET} to cancel. ${GREEN}Script completed successfully.${RESET} ${GREEN}You chose ${choice}${RESET} ${GREEN}[I]${RESET} Package ${package} is already installed. ${GREEN}[U]${RESET} Package ${package} is not installed. ${RED}Do not run this script as root, use a user with sudo rights${RESET} ${RED}Error: No Internet connection${RESET} ${RED}Error: installation failed${RESET} ${RED}Root privileges denied${RESET} ${RED}This script will make changes to your system.${RESET} AUR helper installation Add the current user to the gamemode group Add the current user to the kvm group Add the current user to the libvirt group Add the current user to the plugdev group Add the current user to the vboxusers group Adding 'discover' to IgnorePkg in /etc/pacman.conf Adding 'gnome-software' to IgnorePkg in /etc/pacman.conf Adding NVIDIA modules to mkinitcpio.conf Adding user to necessary groups Allowing pacman without password temporarily Apparmor installation Applying sysctl memory and kernel performance tweaks Auto-updating Git-based AUR packages Bluetooth configuration Browsers Checking if GRUB is installed Clean old nvidia drivers dependencies Cleaning old sound server dependencies Creating /etc/pacman.d/hooks Creating /etc/sddm.conf Creating NVIDIA udev rule for runtime power management Creating pacman hook directory Creating pacman hook for NVIDIA module regeneration Creating update-mirrors script Desktop Apps Desktop environment detection Detected desktop environment: Disable GDM rules to unlock Wayland Do you have an Intel/Nvidia Laptop ? Do you want to install and setup grub-btrfs and timeshift ${RED}say No if unsure${RESET} /!\  ? Do you want to install apparmor security module /!\ Install and activate apparmor? This is a layer with MAC model (high security, but can cause access problems) Do you want to install oh-my-zsh ? This will install the default oh-my-zsh's .zshrc configuration Do you want to upload the log file to a pastebin? Do you want to use Bluetooth? Do you want to use PS5 controllers? Do you want to use a HP printer? Do you want to use a printer? Do you want to use an EPSON printer? Done in ${GREEN}${duration}${RESET} seconds. Enable arch-update tray Enable arch-update.timer Enable cronie Enable grub-btrfsd Enable libvirtd Enable vboxweb Enabling BottomUp option for paru Enabling CombinedUpgrade option for paru Enabling NVIDIA services Enabling NewsOnUpgrade option for paru Enabling SkipReview option for paru Enabling SudoLoop option for paru Enabling SudoLoop option for yay Enabling UpgradeMenu option for paru Enabling avahi-daemon service Enabling bluetooth service Enabling color in pacman Enabling cups service Enabling multilib repository Enabling multithread compilation Enabling numlock on startup Enabling os-prober Enabling paccache timer Enabling parallel downloads and ILoveCandy in pacman Enabling verbose package lists in pacman Environment configuration Firewall installation Gamepad configuration Gaming Software Image Editors Initialization Installing git Installing pacman-contrib Invalid choice Kernel headers installation Kernel tweaks Log file uploaded to ${url} Making update-mirrors script executable Mirrorlist configuration NVIDIA modules already present in mkinitcpio.conf No supported DE detected (GNOME, KDE, XFCE). Skipping DE configuration. No valid bootloader detected, skipping ... Options : Pacman configuration Please read the message carefully and type 'yes' to confirm. Press ${GREEN}Enter${RESET} to continue, or ${RED}Ctrl+C${RESET} to cancel. Printer configuration Reloading sysctl parameters Removing existing NVIDIA udev rule Removing existing Nvidia pacman hook file Removing existing nvidia.conf file Removing existing sysctl performance tweaks Removing existing update-mirrors script Removing temporary sudoers rule Running os-prober Running update-mirrors Script Architect for Arch Linux Setting Breeze theme for SDDM Setting Numlock=on for SDDM Setting advanced NVIDIA module options Setting default shell to fish... Setting default shell to zsh... Setting gtk theme to adw-gtk3 Setting up GRUB hook Shell configuration Skipping AppArmor installation due to invalid bootloader. Software installation Some steps may take longer, depending on your Internet connection and CPU. Sound server configuration System Software System configuration System loaders configuration System preparation Type 'yes' to confirm you have read the above message: Uninstall discover Uninstall gnome-software Updating GRUB Updating full system ${RED}(might be long)${RESET} Updating user directories Uploading log file to pastebin... Usage : ./architect.sh [OPTION] Useful package installation Video Software Video drivers installation What is your default shell ? (bash/zsh/fish) :  What is your graphics card type ? Which AUR helper do you want to install? (yay/paru):  Would you like to install ROCM (${RED}say No if unsure${RESET}) Would you like to install a firewall? /!\ WARNING: This script can install and enable either Firewalld or UFW. The default configuration may block local network devices such as printers or block some software functions. Would you want to install Xone? (Can improve Xbox gamepad support with a USB wireless dongle. ${RED}Say No if unsure.${RESET}) Would you want to install xpadneo? (Can improve Xbox gamepad support. ${RED}Say No if unsure.${RESET}) You chose to install oh-my-zsh activation of VBoxClient-all activation of vboxservice all n setup grub-btrfsd for timeshift sysctl kernel tweaks y Project-Id-Version: Architect V2.0.4
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2023-12-31 17:53+0100
Last-Translator: Skythrew <mael.guerin@murena.io>
Language-Team: French
Language: fr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n > 1);
   --no-reboot  : Ne pas redémarrer le système à la fin du script.   -h --help    : Affiche cette aide.   -v --verbose : Mode verbeux.  ${RED}(peut être long)${RESET} ${BLUE}::${RESET} Paquets à installer (e.g., 1 2 3, 1-3, tous ou appuyez sur Entrée pour passer):  ${GREEN}${software_type}${RESET} : ${GREEN}Redémarrage dans ${i} secondes...${RESET} ${GREEN}Privilèges d'administrateur accordés${RESET} ${GREEN}Script terminé avec succès, le système doit redémarrer${RESET}: Appuyez sur ${GREEN}Entrée${RESET} pour redémarrer ou ${RED}Ctrl+C${RESET} pour annuler. ${GREEN}Script terminé avec succès.${RESET} ${GREEN}Vous avez choisi ${choice}${RESET} ${GREEN}[I]${RESET} Le paquet ${package} est déjà installé. ${GREEN}[U]${RESET} Le paquet ${package} n'est pas installé. ${RED}N'exécutez pas ce script en root, utilisez un utilisateur sudoer${RESET} ${RED}Erreur: Pas de connexion Internet${RESET} ${RED}Erreur: l'installation a échoué${RESET} ${RED}Privilèges d'administrateur refusés${RESET} ${RED}Ce script va effectuer des changements sur votre système.${RESET} Installation du gestionnaire AUR Ajout de l'utilisateur actuel au groupe gamemode Ajout de l'utilisateur actuel au groupe kvm Ajout de l'utilisateur actuel au groupe libvirt Ajout de l'utilisateur actuel au groupe plugdev Ajout de l'utilisateur actuel au groupe vboxusers Ajout de 'discover' à IgnorePkg dans /etc/pacman.conf Ajout de 'gnome-software' à IgnorePkg dans /etc/pacman.conf Ajout des modules NVIDIA à mkinitcpio.conf Ajout de l'utilisateur aux groupes nécessaires Autorisation temporaire de pacman sans mot de passe Installation d'AppArmor Application des optimisations sysctl de la mémoire et du noyau Mise à jour automatique des paquets AUR basés sur Git Configuration du bluetooth Navigateurs Vérification de la présence de GRUB Nettoyage des dépendances des anciens pilotes NVIDIA Nettoyage des dépendances de l'ancien serveur son Création de /etc/pacman.d/hooks Création de /etc/sddm.conf Création de la règle udev NVIDIA pour la gestion de l'alimentation en temps réel Création du répertoire de hooks pacman Création du hook pacman pour la régénération du module NVIDIA Création du script update-mirrors Applications de bureau Détection de l'environnement de bureau Environnement de bureau détecté : Désactivation des règles GDM pour déverrouiller Wayland Avez-vous un portable Intel/Nvidia ? Voulez-vous installer et configurer grub-btrfs et timeshift ${RED}dites Non si vous n'êtes pas sûr${RESET} /!\  ? Voulez-vous installer le module de sécurité apparmor /!\ Installer et activer apparmor ? C'est une couche avec un modèle MAC (haute sécurité, mais peut causer des problèmes d'accès) Voulez-vous installer oh-my-zsh ? Cela installera la configuration .zshrc par défaut de oh-my-zsh Voulez-vous téléverser le fichier journal vers un pastebin ? Voulez-vous utiliser le bluetooth ? Voulez-vous utiliser des manettes PS5 ? Voulez-vous utiliser une imprimante HP ? Voulez-vous utiliser une imprimante ? Voulez-vous utiliser une imprimante EPSON ? Terminé en ${GREEN}${duration}${RESET} secondes. Activation du plateau arch-update Activation de arch-update.timer Activation de cronie Activation de grub-btrfsd Activation de libvirtd Activation de vboxweb Activation de l'option BottomUp de paru Activation de l'option CombinedUpgrade de paru Activation des services NVIDIA Activation de l'option NewsOnUpgrade de paru Activation de l'option SkipReview de paru Activation de l'option SudoLoop de paru Activation de l'option SudoLoop de yay Activation de l'option UpgradeMenu de paru Activation du service avahi-daemon Activation du service bluetooth Activation de la couleur dans pacman Activation du service cups Activation du dépôt multilib Activation de la compilation multithread Activation du verrouillage numérique au démarrage Activation de os-prober Activation du timer paccache Activation des téléchargements en parallèle et du ILoveCandy dans pacman Activation des listes de paquets détaillées dans pacman Configuration de l'environnement Configuration du pare-feu Configuration des manettes Applications de Gaming Editeurs d'image(s) Initialisation Installation de git Installation de pacman-contrib Choix invalide Installation des en-têtes (headers) du kernel Optimisations du noyau Fichier journal téléversé vers ${url} Rendre le script update-mirrors exécutable Configuration de la liste des miroirs Les modules NVIDIA sont déjà présents dans mkinitcpio.conf Aucun environnement de bureau supporté détecté (GNOME, KDE, XFCE). Configuration de l'environnement de bureau ignorée. Aucun chargeur de démarrage valide détecté, ignoré ... Options : Configuration de pacman Veuillez lire attentivement le message et tapez 'yes' pour confirmer. Appuyez sur ${GREEN}Entrée${RESET} pour continuer, ou ${RED}Ctrl+C${RESET} pour annuler. Configuration de(s) imprimante(s) Rechargement des paramètres sysctl Suppression de la règle udev NVIDIA existante Suppression du fichier de hook pacman Nvidia existant Suppression du fichier nvidia.conf existant Suppression des optimisations sysctl existantes Suppression du script update-mirrors existant Suppression de la règle temporaire sudoers Exécution d'os-prober Exécution de update-mirrors Script Architect pour Arch Linux Mise en place du thème Breeze pour SDDM Mise en place de Numlock=on pour SDDM Configuration des options avancées du module NVIDIA Changement du shell par défaut vers fish... Changement du shell par défaut en zsh... Changement du thème vers adw-gtk3 Configuration du hook GRUB Configuration du shell Installation d'AppArmor ignorée en raison d'un chargeur de démarrage invalide. Installation de logiciels Quelques étapes prendront peut-être plus de temps, en fonction de votre connexion Internet et de votre processeur. Configuration du serveur son Applications Système Configuration du système Configuration des chargeurs de démarrage Préparation du système Tapez 'yes' pour confirmer que vous avez lu le message ci-dessus : Désinstaller discover Désinstaller gnome-software Mise à jour de GRUB Mise à jour du système complet ${RED}(peut être long)${RESET} Mise à jour des dossiers utilisateurs Téléversement du fichier journal vers pastebin... Utilisation : ./architect.sh [OPTION] Installation des paquets utiles Logiciels vidéo Installation des pilotes vidéo Quel est votre shell par défaut ? (bash/zsh/fish) :  Quel est le type de votre carte graphique ? Quel gestionnaire AUR souhaitez-vous installer ? (yay/paru) :  Souhaitez-vous installer ROCM (${RED}dites Non si vous n'êtes pas sûr${RESET}) Voulez-vous installer un pare-feu ? /!\ ATTENTION : Ce script peut installer et activer soit Firewalld, soit UFW. La configuration par défaut peut bloquer les appareils du réseau local comme les imprimantes ou bloquer certaines fonctions logicielles. Voulez-vous installer Xone ? (Peut améliorer le support des manettes xbox quand elles utilisent un dongle usb sans fil, ${RED}dites Non si vous n'êtes pas sûr${RESET}) Voulez-vous installer xpadneo ? (Peut améliorer le support des manettes xbox, ${RED}dites Non si vous n'êtes pas sûr${RESET}) Vous avez choisi d'installer oh-my-zsh Activation de VBoxClient-all Activation du vboxservice tous n Configuration de grub-btrfsd pour timeshift Optimisations sysctl du noyau o 