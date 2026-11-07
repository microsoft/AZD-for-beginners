# Chapitre 1 : Fondations & Démarrage Rapide

**📚 Cours** : [AZD Pour Débutants](../../README.md) | **⏱️ Durée** : 75-120 minutes incluant le premier déploiement ; les exercices supplémentaires prennent plus de temps | **⭐ Complexité** : Débutant

---

## Vue d'ensemble

Ce chapitre introduit les fondamentaux de l'Azure Developer CLI (azd). Vous apprendrez les concepts clés, installerez les outils, et déploierez votre première application sur Azure.

> Objectif de la revue de commandes et de configuration : `azd 1.37.2` (novembre 2026). La mise en service en direct d'Azure n'a pas été exécutée lors de la revue.

## Objectifs d'apprentissage

En complétant ce chapitre, vous allez :
- Comprendre ce qu'est Azure Developer CLI et en quoi il diffère d'Azure CLI
- Installer et configurer AZD sur votre plateforme
- Déployer votre première application sur Azure avec `azd up`
- Nettoyer les ressources avec `azd down`

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|-------|
| 1 | [Bases d'AZD](azd-basics.md) | Concepts clés, terminologie et structure du projet | 15 min |
| 2 | [Installation & Configuration](installation.md) | Guides d'installation spécifiques à la plateforme | 10 min |
| 3 | [Votre Premier Projet](first-project.md) | Pratique : Déployer une application web sur Azure | 20 min |
| 4 | [Intégrez Votre Propre Application](bring-your-own-app.md) | Ajouter azd à un projet existant que vous avez déjà | 15 min |
| 5 | [Conteneurs de Dév & Codespaces](dev-containers.md) | Environnements azd reproductibles avec conteneurs de dev | 15 min |

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

## 🚀 Démarrage Rapide

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Critères de réussite

Après avoir terminé ce chapitre, vous devriez être capable de :

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|----------|
| **Suivant** | [Chapitre 2 : Développement AI-First](../chapter-02-ai-development/README.md) |
| **Passer à** | [Chapitre 3 : Configuration](../chapter-03-configuration/README.md) |

---

## 📖 Ressources Associées

- [Fiche de Commandes](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossaire](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->