# 🚀 ARCHITECT SCRIPT

[🇫🇷 Passer à la version française](#script-architect-fr)  
[📚 Architect Wiki](https://github.com/Cardiacman13/Architect/wiki)

A post-install script designed to set up a complete and ready-to-use **Arch Linux system** right after using `archinstall`. Optimized for **gamers**, this script provides modular configuration options, minimal bloat, and performance in mind.

---

> ⚠️ **DISCLAIMER**  
> This script is derived from personal post-install notes and fully suits my hardware and needs. It has been thoroughly tested on my system but **comes with no warranty** for compatibility on your machine.
>
> This is not a distribution. It's a helper to **speed up post-installation**, and its maintenance is your responsibility.
>
> Arch Linux is a **DIY (Do It Yourself)** distribution. It assumes you have technical knowledge or are willing to read the documentation. If you're not self-sufficient, Arch is not for you.
>
> > 📌 From the [Arch Wiki](https://wiki.archlinux.org/title/Arch_Linux):  
> > _"While many GNU/Linux distributions attempt to be more user-friendly, Arch Linux has always been and will remain a user-centric distribution. It is designed for competent GNU/Linux users who are willing to read documentation and solve their own problems."_  
> >
> > Running Arch without reading documentation defeats its purpose.
> > 
> 🧠 **Note:** If you are using an **NVIDIA GPU**, it must be from the **16xx (Turing) series or newer** to use the **`nvidia-open-dkms`** driver (open kernel modules).  
>  
> If you own a **Pascal GTX 10xx** or an **older GPU** (e.g., **Maxwell**, **Kepler**, or earlier such as **GTX 9xx / 8xx / 7xx**), you need the **nvidia-580xx-dkms* from the AUR. [NVIDIA 590 driver drops Pascal and lower support](https://archlinux.org/news/nvidia-590-driver-drops-pascal-support-main-packages-switch-to-open-kernel-modules/)
---

## ⚙️ Installation Command

```bash
sudo pacman -S --needed git base-devel \
  && git clone https://github.com/Cardiacman13/Architect.git ~/Architect \
  && cd ~/Architect \
  && chmod +x ./architect.sh \
  && ./architect.sh
```

At the end of the script, you can delete the ~/Architect folder.

[🧠 Configure Arch the easy way - Architect Script by Cardiac](https://youtu.be/0MV3MxmO7ns?si=eOMc-e4wdSwv1Fbb)

[![Configure Arch the easy way](https://img.youtube.com/vi/0MV3MxmO7ns/0.jpg)](https://youtu.be/0MV3MxmO7ns?si=eOMc-e4wdSwv1Fbb)

---

## 🧩 Features Overview

1. **Pacman Setup** — Optimized package manager (parallel downloads, color, etc.)
2. **Shell Aliases** — Fast commands like:
   - `update-arch`
   - `clean-arch`
   - `fix-key`
   - `update-mirrors`
3. **Low Latency Scheduler for Gaming and Desktop** — Flash for intel P+E cores and LAVD for other CPU
4. **GPU Configuration** — NVIDIA/AMD/Intel setup.
5. **AUR Support** — Install `yay` or `paru`, depending on your preference.
6. **Optional Components** — Printers, Firewall, Bluetooth, Sound, etc.
7. **Extra Software** — Browsers, games, apps, media tools, and more.

---

## 🔗 Resources

- 📖 [ArchWiki](https://wiki.archlinux.org/)
- [📚 Architect Wiki](https://github.com/Cardiacman13/Architect/wiki)
---

<a name="script-architect-fr"></a>

# 🚀 SCRIPT ARCHITECT

Un script post-installation pour **Arch Linux**, destiné à configurer rapidement un système propre après `archinstall`. Pensé pour les joueurs recherchant **performance, minimalisme et flexibilité**.

---

> ⚠️ **AVERTISSEMENT**  
> Ce script est tiré de notes personnelles. Il fonctionne parfaitement sur ma machine, mais **n'est garanti sur aucun autre système**.
>
> Ce n'est **pas une distribution**, mais un script pour **gagner du temps après l'installation**. Vous restez responsable de la maintenance de votre système.
>
> Arch Linux est une **distribution DIY**. Il est indispensable de savoir lire la documentation, comprendre ce que vous faites et être autonome en cas de souci.
>
> > 📌 Extrait du [Wiki officiel Arch Linux](https://wiki.archlinux.org/title/Arch_Linux_(Fran%C3%A7ais)) :  
> > _"Tandis que de nombreuses distributions GNU/Linux tentent d’être plus conviviales, Arch Linux a toujours été et restera centrée sur l’utilisateur. Elle est destinée aux utilisateurs compétents ou ayant une mentalité de bricoleur prêt à lire la documentation et à résoudre ses propres problèmes."
> >
> > Être sous Arch sans lire la doc, c’est aller à l’encontre de son principe.
> > 
> 🧠 **Remarque :** Si vous utilisez un **GPU NVIDIA**, il doit appartenir à la série **16xx (Turing) ou plus récente** pour pouvoir utiliser le pilote **`nvidia-open-dkms`** (modules open source du noyau).  
>
> Si vous possédez une carte graphique **Pascal GTX 10xx** ou plus ancienne (par exemple **Maxwell**, **Kepler**, etc. comme les **GTX 9xx / 8xx / 7xx**), vous devez utiliser le **pilote nvidia-580xx-dkms** à la place disponible dans le AUR.[Le driver NVIDIA 590 abandonne le support de Pascal et des versions antérieures](https://archlinux.fr/accueil/le-driver-nvidia-590-abandonne-le-support-de-pascal-et-des-versions-anterieures-les-paquets-principaux-passent-aux-modules-open)

---

## Le grand minimum à savoir pour utiliser Arch Linux : 

[Arch Linux - les bonnes pratiques avec Antiz !](https://youtu.be/4CiGmS3UM3Y?si=FARbltfaw2oXVBpO)

[![Arch Linux - les bonnes pratiques avec Antiz !](https://img.youtube.com/vi/4CiGmS3UM3Y/0.jpg)](https://youtu.be/4CiGmS3UM3Y?si=FARbltfaw2oXVBpO)

---

## 🧠 Lancer le Script

```bash
sudo pacman -S --needed git base-devel \
  && git clone https://github.com/Cardiacman13/Architect.git ~/Architect \
  && cd ~/Architect \
  && chmod +x ./architect.sh \
  && ./architect.sh
```

À la fin du script, vous pouvez supprimer le dossier `~/Architect`.

---

## 🧩 Fonctions Principales

1. **Configurer Pacman** — Amélioration du gestionnaire de paquets.
2. **Ajout d'Aliases** — Commandes utiles :
   - `update-arch`
   - `clean-arch`
   - `fix-key`
   - `update-mirrors`
3. **Ordonnanceur Faible Latence Pour Jeux et Bureau** — Flash pour Intel P+E et LAVD pour les autres.
4. **Configuration GPU** — Support complet pour NVIDIA, AMD, Intel.
5. **Support AUR** — Installe `yay` ou `paru`.
6. **Composants Optionnels** — Imprimantes, Firewall, Bluetooth, Audio, etc.
7. **Installation de Logiciels** — Navigateur, multimédia, développement, .

---

## 🔗 Ressources

- 📖 [ArchWiki](https://wiki.archlinux.org/)
- [📚 Architect Wiki](https://github.com/Cardiacman13/Architect/wiki)

---

## 🙏 Remerciements

Merci à l'équipe d'Arch Linux, à la communauté Linux, aux mainteneurs AUR et à tous les contributeurs.
