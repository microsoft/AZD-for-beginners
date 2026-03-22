# Fiche de référence des commandes - Commandes AZD essentielles

**Référence rapide pour tous les chapitres**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Démarrage rapide**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Commandes IA**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avancé**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduction

Cette fiche de référence complète fournit un accès rapide aux commandes Azure Developer CLI les plus couramment utilisées, organisées par catégorie avec des exemples pratiques. Parfaite pour des recherches rapides pendant le développement, le dépannage et les opérations quotidiennes avec des projets azd.

## Objectifs d'apprentissage

En utilisant cette fiche de référence, vous allez :
- Avoir un accès instantané aux commandes et à la syntaxe essentielles de Azure Developer CLI
- Comprendre l'organisation des commandes par catégories fonctionnelles et cas d'utilisation
- Consulter des exemples pratiques pour les scénarios courants de développement et de déploiement
- Accéder aux commandes de dépannage pour une résolution rapide des problèmes
- Trouver efficacement les options avancées de configuration et de personnalisation
- Localiser les commandes de gestion d'environnements et les workflows multi-environnements

## Résultats d'apprentissage

En vous référant régulièrement à cette fiche, vous serez capable de :
- Exécuter les commandes azd en toute confiance sans consulter la documentation complète
- Résoudre rapidement les problèmes courants en utilisant les commandes de diagnostic appropriées
- Gérer efficacement plusieurs environnements et scénarios de déploiement
- Appliquer les fonctionnalités avancées et les options de configuration d'azd selon les besoins
- Dépanner les problèmes de déploiement en utilisant des séquences de commandes systématiques
- Optimiser les workflows grâce à l'utilisation efficace des raccourcis et options azd

## Commandes pour commencer

### Authentification
```bash
# Se connecter à Azure via AZD
azd auth login

# Se connecter à l'Azure CLI (AZD l'utilise en interne)
az login

# Vérifier le compte actuel
az account show

# Définir l'abonnement par défaut
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Se déconnecter d'AZD
azd auth logout

# Se déconnecter de l'Azure CLI
az logout
```

### Initialisation du projet
```bash
# Parcourir les modèles disponibles
azd template list

# Initialiser à partir d'un modèle
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialiser dans le répertoire courant
azd init .

# Initialiser avec un nom personnalisé
azd init --template todo-nodejs-mongo my-awesome-app
```

## Commandes de déploiement principales

### Flux de déploiement complet
```bash
# Déployer tout (provisionnement + déploiement)
azd up

# Déployer avec les invites de confirmation désactivées
azd up --confirm-with-no-prompt

# Déployer vers un environnement spécifique
azd up --environment production

# Déployer avec des paramètres personnalisés
azd up --parameter location=westus2
```

### Infrastructure uniquement
```bash
# Approvisionner des ressources Azure
azd provision

# 🧪 Prévisualiser les modifications de l'infrastructure
azd provision --preview
# Affiche une vue en mode simulation de quelles ressources seraient créées, modifiées ou supprimées
# Semblable à 'terraform plan' ou 'bicep what-if' - sûr à exécuter, aucun changement n'est appliqué
```

### Application uniquement
```bash
# Déployer le code de l'application
azd deploy

# Déployer un service spécifique
azd deploy --service web
azd deploy --service api

# Déployer tous les services
azd deploy --all
```

### Compilation et empaquetage
```bash
# Construire des applications
azd package

# Construire un service spécifique
azd package --service api
```

## 🌍 Gestion des environnements

### Opérations d'environnement
```bash
# Lister tous les environnements
azd env list

# Créer un nouvel environnement
azd env new development
azd env new staging --location westus2

# Sélectionner un environnement
azd env select production

# Afficher l'environnement actuel
azd env show

# Actualiser l'état de l'environnement
azd env refresh
```

### Variables d'environnement
```bash
# Définir une variable d'environnement
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Obtenir une variable d'environnement
azd env get API_KEY

# Lister toutes les variables d'environnement
azd env get-values

# Supprimer une variable d'environnement
azd env unset DEBUG
```

## ⚙️ Commandes de configuration

### Configuration globale
```bash
# Lister toutes les configurations
azd config list

# Définir les valeurs par défaut globales
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Supprimer la configuration
azd config unset defaults.location

# Réinitialiser l'ensemble de la configuration
azd config reset
```

### Configuration du projet
```bash
# Valider azure.yaml
azd config validate

# Afficher les informations du projet
azd show

# Obtenir les points de terminaison des services
azd show --output json
```

## 📊 Surveillance et diagnostics

### Tableau de bord de surveillance
```bash
# Ouvrir le tableau de bord de surveillance du portail Azure
azd monitor

# Ouvrir les métriques en direct d'Application Insights
azd monitor --live

# Ouvrir le volet des journaux d'Application Insights
azd monitor --logs

# Ouvrir l'aperçu d'Application Insights
azd monitor --overview
```

### Affichage des journaux de conteneurs
```bash
# Afficher les journaux via Azure CLI (pour Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Suivre les journaux en temps réel
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Afficher les journaux depuis le portail Azure
azd monitor --logs
```

### Requêtes Log Analytics
```bash
# Accéder à Log Analytics via le portail Azure
azd monitor --logs

# Interroger les journaux à l'aide de l'Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Commandes de maintenance

### Nettoyage
```bash
# Supprimer toutes les ressources Azure
azd down

# Forcer la suppression sans confirmation
azd down --force

# Purger les ressources supprimées logiquement
azd down --purge

# Nettoyage complet
azd down --force --purge
```

### Mises à jour
```bash
# Vérifier les mises à jour d'azd
azd version

# Obtenir la version actuelle
azd version

# Afficher la configuration actuelle
azd config list
```

## 🔧 Commandes avancées

### Pipeline et CI/CD
```bash
# Configurer GitHub Actions
azd pipeline config

# Configurer Azure DevOps
azd pipeline config --provider azdo

# Afficher la configuration du pipeline
azd pipeline show
```

### Gestion de l'infrastructure
```bash
# Générer des modèles d'infrastructure
azd infra generate

# 🧪 Aperçu et planification de l'infrastructure
azd provision --preview
# Simule le provisionnement de l'infrastructure sans déployer
# Analyse les modèles Bicep/Terraform et affiche:
# - Ressources à ajouter (vert +)
# - Ressources à modifier (jaune ~)
# - Ressources à supprimer (rouge -)
# Sans risque d'exécution - aucun changement réel apporté à l'environnement Azure

# Synthétiser l'infrastructure à partir de azure.yaml
azd infra synth
```

### Informations sur le projet
```bash
# Afficher l'état du projet et les points de terminaison
azd show

# Afficher les informations détaillées du projet au format JSON
azd show --output json

# Obtenir les points de terminaison du service
azd show --output json | jq '.services'
```

## 🤖 Commandes IA & Extensions

### Extensions AZD
```bash
# Lister toutes les extensions disponibles (y compris l'IA)
azd extension list

# Installer l'extension Foundry agents
azd extension install azure.ai.agents

# Installer l'extension de réglage fin
azd extension install azure.ai.finetune

# Installer l'extension de modèles personnalisés
azd extension install azure.ai.models

# Mettre à jour toutes les extensions installées
azd extension upgrade --all
```

### Commandes de l'agent IA
```bash
# Initialiser un projet d'agent à partir d'un manifeste
azd ai agent init -m <manifest-path-or-uri>

# Cibler un projet Foundry spécifique
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Spécifier le répertoire source de l'agent
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Choisir une cible d'hébergement
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### Serveur MCP (Alpha)
```bash
# Démarrez le serveur MCP pour votre projet
azd mcp start

# Gérez le consentement des outils pour les opérations MCP
azd mcp consent
```

### Génération d'infrastructure
```bash
# Générer des fichiers IaC à partir de la définition de votre projet
azd infra generate

# Synthétiser l'infrastructure à partir du fichier azure.yaml
azd infra synth
```

---

## 🎯 Flux de travail rapides

### Flux de développement
```bash
# Démarrer un nouveau projet
azd init --template todo-nodejs-mongo
cd my-project

# Déployer vers l'environnement de développement
azd env new dev
azd up

# Apporter des modifications et redéployer
azd deploy

# Ouvrir le tableau de bord de surveillance
azd monitor --live
```

### Flux multi-environnements
```bash
# Configurer les environnements
azd env new dev
azd env new staging  
azd env new production

# Déployer vers dev
azd env select dev
azd up

# Tester et promouvoir vers staging
azd env select staging
azd up

# Déployer en production
azd env select production
azd up
```

### Flux de dépannage
```bash
# Activer le mode débogage
export AZD_DEBUG=true

# Vérifier l'état du déploiement
azd show

# Valider la configuration
azd config list

# Ouvrir le tableau de bord de surveillance pour les journaux
azd monitor --logs

# Vérifier l'état des ressources
azd show --output json
```

## 🔍 Commandes de débogage

### Informations de débogage
```bash
# Activer la sortie de débogage
export AZD_DEBUG=true
azd <command> --debug

# Désactiver la télémétrie pour une sortie plus propre
export AZD_DISABLE_TELEMETRY=true

# Vérifier la configuration actuelle
azd config list

# Vérifier l'état de l'authentification
az account show
```

### Débogage de modèles
```bash
# Lister les modèles disponibles avec leurs détails
azd template list --output json

# Afficher les informations du modèle
azd template show <template-name>

# Valider le modèle avant l'initialisation
azd template validate <template-name>
```

## 📁 Commandes de fichiers et répertoires

### Structure du projet
```bash
# Afficher la structure du répertoire actuel
tree /f  # Windows
find . -type f  # Linux/macOS

# Aller à la racine du projet azd
cd $(azd root)

# Afficher le répertoire de configuration d'azd
echo $AZD_CONFIG_DIR  # Généralement ~/.azd
```

## 🎨 Formatage de sortie

### Sortie JSON
```bash
# Obtenir la sortie JSON pour les scripts
azd show --output json
azd env list --output json
azd config list --output json

# Analyser avec jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Sortie en tableau
```bash
# Afficher sous forme de tableau
azd env list --output table

# Afficher les services déployés
azd show --output json | jq '.services | keys'
```

## 🔧 Combinaisons de commandes courantes

### Script de vérification de l'état
```bash
#!/bin/bash
# Vérification rapide de l'état de santé
azd show
azd env show
azd monitor --logs
```

### Validation du déploiement
```bash
#!/bin/bash
# Validation avant le déploiement
azd show
azd provision --preview  # Prévisualiser les modifications avant de déployer
az account show
```

### Comparaison d'environnements
```bash
#!/bin/bash
# Comparer les environnements
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script de nettoyage des ressources
```bash
#!/bin/bash
# Nettoyer les anciens environnements
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Variables d'environnement

### Variables d'environnement courantes
```bash
# Configuration Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Configuration AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Configuration de l'application
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Commandes d'urgence

### Corrections rapides
```bash
# Réinitialiser l'authentification
az account clear
az login

# Forcer le rafraîchissement de l'environnement
azd env refresh

# Redéployer tous les services
azd deploy

# Vérifier l'état du déploiement
azd show --output json
```

### Commandes de récupération
```bash
# Se remettre d'un déploiement échoué - nettoyer et redéployer
azd down --force --purge
azd up

# Reprovisionner uniquement l'infrastructure
azd provision

# Redéployer uniquement l'application
azd deploy
```

## 💡 Astuces de pro

### Alias pour un flux de travail plus rapide
```bash
# Ajoutez à votre .bashrc ou .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Raccourcis de fonctions
```bash
# Changement rapide d'environnement
azd-env() {
    azd env select $1 && azd show
}

# Déploiement rapide avec surveillance
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# État de l'environnement
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Aide et documentation

### Obtenir de l'aide
```bash
# Aide générale
azd --help
azd help

# Aide spécifique à la commande
azd up --help
azd env --help
azd config --help

# Afficher la version et les informations de compilation
azd version
azd version --output json
```

### Liens vers la documentation
```bash
# Ouvrir la documentation dans le navigateur
azd docs

# Afficher la documentation du modèle
azd template show <template-name> --docs
```

---

**Conseil** : Ajoutez cette fiche de référence aux favoris et utilisez `Ctrl+F` pour trouver rapidement les commandes dont vous avez besoin !

---

**Navigation**
- **Previous Lesson**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Next Lesson**: [Glossary](glossary.md)

---

> **💡 Vous voulez de l'aide pour les commandes Azure dans votre éditeur ?** Installez [Compétences d'agent Microsoft Azure](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — 37 compétences pour l'IA, Foundry, le déploiement, le diagnostic, et plus encore.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Avertissement :
Ce document a été traduit à l'aide du service de traduction automatique par IA [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle effectuée par un traducteur humain. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->