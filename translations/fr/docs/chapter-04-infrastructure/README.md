# Chapitre 4 : Infrastructure en tant que code et Déploiement

**📚 Cours**: [AZD For Beginners](../../README.md) | **⏱️ Durée**: 1-1.5 heures | **⭐ Complexité**: Intermédiaire

---

## Aperçu

Ce chapitre couvre les modèles d'Infrastructure en tant que Code (IaC) avec des templates Bicep, l'approvisionnement des ressources et les stratégies de déploiement en utilisant Azure Developer CLI.

## Objectifs d'apprentissage

By completing this chapter, you will:
- Comprendre la structure et la syntaxe des templates Bicep
- Approvisionner des ressources Azure avec `azd provision`
- Déployer des applications avec `azd deploy`
- Mettre en œuvre des stratégies de déploiement blue-green et rolling

---

## 📚 Leçons

| # | Leçon | Description | Temps |
|---|--------|-------------|------|
| 1 | [Approvisionnement des ressources](provisioning.md) | Gestion des ressources Azure avec AZD | 45 min |
| 2 | [Guide de déploiement](deployment-guide.md) | Stratégies de déploiement d'applications | 45 min |

---

## 🚀 Démarrage rapide

```bash
# Initialiser à partir d'un modèle
azd init --template azure-functions-python-v2-http

# Prévisualiser ce qui sera créé
azd provision --preview

# Provisionner uniquement l'infrastructure
azd provision

# Déployer uniquement le code
azd deploy

# Ou les deux ensemble
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
| `azd provision` | Créer des ressources Azure |
| `azd deploy` | Déployer le code de l'application |
| `azd up` | approvisionner + déployer |
| `azd down` | Supprimer toutes les ressources |

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|---------|
| **Précédent** | [Chapitre 3 : Configuration](../chapter-03-configuration/README.md) |
| **Suivant** | [Chapitre 5 : Solutions multi-agents](../chapter-05-multi-agent/README.md) |

---

## 📖 Ressources associées

- [Vérifications pré-déploiement](../chapter-06-pre-deployment/README.md)
- [Exemples d'applications Container App](../../examples/container-app/README.md)
- [Exemple d'application de base de données](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Avertissement :  
Ce document a été traduit à l'aide du service de traduction par IA [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original, dans sa langue d'origine, doit être considéré comme la source faisant foi. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un traducteur humain. Nous déclinons toute responsabilité pour tout malentendu ou mauvaise interprétation résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->