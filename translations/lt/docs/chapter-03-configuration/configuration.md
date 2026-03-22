# Konfigūracijos vadovas

**Skyrių naršymas:**
- **📚 Kurso pradžia**: [AZD For Beginners](../../README.md)
- **📖 Dabartinis skyrius**: 3 skyrius - Konfigūracija ir autentifikacija
- **⬅️ Ankstesnis**: [Jūsų pirmasis projektas](first-project.md)
- **➡️ Kitas**: [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Kitas skyrius**: [4 skyrius: Infrastruktūra kaip kodas](../chapter-04-infrastructure/deployment-guide.md)

## Įvadas

Šis išsamus vadovas apima visus aspektus konfigūruojant Azure Developer CLI optimaliems vystymo ir diegimo darbams. Išmoksite apie konfigūracijos hierarchiją, aplinkų valdymą, autentifikacijos metodus ir pažangias konfigūracijos schemas, kurios leidžia efektyviai ir saugiai diegti į Azure.

## Mokymosi tikslai

Baigę šią pamoką, jūs:
- Įsisavinsite azd konfigūracijos hierarchiją ir suprasite, kaip nustatymai prioritetizuojami
- Efektyviai sukonfigūruosite globalius ir projekto specifinius nustatymus
- Valdysite kelias aplinkas su skirtingomis konfigūracijomis
- Įgyvendinsite saugius autentifikacijos ir autorizacijos modelius
- Suprasite pažangias konfigūracijos schemas sudėtingiems scenarijams

## Mokymosi rezultatai

Baigę šią pamoką, galėsite:
- Sukonfigūruoti azd optimaliems vystymo darbams
- Paruošti ir valdyti kelias diegimo aplinkas
- Įgyvendinti saugią konfigūracijos valdymo praktiką
- Spręsti su konfigūracija susijusias problemas
- Pritaikyti azd elgseną specifiniams organizacijos reikalavimams

Šis išsamus vadovas apima visus aspektus konfigūruojant Azure Developer CLI optimaliems vystymo ir diegimo darbams.

## AI agentų supratimas azd projekte

Jei esate naujas AI agentų srityje, štai paprastas būdas apie juos pagalvoti azd pasaulyje.

### Kas yra agentas?

Agentas yra programinės įrangos dalis, kuri gali gauti užklausą, ją apmąstyti ir imtis veiksmų — dažnai kviesdama AI modelį, ieškodama duomenų arba kviesdama kitas paslaugas. Azd projekte agentas yra tiesiog dar viena **paslauga** šalia jūsų interneto priekinės dalies arba API backend'o.

### Kaip agentai dera į azd projekto struktūrą

Azd projektą sudaro trys sluoksniai: **infrastruktūra**, **kodas** ir **konfigūracija**. Agentai integruojami į šiuos sluoksnius taip pat, kaip ir bet kuri kita paslauga:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Paruošia žiniatinklio programą ir duomenų bazę | Paruošia AI modelio endpoint'ą, paieškos indeksą arba agento talpyklą |
| **Code** (`src/`) | Talpina jūsų priekinės dalies ir API šaltinio kodą | Talpina jūsų agento logiką ir promptų apibrėžimus |
| **Configuration** (`azure.yaml`) | Išvardija jūsų paslaugas ir jų talpinimo tikslus | Išvardija jūsų agentą kaip paslaugą, nukreipiant į jo kodą ir talpinimo vietą |

### `azure.yaml` vaidmuo

Jums dabar nereikia įsiminti sintaksės. Koncepciniu požiūriu `azure.yaml` yra failas, kuriame sakote azd: *"Štai paslaugos, kurios sudaro mano programą, ir čia rasite jų kodą."*

Kai jūsų projekte yra AI agentas, `azure.yaml` tiesiog išrašo tą agentą kaip vieną iš paslaugų. Azd tada žino, kad reikia paruošti tinkamą infrastruktūrą (pvz., Microsoft Foundry Models endpoint arba Container App agentui talpinti) ir įdiegti jūsų agento kodą — taip pat, kaip darytų su žiniatinklio programa ar API.

Tai reiškia, kad nėra nieko fundamentaliai naujo mokytis. Jei suprantate, kaip azd valdo žiniatinklio paslaugą, jūs jau suprantate, kaip jis valdo agentą.

## Konfigūracijos hierarchija

azd naudoja hierarchinę konfigūracijos sistemą:
1. **Komandinės eilutės parametrai** (didžiausias prioritetas)
2. **Aplinkos kintamieji**
3. **Vietinė projekto konfigūracija** (`.azd/config.json`)
4. **Globali vartotojo konfigūracija** (`~/.azd/config.json`)
5. **Numatytosios reikšmės** (mažiausias prioritetas)

## Globali konfigūracija

### Globalių numatytųjų reikšmių nustatymas
```bash
# Nustatyti numatytąją prenumeratą
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Nustatyti numatytąją vietą
azd config set defaults.location "eastus2"

# Nustatyti numatytąją išteklių grupių pavadinimų konvenciją
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Peržiūrėti visą globalią konfigūraciją
azd config list

# Pašalinti konfigūraciją
azd config unset defaults.location
```

### Bendri globalūs nustatymai
```bash
# Vystymo nuostatos
azd config set alpha.enable true                    # Įjungti alfa funkcijas
azd config set telemetry.enabled false             # Išjungti telemetriją
azd config set output.format json                  # Nustatyti išvesties formatą

# Saugumo nustatymai
azd config set auth.useAzureCliCredential true     # Naudoti Azure CLI autentifikacijai
azd config set tls.insecure false                  # Priversti TLS patikrinimą

# Našumo derinimas
azd config set provision.parallelism 5             # Lygiagretus resursų kūrimas
azd config set deploy.timeout 30m                  # Diegimo laiko limitas
```

## 🏗️ Projekto konfigūracija

### `azure.yaml` struktūra
`azure.yaml` failas yra jūsų azd projekto širdis:

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

### Paslaugų konfigūracijos parinktys

#### Talpinimo tipai
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

#### Kalbai specifiniai nustatymai
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

## 🌟 Aplinkų valdymas

### Aplinkų kūrimas
```bash
# Sukurti naują aplinką
azd env new development

# Sukurti su konkrečia vieta
azd env new staging --location "westus2"

# Sukurti iš šablono
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Aplinkos konfigūracija
Kiekviena aplinka turi savo konfigūraciją faile `.azure/<env-name>/config.json`:

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

### Aplinkos kintamieji
```bash
# Nustatyti aplinkai specifinius kintamuosius
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Peržiūrėti aplinkos kintamuosius
azd env get-values

# Tikėtinas išvestis:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Pašalinti aplinkos kintamąjį
azd env unset DEBUG

# Patikrinti pašalinimą
azd env get-values | grep DEBUG
# (neturėtų nieko grąžinti)
```

### Aplinkos šablonai
Sukurti `.azure/env.template`, kad užtikrintumėte nuoseklią aplinkos parengtį:
```bash
# Privalomi kintamieji
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Programos nustatymai
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Pasirenkami kūrimo nustatymai
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Autentifikacijos konfigūracija

### Integracija su Azure CLI
```bash
# Naudoti Azure CLI kredencialus (numatytuosius)
azd config set auth.useAzureCliCredential true

# Prisijungti su konkrečiu nuomininku
az login --tenant <tenant-id>

# Nustatyti numatytąją prenumeratą
az account set --subscription <subscription-id>
```

### Service Principal autentifikacija
CI/CD procesams:
```bash
# Nustatykite aplinkos kintamuosius
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Arba konfigūruokite tiesiogiai
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Valdomoji tapatybė
Azure talpinamoms aplinkoms:
```bash
# Įgalinti valdomos tapatybės autentifikavimą
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastruktūros konfigūracija

### Bicep parametrai
Konfigūruokite infrastruktūros parametrus faile `infra/main.parameters.json`:
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

### Terraform konfigūracija
Terraform projektams konfigūruokite faile `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Diegimo konfigūracija

### Kūrimo konfigūracija
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

### Docker konfigūracija
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
Pavyzdys `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Pažangi konfigūracija

### Pasirinktinis išteklių pavadinimas
```bash
# Nustatyti pavadinimų konvencijas
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Tinklo konfigūracija
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Stebėsenos konfigūracija
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

## 🎯 Aplinkai būdingos konfigūracijos

### Vystymo aplinka
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Parengiamoji (staging) aplinka
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Produkcinė aplinka
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Konfigūracijos tikrinimas

### Patikrinti konfigūraciją
```bash
# Patikrinti konfigūracijos sintaksę
azd config validate

# Patikrinti aplinkos kintamuosius
azd env get-values

# Patikrinti infrastruktūrą
azd provision --dry-run
```

### Konfigūracijos skriptai
Sukurti tikrinimo skriptus kataloge `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Patikrinti būtinus aplinkos kintamuosius
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Patikrinti azure.yaml sintaksę
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Geriausios praktikos

### 1. Naudokite aplinkos kintamuosius
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Tvarkykite konfigūracijos failus
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

### 3. Versijų valdymo svarstymai
```bash
# .gitignore
.azure/*/config.json         # Aplinkos konfigūracijos (turi išteklių ID)
.azure/*/.env               # Aplinkos kintamieji (gali turėti slaptą informaciją)
.env                        # Vietinis aplinkos failas
```

### 4. Konfigūracijos dokumentacija
Dokumentuokite savo konfigūraciją faile `CONFIG.md`:
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

## 🎯 Praktinės užduotys

### Užduotis 1: Daugiaaplinkių konfigūracija (15 minučių)

**Tikslas**: Sukurti ir sukonfigūruoti tris aplinkas su skirtingais nustatymais

```bash
# Sukurti vystymo aplinką
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Sukurti parengiamąją aplinką
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Sukurti gamybinę aplinką
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Patikrinti kiekvieną aplinką
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Sėkmės kriterijai:**
- [ ] Tris aplinkas sėkmingai sukurta
- [ ] Kiekviena aplinka turi unikalią konfigūraciją
- [ ] Galima perjungti tarp aplinkų be klaidų
- [ ] `azd env list` rodo visas tris aplinkas

### Užduotis 2: Slaptų reikšmių valdymas (10 minučių)

**Tikslas**: Praktikuoti saugią konfigūraciją su jautriais duomenimis

```bash
# Nustatyti slaptuosius duomenis (neparodoma išvestyje)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Nustatyti neslaptą konfigūraciją
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Peržiūrėti aplinką (slapti duomenys turėtų būti užtušuoti)
azd env get-values

# Patikrinti, ar slaptieji duomenys yra saugomi
azd env get DB_PASSWORD  # Turėtų parodyti tikrąją reikšmę
```

**Sėkmės kriterijai:**
- [ ] Slaptos reikšmės saugomos neparodant terminale
- [ ] `azd env get-values` parodo užmaskuotas slaptas reikšmes
- [ ] Atskirai `azd env get <SECRET_NAME>` gauna faktinę reikšmę

## Kiti žingsniai

- [Jūsų pirmasis projektas](first-project.md) - Taikyti konfigūraciją praktikoje
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md) - Naudoti konfigūraciją diegimui
- [Išteklių paruošimas](../chapter-04-infrastructure/provisioning.md) - Gamybai pasiruošusios konfigūracijos

## Nuorodos

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Skyrių naršymas:**
- **📚 Kurso pradžia**: [AZD For Beginners](../../README.md)
- **📖 Dabartinis skyrius**: 3 skyrius - Konfigūracija ir autentifikacija
- **⬅️ Ankstesnis**: [Jūsų pirmasis projektas](first-project.md)
- **➡️ Kitas skyrius**: [4 skyrius: Infrastruktūra kaip kodas](../chapter-04-infrastructure/deployment-guide.md)
- **Kita pamoka**: [Jūsų pirmasis projektas](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už bet kokius nesusipratimus ar neteisingas interpretacijas, kylančias dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->