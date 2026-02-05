# Fiche de Référence des Commandes - Commandes Essentielles AZD

**Référence Rapide pour Tous les Chapitres**
- **📚 Accueil du Cours** : [AZD Pour Débutants](../README.md)
- **📖 Démarrage Rapide** : [Chapitre 1 : Fondations & Démarrage Rapide](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Commandes IA** : [Chapitre 2 : Développement IA-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avancé** : [Chapitre 4 : Infrastructure en tant que Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduction

Cette fiche de référence complète fournit un accès rapide aux commandes les plus couramment utilisées de l'interface CLI Azure Developer, organisées par catégorie avec des exemples pratiques. Parfaite pour des recherches rapides pendant le développement, le dépannage et les opérations quotidiennes avec les projets azd.

## Objectifs d'Apprentissage

En utilisant cette fiche de référence, vous pourrez :
- Accéder instantanément aux commandes essentielles de l'interface CLI Azure Developer et à leur syntaxe
- Comprendre l'organisation des commandes par catégories fonctionnelles et cas d'utilisation
- Consulter des exemples pratiques pour des scénarios courants de développement et de déploiement
- Accéder aux commandes de dépannage pour une résolution rapide des problèmes
- Trouver efficacement des options avancées de configuration et de personnalisation
- Localiser les commandes de gestion des environnements et des workflows multi-environnements

## Résultats d'Apprentissage

Avec une utilisation régulière de cette fiche de référence, vous serez capable de :
- Exécuter les commandes azd en toute confiance sans consulter la documentation complète
- Résoudre rapidement les problèmes courants en utilisant les commandes de diagnostic appropriées
- Gérer efficacement plusieurs environnements et scénarios de déploiement
- Appliquer les fonctionnalités avancées et les options de configuration azd selon les besoins
- Résoudre les problèmes de déploiement en suivant des séquences de commandes systématiques
- Optimiser les workflows grâce à une utilisation efficace des raccourcis et options azd

## Commandes de Démarrage

### Authentification
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Initialisation de Projet
```bash
# Browse available templates
azd template list

# Initialize from template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## Commandes de Déploiement Principales

### Workflow de Déploiement Complet
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --confirm-with-no-prompt

# Deploy to specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2
```

### Infrastructure Seulement
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes (NEW)
azd provision --preview
# Shows a dry-run view of what resources would be created/modified/deleted
# Similar to 'terraform plan' or 'bicep what-if' - safe to run, no changes applied

# Provision with what-if analysis
azd provision --what-if
```

### Application Seulement
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Construction et Packaging
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Gestion des Environnements

### Opérations sur les Environnements
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show current environment
azd env show

# Refresh environment state
azd env refresh
```

### Variables d'Environnement
```bash
# Set environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get environment variable
azd env get API_KEY

# List all environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

## ⚙️ Commandes de Configuration

### Configuration Globale
```bash
# List all configuration
azd config list

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### Configuration de Projet
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Surveillance et Journaux

### Journaux d'Application
```bash
# View logs from all services
azd logs

# View logs from specific service
azd logs --service api

# Follow logs in real-time
azd logs --follow

# View logs since specific time
azd logs --since 1h
azd logs --since "2024-01-01 10:00:00"

# Filter logs by level
azd logs --level error
```

### Surveillance
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ Commandes de Maintenance

### Nettoyage
```bash
# Remove all Azure resources
azd down

# Force delete without confirmation
azd down --force

# Purge soft-deleted resources
azd down --purge

# Complete cleanup
azd down --force --purge
```

### Mises à Jour
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Commandes Avancées

### Pipeline et CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Gestion de l'Infrastructure
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate

# 🧪 Infrastructure Preview & Planning (NEW)
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Safe to run - no actual changes made to Azure environment
```

### Gestion des Services
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Workflows Rapides

### Workflow de Développement
```bash
# Start new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# View logs
azd logs --follow
```

### Workflow Multi-Environnement
```bash
# Set up environments
azd env new dev
azd env new staging  
azd env new production

# Deploy to dev
azd env select dev
azd up

# Test and promote to staging
azd env select staging
azd up

# Deploy to production
azd env select production
azd up
```

### Workflow de Dépannage
```bash
# Enable debug mode
export AZD_DEBUG=true

# Check system info
azd info

# Validate configuration
azd config validate

# View detailed logs
azd logs --level debug --since 1h

# Check resource status
azd show --output json
```

## 🔍 Commandes de Débogage

### Informations de Débogage
```bash
# Enable debug output
export AZD_DEBUG=true
azd <command> --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true

# Get system information
azd info

# Check authentication status
az account show
```

### Débogage de Modèles
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Commandes de Fichiers et Répertoires

### Structure de Projet
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Formatage des Résultats

### Résultats en JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Résultats en Tableau
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Combinaisons de Commandes Courantes

### Script de Vérification de Santé
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Validation de Déploiement
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview  # 🧪 NEW: Preview changes before deploying
az account show
```

### Comparaison d'Environnements
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script de Nettoyage des Ressources
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Variables d'Environnement

### Variables d'Environnement Courantes
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Commandes d'Urgence

### Corrections Rapides
```bash
# Reset authentication
az account clear
az login

# Force refresh environment
azd env refresh --force

# Restart all services
azd service restart --all

# Quick rollback
azd deploy --rollback
```

### Commandes de Récupération
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Conseils Pratiques

### Alias pour un Workflow Plus Rapide
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Raccourcis de Fonction
```bash
# Quick environment switching
azd-env() {
    azd env select $1 && azd show
}

# Quick deployment with logs
azd-deploy-watch() {
    azd deploy --service $1 && azd logs --service $1 --follow
}

# Environment status
azd-status() {
    echo "Current environment: $(azd env show --output json | jq -r '.name')"
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Aide et Documentation

### Obtenir de l'Aide
```bash
# General help
azd --help
azd help

# Command-specific help
azd up --help
azd env --help
azd config --help

# Show version and build info
azd version
azd version --output json
```

### Liens vers la Documentation
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Astuce** : Ajoutez cette fiche de référence à vos favoris et utilisez `Ctrl+F` pour trouver rapidement les commandes dont vous avez besoin !

---

**Navigation**
- **Leçon Précédente** : [Vérifications Préliminaires](../docs/pre-deployment/preflight-checks.md)
- **Leçon Suivante** : [Glossaire](glossary.md)

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.