# কনফিগারেশন গাইড

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৩ - কনফিগারেশন ও প্রমাণীকরণ
- **⬅️ পূর্ববর্তী**: [Your First Project](first-project.md)
- **➡️ পরবর্তী**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৪: ইনফ্রাস্ট্রাকচার অ্যাজ কোড](../chapter-04-infrastructure/deployment-guide.md)

## পরিচিতি

এই ব্যাপক গাইডটি Azure Developer CLI এর সর্বোচ্চ উন্নয়ন ও ডিপ্লয়মেন্ট ওয়ার্কফ্লো গঠনের জন্য সব দিক কভার করে। আপনি শিখবেন কনফিগারেশন হায়ারার্কি, পরিবেশ পরিচালনা, প্রমাণীকরণ পদ্ধতি এবং উন্নত কনফিগারেশন প্যাটার্ন যা দক্ষ এবং সুরক্ষিত Azure ডিপ্লয়মেন্ট সক্ষম করে।

## শেখার লক্ষ্য

এই পাঠের শেষ পর্যন্ত আপনি:
- azd কনফিগারেশন হায়ারার্কি মাস্টার করবেন এবং বুঝবেন কিভাবে সেটিংস প্রাধান্য পায়
- গ্লোবাল এবং প্রোজেক্ট-নির্দিষ্ট সেটিংস কার্যকরভাবে কনফিগার করবেন
- ভিন্ন কনফিগারেশনের সাথে একাধিক পরিবেশ পরিচালনা করবেন
- সুরক্ষিত প্রমাণীকরণ এবং অনুমোদন প্যাটার্ন কার্যকর করবেন
- জটিল পরিস্থিতির জন্য উন্নত কনফিগারেশন প্যাটার্ন বুঝবেন

## শেখার ফলাফল

এই পাঠ শেষ করার পর, আপনি সক্ষম হবেন:
- azd সর্বোচ্চ উন্নয়ন ওয়ার্কফ্লোর জন্য কনফিগার করতে
- একাধিক ডিপ্লয়মেন্ট পরিবেশ সেটআপ এবং পরিচালনা করতে
- সুরক্ষিত কনফিগারেশন পরিচালনা অনুশীলন কার্যকর করতে
- কনফিগারেশন-সংক্রান্ত সমস্যা সমাধান করতে
- নির্দিষ্ট প্রতিষ্ঠানের প্রয়োজনীয়তার জন্য azd এর আচরণ কাস্টোমাইজ করতে

এই ব্যাপক গাইডটি Azure Developer CLI এর সর্বোচ্চ উন্নয়ন ও ডিপ্লয়মেন্ট ওয়ার্কফ্লো গঠনের জন্য সব দিক কভার করে।

## azd প্রোজেক্টে AI এজেন্ট বিষয়ক ধারণা

আপনি যদি AI এজেন্ট নতুন হয়ে থাকেন, এখানে azd বিশ্বে তাদের বিষয় সহজভাবে ব্যাখ্যা করা হল।

### এজেন্ট কী?

একটি এজেন্ট হল একটি সফটওয়্যার যা অনুরোধ গ্রহণ করতে পারে, তা নিয়ে যুক্তি করতে পারে এবং কাজ নিতে পারে—সাধারণত একটি AI মডেল কল করা, তথ্য অনুসন্ধান করা, বা অন্য সার্ভিস কল করাই এর কাজ। একটি azd প্রোজেক্টে, একটি এজেন্ট হলো আপনার ওয়েব ফ্রন্টএন্ড বা API ব্যাকএন্ডের পাশাপাশি আরেকটি **সার্ভিস**।

### azd প্রোজেক্টের কাঠামোতে এজেন্ট কিভাবে ফিট হয়

একটি azd প্রোজেক্ট তিনটি স্তর নিয়ে গঠিত: **ইনফ্রাস্ট্রাকচার**, **কোড**, এবং **কনফিগারেশন**। এজেন্ট এই স্তরগুলোর সাথে একইভাবে যুক্ত হয় যেমন অন্য সার্ভিসগুলো করে:

| স্তর | একটি ঐতিহ্যবাহিক অ্যাপ্লিকেশন জন্য কাজ | একটি এজেন্টের জন্য কাজ |
|-------|-------------------------|-------------------------|
| **ইনফ্রাস্ট্রাকচার** (`infra/`) | একটি ওয়েব অ্যাপ এবং ডাটাবেস প্রস্তুত করে | একটি AI মডেল এন্ডপয়েন্ট, সার্চ ইনডেক্স, অথবা এজেন্ট হোস্ট প্রস্তুত করে |
| **কোড** (`src/`) | আপনার ফ্রন্টএন্ড এবং API সোর্স কোড থাকে | এজেন্ট লজিক এবং প্রম্পট সংজ্ঞা থাকে |
| **কনফিগারেশন** (`azure.yaml`) | আপনার সার্ভিস এবং তাদের হোস্টিং টার্গেট তালিকা করে | আপনার এজেন্টকে একটি সার্ভিস হিসাবে তালিকা করে, তার কোড ও হোস্টের দিকে নির্দেশ করে |

### `azure.yaml` এর ভূমিকা

আপনাকে এখনই সিনট্যাক্স মেমোরি করার দরকার নেই। ধারণাগতভাবে, `azure.yaml` ফাইলটি হলো যেখানে আপনি azd-কে বলেন: *"এগুলো আমার অ্যাপ্লিকেশনের সার্ভিস, এবং তাদের কোড কোথায় আছে।"*

আপনার প্রোজেক্টে একটি AI এজেন্ট থাকলে, `azure.yaml` কেবল সেই এজেন্টকেই একটি সার্ভিস হিসেবে তালিকাভুক্ত করে। তারপর azd সঠিক ইনফ্রাস্ট্রাকচার (যেমন Microsoft Foundry Models এন্ডপয়েন্ট বা এজেন্ট হোস্ট করার জন্য Container App) প্রস্তুত করে এবং আপনার এজেন্ট কোড ডিপ্লয় করে—একইভাবে যেমন ওয়েব অ্যাপ বা API এর ক্ষেত্রে করে।

এর মানে, এখানে নতুন কিছু শেখার প্রয়োজন নেই। যদি আপনি বুঝতে পারেন azd কিভাবে ওয়েব সার্ভিস পরিচালনা করে, আপনি ইতিমধ্যে বুঝে গেছেন এটি কিভাবে এজেন্ট পরিচালনা করে।

## কনফিগারেশন হায়ারার্কি

azd একটি স্তর ভিত্তিক কনফিগারেশন ব্যবহার করে:
1. **কমান্ড-লাইন ফ্ল্যাগ** (অধিকতর অগ্রাধিকার)
2. **পরিবেশ পরিবর্তনশীল**
3. **লোকাল প্রকল্প কনফিগারেশন** (`.azd/config.json`)
4. **গ্লোবাল ইউজার কনফিগারেশন** (`~/.azd/config.json`)
5. **ডিফল্ট মান** (কম অগ্রাধিকার)

## গ্লোবাল কনফিগারেশন

### গ্লোবাল ডিফল্ট সেট করা
```bash
# ডিফল্ট সাবস্ক্রিপশন সেট করুন
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ডিফল্ট অবস্থান সেট করুন
azd config set defaults.location "eastus2"

# ডিফল্ট রিসোর্স গ্রুপ নামকরণ নিয়ম সেট করুন
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# সমস্ত গ্লোবাল কনফিগারেশন দেখুন
azd config show

# একটি কনফিগারেশন অপসারণ করুন
azd config unset defaults.location
```

### সাধারণ গ্লোবাল সেটিংস
```bash
# উন্নয়ন পছন্দসমূহ
azd config set alpha.enable true                    # অ্যালফা বৈশিষ্ট্য সক্ষম করুন
azd config set telemetry.enabled false             # টেলিমেট্রি নিষ্ক্রিয় করুন
azd config set output.format json                  # আউটপুট ফরম্যাট সেট করুন

# সুরক্ষা সেটিংস
azd config set auth.useAzureCliCredential true     # অনুমোদনের জন্য Azure CLI ব্যবহার করুন
azd config set tls.insecure false                  # TLS যাচাইকরণ প্রয়োগ করুন

# কার্যক্ষমতা সমন্বয়
azd config set provision.parallelism 5             # সমান্তরাল রিসোর্স তৈরী
azd config set deploy.timeout 30m                  # স্থাপন সময়সীমা
```

## 🏗️ প্রকল্প কনফিগারেশন

### azure.yaml কাঠামো
`azure.yaml` ফাইলটি হলো আপনার azd প্রকল্পের হৃদয়:

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

### সার্ভিস কনফিগারেশন বিকল্প

#### হোস্ট টাইপস
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

#### ভাষাভিত্তিক সেটিংস
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
# একটি নতুন পরিবেশ তৈরি করুন
azd env new development

# নির্দিষ্ট অবস্থান দিয়ে তৈরি করুন
azd env new staging --location "westus2"

# টেমপ্লেট থেকে তৈরি করুন
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### পরিবেশ কনফিগারেশন
প্রত্যেক পরিবেশের নিজস্ব কনফিগারেশন থাকে `.azure/<env-name>/config.json` এ:

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

### পরিবেশ পরিবর্তনশীল
```bash
# পরিবেশ-নির্দিষ্ট ভেরিয়েবল সেট করুন
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# পরিবেশ ভেরিয়েবল দেখুন
azd env get-values

# প্রত্যাশিত আউটপুট:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# পরিবেশ ভেরিয়েবল অপসারণ করুন
azd env unset DEBUG

# অপসারণ নিশ্চিত করুন
azd env get-values | grep DEBUG
# (কিছুই ফেরত আসা উচিত নয়)
```

### পরিবেশ টেমপ্লেট
একই পরিবেশ সেটআপ নিশ্চিত করতে `.azure/env.template` তৈরি করুন:
```bash
# প্রয়োজনীয় ভেরিয়েবলসমূহ
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# অ্যাপ্লিকেশন সেটিংস
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ঐচ্ছিক উন্নয়ন সেটিংস
DEBUG=false
LOG_LEVEL=info
```

## 🔐 প্রমাণীকরণ কনফিগারেশন

### Azure CLI ইন্টিগ্রেশন
```bash
# Azure CLI ক্রেডেনশিয়াল ব্যবহার করুন (ডিফল্ট)
azd config set auth.useAzureCliCredential true

# নির্দিষ্ট টেন্যান্ট দিয়ে লগইন করুন
az login --tenant <tenant-id>

# ডিফল্ট সাবস্ক্রিপশন সেট করুন
az account set --subscription <subscription-id>
```

### সার্ভিস প্রিন্সিপাল প্রমাণীকরণ
CI/CD পাইপলাইনের জন্য:
```bash
# পরিবেশ ভেরিয়েবল সেট করুন
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# অথবা সরাসরি কনফিগার করুন
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### ম্যানেজড আইডেন্টিটি
Azure হোস্টেড পরিবেশের জন্য:
```bash
# পরিচালিত পরিচয়পত্র প্রত্যয়ন সক্ষম করুন
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ইনফ্রাস্ট্রাকচার কনফিগারেশন

### Bicep প্যারামিটারস
`infra/main.parameters.json` এ ইনফ্রাস্ট্রাকচার প্যারামিটার কনফিগার করুন:
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
Terraform প্রজেক্টের জন্য, `infra/terraform.tfvars` এ কনফিগার করুন:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ডিপ্লয়মেন্ট কনফিগারেশন

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
# নামকরণ নিয়মাবলী নির্ধারণ করুন
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### নেটওয়ার্ক কনফিগারেশন
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

### ডেভেলপমেন্ট পরিবেশ
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

## 🔍 কনফিগারেশন ভ্যালিডেশন

### কনফিগারেশন যাচাই করুন
```bash
# কনফিগারেশন সিনট্যাক্স পরীক্ষা করুন
azd config validate

# পরিবেশ ভেরিয়েবল পরীক্ষা করুন
azd env get-values

# অবকাঠামো যাচাই করুন
azd provision --dry-run
```

### কনফিগারেশন স্ক্রিপ্ট
`_scripts/_` এ যাচাইকরণ স্ক্রিপ্ট তৈরি করুন:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# প্রয়োজনীয় এনভায়রনমেন্ট ভেরিয়েবলগুলি পরীক্ষা করুন
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml সিনট্যাক্স যাচাই করুন
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 সেরা অনুশীলনসমূহ

### ১. পরিবেশ পরিবর্তনশীল ব্যবহার করুন
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### ২. কনফিগারেশন ফাইল সুনিয়ন্ত্রণ করুন
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

### ৩. ভার্শন কন্ট্রোল বিবেচনা
```bash
# .gitignore
.azure/*/config.json         # পরিবেশ কনফিগ (রিসোর্স আইডি থাকে)
.azure/*/.env               # পরিবেশ ভেরিয়েবল (গোপনীয়তা থাকতে পারে)
.env                        # স্থানীয় পরিবেশ ফাইল
```

### ৪. কনফিগারেশন ডকুমেন্টেশন
আপনার কনফিগারেশন `CONFIG.md` এ ডকুমেন্ট করুন:
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

## 🎯 হাতেকলম অনুশীলন

### অনুশীলন ১: বহু-পরিবেশ কনফিগারেশন (১৫ মিনিট)

**লক্ষ্য**: তিনটি ভিন্ন পরিবেশ তৈরি ও কনফিগার করুন

```bash
# উন্নয়ন পরিবেশ তৈরি করুন
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# স্টেজিং পরিবেশ তৈরি করুন
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# প্রোডাকশন পরিবেশ তৈরি করুন
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# প্রতিটি পরিবেশ যাচাই করুন
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**সফলতার মানদণ্ড:**
- [ ] তিনটি পরিবেশ সফলভাবে তৈরি হয়েছে
- [ ] প্রতিটি পরিবেশের আলাদা কনফিগারেশন আছে
- [ ] পরিবেশ পরিবর্তন করার সময় কোনো ত্রুটি হবে না
- [ ] `azd env list` সব তিনটি পরিবেশ দেখায়

### অনুশীলন ২: সিক্রেট পরিচালনা (১০ মিনিট)

**লক্ষ্য**: সংবেদনশীল তথ্যের নিরাপদ কনফিগারেশনের অনুশীলন

```bash
# গোপন তথ্য সেট করুন (আউটপুটে প্রদর্শিত হবে না)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# গোপন নয় এমন কনফিগ সেট করুন
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# পরিবেশ দেখুন (গোপন তথ্য লুকানো উচিত)
azd env get-values

# নিশ্চিত করুন গোপন তথ্য সংরক্ষিত আছে
azd env get DB_PASSWORD  # আসল মান দেখানো উচিত
```

**সফলতার মানদণ্ড:**
- [ ] সিক্রেট গুলো টার্মিনালে প্রদর্শিত না করে সংরক্ষিত হয়েছে
- [ ] `azd env get-values` রিড্যাক্ট করা সিক্রেট দেখায়
- [ ] পৃথক `azd env get <SECRET_NAME>` আসল মান আনে

## পরবর্তী ধাপ

- [Your First Project](first-project.md) - অনুশীলনে কনফিগারেশন প্রয়োগ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ডিপ্লয়মেন্ট জন্য কনফিগারেশন ব্যবহার
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - প্রোডাকশন-রেডি কনফিগারেশন

## রেফারেন্স

- [azd কনফিগারেশন রেফারেন্স](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml স্কিমা](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [পরিবেশ পরিবর্তনশীল](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৩ - কনফিগারেশন ও প্রমাণীকরণ
- **⬅️ পূর্ববর্তী**: [Your First Project](first-project.md)
- **➡️ পরবর্তী অধ্যায়**: [অধ্যায় ৪: ইনফ্রাস্ট্রাকচার অ্যাজ কোড](../chapter-04-infrastructure/deployment-guide.md)
- **পরবর্তী পাঠ**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। আমরা সঠিকতার জন্য চেষ্টা করি, তবে দয়া করে জানুন যে স্বয়ংক্রিয় অনুবাদে ভুল বা অসঙ্গতি থাকতে পারে। অভিভাষিক ভাষায় মূল নথিটিকে প্রমাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহার থেকে উদ্ভূত যেকোনো ভুল বোঝা বা অপব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->