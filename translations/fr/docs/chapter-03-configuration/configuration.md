# Guide de configuration

**Navigation du chapitre :**
- **📚 Accueil du cours** : [AZD Pour débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 3 - Configuration & Authentification
- **⬅️ Précédent** : [Votre premier projet](first-project.md)
- **➡️ Suivant** : [Guide de déploiement](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Chapitre suivant** : [Chapitre 4 : Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Introduction

Ce guide complet couvre tous les aspects de la configuration d'Azure Developer CLI pour des flux de travail de développement et de déploiement optimaux. Vous apprendrez la hiérarchie de configuration, la gestion des environnements, les méthodes d'authentification, ainsi que les modèles de configuration avancés qui permettent des déploiements Azure efficaces et sécurisés.

## Objectifs d'apprentissage

À la fin de cette leçon, vous serez capable de :
- Maîtriser la hiérarchie de configuration azd et comprendre comment les paramètres sont priorisés
- Configurer efficacement les paramètres globaux et spécifiques aux projets
- Gérer plusieurs environnements avec différentes configurations
- Mettre en œuvre des modèles d'authentification et d'autorisation sécurisés
- Comprendre les modèles de configuration avancés pour des scénarios complexes

## Résultats d'apprentissage

Après avoir terminé cette leçon, vous serez capable de :
- Configurer azd pour des flux de travail de développement optimaux
- Mettre en place et gérer plusieurs environnements de déploiement
- Mettre en œuvre des pratiques de gestion sécurisée de la configuration
- Résoudre les problèmes liés à la configuration
- Personnaliser le comportement d'azd selon les exigences spécifiques de votre organisation

Ce guide complet couvre tous les aspects de la configuration d'Azure Developer CLI pour des flux de travail de développement et de déploiement optimaux.

## Comprendre les agents IA dans un projet azd

Si vous êtes nouveau dans les agents IA, voici une façon simple de les envisager dans l’univers azd.

### Qu’est-ce qu’un agent ?

Un agent est un logiciel qui peut recevoir une requête, raisonner à son sujet, et agir — souvent en appelant un modèle IA, en recherchant des données, ou en invoquant d’autres services. Dans un projet azd, un agent est simplement un autre **service** aux côtés de votre frontend web ou de votre backend API.

### Comment les agents s’intègrent dans la structure du projet azd

Un projet azd est composé de trois couches : **infrastructure**, **code**, et **configuration**. Les agents s’intègrent dans ces couches comme n’importe quel autre service :

| Couche | Fonction dans une application traditionnelle | Fonction pour un agent |
|-------|----------------------------------------------|-----------------------|
| **Infrastructure** (`infra/`) | Provisionne une application web et une base de données | Provisionne un point de terminaison de modèle IA, un index de recherche, ou un hôte d’agent |
| **Code** (`src/`) | Contient le code source frontend et backend API | Contient la logique de l’agent et les définitions de prompts |
| **Configuration** (`azure.yaml`) | Liste vos services et leurs cibles d’hébergement | Liste votre agent comme service, pointant vers son code et son hôte |

### Le rôle de `azure.yaml`

Vous n’avez pas besoin de mémoriser la syntaxe maintenant. Conceptuellement, `azure.yaml` est le fichier où vous dites à azd : *« Voici les services qui composent mon application, et voici où trouver leur code. »*

Quand votre projet inclut un agent IA, `azure.yaml` liste simplement cet agent comme un des services. azd sait alors provisionner la bonne infrastructure (comme un point de terminaison Microsoft Foundry Models ou une Container App pour héberger l’agent) et déployer votre code d’agent — tout comme pour une application web ou une API.

Cela signifie qu’il n’y a rien de fondamentalement nouveau à apprendre. Si vous comprenez comment azd gère un service web, vous comprenez déjà comment il gère un agent.

## Hiérarchie de configuration

azd utilise un système de configuration hiérarchique :
1. **Options en ligne de commande** (priorité la plus élevée)
2. **Variables d’environnement**
3. **Configuration locale du projet** (`.azd/config.json`)
4. **Configuration utilisateur globale** (`~/.azd/config.json`)
5. **Valeurs par défaut** (priorité la plus faible)

## Configuration globale

### Définir les valeurs globales par défaut
```bash
# Définir l'abonnement par défaut
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Définir l'emplacement par défaut
azd config set defaults.location "eastus2"

# Définir la convention de nommage du groupe de ressources par défaut
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Afficher toute la configuration globale
azd config show

# Supprimer une configuration
azd config unset defaults.location
```

### Paramètres globaux courants
```bash
# Préférences de développement
azd config set alpha.enable true                    # Activer les fonctionnalités alpha
azd config set telemetry.enabled false             # Désactiver la télémétrie
azd config set output.format json                  # Définir le format de sortie

# Paramètres de sécurité
azd config set auth.useAzureCliCredential true     # Utiliser Azure CLI pour l'authentification
azd config set tls.insecure false                  # Appliquer la vérification TLS

# Optimisation des performances
azd config set provision.parallelism 5             # Création de ressources en parallèle
azd config set deploy.timeout 30m                  # Délai d'attente du déploiement
```

## 🏗️ Configuration du projet

### Structure de azure.yaml
Le fichier `azure.yaml` est le cœur de votre projet azd :

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

### Options de configuration des services

#### Types d’hébergement
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### Paramètres spécifiques au langage
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 Gestion des environnements

### Création d’environnements
```bash
# Créer un nouvel environnement
azd env new development

# Créer avec un emplacement spécifique
azd env new staging --location "westus2"

# Créer à partir d'un modèle
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Configuration des environnements
Chaque environnement a sa propre configuration dans `.azure/<nom-env>/config.json` :

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### Variables d’environnement
```bash
# Définir des variables spécifiques à l'environnement
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Voir les variables d'environnement
azd env get-values

# Sortie attendue :
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=clé-api-secrète
# DEBUG=true

# Supprimer la variable d'environnement
azd env unset DEBUG

# Vérifier la suppression
azd env get-values | grep DEBUG
# (ne devrait rien retourner)
```

### Modèles d’environnement
Créez `.azure/env.template` pour une configuration d’environnement cohérente :
```bash
# Variables requises
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Paramètres de l'application
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Paramètres de développement optionnels
DEBUG=false
LOG_LEVEL=info
```

### Partager des environnements au sein d’une équipe

Lorsque plusieurs personnes travaillent sur un projet, il faut se mettre d’accord sur **ce qui voyage avec le dépôt et ce qui reste local**. azd conserve chaque environnement sous un dossier `.azure/`, mais tout ne doit pas être commité.

**Ce qui se trouve dans `.azure/` :**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**Ce qu’il faut gitignorer.** Le `.gitignore` par défaut d’azd exclut déjà `.azure/`. Conservez-le ainsi — les fichiers `.env` peuvent contenir des secrets, et les IDs de ressources sont spécifiques à celui qui les a provisionnées. Chaque membre crée son **propre** environnement localement :

```bash
# Chaque développeur exécute ceci une fois pour obtenir son propre environnement isolé
azd env new dev-alice
azd up
```

**Changer d’environnement.** Un développeur qui gère plusieurs environnements sélectionne l’environnement actif avant d’exécuter les commandes :

```bash
azd env list                 # voir tous les environnements locaux et lequel est par défaut
azd env select staging       # rendre 'staging' l'environnement actif
azd env get-values           # confirmer que vous êtes bien dirigé vers le bon environnement
```

**Fournir des valeurs non sensibles à l’équipe.** Commitez un modèle (comme `.azure/env.template` ci-dessus) pour que tout le monde sache quelles variables définir — mais ne commitez jamais les valeurs remplies. Les nouveaux membres copient le modèle et remplissent le leur.

**Environnements en CI/CD.** Les pipelines ne lisent pas votre dossier local `.azure/`. Fournissez plutôt les valeurs environnementales comme variables/secrets de pipeline, et azd les lit depuis l’environnement du processus :

```bash
# En CI, azd les lit depuis l'environnement, pas depuis .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Règle générale :** Le code d’infrastructure (`infra/`, `azure.yaml`) est partagé dans Git ; l’*état et les secrets* de l’environnement (`.azure/`) sont par développeur et par pipeline. `azd pipeline config` configure automatiquement les variables du pipeline pour vous.

## 🔐 Configuration de l’authentification

### Intégration avec Azure CLI
```bash
# Utiliser les identifiants Azure CLI (par défaut)
azd config set auth.useAzureCliCredential true

# Se connecter avec un locataire spécifique
az login --tenant <tenant-id>

# Définir l’abonnement par défaut
az account set --subscription <subscription-id>
```

### Authentification par Service Principal
Pour les pipelines CI/CD :
```bash
# Définir les variables d'environnement
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Ou configurer directement
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Identité gérée
Pour les environnements hébergés Azure :
```bash
# Activer l'authentification par identité gérée
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Configuration de l’infrastructure

### Paramètres Bicep
Configurez les paramètres d’infrastructure dans `infra/main.parameters.json` :
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### Configuration Terraform
Pour les projets Terraform, configurez dans `infra/terraform.tfvars` :
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Configuration du déploiement

### Configuration de la build
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### Configuration Docker
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        NODE_ENV: production
        API_VERSION: v1.0.0
```
Exemple de `Dockerfile` : https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Configuration avancée

### Nomination personnalisée des ressources
```bash
# Définir les conventions de nommage
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Configuration réseau
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Configuration de la supervision
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 Configurations spécifiques aux environnements

### Environnement de développement
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Environnement de pré-production
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Environnement de production
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validation de la configuration

### Valider la configuration
```bash
# Vérifier la syntaxe de la configuration
azd config validate

# Tester les variables d'environnement
azd env get-values

# Valider l'infrastructure
azd provision --dry-run
```

### Scripts de configuration
Créez des scripts de validation dans `scripts/` :

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Vérifier les variables d'environnement requises
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Valider la syntaxe de azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Bonnes pratiques

### 1. Utilisez les variables d’environnement
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organisez les fichiers de configuration
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. Considérations pour le contrôle de version
```bash
# .gitignore
.azure/*/config.json         # Configurations d'environnement (contiennent des IDs de ressources)
.azure/*/.env               # Variables d'environnement (peuvent contenir des secrets)
.env                        # Fichier d'environnement local
```

### 4. Documentation de la configuration
Documentez votre configuration dans `CONFIG.md` :
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 Exercices pratiques

### Exercice 1 : Configuration multi-environnements (15 minutes)

**Objectif** : Créer et configurer trois environnements avec des paramètres différents

```bash
# Créer un environnement de développement
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Créer un environnement de pré-production
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Créer un environnement de production
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Vérifier chaque environnement
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Critères de réussite :**
- [ ] Trois environnements créés avec succès
- [ ] Chaque environnement a une configuration unique
- [ ] Possibilité de basculer entre les environnements sans erreurs
- [ ] `azd env list` affiche les trois environnements

### Exercice 2 : Gestion des secrets (10 minutes)

**Objectif** : Pratiquer la configuration sécurisée avec des données sensibles

```bash
# Définir les secrets (non affichés dans la sortie)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Définir la configuration non secrète
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Voir l'environnement (les secrets doivent être expurgés)
azd env get-values

# Vérifier que les secrets sont stockés
azd env get DB_PASSWORD  # Doit afficher la valeur réelle
```

**Critères de réussite :**
- [ ] Secrets stockés sans affichage dans le terminal
- [ ] `azd env get-values` affiche des secrets masqués
- [ ] `azd env get <NOM_SECRET>` récupère la valeur réelle

## Prochaines étapes

- [Votre premier projet](first-project.md) - Appliquer la configuration en pratique
- [Guide de déploiement](../chapter-04-infrastructure/deployment-guide.md) - Utiliser la configuration pour le déploiement
- [Provisionnement des ressources](../chapter-04-infrastructure/provisioning.md) - Configurations prêtes pour la production

## Références

- [Référence de configuration azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Schéma azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Variables d’environnement](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigation du chapitre :**
- **📚 Accueil du cours** : [AZD Pour débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 3 - Configuration & Authentification
- **⬅️ Précédent** : [Votre premier projet](first-project.md)
- **➡️ Chapitre suivant** : [Chapitre 4 : Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Leçon suivante** : [Votre premier projet](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->