# 4. Malle seadistamine

!!! tip "SELLE MALLI LÕPUS OLETE VÕIMALIK"

    - [ ] Mõista faili `azure.yaml` eesmärki
    - [ ] Mõista faili `azure.yaml` struktuuri
    - [ ] Mõista azd elutsükli `hooks` väärtust
    - [ ] **Labor 4:** Uuri ja muuda keskkonnamuutujaid

---

!!! prompt "Milleks fail `azure.yaml` on? Kasuta koodiblokki ja selgita rida-realt"

      Fail `azure.yaml` on **Azure Developer CLI (azd) konfiguratsioonifail**. See määrab, kuidas teie rakendus peaks Azure'i juurutatama, sh infrastruktuur, teenused, juurutusharud ja keskkonnamuutujad.

---

## 1. Eesmärk ja funktsionaalsus

See `azure.yaml` fail toimib kui **juurutamise plaan** AI agent rakendusele, mis:

1. **Kontrollib keskkonda** enne juurutamist
2. **Hankib Azure AI teenuseid** (AI Hub, AI Project, Search jms)
3. **Juurutab Python rakenduse** Azure Container Apps'i
4. **Seadistab AI mudelid** nii vestluseks kui ka manustamiseks
5. **Seab üles jälgimise ja jälitamist** AI rakendusele
6. **Toetab nii uusi kui ka olemasolevaid** Azure AI projekti stsenaariume

Fail lubab **ühte käsureal käivitatavat juurutust** (`azd up`), mis katab kogu AI agendi lahenduse koos korrektsuse kontrolli, teenuste hankimise ja järelkonfiguratsiooniga.

??? info "Laienda, et vaadata: `azure.yaml`"

      Fail `azure.yaml` määratleb, kuidas Azure Developer CLI peaks seda AI Agendi rakendust Azure'is juurutama ja haldama. Vaatame seda rea kaupa.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: kas meil on vaja hooks'e? 
      # TODO: kas meil on vaja kõiki muutujaid?

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

## 2. Faili lahtipakkimine

Vaatame faili jaotise kaupa, et mõista, mida see teeb - ja miks.

### 2.1 **Päis ja skeem (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Rida 1**: Pakub YAML keele serveri skeemi valideerimist IDE-tugi ja IntelliSense jaoks

### 2.2 Projekti metaandmed (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Rida 5**: Määrab projekti nime, mida kasutab Azure Developer CLI
- **Ridadel 6-7**: Märgib, et see põhineb malliversioonil 1.0.2
- **Ridadel 8-9**: Nõuab Azure Developer CLI versiooni 1.14.0 või uuemat

### 2.3 Juurutusharud (11-40)

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

- **Ridadel 11-20**: **Eeljuurutuse haru** - käivitatakse enne `azd up`

      - Unix/Linuxil: teeb valideerimisskripti täidetavaks ja käivitab selle
      - Windowsil: käivitab PowerShelli valideerimisskripti
      - Mõlemad on interaktiivsed ja peatavad juurutuse, kui ebaõnnestuvad

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
- **Ridadel 21-30**: **Pärast ressursside loomist käivitatav haru**

  - Käivitab keskkonnamuutujate kirjutamise skripte
  - Jätkab juurutamist ka siis, kui need skriptid ebaõnnestuvad (`continueOnError: true`)

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
- **Ridadel 31-40**: **Pärast rakenduse juurutamist käivitatav haru**

  - Käivitab lõplikud seadistusskriptid
  - Jätkab isegi skriptide ebaõnnestumisel

### 2.4 Teenuse konfiguratsioon (41-48)

See seadistab rakenduse teenuse, mida te juurutate.

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
- **Rida 43**: Osutab lähtekoodikaustale `./src`
- **Rida 44**: Märgib programmeerimiskeeleks Python
- **Rida 45**: Kasutab majutuseks Azure Container Apps'i
- **Ridadel 46-48**: Docker konfiguratsioon

      - Kasutab pildinavana "api_and_frontend"
      - Koostab Docker pildi kaugelt Azure'is (mitte kohapeal)

### 2.5 Pöörde muutujad (49-76)

Need muutujad aitavad käivitada `azd` CI/CD torujuhtme automaatseks juurutamiseks

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

See jaotis defineerib keskkonnamuutujad, mida kasutatakse **juurutamise ajal**, kategooriate kaupa:

- **Azure ressursside nimed (ridadel 51-60)**:
      - Tuumteenuste nimed nagu Resource Group, AI Hub, AI Project jne-
- **Funktsioonilipud (ridadel 61-63)**:
      - Boolsed muutujad, mis lubavad või keelavad konkreetseid Azure teenuseid
- **AI Agendi seadistus (ridadel 64-71)**:
      - Peamise AI agendi konfiguratsioon, sh nimi, ID, juurutuse seaded, mudelid-
- **AI Manseti seadistus (ridadel 72-79)**:
      - Manseti mudeli konfiguratsioon vektorotsingu jaoks
- **Otsingu ja jälgimise seadistused (ridadel 80-84)**:
      - Otsingu indeksi nimi, olemasolevad ressursside ID-d ja jälgimise seaded

---

## 3. Tunneta keskkonnamuutujaid
Järgmised keskkonnamuutujad kontrollivad teie juurutuse seadistust ja käitumist, rühmitatuna nende põhieelduse järgi. Enamikul muutujatel on mõistlikud vaikimisi väärtused, kuid saate neid kohandada vastavalt oma konkreetsetele nõuetele või olemasolevatele Azure ressurssidele.

### 3.1 Nõutavad muutujad 

```bash title="" linenums="0"
# Põhiline Azure konfiguratsioon
AZURE_ENV_NAME                    # Keskkonna nimi (kasutatakse ressursside nimetamisel)
AZURE_LOCATION                    # Kasutuspiirkond
AZURE_SUBSCRIPTION_ID             # Siht-tellimus
AZURE_RESOURCE_GROUP              # Ressursigrupi nimi
AZURE_PRINCIPAL_ID                # Kasutaja põhiõigus RBAC jaoks

# Ressursside nimed (genereeritakse automaatselt, kui pole määratud)
AZURE_AIHUB_NAME                  # Microsoft Foundry keskuse nimi
AZURE_AIPROJECT_NAME              # AI projekti nimi
AZURE_AISERVICES_NAME             # AI teenuste konto nimi
AZURE_STORAGE_ACCOUNT_NAME        # Salvestuskonto nimi
AZURE_CONTAINER_REGISTRY_NAME     # Konteinerite registri nimi
AZURE_KEYVAULT_NAME               # Võtmehoidla nimi (kui kasutatakse)
```

### 3.2 Mudeli konfiguratsioon 
```bash title="" linenums="0"
# Vestlusmudeli konfiguratsioon
AZURE_AI_AGENT_MODEL_NAME         # Vaikimisi: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Vaikimisi: OpenAI (või Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Vaikimisi: viimane saadaval olev
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Vestlusmudeli juurutamise nimi
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Vaikimisi: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Vaikimisi: 80 (tuhanded TPM)

# Sisestusmudeli konfiguratsioon
AZURE_AI_EMBED_MODEL_NAME         # Vaikimisi: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Vaikimisi: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Vaikimisi: viimane saadaval olev
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Sisestuste juurutamise nimi
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Vaikimisi: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Vaikimisi: 50 (tuhanded TPM)

# Agendi konfiguratsioon
AZURE_AI_AGENT_NAME               # Agendi kuvatav nimi
AZURE_EXISTING_AGENT_ID           # Kasuta olemasolevat agenti (valikuline)
```

### 3.3 Funktsioonilipp
```bash title="" linenums="0"
# Valikulised Teenused
USE_APPLICATION_INSIGHTS         # Vaikimisi: tõene
USE_AZURE_AI_SEARCH_SERVICE      # Vaikimisi: väär
USE_CONTAINER_REGISTRY           # Vaikimisi: tõene

# Jälgimine ja jälgimine
ENABLE_AZURE_MONITOR_TRACING     # Vaikimisi: väär
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Vaikimisi: väär

# Otsingu konfiguratsioon
AZURE_AI_SEARCH_INDEX_NAME       # Otsingu indeksi nimi
AZURE_SEARCH_SERVICE_NAME        # Otsinguteenuse nimi
```

### 3.4 AI projekti seadistus 
```bash title="" linenums="0"
# Kasutage olemasolevaid ressursse
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Olemasoleva AI projekti täielik ressursside ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Olemasoleva projekti lõpp-punkti URL
```

### 3.5 Kontrolli oma muutujaid

Kasutage Azure Developer CLI-d, et vaadata ja hallata oma keskkonnamuutujaid:

```bash title="" linenums="0"
# Vaata kõiki keskkonnamuutujaid praeguses keskkonnas
azd env get-values

# Hangi konkreetne keskkonnamuutuja
azd env get-value AZURE_ENV_NAME

# Määra keskkonnamuutuja
azd env set AZURE_LOCATION eastus

# Määra mitu muutujat .env failist
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtikirjutus**:
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame täpsust, tuleb arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument tema algkeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud arusaamatuste või valesti tõlgendamise eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->