# Chapitre 1 : Fondations & Démarrage Rapide

**📚 Cours** : [AZD Pour Débutants](../../README.md) | **⏱️ Durée** : 30-45 minutes | **⭐ Complexité** : Débutant

---

## Vue d'ensemble

Ce chapitre introduit les fondamentaux d'Azure Developer CLI (azd). Vous apprendrez les concepts clés, installerez les outils et déploierez votre première application sur Azure.

> Validé avec `azd 1.23.12` en mars 2026.

## Objectifs d'apprentissage

En terminant ce chapitre, vous serez capable de :
- Comprendre ce qu'est Azure Developer CLI et en quoi il diffère d'Azure CLI
- Installer et configurer AZD sur votre plateforme
- Déployer votre première application sur Azure avec `azd up`
- Nettoyer les ressources avec `azd down`

---

## 📚 Leçons

| # | Leçon | Description | Temps |
|---|--------|-------------|------|
| 1 | [Notions de base AZD](azd-basics.md) | Concepts clés, terminologie et structure de projet | 15 min |
| 2 | [Installation & Configuration](installation.md) | Guides d'installation spécifiques à la plateforme | 10 min |
| 3 | [Votre Premier Projet](first-project.md) | Pratique : Déployer une application web sur Azure | 20 min |

---

## ✅ Commencez ici : Validez votre configuration

Avant de commencer, confirmez que votre machine locale est prête pour le modèle du Chapitre 1 :

**Windows :**
```powershell
.\validate-setup.ps1
```

**macOS / Linux :**
```bash
bash ./validate-setup.sh
```

Si le script signale des outils manquants, corrigez cela d'abord puis continuez avec le chapitre.

---

## 🚀 Démarrage rapide

```bash
# Vérifier l'installation
azd version

# Authentifier pour AZD
# Optionnel : az login si vous prévoyez d'exécuter directement des commandes Azure CLI
azd auth login

# Déployez votre première application
azd init --template todo-nodejs-mongo
azd up

# Nettoyez une fois terminé
azd down --force --purge
```

---

## ✅ Critères de réussite

Après avoir terminé ce chapitre, vous devrez être capable de :

```bash
azd version              # Affiche la version installée
azd init --template todo-nodejs-mongo  # Initialise le projet
azd up                   # Déploie sur Azure
azd show                 # Affiche l'URL de l'application en cours d'exécution
azd down --force --purge # Nettoie les ressources
```

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|---------|
| **Suivant** | [Chapitre 2 : Développement orienté IA](../chapter-02-ai-development/README.md) |
| **Passer à** | [Chapitre 3 : Configuration](../chapter-03-configuration/README.md) |

---

## 📖 Ressources liées

- [Fiche des commandes](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossaire](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d’assurer l’exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant foi. Pour des informations critiques, une traduction professionnelle humaine est recommandée. Nous ne sommes pas responsables des malentendus ou erreurs d’interprétation résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->