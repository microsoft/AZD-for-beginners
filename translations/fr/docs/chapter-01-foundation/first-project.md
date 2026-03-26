# Votre premier projet - Tutoriel pratique

**Navigation du chapitre :**
- **📚 Accueil du cours**: [AZD Pour Débutants](../../README.md)
- **📖 Chapitre actuel**: Chapitre 1 - Fondations & Démarrage rapide
- **⬅️ Précédent**: [Installation et configuration](installation.md)
- **➡️ Suivant**: [Configuration](configuration.md)
- **🚀 Chapitre suivant**: [Chapitre 2 : Développement axé IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Bienvenue dans votre premier projet Azure Developer CLI ! Ce tutoriel pratique et complet propose un guide étape par étape pour créer, déployer et gérer une application full-stack sur Azure en utilisant azd. Vous travaillerez avec une vraie application todo qui inclut un frontend React, un backend API Node.js et une base de données MongoDB.

## Objectifs d'apprentissage

En complétant ce tutoriel, vous allez :
- Maîtriser le workflow d'initialisation de projet azd en utilisant des templates
- Comprendre la structure d'un projet Azure Developer CLI et les fichiers de configuration
- Exécuter un déploiement complet de l'application sur Azure avec provisionnement de l'infrastructure
- Mettre en œuvre des stratégies de mise à jour et de redéploiement de l'application
- Gérer plusieurs environnements pour développement et staging
- Appliquer des pratiques de nettoyage des ressources et de gestion des coûts

## Résultats attendus

À la fin, vous serez capable de :
- Initialiser et configurer des projets azd à partir de templates de façon autonome
- Naviguer et modifier efficacement la structure d'un projet azd
- Déployer des applications full-stack sur Azure avec des commandes uniques
- Résoudre des problèmes courants de déploiement et d'authentification
- Gérer plusieurs environnements Azure pour différentes étapes de déploiement
- Mettre en place des workflows de déploiement continu pour les mises à jour d'application

## Pour commencer

### Liste de prérequis
- ✅ Azure Developer CLI installé ([Installation Guide](installation.md))
- ✅ Azure CLI installé et authentifié
- ✅ Git installé sur votre système
- ✅ Node.js 16+ (pour ce tutoriel)
- ✅ Visual Studio Code (recommandé)

### Vérifier votre configuration
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

## Étape 1 : Choisir et initialiser un template

Commençons avec un template d'application todo populaire qui comprend un frontend React et un backend API Node.js.

```bash
# Parcourir les modèles disponibles
azd template list

# Initialiser le modèle de l'application todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Suivez les invites :
# - Entrez un nom d'environnement : "dev"
# - Choisissez un abonnement (si vous en avez plusieurs)
# - Choisissez une région : "East US 2" (ou votre région préférée)
```

### Que s'est-il passé ?
- Téléchargement du code du template dans votre répertoire local
- Création d'un fichier `azure.yaml` avec les définitions des services
- Mise en place du code d'infrastructure dans le répertoire `infra/`
- Création d'une configuration d'environnement

## Étape 2 : Explorer la structure du projet

Examinons ce qu'azd a créé pour nous :

```bash
# Afficher la structure du projet
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

### Fichiers clés à comprendre

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

## Étape 3 : Personnaliser votre projet (Optionnel)

Avant le déploiement, vous pouvez personnaliser l'application :

### Modifier le frontend
```bash
# Ouvrir le composant de l'application React
code src/web/src/App.tsx
```

Effectuer un changement simple :
```typescript
// Trouvez le titre et changez-le
<h1>My Awesome Todo App</h1>
```

### Configurer les variables d'environnement
```bash
# Définir des variables d'environnement personnalisées
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Afficher toutes les variables d'environnement
azd env get-values
```

## Étape 4 : Déployer sur Azure

Place à la partie excitante - déployez tout sur Azure !

```bash
# Déployer l'infrastructure et l'application
azd up

# Cette commande va :
# 1. Provisionner les ressources Azure (App Service, Cosmos DB, etc.)
# 2. Construire votre application
# 3. Déployer sur les ressources provisionnées
# 4. Afficher l'URL de l'application
```

### Que se passe-t-il pendant le déploiement ?

La commande `azd up` effectue ces étapes :
1. **Provision** (`azd provision`) - Crée les ressources Azure
2. **Package** - Compile votre code applicatif
3. **Deploy** (`azd deploy`) - Déploie le code sur les ressources Azure

### Sortie attendue
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Étape 5 : Tester votre application

### Accéder à votre application
Cliquez sur l'URL fournie dans la sortie du déploiement, ou récupérez-la à tout moment :
```bash
# Obtenir les points de terminaison de l'application
azd show

# Ouvrir l'application dans votre navigateur
azd show --output json | jq -r '.services.web.endpoint'
```

### Tester l'application Todo
1. **Ajouter un élément todo** - Cliquez sur "Add Todo" et saisissez une tâche
2. **Marquer comme terminé** - Cochez les éléments complétés
3. **Supprimer des éléments** - Retirez les todos dont vous n'avez plus besoin

### Surveiller votre application
```bash
# Ouvrir le portail Azure pour vos ressources
azd monitor

# Afficher les journaux d'application
azd monitor --logs

# Afficher les métriques en temps réel
azd monitor --live
```

## Étape 6 : Faire des modifications et redéployer

Faisons une modification et voyons à quel point il est simple de mettre à jour :

### Modifier l'API
```bash
# Modifier le code de l'API
code src/api/src/routes/lists.js
```

Ajouter un en-tête de réponse personnalisé :
```javascript
// Trouvez un gestionnaire de route et ajoutez :
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Déployer uniquement les changements de code
```bash
# Déployer uniquement le code de l'application (ignorer l'infrastructure)
azd deploy

# C'est beaucoup plus rapide que 'azd up' car l'infrastructure existe déjà
```

## Étape 7 : Gérer plusieurs environnements

Créez un environnement de staging pour tester les modifications avant la production :

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

### Comparaison des environnements
```bash
# Voir l'environnement de développement
azd env select dev
azd show

# Voir l'environnement de préproduction
azd env select staging
azd show
```

## Étape 8 : Nettoyer les ressources

Lorsque vous avez fini d'expérimenter, nettoyez pour éviter des frais continus :

```bash
# Supprimer toutes les ressources Azure pour l'environnement actuel
azd down

# Forcer la suppression sans confirmation et purger les ressources en suppression douce
azd down --force --purge

# Supprimer un environnement spécifique
azd env select staging
azd down --force --purge
```

## Application classique vs application alimentée par l'IA : même workflow

Vous venez de déployer une application web traditionnelle. Mais que se passe-t-il si vous voulez déployer une application alimentée par l'IA — par exemple, une application de chat reposant sur Microsoft Foundry Models ?

La bonne nouvelle : **le workflow est identique.**

| Étape | Application Todo classique | Application de chat IA |
|------|---------------------------|------------------------|
| Initialiser | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authentifier | `azd auth login` | `azd auth login` |
| Déployer | `azd up` | `azd up` |
| Surveiller | `azd monitor` | `azd monitor` |
| Nettoyer | `azd down --force --purge` | `azd down --force --purge` |

La seule différence est le **template** de départ. Un template IA inclut une infrastructure supplémentaire (comme une ressource Microsoft Foundry Models ou un index AI Search), mais azd gère tout cela pour vous. Vous n'avez pas besoin d'apprendre de nouvelles commandes, d'adopter un outil différent ou de changer votre façon de penser le déploiement.

C'est le principe central d'azd : **un workflow, n'importe quelle charge de travail.** Les compétences que vous avez exercées dans ce tutoriel — initialisation, déploiement, surveillance, redéploiement et nettoyage — s'appliquent également aux applications et agents IA.

---

## Ce que vous avez appris

Félicitations ! Vous avez réussi à :
- ✅ Initialiser un projet azd à partir d'un template
- ✅ Explorer la structure du projet et les fichiers clés
- ✅ Déployer une application full-stack sur Azure
- ✅ Effectuer des modifications de code et redéployer
- ✅ Gérer plusieurs environnements
- ✅ Nettoyer les ressources

## 🎯 Exercices de validation des compétences

### Exercice 1 : Déployer un template différent (15 minutes)
**Objectif** : Montrer la maîtrise de `azd init` et du workflow de déploiement

```bash
# Tester la pile Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Vérifier le déploiement
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Nettoyer
azd down --force --purge
```

**Critères de réussite :**
- [ ] L'application se déploie sans erreurs
- [ ] L'URL de l'application est accessible dans le navigateur
- [ ] L'application fonctionne correctement (ajout/suppression de todos)
- [ ] Toutes les ressources ont été nettoyées avec succès

### Exercice 2 : Personnaliser la configuration (20 minutes)
**Objectif** : S'exercer à la configuration des variables d'environnement

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

**Critères de réussite :**
- [ ] Environnement personnalisé créé avec succès
- [ ] Variables d'environnement définies et récupérables
- [ ] L'application se déploie avec la configuration personnalisée
- [ ] Possibilité de vérifier les paramètres personnalisés dans l'application déployée

### Exercice 3 : Workflow multi-environnements (25 minutes)
**Objectif** : Maîtriser la gestion des environnements et les stratégies de déploiement

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

**Critères de réussite :**
- [ ] Deux environnements créés avec des configurations différentes
- [ ] Les deux environnements déployés avec succès
- [ ] Possibilité de basculer entre les environnements avec `azd env select`
- [ ] Les variables d'environnement diffèrent entre les environnements
- [ ] Nettoyage réussi des deux environnements

## 📊 Votre progression

**Temps investi** : ~60-90 minutes  
**Compétences acquises** :
- ✅ Initialisation de projet basée sur des templates
- ✅ Provisionnement des ressources Azure
- ✅ Workflows de déploiement d'applications
- ✅ Gestion des environnements
- ✅ Gestion de la configuration
- ✅ Nettoyage des ressources et gestion des coûts

**Niveau suivant** : Vous êtes prêt pour le [Guide de configuration](configuration.md) pour apprendre des modèles avancés de configuration !

## Dépannage des problèmes courants

### Erreurs d'authentification
```bash
# Se réauthentifier auprès d'Azure
az login

# Vérifier l'accès à l'abonnement
az account show
```

### Échecs de déploiement
```bash
# Activer la journalisation de débogage
export AZD_DEBUG=true
azd up --debug

# Afficher les journaux de l'application dans Azure
azd monitor --logs

# Pour les Container Apps, utilisez l'Azure CLI :
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflits de nom de ressource
```bash
# Utilisez un nom d'environnement unique
azd env new dev-$(whoami)-$(date +%s)
```

### Problèmes de port/réseau
```bash
# Vérifier si les ports sont disponibles
netstat -an | grep :3000
netstat -an | grep :3100
```

## Prochaines étapes

Maintenant que vous avez terminé votre premier projet, explorez ces sujets avancés :

### 1. Personnaliser l'infrastructure
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Ajouter des bases de données, du stockage et d'autres services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Mettre en place CI/CD
- [Guide de déploiement](../chapter-04-infrastructure/deployment-guide.md) - Workflows CI/CD complets
- [Documentation Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configuration de pipelines

### 3. Bonnes pratiques de production
- [Guide de déploiement](../chapter-04-infrastructure/deployment-guide.md) - Sécurité, performance et surveillance

### 4. Explorer plus de templates
```bash
# Parcourir les modèles par catégorie
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Essayer différentes piles technologiques
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Ressources supplémentaires

### Supports d'apprentissage
- [Documentation Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Communauté et support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Communauté des développeurs Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates et exemples
- [Galerie officielle de templates](https://azure.github.io/awesome-azd/)
- [Templates communautaires](https://github.com/Azure-Samples/azd-templates)
- [Patterns d'entreprise](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Félicitations pour avoir terminé votre premier projet azd !** Vous êtes maintenant prêt à créer et déployer des applications remarquables sur Azure en toute confiance.

---

**Navigation du chapitre :**
- **📚 Accueil du cours**: [AZD Pour Débutants](../../README.md)
- **📖 Chapitre actuel**: Chapitre 1 - Fondations & Démarrage rapide
- **⬅️ Précédent**: [Installation et configuration](installation.md)
- **➡️ Suivant**: [Configuration](configuration.md)
- **🚀 Chapitre suivant**: [Chapitre 2 : Développement axé IA](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Leçon suivante**: [Guide de déploiement](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Avertissement :
Ce document a été traduit à l'aide du service de traduction par IA [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la version faisant foi. Pour les informations essentielles, il est recommandé de recourir à une traduction humaine professionnelle. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->