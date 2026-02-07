# Chapitre 1 : Fondations et démarrage rapide

**📚 Cours**: [AZD For Beginners](../../README.md) | **⏱️ Durée**: 30-45 minutes | **⭐ Complexité**: Débutant

---

## Aperçu

Ce chapitre présente les fondamentaux de l'Azure Developer CLI (azd). Vous apprendrez les concepts de base, installerez les outils et déploierez votre première application sur Azure.

## Objectifs d'apprentissage

En terminant ce chapitre, vous pourrez :
- Comprendre ce qu'est Azure Developer CLI et en quoi il diffère d'Azure CLI
- Installer et configurer AZD sur votre plateforme
- Déployer votre première application sur Azure avec `azd up`
- Nettoyer les ressources avec `azd down`

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | Concepts de base, terminologie et structure du projet | 15 min |
| 2 | [Installation & Setup](installation.md) | Guides d'installation spécifiques à la plateforme | 10 min |
| 3 | [Your First Project](first-project.md) | Pratique : Déployer une application web sur Azure | 20 min |

---

## 🚀 Démarrage rapide

```bash
# Vérifier l'installation
azd version

# Se connecter à Azure
azd auth login

# Déployez votre première application
azd init --template todo-nodejs-mongo
azd up

# Nettoyez après avoir terminé
azd down --force --purge
```

---

## ✅ Critères de réussite

Après avoir terminé ce chapitre, vous devriez être capable de :

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
| **Aller à** | [Chapitre 3 : Configuration](../chapter-03-configuration/README.md) |

---

## 📖 Ressources associées

- [Aide-mémoire des commandes](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossaire](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Clause de non-responsabilité :
Ce document a été traduit à l'aide du service de traduction par IA [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle effectuée par un traducteur humain. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->