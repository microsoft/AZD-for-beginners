# கட்டமைப்பு வழிகாட்டி

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [ஆரம்பத்திற்கான AZD](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 3 - கட்டமைப்பு மற்றும் அங்கீகாரம்
- **⬅️ முந்தையது**: [உங்கள் முதல் திட்டம்](first-project.md)
- **➡️ அடுத்தது**: [பயன்படுத்தும் வழிகாட்டி](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 4: குறியீடாக உள்ளமைப்பு](../chapter-04-infrastructure/deployment-guide.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி Azure Developer CLI ஐ மிகச் சிறந்த வளர்ச்சி மற்றும் விண்ணப்ப விநியோக வேலைநடத்தல்களுக்கு ஏற்ப அமைக்குவதின் அனைத்து அம்சங்களையும் உள்ளடக்கியது. கட்டமைப்பு வரிசை, சுற்றுச்சூழல் மேலாண்மை, அங்கீகாரம் முறைகள், மற்றும் பாதுகாப்பான மற்றும் செயல்திறன் வாய்ந்த Azure விநியோகங்களை ஏற்படுத்த உதவும் மேம்பட்ட கட்டமைப்பு நடைமுறைகள் பற்றிப் படிப்பீர்கள்.

## கற்றல் இலக்குகள்

இந்த பாடத்தை முடித்தவுடன், நீங்கள்:
- azd கட்டமைப்பு அடுக்குமுறையை நன்றாக விளங்கி அமைப்புகள் எவ்வாறு முன்னுரிமைப்படுத்தப்படுகின்றன என்பதை புரிந்து கொள்வீர்கள்
- உலகளாவிய மற்றும் திட்ட-சார்ந்த அமைப்புகளை திறம்பட அமைப்பீர்கள்
- பல்வேறு கட்டமைப்புகளுடன் பன்முக சுற்றுச்சூழல்களை நிர்வகிப்பீர்கள்
- பாதுகாப்பான அங்கீகாரம் மற்றும் அங்கீகரிப்பு படிமுறைகளை நடைமுறைப்படுத்துவீர்கள்
- சிக்கலான சூழ்நிலைகளுக்கான மேம்பட்ட கட்டமைப்பு வடிவங்களை புரிந்துகொள்வீர்கள்

## கற்றல் முடிவுகள்

இந்த பாடத்தை முடித்தவுடன், நீங்கள் சாத்தியமாவதாக:
- azd ஐ சிறந்த வளர்ச்சி பணிக்குழுவுக்காக அமைத்தல்
- பலவிதமான விநியோக சுற்றுச்சூழல்களை அமைத்து நிர்வகித்தல்
- பாதுகாப்பான கட்டமைப்பு மேலாண்மைக் நடைமுறைகளை நடைமுறைப்படுத்துதல்
- கட்டமைப்பு தொடர்பான சிக்கல்களை பிழை நீக்குதல்
- குறிப்பிட்ட நிறுவனத் தேவைகளுக்கு ஏற்ப azd நடத்தை தனிப்பயனாக்குதல்

இந்த விரிவான வழிகாட்டி Azure Developer CLI ஐ மிகச் சிறந்த வளர்ச்சி மற்றும் விண்ணப்ப விநியோக வேலைநடத்தல்களுக்கு ஏற்ப அமைக்குவதின் அனைத்து அம்சங்களையும் உள்ளடக்கியது.

## azd திட்டத்தில் AI முகவர்கள் பற்றி புரிதல்

நீங்கள் AI முகவர்கள் பற்றி புதியவராக இருந்தால், azd உலகில் அவற்றைப் பற்றித் தவறாமல் நினைத்துக் கொள்ள ஒரு எளிய வழி இதோ.

### முகவர் என்றால் என்ன?

ஒரு முகவர் என்பது கோரிக்கையை ஏற்றுக்கொண்டு அதை பற்றி யோசித்து செயல்களை மேற்கொள்ளும் மென்பொருள் துண்டு—அதிகமாக ஒரு AI மாதிரியை அழைத்தல், தரவுகளைத் தேடுதல் அல்லது பிற சேவைகளை அழைத்தல் போன்றவை. ஒரு azd திட்டத்தில், ஒரு முகவர் உங்கள் வலை முன்னணி அல்லது API பின்புறம் உடன் ஒரு மேலும் ஒரு **சேவை** ஆகும்.

### முகவர்கள் azd திட்ட கட்டமைப்பில் எப்படி பொருந்துகின்றார்கள்

ஒரு azd திட்டம் மூன்று அடுக்குகளால் உருவாகிறது: **infrastructure**, **code**, மற்றும் **configuration**. முகவர்கள் மற்ற எந்த சேவையும் போலவே இந்த அடுக்குகளில் இணைகின்றன:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | ஒரு வலை செயலியையும் தரவுத்தளத்தையும் வழங்குகிறது | ஒரு AI மாதிரி endpoint, தேடல் குறியீடு, அல்லது முகவர் ஹோஸ்ட் ஐ வழங்குகிறது |
| **Code** (`src/`) | உங்கள் முன்னணி மற்றும் API மூலக் குறியீட்டை கொண்டுள்ளது | உங்கள் முகவர் தரார்க்கம் மற்றும் prompt வரையறைகளை கொண்டுள்ளது |
| **Configuration** (`azure.yaml`) | உங்கள் சேவைகள் மற்றும் அவற்றின் ஹோஸ்டிங் இலக்குகளை பட்டியலிடுகிறது | உங்கள் முகவераை ஒரு சேவையாக பட்டியலிட்டு அதன் குறியீடு மற்றும் ஹோஸ்டை குறிக்கிறது |

### `azure.yaml` இன் பங்கு

உங்களுக்கு இப்போது இலக்கணத்தை நினைவில் வைத்திருக்க தேவையில்லை. கருத்துப்பூர்வமாக, `azure.yaml` என்பது azd ஐ நீங்கள் சொல்லும் கோப்பு: "இவை என் பயன்பாட்டை உருவாக்கும் சேவைகள், மற்றும் இவை எங்கே அவற்றின் குறியீட்டை காணலாம்." என்று.

உங்கள் திட்டத்தில் AI முகவர் இருந்தால், `azure.yaml` அந்த முகவераை சேவையாக பட்டியலிடும். பின்னர் azd தேவையான உள்கட்டமைப்பை (உதாரணமாக Microsoft Foundry Models endpoint அல்லது முகவரை ஹோஸ்ட் செய்ய ஒரு Container App) வழங்கும் மற்றும் உங்கள் முகவர் குறியீட்டை வெளியிடும்—அது ஒரு வலை பயன்பாடு அல்லது API க்கு செய்வதைப் போலவே.

இதனால் அடிப்படையில் புதியதாகக் கற்றுக் கொள்ள வேண்டிய ஒன்றில்லை. azd ஒரு வலை சேவையை எப்படி நிர்வகிக்கின்றது என்று நீங்கள் புரிந்திருந்தால், அது ஒரு முகவரையும் எப்படி நிர்வகிக்கிறது என்பதை நீங்கள் ஏற்கனவே புரிந்துகொண்டுள்ளீர்கள்.

## கட்டமைப்பு அடுக்குமுறை

azd ஒரு அடுக்கு கட்டமைப்பு அமைப்பினை பயன்படுத்துகிறது:
1. **கமாண்ட்-லைன் கொடிகள்** (மிக உயர்ந்த முன்னுரிமை)
2. **சூழல் மாறிகள்**
3. **உள்ளூர் திட்ட கட்டமைப்பு** (`.azd/config.json`)
4. **உலகளாவிய பயனர் கட்டமைப்பு** (`~/.azd/config.json`)
5. **இயல்புநிலை மதிப்புகள்** (குறைந்த முன்னுரிமை)

## உலகளாவிய கட்டமைப்பு

### உலகளாவிய முன்னிருப்புகளை அமைத்தல்
```bash
# இயல்புநிலை சந்தாவை அமைக்க
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# இயல்புநிலை இடத்தை அமைக்க
azd config set defaults.location "eastus2"

# இயல்புநிலை வளக் குழு பெயரிடல் ஒழுங்கை அமைக்க
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# அனைத்து உலகளாவிய கட்டமைப்புகளைக் காண்க
azd config list

# ஒரு கட்டமைப்பை நீக்கு
azd config unset defaults.location
```

### பொதுவான உலகளாவிய அமைப்புகள்
```bash
# வளர்ச்சி விருப்பங்கள்
azd config set alpha.enable true                    # ஆல்பா அம்சங்களை செயல்படுத்த
azd config set telemetry.enabled false             # டெலிமெட்ரியை முடக்கு
azd config set output.format json                  # வெளியீட்டு வடிவத்தை அமைக்க

# பாதுகாப்பு அமைப்புகள்
azd config set auth.useAzureCliCredential true     # அங்கீகாரத்திற்கு Azure CLI ஐ பயன்படுத்தவும்
azd config set tls.insecure false                  # TLS சரிபார்ப்பை கட்டாயப்படுத்து

# செயல்திறன் மேம்படுத்தல்
azd config set provision.parallelism 5             # வளங்களை ஒரே நேரத்தில் உருவாக்குதல்
azd config set deploy.timeout 30m                  # அமர்த்தல் கால அவகாசம்
```

## 🏗️ திட்ட கட்டமைப்பு

### azure.yaml அமைப்பு
`azure.yaml` கோப்பு உங்கள் azd திட்டத்தின் இதயமாகும்:

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

## 🌟 சூழல் மேலாண்மை

### சூழல்களை உருவாக்குதல்
```bash
# புதிய சூழலை உருவாக்கு
azd env new development

# குறிப்பிட்ட இடத்துடன் உருவாக்கு
azd env new staging --location "westus2"

# வார்ப்புருவிலிருந்து உருவாக்கு
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### சூழல் கட்டமைப்பு
ஒவ்வொரு சூழலுக்கும் அதன் சொந்த கட்டமைப்பு `.azure/<env-name>/config.json` இல் இருக்கும்:

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

### சூழல் மாறிகள்
```bash
# சுற்றுச் சூழலுக்கான குறிப்பிட்ட மாறில்களை அமைக்கவும்
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# சுற்றுச்சூழல் மாறில்களைப் பார்க்கவும்
azd env get-values

# எதிர்பார்க்கப்படும் வெளியீடு:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# சுற்றுச்சூழல் மாறியை நீக்கவும்
azd env unset DEBUG

# நீக்கப்பட்டதை உறுதிப்படுத்தவும்
azd env get-values | grep DEBUG
# (எதுவும் தரப்படாது)
```

### சூழல் வார்ப்புருக்கள்
ஒத்தச் சூழலமைப்புக்காக `.azure/env.template` உருவாக்கவும்:
```bash
# தேவையான மாறிகள்
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# பயன்பாட்டு அமைப்புகள்
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# விருப்பமான மேம்பாட்டு அமைப்புகள்
DEBUG=false
LOG_LEVEL=info
```

## 🔐 அங்கீகார அமைப்பு

### Azure CLI ஒருங்கிணைப்பு
```bash
# Azure CLI சான்றுகளைப் பயன்படுத்தவும் (இயல்புநிலை)
azd config set auth.useAzureCliCredential true

# குறிப்பிட்ட டெனன்ட் மூலம் உள்நுழையவும்
az login --tenant <tenant-id>

# இயல்புநிலை சந்தாவை அமைக்கவும்
az account set --subscription <subscription-id>
```

### சேவை பிரதானியின் அங்கீகாரம்
CI/CD குழாய்களுக்காக:
```bash
# சுற்றுச்சூழல் மாறிகளை அமைக்கவும்
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# அல்லது நேரடியாக கட்டமைக்கவும்
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### மேலாண்மை அடையாளம்
Azure-யில் ஹோஸ்ட் செய்யப்பட்ட சூழல்களுக்கு:
```bash
# நிர்வகிக்கப்படும் அடையாள அங்கீகாரத்தை செயல்படுத்தவும்
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ உள்கட்டமைப்பு

### Bicep பரிமாணங்கள்
`infra/main.parameters.json` இல் உள்கட்டமைப்பு பரிமாணங்களை கட்டமைக்கவும்:
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
Terraform திட்டங்களுக்காக, `infra/terraform.tfvars` இல் கட்டமைக்கவும்:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 வினியோக அமைப்புகள்

### உருவாக்க அமைப்புகள்
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

### டாக்கர் அமைப்புகள்
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
உதாரண `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 மேம்பட்ட கட்டமைப்பு

### தனிப்பயன் வளத்தின் பெயரிடுதல்
```bash
# பெயரிடும் நடைமுறைகளை அமைக்க
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### பிணைய அமைப்பு
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### கண்காணிப்பு அமைப்பு
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

## 🎯 சூழல்-சார்ந்த கட்டமைப்புகள்

### வளர்ச்சி சூழல்
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### ஸ்டேஜிங் சூழல்
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### உற்பத்தி சூழல்
```bash
# .azure/உற்பத்தி/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 கட்டமைப்பு சரிபார்ப்பு

### கட்டமைப்பை சரிபார்க்கவும்
```bash
# கட்டமைப்பின் இலக்கணத்தை சரிபார்க்கவும்
azd config validate

# சூழல் மாறிலிகளை பரிசோதிக்கவும்
azd env get-values

# உள்கட்டமைப்பை சரிபார்க்கவும்
azd provision --dry-run
```

### கட்டமைப்பு ஸ்கிரிப்ட்கள்
`scripts/` இல் சரிபார்ப்பு ஸ்கிரிப்ட்களை உருவாக்கவும்:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# தேவையான சூழல் மாறிலிகளை சரிபார்க்கவும்
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml இன் சின்டாக்ஸை சரிபார்க்கவும்
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 சிறந்த நடைமுறைகள்

### 1. சூழல் மாறிகள் பயன்படுத்தவும்
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. கட்டமைப்பு கோப்புகளை ஒழுங்குபடுத்தவும்
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

### 3. பதிப்பு கட்டுப்பாடு தொடர்பான பரிந்துரைகள்
```bash
# .gitignore
.azure/*/config.json         # சுற்றுச்சூழல் கட்டமைப்புகள் (வள ID-களை கொண்டவை)
.azure/*/.env               # சுற்றுச்சூழல் மாறிலிகள் (ரகசியங்களை கொண்டிருக்கலாம்)
.env                        # உள்ளூர் சுற்றுச்சூழல் கோப்பு
```

### 4. கட்டமைப்பு ஆவணமிடல்
உங்கள் கட்டமைப்பை `CONFIG.md` இல் ஆவணமிடவும்:
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

## 🎯 கையேடு பயிற்சிகள்

### பயிற்சி 1: பன்மையான சூழல் கட்டமைப்பு (15 நிமிடங்கள்)

**நோக்கம்**: வெவ்வேறு அமைப்புகளை கொண்ட மூன்று சூழல்களை உருவாக்கி கட்டமைக்கவும்

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

**சாதனக் குறிக்கோள்கள்:**
- [ ] மூன்று சூழல்கள் வெற்றிகரமாக உருவாக்கப்பட்டுள்ளன
- [ ] ஒவ்வொரு சூழலுக்கும் தனித்தனியான கட்டமைப்பு உள்ளது
- [ ] பிழைகள் இல்லாமல் சூழல்களை மாற்ற முடிகிறது
- [ ] `azd env list` மூன்று சூழல்களையும் காட்டுகிறது

### பயிற்சி 2: ரகசிய மேலாண்மை (10 நிமிடங்கள்)

**நோக்கம்**: உணர்திறனான தரவுகளுடன் பாதுகாப்பான கட்டமைப்பை பயிற்சி செய்வது

```bash
# ரகசியங்களை அமைக்கவும் (வெளியீட்டில் காண்பிக்கப்படாது)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# ரகசியமற்ற கட்டமைப்பை அமைக்கவும்
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# சுற்றுச்சூழலை பார்க்கவும் (ரகசியங்கள் மறைக்கப்பட வேண்டும்)
azd env get-values

# ரகசியங்கள் சேமிக்கப்பட்டுள்ளதா என்பதை உறுதிப்படுத்தவும்
azd env get DB_PASSWORD  # உண்மையான மதிப்பை காண்பிக்க வேண்டும்
```

**சாதனக் குறிக்கோள்கள்:**
- [ ] ரகசியங்கள் டெர்மினலில் காட்சிப்படுத்தாமல் சேமிக்கப்பட்டுள்ளன
- [ ] `azd env get-values` மறைக்கப்பட்ட ரகசியங்களை காண்பிக்கிறது
- [ ] தனி `azd env get <SECRET_NAME>` உண்மையான மதிப்பை பெறுகிறது

## அடுத்த படிகள்

- [உங்கள் முதல் திட்டம்](first-project.md) - நடைமுறையில் கட்டமைப்பை பயன்படுத்து
- [பயன்படுத்தும் வழிகாட்டி](../chapter-04-infrastructure/deployment-guide.md) - விண்ணப்பத்திற்கான கட்டமைப்பைப் பயன்படுத்தவும்
- [வளங்கள் ஏற்படுத்துதல்](../chapter-04-infrastructure/provisioning.md) - உற்பத்திக்குத் தயார் கட்டமைப்புகள்

## ஆதாரங்கள்

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [ஆரம்பத்திற்கான AZD](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 3 - கட்டமைப்பு மற்றும் அங்கீகாரம்
- **⬅️ முந்தையது**: [உங்கள் முதல் திட்டம்](first-project.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 4: குறியீடாக உள்ளமைப்பு](../chapter-04-infrastructure/deployment-guide.md)
- **அடுத்த பாடம்**: [உங்கள் முதல் திட்டம்](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
அறிவுறுத்தல்:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான Co-op Translator (https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தானாக செய்யப்பட்ட மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான பொருள் விளக்கங்கள் இருக்கலாம் என்பதை கவனிக்கவும். மூல மொழியில் உள்ள அசல் ஆவணத்தை அதிகாரப்பூர்வமான மூலமாகக் கருதவும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பாளர் மூலம் மொழிபெயர்ப்பு பெற பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்களுக்கோ அல்லது தவறான பொருளாக்கங்களுக்கோ நாங்கள் பொறுப்பல்லாம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->