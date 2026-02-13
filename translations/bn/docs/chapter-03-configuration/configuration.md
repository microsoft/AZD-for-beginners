# কনফিগারেশন গাইড

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD নবীনদের জন্য](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় 3 - কনফিগারেশন ও প্রমাণীকরণ
- **⬅️ পূর্বের**: [আপনার প্রথম প্রকল্প](first-project.md)
- **➡️ পরবর্তী**: [ডিপ্লয়মেন্ট গাইড](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৪: ইনফ্রাস্ট্রাকচার অ্যাজ কোড](../chapter-04-infrastructure/deployment-guide.md)

## পরিচিতি

এই বিস্তৃত গাইডটি Azure Developer CLI কনফিগারেশন সম্পর্কিত সমস্ত দিক কভার করে যাতে উন্নয়ন ও ডিপ্লয়মেন্ট ওয়ার্কফ্লো গুলো অনুকূল হয়। আপনি কনফিগারেশন শ্রেণিবিন্যাস, পরিবেশ ব্যবস্থাপনা, প্রমাণীকরণ পদ্ধতি এবং উন্নত কনফিগারেশন প্যাটার্ন সম্পর্কে শিখবেন যা দক্ষ এবং নিরাপদ Azure ডিপ্লয়মেন্ট সক্ষম করে।

## শেখার লক্ষ্য

এই পাঠের শেষে আপনি:
- azd কনফিগারেশন শ্রেণিবিন্যাসে দক্ষতা অর্জন করবেন এবং কীভাবে সেটিংসগুলির অগ্রাধিকার নির্ধারিত হয় তা বুঝবেন
- গ্লোবাল এবং প্রোজেক্ট-নির্দিষ্ট সেটিংস কার্যকরভাবে কনফিগার করবেন
- বিভিন্ন কনফিগারেশনের সাথে একাধিক পরিবেশ পরিচালনা করবেন
- নিরাপদ প্রমাণীকরণ এবং অনুমোদন প্যাটার্ন প্রয়োগ করবেন
- জটিল পরিস্থিতির জন্য উন্নত কনফিগারেশন প্যাটার্নগুলি বুঝবেন

## শেখার ফলাফল

এই পাঠ সম্পন্ন করার পরে, আপনি সক্ষম হবেন:
- উন্নয়ন ওয়ার্কফ্লো গুলোর জন্য azd কনফিগার করবেন
- একাধিক ডিপ্লয়মেন্ট পরিবেশ সেটআপ এবং পরিচালনা করবেন
- নিরাপদ কনফিগারেশন ম্যানেজমেন্ট অনুশীলন প্রয়োগ করবেন
- কনফিগারেশন-সংক্রান্ত সমস্যা সমাধান করবেন
- নির্দিষ্ট সাংগঠনিক চাহিদার জন্য azd আচরণ কাস্টমাইজ করবেন

এই বিস্তৃত গাইডটি Azure Developer CLI কনফিগারেশন সম্পর্কিত সমস্ত দিক কভার করে যাতে উন্নয়ন ও ডিপ্লয়মেন্ট ওয়ার্কফ্লো গুলো অনুকূল হয়।

## কনফিগারেশন শ্রেণিবিন্যাস

azd একটি শ্রেণিকৃত কনফিগারেশন সিস্টেম ব্যবহার করে:
1. **কমান্ড-লাইন ফ্ল্যাগ** (সর্বোচ্চ অগ্রাধিকার)
2. **পরিবেশ ভেরিয়েবল**
3. **লোকাল প্রোজেক্ট কনফিগারেশন** (`.azd/config.json`)
4. **গ্লোবাল ইউজার কনফিগারেশন** (`~/.azd/config.json`)
5. **ডিফল্ট মানসমূহ** (নূন্যতম অগ্রাধিকার)

## গ্লোবাল কনফিগারেশন

### গ্লোবাল ডিফল্ট সেট করা
```bash
# ডিফল্ট সাবস্ক্রিপশন সেট করুন
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ডিফল্ট অবস্থান সেট করুন
azd config set defaults.location "eastus2"

# ডিফল্ট রিসোর্স গ্রুপের নামকরণ কনভেনশন সেট করুন
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# সমস্ত গ্লোবাল কনফিগারেশন দেখুন
azd config list

# একটি কনফিগারেশন সরান
azd config unset defaults.location
```

### সাধারণ গ্লোবাল সেটিংস
```bash
# উন্নয়ন পছন্দসমূহ
azd config set alpha.enable true                    # অ্যালফা বৈশিষ্ট্য সক্রিয় করুন
azd config set telemetry.enabled false             # টেলিমেট্রি নিষ্ক্রিয় করুন
azd config set output.format json                  # আউটপুট ফরম্যাট নির্ধারণ করুন

# নিরাপত্তা সেটিংস
azd config set auth.useAzureCliCredential true     # প্রমাণীকরণের জন্য Azure CLI ব্যবহার করুন
azd config set tls.insecure false                  # TLS যাচাই বাধ্যতামূলক করুন

# পারফরম্যান্স টিউনিং
azd config set provision.parallelism 5             # সমান্তরাল রিসোর্স তৈরি
azd config set deploy.timeout 30m                  # ডিপ্লয়মেন্ট টাইমআউট
```

## 🏗️ প্রকল্প কনফিগারেশন

### azure.yaml কাঠামো
আপনার azd প্রোজেক্টের কোর হলো `azure.yaml` ফাইল:

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

### সার্ভিস কনফিগারেশন অপশনগুলো

#### হোস্ট টাইপসমূহ
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
# নতুন পরিবেশ তৈরি করুন
azd env new development

# নির্দিষ্ট অবস্থানে তৈরি করুন
azd env new staging --location "westus2"

# টেমপ্লেট থেকে তৈরি করুন
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### পরিবেশ কনফিগারেশন
প্রতিটি পরিবেশের আলাদা কনফিগারেশন থাকে `.azure/<env-name>/config.json`-এ:

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

# পরিবেশ ভেরিয়েবল মুছে ফেলুন
azd env unset DEBUG

# মুছে ফেলা যাচাই করুন
azd env get-values | grep DEBUG
# (কিছুই ফেরত থাকা উচিত নয়)
```

### পরিবেশ টেমপ্লেট
একটি সঙ্গতিপূর্ণ পরিবেশ সেটআপের জন্য `.azure/env.template` তৈরি করুন:
```bash
# প্রয়োজনীয় ভেরিয়েবল
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
# Azure CLI শংসাপত্র ব্যবহার করুন (ডিফল্ট)
azd config set auth.useAzureCliCredential true

# নির্দিষ্ট টেন্যান্ট দিয়ে লগইন করুন
az login --tenant <tenant-id>

# ডিফল্ট সাবস্ক্রিপশন সেট করুন
az account set --subscription <subscription-id>
```

### সার্ভিস প্রিন্সিপাল প্রমাণীকরণ
CI/CD পাইপলাইনের জন্য:
```bash
# পরিবেশ ভেরিয়েবলগুলি সেট করুন
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# অথবা সরাসরি কনফিগার করুন
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### ম্যানেজড আইডেন্টিটি
Azure-হোস্টেড পরিবেশগুলোর জন্য:
```bash
# ম্যানেজড পরিচয় প্রমাণীকরণ সক্ষম করুন
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ইन्फ্রাস্ট্রাকচার কনফিগারেশন

### Bicep প্যারামিটারসমূহ
ইনফ্রাস্ট্রাকচার প্যারামিটারগুলো `infra/main.parameters.json`-এ কনফিগার করুন:
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
Terraform প্রোজেক্টগুলোর জন্য, `infra/terraform.tfvars`-এ কনফিগার করুন:
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

## 🔧 অ্যাডভান্সড কনফিগারেশন

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
# .azure/উন্নয়ন/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### স্টেজিং পরিবেশ
```bash
# .আজুর/স্টেজিং/.env
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

### কনফিগারেশন যাচাই
```bash
# কনফিগারেশনের সিনট্যাক্স পরীক্ষা করুন
azd config validate

# পরিবেশ ভেরিয়েবল পরীক্ষা করুন
azd env get-values

# ইনফ্রাস্ট্রাকচার যাচাই করুন
azd provision --dry-run
```

### কনফিগারেশন স্ক্রিপ্টসমূহ
ভ্যালিডেশন স্ক্রিপ্টগুলো `scripts/`-এ তৈরি করুন:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# প্রয়োজনীয় পরিবেশ ভেরিয়েবলগুলি যাচাই করুন
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml এর সিনট্যাক্স যাচাই করুন
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

### 2. কনফিগারেশন ফাইলগুলো সুশৃঙ্খলভাবে সাজান
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

### 3. ভার্সন কন্ট্রোল বিবেচ্য বিষয়সমূহ
```bash
# .gitignore
.azure/*/config.json         # পরিবেশ কনফিগারেশনগুলো (রিসোর্স আইডি রয়েছে)
.azure/*/.env               # পরিবেশ ভেরিয়েবল (গোপন তথ্য থাকতে পারে)
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

## 🎯 হ্যান্ডস-অন অনুশীলনী

### অনুশীলন 1: মাল্টি-এনভায়রনমেন্ট কনফিগারেশন (15 মিনিট)

**লক্ষ্য**: আলাদা সেটিংসসহ তিনটি পরিবেশ তৈরি ও কনফিগার করা

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

**সাফল্যের মানদণ্ড:**
- [ ] তিনটি পরিবেশ সফলভাবে তৈরি হয়েছে
- [ ] প্রতিটি পরিবেশের আলাদা কনফিগারেশন রয়েছে
- [ ] ত্রুটি ছাড়াই পরিবেশগুলোর মধ্যে স্যুইচ করা যায়
- [ ] `azd env list` সব তিনটি পরিবেশ দেখায়

### অনুশীলন 2: সিক্রেট ম্যানেজমেন্ট (10 মিনিট)

**লক্ষ্য**: সংবেদনশীল ডেটা নিয়ে নিরাপদ কনফিগারেশন অনুশীলন করা

```bash
# গোপন সেট করুন (আউটপুটে দেখানো হবে না)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# অ-গোপন কনফিগ সেট করুন
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# পরিবেশ দেখুন (গোপন তথ্য লুকানো থাকা উচিত)
azd env get-values

# যাচাই করুন যে গোপন তথ্য সংরক্ষিত আছে
azd env get DB_PASSWORD  # বাস্তব মান দেখানো উচিত
```

**সাফল্যের মানদণ্ড:**
- [ ] সিক্রেটগুলো টার্মিনালে প্রদর্শন না করে সংরক্ষণ করা হয়েছে
- [ ] `azd env get-values` রিড্যাক্ট করা সিক্রেটগুলো দেখায়
- [ ] পৃথকভাবে `azd env get <SECRET_NAME>` আসল মান উদ্ধার করে

## পরবর্তী ধাপসমূহ

- [আপনার প্রথম প্রকল্প](first-project.md) - কনফিগারেশন বাস্তবে প্রয়োগ করুন
- [ডিপ্লয়মেন্ট গাইড](../chapter-04-infrastructure/deployment-guide.md) - ডিপ্লয়মেন্টের জন্য কনফিগারেশন ব্যবহার করুন
- [রিসোর্স প্রোভিশনিং](../chapter-04-infrastructure/provisioning.md) - প্রোডাকশন-রেডি কনফিগারেশন

## রেফারেন্স

- [azd কনফিগারেশন রেফারেন্স](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml স্কিমা](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [পরিবেশ ভেরিয়েবল](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD নবীনদের জন্য](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় 3 - কনফিগারেশন ও প্রমাণীকরণ
- **⬅️ পূর্বের**: [আপনার প্রথম প্রকল্প](first-project.md)
- **➡️ পরবর্তী অধ্যায়**: [অধ্যায় ৪: ইনফ্রাস্ট্রাকচার অ্যাজ কোড](../chapter-04-infrastructure/deployment-guide.md)
- **পরবর্তী পাঠ**: [আপনার প্রথম প্রকল্প](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা নির্ভুলতার জন্য যত্নশীল হলেও, অনুগ্রহ করে জানুন যে স্বয়ংক্রিয় অনুবাদে ভুল বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার নিজ ভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে উদ্ভূত যেকোনো ভুলবোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->