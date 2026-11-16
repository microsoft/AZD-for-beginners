# Mwongozo wa Mipangilio

**Uelekezaji wa Sura:**
- **📚 Mwanzo wa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 3 - Mipangilio & Uthibitishaji
- **⬅️ Iliyotangulia**: [Mradi Wako wa Kwanza](../chapter-01-foundation/first-project.md)
- **➡️ Iifuate**: [Mwongozo wa Uwekaji](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Sura Iifuate**: [Sura ya 4: Miundombinu kama Msimbo](../chapter-04-infrastructure/deployment-guide.md)

## Utangulizi

> Imeangaliwa dhidi ya `azd 1.37.2` (Novemba 2026). Amri za bash zinadhani mradi wa azd umeanzishwa. Isipokuwa imelezwa wazi kuwa ni faili kamili, vipande vya YAML/Bicep ni vipande vya kuunganishwa kwenye faili zinazolingana za mradi, si miradi kamili inayoweza kuendeshwa pekee.

Mwongozo huu kamilifu unahusisha nyanja zote za kusanidi Azure Developer CLI kwa shughuli bora za maendeleo na uwasilishaji. Utajifunza juu ya muktadha wa mipangilio, usimamizi wa mazingira, njia za uthibitishaji, na mifumo ya juu ya mipangilio inayowezesha uwasilishaji bora na salama wa Azure.

## Malengo ya Kujifunza

Mwisho wa somo hili, utakuwa umeweza:
- Kumudu muktadha wa mipangilio ya azd na kuelewa jinsi mipangilio inavyopewa kipaumbele
- Kusanidi mipangilio ya ulimwengu mzima na maalum kwa mradi kwa ufanisi
- Kusimamia mazingira mengi yenye mipangilio tofauti
- Kutekeleza mifumo ya uthibitishaji na idhini salama
- Kuelewa mifumo ya juu ya mipangilio kwa hali tata

## Matokeo ya Kujifunza

Baada ya kumaliza somo hili, utaweza:
- Kusanidi azd kwa shughuli bora za maendeleo
- Kuanzisha na kusimamia mazingira mengi ya kuwasilisha
- Kutekeleza mbinu salama za usimamizi wa mipangilio
- Kutatua matatizo yanayohusiana na mipangilio
- Kubinafsisha tabia ya azd kwa mahitaji maalum ya shirika

Mwongozo huu kamilifu unahusisha nyanja zote za kusanidi Azure Developer CLI kwa shughuli bora za maendeleo na uwasilishaji.

## Kuelewa Wakala wa AI katika Mradi wa azd

Ikiwa wewe ni mpya kwa wakala wa AI, hapa kuna njia rahisi ya kuwafikiria katika ulimwengu wa azd.

### Wakala ni Nini?

Wakala ni kipande cha programu kinachoweza kupokea ombi, kufikiri kuhusu hilo, na kuchukua hatua—kawaida kwa kuita mfano wa AI, kutafuta data, au kutumia huduma nyingine. Katika mradi wa azd, wakala ni huduma nyingine pekee pamoja na kivinjari chako cha wavuti au nyuma ya API.

### Jinsi Wakala Wanavyofaa Katika Muundo wa Mradi wa azd

Mradi wa azd umeundwa kwa tabaka tatu: **miundombinu**, **msimbo**, na **mpangilio**. Wakala huingia katika tabaka hizi kwa njia ile ile huduma nyingine ya kufanya:

| Tabaka | Kinachofanya kwa Programu ya Kawaida | Kinachofanya kwa Wakala |
|-------|-------------------------------------|---------------------------|
| **Miundombinu** (`infra/`) | Huweka tovuti na hifadhidata | Huweka kiungo cha mfano wa AI, faharasa ya utafutaji, au mwenyeji wa wakala |
| **Msimbo** (`src/`) | Ina msimbo wa mbele na wa API | Ina mantiki ya wakala wako na maelezo ya maagizo |
| **Mpangilio** (`azure.yaml`) | Orodhesha huduma zako na malengo ya mwenyeji | Orodhesha wakala wako kama huduma, kuonyesha msimbo wake na mwenyeji |

### Jukumu la `azure.yaml`

Huna haja ya kukumbuka muundo wa sasa. Kifanikio, `azure.yaml` ni faili unayomuambia azd: *"Hapa kuna huduma zinazoifanya programu yangu, na hapa ndipo unapata msimbo wao."*

Mradi wako ukiwa na wakala wa AI, `azure.yaml` hutorosha wakala huyo kama moja ya huduma. azd basi inajua kuweka miundombinu sahihi (kama kiungo cha Microsoft Foundry Models au Programu ya Kontena kuhosti wakala) na kuweka msimbo wa wakala wako—kama vile kwa programu ya wavuti au API.

Hii ina maana hakuna kitu kipya kabisa cha kujifunza. Ikiwa unaelewa jinsi azd inavyosimamia huduma ya wavuti, tayari unaelewa jinsi inavyosimamia wakala.

## Muktadha wa Mipangilio

azd ina uso wa mipangilio tofauti, si mtaro mmoja wa jumla:
- **Mapendeleo ya mtumiaji wa ulimwengu mzima**: `~/.azd/config.json`, inasimamiwa na `azd config`.
- **Ufafanuzi wa mradi**: `azure.yaml` inaeleza huduma, miundombinu, na vifungo.
- **Uchaguzi wa mazingira ya ndani**: `.azure/config.json`.
- **Thamani kwa kila mazingira**: `.azure/<name>/.env`, inasimamiwa na `azd env`; mipangilio mingine iko katika `config.json` ya mazingira hayo.
- **Bendera na vigezo vya mchakato**: hubatilisha tu mipangilio inayoungwa mkono na amri/huduma fulani.

Thamani yoyote ya `azd env set` haitakuwa moja kwa moja parameta ya miundombinu au mpangilio wa programu uliowekwa. Rejelea wazi katika faili la parameta, mpangilio unaoungwa mkono wa huduma, au kifungo.

## Mpangilio wa Ulimwengu Wote

### Kuweka Vigeni vya Ulimwengu Wote
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

### Mipangilio ya Kawaida ya Ulimwengu Wote
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

## 🏗️ Mpangilio wa Mradi

### Muundo wa azure.yaml
Faili ya `azure.yaml` ni moyo wa mradi wako wa azd:

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

Huu ni **mfano wa ufafanuzi wa mradi**, si lazima kuwa mwanzo uliotolewa. Tengeneza saraka za chanzo zilizoashiria, skiripti za vifungo, skiripti za vifurushi, na `infra/main.bicep`/`main.parameters.json` zinazolingana kabla ya kuendesha. Hifadhidata zinapaswa kuwa katika miundombinu; `postgres` sio mwenyeji wa huduma aliyejumuishwa. Vigezo vya miundombinu weka katika faili la parameta la mtoa huduma, si `infra.parameters`.

### Chaguzi za Mpangilio wa Huduma

#### Aina za Mwenyeji
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

#### Vifungo vya Kujenga vya Lugha

Vipande vya huduma vifuatavyo vinaonyesha vifungo; vunganishe na `project` na `host` halisi za kila huduma. `buildCommand` na `startCommand` si mali za huduma ya jumla za azd. Sanidi kuanzishwa katika programu, Dockerfile, au miundombinu ya mwenyeji.

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

## 🌟 Usimamizi wa Mazingira

### Kuunda Mazingira
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Mpangilio wa Mazingira
Thamani za msingi za mazingira zipo katika `.azure/<env-name>/.env`, ikiwa ni pamoja na `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID`, na `AZURE_LOCATION`. Tumia `azd env config get/set` kwa mipangilio ya ziada ya JSON ya mazingira. JSON ifuatayo ni **hali ya dhana ya programu**, si jedwali la mpangilio wa azd; usirudishe kwenye faili za azd:

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

### Vigezo vya Mazingira

**Onyesho tu la maandishi wazi.** Thamani za kawaida za `azd env set` zinaandikwa katika `.azure/<name>/.env` na zinaweza kuchapishwa na amri za kusoma. Usitumie ufunguo wa API kama kibali halisi. Kwa siri, tumia `azd env set-secret` na uunganishaji wa wakati wa kukimbia kwa wazi.

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

### Vipimo vya Mazingira
Unda **siri zisizo za siri, zinazodhibitiwa kwa mikono** `.env.example` kwenye mzizi wa mradi kwa usanidi unaolingana. azd haipaki faili yenye jina `env.template` moja kwa moja:
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

### Kushirikiana Mazingira Kati ya Timu

Wakati watu zaidi ya mmoja wanapofanya kazi kwenye mradi, unahitaji kukubaliana juu ya **nini kinachosafirishwa pamoja na repo na nini kinabaki ndani**. azd huhifadhi kila mazingira chini ya folda ya `.azure/`, na si sehemu zote zinapaswa kuingizwa.

**Kile kilichopo kwenye `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Kile cha kuepuka kwenye gitignore.** chaguo-msingi cha azd cha `.gitignore` tayari kinajumuisha kuepuka `.azure/`. Endelea hivyo—faili za `.env` zinaweza kuwa na siri, na vitambulisho vya rasilimali ni maalum kwa mtu aliyezitoa. Kila mshirika wa timu huunda mazingira yao **binafsi** kwa ndani:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Kubadilisha kati ya mazingira.** Mjenzi wa programu anayesimamia mazingira mengi huchagua lililo hai kabla ya kuendesha amri:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Kutoa chaguo-msingi zisizo za siri kwa timu.** Ingiza `.env.example` nje ya saraka ya `.azure/` inayosemekana. Washirika wapya wanakopia kwenye faili iliyosahauliwa kwa ndani, kujaza thamani, na kuileta waziwazi kwa `azd env set --file <local-file>`. Kamwe usilete nafasi tupu juu ya mazingira yanayofanya kazi.

**Mazingira kwenye CI/CD.** Mipipa-haipati folda yako ya ndani ya `.azure/`. Badala yake, toa thamani za mazingira kama tofauti/siri za mviringo, na azd huvasoma kutoka kwenye mazingira ya mchakato:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Kanuni ya kidole gumba:** msimbo wa miundombinu (`infra/`, `azure.yaml`) hushirikiwa kwenye Git; *hali ya mazingira na siri* (`.azure/`) ni kwa kila mtengenezaji na kwa kila mtiririko wa kazi. `azd pipeline config` huandaa vigezo vya mtiririko wa kazi kwa ajili yako moja kwa moja.

## 🔐 Usanidi wa Uthibitishaji

### Uunganishaji wa Azure CLI
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Uthibitishaji wa Service Principal
Kwa mitiririko ya kazi ya CI/CD:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Kitambulisho Kilichosimamiwa
Kwa mazingira yanayohudumiwa Azure:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Usanidi wa Miundombinu

### Vigezo vya Bicep
Sanidi vigezo vya miundombinu katika `infra/main.parameters.json`:
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

### Usanidi wa Terraform
Kwa miradi ya Terraform, azd hubadilisha vigezo vya `infra/main.tfvars.json`. Majina haya lazima yaendane na vigezo vilivyotangazwa kama ingizo la Terraform:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Usanidi wa Utekelezaji

### Usanidi wa Ujenzi
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

### Usanidi wa Docker
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
Njia ni kwa mujibu wa mradi wa huduma. Faili ya Dockerfile lazima itangaze thamani yoyote ya `ARG` inayotumiwa. Kwa ujenzi wa hatua nyingi, weka hatua inayoweza kutekelezwa mwishoni au tumia mtiririko maalum wa upakiaji; `docker.target` si sifa inayoungwa mkono katika muundo ulioangaliwa.

## 🔧 Usanidi wa Juu Zaidi

### Kutoa majina ya Rasilimali Maalum
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Tambua majina halisi ya rasilimali katika Bicep/Terraform na zahirisha utengenezaji wa kundi la rasilimali kuendana na usanidi huu. Hakuna funguo za usanidi za jumla `naming.storageAccount` au `naming.keyVault`.

### Usanidi wa Mtandao
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Changanya **viongozi hivi vya mfano wa vigezo** ndani ya `infra/main.parameters.json` chini ya `parameters`, na eleza na tumia vigezo vinavyolingana katika Bicep. Havifanyi kazi peke yake.

### Usanidi wa Ufuatiliaji
Toa Application Insights na Log Analytics katika Bicep/Terraform na sanidi telemetry ya programu katika SDK yako. Hakuna sehemu ya juu ya jumla ya `monitoring` ndani ya `azure.yaml` inayounda rasilimali hizi. Angalia [miundombinu ya ufuatiliaji](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Usanidi wa Mazingira Maalum

### Mazingira ya Maendeleo
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Mazingira ya Ukaguzi
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Mazingira ya Uzalishaji
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Uhakiki wa Usanidi

### Hakiki Usanidi
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Script za Usanidi
Tengeneza script za uhakiki ndani ya `scripts/`:

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

## 🎓 Misingi Bora

### 1. Tumia Vigezo vya Mazingira
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Epuka kuandika moja kwa moja maadili nyeti (usanidi huu ni mfano tu, si funguo ya pili ya `database` katika faili moja):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Pangilia Faili za Usanidi
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

### 3. Mawazo Kuhusu Udhibiti wa Toleo
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Uwasilishaji wa Usanidi
Andika usanidi wako katika `CONFIG.md`:
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

## 🎯 Mazoezi ya Vitendo

### Zozi la 1: Usanidi wa Mazingira Mengi (Dakika 15)

**Lengo**: Unda na usanidi mazingira matatu ya ndani yenye maadili tofauti. Anza katika mradi uliowekwa; tumia majina ambayo hayajatumiwa ikiwa tayari yamepo. Maadili haya maalumu ya programu hayatabadilisha mipangilio ya telemetry/udu uzima hadi kiolezo chako kitavitumia.

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

**Vigezo vya Mafanikio:**
- [ ] Mazingira matatu yameundwa kwa mafanikio
- [ ] Kila mazingira yana usanidi wa kipekee
- [ ] Inawezekana kubadilisha kati ya mazingira bila makosa
- [ ] `azd env list` inaonyesha mazingira yote matatu

### Zozi la 2: Marejeleo ya Siri ya Key Vault (Dakika 10-20)

**Lengo**: Hifadhi rejeleo la Key Vault badala ya maandishi wazi. **Mwanzo:** mazingira yaliyoanzishwa, uingiaji wa Azure, na ufikiaji wa Key Vault wenye ruhusa ya kuunda/kusoma siri ya mfano wa majaribio. Matumizi ya vault yanaweza kuwa na gharama.

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

**Vigezo vya Mafanikio:**
- [ ] Amri ya kiingilio inaonyesha vault na rejeleo la siri ililo chaguliwa
- [ ] `.env` ya ndani ina rejeleo badala ya siri ya mfano
- [ ] Inaweza kueleza kwamba kitambulisho cha uendeshaji/RBAC na matumizi bado yanahitaji kusanidiwa

**Masuala ya kawaida:** 403 inahitaji jukumu sahihi la data-plane la vault na muda wa kusambaza; `azd env set ... --secret` si amri halali. Matokeo ya kawaida ya `get-values`/`get-value` hayapaswi kudhaniwa kama yamefichwa. Ondoa rejeleo la mafunzo kwa `azd env unset TRAINING_API_KEY`; hii haisafi siri ya vault, ambayo lazima usafishe kando ikiwa uliitengeneza.

## Hatua Zifuatazo

- [Mradi Wako wa Kwanza](../chapter-01-foundation/first-project.md) - Tumia usanidi mazoezini
- [Mwongozo wa Utekelezaji](../chapter-04-infrastructure/deployment-guide.md) - Tumia usanidi kwa utekelezaji
- [Kutoa Rasilimali](../chapter-04-infrastructure/provisioning.md) - Usanidi tayari uzalishaji

## Marejeleo

- [Marejeleo ya Usanidi wa azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Muundo wa azure.yaml](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Vigezo vya Mazingira](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Ukurasa wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 3 - Usanidi & Uthibitishaji
- **⬅️ Iliyotangulia**: [Mradi Wako wa Kwanza](../chapter-01-foundation/first-project.md)
- **➡️ Sura Inayofuata**: [Sura ya 4: Miundombinu kama Msimbo](../chapter-04-infrastructure/deployment-guide.md)
- **Somo Linalofuata**: [Uthibitishaji & Usalama](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->