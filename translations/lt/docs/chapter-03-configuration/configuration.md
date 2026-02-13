# Konfigūracijos vadovas

**Skyrių naršymas:**
- **📚 Kurso pradžia**: [AZD For Beginners](../../README.md)
- **📖 Dabartinis skyrius**: 3 skyrius - Konfigūracija ir autentifikacija
- **⬅️ Ankstesnis**: [Jūsų pirmasis projektas](first-project.md)
- **➡️ Kitas**: [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Kitas skyrius**: [4 skyrius: Infrastruktūra kaip kodas](../chapter-04-infrastructure/deployment-guide.md)

## Įvadas

Šis išsamus vadovas apima visus Azure Developer CLI konfigūracijos aspektus, kad užtikrintų optimalų vystymo ir diegimo darbo eigą. Išmoksite apie konfigūracijos hierarchiją, aplinkų valdymą, autentifikacijos metodus ir pažangius konfigūracijos šablonus, kurie leidžia efektyviai ir saugiai diegti Azure sprendimus.

## Mokymosi tikslai

Pamokos pabaigoje jūs:
- Išmanysite azd konfigūracijos hierarchiją ir suprasite, kaip nustatymai prioritetizuojami
- Efektyviai sukonfigūruosite globalius ir projekto specifinius nustatymus
- Valdysite kelias aplinkas su skirtingomis konfigūracijomis
- Taikysite saugius autentifikacijos ir autorizacijos modelius
- Suprasite pažangius konfigūracijos modelius sudėtingiems scenarijams

## Mokymosi rezultatai

Baigę šią pamoką, galėsite:
- Konfigūruoti azd optimaliems vystymo darbo eigoms
- Nustatyti ir valdyti kelias diegimo aplinkas
- Taikyti saugias konfigūracijos valdymo praktikas
- Spręsti su konfigūracija susijusias problemas
- Pritaikyti azd elgseną organizacijos reikalavimams

Šis išsamus vadovas apima visus Azure Developer CLI konfigūracijos aspektus, kad užtikrintų optimalų vystymo ir diegimo darbo eigą.

## Konfigūracijos hierarchija

azd naudoja hierarchinę konfigūracijos sistemą:
1. **Komandų eilutės parinktys** (aukščiausias prioritetas)
2. **Aplinkos kintamieji**
3. **Vietinė projekto konfigūracija** (`.azd/config.json`)
4. **Globali vartotojo konfigūracija** (`~/.azd/config.json`)
5. **Numatytosios reikšmės** (žemiausias prioritetas)

## Globali konfigūracija

### Numatytųjų globalių reikšmių nustatymas
```bash
# Nustatyti numatytąją prenumeratą
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Nustatyti numatytąją vietą
azd config set defaults.location "eastus2"

# Nustatyti numatytąją išteklių grupės pavadinimų konvenciją
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Peržiūrėti visą globalią konfigūraciją
azd config list

# Pašalinti konfigūraciją
azd config unset defaults.location
```

### Dažniausiai naudojami globalūs nustatymai
```bash
# Kūrimo nustatymai
azd config set alpha.enable true                    # Įgalinti alfa funkcijas
azd config set telemetry.enabled false             # Išjungti telemetriją
azd config set output.format json                  # Nustatyti išvesties formatą

# Saugumo nustatymai
azd config set auth.useAzureCliCredential true     # Naudoti Azure CLI autentifikacijai
azd config set tls.insecure false                  # Užtikrinti TLS patikrinimą

# Našumo derinimas
azd config set provision.parallelism 5             # Lygiagretus išteklių kūrimas
azd config set deploy.timeout 30m                  # Diegimo laiko limitas
```

## 🏗️ Projekto konfigūracija

### azure.yaml struktūra
Failas `azure.yaml` yra jūsų azd projekto širdis:

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

### Paslaugos konfigūracijos parinktys

#### Paleidimo tipai
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

## 🌟 Aplinkos valdymas

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
# (turėtų nieko negrąžinti)
```

### Aplinkos šablonai
Sukurkite `.azure/env.template`, kad užtikrintumėte nuoseklų aplinkos nustatymą:
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

### Azure CLI integracija
```bash
# Naudoti Azure CLI prisijungimo duomenis (numatytieji)
azd config set auth.useAzureCliCredential true

# Prisijungti su konkrečiu nuomininku
az login --tenant <tenant-id>

# Nustatyti numatytąją prenumeratą
az account set --subscription <subscription-id>
```

### Service Principal autentifikacija
Skirta CI/CD vamzdynams:
```bash
# Nustatykite aplinkos kintamuosius
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Arba konfigūruokite tiesiogiai
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Valdomas identitetas
Skirta Azure talpinamoms aplinkoms:
```bash
# Įgalinti valdomos tapatybės autentifikavimą
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastruktūros konfigūracija

### Bicep parametrai
Sukonfigūruokite infrastruktūros parametrus faile `infra/main.parameters.json`:
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
Pavyzdinis `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Pažangi konfigūracija

### Tinkintas išteklių pavadinimas
```bash
# Nustatyti vardų konvencijas
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

### Stebėjimo konfigūracija
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

## 🎯 Aplinkai specifinės konfigūracijos

### Vystymo aplinka
```bash
# .azure/vystymas/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Staging aplinka
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Gamybinė aplinka
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
Sukurkite patikros skriptus kataloge `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Patikrinti reikiamus aplinkos kintamuosius
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

### 3. Versijų valdymo aspektai
```bash
# .gitignore
.azure/*/config.json         # Aplinkos konfigūracijos (gali turėti išteklių identifikatorius)
.azure/*/.env               # Aplinkos kintamieji (gali turėti slaptus duomenis)
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

### Užduotis 1: Kelių aplinkų konfigūracija (15 minučių)

**Tikslas**: Sukurti ir sukonfigūruoti tris aplinkas su skirtingais nustatymais

```bash
# Sukurti vystymo aplinką
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Sukurti tarpinę aplinką
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
- [ ] Sėkmingai sukurtos trys aplinkos
- [ ] Kiekviena aplinka turi unikalią konfigūraciją
- [ ] Galima persijungti tarp aplinkų be klaidų
- [ ] `azd env list` rodo visas tris aplinkas

### Užduotis 2: Slaptų duomenų valdymas (10 minučių)

**Tikslas**: Praktikuoti saugią konfigūraciją su jautriais duomenimis

```bash
# Nustatyti slaptus duomenis (nebus rodomi išvestyje)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Nustatyti neslaptą konfigūraciją
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Peržiūrėti aplinką (slaptieji duomenys turėtų būti užmaskuoti)
azd env get-values

# Patikrinti, ar slaptieji duomenys yra saugomi
azd env get DB_PASSWORD  # Turėtų rodyti tikrąją reikšmę
```

**Sėkmės kriterijai:**
- [ ] Slaptažodžiai saugomi nerodant jų terminale
- [ ] `azd env get-values` rodo užmaskuotus slaptus duomenis
- [ ] Individualus `azd env get <SECRET_NAME>` grąžina tikrąją reikšmę

## Kiti žingsniai

- [Jūsų pirmasis projektas](first-project.md) - Taikykite konfigūraciją praktikoje
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md) - Naudokite konfigūraciją diegimui
- [Resursų teikimas](../chapter-04-infrastructure/provisioning.md) - Paruošta gamybai konfigūracija

## Šaltiniai

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
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus, žmogaus atliktas vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingas interpretacijas, kylančias dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->