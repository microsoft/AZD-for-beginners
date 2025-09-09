<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-09T16:54:34+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "fr"
}
-->
# AZD Bases - Comprendre Azure Developer CLI

## Introduction

Cette leçon vous présente Azure Developer CLI (azd), un outil en ligne de commande puissant qui accélère votre transition du développement local au déploiement sur Azure. Vous découvrirez les concepts fondamentaux, les fonctionnalités principales et comment azd simplifie le déploiement d'applications cloud natives.

## Objectifs d'apprentissage

À la fin de cette leçon, vous serez capable de :
- Comprendre ce qu'est Azure Developer CLI et son objectif principal
- Apprendre les concepts clés des modèles, environnements et services
- Explorer les fonctionnalités principales, notamment le développement basé sur des modèles et l'Infrastructure as Code
- Comprendre la structure et le flux de travail d'un projet azd
- Être prêt à installer et configurer azd pour votre environnement de développement

## Résultats d'apprentissage

Après avoir terminé cette leçon, vous serez capable de :
- Expliquer le rôle d'azd dans les flux de travail modernes de développement cloud
- Identifier les composants de la structure d'un projet azd
- Décrire comment les modèles, environnements et services fonctionnent ensemble
- Comprendre les avantages de l'Infrastructure as Code avec azd
- Reconnaître les différentes commandes azd et leurs objectifs

## Qu'est-ce qu'Azure Developer CLI (azd) ?

Azure Developer CLI (azd) est un outil en ligne de commande conçu pour accélérer votre transition du développement local au déploiement sur Azure. Il simplifie le processus de création, de déploiement et de gestion des applications cloud natives sur Azure.

## Concepts clés

### Modèles
Les modèles sont la base d'azd. Ils contiennent :
- **Code de l'application** - Votre code source et ses dépendances
- **Définitions d'infrastructure** - Ressources Azure définies en Bicep ou Terraform
- **Fichiers de configuration** - Paramètres et variables d'environnement
- **Scripts de déploiement** - Flux de travail automatisés pour le déploiement

### Environnements
Les environnements représentent différents cibles de déploiement :
- **Développement** - Pour les tests et le développement
- **Staging** - Environnement pré-production
- **Production** - Environnement de production en direct

Chaque environnement conserve ses propres :
- Groupe de ressources Azure
- Paramètres de configuration
- État de déploiement

### Services
Les services sont les blocs de construction de votre application :
- **Frontend** - Applications web, SPAs
- **Backend** - APIs, microservices
- **Base de données** - Solutions de stockage de données
- **Stockage** - Stockage de fichiers et blobs

## Fonctionnalités principales

### 1. Développement basé sur des modèles
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Langage spécifique à Azure
- **Terraform** - Outil d'infrastructure multi-cloud
- **Modèles ARM** - Modèles Azure Resource Manager

### 3. Flux de travail intégrés
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
azd down          # Clean up resources
```

### 4. Gestion des environnements
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Structure du projet

Structure typique d'un projet azd :
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Fichiers de configuration

### azure.yaml
Le fichier principal de configuration du projet :
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Configuration spécifique à l'environnement :
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Flux de travail courants

### Démarrer un nouveau projet
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Cycle de développement
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge
```

### Gestion de plusieurs environnements
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Commandes de navigation

### Découverte
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Gestion de projet
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Surveillance
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Bonnes pratiques

### 1. Utiliser des noms significatifs
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Exploiter les modèles
- Commencez avec des modèles existants
- Personnalisez-les selon vos besoins
- Créez des modèles réutilisables pour votre organisation

### 3. Isolation des environnements
- Utilisez des environnements séparés pour dev/staging/prod
- Ne déployez jamais directement en production depuis votre machine locale
- Utilisez des pipelines CI/CD pour les déploiements en production

### 4. Gestion de la configuration
- Utilisez des variables d'environnement pour les données sensibles
- Conservez la configuration dans le contrôle de version
- Documentez les paramètres spécifiques à chaque environnement

## Progression d'apprentissage

### Débutant (Semaine 1-2)
1. Installer azd et s'authentifier
2. Déployer un modèle simple
3. Comprendre la structure du projet
4. Apprendre les commandes de base (up, down, deploy)

### Intermédiaire (Semaine 3-4)
1. Personnaliser les modèles
2. Gérer plusieurs environnements
3. Comprendre le code d'infrastructure
4. Configurer des pipelines CI/CD

### Avancé (Semaine 5+)
1. Créer des modèles personnalisés
2. Modèles d'infrastructure avancés
3. Déploiements multi-régions
4. Configurations de niveau entreprise

## Prochaines étapes

- [Installation et configuration](installation.md) - Installer et configurer azd
- [Votre premier projet](first-project.md) - Tutoriel pratique
- [Guide de configuration](configuration.md) - Options de configuration avancées

## Ressources supplémentaires

- [Vue d'ensemble d'Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Galerie de modèles](https://azure.github.io/awesome-azd/)
- [Exemples communautaires](https://github.com/Azure-Samples)

---

**Navigation**
- **Leçon précédente** : [README](../../README.md)
- **Leçon suivante** : [Installation et configuration](installation.md)

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de faire appel à une traduction professionnelle humaine. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.