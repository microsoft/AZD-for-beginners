# Gabay sa Konfigurasyon

**Pag-navigate sa Kabanata:**
- **📚 Home ng Kurso**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 3 - Konfigurasyon at Pagpapatunay
- **⬅️ Nakaraan**: [Ang Iyong Unang Proyekto](first-project.md)
- **➡️ Susunod**: [Gabay sa Deployment](../deployment/deployment-guide.md)
- **🚀 Susunod na Kabanata**: [Kabanata 4: Infrastructure as Code](../deployment/deployment-guide.md)

## Panimula

Ang komprehensibong gabay na ito ay sumasaklaw sa lahat ng aspeto ng pag-configure ng Azure Developer CLI para sa optimal na workflows sa pag-develop at pag-deploy. Matutunan mo ang tungkol sa hierarchy ng konfigurasyon, pamamahala ng environment, mga pamamaraan ng pagpapatunay, at mga advanced na pattern ng konfigurasyon na nagbibigay-daan sa mas epektibo at ligtas na Azure deployments.

## Mga Layunin sa Pag-aaral

Sa pagtatapos ng araling ito, ikaw ay:
- Magiging bihasa sa hierarchy ng konfigurasyon ng azd at mauunawaan kung paano inuuna ang mga setting
- Epektibong makakapag-configure ng global at project-specific na mga setting
- Makakapamahala ng maraming environment na may iba't ibang konfigurasyon
- Makakapagpatupad ng ligtas na mga pattern ng pagpapatunay at awtorisasyon
- Mauunawaan ang mga advanced na pattern ng konfigurasyon para sa mas kumplikadong mga sitwasyon

## Mga Resulta ng Pag-aaral

Pagkatapos makumpleto ang araling ito, ikaw ay:
- Makakapag-configure ng azd para sa optimal na workflows sa pag-develop
- Makakapag-set up at makakapamahala ng maraming deployment environment
- Makakapagpatupad ng ligtas na mga kasanayan sa pamamahala ng konfigurasyon
- Makakapag-troubleshoot ng mga isyu na may kaugnayan sa konfigurasyon
- Makakapag-customize ng behavior ng azd para sa partikular na mga pangangailangan ng organisasyon

Ang komprehensibong gabay na ito ay sumasaklaw sa lahat ng aspeto ng pag-configure ng Azure Developer CLI para sa optimal na workflows sa pag-develop at pag-deploy.

## Hierarchy ng Konfigurasyon

Ang azd ay gumagamit ng hierarchical na sistema ng konfigurasyon:
1. **Mga flag sa command-line** (pinakamataas na priyoridad)
2. **Mga environment variable**
3. **Local na konfigurasyon ng proyekto** (`.azd/config.json`)
4. **Global na konfigurasyon ng user** (`~/.azd/config.json`)
5. **Mga default na halaga** (pinakamababang priyoridad)

## Global na Konfigurasyon

### Pag-set ng Global Defaults
```bash
# Itakda ang default na subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Itakda ang default na lokasyon
azd config set defaults.location "eastus2"

# Itakda ang default na naming convention para sa resource group
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Tingnan ang lahat ng global na configuration
azd config list

# Alisin ang isang configuration
azd config unset defaults.location
```

### Karaniwang Global Settings
```bash
# Mga kagustuhan sa pag-unlad
azd config set alpha.enable true                    # Paganahin ang mga alpha na tampok
azd config set telemetry.enabled false             # I-disable ang telemetry
azd config set output.format json                  # Itakda ang format ng output

# Mga setting ng seguridad
azd config set auth.useAzureCliCredential true     # Gamitin ang Azure CLI para sa awtentikasyon
azd config set tls.insecure false                  # Ipatupad ang beripikasyon ng TLS

# Pag-tune ng pagganap
azd config set provision.parallelism 5             # Parallel na paglikha ng mapagkukunan
azd config set deploy.timeout 30m                  # Timeout ng deployment
```

## 🏗️ Konfigurasyon ng Proyekto

### Istruktura ng azure.yaml
Ang `azure.yaml` file ang sentro ng iyong azd na proyekto:

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

#### Mga Setting na Batay sa Wika
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

## 🌟 Pamamahala ng Environment

### Paglikha ng Mga Environment
```bash
# Gumawa ng bagong kapaligiran
azd env new development

# Gumawa gamit ang tiyak na lokasyon
azd env new staging --location "westus2"

# Gumawa mula sa template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfigurasyon ng Environment
Ang bawat environment ay may sariling konfigurasyon sa `.azure/<env-name>/config.json`:

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

### Mga Environment Variable
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

### Mga Template ng Environment
Gumawa ng `.azure/env.template` para sa pare-parehong setup ng environment:
```bash
# Kinakailangang mga variable
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

## 🔐 Konfigurasyon ng Pagpapatunay

### Integrasyon ng Azure CLI
```bash
# Gamitin ang mga kredensyal ng Azure CLI (default)
azd config set auth.useAzureCliCredential true

# Mag-login gamit ang partikular na tenant
az login --tenant <tenant-id>

# Itakda ang default na subscription
az account set --subscription <subscription-id>
```

### Pagpapatunay gamit ang Service Principal
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
Para sa mga environment na naka-host sa Azure:
```bash
# Paganahin ang authentication ng pinamamahalaang pagkakakilanlan
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Konfigurasyon ng Infrastructure

### Mga Parameter ng Bicep
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
Para sa mga proyekto ng Terraform, i-configure sa `infra/terraform.tfvars`:
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

## 🔧 Advanced na Konfigurasyon

### Custom na Pagpapangalan ng Resource
```bash
# Itakda ang mga kombensyon sa pagbibigay ng pangalan
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

### Konfigurasyon ng Monitoring
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

## 🎯 Mga Konfigurasyon na Batay sa Environment

### Environment ng Development
```bash
# .azure/pagpapaunlad/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Environment ng Staging
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Environment ng Production
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Pag-validate ng Konfigurasyon

### Pag-validate ng Konfigurasyon
```bash
# Suriin ang syntax ng configuration
azd config validate

# Subukan ang mga environment variable
azd env get-values

# I-validate ang imprastraktura
azd provision --dry-run
```

### Mga Script ng Konfigurasyon
Gumawa ng mga validation script sa `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Suriin ang kinakailangang mga variable ng kapaligiran
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# I-validate ang syntax ng azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Mga Best Practices

### 1. Gumamit ng Environment Variables
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

### 3. Mga Pagsasaalang-alang sa Version Control
```bash
# .gitignore
.azure/*/config.json         # Mga configuration ng kapaligiran (naglalaman ng mga resource ID)
.azure/*/.env               # Mga variable ng kapaligiran (maaaring naglalaman ng mga lihim)
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

**Layunin**: Gumawa at mag-configure ng tatlong environment na may iba't ibang setting

```bash
# Lumikha ng kapaligiran ng pag-unlad
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Lumikha ng kapaligiran ng pagsubok
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Lumikha ng kapaligiran ng produksyon
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# I-verify ang bawat kapaligiran
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Pamantayan ng Tagumpay:**
- [ ] Tatlong environment ang matagumpay na nagawa
- [ ] Ang bawat environment ay may natatanging konfigurasyon
- [ ] Maaaring magpalit sa pagitan ng mga environment nang walang error
- [ ] `azd env list` ay nagpapakita ng lahat ng tatlong environment

### Ehersisyo 2: Pamamahala ng Sekreto (10 minuto)

**Layunin**: Magpraktis ng ligtas na konfigurasyon gamit ang sensitibong data

```bash
# Itakda ang mga lihim (hindi ipinapakita sa output)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Itakda ang hindi lihim na config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Tingnan ang kapaligiran (dapat maitago ang mga lihim)
azd env get-values

# Tiyakin na ang mga lihim ay nakaimbak
azd env get DB_PASSWORD  # Dapat ipakita ang aktwal na halaga
```

**Pamantayan ng Tagumpay:**
- [ ] Ang mga sekreto ay na-store nang hindi ipinapakita sa terminal
- [ ] `azd env get-values` ay nagpapakita ng redacted na mga sekreto
- [ ] Ang indibidwal na `azd env get <SECRET_NAME>` ay nakakakuha ng aktwal na halaga

## Mga Susunod na Hakbang

- [Ang Iyong Unang Proyekto](first-project.md) - I-apply ang konfigurasyon sa praktika
- [Gabay sa Deployment](../deployment/deployment-guide.md) - Gamitin ang konfigurasyon para sa deployment
- [Pag-provision ng Mga Resource](../deployment/provisioning.md) - Mga konfigurasyon na handa para sa produksyon

## Mga Sanggunian

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Pag-navigate sa Kabanata:**
- **📚 Home ng Kurso**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 3 - Konfigurasyon at Pagpapatunay
- **⬅️ Nakaraan**: [Ang Iyong Unang Proyekto](first-project.md)
- **➡️ Susunod na Kabanata**: [Kabanata 4: Infrastructure as Code](../deployment/deployment-guide.md)
- **Susunod na Aralin**: [Ang Iyong Unang Proyekto](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->