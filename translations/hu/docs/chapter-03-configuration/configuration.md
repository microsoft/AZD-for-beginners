# Konfigurációs útmutató

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 3. fejezet - Konfiguráció és hitelesítés
- **⬅️ Előző**: [Az első projekt](first-project.md)
- **➡️ Következő**: [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Következő fejezet**: [4. fejezet: Infrastruktúra mint kód](../chapter-04-infrastructure/deployment-guide.md)

## Bevezetés

Ez az átfogó útmutató lefedi az Azure Developer CLI konfigurálásának minden szempontját az optimális fejlesztési és telepítési munkafolyamatokhoz. Megismerheted a konfigurációs hierarchiát, a környezetkezelést, a hitelesítési módszereket és azokat a fejlett konfigurációs mintákat, amelyek hatékony és biztonságos Azure-telepítéseket tesznek lehetővé.

## Tanulási célok

A lecke végére:
- Sajátítsd el az azd konfigurációs hierarchiáját, és értsd meg, hogyan kapnak prioritást a beállítások
- Konfiguráld hatékonyan a globális és projekt-specifikus beállításokat
- Kezeld több környezetet eltérő konfigurációkkal
- Valósíts meg biztonságos hitelesítési és jogosultságkezelési mintákat
- Értsd meg az összetett helyzetekhez tartozó fejlett konfigurációs mintákat

## A tanulás eredményei

A lecke elvégzése után képes leszel:
- Konfigurálni az azd-t az optimális fejlesztési munkafolyamatokhoz
- Több telepítési környezet létrehozása és kezelése
- Biztonságos konfigurációkezelési gyakorlatok megvalósítása
- Konfigurációval kapcsolatos problémák elhárítása
- Az azd viselkedésének testreszabása konkrét szervezeti követelményekhez

Ez az átfogó útmutató lefedi az Azure Developer CLI konfigurálásának minden szempontját az optimális fejlesztési és telepítési munkafolyamatokhoz.

## Konfigurációs hierarchia

Az azd hierarchikus konfigurációs rendszert használ:
1. **Parancssori kapcsolók** (legmagasabb prioritás)
2. **Környezeti változók**
3. **Helyi projekt konfiguráció** (`.azd/config.json`)
4. **Globális felhasználói konfiguráció** (`~/.azd/config.json`)
5. **Alapértelmezett értékek** (legalacsonyabb prioritás)

## Globális konfiguráció

### Globális alapértelmezések beállítása
```bash
# Alapértelmezett előfizetés beállítása
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Alapértelmezett helyszín beállítása
azd config set defaults.location "eastus2"

# Alapértelmezett erőforráscsoport elnevezési konvenció beállítása
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Az összes globális konfiguráció megtekintése
azd config list

# Konfiguráció eltávolítása
azd config unset defaults.location
```

### Gyakori globális beállítások
```bash
# Fejlesztési preferenciák
azd config set alpha.enable true                    # Alfa funkciók engedélyezése
azd config set telemetry.enabled false             # Telemetria letiltása
azd config set output.format json                  # Kimeneti formátum beállítása

# Biztonsági beállítások
azd config set auth.useAzureCliCredential true     # Hitelesítéshez az Azure CLI használata
azd config set tls.insecure false                  # TLS ellenőrzés kikényszerítése

# Teljesítmény hangolása
azd config set provision.parallelism 5             # Erőforrások párhuzamos létrehozása
azd config set deploy.timeout 30m                  # Telepítési időkorlát
```

## 🏗️ Projekt konfiguráció

### azure.yaml szerkezete
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

### Szolgáltatás konfigurációs lehetőségek

#### Host típusok
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
# Hozzon létre egy új környezetet
azd env new development

# Hozzon létre meghatározott helyen
azd env new staging --location "westus2"

# Hozzon létre sablonból
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Környezet konfigurációja
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
# API_KEY=secret-api-key
# DEBUG=true

# Környezeti változó eltávolítása
azd env unset DEBUG

# Eltávolítás ellenőrzése
azd env get-values | grep DEBUG
# (nem ad vissza semmit)
```

### Környezet sablonok
Hozd létre a `.azure/env.template` fájlt a következetes környezeti beállításhoz:
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

# Bejelentkezés egy megadott bérlővel
az login --tenant <tenant-id>

# Alapértelmezett előfizetés beállítása
az account set --subscription <subscription-id>
```

### Szolgálati főfelhasználó (Service Principal) hitelesítés
CI/CD folyamatokhoz:
```bash
# Állítsa be a környezeti változókat
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Vagy konfigurálja közvetlenül
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Felügyelt identitás
Azure által hosztolt környezetekhez:
```bash
# Engedélyezze a felügyelt identitás hitelesítését
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastruktúra konfiguráció

### Bicep paraméterek
Konfiguráld az infrastruktúra paramétereit az `infra/main.parameters.json` fájlban:
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
Terraform projektek esetén konfiguráld az `infra/terraform.tfvars` fájlban:
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

### Monitoring konfiguráció
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

### Staging környezet
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

## 🔍 Konfiguráció érvényesítése

### Konfiguráció érvényesítése
```bash
# Ellenőrizze a konfiguráció szintaxisát
azd config validate

# Tesztelje a környezeti változókat
azd env get-values

# Ellenőrizze az infrastruktúrát
azd provision --dry-run
```

### Konfigurációs szkriptek
Hozz létre érvényesítő szkripteket a `scripts/` könyvtárban:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Szükséges környezeti változók ellenőrzése
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml szintaxisának ellenőrzése
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

### 2. Rendezd a konfigurációs fájlokat
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
.azure/*/config.json         # Környezeti konfigurációk (erőforrás-azonosítókat tartalmazhatnak)
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

**Cél**: Hozz létre és konfigurálj három környezetet különböző beállításokkal

```bash
# Fejlesztési környezet létrehozása
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Staging környezet létrehozása
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Éles környezet létrehozása
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Minden környezet ellenőrzése
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Sikerkritériumok:**
- [ ] Három környezet sikeresen létrehozva
- [ ] Minden környezet egyedi konfigurációval rendelkezik
- [ ] Hiba nélkül tudsz váltani a környezetek között
- [ ] A `azd env list` megjeleníti mind a három környezetet

### 2. gyakorlat: Titkok kezelése (10 perc)

**Cél**: Gyakorold a biztonságos konfigurációt érzékeny adatokkal

```bash
# Titkok beállítása (nem jelennek meg a kimenetben)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Nem titkos konfiguráció beállítása
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Környezet megtekintése (a titkokat el kell rejteni)
azd env get-values

# Titkok tárolásának ellenőrzése
azd env get DB_PASSWORD  # Valódi értéket kell mutatnia
```

**Sikerkritériumok:**
- [ ] Titkok tárolva anélkül, hogy megjelennének a terminálon
- [ ] A `azd env get-values` eltakart titkokat mutat
- [ ] Az egyedi `azd env get <SECRET_NAME>` visszaadja a tényleges értéket

## Következő lépések

- [Az első projekt](first-project.md) - Alkalmazd a konfigurációt a gyakorlatban
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md) - Használd a konfigurációt a telepítéshez
- [Erőforrások előkészítése](../chapter-04-infrastructure/provisioning.md) - Éles környezetre kész konfigurációk

## Hivatkozások

- [azd konfigurációs referencia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml séma](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Környezeti változók](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 3. fejezet - Konfiguráció és hitelesítés
- **⬅️ Előző**: [Az első projekt](first-project.md)
- **➡️ Következő fejezet**: [4. fejezet: Infrastruktúra mint kód](../chapter-04-infrastructure/deployment-guide.md)
- **Következő lecke**: [Az első projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősségkizárás**:
Ezt a dokumentumot AI-alapú fordítószolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) használatával fordítottuk. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő a hiteles forrásnak. Kritikus információk esetén szakmai, emberi fordítás ajánlott. Nem vállalunk felelősséget a jelen fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->