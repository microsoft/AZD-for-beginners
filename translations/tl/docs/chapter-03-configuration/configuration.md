# Configuration Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Introduction

Ang komprehensibong gabay na ito ay sumasaklaw sa lahat ng aspeto ng pag-configure ng Azure Developer CLI para sa pinakamainam na workflow ng pag-develop at pag-deploy. Matututuhan mo ang tungkol sa hierarchy ng configuration, pamamahala ng environment, mga paraan ng authentication, at mga advanced na pattern ng configuration na nagpapahintulot ng mahusay at ligtas na Azure deployments.

## Learning Goals

Sa pagtatapos ng leksyon na ito, magagawa mong:
- Maging bihasa sa azd configuration hierarchy at maunawaan kung paano binibigyang-priyoridad ang mga setting
- I-configure nang epektibo ang global at project-specific na mga setting
- Pamahalaan ang maraming environment na may iba't ibang configuration
- Magpatupad ng ligtas na mga pattern ng authentication at authorization
- Unawain ang mga advanced na pattern ng configuration para sa kumplikadong mga senaryo

## Learning Outcomes

Pagkatapos makumpleto ang leksyon na ito, magagawa mong:
- I-configure ang azd para sa pinakamainam na workflow ng pag-develop
- Mag-setup at pamahalaan ang maraming deployment environment
- Magpatupad ng ligtas na mga kasanayan sa configuration management
- Mag-troubleshoot ng mga isyu na may kaugnayan sa configuration
- I-customize ang pag-uugali ng azd para sa mga partikular na pangangailangan ng organisasyon

Ang komprehensibong gabay na ito ay sumasaklaw sa lahat ng aspeto ng pag-configure ng Azure Developer CLI para sa pinakamainam na workflow ng pag-develop at pag-deploy.

## Understanding AI Agents in an azd Project

Kung bago ka sa mga AI agent, narito ang isang simpleng paraan ng pag-iisip tungkol sa mga ito sa loob ng mundo ng azd.

### What Is an Agent?

Ang isang ahente ay isang piraso ng software na maaaring tumanggap ng isang kahilingan, mag-isip tungkol dito, at gumawa ng mga aksyon—madalas sa pamamagitan ng pagtawag sa isang AI model, pagtingin ng datos, o pagtawag ng ibang mga serbisyo. Sa isang azd project, ang isang ahente ay isa lamang pang **serbisyo** kasama ng iyong web frontend o API backend.

### How Agents Fit Into the azd Project Structure

Ang isang azd project ay binubuo ng tatlong layer: **infrastructure**, **code**, at **configuration**. Ang mga ahente ay kumakabit sa mga layer na ito sa parehong paraan ng ibang serbisyo:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Nagpo-provision ng web app at database | Nagpo-provision ng AI model endpoint, search index, o agent host |
| **Code** (`src/`) | Naglalaman ng iyong frontend at API source code | Naglalaman ng iyong agent logic at prompt definitions |
| **Configuration** (`azure.yaml`) | Nagtatala ng iyong mga serbisyo at kanilang hosting targets | Nagtatala ng iyong ahente bilang isang serbisyo, na nagtuturo sa kanyang code at host |

### The Role of `azure.yaml`

Hindi mo kailangang memoriahin ang syntax ngayon. Sa konsepto, ang `azure.yaml` ang file kung saan sinasabi mo sa azd: *"Narito ang mga serbisyong bumubuo sa aking aplikasyon, at narito kung saan makikita ang kanilang code."*

Kapag ang iyong proyekto ay may kasamang AI agent, ang `azure.yaml` ay simpleng naglilista ng agent na iyon bilang isa sa mga serbisyo. Alam na ng azd kung ano ang puproteksiyunan sa infra (tulad ng isang Microsoft Foundry Models endpoint o isang Container App para pag-host ng ahente) at ide-deploy ang iyong agent code—tulad ng pag-deploy nito para sa isang web app o API.

Ibig sabihin nito, walang bagay na talagang bago na kailangang matutunan. Kung naiintindihan mo kung paano pinamamahalaan ng azd ang isang web service, naiintindihan mo na rin kung paano nito pinamamahalaan ang isang ahente.

## Configuration Hierarchy

Gumagamit ang azd ng hierarchical configuration system:
1. **Command-line flags** (pinakamataas na priyoridad)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (pinakamababang priyoridad)

## Global Configuration

### Setting Global Defaults
```bash
# Itakda ang default na subskripsyon
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Itakda ang default na lokasyon
azd config set defaults.location "eastus2"

# Itakda ang default na kumbensiyon ng pagngalan para sa grupo ng resource
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Tingnan ang lahat ng pandaigdigang konfigurasyon
azd config show

# Alisin ang isang konfigurasyon
azd config unset defaults.location
```

### Common Global Settings
```bash
# Mga kagustuhan sa pag-develop
azd config set alpha.enable true                    # Paganahin ang mga alpha na tampok
azd config set telemetry.enabled false             # Huwag paganahin ang telemetry
azd config set output.format json                  # Itakda ang format ng output

# Mga setting ng seguridad
azd config set auth.useAzureCliCredential true     # Gamitin ang Azure CLI para sa awtentikasyon
azd config set tls.insecure false                  # Ipatupad ang pag-verify ng TLS

# Pagpinaayos ng pagganap
azd config set provision.parallelism 5             # Sabayang paglikha ng mga resource
azd config set deploy.timeout 30m                  # Timeout ng deployment
```

## 🏗️ Project Configuration

### azure.yaml Structure
Ang `azure.yaml` file ang puso ng iyong azd project:

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

### Service Configuration Options

#### Host Types
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

#### Language-Specific Settings
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

## 🌟 Environment Management

### Creating Environments
```bash
# Lumikha ng bagong kapaligiran
azd env new development

# Lumikha gamit ang tiyak na lokasyon
azd env new staging --location "westus2"

# Lumikha mula sa template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Environment Configuration
Bawat environment ay may sarili nitong configuration sa `.azure/<env-name>/config.json`:

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

### Environment Variables
```bash
# Itakda ang mga variable na tiyak sa kapaligiran
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

# Patunayan ang pagtanggal
azd env get-values | grep DEBUG
# (hindi dapat magbalik ng anumang bagay)
```

### Environment Templates
Gumawa ng `.azure/env.template` para sa konsistent na setup ng environment:
```bash
# Mga kinakailangang variable
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Mga setting ng aplikasyon
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Mga opsyonal na setting ng pag-develop
DEBUG=false
LOG_LEVEL=info
```

### Sharing Environments Across a Team

Kapag higit sa isang tao ang nagtatrabaho sa isang proyekto, kailangan ninyong magkasundo kung **ano ang sasama sa repo at ano ang mananatiling lokal**. Inilalagay ng azd ang bawat environment sa ilalim ng isang `.azure/` folder, at hindi lahat nito ay dapat i-commit.

**Ano ang nasa `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**Ano ang dapat i-gitignore.** Ang default na `.gitignore` ng azd ay kasalukuyang hindi kasama ang `.azure/`. Panatilihin ito sa ganoong paraan—ang mga `.env` file ay maaaring maglaman ng mga secret, at ang mga resource ID ay partikular sa taong nag-provision ng mga ito. Bawat kasamahan ay lumilikha ng kanilang **sariling** environment nang lokal:

```bash
# Bawat developer ay nagpapatakbo nito nang isang beses para magkaroon ng sarili nilang hiwalay na kapaligiran.
azd env new dev-alice
azd up
```

**Pagpapalit-palit ng mga environment.** Ang isang developer na humahawak ng maraming environment ay pinipili ang aktibo bago magpatakbo ng mga command:

```bash
azd env list                 # tingnan ang lahat ng lokal na kapaligiran at kung alin ang default
azd env select staging       # itakda ang 'staging' bilang aktibong kapaligiran
azd env get-values           # kumpirmahin na tumuturo ka sa tamang isa
```

**Pagbibigay ng non-secret defaults sa koponan.** I-commit ang isang template (tulad ng `.azure/env.template` sa itaas) para malaman ng lahat kung aling mga variable ang dapat itakda—ngunit huwag kailanman i-commit ang mga napunan na halaga. Kinokopya ng mga bagong kasamahan ang template at pinupunan ang kanilang sariling mga halaga.

**Mga Environment sa CI/CD.** Hindi binabasa ng mga pipeline ang iyong lokal na `.azure/` folder. Sa halip, ibigay ang mga halaga ng environment bilang pipeline variables/secrets, at binabasa ito ng azd mula sa process environment:

```bash
# Sa CI, binabasa ng azd ang mga ito mula sa environment, hindi mula sa .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Rule of thumb:** ang infrastructure code (`infra/`, `azure.yaml`) ay ibinabahagi sa Git; ang *state at mga secret ng environment* (`.azure/`) ay para sa bawat developer at bawat pipeline. Ang `azd pipeline config` ang nagse-set up ng pipeline variables para sa iyo nang awtomatiko.

## 🔐 Authentication Configuration

### Azure CLI Integration
```bash
# Gumamit ng mga kredensyal ng Azure CLI (default)
azd config set auth.useAzureCliCredential true

# Mag-login gamit ang partikular na tenant
az login --tenant <tenant-id>

# Itakda ang default na subscription
az account set --subscription <subscription-id>
```

### Service Principal Authentication
Para sa CI/CD pipelines:
```bash
# Itakda ang mga environment variable
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# O i-configure nang direkta
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Para sa mga Azure-hosted na environment:
```bash
# Paganahin ang pagpapatunay ng pinamamahalaang pagkakakilanlan
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastructure Configuration

### Bicep Parameters
I-configure ang mga infrastructure parameter sa `infra/main.parameters.json`:
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

### Terraform Configuration
Para sa mga Terraform project, i-configure sa `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Deployment Configuration

### Build Configuration
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

### Docker Configuration
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
Example `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Advanced Configuration

### Custom Resource Naming
```bash
# Itakda ang mga panuntunan sa pagpapangalan.
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Network Configuration
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Monitoring Configuration
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

## 🎯 Environment-Specific Configurations

### Development Environment
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Staging Environment
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Production Environment
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Configuration Validation

### Validate Configuration
```bash
# Suriin ang sintaks ng konfigurasyon
azd config validate

# Subukan ang mga variable ng kapaligiran
azd env get-values

# Patunayan ang imprastruktura
azd provision --dry-run
```

### Configuration Scripts
Gumawa ng mga validation script sa `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Suriin ang mga kinakailangang environment variable
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

## 🎓 Best Practices

### 1. Use Environment Variables
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organize Configuration Files
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

### 3. Version Control Considerations
```bash
# .gitignore
.azure/*/config.json         # Mga konfigurasyon ng kapaligiran (naglalaman ng mga ID ng resource)
.azure/*/.env               # Mga variable ng kapaligiran (maaaring maglaman ng mga lihim)
.env                        # Lokal na file ng kapaligiran
```

### 4. Configuration Documentation
Idokumento ang iyong configuration sa `CONFIG.md`:
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

## 🎯 Hands-On Practice Exercises

### Exercise 1: Multi-Environment Configuration (15 minutes)

**Goal**: Gumawa at i-configure ang tatlong environment na may magkakaibang setting

```bash
# Gumawa ng kapaligiran para sa development
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Gumawa ng kapaligiran para sa staging
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Gumawa ng kapaligiran para sa production
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Suriin ang bawat kapaligiran
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Success Criteria:**
- [ ] Tatlong environment ang matagumpay na nagawa
- [ ] Bawat environment ay may natatanging configuration
- [ ] Kayang magpalit-palit ng environment nang walang error
- [ ] Ipinapakita ng `azd env list` ang lahat ng tatlong environment

### Exercise 2: Secret Management (10 minutes)

**Goal**: Magsanay ng ligtas na configuration gamit ang sensitibong datos

```bash
# Itakda ang mga lihim (hindi ipapakita sa output)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Itakda ang hindi-lihim na konfigurasyon
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Tingnan ang kapaligiran (dapat maitago ang mga lihim)
azd env get-values

# Tiyakin na naka-imbak ang mga lihim
azd env get DB_PASSWORD  # Dapat ipakita ang aktwal na halaga
```

**Success Criteria:**
- [ ] Na-store ang mga secret nang hindi nagpapakita sa terminal
- [ ] Ipinapakita ng `azd env get-values` ang na-redact na mga secret
- [ ] Ang indibidwal na `azd env get <SECRET_NAME>` ay nakakakuha ng aktwal na halaga

## Next Steps

- [Your First Project](first-project.md) - I-apply ang configuration sa praktika
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Gamitin ang configuration para sa deployment
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Mga production-ready na configuration

## References

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->