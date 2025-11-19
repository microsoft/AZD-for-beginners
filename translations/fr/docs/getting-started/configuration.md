<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8399160e4ce8c3eb6fd5d831f6602e18",
  "translation_date": "2025-11-19T14:36:00+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "fr"
}
-->
# Guide de Configuration

**Navigation du Chapitre :**
- **📚 Accueil du Cours** : [AZD pour Débutants](../../README.md)
- **📖 Chapitre Actuel** : Chapitre 3 - Configuration & Authentification
- **⬅️ Précédent** : [Votre Premier Projet](first-project.md)
- **➡️ Suivant** : [Guide de Déploiement](../deployment/deployment-guide.md)
- **🚀 Chapitre Suivant** : [Chapitre 4 : Infrastructure as Code](../deployment/deployment-guide.md)

## Introduction

Ce guide complet couvre tous les aspects de la configuration de l'Azure Developer CLI pour des flux de travail de développement et de déploiement optimaux. Vous apprendrez la hiérarchie de configuration, la gestion des environnements, les méthodes d'authentification et des modèles de configuration avancés permettant des déploiements Azure efficaces et sécurisés.

## Objectifs d'Apprentissage

À la fin de cette leçon, vous serez capable de :
- Maîtriser la hiérarchie de configuration azd et comprendre comment les paramètres sont priorisés
- Configurer efficacement les paramètres globaux et spécifiques au projet
- Gérer plusieurs environnements avec des configurations différentes
- Mettre en œuvre des modèles d'authentification et d'autorisation sécurisés
- Comprendre des modèles de configuration avancés pour des scénarios complexes

## Résultats d'Apprentissage

Après avoir terminé cette leçon, vous serez en mesure de :
- Configurer azd pour des flux de travail de développement optimaux
- Configurer et gérer plusieurs environnements de déploiement
- Mettre en œuvre des pratiques de gestion de configuration sécurisées
- Résoudre les problèmes liés à la configuration
- Personnaliser le comportement d'azd pour répondre aux besoins spécifiques de votre organisation

Ce guide complet couvre tous les aspects de la configuration de l'Azure Developer CLI pour des flux de travail de développement et de déploiement optimaux.

## Hiérarchie de Configuration

azd utilise un système de configuration hiérarchique :
1. **Options en ligne de commande** (priorité la plus élevée)
2. **Variables d'environnement**
3. **Configuration locale du projet** (`.azd/config.json`)
4. **Configuration utilisateur globale** (`~/.azd/config.json`)
5. **Valeurs par défaut** (priorité la plus basse)

## Configuration Globale

### Définir des Valeurs par Défaut Globales
```bash
# Définir l'abonnement par défaut
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Définir l'emplacement par défaut
azd config set defaults.location "eastus2"

# Définir la convention de nommage du groupe de ressources par défaut
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Afficher toute la configuration globale
azd config list

# Supprimer une configuration
azd config unset defaults.location
```

### Paramètres Globaux Courants
```bash
# Préférences de développement
azd config set alpha.enable true                    # Activer les fonctionnalités alpha
azd config set telemetry.enabled false             # Désactiver la télémétrie
azd config set output.format json                  # Définir le format de sortie

# Paramètres de sécurité
azd config set auth.useAzureCliCredential true     # Utiliser Azure CLI pour l'authentification
azd config set tls.insecure false                  # Imposer la vérification TLS

# Optimisation des performances
azd config set provision.parallelism 5             # Création parallèle de ressources
azd config set deploy.timeout 30m                  # Délai d'expiration du déploiement
```

## 🏗️ Configuration du Projet

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

### Options de Configuration des Services

#### Types d'Hébergement
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

#### Paramètres Spécifiques au Langage
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

## 🌟 Gestion des Environnements

### Création d'Environnements
```bash
# Créer un nouvel environnement
azd env new development

# Créer avec un emplacement spécifique
azd env new staging --location "westus2"

# Créer à partir d'un modèle
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Configuration des Environnements
Chaque environnement a sa propre configuration dans `.azure/<env-name>/config.json` :

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

### Variables d'Environnement
```bash
# Définir des variables spécifiques à l'environnement
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Afficher les variables d'environnement
azd env get-values

# Résultat attendu :
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Supprimer la variable d'environnement
azd env unset DEBUG

# Vérifier la suppression
azd env get-values | grep DEBUG
# (ne devrait rien retourner)
```

### Modèles d'Environnement
Créez `.azure/env.template` pour une configuration cohérente des environnements :
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

## 🔐 Configuration de l'Authentification

### Intégration avec Azure CLI
```bash
# Utiliser les identifiants Azure CLI (par défaut)
azd config set auth.useAzureCliCredential true

# Se connecter avec un tenant spécifique
az login --tenant <tenant-id>

# Définir l'abonnement par défaut
az account set --subscription <subscription-id>
```

### Authentification avec Principal de Service
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

### Identité Gérée
Pour les environnements hébergés sur Azure :
```bash
# Activer l'authentification par identité gérée
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Configuration de l'Infrastructure

### Paramètres Bicep
Configurez les paramètres d'infrastructure dans `infra/main.parameters.json` :
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

## 🚀 Configuration du Déploiement

### Configuration de la Compilation
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

## 🔧 Configuration Avancée

### Nommage Personnalisé des Ressources
```bash
# Définir les conventions de nommage
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Configuration Réseau
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Configuration de la Surveillance
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

## 🎯 Configurations Spécifiques aux Environnements

### Environnement de Développement
```bash
# .azure/développement/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Environnement de Préproduction
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Environnement de Production
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validation de la Configuration

### Valider la Configuration
```bash
# Vérifier la syntaxe de configuration
azd config validate

# Tester les variables d'environnement
azd env get-values

# Valider l'infrastructure
azd provision --dry-run
```

### Scripts de Configuration
Créez des scripts de validation dans `scripts/` :

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Vérifiez les variables d'environnement requises
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Validez la syntaxe de azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Bonnes Pratiques

### 1. Utiliser des Variables d'Environnement
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organiser les Fichiers de Configuration
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

### 3. Considérations pour le Contrôle de Version
```bash
# .gitignore
.azure/*/config.json         # Configurations d'environnement (contiennent des identifiants de ressources)
.azure/*/.env               # Variables d'environnement (peuvent contenir des secrets)
.env                        # Fichier d'environnement local
```

### 4. Documentation de la Configuration
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

## 🎯 Exercices Pratiques

### Exercice 1 : Configuration Multi-Environnement (15 minutes)

**Objectif** : Créer et configurer trois environnements avec des paramètres différents

```bash
# Créer un environnement de développement
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Créer un environnement de staging
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

**Critères de Réussite :**
- [ ] Trois environnements créés avec succès
- [ ] Chaque environnement a une configuration unique
- [ ] Possibilité de basculer entre les environnements sans erreurs
- [ ] `azd env list` affiche les trois environnements

### Exercice 2 : Gestion des Secrets (10 minutes)

**Objectif** : Pratiquer une configuration sécurisée avec des données sensibles

```bash
# Définir les secrets (non affichés dans la sortie)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Définir la configuration non secrète
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Voir l'environnement (les secrets doivent être masqués)
azd env get-values

# Vérifier que les secrets sont stockés
azd env get DB_PASSWORD  # Devrait afficher la valeur réelle
```

**Critères de Réussite :**
- [ ] Secrets stockés sans affichage dans le terminal
- [ ] `azd env get-values` affiche les secrets masqués
- [ ] Chaque `azd env get <SECRET_NAME>` récupère la valeur réelle

## Prochaines Étapes

- [Votre Premier Projet](first-project.md) - Appliquer la configuration en pratique
- [Guide de Déploiement](../deployment/deployment-guide.md) - Utiliser la configuration pour le déploiement
- [Provisionnement des Ressources](../deployment/provisioning.md) - Configurations prêtes pour la production

## Références

- [Référence de Configuration azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Schéma azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Variables d'Environnement](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigation du Chapitre :**
- **📚 Accueil du Cours** : [AZD pour Débutants](../../README.md)
- **📖 Chapitre Actuel** : Chapitre 3 - Configuration & Authentification
- **⬅️ Précédent** : [Votre Premier Projet](first-project.md)
- **➡️ Chapitre Suivant** : [Chapitre 4 : Infrastructure as Code](../deployment/deployment-guide.md)
- **Leçon Suivante** : [Votre Premier Projet](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->