# 4. Konfigurácia šablóny

!!! tip "NA KONCI TOHTO MODULU BUDETE SCHOPNÍ"

    - [ ] Pochopiť účel súboru `azure.yaml`
    - [ ] Pochopiť štruktúru súboru `azure.yaml`
    - [ ] Pochopiť hodnotu cyklu života azd `hooks`
    - [ ] **Laboratórium 4:** Preskúmať a upraviť premenné prostredia

---

!!! prompt "Čo robí súbor `azure.yaml`? Použite kódový blok a vysvetlite ho riadok po riadku"

      Súbor `azure.yaml` je **konfiguračný súbor pre Azure Developer CLI (azd)**. Definuje, ako by mala byť vaša aplikácia nasadená do Azure, vrátane infraštruktúry, služieb, spúšťačov nasadenia (hooks) a premenných prostredia.

---

## 1. Účel a funkčnosť

Tento súbor `azure.yaml` slúži ako **plán nasadenia** pre aplikáciu AI agenta, ktorá:

1. **Overuje prostredie** pred nasadením
2. **Zriaďuje Azure AI služby** (AI Hub, AI Project, Search, atď.)
3. **Nasadí Python aplikáciu** do Azure Container Apps
4. **Konfiguruje AI modely** pre chat aj embedding funkčnosť
5. **Nastavuje monitorovanie a trasovanie** pre AI aplikáciu
6. **Rieši scenáre pre nové aj existujúce** Azure AI projekty

Súbor umožňuje **nasadenie jedným príkazom** (`azd up`) kompletnej AI agent riešenia s riadnou validáciou, provisioningom a post-nasadzovacou konfiguráciou.

??? info "Rozbaliť na zobrazenie: `azure.yaml`"

      Súbor `azure.yaml` definuje, ako by mal Azure Developer CLI nasadiť a spravovať túto AI Agent aplikáciu v Azure. Poďme si ho rozobrať riadok po riadku.

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

## 2. Rozobratie súboru

Prejdime súbor sekciu po sekcii, aby sme pochopili, čo robí - a prečo.

### 2.1 **Hlavička a schéma (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Riadok 1**: Poskytuje schému pre yaml-language-server na validáciu v IDE a IntelliSense

### 2.2 Projektové metadáta (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Riadok 5**: Definuje názov projektu používaný Azure Developer CLI
- **Riadky 6-7**: Určuje, že ide o šablónu verzie 1.0.2
- **Riadky 8-9**: Vyžaduje Azure Developer CLI verziu 1.14.0 alebo vyššiu

### 2.3 Deploy Hooks (11-40)

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

- **Riadky 11-20**: **Pre-deployment hook** - spúšťa sa pred `azd up`

      - Na Unix/Linux: Spraví validačný skript spustiteľným a spustí ho
      - Na Windows: Spustí PowerShell validačný skript
      - Obe sú interaktívne a nasadenie zastavia, ak zlyhajú

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
- **Riadky 21-30**: **Post-provision hook** - spúšťa sa po vytvorení zdrojov Azure

  - Spúšťa skripty zapisujúce premenné prostredia
  - Nasadenie pokračuje aj keď tieto skripty zlyhajú (`continueOnError: true`)

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
- **Riadky 31-40**: **Post-deploy hook** - spúšťa sa po nasadení aplikácie

  - Spúšťa záverečné nastavovacie skripty
  - Pokračuje aj keď skripty zlyhajú

### 2.4 Konfigurácia služby (41-48)

Týmto sa konfiguruje aplikačná služba, ktorú nasadzujete.

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

- **Riadok 42**: Definuje službu s názvom "api_and_frontend"
- **Riadok 43**: Ukazuje na adresár `./src` so zdrojovým kódom
- **Riadok 44**: Špecifikuje Python ako programovací jazyk
- **Riadok 45**: Používa Azure Container Apps ako hostiteľskú platformu
- **Riadky 46-48**: Docker konfigurácia

      - Používa "api_and_frontend" ako názov image
      - Docker image sa stavia vzdialene v Azure (nie lokálne)

### 2.5 Premenné pipeline (49-76)

Ide o premenné, ktoré vám pomáhajú spúšťať `azd` v CI/CD pipeline pre automatizáciu

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

Táto sekcia definuje premenné prostredia používané **počas nasadenia**, usporiadané podľa kategórií:

- **Názvy Azure zdrojov (Riadky 51-60)**:
      - Hlavné názvy Azure služieb, napr. Resource Group, AI Hub, AI Project atď.- 
- **Prepínače funkcií (Riadky 61-63)**:
      - Boolean premenné na zapnutie/vypnutie konkrétnych Azure služieb
- **Konfigurácia AI agenta (Riadky 64-71)**:
      - Konfigurácia hlavného AI agenta vrátane názvu, ID, nastavení nasadenia a detailov modelu- 
- **Konfigurácia AI embeddingu (Riadky 72-79)**:
      - Konfigurácia modelu pre embedding používaného na vektorové vyhľadávanie
- **Vyhľadávanie a monitorovanie (Riadky 80-84)**:
      - Názov indexu pre vyhľadávanie, ID existujúcich zdrojov a nastavenia monitorovania/trasovania

---

## 3. Premenné prostredia
Nasledujúce premenné prostredia riadia konfiguráciu a správanie vášho nasadenia, zoradené podľa ich hlavného účelu. Väčšina premenných má rozumné predvolené hodnoty, ale môžete ich prispôsobiť tak, aby zodpovedali vašim špecifickým požiadavkám alebo existujúcim Azure zdrojom.

### 3.1 Povinné premenné 

```bash title="" linenums="0"
# Základná konfigurácia Azure
AZURE_ENV_NAME                    # Názov prostredia (používa sa pri pomenovávaní prostriedkov)
AZURE_LOCATION                    # Región nasadenia
AZURE_SUBSCRIPTION_ID             # Cieľové predplatné
AZURE_RESOURCE_GROUP              # Názov skupiny prostriedkov
AZURE_PRINCIPAL_ID                # Používateľský princíp pre RBAC

# Názvy prostriedkov (automaticky generované, ak nie sú špecifikované)
AZURE_AIHUB_NAME                  # Názov hubu Microsoft Foundry
AZURE_AIPROJECT_NAME              # Názov AI projektu
AZURE_AISERVICES_NAME             # Názov účtu služieb AI
AZURE_STORAGE_ACCOUNT_NAME        # Názov úložného účtu
AZURE_CONTAINER_REGISTRY_NAME     # Názov registra kontajnerov
AZURE_KEYVAULT_NAME               # Názov Key Vaultu (ak sa používa)
```

### 3.2 Konfigurácia modelu 
```bash title="" linenums="0"
# Konfigurácia modelu chatu
AZURE_AI_AGENT_MODEL_NAME         # Predvolené: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Predvolené: OpenAI (alebo Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Predvolené: najnovšie dostupné
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Názov nasadenia pre model chatu
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Predvolené: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Predvolené: 80 (tisícov TPM)

# Konfigurácia modelu embeddingov
AZURE_AI_EMBED_MODEL_NAME         # Predvolené: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Predvolené: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Predvolené: najnovšie dostupné
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Názov nasadenia pre embeddingy
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Predvolené: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Predvolené: 50 (tisícov TPM)

# Konfigurácia agenta
AZURE_AI_AGENT_NAME               # Zobrazovaný názov agenta
AZURE_EXISTING_AGENT_ID           # Použiť existujúceho agenta (voliteľné)
```

### 3.3 Prepínače funkcií
```bash title="" linenums="0"
# Voliteľné služby
USE_APPLICATION_INSIGHTS         # Predvolené: true
USE_AZURE_AI_SEARCH_SERVICE      # Predvolené: false
USE_CONTAINER_REGISTRY           # Predvolené: true

# Monitorovanie a trasovanie
ENABLE_AZURE_MONITOR_TRACING     # Predvolené: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Predvolené: false

# Konfigurácia vyhľadávania
AZURE_AI_SEARCH_INDEX_NAME       # Názov vyhľadávacieho indexu
AZURE_SEARCH_SERVICE_NAME        # Názov vyhľadávacej služby
```

### 3.4 Konfigurácia AI projektu 
```bash title="" linenums="0"
# Použiť existujúce zdroje
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Plné ID zdroja existujúceho AI projektu
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL koncového bodu existujúceho projektu
```

### 3.5 Skontrolujte svoje premenné

Použite Azure Developer CLI na zobrazenie a správu premenných prostredia:

```bash title="" linenums="0"
# Zobraziť všetky premenné prostredia pre aktuálne prostredie
azd env get-values

# Získať konkrétnu premennú prostredia
azd env get-value AZURE_ENV_NAME

# Nastaviť premennú prostredia
azd env set AZURE_LOCATION eastus

# Nastaviť viacero premenných zo súboru .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:
Tento dokument bol preložený prostredníctvom AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa usilujeme o presnosť, vezmite, prosím, na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku by sa mal považovať za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->