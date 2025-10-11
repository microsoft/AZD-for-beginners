<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2268ee429553504f96f4571074bcbf84",
  "translation_date": "2025-10-11T16:07:58+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "ta"
}
-->
# கட்டமைப்பு வழிகாட்டி

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 3 - கட்டமைப்பு மற்றும் அங்கீகாரம்
- **⬅️ முந்தையது**: [உங்கள் முதல் திட்டம்](first-project.md)
- **➡️ அடுத்தது**: [விநியோக வழிகாட்டி](../deployment/deployment-guide.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 4: குறியீட்டாக உள்ளமைப்பு](../deployment/deployment-guide.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி Azure Developer CLI-யை சிறந்த வளர்ச்சி மற்றும் விநியோக பண்பாட்டிற்காக அமைப்பதற்கான அனைத்து அம்சங்களையும் உள்ளடக்குகிறது. கட்டமைப்பு நிலைமுறை, சூழல் மேலாண்மை, அங்கீகார முறைகள் மற்றும் சிக்கலான Azure விநியோகங்களை திறமையாகவும் பாதுகாப்பாகவும் செயல்படுத்த உதவும் மேம்பட்ட கட்டமைப்பு முறைகளை நீங்கள் கற்றுக்கொள்வீர்கள்.

## கற்றல் இலக்குகள்

இந்த பாடத்தை முடிக்கும்போது, நீங்கள்:
- azd கட்டமைப்பு நிலைமுறையை கையாளவும், அமைப்புகள் எவ்வாறு முன்னுரிமை பெறுகின்றன என்பதை புரிந்துகொள்ளவும்
- உலகளாவிய மற்றும் திட்டத்திற்கேற்ப அமைப்புகளை திறமையாக அமைக்கவும்
- பல்வேறு கட்டமைப்புகளுடன் பல சூழல்களை மேலாண்மை செய்யவும்
- பாதுகாப்பான அங்கீகாரம் மற்றும் அனுமதி முறைகளை செயல்படுத்தவும்
- சிக்கலான சூழல்களுக்கு மேம்பட்ட கட்டமைப்பு முறைகளை புரிந்துகொள்ளவும்

## கற்றல் முடிவுகள்

இந்த பாடத்தை முடித்த பிறகு, நீங்கள்:
- வளர்ச்சி பண்பாட்டிற்காக azd-ஐ சிறப்பாக அமைக்கவும்
- பல விநியோக சூழல்களை அமைத்து மேலாண்மை செய்யவும்
- பாதுகாப்பான கட்டமைப்பு மேலாண்மை நடைமுறைகளை செயல்படுத்தவும்
- கட்டமைப்பு தொடர்பான பிரச்சினைகளை தீர்க்கவும்
- குறிப்பிட்ட நிறுவன தேவைகளுக்கு ஏற்ப azd செயல்பாட்டை தனிப்பயனாக்கவும்

இந்த விரிவான வழிகாட்டி Azure Developer CLI-யை சிறந்த வளர்ச்சி மற்றும் விநியோக பண்பாட்டிற்காக அமைப்பதற்கான அனைத்து அம்சங்களையும் உள்ளடக்குகிறது.

## கட்டமைப்பு நிலைமுறை

azd ஒரு நிலைமுறை கட்டமைப்பு அமைப்பை பயன்படுத்துகிறது:
1. **கட்டளை வரி கொடிகள்** (உயர்ந்த முன்னுரிமை)
2. **சூழல் மாறிகள்**
3. **உள்ளூர் திட்ட கட்டமைப்பு** (`.azd/config.json`)
4. **உலகளாவிய பயனர் கட்டமைப்பு** (`~/.azd/config.json`)
5. **இயல்புநிலை மதிப்புகள்** (குறைந்த முன்னுரிமை)

## உலகளாவிய கட்டமைப்பு

### உலகளாவிய இயல்புநிலைகளை அமைத்தல்
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# Set default resource group naming convention
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# View all global configuration
azd config list

# Remove a configuration
azd config unset defaults.location
```

### பொதுவான உலகளாவிய அமைப்புகள்
```bash
# Development preferences
azd config set alpha.enable true                    # Enable alpha features
azd config set telemetry.enabled false             # Disable telemetry
azd config set output.format json                  # Set output format

# Security settings
azd config set auth.useAzureCliCredential true     # Use Azure CLI for auth
azd config set tls.insecure false                  # Enforce TLS verification

# Performance tuning
azd config set provision.parallelism 5             # Parallel resource creation
azd config set deploy.timeout 30m                  # Deployment timeout
```

## 🏗️ திட்ட கட்டமைப்பு

### azure.yaml அமைப்பு
`azure.yaml` கோப்பு உங்கள் azd திட்டத்தின் மையமாகும்:

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

### சேவை கட்டமைப்பு விருப்பங்கள்

#### ஹோஸ்ட் வகைகள்
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

#### மொழி சார்ந்த அமைப்புகள்
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

## 🌟 சூழல் மேலாண்மை

### சூழல்களை உருவாக்குதல்
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### சூழல் கட்டமைப்பு
ஒவ்வொரு சூழலுக்கும் `.azure/<env-name>/config.json`-ல் தனிப்பட்ட கட்டமைப்பு உள்ளது:

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

### சூழல் மாறிகள்
```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

### சூழல் வார்ப்புருக்கள்
சீரான சூழல் அமைப்புக்காக `.azure/env.template` உருவாக்கவும்:
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

## 🔐 அங்கீகார கட்டமைப்பு

### Azure CLI ஒருங்கிணைப்பு
```bash
# Use Azure CLI credentials (default)
azd config set auth.useAzureCliCredential true

# Login with specific tenant
az login --tenant <tenant-id>

# Set default subscription
az account set --subscription <subscription-id>
```

### சேவை பிரதிநிதி அங்கீகாரம்
CI/CD குழாய்களுக்கு:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Or configure directly
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### மேலாண்மை அடையாளம்
Azure-இல் ஹோஸ்ட் செய்யப்பட்ட சூழல்களுக்கு:
```bash
# Enable managed identity authentication
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ உள்ளமைப்பு கட்டமைப்பு

### Bicep அளவுருக்கள்
`infra/main.parameters.json`-ல் உள்ளமைப்பு அளவுருக்களை அமைக்கவும்:
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

### Terraform கட்டமைப்பு
Terraform திட்டங்களுக்கு, `infra/terraform.tfvars`-ல் அமைக்கவும்:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 விநியோக கட்டமைப்பு

### கட்டமைப்பு அமைப்பு
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

### Docker கட்டமைப்பு
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

உதாரண `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 மேம்பட்ட கட்டமைப்பு

### தனிப்பயன் வள பெயரிடல்
```bash
# Set naming conventions
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### நெட்வொர்க் கட்டமைப்பு
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### கண்காணிப்பு கட்டமைப்பு
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

## 🎯 சூழல் சார்ந்த கட்டமைப்புகள்

### வளர்ச்சி சூழல்
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### இடைநிலை சூழல்
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### உற்பத்தி சூழல்
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 கட்டமைப்பு சரிபார்ப்பு

### கட்டமைப்பை சரிபார்க்கவும்
```bash
# Check configuration syntax
azd config validate

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --dry-run
```

### கட்டமைப்பு ஸ்கிரிப்ட்கள்
`scripts/`-ல் சரிபார்ப்பு ஸ்கிரிப்ட்களை உருவாக்கவும்:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Validate azure.yaml syntax
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 சிறந்த நடைமுறைகள்

### 1. சூழல் மாறிகளை பயன்படுத்தவும்
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. கட்டமைப்பு கோப்புகளை ஒழுங்குபடுத்தவும்
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

### 3. பதிப்பு கட்டுப்பாட்டு கருத்துக்கள்
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. கட்டமைப்பு ஆவணங்கள்
உங்கள் கட்டமைப்பை `CONFIG.md`-ல் ஆவணப்படுத்தவும்:
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

## அடுத்த படிகள்

- [உங்கள் முதல் திட்டம்](first-project.md) - நடைமுறையில் கட்டமைப்பை பயன்படுத்தவும்
- [விநியோக வழிகாட்டி](../deployment/deployment-guide.md) - விநியோகத்திற்கான கட்டமைப்பை பயன்படுத்தவும்
- [வளங்களை வழங்குதல்](../deployment/provisioning.md) - உற்பத்தி-தயார் கட்டமைப்புகள்

## குறிப்புகள்

- [azd கட்டமைப்பு குறிப்புகள்](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml திட்டம்](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [சூழல் மாறிகள்](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 3 - கட்டமைப்பு மற்றும் அங்கீகாரம்
- **⬅️ முந்தையது**: [உங்கள் முதல் திட்டம்](first-project.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 4: குறியீட்டாக உள்ளமைப்பு](../deployment/deployment-guide.md)
- **அடுத்த பாடம்**: [உங்கள் முதல் திட்டம்](first-project.md)

---

**குறிப்பு**:  
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழிபெயர்ப்பு சேவையைப் பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கிறோம், ஆனால் தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளுங்கள். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.