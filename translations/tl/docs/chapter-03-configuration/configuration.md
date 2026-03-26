# Patnubay sa Konfigurasyon

**Pag-navigate ng Kabanata:**
- **📚 Pangunahing Pahina ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 3 - Konfigurasyon & Autentikasyon
- **⬅️ Nakaraang**: [Ang Iyong Unang Proyekto](first-project.md)
- **➡️ Susunod**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Susunod na Kabanata**: [Kabanata 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Panimula

Saklaw ng komprehensibong gabay na ito ang lahat ng aspeto ng pagkonpigura ng Azure Developer CLI para sa pinakamainam na mga workflow ng pag-develop at deployment. Matutuhan mo ang tungkol sa hierarchy ng konfigurasyon, pamamahala ng kapaligiran, mga paraan ng autentikasyon, at mga advanced na pattern ng konfigurasyon na nagpapahintulot ng mahusay at ligtas na mga deployment sa Azure.

## Mga Layunin ng Pagkatuto

Sa pagtatapos ng araling ito, magagawa mong:
- Masterin ang hirarkiya ng konfigurasyon ng azd at maunawaan kung paano pinaprayoridad ang mga setting
- I-configure nang epektibo ang mga global at project-specific na setting
- Pamahalaan ang maramihang mga kapaligiran na may magkakaibang konfigurasyon
- Magpatupad ng ligtas na mga pattern ng autentikasyon at awtorisasyon
- Unawain ang mga advanced na pattern ng konfigurasyon para sa mga kumplikadong senaryo

## Mga Kinalabasan ng Pagkatuto

Pagkatapos makumpleto ang araling ito, magagawa mong:
- I-configure ang azd para sa pinakamainam na mga workflow ng pag-develop
- Mag-set up at pamahalaan ang maramihang mga deployment environment
- Magpatupad ng ligtas na mga kasanayan sa pamamahala ng konfigurasyon
- Mag-troubleshoot ng mga isyung may kaugnayan sa konfigurasyon
- I-customize ang pag-uugali ng azd para sa mga partikular na pangangailangan ng organisasyon

Saklaw ng komprehensibong gabay na ito ang lahat ng aspeto ng pagkonpigura ng Azure Developer CLI para sa pinakamainam na mga workflow ng pag-develop at deployment.

## Pag-unawa sa mga AI Agent sa isang azd Project

Kung bago ka sa mga AI agent, narito ang isang simpleng paraan ng pag-iisip tungkol sa kanila sa loob ng mundo ng azd.

### Ano ang Agent?

Ang agent ay isang piraso ng software na maaaring tumanggap ng kahilingan, mag-reason tungkol dito, at kumilos—madalas sa pamamagitan ng pagtawag sa isang AI model, pagtingin sa datos, o pag-invoke ng ibang mga serbisyo. Sa isang azd project, ang agent ay isa lamang pang **serbisyo** kasama ng iyong web frontend o API backend.

### Paano Nagkakasya ang Mga Agent sa Istruktura ng azd Project

Ang isang azd project ay binubuo ng tatlong layer: **infrastructure**, **code**, at **configuration**. Ang mga agent ay kumakabit sa mga layer na ito sa parehong paraan ng ibang serbisyo:

| Antas | Ano ang Ginagawa Nito para sa Tradisyonal na App | Ano ang Ginagawa Nito para sa isang Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Nagpo-provision ng web app at database | Nagpo-provision ng endpoint ng AI model, search index, o host para sa agent |
| **Code** (`src/`) | Naglalaman ng iyong frontend at API source code | Naglalaman ng iyong agent logic at mga definisyon ng prompt |
| **Configuration** (`azure.yaml`) | Nagsasaad ng iyong mga serbisyo at kanilang hosting targets | Nagsasaad ng iyong agent bilang isang serbisyo, na tumutukoy sa kanyang code at host |

### Ang Papel ng `azure.yaml`

Hindi mo kailangang matandaan ang syntax ngayon. Sa konsepto, ang `azure.yaml` ang file kung saan sinasabi mo sa azd: *"Narito ang mga serbisyo na bumubuo sa aking aplikasyon, at narito kung saan hahanapin ang kanilang code."*

Kapag ang iyong proyekto ay may kasama na AI agent, simpleng inililista ng `azure.yaml` ang agent bilang isa sa mga serbisyo. Alam ng azd na magpo-provision ng tamang imprastruktura (tulad ng isang endpoint ng Microsoft Foundry Models o isang Container App para i-host ang agent) at ide-deploy ang iyong agent code—katulad ng gagawin nito para sa isang web app o API.

Ibig sabihin, wala talagang bagong bagay na kailangang matutunan. Kung naiintindihan mo kung paano pinamamahalaan ng azd ang isang web service, naiintindihan mo na kung paano nito pinamamahalaan ang isang agent.

## Hirarkiya ng Konfigurasyon

Gumagamit ang azd ng hierarchical na system ng konfigurasyon:
1. **Command-line flags** (pinakamataas na prayoridad)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (pinakamababang prayoridad)

## Global na Konfigurasyon

### Pagtatakda ng Global na Default
```bash
# Itakda ang default na subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Itakda ang default na lokasyon
azd config set defaults.location "eastus2"

# Itakda ang default na pamantayan sa pagpapangalan ng resource group
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Tingnan ang lahat ng global na konfigurasyon
azd config list

# Alisin ang isang konfigurasyon
azd config unset defaults.location
```

### Karaniwang Global na Mga Setting
```bash
# Mga kagustuhan sa pag-develop
azd config set alpha.enable true                    # Paganahin ang mga alpha na tampok
azd config set telemetry.enabled false             # Huwag paganahin ang telemetry
azd config set output.format json                  # Itakda ang format ng output

# Mga setting ng seguridad
azd config set auth.useAzureCliCredential true     # Gamitin ang Azure CLI para sa awtentikasyon
azd config set tls.insecure false                  # Ipatupad ang pag-verify ng TLS

# Pagpapahusay ng pagganap
azd config set provision.parallelism 5             # Sabayang paglikha ng mga resource
azd config set deploy.timeout 30m                  # Timeout ng deployment
```

## 🏗️ Konfigurasyon ng Proyekto

### Istruktura ng `azure.yaml`
Ang file na `azure.yaml` ang puso ng iyong azd project:

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

### Paglikha ng Mga Kapaligiran
```bash
# Lumikha ng bagong kapaligiran
azd env new development

# Lumikha gamit ang tiyak na lokasyon
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

# Tanggalin ang variable ng kapaligiran
azd env unset DEBUG

# Patunayan ang pagtanggal
azd env get-values | grep DEBUG
# (hindi dapat magbalik ng anuman)
```

### Mga Template ng Kapaligiran
Gumawa ng `.azure/env.template` para sa pare-parehong setup ng kapaligiran:
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

## 🔐 Konfigurasyon ng Autentikasyon

### Integrasyon ng Azure CLI
```bash
# Gamitin ang mga kredensyal ng Azure CLI (default)
azd config set auth.useAzureCliCredential true

# Mag-log in gamit ang tukoy na tenant
az login --tenant <tenant-id>

# Itakda ang default na subscription
az account set --subscription <subscription-id>
```

### Autentikasyon ng Service Principal
Para sa mga CI/CD pipeline:
```bash
# Itakda ang mga environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# O i-configure nang direkta
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Para sa mga kapaligirang naka-host sa Azure:
```bash
# Paganahin ang awtentikasyon ng managed identity
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
Para sa mga Terraform project, i-configure sa `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Konfigurasyon ng Deployment

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
Halimbawa ng `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Mga Advanced na Konfigurasyon

### Pasadyang Pagpapangalan ng Resource
```bash
# Itakda ang mga alituntunin sa pagpangalan
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

### Konfigurasyon ng Pagsubaybay
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

## 🎯 Mga Konfigurasyong Espesipiko sa Kapaligiran

### Kapaligiran ng Development
```bash
# .azure/pagpapaunlad/.env
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

### I-validate ang Konfigurasyon
```bash
# Suriin ang sintaks ng konfigurasyon
azd config validate

# Subukan ang mga variable ng kapaligiran
azd env get-values

# Patunayan ang imprastruktura
azd provision --dry-run
```

### Mga Script ng Konfigurasyon
Gumawa ng mga validation script sa `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Suriin ang mga kinakailangang variable ng kapaligiran
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# I-validate ang sintaks ng azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Mga Pinakamahusay na Kasanayan

### 1. Gumamit ng Mga Variable ng Kapaligiran
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Ayusin ang mga File ng Konfigurasyon
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

### 3. Mga Pagsasaalang-alang sa Version Control
```bash
# .gitignore
.azure/*/config.json         # Mga config ng kapaligiran (naglalaman ng mga ID ng resource)
.azure/*/.env               # Mga variable ng kapaligiran (maaaring maglaman ng mga lihim)
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

### Ehersisyo 1: Multi-Environment Configuration (15 minuto)

**Layunin**: Lumikha at i-configure ang tatlong kapaligiran na may magkakaibang mga setting

```bash
# Lumikha ng development na kapaligiran
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Lumikha ng staging na kapaligiran
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Lumikha ng production na kapaligiran
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Suriin ang bawat kapaligiran
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Mga Pamantayan ng Tagumpay:**
- [ ] Tatlong kapaligiran ang matagumpay na nalikha
- [ ] Bawat kapaligiran ay may natatanging konfigurasyon
- [ ] Maaaring mag-switch sa pagitan ng mga kapaligiran nang walang error
- [ ] `azd env list` ay nagpapakita ng lahat ng tatlong kapaligiran

### Ehersisyo 2: Pamamahala ng Mga Secret (10 minuto)

**Layunin**: Magsanay ng ligtas na konfigurasyon para sa sensitibong data

```bash
# Itakda ang mga lihim (hindi ipinapakita sa output)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Itakda ang hindi-sikretong konfigurasyon
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Tingnan ang kapaligiran (dapat itinatakpan ang mga lihim)
azd env get-values

# Tiyakin na naka-imbak ang mga lihim
azd env get DB_PASSWORD  # Dapat ipakita ang aktwal na halaga
```

**Mga Pamantayan ng Tagumpay:**
- [ ] Ang mga secret ay naimbak nang hindi ipinapakita sa terminal
- [ ] `azd env get-values` ay nagpapakita ng mga redacted na secret
- [ ] Ang indibidwal na `azd env get <SECRET_NAME>` ay kumukuha ng aktwal na halaga

## Mga Susunod na Hakbang

- [Ang Iyong Unang Proyekto](first-project.md) - I-apply ang konfigurasyon sa praktika
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Gamitin ang konfigurasyon para sa deployment
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Mga konfigurasyong handa na para sa produksyon

## Mga Sanggunian

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Pag-navigate ng Kabanata:**
- **📚 Pangunahing Pahina ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 3 - Konfigurasyon & Autentikasyon
- **⬅️ Nakaraang**: [Ang Iyong Unang Proyekto](first-project.md)
- **➡️ Susunod na Kabanata**: [Kabanata 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Susunod na Aralin**: [Ang Iyong Unang Proyekto](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong pinagmulan. Para sa kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaintindihan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->