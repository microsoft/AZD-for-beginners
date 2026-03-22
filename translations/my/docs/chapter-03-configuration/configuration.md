# ကွန်ဖိဂျာရှင်း လမ်းညွှန်

**အခန်း လမ်းပြခွဲ:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## နိဒါန်း

ဒီလမ်းညွှန်မှာ Azure Developer CLI (azd) ကို ကောင်းမွန်စွာ ဖွံ့ဖြိုးရေးနှင့် ထုတ်လွှတ်ရေး ဝန်ကြီးပိုင်လုပ်ငန်းစဉ်များအတွက် သတ်မှတ်ပုံ၊ ပတ်ဝန်းကျင်စီမံခန့်ခွဲမှု၊ အတည်ပြုမှု နည်းလမ်းများနှင့် လုံခြုံပြီး ထိရောက်စွာ Azure ကို ထုတ်လွှတ်နိုင်ရန် လက်တွေ့အသုံးချနိယာမများအားလုံးကို ကာဗာပြထားပါတယ်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီသင်ခန်းစာအဆုံးသတ်သောအခါ သင်သည်:
- azd ကွန်ဖိဂျာရှင်း အဆင့်ဆက်ကို ကျွမ်းကျင်စွာ နားလည်ပြီး ဆက်တင်များ၏ ဦးစားထားမှုကို သိရှိထားမည်
- Global နှင့် project-specific ဆက်တင်များကို ထိရောက်စွာ ဖန်တီးပြင်ပေးနိုင်မည်
- မတူညီသည့် ဆက်တင်များရှိသော ဧကာပတ်များစွာကို စီမံနိုင်မည်
- လုံခြုံသော အတည်ပြုခြင်းနှင့် အာဏာပိုင်ထားမှု ပုံစံများကို ဆောင်ရွက်နိုင်မည်
- အဆင့်မြင့် ကွန်ဖိဂျာရှင်း ပုံစံများကို လက်တွေ့အသုံးပြုနိုင်မည်

## သင်ယူပြီးရလဒ်များ

ဒီသင်ခန်းစာကိုပြီးမြောက်လျှင် သင်သည်:
- ဖွံ့ဖြိုးရေးလုပ်ငန်းစဉ်အတွက် azd ကို အကောင်းဆုံး ဖော်ဆောင်နိုင်အောင် ကွန်ဖိဂျာလုပ်ပေးနိုင်မည်
- မတူညီသော ထုတ်လွှတ်ရေး ပတ်ဝန်းကျင်များစီမံနိုင်မည်
- လုံခြုံသော ကွန်ဖိဂျာရှင်း စီမံခန့်ခွဲမှု များကို အကောင်အထည်ဖော်နိုင်မည်
- ကွန်ဖိဂျာရှင်းဆိုင်ရာ ပြဿနာများကို ဖြေရှင်းနိုင်မည်
- အဖွဲ့အစည်းလိုအပ်ချက်များအတွက် azd ကို မှန်ကန်စွာ စိတ်ကြိုက်ပြင်ဆင်နိုင်မည်

ဒီလမ်းညွှန်မှာ Azure Developer CLI ကို ဖွံ့ဖြိုးရေးနှင့် ထုတ်လွှတ်ရေး အလုပ်စဉ်များအတွက် လိုအပ်သော ကွန်ဖိဂျာရှင်းနည်းလမ်းများအားလုံးကို ဖော်ပြထားသည်။

## azd Project အတွင်း AI Agent များကို နားလည်ခြင်း

AI agent များနဲ့ မိတ်ဆက်နေသူနေသူများအတွက် azd โลกထဲမှာ သူတို့ကို ဘယ်လိုထည့်သွင်းစဉ်းစားရမလဲဆိုတာ လွယ်ကူစွာရှင်းပြထားပါတယ်။

### Agent ဆိုတာဘာလဲ?

Agent သည် တောင်းဆိုချက် တစ်ခုခု လက်ခံနိုင်၍ မေးခွန်းများကို ဆင်ခြင်စဉ်းစားပြီး လုပ်ဆောင်ချက်များ ပြုလုပ်တတ်သော ဆော့ဖ်ဝဲ အပိုင်းတစ်ခု ဖြစ်သည်။ အများအားဖြင့် AI မော်ဒယ်ကို ခေါ်ယူခြင်း၊ ဒေတာရှာဖွေခြင်း သို့မဟုတ် အခြားဝန်ဆောင်မှုများကို ခေါ်ယူခြင်းဖြင့် လုပ်ဆောင်တတ်သည်။ azd project အတွင်း မှာ agent သည် သင့် web frontend သို့မဟုတ် API backend နှင့် လိုက်ဖက်သော အခြား **service** တစ်ခုအဖြစ် ရှိသည်။

### Agent များသည် azd Project ဖွဲ့စည်းမှုတွင် ဘယ်လို ထည့်သွင်းသလဲ

azd project သည် အလှည့်အပြောင်းသုံးအလွှာဖြင့် ဖွဲ့စည်းထားသည်။ အဆိုပါအလွှာများမှာ **infrastructure**, **code**, နှင့် **configuration** ဖြစ်သည်။ Agent များကို တစ်ခြား service များလိုပဲ အဆိုပါအလွှာများထဲသို့ ထည့်သွင်းနိုင်သည်။

| Layer | သာမန် အက်ပ်ပလီကေးရှင်းအတွက် လုပ်ဆောင်ချက် | Agent အတွက် လုပ်ဆောင်ချက် |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | 웹 အက်ပ်နှင့် ဒေတာဘေ့စ်ကို ပံ့ပိုးပေးသည် | AI မော်ဒယ် endpoint, search index သို့မဟုတ် agent ကို ဟော့စ်လုပ်ပေးမည့် host ကို ပံ့ပိုးပေးသည် |
| **Code** (`src/`) | သင့် frontend နှင့် API ရောတရာ ကုဒ်များ ပါဝင်သည် | သင့် agent လိုဂစ်နှင့် prompt นิยามများ ပါဝင်သည် |
| **Configuration** (`azure.yaml`) | သင့် services များနှင့် ၎င်းတို့၏ hosting ရည်မှန်းချက်များကို စာရင်းပြုစုသည် | Agent ကို service တစ်ခုအဖြစ် စာရင်းပြုစုပြီး ၎င်း၏ ကုဒ်နှင့် host ကို ပြထားသည် |

### `azure.yaml` ရဲ့ အခန်းကဏ္ဍ

ယခုအချိန်တွင် သင် syntax ကို မှတ်မိထားရန် မလိုပါဘူး။ သဘောတရားအရ `azure.yaml` သည် azd ကို ပြောလိုက်တဲ့ ဖိုင်ဖြစ်သည် - "ဤတွင် ကျွန်ုပ်၏ အက်ပ်ဟာ ဘယ် service များဖြင့် ဖွဲ့စည်းထားပြီး ၎င်းတို့၏ ကုဒ်ကို ဘယ်မှာတွေ့ရမည်ကို ပြထားသည်" ဆိုတာကို ဖော်ပြသည်။

သင့် project တွင် AI agent တစ်ခု ပါဝင်ပါက `azure.yaml` သည် အဲဒီ agent ကို service တစ်ခုအဖြစ် စာရင်းထဲ သွင်းထားမည်ဖြစ်သည်။ azd သည် ထိုစာရင်းအရ သင့် agent အတွက် သင့်တော်သော infrastructure (ဥပမာ Microsoft Foundry Models endpoint သို့မဟုတ် agent ကို ဟော့စ်ပေးမည့် Container App အတိုင်း) ကို ပံ့ပိုးပေးပြီး agent ကုဒ်ကို deploy လုပ်ပေးနိုင်သည် - web app သို့မဟုတ် API အတွက် လုပ်သလိုပဲ။

ဒါကြောင့် မူလကျကျ တစ်ခုခု အသစ်လုံးဝ လေ့လာရန် မလိုဘူး။ azd က web service ကို မည်သို့ စီမံခန့်ခွဲသည်ကို နားလည်ထားလျှင် agent ကို မည်သို့ စီမံခန့်ခွဲသည်ကိုလည်း နားလည်ထားပြီ ဖြစ်ပါတယ်။

## ကွန်ဖိဂျာရှင်း အဆင့်ဆက်

azd သည် အဆင့်ဆက်ထားသော configuration စနစ်ကို အသုံးပြုသည်။
1. **Command-line flags** (အမြင့်ဆုံး ဦးစားပေးချက်)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (အနိမ့်ဆုံး ဦးစားပေးချက်)

## Global Configuration

### Global Defaults သတ်မှတ်ခြင်း
```bash
# ပုံမှန် စာရင်းကို သတ်မှတ်ပါ
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ပုံမှန် တည်နေရာကို သတ်မှတ်ပါ
azd config set defaults.location "eastus2"

# ပုံမှန် အရင်းအမြစ်အုပ်စု အမည်ပေးနည်းကို သတ်မှတ်ပါ
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# ကမ္ဘာလုံးဆိုင်ရာ ပြင်ဆင်ချက်အားလုံးကို ကြည့်ပါ
azd config list

# ပြင်ဆင်ချက်တစ်ခုကို ဖယ်ရှားပါ
azd config unset defaults.location
```

### Common Global Settings
```bash
# ဖွံ့ဖြိုးရေး နှစ်သက်ချက်များ
azd config set alpha.enable true                    # အယ်လ်ဖာ အင်္ဂါရပ်များကို ဖွင့်ပါ
azd config set telemetry.enabled false             # တယ်လီမက်ထရီကို ပိတ်ပါ
azd config set output.format json                  # အထွက်ဖော်မက်ကို သတ်မှတ်ပါ

# လုံခြုံရေး ဆက်တင်များ
azd config set auth.useAzureCliCredential true     # အတည်ပြုရေးအတွက် Azure CLI ကို အသုံးပြုပါ
azd config set tls.insecure false                  # TLS စစ်ဆေးမှုကို တင်းကြပ်စေပါ

# စွမ်းဆောင်ရည် ဆက်ညှိခြင်း
azd config set provision.parallelism 5             # တစ်ပြိုင်တည်း အရင်းအမြစ်များ ဖန်တီးခြင်း
azd config set deploy.timeout 30m                  # တပ်ဆင်ခြင်း အချိန်ကုန်သတ်မှတ်ချက်
```

## 🏗️ Project Configuration

### `azure.yaml` ဖိုင် ပုံစံ
`azure.yaml` ဖိုင်သည် သင့် azd project ၏ မူလစက်ကြွယ် ဖြစ်သည်:

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

### Service Configuration ရွေးချယ်စရာများ

#### Host Types
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

#### Language-Specific Settings
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

## 🌟 ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှု

### Environment များ ဖန်တီးခြင်း
```bash
# ပတ်ဝန်းကျင်အသစ်တစ်ခု ဖန်တီးပါ
azd env new development

# သတ်မှတ်ထားသော တည်နေရာဖြင့် ဖန်တီးပါ
azd env new staging --location "westus2"

# နမူနာမှ ဖန်တီးပါ
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Environment Configuration
ထို environment တစ်ခုချင်းစီတွင် `.azure/<env-name>/config.json` ထဲမှာ ကိုယ့်ပိုင် configuration ရှိပါသည်:

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

### Environment Variables
```bash
# ပတ်ဝန်းကျင်အလိုက် သတ်မှတ်ထားသည့် ပြောင်းလဲနိုင်သော တန်ဖိုးများကို သတ်မှတ်ပါ
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# ပတ်ဝန်းကျင် ပြောင်းလဲနိုင်သော တန်ဖိုးများကို ကြည့်ရှုပါ
azd env get-values

# မျှော်မှန်းထားသည့် ထွက်ရလဒ်:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# ပတ်ဝန်းကျင် ပြောင်းလဲနိုင်သော တန်ဖိုးကို ဖယ်ရှားပါ
azd env unset DEBUG

# ဖယ်ရှားမှုကို အတည်ပြုပါ
azd env get-values | grep DEBUG
# (ဘာမှ မပြန်လာပါ)
```

### Environment Templates
တူညီသော environment စက်ရုံတည်ဆောက်ရေးအတွက် `.azure/env.template` ဖိုင်ကို ဖန်တီးပါ:
```bash
# လိုအပ်သော ပြောင်းလဲသော တန်ဖိုးများ
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# အက်ပလီကေးရှင်း ဆက်တင်များ
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ရွေးချယ်နိုင်သည့် ဖွံ့ဖြိုးရေး ဆက်တင်များ
DEBUG=false
LOG_LEVEL=info
```

## 🔐 အတည်ပြုမှု (Authentication) ဖော်ပြချက်

### Azure CLI ပေါင်းသင်းမှု
```bash
# Azure CLI အတွက် အကောင့်အချက်အလက်များကို အသုံးပြုပါ (ပုံမှန်)
azd config set auth.useAzureCliCredential true

# သတ်မှတ်ထားသော tenant ဖြင့် ဝင်ပါ
az login --tenant <tenant-id>

# ပုံမှန် subscription ကို သတ်မှတ်ပါ
az account set --subscription <subscription-id>
```

### Service Principal အတည်ပြုမှု
CI/CD pipeline များအတွက်:
```bash
# ပတ်ဝန်းကျင်တန်ဖိုးများကို သတ်မှတ်ပါ
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# သို့မဟုတ် တိုက်ရိုက် ဖွဲ့စည်းပါ
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Azure မှ ဟော့စ်ထားသော environment များအတွက်:
```bash
# Managed Identity အတည်ပြုမှုကို ဖွင့်ပါ
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ အခြေခံအင်ဖရာ ဖော်ပြချက်

### Bicep Parameters
အင်ဖရာ ပမာဏများကို `infra/main.parameters.json` ထဲ၌ သတ်မှတ်ပါ:
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

### Terraform Configuration
Terraform project များအတွက် `infra/terraform.tfvars` တွင် ဖော်ပြပါ:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ထုတ်လွှတ်မှု (Deployment) ဆက်တင်များ

### Build Configuration
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

### Docker Configuration
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

## 🔧 အဆင့်မြင့် ကွန်ဖိဂျာရှင်း

### Custom Resource Naming
```bash
# နာမည်ပေး စည်းကမ်းများ သတ်မှတ်ပါ
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Network Configuration
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Monitoring Configuration
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

## 🎯 ပတ်ဝန်းကျင် အလိုက် အထူး ဆက်တင်များ

### Development Environment
```bash
# .azure/ဖွံ့ဖြိုးရေး/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Staging Environment
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Production Environment
```bash
# .azure/ထုတ်လုပ်မှု/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ကွန်ဖိဂျာရှင်း စစ်ဆေးခြင်း

### Validate Configuration
```bash
# ဖွဲ့စည်းမှု ဖိုင်၏ သဒ္ဒါကို စစ်ဆေးပါ
azd config validate

# ပတ်ဝန်းကျင် ကိရိယာများ (environment variables) ကို စမ်းသပ်ပါ
azd env get-values

# အခြေခံအဆောက်အဦ (infrastructure) ကို အတည်ပြုပါ
azd provision --dry-run
```

### Configuration Scripts
`scripts/` ထဲတွင် validation script များ ဖန်တီးပါ:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# လိုအပ်သော ပတ်ဝန်းကျင် သတ်မှတ်တန်ဖိုးများကို စစ်ဆေးပါ
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml ၏ သဒ္ဒါကို စစ်ဆေးပါ
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 အကောင်းဆုံးလေ့ကျင့်ချက်များ

### 1. Environment Variables ကို အသုံးပြုပါ
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Configuration ဖိုင်များကို စုပုံအုပ်ချုပ်ပါ
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

### 3. Version Control စဉ်းစားချက်များ
```bash
# .gitignore
.azure/*/config.json         # ပတ်ဝန်းကျင် ဖိုင်များ (အရင်းအမြစ် ID များ ပါဝင်နိုင်သည်)
.azure/*/.env               # ပတ်ဝန်းကျင် ပြောင်းလဲနိုင်သော တန်ဖိုးများ (လျှို့ဝှက်ချက်များ ပါရှိနိုင်သည်)
.env                        # ဒေသခံ ပတ်ဝန်းကျင် ဖိုင်
```

### 4. Configuration များကို မှတ်တမ်းတင်ထားပါ
သင့် configuration ကို `CONFIG.md` မှာ စာရွက် တစ်ခုအဖြစ် မှတ်တမ်းတင်ထားပါ:
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

## 🎯 လက်တွေ့ လေ့ကျင့်ခန်းများ

### လေ့ကျင့်ခန်း 1: မျိုးစုံ Environment Configuration (15 မိနစ်)

**ရည်ရွယ်ချက်**: မတူညီသည့် ဆက်တင်များဖြင့် environment သုံးခု ဖန်တီးပြီး ချိန်ညှိပါ

```bash
# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင် တည်ဆောက်ပါ
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# စမ်းသပ်ရန် ပတ်ဝန်းကျင် တည်ဆောက်ပါ
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# ထုတ်လုပ်ရေး ပတ်ဝန်းကျင် တည်ဆောက်ပါ
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ပတ်ဝန်းကျင်တိုင်းကို စစ်ဆေးပါ
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**အောင်မြင်မှု များအတွက် မီတာ**

- [ ] environment သုံးခုကို အောင်မြင်စွာ ဖန်တီးထားပါ
- [ ] environment တိုင်းသည် သီးခြား ဆက်တင်ရှိသည်
- [ ] environment များအကြား အပြောင်းလုပ်ရာတွင် အမှားမဖြစ်စေ
- [ ] `azd env list` သည် environment သုံးခုအားလုံးကို ပြပါ

### လေ့ကျင့်ခန်း 2: ဆိုးရွားမြင်သာသော ဒေတာများ စီမံခြင်း (10 မိနစ်)

**ရည်ရွယ်ချက်**: သတင်းအချက်အလက်နှင့် ဆိုးရွားသော ဒေတာများကို လုံခြုံစွာ စီမံရန် လေ့ကျင့်ပါ

```bash
# လျှို့ဝှက်ချက်များ သတ်မှတ်ပါ (ထွက်ရလာမှုတွင် မပြပါ)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# လျှို့ဝှက်မဟုတ်သော ဆက်တင်များ သတ်မှတ်ပါ
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ပတ်ဝန်းကျင်ကို ကြည့်ပါ (လျှို့ဝှက်ချက်များကို ဖျက်ပယ်ထားရမည်)
azd env get-values

# လျှို့ဝှက်ချက်များ သိမ်းဆည်းထားကြောင်း အတည်ပြုပါ
azd env get DB_PASSWORD  # တကယ့်တန်ဖိုးကို ပြသသင့်သည်
```

**အောင်မြင်မှု များအတွက် မီတာ**

- [ ] Secrets များကို terminal တွင် ပြသခြင်းမရှိစေဘဲ သိမ်းဆည်းထားနိုင်ပါ
- [ ] `azd env get-values` သည် ရုပ်ပုံမှန်ထားသည့် secrets များကို ဖျော့ဖျော့ပြပါ
- [ ] တစ်ခုချင်း `azd env get <SECRET_NAME>` သည် အမှန်တန်ဖိုးကို ရယူနိုင်စေပါ

## နောက်ထပ် လုပ်ဆောင်ရန်များ

- [Your First Project](first-project.md) - ကျင့်သုံးဖို့ configuration ကို အသုံးချပါ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ထုတ်လွှတ်ရေးအတွက် configuration ကို အသုံးပြုပါ
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - ထုတ်လုပ်မှု အသင့် configuration များ

## ေရးရာအရင်းအမြစ်များ

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**အခန်း လမ်းပြခွဲ:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဒီစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားပေမယ့် အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါ။ မူလစာတမ်းကို မူရင်း ဘာသာစကားဖြင့်သာ ထိရောက်သော အရင်းအမြစ်အဖြစ် ယူဆသင့်သည်။ အရေးပါသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် ဘာသာပြန်သူတစ်ဦး၏ ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် နားမလည်မှုများ သို့မဟုတ် အဓိပ္ပာယ်မှားယူမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->