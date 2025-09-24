<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-24T22:51:56+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "nl"
}
-->
# 4. Configureer een Template

!!! tip "AAN HET EINDE VAN DEZE MODULE KUN JE"

    - [ ] Het doel van `azure.yaml` begrijpen
    - [ ] De structuur van `azure.yaml` begrijpen
    - [ ] De waarde van azd lifecycle `hooks` begrijpen
    - [ ] **Lab 3:** 

---

!!! prompt "Wat doet het `azure.yaml` bestand? Gebruik een codeblok en leg het regel voor regel uit"

      Het `azure.yaml` bestand is het **configuratiebestand voor Azure Developer CLI (azd)**. Het definieert hoe je applicatie moet worden uitgerold naar Azure, inclusief infrastructuur, services, deployment hooks en omgevingsvariabelen.

---

## 1. Doel en Functionaliteit

Dit `azure.yaml` bestand dient als het **uitrolplan** voor een AI-agent applicatie die:

1. **De omgeving valideert** vóór uitrol
2. **Azure AI-services inricht** (AI Hub, AI Project, Search, etc.)
3. **Een Python-applicatie uitrolt** naar Azure Container Apps
4. **AI-modellen configureert** voor zowel chat- als embed-functionaliteit
5. **Monitoring en tracing instelt** voor de AI-applicatie
6. Omgaat met zowel nieuwe als bestaande** Azure AI-projectscenario's

Het bestand maakt een **uitrol met één commando** (`azd up`) mogelijk van een complete AI-agent oplossing met juiste validatie, inrichting en post-uitrolconfiguratie.

??? info "Klik om te bekijken: `azure.yaml`"

      Het `azure.yaml` bestand definieert hoe Azure Developer CLI deze AI-agent applicatie moet uitrollen en beheren in Azure. Laten we het regel voor regel bekijken.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: hebben we hooks nodig? 
      # TODO: hebben we alle variabelen nodig?

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

## 2. Het Bestand Uiteenhalen

Laten we het bestand sectie voor sectie doornemen om te begrijpen wat het doet - en waarom.

### 2.1 **Header en Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Regel 1**: Biedt YAML-taalserver schema-validatie voor IDE-ondersteuning en IntelliSense

### 2.2 Project Metadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Regel 5**: Definieert de projectnaam die door Azure Developer CLI wordt gebruikt
- **Regels 6-7**: Geeft aan dat dit gebaseerd is op een template versie 1.0.2
- **Regels 8-9**: Vereist Azure Developer CLI versie 1.14.0 of hoger

### 2.3 Deploy Hooks (11-40)

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

- **Regels 11-20**: **Pre-deployment hook** - wordt uitgevoerd vóór `azd up`

      - Op Unix/Linux: Maakt validatiescript uitvoerbaar en voert het uit
      - Op Windows: Voert PowerShell validatiescript uit
      - Beide zijn interactief en stoppen de uitrol als ze falen

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
- **Regels 21-30**: **Post-provision hook** - wordt uitgevoerd nadat Azure resources zijn aangemaakt

  - Voert scripts uit om omgevingsvariabelen te schrijven
  - Zet de uitrol voort, zelfs als deze scripts falen (`continueOnError: true`)

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
- **Regels 31-40**: **Post-deploy hook** - wordt uitgevoerd na applicatie-uitrol

  - Voert laatste setup-scripts uit
  - Zet door, zelfs als scripts falen

### 2.4 Service Configuratie (41-48)

Dit configureert de applicatieservice die je uitrolt.

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

- **Regel 42**: Definieert een service genaamd "api_and_frontend"
- **Regel 43**: Wijst naar de `./src` directory voor broncode
- **Regel 44**: Geeft Python op als programmeertaal
- **Regel 45**: Gebruikt Azure Container Apps als hostingplatform
- **Regels 46-48**: Docker-configuratie

      - Gebruikt "api_and_frontend" als de imagenaam
      - Bouwt de Docker-image op afstand in Azure (niet lokaal)

### 2.5 Pipeline Variabelen (49-76)

Dit zijn variabelen om `azd` te gebruiken in CI/CD-pipelines voor automatisering

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

Deze sectie definieert omgevingsvariabelen die **tijdens de uitrol** worden gebruikt, georganiseerd per categorie:

- **Azure Resource Namen (Regels 51-60)**:
      - Kern Azure service resource namen, zoals Resource Group, AI Hub, AI Project, etc.- 
- **Feature Flags (Regels 61-63)**:
      - Booleaanse variabelen om specifieke Azure-services in of uit te schakelen
- **AI Agent Configuratie (Regels 64-71)**:
      - Configuratie voor de hoofd AI-agent inclusief naam, ID, uitrolinstellingen, modeldetails- 
- **AI Embed Configuratie (Regels 72-79)**:
      - Configuratie voor het embed-model dat wordt gebruikt voor vectorzoekopdrachten
- **Zoeken en Monitoring (Regels 80-84)**:
      - Zoekindexnaam, bestaande resource-ID's en monitoring/tracing instellingen

---

## 3. Ken Omgevingsvariabelen
De volgende omgevingsvariabelen bepalen de configuratie en het gedrag van je uitrol, georganiseerd naar hun primaire doel. De meeste variabelen hebben logische standaardwaarden, maar je kunt ze aanpassen aan je specifieke vereisten of bestaande Azure-resources.

### 3.1 Vereiste Variabelen 

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

### 3.2 Modelconfiguratie 
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

### 3.3 Feature Toggle
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

### 3.4 AI Project Configuratie 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Controleer Je Variabelen

Gebruik de Azure Developer CLI om je omgevingsvariabelen te bekijken en beheren:

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

