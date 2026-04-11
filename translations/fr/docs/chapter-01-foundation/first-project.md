# Votre Premier Projet - Tutoriel Pratique

**Navigation du Chapitre :**
- **📚 Accueil du Cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre Actuel** : Chapitre 1 - Fondations & Démarrage Rapide
- **⬅️ Précédent** : [Installation & Configuration](installation.md)
- **➡️ Suivant** : [Configuration](configuration.md)
- **🚀 Chapitre Suivant** : [Chapitre 2 : Développement AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Bienvenue dans votre premier projet Azure Developer CLI ! Ce tutoriel pratique complet vous guide à travers la création, le déploiement et la gestion d'une application full-stack sur Azure en utilisant azd. Vous travaillerez avec une vraie application todo comprenant un frontend React, un backend API Node.js et une base de données MongoDB.

## Objectifs d'Apprentissage

En suivant ce tutoriel, vous allez :
- Maîtriser le workflow d'initialisation de projet azd avec des modèles
- Comprendre la structure des projets Azure Developer CLI et les fichiers de configuration
- Exécuter un déploiement complet d’application sur Azure avec provisionnement d’infrastructure
- Mettre en œuvre des stratégies de mise à jour et de redéploiement de l’application
- Gérer plusieurs environnements pour le développement et la préproduction
- Appliquer les bonnes pratiques de nettoyage des ressources et de gestion des coûts

## Résultats d'Apprentissage

Une fois terminé, vous serez capable de :
- Initialiser et configurer des projets azd à partir de modèles de manière autonome
- Naviguer et modifier efficacement la structure des projets azd
- Déployer des applications full-stack sur Azure en quelques commandes
- Résoudre les problèmes courants de déploiement et d’authentification
- Gérer plusieurs environnements Azure pour différentes phases de déploiement
- Mettre en place des workflows de déploiement continu pour les mises à jour d’applications

## Pour Commencer

### Liste de Prérequis
- ✅ Azure Developer CLI installé ([Guide d’Installation](installation.md))
- ✅ Authentification AZD réalisée avec `azd auth login`
- ✅ Git installé sur votre système
- ✅ Node.js 16+ (pour ce tutoriel)
- ✅ Visual Studio Code (recommandé)

Avant de continuer, lancez le validateur de configuration depuis la racine du dépôt :

**Windows :** `./validate-setup.ps1`

**macOS / Linux :** `bash ./validate-setup.sh`

### Vérifiez Votre Installation
```bash
# Vérifier l'installation d'azd
azd version

# Vérifier l'authentification AZD
azd auth login --check-status
```

### Vérifiez l’authentification optionnelle Azure CLI

```bash
az account show
```

### Vérifiez la version de Node.js
```bash
node --version
```

## Étape 1 : Choisissez et Initialisez un Modèle

Commençons par un modèle d’application todo populaire qui inclut un frontend React et un backend API Node.js.

```bash
# Parcourir les modèles disponibles
azd template list

# Initialiser le modèle d'application todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Suivez les instructions :
# - Entrez un nom d'environnement : "dev"
# - Choisissez un abonnement (si vous en avez plusieurs)
# - Choisissez une région : "East US 2" (ou votre région préférée)
```

### Que vient-il de se passer ?
- Téléchargement du code du modèle dans votre répertoire local
- Création d’un fichier `azure.yaml` avec les définitions des services
- Mise en place du code d’infrastructure dans le dossier `infra/`
- Création d’une configuration d’environnement

## Étape 2 : Explorez la Structure du Projet

Examinons ce qu’azd a créé pour nous :

```bash
# Voir la structure du projet
tree /f   # Windows
# ou
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

**azure.yaml** – Le cœur de votre projet azd :
```bash
# Voir la configuration du projet
cat azure.yaml
```

**infra/main.bicep** – Définition de l’infrastructure :
```bash
# Voir le code de l'infrastructure
head -30 infra/main.bicep
```

## Étape 3 : Personnalisez Votre Projet (Optionnel)

Avant de déployer, vous pouvez personnaliser l’application :

### Modifiez le Frontend
```bash
# Ouvrir le composant de l'application React
code src/web/src/App.tsx
```

Faites une modification simple :
```typescript
// Trouvez le titre et changez-le
<h1>My Awesome Todo App</h1>
```

### Configurez les Variables d’Environnement
```bash
# Définir des variables d'environnement personnalisées
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Voir toutes les variables d'environnement
azd env get-values
```

## Étape 4 : Déployez sur Azure

Passons à la partie excitante - déployez tout sur Azure !

```bash
# Déployer l'infrastructure et l'application
azd up

# Cette commande va :
# 1. Provisionner les ressources Azure (App Service, Cosmos DB, etc.)
# 2. Construire votre application
# 3. Déployer sur les ressources provisionnées
# 4. Afficher l'URL de l'application
```

### Que se Passe-t-il Pendant le Déploiement ?

La commande `azd up` exécute ces étapes :
1. **Provisionner** (`azd provision`) - Crée les ressources Azure
2. **Packager** - Compile votre code d’application
3. **Déployer** (`azd deploy`) - Déploie le code sur les ressources Azure

### Résultat Attendu
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
Cliquez sur l’URL fournie dans la sortie de déploiement, ou récupérez-la à tout moment :
```bash
# Obtenir les points de terminaison de l'application
azd show

# Ouvrez l'application dans votre navigateur
azd show --output json | jq -r '.services.web.endpoint'
```

### Testez l’Application Todo
1. **Ajoutez une tâche** – Cliquez sur "Add Todo" et entrez une tâche
2. **Marquez comme terminée** – Cochez les éléments complétés
3. **Supprimez des éléments** – Retirez les todos dont vous n’avez plus besoin

### Surveillez Votre Application
```bash
# Ouvrir le portail Azure pour vos ressources
azd monitor

# Voir les journaux de l'application
azd monitor --logs

# Voir les métriques en direct
azd monitor --live
```

## Étape 6 : Effectuez des Modifications et Redéployez

Faisons une modification pour voir à quel point il est facile de mettre à jour :

### Modifiez l’API
```bash
# Modifier le code de l'API
code src/api/src/routes/lists.js
```

Ajoutez un en-tête de réponse personnalisé :
```javascript
// Trouvez un gestionnaire de route et ajoutez :
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Déployez uniquement les Changements de Code
```bash
# Déployer uniquement le code de l'application (ignorer l'infrastructure)
azd deploy

# C'est beaucoup plus rapide que 'azd up' car l'infrastructure existe déjà
```

## Étape 7 : Gérez Plusieurs Environnements

Créez un environnement de staging pour tester les changements avant la production :

```bash
# Créer un nouvel environnement de mise en scène
azd env new staging

# Déployer sur la mise en scène
azd up

# Revenir à l'environnement de développement
azd env select dev

# Lister tous les environnements
azd env list
```

### Comparaison des Environnements
```bash
# Voir l'environnement de développement
azd env select dev
azd show

# Voir l'environnement de préproduction
azd env select staging
azd show
```

## Étape 8 : Nettoyez les Ressources

Quand vous avez fini d’expérimenter, nettoyez pour éviter des frais récurrents :

```bash
# Supprimer toutes les ressources Azure pour l'environnement actuel
azd down

# Forcer la suppression sans confirmation et purger les ressources supprimées temporairement
azd down --force --purge

# Supprimer un environnement spécifique
azd env select staging
azd down --force --purge
```

## Application Classique vs. Application AI : Même Workflow

Vous venez de déployer une application web traditionnelle. Mais si vous vouliez déployer une application à base d’IA, par exemple, une application de chat reposant sur Microsoft Foundry Models ?

La bonne nouvelle : **le workflow est identique.**

| Étape | Application Todo Classique | Application de Chat AI |
|------|---------------------------|-----------------------|
| Initialisation | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authentification | `azd auth login` | `azd auth login` |
| Déploiement | `azd up` | `azd up` |
| Surveillance | `azd monitor` | `azd monitor` |
| Nettoyage | `azd down --force --purge` | `azd down --force --purge` |

La seule différence est le **modèle** de départ. Un modèle AI inclut une infrastructure supplémentaire (comme une ressource Microsoft Foundry Models ou un index AI Search), mais azd gère tout cela pour vous. Pas besoin d’apprendre de nouvelles commandes, d’adopter un outil différent ou de changer votre approche du déploiement.

C’est le principe central d’azd : **un workflow, n’importe quelle charge de travail.** Les compétences que vous avez pratiquées dans ce tutoriel – initialisation, déploiement, surveillance, redéploiement et nettoyage – s’appliquent tout autant aux applications et agents AI.

---

## Ce Que Vous Avez Appris

Félicitations ! Vous avez réussi à :
- ✅ Initialiser un projet azd à partir d’un modèle
- ✅ Explorer la structure du projet et les fichiers clés
- ✅ Déployer une application full-stack sur Azure
- ✅ Apporter des modifications au code et redéployer
- ✅ Gérer plusieurs environnements
- ✅ Nettoyer les ressources

## 🎯 Exercices de Validation des Compétences

### Exercice 1 : Déployez un Modèle Différent (15 minutes)
**Objectif** : Maîtriser azd init et le workflow de déploiement

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

**Critères de Réussite :**
- [ ] L’application se déploie sans erreurs
- [ ] L’URL de l’application est accessible dans le navigateur
- [ ] L’application fonctionne correctement (ajout/suppression de todos)
- [ ] Nettoyage complet des ressources effectué avec succès

### Exercice 2 : Personnalisez la Configuration (20 minutes)
**Objectif** : S’exercer à la configuration des variables d’environnement

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

**Critères de Réussite :**
- [ ] Environnement personnalisé créé avec succès
- [ ] Variables d’environnement définies et récupérables
- [ ] Application déployée avec configuration personnalisée
- [ ] Paramètres personnalisés vérifiés dans l’application déployée

### Exercice 3 : Workflow Multi-Environnements (25 minutes)
**Objectif** : Maîtriser la gestion des environnements et les stratégies de déploiement

```bash
# Créer un environnement de développement
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Noter l'URL de développement
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Créer un environnement de préproduction
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

# Nettoyer les deux
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Critères de Réussite :**
- [ ] Deux environnements créés avec configurations différentes
- [ ] Les deux environnements déployés avec succès
- [ ] Possibilité de basculer entre environnements avec `azd env select`
- [ ] Variables d’environnement différentes selon les environnements
- [ ] Nettoyage réussi des deux environnements

## 📊 Votre Progression

**Temps Investi** : ~60-90 minutes  
**Compétences Acquises** :
- ✅ Initialisation de projet basée sur un modèle
- ✅ Provisionnement des ressources Azure
- ✅ Workflows de déploiement d’applications
- ✅ Gestion des environnements
- ✅ Gestion de la configuration
- ✅ Nettoyage des ressources et gestion des coûts

**Niveau Suivant** : Vous êtes prêt pour le [Guide de Configuration](configuration.md) pour apprendre les modèles avancés de configuration !

## Résolution des Problèmes Courants

### Erreurs d’Authentification
```bash
# Ré-authentifiez-vous avec Azure
az login

# Vérifiez l’accès à l’abonnement
az account show
```

### Échecs de Déploiement
```bash
# Activer la journalisation de débogage
export AZD_DEBUG=true
azd up --debug

# Voir les journaux de l'application dans Azure
azd monitor --logs

# Pour les Container Apps, utilisez Azure CLI :
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflits de Noms de Ressources
```bash
# Utilisez un nom d'environnement unique
azd env new dev-$(whoami)-$(date +%s)
```

### Problèmes de Ports/Réseau
```bash
# Vérifiez si les ports sont disponibles
netstat -an | grep :3000
netstat -an | grep :3100
```

## Prochaines Étapes

Maintenant que vous avez terminé votre premier projet, explorez ces sujets avancés :

### 1. Personnalisez l’Infrastructure
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Ajoutez des bases de données, stockage et autres services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Configurez CI/CD
- [Guide de Déploiement](../chapter-04-infrastructure/deployment-guide.md) – Workflows CI/CD complets
- [Documentation Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) – Configuration des pipelines

### 3. Meilleures Pratiques en Production
- [Guide de Déploiement](../chapter-04-infrastructure/deployment-guide.md) – Sécurité, performance et surveillance

### 4. Explorez Plus de Modèles
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

## Ressources Supplémentaires

### Matériels d’Apprentissage
- [Documentation Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centre d’Architecture Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Cadre Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Communauté & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Communauté Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Modèles & Exemples
- [Galerie Officielle des Modèles](https://azure.github.io/awesome-azd/)
- [Modèles Communautaires](https://github.com/Azure-Samples/azd-templates)
- [Modèles d’Entreprise](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Félicitations pour avoir terminé votre premier projet azd !** Vous êtes maintenant prêt à créer et déployer des applications exceptionnelles sur Azure avec confiance.

---

**Navigation du Chapitre :**
- **📚 Accueil du Cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre Actuel** : Chapitre 1 - Fondations & Démarrage Rapide
- **⬅️ Précédent** : [Installation & Configuration](installation.md)
- **➡️ Suivant** : [Configuration](configuration.md)
- **🚀 Chapitre Suivant** : [Chapitre 2 : Développement AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Leçon Suivante** : [Guide de Déploiement](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, une traduction professionnelle effectuée par un humain est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->