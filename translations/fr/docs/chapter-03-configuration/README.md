# Chapitre 3 : Configuration & Authentification

**📚 Cours** : [AZD Pour Débutants](../../README.md) | **⏱️ Durée** : 90-150 minutes incluant la pratique d'intégration | **⭐ Complexité** : Intermédiaire

---

## Aperçu

Ce chapitre traite de la configuration de l'environnement, des modèles d'authentification et des meilleures pratiques de sécurité pour les déploiements avec Azure Developer CLI.

> Cible de la revue des commandes et de la configuration : `azd 1.37.2` (novembre 2026). Un provisionnement Azure en direct n'a pas été effectué lors de la revue.

## Objectifs d'apprentissage

En complétant ce chapitre, vous allez :
- Maîtriser la hiérarchie de configuration AZD
- Gérer plusieurs environnements (dev, staging, prod)
- Mettre en œuvre une authentification sécurisée avec des identités gérées
- Configurer des paramètres spécifiques à l'environnement

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|-------|
| 1 | [Guide de Configuration](configuration.md) | Mise en place et gestion de l'environnement | 30 min |
| 2 | [Authentification & Sécurité](authsecurity.md) | Modèles d'identité gérée et RBAC | 30 min |

---

## 🚀 Démarrage Rapide

Lancez depuis la racine d'une **application azd déjà initialisée**, pas depuis le dépôt du cours. Utilisez des noms d'environnement non utilisés si ceux-ci existent déjà.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` est illustratif : il affecte l'infrastructure seulement si votre modèle le consomme explicitement. Les valeurs `azd env set` ordinaires sont enregistrées localement en clair ; ce n'est pas un stockage sécurisé des secrets.

---

## 🔧 Hiérarchie de Configuration

Gardez trois surfaces de configuration distinctes : préférences globales (`azd config`), structure du projet (`azure.yaml`) et valeurs par environnement (`azd env`). Les options ne remplacent que les paramètres qu'elles supportent réellement ; il n'existe pas de superposition universelle arbitraire de variables d'environnement sur `azure.yaml` ou Bicep.

---

## 🔐 Meilleures Pratiques de Sécurité

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|---------|
| **Précédent** | [Chapitre 2 : Développement IA](../chapter-02-ai-development/README.md) |
| **Suivant** | [Chapitre 4 : Infrastructure](../chapter-04-infrastructure/README.md) |

---

## 📖 Ressources Associées

- [Vérifications Avant Déploiement](../chapter-06-pre-deployment/README.md)
- [Dépannage](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->