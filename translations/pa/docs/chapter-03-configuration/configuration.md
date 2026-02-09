# ਕੰਫਿਗਰੇਸ਼ਨ ਗਾਈਡ

**ਚੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: Chapter 3 - Configuration & Authentication
- **⬅️ ਪਿਛਲਾ**: [Your First Project](first-project.md)
- **➡️ ਅਗਲਾ**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਵਿਕਾਸ ਅਤੇ ਤੈਨਾਤੀ ਵਰਕਫ਼ਲੋ ਲਈ Azure Developer CLI ਦੀਆਂ ਸੰਰਚਨਾ ਦੇ ਸਾਰੇ ਪਹਿਰੂਆਂ ਨੂੰ ਕਵਰ ਕਰਦੀ ਹੈ। ਤੁਸੀਂ ਕੰਫਿਗਰੇਸ਼ਨ ਹਾਇਰਾਰਕੀ, ਵਾਤਾਵਰਨ ਪ੍ਰਬੰਧਨ, ਪ੍ਰਮਾਣੀਕਰਨ ਤਰੀਕਿਆਂ ਅਤੇ ਉਨਤ ਸੰਰਚਨਾ ਪੈਟਰਨਾਂ ਬਾਰੇ ਸਿੱਖੋਗੇ ਜਿਹੜੇ ਕੁਸ਼ਲ ਅਤੇ ਸੁਰੱਖਿਅਤ Azure ਤੈਨਾਤੀਆਂ ਨੂੰ ਯਕੀਨੀ ਬਣਾਉਂਦੇ ਹਨ।

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਪਾਠ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ:
- azd ਕੰਫਿਗਰੇਸ਼ਨ ਹਾਇਰਾਰਕੀ ਵਿੱਚ ਨਿਪੁੰਨ ਹੋਵੋਗੇ ਅਤੇ ਸਮਝੋਂਗੇ ਕਿ ਸੈਟਿੰਗਜ਼ ਨੂੰ ਕਿਵੇਂ ਤਰਜੀਹ ਦਿੱਤੀ ਜਾਂਦੀ ਹੈ
- ਗਲੋਬਲ ਅਤੇ ਪ੍ਰੋਜੈਕਟ-ਨਿਰਦਿਸ਼ਟ ਸੈਟਿੰਗਜ਼ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਢੰਗ ਨਾਲ ਕੰਫਿਗਰ ਕਰਨਾ
- ਵੱਖ-ਵੱਖ ਸੰਰਚਨਾਵਾਂ ਵਾਲੇ ਇੱਕ ਤੋਂ ਵੱਧ ਵਾਤਾਵਰਨਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰਨਾ
- ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣੀਕਰਨ ਅਤੇ ਅਧਿਕਾਰਣ ਪੈਟਰਨ ਲਾਗੂ ਕਰਨਾ
- ਜਟਿਲ ਸਕੈਨਰੀਓਜ਼ ਲਈ ਉਨਤ ਕੰਫਿਗਰੇਸ਼ਨ ਪੈਟਰਨ ਸਮਝਣਾ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਪਾਠ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਵਿਕਾਸ ਵਰਕਫ਼ਲੋਜ਼ ਲਈ azd ਨੂੰ ਠੀਕ ਤਰੀਕੇ ਨਾਲ ਕੰਫਿਗਰ ਕਰਨਾ
- ਇੱਕ ਤੋਂ ਵੱਧ ਡਿਪਲੌਇਮੈਂਟ ਵਾਤਾਵਰਨ ਸੈਟਅਪ ਅਤੇ ਪ੍ਰਬੰਧਨ ਕਰਨਾ
- ਸੁਰੱਖਿਅਤ ਕੰਫਿਗਰੇਸ਼ਨ ਪ੍ਰਬੰਧਨ ਅਭਿਆਸ ਲਾਗੂ ਕਰਨਾ
- ਕੰਫਿਗਰੇਸ਼ਨ-ਸੰਬੰਧੀ ਸਮੱਸਿਆਵਾਂ ਦਾ ਟ੍ਰਬਲਸ਼ੂਟ ਕਰਨਾ
- ਵਿਸ਼ੇਸ਼ ਸੰਗਠਨਿਕ ਲੋੜਾਂ ਲਈ azd ਵਿਹਾਰ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰਨਾ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਵਿਕਾਸ ਅਤੇ ਤੈਨਾਤੀ ਵਰਕਫ਼ਲੋ ਲਈ Azure Developer CLI ਦੀਆਂ ਸੰਰਚਨਾ ਦੇ ਸਾਰੇ ਪਹਿਰੂਆਂ ਨੂੰ ਕਵਰ ਕਰਦੀ ਹੈ।

## ਕੰਫਿਗਰੇਸ਼ਨ ਹਾਇਰਾਰਕੀ

azd ਇੱਕ ਹਾਇਰਾਰਕੀਕਲ ਕੰਫਿਗਰੇਸ਼ਨ ਸਿਸਟਮ ਵਰਤਦਾ ਹੈ:
1. **ਕਮਾਂਡ-ਲਾਈਨ ਫਲੈਗ** (ਸਭ ਤੋਂ ਉੱਚੀ ਤਰਜੀਹ)
2. **ਵਾਤਾਵਰਨ ਵੈਰੀਏਬਲ**
3. **ਲੋਕਲ ਪ੍ਰੋਜੈਕਟ ਕੰਫਿਗਰੇਸ਼ਨ** (`.azd/config.json`)
4. **ਗਲੋਬਲ ਯੂਜ਼ਰ ਕੰਫਿਗਰੇਸ਼ਨ** (`~/.azd/config.json`)
5. **ਡਿਫੌਲਟ ਮੁੱਲ** (ਸਭ ਤੋਂ ਘੱਟ ਤਰਜੀਹ)

## ਗਲੋਬਲ ਕੰਫਿਗਰੇਸ਼ਨ

### ਗਲੋਬਲ ਡਿਫੌਲਟ ਸੈਟਿੰਗਜ਼
```bash
# ਡਿਫੌਲਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈੱਟ ਕਰੋ
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ਡਿਫੌਲਟ ਸਥਾਨ ਸੈੱਟ ਕਰੋ
azd config set defaults.location "eastus2"

# ਡਿਫੌਲਟ ਰਿਸੋਰਸ ਗਰੁੱਪ ਨਾਮਕਰਨ ਪ੍ਰਥਾ ਸੈੱਟ ਕਰੋ
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# ਸਭ ਗਲੋਬਲ ਕੰਫਿਗਰੇਸ਼ਨ ਵੇਖੋ
azd config list

# ਇੱਕ ਕੰਫਿਗਰੇਸ਼ਨ ਹਟਾਓ
azd config unset defaults.location
```

### ਆਮ ਗਲੋਬਲ ਸੈਟਿੰਗਜ਼
```bash
# ਡਿਵੈਲਪਮੈਂਟ ਪਸੰਦਾਂ
azd config set alpha.enable true                    # ਅਲਫਾ ਫੀਚਰਾਂ ਚਾਲੂ ਕਰੋ
azd config set telemetry.enabled false             # ਟੈਲੀਮੀਟਰੀ ਬੰਦ ਕਰੋ
azd config set output.format json                  # ਆਉਟਪੁਟ ਫਾਰਮੈਟ ਸੈਟ ਕਰੋ

# ਸੁਰੱਖਿਆ ਸੈਟਿੰਗਾਂ
azd config set auth.useAzureCliCredential true     # ਪ੍ਰਮਾਣੀਕਰਨ ਲਈ Azure CLI ਵਰਤੋਂ
azd config set tls.insecure false                  # TLS ਪੁਸ਼ਟੀਕਰਨ ਲਾਗੂ ਕਰੋ

# ਕਾਰਗਰਤਾ ਟਿਊਨਿੰਗ
azd config set provision.parallelism 5             # ਸਮਕਾਲੀ ਸਰੋਤ ਬਣਾਉਣਾ
azd config set deploy.timeout 30m                  # ਡਿਪਲੋਇਮੈਂਟ ਟਾਈਮਆਉਟ
```

## 🏗️ ਪ੍ਰੋਜੈਕਟ ਕੰਫਿਗਰੇਸ਼ਨ

### azure.yaml ਦੀ ਬਣਤਰ
`azure.yaml` ਫਾਇਲ ਤੁਹਾਡੇ azd ਪ੍ਰੋਜੈਕਟ ਦਾ ਕੇਂਦਰ ਹੈ:

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

### ਸੇਵਾ ਸੰਰਚਨਾ ਵਿਕਲਪ

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

#### ਭਾਸ਼ਾ-ਨਿਰਦਿਸ਼ਟ ਸੈਟਿੰਗਜ਼
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

## 🌟 ਵਾਤਾਵਰਨ ਪ੍ਰਬੰਧਨ

### ਵਾਤਾਵਰਨ ਬਣਾਉਣਾ
```bash
# ਇੱਕ ਨਵਾਂ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new development

# ਨਿਰਧਾਰਤ ਸਥਾਨ ਨਾਲ ਬਣਾਓ
azd env new staging --location "westus2"

# ਟੈਮਪਲੇਟ ਤੋਂ ਬਣਾਓ
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ਵਾਤਾਵਰਨ ਸੰਰਚਨਾ
ਹਰ ਵਾਤਾਵਰਨ ਦੀ ਆਪਣੀ ਸੰਰਚਨਾ `.azure/<env-name>/config.json` ਵਿੱਚ ਹੁੰਦੀ ਹੈ:

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

### ਵਾਤਾਵਰਨ ਵੈਰੀਏਬਲ
```bash
# ਮਾਹੌਲ-ਵਿਸ਼ੇਸ਼ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# ਮਾਹੌਲ ਦੇ ਵੈਰੀਏਬਲ ਵੇਖੋ
azd env get-values

# ਉਮੀਦ ਕੀਤੀ ਨਤੀਜਾ:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# ਮਾਹੌਲ ਦਾ ਵੈਰੀਏਬਲ ਹਟਾਓ
azd env unset DEBUG

# ਹਟਾਏ ਜਾਣ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd env get-values | grep DEBUG
# (ਕੁਝ ਵੀ ਵਾਪਸ ਨਹੀਂ ਆਏਗਾ)
```

### ਵਾਤਾਵਰਨ ਟੈਮਪਲੇਟ
ਇੱਕਸਾਰ ਵਾਤਾਵਰਨ ਸੈਟਅਪ ਲਈ `.azure/env.template` ਬਣਾਓ:
```bash
# ਲਾਜ਼ਮੀ ਵੈਰੀਏਬਲ
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# ਐਪਲੀਕੇਸ਼ਨ ਸੈਟਿੰਗਸ
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ਵਿਕਲਪਿਕ ਵਿਕਾਸ ਸੈਟਿੰਗਸ
DEBUG=false
LOG_LEVEL=info
```

## 🔐 ਪ੍ਰਮਾਣੀਕਰਨ ਸੰਰਚਨਾ

### Azure CLI ਇੰਟੀਗ੍ਰੇਸ਼ਨ
```bash
# Azure CLI ਦੇ ਕ੍ਰੈਡੈਂਸ਼ਲ ਵਰਤੋ (ਡਿਫਾਲਟ)
azd config set auth.useAzureCliCredential true

# ਕਿਸੇ ਖ਼ਾਸ ਟੇਨੈਂਟ ਨਾਲ ਲੌਗਇਨ ਕਰੋ
az login --tenant <tenant-id>

# ਡਿਫਾਲਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈੱਟ ਕਰੋ
az account set --subscription <subscription-id>
```

### ਸਰਵਿਸ ਪ੍ਰਿੰਸਿਪਲ ਪ੍ਰਮਾਣੀਕਰਨ
CI/CD ਪਾਈਪਲਾਈਨਾਂ ਲਈ:
```bash
# ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# ਜਾਂ ਸਿੱਧਾ ਕਨਫਿਗਰ ਕਰੋ
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### ਪ੍ਰਬੰਧਤ ਆਈਡੈਂਟਿਟੀ
Azure-ਹੋਸਟ ਕੀਤੇ ਵਾਲੇ ਵਾਤਾਵਰਨਾਂ ਲਈ:
```bash
# ਪਰਬੰਧਿਤ ਆਈਡੈਂਟਿਟੀ ਪ੍ਰਮਾਣਿਕਤਾ ਚਾਲੂ ਕਰੋ
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ਇੰਫ੍ਰਾਸਟ੍ਰਕਚਰ ਸੰਰਚਨਾ

### Bicep ਪੈਰਾਮੀਟਰ
ਇਨਫ੍ਰਾਸਟ੍ਰਕਚਰ ਪੈਰਾਮੀਟਰ `infra/main.parameters.json` ਵਿੱਚ ਕੰਫਿਗਰ ਕਰੋ:
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

### Terraform ਸੰਰਚਨਾ
Terraform ਪ੍ਰੋਜੈਕਟਾਂ ਲਈ, `infra/terraform.tfvars` ਵਿੱਚ ਕੰਫਿਗਰ ਕਰੋ:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ਡਿਪਲੌਇਮੈਂਟ ਸੰਰਚਨਾ

### ਬਿਲਡ ਸੰਰਚਨਾ
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

### Docker ਸੰਰਚਨਾ
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

## 🔧 ਉੱਨਤ ਸੰਰਚਨਾ

### ਕਸਟਮ ਰਿਸੋਰਸ ਨਾਂਕਰਨ
```bash
# ਨਾਮਕਰਨ ਦੇ ਨਿਯਮ ਨਿਰਧਾਰਤ ਕਰੋ
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### ਨੈਟਵਰਕ ਸੰਰਚਨਾ
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### ਮੋਨੀਟਰਿੰਗ ਸੰਰਚਨਾ
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

## 🎯 ਵਾਤਾਵਰਨ-ਨਿਰਦਿਸ਼ਟ ਸੰਰਚਨਾਵਾਂ

### ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਨ
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਨ
```bash
# .azure/ਸਟੇਜਿੰਗ/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### ਉਤਪਾਦਨ ਵਾਤਾਵਰਨ
```bash
# .azure/ਉਤਪਾਦਨ/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ਸੰਰਚਨਾ ਦੀ ਪੁਸ਼ਟੀ

### ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ
```bash
# ਕੰਫਿਗਰੇਸ਼ਨ ਸਿੰਟੈਕਸ ਦੀ ਜਾਂਚ ਕਰੋ
azd config validate

# ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲਜ਼ ਦੀ ਜਾਂਚ ਕਰੋ
azd env get-values

# ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd provision --dry-run
```

### ਸੰਰਚਨਾ ਸਕ੍ਰਿਪਟ
ਤਸਦੀਕ ਕਰਨ ਵਾਲੀਆਂ ਸਕ੍ਰਿਪਟਾਂ `scripts/` ਵਿੱਚ ਬਣਾਓ:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ਲੋੜੀਂਦੇ ਵਾਤਾਵਰਣ ਵੇਰੀਏਬਲਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml ਦੀ ਸਿੰਟੈਕਸ ਦੀ ਜਾਂਚ ਕਰੋ
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 ਸ੍ਰੇਸ਼ਠ ਅਭਿਆਸ

### 1. ਵਾਤਾਵਰਨ ਵੈਰੀਏਬਲ ਵਰਤੋ
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ਸੰਰਚਨਾ ਫਾਇਲਾਂ ਦਾ ਠੀਕ ਵਿਵਸਥਾ ਕਰੋ
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

### 3. ਵਰਜਨ ਕੰਟਰੋਲ ਸਬੰਧੀ ਵਿਚਾਰ
```bash
# .gitignore
.azure/*/config.json         # ਇਨਵਾਇਰਨਮੈਂਟ ਕੰਫਿਗ (ਇਨ੍ਹਾਂ ਵਿੱਚ ਰਿਸੋਰਸ ਆਈਡੀ ਸ਼ਾਮਿਲ ਹੋ ਸਕਦੇ ਹਨ)
.azure/*/.env               # ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ (ਗੁਪਤ ਜਾਣਕਾਰੀ ਸ਼ਾਮਿਲ ਹੋ ਸਕਦੀ ਹੈ)
.env                        # ਲੋਕਲ ਇਨਵਾਇਰਨਮੈਂਟ ਫਾਈਲ
```

### 4. ਸੰਰਚਨਾ ਦਸਤਾਵੇਜ਼ੀਕਰਨ
ਆਪਣੀ ਸੰਰਚਨਾ `CONFIG.md` ਵਿੱਚ ਦਸਤਾਵੇਜ਼ ਕਰੋ:
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

## 🎯 ਹੱਥੋਂ-ਹੱਥ ਅਭਿਆਸੀ ਪ੍ਰਯੋਗ

### ਅਭਿਆਸ 1: ਬਹੁ-ਵਾਤਾਵਰਨ ਸੰਰਚਨਾ (15 ਮਿੰਟ)

**ਉਦੇਸ਼**: ਤਿੰਨ ਵਾਤਾਵਰਨ ਬਣਾਓ ਅਤੇ ਵੱਖ-ਵੱਖ ਸੈਟਿੰਗਜ਼ ਨਾਲ ਸੰਰਚਿਤ ਕਰੋ

```bash
# ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# ਪ੍ਰੋਡਕਸ਼ਨ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ਹਰੇਕ ਵਾਤਾਵਰਣ ਦੀ ਜਾਂਚ ਕਰੋ
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**ਕਾਮਯਾਬੀ ਦੇ ਮਾਪਦੰਡ:**
- [ ] ਤਿੰਨ ਵਾਤਾਵਰਨ ਸਫ਼ਲਤਾਪੂਰਵਕ ਬਣਾਏ ਗਏ
- [ ] ਹਰ ਵਾਤਾਵਰਨ ਦੀ ਅਲੱਗ ਸੰਰਚਨਾ ਹੈ
- [ ] ਵਾਤਾਵਰਨਾਂ ਦੇ ਵਿਚਕਾਰ ਬਿਨਾਂ ਤਰੁਟੀਆਂ ਦੇ ਸਵਿੱਚ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ
- [ ] `azd env list` ਤਿੰਨੋ ਵਾਤਾਵਰਨ ਦਿਖਾਉਂਦਾ ਹੈ

### ਅਭਿਆਸ 2: ਸੀਕ੍ਰੇਟ ਪ੍ਰਬੰਧਨ (10 ਮਿੰਟ)

**ਉਦੇਸ਼**: ਸੰਵੇਦਨਸ਼ੀਲ ਡਾਟਾ ਨਾਲ ਸੁਰੱਖਿਅਤ ਸੰਰਚਨਾ ਦਾ ਅਭਿਆਸ ਕਰੋ

```bash
# ਗੁਪਤ ਸੈੱਟ ਕਰੋ (ਆਉਟਪੁੱਟ ਵਿੱਚ ਨਹੀਂ ਦਿਖਾਈ ਦੇਣਗੇ)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# ਗੈਰ-ਗੁਪਤ ਸੰਰਚਨਾ ਸੈੱਟ ਕਰੋ
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ਵਾਤਾਵਰਣ ਵੇਖੋ (ਗੁਪਤ ਜਾਣਕਾਰੀਆਂ ਨੂੰ ਛਾਂਟਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ)
azd env get-values

# ਤਸਦੀਕ ਕਰੋ ਕਿ ਗੁਪਤ ਸੰਗ੍ਰਹਿਤ ਕੀਤੇ ਗਏ ਹਨ
azd env get DB_PASSWORD  # ਅਸਲ ਮੁੱਲ ਦਿਖਾਇਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ
```

**ਕਾਮਯਾਬੀ ਦੇ ਮਾਪਦੰਡ:**
- [ ] ਸੀਕ੍ਰੇਟ ਟਰਮੀਨਲ 'ਤੇ ਦਿਖਾਏ ਬਿਨਾਂ ਸੰਭਾਲੇ ਗਏ
- [ ] `azd env get-values` ਰੇਡੈਕਟ ਕੀਤੀਆਂ ਸੀਕ੍ਰੇਟ ਵੇਲਯੂਜ਼ ਦਿਖਾਉਂਦਾ ਹੈ
- [ ] ਵੱਖ-ਵੱਖ `azd env get <SECRET_NAME>` ਅਸਲੀ ਮੁੱਲ ਪ੍ਰਾਪਤ ਕਰਦਾ ਹੈ

## ਅਗਲੇ ਕਦਮ

- [Your First Project](first-project.md) - ਪ੍ਰਾਇਕਟਸ 'ਚ ਕੰਫਿਗਰੇਸ਼ਨ ਲਾਗੂ ਕਰੋ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ਤੈਨਾਤੀ ਲਈ ਕੰਫਿਗਰੇਸ਼ਨ ਵਰਤੋ
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਸੰਰਚਨਾਵਾਂ

## ਹਵਾਲੇ

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ਚੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: Chapter 3 - Configuration & Authentication
- **⬅️ ਪਿਛਲਾ**: [Your First Project](first-project.md)
- **➡️ ਅਗਲਾ ਅਧਿਆਇ**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **ਅਗਲਾ ਪਾਠ**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਜਿੰਮੇਵਾਰੀ ਤੋਂ ਇਨਕਾਰ:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਨਾਲ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸੱਚਾਈਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੀ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਣ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਫਹਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->