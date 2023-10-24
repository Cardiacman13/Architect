# Fonction pour lire la réponse de l'utilisateur, généralement utilisée pour les confirmations.
function read_user() {
    # Affiche le message passé en argument suivi de " (y/N) " pour guider l'utilisateur sur comment répondre.
    read -p "${1} (y/N) " answer

    # Vérifie si la réponse de l'utilisateur est "y" ou "Y".
    if [ "$answer" = "Y" ] || [ "$answer" = "y" ]; then
        # Si l'utilisateur a répondu par l'affirmative, retourne un code de succès (0).
        return 0
    else
        # Sinon, retourne un code d'échec (1).
        return 1
    fi
}
