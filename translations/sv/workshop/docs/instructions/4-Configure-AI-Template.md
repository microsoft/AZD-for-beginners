# 4. Konfigurera en mall

!!! tip "I SLUTET AV DENNA MODUL KOMMER DU ATT KUNNA"

    - [ ] Förstå syftet med `azure.yaml`
    - [ ] Förstå strukturen i `azure.yaml`
    - [ ] Förstå värdet av azd livscykel `hooks`
    - [ ] **Laboration 4:** Utforska och ändra miljövariabler

---

!!! prompt "Vad gör filen `azure.yaml`? Använd ett kodblock och förklara den rad för rad"

      Filen `azure.yaml` är **konfigurationsfilen för Azure Developer CLI (azd)**. Den definierar hur din applikation ska distribueras till Azure, inklusive infrastruktur, tjänster, distribuerings-hooks och miljövariabler.

---

## 1. Syfte och funktionalitet

Denna `azure.yaml`-fil fungerar som **distributionsplan** för en AI-agentapplikation som:

1. **Validerar miljön** innan distribution
2. **Provisionerar Azure AI-tjänster** (AI Hub, AI Project, Search, etc.)
3. **Distribuerar en Python-applikation** till Azure Container Apps
4. **Konfigurerar AI-modeller** för både chatt- och embeddingsfunktionalitet
5. **Ställer in övervakning och spårning** för AI-applikationen
6. **Hanterar både nya och befintliga** Azure AI-projektscenarier

Filen möjliggör distribution med ett kommando (`azd up`) av en komplett AI-agentlösning med korrekt validering, provisionering och efter-distributionskonfiguration.

??? info "Expandera för att visa: `azure.yaml`"

      Filen `azure.yaml` definierar hur Azure Developer CLI ska distribuera och hantera denna AI-agentapplikation i Azure. Låt oss gå igenom den rad för rad.

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

## 2. Genomgång av filen

Låt oss gå igenom filen avsnitt för avsnitt för att förstå vad den gör - och varför.

### 2.1 **Rubrik och schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Rad 1**: Tillhandahåller YAML language server schema-validering för IDE-stöd och IntelliSense

### 2.2 Projektmetadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Rad 5**: Definierar projektnamnet som används av Azure Developer CLI
- **Raderna 6–7**: Anger att detta baseras på en mall version 1.0.2
- **Raderna 8–9**: Kräver Azure Developer CLI version 1.14.0 eller högre

### 2.3 Distribueringshooks (11-40)

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

- **Raderna 11–20**: **För-distributionshook** - körs före `azd up`

      - På Unix/Linux: Gör valideringsskriptet körbart och kör det
      - På Windows: Kör PowerShell-valideringsskriptet
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
- **Raderna 21–30**: **Post-provision-hook** - körs efter att Azure-resurser skapats

  - Kör skript som skriver miljövariabler
  - Fortsätter distributionen även om dessa skript misslyckas (`continueOnError: true`)

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
- **Raderna 31–40**: **Post-deploy-hook** - körs efter applikationsdistributionen

  - Kör slutliga uppsättningsskript
  - Fortsätter även om skripten misslyckas

### 2.4 Tjänstkonfiguration (41-48)

Detta konfigurerar applikationstjänsten som du distribuerar.

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

- **Rad 42**: Definierar en tjänst med namnet "api_and_frontend"
- **Rad 43**: Pekar på katalogen `./src` för källkod
- **Rad 44**: Anger Python som programmeringsspråk
- **Rad 45**: Använder Azure Container Apps som värdplattform
- **Raderna 46–48**: Docker-konfiguration

      - Använder "api_and_frontend" som bildnamn
      - Bygger Docker-avbildningen i Azure (inte lokalt)

### 2.5 Pipelinevariabler (49-76)

Detta är variabler som hjälper dig att köra `azd` i CI/CD-pipelines för automation

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

Detta avsnitt definierar miljövariabler som används **under distributionen**, organiserade efter kategori:

- **Azure-resursnamn (Raderna 51–60)**:
      - Kärn-Azure-tjänsternas resursnamn t.ex. Resource Group, AI Hub, AI Project, etc.- 
- **Funktionsflaggor (Raderna 61–63)**:
      - Booleska variabler för att aktivera/inaktivera specifika Azure-tjänster
- **AI-agentkonfiguration (Raderna 64–71)**:
      - Konfiguration för huvud-AI-agenten inklusive namn, ID, distributionsinställningar, modellinformation- 
- **AI-embeddingkonfiguration (Raderna 72–79)**:
      - Konfiguration för embedddingsmodellen som används för vektorsökning
- **Sökning och övervakning (Raderna 80–84)**:
      - Sökindexnamn, befintliga resurs-ID:n och inställningar för övervakning/spårning

---

## 3. Känn till miljövariabler
Följande miljövariabler styr din distributions konfiguration och beteende, organiserade efter deras huvudsakliga syfte. De flesta variabler har vettiga standardvärden, men du kan anpassa dem för att matcha dina specifika krav eller befintliga Azure-resurser.

### 3.1 Obligatoriska variabler 

```bash title="" linenums="0"
# Kärnkonfiguration för Azure
AZURE_ENV_NAME                    # Miljönamn (används vid namngivning av resurser)
AZURE_LOCATION                    # Region för distribution
AZURE_SUBSCRIPTION_ID             # Målprenumeration
AZURE_RESOURCE_GROUP              # Resursgruppsnamn
AZURE_PRINCIPAL_ID                # Användarprincipal för RBAC

# Resursnamn (genereras automatiskt om inte angivet)
AZURE_AIHUB_NAME                  # Namn på Microsoft Foundry-hubben
AZURE_AIPROJECT_NAME              # Namn på AI-projekt
AZURE_AISERVICES_NAME             # Namn på konto för AI-tjänster
AZURE_STORAGE_ACCOUNT_NAME        # Namn på lagringskonto
AZURE_CONTAINER_REGISTRY_NAME     # Namn på containerregister
AZURE_KEYVAULT_NAME               # Key Vault-namn (om används)
```

### 3.2 Modellkonfiguration 
```bash title="" linenums="0"
# Konfiguration för chattmodell
AZURE_AI_AGENT_MODEL_NAME         # Standard: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Standard: OpenAI (eller Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Standard: senaste tillgängliga
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Distributionsnamn för chattmodellen
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Standard: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Standard: 80 (tusentals TPM)

# Konfiguration för inbäddningsmodell
AZURE_AI_EMBED_MODEL_NAME         # Standard: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Standard: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Standard: senaste tillgängliga
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Distributionsnamn för inbäddningar
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Standard: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Standard: 50 (tusentals TPM)

# Agentkonfiguration
AZURE_AI_AGENT_NAME               # Agentens visningsnamn
AZURE_EXISTING_AGENT_ID           # Använd befintlig agent (valfritt)
```

### 3.3 Funktionsflaggor
```bash title="" linenums="0"
# Valfria tjänster
USE_APPLICATION_INSIGHTS         # Standard: sant
USE_AZURE_AI_SEARCH_SERVICE      # Standard: falskt
USE_CONTAINER_REGISTRY           # Standard: sant

# Övervakning och spårning
ENABLE_AZURE_MONITOR_TRACING     # Standard: falskt
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Standard: falskt

# Sökkonfiguration
AZURE_AI_SEARCH_INDEX_NAME       # Sökindexnamn
AZURE_SEARCH_SERVICE_NAME        # Söktjänstnamn
```

### 3.4 AI-projektkonfiguration 
```bash title="" linenums="0"
# Använd befintliga resurser
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Fullständigt resurs-ID för befintligt AI-projekt
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Slutpunkts-URL för befintligt projekt
```

### 3.5 Kontrollera dina variabler

Använd Azure Developer CLI för att visa och hantera dina miljövariabler:

```bash title="" linenums="0"
# Visa alla miljövariabler för den aktuella miljön
azd env get-values

# Hämta en specifik miljövariabel
azd env get-value AZURE_ENV_NAME

# Ställ in en miljövariabel
azd env set AZURE_LOCATION eastus

# Ställ in flera variabler från en .env-fil
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten Co-op Translator (https://github.com/Azure/co-op-translator). Vi strävar efter noggrannhet, men var medveten om att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->