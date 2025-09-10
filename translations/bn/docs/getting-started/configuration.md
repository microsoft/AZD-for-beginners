<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7e50c994df9f71d709906549be362fc5",
  "translation_date": "2025-09-10T13:02:16+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "bn"
}
-->
# কনফিগারেশন গাইড

## ভূমিকা

এই বিস্তৃত গাইডটি Azure Developer CLI কনফিগার করার সমস্ত দিক কভার করে, যা উন্নয়ন এবং ডিপ্লয়মেন্ট ওয়ার্কফ্লোকে সর্বোত্তম করে তোলে। আপনি কনফিগারেশন হায়ারার্কি, পরিবেশ ব্যবস্থাপনা, প্রমাণীকরণ পদ্ধতি এবং উন্নত কনফিগারেশন প্যাটার্ন সম্পর্কে শিখবেন যা কার্যকর এবং নিরাপদ Azure ডিপ্লয়মেন্ট সক্ষম করে।

## শেখার লক্ষ্য

এই পাঠ শেষে, আপনি:
- azd কনফিগারেশন হায়ারার্কি আয়ত্ত করবেন এবং সেটিংস কীভাবে অগ্রাধিকার পায় তা বুঝবেন
- গ্লোবাল এবং প্রকল্প-নির্দিষ্ট সেটিংস কার্যকরভাবে কনফিগার করবেন
- বিভিন্ন কনফিগারেশনের সাথে একাধিক পরিবেশ পরিচালনা করবেন
- নিরাপদ প্রমাণীকরণ এবং অনুমোদন প্যাটার্ন বাস্তবায়ন করবেন
- জটিল পরিস্থিতির জন্য উন্নত কনফিগারেশন প্যাটার্ন বুঝবেন

## শেখার ফলাফল

এই পাঠ সম্পন্ন করার পরে, আপনি সক্ষম হবেন:
- উন্নত উন্নয়ন ওয়ার্কফ্লোর জন্য azd কনফিগার করতে
- একাধিক ডিপ্লয়মেন্ট পরিবেশ সেটআপ এবং পরিচালনা করতে
- নিরাপদ কনফিগারেশন ব্যবস্থাপনা অনুশীলন বাস্তবায়ন করতে
- কনফিগারেশন-সম্পর্কিত সমস্যাগুলি সমাধান করতে
- নির্দিষ্ট সংস্থার প্রয়োজনীয়তার জন্য azd এর আচরণ কাস্টমাইজ করতে

এই বিস্তৃত গাইডটি Azure Developer CLI কনফিগার করার সমস্ত দিক কভার করে, যা উন্নয়ন এবং ডিপ্লয়মেন্ট ওয়ার্কফ্লোকে সর্বোত্তম করে তোলে।

## কনফিগারেশন হায়ারার্কি

azd একটি হায়ারার্কিক্যাল কনফিগারেশন সিস্টেম ব্যবহার করে:
1. **কমান্ড-লাইন ফ্ল্যাগ** (সর্বোচ্চ অগ্রাধিকার)
2. **পরিবেশ ভেরিয়েবল**
3. **লোকাল প্রকল্প কনফিগারেশন** (`.azd/config.json`)
4. **গ্লোবাল ব্যবহারকারী কনফিগারেশন** (`~/.azd/config.json`)
5. **ডিফল্ট মান** (সর্বনিম্ন অগ্রাধিকার)

## গ্লোবাল কনফিগারেশন

### গ্লোবাল ডিফল্ট সেট করা
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

### সাধারণ গ্লোবাল সেটিংস
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

## 🏗️ প্রকল্প কনফিগারেশন

### azure.yaml এর কাঠামো
`azure.yaml` ফাইলটি আপনার azd প্রকল্পের কেন্দ্রবিন্দু:

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

### সার্ভিস কনফিগারেশন অপশন

#### হোস্ট টাইপ
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

#### ভাষা-নির্দিষ্ট সেটিংস
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

## 🌟 পরিবেশ ব্যবস্থাপনা

### পরিবেশ তৈরি করা
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### পরিবেশ কনফিগারেশন
প্রতিটি পরিবেশের নিজস্ব কনফিগারেশন থাকে `.azure/<env-name>/config.json` ফাইলে:

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

### পরিবেশ ভেরিয়েবল
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

### পরিবেশ টেমপ্লেট
সঙ্গতিপূর্ণ পরিবেশ সেটআপের জন্য `.azure/env.template` তৈরি করুন:
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

## 🔐 প্রমাণীকরণ কনফিগারেশন

### Azure CLI ইন্টিগ্রেশন
```bash
# Use Azure CLI credentials (default)
azd config set auth.useAzureCliCredential true

# Login with specific tenant
az login --tenant <tenant-id>

# Set default subscription
az account set --subscription <subscription-id>
```

### সার্ভিস প্রিন্সিপাল প্রমাণীকরণ
CI/CD পাইপলাইনের জন্য:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Or configure directly
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### ম্যানেজড আইডেন্টিটি
Azure-হোস্টেড পরিবেশের জন্য:
```bash
# Enable managed identity authentication
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ অবকাঠামো কনফিগারেশন

### Bicep প্যারামিটার
`infra/main.parameters.json` ফাইলে অবকাঠামো প্যারামিটার কনফিগার করুন:
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

### Terraform কনফিগারেশন
Terraform প্রকল্পের জন্য, `infra/terraform.tfvars` ফাইলে কনফিগার করুন:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ডিপ্লয়মেন্ট কনফিগারেশন

### বিল্ড কনফিগারেশন
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

### Docker কনফিগারেশন
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
উদাহরণ `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 উন্নত কনফিগারেশন

### কাস্টম রিসোর্স নামকরণ
```bash
# Set naming conventions
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### নেটওয়ার্ক কনফিগারেশন
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### মনিটরিং কনফিগারেশন
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

## 🎯 পরিবেশ-নির্দিষ্ট কনফিগারেশন

### উন্নয়ন পরিবেশ
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### স্টেজিং পরিবেশ
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### প্রোডাকশন পরিবেশ
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 কনফিগারেশন যাচাইকরণ

### কনফিগারেশন যাচাই করুন
```bash
# Check configuration syntax
azd config validate

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --dry-run
```

### কনফিগারেশন স্ক্রিপ্ট
`scripts/` ফোল্ডারে যাচাইকরণ স্ক্রিপ্ট তৈরি করুন:

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

## 🎓 সেরা অনুশীলন

### ১. পরিবেশ ভেরিয়েবল ব্যবহার করুন
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### ২. কনফিগারেশন ফাইলগুলি সংগঠিত করুন
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

### ৩. ভার্সন কন্ট্রোল বিবেচনা
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### ৪. কনফিগারেশন ডকুমেন্টেশন
আপনার কনফিগারেশন `CONFIG.md` ফাইলে ডকুমেন্ট করুন:
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

## পরবর্তী ধাপ

- [আপনার প্রথম প্রকল্প](first-project.md) - কনফিগারেশন প্রয়োগে অনুশীলন করুন
- [ডিপ্লয়মেন্ট গাইড](../deployment/deployment-guide.md) - ডিপ্লয়মেন্টের জন্য কনফিগারেশন ব্যবহার করুন
- [রিসোর্স প্রভিশনিং](../deployment/provisioning.md) - প্রোডাকশন-রেডি কনফিগারেশন

## রেফারেন্স

- [azd কনফিগারেশন রেফারেন্স](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml স্কিমা](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [পরিবেশ ভেরিয়েবল](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [ইনস্টলেশন ও সেটআপ](installation.md)
- **পরবর্তী পাঠ**: [আপনার প্রথম প্রকল্প](first-project.md)

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসম্ভব সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা তার জন্য দায়বদ্ধ থাকব না।