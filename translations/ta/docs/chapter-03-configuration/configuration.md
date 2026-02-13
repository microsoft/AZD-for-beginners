# கட்டமைப்பு வழிகாட்டி

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [ஆரம்பிகளுக்கான AZD](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 3 - கட்டமைப்பு மற்றும் அங்கீகாரம்
- **⬅️ முன்னையது**: [உங்கள் முதல் திட்டம்](first-project.md)
- **➡️ அடுத்தது**: [பதிவேற்ற வழிகாட்டி](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 4: குறியீடாக உள்ளமைவு](../chapter-04-infrastructure/deployment-guide.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி Azure Developer CLI ஐ சிறந்த வளர்ச்சி மற்றும் பதிப்பேற்ற பணிகளுக்காக கட்டமைப்பதற்கு தேவையான அனைத்து அம்சங்களையும் உட்படுத்துகிறது. நீங்கள் கட்டமைப்பு அடுக்குகள், சுற்றுச்சூழல் மேலாண்மை, அங்கீகார முறைகள் மற்றும் திறமையான மற்றும் பாதுகாப்பான Azure உருவாக்கங்களுக்கு உதவும் மேம்பட்ட கட்டமைப்பு வடிவங்களைப் பற்றி கற்றுக்கொள்வீர்கள்.

## கற்றல் குறிக்கோள்கள்

மரபுச் பாடம் முடிந்தவுடன், நீங்கள்:
- azd கட்டமைப்பு அடுக்குகளை திறமையாக கையாளலாம் மற்றும் அமைப்புகளுக்கு முன்னுரிமை如何 என்பதை புரிந்துகொள்ளலாம்
- உலகளாவிய மற்றும் திட்ட-சார்ந்த அமைப்புகளை திறமையாக அமைக்கலாம்
- வேறுபட்ட கட்டமைப்புகளுடன் பல சுற்றுச்சூழல்களை நிர்வகிக்கலாம்
- பாதுகாப்பான அங்கீகார (authentication) மற்றும் அதிகாரமளிப்பு (authorization) வடிவங்களை செயல்படுத்தலாம்
- சிக்கலான சூழ்நிலைகளுக்கான மேம்பட்ட கட்டமைப்பு மாதிரிகளைப் புரிந்துகொள்ளலாம்

## கற்றல் முடிவுகள்

இந்த பாடத்தினை முடித்தபின், நீங்கள் செய்யக்கூடும்:
- azd ஐ சிறந்த வளர்ச்சி பணிச்சூழல்களுக்கு ஏற்ப கட்டமைக்கலாம்
- பல பதிப்பேற்ற சுற்றுச்சூழல்களை அமைத்து, நிர்வகிக்கலாம்
- பாதுகாப்பான கட்டமைப்பு மேலாண்மை நடைமுறைகளைப் பயன்பாட்டில் கொண்டுவரலாம்
- கட்டமைப்பு தொடர்பான பிரச்சனைகளை தீர்க்கக் கூடியதாக இருக்கும்
- குறிப்பிட்ட நிறுவன தேவைகளுக்கு ஏற்ப azd நடத்தை தனிப்பயன் செய்யலாம்

இந்த விரிவான வழிகாட்டி Azure Developer CLI ஐ சிறந்த வளர்ச்சி மற்றும் பதிப்பேற்ற பணிகளுக்காக கட்டமைப்பதற்கான அனைத்து அம்சங்களையும் உட்படுத்துகிறது.

## கட்டமைப்பு அடுக்குமுறை

azd ஒரு அடுக்குமுறை கொண்ட கட்டமைப்பு அமைப்பைப் பயன்படுத்துகிறது:
1. **Command-line flags** (highest priority)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (lowest priority)

## உலகளாவிய கட்டமைப்பு

### உலகளாவிய முன்னமைவுகளை அமைத்தல்
```bash
# இயல்புநிலை சப்ஸ்கிரிப்ஷனை அமைக்க
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# இயல்புநிலை இடத்தை அமைக்க
azd config set defaults.location "eastus2"

# இயல்புநிலை வளக் குழு பெயரிடும் நடைமுறையை அமைக்க
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# அனைத்து உலகளாவிய கட்டமைப்புகளைக் காண்க
azd config list

# ஒரு கட்டமைப்பை அகற்று
azd config unset defaults.location
```

### பொதுவான உலகளாவிய அமைப்புகள்
```bash
# வளர்ச்சி விருப்பங்கள்
azd config set alpha.enable true                    # அல்பா அம்சங்களை செயல்படுத்தவும்
azd config set telemetry.enabled false             # டெலிமெட்ரியை முடக்கவும்
azd config set output.format json                  # வெளியீட்டு வடிவத்தை அமைக்கவும்

# பாதுகாப்பு அமைப்புகள்
azd config set auth.useAzureCliCredential true     # அங்கீகாரத்திற்கு Azure CLI ஐ பயன்படுத்தவும்
azd config set tls.insecure false                  # TLS சரிபார்ப்பை கட்டாயப்படுத்தவும்

# செயல்திறன் சீரமைப்பு
azd config set provision.parallelism 5             # ஒத்த நேரத்தில் வளங்கள் உருவாக்கம்
azd config set deploy.timeout 30m                  # நிறுவுதல் காலாவதி
```

## 🏗️ திட்ட கட்டமைப்பு

### azure.yaml அமைப்பு
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

### சேவை கட்டமைப்பு விருப்பங்கள்

#### ஹோஸ்ட் வகைகள்
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

#### மொழி-சார்ந்த அமைப்புகள்
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

## 🌟 சுற்றுச்சூழல் மேலாண்மை

### சுற்றுச்சூழல்களை உருவாக்குதல்
```bash
# ஒரு புதிய சூழலை உருவாக்கவும்
azd env new development

# குறிப்பிட்ட இடத்துடன் உருவாக்கவும்
azd env new staging --location "westus2"

# மாதிரையிலிருந்து உருவாக்கவும்
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### சுற்றுச்சூழல் கட்டமைப்பு
Each environment has its own configuration in `.azure/<env-name>/config.json`:

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

### சுற்றுச்சூழல் மாறிகள்
```bash
# சூழல் சார்ந்த மாறிலிகளை அமைக்க
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# சூழல் மாறிலிகளை பார்க்க
azd env get-values

# எதிர்பார்க்கப்படும் வெளியீடு:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# சூழல் மாறியை நீக்கவும்
azd env unset DEBUG

# அகற்றலை சரிபார்க்கவும்
azd env get-values | grep DEBUG
# (எதுவும் திருப்பப்படக் கூடாது)
```

### சுற்றுச்சூழல் மாடல்கள்
Create `.azure/env.template` for consistent environment setup:
```bash
# கட்டாய மாறிலிகள்
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# விண்ணப்ப அமைப்புகள்
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# விருப்பமான அபிவிருத்தி அமைப்புகள்
DEBUG=false
LOG_LEVEL=info
```

## 🔐 அங்கீகார கட்டமைப்பு

### Azure CLI ஒருங்கிணைப்பு
```bash
# Azure CLI அடையாளச் சான்றுகளைப் பயன்படுத்தவும் (இயல்புநிலை)
azd config set auth.useAzureCliCredential true

# குறிப்பிட்ட டெனன்டுடன் உள்நுழையவும்
az login --tenant <tenant-id>

# இயல்புநிலை சப்ஸ்கிரிப்ஷனை அமைக்கவும்
az account set --subscription <subscription-id>
```

### சேவை பிரதிநிதி அங்கீகாரம்
For CI/CD pipelines:
```bash
# சுற்றுச்சூழல் மாறிலிகளை அமைக்கவும்
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# அல்லது நேரடியாக கட்டமைக்கவும்
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### மேனேஜ் செய்யப்பட்ட அடையாளம்
For Azure-hosted environments:
```bash
# நிர்வகிக்கப்பட்ட அடையாள அங்கீகாரத்தை செயல்படுத்தவும்
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ அடிப்படை அமைப்பு

### Bicep அளவுருக்கள்
Configure infrastructure parameters in `infra/main.parameters.json`:
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

### Terraform கட்டமைப்பு
For Terraform projects, configure in `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 பதிவேற்றக் கட்டமைப்பு

### கட்டுமான அமைப்பு
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

### Docker கட்டமைப்பு
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

## 🔧 மேம்பட்ட கட்டமைப்பு

### தனிப்பயன் வள பெயரிடுதல்
```bash
# பெயரிடும் நெறிமுறைகளை அமைக்க
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### பிணைய கட்டமைப்பு
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### மேற்பார்வை கட்டமைப்பு
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

## 🎯 சுற்றுச்சூழல்-சார்ந்த கட்டமைப்புகள்

### வளர்ச்சித் சுற்றுச்சூழல்
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### முன்நிலை (Staging) சுற்றுச்சூழல்
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### உற்பத்தி சுற்றுச்சூழல்
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 கட்டமைப்பு சரிபார்த்தல்

### கட்டமைப்பை சரிபார்க்கவும்
```bash
# கட்டமைப்பின் சின்டாக்ஸை சரிபார்க்க
azd config validate

# சூழல் மாறிலிகளை சோதிக்க
azd env get-values

# அடித்தளத்தைச் சரிபார்க்க
azd provision --dry-run
```

### கட்டமைப்பு ஸ்கிரிப்ட்கள்
Create validation scripts in `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# தேவையான சுற்றுச்சூழல் மாறிகளை சரிபார்க்கவும்
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml இலக்கணத்தை சரிபார்க்கவும்
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 சிறந்த நடைமுறைகள்

### 1. சுற்றுச்சூழல் மாறிகளைப் பயன்படுத்துங்கள்
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. கட்டமைப்பு கோப்புகளை ஒழுங்குபடுத்துங்கள்
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

### 3. பதிப்பு கட்டுப்பாடு தொடர்பான கருதுகோள்கள்
```bash
# .gitignore
.azure/*/config.json         # சுற்றுச்சூழல் கட்டமைப்புகள் (மூலவள அடையாளங்கள் உள்ளன)
.azure/*/.env               # சுற்றுச்சூழல் மாறிகள் (ரகசியங்களை கொண்டிருக்கலாம்)
.env                        # உள்ளூர் சுற்றுச்சூழல் கோப்பு
```

### 4. கட்டமைப்பு ஆவணப்படுத்தல்
Document your configuration in `CONFIG.md`:
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

## 🎯 கைமுறை பயிற்சி

### பயிற்சி 1: பல-சுற்றுச்சூழல் கட்டமைப்பு (15 நிமிடம்)

**நோக்கம்**: விதவிதமான அமைப்புகளுடன் மூன்று சுற்றுச்சூழல்களை உருவாக்கி அமைக்கவும்

```bash
# வளர்ச்சி சூழலை உருவாக்கவும்
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# ஸ்டேஜிங் சூழலை உருவாக்கவும்
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# உற்பத்தி சூழலை உருவாக்கவும்
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ஒவ்வொரு சூழலையும் சரிபார்க்கவும்
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**வெற்றி விதிகள்:**
- [ ] மூன்று சுற்றுச்சூழல்கள் வெற்றிகரமாக உருவாக்கப்பட்டுள்ளன
- [ ] ஒவ்வொரு சூழலுக்கும் தனித்துவமான கட்டமைப்பு உள்ளது
- [ ] தவறுகள் இல்லாமல் சூழல்களுக்கு இடையே மாற்றம் செய்ய முடிகிறது
- [ ] `azd env list` அனைத்து மூன்றையும் காட்டுகிறது

### பயிற்சி 2: ரகசிய மேலாண்மை (10 நிமிடம்)

**நோக்கம்**: நுண்ணறிந்த/ரகசியமான தரவுகளுடன் பாதுகாப்பான கட்டமைப்பை பயிற்சி செய்தல்

```bash
# ரகசியங்களை அமைக்கவும் (வெளியீட்டில் காட்டப்படாது)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# ரகசியமற்ற கட்டமைப்பை அமைக்கவும்
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# சூழலைப் பார்க்கவும் (ரகசியங்கள் மறைக்கப்பட வேண்டும்)
azd env get-values

# ரகசியங்கள் சேமிக்கப்பட்டுள்ளதா என்பதை சரிபார்க்கவும்
azd env get DB_PASSWORD  # உண்மையான மதிப்பை காட்ட வேண்டும்
```

**வெற்றி விதிகள்:**
- [ ] ரகசியங்கள் டெர்மிநலில் காண்பிக்காமல் சேமிக்கப்பட்டுள்ளன
- [ ] `azd env get-values` மறைக்கப்பட்ட ரகசியங்களை காட்டுகிறது
- [ ] தனித்த `azd env get <SECRET_NAME>` உண்மையான மதிப்பைக் கொடுக்கும்

## அடுத்து செய்ய வேண்டியவை

- [உங்கள் முதல் திட்டம்](first-project.md) - கட்டமைப்பை நடைமுறையில் பயன்படுத்துங்கள்
- [பதிவேற்ற வழிகாட்டி](../chapter-04-infrastructure/deployment-guide.md) - பதிவேற்றத்திற்காக கட்டமைப்பைப் பயன்படுத்துங்கள்
- [வளங்களை வழங்குதல்](../chapter-04-infrastructure/provisioning.md) - உற்பத்தி-தயார் கட்டமைப்புகள்

## குறிப்புகள்

- [azd கட்டமைப்பு குறிப்பு](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml ஸ்கீமா](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [சுற்றுச்சூழல் மாறிகள்](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [ஆரம்பிகளுக்கான AZD](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 3 - கட்டமைப்பு மற்றும் அங்கீகாரம்
- **⬅️ முன்னையது**: [உங்கள் முதல் திட்டம்](first-project.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 4: குறியீடாக உள்ளமைவு](../chapter-04-infrastructure/deployment-guide.md)
- **அடுத்த பாடம்**: [உங்கள் முதல் திட்டம்](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிக்கை:
இந்த ஆவணம் செயற்கை நுண்ணறிவு (AI) மொழிபெயர்ப்பு சேவையான Co-op Translator (https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்தாலும், தானாக நடைபெறும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது துல்லியமற்ற விபரங்கள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனிக்கவும். மூல மொழியில் உள்ள அசல் ஆவணத்தை அதிகாரப்பூர்வ மூலமாகக் கருதவும். முக்கியமான தகவல்களுக்கு தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் உருவாகக்கூடிய எந்தவொரு தவறான புரிதலுக்கும் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->