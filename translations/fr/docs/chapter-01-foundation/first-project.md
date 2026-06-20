# Votre premier projet - Tutoriel pratique

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 1 - Fondations & Démarrage rapide
- **⬅️ Précédent** : [Installation & Configuration](installation.md)
- **➡️ Suivant** : [Configuration](configuration.md)
- **🚀 Chapitre suivant** : [Chapitre 2 : Développement IA-Premier](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Bienvenue dans votre premier projet Azure Developer CLI ! Ce tutoriel pratique complet vous guide pas à pas pour créer, déployer et gérer une application full-stack sur Azure en utilisant azd. Vous travaillerez avec une véritable application todo qui comprend un frontend React, une API backend Node.js et une base de données MongoDB.

## Objectifs d'apprentissage

En suivant ce tutoriel, vous allez :
- Maîtriser le flux d'initialisation d'un projet azd utilisant des modèles
- Comprendre la structure d'un projet Azure Developer CLI et ses fichiers de configuration
- Exécuter un déploiement complet d'application sur Azure avec provisionnement d'infrastructure
- Mettre en œuvre des mises à jour et stratégies de redéploiement d'application
- Gérer plusieurs environnements pour développement et préproduction
- Appliquer les bonnes pratiques de nettoyage des ressources et gestion des coûts

## Résultats attendus

À la fin, vous serez capable de :
- Initialiser et configurer des projets azd à partir de modèles de façon autonome
- Naviguer et modifier efficacement la structure d'un projet azd
- Déployer des applications full-stack sur Azure avec des commandes simples
- Résoudre les problèmes courants de déploiement et d'authentification
- Gérer plusieurs environnements Azure pour différentes étapes de déploiement
- Mettre en place des workflows de déploiement continu pour les mises à jour applicatives

## Démarrage

### Liste de prérequis
- ✅ Azure Developer CLI installé ([Guide d'installation](installation.md))
- ✅ Authentification AZD réalisée avec `azd auth login`
- ✅ Git installé sur votre système
- ✅ Node.js 16+ (pour ce tutoriel)
- ✅ Visual Studio Code (recommandé)

Avant de continuer, lancez le validateur de configuration depuis la racine du dépôt :

**Windows :** `./validate-setup.ps1`

**macOS / Linux :** `bash ./validate-setup.sh`

### Vérifiez votre configuration
```bash
# Vérifier l'installation d'azd
azd version

# Vérifier l'authentification AZD
azd auth login --check-status
```

### Vérification optionnelle de l'authentification Azure CLI

```bash
az account show
```

### Vérifiez la version de Node.js
```bash
node --version
```

## Étape 1 : Choisir et initialiser un modèle

Commençons avec un modèle populaire d'application todo incluant un frontend React et un backend API Node.js.

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

### Que vient-il de se passer ?
- Le code du modèle a été téléchargé dans votre répertoire local
- Un fichier `azure.yaml` avec les définitions des services a été créé
- Le code d'infrastructure a été mis en place dans le répertoire `infra/`
- Une configuration d'environnement a été créée

## Étape 2 : Explorez la structure du projet

Examinons ce qu'azd a créé pour nous :

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

### Fichiers clés à comprendre

**azure.yaml** - Le cœur de votre projet azd :
```bash
# Afficher la configuration du projet
cat azure.yaml
```

**infra/main.bicep** - Définition de l'infrastructure :
```bash
# Voir le code de l'infrastructure
head -30 infra/main.bicep
```

## Étape 3 : Personnalisez votre projet (optionnel)

Avant de déployer, vous pouvez personnaliser l'application :

### Modifier le frontend
```bash
# Ouvrez le composant de l'application React
code src/web/src/App.tsx
```

Effectuez un changement simple :
```typescript
// Trouvez le titre et changez-le
<h1>My Awesome Todo App</h1>
```

### Configurer les variables d'environnement
```bash
# Définir des variables d'environnement personnalisées
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Voir toutes les variables d'environnement
azd env get-values
```

## Étape 4 : Déployez sur Azure

Voici la partie passionnante - déployez tout sur Azure !

```bash
# Déployer l'infrastructure et l'application
azd up

# Cette commande va :
# 1. Approvisionner les ressources Azure (App Service, Cosmos DB, etc.)
# 2. Construire votre application
# 3. Déployer sur les ressources provisionnées
# 4. Afficher l'URL de l'application
```

### Que se passe-t-il pendant le déploiement ?

La commande `azd up` exécute ces étapes :
1. **Provision** (`azd provision`) - Création des ressources Azure
2. **Package** - Compilation du code de l'application
3. **Deploy** (`azd deploy`) - Déploiement du code sur les ressources Azure

### Résultat attendu
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Étape 5 : Testez votre application

### Accédez à votre application
Cliquez sur l'URL fournie dans la sortie du déploiement, ou récupérez-la à tout moment :
```bash
# Obtenir les points de terminaison de l'application
azd show

# Ouvrez l'application dans votre navigateur
azd show --output json | jq -r '.services.web.endpoint'
```

### Testez l'application Todo
1. **Ajouter un élément todo** - Cliquez sur « Ajouter Todo » et saisissez une tâche
2. **Marquer comme complété** - Cochez les éléments terminés
3. **Supprimer des éléments** - Enlevez les todos dont vous n'avez plus besoin

### Surveillez votre application
```bash
# Ouvrez le portail Azure pour vos ressources
azd monitor

# Voir les journaux d'application
azd monitor --logs

# Voir les métriques en temps réel
azd monitor --live
```

### ✅ Vérifiez votre déploiement

Avant de continuer, passez cette checklist rapide pour confirmer que tout fonctionne vraiment — ne présumez pas que "déploiement réussi" signifie "application fonctionne" :

```bash
# 1. Confirmez que le point de terminaison existe et est accessible
azd show

# 2. Faites un test rapide du point de terminaison (attend un HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Vérifiez le point de terminaison de santé si votre application en expose un
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Le déploiement est vérifié lorsque :**
- ✅ `azd show` liste une URL d'accès opérationnelle
- ✅ L'URL s'ouvre dans votre navigateur sans erreur
- ✅ Les fonctionnalités principales fonctionnent (ajout/complétion/suppression d'un todo)
- ✅ `azd monitor --logs` montre les requêtes arrivant sans erreur inattendue

En cas d'échec, passez au [Chapitre 7 : Dépannage](../chapter-07-troubleshooting/README.md).

## Étape 6 : Faites des modifications et redéployez

Faisons une modification et voyons à quel point il est facile de mettre à jour :

### Modifier l'API
```bash
# Modifier le code de l'API
code src/api/src/routes/lists.js
```

Ajoutez un en-tête de réponse personnalisé :
```javascript
// Trouvez un gestionnaire de route et ajoutez :
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Déployez uniquement les changements de code
```bash
# Déployer uniquement le code de l'application (ignorer l'infrastructure)
azd deploy

# C'est beaucoup plus rapide que 'azd up' puisque l'infrastructure existe déjà
```

## Étape 7 : Gérez plusieurs environnements

Créez un environnement de préproduction pour tester les changements avant la production :

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

## Étape 8 : Nettoyez les ressources

Une fois vos expérimentations terminées, nettoyez pour éviter les charges continues :

```bash
# Supprimer toutes les ressources Azure pour l'environnement actuel
azd down

# Forcer la suppression sans confirmation et purger les ressources supprimées temporairement
azd down --force --purge

# Supprimer un environnement spécifique
azd env select staging
azd down --force --purge
```

## Application classique vs application IA : même flux de travail

Vous venez de déployer une application web traditionnelle. Mais que faire si vous vouliez au contraire déployer une application IA, par exemple une application de chat utilisant les modèles Microsoft Foundry ?

Bonne nouvelle : **le flux de travail est identique.**

| Étape | Application Todo classique | Application Chat IA |
|-------|----------------------------|---------------------|
| Initialiser | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authentifier | `azd auth login` | `azd auth login` |
| Déployer | `azd up` | `azd up` |
| Surveiller | `azd monitor` | `azd monitor` |
| Nettoyer | `azd down --force --purge` | `azd down --force --purge` |

La seule différence est le **modèle** que vous choisissez. Un modèle IA inclut une infrastructure supplémentaire (comme une ressource Microsoft Foundry Models ou un index AI Search), mais azd gère tout cela pour vous. Vous n'avez pas besoin d'apprendre de nouvelles commandes, d'adopter un outil différent, ou de modifier votre façon de penser le déploiement.

C’est le principe fondamental d'azd : **un flux de travail, tous types de charges.** Les compétences que vous avez pratiquées dans ce tutoriel — initialisation, déploiement, surveillance, redéploiement, nettoyage — s'appliquent aussi bien aux applications IA et agents.

---

## Ce que vous avez appris

Félicitations ! Vous avez réussi à :
- ✅ Initialiser un projet azd à partir d'un modèle
- ✅ Explorer la structure du projet et ses fichiers clés
- ✅ Déployer une application full-stack sur Azure
- ✅ Effectuer des modifications de code et redéployer
- ✅ Gérer plusieurs environnements
- ✅ Nettoyer les ressources

## 🎯 Exercices de validation des compétences

### Exercice 1 : Déployez un modèle différent (15 minutes)
**Objectif** : Maîtriser l'initialisation avec azd init et le flux de déploiement

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

**Critères de réussite :**
- [ ] Application déployée sans erreurs
- [ ] Accès à l'URL de l'application dans le navigateur
- [ ] Application fonctionne correctement (ajouter/supprimer des todos)
- [ ] Nettoyage réussi de toutes les ressources

### Exercice 2 : Personnaliser la configuration (20 minutes)
**Objectif** : Pratiquer la configuration des variables d'environnement

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
- [ ] Application déployée avec configuration personnalisée
- [ ] Paramètres personnalisés vérifiables dans l'application déployée

### Exercice 3 : Workflow multi-environnement (25 minutes)
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

**Critères de réussite :**
- [ ] Deux environnements créés avec configurations différentes
- [ ] Les deux environnements déployés avec succès
- [ ] Possibilité de basculer entre environnements avec `azd env select`
- [ ] Les variables d'environnement diffèrent entre les environnements
- [ ] Nettoyage réussi des deux environnements

## 📊 Votre progression

**Temps investi** : ~60-90 minutes  
**Compétences acquises** :
- ✅ Initialisation de projet basée sur un modèle
- ✅ Provisionnement des ressources Azure
- ✅ Workflows de déploiement applicatif
- ✅ Gestion des environnements
- ✅ Gestion de la configuration
- ✅ Nettoyage des ressources et gestion des coûts

**Niveau suivant** : Vous êtes prêt(e) pour le [Guide de configuration](configuration.md) afin d’apprendre les modèles avancés de configuration !

## Résolution des problèmes courants

### Erreurs d'authentification
```bash
# Se réauthentifier avec Azure
az login

# Vérifier l'accès à l'abonnement
az account show
```

### Échecs de déploiement
```bash
# Activer la journalisation de débogage
export AZD_DEBUG=true
azd up --debug

# Voir les journaux de l'application dans Azure
azd monitor --logs

# Pour les applications de conteneur, utiliser Azure CLI :
# az containerapp logs show --name <nom-app> --resource-group <nom-rg> --follow
```

### Conflits de noms de ressources
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

## Étapes suivantes

Maintenant que vous avez terminé votre premier projet, explorez ces sujets avancés :

### 1. Personnaliser l'infrastructure
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Ajouter des bases de données, stockages et autres services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Mettre en place CI/CD
- [Guide de déploiement](../chapter-04-infrastructure/deployment-guide.md) - Workflows CI/CD complets
- [Documentation Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configuration des pipelines

### 3. Meilleures pratiques en production
- [Guide de déploiement](../chapter-04-infrastructure/deployment-guide.md) - Sécurité, performance et monitoring

### 4. Explorer plus de modèles
```bash
# Parcourez les modèles par catégorie
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Essayez différentes piles technologiques
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Ressources supplémentaires

### Matériel d'apprentissage
- [Documentation Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Communauté & support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Communauté Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Modèles & exemples
- [Galerie officielle des modèles](https://azure.github.io/awesome-azd/)
- [Modèles communautaires](https://github.com/Azure-Samples/azd-templates)
- [Patrons d'entreprise](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Félicitations pour avoir terminé votre premier projet azd !** Vous êtes maintenant prêt(e) à créer et déployer des applications incroyables sur Azure en toute confiance.

---

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 1 - Fondations & Démarrage rapide
- **⬅️ Précédent** : [Installation & Configuration](installation.md)
- **➡️ Suivant** : [Apportez votre propre application](bring-your-own-app.md)
- **🚀 Chapitre suivant** : [Chapitre 2 : Développement IA-Premier](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->