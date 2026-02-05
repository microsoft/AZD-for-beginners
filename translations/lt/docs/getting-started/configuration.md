# Konfigūracijos vadovas

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 3 skyrius - Konfigūracija ir autentifikacija
- **⬅️ Ankstesnis**: [Jūsų pirmasis projektas](first-project.md)
- **➡️ Kitas**: [Diegimo vadovas](../deployment/deployment-guide.md)
- **🚀 Kitas skyrius**: [4 skyrius: Infrastruktūra kaip kodas](../deployment/deployment-guide.md)

## Įvadas

Šis išsamus vadovas apima visus Azure Developer CLI konfigūravimo aspektus, siekiant optimizuoti kūrimo ir diegimo darbo eigas. Sužinosite apie konfigūracijos hierarchiją, aplinkos valdymą, autentifikacijos metodus ir pažangius konfigūracijos modelius, kurie leidžia efektyviai ir saugiai diegti Azure.

## Mokymosi tikslai

Šios pamokos pabaigoje jūs:
- Įvaldysite azd konfigūracijos hierarchiją ir suprasite, kaip nustatymai yra prioritetizuojami
- Efektyviai konfigūruosite globalius ir projektui specifinius nustatymus
- Valdysite kelias aplinkas su skirtingomis konfigūracijomis
- Įgyvendinsite saugius autentifikacijos ir autorizacijos modelius
- Suprasite pažangius konfigūracijos modelius sudėtingiems scenarijams

## Mokymosi rezultatai

Baigę šią pamoką, galėsite:
- Konfigūruoti azd optimalioms kūrimo darbo eigoms
- Nustatyti ir valdyti kelias diegimo aplinkas
- Įgyvendinti saugius konfigūracijos valdymo metodus
- Spręsti su konfigūracija susijusias problemas
- Pritaikyti azd elgseną specifiniams organizacijos poreikiams

Šis išsamus vadovas apima visus Azure Developer CLI konfigūravimo aspektus, siekiant optimizuoti kūrimo ir diegimo darbo eigas.

## Konfigūracijos hierarchija

azd naudoja hierarchinę konfigūracijos sistemą:
1. **Komandinės eilutės vėliavėlės** (aukščiausias prioritetas)
2. **Aplinkos kintamieji**
3. **Vietinė projekto konfigūracija** (`.azd/config.json`)
4. **Globali vartotojo konfigūracija** (`~/.azd/config.json`)
5. **Numatytosios reikšmės** (žemiausias prioritetas)

## Globali konfigūracija

### Numatytųjų globalių nustatymų nustatymas
```bash
# Nustatyti numatytąjį prenumeratą
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Nustatyti numatytąją vietą
azd config set defaults.location "eastus2"

# Nustatyti numatytąją išteklių grupės pavadinimo konvenciją
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Peržiūrėti visą globalią konfigūraciją
azd config list

# Pašalinti konfigūraciją
azd config unset defaults.location
```

### Dažni globalūs nustatymai
```bash
# Plėtros nuostatos
azd config set alpha.enable true                    # Įjungti alfa funkcijas
azd config set telemetry.enabled false             # Išjungti telemetriją
azd config set output.format json                  # Nustatyti išvesties formatą

# Saugumo nustatymai
azd config set auth.useAzureCliCredential true     # Naudoti Azure CLI autentifikacijai
azd config set tls.insecure false                  # Priversti TLS patikrinimą

# Našumo optimizavimas
azd config set provision.parallelism 5             # Lygiagretus išteklių kūrimas
azd config set deploy.timeout 30m                  # Diegimo laiko limitas
```

## 🏗️ Projekto konfigūracija

### azure.yaml struktūra
`azure.yaml` failas yra jūsų azd projekto pagrindas:

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

#### Host tipai
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
Kiekviena aplinka turi savo konfigūraciją `.azure/<env-name>/config.json`:

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

# Tikėtinas rezultatas:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=slaptas-api-raktas
# DEBUG=true

# Pašalinti aplinkos kintamąjį
azd env unset DEBUG

# Patikrinti pašalinimą
azd env get-values | grep DEBUG
# (turėtų nieko nerodyti)
```

### Aplinkos šablonai
Sukurkite `.azure/env.template`, kad užtikrintumėte nuoseklų aplinkos nustatymą:
```bash
# Reikalingi kintamieji
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
# Naudokite Azure CLI kredencialus (numatytasis)
azd config set auth.useAzureCliCredential true

# Prisijunkite su konkrečiu nuomininku
az login --tenant <tenant-id>

# Nustatykite numatytąją prenumeratą
az account set --subscription <subscription-id>
```

### Paslaugų principo autentifikacija
CI/CD procesams:
```bash
# Nustatyti aplinkos kintamuosius
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Arba konfigūruoti tiesiogiai
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Valdoma tapatybė
Azure talpinamoms aplinkoms:
```bash
# Įgalinti valdomos tapatybės autentifikavimą
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastruktūros konfigūracija

### Bicep parametrai
Konfigūruokite infrastruktūros parametrus `infra/main.parameters.json`:
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
Terraform projektams konfigūruokite `infra/terraform.tfvars`:
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

### Tinkintų resursų pavadinimų nustatymas
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

### Kūrimo aplinka
```bash
# .azure/vystymas/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Testavimo aplinka
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Produkcijos aplinka
```bash
# .azure/produkcija/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Konfigūracijos validacija

### Konfigūracijos validavimas
```bash
# Patikrinkite konfigūracijos sintaksę
azd config validate

# Išbandykite aplinkos kintamuosius
azd env get-values

# Patvirtinkite infrastruktūrą
azd provision --dry-run
```

### Konfigūracijos skriptai
Sukurkite validavimo skriptus `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Patikrinkite reikalingus aplinkos kintamuosius
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Patikrinkite azure.yaml sintaksę
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

### 2. Organizuokite konfigūracijos failus
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

### 3. Versijų kontrolės svarstymai
```bash
# .gitignore
.azure/*/config.json         # Aplinkos konfigūracijos (turi išteklių ID)
.azure/*/.env               # Aplinkos kintamieji (gali turėti slaptažodžių)
.env                        # Vietinis aplinkos failas
```

### 4. Konfigūracijos dokumentacija
Dokumentuokite savo konfigūraciją `CONFIG.md`:
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

## 🎯 Praktiniai pratimai

### Pratimas 1: Daugiaaplinkos konfigūracija (15 minučių)

**Tikslas**: Sukurti ir konfigūruoti tris aplinkas su skirtingais nustatymais

```bash
# Sukurti vystymo aplinką
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Sukurti testavimo aplinką
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Sukurti gamybos aplinką
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
- [ ] Trys aplinkos sėkmingai sukurtos
- [ ] Kiekviena aplinka turi unikalią konfigūraciją
- [ ] Galima perjungti aplinkas be klaidų
- [ ] `azd env list` rodo visas tris aplinkas

### Pratimas 2: Slaptų duomenų valdymas (10 minučių)

**Tikslas**: Praktikuoti saugią konfigūraciją su jautriais duomenimis

```bash
# Nustatyti paslaptis (nerodoma išvestyje)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Nustatyti nekonfidencialią konfigūraciją
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Peržiūrėti aplinką (paslaptys turėtų būti paslėptos)
azd env get-values

# Patikrinti, ar paslaptys yra saugomos
azd env get DB_PASSWORD  # Turėtų rodyti tikrąją vertę
```

**Sėkmės kriterijai:**
- [ ] Slaptos informacijos saugojimas be rodymo terminale
- [ ] `azd env get-values` rodo užmaskuotus slaptus duomenis
- [ ] Individualus `azd env get <SECRET_NAME>` grąžina tikrąją reikšmę

## Kiti žingsniai

- [Jūsų pirmasis projektas](first-project.md) - Konfigūracijos taikymas praktikoje
- [Diegimo vadovas](../deployment/deployment-guide.md) - Konfigūracijos naudojimas diegimui
- [Resursų paruošimas](../deployment/provisioning.md) - Produkcijai paruoštos konfigūracijos

## Nuorodos

- [azd konfigūracijos nuoroda](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Aplinkos kintamieji](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 3 skyrius - Konfigūracija ir autentifikacija
- **⬅️ Ankstesnis**: [Jūsų pirmasis projektas](first-project.md)
- **➡️ Kitas skyrius**: [4 skyrius: Infrastruktūra kaip kodas](../deployment/deployment-guide.md)
- **Kita pamoka**: [Jūsų pirmasis projektas](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingą interpretaciją, atsiradusią naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->