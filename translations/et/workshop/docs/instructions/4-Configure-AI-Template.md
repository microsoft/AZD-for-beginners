# 4. Konfigureeri mall

!!! tip "SELLE MULLUGA LÕPPSA SA SUUDA"

    - [ ] Mõista `azure.yaml` eesmärki
    - [ ] Mõista `azure.yaml` struktuuri
    - [ ] Mõista azd elutsükli `hookide` väärtust
    - [ ] **Lab 4:** Uurida ja muuta keskkonnamuutujaid

---

!!! prompt "Milleks `azure.yaml` fail on? Kasuta koodilõiku ja selgita seda ridade kaupa"

      `azure.yaml` fail on **Azure Developer CLI (azd) konfiguratsioonifail**. See määratleb, kuidas sinu rakendus tuleks Azure’i juures juurutada, sh infrastruktuuri, teenused, juurutamise hookid ja keskkonnamuutujad.

---

## 1. Eesmärk ja funktsionaalsus

See `azure.yaml` fail on **juurutamise plaan** AI-agendi rakendusele, mis:

1. **Kontrollib keskkonda** enne juurutamist
2. **Varustab Azure AI teenuseid** (AI Hub, AI Project, Search jt)
3. **Juurutab Python rakenduse** Azure Container Appsi
4. **Seadistab AI mudelid** nii vestluse kui ka manustamise funktsionaalsuseks
5. **Seadistab jälgimise ja traceerimise** AI rakendusele
6. **Halb nii uusi kui olemasolevaid** Azure AI projektide stsenaariume

Fail võimaldab **ühe käsklusega juurutamist** (`azd up`) täismahus AI agentide lahendusele koos korra kontrolli, varustamise ja järelseadistusega.

??? info "Laienda vaatamiseks: `azure.yaml`"

      `azure.yaml` fail määratleb, kuidas Azure Developer CLI peaks seda AI Agent rakendust Azure’is juurutama ja haldama. Vaatame selle rida-realt läbi.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: kas me vajame hooke? 
      # TODO: kas me vajame kõiki muutujaid?

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

## 2. Faili lahtimurdmine

Vaatame faili peatükkide kaupa, et mõista, mida see teeb - ja miks.

### 2.1 **Päis ja skeem (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Rida 1**: Pakub YAML-keele serveri skeemi valideerimist IDE toe ja IntelliSense jaoks

### 2.2 Projekti metaandmed (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Rida 5**: Määratleb projekti nime, mida kasutab Azure Developer CLI
- **Read 6-7**: Näitab, et põhineb malli versioonil 1.0.2
- **Read 8-9**: Nõuab Azure Developer CLI versiooni 1.14.0 või uuemat

### 2.3 Juurutamise hookid (11-40)

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

- **Read 11-20**: **Eeljuurutuse hook** – töötab enne `azd up`

      - Unix/Linuxil: teeb valideerimisskripti täidetavaks ja käivitab selle
      - Windowsil: käivitab PowerShell valideerimisskripti
      - Mõlemad on interaktiivsed ja katkestavad juurutamise, kui ebaõnnestuvad

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
- **Read 21-30**: **Pärast ressursside loomist hook** – töötab pärast Azure ressursside loomist

  - Käivitab keskkonnamuutujate kirjutamise skriptid
  - Jätkab juurutamist isegi kui need skriptid ebaõnnestuvad (`continueOnError: true`)

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
- **Read 31-40**: **Pärast juurutamist hook** – töötab pärast rakenduse juurutamist

  - Käivitab lõplikud seadistusskriptid
  - Jätkab ka skriptide ebaõnnestumisel

### 2.4 Teenuse konfiguratsioon (41-48)

See konfigureerib rakenduse teenuse, mida sa juurutad.

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

- **Rida 42**: Määratleb teenuse nimega "api_and_frontend"
- **Rida 43**: Näitab `./src` kausta lähtekoodi jaoks
- **Rida 44**: Määratleb programmeerimiskeeleks Python
- **Rida 45**: Kasutab hostimise platvormina Azure Container Appsi
- **Read 46-48**: Docker konfiguratsioon

      - Kasutab pildinime "api_and_frontend"
      - Ehitatakse Dockeri pilt Azure’is eemalt (mitte lokaalselt)

### 2.5 Pipelini muutujad (49-76)

Need on muutujad, mis aitavad sul käivitada `azd` CI/CD pipeline’is automaatseks tööks

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

See osa määratleb keskkonnamuutujad, mida kasutatakse **juurutamise ajal**, kategoriseeritult:

- **Azure ressursside nimed (Read 51-60)**:
      - Põhirakenduste nimed Azure teenuste jaoks (Resource Group, AI Hub, AI Project jne)
- **Funktsioonide lülitid (Read 61-63)**:
      - Boolean muutujad, mis lubavad või keelavad spetsiifilisi Azure teenuseid
- **AI agendi konfiguratsioon (Read 64-71)**:
      - Põhjalik konfiguratsioon AI agendi nime, ID, juurutamise ja mudelite kohta
- **AI manustamise konfiguratsioon (Read 72-79)**:
      - Manustamise mudeli seadistused vektorotsingu jaoks
- **Otsingu ja jälgimise seaded (Read 80-84)**:
      - Otsingu indeksi nimi, olemasolevad ressursi IDd ja jälgimise/traceerimise sätted

---

## 3. Tunned Keskkonnamuutujaid
Järgnevad keskkonnamuutujad kontrollivad sinu juurutuse konfiguratsiooni ja käitumist, korraldatuna nende põhiotstarbe järgi. Enamikul muutujatest on mõistlikud vaikeseaded, kuid saad neid kohandada vastavalt oma konkreetsetele nõuetele või olemasolevatele Azure ressurssidele.

### 3.1 Nõutavad muutujad

```bash title="" linenums="0"
# Azure'i põhikonfiguratsioon
AZURE_ENV_NAME                    # Keskkonna nimi (kasutatakse ressursside nimetamisel)
AZURE_LOCATION                    # Paigalduspiirkond
AZURE_SUBSCRIPTION_ID             # Sihttellimus
AZURE_RESOURCE_GROUP              # Ressursigrupi nimi
AZURE_PRINCIPAL_ID                # Kasutaja põhiülem RBAC jaoks

# Ressursside nimed (automaatne genereerimine, kui pole määratud)
AZURE_AIHUB_NAME                  # Microsoft Foundry keskuse nimi
AZURE_AIPROJECT_NAME              # AI projekti nimi
AZURE_AISERVICES_NAME             # AI teenuste konto nimi
AZURE_STORAGE_ACCOUNT_NAME        # Salvestuskonto nimi
AZURE_CONTAINER_REGISTRY_NAME     # Konteinerite registri nimi
AZURE_KEYVAULT_NAME               # Key Vault nimi (kui kasutatakse)
```
  
### 3.2 Mudeli konfiguratsioon

```bash title="" linenums="0"
# Vestlusmudeli konfiguratsioon
AZURE_AI_AGENT_MODEL_NAME         # Vaikimisi: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Vaikimisi: OpenAI (või Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Vaikimisi: uusim saadaval
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Vestlusmudeli juurutamise nimi
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Vaikimisi: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Vaikimisi: 80 (tuhandet TPM-i)

# Manustamismudeli konfiguratsioon
AZURE_AI_EMBED_MODEL_NAME         # Vaikimisi: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Vaikimisi: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Vaikimisi: uusim saadaval
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Manustamise juurutamise nimi
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Vaikimisi: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Vaikimisi: 50 (tuhandet TPM-i)

# Agendi konfiguratsioon
AZURE_AI_AGENT_NAME               # Agendi kuvatav nimi
AZURE_EXISTING_AGENT_ID           # Kasuta olemasolevat agenti (valikuline)
```
  
### 3.3 Funktsioonide lüliti

```bash title="" linenums="0"
# Valikulised teenused
USE_APPLICATION_INSIGHTS         # Vaikimisi: tõene
USE_AZURE_AI_SEARCH_SERVICE      # Vaikimisi: väär
USE_CONTAINER_REGISTRY           # Vaikimisi: tõene

# Jälgimine ja jälitus
ENABLE_AZURE_MONITOR_TRACING     # Vaikimisi: väär
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Vaikimisi: väär

# Otsingu konfiguratsioon
AZURE_AI_SEARCH_INDEX_NAME       # Otsingu indeksi nimi
AZURE_SEARCH_SERVICE_NAME        # Otsingu teenuse nimi
```
  
### 3.4 AI projekti konfiguratsioon

```bash title="" linenums="0"
# Kasuta olemasolevaid ressursse
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Olemasoleva AI projekti täielik ressursi ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Olemasoleva projekti lõpp-punkti URL
```
  
### 3.5 Kontrolli oma muutujaid

Kasutage Azure Developer CLI, et vaadata ja hallata oma keskkonnamuutujaid:

```bash title="" linenums="0"
# Vaata kõiki keskkonnamuutujaid praeguses keskkonnas
azd env get-values

# Hangi konkreetne keskkonnamuutuja
azd env get-value AZURE_ENV_NAME

# Sea keskkonnamuutuja
azd env set AZURE_LOCATION eastus

# Sea mitu muutujat .env failist
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades tehisintellektil põhinevat tõlke teenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi püüame täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle emakeeles tuleb pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tingitud arusaamatuste ega valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->