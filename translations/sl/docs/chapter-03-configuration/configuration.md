# Vodnik za konfiguracijo

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 3 - Konfiguracija in overjanje
- **⬅️ Prejšnje**: [Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Naslednje**: [Vodnik za nameščanje](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Naslednje poglavje**: [Poglavje 4: Infrastruktura kot koda](../chapter-04-infrastructure/deployment-guide.md)

## Uvod

> Preverjeno glede na `azd 1.37.2` (november 2026). Bash ukazi predvidevajo inicializiran azd projekt. Razen če ni izrecno opisano kot celotna datoteka, so YAML/Bicep odlomki deli za združitev v ustrezne projektne datoteke, ne samostojni zagonljivi projekti.

Ta obsežen vodnik pokriva vse vidike konfiguracije Azure Developer CLI za optimalne razvojne in namestitvene delovne procese. Naučili se boste o hierarhiji konfiguracije, upravljanju okolij, metodah overjanja in naprednih vzorcih konfiguracije, ki omogočajo učinkovite in varne Azure nameščanja.

## Cilji učenja

Do konca te lekcije boste:
- Obvladali hierarhijo konfiguracije azd in razumeli, kako se nastavitve prioritizirajo
- Učinkovito konfigurirali globalne in projektno specifične nastavitve
- Upravljali več okolij z različnimi konfiguracijami
- Implementirali varne vzorce overjanja in pooblastil
- Razumeli napredne vzorce konfiguracije za kompleksne scenarije

## Rezultati učenja

Po zaključku te lekcije boste lahko:
- Konfigurirali azd za optimalne razvojne delovne procese
- Nastavili in upravljali več namestitvenih okolij
- Uvedli varne prakse upravljanja konfiguracije
- Odpravljali težave, povezane s konfiguracijo
- Prilagodili vedenje azd za specifične organizacijske zahteve

Ta obsežen vodnik pokriva vse vidike konfiguracije Azure Developer CLI za optimalne razvojne in namestitvene delovne procese.

## Razumevanje AI agentov v azd projektu

Če ste novi pri AI agentih, je tukaj preprost način za razmišljanje o njih v svetu azd.

### Kaj je agent?

Agent je programska oprema, ki lahko prejme zahtevo, jo obdeluje in izvaja dejanja—pogosto z uporabo AI modela, iskanjem podatkov ali klicanjem drugih storitev. V azd projektu je agent le še ena **storitev** poleg vaše spletne predstavitve ali API zaledja.

### Kako agenti spadajo v strukturo azd projekta

azd projekt sestavljajo trije sloji: **infrastruktura**, **koda** in **konfiguracija**. Agenti se povežejo s temi sloji enako kot katerekoli druge storitve:

| Sloj | Kaj počne za tradicionalno aplikacijo | Kaj počne za agenta |
|-------|-------------------------------------|---------------------------|
| **Infrastruktura** (`infra/`) | Zagotavlja spletno aplikacijo in bazo podatkov | Zagotavlja konektor Microsoft Foundry Models, indeks iskanja ali gostitelj agenta |
| **Koda** (`src/`) | Vsebuje izvorno kodo za frontend in API | Vsebuje logiko agenta in definicije sporočil za ukaze |
| **Konfiguracija** (`azure.yaml`) | Navedba storitev in njihovih gostiteljskih ciljev | Navedba agenta kot storitve, ki kaže na njegovo kodo in gostitelja |

### Vloga `azure.yaml`

Ni vam treba zdaj pomniti sintakse. Konceptualno je `azure.yaml` datoteka, kjer azd sporočiš: *"Tukaj so storitve, ki sestavljajo mojo aplikacijo, in tukaj lahko najdeš njihovo kodo."*

Ko vaš projekt vključuje AI agenta, `azure.yaml` preprosto navede tega agenta kot eno od storitev. azd potem ve, da mora zagotoviti ustrezno infrastrukturo (kot konektor Microsoft Foundry Models ali Container App za gostovanje agenta) in namestiti kodo agenta—enako kot za spletno aplikacijo ali API.

To pomeni, da ni nič osnovno novega za naučiti. Če razumete, kako azd upravlja spletno storitev, že razumete, kako upravlja agenta.

## Hierarhija konfiguracije

azd ima ločene plasti konfiguracije, ne enoten univerzalni prekrivni sloj:
- **Globalne uporabniške nastavitve**: `~/.azd/config.json`, upravlja `azd config`.
- **Definicija projekta**: `azure.yaml` določa storitve, infrastrukturo in hooks.
- **Izbira lokalnega okolja**: `.azure/config.json`.
- **Vrednosti na okolje**: `.azure/<name>/.env`, upravlja `azd env`; dodatne nastavitve so v `config.json` tega okolja.
- **Preklici in procesne spremenljivke**: preglasijo samo nastavitve, ki jih določen ukaz/ponudnik podpira.

Naključna vrednost `azd env set` ne postane samodejno parameter infrastrukture ali nastavitev nameščene aplikacije. Izrecno jo navajajte v datoteki parametrov, podprti konfiguraciji storitve ali hooku.

## Globalna konfiguracija

### Nastavitev globalnih privzetih vrednosti
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

### Pogoste globalne nastavitve
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

## 🏗️ Konfiguracija projekta

### Struktura azure.yaml
Datoteka `azure.yaml` je srce vašega azd projekta:

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

To je **primer definicije projekta**, ne zagonska datoteka. Pred zagonom ustvarite omenjene izvorne imenike, skripte za hooke, skripte za pakete in ustrezne `infra/main.bicep`/`main.parameters.json`. Baze podatkov spadajo v infrastrukturo; `postgres` ni vgrajeni gostitelj storitev. Parameter infrastrukture dodajte v datoteko parametrov ponudnika, ne v `infra.parameters`.

### Možnosti konfiguracije storitev

#### Vrste gostiteljev
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

#### Gradbeni hooks, specifični za jezik

Naslednji odlomki storitev prikazujejo hooks; združite jih z dejanskimi `project` in `host` posamezne storitve. `buildCommand` in `startCommand` niso splošne lastnosti storitve azd. Začetno konfiguracijo uredite v aplikaciji, Dockerfile-u ali gostiteljski infrastrukturi.

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

## 🌟 Upravljanje okolij

### Ustvarjanje okolij
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfiguracija okolja
Osnovne vrednosti okolja so v `.azure/<env-name>/.env`, vključno z `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID` in `AZURE_LOCATION`. Za dodatne JSON nastavitve okolja uporabite `azd env config get/set`. Naslednji JSON je **konceptualno stanje aplikacije**, ne azd konfiguracijska shema; ne kopirajte ga v azd datoteke:

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

### Spremenljivke okolja

**Samo prikaz v navadnem besedilu.** Navadne vrednosti `azd env set` se zapisujejo v `.azure/<name>/.env` in jih lahko prikažejo ukazi za branje. Ne uporabljajte primernega API ključa kot dejanskega poverilnice. Za skrivnosti uporabite `azd env set-secret` in eksplicitno povezovanje v času zagona.

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

### Predloge okolij
Ustvarite **ne-skrivno, ročno vzdrževano** `.env.example` v korenu projekta za dosledno nastavitev. azd samodejno ne nalaga datoteke z imenom `env.template`:
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

### Deljenje okolij v timu

Če več oseb dela na projektu, se je treba dogovoriti o **tem, kaj potuje z repozitorijem in kaj ostane lokalno**. azd shranjuje vsako okolje pod mapo `.azure/`, vendar ni vsega treba spraviti v verzioniranje.

**Kaj je v `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Kaj ignorirati v git-u.** Privzeti `.gitignore` azd vključi `.azure/`. Ohranjajte tako—`.env` datoteke lahko vsebujejo skrivnosti, IDs virov so specifični za tistega, ki jih je zagotovil. Vsak sodelavec ustvari svoje **lokalno** okolje:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Preklapljanje med okolji.** Razvijalec, ki upravlja več okolij, pred izvajanjem ukazov izbere aktivno okolje:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Dobava ne-skrivnih privzetih vrednosti timu.** Pošljite `.env.example` izven ignorirane mape `.azure/`. Novi sodelavci kopirajo do lokalne ignorirane datoteke, vpišejo vrednosti in jo izrecno uvozijo z `azd env set --file <local-file>`. Nikoli ne uvažajte praznih rezerviranih mest čez delujoče okolje.

**Okolja v CI/CD.** Poteki ne berejo vaše lokalne mape `.azure/`. Namesto tega zagotovite vrednosti okolja kot spremenljivke/skrivnosti poteka, azd jih prebere iz procesnega okolja:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Pravilo:** koda infrastrukture (`infra/`, `azure.yaml`) je deljena v Gitu; *stanje in skrivnosti okolja* (`.azure/`) so za vsakega razvijalca in potek posebej. `azd pipeline config` avtomatsko nastavi spremenljivke poteka za vas.

## 🔐 Konfiguracija overjanja

### Integracija z Azure CLI
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Overjanje z Service Principal
Za CI/CD poteke:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Managed Identity
Za Azure gostovana okolja:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Konfiguracija infrastrukture

### Parametri Bicep
Konfigurirajte parametre infrastrukture v `infra/main.parameters.json`:
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

### Konfiguracija Terraform
Za Terraform projekte azd nadomešča rezervirana mesta v `infra/main.tfvars.json`. Ta imena morajo ustrezati deklariranim vhodnim spremenljivkam Terraform:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Konfiguracija nameščanja

### Konfiguracija gradnje
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

### Konfiguracija Dockerja
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
Poti so relativne projektni storitvi. Dockerfile mora deklarirati vse vrednosti `ARG`, ki jih uporablja. Za večstopenjske gradnje postavite izvedljivo stopnjo zadnjo ali uporabite prilagojen delovni tok pakiranja; `docker.target` ni podpora lastnost v pregledani shemi.

## 🔧 Napredna konfiguracija

### Po meri poimenovanje virov
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Določite dejanska imena virov v Bicep/Terraform in ohranite dosledno ustvarjanje skupin virov s to nastavitvijo. Ni generičnih `naming.storageAccount` ali `naming.keyVault` ključev konfiguracije.

### Konfiguracija omrežja
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Združite te **osvetlitvene vnose parametrov** v `infra/main.parameters.json` znotraj `parameters` in deklarirajte ter porabite ustrezne parametre v Bicep. Sami po sebi ne delujejo.

### Konfiguracija spremljanja
Uredite Application Insights in Log Analytics v Bicep/Terraform ter konfigurirajte telemetrijo aplikacije v svojem SDK-ju. Ni generične glave `monitoring` v `azure.yaml`, ki ustvarja te vire. Glejte [monitoring infrastrukturo](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Okoljsko specifične konfiguracije

### Razvojno okolje
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Predprodukcijsko okolje
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Produkcijsko okolje
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validacija konfiguracije

### Preverjanje konfiguracije
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Skripte za konfiguracijo
Ustvarite preveritvene skripte v `scripts/`:

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

## 🎓 Najboljše prakse

### 1. Uporabite spremenljivke okolja
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Izogibajte se trdni kodi občutljivih vrednosti (ločena osvetlitev konfiguracije, ne druga ključ `database` v isti datoteki):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizirajte konfiguracijske datoteke
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

### 3. Premisleki glede nadzora različic
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Dokumentacija konfiguracije
Dokumentirajte svojo konfiguracijo v `CONFIG.md`:
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

## 🎯 Praktične vaje

### Vaja 1: Konfiguracija več okolij (15 minut)

**Cilj**: Ustvarite in konfigurirajte tri lokalna okolja z različnimi vrednostmi. Začnite z inicializiranim projektom; uporabite neuporabljena imena, če ta že obstajajo. Te vrednosti specifične za aplikacijo ne spremenijo telemetrije/časa izvajanja, dokler jih predloga ne porabi.

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

**Kriteriji uspeha:**
- [ ] Ustvarjena tri okolja brez napak
- [ ] Vsako okolje ima unikatno konfiguracijo
- [ ] Preklapljanje med okolji brez napak
- [ ] `azd env list` prikaže vsa tri okolja

### Vaja 2: Reference skrivnosti Key Vaulta (10-20 minut)

**Cilj**: Shraniti referenco Key Vaulta namesto navadnega besedila. **Začetna točka:** inicializirano okolje, prijava v Azure in dostop do Key Vaulta z dovoljenji za ustvarjanje/branje testne skrivnosti. Operacije z vaultom lahko povzročajo stroške.

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

**Kriteriji uspeha:**
- [ ] Interaktivni ukaz prikaže izbrani vault in referenco skrivnosti
- [ ] Lokalni `.env` vsebuje referenco in ne testne skrivnosti
- [ ] Lahko razloži, da je še potrebno konfigurirati identiteto v času zagona/RBAC in porabo

**Pogoste težave:** napaka 403 zahteva pravilen vault data-plane vlogo in čas propagacije; `azd env set ... --secret` ni veljaven ukaz. Izpis običajnih `get-values`/`get-value` ne sme biti samodejno skrit. Odstranite referenco treninga s `azd env unset TRAINING_API_KEY`; to ne izbriše skrivnosti v vaultu, ki jo je treba ročno odstraniti, če ste jo ustvarili.

## Naslednji koraki

- [Vaš prvi projekt](../chapter-01-foundation/first-project.md) - Uporaba konfiguracije v praksi
- [Vodnik za nameščanje](../chapter-04-infrastructure/deployment-guide.md) - Uporaba konfiguracije za namestitev
- [Zagotavljanje virov](../chapter-04-infrastructure/provisioning.md) - Producentno pripravljene konfiguracije

## Reference

- [azd Konfiguracijski referenčni dokument](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Shema](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Spremenljivke okolja](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD Za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 3 - Konfiguracija in avtentikacija
- **⬅️ Prejšnje**: [Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Naslednje poglavje**: [Poglavje 4: Infrastruktura kot koda](../chapter-04-infrastructure/deployment-guide.md)
- **Naslednja lekcija**: [Avtentikacija in varnost](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->