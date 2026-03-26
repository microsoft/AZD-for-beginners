# কনফিগারেশন গাইড

**অধ্যায় নেভিগেশন:**
- **📚 Course Home**: [AZD নবীনদের জন্য](../../README.md)
- **📖 Current Chapter**: অধ্যায় ৩ - কনফিগারেশন ও প্রমাণীকরণ
- **⬅️ Previous**: [আপনার প্রথম প্রকল্প](first-project.md)
- **➡️ Next**: [প্রদায়ন নির্দেশিকা](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [অধ্যায় ৪: কোড হিসেবে ইনফ্রাস্ট্রাকচার](../chapter-04-infrastructure/deployment-guide.md)

## ভূমিকা

এই বিস্তৃত গাইডটি Azure Developer CLI কনফিগার করার সকল দিক কভার করে যাতে উন্নত ডেভেলপমেন্ট এবং ডিপ্লয়মেন্ট ওয়ার্কফ্লোকে সর্বোত্তম করা যায়। আপনি কনফিগারেশন হায়ারার্কি, পরিবেশ ব্যবস্থাপনা, প্রমাণীকরণ পদ্ধতি, এবং উন্নত কনফিগারেশন প্যাটার্নসমূহ সম্পর্কে জানবেন যা কার্যকর এবং সুরক্ষিত Azure ডিপ্লয়মেন্ট সক্ষম করে।

## শেখার লক্ষ্য

এই পাঠ শেষ করার পরে আপনি:
- azd কনফিগারেশন শ্রেণীবিন্যাস আয়ত্ত করবেন এবং বুঝবেন কিভাবে সেটিংসগুলির অগ্রাধিকার নির্ধারণ করা হয়
- গ্লোবাল এবং প্রকল্প-নির্দিষ্ট সেটিংস কার্যকরভাবে কনফিগার করতে পারবেন
- বিভিন্ন কনফিগারেশনের সঙ্গে একাধিক পরিবেশ পরিচালনা করতে পারবেন
- নিরাপদ প্রমাণীকরণ ও অনুমোদন প্যাটার্ন প্রয়োগ করতে পারবেন
- জটিল পরিস্থিতির জন্য উন্নত কনফিগারেশন প্যাটার্নগুলো বুঝতে পারবেন

## শেখার ফলাফল

এই পাঠ সম্পন্ন করার পরে, আপনি সক্ষম হবেন:
- উন্নত ডেভেলপমেন্ট ওয়ার্কফ্লো-এর জন্য azd কনফিগার করতে
- একাধিক ডিপ্লয়মেন্ট পরিবেশ সেট আপ ও পরিচালনা করতে
- নিরাপদ কনফিগারেশন পরিচালনার পদ্ধতি প্রয়োগ করতে
- কনফিগারেশন-সম্পর্কিত সমস্যাগুলি সমাধান করতে
- বিশেষ সংস্থাগত চাহিদার জন্য azd-এর আচরণ কাস্টমাইজ করতে

এই বিস্তৃত গাইডটি Azure Developer CLI কনফিগার করার সকল দিক কভার করে যাতে উন্নত ডেভেলপমেন্ট এবং ডিপ্লয়মেন্ট ওয়ার্কফ্লোকে সর্বোত্তম করা যায়।

## azd প্রকল্পে AI এজেন্টগুলো বোঝা

যদি আপনি AI এজেন্ট সম্পর্কে নতুন হন, তাহলে azd জগতের মধ্যে তাদের সম্পর্কে ভাবার একটি সহজ উপায় এখানে আছে।

### এজেন্ট কী?

একটি এজেন্ট হলো একটি সফটওয়্যার উপাদান যা অনুরোধ গ্রহণ করতে পারে, এটি সম্পর্কে যুক্তি করতে পারে এবং ক্রিয়া নিতে পারে—প্রায়শই একটি AI মডেল কল করে, ডেটা অনুসন্ধান করে, বা অন্য সার্ভিসগুলোকে আহ্বান করে। একটি azd প্রকল্পে, একটি এজেন্ট আপনার ওয়েব ফ্রন্টএন্ড বা API ব্যাকএন্ডের পাশাপাশি আরেকটি **service** মাত্র।

### এজেন্টরা কিভাবে azd প্রকল্পের কাঠামোতে ফিট করে

একটি azd প্রকল্প তিনটি স্তর নিয়ে গঠিত: **infrastructure**, **code**, এবং **configuration**। এজেন্টগুলো এই স্তরগুলোতে সেই একইভাবে প্লাগ ইন করে যেমন অন্য যে কোনো সার্ভিস করে:

| স্তর | প্রচলিত অ্যাপের জন্য এটি যে কাজগুলো করে | এজেন্টের জন্য এটি যে কাজগুলো করে |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | একটি ওয়েব অ্যাপ এবং ডাটাবেস প্রস্তুত করে | একটি AI মডেল এন্ডপয়েন্ট, সার্চ ইনডেক্স, বা এজেন্ট হোস্ট প্রস্তুত করে |
| **Code** (`src/`) | আপনার ফ্রন্টএন্ড এবং API উৎস কোড ধারণ করে | আপনার এজেন্ট লজিক এবং প্রম্পট সংজ্ঞা ধারণ করে |
| **Configuration** (`azure.yaml`) | আপনার সার্ভিসগুলো এবং তাদের হোস্টিং টার্গেটগুলো তালিকাভুক্ত করে | আপনার এজেন্টকে একটি সার্ভিস হিসেবে তালিকাভুক্ত করে, তার কোড এবং হোস্ট নির্দেশ করে |

### `azure.yaml`-এর ভূমিকা

এখনই আপনাকে সিনট্যাক্স মুখস্থ করার দরকার নেই। ধারণাগতভাবে, `azure.yaml` হল সেই ফাইল যেখানে আপনি azd-কে বলেন: *"এগুলো আমার অ্যাপ্লিকেশন তৈরির সার্ভিসগুলো, এবং এগুলোর কোড কোথায় পাওয়া যাবে।"*

যখন আপনার প্রকল্পে একটি AI এজেন্ট থাকে, তখন `azure.yaml` কেবল সেটিকে সার্ভিসগুলোর মধ্যে একটি হিসেবে তালিকাভুক্ত করে। azd তখন সঠিক ইনফ্রাস্ট্রাকচার (যেমন Microsoft Foundry Models এন্ডপয়েন্ট বা এজেন্ট হোস্ট করার জন্য একটি Container App) প্রোভিশন করবে এবং আপনার এজেন্ট কোড ডিপ্লয় করবে—একইভাবে যেমন এটি একটি ওয়েব অ্যাপ বা API-র জন্য করতো।

এইটির মানে হল যে মূলত শিখতে নতুন কিছু নেই। আপনি যদি বুঝে থাকেন azd কিভাবে একটি ওয়েব সার্ভিস পরিচালনা করে, তাহলে আপনি ইতিমধ্যেই বুঝে নিয়েছেন কিভাবে এটি একটি এজেন্ট পরিচালনা করে।

## কনফিগারেশন হায়ারার্কি

azd একটি শ্রেণীবদ্ধ কনফিগারেশন সিস্টেম ব্যবহার করে:
1. **Command-line flags** (সর্বোচ্চ অগ্রাধিকার)
2. **পরিবেশ ভেরিয়েবল**
3. **স্থানীয় প্রকল্প কনফিগারেশন** (`.azd/config.json`)
4. **গ্লোবাল ব্যবহারকারী কনফিগারেশন** (`~/.azd/config.json`)
5. **ডিফল্ট মান** (নিম্নতম অগ্রাধিকার)

## গ্লোবাল কনফিগারেশন

### Setting Global Defaults
```bash
# ডিফল্ট সাবস্ক্রিপশন সেট করুন
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ডিফল্ট অবস্থান সেট করুন
azd config set defaults.location "eastus2"

# ডিফল্ট রিসোর্স গ্রুপ নামকরণ নিয়ম সেট করুন
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# সমস্ত গ্লোবাল কনফিগারেশন দেখুন
azd config list

# একটি কনফিগারেশন মুছে ফেলুন
azd config unset defaults.location
```

### Common Global Settings
```bash
# উন্নয়ন পছন্দসমূহ
azd config set alpha.enable true                    # অ্যালফা বৈশিষ্ট্য সক্রিয় করুন
azd config set telemetry.enabled false             # টেলিমেট্রি অক্ষম করুন
azd config set output.format json                  # আউটপুট ফরম্যাট সেট করুন

# নিরাপত্তা সেটিংস
azd config set auth.useAzureCliCredential true     # প্রমাণীকরণের জন্য Azure CLI ব্যবহার করুন
azd config set tls.insecure false                  # TLS যাচাইকরণ প্রয়োগ করুন

# পারফরম্যান্স টিউনিং
azd config set provision.parallelism 5             # সমান্তরাল রিসোর্স তৈরি
azd config set deploy.timeout 30m                  # ডেপ্লয়মেন্ট টাইমআউট
```

## 🏗️ প্রকল্প কনফিগারেশন

### azure.yaml গঠন
The `azure.yaml` file is the heart of your azd project:

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

### সার্ভিস কনফিগারেশন অপশনসমূহ

#### হোস্ট প্রকার
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
# একটি নতুন পরিবেশ তৈরি করুন
azd env new development

# নির্দিষ্ট অবস্থানে তৈরি করুন
azd env new staging --location "westus2"

# টেমপ্লেট থেকে তৈরি করুন
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### পরিবেশ কনফিগারেশন
প্রতিটি পরিবেশের নিজস্ব কনফিগারেশন থাকে `.azure/<env-name>/config.json`-এ:

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

### পরিবেশ ভেরিয়েবলসমূহ
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

# পরিবেশ ভেরিয়েবল সরান
azd env unset DEBUG

# অপসারণ যাচাই করুন
azd env get-values | grep DEBUG
# (কিছুই ফেরত আসবে না)
```

### পরিবেশ টেমপ্লেট
সামঞ্জস্যপূর্ণ পরিবেশ সেটআপের জন্য `.azure/env.template` তৈরি করুন:
```bash
# প্রয়োজনীয় ভ্যারিয়েবল
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# অ্যাপ্লিকেশন সেটিংস
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ঐচ্ছিক ডেভেলপমেন্ট সেটিংস
DEBUG=false
LOG_LEVEL=info
```

## 🔐 প্রমাণীকরণ কনফিগারেশন

### Azure CLI ইন্টিগ্রেশন
```bash
# Azure CLI পরিচয়পত্র ব্যবহার করুন (ডিফল্ট)
azd config set auth.useAzureCliCredential true

# নির্দিষ্ট টেন্যান্টে লগইন করুন
az login --tenant <tenant-id>

# ডিফল্ট সাবস্ক্রিপশন সেট করুন
az account set --subscription <subscription-id>
```

### সার্ভিস প্রিন্সিপাল প্রমাণীকরণ
CI/CD পাইপলাইনগুলোর জন্য:
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
Azure-হোস্টেড পরিবেশগুলির জন্য:
```bash
# ম্যানেজড আইডেন্টিটি প্রমাণীকরণ সক্রিয় করুন
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ অবকাঠামো কনফিগারেশন

### Bicep প্যারামিটার
ইনফ্রাস্ট্রাকচার প্যারামিটার কনফিগার করুন `infra/main.parameters.json`-এ:
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
Terraform প্রকল্পগুলোর জন্য, `infra/terraform.tfvars`-এ কনফিগার করুন:
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
# নামকরণের নিয়ম নির্ধারণ করুন
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
# .অ্যাজুর/স্টেজিং/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### প্রোডাকশন পরিবেশ
```bash
# .azure/উৎপাদন/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 কনফিগারেশন যাচাই

### কনফিগারেশন যাচাই করা
```bash
# কনফিগারেশনের সিনট্যাক্স পরীক্ষা করুন
azd config validate

# পরিবেশ ভেরিয়েবলগুলো পরীক্ষা করুন
azd env get-values

# অবকাঠামো যাচাই করুন
azd provision --dry-run
```

### কনফিগারেশন স্ক্রিপ্ট
ভ্যালিডেশন স্ক্রিপ্টগুলো `scripts/`-এ তৈরি করুন:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# প্রয়োজনীয় পরিবেশ ভেরিয়েবলসমূহ যাচাই করুন
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

## 🎓 সেরা অনুশীলন

### 1. পরিবেশ ভেরিয়েবল ব্যবহার করুন
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. কনফিগারেশন ফাইল সংগঠিত করুন
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

### 3. সংস্করণ নিয়ন্ত্রণ বিবেচনাসমূহ
```bash
# .gitignore
.azure/*/config.json         # পরিবেশ কনফিগারেশনসমূহ (রিসোর্স আইডি ধারণ করে)
.azure/*/.env               # পরিবেশ ভ্যারিয়েবলসমূহ (গোপন তথ্য থাকতে পারে)
.env                        # স্থানীয় পরিবেশ ফাইল
```

### 4. কনফিগারেশন ডকুমেন্টেশন
আপনার কনফিগারেশন `CONFIG.md`-এ ডকুমেন্ট করুন:
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

## 🎯 অনুশীলনভিত্তিক কার্যক্রম

### অনুশীলন ১: মাল্টি-পরিবেশ কনফিগারেশন (১৫ মিনিট)

**লক্ষ্য**: বিভিন্ন সেটিংসসহ তিনটি পরিবেশ তৈরি এবং কনফিগার করা

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

# উৎপাদন পরিবেশ তৈরি করুন
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
- [ ] সফলভাবে তিনটি পরিবেশ তৈরি করা হয়েছে
- [ ] প্রতিটি পরিবেশের অনন্য কনফিগারেশন আছে
- [ ] বিনা ত্রুটিতে পরিবেশগুলোর মধ্যে স্যুইচ করা যায়
- [ ] `azd env list` সব তিনটি পরিবেশ প্রদর্শন করে

### অনুশীলন ২: সিক্রেট ম্যানেজমেন্ট (১০ মিনিট)

**লক্ষ্য**: সংবেদনশীল ডেটা নিয়ে নিরাপদ কনফিগারেশন অনুশীলন করা

```bash
# গোপন তথ্য সেট করুন (আউটপুটে প্রদর্শিত হবে না)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# গোপন নয় এমন কনফিগ সেট করুন
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# পরিবেশ দেখুন (গোপন তথ্য লুকানো থাকা উচিত)
azd env get-values

# গোপন তথ্য সঞ্চিত আছে কিনা যাচাই করুন
azd env get DB_PASSWORD  # আসল মান দেখানো উচিত
```

**সফলতার মানদণ্ড:**
- [ ] গোপন তথ্য টার্মিনালে প্রদর্শিত না করে সংরক্ষণ করা হয়েছে
- [ ] `azd env get-values` গোপন তথ্য লুকিয়ে (redacted) দেখায়
- [ ] `azd env get <SECRET_NAME>` পৃথকভাবে আসল মান ফেরত দেয়

## পরবর্তী ধাপ

- [আপনার প্রথম প্রকল্প](first-project.md) - কনফিগারেশনটি প্রয়োগে ব্যবহার করুন
- [প্রদায়ন নির্দেশিকা](../chapter-04-infrastructure/deployment-guide.md) - ডিপ্লয়মেন্টের জন্য কনফিগারেশন ব্যবহার করুন
- [রিসোর্স প্রোভিশনিং](../chapter-04-infrastructure/provisioning.md) - প্রোডাকশন-প্রস্তুত কনফিগারেশন

## রেফারেন্স

- [azd কনফিগারেশন রেফারেন্স](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml স্কিমা](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [পরিবেশ ভেরিয়েবল](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**অধ্যায় নেভিগেশন:**
- **📚 Course Home**: [AZD নবীনদের জন্য](../../README.md)
- **📖 Current Chapter**: অধ্যায় ৩ - কনফিগারেশন ও প্রমাণীকরণ
- **⬅️ Previous**: [আপনার প্রথম প্রকল্প](first-project.md)
- **➡️ Next Chapter**: [অধ্যায় ৪: কোড হিসেবে ইনফ্রাস্ট্রাকچر](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [আপনার প্রথম প্রকল্প](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়মুক্তির ঘোষণা:
এই নথিটি AI অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা সঠিকতার জন্য সর্বাত্মক চেষ্টা করি, তবুও স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসামঞ্জস্য থাকতে পারে। মূল ভাষায় থাকা মূল নথিটিকেই প্রামাণিক উৎস হিসেবে গণ্য করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ গ্রহণ করার পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে সৃষ্ট কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->