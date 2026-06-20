# Konfigūracijos vadovas

**Skyrių naršymas:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 3 skyrius - Konfigūracija ir autentifikacija
- **⬅️ Ankstesnis**: [Jūsų pirmasis projektas](first-project.md)
- **➡️ Kitas**: [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Kitas skyrius**: [4 skyrius: Infrastruktūra kaip kodas](../chapter-04-infrastructure/deployment-guide.md)

## Įvadas

Šis išsamus vadovas apima visus aspektus, susijusius su Azure Developer CLI konfigūravimu siekiant optimizuoti kūrimo ir diegimo darbo eigos. Sužinosite apie konfigūracijos hierarchiją, aplinkų valdymą, autentifikavimo metodus ir pažangius konfigūracijos šablonus, leidžiančius efektyviai ir saugiai diegti į Azure.

## Mokymosi tikslai

Pamokos pabaigoje jūs:
- Išmoksite azd konfigūracijos hierarchiją ir suprasite, kaip nustatymai yra prioritizuojami
- Efektyviai sukonfigūruosite globalius ir projektui specifinius nustatymus
- Valdysite kelias aplinkas su skirtingomis konfigūracijomis
- Įgyvendinsite saugius autentifikavimo ir autorizavimo šablonus
- Suprasite pažangius konfigūracijos modelius sudėtingoms situacijoms

## Mokymosi rezultatai

Baigę šią pamoką galėsite:
- Sukonfigūruoti azd optimaliam kūrimo darbo srautui
- Nustatyti ir valdyti kelias diegimo aplinkas
- Įdiegti saugias konfigūracijos valdymo praktikas
- Spręsti su konfigūracija susijusias problemas
- Priderinti azd elgseną pagal konkrečius organizacijos reikalavimus

Šis išsamus vadovas apima visus aspektus, susijusius su Azure Developer CLI konfigūravimu siekiant optimizuoti kūrimo ir diegimo darbo eigos.

## AI agentų supratimas azd projekte

Jei esate naujas dėl AI agentų, štai paprastas paaiškinimas, kaip juos suprasti azd pasaulyje.

### Kas yra agentas?

Agentas yra programinė įranga, kuri gali priimti užklausą, apmąstyti ją ir atlikti veiksmus – dažnai kviesdama AI modelį, ieškodama duomenų arba kviesdama kitas paslaugas. Azd projekte agentas yra tiesiog kita **paslauga** kartu su jūsų žiniatinklio priekiu ar API užpakaliu.

### Kaip agentai dera į azd projekto struktūrą

azd projektą sudaro trys sluoksniai: **infrastruktūra**, **kodas** ir **konfigūracija**. Agentai prisijungia prie šių sluoksnių taip pat, kaip ir kitos paslaugos:

| Sluoksnis | Ką tai daro tradicinei programai | Ką tai daro agentui |
|-------|-------------------------------------|---------------------------|
| **Infrastruktūra** (`infra/`) | Sukuria žiniatinklio programą ir duomenų bazę | Sukuria AI modelio galinį tašką, paieškos indeksą arba agento talpyklą |
| **Kodas** (`src/`) | Sudėtyje yra jūsų priekinės dalies ir API šaltinio kodas | Sudėtyje yra agento logika ir promptų apibrėžimai |
| **Konfigūracija** (`azure.yaml`) | Išvardina jūsų paslaugas ir jų talpinimo tikslus | Išvardina jūsų agentą kaip paslaugą, nurodant jo kodą ir talpą |

### `azure.yaml` vaidmuo

Jums dabar nereikia įsiminti sintaksės. Konceptualiai `azure.yaml` yra failas, kuriame pasakote azd: "Štai paslaugos, sudarančios mano programą, ir čia yra jų kodas."

Kai jūsų projekte yra AI agentas, `azure.yaml` tiesiog nurodo tą agentą kaip vieną iš paslaugų. azd tada žino, kokią infrastruktūrą suteikti (pvz., Microsoft Foundry Models galinį tašką arba Container App agento talpinimui) ir išdėsto jūsų agento kodą – taip pat, kaip tai darytų su žiniatinklio programa ar API.

Tai reiškia, kad nėra nieko esminio naujo mokytis. Jei suprantate, kaip azd valdo žiniatinklio paslaugą, jau suprantate, kaip jis valdo agentą.

## Konfigūracijos hierarchija

azd naudoja hierarchinę konfigūracijos sistemą:
1. **Komandinės eilutės parametrai** (aukščiausias prioritetas)
2. **Aplinkos kintamieji**
3. **Vietinė projekto konfigūracija** (`.azd/config.json`)
4. **Globali vartotojo konfigūracija** (`~/.azd/config.json`)
5. **Numatytosios reikšmės** (žemiausias prioritetas)

## Globali konfigūracija

### Globalių numatytųjų nustatymų nustatymas
```bash
# Nustatyti numatytąją prenumeratą
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Nustatyti numatytąją vietą
azd config set defaults.location "eastus2"

# Nustatyti numatytąją išteklių grupės pavadinimų konvenciją
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Peržiūrėti visą globalią konfigūraciją
azd config show

# Pašalinti konfigūraciją
azd config unset defaults.location
```

### Įprasti globalūs nustatymai
```bash
# Plėtros nuostatos
azd config set alpha.enable true                    # Įjungti alfa funkcijas
azd config set telemetry.enabled false             # Išjungti telemetriją
azd config set output.format json                  # Nustatyti išvesties formatą

# Saugumo nustatymai
azd config set auth.useAzureCliCredential true     # Naudoti Azure CLI autentifikacijai
azd config set tls.insecure false                  # Reikalauti TLS patikros

# Našumo derinimas
azd config set provision.parallelism 5             # Paralelinis išteklių kūrimas
azd config set deploy.timeout 30m                  # Diegimo laiko limitas
```

## 🏗️ Projekto konfigūracija

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

# Sukurti konkrečioje vietoje
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
# Nustatyti aplinkai būdingus kintamuosius
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Peržiūrėti aplinkos kintamuosius
azd env get-values

# Tikėtina išvestis:
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
Sukurkite `.azure/env.template`, kad užtikrintumėte nuoseklų aplinkos nustatymą:
```bash
# Būtini kintamieji
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

### Aplinkų dalijimasis tarp komandos

Kai projekte dirba daugiau nei vienas asmuo, turite susitarti dėl to, **kas keliauja su repozitorija ir kas lieka vietinis**. azd laiko kiekvieną aplinką po `.azure/` aplanku, ir ne viską reikėtų įtraukti į versijų kontrolę.

**Ką sudaro `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**Ką įtraukti į `.gitignore`.** azd numatytasis `.gitignore` jau neįtraukia `.azure/`. Laikykite taip — `.env` failai gali turėti paslaptis, o išteklių ID yra susiję su tuo, kas juos sukūrė. Kiekvienas komandos narys sukuria **savo** aplinką lokaliai:

```bash
# Kiekvienas kūrėjas tai paleidžia vieną kartą, kad gautų savo izoliuotą aplinką
azd env new dev-alice
azd up
```

**Aplinkų perjungimas.** Kūrėjas, valdantis kelias aplinkas, pasirenka aktyvią prieš vykdant komandas:

```bash
azd env list                 # pamatyti visas vietines aplinkas ir kuri iš jų yra numatytoji
azd env select staging       # padaryti 'staging' aktyvia aplinka
azd env get-values           # patvirtinkite, kad esate nukreiptas į tinkamą aplinką
```

**Neslaptinių numatytųjų reikšmių pateikimas komandai.** Įsipareigokite šabloną (pvz., `.azure/env.template` aukščiau), kad visi žinotų, kuriuos kintamuosius nustatyti — bet niekada neįsipareigokite užpildytų reikšmių. Nauji komandos nariai nukopijuoja šabloną ir užpildo savo.

**Aplinkos CI/CD.** Darbo eigos neperskaito jūsų vietinio `.azure/` aplanko. Vietoje to pateikite aplinkos reikšmes kaip pipeline kintamuosius / slaptus duomenis, o azd jas nuskaito iš proceso aplinkos:

```bash
# CI metu azd skaito juos iš aplinkos, o ne iš .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Bendroji taisyklė:** infrastruktūros kodas (`infra/`, `azure.yaml`) dalijamas Git; aplinkos *būsena ir paslaptys* (`.azure/`) yra kiekvienam kūrėjui ir kiekvienai pipeline. `azd pipeline config` automatiškai nustato pipeline kintamuosius jums.

## 🔐 Autentifikacijos konfigūracija

### Azure CLI integracija
```bash
# Naudokite Azure CLI prisijungimo duomenis (numatytieji)
azd config set auth.useAzureCliCredential true

# Prisijunkite su konkrečiu nuomininku
az login --tenant <tenant-id>

# Nustatykite numatytąją prenumeratą
az account set --subscription <subscription-id>
```

### Service Principal autentifikacija
CI/CD pipeline'ams:
```bash
# Nustatykite aplinkos kintamuosius
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Arba sukonfigūruokite tiesiogiai
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Valdomas identitetas
Azure talpinamoms aplinkoms:
```bash
# Įgalinti valdomo identiteto autentifikaciją
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
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Parengimo aplinka
```bash
# .azure/parengimo/.env
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

### Konfigūracijos patikrinimas
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

### 3. Versijų valdymo svarstymai
```bash
# .gitignore
.azure/*/config.json         # Aplinkos konfigūracijos (turi išteklių ID)
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
- [ ] Trys aplinkos sėkmingai sukurtos
- [ ] Kiekviena aplinka turi unikalią konfigūraciją
- [ ] Galima perjungti aplinkas be klaidų
- [ ] `azd env list` rodo visas tris aplinkas

### Užduotis 2: Slaptųjų reikšmių valdymas (10 minučių)

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
- [ ] Slaptažodžiai saugomi neparodomi terminale
- [ ] `azd env get-values` rodo užmaskuotus slaptažodžius
- [ ] Individualus `azd env get <SECRET_NAME>` grąžina faktinę reikšmę

## Tolimesni veiksmai

- [Jūsų pirmasis projektas](first-project.md) - Taikyti konfigūraciją praktikoje
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md) - Naudoti konfigūraciją diegimui
- [Išteklių suteikimas](../chapter-04-infrastructure/provisioning.md) - Produkcijai paruoštos konfigūracijos

## Nuorodos

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml schemos](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Aplinkos kintamieji](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Skyrių naršymas:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 3 skyrius - Konfigūracija ir autentifikacija
- **⬅️ Ankstesnis**: [Jūsų pirmasis projektas](first-project.md)
- **➡️ Kitas skyrius**: [4 skyrius: Infrastruktūra kaip kodas](../chapter-04-infrastructure/deployment-guide.md)
- **Kita pamoka**: [Jūsų pirmasis projektas](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->