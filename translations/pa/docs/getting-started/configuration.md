<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8747981a94aac0f40d833cc37e9c0001",
  "translation_date": "2025-09-12T19:03:27+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "pa"
}
-->
# ਕਨਫਿਗਰੇਸ਼ਨ ਗਾਈਡ

**ਪਿਛਲਾ:** [AZD ਬੇਸਿਕਸ](azd-basics.md) | **ਅਗਲਾ:** [ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ Azure Developer CLI ਨੂੰ ਵਿਕਾਸ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋਜ਼ ਲਈ ਵਧੀਆ ਢੰਗ ਨਾਲ ਕਨਫਿਗਰ ਕਰਨ ਦੇ ਸਾਰੇ ਪਹਲੂਆਂ ਨੂੰ ਕਵਰ ਕਰਦੀ ਹੈ। ਤੁਸੀਂ ਕਨਫਿਗਰੇਸ਼ਨ ਹਾਇਰਾਰਕੀ, ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ, ਪ੍ਰਮਾਣਿਕਤਾ ਵਿਧੀਆਂ, ਅਤੇ ਉੱਚ-ਸਤਰੀ ਕਨਫਿਗਰੇਸ਼ਨ ਪੈਟਰਨਾਂ ਬਾਰੇ ਸਿੱਖੋਗੇ ਜੋ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਅਤੇ ਸੁਰੱਖਿਅਤ Azure ਡਿਪਲੌਇਮੈਂਟ ਨੂੰ ਯਕੀਨੀ ਬਣਾਉਂਦੇ ਹਨ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਪਾਠ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ:
- azd ਕਨਫਿਗਰੇਸ਼ਨ ਹਾਇਰਾਰਕੀ ਵਿੱਚ ਨਿਪੁਣ ਹੋ ਜਾਵੋਗੇ ਅਤੇ ਸਮਝੋਗੇ ਕਿ ਸੈਟਿੰਗਾਂ ਨੂੰ ਕਿਵੇਂ ਤਰਜੀਹ ਦਿੱਤੀ ਜਾਂਦੀ ਹੈ
- ਗਲੋਬਲ ਅਤੇ ਪ੍ਰੋਜੈਕਟ-ਵਿਸ਼ੇਸ਼ ਸੈਟਿੰਗਾਂ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਢੰਗ ਨਾਲ ਕਨਫਿਗਰ ਕਰੋ
- ਵੱਖ-ਵੱਖ ਕਨਫਿਗਰੇਸ਼ਨ ਵਾਲੇ ਕਈ ਵਾਤਾਵਰਣਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋ
- ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਧਿਕਾਰ ਪੈਟਰਨਾਂ ਨੂੰ ਲਾਗੂ ਕਰੋ
- ਜਟਿਲ ਸਥਿਤੀਆਂ ਲਈ ਉੱਚ-ਸਤਰੀ ਕਨਫਿਗਰੇਸ਼ਨ ਪੈਟਰਨਾਂ ਨੂੰ ਸਮਝੋ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਪਾਠ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਯੋਗ ਹੋਵੋਗੇ:
- ਵਿਕਾਸ ਦੇ ਵਧੀਆ ਵਰਕਫਲੋਜ਼ ਲਈ azd ਨੂੰ ਕਨਫਿਗਰ ਕਰੋ
- ਕਈ ਡਿਪਲੌਇਮੈਂਟ ਵਾਤਾਵਰਣਾਂ ਨੂੰ ਸੈਟਅੱਪ ਅਤੇ ਪ੍ਰਬੰਧਿਤ ਕਰੋ
- ਸੁਰੱਖਿਅਤ ਕਨਫਿਗਰੇਸ਼ਨ ਪ੍ਰਬੰਧਨ ਅਭਿਆਸਾਂ ਨੂੰ ਲਾਗੂ ਕਰੋ
- ਕਨਫਿਗਰੇਸ਼ਨ-ਸੰਬੰਧੀ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੱਲ ਕਰੋ
- ਵਿਸ਼ੇਸ਼ ਸੰਗਠਨਕ ਜ਼ਰੂਰਤਾਂ ਲਈ azd ਦੇ ਵਿਹਾਰ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰੋ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ Azure Developer CLI ਨੂੰ ਵਿਕਾਸ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋਜ਼ ਲਈ ਵਧੀਆ ਢੰਗ ਨਾਲ ਕਨਫਿਗਰ ਕਰਨ ਦੇ ਸਾਰੇ ਪਹਲੂਆਂ ਨੂੰ ਕਵਰ ਕਰਦੀ ਹੈ।

## ਕਨਫਿਗਰੇਸ਼ਨ ਹਾਇਰਾਰਕੀ

azd ਇੱਕ ਹਾਇਰਾਰਕੀਕਲ ਕਨਫਿਗਰੇਸ਼ਨ ਸਿਸਟਮ ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ:
1. **ਕਮਾਂਡ-ਲਾਈਨ ਫਲੈਗ** (ਸਭ ਤੋਂ ਉੱਚੀ ਤਰਜੀਹ)
2. **ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ**
3. **ਸਥਾਨਕ ਪ੍ਰੋਜੈਕਟ ਕਨਫਿਗਰੇਸ਼ਨ** (`.azd/config.json`)
4. **ਗਲੋਬਲ ਯੂਜ਼ਰ ਕਨਫਿਗਰੇਸ਼ਨ** (`~/.azd/config.json`)
5. **ਡਿਫਾਲਟ ਮੁੱਲ** (ਸਭ ਤੋਂ ਘੱਟ ਤਰਜੀਹ)

## ਗਲੋਬਲ ਕਨਫਿਗਰੇਸ਼ਨ

### ਗਲੋਬਲ ਡਿਫਾਲਟ ਸੈਟ ਕਰਨਾ
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

### ਆਮ ਗਲੋਬਲ ਸੈਟਿੰਗਾਂ
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

## 🏗️ ਪ੍ਰੋਜੈਕਟ ਕਨਫਿਗਰੇਸ਼ਨ

### azure.yaml ਸਟ੍ਰਕਚਰ
`azure.yaml` ਫਾਈਲ ਤੁਹਾਡੇ azd ਪ੍ਰੋਜੈਕਟ ਦਾ ਕੇਂਦਰ ਹੈ:

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

### ਸੇਵਾ ਕਨਫਿਗਰੇਸ਼ਨ ਵਿਕਲਪ

#### ਹੋਸਟ ਕਿਸਮਾਂ
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

#### ਭਾਸ਼ਾ-ਵਿਸ਼ੇਸ਼ ਸੈਟਿੰਗਾਂ
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

## 🌟 ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ

### ਵਾਤਾਵਰਣ ਬਣਾਉਣਾ
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ਵਾਤਾਵਰਣ ਕਨਫਿਗਰੇਸ਼ਨ
ਹਰ ਵਾਤਾਵਰਣ ਦੀ ਆਪਣੀ `.azure/<env-name>/config.json` ਵਿੱਚ ਕਨਫਿਗਰੇਸ਼ਨ ਹੁੰਦੀ ਹੈ:

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

### ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ
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

### ਵਾਤਾਵਰਣ ਟੈਂਪਲੇਟ
ਸਥਿਰ ਵਾਤਾਵਰਣ ਸੈਟਅੱਪ ਲਈ `.azure/env.template` ਬਣਾਓ:
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

## 🔐 ਪ੍ਰਮਾਣਿਕਤਾ ਕਨਫਿਗਰੇਸ਼ਨ

### Azure CLI ਇੰਟੀਗ੍ਰੇਸ਼ਨ
```bash
# Use Azure CLI credentials (default)
azd config set auth.useAzureCliCredential true

# Login with specific tenant
az login --tenant <tenant-id>

# Set default subscription
az account set --subscription <subscription-id>
```

### ਸੇਵਾ ਪ੍ਰਿੰਸਿਪਲ ਪ੍ਰਮਾਣਿਕਤਾ
CI/CD ਪਾਈਪਲਾਈਨਾਂ ਲਈ:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Or configure directly
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ
Azure-ਹੋਸਟ ਕੀਤੇ ਵਾਤਾਵਰਣਾਂ ਲਈ:
```bash
# Enable managed identity authentication
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ਇੰਫਰਾਸਟਰਕਚਰ ਕਨਫਿਗਰੇਸ਼ਨ

### Bicep ਪੈਰਾਮੀਟਰ
`infra/main.parameters.json` ਵਿੱਚ ਇੰਫਰਾਸਟਰਕਚਰ ਪੈਰਾਮੀਟਰ ਕਨਫਿਗਰ ਕਰੋ:
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

### Terraform ਕਨਫਿਗਰੇਸ਼ਨ
Terraform ਪ੍ਰੋਜੈਕਟਾਂ ਲਈ, `infra/terraform.tfvars` ਵਿੱਚ ਕਨਫਿਗਰ ਕਰੋ:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ਡਿਪਲੌਇਮੈਂਟ ਕਨਫਿਗਰੇਸ਼ਨ

### ਬਿਲਡ ਕਨਫਿਗਰੇਸ਼ਨ
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

### Docker ਕਨਫਿਗਰੇਸ਼ਨ
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
ਉਦਾਹਰਨ `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 ਉੱਚ-ਸਤਰੀ ਕਨਫਿਗਰੇਸ਼ਨ

### ਕਸਟਮ ਰਿਸੋਰਸ ਨਾਮਕਰਨ
```bash
# Set naming conventions
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### ਨੈਟਵਰਕ ਕਨਫਿਗਰੇਸ਼ਨ
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### ਮਾਨੀਟਰਿੰਗ ਕਨਫਿਗਰੇਸ਼ਨ
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

## 🎯 ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਕਨਫਿਗਰੇਸ਼ਨ

### ਵਿਕਾਸ ਵਾਤਾਵਰਣ
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### ਪ੍ਰੋਡਕਸ਼ਨ ਵਾਤਾਵਰਣ
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ਕਨਫਿਗਰੇਸ਼ਨ ਵੈਧਤਾ

### ਕਨਫਿਗਰੇਸ਼ਨ ਦੀ ਵੈਧਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
```bash
# Check configuration syntax
azd config validate

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --dry-run
```

### ਕਨਫਿਗਰੇਸ਼ਨ ਸਕ੍ਰਿਪਟ
`scripts/` ਵਿੱਚ ਵੈਧਤਾ ਸਕ੍ਰਿਪਟ ਬਣਾਓ:

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

## 🎓 ਵਧੀਆ ਅਭਿਆਸ

### 1. ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਦੀ ਵਰਤੋਂ ਕਰੋ
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ਕਨਫਿਗਰੇਸ਼ਨ ਫਾਈਲਾਂ ਨੂੰ ਸੰਗਠਿਤ ਕਰੋ
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

### 3. ਵਰਜਨ ਕੰਟਰੋਲ ਵਿਚਾਰ
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. ਕਨਫਿਗਰੇਸ਼ਨ ਦਸਤਾਵੇਜ਼
ਆਪਣੀ ਕਨਫਿਗਰੇਸ਼ਨ ਨੂੰ `CONFIG.md` ਵਿੱਚ ਦਸਤਾਵੇਜ਼ ਕਰੋ:
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

## ਅਗਲੇ ਕਦਮ

- [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md) - ਅਭਿਆਸ ਵਿੱਚ ਕਨਫਿਗਰੇਸ਼ਨ ਲਾਗੂ ਕਰੋ
- [ਡਿਪਲੌਇਮੈਂਟ ਗਾਈਡ](../deployment/deployment-guide.md) - ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਕਨਫਿਗਰੇਸ਼ਨ ਦੀ ਵਰਤੋਂ ਕਰੋ
- [ਸੰਸਾਧਨਾਂ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ](../deployment/provisioning.md) - ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਕਨਫਿਗਰੇਸ਼ਨ

## ਸੰਦਰਭ

- [azd ਕਨਫਿਗਰੇਸ਼ਨ ਸੰਦਰਭ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml ਸਕੀਮਾ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ਪਿਛਲਾ:** [AZD ਬੇਸਿਕਸ](azd-basics.md) | **ਅਗਲਾ:** [ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)
- **ਅਗਲਾ ਪਾਠ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)

---

**ਅਸਵੀਕਾਰਨਾ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚਤਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।