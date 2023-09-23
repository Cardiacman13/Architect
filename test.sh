de_detector() {
    local de=""
    if [ "$XDG_CURRENT_DESKTOP" ]; then
        de=$XDG_CURRENT_DESKTOP
    elif [ "$GDMSESSION" ]; then
        de=$GDMSESSION
    elif [ "$DESKTOP_SESSION" ]; then
        de=$DESKTOP_SESSION
    fi
    echo $de
}

de_detector

#!/bin/bash

# Chemin vers le fichier pacman.conf
pacman_conf="/etc/pacman.conf"

# Vérifie si multilib est déjà activé
if grep -q "^\[multilib\]" "$pacman_conf"; then
    echo "Multilib est déjà activé."
    exit 0
fi

# Active multilib si ce n'est pas déjà le cas
#!/bin/bash

pacman_conf="/etc/pacman.conf"

# Vérifier si multilib est déjà activé
if grep -q "^\[multilib\]" "$pacman_conf" && ! grep -q "^#Include = /etc/pacman.d/mirrorlist" "$pacman_conf"; then
    echo "Multilib est déjà activé."
    exit 0
fi

# Activer multilib s'il n'est pas déjà activé
if grep -q "^#\[multilib\]" "$pacman_conf"; then
    echo "Activation de multilib..."
    sudo sed -i '/^#\[multilib\]/,/^#Include = \/etc\/pacman.d\/mirrorlist/ s/^#//' "$pacman_conf"
    echo "Multilib a été activé. Mettez à jour la base de données des paquets avec 'sudo pacman -Sy'."
else
    echo "Les entrées pour multilib sont introuvables dans $pacman_conf."
    exit 1
fi
