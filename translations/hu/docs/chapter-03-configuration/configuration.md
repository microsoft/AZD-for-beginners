# Konfigurációs útmutató

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 3. fejezet - Konfiguráció és hitelesítés
- **⬅️ Előző**: [Az első projekted](first-project.md)
- **➡️ Következő**: [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Következő fejezet**: [4. fejezet: Infrastruktúra kódként](../chapter-04-infrastructure/deployment-guide.md)

## Bevezetés

Ez az átfogó útmutató lefedi az Azure Developer CLI konfigurálásának minden aspektusát az optimális fejlesztési és telepítési munkafolyamatok érdekében. Megismered a konfigurációs hierarchiát, a környezetkezelést, a hitelesítési módszereket, valamint a haladó konfigurációs mintákat, amelyek hatékony és biztonságos Azure-telepítéseket tesznek lehetővé.

## Tanulási célok

A lecke végére képes leszel:
- Mesteri szinten kezelni az azd konfigurációs hierarchiáját és megérteni a beállítások prioritását
- Hatékonyan konfigurálni globális és projektre szabott beállításokat
- Több környezet kezelésére különböző konfigurációkkal
- Biztonságos hitelesítési és engedélyezési minták alkalmazására
- Megérteni haladó konfigurációs mintákat bonyolult helyzetekben

## Tanulási eredmények

A lecke elvégzése után képes leszel:
- Az azd optimális fejlesztési munkafolyamatokra való konfigurálása
- Több telepítési környezet beállítása és kezelése
- Biztonságos konfigurációkezelési gyakorlatok alkalmazása
- Konfigurációval kapcsolatos problémák hibaelhárítása
- Az azd viselkedésének testreszabása specifikus szervezeti igényekhez

Ez az átfogó útmutató lefedi az Azure Developer CLI konfigurálásának minden aspektusát az optimális fejlesztési és telepítési munkafolyamatok érdekében.

## Az AI ügynökök megértése egy azd projektben

Ha új vagy az AI ügynökök területén, íme egy egyszerű mód arra, hogyan gondolj rájuk az azd világában.

### Mi az az ügynök?

Az ügynök egy olyan szoftver, amely képes fogadni egy kérést, értelmezni azt, és cselekvéseket hajtani végre – gyakran AI modell hívásával, adat lekérdezésével vagy más szolgáltatások meghívásával. Egy azd projektben az ügynök egy egyszerűen egy másik **szolgáltatás** a webes frontend vagy API backend mellett.

### Hogyan illeszkednek az ügynökök az azd projekt struktúrájába

Egy azd projekt három rétegből áll: **infrastruktúra**, **kód** és **konfiguráció**. Az ügynökök ugyanúgy becsatlakoznak ezekbe a rétegekbe, mint bármely más szolgáltatás:

| Réteg | Mit csinál egy hagyományos alkalmazásnál | Mit csinál egy ügynöknél |
|-------|------------------------------------------|--------------------------|
| **Infrastruktúra** (`infra/`) | Webalkalmazást és adatbázist biztosít | AI modell végpontot, keresési indexet vagy ügynök hosztot biztosít |
| **Kód** (`src/`) | Tartalmazza a frontend és API forráskódját | Tartalmazza az ügynök logikáját és prompt definíciókat |
| **Konfiguráció** (`azure.yaml`) | Felsorolja a szolgáltatásokat és hosztolási céljaikat | Felsorolja az ügynököt szolgáltatásként, megadva a kódját és hosztját |

### Az `azure.yaml` szerepe

Nem kell most megtanulnod kívülről a szintaxist. Fogalmilag az `azure.yaml` az a fájl, ahol az azd-nek megmondod: *„Itt vannak az alkalmazásomat alkotó szolgáltatások, és itt található a kódjuk.”*

Ha a projekted tartalmaz AI ügynököt, az `azure.yaml` egyszerűen felsorolja azt a szolgáltatások között. Ezután az azd tudja, hogy a megfelelő infrastruktúrát kell biztosítani (például Microsoft Foundry Models végpont vagy Container App az ügynök hosztolására), és telepíti az ügynök kódját – ahogy azt egy webalkalmazás vagy API esetében is tenné.

Ez azt jelenti, hogy nincs alapvetően új dolog, amit meg kellene tanulni. Ha érted, hogyan kezeli az azd a webszolgáltatásokat, már érted, hogyan kezeli az ügynököt is.

## Konfigurációs hierarchia

Az azd hierarchikus konfigurációs rendszert használ:
1. **Parancssori kapcsolók** (legmagasabb prioritás)
2. **Környezeti változók**
3. **Helyi projekt konfiguráció** (`.azd/config.json`)
4. **Globális felhasználói konfiguráció** (`~/.azd/config.json`)
5. **Alapértelmezett értékek** (legalacsonyabb prioritás)

## Globális konfiguráció

### Globális alapbeállítások megadása
```bash
# Alapértelmezett előfizetés beállítása
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Alapértelmezett hely beállítása
azd config set defaults.location "eastus2"

# Alapértelmezett erőforráscsoport elnevezési konvenció beállítása
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Az összes globális konfiguráció megtekintése
azd config show

# Konfiguráció eltávolítása
azd config unset defaults.location
```

### Gyakori globális beállítások
```bash
# Fejlesztési beállítások
azd config set alpha.enable true                    # Alfa funkciók engedélyezése
azd config set telemetry.enabled false             # Telemetria letiltása
azd config set output.format json                  # Kimeneti formátum beállítása

# Biztonsági beállítások
azd config set auth.useAzureCliCredential true     # Azure CLI használata hitelesítéshez
azd config set tls.insecure false                  # TLS-ellenőrzés érvényesítése

# Teljesítmény hangolása
azd config set provision.parallelism 5             # Erőforrás párhuzamos létrehozása
azd config set deploy.timeout 30m                  # Telepítési időkorlát
```

## 🏗️ Projekt konfiguráció

### azure.yaml struktúra
Az `azure.yaml` fájl az azd projekted központja:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

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
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

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

### Szolgáltatás konfigurációs beállításai

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

#### Nyelvspecifikus beállítások
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 Környezetkezelés

### Környezetek létrehozása
```bash
# Új környezet létrehozása
azd env new development

# Létrehozás meghatározott helyen
azd env new staging --location "westus2"

# Létrehozás sablonból
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Környezeti konfiguráció
Minden környezetnek saját konfigurációja van a `.azure/<env-name>/config.json` fájlban:

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
```bash
# Környezetspecifikus változók beállítása
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Környezeti változók megtekintése
azd env get-values

# Várt kimenet:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=titkos-api-kulcs
# DEBUG=igaz

# Környezeti változó eltávolítása
azd env unset DEBUG

# Eltávolítás ellenőrzése
azd env get-values | grep DEBUG
# (nem szabad semmit visszaadnia)
```

### Környezeti sablonok
Hozz létre `.azure/env.template` fájlt az egységes környezetbeállításhoz:
```bash
# Kötelező változók
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Alkalmazás beállításai
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Opcionális fejlesztési beállítások
DEBUG=false
LOG_LEVEL=info
```

### Környezet megosztása csapatban

Ha több ember dolgozik egy projekten, meg kell egyezni abban, **mi utazik a repo-val és mi marad helyi**. Az azd minden környezetet a `.azure/` mappában tart, de nem mindet kell verziókövetésbe venni.

**Mi van a `.azure/` mappában:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**Mit hagyjunk ki a gitből.** Az azd alapértelmezett `.gitignore` fájlja már kizárja a `.azure/` mappát. Tartsd így – a `.env` fájlok tartalmazhatnak titkos adatokat, és az erőforrásazonosítók specifikusak a létrehozó személyhez. Minden csapattag létrehozza a **saját** környezetét helyileg:

```bash
# Minden fejlesztő egyszer futtatja ezt, hogy megkapja a saját elszigetelt környezetét
azd env new dev-alice
azd up
```

**Váltás a környezetek között.** A fejlesztő, aki több környezetet kezel, kiválasztja az aktív környezetet a parancsok futtatása előtt:

```bash
azd env list                 # lásd az összes helyi környezetet és hogy melyik az alapértelmezett
azd env select staging       # tedd az 'staging'-et az aktív környezetté
azd env get-values           # erősítsd meg, hogy a megfelelőre vagy irányítva
```

**Nem titkos alapértékek megadása a csapatnak.** Kötelezz el sablont (például a fent említett `.azure/env.template` fájlt), hogy mindenki tudja, mely változókat kell beállítani – de soha ne kötelezd el a kitöltött értékeket. Az új csapattagok lemásolják a sablont és kitöltik a sajátjukat.

**Környezetek CI/CD-ben.** A pipeline-ok nem olvassák a helyi `.azure/` mappádat. Helyette adj meg környezeti értékeket pipeline változóként/titkokként, és az azd a folyamat környezetéből olvassa azokat:

```bash
# CI-ben azd ezeket a környezetből olvassa, nem a .azure/-ból
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Szabály:** A infrastruktúra kód (`infra/`, `azure.yaml`) megosztott a Git-ben; a környezeti *állapot és titkok* (`.azure/`) fejlesztőnként és pipeline-onként egyediek. Az `azd pipeline config` automatikusan beállítja a pipeline változókat.

## 🔐 Hitelesítési konfiguráció

### Azure CLI integráció
```bash
# Használja az Azure CLI hitelesítő adatokat (alapértelmezett)
azd config set auth.useAzureCliCredential true

# Bejelentkezés meghatározott bérlővel
az login --tenant <tenant-id>

# Alapértelmezett előfizetés beállítása
az account set --subscription <subscription-id>
```

### Szolgáltatás-fiók hitelesítés
CI/CD pipeline-okhoz:
```bash
# Környezeti változók beállítása
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Vagy közvetlen konfigurálás
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Kezelt identitás
Azure által hosztolt környezetek esetén:
```bash
# Engedélyezze a kezelt identitás hitelesítését
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastruktúra konfiguráció

### Bicep paraméterek
Az infrastruktúra paramétereit az `infra/main.parameters.json` fájlban állítsd be:
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
Terraform projektekhez az `infra/terraform.tfvars` fájlban konfigurálj:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Telepítési konfiguráció

### Build konfiguráció
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### Docker konfiguráció
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        NODE_ENV: production
        API_VERSION: v1.0.0
```
Példa `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Haladó konfiguráció

### Egyedi erőforrás elnevezés
```bash
# Névadási konvenciók beállítása
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Hálózati konfiguráció
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Monitorozási konfiguráció
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 Környezet-specifikus konfigurációk

### Fejlesztési környezet
```bash
# .azure/fejlesztés/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Tesztelési környezet
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Éles környezet
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Konfiguráció validálása

### Konfiguráció ellenőrzése
```bash
# Ellenőrizze a konfiguráció szintaxisát
azd config validate

# Tesztelje a környezeti változókat
azd env get-values

# Érvényesítse az infrastruktúrát
azd provision --dry-run
```

### Konfigurációs szkriptek
Készíts ellenőrző szkripteket a `scripts/` mappába:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Szükséges környezeti változók ellenőrzése
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml szintaxis ellenőrzése
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Legjobb gyakorlatok

### 1. Környezeti változók használata
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Konfigurációs fájlok rendszerezése
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
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

### 3. Verziókövetési megfontolások
```bash
# .gitignore
.azure/*/config.json         # Környezeti konfigurációk (tartalmazhatnak erőforrás-azonosítókat)
.azure/*/.env               # Környezeti változók (tartalmazhatnak titkokat)
.env                        # Helyi környezeti fájl
```

### 4. Konfiguráció dokumentálása
Dokumentáld a konfigurációdat a `CONFIG.md` fájlban:
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

### 1. gyakorlat: Többkörnyezetes konfiguráció (15 perc)

**Cél:** Három környezet létrehozása és konfigurálása eltérő beállításokkal

```bash
# Fejlesztőkörnyezet létrehozása
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Tesztkörnyezet létrehozása
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Éles környezet létrehozása
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Ellenőrizze az egyes környezeteket
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Siker kritériumok:**
- [ ] Három környezet sikeresen létrehozva
- [ ] Minden környezet egyedi konfigurációval rendelkezik
- [ ] Hibamentesen lehet váltani a környezetek között
- [ ] Az `azd env list` mindhárom környezetet mutatja

### 2. gyakorlat: Titkok kezelése (10 perc)

**Cél:** Biztonságos konfiguráció gyakorlása érzékeny adatokkal

```bash
# Titkok beállítása (nem jelenik meg a kimenetben)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Nem titkos konfiguráció beállítása
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Környezet megtekintése (a titkokat el kell takarni)
azd env get-values

# Ellenőrizze, hogy a titkok tárolva vannak-e
azd env get DB_PASSWORD  # Valódi értéket kell mutatnia
```

**Siker kritériumok:**
- [ ] Titkok tárolása anélkül, hogy a terminálon megjelennek
- [ ] Az `azd env get-values` elrejti a titkokat
- [ ] Az egyedi `azd env get <SECRET_NAME>` lekéri a tényleges értéket

## Következő lépések

- [Az első projekted](first-project.md) - Konfiguráció alkalmazása gyakorlatban
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md) - Konfiguráció használata telepítéshez
- [Erőforrások biztosítása](../chapter-04-infrastructure/provisioning.md) - Éles használatra kész konfigurációk

## Hivatkozások

- [azd konfigurációs hivatkozás](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml séma](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Környezeti változók](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 3. fejezet - Konfiguráció és hitelesítés
- **⬅️ Előző**: [Az első projekted](first-project.md)
- **➡️ Következő fejezet**: [4. fejezet: Infrastruktúra kódként](../chapter-04-infrastructure/deployment-guide.md)
- **Következő lecke**: [Az első projekted](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->