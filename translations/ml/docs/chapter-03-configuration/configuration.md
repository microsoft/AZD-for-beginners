# ക്രമീകരണ ഗൈഡ്

**അദ്ധ്യായ നാവിഗേഷൻ:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## പരിചയം

ഈ സമഗ്ര ഗൈഡ് Azure Developer CLI യെ (azd) മികച്ച ഡെവലപ്പ്മെന്റും ഡിപ്ലോയ്‌മെന്റും പ്രവൃത്തികളுக்கும் അനുയോജ്യമായി ക്രമീകരിക്കുന്നതിനെക്കുറിച്ച് എല്ലാ аспектുകളും ഉൾക്കൊള്ളുന്നു. നിങ്ങൾക്ക് ക്രമീകരണ തലക്രമം, പരിസ്ഥിതി കൈകാര്യം ചെയൽ, പ്രാമാണീകരണമാർഗങ്ങൾ, സുരക്ഷിതവും കാര്യക്ഷമവുമായ Azure ഡിപ്ലോയ്‌മെന്റുകൾ സാധ്യമാക്കുന്ന ഉയർന്ന നിലക്കുള്ള ക്രമീകരണ മാതൃകകൾ എന്നിവയെക്കുറിച്ച് പഠിക്കാൻ സാധിക്കും.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ പാഠം അവസാനിയ്ക്കുമ്പോൾ, നിങ്ങൾ:
- azd ക്രമീകരണ തലക്രമം നന്നായി കൈകാര്യം ചെയ്യാനും സെറ്റിംഗുകൾ എന്ത順ധിക്കാണ് മുൻഗണന നൽകപ്പെടുന്നത് എന്ന് മനസിലാക്കാനും
- ആഗോളവും പ്രോജക്റ്റ്-നിർദ്ദിഷ്ടവും ആയ സെറ്റിംഗുകൾ ഫലപ്രദമായി ക്രമീകരിക്കാനും
- വ്യത്യസ്ത ക്രമീകരണങ്ങളുള്ള നിരവധി പരിസ്ഥിതികളിൽ മാനേജ് ചെയ്യാനയും
- സുരക്ഷിതമായ പ്രാമാണികതയും അനുമതിയുമുള്ള മാതൃകകൾ നടപ്പിൽ വരുത്താനുമ
- സങ്കീര്‍ണ്ണ السينാരിയോക്കൾക്കായുള്ള ഉയർന്ന നില ക്രമീകരണ മാതൃകകൾ മനസ്സിലാക്കാനുമാകും

## പഠന ഫലങ്ങൾ

ഈ പാഠം പൂർത്തിയാക്കിയശേഷം, നിങ്ങൾ കഴിയും:
- വികസന പ്രവൃത്തിവൈഭവങ്ങൾക്ക് ഉചിതമായ വിധത്തിൽ azd ക്രമീകരിക്കുക
- বহু ഡിപ്ലോയ്മെന്റ് പരിസ്ഥിതികൾ സജ്ജമാക്കി നിയന്ത്രിക്കുക
- സുരക്ഷിത ക്രമീകരണ മാനേജുമെന്റ് പ്രാക്ടിസുകൾ നടപ്പിലാക്കുക
- ക്രമീകരണ-സംബന്ധിയായ പ്രശ്‌നങ്ങൾ ട്രബിൾഷൂട്ട് ചെയ്യുക
- പ്രത്യേക സംഘടനാതmwശ്യങ്ങൾക്ക് അനുയോജ്യമായി azd പെരുമാറ്റം ഇഷ്ടാനുസൃതമാക്കുക

ഈ സമഗ്ര ഗൈഡ് Azure Developer CLI ഫലപ്രദമായ ഡെവലപ്പ്മെന്റ് மற்றும் ഡിപ്ലോയ്‌മെന്റ് പ്രവർത്തനങ്ങൾക്കായി ക്രമീകരിക്കുന്നതിന്റെ എല്ലാ ഘടകങ്ങളും ഉൾക്കൊള്ളുന്നു.

## ക്രമീകരണ തലക്രമം

azd ഒരു തലക്രമ സിസ്റ്റം ഉപയോഗിക്കുന്നു:
1. **Command-line flags** (ഏറ്റവും ഉയർന്ന പ്രാധാന്യം)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (കുറഞ്ഞ പ്രാധാന്യം)

## ആഗോള ക്രമീകരണം

### ആഗോള ഡിഫോൾട്ടുകൾ ക്രമീകരിക്കൽ
```bash
# ഡിഫോൾട്ട് സബ്സ്ക്രിപ്ഷൻ സജ്ജമാക്കുക
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ഡിഫോൾട്ട് ലൊക്കേഷൻ സജ്ജമാക്കുക
azd config set defaults.location "eastus2"

# ഡിഫോൾട്ട് റിസോഴ്‌സ് ഗ്രൂപ്പ് നാമകരണം സജ്ജമാക്കുക
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# എല്ലാ ആഗോള ക്രമീകരണങ്ങളും കാണുക
azd config list

# ഒരു ക്രമീകരണം നീക്കം ചെയ്യുക
azd config unset defaults.location
```

### സാധാരണ ആഗോള ക്രമീകരണങ്ങൾ
```bash
# വികസന മുൻഗണനകൾ
azd config set alpha.enable true                    # ആൽഫാ സവിശേഷതകൾ സജീവമാക്കുക
azd config set telemetry.enabled false             # ടെലിമെട്രി നിഷ്ക്രിയമാക്കുക
azd config set output.format json                  # ഔട്ട്പുട്ട് ഫോർമാറ്റ് ക്രമീകരിക്കുക

# സുരക്ഷാ ക്രമീകരണങ്ങൾ
azd config set auth.useAzureCliCredential true     # പ്രാമാണീകരണത്തിന് Azure CLI ഉപയോഗിക്കുക
azd config set tls.insecure false                  # TLS പരിശോധന നിർബന്ധമാക്കുക

# പ്രകടന മെച്ചപ്പെടുത്തൽ
azd config set provision.parallelism 5             # സമാന്തര റിസോഴ്‌സ് സൃഷ്ടി
azd config set deploy.timeout 30m                  # ഡിപ്ലോയ്‌മെന്റ് സമയാവധി
```

## 🏗️ പ്രോജക്റ്റ് ക്രമീകരണം

### azure.yaml ഘടന
`azure.yaml` ഫയൽ നിങ്ങളുടെ azd പ്രോജക്റ്റിന്റെ ഹൃദയമാണ്:

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

### സർവീസ് ക്രമീകരണ ഓപ്ഷനുകൾ

#### ഹോസ്റ്റ് തരങ്ങൾ
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

#### ഭാഷാ-നിർദ്ദിഷ്ട ക്രമീകരണങ്ങൾ
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

## 🌟 പരിസ്ഥിതി മാനേജുമെന്റ്

### പരിസ്ഥിതികൾ സൃഷ്ടിക്കൽ
```bash
# ഒരു പുതിയ പരിസ്ഥിതി സൃഷ്ടിക്കുക
azd env new development

# നിശ്ചിത സ്ഥലത്തോടുകൂടി സൃഷ്ടിക്കുക
azd env new staging --location "westus2"

# ടെംപ്ലേറ്റിൽ നിന്ന് സൃഷ്ടിക്കുക
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### പരിസ്ഥിതി ക്രമീകരണം
ഓരോ പരിസ്ഥിതിയ്ക്കുംതന്നെ സ്വന്തമായ ക്രമീകരണം `.azure/<env-name>/config.json` ൽ ഉണ്ട്:

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

### പരിസ്ഥിതി വേരിയബിളുകൾ
```bash
# പരിസ്ഥിതി നിർദ്ദിഷ്ട വേരിയബിളുകൾ സജ്ജമാക്കുക
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# പരിസ്ഥിതി വേരിയബിളുകൾ കാണുക
azd env get-values

# പ്രതീക്ഷിച്ച ഔട്ട്‌പുട്ട്:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# പരിസ്ഥിതി വേരിയബിള്‍ നീക്കം ചെയ്യുക
azd env unset DEBUG

# നീക്കം സ്ഥിരീകരിക്കുക
azd env get-values | grep DEBUG
# (ഏതും തിരികെ ലഭിക്കരുത്)
```

### പരിസ്ഥിതി ടെംപ്ലേറ്റുകൾ
സുസ്ഥിരമായ പരിസ്ഥിതി സെറ്റപ്പിന് `.azure/env.template` സൃഷ്ടിക്കുക:
```bash
# ആവശ്യമായ വേരിയബിളുകൾ
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# ആപ്ലിക്കേഷൻ ക്രമീകരണങ്ങൾ
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ഐച്ഛിക വികസന ക്രമീകരണങ്ങൾ
DEBUG=false
LOG_LEVEL=info
```

## 🔐 പ്രാമാണീകരണ ക്രമീകരണം

### Azure CLI സംയോജനം
```bash
# Azure CLI ക്രെഡൻഷ്യലുകൾ ഉപയോഗിക്കുക (ഡീഫോൾട്ട്)
azd config set auth.useAzureCliCredential true

# നിശ്ചിത ടെന്നന്റുമായി ലോഗിൻ ചെയ്യുക
az login --tenant <tenant-id>

# ഡീഫോൾട്ട് സബ്സ്ക്രിപ്ഷൻ നിശ്ചയിക്കുക
az account set --subscription <subscription-id>
```

### Service Principal പ്രാമാണീകരണം
CI/CD പൈപ്പ്‌ലൈൻകൾക്കായി:
```bash
# പരിസ്ഥിതി വ്യരിയബിളുകൾ ക്രമീകരിക്കുക
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# അല്ലെങ്കിൽ നേരിട്ട് ക്രമീകരിക്കുക
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Azure-ആധാരിത(hosted) പരിസ്ഥിതികളിൽ:
```bash
# മാനേജ്ഡ് ഐഡന്റിറ്റി പ്രാമാണീകരണം സജീവമാക്കുക
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ഇൻഫ്രാസ്റ്റ്രക്ചർ ക്രമീകരണം

### Bicep പാരാമീറ്ററുകൾ
ഇൻഫ്രാമൊട് പാരാമീറ്ററുകൾ `infra/main.parameters.json` ൽ ക്രമീകരിക്കുക:
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

### Terraform ക്രമീകരണം
Terraform പ്രോജക്റ്റുകൾക്കായി, `infra/terraform.tfvars` ൽ ക്രമീകരിക്കുക:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ഡിപ്ലോയ്മെന്റ് ക്രമീകരണം

### ബിൽഡ് ക്രമീകരണം
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

### Docker ക്രമീകരണം
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
ഉദാഹരണ `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 ഉയർന്ന ക്രമീകരണങ്ങൾ

### കസ്റ്റം റിസോഴ്സ് നാമകരണം
```bash
# നാമകരണ നിബന്ധനകൾ സജ്ജീകരിക്കുക
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### നെറ്റ്‌വർക്ക് ക്രമീകരണം
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### മോണിറ്ററിംഗ് ക്രമീകരണം
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

## 🎯 പരിസ്ഥിതി-നിർദ്ദിഷ്ട ക്രമീകരണങ്ങൾ

### ഡെവലപ്‌മെന്റ് പരിസ്ഥിതി
```bash
# .azure/വികസനം/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### സ്റ്റേജിംഗ് പരിസ്ഥിതി
```bash
# .azure/സ്റ്റേജിംഗ്/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### പ്രൊഡക്ഷൻ പരിസ്ഥിതി
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ക്രമീകരണ പരിശോധന

### ക്രമീകരണ പരിശോധന
```bash
# കോൺഫിഗറേഷൻ സിന്റാക്സ് പരിശോധിക്കുക
azd config validate

# പരിസ്ഥിതി വേരിയബിളുകൾ പരീക്ഷിക്കുക
azd env get-values

# ഇൻഫ്രാസ്ട്രക്ചർ സാധൂകരിക്കുക
azd provision --dry-run
```

### ക്രമീകരണ സ്ക്രിപ്റ്റുകൾ
വാലിഡേഷൻ സ്ക്രിപറ്റുകൾ `scripts/` ൽ സൃഷ്ടിക്കുക:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ആവശ്യമായ പരിസ്ഥിതി വേരിയബിളുകൾ പരിശോധിക്കുക
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml സിന്റാക്സ് സാധുവാണോ എന്ന് പരിശോധിക്കുക
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 മികച്ച രീതികൾ

### 1. പരിസ്ഥിതി വേരിയബിളുകൾ ഉപയോഗിക്കുക
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ക്രമീകരണ ഫയലുകൾ ഉറവിടവത്കരണം
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

### 3. വേർഷൻ കൺട്രോൾ പരിഗണനകൾ
```bash
# .gitignore
.azure/*/config.json         # പരിസ്ഥിതി ക്രമീകരണങ്ങൾ (റിസോഴ്‌സ് ഐഡികൾ ഉൾക്കൊള്ളുന്നു)
.azure/*/.env               # പരിസ്ഥിതി വേരിയബിളുകൾ (രഹസ്യങ്ങൾ അടങ്ങിയിരിക്കാം)
.env                        # പ്രാദേശിക പരിസ്ഥിതി ഫയൽ
```

### 4. ക്രമീകരണ ഡോക്യുമെന്റേഷൻ
നിങ്ങളുടെ ക്രമീകരണം `CONFIG.md` ൽ രേഖപ്പെടുത്തുക:
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

## 🎯 പ്രായോഗിക അഭ്യാസങ്ങൾ

### അഭ്യാസം 1: ബഹു-പരിസ്ഥിതി ക്രമീകരണം (15 മിനിറ്റ്)

**ലക്ഷ്യം**: വ്യത്യസ്ത സെറ്റിംഗ്‌സുകളിലൂടെ മൂന്ന് പരിസ്ഥിതികൾ സൃഷ്ടിക്കുകയും ക്രമീകരിക്കുകയും ചെയ്യുക

```bash
# ഡെവലപ്പ്മെന്റ് പരിസ്ഥിതി സൃഷ്ടിക്കുക
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# സ്റ്റേജിംഗ് പരിസ്ഥിതി സൃഷ്ടിക്കുക
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# പ്രൊഡക്ഷൻ പരിസ്ഥിതി സൃഷ്ടിക്കുക
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ഓരോ പരിസ്ഥിതിയും പരിശോധിക്കുക
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] മൂന്ന് പരിസ്ഥിതികൾ വിജയകരമായി സൃഷ്ടിച്ചു
- [ ] ഓരോ പരിസ്ഥിതിക്കും വ്യത്യസ്ത ക്രമീകരണമുണ്ട്
- [ ] പിശകുകൾ കൂടാതെ പരിസ്ഥിതികൾ തമ്മിൽ മാറാൻ കഴിയും
- [ ] `azd env list` മൂന്ന് പരിസ്ഥിതികളും കാണിക്കുന്നു

### അഭ്യാസം 2: രഹസ്യ മാനേജുമെന്റ് (10 മിനിട്ട്)

**ലക്ഷ്യം**: সংവേദനশീല ഡാറ്റയോടെയുള്ള സുരക്ഷിത ക്രമീകരണം പ്രായോഗികമാക്കുക

```bash
# രഹസ്യങ്ങൾ സജ്ജീകരിക്കുക (ഔട്ട്പുട്ടിൽ പ്രദർശിപ്പിക്കില്ല)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# രഹസ്യമല്ലാത്ത കോൺഫിഗ് സജ്ജീകരിക്കുക
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# പരിസ്ഥിതി കാണുക (രഹസ്യങ്ങൾ മറച്ചിരിക്കണം)
azd env get-values

# രഹസ്യങ്ങൾ സംഭരിച്ചിട്ടുണ്ടെന്ന് സ്ഥിരീകരിക്കുക
azd env get DB_PASSWORD  # യഥാർത്ഥ മൂല്യം കാണിക്കണം
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] സീക്രെറ്റുകൾ ടെർമിനലിൽ പ്രദർശിപ്പിക്കാതെ സംഭരിക്കുന്നു
- [ ] `azd env get-values` റെഡാക്ടുചെയ്തിരിക്കുന്ന സീക്രെറ്റുകൾ കാണിക്കുന്നു
- [ ] വ്യക്തിഗത `azd env get <SECRET_NAME>` യഥാർത്ഥ മൂല്യം വീണ്ടെടുക്കുന്നു

## അടുത്ത ഘട്ടങ്ങൾ

- [Your First Project](first-project.md) - പ്രായോഗികമായി ക്രമീകരണം പ്രയോഗിക്കുക
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ഡിപ്ലോയ്മെന്റിന് ക്രമീകരണം ഉപയോഗിക്കുക
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - പ്രൊഡക്ഷൻ-സജ്ജമായ ക്രമീകരണങ്ങൾ

## റഫറൻസുകൾ

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**അദ്ധ്യായ നാവിഗേഷൻ:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
വിമുക്തി അറിയിപ്പ്:
ഈ രേഖ AI വിവർത്തന സേവനം Co-op Translator (https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനമാക്കിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്ക് പരിശ്രമിച്ചെങ്കിലും ഓട്ടോമേറ്റഡ് വിവർത്തനങ്ങളിൽ പിഴവുകൾ അല്ലെങ്കിൽ അസാധുതകൾ ഉണ്ടാകുമെന്ന് ദയവായി ശ്രദ്ധിക്കുക. ഈ രേഖയുടെ സ്വദേശീഭാഷയിലെ മൂല പതിപ്പാണ് പ്രാമാണിക സ്രോതസ്സായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്കായി പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം നിർദേശിക്കുന്നു. ഈ വിവർത്തനം ഉപയോഗിച്ചതിൽ നിന്നുണ്ടാകുന്ന ഏതൊരു തെറ്റിദ്ധാരണയ്ക്കും വ്യാഖ്യാനക്കേടും我们 (we) ഞങ്ങൾക്ക് ഉത്തരവാദിത്വം ഉണ്ടാകില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->