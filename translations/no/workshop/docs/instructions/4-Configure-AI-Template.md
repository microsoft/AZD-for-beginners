# 4. Konfigurer en mal

!!! tip "VED SLUTTEN AV DETTE MODULEN VIL DU KUNNE"

    - [ ] Forstå formålet med `azure.yaml`
    - [ ] Forstå strukturen til `azure.yaml`
    - [ ] Forstå verdien av azd livssyklus `hooks`
    - [ ] **Lab 3:** 

---

!!! prompt "Hva gjør `azure.yaml`-filen? Bruk en kodeblokk og forklar den linje for linje"

      `azure.yaml`-filen er **konfigurasjonsfilen for Azure Developer CLI (azd)**. Den definerer hvordan applikasjonen din skal distribueres til Azure, inkludert infrastruktur, tjenester, distribusjonshooks og miljøvariabler.

---

## 1. Formål og funksjonalitet

Denne `azure.yaml`-filen fungerer som **distribusjonsplanen** for en AI-agentapplikasjon som:

1. **Validerer miljøet** før distribusjon
2. **Oppretter Azure AI-tjenester** (AI Hub, AI Project, Search, osv.)
3. **Distribuerer en Python-applikasjon** til Azure Container Apps
4. **Konfigurerer AI-modeller** for både chat- og embedding-funksjonalitet
5. **Setter opp overvåking og sporing** for AI-applikasjonen
6. **Håndterer både nye og eksisterende** Azure AI-prosjektscenarier

Filen muliggjør **en-kommando distribusjon** (`azd up`) av en komplett AI-agentløsning med riktig validering, opprettelse og etter-distribusjonskonfigurasjon.

??? info "Utvid for å se: `azure.yaml`"

      `azure.yaml`-filen definerer hvordan Azure Developer CLI skal distribuere og administrere denne AI-agentapplikasjonen i Azure. La oss bryte den ned linje for linje.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: trenger vi hooks? 
      # TODO: trenger vi alle variablene?

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

## 2. Dekonstruksjon av filen

La oss gå gjennom filen seksjon for seksjon for å forstå hva den gjør - og hvorfor.

### 2.1 **Header og skjema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Linje 1**: Gir YAML-språkserver skjema-validering for IDE-støtte og IntelliSense

### 2.2 Prosjektmetadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Linje 5**: Definerer prosjektnavnet som brukes av Azure Developer CLI
- **Linje 6-7**: Spesifiserer at dette er basert på en malversjon 1.0.2
- **Linje 8-9**: Krever Azure Developer CLI versjon 1.14.0 eller høyere

### 2.3 Distribusjonshooks (11-40)

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

- **Linje 11-20**: **Pre-distribusjonshook** - kjører før `azd up`

      - På Unix/Linux: Gjør valideringsskriptet kjørbart og kjører det
      - På Windows: Kjører PowerShell-valideringsskript
      - Begge er interaktive og vil stoppe distribusjonen hvis de feiler

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
- **Linje 21-30**: **Post-provisjonshook** - kjører etter at Azure-ressurser er opprettet

  - Utfører skript for å skrive miljøvariabler
  - Fortsetter distribusjonen selv om disse skriptene feiler (`continueOnError: true`)

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
- **Linje 31-40**: **Post-distribusjonshook** - kjører etter applikasjonsdistribusjon

  - Utfører endelige oppsett-skript
  - Fortsetter selv om skriptene feiler

### 2.4 Tjenestekonfigurasjon (41-48)

Dette konfigurerer applikasjonstjenesten du distribuerer.

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

- **Linje 42**: Definerer en tjeneste kalt "api_and_frontend"
- **Linje 43**: Pek til `./src`-katalogen for kildekode
- **Linje 44**: Spesifiserer Python som programmeringsspråk
- **Linje 45**: Bruker Azure Container Apps som hostingplattform
- **Linje 46-48**: Docker-konfigurasjon

      - Bruker "api_and_frontend" som bildets navn
      - Bygger Docker-bildet eksternt i Azure (ikke lokalt)

### 2.5 Pipeline-variabler (49-76)

Disse er variabler som hjelper deg å kjøre `azd` i CI/CD-pipelines for automatisering

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

Denne seksjonen definerer miljøvariabler som brukes **under distribusjon**, organisert etter kategori:

- **Azure Ressursnavn (Linje 51-60)**:
      - Navn på kjerne Azure-tjenester, f.eks. Resource Group, AI Hub, AI Project, osv.- 
- **Funksjonsflagg (Linje 61-63)**:
      - Boolean-variabler for å aktivere/deaktivere spesifikke Azure-tjenester
- **AI Agent-konfigurasjon (Linje 64-71)**:
      - Konfigurasjon for hoved-AI-agenten, inkludert navn, ID, distribusjonsinnstillinger, modell-detaljer- 
- **AI Embedding-konfigurasjon (Linje 72-79)**:
      - Konfigurasjon for embedding-modellen som brukes for vektorsøk
- **Søk og overvåking (Linje 80-84)**:
      - Søk indeksnavn, eksisterende ressurs-IDer og overvåking/sporingsinnstillinger

---

## 3. Kjenn miljøvariablene
Følgende miljøvariabler styrer konfigurasjonen og oppførselen til distribusjonen din, organisert etter deres primære formål. De fleste variabler har fornuftige standardverdier, men du kan tilpasse dem for å matche dine spesifikke krav eller eksisterende Azure-ressurser.

### 3.1 Påkrevde variabler 

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

### 3.2 Modellkonfigurasjon 
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

### 3.3 Funksjonsbrytere
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

### 3.4 AI Prosjektkonfigurasjon 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Sjekk variablene dine

Bruk Azure Developer CLI for å vise og administrere miljøvariablene dine:

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

