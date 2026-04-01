# Konfigūracijos Vadovas

**Skyriaus navigacija:**
- **📚 Kursų pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 3 skyrius - Konfigūracija ir Autentifikacija
- **⬅️ Ankstesnis**: [Jūsų pirmasis projektas](first-project.md)
- **➡️ Kitas**: [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Kitas skyrius**: [4 skyrius: Infrastruktūra kaip kodas](../chapter-04-infrastructure/deployment-guide.md)

## Įvadas

Šis išsamus vadovas apima visas Azure Developer CLI konfigūravimo sritis, siekiant optimizuoti kūrimo ir diegimo procesus. Sužinosite apie konfigūracijos hierarchiją, aplinkos valdymą, autentifikacijos būdus bei pažangias konfigūracijos schemas, leidžiančias efektyviai ir saugiai diegti Azure paslaugas.

## Mokymosi tikslai

Pamokos pabaigoje jūs:
- Išmoksite azd konfigūracijos hierarchiją ir suprasite, kaip nustatymai yra prioritetizuojami
- Efektyviai konfigūruosite globalius ir konkrečius projektui nustatymus
- Valdysite kelias aplinkas su skirtingomis konfigūracijomis
- Įgyvendinsite saugos autentifikacijos ir autorizacijos schemas
- Suprasite pažangias konfigūracijos schemas sudėtingiems scenarijams

## Mokymosi rezultatai

Įveikę šią pamoką, galėsite:
- Konfigūruoti azd optimaliems kūrimo procesams
- Nustatyti ir valdyti kelias diegimo aplinkas
- Įgyvendinti saugią konfigūracijos valdymo praktiką
- Spręsti konfigūracijos problemas
- Priderinti azd veikimą pagal organizacijos poreikius

Šis išsamus vadovas apima visas Azure Developer CLI konfigūracijos sritis, siekiant optimizuoti kūrimo ir diegimo procesus.

## AI agentų supratimas azd projekte

Jei esate naujokas AI agentų srityje, štai paprastas būdas juos suvokti azd kontekste.

### Kas yra agentas?

Agentas yra programinės įrangos komponentas, galintis gauti užklausą, ją analizuoti ir imtis veiksmų – dažnai kviečiant AI modelį, ieškant duomenų ar naudodamas kitas paslaugas. azd projekte agentas yra tiesiog dar viena **paslauga**, šalia jūsų žiniatinklio priekinės dalies ar API galinės dalies.

### Kaip agentai įsilieja į azd projekto struktūrą

azd projektas susideda iš trijų sluoksnių: **infrastruktūros**, **kodo** ir **konfigūracijos**. Agentai yra integruojami į šiuos sluoksnius taip pat, kaip ir kitos paslaugos:

| Sluoksnis | Ką jis atlieka tradicinei programai | Ką jis atlieka agentui |
|-------|-------------------------------------|---------------------------|
| **Infrastruktūra** (`infra/`) | Suteikia žiniatinklio programą ir duomenų bazę | Suteikia AI modelio galutinį tašką, paieškos indeksą arba agento kompiuterį |
| **Kodas** (`src/`) | Laiko jūsų priekinės dalies ir API šaltinio kodą | Saugo agento logiką ir užklausų aprašymus |
| **Konfigūracija** (`azure.yaml`) | Nurodo paslaugas ir jų talpinimo tikslus | Nurodo agentą kaip paslaugą, susiedamą su jo kodu ir kompiuteriu |

### `azure.yaml` vaidmuo

Jums nereikia dabar įsiminti šios sintaksės. Koncepcijos prasme, `azure.yaml` yra failas, kuriame sakote azd: *"Čia yra paslaugos, kurios sudaro mano programą, ir čia yra jų kodas."*

Kai jūsų projekte yra AI agentas, `azure.yaml` tiesiog įtraukia tą agentą kaip vieną iš paslaugų. Tuomet azd žino, kad reikia sukurti tinkamą infrastruktūrą (pavyzdžiui, Microsoft Foundry Models galutinį tašką ar konteinerių programą agento talpinimui) ir įdiegti jūsų agento kodą – taip pat, kaip tai daroma su žiniatinklio arba API paslaugomis.

Tai reiškia, kad nėra nieko fundamentaliai naujo. Jei suprantate, kaip azd valdo žiniatinklio paslaugą, jau suprantate, kaip valdo agentą.

## Konfigūracijos hierarchija

azd naudoja hierarchinę konfigūracijos sistemą:
1. **Komandinės eilutės parametrai** (aukščiausias prioritetas)
2. **Aplinkos kintamieji**
3. **Vietinė projekto konfigūracija** (`.azd/config.json`)
4. **Globali vartotojo konfigūracija** (`~/.azd/config.json`)
5. **Numatytosios reikšmės** (žemiausias prioritetas)

## Globali Konfigūracija

### Globalaus numatymo nustatymas
```bash
# Nustatyti numatytąją prenumeratą
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Nustatyti numatytąją vietą
azd config set defaults.location "eastus2"

# Nustatyti numatytąjį išteklių grupių pavadinimo konvenciją
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Peržiūrėti visą globalią konfigūraciją
azd config show

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
azd config set tls.insecure false                  # Priversti TLS patikrinimą

# Veikimo derinimas
azd config set provision.parallelism 5             # Išteklių kūrimas lygiagrečiai
azd config set deploy.timeout 30m                  # Diegimo laiko limitas
```

## 🏗️ Projekto Konfigūracija

### azure.yaml struktūra
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

#### Kalbai būdingi nustatymai
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

# Kurti iš šablono
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Aplinkos konfigūracija
Kiekviena aplinka turi savą konfigūraciją `.azure/<env-name>/config.json`:

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
# API_KEY=secret-api-key
# DEBUG=true

# Pašalinti aplinkos kintamąjį
azd env unset DEBUG

# Patikrinti pašalinimą
azd env get-values | grep DEBUG
# (neturėtų grąžinti nieko)
```

### Aplinkos šablonai
Sukurkite `.azure/env.template` sklandžiam aplinkos nustatymui:
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
# Naudokite Azure CLI kredencialus (numatytoji)
azd config set auth.useAzureCliCredential true

# Prisijunkite su konkrečiu nuomininku
az login --tenant <tenant-id>

# Nustatykite numatytąją prenumeratą
az account set --subscription <subscription-id>
```

### Paslaugų pagrindo autentifikacija
CI/CD procesams:
```bash
# Nustatyti aplinkos kintamuosius
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Arba sukonfigūruoti tiesiogiai
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
Konfigūruokite infrastruktūros parametrus `infra/main.parameters.json` faile:
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
Terraform projektams konfigūracija `infra/terraform.tfvars` faile:
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

## 🔧 Pažangi Konfigūracija

### Pasirinktinių išteklių vardai
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

### Kūrimo aplinka
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Testavimo aplinka
```bash
# .azure/vidutinis/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Gamybos aplinka
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Konfigūracijos patvirtinimas

### Konfigūracijos tikrinimas
```bash
# Patikrinti konfigūracijos sintaksę
azd config validate

# Išbandyti aplinkos kintamuosius
azd env get-values

# Patvirtinti infrastruktūrą
azd provision --dry-run
```

### Konfigūracijos skriptai
Sukurkite patvirtinimo skriptus `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Patikrinti reikiamus aplinkos kintamuosius
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Patvirtinti azure.yaml sintaksę
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

### 3. Versijų valdymo rekomendacijos
```bash
# .gitignore
.azure/*/config.json         # Aplinkos konfigūracijų failai (turi išteklių ID)
.azure/*/.env               # Aplinkos kintamieji (gali turėti slaptažodžių)
.env                        # Vietinis aplinkos failas
```

### 4. Konfigūracijos dokumentacija
Dokumentuokite konfigūraciją faile `CONFIG.md`:
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

## 🎯 Praktiniai užduotys

### Užduotis 1: Daugiaplatformės aplinkos konfigūracija (15 min.)

**Tikslas**: Sukurti ir konfigūruoti tris aplinkas su skirtingais nustatymais

```bash
# Sukurti kūrimo aplinką
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Sukurti testavimo aplinką
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
- [ ] Kiekviena aplinka turi unikalias konfigūracijas
- [ ] Galima perjungti aplinkas be klaidų
- [ ] Komanda `azd env list` rodo visas tris aplinkas

### Užduotis 2: Slaptų duomenų valdymas (10 min.)

**Tikslas**: Praktikuoti saugią konfigūraciją su jautriais duomenimis

```bash
# Nustatyti paslaptis (neatskleidžiamos išvestyje)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Nustatyti nepaslaptinę konfigūraciją
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Peržiūrėti aplinką (paslaptys turėtų būti užklijuotos)
azd env get-values

# Patikrinti, ar saugomos paslaptys
azd env get DB_PASSWORD  # Turėtų rodyti faktinę vertę
```

**Sėkmės kriterijai:**
- [ ] Slapti duomenys saugomi nerodant jų terminale
- [ ] Komanda `azd env get-values` rodo ištrintus slaptažodžius
- [ ] Vienetinis `azd env get <SECRET_NAME>` pateikia tikrą reikšmę

## Kiti žingsniai

- [Jūsų pirmasis projektas](first-project.md) - praktiškai taikyti konfigūraciją
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md) - naudoti konfigūraciją diegimui
- [Išteklių suteikimas](../chapter-04-infrastructure/provisioning.md) - gamybai paruošta konfigūracija

## Nuorodos

- [azd Konfigūracijos nuoroda](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Aplinkos kintamieji](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Skyriaus navigacija:**
- **📚 Kursų pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 3 skyrius - Konfigūracija ir Autentifikacija
- **⬅️ Ankstesnis**: [Jūsų pirmasis projektas](first-project.md)
- **➡️ Kitas skyrius**: [4 skyrius: Infrastruktūra kaip kodas](../chapter-04-infrastructure/deployment-guide.md)
- **Kita pamoka**: [Jūsų pirmasis projektas](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės atsisakymas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turi būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudotis profesionalaus žmogiško vertimo paslaugomis. Mes neatsakome už bet kokius nesusipratimus ar neteisingas interpretacijas, kylančias naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->