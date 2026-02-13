# 4. Konfigurer en skabelon

!!! tip "VED SLUTNINGEN AF DETTE MODUL KAN DU"

    - [ ] Forstå formålet med `azure.yaml`
    - [ ] Forstå strukturen i `azure.yaml`
    - [ ] Forstå værdien af azd lifecycle `hooks`
    - [ ] **Lab 4:** Udforsk og ændr miljøvariabler

---

!!! prompt "Hvad gør filen `azure.yaml`? Brug en kodeblok og forklar den linje for linje"

      Filen `azure.yaml` er **konfigurationsfilen for Azure Developer CLI (azd)**. Den definerer, hvordan din applikation skal udrulles til Azure, inklusive infrastruktur, tjenester, udrulningshooks og miljøvariabler.

---

## 1. Formål og funktionalitet

Denne `azure.yaml`-fil fungerer som en **udrulningsskabelon** for en AI-agent-applikation, der:

1. **Validerer miljøet** før udrulning
2. **Provisionerer Azure AI-tjenester** (AI Hub, AI Project, Search osv.)
3. **Udruller en Python-applikation** til Azure Container Apps
4. **Konfigurerer AI-modeller** til både chat- og embedding-funktionalitet
5. **Opsætter overvågning og sporing** for AI-applikationen
6. **Håndterer både nye og eksisterende** Azure AI-projektscenarier

Filen muliggør **udrulning med én kommando** (`azd up`) af en komplet AI-agent-løsning med korrekt validering, provisionering og efter-udrulningskonfiguration.

??? info "Udvid for at se: `azure.yaml`"

      Filen `azure.yaml` definerer, hvordan Azure Developer CLI skal udrulle og administrere denne AI-agent-applikation i Azure. Lad os gennemgå den linje for linje.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: do we need hooks? 
      # TODO: do we need all of the variables?

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

### 2.1 **Overskrift og skema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Linje 1**: Giver YAML language server skemavalidering til IDE-support og IntelliSense

### 2.2 Projektmetadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Linje 5**: Definerer projektets navn, der bruges af Azure Developer CLI
- **Linjerne 6-7**: Angiver, at dette er baseret på en skabelon version 1.0.2
- **Linjerne 8-9**: Kræver Azure Developer CLI version 1.14.0 eller nyere

### 2.3 Deploy-hooks (11-40)

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

- **Linjerne 11-20**: **Forudrulnings-hook** - køres før `azd up`

      - På Unix/Linux: Gør valideringsscriptet eksekverbart og kører det
      - På Windows: Kører PowerShell-valideringsscriptet
      - Begge er interaktive og stopper udrulningen, hvis de fejler

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
- **Linjerne 21-30**: **Post-provision hook** - køres efter at Azure-ressourcerne er oprettet

  - Udfører scripts, der skriver miljøvariabler
  - Fortsætter udrulningen, selvom disse scripts fejler (`continueOnError: true`)

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
- **Linjerne 31-40**: **Post-deploy hook** - køres efter applikationsudrulning

  - Udfører slutopsætningsscripts
  - Fortsætter selvom scripts fejler

### 2.4 Servicekonfiguration (41-48)

Dette konfigurerer applikationstjenesten, som du udruller.

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

- **Linje 42**: Definerer en tjeneste med navnet "api_and_frontend"
- **Linje 43**: Peger på `./src`-mappen for kildekoden
- **Linje 44**: Angiver Python som programmeringssprog
- **Linje 45**: Bruger Azure Container Apps som hosting-platform
- **Linjerne 46-48**: Docker-konfiguration

      - Bruger "api_and_frontend" som imagets navn
      - Bygger Docker-imaget fjernt i Azure (ikke lokalt)

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

Denne sektion definerer miljøvariabler, der bruges **under udrulning**, organiseret efter kategori:

- **Azure Resource Names (Linjerne 51-60)**:
      - Kernens Azure-tjenesters ressourcenavne, f.eks. Resource Group, AI Hub, AI Project osv.- 
- **Feature Flags (Linjerne 61-63)**:
      - Booleske variabler til at aktivere/deaktivere specifikke Azure-tjenester
- **AI Agent Configuration (Linjerne 64-71)**:
      - Konfiguration for hoved-AI-agenten inklusive navn, ID, udrulningsindstillinger, modeloplysninger- 
- **AI Embedding Configuration (Linjerne 72-79)**:
      - Konfiguration for embed-modelen, der bruges til vektorsøgning
- **Search and Monitoring (Linjerne 80-84)**:
      - Navn på søgeindeks, eksisterende resource IDs og indstillinger for overvågning/sporing

---

## 3. Kend miljøvariablerne
De følgende miljøvariabler styrer konfigurationen og adfærden af din udrulning, organiseret efter deres primære formål. De fleste variabler har fornuftige standardværdier, men du kan tilpasse dem, så de passer til dine specifikke krav eller eksisterende Azure-ressourcer.

### 3.1 Påkrævede variabler 

```bash title="" linenums="0"
# Kernekonfiguration for Azure
AZURE_ENV_NAME                    # Miljønavn (bruges ved navngivning af ressourcer)
AZURE_LOCATION                    # Udrulningsregion
AZURE_SUBSCRIPTION_ID             # Målabonnement
AZURE_RESOURCE_GROUP              # Navn på ressourcegruppe
AZURE_PRINCIPAL_ID                # Brugerprincipal til RBAC

# Ressourcenavne (genereres automatisk hvis ikke angivet)
AZURE_AIHUB_NAME                  # Navn på Microsoft Foundry-hub
AZURE_AIPROJECT_NAME              # AI-projektnavn
AZURE_AISERVICES_NAME             # Navn på AI-tjenestekonto
AZURE_STORAGE_ACCOUNT_NAME        # Navn på storagekonto
AZURE_CONTAINER_REGISTRY_NAME     # Navn på containerregister
AZURE_KEYVAULT_NAME               # Navn på Key Vault (hvis anvendt)
```

### 3.2 Modelkonfiguration 
```bash title="" linenums="0"
# Konfiguration af chatmodel
AZURE_AI_AGENT_MODEL_NAME         # Standard: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Standard: OpenAI (eller Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Standard: nyeste tilgængelige
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Udrulningsnavn for chatmodel
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Standard: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Standard: 80 (tusinder af TPM)

# Konfiguration af embeddingsmodel
AZURE_AI_EMBED_MODEL_NAME         # Standard: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Standard: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Standard: nyeste tilgængelige
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Udrulningsnavn for embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Standard: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Standard: 50 (tusinder af TPM)

# Agentkonfiguration
AZURE_AI_AGENT_NAME               # Agentens visningsnavn
AZURE_EXISTING_AGENT_ID           # Brug eksisterende agent (valgfrit)
```

### 3.3 Funktionsflag
```bash title="" linenums="0"
# Valgfrie tjenester
USE_APPLICATION_INSIGHTS         # Standard: sand
USE_AZURE_AI_SEARCH_SERVICE      # Standard: falsk
USE_CONTAINER_REGISTRY           # Standard: sand

# Overvågning og sporing
ENABLE_AZURE_MONITOR_TRACING     # Standard: falsk
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Standard: falsk

# Søgekonfiguration
AZURE_AI_SEARCH_INDEX_NAME       # Navn på søgeindeks
AZURE_SEARCH_SERVICE_NAME        # Navn på søgetjeneste
```

### 3.4 AI-projektkonfiguration 
```bash title="" linenums="0"
# Brug eksisterende ressourcer
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Fuld ressource-ID for eksisterende AI-projekt
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endepunkt-URL for eksisterende projekt
```

### 3.5 Kontroller dine variabler

Brug Azure Developer CLI til at se og administrere dine miljøvariabler:

```bash title="" linenums="0"
# Vis alle miljøvariabler for det nuværende miljø
azd env get-values

# Hent en specifik miljøvariabel
azd env get-value AZURE_ENV_NAME

# Sæt en miljøvariabel
azd env set AZURE_LOCATION eastus

# Sæt flere miljøvariabler fra en .env-fil
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten Co-op Translator (https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på originalsproget bør betragtes som den autoritative kilde. For vigtige oplysninger anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->