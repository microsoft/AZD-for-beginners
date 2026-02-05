# 4. Konfigurer en skabelon

!!! tip "VED SLUTNINGEN AF DETTE MODUL VIL DU KUNNE"

    - [ ] Forstå formålet med `azure.yaml`
    - [ ] Forstå strukturen af `azure.yaml`
    - [ ] Forstå værdien af azd livscyklus `hooks`
    - [ ] **Lab 3:** 

---

!!! prompt "Hvad gør `azure.yaml`-filen? Brug en kodeblok og forklar den linje for linje"

      `azure.yaml`-filen er **konfigurationsfilen for Azure Developer CLI (azd)**. Den definerer, hvordan din applikation skal implementeres til Azure, inklusive infrastruktur, tjenester, implementeringshooks og miljøvariabler.

---

## 1. Formål og funktionalitet

Denne `azure.yaml`-fil fungerer som **implementeringsplanen** for en AI-agent-applikation, der:

1. **Validerer miljøet** før implementering
2. **Provisionerer Azure AI-tjenester** (AI Hub, AI Project, Search osv.)
3. **Implementerer en Python-applikation** til Azure Container Apps
4. **Konfigurerer AI-modeller** til både chat- og embedding-funktionalitet
5. **Opsætter overvågning og sporing** for AI-applikationen
6. **Håndterer både nye og eksisterende** Azure AI-projektscenarier

Filen muliggør **implementering med én kommando** (`azd up`) af en komplet AI-agentløsning med korrekt validering, provisionering og efter-implementeringskonfiguration.

??? info "Udvid for at se: `azure.yaml`"

      `azure.yaml`-filen definerer, hvordan Azure Developer CLI skal implementere og administrere denne AI-agent-applikation i Azure. Lad os gennemgå den linje for linje.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: har vi brug for hooks? 
      # TODO: har vi brug for alle variablerne?

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

## 2. Gennemgang af filen

Lad os gennemgå filen sektion for sektion for at forstå, hvad den gør - og hvorfor.

### 2.1 **Header og skema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Linje 1**: Giver YAML-sprogserver-skema-validering for IDE-support og IntelliSense

### 2.2 Projektmetadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Linje 5**: Definerer projektets navn, som bruges af Azure Developer CLI
- **Linjer 6-7**: Angiver, at dette er baseret på en skabelonversion 1.0.2
- **Linjer 8-9**: Kræver Azure Developer CLI version 1.14.0 eller højere

### 2.3 Implementeringshooks (11-40)

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

- **Linjer 11-20**: **Pre-deployment hook** - kører før `azd up`

      - På Unix/Linux: Gør valideringsscriptet eksekverbart og kører det
      - På Windows: Kører PowerShell-valideringsscript
      - Begge er interaktive og vil stoppe implementeringen, hvis de fejler

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
- **Linjer 21-30**: **Post-provision hook** - kører efter Azure-ressourcer er oprettet

  - Udfører scripts til at skrive miljøvariabler
  - Fortsætter implementeringen, selv hvis disse scripts fejler (`continueOnError: true`)

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
- **Linjer 31-40**: **Post-deploy hook** - kører efter applikationsimplementering

  - Udfører endelige opsætningsscripts
  - Fortsætter, selv hvis scripts fejler

### 2.4 Servicekonfiguration (41-48)

Dette konfigurerer den applikationstjeneste, du implementerer.

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

- **Linje 42**: Definerer en tjeneste kaldet "api_and_frontend"
- **Linje 43**: Peger på `./src`-mappen for kildekode
- **Linje 44**: Angiver Python som programmeringssprog
- **Linje 45**: Bruger Azure Container Apps som hostingplatform
- **Linjer 46-48**: Docker-konfiguration

      - Bruger "api_and_frontend" som billednavn
      - Bygger Docker-billedet eksternt i Azure (ikke lokalt)

### 2.5 Pipeline-variabler (49-76)

Disse er variabler, der hjælper dig med at køre `azd` i CI/CD-pipelines til automatisering

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

Denne sektion definerer miljøvariabler, der bruges **under implementering**, organiseret efter kategori:

- **Azure Ressourcenavne (Linjer 51-60)**:
      - Navne på centrale Azure-tjenester, f.eks. Resource Group, AI Hub, AI Project osv.- 
- **Feature Flags (Linjer 61-63)**:
      - Boolean-variabler til at aktivere/deaktivere specifikke Azure-tjenester
- **AI Agent Konfiguration (Linjer 64-71)**:
      - Konfiguration for hoved-AI-agenten, inklusive navn, ID, implementeringsindstillinger, modeldetaljer- 
- **AI Embedding Konfiguration (Linjer 72-79)**:
      - Konfiguration for embedding-modellen, der bruges til vektorsøgning
- **Søgning og Overvågning (Linjer 80-84)**:
      - Søgeindeksnavn, eksisterende ressource-ID'er og overvågnings-/sporingsindstillinger

---

## 3. Kend miljøvariablerne
Følgende miljøvariabler styrer din implementerings konfiguration og adfærd, organiseret efter deres primære formål. De fleste variabler har fornuftige standardværdier, men du kan tilpasse dem, så de matcher dine specifikke krav eller eksisterende Azure-ressourcer.

### 3.1 Påkrævede variabler 

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

### 3.2 Modelkonfiguration 
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

### 3.4 AI Projektkonfiguration 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Tjek dine variabler

Brug Azure Developer CLI til at se og administrere dine miljøvariabler:

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

