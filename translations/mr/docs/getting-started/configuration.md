<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "71971408c9d2c3ed2357433ec9bc72b5",
  "translation_date": "2025-09-09T19:12:09+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "mr"
}
-->
# कॉन्फिगरेशन मार्गदर्शक

## परिचय

ही व्यापक मार्गदर्शिका Azure Developer CLI च्या कॉन्फिगरेशनसाठी सर्व पैलूंचा समावेश करते, ज्यामुळे विकास आणि तैनाती कार्यप्रवाह अधिक प्रभावी आणि सुरक्षित होतात. तुम्ही कॉन्फिगरेशन श्रेणी, पर्यावरण व्यवस्थापन, प्रमाणीकरण पद्धती आणि प्रगत कॉन्फिगरेशन नमुन्यांबद्दल शिकाल.

## शिकण्याची उद्दिष्टे

या धड्याच्या शेवटी, तुम्ही:
- azd कॉन्फिगरेशन श्रेणीमध्ये प्रावीण्य मिळवाल आणि सेटिंग्ज कशा प्राधान्य दिल्या जातात हे समजून घ्याल
- जागतिक आणि प्रकल्प-विशिष्ट सेटिंग्ज प्रभावीपणे कॉन्फिगर कराल
- वेगवेगळ्या कॉन्फिगरेशनसह अनेक पर्यावरणे व्यवस्थापित कराल
- सुरक्षित प्रमाणीकरण आणि अधिकृतता नमुने अंमलात आणाल
- जटिल परिस्थितींसाठी प्रगत कॉन्फिगरेशन नमुने समजून घ्याल

## शिकण्याचे परिणाम

हा धडा पूर्ण केल्यानंतर, तुम्ही:
- विकास कार्यप्रवाहांसाठी azd कॉन्फिगर करू शकाल
- अनेक तैनाती पर्यावरणे सेट अप आणि व्यवस्थापित करू शकाल
- सुरक्षित कॉन्फिगरेशन व्यवस्थापन पद्धती अंमलात आणू शकाल
- कॉन्फिगरेशन-संबंधित समस्यांचे निराकरण करू शकाल
- विशिष्ट संस्थात्मक गरजांसाठी azd चा वर्तन सानुकूलित करू शकाल

ही व्यापक मार्गदर्शिका Azure Developer CLI च्या कॉन्फिगरेशनसाठी सर्व पैलूंचा समावेश करते, ज्यामुळे विकास आणि तैनाती कार्यप्रवाह अधिक प्रभावी आणि सुरक्षित होतात.

## कॉन्फिगरेशन श्रेणी

azd एक श्रेणीबद्ध कॉन्फिगरेशन प्रणाली वापरते:
1. **कमांड-लाइन फ्लॅग्स** (सर्वाधिक प्राधान्य)
2. **पर्यावरणीय व्हेरिएबल्स**
3. **स्थानिक प्रकल्प कॉन्फिगरेशन** (`.azd/config.json`)
4. **जागतिक वापरकर्ता कॉन्फिगरेशन** (`~/.azd/config.json`)
5. **मूलभूत मूल्ये** (सर्वात कमी प्राधान्य)

## जागतिक कॉन्फिगरेशन

### जागतिक डीफॉल्ट्स सेट करणे
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

### सामान्य जागतिक सेटिंग्ज
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

## 🏗️ प्रकल्प कॉन्फिगरेशन

### azure.yaml रचना
`azure.yaml` फाइल तुमच्या azd प्रकल्पाचा मुख्य भाग आहे:

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

### सेवा कॉन्फिगरेशन पर्याय

#### होस्ट प्रकार
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

#### भाषा-विशिष्ट सेटिंग्ज
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

## 🌟 पर्यावरण व्यवस्थापन

### पर्यावरण तयार करणे
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### पर्यावरण कॉन्फिगरेशन
प्रत्येक पर्यावरणाचे स्वतःचे कॉन्फिगरेशन `.azure/<env-name>/config.json` मध्ये असते:

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

### पर्यावरणीय व्हेरिएबल्स
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

### पर्यावरण टेम्पलेट्स
सुसंगत पर्यावरण सेटअपसाठी `.azure/env.template` तयार करा:
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

## 🔐 प्रमाणीकरण कॉन्फिगरेशन

### Azure CLI एकत्रीकरण
```bash
# Use Azure CLI credentials (default)
azd config set auth.useAzureCliCredential true

# Login with specific tenant
az login --tenant <tenant-id>

# Set default subscription
az account set --subscription <subscription-id>
```

### सेवा प्रिन्सिपल प्रमाणीकरण
CI/CD पाईपलाइन्ससाठी:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Or configure directly
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### व्यवस्थापित ओळख
Azure-होस्ट केलेल्या पर्यावरणांसाठी:
```bash
# Enable managed identity authentication
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ पायाभूत सुविधा कॉन्फिगरेशन

### Bicep पॅरामीटर्स
`infra/main.parameters.json` मध्ये पायाभूत सुविधा पॅरामीटर्स कॉन्फिगर करा:
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

### Terraform कॉन्फिगरेशन
Terraform प्रकल्पांसाठी, `infra/terraform.tfvars` मध्ये कॉन्फिगर करा:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 तैनाती कॉन्फिगरेशन

### बिल्ड कॉन्फिगरेशन
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

### Docker कॉन्फिगरेशन
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

## 🔧 प्रगत कॉन्फिगरेशन

### सानुकूल संसाधन नामकरण
```bash
# Set naming conventions
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### नेटवर्क कॉन्फिगरेशन
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### मॉनिटरिंग कॉन्फिगरेशन
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

## 🎯 पर्यावरण-विशिष्ट कॉन्फिगरेशन्स

### विकास पर्यावरण
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### स्टेजिंग पर्यावरण
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### उत्पादन पर्यावरण
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 कॉन्फिगरेशन पडताळणी

### कॉन्फिगरेशन पडताळा
```bash
# Check configuration syntax
azd config validate

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --dry-run
```

### कॉन्फिगरेशन स्क्रिप्ट्स
`scripts/` मध्ये पडताळणी स्क्रिप्ट्स तयार करा:

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

## 🎓 सर्वोत्तम पद्धती

### 1. पर्यावरणीय व्हेरिएबल्स वापरा
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. कॉन्फिगरेशन फाइल्स व्यवस्थित करा
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

### 3. आवृत्ती नियंत्रण विचार
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. कॉन्फिगरेशन दस्तऐवजीकरण
तुमच्या कॉन्फिगरेशनचे दस्तऐवजीकरण `CONFIG.md` मध्ये करा:
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

## पुढील पायऱ्या

- [तुमचा पहिला प्रकल्प](first-project.md) - कॉन्फिगरेशन प्रत्यक्षात लागू करा
- [तैनाती मार्गदर्शक](../deployment/deployment-guide.md) - तैनातीसाठी कॉन्फिगरेशन वापरा
- [संसाधने तयार करणे](../deployment/provisioning.md) - उत्पादन-तयार कॉन्फिगरेशन्स

## संदर्भ

- [azd कॉन्फिगरेशन संदर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml स्कीमा](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [पर्यावरणीय व्हेरिएबल्स](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**नेव्हिगेशन**
- **मागील धडा**: [स्थापना आणि सेटअप](installation.md)
- **पुढील धडा**: [तुमचा पहिला प्रकल्प](first-project.md)

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी कृपया लक्षात ठेवा की स्वयंचलित भाषांतरे त्रुटी किंवा अचूकतेच्या अभावाने युक्त असू शकतात. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.