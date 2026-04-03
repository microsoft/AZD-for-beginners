# Konfigurációs Útmutató

**Fejezet Navigáció:**
- **📚 Tanfolyam Kezdőoldal**: [AZD Kezdőknek](../../README.md)
- **📖 Jelenlegi Fejezet**: 3. fejezet - Konfiguráció & Hitelesítés
- **⬅️ Előző**: [Az Első Projekted](first-project.md)
- **➡️ Következő**: [Telepítési Útmutató](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Következő Fejezet**: [4. fejezet: Infrastrukturális kód](../chapter-04-infrastructure/deployment-guide.md)

## Bevezetés

Ez az átfogó útmutató lefedi az Azure Developer CLI konfigurálásának minden aspektusát az optimális fejlesztési és telepítési munkafolyamatok érdekében. Megismered a konfiguráció hierarchiáját, a környezetkezelést, a hitelesítési módszereket, valamint azokat az előrehaladott konfigurációs mintákat, amelyek hatékony és biztonságos Azure telepítéseket tesznek lehetővé.

## Tanulási Célok

A lecke végére képes leszel:
- Elsajátítani az azd konfigurációs hierarchiáját, és megérteni a beállítások prioritását
- Hatékonyan konfigurálni globális és projektre szabott beállításokat
- Több különböző konfigurációjú környezetet kezelni
- Biztonságos hitelesítési és engedélyezési mintákat alkalmazni
- Megérteni az összetett helyzetekhez kapcsolódó fejlett konfigurációs mintákat

## Tanulási Eredmények

A lecke elvégzése után képes leszel:
- Konfigurálni az azd-t az optimális fejlesztési munkafolyamatokhoz
- Beállítani és kezelni több telepítési környezetet
- Alkalmazni biztonságos konfigurációkezelési gyakorlatokat
- Hibakeresni a konfigurációval kapcsolatos problémákat
- Testreszabni az azd viselkedését szervezeti igényekhez

Ez az átfogó útmutató lefedi az Azure Developer CLI konfigurálásának minden aspektusát az optimális fejlesztési és telepítési munkafolyamatok érdekében.

## AI Ügynökök Megértése egy azd Projektben

Ha új vagy az AI ügynökök világában, itt egy egyszerű megközelítés arra, hogyan gondolj rájuk az azd környezetében.

### Mi az Ügynök?

Egy ügynök egy olyan szoftveralkalmazás, amely képes kérés fogadására, annak értelmezésére és műveletek végrehajtására – gyakran AI modell hívásával, adatlekérdezéssel vagy más szolgáltatások meghívásával. Egy azd projektben az ügynök csupán egy további **szolgáltatás**, melletted a webes frontend vagy az API backend.

### Hogyan Illeszkednek az Ügynökök az azd Projekt Struktúrájába

Az azd projekt három rétegből áll: **infrastruktúra**, **kód** és **konfiguráció**. Az ügynök ugyanúgy csatlakozik ezekhez a rétegekhez, mint bármely más szolgáltatás:

| Réteg | Mit csinál egy hagyományos alkalmazás esetén? | Mit csinál egy ügynök esetén? |
|-------|----------------------------------------------|-------------------------------|
| **Infrastruktúra** (`infra/`) | Egy webalkalmazás és adatbázis telepítése | AI modell végpont, keresőindex vagy ügynök hoszt telepítése |
| **Kód** (`src/`) | Tartalmazza a frontend és az API forráskódját | Tartalmazza az ügynök logikáját és prompt definíciókat |
| **Konfiguráció** (`azure.yaml`) | Felsorolja a szolgáltatásaidat és azok hosztolási célpontjait | Felsorolja ügynökkel mint szolgáltatással, hivatkozva a kódjára és hosztjára |

### Az `azure.yaml` Szerepe

Nem kell most megjegyezned a szintaxist. Fogalmilag az `azure.yaml` az a fájl, ahol az azd-nek azt mondod: *„Itt vannak az alkalmazásomat alkotó szolgáltatások, és itt találod a kódjukat.”*

Ha a projekted tartalmaz AI ügynököt, az `azure.yaml` egyszerűen felsorolja azt szolgáltatásként. Az azd így tudja biztosítani a megfelelő infrastruktúrát (például Microsoft Foundry Models végpontot vagy Container App-et az ügynök futtatásához), és telepíti az ügynök kódját – ugyanúgy, ahogy a webalkalmazás vagy API esetén.

Ez azt jelenti, hogy nincs alapvetően új tanulnivaló. Ha érted, hogy az azd hogyan kezeli a webszolgáltatást, már érted, hogyan kezeli az ügynököt is.

## Konfigurációs Hierarchia

Az azd egy hierarchikus konfigurációs rendszert használ:
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

# Alapértelmezett erőforráscsoport elnevezési szabvány beállítása
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Az összes globális konfiguráció megtekintése
azd config show

# Egy konfiguráció eltávolítása
azd config unset defaults.location
```

### Gyakori Globális Beállítások
```bash
# Fejlesztési beállítások
azd config set alpha.enable true                    # Alfa funkciók engedélyezése
azd config set telemetry.enabled false             # Telemetria letiltása
azd config set output.format json                  # Kimeneti formátum beállítása

# Biztonsági beállítások
azd config set auth.useAzureCliCredential true     # Azure CLI használata hitelesítéshez
azd config set tls.insecure false                  # TLS ellenőrzés kötelezővé tétele

# Teljesítményhangolás
azd config set provision.parallelism 5             # Párhuzamos erőforrás létrehozás
azd config set deploy.timeout 30m                  # Telepítési időkorlát
```

## 🏗️ Projekt Konfiguráció

### azure.yaml Szerkezete
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

### Szolgáltatás Konfigurációs Lehetőségek

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

#### Nyelvspecifikus Beállítások
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
# Új környezet létrehozása
azd env new development

# Meghatározott helyszínnel létrehozás
azd env new staging --location "westus2"

# Sablon alapján létrehozás
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Környezeti Konfiguráció
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

### Környezeti Változók
```bash
# Környezeti specifikus változók beállítása
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

### Környezeti Sablonok
Hozz létre `.azure/env.template` fájlt az egységes környezet beállításhoz:
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

### Szolgáltatói Fiók Hitelesítés
CI/CD csővezetékekhez:
```bash
# Környezeti változók beállítása
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Vagy közvetlen konfigurálás
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Kezelt Identitás
Azure hosztolt környezetekhez:
```bash
# Kezelt identitás hitelesítés engedélyezése
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastruktúra Konfiguráció

### Bicep Paraméterek
Konfiguráld az infrastruktúra paramétereket az `infra/main.parameters.json` fájlban:
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
Terraform projektek esetén konfiguráld az `infra/terraform.tfvars` fájlt:
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

## 🔧 Haladó Konfiguráció

### Egyedi Erőforrás Nevezések
```bash
# Névkonvenciók beállítása
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Hálózat Konfiguráció
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Monitorozó Konfiguráció
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

## 🎯 Környezetspecifikus Konfigurációk

### Fejlesztői Környezet
```bash
# .azure/fejlesztés/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Teszt Környezet
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

## 🔍 Konfiguráció Érvényesítés

### Konfiguráció Érvényesítése
```bash
# Ellenőrizze a konfiguráció szintaxisát
azd config validate

# Tesztelje a környezeti változókat
azd env get-values

# Érvényesítse az infrastruktúrát
azd provision --dry-run
```

### Konfigurációs Scriptek
Hozz létre érvényesítő scripteket a `scripts/` mappában:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Ellenőrizze a szükséges környezeti változókat
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Az azure.yaml szintaxisának ellenőrzése
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

### 2. Rendezd a Konfigurációs Fájlokat
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

### 3. Verziókövetés Szempontjai
```bash
# .gitignore
.azure/*/config.json         # Környezeti konfigurációk (tartalmazhatnak erőforrásazonosítókat)
.azure/*/.env               # Környezeti változók (tartalmazhatnak titkokat)
.env                        # Helyi környezeti fájl
```

### 4. Konfiguráció Dokumentáció
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

## 🎯 Gyakorlati Feladatok

### 1. Feladat: Többrétegű Konfiguráció (15 perc)

**Cél**: Hozz létre és konfigurálj három különböző beállítású környezetet

```bash
# Fejlesztési környezet létrehozása
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

# Minden környezet ellenőrzése
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Siker Kritériumok:**
- [ ] Három környezet sikeresen létrehozva
- [ ] Mindegyik környezet egyedi konfigurációval rendelkezik
- [ ] Környezetek közötti váltás hiba nélkül működik
- [ ] Az `azd env list` mindhárom környezetet megjeleníti

### 2. Feladat: Titkoskezelés (10 perc)

**Cél**: Gyakorold a biztonságos konfigurálást érzékeny adatkezeléssel

```bash
# Titkok beállítása (nem jelenik meg a kimenetben)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Nem titkos konfiguráció beállítása
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Környezet megtekintése (a titkoknak el kell tűnniük)
azd env get-values

# Ellenőrizze, hogy a titkok tárolva vannak-e
azd env get DB_PASSWORD  # Valódi értéket kell mutatnia
```

**Siker Kritériumok:**
- [ ] Titkok tárolása terminálon nem megjelenítve
- [ ] Az `azd env get-values` elrejtett titkokat mutat
- [ ] Egyedi `azd env get <SECRET_NAME>` valódi értéket ad vissza

## Következő Lépések

- [Az Első Projekted](first-project.md) - Alkalmazd a konfigurációt gyakorlatban
- [Telepítési Útmutató](../chapter-04-infrastructure/deployment-guide.md) - Használd a konfigurációt telepítéshez
- [Erőforrások Létrehozása](../chapter-04-infrastructure/provisioning.md) - Éles konfigurációk

## Hivatkozások

- [azd Konfigurációs Referencia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Sémája](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Környezeti Változók](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Fejezet Navigáció:**
- **📚 Tanfolyam Kezdőoldal**: [AZD Kezdőknek](../../README.md)
- **📖 Jelenlegi Fejezet**: 3. fejezet - Konfiguráció & Hitelesítés
- **⬅️ Előző**: [Az Első Projekted](first-project.md)
- **➡️ Következő Fejezet**: [4. fejezet: Infrastrukturális kód](../chapter-04-infrastructure/deployment-guide.md)
- **Következő Lecke**: [Az Első Projekted](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Nyilatkozat**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordító szolgáltatásával készült. Bár igyekszünk pontosak lenni, kérjük, vegye figyelembe, hogy az automatikus fordítások tartalmazhatnak hibákat vagy pontatlanságokat. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt szakmai, emberi fordítást igénybe venni. Nem vállalunk felelősséget az ebből a fordításból eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->