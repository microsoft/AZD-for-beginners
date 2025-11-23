<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8399160e4ce8c3eb6fd5d831f6602e18",
  "translation_date": "2025-11-23T10:44:38+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "hu"
}
-->
# Konfigurációs Útmutató

**Fejezet Navigáció:**
- **📚 Kurzus Kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális Fejezet**: 3. fejezet - Konfiguráció és Hitelesítés
- **⬅️ Előző**: [Az első projekted](first-project.md)
- **➡️ Következő**: [Telepítési Útmutató](../deployment/deployment-guide.md)
- **🚀 Következő Fejezet**: [4. fejezet: Infrastruktúra mint kód](../deployment/deployment-guide.md)

## Bevezetés

Ez az átfogó útmutató bemutatja az Azure Developer CLI konfigurálásának minden aspektusát, hogy optimális fejlesztési és telepítési munkafolyamatokat érhess el. Megismerheted a konfigurációs hierarchiát, a környezetek kezelését, a hitelesítési módszereket, valamint azokat a fejlett konfigurációs mintákat, amelyek hatékony és biztonságos Azure telepítéseket tesznek lehetővé.

## Tanulási Célok

A lecke végére képes leszel:
- Elsajátítani az azd konfigurációs hierarchiát és megérteni, hogyan kerülnek prioritásba a beállítások
- Hatékonyan konfigurálni globális és projekt-specifikus beállításokat
- Több környezetet kezelni különböző konfigurációkkal
- Biztonságos hitelesítési és jogosultsági mintákat alkalmazni
- Megérteni fejlett konfigurációs mintákat összetett helyzetekhez

## Tanulási Eredmények

A lecke befejezése után képes leszel:
- Az azd konfigurálására optimális fejlesztési munkafolyamatokhoz
- Több telepítési környezet beállítására és kezelésére
- Biztonságos konfigurációs gyakorlatok megvalósítására
- Konfigurációval kapcsolatos problémák elhárítására
- Az azd viselkedésének testreszabására specifikus szervezeti igényekhez

Ez az átfogó útmutató bemutatja az Azure Developer CLI konfigurálásának minden aspektusát, hogy optimális fejlesztési és telepítési munkafolyamatokat érhess el.

## Konfigurációs Hierarchia

Az azd hierarchikus konfigurációs rendszert használ:
1. **Parancssori kapcsolók** (legmagasabb prioritás)
2. **Környezeti változók**
3. **Helyi projekt konfiguráció** (`.azd/config.json`)
4. **Globális felhasználói konfiguráció** (`~/.azd/config.json`)
5. **Alapértelmezett értékek** (legalacsonyabb prioritás)

## Globális Konfiguráció

### Globális Alapértelmezések Beállítása
```bash
# Alapértelmezett előfizetés beállítása
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Alapértelmezett hely beállítása
azd config set defaults.location "eastus2"

# Alapértelmezett erőforráscsoport elnevezési konvenció beállítása
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Az összes globális konfiguráció megtekintése
azd config list

# Konfiguráció eltávolítása
azd config unset defaults.location
```

### Gyakori Globális Beállítások
```bash
# Fejlesztési preferenciák
azd config set alpha.enable true                    # Alpha funkciók engedélyezése
azd config set telemetry.enabled false             # Telemetria letiltása
azd config set output.format json                  # Kimeneti formátum beállítása

# Biztonsági beállítások
azd config set auth.useAzureCliCredential true     # Azure CLI használata hitelesítéshez
azd config set tls.insecure false                  # TLS ellenőrzés érvényesítése

# Teljesítmény optimalizálása
azd config set provision.parallelism 5             # Párhuzamos erőforrás létrehozás
azd config set deploy.timeout 30m                  # Telepítési időkorlát
```

## 🏗️ Projekt Konfiguráció

### azure.yaml Felépítése
Az `azure.yaml` fájl az azd projekt központi eleme:

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

### Szolgáltatás Konfigurációs Opciók

#### Host Típusok
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

#### Nyelv-specifikus Beállítások
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

### Környezetek Létrehozása
```bash
# Hozzon létre egy új környezetet
azd env new development

# Hozzon létre meghatározott helyszínnel
azd env new staging --location "westus2"

# Hozzon létre sablonból
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Környezet Konfiguráció
Minden környezet saját konfigurációval rendelkezik `.azure/<env-name>/config.json` fájlban:

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

### Környezeti Változók
```bash
# Állítsa be a környezet-specifikus változókat
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Tekintse meg a környezeti változókat
azd env get-values

# Várható kimenet:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Távolítsa el a környezeti változót
azd env unset DEBUG

# Ellenőrizze az eltávolítást
azd env get-values | grep DEBUG
# (nem kellene semmit visszaadnia)
```

### Környezet Sablonok
Hozz létre `.azure/env.template` fájlt a következetes környezet beállításhoz:
```bash
# Szükséges változók
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Alkalmazás beállítások
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Opcionális fejlesztési beállítások
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Hitelesítési Konfiguráció

### Azure CLI Integráció
```bash
# Használja az Azure CLI hitelesítő adatokat (alapértelmezett)
azd config set auth.useAzureCliCredential true

# Bejelentkezés egy adott bérlővel
az login --tenant <tenant-id>

# Alapértelmezett előfizetés beállítása
az account set --subscription <subscription-id>
```

### Szolgáltatás Principális Hitelesítés
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

### Kezelt Identitás
Azure által hosztolt környezetekhez:
```bash
# Engedélyezze a kezelt identitás hitelesítést
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastruktúra Konfiguráció

### Bicep Paraméterek
Infrastruktúra paraméterek konfigurálása `infra/main.parameters.json` fájlban:
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

### Terraform Konfiguráció
Terraform projektekhez konfigurálás `infra/terraform.tfvars` fájlban:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Telepítési Konfiguráció

### Build Konfiguráció
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

### Docker Konfiguráció
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

## 🔧 Fejlett Konfiguráció

### Egyedi Erőforrás Nevezés
```bash
# Állítsa be az elnevezési konvenciókat
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Hálózati Konfiguráció
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Monitoring Konfiguráció
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

## 🎯 Környezet-specifikus Konfigurációk

### Fejlesztési Környezet
```bash
# .azure/fejlesztés/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Tesztelési Környezet
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Éles Környezet
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Konfiguráció Ellenőrzése

### Konfiguráció Ellenőrzése
```bash
# Ellenőrizze a konfiguráció szintaxisát
azd config validate

# Tesztelje a környezeti változókat
azd env get-values

# Érvényesítse az infrastruktúrát
azd provision --dry-run
```

### Konfigurációs Szkriptek
Hozz létre ellenőrző szkripteket a `scripts/` mappában:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Ellenőrizze a szükséges környezeti változókat
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ellenőrizze az azure.yaml szintaxisát
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Legjobb Gyakorlatok

### 1. Használj Környezeti Változókat
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Szervezd Konfigurációs Fájlokat
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

### 3. Verziókezelési Szempontok
```bash
# .gitignore
.azure/*/config.json         # Környezeti konfigurációk (erőforrás-azonosítókat tartalmaznak)
.azure/*/.env               # Környezeti változók (titkokat tartalmazhatnak)
.env                        # Helyi környezeti fájl
```

### 4. Konfiguráció Dokumentációja
Dokumentáld a konfigurációt `CONFIG.md` fájlban:
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

## 🎯 Gyakorlati Feladatok

### Feladat 1: Több Környezet Konfigurációja (15 perc)

**Cél**: Hozz létre és konfigurálj három környezetet különböző beállításokkal

```bash
# Hozzon létre fejlesztési környezetet
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Hozzon létre tesztelési környezetet
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Hozzon létre éles környezetet
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Ellenőrizze az egyes környezeteket
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Siker Kritériumok:**
- [ ] Három környezet sikeresen létrehozva
- [ ] Minden környezet egyedi konfigurációval rendelkezik
- [ ] Hibamentesen válthatsz a környezetek között
- [ ] `azd env list` megjeleníti mindhárom környezetet

### Feladat 2: Titkos Adatok Kezelése (10 perc)

**Cél**: Gyakorold a biztonságos konfigurációt érzékeny adatokkal

```bash
# Állítsa be a titkokat (nem jelenik meg a kimenetben)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Állítsa be a nem titkos konfigurációt
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Tekintse meg a környezetet (a titkokat el kell rejteni)
azd env get-values

# Ellenőrizze, hogy a titkok tárolva vannak-e
azd env get DB_PASSWORD  # A tényleges értéket kell mutatnia
```

**Siker Kritériumok:**
- [ ] Titkos adatok tárolása anélkül, hogy megjelennének a terminálban
- [ ] `azd env get-values` elrejti a titkos adatokat
- [ ] Az egyedi `azd env get <SECRET_NAME>` visszaadja a tényleges értéket

## Következő Lépések

- [Az első projekted](first-project.md) - Alkalmazd a konfigurációt gyakorlatban
- [Telepítési Útmutató](../deployment/deployment-guide.md) - Használd a konfigurációt telepítéshez
- [Erőforrások Létrehozása](../deployment/provisioning.md) - Éles konfigurációkhoz

## Hivatkozások

- [azd Konfigurációs Referencia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Sémája](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Környezeti Változók](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Fejezet Navigáció:**
- **📚 Kurzus Kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális Fejezet**: 3. fejezet - Konfiguráció és Hitelesítés
- **⬅️ Előző**: [Az első projekted](first-project.md)
- **➡️ Következő Fejezet**: [4. fejezet: Infrastruktúra mint kód](../deployment/deployment-guide.md)
- **Következő Lecke**: [Az első projekted](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->