# Chapitre 1 : Fondations & Démarrage Rapide

**📚 Cours** : [AZD Pour Débutants](../../README.md) | **⏱️ Durée** : 30-45 minutes | **⭐ Complexité** : Débutant

---

## Vue d'ensemble

Ce chapitre introduit les fondamentaux d'Azure Developer CLI (azd). Vous apprendrez les concepts principaux, installerez les outils et déploierez votre première application sur Azure.

> Validé avec `azd 1.25.6` en juin 2026.

## Objectifs d'apprentissage

En complétant ce chapitre, vous allez :
- Comprendre ce qu'est Azure Developer CLI et en quoi il diffère d'Azure CLI
- Installer et configurer AZD sur votre plateforme
- Déployer votre première application sur Azure avec `azd up`
- Nettoyer les ressources avec `azd down`

---

## 📚 Leçons

| # | Leçon | Description | Temps |
|---|--------|-------------|------|
| 1 | [Notions de base d'AZD](azd-basics.md) | Concepts clés, terminologie, et structure de projet | 15 min |
| 2 | [Installation & Configuration](installation.md) | Guides d'installation spécifiques à la plateforme | 10 min |
| 3 | [Votre premier projet](first-project.md) | Pratique : déployer une application web sur Azure | 20 min |
| 4 | [Apportez votre propre app](bring-your-own-app.md) | Ajouter azd à un projet existant que vous avez déjà | 15 min |
| 5 | [Conteneurs de développement & Codespaces](dev-containers.md) | Environnements azd reproductibles avec des conteneurs dev | 15 min |

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

Si le script signale des outils manquants, corrigez-les d'abord puis continuez avec le chapitre.

---

## 🚀 Démarrage rapide

```bash
# Vérifier l'installation
azd version

# Authentifier pour AZD
# Facultatif : az login si vous prévoyez d'exécuter directement des commandes Azure CLI
azd auth login

# Déployez votre première application
azd init --template todo-nodejs-mongo
azd up

# Nettoyez une fois terminé
azd down --force --purge
```

---

## ✅ Critères de réussite

Après avoir complété ce chapitre, vous devriez être capable de :

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
| **Suivant** | [Chapitre 2 : Développement axé sur l'IA](../chapter-02-ai-development/README.md) |
| **Passer à** | [Chapitre 3 : Configuration](../chapter-03-configuration/README.md) |

---

## 📖 Ressources associées

- [Fiche de commandes](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossaire](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->