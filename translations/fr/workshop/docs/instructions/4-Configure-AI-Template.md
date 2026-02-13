# 4. Configurez un Modèle

!!! tip "À LA FIN DE CE MODULE, VOUS SEREZ CAPABLE DE"

    - [ ] Comprendre le but du fichier `azure.yaml`
    - [ ] Comprendre la structure du fichier `azure.yaml`
    - [ ] Comprendre la valeur des `hooks` du cycle de vie azd
    - [ ] **Lab 4 :** Explorer et modifier les variables d’environnement

---

!!! prompt "Que fait le fichier `azure.yaml` ? Utilisez une zone de code et expliquez-le ligne par ligne"

      Le fichier `azure.yaml` est le **fichier de configuration pour Azure Developer CLI (azd)**. Il définit comment votre application doit être déployée sur Azure, incluant l'infrastructure, les services, les hooks de déploiement et les variables d’environnement.

---

## 1. But et Fonctionnalité

Ce fichier `azure.yaml` sert de **plan de déploiement** pour une application d’agent IA qui :

1. **Valide l’environnement** avant le déploiement
2. **Provisionne des services Azure AI** (AI Hub, AI Project, Search, etc.)
3. **Déploie une application Python** dans Azure Container Apps
4. **Configure les modèles IA** pour les fonctionnalités chat et embedding
5. **Configure la surveillance et le traçage** pour l’application IA
6. **Gère les scénarios de projet IA Azure nouveaux et existants**

Le fichier permet un **déploiement en une seule commande** (`azd up`) d’une solution complète d’agent IA avec validation, provisionnement et configuration post-déploiement adéquates.

??? info "Développer pour voir : `azure.yaml`"

      Le fichier `azure.yaml` définit comment Azure Developer CLI doit déployer et gérer cette application d’agent IA dans Azure. Décortiquons-le ligne par ligne.

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

## 2. Déconstruction Du Fichier

Passons en revue chaque section du fichier pour comprendre ce qu’elle fait et pourquoi.

### 2.1 **En-tête et Schéma (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Ligne 1** : Fournit la validation de schéma YAML language server pour le support IDE et IntelliSense

### 2.2 Métadonnées du Projet (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Ligne 5** : Définit le nom du projet utilisé par Azure Developer CLI
- **Lignes 6-7** : Spécifie que c’est basé sur un modèle version 1.0.2
- **Lignes 8-9** : Requiert Azure Developer CLI version 1.14.0 ou supérieure

### 2.3 Hooks de Déploiement (11-40)

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

- **Lignes 11-20** : **Hook pré-déploiement** – s’exécute avant `azd up`

      - Sur Unix/Linux : Rend le script de validation exécutable et l’exécute
      - Sur Windows : Exécute le script PowerShell de validation
      - Les deux sont interactifs et interrompent le déploiement en cas d’échec

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
- **Lignes 21-30** : **Hook post-provisionnement** – s’exécute après la création des ressources Azure

  - Exécute les scripts d’écriture des variables d’environnement
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
- **Lignes 31-40** : **Hook post-déploiement** – s’exécute après le déploiement de l’application

  - Exécute les scripts de configuration finale
  - Continue même en cas d’échec des scripts

### 2.4 Configuration du Service (41-48)

Cette section configure le service applicatif que vous déployez.

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
- **Ligne 43** : Cible le dossier `./src` pour le code source
- **Ligne 44** : Spécifie Python comme langage de programmation
- **Ligne 45** : Utilise Azure Container Apps comme plateforme d’hébergement
- **Lignes 46-48** : Configuration Docker

      - Utilise "api_and_frontend" comme nom d’image
      - Construit l’image Docker à distance dans Azure (pas localement)

### 2.5 Variables de Pipeline (49-76)

Ce sont des variables pour vous aider à exécuter `azd` dans des pipelines CI/CD pour automatisation

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

Cette section définit les variables d’environnement utilisées **pendant le déploiement**, organisées par catégorie :

- **Noms de ressources Azure (Lignes 51-60)** :
      - Noms des ressources de services Azure de base, par ex. : Groupe de ressources, AI Hub, AI Project, etc.
- **Flags de fonctionnalités (Lignes 61-63)** :
      - Variables booléennes pour activer/désactiver des services Azure spécifiques
- **Configuration de l’Agent IA (Lignes 64-71)** :
      - Configuration de l’agent IA principal incluant nom, ID, paramètres de déploiement, détails du modèle
- **Configuration d’Embedding IA (Lignes 72-79)** :
      - Configuration du modèle d’embedding utilisé pour la recherche vectorielle
- **Recherche et Surveillance (Lignes 80-84)** :
      - Nom de l’index de recherche, IDs de ressources existantes, et paramètres de surveillance/traçage

---

## 3. Connaître les Variables d’Environnement
Les variables d’environnement suivantes contrôlent la configuration et le comportement de votre déploiement, organisées par leur but principal. La plupart des variables ont des valeurs par défaut raisonnables, mais vous pouvez les personnaliser pour correspondre à vos besoins spécifiques ou ressources Azure existantes.

### 3.1 Variables Requises

```bash title="" linenums="0"
# Configuration de base Azure
AZURE_ENV_NAME                    # Nom de l'environnement (utilisé dans la dénomination des ressources)
AZURE_LOCATION                    # Région de déploiement
AZURE_SUBSCRIPTION_ID             # Abonnement cible
AZURE_RESOURCE_GROUP              # Nom du groupe de ressources
AZURE_PRINCIPAL_ID                # Principal utilisateur pour RBAC

# Noms des ressources (générés automatiquement si non spécifiés)
AZURE_AIHUB_NAME                  # Nom du hub Microsoft Foundry
AZURE_AIPROJECT_NAME              # Nom du projet IA
AZURE_AISERVICES_NAME             # Nom du compte des services IA
AZURE_STORAGE_ACCOUNT_NAME        # Nom du compte de stockage
AZURE_CONTAINER_REGISTRY_NAME     # Nom du registre de conteneurs
AZURE_KEYVAULT_NAME               # Nom du Key Vault (si utilisé)
```

### 3.2 Configuration du Modèle
```bash title="" linenums="0"
# Configuration du modèle de chat
AZURE_AI_AGENT_MODEL_NAME         # Par défaut : gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Par défaut : OpenAI (ou Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Par défaut : dernière version disponible
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Nom de déploiement pour le modèle de chat
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Par défaut : Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Par défaut : 80 (milliers de TPM)

# Configuration du modèle d'intégration
AZURE_AI_EMBED_MODEL_NAME         # Par défaut : text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Par défaut : OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Par défaut : dernière version disponible
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Nom de déploiement pour les intégrations
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Par défaut : Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Par défaut : 50 (milliers de TPM)

# Configuration de l'agent
AZURE_AI_AGENT_NAME               # Nom affiché de l'agent
AZURE_EXISTING_AGENT_ID           # Utiliser un agent existant (optionnel)
```

### 3.3 Bascule de Fonctionnalités
```bash title="" linenums="0"
# Services facultatifs
USE_APPLICATION_INSIGHTS         # Par défaut : vrai
USE_AZURE_AI_SEARCH_SERVICE      # Par défaut : faux
USE_CONTAINER_REGISTRY           # Par défaut : vrai

# Surveillance et traçage
ENABLE_AZURE_MONITOR_TRACING     # Par défaut : faux
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Par défaut : faux

# Configuration de recherche
AZURE_AI_SEARCH_INDEX_NAME       # Nom de l'index de recherche
AZURE_SEARCH_SERVICE_NAME        # Nom du service de recherche
```

### 3.4 Configuration du Projet IA
```bash title="" linenums="0"
# Utiliser les ressources existantes
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ID complet de la ressource du projet IA existant
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL du point de terminaison du projet existant
```

### 3.5 Vérifiez Vos Variables

Utilisez Azure Developer CLI pour voir et gérer vos variables d’environnement :

```bash title="" linenums="0"
# Voir toutes les variables d'environnement pour l'environnement actuel
azd env get-values

# Obtenir une variable d'environnement spécifique
azd env get-value AZURE_ENV_NAME

# Définir une variable d'environnement
azd env set AZURE_LOCATION eastus

# Définir plusieurs variables à partir d'un fichier .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçons d’assurer l’exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source officielle. Pour les informations critiques, une traduction professionnelle humaine est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou d’interprétations erronées résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->