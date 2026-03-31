# Gabay sa Konfigurasyon

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 3 - Konfigurasyon at Pagpapatotoo
- **⬅️ Nakaraan**: [Ang Iyong Unang Proyekto](first-project.md)
- **➡️ Susunod**: [Gabay sa Pag-deploy](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Susunod na Kabanata**: [Kabanata 4: Imprastruktura bilang Code](../chapter-04-infrastructure/deployment-guide.md)

## Panimula

Ang komprehensibong gabay na ito ay sumasaklaw sa lahat ng aspeto ng pagsasaayos ng Azure Developer CLI para sa optimal na mga workflow ng pag-develop at pag-deploy. Matututuhan mo ang tungkol sa hierarkiya ng konfigurasyon, pamamahala ng kapaligiran, mga pamamaraan ng pagpapatotoo, at mga advanced na pattern ng konfigurasyon na nagpapahintulot ng mahusay at ligtas na pag-deploy sa Azure.

## Mga Layunin ng Pagkatuto

Sa pagtatapos ng araling ito, magagawa mong:
- Masterin ang hierarkiya ng konfigurasyon ng azd at maunawaan kung paano inuuna ang mga setting
- I-configure nang epektibo ang mga global at project-specific na setting
- Pamahalaan ang maramihang kapaligiran na may magkakaibang konfigurasyon
- Ipatupad ang ligtas na mga pattern ng pagpapatotoo at awtorisasyon
- Maunawaan ang mga advanced na pattern ng konfigurasyon para sa mga kumplikadong senaryo

## Mga Kinalabasan ng Pagkatuto

Matapos makumpleto ang araling ito, magagawa mong:
- I-configure ang azd para sa optimal na mga workflow ng pag-develop
- Mag-set up at pamahalaan ang maramihang deployment na kapaligiran
- Ipatupad ang ligtas na mga kasanayan sa pamamahala ng konfigurasyon
- Mag-troubleshoot ng mga isyung may kaugnayan sa konfigurasyon
- I-customize ang pag-uugali ng azd para sa mga partikular na pangangailangan ng organisasyon

Ang komprehensibong gabay na ito ay sumasaklaw sa lahat ng aspeto ng pagsasaayos ng Azure Developer CLI para sa optimal na mga workflow ng pag-develop at pag-deploy.

## Pag-unawa sa mga AI agent sa isang proyektong azd

Kung bago ka sa mga AI agent, narito ang isang simpleng paraan upang isipin ang mga ito sa loob ng mundo ng azd.

### Ano ang isang Ahente?

Ang isang ahente ay isang piraso ng software na maaaring tumanggap ng kahilingan, mag-analisa tungkol dito, at gumawa ng mga aksyon—madalas sa pamamagitan ng pagtawag sa isang AI model, pagtingin sa data, o pag-invoke ng iba pang mga serbisyo. Sa isang proyektong azd, ang isang ahente ay isa lamang pang **serbisyo** kasabay ng iyong web frontend o API backend.

### Paano Naaangkop ang mga Agent sa Estruktura ng Proyektong azd

Ang isang proyektong azd ay binubuo ng tatlong layer: **imprastruktura**, **code**, at **konfigurasyon**. Ang mga agent ay kumokonekta sa mga layer na ito sa parehong paraan ng anumang ibang serbisyo:

| Antas | Ano ang Ginagawa Nito para sa Tradisyunal na App | Ano ang Ginagawa Nito para sa isang Ahente |
|-------|-------------------------------------|---------------------------|
| **Imprastruktura** (`infra/`) | Naghahanda ng web app at database | Naghahanda ng endpoint ng AI model, search index, o host para sa ahente |
| **Code** (`src/`) | Naglalaman ng iyong frontend at API source code | Naglalaman ng lohika ng iyong ahente at mga kahulugan ng prompt |
| **Konfigurasyon** (`azure.yaml`) | Nagtatala ng iyong mga serbisyo at kanilang hosting targets | Nagtatala ng iyong ahente bilang isang serbisyo, na nagtuturo sa code at host nito |

### Papel ng `azure.yaml`

Hindi mo kailangang kabisaduhin ang syntax ngayon. Sa konsepto, ang `azure.yaml` ang file kung saan sinasabi mo sa azd: *"Narito ang mga serbisyo na bumubuo sa aking application, at narito kung saan mahahanap ang kanilang code."*

Kapag kasama sa iyong proyekto ang isang AI agent, simpleng inililista ng `azure.yaml` ang agent bilang isa sa mga serbisyo. Alam ng azd na mag-provision ng tamang imprastruktura (tulad ng isang Microsoft Foundry Models endpoint o isang Container App para i-host ang ahente) at i-deploy ang iyong agent code—gaya ng ginagawa nito para sa isang web app o API.

Ibig sabihin wala nang bago na kailangang matutunan sa pinaka-pundamental na antas. Kung naiintindihan mo kung paano pinamamahalaan ng azd ang isang web service, naiintindihan mo na kung paano nito pinamamahalaan ang isang ahente.

## Hierarkiya ng Konfigurasyon

Gumagamit ang azd ng isang hierarchical na sistema ng konfigurasyon:
1. **Command-line flags** (pinakamataas na prayoridad)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (pinakamababang prayoridad)

## Global na Konfigurasyon

### Pagtatakda ng Mga Global na Default
```bash
# Itakda ang default na subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Itakda ang default na lokasyon
azd config set defaults.location "eastus2"

# Itakda ang default na kombensiyon sa pagpangalang ng resource group
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Tingnan ang lahat ng global na konfigurasyon
azd config show

# Alisin ang isang konfigurasyon
azd config unset defaults.location
```

### Karaniwang Mga Global na Setting
```bash
# Mga kagustuhan sa pag-develop
azd config set alpha.enable true                    # Paganahin ang mga alpha na tampok
azd config set telemetry.enabled false             # Huwag paganahin ang telemetry
azd config set output.format json                  # Itakda ang format ng output

# Mga setting ng seguridad
azd config set auth.useAzureCliCredential true     # Gamitin ang Azure CLI para sa awtentikasyon
azd config set tls.insecure false                  # Ipatupad ang pag-verify ng TLS

# Pagpapahusay ng pagganap
azd config set provision.parallelism 5             # Paralel na paglikha ng mga resource
azd config set deploy.timeout 30m                  # Timeout ng deployment
```

## 🏗️ Konfigurasyon ng Proyekto

### Estruktura ng `azure.yaml`
Ang `azure.yaml` file ang puso ng iyong proyektong azd:

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

#### Mga Setting na Espesipiko sa Wika
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

## 🌟 Pamamahala ng Kapaligiran

### Paglikha ng mga Kapaligiran
```bash
# Lumikha ng bagong kapaligiran
azd env new development

# Lumikha sa partikular na lokasyon
azd env new staging --location "westus2"

# Lumikha mula sa template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfigurasyon ng Kapaligiran
Bawat kapaligiran ay may sariling konfigurasyon sa `.azure/<env-name>/config.json`:

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
```bash
# Itakda ang mga variable na partikular sa kapaligiran
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Tingnan ang mga variable ng kapaligiran
azd env get-values

# Inaasahang output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Alisin ang variable ng kapaligiran
azd env unset DEBUG

# Tiyakin ang pagtanggal
azd env get-values | grep DEBUG
# (dapat walang ibalik)
```

### Mga Template ng Kapaligiran
Gumawa ng `.azure/env.template` para sa magkakatugmang pag-set up ng kapaligiran:
```bash
# Mga kinakailangang variable
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Mga setting ng aplikasyon
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Opsyonal na mga setting para sa pag-develop
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Konfigurasyon ng Pagpapatotoo

### Integrasyon ng Azure CLI
```bash
# Gamitin ang mga kredensyal ng Azure CLI (default)
azd config set auth.useAzureCliCredential true

# Mag-login gamit ang partikular na tenant
az login --tenant <tenant-id>

# Itakda ang default na subscription
az account set --subscription <subscription-id>
```

### Pagpapatotoo gamit ang Service Principal
Para sa CI/CD pipelines:
```bash
# Itakda ang mga variable ng kapaligiran
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# O i-configure nang direkta
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Para sa mga kapaligirang hinahosti sa Azure:
```bash
# Paganahin ang pagpapatunay gamit ang pinamamahalaang pagkakakilanlan.
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Konfigurasyon ng Imprastruktura

### Mga Parameter ng Bicep
I-configure ang mga parameter ng imprastruktura sa `infra/main.parameters.json`:
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
Para sa mga proyekto ng Terraform, i-configure sa `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Konfigurasyon ng Pag-deploy

### Konfigurasyon ng Build
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

### Konfigurasyon ng Docker
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
Halimbawa `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Mga Advanced na Konfigurasyon

### Pasadyang Pagpapangalan ng mga Resource
```bash
# Itakda ang mga panuntunan sa pagbibigay ng pangalan
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Konfigurasyon ng Network
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Konfigurasyon ng Pagmomonitor
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

## 🎯 Mga Konfigurasyong Tiyak sa Kapaligiran

### Kapaligiran ng Pag-develop
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Kapaligiran ng Staging
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Kapaligiran ng Produksyon
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Pagpapatunay ng Konfigurasyon

### Pag-validate ng Konfigurasyon
```bash
# Suriin ang sintaks ng konfigurasyon
azd config validate

# Subukan ang mga variable ng kapaligiran
azd env get-values

# Patunayan ang imprastruktura
azd provision --dry-run
```

### Mga Script ng Konfigurasyon
Gumawa ng mga script ng pagpapatunay sa `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Suriin ang mga kinakailangang variable ng kapaligiran
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Suriin ang sintaks ng azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Pinakamahusay na Kasanayan

### 1. Gamitin ang Mga Variable ng Kapaligiran
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Ayusin ang Mga File ng Konfigurasyon
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

### 3. Mga Dapat Isaalang-alang sa Version Control
```bash
# .gitignore
.azure/*/config.json         # Mga config ng kapaligiran (naglalaman ng mga ID ng resource)
.azure/*/.env               # Mga variable ng kapaligiran (maaaring maglaman ng mga sekreto)
.env                        # Lokal na file ng kapaligiran
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

### Ehersisyo 1: Konfigurasyon ng Maramihang Kapaligiran (15 minuto)

**Layunin**: Lumikha at i-configure ang tatlong kapaligiran na may magkakaibang setting

```bash
# Lumikha ng development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Lumikha ng staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Lumikha ng production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Suriin ang bawat environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Mga Pamantayan ng Tagumpay:**
- [ ] Tatlong kapaligiran ang matagumpay na nalikha
- [ ] Bawat kapaligiran ay may natatanging konfigurasyon
- [ ] Maaaring magpalit-palit sa pagitan ng mga kapaligiran nang walang mga error
- [ ] `azd env list` ay nagpapakita ng lahat ng tatlong kapaligiran

### Ehersisyo 2: Pamamahala ng Sekreto (10 minuto)

**Layunin**: Sanayin ang ligtas na konfigurasyon gamit ang sensitibong data

```bash
# Itakda ang mga lihim (hindi ipinapakita sa output)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Itakda ang hindi-lihim na konfigurasyon
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Tingnan ang kapaligiran (dapat maitago ang mga lihim)
azd env get-values

# Tiyakin na ang mga lihim ay naka-imbak
azd env get DB_PASSWORD  # Dapat ipakita ang aktwal na halaga
```

**Mga Pamantayan ng Tagumpay:**
- [ ] Ang mga sikreto ay naka-imbak nang hindi ipinapakita sa terminal
- [ ] `azd env get-values` ay nagpapakita ng mga nire-redact na sikreto
- [ ] Indibidwal na `azd env get <SECRET_NAME>` ay kumukuha ng aktwal na halaga

## Mga Susunod na Hakbang

- [Ang Iyong Unang Proyekto](first-project.md) - Ilapat ang konfigurasyon sa praktika
- [Gabay sa Pag-deploy](../chapter-04-infrastructure/deployment-guide.md) - Gamitin ang konfigurasyon para sa pag-deploy
- [Pag-provision ng Mga Resource](../chapter-04-infrastructure/provisioning.md) - Mga konfigurasyong handa para sa produksyon

## Sanggunian

- [Sanggunian ng Konfigurasyon ng azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Skema ng azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Mga Variable ng Kapaligiran](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 3 - Konfigurasyon at Pagpapatotoo
- **⬅️ Nakaraan**: [Ang Iyong Unang Proyekto](first-project.md)
- **➡️ Susunod**: [Kabanata 4: Imprastruktura bilang Code](../chapter-04-infrastructure/deployment-guide.md)
- **Susunod na Aralin**: [Ang Iyong Unang Proyekto](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Isinalin ang dokumentong ito gamit ang serbisyong pagsasalin na AI [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na mapagkakatiwalaang sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot para sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->