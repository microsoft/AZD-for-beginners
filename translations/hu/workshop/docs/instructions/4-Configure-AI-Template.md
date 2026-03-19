# 4. Egy sablon konfigurálása

!!! tip "A TANANYAG VÉGÉRE KÉPES LESZ"

    - [ ] Megérteni az `azure.yaml` célját
    - [ ] Megérteni az `azure.yaml` felépítését
    - [ ] Megérteni az azd életciklus `hook`-ok értékét
    - [ ] **Labor 4:** Környezeti változók felfedezése és módosítása

---

!!! prompt "Mit csinál az `azure.yaml` fájl? Használj kódblokkot és magyarázd el soronként"

      Az `azure.yaml` fájl az **Azure Developer CLI (azd)** konfigurációs fájlja. Meghatározza, hogyan kell az alkalmazást az Azure-ba telepíteni, beleértve az infrastruktúrát, szolgáltatásokat, telepítési hook-okat és környezeti változókat.

---

## 1. Cél és funkciók

Ez az `azure.yaml` fájl egy **telepítési tervként** szolgál egy AI ügynök alkalmazáshoz, amely:

1. **Ellenőrzi a környezetet** a telepítés előtt
2. **Azure AI szolgáltatásokat biztosít** (AI Hub, AI Projekt, Keresés stb.)
3. **Python alkalmazást telepít** az Azure Container Apps-be
4. **Konfigurálja az AI modelleket** chat és beágyazási funkciókra
5. **Beállítja a monitorozást és nyomkövetést** az AI alkalmazáshoz
6. **Kezeli az új és meglévő** Azure AI projekt helyzeteket

A fájl lehetővé teszi az **egyetlen parancsból való telepítést** (`azd up`) egy teljes AI ügynök megoldáshoz, megfelelő ellenőrzéssel, biztosítással és utólagos konfigurálással.

??? info "Kibontás megtekintéséhez: `azure.yaml`"

      Az `azure.yaml` fájl meghatározza, hogyan kell az Azure Developer CLI-nek ezt az AI Agent alkalmazást telepítenie és kezelnie az Azure-ban. Nézzük meg soronként.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: szükségesek-e a hook-ok? 
      # TODO: szükségesek-e az összes változó?

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

## 2. A fájl részeinek elemzése

Nézzük át a fájlt szakaszonként, hogy megértsük mit csinál és miért.

### 2.1 **Fejléc és séma (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **1. sor**: YAML nyelvi szerver séma érvényesítést biztosít az IDE támogatáshoz és IntelliSense-hez

### 2.2 Projekt metaadatai (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **5. sor**: Meghatározza a projekt nevét, amit az Azure Developer CLI használ
- **6-7. sor**: Megadja, hogy egy 1.0.2 verziójú sablon alapján készült
- **8-9. sor**: Követeli az Azure Developer CLI 1.14.0 vagy újabb verzióját

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

- **11-20. sorok**: **Telepítés előtti hook** - az `azd up` parancs előtt fut

      - Unix/Linux alatt: futtathatóvá teszi az ellenőrző szkriptet és lefuttatja
      - Windows alatt: PowerShell ellenőrző szkriptet futtat
      - Mindkettő interaktív, és hibás futás esetén megállítja a telepítést

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
- **21-30. sorok**: **Telepítés utáni biztosítási hook** - az Azure erőforrások létrehozása után fut

  - Környezeti változók írását végző szkriptek futtatása
  - Még hibás futás esetén is folytatja a telepítést (`continueOnError: true`)

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
- **31-40. sorok**: **Telepítés utáni hook** - alkalmazás telepítése után fut

  - Végső beállítási szkripteket futtat
  - Szkripthibák esetén is folytatja

### 2.4 Szolgáltatás konfiguráció (41-48)

Ez konfigurálja a telepítendő alkalmazási szolgáltatást.

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

- **42. sor**: Definiál egy "api_and_frontend" nevű szolgáltatást
- **43. sor**: A forráskód a `./src` mappában található
- **44. sor**: Python programozási nyelvet használ
- **45. sor**: Azure Container Apps környezetben futtatja
- **46-48. sorok**: Docker konfiguráció

      - "api_and_frontend" a docker kép neve
      - Távolról építi meg az Azure-ban (nem helyileg)

### 2.5 Pipeline változók (49-76)

Ezek a változók segítenek az `azd` futtatásában CI/CD pipeline-okban automatizáció céljából

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

Ez a szakasz a **telepítés alatt használt környezeti változókat** definiálja, kategóriánként csoportosítva:

- **Azure erőforrás nevek (51-60. sorok)**:
      - Alap Azure erőforrások nevei, pl. erőforráscsoport, AI Hub, AI Projekt stb.
- **Funkció kapcsolók (61-63. sorok)**:
      - Logikai változók adott Azure szolgáltatások engedélyezésére/tiltására
- **AI ügynök konfiguráció (64-71. sorok)**:
      - Fő AI ügynök beállításai, többek között név, azonosító, telepítési beállítások, modell adatok
- **AI beágyazási konfiguráció (72-79. sorok)**:
      - Beágyazási modell beállításai vektor kereséshez
- **Keresés és monitorozás (80-84. sorok)**:
      - Keresési index neve, meglévő erőforrások ID-jei, monitorozási és nyomkövetési beállítások

---

## 3. Ismerd meg a környezeti változókat
Az alábbi környezeti változók irányítják a telepítés konfigurációját és működését, elsődleges céljuk szerint csoportosítva. A legtöbb változó ésszerű alapértelmezett értékkel rendelkezik, azonban testre szabhatók, hogy megfeleljenek az egyedi igényeknek vagy meglévő Azure erőforrásoknak.

### 3.1 Kötelező változók

```bash title="" linenums="0"
# Alapvető Azure konfiguráció
AZURE_ENV_NAME                    # Környezet neve (erőforrásnévben használva)
AZURE_LOCATION                    # Telepítési régió
AZURE_SUBSCRIPTION_ID             # Cél előfizetés
AZURE_RESOURCE_GROUP              # Erőforráscsoport neve
AZURE_PRINCIPAL_ID                # Felhasználói főnév az RBAC-hoz

# Erőforrásnevek (automatikusan generálódnak, ha nincs megadva)
AZURE_AIHUB_NAME                  # Microsoft Foundry központ neve
AZURE_AIPROJECT_NAME              # AI projekt neve
AZURE_AISERVICES_NAME             # AI szolgáltatások fiókneve
AZURE_STORAGE_ACCOUNT_NAME        # Tárolófiók neve
AZURE_CONTAINER_REGISTRY_NAME     # Konténerregisztráció neve
AZURE_KEYVAULT_NAME               # Key Vault neve (ha használatban van)
```

### 3.2 Modell konfiguráció

```bash title="" linenums="0"
# Csevegőmodell konfiguráció
AZURE_AI_AGENT_MODEL_NAME         # Alapértelmezett: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Alapértelmezett: OpenAI (vagy Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Alapértelmezett: legfrissebb elérhető
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Telepítés neve a csevegőmodellhez
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Alapértelmezett: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Alapértelmezett: 80 (ezer TPM)

# Belenagyítási modell konfiguráció
AZURE_AI_EMBED_MODEL_NAME         # Alapértelmezett: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Alapértelmezett: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Alapértelmezett: legfrissebb elérhető
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Telepítés neve a beágyazásokhoz
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Alapértelmezett: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Alapértelmezett: 50 (ezer TPM)

# Ügynök konfiguráció
AZURE_AI_AGENT_NAME               # Ügynök megjelenítési neve
AZURE_EXISTING_AGENT_ID           # Létező ügynök használata (opcionális)
```

### 3.3 Funkció kapcsoló

```bash title="" linenums="0"
# Választható szolgáltatások
USE_APPLICATION_INSIGHTS         # Alapértelmezett: igaz
USE_AZURE_AI_SEARCH_SERVICE      # Alapértelmezett: hamis
USE_CONTAINER_REGISTRY           # Alapértelmezett: igaz

# Figyelés és nyomon követés
ENABLE_AZURE_MONITOR_TRACING     # Alapértelmezett: hamis
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Alapértelmezett: hamis

# Keresési konfiguráció
AZURE_AI_SEARCH_INDEX_NAME       # Keresési index neve
AZURE_SEARCH_SERVICE_NAME        # Keresési szolgáltatás neve
```

### 3.4 AI projekt konfiguráció

```bash title="" linenums="0"
# Használja a meglévő erőforrásokat
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Meglévő MI projekt teljes erőforrásazonosítója
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Meglévő projekt végpont URL-je
```

### 3.5 Ellenőrizd változóidat

Használd az Azure Developer CLI-t a környezeti változók megtekintésére és kezelésére:

```bash title="" linenums="0"
# Az összes környezeti változó megtekintése az aktuális környezethez
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
**Jogi nyilatkozat**:  
Ez a dokumentum az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár pontos fordításra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális, emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->