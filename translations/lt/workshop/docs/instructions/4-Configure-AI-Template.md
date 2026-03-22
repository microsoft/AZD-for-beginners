# 4. Konfigūruokite šabloną

!!! tip "ŠIO MODULIO PABAIGOJE JŪS GALĖSITE"

    - [ ] Suprasti `azure.yaml` paskirtį
    - [ ] Suprasti `azure.yaml` struktūrą
    - [ ] Suprasti azd gyvavimo ciklo `hooks` naudą
    - [ ] **Laboratorija 4:** Ištirti ir keisti aplinkos kintamuosius

---

!!! prompt "Ką daro `azure.yaml` failas? Naudokite kodo bloką ir paaiškinkite tai eilutė po eilutės"

      Failas `azure.yaml` yra **konfigūracijos failas Azure Developer CLI (azd)**. Jame apibrėžiama, kaip jūsų programa turėtų būti diegiama į Azure, įskaitant infrastruktūrą, paslaugas, diegimo hook'us ir aplinkos kintamuosius.

---

## 1. Paskirtis ir funkcionalumas

Šis `azure.yaml` failas tarnauja kaip **diegimo planas** AI agento programai, kuri:

1. **Patikrina aplinką** prieš diegimą
2. **Sukuria Azure AI paslaugas** (AI Hub, AI Project, Search ir kt.)
3. **Diegia Python programą** į Azure Container Apps
4. **Konfigūruoja AI modelius** tiek pokalbiui, tiek įterpimo (embedding) funkcijoms
5. **Nustato stebėjimą ir sekimą (tracing)** AI programai
6. **Tvarko tiek naujas, tiek esamas** Azure AI projekto scenarijas

Failas leidžia **vienu komandos vykdymu** (`azd up`) įdiegti pilną AI agento sprendimą su tinkama patikra, išteklių priskyrimu ir po diegimo vykdomomis konfigūracijomis.

??? info "Išplėsti peržiūrai: `azure.yaml`"

      Failas `azure.yaml` aprašo, kaip Azure Developer CLI turėtų diegti ir valdyti šią AI agento programą Azure. Išskaidykime jį eilutė po eilutės.

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

## 2. Failo išskaidymas

Eime per failą skyriumi po skyriaus, kad suprastume, ką jis daro - ir kodėl.

### 2.1 **Antraštė ir schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **1 eilutė**: Suteikia YAML kalbos serverio schemos patikrinimą IDE palaikymui ir IntelliSense

### 2.2 Projekto metaduomenys (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **5 eilutė**: Nustato projekto pavadinimą, kurį naudoja Azure Developer CLI
- **6–7 eilutės**: Nurodo, kad tai pagrįsta šablonu versijos 1.0.2
- **8–9 eilutės**: Reikalauja Azure Developer CLI versijos 1.14.0 arba naujesnės

### 2.3 Diegimo hooks (11-40)

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

- **11–20 eilutės**: **Išankstinis diegimo hook'as** - vykdomas prieš `azd up`

      - Unix/Linux: padaro patikros skriptą vykdomu ir jį paleidžia
      - Windows: paleidžia PowerShell patikros skriptą
      - Abu yra interaktyvūs ir sustabdys diegimą, jei jie nepavyks

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
- **21–30 eilutės**: **Post-provision hook** - vykdomas po to, kai sukuriami Azure ištekliai

  - Vykdo aplinkos kintamųjų rašymo skriptus
  - Tęsia diegimą net jei šie skriptai nepavyksta (`continueOnError: true`)

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
- **31–40 eilutės**: **Post-deploy hook** - vykdomas po programos diegimo

  - Vykdo galutinius nustatymų skriptus
  - Tęsia net jei skriptai nepavyksta

### 2.4 Paslaugos konfigūracija (41-48)

Tai konfigūruoja programos paslaugą, kurią diegiate.

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

- **42 eilutė**: Apibrėžia paslaugą pavadinimu "api_and_frontend"
- **43 eilutė**: Nurodo `./src` katalogą šaltinio kodui
- **44 eilutė**: Nurodo Python kaip programavimo kalbą
- **45 eilutė**: Naudoja Azure Container Apps kaip talpinimo platformą
- **46–48 eilutės**: Docker konfigūracija

      - Naudoja "api_and_frontend" kaip image pavadinimą
      - Kuria Docker atvaizdą nuotoliniu būdu Azure (ne vietoje)

### 2.5 Tiesimo (pipeline) kintamieji (49-76)

Tai kintamieji, padedantys jums vykdyti `azd` CI/CD procesuose automatizavimui

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

Ši skiltis apibrėžia aplinkos kintamuosius, naudojamus **diegiant**, suskirstytus pagal kategorijas:

- **Azure išteklių pavadinimai (51–60 eilutės)**:
      - Pagrindinių Azure paslaugų išteklių pavadinimai, pvz., Resource Group, AI Hub, AI Project ir kt.- 
- **Funkcijų jungikliai (61–63 eilutės)**:
      - Boolean reikšmės, skirtos įjungti / išjungti konkrečias Azure paslaugas
- **AI agentei skirta konfigūracija (64–71 eilutės)**:
      - Pagrindinio AI agento konfigūracija, įskaitant pavadinimą, ID, diegimo nustatymus, modelio detales- 
- **AI embedding konfigūracija (72–79 eilutės)**:
      - Konfigūracija embedinimo modeliui, naudojamam vektorinėms paieškoms
- **Paieška ir stebėsena (80–84 eilutės)**:
      - Paieškos indekso pavadinimas, esami išteklių ID ir stebėjimo / sekimo nustatymai

---

## 3. Pažinkite aplinkos kintamuosius
Toliau pateikti aplinkos kintamieji kontroliuoja jūsų diegimo konfigūraciją ir elgseną, suskirstyti pagal pagrindinį paskirtį. Dauguma kintamųjų turi prasmingas numatytąsias reikšmes, bet galite jas pritaikyti pagal savo konkrečius reikalavimus arba esamus Azure išteklius.

### 3.1 Privalomi kintamieji 

```bash title="" linenums="0"
# Pagrindinė Azure konfigūracija
AZURE_ENV_NAME                    # Aplinkos pavadinimas (naudojamas išteklių pavadinimams)
AZURE_LOCATION                    # Diegimo regionas
AZURE_SUBSCRIPTION_ID             # Tikslinė prenumerata
AZURE_RESOURCE_GROUP              # Išteklų grupės pavadinimas
AZURE_PRINCIPAL_ID                # Vartotojo principalas RBAC

# Išteklų pavadinimai (automatiškai sugeneruojami, jei nenurodyta)
AZURE_AIHUB_NAME                  # Microsoft Foundry hub pavadinimas
AZURE_AIPROJECT_NAME              # DI projekto pavadinimas
AZURE_AISERVICES_NAME             # DI paslaugų paskyros pavadinimas
AZURE_STORAGE_ACCOUNT_NAME        # Saugojimo paskyros pavadinimas
AZURE_CONTAINER_REGISTRY_NAME     # Konteinerių registro pavadinimas
AZURE_KEYVAULT_NAME               # Raktų saugyklos pavadinimas (jei naudojama)
```

### 3.2 Modelio konfigūracija 
```bash title="" linenums="0"
# Pokalbio modelio konfigūracija
AZURE_AI_AGENT_MODEL_NAME         # Numatytoji: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Numatytoji: OpenAI (arba Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Numatytoji: naujausia prieinama
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Diegimo pavadinimas pokalbio modeliui
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Numatytoji: Standartinis
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Numatytoji: 80 (tūkstančiai TPM)

# Įterpimo modelio konfigūracija
AZURE_AI_EMBED_MODEL_NAME         # Numatytoji: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Numatytoji: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Numatytoji: naujausia prieinama
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Diegimo pavadinimas įterpimams
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Numatytoji: Standartinis
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Numatytoji: 50 (tūkstančiai TPM)

# Agento konfigūracija
AZURE_AI_AGENT_NAME               # Agento rodomas pavadinimas
AZURE_EXISTING_AGENT_ID           # Naudoti esamą agentą (pasirinktinai)
```

### 3.3 Funkcijų perjungikliai
```bash title="" linenums="0"
# Pasirenkamos paslaugos
USE_APPLICATION_INSIGHTS         # Numatytoji: true
USE_AZURE_AI_SEARCH_SERVICE      # Numatytoji: false
USE_CONTAINER_REGISTRY           # Numatytoji: true

# Stebėjimas ir sekimas
ENABLE_AZURE_MONITOR_TRACING     # Numatytoji: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Numatytoji: false

# Paieškos konfigūracija
AZURE_AI_SEARCH_INDEX_NAME       # Paieškos indekso pavadinimas
AZURE_SEARCH_SERVICE_NAME        # Paieškos paslaugos pavadinimas
```

### 3.4 AI projekto konfigūracija 
```bash title="" linenums="0"
# Naudoti esamus išteklius
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Pilnas esamo DI projekto resurso ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Esamo projekto galinio taško URL
```

### 3.5 Patikrinkite savo kintamuosius

Naudokite Azure Developer CLI, kad peržiūrėtumėte ir valdytumėte savo aplinkos kintamuosius:

```bash title="" linenums="0"
# Peržiūrėti visus dabartinės aplinkos kintamuosius
azd env get-values

# Gauti konkretų aplinkos kintamąjį
azd env get-value AZURE_ENV_NAME

# Nustatyti aplinkos kintamąjį
azd env set AZURE_LOCATION eastus

# Nustatyti kelis kintamuosius iš .env failo
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**: Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojamas profesionalaus vertėjo atliktas vertimas. Mes neatsakome už bet kokius nesusipratimus ar neteisingus aiškinimus, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->