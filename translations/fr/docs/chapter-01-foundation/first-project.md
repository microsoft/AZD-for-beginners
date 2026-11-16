# Votre Premier Projet - Tutoriel Pratique

**Navigation dans le Chapitre :**
- **📚 Accueil du Cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre Actuel** : Chapitre 1 - Fondations & Démarrage Rapide
- **⬅️ Précédent** : [Installation & Configuration](installation.md)
- **➡️ Suivant** : [Apportez Votre Propre Application](bring-your-own-app.md)
- **🚀 Chapitre Suivant** : [Chapitre 2 : Développement IA-Première](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Bienvenue dans votre premier projet Azure Developer CLI ! Vous allez déployer une application todo avec un frontend React, une API Node.js, et une base de données Azure Cosmos DB. Le modèle conserve le nom historique `todo-nodejs-mongo` ; son infrastructure actuelle utilise Cosmos DB pour NoSQL, donc inspectez le README téléchargé et `infra/` plutôt que d'inférer l'API de la base de données d'après le nom.

> Revu selon `azd 1.37.2` et le modèle public en novembre 2026. Les exemples ci-dessous utilisent Bash ; l'extraction JSON nécessite également `jq`. Les déploiements Azure engendrent des frais et n'ont pas été exécutés lors de cette revue.

## Objectifs d'Apprentissage

En complétant ce tutoriel, vous allez :
- Maîtriser le flux d'initialisation de projet azd avec des modèles
- Comprendre la structure du projet Azure Developer CLI et les fichiers de configuration
- Exécuter un déploiement complet d'application sur Azure avec provisionnement de l'infrastructure
- Mettre en œuvre des stratégies de mise à jour et redéploiement de l'application
- Gérer plusieurs environnements pour le développement et la préproduction
- Appliquer des pratiques de nettoyage des ressources et gestion des coûts

## Résultats d'Apprentissage

À l'issue, vous serez capable de :
- Initialiser et configurer des projets azd à partir de modèles de façon autonome
- Naviguer et modifier efficacement les structures de projets azd
- Déployer des applications full-stack sur Azure avec une seule commande
- Dépanner des problèmes communs de déploiement et d'authentification
- Gérer plusieurs environnements Azure pour différentes étapes de déploiement
- Mettre en place des workflows de déploiement continu pour les mises à jour d'application

## Prise en Main

### Liste de Prérequis
- ✅ Azure Developer CLI installé ([Guide d'Installation](installation.md))
- ✅ Authentification AZD complétée avec `azd auth login`
- ✅ Git installé sur votre système
- ✅ Node.js 22 LTS (ou une version supportée requise par le modèle téléchargé)
- ✅ Visual Studio Code (recommandé)

Avant de continuer, lancez le validateur de configuration depuis la racine du dépôt :

**Windows :** `./validate-setup.ps1`

**macOS / Linux :** `bash ./validate-setup.sh`

### Vérifiez Votre Configuration
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Vérifiez l'authentification optionnelle Azure CLI

```bash
az account show
```

### Vérifiez la version de Node.js
```bash
node --version
```

## Étape 1 : Choisir et Initialiser un Modèle

Commençons avec un modèle d'application todo populaire incluant un frontend React et un backend API Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Que s'est-il passé ?
- Le code du modèle a été téléchargé dans votre répertoire local
- Un fichier `azure.yaml` a été créé avec les définitions des services
- Code d'infrastructure configuré dans le répertoire `infra/`
- Une configuration d'environnement a été créée

## Étape 2 : Explorer la Structure du Projet

Examinons ce que azd a créé pour nous :

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Vous devriez voir :
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
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

## Étape 3 : Personnalisez Votre Projet (Optionnel)

Avant de déployer, vous pouvez personnaliser l'application :

### Modifiez le Frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Faites une modification simple :
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Configurez les Variables d'Environnement
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Ces deux valeurs personnalisées démontrent uniquement le stockage local. Le modèle de base ne consomme pas `WEBSITE_TITLE` ni `API_VERSION`, elles ne modifient donc pas l'application. L'édition de source explicite ci-dessus change le titre affiché.

## Étape 4 : Déployez sur Azure

Maintenant la partie passionnante - déployez tout sur Azure !

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

Le workflow provisionne l'infrastructure et empaquette/déploie le code. L'ordre exact peut être personnalisé via `workflows.up` dans `azure.yaml` ; ce modèle spécifie provision puis déploiement. Ne comptez pas sur un ordre universel de phases pour chaque modèle.

### Sortie Attendue
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Étape 5 : Testez Votre Application

### Accédez à Votre Application
Cliquez sur l'URL fournie dans la sortie de déploiement, ou récupérez-la à tout moment :
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Testez l'Application Todo
1. **Ajoutez une tâche** - Cliquez sur "Add Todo" et entrez une tâche
2. **Marquez comme terminée** - Cochez les éléments complétés
3. **Supprimez des éléments** - Retirez les todos dont vous n'avez plus besoin

### Surveillez Votre Application
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Vérifiez Votre Déploiement

Avant de continuer, passez en revue cette checklist rapide pour confirmer que tout fonctionne réellement—ne supposez pas que "déploiement réussi" signifie "application fonctionnelle" :

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Le déploiement est vérifié lorsque :**
- ✅ `azd show` liste une URL d'endpoint accessible
- ✅ L'URL s'ouvre dans votre navigateur sans erreurs
- ✅ Les fonctionnalités principales fonctionnent (ajout/complétion/suppression d'un todo)
- ✅ `azd monitor --logs` montre que les requêtes arrivent sans erreurs inattendues

Si un contrôle échoue, passez au [Chapitre 7 : Dépannage](../chapter-07-troubleshooting/README.md).

## Étape 6 : Apportez des Modifications et Redéployez

Apportons une modification et voyons combien il est facile de mettre à jour :

### Modifiez l'API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Ajoutez un en-tête de réponse personnalisé :
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Déployez uniquement les changements de code
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Étape 7 : Gérez Plusieurs Environnements

Créez un environnement de staging pour tester les changements avant la production :

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

## Étape 8 : Nettoyez les Ressources

Quand vous avez fini d'expérimenter, nettoyez pour éviter les frais continus :

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Application Classique vs Application IA : Même Workflow

Vous venez de déployer une application web traditionnelle. Mais que se passe-t-il si vous voulez déployer une app alimentée par IA—par exemple, une application de chat basée sur Microsoft Foundry Models ?

La bonne nouvelle : **le workflow est identique.**

| Étape | Application Todo Classique | Application Chat IA |
|------|-------------------------|----------------------|
| Initialiser (répertoire vide) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Authentifier | `azd auth login` | `azd auth login` |
| Déployer | `azd up` | `azd up` |
| Surveiller | `azd monitor` | `azd monitor` |
| Nettoyer | `azd down --force --purge` | `azd down --force --purge` |

Les commandes du cycle de vie sont les mêmes, mais les prérequis diffèrent. Un modèle IA peut nécessiter accès aux modèles, quota régional, ingestion de données, et configuration additionnelle. Lisez son README avant le déploiement ; `azd up` ne peut pas fournir les permissions ou quotas manquants.

C'est le principe clé d'azd : **un workflow, toute charge de travail.** Les compétences exercées dans ce tutoriel—initialisation, déploiement, surveillance, redéploiement, et nettoyage—s'appliquent également aux applications et agents IA.

---

## Ce que Vous Avez Appris

Félicitations ! Vous avez réussi à :
- ✅ Initialiser un projet azd à partir d'un modèle
- ✅ Explorer la structure du projet et les fichiers clés
- ✅ Déployer une application full-stack sur Azure
- ✅ Apporter des modifications de code et redéployer
- ✅ Gérer plusieurs environnements
- ✅ Nettoyer les ressources

## 🎯 Exercices de Validation des Compétences

### Exercice 1 : Déployez un Modèle Différent (15 minutes)
**Objectif** : Maîtriser azd init et le workflow de déploiement

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Critères de Réussite :**
- [ ] L'application se déploie sans erreurs
- [ ] Peut accéder à l'URL de l'application dans un navigateur
- [ ] L'application fonctionne correctement (ajout/suppression de todos)
- [ ] Toutes les ressources sont correctement nettoyées

### Exercice 2 : Personnaliser la Configuration (20 minutes)
**Objectif** : Pratiquer le stockage local des valeurs d'environnement sans confondre avec la configuration d'exécution

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Critères de Réussite :**
- [ ] Environnement personnalisé créé avec succès
- [ ] Variables d'environnement définies et récupérables
- [ ] `azd env get-value APP_TITLE` affiche `My Custom Todo App`
- [ ] Peut expliquer pourquoi ces valeurs ne changent pas l'application de base sauf si le code/l'infrastructure les consomme

### Exercice 3 : Workflow Multi-Environnement (25 minutes)
**Objectif** : Maîtriser la gestion des environnements et les stratégies de déploiement

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Critères de Réussite :**
- [ ] Deux environnements créés avec des configurations différentes
- [ ] Les deux environnements déployés avec succès
- [ ] Peut basculer entre environnements avec `azd env select`
- [ ] Variables d'environnement différentes selon l'environnement
- [ ] Les deux environnements nettoyés avec succès

## 📊 Vos Progrès

**Temps Investi** : ~60-90 minutes  
**Compétences Acquises** :
- ✅ Initialisation de projet basée sur modèles
- ✅ Provisionnement de ressources Azure
- ✅ Workflows de déploiement d'applications
- ✅ Gestion des environnements
- ✅ Gestion de configuration
- ✅ Nettoyage des ressources et gestion des coûts

**Niveau Suivant** : Vous êtes prêt pour le [Guide de Configuration](../chapter-03-configuration/configuration.md) pour apprendre les motifs avancés de configuration !

## Dépannage des Problèmes Courants

### Erreurs d'Authentification
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Échecs de Déploiement
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
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

## Étapes Suivantes

Maintenant que vous avez terminé votre premier projet, explorez ces sujets avancés :

### 1. Personnalisez l'Infrastructure
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Ajoutez une infrastructure de base de données](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Configurez CI/CD
- [Guide de Déploiement](../chapter-04-infrastructure/deployment-guide.md) - Workflows CI/CD complets
- [Documentation Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configuration de pipeline

### 3. Bonnes Pratiques en Production
- [Guide de Déploiement](../chapter-04-infrastructure/deployment-guide.md) - Sécurité, performance et surveillance

### 4. Explorez Plus de Modèles
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Ressources Additionnelles

### Matériel d'Apprentissage
- [Documentation Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centre d'Architecture Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Communauté & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Communauté des Développeurs Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Modèles & Exemples
- [Galerie Officielle de Modèles](https://azure.github.io/awesome-azd/)
- [Contributions Communautaires de Modèles](https://github.com/Azure/awesome-azd)
- [Source du Modèle Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Félicitations pour avoir complété votre premier projet azd !** Vous êtes maintenant prêt à créer et déployer des applications incroyables sur Azure en toute confiance.

---

**Navigation dans le Chapitre :**
- **📚 Accueil du Cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre Actuel** : Chapitre 1 - Fondations & Démarrage Rapide
- **⬅️ Précédent** : [Installation & Configuration](installation.md)
- **➡️ Suivant** : [Apportez Votre Propre Application](bring-your-own-app.md)
- **🚀 Chapitre Suivant** : [Chapitre 2 : Développement IA-Première](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->