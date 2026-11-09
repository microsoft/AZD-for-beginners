# Konfigūracijos Vadovas

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 3 skyrius - Konfigūracija ir autentifikacija
- **⬅️ Ankstesnis**: [Jūsų pirmas projektas](../chapter-01-foundation/first-project.md)
- **➡️ Kitas**: [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Kitas skyrius**: [4 skyrius: Infrastruktūra kaip kodas](../chapter-04-infrastructure/deployment-guide.md)

## Įvadas

> Peržiūrėta pagal `azd 1.37.2` (2026 m. lapkritis). Bash komandos daro prielaidą, kad azd projektas yra inicijuotas. Nors YAML/Bicep fragmentai nėra pilni failai, jie yra skirti įtraukti į atitinkamus projekto failus, o ne būti atskirais vykdomais projektais.

Ši išsami instrukcija apima visus Azure Developer CLI konfigūravimo aspektus optimaliai programavimo ir diegimo eigai. Sužinosite apie konfigūracijos hierarchiją, aplinkų valdymą, autentifikavimo metodus ir pažangius konfigūracijos šablonus, kurie leidžia efektyviai ir saugiai vykdyti Azure diegimus.

## Mokymosi tikslai

Baigę šią pamoką, Jūs:
- Įvaldysite azd konfigūracijos hierarchiją ir suprasite, kaip nustatymai teikiami prioriteto tvarka
- Veiksmingai sukonfigūruosite globalius ir projekto specifinius nustatymus
- Valdysite kelias aplinkas su skirtingomis konfigūracijomis
- Įgyvendinsite saugius autentifikavimo ir autorizacijos šablonus
- Suprasite pažangius konfigūracijos šablonus sudėtingoms situacijoms

## Mokymosi rezultatai

Baigę pamoką, sugebėsite:
- Suvienodinti azd konfiguraciją optimaliai kūrimo eigai
- Sukurti ir valdyti kelias diegimo aplinkas
- Įgyvendinti saugią konfigūracijos valdymo praktiką
- Spręsti su konfigūracija susijusias problemas
- Priderinti azd veikimą prie specifinių organizacijos poreikių

Ši išsami instrukcija apima visus Azure Developer CLI konfigūravimo aspektus optimaliai programavimo ir diegimo eigai.

## AI agentų supratimas azd projekte

Jei AI agentai jums naujiena, štai paprastas būdas juos suprasti azd kontekste.

### Kas yra agentas?

Agentas yra programinės įrangos komponentas, kuris gali priimti užklausą, ją analizuoti ir imtis veiksmų – dažnai kviečiant AI modelį, ieškant duomenų ar kviečiant kitas paslaugas. azd projekte agentas yra tiesiog dar viena **paslauga** šalia jūsų svetainės frontendo ar API backend'o.

### Kaip agentai integruojasi į azd projekto struktūrą

azd projektas susideda iš trijų sluoksnių: **infrastruktūra**, **kodas** ir **konfigūracija**. Agentai prijungiami prie šių sluoksnių taip pat, kaip ir bet kuri kita paslauga:

| Sluoksnis | Ką jis daro tradicinėje programėlėje | Ką jis daro agentui |
|-------|-------------------------------------|---------------------------|
| **Infrastruktūra** (`infra/`) | Teikia interneto programėlę ir duomenų bazę | Teikia AI modelio galinį tašką, paieškos indeksą ar agento talpinimą |
| **Kodas** (`src/`) | Turi jūsų frontend ir API šaltinio kodą | Turi jūsų agento logiką ir nurodymų aprašymus |
| **Konfigūracija** (`azure.yaml`) | Nurodo jūsų paslaugas ir jų talpinimo tikslinius taškus | Nurodo jūsų agentą kaip paslaugą, nurodydama jo kodą ir talpinimą |

### `azure.yaml` vaidmuo

Neturite dabar įsiminti sintaksės. Konceptualiai, `azure.yaml` yra failas, kuriame sakote azd: *„Štai paslaugos, kurios sudaro mano programėlę, ir čia yra jų kodas.“*

Kai jūsų projekte yra AI agentas, `azure.yaml` tiesiog įrašo jį kaip vieną iš paslaugų. Tada azd žino, kad reikia paruošti tinkamą infrastruktūrą (pvz., Microsoft Foundry Models galinį tašką ar konteinerių programėlę agento talpinimui) ir įdiegti jūsų agento kodą – taip pat, kaip tai darytų su interneto programa ar API.

Tai reiškia, kad nėra fundamentalių naujovių. Jei suprantate, kaip azd valdo interneto paslaugą, jūs jau suprantate, kaip valdo agentą.

## Konfigūracijos hierarchija

azd turi atskiras konfigūracijos vietas, o ne vieną universalų sluoksnį:
- **Globalios vartotojo nuostatos**: `~/.azd/config.json`, valdomos `azd config`.
- **Projekto apibrėžtis**: `azure.yaml` nurodo paslaugas, infrastruktūrą ir krantines.
- **Vietinė aplinkos pasirinktis**: `.azure/config.json`.
- **Pagal aplinką nustatymai**: `.azure/<name>/.env`, valdomi `azd env`; papildomi nustatymai gyvena tos aplinkos `config.json`.
- **Žymos ir proceso kintamieji**: perrašo tik tuos nustatymus, kuriuos palaiko konkretus komandos/tiekėjo palaikymas.

Atsitiktinė `azd env set` reikšmė automatiškai netampa infrastruktūros parametru ar diegiamojo programos nustatymu. Aiškiai nurodykite ją parametrų faile, palaikomame paslaugos konfigūracijoje arba krantinėje.

## Globali konfigūracija

### Globalių numatytųjų reikšmių nustatymas
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### Dažnai naudojami globalūs nustatymai
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ Projekto konfigūracija

### azure.yaml struktūra
`azure.yaml` failas yra jūsų azd projekto širdis:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

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
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

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

Tai yra **projekto apibrėžties pavyzdys**, o ne tiekimas paleidimui. Sukurkite nurodytas šaltinio katalogus, krantinių scenarijus, paketų scenarijus ir atitinkančius `infra/main.bicep`/`main.parameters.json` prieš paleisdami. Duomenų bazės priklauso infrastruktūrai; `postgres` nėra įmontuota paslaugos talpinimo vieta. Infrastruktūros parametrai įrašomi į tiekėjo parametrų failą, o ne į `infra.parameters`.

### Paslaugos konfigūracijos parinktys

#### Hostingo tipai
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

#### Kalbai specifiški krantinių šablonai

Toliau pateikti paslaugų fragmentai iliustruoja krantines; juos sujunkite su kiekvienos paslaugos tikru `project` ir `host`. `buildCommand` ir `startCommand` nėra bendri azd paslaugų atributai. Paleidimą konfigūruokite programėlėje, Docker faile arba hostingo infrastruktūroje.

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 Aplinkos valdymas

### Aplinkų kūrimas
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Aplinkos konfigūracija
Pagrindinės aplinkos reikšmės saugomos `.azure/<env-name>/.env`, įskaitant `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID` ir `AZURE_LOCATION`. Naudokite `azd env config get/set` papildomiems aplinkos JSON nustatymams. Šis JSON yra **konceptuali programėlės būsena**, o ne azd konfigūracijos schema; neperkelkite jo į azd failus:

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

**Tik paprasto teksto demonstravimui.** Paprastos `azd env set` reikšmės rašomos į `.azure/<name>/.env` ir gali būti atspausdintos skaitymo komandomis. Nenaudokite pavyzdinio API rakto kaip tikro įgaliojimo. Slaptumams naudokite `azd env set-secret` ir aiškų vykdymo laiko susiejimą.

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### Aplinkos šablonai
Sukurkite **neslaptą, rankiniu būdu tvarkomą** `.env.example` projekto šaknyje nuosekliam nustatymui. azd automatiškai nekrauna failo pavadinimu `env.template`:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

### Aplinkų dalijimasis komandoje

Kai projekte dirba daugiau nei vienas asmuo, turite susitarti, **kas keliauja kartu su repozitorija ir kas lieka vietinis**. azd kiekvieną aplinką laiko po `.azure/` katalogu, tačiau ne visa turinį reikia įkelti į versijų valdymą.

**Kas yra `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Ką ignoruoti git.** azd numatytasis `.gitignore` jau pašalina `.azure/`. Palikite taip – `.env` failuose gali būti slapta informacija, o ištekliai priklauso tam, kas juos pasirūpino. Kiekvienas komandos narys vietoje kuria savo **vietinę** aplinką:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Aplinkų perjungimas.** Kūrėjas, valdantis kelias aplinkas, prieš vykdydamas komandas pasirenka aktyvią aplinką:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Nesecreto numatytųjų teikimas komandai.** Įtraukite `.env.example` už ignoruojamo `.azure/` katalogo ribų. Nauji komandos nariai nukopijuoja jį į savo vietinį ignoruojamą failą, užpildo reikšmes ir aiškiai įkelia naudojant `azd env set --file <local-file>`. Niekada neimportuokite tuščių vietų dirbant veikiant aplinkai.

**Aplinka CI/CD.** Vamzdynai neskaito jūsų vietinio `.azure/` katalogo. Vietoj to, teikite aplinkos reikšmes kaip vamzdžio kintamuosius/slaptus duomenis, o azd juos skaito iš proceso aplinkos:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Praktinis patarimas:** infrastruktūros kodui (`infra/`, `azure.yaml`) dalijamasi Git, o aplinkos *būsena ir slaptumai* (`.azure/`) yra kiekvienam kūrėjui ir vamzdžiui atskirai. `azd pipeline config` automatiškai sukonfigūruoja vamzdžio kintamuosius.

## 🔐 Autentifikacijos konfigūracija

### Azure CLI integracija
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Service Principal autentifikacija
CI/CD vamzdynams:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Valdoma tapatybė (Managed Identity)
Azure talpinamoms aplinkoms:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
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
Terraform projektams azd keičia vietas `infra/main.tfvars.json`. Šie pavadinimai turi atitikti deklaruotus Terraform įvesties kintamuosius:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Diegimo konfigūracija

### Kūrimo konfigūracija
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### Docker konfigūracija
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
Keliai yra santykiniai paslaugos projektui. Dockerfile turi deklaruoti visus naudojamus `ARG`. Daugiasluoksniam kūrimui paskutinė turi būti diegimo stadija arba naudokite individualų paketų kūrimo procesą; `docker.target` nėra palaikomas požymis peržiūrėtoje schemoje.

## 🔧 Pažangi konfigūracija

### Individualių išteklių pavadinimų nustatymas
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Apibrėžkite faktinius išteklių pavadinimus Bicep/Terraform ir užtikrinkite išteklių grupės sudarymo nuoseklumą su šiuo nustatymu. Nėra bendrų `naming.storageAccount` ar `naming.keyVault` rakto konfigūracijų.

### Tinklo konfigūracija
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Sujunkite šiuos **iliustracinius parametrų įrašus** į `infra/main.parameters.json` po `parameters` ir deklaruokite bei naudokite atitinkančius parametrus Bicep. Jie savaime nieko nedaro.

### Stebėjimo konfigūracija
Paruoškite Application Insights ir Log Analytics Bicep/Terraform ir sukonfigūruokite programėlės telemetriją savo SDK. Nėra bendro aukšto lygio `monitoring` bloko `azure.yaml`, kuris sukurtų šiuos išteklius. Peržiūrėkite [stebėjimo infrastruktūrą](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Aplinkai specifinės konfigūracijos

### Kūrimo aplinka
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Bandymų aplinka
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

## 🔍 Konfigūracijos patikra

### Patikrinkite konfigūraciją
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Konfigūracijos scenarijai
Kurkite patikros scenarijus `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
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

```

Venkite jautrių reikšmių įkietinimo (atskirai iliustracinei konfigūracijai, o ne antram `database` raktui tame pačiame faile):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizuokite konfigūracijos failus
```
.azure/
├── config.json              # Global project config
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
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
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

## 🎯 Praktinės užduotys

### Užduotis 1: Daugiaprodukcinė konfigūracija (15 minučių)

**Tikslas**: Sukurti ir konfigūruoti tris vietines aplinkas su skirtingomis reikšmėmis. Pradėkite nuo inicijuoto projekto; jei šios jau egzistuoja, naudokite nenaudojamus vardus. Šios programėlės specifinės reikšmės nekeičia telemetrijos / vykdymo laiko nustatymų, kol jūsų šablonas jų nesunaudoja.

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Sėkmės kriterijai:**
- [ ] Sekmingai sukurtos trys aplinkos
- [ ] Kiekviena aplinka turi unikalią konfigūraciją
- [ ] Galima be klaidų perjunginėti aplinkas
- [ ] `azd env list` rodo visas tris aplinkas

### Užduotis 2: Key Vault slaptų reikšmių nuorodos (10-20 minučių)

**Tikslas**: Vietoj paprasto teksto saugoti Key Vault nuorodą. **Pradinė būsena:** inicijuota aplinka, prisijungimas prie Azure ir prieiga prie Key Vault su teise sukurti / skaityti bandomąjį slaptumą. Valdymo operacijos gali kainuoti.

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**Sėkmės kriterijai:**
- [ ] Interaktyvi komanda praneša apie pasirinktą raktavimo reikšmę ir slaptumo nuorodą
- [ ] Vietinė `.env` turi nuorodą, o ne bandomąjį slaptumą
- [ ] Gali paaiškinti, kad vis tiek reikia sukonfigūruoti vykdymo laiko tapatybę / RBAC ir vartojimą

**Dažnos problemos:** 403 yra dėl tinkamos rinkinio duomenų plano rolės ir propagacijos laiko; `azd env set ... --secret` nėra galiojanti komanda. Paprastas `get-values`/`get-value` išvestis neturėtų būti laikoma slėpta. Pašalinkite mokymo nuorodą naudojant `azd env unset TRAINING_API_KEY`; tai neištrina raktavimo slaptumo, kurį privalote atskirai sutvarkyti, jei jį sukūrėte.

## Tolimesni žingsniai

- [Jūsų pirmas projektas](../chapter-01-foundation/first-project.md) - Konfigūracijos taikymas praktikoje
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md) - Konfigūracijos naudojimas diegimui
- [Ištekliai ir paruošimas](../chapter-04-infrastructure/provisioning.md) - Produkcijai paruoštos konfigūracijos

## Nuorodos

- [azd konfigūracijos nuoroda](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml schema](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Aplinkos kintamieji](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 3 skyrius - Konfigūracija ir autentifikacija
- **⬅️ Ankstesnis**: [Jūsų pirmasis projektas](../chapter-01-foundation/first-project.md)
- **➡️ Kitas skyrius**: [4 skyrius: Infrastruktūra kaip kodas](../chapter-04-infrastructure/deployment-guide.md)
- **Kita pamoka**: [Autentifikacija ir saugumas](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->