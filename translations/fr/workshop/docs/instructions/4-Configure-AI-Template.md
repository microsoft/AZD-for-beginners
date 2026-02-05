# 4. Configurer un modèle

!!! tip "À LA FIN DE CE MODULE, VOUS SEREZ EN MESURE DE"

    - [ ] Comprendre l'objectif de `azure.yaml`
    - [ ] Comprendre la structure de `azure.yaml`
    - [ ] Comprendre la valeur des `hooks` du cycle de vie d'azd
    - [ ] **Lab 3 :**

---

!!! prompt "Que fait le fichier `azure.yaml` ? Utilisez une section de code et expliquez-le ligne par ligne"

      Le fichier `azure.yaml` est le **fichier de configuration pour Azure Developer CLI (azd)**. Il définit comment votre application doit être déployée sur Azure, y compris l'infrastructure, les services, les hooks de déploiement et les variables d'environnement.

---

## 1. Objectif et Fonctionnalité

Ce fichier `azure.yaml` sert de **plan de déploiement** pour une application d'agent IA qui :

1. **Valide l'environnement** avant le déploiement
2. **Provisionne les services Azure AI** (AI Hub, AI Project, Search, etc.)
3. **Déploie une application Python** sur Azure Container Apps
4. **Configure les modèles IA** pour les fonctionnalités de chat et d'embedding
5. **Met en place la surveillance et le traçage** pour l'application IA
6. **Gère les scénarios de projet Azure AI** existants et nouveaux

Le fichier permet un **déploiement en une commande** (`azd up`) d'une solution complète d'agent IA avec une validation appropriée, un provisionnement et une configuration post-déploiement.

??? info "Développer pour voir : `azure.yaml`"

      Le fichier `azure.yaml` définit comment Azure Developer CLI doit déployer et gérer cette application d'agent IA sur Azure. Décomposons-le ligne par ligne.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: avons-nous besoin de hooks ?
      # TODO: avons-nous besoin de toutes les variables ?

      name: azd-get-started-with-ai-agents
      metadata:
      template: azd-get-started-with-ai-agents@1.0.2
      requiredVersions:
      azd: ">=1.14.0"

      hooks:
      preup:
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
            interactive: true
            continueOnError: false
      windows:
            shell: pwsh
            run: ./scripts/validate_env_vars.ps1
            interactive: true
            continueOnError: false      
      postprovision:
      windows:
            shell: pwsh
            run: ./scripts/write_env.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
            continueOnError: true
            interactive: true
      postdeploy:
      windows:
            shell: pwsh
            run: ./scripts/postdeploy.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
            continueOnError: true
            interactive: true
      services:
      api_and_frontend:
      project: ./src
      language: py
      host: containerapp
      docker:
            image: api_and_frontend
            remoteBuild: true
      pipeline:
      variables:
      - AZURE_RESOURCE_GROUP
      - AZURE_AIHUB_NAME
      - AZURE_AIPROJECT_NAME
      - AZURE_AISERVICES_NAME
      - AZURE_SEARCH_SERVICE_NAME
      - AZURE_APPLICATION_INSIGHTS_NAME
      - AZURE_CONTAINER_REGISTRY_NAME
      - AZURE_KEYVAULT_NAME
      - AZURE_STORAGE_ACCOUNT_NAME
      - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
      - USE_CONTAINER_REGISTRY
      - USE_APPLICATION_INSIGHTS
      - USE_AZURE_AI_SEARCH_SERVICE
      - AZURE_AI_AGENT_NAME
      - AZURE_AI_AGENT_ID
      - AZURE_AI_AGENT_DEPLOYMENT_NAME
      - AZURE_AI_AGENT_DEPLOYMENT_SKU
      - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
      - AZURE_AI_AGENT_MODEL_NAME
      - AZURE_AI_AGENT_MODEL_FORMAT
      - AZURE_AI_AGENT_MODEL_VERSION
      - AZURE_AI_EMBED_DEPLOYMENT_NAME
      - AZURE_AI_EMBED_DEPLOYMENT_SKU
      - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
      - AZURE_AI_EMBED_MODEL_NAME
      - AZURE_AI_EMBED_MODEL_FORMAT
      - AZURE_AI_EMBED_MODEL_VERSION
      - AZURE_AI_EMBED_DIMENSIONS
      - AZURE_AI_SEARCH_INDEX_NAME
      - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
      - AZURE_EXISTING_AIPROJECT_ENDPOINT
      - AZURE_EXISTING_AGENT_ID
      - ENABLE_AZURE_MONITOR_TRACING
      - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
      ```

---

## 2. Déconstruction du fichier

Passons en revue le fichier section par section pour comprendre ce qu'il fait - et pourquoi.

### 2.1 **En-tête et schéma (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Ligne 1** : Fournit la validation du schéma du serveur de langage YAML pour le support IDE et IntelliSense

### 2.2 Métadonnées du projet (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Ligne 5** : Définit le nom du projet utilisé par Azure Developer CLI
- **Lignes 6-7** : Spécifie que cela est basé sur une version de modèle 1.0.2
- **Lignes 8-9** : Requiert la version 1.14.0 ou supérieure d'Azure Developer CLI

### 2.3 Hooks de déploiement (11-40)

```yaml title="" linenums="0"
hooks:
  preup:
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
      interactive: true
      continueOnError: false
    windows:
      shell: pwsh
      run: ./scripts/validate_env_vars.ps1
      interactive: true
      continueOnError: false      
```

- **Lignes 11-20** : **Hook pré-déploiement** - s'exécute avant `azd up`

      - Sur Unix/Linux : Rend le script de validation exécutable et l'exécute
      - Sur Windows : Exécute le script de validation PowerShell
      - Les deux sont interactifs et arrêteront le déploiement en cas d'échec

```yaml  title="" linenums="0"
  postprovision:
    windows:
      shell: pwsh
      run: ./scripts/write_env.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
      continueOnError: true
      interactive: true
```
- **Lignes 21-30** : **Hook post-provisionnement** - s'exécute après la création des ressources Azure

  - Exécute les scripts d'écriture des variables d'environnement
  - Continue le déploiement même si ces scripts échouent (`continueOnError: true`)

```yaml title="" linenums="0"
  postdeploy:
    windows:
      shell: pwsh
      run: ./scripts/postdeploy.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
      continueOnError: true
      interactive: true
```
- **Lignes 31-40** : **Hook post-déploiement** - s'exécute après le déploiement de l'application

  - Exécute les scripts de configuration finale
  - Continue même si les scripts échouent

### 2.4 Configuration du service (41-48)

Cette section configure le service de l'application que vous déployez.

```yaml title="" linenums="0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- **Ligne 42** : Définit un service nommé "api_and_frontend"
- **Ligne 43** : Pointe vers le répertoire `./src` pour le code source
- **Ligne 44** : Spécifie Python comme langage de programmation
- **Ligne 45** : Utilise Azure Container Apps comme plateforme d'hébergement
- **Lignes 46-48** : Configuration Docker

      - Utilise "api_and_frontend" comme nom d'image
      - Construit l'image Docker à distance sur Azure (pas localement)

### 2.5 Variables de pipeline (49-76)

Ces variables permettent d'exécuter `azd` dans des pipelines CI/CD pour l'automatisation

```yaml title="" linenums="0"
pipeline:
  variables:
    - AZURE_RESOURCE_GROUP
    - AZURE_AIHUB_NAME
    - AZURE_AIPROJECT_NAME
    - AZURE_AISERVICES_NAME
    - AZURE_SEARCH_SERVICE_NAME
    - AZURE_APPLICATION_INSIGHTS_NAME
    - AZURE_CONTAINER_REGISTRY_NAME
    - AZURE_KEYVAULT_NAME
    - AZURE_STORAGE_ACCOUNT_NAME
    - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
    - USE_CONTAINER_REGISTRY
    - USE_APPLICATION_INSIGHTS
    - USE_AZURE_AI_SEARCH_SERVICE
    - AZURE_AI_AGENT_NAME
    - AZURE_AI_AGENT_ID
    - AZURE_AI_AGENT_DEPLOYMENT_NAME
    - AZURE_AI_AGENT_DEPLOYMENT_SKU
    - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
    - AZURE_AI_AGENT_MODEL_NAME
    - AZURE_AI_AGENT_MODEL_FORMAT
    - AZURE_AI_AGENT_MODEL_VERSION
    - AZURE_AI_EMBED_DEPLOYMENT_NAME
    - AZURE_AI_EMBED_DEPLOYMENT_SKU
    - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
    - AZURE_AI_EMBED_MODEL_NAME
    - AZURE_AI_EMBED_MODEL_FORMAT
    - AZURE_AI_EMBED_MODEL_VERSION
    - AZURE_AI_EMBED_DIMENSIONS
    - AZURE_AI_SEARCH_INDEX_NAME
    - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
    - AZURE_EXISTING_AIPROJECT_ENDPOINT
    - AZURE_EXISTING_AGENT_ID
    - ENABLE_AZURE_MONITOR_TRACING
    - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
```

Cette section définit les variables d'environnement utilisées **pendant le déploiement**, organisées par catégorie :

- **Noms des ressources Azure (Lignes 51-60)** :
      - Noms des ressources principales des services Azure, par exemple, Resource Group, AI Hub, AI Project, etc.
- **Indicateurs de fonctionnalités (Lignes 61-63)** :
      - Variables booléennes pour activer/désactiver certains services Azure
- **Configuration de l'agent IA (Lignes 64-71)** :
      - Configuration de l'agent IA principal, y compris le nom, l'ID, les paramètres de déploiement, les détails du modèle
- **Configuration d'embedding IA (Lignes 72-79)** :
      - Configuration du modèle d'embedding utilisé pour la recherche vectorielle
- **Recherche et surveillance (Lignes 80-84)** :
      - Nom de l'index de recherche, ID des ressources existantes et paramètres de surveillance/traçage

---

## 3. Connaître les variables d'environnement

Les variables d'environnement suivantes contrôlent la configuration et le comportement de votre déploiement, organisées par leur objectif principal. La plupart des variables ont des valeurs par défaut raisonnables, mais vous pouvez les personnaliser pour répondre à vos besoins spécifiques ou aux ressources Azure existantes.

### 3.1 Variables requises

```bash title="" linenums="0"
# Core Azure Configuration
AZURE_ENV_NAME                    # Environment name (used in resource naming)
AZURE_LOCATION                    # Deployment region
AZURE_SUBSCRIPTION_ID             # Target subscription
AZURE_RESOURCE_GROUP              # Resource group name
AZURE_PRINCIPAL_ID                # User principal for RBAC

# Resource Names (Auto-generated if not specified)
AZURE_AIHUB_NAME                  # AI Foundry hub name
AZURE_AIPROJECT_NAME              # AI project name
AZURE_AISERVICES_NAME             # AI services account name
AZURE_STORAGE_ACCOUNT_NAME        # Storage account name
AZURE_CONTAINER_REGISTRY_NAME     # Container registry name
AZURE_KEYVAULT_NAME               # Key Vault name (if used)
```

### 3.2 Configuration du modèle

```bash title="" linenums="0"
# Chat Model Configuration
AZURE_AI_AGENT_MODEL_NAME         # Default: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Default: OpenAI (or Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Default: latest available
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Deployment name for chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Default: 80 (thousands of TPM)

# Embedding Model Configuration  
AZURE_AI_EMBED_MODEL_NAME         # Default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Default: latest available
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Deployment name for embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Default: 50 (thousands of TPM)

# Agent Configuration
AZURE_AI_AGENT_NAME               # Agent display name
AZURE_EXISTING_AGENT_ID           # Use existing agent (optional)
```

### 3.3 Activation des fonctionnalités

```bash title="" linenums="0"
# Optional Services
USE_APPLICATION_INSIGHTS         # Default: true
USE_AZURE_AI_SEARCH_SERVICE      # Default: false
USE_CONTAINER_REGISTRY           # Default: true

# Monitoring and Tracing
ENABLE_AZURE_MONITOR_TRACING     # Default: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Default: false

# Search Configuration
AZURE_AI_SEARCH_INDEX_NAME       # Search index name
AZURE_SEARCH_SERVICE_NAME        # Search service name
```

### 3.4 Configuration du projet IA

```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Vérifiez vos variables

Utilisez Azure Developer CLI pour afficher et gérer vos variables d'environnement :

```bash title="" linenums="0"
# View all environment variables for current environment
azd env get-values

# Get a specific environment variable
azd env get-value AZURE_ENV_NAME

# Set an environment variable
azd env set AZURE_LOCATION eastus

# Set multiple variables from a .env file
azd env set --from-file .env
```

---

