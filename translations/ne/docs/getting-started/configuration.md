<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2268ee429553504f96f4571074bcbf84",
  "translation_date": "2025-09-17T20:01:58+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "ne"
}
-->
# कन्फिगरेसन गाइड

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय ३ - कन्फिगरेसन र प्रमाणीकरण
- **⬅️ अघिल्लो**: [तपाईंको पहिलो प्रोजेक्ट](first-project.md)
- **➡️ अर्को**: [डिप्लोयमेन्ट गाइड](../deployment/deployment-guide.md)
- **🚀 अर्को अध्याय**: [अध्याय ४: कोडको रूपमा पूर्वाधार](../deployment/deployment-guide.md)

## परिचय

यो विस्तृत गाइडले Azure Developer CLI लाई विकास र डिप्लोयमेन्ट वर्कफ्लोको लागि प्रभावकारी रूपमा कन्फिगर गर्नका सबै पक्षहरू समेट्छ। तपाईं कन्फिगरेसनको पदानुक्रम, वातावरण व्यवस्थापन, प्रमाणीकरण विधिहरू, र जटिल Azure डिप्लोयमेन्टहरूलाई सक्षम बनाउने उन्नत कन्फिगरेसन ढाँचाहरू सिक्नुहुनेछ।

## सिक्ने लक्ष्यहरू

यस पाठको अन्त्यसम्म, तपाईं:
- azd कन्फिगरेसन पदानुक्रमलाई मास्टर गर्नुहुनेछ र सेटिङहरू कसरी प्राथमिकता दिइन्छ भन्ने बुझ्नुहुनेछ
- ग्लोबल र प्रोजेक्ट-विशिष्ट सेटिङहरू प्रभावकारी रूपमा कन्फिगर गर्नुहुनेछ
- विभिन्न कन्फिगरेसनहरूसहित बहुविध वातावरणहरू व्यवस्थापन गर्नुहुनेछ
- सुरक्षित प्रमाणीकरण र अधिकार ढाँचाहरू कार्यान्वयन गर्नुहुनेछ
- जटिल परिदृश्यहरूको लागि उन्नत कन्फिगरेसन ढाँचाहरू बुझ्नुहुनेछ

## सिक्ने परिणामहरू

यो पाठ पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- विकास वर्कफ्लोको लागि azd कन्फिगर गर्न
- बहुविध डिप्लोयमेन्ट वातावरणहरू सेटअप र व्यवस्थापन गर्न
- सुरक्षित कन्फिगरेसन व्यवस्थापन अभ्यासहरू कार्यान्वयन गर्न
- कन्फिगरेसनसँग सम्बन्धित समस्याहरू समाधान गर्न
- विशिष्ट संस्थागत आवश्यकताहरूको लागि azd व्यवहार अनुकूलन गर्न

यो विस्तृत गाइडले Azure Developer CLI लाई विकास र डिप्लोयमेन्ट वर्कफ्लोको लागि प्रभावकारी रूपमा कन्फिगर गर्नका सबै पक्षहरू समेट्छ।

## कन्फिगरेसन पदानुक्रम

azd ले पदानुक्रमित कन्फिगरेसन प्रणाली प्रयोग गर्दछ:
1. **कमाण्ड-लाइन फ्ल्यागहरू** (सबैभन्दा उच्च प्राथमिकता)
2. **वातावरण चरहरू**
3. **स्थानीय प्रोजेक्ट कन्फिगरेसन** (`.azd/config.json`)
4. **ग्लोबल प्रयोगकर्ता कन्फिगरेसन** (`~/.azd/config.json`)
5. **डिफल्ट मानहरू** (सबैभन्दा कम प्राथमिकता)

## ग्लोबल कन्फिगरेसन

### ग्लोबल डिफल्ट सेटिङ
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

### सामान्य ग्लोबल सेटिङहरू
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

## 🏗️ प्रोजेक्ट कन्फिगरेसन

### azure.yaml संरचना
`azure.yaml` फाइल तपाईंको azd प्रोजेक्टको केन्द्र हो:

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

### सेवा कन्फिगरेसन विकल्पहरू

#### होस्ट प्रकारहरू
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

#### भाषा-विशिष्ट सेटिङहरू
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

## 🌟 वातावरण व्यवस्थापन

### वातावरणहरू सिर्जना गर्दै
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### वातावरण कन्फिगरेसन
प्रत्येक वातावरणको आफ्नै कन्फिगरेसन `.azure/<env-name>/config.json` मा हुन्छ:

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

### वातावरण चरहरू
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

### वातावरण टेम्प्लेटहरू
सुसंगत वातावरण सेटअपको लागि `.azure/env.template` सिर्जना गर्नुहोस्:
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

## 🔐 प्रमाणीकरण कन्फिगरेसन

### Azure CLI एकीकरण
```bash
# Use Azure CLI credentials (default)
azd config set auth.useAzureCliCredential true

# Login with specific tenant
az login --tenant <tenant-id>

# Set default subscription
az account set --subscription <subscription-id>
```

### सेवा प्रिन्सिपल प्रमाणीकरण
CI/CD पाइपलाइनहरूको लागि:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Or configure directly
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### व्यवस्थापित पहिचान
Azure-होस्ट गरिएको वातावरणहरूको लागि:
```bash
# Enable managed identity authentication
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ पूर्वाधार कन्फिगरेसन

### Bicep प्यारामिटरहरू
`infra/main.parameters.json` मा पूर्वाधार प्यारामिटरहरू कन्फिगर गर्नुहोस्:
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

### Terraform कन्फिगरेसन
Terraform प्रोजेक्टहरूको लागि, `infra/terraform.tfvars` मा कन्फिगर गर्नुहोस्:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 डिप्लोयमेन्ट कन्फिगरेसन

### निर्माण कन्फिगरेसन
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

### Docker कन्फिगरेसन
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
उदाहरण `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 उन्नत कन्फिगरेसन

### कस्टम स्रोत नामकरण
```bash
# Set naming conventions
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### नेटवर्क कन्फिगरेसन
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### निगरानी कन्फिगरेसन
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

## 🎯 वातावरण-विशिष्ट कन्फिगरेसनहरू

### विकास वातावरण
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### स्टेजिङ वातावरण
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### उत्पादन वातावरण
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 कन्फिगरेसन मान्यता

### कन्फिगरेसन मान्यता गर्नुहोस्
```bash
# Check configuration syntax
azd config validate

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --dry-run
```

### कन्फिगरेसन स्क्रिप्टहरू
`scripts/` मा मान्यता स्क्रिप्टहरू सिर्जना गर्नुहोस्:

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

## 🎓 उत्कृष्ट अभ्यासहरू

### १. वातावरण चरहरू प्रयोग गर्नुहोस्
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### २. कन्फिगरेसन फाइलहरू व्यवस्थित गर्नुहोस्
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

### ३. संस्करण नियन्त्रण विचारहरू
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### ४. कन्फिगरेसन डकुमेन्टेसन
तपाईंको कन्फिगरेसनलाई `CONFIG.md` मा डकुमेन्ट गर्नुहोस्:
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

## अगाडि के गर्ने

- [तपाईंको पहिलो प्रोजेक्ट](first-project.md) - अभ्यासमा कन्फिगरेसन लागू गर्नुहोस्
- [डिप्लोयमेन्ट गाइड](../deployment/deployment-guide.md) - डिप्लोयमेन्टको लागि कन्फिगरेसन प्रयोग गर्नुहोस्
- [स्रोतहरू प्रावधान गर्दै](../deployment/provisioning.md) - उत्पादन-तयार कन्फिगरेसनहरू

## सन्दर्भहरू

- [azd कन्फिगरेसन सन्दर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml स्कीमा](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [वातावरण चरहरू](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय ३ - कन्फिगरेसन र प्रमाणीकरण
- **⬅️ अघिल्लो**: [तपाईंको पहिलो प्रोजेक्ट](first-project.md)
- **➡️ अर्को अध्याय**: [अध्याय ४: कोडको रूपमा पूर्वाधार](../deployment/deployment-guide.md)
- **अर्को पाठ**: [तपाईंको पहिलो प्रोजेक्ट](first-project.md)

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। यसको मूल भाषा मा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।