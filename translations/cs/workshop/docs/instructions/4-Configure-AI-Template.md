# 4. Nakonfigurujte šablonu

!!! tip "NA KONCI TOHOTO MODULU BUDETE SCHOPNI"

    - [ ] Pochopit účel souboru `azure.yaml`
    - [ ] Pochopit strukturu souboru `azure.yaml`
    - [ ] Pochopit hodnotu životního cyklu azd `hooks`
    - [ ] **Lab 4:** Prozkoumat a upravit proměnné prostředí

---

!!! prompt "Co dělá soubor `azure.yaml`? Použijte blok kódu a vysvětlete jej řádek po řádku"

      Soubor `azure.yaml` je **konfigurační soubor pro Azure Developer CLI (azd)**. Definuje, jak by měla být vaše aplikace nasazena do Azure, včetně infrastruktury, služeb, spouštěčů nasazení a proměnných prostředí.

---

## 1. Účel a funkčnost

Tento soubor `azure.yaml` slouží jako **plán nasazení** pro aplikaci AI agenta, která:

1. **Ověřuje prostředí** před nasazením
2. **Zajistí Azure AI služby** (AI Hub, AI Project, Search atd.)
3. **Nasadí Python aplikaci** do Azure Container Apps
4. **Konfiguruje AI modely** pro chat i embedding funkčnost
5. **Nastaví monitorování a trasování** pro AI aplikaci
6. **Řeší jak nové, tak existující** scénáře Azure AI projektů

Soubor umožňuje **nasazení jedním příkazem** (`azd up`) kompletního řešení AI agenta s řádnou validací, provisioningem a post-deployment konfigurací.

??? info "Rozbalit pro zobrazení: `azure.yaml`"

      Soubor `azure.yaml` definuje, jak by měl Azure Developer CLI nasadit a spravovat tuto aplikaci AI agenta v Azure. Pojďme jej rozebrat řádek po řádku.

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

## 2. Rozebrání souboru

Pojďme projít soubor sekci po sekci, abychom pochopili, co dělá - a proč.

### 2.1 **Záhlaví a schéma (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: Poskytuje validaci schématu pro YAML language server pro podporu v IDE a IntelliSense

### 2.2 Metadata projektu (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Definuje název projektu používaný Azure Developer CLI
- **Lines 6-7**: Určuje, že je založeno na šabloně verze 1.0.2
- **Lines 8-9**: Vyžaduje verzi Azure Developer CLI 1.14.0 nebo vyšší

### 2.3 Nasazovací hooky (11-40)

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

- **Lines 11-20**: **Přednasazovací hook** - spouští se před `azd up`

      - Na Unix/Linux: Udělá validační skript spustitelným a spustí jej
      - Na Windows: Spustí PowerShell validační skript
      - Oba jsou interaktivní a nasazení zastaví, pokud selžou

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
- **Lines 21-30**: **Hook po zprovoznění** - spouští se po vytvoření zdrojů Azure

  - Spouští skripty zapisující proměnné prostředí
  - Nasazení pokračuje i když tyto skripty selžou (`continueOnError: true`)

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
- **Lines 31-40**: **Hook po nasazení** - spouští se po nasazení aplikace

  - Spouští finální instalační skripty
  - Pokračuje i když skripty selžou

### 2.4 Konfigurace služby (41-48)

Tato konfigurace definuje aplikaci, kterou nasazujete.

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

- **Line 42**: Definuje službu s názvem "api_and_frontend"
- **Line 43**: Ukazuje na adresář `./src` se zdrojovým kódem
- **Line 44**: Určuje Python jako programovací jazyk
- **Line 45**: Používá Azure Container Apps jako hostingovou platformu
- **Lines 46-48**: Docker konfigurace

      - Používá "api_and_frontend" jako název image
      - Sestavuje Docker image vzdáleně v Azure (ne lokálně)

### 2.5 Proměnné pipeline (49-76)

Jedná se o proměnné, které vám pomohou spouštět `azd` v CI/CD pipeline pro automatizaci

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

Tato sekce definuje proměnné prostředí používané **během nasazení**, uspořádané podle kategorií:

- **Názvy Azure zdrojů (Řádky 51-60)**:
      - Základní názvy Azure služeb, např. Resource Group, AI Hub, AI Project atd.
- **Přepínače funkcí (Řádky 61-63)**:
      - Booleovské proměnné pro povolení/zakázání konkrétních Azure služeb
- **Konfigurace AI agenta (Řádky 64-71)**:
      - Konfigurace hlavního AI agenta včetně názvu, ID, nastavení nasazení, detailů modelu
- **Konfigurace AI embeddingu (Řádky 72-79)**:
      - Konfigurace embedding modelu používaného pro vektorové vyhledávání
- **Vyhledávání a monitorování (Řádky 80-84)**:
      - Název indexu pro vyhledávání, existující ID zdrojů a nastavení monitorování/trasování

---

## 3. Poznejte proměnné prostředí
Následující proměnné prostředí řídí konfiguraci a chování vašeho nasazení, uspořádané podle jejich hlavního účelu. Většina proměnných má rozumné výchozí hodnoty, ale můžete je upravit tak, aby odpovídaly vašim konkrétním požadavkům nebo existujícím Azure zdrojům.

### 3.1 Požadované proměnné 

```bash title="" linenums="0"
# Základní konfigurace Azure
AZURE_ENV_NAME                    # Název prostředí (používá se při pojmenovávání prostředků)
AZURE_LOCATION                    # Region nasazení
AZURE_SUBSCRIPTION_ID             # Cílové předplatné
AZURE_RESOURCE_GROUP              # Název skupiny prostředků
AZURE_PRINCIPAL_ID                # Uživatelský principal pro RBAC

# Názvy prostředků (automaticky generovány, pokud nejsou zadány)
AZURE_AIHUB_NAME                  # Název hubu Microsoft Foundry
AZURE_AIPROJECT_NAME              # Název AI projektu
AZURE_AISERVICES_NAME             # Název účtu služeb AI
AZURE_STORAGE_ACCOUNT_NAME        # Název účtu úložiště
AZURE_CONTAINER_REGISTRY_NAME     # Název registru kontejnerů
AZURE_KEYVAULT_NAME               # Název Key Vaultu (pokud je použit)
```

### 3.2 Konfigurace modelu 
```bash title="" linenums="0"
# Konfigurace chatovacího modelu
AZURE_AI_AGENT_MODEL_NAME         # Výchozí: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Výchozí: OpenAI (nebo Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Výchozí: nejnovější dostupný
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Název nasazení pro chatovací model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Výchozí: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Výchozí: 80 (tisíce TPM)

# Konfigurace embedovacího modelu
AZURE_AI_EMBED_MODEL_NAME         # Výchozí: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Výchozí: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Výchozí: nejnovější dostupný
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Název nasazení pro embeddingy
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Výchozí: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Výchozí: 50 (tisíce TPM)

# Konfigurace agenta
AZURE_AI_AGENT_NAME               # Zobrazovaný název agenta
AZURE_EXISTING_AGENT_ID           # Použít existujícího agenta (volitelné)
```

### 3.3 Přepínače funkcí
```bash title="" linenums="0"
# Volitelné služby
USE_APPLICATION_INSIGHTS         # Výchozí: true
USE_AZURE_AI_SEARCH_SERVICE      # Výchozí: false
USE_CONTAINER_REGISTRY           # Výchozí: true

# Monitorování a trasování
ENABLE_AZURE_MONITOR_TRACING     # Výchozí: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Výchozí: false

# Konfigurace vyhledávání
AZURE_AI_SEARCH_INDEX_NAME       # Název vyhledávacího indexu
AZURE_SEARCH_SERVICE_NAME        # Název vyhledávací služby
```

### 3.4 Konfigurace AI projektu 
```bash title="" linenums="0"
# Použít existující zdroje
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Úplné ID zdroje existujícího AI projektu
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL koncového bodu existujícího projektu
```

### 3.5 Zkontrolujte své proměnné

Použijte Azure Developer CLI ke zobrazení a správě vašich proměnných prostředí:

```bash title="" linenums="0"
# Zobrazit všechny proměnné aktuálního prostředí
azd env get-values

# Získat konkrétní proměnnou prostředí
azd env get-value AZURE_ENV_NAME

# Nastavit proměnnou prostředí
azd env set AZURE_LOCATION eastus

# Nastavit více proměnných ze souboru .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí služby překladu založené na umělé inteligenci [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože se snažíme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za rozhodující zdroj. Pro důležité informace doporučujeme využít profesionální lidský překlad. Nejsme odpovědni za žádná nedorozumění nebo chybné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->