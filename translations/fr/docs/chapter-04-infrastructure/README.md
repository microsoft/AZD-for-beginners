# Chapitre 4 : Infrastructure as Code & Déploiement

**📚 Cours** : [AZD Pour Débutants](../../README.md) | **⏱️ Durée** : 1-1,5 heures | **⭐ Complexité** : Intermédiaire

---

## Aperçu

Ce chapitre couvre les modèles Infrastructure as Code (IaC) avec des templates Bicep, la mise en service des ressources et les stratégies de déploiement utilisant Azure Developer CLI.

> Validé avec `azd 1.23.12` en mars 2026.

## Objectifs d'apprentissage

En terminant ce chapitre, vous allez :
- Comprendre la structure et la syntaxe des templates Bicep
- Mettre en service des ressources Azure avec `azd provision`
- Déployer des applications avec `azd deploy`
- Mettre en œuvre des stratégies de déploiement blue-green et rolling

---

## 📚 Leçons

| # | Leçon | Description | Temps |
|---|--------|-------------|------|
| 1 | [Mise en service des ressources](provisioning.md) | Gestion des ressources Azure avec AZD | 45 min |
| 2 | [Guide de déploiement](deployment-guide.md) | Stratégies de déploiement d'applications | 45 min |

---

## 🚀 Démarrage rapide

```bash
# Initialiser à partir du modèle
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
| `azd provision` | Créer les ressources Azure |
| `azd deploy` | Déployer le code de l'application |
| `azd up` | provision + déploiement |
| `azd down` | Supprimer toutes les ressources |

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|---------|
| **Précédent** | [Chapitre 3 : Configuration](../chapter-03-configuration/README.md) |
| **Suivant** | [Chapitre 5 : Solutions Multi-Agent](../chapter-05-multi-agent/README.md) |

---

## 📖 Ressources associées

- [Contrôles préalables au déploiement](../chapter-06-pre-deployment/README.md)
- [Exemples d’application Container](../../examples/container-app/README.md)
- [Exemple d’application base de données](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçons d’assurer l’exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant foi. Pour des informations critiques, une traduction professionnelle réalisée par un humain est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou d’interprétations erronées découlant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->