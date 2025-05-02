# 🛠️ Guide de mise à jour des traductions (fichier `.po`) pour Architect

## 📁 Pré-requis
- Te placer **à la racine du projet `Architect`**
- Disposer des outils `gettext`, `msgmerge`, `msgfmt` installés (via `pacman -S gettext` sur Arch si besoin)

---

## 🔍 1. Extraire les nouvelles chaînes à traduire

Exécute les commandes suivantes :

```bash
echo '' > messages.po  # Crée un fichier vide requis par xgettext
find . -type f -iname "*.sh" | xgettext -j -f -  # Remplit messages.po avec les chaînes des scripts
```

👉 Cela va **créer ou mettre à jour `messages.po`** avec les nouvelles chaînes extraites des fichiers `.sh`.

---

## 🧩 2. Fusionner les nouvelles chaînes avec l'existant

```bash
msgmerge -N po/fr/fr.po messages.po > fr.po
```

🔁 Cela **fusionne les nouvelles chaînes dans le fichier de traduction `fr.po`**, en conservant celles déjà traduites.

---

## 💾 3. Remplacer l'ancien fichier `.po` par le nouveau

```bash
mv fr.po po/fr/fr.po
```

✅ Tu as maintenant un fichier `.po` mis à jour : `po/fr/fr.po`

---

## 🌍 4. Traduire

Ouvre le fichier :

```
po/fr/fr.po
```

➡️ Cherche les nouvelles chaînes **non traduites** (elles commencent par `msgstr ""`) et ajoute leur traduction.

---

## ⚙️ 5. Générer le fichier compilé `.mo`

```bash
msgfmt -o po/fr/LC_MESSAGES/architect.mo po/fr/fr.po
```

💡 Ce fichier `.mo` est celui utilisé réellement par ton programme pour afficher les traductions.

---

## 🎉 Et voilà !

Tu viens de terminer la mise à jour des traductions pour Architect.  
Répète ce processus à chaque fois que tu ajoutes ou modifies des chaînes dans tes scripts !
