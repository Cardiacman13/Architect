# 🚀 ARCHITECT SCRIPT

[🇫🇷 Passer à la version française](#script-architect-fr)  
[📚 Architect Wiki](https://github.com/Gaming-Linux-FR/Architect/wiki)

A powerful post-install script designed to set up a complete and ready-to-use **Arch Linux system** right after using `archinstall`. Optimized for **gamers and advanced users**, this script provides modular configuration options, minimal bloat, and performance in mind.

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

> 🧠 **Note:** If you are using an **NVIDIA GPU**, it must be from the **16xx or RTX series (Turing or newer)**. If you own a GTX 1000 or earlier, simply run:  
> `sudo pacman -S nvidia-dkms` after the script to replace `nvidia-open-dkms`.

---

## ⚙️ Installation Command

```bash
sudo pacman -S --needed git base-devel \
  && git clone https://github.com/Gaming-Linux-FR/Architect.git ~/Architect \
  && cd ~/Architect \
  && chmod +x ./architect.sh \
  && ./architect.sh
```

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
3. **GPU Configuration** — Fully automated NVIDIA/AMD/Intel detection and setup.
4. **Desktop Environment** — Choose from GNOME, KDE Plasma, XFCE, or i3.
5. **AUR Support** — Auto-install `yay` or `paru`, depending on your preference.
6. **Optional Components** — Printers, Firewall, Bluetooth, Sound, etc.
7. **Extra Software** — Browsers, games, apps, media tools, and more.

---

## 🔗 Resources

- 📖 [ArchWiki](https://wiki.archlinux.org/)
- 🌐 [Gaming Linux FR](https://www.gaminglinux.fr/)
- 💬 [Discord Community](http://discord.gg/EP3Jm8YMvj)
- ▶️ [YouTube Channel (Cardiacman)](https://www.youtube.com/@Cardiacman)

---

<a name="script-architect-fr"></a>

# 🚀 SCRIPT ARCHITECT

Un script post-installation pour **Arch Linux**, destiné à configurer rapidement un système propre après `archinstall`. Pensé pour les joueurs et les utilisateurs avancés recherchant **performance, minimalisme et flexibilité**.

---

> ⚠️ **AVERTISSEMENT**  
> Ce script est tiré de notes personnelles. Il fonctionne parfaitement sur ma machine, mais **n'est garanti sur aucun autre système**.
>
> Ce n'est **pas une distribution**, mais un script pour **gagner du temps après l'installation**. Vous restez responsable de la maintenance de votre système.
>
> Arch Linux est une **distribution DIY**. Il est indispensable de savoir lire la documentation, comprendre ce que vous faites et être autonome en cas de souci.
>
> > 📌 Extrait du [Wiki officiel Arch Linux](https://wiki.archlinux.org/title/Arch_Linux_(Fran%C3%A7ais)) :  
> > _"Tandis que de nombreuses distributions GNU/Linux tentent d’être plus conviviales, Arch Linux a toujours été et restera centrée sur l’utilisateur. Elle est destinée aux utilisateurs compétents ou ayant une mentalité de bricoleur prêt à lire la documentation et à résoudre ses propres problèmes."_  
> >
> > Être sous Arch sans lire la doc, c’est aller à l’encontre de son principe.

> 💡 **Important :** Si vous utilisez une carte **NVIDIA**, elle doit être de génération **GTX 16xx ou RTX**. Si vous avez une **GTX 1000 ou plus ancienne**, exécutez simplement :  
> `sudo pacman -S nvidia-dkms` après le script pour remplacer `nvidia-open-dkms`.

---

## Le grand minimum à savoir pour utiliser Arch Linux : 

[Arch Linux - les bonnes pratiques avec Antiz !](https://youtu.be/4CiGmS3UM3Y?si=FARbltfaw2oXVBpO)
[![Arch Linux - les bonnes pratiques avec Antiz !](https://img.youtube.com/vi/4CiGmS3UM3Y/0.jpg)](https://youtu.be/4CiGmS3UM3Y?si=FARbltfaw2oXVBpO)

---

## 🧠 Lancer le Script

```bash
sudo pacman -S --needed git base-devel \
  && git clone https://github.com/Gaming-Linux-FR/Architect.git ~/Architect \
  && cd ~/Architect \
  && chmod +x ./architect.sh \
  && ./architect.sh
```

Vous pouvez ensuite supprimer le dossier `~/Architect`.

---

## 🧩 Fonctions Principales

1. **Configurer Pacman** — Amélioration du gestionnaire de paquets.
2. **Ajout d'Aliases** — Commandes utiles :
   - `update-arch`
   - `clean-arch`
   - `fix-key`
   - `update-mirrors`
3. **Configuration GPU** — Support complet pour NVIDIA, AMD, Intel.
4. **Choix d’Environnement** — GNOME, KDE Plasma, XFCE, i3wm.
5. **Support AUR** — Installe automatiquement `yay` ou `paru`.
6. **Composants Optionnels** — Imprimantes, Firewall, Bluetooth, Audio, etc.
7. **Installation de Logiciels** — Navigateur, multimédia, développement, gaming.

---

## 🔗 Ressources

- 📖 [ArchWiki](https://wiki.archlinux.org/)
- 🌐 [Site GLF](https://www.gaminglinux.fr/)
- 💬 [Discord GLF](http://discord.gg/EP3Jm8YMvj)
- ▶️ [Chaîne YouTube Cardiacman](https://www.youtube.com/@Cardiacman)

---

## 🙏 Remerciements

Merci à l'équipe d'Arch Linux, à la communauté, aux mainteneurs AUR et à tous les contributeurs.  
Merci au Discord GLF pour les retours, tests et soutiens.
