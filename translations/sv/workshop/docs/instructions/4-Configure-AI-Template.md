<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-24T21:38:55+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "sv"
}
-->
# 4. Konfigurera en Mall

!!! tip "VID SLUTET AV DETTA MODUL KOMMER DU ATT KUNNA"

    - [ ] Förstå syftet med `azure.yaml`
    - [ ] Förstå strukturen av `azure.yaml`
    - [ ] Förstå värdet av azd livscykel `hooks`
    - [ ] **Lab 3:** 

---

!!! prompt "Vad gör filen `azure.yaml`? Använd en kodblock och förklara rad för rad"

      Filen `azure.yaml` är **konfigurationsfilen för Azure Developer CLI (azd)**. Den definierar hur din applikation ska distribueras till Azure, inklusive infrastruktur, tjänster, distributionshooks och miljövariabler.

---

## 1. Syfte och Funktionalitet

Denna `azure.yaml`-fil fungerar som en **distributionsplan** för en AI-agentapplikation som:

1. **Validerar miljön** innan distribution
2. **Tillhandahåller Azure AI-tjänster** (AI Hub, AI Project, Search, etc.)
3. **Distribuerar en Python-applikation** till Azure Container Apps
4. **Konfigurerar AI-modeller** för både chatt- och inbäddningsfunktionalitet
5. **Ställer in övervakning och spårning** för AI-applikationen
6. **Hantera både nya och befintliga** Azure AI-projektscenarier

Filen möjliggör **en-kommando-distribution** (`azd up`) av en komplett AI-agentlösning med korrekt validering, tillhandahållande och efterdistributionskonfiguration.

??? info "Expandera för att visa: `azure.yaml`"

      Filen `azure.yaml` definierar hur Azure Developer CLI ska distribuera och hantera denna AI-agentapplikation i Azure. Låt oss bryta ner den rad för rad.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: behöver vi hooks? 
      # TODO: behöver vi alla variabler?

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

## 2. Avkodning av Filen

Låt oss gå igenom filen sektion för sektion för att förstå vad den gör - och varför.

### 2.1 **Header och Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Rad 1**: Tillhandahåller YAML-språkserverns schema för validering och stöd i IDE

### 2.2 Projektmetadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Rad 5**: Definierar projektets namn som används av Azure Developer CLI
- **Rader 6-7**: Anger att detta baseras på en mallversion 1.0.2
- **Rader 8-9**: Kräver Azure Developer CLI version 1.14.0 eller högre

### 2.3 Distributionshooks (11-40)

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

- **Rader 11-20**: **Pre-distributionshook** - körs innan `azd up`

      - På Unix/Linux: Gör valideringsskriptet körbart och kör det
      - På Windows: Kör PowerShell-valideringsskript
      - Båda är interaktiva och stoppar distributionen om de misslyckas

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
- **Rader 21-30**: **Post-provision-hook** - körs efter att Azure-resurser har skapats

  - Kör skript för att skriva miljövariabler
  - Fortsätter distribution även om dessa skript misslyckas (`continueOnError: true`)

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
- **Rader 31-40**: **Post-distributionshook** - körs efter applikationsdistribution

  - Kör slutliga installationsskript
  - Fortsätter även om skript misslyckas

### 2.4 Servicekonfiguration (41-48)

Detta konfigurerar applikationstjänsten du distribuerar.

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

- **Rad 42**: Definierar en tjänst som heter "api_and_frontend"
- **Rad 43**: Pekar på katalogen `./src` för källkod
- **Rad 44**: Anger Python som programmeringsspråk
- **Rad 45**: Använder Azure Container Apps som värdplattform
- **Rader 46-48**: Docker-konfiguration

      - Använder "api_and_frontend" som bildnamn
      - Bygger Docker-bilden fjärrmässigt i Azure (inte lokalt)

### 2.5 Pipeline-variabler (49-76)

Dessa är variabler som hjälper dig att köra `azd` i CI/CD-pipelines för automatisering

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

Denna sektion definierar miljövariabler som används **under distribution**, organiserade efter kategori:

- **Azure-resursnamn (Rader 51-60)**:
      - Kärnnamn för Azure-tjänster, t.ex. Resource Group, AI Hub, AI Project, etc.- 
- **Funktionsflaggor (Rader 61-63)**:
      - Booleska variabler för att aktivera/inaktivera specifika Azure-tjänster
- **AI-agentkonfiguration (Rader 64-71)**:
      - Konfiguration för huvud-AI-agenten inklusive namn, ID, distributionsinställningar, modellinformation- 
- **AI-inbäddningskonfiguration (Rader 72-79)**:
      - Konfiguration för inbäddningsmodellen som används för vektorsökning
- **Sök och övervakning (Rader 80-84)**:
      - Sökindexnamn, befintliga resurs-ID:n och inställningar för övervakning/spårning

---

## 3. Känn till Miljövariabler
Följande miljövariabler styr din distributions konfiguration och beteende, organiserade efter deras huvudsakliga syfte. De flesta variabler har rimliga standardvärden, men du kan anpassa dem för att matcha dina specifika krav eller befintliga Azure-resurser.

### 3.1 Obligatoriska Variabler 

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

### 3.2 Modellkonfiguration 
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

### 3.3 Funktionsväxling
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

### 3.4 AI-projektkonfiguration 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Kontrollera Dina Variabler

Använd Azure Developer CLI för att visa och hantera dina miljövariabler:

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

