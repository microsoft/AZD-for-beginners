# Konfigurációs Útmutató

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD Kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 3. fejezet - Konfiguráció és hitelesítés
- **⬅️ Előző**: [Az első projekted](../chapter-01-foundation/first-project.md)
- **➡️ Következő**: [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Következő fejezet**: [4. fejezet: Infrastrukturális kód](../chapter-04-infrastructure/deployment-guide.md)

## Bevezetés

> Áttekintve `azd 1.37.2` alapján (2026 november). A Bash parancsok egy inicializált azd projektre vonatkoznak. Kivéve, ha kifejezetten teljes fájlként van megadva, a YAML/Bicep részletek töredékek, melyeket a projektnek megfelelő fájlokba kell beilleszteni, nem önállóan futtatható projektek.

Ez az átfogó útmutató lefedi az Azure Developer CLI konfigurálásának minden aspektusát az optimális fejlesztési és telepítési munkafolyamatokhoz. Megismered a konfigurációs hierarchiát, a környezetkezelést, a hitelesítési módszereket és az olyan fejlett konfigurációs mintákat, amelyek lehetővé teszik a hatékony és biztonságos Azure telepítéseket.

## Tanulási Célok

A lecke végére képes leszel:
- Elsajátítani az azd konfigurációs hierarchiáját és megérteni a beállítások prioritását
- Hatékonyan konfigurálni globális és projektre szabott beállításokat
- Több környezet kezelése különböző konfigurációkkal
- Biztonságos hitelesítési és engedélyezési minták megvalósítása
- Megérteni a komplex helyzetekhez használható fejlett konfigurációs mintákat

## Tanulási Eredmények

A lecke elvégzése után képes leszel:
- Optimalizált fejlesztési munkafolyamatokhoz konfigurálni az azd-t
- Több telepítési környezetet létrehozni és menedzselni
- Biztonságos konfigurációkezelési gyakorlatokat alkalmazni
- Konfigurációs problémákat hibaelhárítani
- Testreszabni az azd viselkedését szervezeti igények szerint

Ez az átfogó útmutató lefedi az Azure Developer CLI konfigurálásának minden aspektusát az optimális fejlesztési és telepítési munkafolyamatokhoz.

## Mesterséges intelligencia ügynökök megértése egy azd projektben

Ha új vagy az AI ügynökök világában, itt egy egyszerű mód arra, hogyan gondolj rájuk az azd ökoszisztémában.

### Mi az az ügynök?

Egy ügynök egy olyan szoftver, amely képes fogadni kérelmet, értelmezni azt, és cselekedni – gyakran AI modell hívásával, adatkereséssel vagy más szolgáltatások meghívásával. Egy azd projektben az ügynök csak egy további **szolgáltatás** a webes frontend vagy API backend mellett.

### Hogyan illeszkednek az ügynökök az azd projektszerkezetbe

Egy azd projekt három rétegből áll: **infrastruktúra**, **kód**, és **konfiguráció**. Az ügynökök ugyanúgy csatlakoznak ezekhez a rétegekhez, mint bármely más szolgáltatás:

| Réteg | Mit csinál egy hagyományos alkalmazás esetén | Mit csinál egy ügynök esetén |
|-------|---------------------------------------------|------------------------------|
| **Infrastruktúra** (`infra/`) | Webalkalmazást és adatbázist biztosít | AI modell végpontot, keresési indexet vagy ügynök hostot biztosít |
| **Kód** (`src/`) | Tartalmazza a frontend és API forráskódot | Tartalmazza az ügynök logikáját és prompt definíciókat |
| **Konfiguráció** (`azure.yaml`) | Felsorolja a szolgáltatásokat és a hosztolási célpontokat | Felsorolja az ügynököt szolgáltatásként, mutatva a kódjára és hostjára |

### `azure.yaml` szerepe

Nem kell most megjegyezni a szintaxist. Fogalmilag, `azure.yaml` az a fájl, ahol megmondod az azd-nek: *"Itt vannak az alkalmazásomat alkotó szolgáltatások, és itt található a kódjuk."*

Amikor a projekted tartalmaz AI ügynököt, az `azure.yaml` egyszerűen felsorolja azt az egyik szolgáltatásként. azd tudja, hogy a megfelelő infrastruktúrát (például Microsoft Foundry Models végpontot vagy Container Appot az ügynök hosztolására) kell előkészítenie, és el kell telepítenie az ügynök kódját – ahogyan egy webalkalmazás vagy API esetén.

Ez azt jelenti, hogy nincs alapvetően új megtanulandó dolog. Ha érted, hogyan kezeli azd a webszolgáltatást, már érted, hogyan kezeli az ügynököt is.

## Konfigurációs Hierarchia

azd különböző konfigurációs felületekkel rendelkezik, nem egy univerzális réteggel:
- **Globális felhasználói beállítások**: `~/.azd/config.json`, amit `azd config` kezel.
- **Projektdefiníció**: `azure.yaml` meghatározza a szolgáltatásokat, infrastruktúrát és hookokat.
- **Helyi környezet kiválasztása**: `.azure/config.json`.
- **Környezetspecifikus értékek**: `.azure/<name>/.env`, amit `azd env` kezel; további beállítások élnek az adott környezet `config.json` fájljában.
- **Flag-ek és folyamatváltozók**: csak az adott parancs/szolgáltató által támogatott beállításokat írják felül.

Egy tetszőleges `azd env set` érték nem válik automatikusan infrastruktúra paraméterről vagy telepített alkalmazás beállításról. Kifejezetten hivatkozni kell rá a paraméterfájlban, támogatott szolgáltatás konfigurációban, vagy hookban.

## Globális konfiguráció

### Globális alapértelmezett beállítások megadása
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### Gyakori globális beállítások
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ Projekt konfiguráció

### azure.yaml szerkezete
Az `azure.yaml` fájl az azd projekted szíve:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

Ez egy **projektdefiníciós példa**, nem egy kész indító. Hozd létre a hivatkozott forrásmappákat, hook szkripteket, csomagoló szkripteket és a megfelelő `infra/main.bicep`/`main.parameters.json` fájlokat mielőtt futtatnád. Az adatbázisok az infrastruktúrában vannak; az `postgres` nem beépített szolgáltatás hoszt. Az infrastruktúra paramétereket a szolgáltató paraméterfájljába kell tenni, nem az `infra.parameters`-be.

### Szolgáltatás konfigurációs opciók

#### Hoszt típusok
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### Nyelvspecifikus build hook-ok

A következő szolgáltatási töredékek hook-okat szemléltetnek; egyesítsd őket az egyes szolgáltatások valós `project` és `host` fájljaival. `buildCommand` és `startCommand` nem általános azd szolgáltatás tulajdonságok. Az indítást az alkalmazásban, Dockerfile-ban vagy hoszt infrastruktúrában konfiguráld.

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 Környezetkezelés

### Környezetek létrehozása
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Környezeti konfiguráció
Az alapvető környezeti értékek az `.azure/<env-name>/.env`-ben vannak, ideértve az `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID`, és `AZURE_LOCATION` értékeket. Kiegészítő környezeti JSON beállításokhoz használd az `azd env config get/set` fájlt. Az alábbi JSON **fogalmilag alkalmazás állapotot** jelöl, nem az azd konfigurációs sémáját; ne másold be az azd fájlokba:

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### Környezeti változók

**Csak sima szöveges bemutató.** Az egyszerű `azd env set` értékek az `.azure/<name>/.env`-ba íródnak és olvashatók parancsokkal. Soha ne használd a példában lévő API kulcsot valódi hitelesítő adatként. Titkok esetén használd az `azd env set-secret`-t és külön futásidejű összekapcsolást.

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### Környezet sablonok
Készíts egy **nem titkos, kézzel karbantartott** `.env.example`-t a projekt gyökérkönyvtárába az egységes beállításhoz. azd nem tölti be automatikusan az `env.template` nevű fájlt:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

### Környezet megosztása csapatban

Amikor több ember dolgozik egy projekten, meg kell egyezni abban, **mi utazik a repo-val és mi marad helyi**. azd minden környezetet `.azure/` mappában tart, és nem minden része commitolandó.

**Mi van az `.azure/`-ben:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Mit érdemes gitignore-olni.** az azd alapértelmezett `.gitignore` már kizárja az `.azure/`-t. Így hagyd – az `.env` fájlok titkokat tartalmazhatnak, és az erőforrás azonosítók a készítőre jellemzők. Minden csapattagnak saját **helyi** környezete van:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Környeztek közti váltás.** Az a fejlesztő, aki több környezetet menedzsel, az aktív környezetet választja ki parancs futtatás előtt:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Nem titkos alapértelmezések biztosítása a csapatnak.** Vidd be az `.env.example` fájlt az figyelmen kívül hagyott `.azure/` mappán kívül. Új csapattagok lemásolják helyi figyelmen kívül hagyott fájlba, kitöltik az értékeket, és explicit importálják a `azd env set --file <local-file>`-vel. Soha ne importálj üres helykitöltőt egy működő környezetre.

**Környezetek CI/CD-ben.** A pipeline-ok nem olvassák a helyi `.azure/` mappádat. Helyette add meg a környezeti értékeket pipeline változóként/titokként, az azd a folyamat környezetből olvassa be azokat:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Szabály:** az infrastruktúra kód (`infra/`, `azure.yaml`) megosztható Git-ben; a környezet *állapota és titkai* (`.azure/`) fejlesztőnként és pipeline-onként eltérőek. Az `azd pipeline config` automatikusan beállítja a pipeline változókat.

## 🔐 Hitelesítési konfiguráció

### Azure CLI integráció
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Szolgáltatás principal hitelesítés
CI/CD pipeline-ok számára:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Managed Identity
Azure hosztolt környezetekhez:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Infrastrukturális konfiguráció

### Bicep paraméterek
Infrastrukturális paramétereket a `infra/main.parameters.json` fájlban konfigurálj:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### Terraform konfiguráció
Terraform projektek esetén az azd behelyettesíti a helykitöltőket a `infra/main.tfvars.json` fájlban. Ezeknek a neveknek meg kell egyezniük a deklarált Terraform bemeneti változókkal:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Telepítési konfiguráció

### Build konfiguráció
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### Docker konfiguráció
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
Az útvonalak a szolgáltatás projekthez képest relatívak. A Dockerfile-nak deklarálnia kell a felhasznált `ARG` értékeket. Többlépcsős build esetén tedd a telepíthető lépést utoljára vagy használj egyedi csomagolási munkafolyamatot; az `docker.target` nem támogatott tulajdonság az áttekintett séma szerint.

## 🔧 Fejlett konfiguráció

### Egyedi erőforrás elnevezés
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Valós erőforrásneveket definiálj Bicep/Terraform-ban és ezzel egyező módon hozd létre az erőforrás-csoportot. Nincsenek általános `naming.storageAccount` vagy `naming.keyVault` konfigurációs kulcsok.

### Hálózati konfiguráció
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Ezeket a **példaszerű paraméter bejegyzéseket** illeszd be a `infra/main.parameters.json` fájlba a `parameters` alatt, és deklaráld, használd a megfelelő paramétereket Bicep-ben. Ezek önmagukban nem csinálnak semmit.

### Megfigyelés konfiguráció
Alkalmazás Insights és Log Analytics erőforrásokat Bicep/Terraform-ban alakítsd ki, és konfiguráld az alkalmazás telemetriát SDK-n belül. Nincs általános felső szintű `monitoring` blokk a `azure.yaml` fájlban, amely ezeket létrehozná. Lásd a [megfigyelési infrastruktúrát](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Környezet-specifikus konfigurációk

### Fejlesztői környezet
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Staging környezet
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Termelési környezet
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Konfiguráció ellenőrzése

### Konfiguráció ellenőrzése
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Konfigurációs szkriptek
Készíts ellenőrző szkripteket a `scripts/` mappában:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Legjobb gyakorlatok

### 1. Használj környezeti változókat
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Kerüld az érzékeny értékek kódba írását (ez csak szemléltető konfiguráció, nem egy második `database` kulcs ugyanabban a fájlban):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Rendszerezd a konfigurációs fájlokat
```
.azure/
├── config.json              # Global project config
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. Verziókezelési megfontolások
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Konfiguráció dokumentációja
Dokumentáld a konfigurációt az `CONFIG.md` fájlban:
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 Gyakorlati feladatok

### 1. gyakorlat: Több környezet konfiguráció (15 perc)

**Cél:** Hozz létre és konfigurálj három helyi környezetet különböző értékekkel. Kezdj inicializált projektből; használj nem használt neveket, ha ezek már léteznek. Ezek az alkalmazás-specifikus értékek nem változtatják meg a telemetria/futásidejű beállításokat, amíg a sablonod nem fogyasztja el azokat.

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Siker kritériumai:**
- [ ] Három környezet sikeresen létrehozva
- [ ] Minden környezet egyedi konfigurációval rendelkezik
- [ ] Lehetséges a környezetek közti váltás hiba nélkül
- [ ] `azd env list` megmutatja mindhárom környezetet

### 2. gyakorlat: Key Vault titok hivatkozások (10-20 perc)

**Cél:** Tárolj egy Key Vault hivatkozást sima szöveg helyett. **Kiindulópont:** egy inicializált környezet, Azure bejelentkezés, és hozzáférés egy Key Vault-hoz, amelyhez jogosultságod van dummy titok létrehozására/olvasására. A Vault műveletek költségekkel járhatnak.

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**Siker kritériumai:**
- [ ] Interaktív parancs jelzi a kiválasztott vaultot és titok hivatkozást
- [ ] A helyi `.env` referenciát tartalmaz a dummy titok helyett
- [ ] El tudod magyarázni, hogy a futásidejű identitást/RBAC-t és fogyasztást még konfigurálni kell

**Gyakori problémák:** egy 403-ashoz megfelelő vault adat-plane szerepkör és propagációs idő szükséges; az `azd env set ... --secret` nem érvényes parancs. A sima `get-values`/`get-value` kimenet nem feltétlenül redakált. Távolítsd el a tanulási hivatkozást az `azd env unset TRAINING_API_KEY`-tel; ez nem törli a vault titkot, amelyet ha létrehoztál, külön kell takarítanod.

## Következő lépések

- [Az első projekted](../chapter-01-foundation/first-project.md) - Konfiguráció alkalmazása a gyakorlatban
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md) - Konfiguráció használata telepítéshez
- [Erőforrások előkészítése](../chapter-04-infrastructure/provisioning.md) - Termelésre kész konfigurációk

## Hivatkozások

- [azd Konfigurációs Referencia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Séma](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Környezeti Változók](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Fejezet navigáció:**
- **📚 Tanfolyam főoldala**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 3. fejezet - Konfiguráció és hitelesítés
- **⬅️ Előző**: [Az első projekted](../chapter-01-foundation/first-project.md)
- **➡️ Következő fejezet**: [4. fejezet: Infrastruktúra kódként](../chapter-04-infrastructure/deployment-guide.md)
- **Következő lecke**: [Hitelesítés és biztonság](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->