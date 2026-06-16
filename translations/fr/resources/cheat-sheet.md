# Fiche de Référence des Commandes - Commandes essentielles d'AZD

**Référence rapide pour tous les chapitres**
- **📚 Accueil du cours** : [AZD Pour Débutants](../README.md)
- **📖 Démarrage rapide** : [Chapitre 1 : Fondations & Démarrage rapide](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Commandes IA** : [Chapitre 2 : Développement axé sur l'IA](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avancé** : [Chapitre 4 : Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduction

Cette fiche complète fournit une référence rapide pour les commandes Azure Developer CLI les plus couramment utilisées, organisées par catégorie avec des exemples pratiques. Parfait pour des recherches rapides durant le développement, le dépannage et les opérations quotidiennes avec les projets azd.

## Objectifs d'apprentissage

En utilisant cette fiche, vous pourrez :
- Avoir un accès instantané aux commandes et à la syntaxe essentielles d'Azure Developer CLI
- Comprendre l'organisation des commandes par catégories fonctionnelles et cas d'usage
- Consulter des exemples pratiques pour les scénarios courants de développement et déploiement
- Accéder aux commandes de dépannage pour une résolution rapide des problèmes
- Trouver efficacement les options avancées de configuration et personnalisation
- Localiser les commandes de gestion d'environnement et les workflows multi-environnements

## Résultats d'apprentissage

Avec une utilisation régulière de cette fiche, vous serez capable de :
- Exécuter les commandes azd en toute confiance sans consulter la documentation complète
- Résoudre rapidement les problèmes courants grâce aux commandes de diagnostic appropriées
- Gérer efficacement plusieurs environnements et scénarios de déploiement
- Appliquer les fonctionnalités avancées et options de configuration azd selon les besoins
- Dépanner les problèmes de déploiement en utilisant des séquences de commandes systématiques
- Optimiser les workflows via l’utilisation efficace des raccourcis et options azd

## Commandes Pour Commencer

### Authentification
```bash
# Connexion à Azure via AZD
azd auth login

# Connexion à Azure CLI (AZD utilise ceci en interne)
az login

# Vérifier le compte actuel
az account show

# Définir l'abonnement par défaut
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Déconnexion de AZD
azd auth logout

# Déconnexion de Azure CLI
az logout
```

### Initialisation de Projet
```bash
# Parcourir les modèles disponibles
azd template list

# Initialiser à partir d'un modèle
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialiser dans le répertoire actuel
azd init .

# Initialiser avec un nom personnalisé
azd init --template todo-nodejs-mongo my-awesome-app
```

## Commandes de Déploiement Principales

### Workflow complet de déploiement
```bash
# Tout déployer (approvisionnement + déploiement)
azd up

# Déployer avec les invites de confirmation désactivées
azd up --confirm-with-no-prompt

# Déployer dans un environnement spécifique
azd up --environment production

# Déployer avec des paramètres personnalisés
azd up --parameter location=westus2
```

### Infrastructure uniquement
```bash
# Provisionner les ressources Azure
azd provision

# 🧪 Prévisualiser les changements d'infrastructure
azd provision --preview
# Affiche une vue en simulation de ce que les ressources seraient créées/modifiées/supprimées
# Semblable à 'terraform plan' ou 'bicep what-if' - sûr à exécuter, aucun changement appliqué
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

### Compilation et Packaging
```bash
# Restaurer (télécharger) les dépendances de l'application
azd restore

# Restaurer un service spécifique
azd restore --service api

# Construire un artefact déployable sans déployer
azd package

# Construire un service spécifique
azd package --service api
```

> **`azd restore`** télécharge les dépendances de votre application (npm, pip, NuGet, Maven, etc.). Cette commande s’exécute automatiquement pendant `azd package` et `azd deploy`, vous n'avez donc que rarement à l’appeler directement — lancez-la manuellement pour précharger les dépendances (par exemple, pour chauffer un cache CI ou travailler hors ligne ensuite).

> **`azd package`** construit l’artefact déployable (une image conteneur ou un zip) **sans** le pousser vers Azure. Utilisez-la seule pour vérifier le succès d’une compilation, inspecter la sortie, ou produire un artefact qu’un processus séparé déploiera plus tard. `azd deploy` package automatiquement, vous n’avez donc besoin de `azd package` que lorsque vous souhaitez l’artefact sans déploiement.


## 🌍 Gestion des Environnements

### Opérations sur l'Environnement
```bash
# Lister tous les environnements
azd env list

# Créer un nouvel environnement
azd env new development
azd env new staging --location westus2

# Sélectionner l'environnement
azd env select production

# Afficher les environnements disponibles
azd env list

# Actualiser l'état de l'environnement
azd env refresh
```

### Variables d'Environnement
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
azd config show

# Définir les paramètres globaux par défaut
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

### Visualisation des logs du conteneur
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
# Accéder à Log Analytics via le portail Azure
azd monitor --logs

# Interroger les journaux à l'aide de l'interface Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Commandes de Maintenance

### Nettoyage
```bash
# Supprimer toutes les ressources Azure
azd down

# Supprimer de force sans confirmation
azd down --force

# Purger les ressources supprimées de façon temporaire
azd down --purge

# Nettoyage complet
azd down --force --purge
```

### Mises à jour
```bash
# Vérifier les mises à jour azd
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

### Gestion de l'infrastructure
```bash
# Générer des modèles d'infrastructure
azd infra generate

# 🧪 Aperçu et Planification de l'Infrastructure
azd provision --preview
# Simule la mise en place de l'infrastructure sans déploiement
# Analyse les modèles Bicep/Terraform et affiche :
# - Ressources à ajouter (vert +)
# - Ressources à modifier (jaune ~)
# - Ressources à supprimer (rouge -)
# Sûr à exécuter - aucun changement réel effectué dans l'environnement Azure

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

## 🤖 Commandes IA & Extensions

### Extensions AZD
```bash
# Lister toutes les extensions disponibles (y compris l'IA)
azd extension list

# Installer l'extension des agents Foundry
azd extension install azure.ai.agents

# Installer l'extension des compétences des agents (aperçu)
azd extension install azure.ai.skills

# Installer l'extension des connexions Foundry (aperçu)
azd extension install azure.ai.connections

# Installer l'extension de réglage fin
azd extension install azure.ai.finetune

# Installer l'extension des modèles personnalisés
azd extension install azure.ai.models

# Mettre à jour toutes les extensions installées
azd extension upgrade --all
```

### Commandes Agent IA
```bash
# Initialiser un projet d'agent à partir d'un manifeste
azd ai agent init -m <manifest-path-or-uri>

# Cibler un projet Foundry spécifique
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Spécifier le répertoire source de l'agent
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Choisir une cible d'hébergement
azd ai agent init -m agent-manifest.yaml --host containerapp

# Tester un agent déployé (affiche la latence + le temps jusqu'au premier octet)
azd ai agent invoke

# Afficher la configuration du point de terminaison en direct
azd ai agent endpoint show

# Générer un jeu de données d'évaluation, puis optimiser l'agent
azd ai agent eval generate
azd ai agent optimize

# Télécharger la source déployée d'un agent hébergé basé sur du code
azd ai agent code download

# Supprimer un agent hébergé et toutes ses versions (--force termine les sessions actives)
azd ai agent delete --force
```

### Serveur MCP (Alpha)
```bash
# Démarrez le serveur MCP pour votre projet
azd mcp start

# Gérer le consentement des outils pour les opérations MCP
azd copilot consent list
```

### Génération d'Infrastructure
```bash
# Générer des fichiers IaC à partir de la définition de votre projet
azd infra generate

# Synthétiser l'infrastructure à partir de azure.yaml
azd infra synth
```

---

## 🎯 Workflows rapides

### Workflow de développement
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

### Workflow multi-environnements
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

### Workflow de dépannage
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

## 🔍 Commandes de débogage

### Informations de débogage
```bash
# Activer la sortie de débogage
export AZD_DEBUG=true
azd <command> --debug

# Désactiver la télémétrie pour une sortie plus propre
export AZD_DISABLE_TELEMETRY=true

# Vérifier la configuration actuelle
azd config show

# Vérifier le statut d'authentification
az account show
```

### Débogage de template
```bash
# Lister les modèles disponibles avec détails
azd template list --output json

# Afficher les informations du modèle
azd template show <template-name>

# Valider le modèle avant l'initialisation
azd template validate <template-name>
```

## 📁 Commandes de fichiers et répertoires

### Structure du projet
```bash
# Afficher la structure du répertoire courant
tree /f  # Windows
find . -type f  # Linux/macOS

# Naviguer vers la racine du projet azd
cd $(azd root)

# Afficher le répertoire de configuration azd
echo $AZD_CONFIG_DIR  # Habituellement ~/.azd
```

## 🎨 Formatage de sortie

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

### Sortie en tableau
```bash
# Formater en tableau
azd env list --output table

# Voir les services déployés
azd show --output json | jq '.services | keys'
```

## 🔧 Combinaisons communes de commandes

### Script de vérification de santé
```bash
#!/bin/bash
# Vérification rapide de l'état de santé
azd show
azd env get-values
azd monitor --logs
```

### Validation de déploiement
```bash
#!/bin/bash
# Validation pré-déploiement
azd show
azd provision --preview  # Aperçu des modifications avant déploiement
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

# Vérifier le statut du déploiement
azd show --output json
```

### Commandes de récupération
```bash
# Récupérer d'un déploiement échoué - nettoyer et redéployer
azd down --force --purge
azd up

# Réapprovisionner uniquement l'infrastructure
azd provision

# Redéployer uniquement l'application
azd deploy
```

## 💡 Astuces de pro

### Alias pour un workflow plus rapide
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
    azd env get-values
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

# Afficher la version et les informations de build
azd version
azd version --output json
```

### Liens de documentation
```bash
# Ouvrir la documentation dans le navigateur
azd docs

# Afficher la documentation du modèle
azd template show <template-name> --docs
```

---

**Astuce** : Ajoutez cette fiche à vos favoris et utilisez `Ctrl+F` pour trouver rapidement les commandes dont vous avez besoin !

---

**Navigation**
- **Leçon précédente** : [Vérifications préalables](../docs/pre-deployment/preflight-checks.md)
- **Leçon suivante** : [Glossaire](glossary.md)

---

> **💡 Vous voulez de l’aide pour les commandes Azure dans votre éditeur ?** Installez [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) avec `npx skills add microsoft/github-copilot-for-azure` — 37 compétences pour l’IA, Foundry, le déploiement, le diagnostic, et plus.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->