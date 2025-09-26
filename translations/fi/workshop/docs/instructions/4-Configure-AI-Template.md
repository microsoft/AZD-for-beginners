<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-24T22:51:32+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "fi"
}
-->
# 4. Määritä mallipohja

!!! tip "TÄMÄN OSION LOPUSSA OSAAAT"

    - [ ] Ymmärtää `azure.yaml`-tiedoston tarkoituksen
    - [ ] Ymmärtää `azure.yaml`-tiedoston rakenteen
    - [ ] Ymmärtää azd:n elinkaaren `hooks`-arvon
    - [ ] **Lab 3:** 

---

!!! prompt "Mitä `azure.yaml`-tiedosto tekee? Käytä koodilohkoa ja selitä rivi riviltä"

      `azure.yaml`-tiedosto on **Azure Developer CLI:n (azd) konfiguraatiotiedosto**. Se määrittää, miten sovellus tulisi ottaa käyttöön Azureen, mukaan lukien infrastruktuuri, palvelut, käyttöönottohookit ja ympäristömuuttujat.

---

## 1. Tarkoitus ja toiminnallisuus

Tämä `azure.yaml`-tiedosto toimii **käyttöönoton suunnitelmana** AI-agenttisovellukselle, joka:

1. **Varmistaa ympäristön** ennen käyttöönottoa
2. **Provisionoi Azure AI -palvelut** (AI Hub, AI Project, Search jne.)
3. **Ottaa Python-sovelluksen käyttöön** Azure Container Appsissa
4. **Konfiguroi AI-mallit** sekä chat- että upotustoiminnallisuuksia varten
5. **Asettaa valvonnan ja jäljityksen** AI-sovellukselle
6. **Käsittelee sekä uusia että olemassa olevia** Azure AI -projektiskenaarioita

Tiedosto mahdollistaa **yhdellä komennolla tapahtuvan käyttöönoton** (`azd up`) täydelliselle AI-agenttiratkaisulle, sisältäen validoinnin, provisionoinnin ja käyttöönoton jälkeisen konfiguraation.

??? info "Laajenna nähdäksesi: `azure.yaml`"

      `azure.yaml`-tiedosto määrittää, miten Azure Developer CLI:n tulisi ottaa käyttöön ja hallita tätä AI-agenttisovellusta Azuren ympäristössä. Käydään tiedosto läpi rivi riviltä.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: tarvitsemmeko hookeja? 
      # TODO: tarvitsemmeko kaikki muuttujat?

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

## 2. Tiedoston purkaminen

Käydään tiedosto läpi osio kerrallaan, jotta ymmärrämme sen tarkoituksen ja toiminnallisuuden.

### 2.1 **Otsikko ja skeema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Rivi 1**: Tarjoaa YAML-kielipalvelimen skeemavalidoinnin IDE-tukea ja IntelliSenseä varten

### 2.2 Projektin metadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Rivi 5**: Määrittää projektin nimen, jota Azure Developer CLI käyttää
- **Rivit 6-7**: Ilmoittaa, että tämä perustuu malliversioon 1.0.2
- **Rivit 8-9**: Vaatii Azure Developer CLI:n version 1.14.0 tai uudemman

### 2.3 Käyttöönottohookit (11-40)

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

- **Rivit 11-20**: **Ennen käyttöönottoa** -hook, joka suoritetaan ennen `azd up`-komentoa

      - Unix/Linux: Tekee validointiskriptistä suoritettavan ja ajaa sen
      - Windows: Ajaa PowerShell-validointiskriptin
      - Molemmat ovat interaktiivisia ja pysäyttävät käyttöönoton, jos ne epäonnistuvat

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
- **Rivit 21-30**: **Käyttöönoton jälkeinen hook** - suoritetaan Azuren resurssien luomisen jälkeen

  - Suorittaa ympäristömuuttujien kirjoitusskriptit
  - Jatkaa käyttöönottoa, vaikka nämä skriptit epäonnistuisivat (`continueOnError: true`)

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
- **Rivit 31-40**: **Käyttöönoton jälkeinen hook** - suoritetaan sovelluksen käyttöönoton jälkeen

  - Suorittaa lopulliset asennusskriptit
  - Jatkaa, vaikka skriptit epäonnistuisivat

### 2.4 Palvelun konfiguraatio (41-48)

Tämä määrittää sovelluspalvelun, jonka otat käyttöön.

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

- **Rivi 42**: Määrittää palvelun nimeltä "api_and_frontend"
- **Rivi 43**: Viittaa `./src`-hakemistoon lähdekoodia varten
- **Rivi 44**: Määrittää Pythonin ohjelmointikieleksi
- **Rivi 45**: Käyttää Azure Container Appsia isännöintialustana
- **Rivit 46-48**: Docker-konfiguraatio

      - Käyttää "api_and_frontend"-nimeä kuvalle
      - Rakentaa Docker-kuvan etänä Azuren ympäristössä (ei paikallisesti)

### 2.5 Putkimuuttujat (49-76)

Nämä ovat muuttujia, jotka auttavat sinua käyttämään `azd`-komentoa CI/CD-putkissa automaatiota varten.

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

Tämä osio määrittää ympäristömuuttujat, joita käytetään **käyttöönoton aikana**, jaoteltuna kategorioittain:

- **Azuren resurssien nimet (Rivit 51-60)**:
      - Keskeiset Azuren palveluresurssien nimet, kuten Resource Group, AI Hub, AI Project jne.
- **Ominaisuuksien valitsimet (Rivit 61-63)**:
      - Boolean-muuttujat, joilla voi ottaa käyttöön tai poistaa käytöstä tiettyjä Azure-palveluita
- **AI-agentin konfiguraatio (Rivit 64-71)**:
      - Pääagentin konfiguraatio, mukaan lukien nimi, ID, käyttöönottoasetukset ja mallin tiedot
- **AI-upotuksen konfiguraatio (Rivit 72-79)**:
      - Upotusmallin konfiguraatio, jota käytetään vektorihakuun
- **Haku ja valvonta (Rivit 80-84)**:
      - Hakemiston nimi, olemassa olevien resurssien ID:t ja valvonta/jäljityksen asetukset

---

## 3. Ymmärrä ympäristömuuttujat
Seuraavat ympäristömuuttujat ohjaavat käyttöönoton konfiguraatiota ja toimintaa, jaoteltuna niiden ensisijaisen tarkoituksen mukaan. Useimmilla muuttujilla on järkevät oletusarvot, mutta voit mukauttaa niitä vastaamaan omia vaatimuksiasi tai olemassa olevia Azure-resursseja.

### 3.1 Pakolliset muuttujat 

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

### 3.2 Mallin konfiguraatio 
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

### 3.3 Ominaisuuksien valitsimet
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

### 3.4 AI-projektin konfiguraatio 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Tarkista muuttujasi

Käytä Azure Developer CLI:tä ympäristömuuttujien tarkasteluun ja hallintaan:

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

