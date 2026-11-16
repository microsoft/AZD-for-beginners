# Gabay sa Konfigurasyon

**Pag-navigate sa Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 3 - Konfigurasyon at Authentication
- **⬅️ Nakaraan**: [Ang Iyong Unang Proyekto](../chapter-01-foundation/first-project.md)
- **➡️ Susunod**: [Gabay sa Deployment](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Susunod na Kabanata**: [Kabanata 4: Infrastructure bilang Code](../chapter-04-infrastructure/deployment-guide.md)

## Panimula

> Sinuri batay sa `azd 1.37.2` (Nobyembre 2026). Ang mga utos na Bash ay nagpapalagay na isang inisyal na proyektong azd. Maliban kung hayagang inilalarawan bilang isang kumpletong file, ang mga snippet ng YAML/Bicep ay mga fragment na pagsasamahin sa mga tumutugmang file ng proyekto, hindi mga nakahiwalay na proyektong tumatakbo.

Saklaw ng komprehensibong gabay na ito ang lahat ng aspeto ng pagkokonfigura ng Azure Developer CLI para sa pinakamainam na mga workflow sa pag-unlad at deployment. Matututuhan mo ang hierarkiya ng konfigurasyon, pamamahala ng kapaligiran, mga paraan ng authentication, at mga advanced na pattern ng konfigurasyon na nagbibigay-daan sa mahusay at ligtas na mga deployment sa Azure.

## Mga Layunin sa Pag-aaral

Sa pagtatapos ng araling ito, magagawa mo:
- Masterin ang azd configuration hierarchy at maunawaan kung paano inuuna ang mga setting
- Mag-configure ng global at project-specific na mga setting nang epektibo
- Pamahalaan ang maramihang mga kapaligiran na may magkakaibang mga configuration
- Magpatupad ng ligtas na mga pattern ng authentication at authorization
- Maunawaan ang mga advanced configuration pattern para sa kumplikadong mga senaryo

## Mga Kinalabasan ng Pag-aaral

Pagkatapos makumpleto ang araling ito, magagawa mo:
- I-configure ang azd para sa pinakamainam na mga workflow sa pag-unlad
- Mag-set up at pamahalaan ang maramihang mga deployment environment
- Magpatupad ng mga siguradong pamamaraan sa pamamahala ng konfigurasyon
- Mag-troubleshoot ng mga isyu na may kinalaman sa konfigurasyon
- I-customize ang pag-uugali ng azd para sa mga partikular na pangangailangan ng organisasyon

Saklaw ng komprehensibong gabay na ito ang lahat ng aspeto ng pagkokonfigura ng Azure Developer CLI para sa pinakamainam na mga workflow sa pag-unlad at deployment.

## Pag-unawa sa AI Agents sa isang proyekto ng azd

Kung bago ka sa AI agents, narito ang isang simpleng paraan upang isipin sila sa loob ng mundo ng azd.

### Ano ang Agent?

Ang agent ay isang piraso ng software na maaaring tumanggap ng request, mag-isip tungkol dito, at kumilos—madalas sa pamamagitan ng pagtawag ng AI model, paghahanap ng data, o pag-invoke ng ibang mga serbisyo. Sa isang proyekto ng azd, ang agent ay isa lamang pang **serbisyo** katulad ng iyong web frontend o API backend.

### Paano Kasya ang mga Agent sa Estraktura ng Proyekto ng azd

Ang proyekto ng azd ay binubuo ng tatlong patong: **infrastructure**, **code**, at **configuration**. Ang mga agent ay nakakabit sa mga patong na ito katulad ng ginagawa ng ibang serbisyo:

| Patong | Ano ang Ginagawa Nito para sa Tradisyunal na App | Ano ang Ginagawa Nito para sa Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Nagpo-provision ng web app at database | Nagpo-provision ng AI model endpoint, search index, o host ng agent |
| **Code** (`src/`) | Naglalaman ng iyong frontend at API source code | Naglalaman ng iyong agent logic at mga prompt definition |
| **Configuration** (`azure.yaml`) | Naga-lista ng iyong mga serbisyo at kanilang mga hosting target | Naga-lista ng iyong agent bilang serbisyo, na tumuturo sa code at host nito |

### Ang Papel ng `azure.yaml`

Hindi mo kailangang alamin ang syntax ngayon. Sa konsepto, ang `azure.yaml` ay ang file kung saan sinasabi mo sa azd: *"Narito ang mga serbisyong bumubuo sa aking aplikasyon, at narito kung saan makikita ang kanilang code."*

Kapag ang iyong proyekto ay may AI agent, binabanggit lang ng `azure.yaml` ang agent bilang isa sa mga serbisyo. Alam ng azd na magpo-provision ng tamang infrastructure (tulad ng isang Microsoft Foundry Models endpoint o Container App para i-host ang agent) at i-de-deploy ang iyong agent code—katulad ng paghawak nito sa web app o API.

Nangangahulugan ito na wala nang bago o kakaiba pang kailangang matutunan. Kung nauunawaan mo kung paano pinamamahalaan ng azd ang isang web service, nauunawaan mo na rin kung paano nito pinamamahalaan ang isang agent.

## Hierarkiya ng Konfigurasyon

May mga hiwalay na configuration surfaces ang azd, hindi isang pangkalahatang overlay:
- **Pangunahing mga kagustuhan ng user**: `~/.azd/config.json`, pinamamahalaan ng `azd config`.
- **Depinisyon ng proyekto**: `azure.yaml` ang nagtatakda ng mga serbisyo, infrastructure, at mga hook.
- **Pagpili ng lokal na kapaligiran**: `.azure/config.json`.
- **Mga halaga bawat kapaligiran**: `.azure/<name>/.env`, pinamamahalaan ng `azd env`; ang karagdagang mga setting ay nasa `config.json` ng kapaligiran na iyon.
- **Mga flags at process variables**: ibinabago lamang ang mga setting na sinusuportahan ng isang partikular na utos/provider.

Ang hindi sinasadyang `azd env set` na halaga ay hindi awtomatikong nagiging parameter ng infrastructure o setting ng deploy na aplikasyon. Tiyaking tukuyin ito sa parameter file, sinusuportahang service configuration, o sa isang hook.

## Global na Konfigurasyon

### Pagtatakda ng Mga Global na Default
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

### Mga Karaniwang Global na Setting
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

## 🏗️ Konfigurasyon ng Proyekto

### Estruktura ng azure.yaml
Ang file na `azure.yaml` ang puso ng iyong proyekto ng azd:

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

Ito ay isang **halimbawa ng depinisyon ng proyekto**, hindi isang starter na nakalaan. Gumawa ng mga tinukoy na direktoryo ng source, mga hook script, package script, at tumutugmang `infra/main.bicep`/`main.parameters.json` bago patakbuhin ito. Ang mga database ay kabilang sa infrastructure; ang `postgres` ay hindi isang built-in na hosting service. Ang mga parameter ng infrastructure ay nasa parameter file ng provider, hindi sa `infra.parameters`.

### Mga Opsyon sa Konfigurasyon ng Serbisyo

#### Mga Uri ng Host
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

#### Mga Hook sa Pagbuo na Espesipiko sa Wika

Ang mga sumusunod na fragment ng serbisyo ay nagpapakita ng mga hook; pagsamahin ang mga ito sa totoong `project` at `host` ng bawat serbisyo. Hindi generic na property ng azd service ang `buildCommand` at `startCommand`. I-configure ang startup sa aplikasyon, Dockerfile, o host infrastructure.

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

## 🌟 Pamamahala ng Kapaligiran

### Paglikha ng Mga Kapaligiran
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfigurasyon ng Kapaligiran
Ang mga pangunahing halaga ng kapaligiran ay nasa `.azure/<env-name>/.env`, kabilang ang `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID`, at `AZURE_LOCATION`. Gamitin ang `azd env config get/set` para sa mga karagdagang setting ng kapaligiran sa JSON. Ang sumusunod na JSON ay isang **konseptwal na estado ng aplikasyon**, hindi isang azd config schema; huwag itong kopyahin sa mga file ng azd:

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

### Mga Variable ng Kapaligiran

**Demonstrasyon lamang ng plaintext.** Ang ordinaryong mga halaga ng `azd env set` ay sinusulat sa `.azure/<name>/.env` at maaaring iprinta ng mga read command. Huwag gamitin ang halimbawa ng API key bilang tunay na kredensyal. Para sa mga sikreto, gamitin ang `azd env set-secret` at tahasang wiring sa runtime.

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

### Mga Template ng Kapaligiran
Gumawa ng **hindi-sikreto, manu-manong pinananatili** na `.env.example` sa ugat ng proyekto para sa pare-parehong setup. Hindi awtomatikong ni-load ng azd ang file na pinangalanang `env.template`:
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

### Paghahati ng Mga Kapaligiran Sa Koponan

Kapag may higit sa isang tao na nagtatrabaho sa isang proyekto, kailangan ninyong pag-usapan kung **ano ang kasama sa repo at ano ang nananatiling lokal**. Ina-ingatan ng azd ang bawat kapaligiran sa ilalim ng isang folder na `.azure/`, at hindi lahat ay dapat i-commit.

**Ano ang nasa `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Ano ang igiit na i-gitignore.** Ang default na `.gitignore` ng azd ay awtomatikong nagtatanggal ng `.azure/`. Panatilihin itong ganoon—ang mga file ng `.env` ay maaaring maglaman ng mga sikreto, at ang mga resource ID ay tukoy sa tagapag-provision. Bawat kasapi ng koponan ay gumagawa ng **sariling** lokal na kapaligiran:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Paglipat sa pagitan ng mga kapaligiran.** Pinipili ng developer na nangangasiwa ng ilang mga kapaligiran ang aktibo bago magpatakbo ng mga utos:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Pagbibigay ng hindi-sikretong default sa koponan.** I-commit ang `.env.example` sa labas ng iniiwasang direktoriong `.azure/`. Kinokopya ito ng mga bagong kasapi sa lokal na iniiwasang file, pinupunan ang mga halaga, at tahasang ini-import gamit ang `azd env set --file <local-file>`. Huwag kailanman mag-import ng mga blangkong placeholder sa isang gumaganang kapaligiran.

**Mga kapaligiran sa CI/CD.** Hindi binabasa ng pipeline ang iyong lokal na folder na `.azure/`. Sa halip, ibigay ang mga halaga ng kapaligiran bilang mga variable/sikreto ng pipeline, at binabasa iyon ng azd mula sa process environment:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Panuntunan:** Ang code ng infrastructure (`infra/`, `azure.yaml`) ay pinaghahatian sa Git; ang *estado at mga sikreto ng kapaligiran* (`.azure/`) ay para sa bawat developer at pipeline. Awtomatikong inaayos ng `azd pipeline config` ang mga variable ng pipeline para sa iyo.

## 🔐 Konfigurasyon ng Authentication

### Integrasyon sa Azure CLI
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Authentication gamit ang Service Principal
Para sa CI/CD pipelines:
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
Para sa mga kapaligiran na naka-host sa Azure:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Konfigurasyon ng Infrastructure

### Mga Parameter sa Bicep
I-configure ang mga parameter ng infrastructure sa `infra/main.parameters.json`:
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

### Konfigurasyon ng Terraform
Para sa mga proyekto ng Terraform, pinapalitan ng azd ang mga placeholder sa `infra/main.tfvars.json`. Dapat tumugma ang mga pangalang ito sa mga deklaradong Terraform input variable:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Konfigurasyon ng Deployment

### Konfigurasyon ng Build
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

### Konfigurasyon ng Docker
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
Ang mga path ay relative sa proyekto ng serbisyo. Dapat ideklara ng Dockerfile ang anumang mga halaga ng `ARG` na ginagamit nito. Para sa multi-stage build, ilagay ang deployable stage sa huli o gumamit ng pasadyang workflow sa packaging; hindi suportado ang `docker.target` bilang property sa sinuring schema.

## 🔧 Advanced na Konfigurasyon

### Pasadyang Pagpapangalan ng Resource
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Tukuyin ang aktwal na mga pangalan ng resource sa Bicep/Terraform at panatilihing pare-pareho ang paggawa ng resource-group ayon sa setting na ito. Walang generic na mga key na `naming.storageAccount` o `naming.keyVault` para sa konfigurasyon.

### Konfigurasyon ng Network
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Pagsamahin ang mga **illustrative parameter entries** na ito sa `infra/main.parameters.json` sa ilalim ng `parameters`, at idineklara at gamitin ang mga tumutugmang parameter sa Bicep. Wala silang ginagawa nang mag-isa.

### Konfigurasyon sa Pagmo-monitor
Mag-provision ng Application Insights at Log Analytics sa Bicep/Terraform at i-configure ang telemetry ng aplikasyon sa iyong SDK. Walang generic na top-level na `monitoring` block sa `azure.yaml` na lumilikha ng mga resource na ito. Tingnan ang [monitoring infrastructure](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Mga Konfigurasyong Partikular sa Kapaligiran

### Kapaligiran sa Pag-unlad
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Kapaligiran sa Staging
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Kapaligiran sa Produksyon
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Pagpapatunay ng Konfigurasyon

### Patunayan ang Konfigurasyon
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Mga Script sa Konfigurasyon
Gumawa ng mga validation script sa `scripts/`:

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

## 🎓 Mga Pinakamahusay na Praktis

### 1. Gumamit ng Mga Variable ng Kapaligiran
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Iwasan ang hardcoding ng mga sensitibong halaga (hiwalay na illustratibong konfigurasyon, hindi pangalawang `database` key sa parehong file):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Ayusin ang Mga File ng Konfigurasyon
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

### 3. Mga Konsiderasyon sa Version Control
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Dokumentasyon ng Konfigurasyon
Idokumento ang iyong konfigurasyon sa `CONFIG.md`:
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

## 🎯 Mga Praktikal na Ehersisyo

### Ehersisyo 1: Multi-Environment Configuration (15 minuto)

**Layunin**: Gumawa at mag-configure ng tatlong lokal na kapaligiran na may magkakaibang mga halaga. Magsimula sa isang initialized na proyekto; gumamit ng mga hindi pa nagagamit na pangalan kung mayroon na. Ang mga application-specific na halaga ay hindi nagbabago ng telemetry/runtime settings hangga't hindi ito ginagamit ng iyong template.

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

**Mga Pamantayan sa Tagumpay:**
- [ ] Tatlong kapaligiran ang matagumpay na nalikha
- [ ] May kani-kaniyang natatanging konfigurasyon ang bawat kapaligiran
- [ ] Maaaring lumipat sa pagitan ng mga kapaligiran nang walang error
- [ ] Ipinapakita ng `azd env list` ang tatlong kapaligiran

### Ehersisyo 2: Mga Sanggunian sa Key Vault Secret (10-20 minuto)

**Layunin**: Mag-imbak ng sanggunian ng Key Vault sa halip na plaintext. **Panimulang punto:** isang initialized na kapaligiran, pag-sign in sa Azure, at access sa isang Key Vault na may permiso na gumawa/magbasa ng dummy secret. Ang mga operasyon sa vault ay maaaring magdulot ng mga singil.

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

**Mga Pamantayan sa Tagumpay:**
- [ ] Iniulat ng interactive command ang piniling vault at sanggunian ng secret
- [ ] Ang lokal na `.env` ay may sanggunian sa halip na dummy secret
- [ ] Kayang ipaliwanag na kailangang i-configure pa rin ang runtime identity/RBAC at consumption

**Karaniwang isyu:** Ang 403 ay nangangailangan ng tamang data-plane role sa vault at oras ng propagation; hindi wastong utos ang `azd env set ... --secret`. Hindi dapat ipagpalagay na na-redact ang output ng ordinaryong `get-values`/`get-value`. Alisin ang training reference gamit ang `azd env unset TRAINING_API_KEY`; hindi nito binubura ang vault secret, na kailangang linisin nang hiwalay kung ikaw ang gumawa nito.

## Mga Susunod na Hakbang

- [Ang Iyong Unang Proyekto](../chapter-01-foundation/first-project.md) - Ilapat ang konfigurasyon sa praktis
- [Gabay sa Deployment](../chapter-04-infrastructure/deployment-guide.md) - Gamitin ang konfigurasyon para sa deployment
- [Pagpo-provision ng mga Resource](../chapter-04-infrastructure/provisioning.md) - Mga production-ready na konfigurasyon

## Mga Sanggunian

- [Sanggunian sa Konfigurasyon ng azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Schema ng azure.yaml](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Mga Variable ng Kapaligiran](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Pag-navigate sa Kabanata:**
- **📚 Bahay ng Kurso**: [AZD For Beginners](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 3 - Pag-configure at Pagpapatunay
- **⬅️ Nakaraan**: [Iyong Unang Proyekto](../chapter-01-foundation/first-project.md)
- **➡️ Susunod na Kabanata**: [Kabanata 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Sunod na Aralin**: [Authentication & Security](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->