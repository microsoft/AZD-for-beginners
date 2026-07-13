# Chapitre 4 : Infrastructure as Code & Déploiement

**📚 Cours** : [AZD Pour Débutants](../../README.md) | **⏱️ Durée** : 1-1.5 heures | **⭐ Complexité** : Intermédiaire

---

## Vue d'ensemble

Ce chapitre couvre les modèles Infrastructure as Code (IaC) avec des templates Bicep, la provision des ressources, et les stratégies de déploiement utilisant Azure Developer CLI.

> Validé avec `azd 1.27.1` en juillet 2026.

## Objectifs d'apprentissage

En complétant ce chapitre, vous allez :
- Comprendre la structure et la syntaxe des templates Bicep
- Provisionner des ressources Azure avec `azd provision`
- Déployer des applications avec `azd deploy`
- Mettre en œuvre des stratégies de déploiement blue-green et rolling

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|------|
| 1 | [Provisionnement des Ressources](provisioning.md) | Gestion des ressources Azure avec AZD | 45 min |
| 2 | [Guide de Déploiement](deployment-guide.md) | Stratégies de déploiement d’application | 45 min |
| 3 | [Créer Votre Propre Template](custom-templates.md) | Construire et publier des templates azd réutilisables | 30 min |

---

## 🚀 Démarrage Rapide

```bash
# Initialiser à partir du modèle
azd init --template azure-functions-python-v2-http

# Prévisualiser ce qui sera créé
azd provision --preview

# Fournir uniquement l'infrastructure
azd provision

# Déployer uniquement le code
azd deploy

# Ou les deux ensemble
azd up
```

---

## 📁 Structure du Projet AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Commandes Essentielles

| Commande | Description |
|---------|-------------|
| `azd init` | Initialiser le projet |
| `azd provision` | Créer des ressources Azure |
| `azd deploy` | Déployer le code de l’application |
| `azd up` | provision + déploiement |
| `azd down` | Supprimer toutes les ressources |

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|---------|
| **Précédent** | [Chapitre 3 : Configuration](../chapter-03-configuration/README.md) |
| **Suivant** | [Chapitre 5 : Solutions Multi-Agent](../chapter-05-multi-agent/README.md) |

---

## 📖 Ressources Associées

- [Vérifications Avant Déploiement](../chapter-06-pre-deployment/README.md)
- [Exemples Container App](../../examples/container-app/README.md)
- [Exemple d’Application Base de Données](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->