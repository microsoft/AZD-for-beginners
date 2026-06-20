# কনফিগারেশন গাইড

**চ্যাপ্টার ন্যাভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: চ্যাপ্টার 3 - কনফিগারেশন ও প্রমাণীকরণ
- **⬅️ পূর্ববর্তী**: [আপনার প্রথম প্রকল্প](first-project.md)
- **➡️ পরবর্তী**: [ডেপ্লয়মেন্ট গাইড](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 পরের চ্যাপ্টার**: [চ্যাপ্টার 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## ভূমিকা

এই ব্যাপক গাইডটি Azure Developer CLI কনফিগার করার সকল দিক কভার করে যাতে উন্নয়ন ও ডেপ্লয়মেন্ট ওয়ার্কফ্লোগুলিকে অপ্টিমাইজ করা যায়। আপনি কনফিগারেশন হায়ারার্কি, পরিবেশ ব্যবস্থাপনা, প্রমাণীকরণ পদ্ধতি, এবং উন্নত কনফিগারেশন প্যাটার্ন সম্পর্কে জানতে পারবেন যা কার্যকর এবং নিরাপদ Azure ডেপ্লয়মেন্টকে সক্ষম করে।

## শেখার লক্ষ্য

এই লেসনের শেষ পর্যন্ত, আপনি:
- azd কনফিগারেশন হায়ারার্কি আয়ত্ত করতে পারবেন এবং বুঝতে পারবেন কিভাবে সেটিংসগুলিকে অগ্রাধিকার দেওয়া হয়
- গ্লোবাল এবং প্রকল্প-নির্দিষ্ট সেটিংস কার্যকরভাবে কনফিগার করতে পারবেন
- বিভিন্ন কনফিগারেশনের সাথে একাধিক পরিবেশ পরিচালনা করতে পারবেন
- নিরাপদ প্রমাণীকরণ এবং অনুমোদন প্যাটার্নগুলি প্রয়োগ করতে পারবেন
- জটিল পরিস্থিতির জন্য উন্নত কনফিগারেশন প্যাটার্নগুলি বুঝতে পারবেন

## শেখার ফলাফল

এই লেসন সম্পন্ন করার পরে, আপনি সক্ষম হবেন:
- উন্নয়ন ওয়ার্কফ্লোগুলির জন্য azd কনফিগার করতে
- একাধিক ডেপ্লয়মেন্ট পরিবেশ সেট আপ এবং পরিচালনা করতে
- নিরাপদ কনফিগারেশন ব্যবস্থাপনা অনুশীলনগুলি প্রয়োগ করতে
- কনফিগারেশন-সংক্রান্ত সমস্যাগুলি ট্রাবলশুট করতে
- নির্দিষ্ট সাংগঠনিক চাহিদার জন্য azd আচরণ কাস্টমাইজ করতে

এই ব্যাপক গাইডটি Azure Developer CLI কনফিগার করার সকল দিক কভার করে যাতে উন্নয়ন ও ডেপ্লয়মেন্ট ওয়ার্কফ্লোগুলিকে অপ্টিমাইজ করা যায়।

## azd প্রকল্পে AI এজেন্টগুলিকে বোঝা

আপনি যদি AI এজেন্ট সম্পর্কে নতুন হন, তাহলে azd জগতে তাদের সম্পর্কে সহজভাবে ভাবার একটি উপায় এখানে দেওয়া হল।

### এজেন্ট কী?

একটি এজেন্ট হল এমন একটি সফটওয়্যার অংশ যা একটি অনুরোধ গ্রহণ করতে পারে, তা নিয়ে যুক্তি করতে পারে, এবং ক্রিয়াগুলি গ্রহণ করতে পারে — প্রায়শই একটি AI মডেল কল করে, ডেটা খোঁজে, বা অন্যান্য পরিষেবাগুলো আহ্বান করে। একটি azd প্রকল্পে, একটি এজেন্ট শুধুমাত্র আপনার ওয়েব ফ্রন্টএন্ড বা API ব্যাকএন্ডের পাশাপাশি আরেকটি **সার্ভিস**।

### এজেন্টগুলো কিভাবে azd প্রকল্পের কাঠামোতে ফিট করে

একটি azd প্রকল্প তিনটি স্তর নিয়ে গঠিত: **ইনফ্রাস্ট্রাকচার**, **কোড**, এবং **কনফিগারেশন**। এজেন্টগুলো এই স্তরগুলোর সাথে সেকেন্ডারি যে কোনো সার্ভিসের মতই প্লাগ ইন করে:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **ইনফ্রাস্ট্রাকচার** (`infra/`) | একটি ওয়েব অ্যাপ এবং ডাটাবেস প্রোভিশন করে | একটি AI মডেল এন্ডপয়েন্ট, সার্চ ইনডেক্স, বা এজেন্ট হোস্ট প্রোভিশন করে |
| **কোড** (`src/`) | আপনার ফ্রন্টএন্ড এবং API সোর্স কোড ধারণ করে | আপনার এজেন্ট লজিক এবং প্রম্পট সংজ্ঞাগুলো ধারণ করে |
| **কনফিগারেশন** (`azure.yaml`) | আপনার সার্ভিসগুলির এবং তাদের হোস্টিং টার্গেটগুলির তালিকা দেয় | এজেন্টকে একটি সার্ভিস হিসেবে তালিকাভুক্ত করে, তার কোড এবং হোস্ট নির্দেশ করে |

### `azure.yaml` এর ভূমিকা

আপনাকে এখনই সিনট্যাক্স মুখস্ত করার দরকার নেই। ধারণাগতভাবে, `azure.yaml` হল সেই ফাইল যেখানে আপনি azd-কে বলেন: "এগুলোই আমার অ্যাপ্লিকেশন গঠিত সার্ভিসগুলো, এবং তাদের কোড কোথায় আছে।"

যখন আপনার প্রকল্পে একটি AI এজেন্ট থাকে, `azure.yaml` সহজেই সেই এজেন্টকে সার্ভিসগুলোর মধ্যে তালিকাভুক্ত করে। এরপর azd জানতে পারে সঠিক ইনফ্রাস্ট্রাকচার প্রোভিশন করতে (যেমন Microsoft Foundry Models এন্ডপয়েন্ট বা এজেন্ট হোস্ট করার জন্য একটি Container App) এবং আপনার এজেন্ট কোড ডেপ্লয় করতে — যেভাবে এটি একটি ওয়েব অ্যাপ বা API-এর জন্য করত।

এর মানে হলো নতুন কিছু বুনিয়াদি শেখার দরকার নেই। যদি আপনি বুঝতে পারেন কিভাবে azd একটি ওয়েব সার্ভিস পরিচালনা করে, আপনি ইতিমধ্যেই বুঝতে পারবেন কিভাবে এটি একটি এজেন্ট পরিচালনা করে।

## কনফিগারেশন হায়ারার্কি

azd একটি হায়ারার্কিকাল কনফিগারেশন সিস্টেম ব্যবহার করে:
1. **কমান্ড-লাইন ফ্ল্যাগস** (সর্বোচ্চ অগ্রাধিকার)
2. **পরিবেশ ভেরিয়েবল**
3. **স্থানীয় প্রকল্প কনফিগারেশন** (`.azd/config.json`)
4. **গ্লোবাল ব্যবহারকারী কনফিগারেশন** (`~/.azd/config.json`)
5. **ডিফল্ট মানসমূহ** (সর্বনিম্ন অগ্রাধিকার)

## গ্লোবাল কনফিগারেশন

### গ্লোবাল ডিফল্ট সেট করা
```bash
# ডিফল্ট সাবস্ক্রিপশন সেট করুন
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ডিফল্ট অবস্থান সেট করুন
azd config set defaults.location "eastus2"

# ডিফল্ট রিসোর্স গ্রুপ নামকরণ কনভেনশন সেট করুন
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# সমস্ত বৈশ্বিক কনফিগারেশন দেখুন
azd config show

# একটি কনফিগারেশন অপসারণ করুন
azd config unset defaults.location
```

### সাধারণ গ্লোবাল সেটিংস
```bash
# উন্নয়ন পছন্দসমূহ
azd config set alpha.enable true                    # আলফা বৈশিষ্ট্য সক্রিয় করুন
azd config set telemetry.enabled false             # টেলিমেট্রি নিষ্ক্রিয় করুন
azd config set output.format json                  # আউটপুট ফরম্যাট নির্ধারণ করুন

# নিরাপত্তা সেটিংস
azd config set auth.useAzureCliCredential true     # প্রমাণীকরণের জন্য Azure CLI ব্যবহার করুন
azd config set tls.insecure false                  # TLS যাচাইকরণ বাধ্যতামূলক করুন

# পারফরম্যান্স টিউনিং
azd config set provision.parallelism 5             # সমান্তরাল রিসোর্স তৈরি
azd config set deploy.timeout 30m                  # নিয়োগ সময়সীমা
```

## 🏗️ প্রকল্প কনফিগারেশন

### azure.yaml এর কাঠামো
`azure.yaml` ফাইলটি আপনার azd প্রকল্পের হৃদয়:

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
# একটি নতুন পরিবেশ তৈরি করুন
azd env new development

# নির্দিষ্ট অবস্থানে তৈরি করুন
azd env new staging --location "westus2"

# টেমপ্লেট থেকে তৈরি করুন
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### পরিবেশ কনফিগারেশন
প্রতিটি পরিবেশের নিজস্ব কনফিগারেশন থাকে `.azure/<env-name>/config.json` এ:

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

# পরিবেশ ভেরিয়েবল মুছুন
azd env unset DEBUG

# অপসারণ যাচাই করুন
azd env get-values | grep DEBUG
# (কিছুই ফেরত আসবে না)
```

### পরিবেশ টেমপ্লেটসমূহ
নিয়মিত পরিবেশ সেটআপের জন্য `.azure/env.template` তৈরি করুন:
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

### টিমের মধ্যে পরিবেশ শেয়ার করা

একাধিক ব্যক্তি একটি প্রকল্পে কাজ করলে, আপনাদের সম্মত হওয়া দরকার **কি রেপো সহ যায় এবং কি লোকাল থাকে**। azd প্রতিটি পরিবেশকে `.azure/` ফোল্ডারের মধ্যে রাখে, এবং এর সবকিছুই কমিট করা উচিত নয়।

**`.azure/`-এ কি আছে:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**কি gitignore করবেন।** azd-এর ডিফল্ট `.gitignore` ইতিমধ্যেই `.azure/` কে বাদ দেয়। এটি সেইভাবে রাখুন—`.env` ফাইলগুলোতে সিক্রেট থাকতে পারে, এবং রিসোর্স আইডিগুলো যিনি প্রোভিশন করেছেন তাঁর জন্য নির্দিষ্ট। প্রতিটি সহকর্মী তাঁর **নিজের** পরিবেশ লোকালি তৈরি করে:

```bash
# প্রত্যেক ডেভেলপার তাদের নিজস্ব বিচ্ছিন্ন পরিবেশ পেতে এটি একবার চালায়
azd env new dev-alice
azd up
```

**পরিবেশগুলোর মধ্যে স্যুইচ করা।** যেই ডেভেলপার একাধিক পরিবেশ পরিচালনা করে সে কমান্ড চালানোর আগে সক্রিয় পরিবেশটি নির্বাচন করে:

```bash
azd env list                 # সব লোকাল পরিবেশ এবং কোনটি ডিফল্ট তা দেখুন
azd env select staging       # 'staging' কে সক্রিয় পরিবেশ হিসেবে সেট করুন
azd env get-values           # নিশ্চিত করুন আপনি সঠিকটির দিকে নির্দেশিত আছেন
```

**টিমকে নন-সিক্রেট ডিফল্ট প্রদান করা।** একটি টেমপ্লেট (যেমন উপরের `.azure/env.template`) কমিট করুন যাতে সবাই জানে কোন ভেরিয়েবলগুলো সেট করতে হবে—কিন্তু কখনই পূরণ করা মানগুলো কমিট করবেন না। নতুন সহকর্মীরা টেমপ্লেট কপি করে তাদের নিজস্ব মান পূরণ করে।

**CI/CD-তে পরিবেশসমূহ।** পাইপলাইনগুলো আপনার লোকাল `.azure/` ফোল্ডার পড়ে না। পরিবর্তে, পরিবেশ মানগুলোকে পাইপলাইন ভ্যারিয়েবল/সিক্রেট হিসেবে সরবরাহ করুন, এবং azd সেগুলো প্রক্রিয়া পরিবেশ থেকে পড়ে:

```bash
# CI-এ, azd এগুলো পরিবেশ থেকে পড়ে, .azure/ থেকে নয়।
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **সাধারণ নিয়ম:** ইনফ্রাস্ট্রাকচার কোড (`infra/`, `azure.yaml`) Git-এ শেয়ার করা হয়; পরিবেশের *স্টেট এবং সিক্রেট* (`.azure/`) প্রতিটি ডেভেলপার ও প্রতিটি পাইপলাইনের জন্য আলাদা। `azd pipeline config` আপনার জন্য পাইপলাইন ভ্যারিয়েবলগুলো স্বয়ংক্রিয়ভাবে সেট করে দেয়।

## 🔐 প্রমাণীকরণ কনফিগারেশন

### Azure CLI ইন্টিগ্রেশন
```bash
# Azure CLI ক্রেডেনশিয়াল ব্যবহার করুন (ডিফল্ট)
azd config set auth.useAzureCliCredential true

# নির্দিষ্ট টেন্যান্ট দিয়ে লগইন করুন
az login --tenant <tenant-id>

# ডিফল্ট সাবস্ক্রিপশন সেট করুন
az account set --subscription <subscription-id>
```

### সার্ভিস প্রিন্সিপাল প্রমাণীকরণ
CI/CD পাইপলাইনগুলির জন্য:
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

## 🏗️ ইনফ্রাস্ট্রাকচার কনফিগারেশন

### Bicep প্যারামিটার
ইনফ্রাস্ট্রাকচার প্যারামিটারগুলো `infra/main.parameters.json` এ কনফিগার করুন:
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
Terraform প্রকল্পগুলির জন্য, `infra/terraform.tfvars` এ কনফিগার করুন:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ডেপ্লয়মেন্ট কনফিগারেশন

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

### ডকার কনফিগারেশন
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
# নামকরণ সংক্রান্ত নিয়ম নির্ধারণ করুন
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

### উন্নয়ন পরিবেশ
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
# .azure/উৎপাদন/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 কনফিগারেশন যাচাই

### কনফিগারেশন যাচাই করুন
```bash
# কনফিগারেশন সিনট্যাক্স পরীক্ষা করুন
azd config validate

# পরিবেশ ভেরিয়েবলগুলি পরীক্ষা করুন
azd env get-values

# পরিকাঠামো যাচাই করুন
azd provision --dry-run
```

### কনফিগারেশন স্ক্রিপ্ট
`scripts/` এ যাচাই স্ক্রিপ্টগুলো তৈরি করুন:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# প্রয়োজনীয় পরিবেশ ভেরিয়েবলগুলো পরীক্ষা করুন
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml-এর সিনট্যাক্স যাচাই করুন
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 সেরা অনুশীলনগুলো

### 1. পরিবেশ ভেরিয়েবল ব্যবহার করুন
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. কনফিগারেশন ফাইলগুলো সংগঠিত করুন
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

### 3. ভার্সন কন্ট্রোল সম্পর্কিত বিবেচ্য বিষয়
```bash
# .gitignore
.azure/*/config.json         # পরিবেশ কনফিগসমূহ (রিসোর্স আইডি থাকতে পারে)
.azure/*/.env               # পরিবেশ ভেরিয়েবলসমূহ (গোপন তথ্য থাকতে পারে)
.env                        # স্থানীয় পরিবেশ ফাইল
```

### 4. কনফিগারেশন ডকুমেন্টেশন
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

## 🎯 হ্যান্ডস-অন অনুশীলন

### অনুশীলন ১: মাল্টি-পরিবেশ কনফিগারেশন (১৫ মিনিট)

**লক্ষ্য**: বিভিন্ন সেটিংস সহ তিনটি পরিবেশ তৈরি এবং কনফিগার করা

```bash
# উন্নয়ন পরিবেশ তৈরি করুন
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
- [ ] তিনটি পরিবেশ সফলভাবে তৈরি হয়েছে
- [ ] প্রতিটি পরিবেশের অনন্য কনফিগারেশন আছে
- [ ] ত্রুটি ছাড়াই পরিবেশগুলোর মধ্যে স্যুইচ করতে পারা যায়
- [ ] `azd env list` সকল তিনটি পরিবেশ দেখায়

### অনুশীলন ২: সিক্রেট ব্যবস্থাপনা (১০ মিনিট)

**লক্ষ্য**: সংবেদনশীল ডেটা নিয়ে নিরাপদ কনফিগারেশনের অনুশীলন

```bash
# গোপন সেট করুন (আউটপুটে দেখানো হবে না)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# গোপন নয় এমন কনফিগ সেট করুন
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# পরিবেশ দেখুন (গোপন তথ্য লুকানো থাকবে)
azd env get-values

# গোপন তথ্য সঞ্চিত আছে কি না যাচাই করুন
azd env get DB_PASSWORD  # আসল মান দেখানো উচিত
```

**সফলতার মানদণ্ড:**
- [ ] সিক্রেটগুলো টার্মিনালে প্রদর্শন না করে সংরক্ষিত হয়েছে
- [ ] `azd env get-values` লালাকৃত করে সিক্রেটগুলো দেখায়
- [ ] পৃথক `azd env get <SECRET_NAME>` আসল মান উদ্ধার করে

## পরবর্তী ধাপ

- [আপনার প্রথম প্রকল্প](first-project.md) - অনুশীলনে কনফিগারেশন প্রয়োগ করুন
- [ডেপ্লয়মেন্ট গাইড](../chapter-04-infrastructure/deployment-guide.md) - ডেপ্লয়মেন্টের জন্য কনফিগারেশন ব্যবহার করুন
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - প্রোডাকশনের জন্য প্রস্তুত কনফিগারেশন

## তথ্যসূত্র

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**চ্যাপ্টার ন্যাভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: চ্যাপ্টার 3 - কনফিগারেশন ও প্রমাণীকরণ
- **⬅️ পূর্ববর্তী**: [আপনার প্রথম প্রকল্প](first-project.md)
- **➡️ পরের চ্যাপ্টার**: [চ্যাপ্টার 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **পরবর্তী লেসন**: [আপনার প্রথম প্রকল্প](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->