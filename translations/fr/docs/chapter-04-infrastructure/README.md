# Chapitre 4 : Infrastructure en tant que Code & Déploiement

**📚 Cours** : [AZD Pour Débutants](../../README.md) | **⏱️ Durée** : 2-3 heures de lecture ; prévoir du temps supplémentaire pour les exercices de déploiement | **⭐ Complexité** : Intermédiaire

---

## Aperçu

Ce chapitre couvre les modèles Infrastructure en tant que Code (IaC) avec des templates Bicep, l'approvisionnement des ressources, et les stratégies de déploiement utilisant Azure Developer CLI.

> Objectif de la revue de commande et configuration : `azd 1.37.2` (Novembre 2026). L’approvisionnement live Azure n’a pas été exécuté durant la revue.

## Objectifs d’apprentissage

En complétant ce chapitre, vous allez :
- Comprendre la structure et la syntaxe des templates Bicep
- Approvisionner les ressources Azure avec `azd provision`
- Déployer des applications avec `azd deploy`
- Mettre en œuvre des stratégies de déploiement blue-green et rolling

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|------|
| 1 | [Approvisionnement des ressources](provisioning.md) | Gestion des ressources Azure avec AZD | 45 min |
| 2 | [Guide de déploiement](deployment-guide.md) | Stratégies de déploiement d’applications | 45 min |
| 3 | [Création de votre propre template](custom-templates.md) | Construire et publier des templates azd réutilisables | 30 min |

---

## 🚀 Démarrage rapide

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 Structure du projet AZD

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

## 🔧 Commandes essentielles

| Commande | Description |
|---------|-------------|
| `azd init` | Initialiser le projet |
| `azd provision` | Créer les ressources Azure |
| `azd deploy` | Déployer le code de l’application |
| `azd up` | provision + déploiement |
| `azd down` | Supprimer toutes les ressources |

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|---------|
| **Précédent** | [Chapitre 3 : Configuration](../chapter-03-configuration/README.md) |
| **Suivant** | [Chapitre 5 : Solutions Multi-Agents](../chapter-05-multi-agent/README.md) |

---

## 📖 Ressources associées

- [Vérifications pré-déploiement](../chapter-06-pre-deployment/README.md)
- [Exemples d'applications Container](../../examples/container-app/README.md)
- [Exemple d'application Base de données](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->