<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d0054b58dbf5baa786403593d848de4a",
  "translation_date": "2025-09-10T12:46:41+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "fr"
}
-->
# Votre Premier Projet - Tutoriel Pratique

## Introduction

Bienvenue dans votre premier projet avec Azure Developer CLI ! Ce tutoriel pratique complet vous guide pas à pas pour créer, déployer et gérer une application full-stack sur Azure en utilisant azd. Vous travaillerez sur une véritable application de gestion de tâches comprenant un frontend React, un backend API Node.js et une base de données MongoDB.

## Objectifs d'Apprentissage

En complétant ce tutoriel, vous allez :
- Maîtriser le workflow d'initialisation de projet azd à l'aide de modèles
- Comprendre la structure des projets Azure Developer CLI et les fichiers de configuration
- Effectuer un déploiement complet d'application sur Azure avec provisionnement d'infrastructure
- Mettre en œuvre des mises à jour d'application et des stratégies de redéploiement
- Gérer plusieurs environnements pour le développement et la mise en staging
- Appliquer des pratiques de nettoyage des ressources et de gestion des coûts

## Résultats d'Apprentissage

À la fin de ce tutoriel, vous serez capable de :
- Initialiser et configurer des projets azd à partir de modèles de manière autonome
- Naviguer et modifier efficacement les structures de projets azd
- Déployer des applications full-stack sur Azure avec des commandes simples
- Résoudre les problèmes courants de déploiement et d'authentification
- Gérer plusieurs environnements Azure pour différentes étapes de déploiement
- Mettre en œuvre des workflows de déploiement continu pour les mises à jour d'application

## Prise en Main

### Liste de Prérequis
- ✅ Azure Developer CLI installé ([Guide d'Installation](installation.md))
- ✅ Azure CLI installé et authentifié
- ✅ Git installé sur votre système
- ✅ Node.js 16+ (pour ce tutoriel)
- ✅ Visual Studio Code (recommandé)

### Vérifiez votre Configuration
```bash
# Check azd installation
azd version
```
### Vérifiez l'authentification Azure

```bash
az account show
```

### Vérifiez la version de Node.js
```bash
node --version
```

## Étape 1 : Choisir et Initialiser un Modèle

Commençons avec un modèle populaire d'application de gestion de tâches comprenant un frontend React et un backend API Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Que s'est-il passé ?
- Le code du modèle a été téléchargé dans votre répertoire local
- Un fichier `azure.yaml` a été créé avec les définitions de service
- Le code d'infrastructure a été configuré dans le répertoire `infra/`
- Une configuration d'environnement a été créée

## Étape 2 : Explorer la Structure du Projet

Examinons ce qu'azd a créé pour nous :

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Vous devriez voir :
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Fichiers Clés à Comprendre

**azure.yaml** - Le cœur de votre projet azd :
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Définition de l'infrastructure :
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Étape 3 : Personnaliser votre Projet (Optionnel)

Avant de déployer, vous pouvez personnaliser l'application :

### Modifier le Frontend
```bash
# Open the React app component
code src/web/src/App.tsx
```

Faites un simple changement :
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Configurer les Variables d'Environnement
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Étape 4 : Déployer sur Azure

Passons maintenant à l'étape excitante : tout déployer sur Azure !

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Que se passe-t-il pendant le déploiement ?

La commande `azd up` effectue les étapes suivantes :
1. **Provision** (`azd provision`) - Crée les ressources Azure
2. **Package** - Construit le code de votre application
3. **Deploy** (`azd deploy`) - Déploie le code sur les ressources Azure

### Résultat Attendu
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Étape 5 : Tester votre Application

### Accéder à votre Application
Cliquez sur l'URL fournie dans le résultat du déploiement, ou récupérez-la à tout moment :
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Tester l'Application de Gestion de Tâches
1. **Ajouter une tâche** - Cliquez sur "Add Todo" et entrez une tâche
2. **Marquer comme terminée** - Cochez les tâches terminées
3. **Supprimer des tâches** - Retirez les tâches dont vous n'avez plus besoin

### Surveiller votre Application
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Étape 6 : Apporter des Modifications et Redéployer

Apportons une modification et voyons à quel point il est facile de mettre à jour :

### Modifier l'API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Ajoutez un en-tête de réponse personnalisé :
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Déployer Uniquement les Modifications de Code
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Étape 7 : Gérer Plusieurs Environnements

Créez un environnement de staging pour tester les modifications avant la production :

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Comparaison des Environnements
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Étape 8 : Nettoyer les Ressources

Une fois vos expérimentations terminées, nettoyez pour éviter des frais continus :

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Ce que Vous Avez Appris

Félicitations ! Vous avez réussi à :
- Initialiser un projet azd à partir d'un modèle
- Explorer la structure du projet et les fichiers clés
- Déployer une application full-stack sur Azure
- Apporter des modifications au code et redéployer
- Gérer plusieurs environnements
- Nettoyer les ressources

## Résolution des Problèmes Courants

### Erreurs d'Authentification
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Échecs de Déploiement
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Conflits de Noms de Ressources
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Problèmes de Port/Réseau
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Prochaines Étapes

Maintenant que vous avez terminé votre premier projet, explorez ces sujets avancés :

### 1. Personnaliser l'Infrastructure
- [Infrastructure as Code](../deployment/provisioning.md)
- [Ajouter des bases de données, du stockage et d'autres services](../deployment/provisioning.md#adding-services)

### 2. Configurer CI/CD
- [Intégration GitHub Actions](../deployment/cicd-integration.md)
- [Pipelines Azure DevOps](../deployment/cicd-integration.md#azure-devops)

### 3. Bonnes Pratiques en Production
- [Configurations de sécurité](../deployment/best-practices.md#security)
- [Optimisation des performances](../deployment/best-practices.md#performance)
- [Surveillance et journalisation](../deployment/best-practices.md#monitoring)

### 4. Explorer Plus de Modèles
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Ressources Supplémentaires

### Matériaux d'Apprentissage
- [Documentation Azure Developer CLI](https://learn.microsoft.com/fr-fr/azure/developer/azure-developer-cli/)
- [Centre d'Architecture Azure](https://learn.microsoft.com/fr-fr/azure/architecture/)
- [Framework Azure Well-Architected](https://learn.microsoft.com/fr-fr/azure/well-architected/)

### Communauté & Support
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Communauté des Développeurs Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Modèles & Exemples
- [Galerie Officielle de Modèles](https://azure.github.io/awesome-azd/)
- [Modèles Communautaires](https://github.com/Azure-Samples/azd-templates)
- [Modèles pour Entreprises](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Félicitations pour avoir terminé votre premier projet azd !** Vous êtes maintenant prêt à créer et déployer des applications incroyables sur Azure avec confiance.

---

**Navigation**
- **Leçon Précédente** : [Configuration](configuration.md)
- **Leçon Suivante** : [Guide de Déploiement](../deployment/deployment-guide.md)

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de faire appel à une traduction humaine professionnelle. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.