# Fiche de Référence des Commandes - Commandes Essentielles AZD

**Référence Rapide pour Tous les Chapitres**
- **📚 Accueil du Cours** : [AZD pour Débutants](../README.md)
- **📖 Démarrage Rapide** : [Chapitre 1 : Fondations & Démarrage Rapide](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Commandes IA** : [Chapitre 2 : Développement IA en Priorité](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avancé** : [Chapitre 4 : Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduction

Cette fiche complète fournit une référence rapide pour les commandes Azure Developer CLI les plus couramment utilisées, organisées par catégorie avec des exemples pratiques. Parfait pour des consultations rapides lors du développement, du dépannage et des opérations quotidiennes avec les projets azd.

## Objectifs d'Apprentissage

En utilisant cette fiche, vous allez :
- Avoir un accès instantané aux commandes essentielles d’Azure Developer CLI et leur syntaxe
- Comprendre l’organisation des commandes par catégories fonctionnelles et cas d’usage
- Référencer des exemples pratiques pour les scénarios courants de développement et déploiement
- Accéder aux commandes de dépannage pour une résolution rapide des problèmes
- Trouver efficacement des options avancées de configuration et de personnalisation
- Localiser les commandes de gestion d’environnement et les workflows multi-environnements

## Résultats d'Apprentissage

En vous référant régulièrement à cette fiche, vous serez capable de :
- Exécuter les commandes azd avec confiance sans avoir à consulter la documentation complète
- Résoudre rapidement les problèmes courants en utilisant les commandes de diagnostic appropriées
- Gérer efficacement plusieurs environnements et scénarios de déploiement
- Appliquer des fonctionnalités et options de configuration azd avancées selon les besoins
- Dépanner les problèmes de déploiement en utilisant des séquences de commandes systématiques
- Optimiser les workflows grâce à l’utilisation efficace des raccourcis et options azd

## Commandes de Démarrage

### Authentification
```bash
# Login to Azure via AZD
azd auth login

# Optional: login separately for exercises or hooks that run Azure CLI
az login

# Check Azure CLI's current account (not AZD's login)
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logout from AZD
azd auth logout

# Logout from Azure CLI
az logout
```

### Initialisation de Projet
```bash
# Browse available templates
azd template list

# Initialize from a template in the current empty directory (alternatives)
azd init --template todo-nodejs-mongo .
azd init --template <template-name> .

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
cd my-awesome-app
```

## Commandes Principales de Déploiement

### Workflow Complet de Déploiement
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --no-prompt

# Deploy to specific environment
azd up --environment production

# Persist the region before deployment
azd env set AZURE_LOCATION westus2
azd up
```

### Infrastructure Seulement
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Application Seulement
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Compilation et Packaging
```bash
# Restore (download) application dependencies
azd restore

# Restore a specific service
azd restore api

# Build a deployable artifact without deploying
azd package

# Build specific service
azd package api
```

> **`azd restore`** télécharge les dépendances de votre application (npm, pip, NuGet, Maven, etc.). Cette commande s’exécute automatiquement lors de `azd package` et `azd deploy`, donc vous l’appelez rarement directement — exécutez-la manuellement pour pré-charger les dépendances (par exemple, pour chauffer un cache CI ou travailler hors ligne ensuite).

> **`azd package`** prépare un artefact déployable sans déployer le service d’application. Le comportement dépend du langage et de l’hôte : le packaging en conteneur peut utiliser des builds distants Azure et publier les images dans un registre, il n’est donc pas nécessairement hors ligne ni sans écrire dans Azure. `azd deploy` peut packager automatiquement ; utilisez une étape de packaging séparée lorsque vous avez besoin d’un artefact ou d’une vérification de build.


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

# Show available environments
azd env list

# Refresh environment state
azd env refresh
```

### Variables d’Environnement
```bash
# Set environment variable
azd env set LOG_LEVEL info
azd env set DEBUG true

# Get environment variable
azd env get-value LOG_LEVEL

# List all environment variables
azd env get-values

# Remove environment variable (beta in AZD 1.37.0+)
azd env unset DEBUG
```

Les fichiers d’environnement sont en texte clair. Ne considérez pas `azd env set` comme un stockage sécurisé ; utilisez les références Key Vault ou l’identité managée selon le contexte.

## ⚙️ Commandes de Configuration

### Configuration Globale
```bash
# List all configuration
azd config show

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
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Surveillance et Diagnostic

### Tableau de Bord de Surveillance
```bash
# Open Azure portal monitoring dashboard
azd monitor

# Open Application Insights live metrics
azd monitor --live

# Open Application Insights logs blade
azd monitor --logs

# Open Application Insights overview
azd monitor --overview
```

Application Insights doit être configuré par le modèle. L’option Live Metrics d’AZD n’est pas encore supportée pour les applications Python ; utilisez l’aperçu, les journaux, ou le workflow de traçage documenté de l’exemple à la place.

### Visualisation des Journaux de Conteneur
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Requêtes Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
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
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Commandes Avancées

### Pipeline et CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Gestion de l’Infrastructure
```bash
# Generate infrastructure templates
azd infra generate

# 🧪 Infrastructure Preview & Planning
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Review provider behavior and configured hooks before treating preview as read-only

# Inspect supported infrastructure operations
azd infra --help
```

### Informations du Projet
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 Commandes IA & Extensions

### Extensions AZD

Référence Foundry GA mise à jour 2026-11-09 : `microsoft.foundry` bundle 1.0, annoncé le [5 novembre 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Utilisez `azd >= 1.37.0` ; les composants sont versionnés indépendamment et les fonctionnalités en aperçu optionnelles gardent leur propre statut.

```bash
# List all available extensions (including AI)
azd extension list

# Check/update the core CLI before updating extensions
azd version
azd update

# Install the GA bundle (agents, connections, inspector, projects,
# routines, skills, and toolboxes)
azd ext install microsoft.foundry

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# Inspect installed versions and upgrade the bundle
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Le bundle n’inclut pas les évaluations, datasets, fine-tuning ou modèles personnalisés. L’installation des extensions cœur individuelles reste supportée. Suivez le [tutoriel GA agent hébergé](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) pour un exemple exécutable avec Python 3.13+, uv courant, permissions et quota de modèle.

### Commandes Agents IA
```bash
# Initialize an agent project interactively
azd ai agent init

# Or adopt a current azure.yaml agent project template
azd ai agent init --template <path-to-azure.yaml>

# Target a specific Foundry project
azd ai agent init --template <path-to-azure.yaml> --project-id <foundry-project-id>

# Adopt into a specified directory, then follow the printed cd next step
azd ai agent init --template <path-to-azure.yaml> --src ./agents/my-agent

# For a code-based hosted agent, add --deploy-mode code during init
# Review azure.yaml, then provision before running locally
azd provision
azd ai agent run

# In a second terminal in the same project directory
azd ai agent invoke --local "Explain how this agent is deployed."

# Upload source for a remote Foundry build (code mode)
azd deploy

# Test a deployed agent (prints latency + time-to-first-byte)
azd ai agent invoke

# Show the live endpoint configuration
azd ai agent endpoint show

# Review hosted-agent changes, stream logs, or diagnose permissions
azd deploy --preview
azd ai agent monitor --follow
azd ai agent doctor

# Download the deployed source of a code-based hosted agent
azd ai agent code download

# Delete a hosted agent and all its versions (--force ends active sessions)
azd ai agent delete --force
```

`--template`/`-t` remplace la syntaxe obsolète `--manifest`/`-m` ; les manifestes hérités nécessitent une migration. Il n’existe pas actuellement d’option agent-init `--host containerapp`. Les previews avec managed-harness, voix et longues durées nécessitent une activation indépendante dans shell/environnement CI ; voir la [référence AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Les tests locaux utilisent toujours les déploiements de modèles Azure et engendrent des coûts. Pour le nettoyage, `azd down` supprime le groupe de ressources d’un projet Foundry nouvellement créé, mais laisse en place les ressources de projets réutilisés ; supprimez seulement séparément les ressources indésirables que vous possédez.

### Évaluations IA et Optimisation
```bash
# Generate and review a draft dataset and rubric (Dataset and evaluator / Turn)
azd ai eval generate

# In the initialized agent project, select those assets and a judge model
azd ai eval init --name quality

# Register datasets/evaluators/eval groups, then run and inspect results
azd up
azd ai eval run start --eval quality --wait
azd ai eval run list
azd ai eval run show <run-id>
azd ai eval run output list <run-id>

# Reuse a compatible turn-level dataset evaluation for optimization
azd ai agent optimize --eval-config ./evals/azure.eval.yaml --eval <evaluation-name> --optimize-model <optimizer-deployment>
```

La version beta.22 des agents a remplacé les commandes d’évaluation héritées par `azd ai eval` issus de `azure.ai.evaluations`. La nouvelle configuration d’évaluation utilise des clés camelCase. L’optimisation `--config` requiert une requête API d’optimisation autonome, **pas** l’ancienne `eval.yaml` ni la nouvelle `azure.eval.yaml` ; utilisez `--eval`/`--eval-config` pour la réutilisation d’évaluation. Voir [configuration d’évaluation](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) et [migration d’optimisation](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Foundry CI/CD
```bash
# After a successful local deployment, generate and review the pipeline
azd up
azd pipeline config

# Runner steps: install extensions, authenticate, then deploy
azd ext install microsoft.foundry azure.ai.evaluations
# Keep the generated OIDC sign-in and environment settings here
azd up --no-prompt
azd ai eval run start --eval quality --wait --no-prompt --fail-on "pass-rate=0.9"
```

Le fragment runner n’est pas un workflow complet. Engagez la configuration d’évaluation revue et les assets non secrets, accordez l’accès dataset/évaluateur/modèle, et utilisez un environnement par étape. Voir l’[exemple CI/CD authentifié](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### Serveur MCP (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Génération d’Infrastructure
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Workflows Rapides

### Workflow de Développement
```bash
# Start a new project in an explicit directory
azd init --template todo-nodejs-mongo my-project
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# Open monitoring dashboard
azd monitor --live
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
# Check deployment status
azd show --debug

# Validate configuration
azd config show

# Open monitoring dashboard for logs
azd monitor --logs

# Check resource status
azd show --output json
```

## 🔍 Commandes de Débogage

### Informations de Débogage
```bash
# Enable debug output for a command
azd <command> --debug

# Disable telemetry for cleaner output
export AZURE_DEV_COLLECT_TELEMETRY=no

# Check current configuration
azd config show

# Reauthenticate AZD if needed (Azure CLI has a separate login)
azd auth login
```

### Débogage de Modèle
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Commandes de Fichiers et Répertoires

### Structure du Projet
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Mise en Forme de la Sortie

### Sortie JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Sortie Tableau
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Combinaisons de Commandes Courantes

### Script de Vérification de Santé
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Validation de Déploiement
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Comparaison d’Environnements
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Script de Nettoyage de Ressources
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Variables d’Environnement

### Variables d’Environnement Courantes
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZURE_DEV_COLLECT_TELEMETRY=no
export AZD_CONFIG_DIR="$HOME/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Commandes d’Urgence

### Corrections Rapides
```bash
# Reauthenticate AZD without changing Azure CLI's account cache
azd auth login

# Force refresh environment
azd env refresh

# Redeploy all services
azd deploy

# Check deployment status
azd show --output json
```

### Commandes de Récupération
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Astuces Pro

### Alias pour un Workflow Plus Rapide
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Raccourcis Fonctionnels
```bash
# Quick environment switching
azd-env() {
    azd env select "$1" && azd show
}

# Quick deployment with monitoring
azd-deploy-watch() {
    azd deploy "$1" && azd monitor --overview
}

# Environment status
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Aide et Documentation

### Obtenir de l’Aide
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

**Astuce** : Mettez cette fiche en favori et utilisez `Ctrl+F` pour trouver rapidement les commandes dont vous avez besoin !

---

**Navigation**
- **Leçon Précédente** : [Vérifications Préliminaires](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Leçon Suivante** : [Glossaire](glossary.md)

---

> **💡 Vous voulez de l’aide pour les commandes Azure dans votre éditeur ?** Installez [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) avec `npx skills add microsoft/github-copilot-for-azure` — 37 compétences pour l’IA, Foundry, le déploiement, le diagnostic, et plus encore.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->