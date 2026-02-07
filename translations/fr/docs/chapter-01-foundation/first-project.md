# Votre premier projet - Tutoriel pratique

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Bienvenue à votre premier projet Azure Developer CLI ! Ce tutoriel pratique et complet propose une visite guidée pour créer, déployer et gérer une application full-stack sur Azure en utilisant azd. Vous travaillerez avec une véritable application todo qui comprend un frontend React, un backend API Node.js et une base de données MongoDB.

## Learning Goals

En terminant ce tutoriel, vous allez :
- Maîtriser le flux d'initialisation de projet azd à l'aide de modèles
- Comprendre la structure d'un projet Azure Developer CLI et les fichiers de configuration
- Exécuter le déploiement complet d'une application sur Azure avec provisionnement d'infrastructure
- Mettre en œuvre des stratégies de mise à jour et de redéploiement d'application
- Gérer plusieurs environnements pour le développement et la préproduction
- Appliquer des pratiques de nettoyage des ressources et de gestion des coûts

## Learning Outcomes

À l'issue, vous serez capable de :
- Initialiser et configurer des projets azd à partir de modèles de façon autonome
- Naviguer et modifier efficacement les structures de projet azd
- Déployer des applications full-stack sur Azure avec une seule commande
- Dépanner les problèmes courants de déploiement et d'authentification
- Gérer plusieurs environnements Azure pour différentes étapes de déploiement
- Mettre en place des workflows de déploiement continu pour les mises à jour d'application

## Getting Started

### Prerequisites Checklist
- ✅ Azure Developer CLI installé ([Installation Guide](installation.md))
- ✅ Azure CLI installé et authentifié
- ✅ Git installé sur votre système
- ✅ Node.js 16+ (pour ce tutoriel)
- ✅ Visual Studio Code (recommandé)

### Verify Your Setup
```bash
# Vérifier l'installation d'azd
azd version
```
### Vérifier l'authentification Azure

```bash
az account show
```

### Vérifier la version de Node.js
```bash
node --version
```

## Step 1: Choose and Initialize a Template

Commençons par un modèle d'application todo populaire qui inclut un frontend React et un backend API Node.js.

```bash
# Parcourir les modèles disponibles
azd template list

# Initialiser le modèle d'application de tâches
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Suivez les invites:
# - Entrez un nom d'environnement : "dev"
# - Choisissez un abonnement (si vous en avez plusieurs)
# - Choisissez une région : "East US 2" (ou votre région préférée)
```

### Que s'est-il passé ?
- Téléchargement du code du modèle dans votre répertoire local
- Création d'un fichier `azure.yaml` avec les définitions de services
- Configuration du code d'infrastructure dans le répertoire `infra/`
- Création d'une configuration d'environnement

## Step 2: Explore the Project Structure

Examinons ce que azd a créé pour nous :

```bash
# Afficher la structure du projet
tree /f   # Windows
# ou
find . -type f | head -20   # macOS/Linux
```

You should see:
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

### Key Files to Understand

**azure.yaml** - Le cœur de votre projet azd :
```bash
# Afficher la configuration du projet
cat azure.yaml
```

**infra/main.bicep** - Définition de l'infrastructure :
```bash
# Afficher le code d'infrastructure
head -30 infra/main.bicep
```

## Step 3: Customize Your Project (Optional)

Avant de déployer, vous pouvez personnaliser l'application :

### Modify the Frontend
```bash
# Ouvrez le composant de l'application React
code src/web/src/App.tsx
```

Effectuez un changement simple :
```typescript
// Trouvez le titre et changez-le
<h1>My Awesome Todo App</h1>
```

### Configure Environment Variables
```bash
# Définir des variables d'environnement personnalisées
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Afficher toutes les variables d'environnement
azd env get-values
```

## Step 4: Deploy to Azure

Passons à la partie excitante : déployez tout sur Azure !

```bash
# Déployer l'infrastructure et l'application
azd up

# Cette commande va:
# 1. Provisionner les ressources Azure (App Service, Cosmos DB, etc.)
# 2. Construire votre application
# 3. Déployer sur les ressources provisionnées
# 4. Afficher l'URL de l'application
```

### Que se passe-t-il pendant le déploiement ?

La commande `azd up` exécute ces étapes :
1. **Provision** (`azd provision`) - Crée des ressources Azure
2. **Package** - Construit le code de votre application
3. **Deploy** (`azd deploy`) - Déploie le code vers les ressources Azure

### Résultat attendu
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Step 5: Test Your Application

### Access Your Application
Cliquez sur l'URL fournie dans la sortie du déploiement, ou récupérez-la à tout moment :
```bash
# Obtenir les points de terminaison de l'application
azd show

# Ouvrir l'application dans votre navigateur
azd show --output json | jq -r '.services.web.endpoint'
```

### Test the Todo App
1. **Add a todo item** - Cliquez sur "Add Todo" et entrez une tâche
2. **Mark as complete** - Cochez les éléments terminés
3. **Delete items** - Supprimez les todos dont vous n'avez plus besoin

### Monitor Your Application
```bash
# Ouvrez le portail Azure pour vos ressources
azd monitor

# Afficher les journaux de l'application
azd monitor --logs

# Afficher les métriques en temps réel
azd monitor --live
```

## Step 6: Make Changes and Redeploy

Apportons une modification et voyons à quel point il est facile de mettre à jour :

### Modify the API
```bash
# Modifier le code de l'API
code src/api/src/routes/lists.js
```

Ajouter un en-tête de réponse personnalisé :
```javascript
// Trouvez un gestionnaire de route et ajoutez :
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Deploy Just the Code Changes
```bash
# Déployer uniquement le code de l'application (ignorer l'infrastructure)
azd deploy

# C'est beaucoup plus rapide que 'azd up' puisque l'infrastructure existe déjà
```

## Step 7: Manage Multiple Environments

Créez un environnement de préproduction pour tester les modifications avant la production :

```bash
# Créer un nouvel environnement de préproduction
azd env new staging

# Déployer en préproduction
azd up

# Revenir à l'environnement de développement
azd env select dev

# Lister tous les environnements
azd env list
```

### Environment Comparison
```bash
# Voir l'environnement de développement
azd env select dev
azd show

# Voir l'environnement de préproduction
azd env select staging
azd show
```

## Step 8: Clean Up Resources

Lorsque vous avez terminé vos expérimentations, nettoyez pour éviter des frais récurrents :

```bash
# Supprimer toutes les ressources Azure pour l'environnement actuel
azd down

# Forcer la suppression sans confirmation et purger les ressources marquées comme supprimées (soft-deleted)
azd down --force --purge

# Supprimer un environnement spécifique
azd env select staging
azd down --force --purge
```

## What You've Learned

Félicitations ! Vous avez réussi à :
- ✅ Initialisé un projet azd à partir d'un modèle
- ✅ Exploré la structure du projet et les fichiers clés
- ✅ Déployé une application full-stack sur Azure
- ✅ Effectué des modifications de code et redéployé
- ✅ Géré plusieurs environnements
- ✅ Nettoyé les ressources

## 🎯 Skill Validation Exercises

### Exercise 1: Deploy a Different Template (15 minutes)
**Goal**: Demonstrate mastery of azd init and deployment workflow

```bash
# Essayer la pile Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Vérifier le déploiement
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Nettoyer
azd down --force --purge
```

**Success Criteria:**
- [ ] L'application se déploie sans erreurs
- [ ] Peut accéder à l'URL de l'application dans le navigateur
- [ ] L'application fonctionne correctement (ajout/suppression de todos)
- [ ] Toutes les ressources ont été supprimées avec succès

### Exercise 2: Customize Configuration (20 minutes)
**Goal**: Practice environment variable configuration

```bash
cd my-first-azd-app

# Créer un environnement personnalisé
azd env new custom-config

# Définir des variables personnalisées
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Vérifier les variables
azd env get-values | grep APP_TITLE

# Déployer avec une configuration personnalisée
azd up
```

**Success Criteria:**
- [ ] Environnement personnalisé créé avec succès
- [ ] Variables d'environnement définies et récupérables
- [ ] L'application se déploie avec la configuration personnalisée
- [ ] Possibilité de vérifier les paramètres personnalisés dans l'application déployée

### Exercise 3: Multi-Environment Workflow (25 minutes)
**Goal**: Master environment management and deployment strategies

```bash
# Créer l'environnement de développement
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Noter l'URL de développement
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Créer l'environnement de préproduction
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Noter l'URL de préproduction
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Comparer les environnements
azd env list

# Tester les deux environnements
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Nettoyer les deux environnements
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Success Criteria:**
- [ ] Deux environnements créés avec des configurations différentes
- [ ] Les deux environnements déployés avec succès
- [ ] Possibilité de basculer entre les environnements avec `azd env select`
- [ ] Les variables d'environnement diffèrent entre les environnements
- [ ] Les deux environnements ont été nettoyés avec succès

## 📊 Your Progress

**Time Invested**: ~60-90 minutes  
**Skills Acquired**:
- ✅ Template-based project initialization
- ✅ Azure resource provisioning
- ✅ Application deployment workflows
- ✅ Environment management
- ✅ Configuration management
- ✅ Resource cleanup and cost management

**Next Level**: You're ready for [Configuration Guide](configuration.md) to learn advanced configuration patterns!

## Troubleshooting Common Issues

### Authentication Errors
```bash
# Se réauthentifier auprès d'Azure
az login

# Vérifier l'accès à l'abonnement
az account show
```

### Deployment Failures
```bash
# Activer la journalisation de débogage
export AZD_DEBUG=true
azd up --debug

# Voir les journaux de l'application dans Azure
azd monitor --logs

# Pour Container Apps, utilisez Azure CLI :
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resource Name Conflicts
```bash
# Utilisez un nom d'environnement unique
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network Issues
```bash
# Vérifier si les ports sont disponibles
netstat -an | grep :3000
netstat -an | grep :3100
```

## Next Steps

Now that you've completed your first project, explore these advanced topics:

### 1. Customize Infrastructure
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Set Up CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Complete CI/CD workflows
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline configuration

### 3. Production Best Practices
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Security, performance, and monitoring

### 4. Explore More Templates
```bash
# Parcourir les modèles par catégorie
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Essayez différentes piles technologiques
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Additional Resources

### Learning Materials
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates & Examples
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Congratulations on completing your first azd project!** You're now ready to build and deploy amazing applications on Azure with confidence.

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Avis de non-responsabilité :
Ce document a été traduit à l'aide du service de traduction par IA Co-op Translator (https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des imprécisions. Le document original, dans sa langue d'origine, doit être considéré comme la source faisant foi. Pour les informations critiques, il est recommandé de faire appel à une traduction professionnelle réalisée par un traducteur humain. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->