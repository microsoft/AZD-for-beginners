# Commandes de Référence Rapide - Commandes Essentielles AZD

**Référence Rapide pour Tous les Chapitres**
- **📚 Accueil du Cours** : [AZD Pour Débutants](../README.md)
- **📖 Démarrage Rapide** : [Chapitre 1 : Fondations & Démarrage Rapide](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Commandes IA** : [Chapitre 2 : Développement AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avancé** : [Chapitre 4 : Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduction

Cette fiche de référence complète offre un accès rapide aux commandes Azure Developer CLI les plus couramment utilisées, organisées par catégorie avec des exemples pratiques. Parfait pour des recherches rapides lors du développement, du dépannage et des opérations quotidiennes avec des projets azd.

## Objectifs d'Apprentissage

En utilisant cette fiche de référence, vous allez :
- Avoir un accès instantané aux commandes et à la syntaxe essentielles de l’Azure Developer CLI
- Comprendre l’organisation des commandes par catégories fonctionnelles et cas d’usage
- Référencer des exemples pratiques pour des scénarios courants de développement et de déploiement
- Accéder aux commandes de dépannage pour une résolution rapide des problèmes
- Trouver efficacement les options de configuration et personnalisation avancées
- Localiser les commandes de gestion d’environnements et de workflows multi-environnements

## Résultats d'Apprentissage

Avec une référence régulière à cette fiche, vous serez capable de :
- Exécuter les commandes azd en toute confiance sans consulter la documentation complète
- Résoudre rapidement des problèmes courants avec les commandes de diagnostic appropriées
- Gérer efficacement plusieurs environnements et scénarios de déploiement
- Appliquer les fonctionnalités avancées et options de configuration d’azd selon les besoins
- Dépanner les problèmes de déploiement avec des séquences de commandes systématiques
- Optimiser les workflows grâce à l’utilisation efficace des raccourcis et options azd

## Commandes Pour Bien Commencer

### Authentification
```bash
# Se connecter à Azure via AZD
azd auth login

# Se connecter à Azure CLI (AZD utilise ceci en arrière-plan)
az login

# Vérifier le compte actuel
az account show

# Définir l'abonnement par défaut
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Se déconnecter de AZD
azd auth logout

# Se déconnecter de Azure CLI
az logout
```

### Initialisation du Projet
```bash
# Parcourir les modèles disponibles
azd template list

# Initialiser à partir du modèle
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialiser dans le répertoire actuel
azd init .

# Initialiser avec un nom personnalisé
azd init --template todo-nodejs-mongo my-awesome-app
```

## Commandes Principales de Déploiement

### Workflow Complet de Déploiement
```bash
# Déployer tout (provisionnement + déploiement)
azd up

# Déployer avec les invites de confirmation désactivées
azd up --confirm-with-no-prompt

# Déployer dans un environnement spécifique
azd up --environment production

# Déployer avec des paramètres personnalisés
azd up --parameter location=westus2
```

### Infrastructure Uniquement
```bash
# Provisionner des ressources Azure
azd provision

# 🧪 Aperçu des modifications d'infrastructure
azd provision --preview
# Montre une vue à blanc de ce que les ressources seraient créées/modifiées/supprimées
# Similaire à 'terraform plan' ou 'bicep what-if' - sans risque d'exécution, aucune modification appliquée
```

### Application Uniquement
```bash
# Déployer le code de l'application
azd deploy

# Déployer un service spécifique
azd deploy --service web
azd deploy --service api

# Déployer tous les services
azd deploy --all
```

### Construction et Packaging
```bash
# Construire des applications
azd package

# Construire un service spécifique
azd package --service api
```

## 🌍 Gestion des Environnements

### Opérations sur l’Environnement
```bash
# Lister tous les environnements
azd env list

# Créer un nouvel environnement
azd env new development
azd env new staging --location westus2

# Sélectionner un environnement
azd env select production

# Afficher les environnements disponibles
azd env list

# Actualiser l'état de l'environnement
azd env refresh
```

### Variables d’Environnement
```bash
# Définir la variable d'environnement
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Obtenir la variable d'environnement
azd env get API_KEY

# Lister toutes les variables d'environnement
azd env get-values

# Supprimer la variable d'environnement
azd env unset DEBUG
```

## ⚙️ Commandes de Configuration

### Configuration Globale
```bash
# Lister toutes les configurations
azd config show

# Définir les valeurs globales par défaut
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Supprimer la configuration
azd config unset defaults.location

# Réinitialiser toutes les configurations
azd config reset
```

### Configuration du Projet
```bash
# Valider azure.yaml
azd config validate

# Afficher les informations du projet
azd show

# Obtenir les points de terminaison du service
azd show --output json
```

## 📊 Surveillance et Diagnostics

### Tableau de Bord de Surveillance
```bash
# Ouvrir le tableau de bord de surveillance du portail Azure
azd monitor

# Ouvrir les métriques en direct d'Application Insights
azd monitor --live

# Ouvrir le volet des journaux d'Application Insights
azd monitor --logs

# Ouvrir la vue d'ensemble d'Application Insights
azd monitor --overview
```

### Consultation des Logs des Conteneurs
```bash
# Afficher les journaux via Azure CLI (pour les applications conteneurisées)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Suivre les journaux en temps réel
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Afficher les journaux depuis le portail Azure
azd monitor --logs
```

### Requêtes Log Analytics
```bash
# Accédez à Log Analytics via le portail Azure
azd monitor --logs

# Interrogez les journaux à l'aide de l'Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Commandes de Maintenance

### Nettoyage
```bash
# Supprimer toutes les ressources Azure
azd down

# Forcer la suppression sans confirmation
azd down --force

# Purger les ressources supprimées de manière temporaire
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

# Voir la configuration actuelle
azd config show
```

## 🔧 Commandes Avancées

### Pipeline et CI/CD
```bash
# Configurer GitHub Actions
azd pipeline config

# Configurer Azure DevOps
azd pipeline config --provider azdo

# Afficher la configuration du pipeline
azd pipeline show
```

### Gestion de l’Infrastructure
```bash
# Générer des modèles d'infrastructure
azd infra generate

# 🧪 Aperçu et planification de l'infrastructure
azd provision --preview
# Simule la mise en place de l'infrastructure sans déploiement
# Analyse les modèles Bicep/Terraform et affiche :
# - Ressources à ajouter (vert +)
# - Ressources à modifier (jaune ~)
# - Ressources à supprimer (rouge -)
# Sécurisé à exécuter - aucun changement réel effectué dans l'environnement Azure

# Synthétiser l'infrastructure à partir de azure.yaml
azd infra synth
```

### Informations sur le Projet
```bash
# Afficher le statut du projet et les points de terminaison
azd show

# Afficher les informations détaillées du projet en JSON
azd show --output json

# Obtenir les points de terminaison du service
azd show --output json | jq '.services'
```

## 🤖 Commandes IA & Extensions

### Extensions AZD
```bash
# Lister toutes les extensions disponibles (y compris l'IA)
azd extension list

# Installer l'extension des agents Foundry
azd extension install azure.ai.agents

# Installer l'extension de réglage fin
azd extension install azure.ai.finetune

# Installer l'extension des modèles personnalisés
azd extension install azure.ai.models

# Mettre à jour toutes les extensions installées
azd extension upgrade --all
```

### Commandes Agent IA
```bash
# Initialiser un projet agent à partir d’un manifeste
azd ai agent init -m <manifest-path-or-uri>

# Cibler un projet Foundry spécifique
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Spécifier le répertoire source de l’agent
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Choisir une cible d’hébergement
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### Serveur MCP (Alpha)
```bash
# Démarrez le serveur MCP pour votre projet
azd mcp start

# Gérer le consentement des outils pour les opérations MCP
azd copilot consent list
```

### Génération d’Infrastructure
```bash
# Générer des fichiers IaC à partir de la définition de votre projet
azd infra generate

# Synthétiser l'infrastructure à partir de azure.yaml
azd infra synth
```

---

## 🎯 Workflows Rapides

### Workflow de Développement
```bash
# Démarrer un nouveau projet
azd init --template todo-nodejs-mongo
cd my-project

# Déployer en développement
azd env new dev
azd up

# Apporter des modifications et redéployer
azd deploy

# Ouvrir le tableau de bord de surveillance
azd monitor --live
```

### Workflow Multi-Environnements
```bash
# Configurer les environnements
azd env new dev
azd env new staging  
azd env new production

# Déployer en développement
azd env select dev
azd up

# Tester et promouvoir en pré-production
azd env select staging
azd up

# Déployer en production
azd env select production
azd up
```

### Workflow de Dépannage
```bash
# Activer le mode débogage
export AZD_DEBUG=true

# Vérifier le statut du déploiement
azd show

# Valider la configuration
azd config show

# Ouvrir le tableau de bord de surveillance pour les journaux
azd monitor --logs

# Vérifier le statut des ressources
azd show --output json
```

## 🔍 Commandes de Débogage

### Informations de Débogage
```bash
# Activer la sortie de débogage
export AZD_DEBUG=true
azd <command> --debug

# Désactiver la télémétrie pour une sortie plus propre
export AZD_DISABLE_TELEMETRY=true

# Vérifier la configuration actuelle
azd config show

# Vérifier le statut de l'authentification
az account show
```

### Débogage de Template
```bash
# Lister les modèles disponibles avec détails
azd template list --output json

# Afficher les informations du modèle
azd template show <template-name>

# Valider le modèle avant l'initialisation
azd template validate <template-name>
```

## 📁 Commandes Fichiers et Répertoires

### Structure du Projet
```bash
# Afficher la structure du répertoire actuel
tree /f  # Windows
find . -type f  # Linux/macOS

# Naviguer vers la racine du projet azd
cd $(azd root)

# Afficher le répertoire de configuration azd
echo $AZD_CONFIG_DIR  # Habituellement ~/.azd
```

## 🎨 Formatage de la Sortie

### Sortie JSON
```bash
# Obtenir une sortie JSON pour le script
azd show --output json
azd env list --output json
azd config show --output json

# Analyser avec jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Sortie Table
```bash
# Formater comme un tableau
azd env list --output table

# Voir les services déployés
azd show --output json | jq '.services | keys'
```

## 🔧 Combinaisons de Commandes Courantes

### Script de Vérification de Santé
```bash
#!/bin/bash
# Vérification rapide de l'état de santé
azd show
azd env get-values
azd monitor --logs
```

### Validation de Déploiement
```bash
#!/bin/bash
# Validation pré-déploiement
azd show
azd provision --preview  # Prévisualiser les modifications avant le déploiement
az account show
```

### Comparaison d’Environnements
```bash
#!/bin/bash
# Comparer les environnements
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script de Nettoyage des Ressources
```bash
#!/bin/bash
# Nettoyer les anciens environnements
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Variables d’Environnement

### Variables d’Environnement Courantes
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

## 🚨 Commandes d’Urgence

### Corrections Rapides
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

### Commandes de Récupération
```bash
# Récupérer d'un déploiement échoué - nettoyer et redéployer
azd down --force --purge
azd up

# Réapprovisionner uniquement l'infrastructure
azd provision

# Redéployer uniquement l'application
azd deploy
```

## 💡 Astuces de Pro

### Alias pour un Workflow Plus Rapide
```bash
# Ajoutez à votre .bashrc ou .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Raccourcis de Fonction
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
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Aide et Documentation

### Obtenir de l’Aide
```bash
# Aide générale
azd --help
azd help

# Aide spécifique à la commande
azd up --help
azd env --help
azd config --help

# Afficher la version et les informations de construction
azd version
azd version --output json
```

### Liens de Documentation
```bash
# Ouvrir la documentation dans le navigateur
azd docs

# Afficher la documentation du modèle
azd template show <template-name> --docs
```

---

**Astuce** : Ajoutez cette fiche de référence à vos favoris et utilisez `Ctrl+F` pour trouver rapidement les commandes dont vous avez besoin !

---

**Navigation**
- **Leçon Précédente** : [Vérifications Préliminaires](../docs/pre-deployment/preflight-checks.md)
- **Leçon Suivante** : [Glossaire](glossary.md)

---

> **💡 Vous voulez l’aide des commandes Azure dans votre éditeur ?** Installez [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) avec `npx skills add microsoft/github-copilot-for-azure` — 37 compétences pour IA, Foundry, déploiement, diagnostics, et plus encore.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d’assurer l’exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction humaine professionnelle est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou d’interprétations erronées résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->