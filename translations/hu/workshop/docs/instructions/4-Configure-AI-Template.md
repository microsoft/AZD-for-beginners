# 4. Egy sablon beállítása

!!! tip "A MODUL VÉGÉRE KÉPES LESZ"

    - [ ] Megérteni az `azure.yaml` fájl célját
    - [ ] Megérteni az `azure.yaml` felépítését
    - [ ] Megérteni az azd életciklus `hook`-ok értékét
    - [ ] **4. Labor:** Környezeti változók felfedezése és módosítása

---

!!! prompt "Mit csinál az `azure.yaml` fájl? Használjon kódrészlet blokkot, és magyarázza el soronként"

      Az `azure.yaml` fájl az **Azure Developer CLI (azd)** konfigurációs fájlja. Meghatározza, hogy az alkalmazását hogyan kell telepíteni az Azure-ba, beleértve az infrastruktúrát, szolgáltatásokat, telepítési hook-okat és környezeti változókat.

---

## 1. Cél és Funkcionalitás

Ez az `azure.yaml` fájl az AI ügynök alkalmazás **telepítési tervét** szolgálja, amely:

1. **Ellenőrzi a környezetet** a telepítés előtt
2. **Létrehozza az Azure AI szolgáltatásokat** (AI Hub, AI Projekt, Keresés stb.)
3. **Telepít egy Python alkalmazást** az Azure Container Apps-be
4. **Beállítja az AI modelleket** mind chat, mind beágyazási funkciókra
5. **Konfigurálja a monitorozást és követést** az AI alkalmazáshoz
6. **Kezeli mind az új, mind a meglévő** Azure AI projekt forgatókönyveket

A fájl lehetővé teszi a **parancsos telepítést** (`azd up`) egy teljes AI ügynök megoldáshoz megfelelő validálással, létrehozással és telepítés utáni konfigurációval.

??? info "Bontsa ki megtekintésre: `azure.yaml`"

      Az `azure.yaml` fájl meghatározza, hogyan kezelje az Azure Developer CLI ezt az AI ügynök alkalmazást az Azure-ban. Nézzük meg soronként.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: szükségünk van hook-okhoz? 
      # TODO: szükségünk van az összes változóra?

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

## 2. A fájl bontása

Nézzük át szakaszonként a fájlt, hogy megértsük, mit csinál és miért.

### 2.1 **Fejléc és séma (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **1. sor**: YAML nyelvi szerver sémavalidációt ad az IDE támogatás és IntelliSense részére

### 2.2 Projekt metaadatok (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **5. sor**: Meghatározza a projektnév, amit az Azure Developer CLI használ
- **6-7. sorok**: Kijelöli, hogy ez egy 1.0.2-es sablon alapján készült
- **8-9. sorok**: Az Azure Developer CLI 1.14.0 vagy magasabb verziójára van szükség

### 2.3 Telepítési hook-ok (11-40)

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

- **11-20. sorok**: **Telepítés előtti hook** - az `azd up` előtt fut

      - Unix/Linux rendszeren: végrehajthatóvá teszi és futtatja a validációs scriptet
      - Windows rendszeren: PowerShell validációs script fut
      - Mindkét esetben interaktív, és leállítja a telepítést hiba esetén

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
- **21-30. sorok**: **Erőforrás létrehozás utáni hook** - az Azure erőforrások létrehozása után fut

  - Környezeti változó írási scripteket futtat
  - Folytatja a telepítést, még ha ezek a scriptek hibáznak is (`continueOnError: true`)

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
- **31-40. sorok**: **Telepítés utáni hook** - az alkalmazás telepítése után fut

  - Végső beállítási scripteket hajt végre
  - Akkor is folytatja, ha a scriptek hibáznak

### 2.4 Szolgáltatás konfiguráció (41-48)

Ez konfigurálja az alkalmazás szolgáltatását, amelyet telepít.

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

- **42. sor**: Egy "api_and_frontend" nevű szolgáltatást definiál
- **43. sor**: A `./src` mappát adja meg a forráskódnak
- **44. sor**: Python programozási nyelvet határoz meg
- **45. sor**: Azure Container Apps hosztot használ
- **46-48. sorok**: Docker konfiguráció

      - "api_and_frontend" képnevet használ
      - A Docker képet távolról, Azure-ban építi (nem helyileg)

### 2.5 Pipeline változók (49-76)

Ezek olyan változók, amelyek segítik az `azd` használatát CI/CD pipeline-okban az automatizáláshoz

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

Ez a rész a telepítés **alatti** környezeti változókat határozza meg, kategóriánként csoportosítva:

- **Azure erőforrás nevek (51-60. sorok)**:
      - Alap Azure szolgáltatás nevei, pl. erőforráscsoport, AI Hub, AI Projekt stb.
- **Funkció kapcsolók (61-63. sorok)**:
      - Igaz/hamis változók Azure szolgáltatások engedélyezéséhez/tiltásához
- **AI ügynök konfiguráció (64-71. sorok)**:
      - Az AI ügynök fő beállításai, beleértve név, azonosító, telepítési beállítások, modell részletek
- **AI beágyazás konfiguráció (72-79. sorok)**:
      - A vektoros kereséshez használt beágyazási modell beállításai
- **Keresés és monitorozás (80-84. sorok)**:
      - Keresési index neve, meglévő erőforrás-azonosítók, monitorozás és követés beállításai

---

## 3. Ismerje meg a környezeti változókat
A következő környezeti változók szabályozzák a telepítés konfigurációját és viselkedését, elsődleges céljuk szerint csoportosítva. A legtöbb változónak értelmes alapértelmezett értéke van, de testreszabhatja őket, hogy megfeleljenek az Ön konkrét igényeinek vagy meglévő Azure erőforrásainak.

### 3.1 Kötelező változók 

```bash title="" linenums="0"
# Alap Azure konfiguráció
AZURE_ENV_NAME                    # Környezet neve (erőforrás elnevezésnél használva)
AZURE_LOCATION                    # Telepítési régió
AZURE_SUBSCRIPTION_ID             # Cél előfizetés
AZURE_RESOURCE_GROUP              # Erőforrás csoport neve
AZURE_PRINCIPAL_ID                # Felhasználói fő az RBAC-hoz

# Erőforrás nevek (automatikusan generálódik, ha nincs megadva)
AZURE_AIHUB_NAME                  # Microsoft Foundry hub neve
AZURE_AIPROJECT_NAME              # AI projekt neve
AZURE_AISERVICES_NAME             # AI szolgáltatások fiókneve
AZURE_STORAGE_ACCOUNT_NAME        # Tároló fiók neve
AZURE_CONTAINER_REGISTRY_NAME     # Konténer regisztráció neve
AZURE_KEYVAULT_NAME               # Key Vault neve (ha használva van)
```

### 3.2 Modell konfiguráció 
```bash title="" linenums="0"
# Csevegő modell konfiguráció
AZURE_AI_AGENT_MODEL_NAME         # Alapértelmezett: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Alapértelmezett: OpenAI (vagy Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Alapértelmezett: legfrissebb elérhető
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Telepítési név a csevegő modellhez
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Alapértelmezett: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Alapértelmezett: 80 (ezer TPM)

# Beágyazó modell konfiguráció
AZURE_AI_EMBED_MODEL_NAME         # Alapértelmezett: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Alapértelmezett: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Alapértelmezett: legfrissebb elérhető
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Telepítési név a beágyazásokhoz
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Alapértelmezett: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Alapértelmezett: 50 (ezer TPM)

# Ügynök konfiguráció
AZURE_AI_AGENT_NAME               # Ügynök megjelenítési neve
AZURE_EXISTING_AGENT_ID           # Létező ügynök használata (opcionális)
```

### 3.3 Funkció-váltó
```bash title="" linenums="0"
# Opcionális szolgáltatások
USE_APPLICATION_INSIGHTS         # Alapértelmezett: igaz
USE_AZURE_AI_SEARCH_SERVICE      # Alapértelmezett: hamis
USE_CONTAINER_REGISTRY           # Alapértelmezett: igaz

# Megfigyelés és nyomkövetés
ENABLE_AZURE_MONITOR_TRACING     # Alapértelmezett: hamis
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Alapértelmezett: hamis

# Keresési beállítások
AZURE_AI_SEARCH_INDEX_NAME       # Keresési index neve
AZURE_SEARCH_SERVICE_NAME        # Keresési szolgáltatás neve
```

### 3.4 AI Projekt konfiguráció 
```bash title="" linenums="0"
# Használja a meglévő erőforrásokat
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # A meglévő AI projekt teljes erőforrásazonosítója
AZURE_EXISTING_AIPROJECT_ENDPOINT       # A meglévő projekt végpont URL-je
```

### 3.5 Ellenőrizze változóit

Használja az Azure Developer CLI-t környezeti változói megtekintéséhez és kezeléséhez:

```bash title="" linenums="0"
# Az aktuális környezet összes környezeti változójának megtekintése
azd env get-values

# Egy adott környezeti változó lekérése
azd env get-value AZURE_ENV_NAME

# Egy környezeti változó beállítása
azd env set AZURE_LOCATION eastus

# Több változó beállítása egy .env fájlból
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősségkizárás**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordító szolgáltatásával készült. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítás hibákat vagy pontatlanságokat tartalmazhat. Az eredeti dokumentum anyanyelvű változata tekintendő hiteles forrásnak. Kritikus információk esetén profi, emberi fordítást javaslunk. A fordítás használatából eredő esetleges félreértésekért vagy félreértelmezésekért nem vállalunk felelősséget.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->