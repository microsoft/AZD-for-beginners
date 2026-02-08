# Fiche Mémo des Commandes - Commandes AZD Essentielles

**Référence Rapide pour Tous les Chapitres**
- **📚 Accueil du Cours** : [AZD Pour Débutants](../README.md)
- **📖 Démarrage Rapide** : [Chapitre 1 : Fondations & Démarrage Rapide](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Commandes IA** : [Chapitre 2 : Développement AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avancé** : [Chapitre 4 : Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduction

Cette fiche mémo complète fournit une référence rapide pour les commandes Azure Developer CLI les plus couramment utilisées, organisées par catégorie avec des exemples pratiques. Parfait pour des consultations rapides lors du développement, du dépannage, et des opérations quotidiennes avec des projets azd.

## Objectifs d’Apprentissage

En utilisant cette fiche mémo, vous allez :
- Avoir un accès instantané aux commandes et à la syntaxe essentielles d’Azure Developer CLI
- Comprendre l’organisation des commandes par catégories fonctionnelles et cas d’utilisation
- Consulter des exemples pratiques pour des scénarios courants de développement et de déploiement
- Accéder aux commandes de dépannage pour une résolution rapide des problèmes
- Trouver efficacement des options avancées de configuration et de personnalisation
- Localiser les commandes de gestion des environnements et les workflows multi-environnements

## Résultats d’Apprentissage

Avec une consultation régulière de cette fiche, vous serez capable de :
- Exécuter les commandes azd avec assurance sans consulter la documentation complète
- Résoudre rapidement les problèmes courants avec les commandes de diagnostic appropriées
- Gérer efficacement plusieurs environnements et scénarios de déploiement
- Appliquer les fonctionnalités avancées et options de configuration azd selon les besoins
- Dépanner les problèmes de déploiement en suivant des séquences de commandes systématiques
- Optimiser les workflows grâce à l’utilisation efficace des raccourcis et options azd

## Commandes de Démarrage

### Authentification
```bash
# Se connecter à Azure via AZD
azd auth login

# Se connecter à Azure CLI (AZD utilise cela en interne)
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

### Initialisation de Projet
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
# Déployer tout (provisionner + déployer)
azd up

# Déployer avec les invites de confirmation désactivées
azd up --confirm-with-no-prompt

# Déployer vers un environnement spécifique
azd up --environment production

# Déployer avec des paramètres personnalisés
azd up --parameter location=westus2
```

### Infrastructure Uniquement
```bash
# Provisionner les ressources Azure
azd provision

# 🧪 Aperçu des modifications d'infrastructure
azd provision --preview
# Affiche une vue simulée des ressources qui seraient créées/modifiées/supprimées
# Semblable à 'terraform plan' ou 'bicep what-if' - sûr à exécuter, aucune modification appliquée
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

### Compilation et Packaging
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

# Sélectionner l'environnement
azd env select production

# Afficher l'environnement actuel
azd env show

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
# Lister toute la configuration
azd config list

# Définir les valeurs par défaut globales
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Supprimer la configuration
azd config unset defaults.location

# Réinitialiser toute la configuration
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

# Ouvrir les mesures en direct d'Application Insights
azd monitor --live

# Ouvrir le volet des journaux d'Application Insights
azd monitor --logs

# Ouvrir le résumé d'Application Insights
azd monitor --overview
```

### Visualisation des Logs des Conteneurs
```bash
# Voir les logs via Azure CLI (pour Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Suivre les logs en temps réel
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Voir les logs depuis le portail Azure
azd monitor --logs
```

### Requêtes Log Analytics
```bash
# Accédez à l'analyse des journaux via le portail Azure
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

# Purger les ressources supprimées temporairement
azd down --purge

# Nettoyage complet
azd down --force --purge
```

### Mises à Jour
```bash
# Vérifier les mises à jour azd
azd version

# Obtenir la version actuelle
azd version

# Voir la configuration actuelle
azd config list
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

# 🧪 Prévisualisation et planification de l'infrastructure
azd provision --preview
# Simule la provision d'infrastructure sans déploiement
# Analyse les modèles Bicep/Terraform et affiche :
# - Ressources à ajouter (vert +)
# - Ressources à modifier (jaune ~)
# - Ressources à supprimer (rouge -)
# Sûr à exécuter - aucun changement réel apporté à l'environnement Azure

# Synthétiser l'infrastructure à partir de azure.yaml
azd infra synth
```

### Informations sur le Projet
```bash
# Afficher le statut du projet et les points de terminaison
azd show

# Afficher les informations détaillées du projet au format JSON
azd show --output json

# Obtenir les points de terminaison du service
azd show --output json | jq '.services'
```

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

### Workflow Multi-Environnement
```bash
# Configurer les environnements
azd env new dev
azd env new staging  
azd env new production

# Déployer en développement
azd env select dev
azd up

# Tester et promouvoir en préproduction
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
azd config list

# Ouvrir le tableau de bord de surveillance pour les journaux
azd monitor --logs

# Vérifier le statut des ressources
azd show --output json
```

## 🔍 Commandes de Débogage

### Informations de Debug
```bash
# Activer la sortie de débogage
export AZD_DEBUG=true
azd <command> --debug

# Désactiver la télémétrie pour une sortie plus claire
export AZD_DISABLE_TELEMETRY=true

# Vérifier la configuration actuelle
azd config list

# Vérifier le statut d'authentification
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
echo $AZD_CONFIG_DIR  # Généralement ~/.azd
```

## 🎨 Formatage de la Sortie

### Sortie JSON
```bash
# Obtenir une sortie JSON pour le script
azd show --output json
azd env list --output json
azd config list --output json

# Analyser avec jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Sortie Table
```bash
# Formater en tableau
azd env list --output table

# Voir les services déployés
azd show --output json | jq '.services | keys'
```

## 🔧 Combinaisons de Commandes Courantes

### Script de Vérification de Santé
```bash
#!/bin/bash
# Vérification rapide de santé
azd show
azd env show
azd monitor --logs
```

### Validation de Déploiement
```bash
#!/bin/bash
# Validation préalable au déploiement
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

# Vérifier le statut du déploiement
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

## 💡 Astuces Pro

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

# Statut de l'environnement
azd-status() {
    echo "Current environment:"
    azd env show
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

# Afficher les informations de version et de build
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

**Astuce** : Ajoutez cette fiche mémo à vos favoris et utilisez `Ctrl+F` pour trouver rapidement les commandes dont vous avez besoin !

---

**Navigation**
- **Leçon Précédente** : [Contrôles Préliminaires](../docs/pre-deployment/preflight-checks.md)
- **Leçon Suivante** : [Glossaire](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçons d’assurer l’exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d’origine doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction professionnelle humaine est recommandée. Nous ne saurions être tenus responsables de tout malentendu ou interprétation erronée résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->