# 4. Konfigurer en mal

!!! tip "PÅ SLUTTEN AV DETTE MODULEN VIL DU KUNNE"

    - [ ] Forstå hensikten med `azure.yaml`
    - [ ] Forstå strukturen til `azure.yaml`
    - [ ] Forstå verdien av azd livssyklus `hooks`
    - [ ] **Lab 4:** Utforske og endre miljøvariabler

---

!!! prompt "Hva gjør `azure.yaml`-filen? Bruk en kodeblokk og forklar linje for linje"

      `azure.yaml`-filen er **konfigurasjonsfilen for Azure Developer CLI (azd)**. Den definerer hvordan applikasjonen din skal distribueres til Azure, inkludert infrastruktur, tjenester, distribusjonshooks og miljøvariabler.

---

## 1. Formål og funksjonalitet

Denne `azure.yaml`-filen fungerer som **distribusjonsplanen** for en AI-agent-applikasjon som:

1. **Validerer miljøet** før distribusjon
2. **Provisionerer Azure AI-tjenester** (AI Hub, AI Project, Search, osv.)
3. **Distribuerer en Python-applikasjon** til Azure Container Apps
4. **Konfigurerer AI-modeller** for både chat og embedding-funksjonalitet
5. **Setter opp overvåkning og sporing** for AI-applikasjonen
6. **Håndterer både nye og eksisterende** Azure AI-prosjekt-scenarier

Filene muliggjør **en-kommando distribusjon** (`azd up`) av en komplett AI-agent-løsning med riktig validering, provisjonering og etter-distribusjonskonfigurasjon.

??? info "Utvid for å se: `azure.yaml`"

      `azure.yaml`-filen definerer hvordan Azure Developer CLI skal distribuere og administrere denne AI Agent-applikasjonen i Azure. La oss bryte det ned linje for linje.

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

## 2. Dekonstruere filen

La oss gå gjennom filen seksjon for seksjon for å forstå hva den gjør – og hvorfor.

### 2.1 **Header og Skjema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Linje 1**: Gir YAML språkserver-skjema validering for IDE-støtte og IntelliSense

### 2.2 Prosjektmetadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Linje 5**: Definerer prosjektnavnet brukt av Azure Developer CLI
- **Linje 6-7**: Spesifiserer at dette er basert på en mal versjon 1.0.2
- **Linje 8-9**: Krever Azure Developer CLI versjon 1.14.0 eller nyere

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
      - På Windows: Kjører PowerShell valideringsskript
      - Begge er interaktive og stopper distribusjonen hvis de feiler

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
- **Linje 21-30**: **Post-provisjoneringshook** - kjører etter Azure-ressurser er opprettet

  - Utfører skript for å skrive miljøvariabler
  - Fortsetter distribusjonen selv om skriptene feiler (`continueOnError: true`)

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
- **Linje 31-40**: **Post-distribusjonshook** - kjører etter at applikasjonen er distribuert

  - Utfører sluttkonfigurasjonsskripter
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
- **Linje 43**: Refererer til `./src` katalogen for kildekoden
- **Linje 44**: Spesifiserer Python som programmeringsspråk
- **Linje 45**: Bruker Azure Container Apps som hostingplattform
- **Linje 46-48**: Docker-konfigurasjon

      - Bruker "api_and_frontend" som bildets navn
      - Bygger Docker-imaget eksternt i Azure (ikke lokalt)

### 2.5 Pipeline Variabler (49-76)

Disse er variabler for å hjelpe deg kjøre `azd` i CI/CD pipelines for automatisering

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

Denne seksjonen definerer miljøvariabler brukt **under distribusjon**, organisert etter kategori:

- **Azure Ressursnavn (linje 51-60)**:
      - Kjernetjenestens ressursnavn i Azure, f.eks Ressursgruppe, AI Hub, AI Project osv.
- **Funksjonsflagg (linje 61-63)**:
      - Boolske variabler for å aktivere/deaktivere spesifikke Azure-tjenester
- **AI Agent Konfigurasjon (linje 64-71)**:
      - Konfigurasjon for hoved-AI-agent inkludert navn, ID, distribusjonsinnstillinger, modelldetaljer
- **AI Embedding Konfigurasjon (linje 72-79)**:
      - Konfigurasjon for embeddingmodell brukt til vektorsøk
- **Søk og Overvåkning (linje 80-84)**:
      - Navn på søkeindeks, eksisterende ressurs-IDer og innstillinger for overvåkning/sporing

---

## 3. Kjenn miljøvariablene
Følgende miljøvariabler kontrollerer konfigurasjon og oppførsel for distribusjonen din, organisert etter deres primære formål. De fleste variabler har fornuftige standardverdier, men du kan tilpasse dem for å matche dine spesifikke krav eller eksisterende Azure-ressurser.

### 3.1 Påkrevde variabler 

```bash title="" linenums="0"
# Kjerne Azure-konfigurasjon
AZURE_ENV_NAME                    # Miljønavn (brukes i ressursnavngivning)
AZURE_LOCATION                    # Distribusjonsregion
AZURE_SUBSCRIPTION_ID             # Målabonnement
AZURE_RESOURCE_GROUP              # Ressursgruppe navn
AZURE_PRINCIPAL_ID                # Brukerprincipal for RBAC

# Ressursnavn (auto-generert hvis ikke angitt)
AZURE_AIHUB_NAME                  # Microsoft Foundry hub-navn
AZURE_AIPROJECT_NAME              # AI prosjekt navn
AZURE_AISERVICES_NAME             # AI tjenester konto navn
AZURE_STORAGE_ACCOUNT_NAME        # Lagringskonto navn
AZURE_CONTAINER_REGISTRY_NAME     # Container register navn
AZURE_KEYVAULT_NAME               # Key Vault navn (hvis brukt)
```

### 3.2 Modellkonfigurasjon 
```bash title="" linenums="0"
# Chatmodellkonfigurasjon
AZURE_AI_AGENT_MODEL_NAME         # Standard: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Standard: OpenAI (eller Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Standard: nyeste tilgjengelige
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Distribusjonsnavn for chatmodell
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Standard: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Standard: 80 (tusen TPM)

# Innebyggingsmodellkonfigurasjon
AZURE_AI_EMBED_MODEL_NAME         # Standard: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Standard: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Standard: nyeste tilgjengelige
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Distribusjonsnavn for innebygginger
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Standard: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Standard: 50 (tusen TPM)

# Agentkonfigurasjon
AZURE_AI_AGENT_NAME               # Agents visningsnavn
AZURE_EXISTING_AGENT_ID           # Bruk eksisterende agent (valgfritt)
```

### 3.3 Funksjonsbryter
```bash title="" linenums="0"
# Valgfrie tjenester
USE_APPLICATION_INSIGHTS         # Standard: sann
USE_AZURE_AI_SEARCH_SERVICE      # Standard: usann
USE_CONTAINER_REGISTRY           # Standard: sann

# Overvåking og sporing
ENABLE_AZURE_MONITOR_TRACING     # Standard: usann
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Standard: usann

# Søkekonfigurasjon
AZURE_AI_SEARCH_INDEX_NAME       # Navn på søkeindeks
AZURE_SEARCH_SERVICE_NAME        # Navn på søketjeneste
```

### 3.4 AI-prosjektkonfigurasjon 
```bash title="" linenums="0"
# Bruk eksisterende ressurser
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full ressurs-ID for eksisterende AI-prosjekt
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endepunkt-URL for eksisterende prosjekt
```

### 3.5 Sjekk variablene dine

Bruk Azure Developer CLI for å vise og administrere miljøvariablene dine:

```bash title="" linenums="0"
# Vis alle miljøvariabler for gjeldende miljø
azd env get-values

# Hent en spesifikk miljøvariabel
azd env get-value AZURE_ENV_NAME

# Sett en miljøvariabel
azd env set AZURE_LOCATION eastus

# Sett flere variabler fra en .env-fil
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på sitt morsmål skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->