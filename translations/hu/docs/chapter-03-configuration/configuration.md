# Konfigurációs útmutató

**Fejezet navigáció:**
- **📚 Kurzus kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 3. fejezet - Konfiguráció és hitelesítés
- **⬅️ Előző**: [Az első projekted](first-project.md)
- **➡️ Következő**: [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Következő fejezet**: [4. fejezet: Infrastruktúra mint kód](../chapter-04-infrastructure/deployment-guide.md)

## Bevezetés

Ez az átfogó útmutató az Azure Developer CLI konfigurálásának minden aspektusát lefedi az optimális fejlesztési és telepítési munkafolyamatok érdekében. Megismered a konfigurációs hierarchiát, a környezetkezelést, a hitelesítési módszereket, valamint a fejlett konfigurációs mintákat, amelyek hatékony és biztonságos Azure telepítéseket tesznek lehetővé.

## Tanulási célok

A lecke végére képes leszel:
- Mesteri szinten kezelni az azd konfigurációs hierarchiáját és megérteni, hogyan priorizálódnak a beállítások
- Hatékonyan konfigurálni a globális és projekt-specifikus beállításokat
- Több környezet kezelését eltérő konfigurációkkal megvalósítani
- Biztonságos hitelesítési és jogosultságkezelési mintákat alkalmazni
- Megérteni a fejlett konfigurációs mintákat összetett forgatókönyvekhez

## Tanulási eredmények

A lecke elvégzése után képes leszel:
- Az azd optimális fejlesztési munkafolyamatokra való konfigurálása
- Több telepítési környezet létrehozása és kezelése
- Biztonságos konfigurációs menedzsment gyakorlatok alkalmazása
- Konfigurációval kapcsolatos problémák elhárítása
- Az azd viselkedésének testreszabása speciális szervezeti igényekre

Ez az átfogó útmutató az Azure Developer CLI konfigurálásának minden aspektusát lefedi az optimális fejlesztési és telepítési munkafolyamatok érdekében.

## AI ügynökök megértése egy azd projektben

Ha új vagy az AI ügynökök világában, itt egy egyszerű mód arra, hogyan gondolj rájuk az azd környezetében.

### Mi az az ügynök?

Egy ügynök egy szoftverösszetevő, amely képes kérés fogadására, annak értelmezésére és műveletek végrehajtására — gyakran AI modell hívásával, adatkereséssel vagy más szolgáltatások meghívásával. Egy azd projektben az ügynök csak egy további **szolgáltatás** a webes frontended vagy az API backended mellett.

### Hogyan illeszkednek az ügynökök az azd projekt szerkezetébe

Egy azd projekt három rétegből áll: **infrastruktúra**, **kód** és **konfiguráció**. Az ügynökök ugyanígy integrálódnak ezekbe a rétegekbe, mint bármely más szolgáltatás:

| Réteg | Mit csinál egy hagyományos alkalmazás esetén | Mit csinál egy ügynök esetén |
|-------|-----------------------------------------------|------------------------------|
| **Infrastruktúra** (`infra/`) | Webalkalmazást és adatbázist biztosít | AI modell végpontot, keresőindexet vagy ügynök hostot biztosít |
| **Kód** (`src/`) | Tartalmazza a frontend és API forráskódot | Tartalmazza az ügynök logikáját és prompt definíciókat |
| **Konfiguráció** (`azure.yaml`) | Felsorolja a szolgáltatásokat és a hosztolási célokat | Felsorolja az ügynököt szolgáltatásként, mutat a kódjára és hosztjára |

### Az `azure.yaml` szerepe

Nem kell most megjegyezned a szintaxist. Fogalmilag az `azure.yaml` a fájl, ahol megmondod az azd-nek: *"Íme azok a szolgáltatások, amelyek az alkalmazásom részei, és itt található a kódjuk."*

Ha a projekted AI ügynököt tartalmaz, az `azure.yaml` egyszerűen felsorolja az ügynököt egy szolgáltatásként. Az azd így tudja, hogy megfelelő infrastruktúrát kell biztosítania (például Microsoft Foundry Models végpontot vagy Container App-ot az ügynök hosztolására), és telepíteni kell az ügynök kódját — ugyanúgy, mintha webalkalmazás vagy API lenne.

Ez azt jelenti, hogy nincs alapvetően új dolgunk tanulni. Ha érted, hogyan kezeli az azd a web szolgáltatásokat, akkor már érted, hogyan kezeli az ügynököt is.

## Konfigurációs hierarchia

Az azd hierarchikus konfigurációs rendszert használ:
1. **Parancssori zászlók** (legmagasabb prioritás)
2. **Környezeti változók**
3. **Helyi projekt konfiguráció** (`.azd/config.json`)
4. **Globális felhasználói konfiguráció** (`~/.azd/config.json`)
5. **Alapértelmezett értékek** (legalacsonyabb prioritás)

## Globális konfiguráció

### Globális alapértelmezések beállítása
```bash
# Állítsa be az alapértelmezett előfizetést
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Állítsa be az alapértelmezett helyet
azd config set defaults.location "eastus2"

# Állítsa be az alapértelmezett erőforráscsoport elnevezési konvenciót
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Tekintse meg az összes globális konfigurációt
azd config list

# Távolítson el egy konfigurációt
azd config unset defaults.location
```

### Gyakori globális beállítások
```bash
# Fejlesztési beállítások
azd config set alpha.enable true                    # Alfa funkciók engedélyezése
azd config set telemetry.enabled false             # Telemetria kikapcsolása
azd config set output.format json                  # Kimeneti formátum beállítása

# Biztonsági beállítások
azd config set auth.useAzureCliCredential true     # Azure CLI használata hitelesítéshez
azd config set tls.insecure false                  # TLS ellenőrzés kötelezővé tétele

# Teljesítményhangolás
azd config set provision.parallelism 5             # Párhuzamos erőforrás létrehozás
azd config set deploy.timeout 30m                  # Telepítési időkorlát
```

## 🏗️ Projekt konfiguráció

### azure.yaml szerkezete
Az `azure.yaml` fájl az azd projekted szíve:

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

### Szolgáltatáskonfigurációs opciók

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

# Létrehozás meghatározott helyszínnel
azd env new staging --location "westus2"

# Létrehozás sablonból
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Környezeti konfiguráció
Minden környezetnek megvan a saját konfigurációja a `.azure/<env-name>/config.json` fájlban:

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
Készíts `.azure/env.template` fájlt a következetes környezeti beállításhoz:
```bash
# Szükséges változók
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

## 🔐 Hitelesítési konfiguráció

### Azure CLI integráció
```bash
# Azure CLI hitelesítő adatok használata (alapértelmezett)
azd config set auth.useAzureCliCredential true

# Bejelentkezés egy adott bérlővel
az login --tenant <tenant-id>

# Alapértelmezett előfizetés beállítása
az account set --subscription <subscription-id>
```

### Szolgáltatásfiók hitelesítés
CI/CD pipeline-okhoz:
```bash
# Állítsa be a környezeti változókat
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Vagy konfigurálja közvetlenül
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Kezelt identitás
Azure hosztolt környezetekhez:
```bash
# Engedélyezze a kezelt azonosító hitelesítést
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastruktúra konfiguráció

### Bicep paraméterek
Infrastruktúra paraméterek konfigurálása az `infra/main.parameters.json` fájlban:
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
Terraform projektekhez az `infra/terraform.tfvars` fájlban:
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

## 🔧 Fejlett konfiguráció

### Egyedi erőforrás névhasználat
```bash
# Nevezéktan szabályok beállítása
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

### Megfigyelés konfiguráció
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

## 🔍 Konfiguráció érvényesítés

### Konfiguráció érvényesítés
```bash
# Ellenőrizze a konfiguráció szintaxisát
azd config validate

# Tesztelje a környezeti változókat
azd env get-values

# Érvényesítse az infrastruktúrát
azd provision --dry-run
```

### Konfigurációs szkriptek
Készíts érvényesítő szkripteket a `scripts/` mappában:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Ellenőrizze a szükséges környezeti változókat
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Érvényesítse az azure.yaml szintaxisát
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
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

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Rendszerezd a konfigurációs fájlokat
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

### 3. Verziókezelési megfontolások
```bash
# .gitignore
.azure/*/config.json         # Környezeti konfigurációk (tartalmazzák az erőforrás-azonosítókat)
.azure/*/.env               # Környezeti változók (tartalmazhatnak titkokat)
.env                        # Helyi környezeti fájl
```

### 4. Dokumentáld a konfigurációt
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
# Fejlesztői környezet létrehozása
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

# Ellenőrizze minden környezetet
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Siker kritériumok:**
- [ ] Három környezet sikeresen létrehozva
- [ ] Minden környezet egyedi konfigurációval rendelkezik
- [ ] Hiba nélkül tudsz váltani a környezetek között
- [ ] Az `azd env list` megjeleníti mindhárom környezetet

### 2. gyakorlat: Titkok kezelése (10 perc)

**Cél:** Gyakorold a biztonságos konfigurációt érzékeny adatokkal

```bash
# Titkok beállítása (nem jelenik meg a kimenetben)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Titoktól mentes konfiguráció beállítása
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Környezet megtekintése (a titkokat el kell takarni)
azd env get-values

# Ellenőrizze, hogy a titkok tárolva vannak
azd env get DB_PASSWORD  # Valódi értéket kell mutatnia
```

**Siker kritériumok:**
- [ ] Titkok tárolva anélkül, hogy megjelennének a terminálon
- [ ] Az `azd env get-values` redigált titkokat mutat
- [ ] Egyesével az `azd env get <SECRET_NAME>` lekéri a valós értéket

## Következő lépések

- [Az első projekted](first-project.md) - Konfiguráció alkalmazása gyakorlatban
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md) - Konfiguráció használata telepítéshez
- [Erőforrások előkészítése](../chapter-04-infrastructure/provisioning.md) - Éles használatra készült konfigurációk

## Hivatkozások

- [azd konfigurációs referencia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml séma](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Környezeti változók](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Fejezet navigáció:**
- **📚 Kurzus kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 3. fejezet - Konfiguráció és hitelesítés
- **⬅️ Előző**: [Az első projekted](first-project.md)
- **➡️ Következő fejezet**: [4. fejezet: Infrastruktúra mint kód](../chapter-04-infrastructure/deployment-guide.md)
- **Következő lecke**: [Az első projekted](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordító szolgáltatásával készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum anyanyelvén tekintendő hivatalos forrásnak. Fontos információk esetén professzionális emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->