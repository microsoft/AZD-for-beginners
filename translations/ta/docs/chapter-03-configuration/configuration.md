# கட்டமைப்பு கையேடு

**அத்தியாய வழிசெலுத்தல்:**
- **📚 Course Home**: [AZD ஆரம்பர்களுக்கான](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 3 - கட்டமைப்பு மற்றும் அங்கீகாரம்
- **⬅️ Previous**: [உங்கள் முதல் திட்டம்](first-project.md)
- **➡️ Next**: [விநியோக வழிகாட்டி](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [அத்தியாயம் 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## அறிமுகம்

இந்த விரிவான கையேடு Azure Developer CLI ஐ சிறந்த மேம்பாடு மற்றும் விநியோக வேலைப்பாடுகளுக்காக உள்ளமைப்பதற்கான அனைத்து அம்சங்களையும் விரிவாகக் குறிப்பிடுகிறது. நீங்கள் கட்டமைப்பு அடுக்குமுறை, சூழல் மேலாண்மை, அங்கீகாரம் முறைகள் மற்றும் பாதுகாப்பான மற்றும் திறமையான Azure விநியோகங்களை 가능ப்படுத்தும் முன்னேற்றமான கட்டமைப்பு வடிவங்களைப் பற்றி கற்றுக்கொள்வீர்கள்.

## கற்றல் இலக்குகள்

இந்த பாடத்தை முடித்தவுடன், நீங்கள்:
- azd கட்டமைப்பு அடுக்குமுறையை திறம்பட கையாளவும் மற்றும் அமைப்புகளுக்கு முன்னுரிமை எப்படிக் கொடுக்கப்படுகிறது என்பதைப் புரிந்து கொள்ளவும்
- உலகளாவிய மற்றும் திட்ட-சார்ந்த அமைப்புகளை திறம்பட உள்ளமைக்கவும்
- வித்தியாசமான கட்டமைப்புகளுடன் பல சூழல்களை நிர்வகிக்கவும்
- பாதுகாப்பான அங்கீகார மற்றும் அனுமதி வடிவமைப்புகளை செயல்படுத்தவும்
- சிக்கலான சூழ்நிலைகளுக்கான முன்னேற்றமான கட்டமைப்பு வடிவங்களைப் புரிந்துகொள்ளவும்

## கற்றல் முடிவுகள்

இந்த பாடத்தை முடித்த பிறகு, நீங்கள் இயல்பாகச் செய்ய முடியும்:
- சிறந்த மேம்பாட்டு வேலைநடைகளுக்காக azd ஐ உள்ளமைக்கவும்
- பல விநியோக சூழல்களை அமைத்து நிர்வகிக்கவும்
- பாதுகாப்பான கட்டமைப்பு நிர்வகிப்பு நடைமுறைகளை செயல்படுத்தவும்
- கட்டமைப்புக்கான தொடர்புடைய சிக்கல்களை தீர்க்கவும்
- குறிப்பிட்ட நிறுவன தேவைகளுக்காக azd நடத்தை தனிப்பயனாக்கவும்

இந்த விரிவான கையேடு Azure Developer CLI ஐ சிறந்த மேம்பாடு மற்றும் விநியோக வேலைப்பாடுகளுக்காக உள்ளமைப்பதற்கான அனைத்து அம்சங்களையும் விரிவாகக் குறிப்பிடுகிறது.

## azd திட்டத்தில் AI முகவர்களைப் பற்றி புரிந்து கொள்ளுதல்

AI முகவர்கள் பற்றி நீங்கள் புதியவராக இருந்தால், azd சூழலில் அவர்களை எப்படி எண்ணுவது என்பது குறித்து இங்கே ஒரு எளிய விளக்கம் உள்ளது.

### முகவர் என்றால் என்ன?

ஒரு முகவர் என்பது ஒரு கோட்பாடு; அது ஒரு கோரிக்கையை பெற முடியும், அதைப் பற்றி யோசித்து, நடவடிக்கைகள் எடுக்கிறது—அதே இலகுவாக ஒரு AI மாதிரியை அழைத்தோ, தரவைக் காண்பதோ அல்லது பிற சேவைகளை அழைத்தோ செய்வது. ஒரு azd திட்டத்தில், ஒரு முகவர் உங்கள் வலை முன் இடைமுகம் அல்லது API பின்தளத்தோடு இணைந்து இருக்கும் மற்றொரு **சேவை** மாதிரி தான்.

### azd திட்ட கட்டமைப்பில் முகவர்கள் எங்கு பொருந்துகின்றன

ஒரு azd திட்டம் மூன்று அடுக்குகளில் உருவாக்கப்படும்: **infrastructure**, **code**, மற்றும் **configuration**. முகவர்கள் பிற சேவைகள் எப்படி இணைக்கப்படும் என்றதிலேயே இந்த அடுக்குகளுக்குள் இணைக்கப்படுவர்:

| அடுக்கு | பாரம்பரிய செயலிக்கு அது செய்யும் வேலை | முகவருக்கு அது செய்யும் வேலை |
|-------|-------------------------------------|---------------------------|
| **தளவமைப்பு** (`infra/`) | ஒரு வலை பயன்பாட்டையும் தரவுத்தளத்தையும் தயாரிக்கிறது | ஒரு AI மாதிரி எண்ட்பாயின்ட், தேடல் குறியீடு, அல்லது முகவர் ஹோஸ்டை தயாரிக்கிறது |
| **குறியீடு** (`src/`) | உங்கள் முன்னணி மற்றும் API மூலக் குறியீட்டை கொண்டுள்ளது | உங்கள் முகவர் தர்க்கம் மற்றும் தூண்டுதல் வரையறைகள் உள்ளன |
| **கட்டமைப்பு** (`azure.yaml`) | உங்கள் சேவைகள் மற்றும் அவற்றின் ஹோஸ்டிங் இலக்குகளை பட்டியலிடுகிறது | உங்கள் முகவரைக் சேவையாக பட்டியலிட்டு அதன் குறியீடு மற்றும் ஹோஸ்டை குறிக்கிறது |

### `azure.yaml` இன் பங்கு

தற்போது நீங்கள் வாக்கியங்களை மனத்திலேயே நிறுத்த தேவையில்லை. கருத்தூர்மையாக, `azure.yaml` என்பது நீங்கள் azd க்கு சொல்லும் கோப்பு: *"இவை எனது பயன்பாட்டை உருவாக்கும் சேவைகள், மற்றும் அவற்றின் குறியீடுகளை எங்கே காணலாம் என்பதைக் காட்டுகிறது."*

உங்கள் திட்டத்தில் ஒரு AI முகவர் அடங்கியிருந்தால், `azure.yaml` that முகவரைக் சேவைகளில் ஒன்றாக பட்டியலிடும். அதன்பின் azd சரியான தளவமைப்புகளை (உதாரணத்திற்கு Microsoft Foundry Models எண்ட்பாயின்ட் அல்லது முகவருக்கு ஹோஸ்ட் செய்ய ஒரு Container App போன்றவை) உருவாக்க மற்றும் உங்கள் முகவர் குறியீட்டை மொத்தமாக பிரித்தெடுக்க தேவையை அறியும் — அது வலை பயன்பாட்டுக்கும் API க்கும் செய்யும் வழியையே.

இதனால் வேகமாக ஏதும் புதிய ஒன்றை கற்றுக்கொள்ள வேண்டியதில்லை. azd ஒரு வலை சேவையை எப்படி நிர்வகிக்கிறது என்பதை நீங்கள் புரிந்தால், அது ஒரு முகவரையும் எப்படி நிர்வகிக்கின்றது என்பதையும் நீங்கள் ஏற்கனவே புரிந்திருக்கிறீர்கள்.

## கட்டமைப்பு அடுக்குமுறை

azd ஒரு அடுக்குமுறை கொண்ட கட்டமைப்பு அமைப்பைப் பயன்படுத்துகிறது:
1. **கமாண்ட்-லைன் கொடிகள்** (உயர் முன்னுரிமை)
2. **சூழல் மாறிகள்**
3. **உள்ளூர் திட்டக் கட்டமைப்பு** (`.azd/config.json`)
4. **கிளோபல் பயனர் கட்டமைப்பு** (`~/.azd/config.json`)
5. **இயல்புநிலை மதிப்புகள்** (குறைந்த முன்னுரிமை)

## உலகளாவிய கட்டமைப்பு

### உலகளாவிய இயல்புகளை அமைத்தல்
```bash
# இயல்புநிலையான சப்ஸ்கிரிப்ஷனை அமைக்க
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# இயல்புநிலையான இடத்தை அமைக்க
azd config set defaults.location "eastus2"

# இயல்புநிலையான வளக் குழு பெயரிடல் நடைமுறையை அமைக்க
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# அனைத்து உலகளாவிய அமைப்புகளை பார்க்க
azd config show

# ஒரு அமைப்பை அகற்று
azd config unset defaults.location
```

### பொதுவான உலகளாவிய அமைப்புகள்
```bash
# வளர்ச்சி விருப்பங்கள்
azd config set alpha.enable true                    # அல்பா அம்சங்களை இயக்கவும்
azd config set telemetry.enabled false             # டெலிமெட்ரியை முடக்கு
azd config set output.format json                  # வெளியீட்டு வடிவத்தை அமைக்கவும்

# பாதுகாப்பு அமைப்புகள்
azd config set auth.useAzureCliCredential true     # அங்கீகாரத்திற்காக Azure CLI ஐ பயன்படுத்தவும்
azd config set tls.insecure false                  # TLS சரிபார்ப்பை கட்டாயப்படுத்தவும்

# செயல்திறன் ஒழுங்கமைப்பு
azd config set provision.parallelism 5             # சமாந்தர வள உருவாக்கம்
azd config set deploy.timeout 30m                  # வினியோக காலாவதி
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

## 🌟 சூழல் நிர்வாகம்

### சூழல்களை உருவாக்குதல்
```bash
# புதிய சூழலை உருவாக்கவும்
azd env new development

# குறிப்பிட்ட இடத்துடன் உருவாக்கவும்
azd env new staging --location "westus2"

# மாதிரியிலிருந்து உருவாக்கவும்
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### சூழல் கட்டமைப்பு
ஒவ்வொரு சூழலும் தன் தனி கட்டமைப்பை `.azure/<env-name>/config.json` இல் கொண்டுள்ளது:

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
# சுற்றுச்சூழல்-சார்ந்த மாறில்களை அமைக்க
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# சுற்றுச்சூழல் மாறிலிகளை பார்வையிட
azd env get-values

# எதிர்பார்க்கப்படும் வெளியீடு:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# சுற்றுச்சூழல் மாறிலியை நீக்கு
azd env unset DEBUG

# நீக்கத்தை சரிபார்க்க
azd env get-values | grep DEBUG
# (எதுவும் திருப்பப்படக் கூடாது)
```

### சூழல் மாதிரிகள்
ஒத்தமான சூழலமைப்பிற்கு `.azure/env.template` ஐ உருவாக்கவும்:
```bash
# தேவையான மாறில்கள்
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# பயன்பாட்டின் அமைப்புகள்
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# விருப்பமான அபிவிருத்தி அமைப்புகள்
DEBUG=false
LOG_LEVEL=info
```

## 🔐 அங்கீகாரக் கட்டமைப்பு

### Azure CLI ஒருங்கிணைப்பு
```bash
# Azure CLI கடவுச்சான்றுகளைப் பயன்படுத்தவும் (இயல்புநிலை)
azd config set auth.useAzureCliCredential true

# குறிப்பிட்ட டெனன்டுடன் உள்நுழைக
az login --tenant <tenant-id>

# இயல்புநிலை சந்தாவை அமைக்கவும்
az account set --subscription <subscription-id>
```

### சேவை பிரதிநிதி அங்கீகாரம்
CI/CD குழாய்களுக்கு:
```bash
# சுற்றுச்சூழை மாறிகள் அமைக்கவும்
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# அல்லது நேரடியாக அமைக்கவும்
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### நிர்வகிக்கப்பட்ட அடையாளம்
Azure-இல் ஹோஸ்ட் செய்யப்பட்ட சூழல்களுக்கு:
```bash
# மேலாண்மை அடையாள அங்கீகாரத்தை செயல்படுத்தவும்
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ இன்ஃப்ராஸ்ட்ரக்சர் கட்டமைப்பு

### Bicep பராமீட்டர்கள்
உட்கட்டமைப்பு பராமீட்டர்களை `infra/main.parameters.json` இல் உள்ளமைக்கவும்:
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
Terraform திட்டங்களுக்கு, `infra/terraform.tfvars` இல் கட்டமைக்கவும்:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 விநியோக கட்டமைப்பு

### உருவாக்க கட்டமைப்பு
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
உதாரணம் `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 மேம்பட்ட கட்டமைப்பு

### தனிப்பயன் வளப் பெயரிடல்
```bash
# பெயரிடும் விதிமுறைகளை அமைக்கவும்
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

### கண்காணிப்பு கட்டமைப்பு
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

### மேம்பாட்டு சூழல்
```bash
# .azure/வளர்ச்சி/.env
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

### தயாரிப்பு சூழல்
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
# கட்டமைப்பின் சின்டாக்ஸை சரிபார்க்கவும்
azd config validate

# சூழல் மாறிலிகளை சோதிக்கவும்
azd env get-values

# அடித்தளத்தைச் சரிபார்க்கவும்
azd provision --dry-run
```

### கட்டமைப்பு ஸ்கிரிப்டுகள்
சரிபார்ப்பு ஸ்கிரிப்டுகளை `scripts/` இல் உருவாக்கவும்:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# தேவையான சூழல் மாறிலிகளை சரிபார்க்கவும்
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

### 1. சூழல் மாறிகளை பயன்படுத்தவும்
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

### 3. பதிப்பு கட்டுப்பாடு கருதுகொள்கைகள்
```bash
# .gitignore
.azure/*/config.json         # சுற்றுச்சூழல் கட்டமைப்புகள் (வள அடையாளங்களைக் கொண்டுள்ளன)
.azure/*/.env               # சுற்றுச்சூழல் மாறிகள் (ரகசியங்களை கொண்டிருக்கலாம்)
.env                        # உள்ளூர் சுற்றுச்சூழல் கோப்பு
```

### 4. கட்டமைப்பு ஆவணமிடல்
உங்கள் கட்டமைப்பை `CONFIG.md` இல் ஆவணப்படுத்துங்கள்:
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

## 🎯 நடைமுறை பயிற்சி பணிகள்

### பயிற்சி 1: பல சூழல் கட்டமைப்பு (15 நிமிடங்கள்)

**நோக்கம்**: வித்தியாசமான அமைப்புகளுடன் மூன்று சூழல்களை உருவாக்கி உள்ளமைக்கவும்

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

**வெற்றி இலக்குகள்:**
- [ ] மூன்று சூழல்கள் வெற்றிகரமாக உருவாக்கப்பட்டுள்ளன
- [ ] ஒவ்வொரு சூழலுக்கும் தனித்துவமான கட்டமைப்பு உள்ளது
- [ ] பிழைகள் இல்லாமல் சூழல்களை மாற்றமுடியும்
- [ ] `azd env list` அனைத்து மூன்று சூழல்களையும் காட்டுகிறது

### பயிற்சி 2: இரகசிய மேலாண்மை (10 நிமிடங்கள்)

**நோக்கம்**: நுண்ணறிவு தரவுகளுடன் பாதுகாப்பான கட்டமைப்பு நடைமுறைகளை பயிற்சி செய்யவும்

```bash
# ரகசியங்களை அமைக்கவும் (வெளியீட்டின் போது காட்டப்பட மாட்டாது)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# ரகசியமில்லா கட்டமைப்பை அமைக்கவும்
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# சுற்றுச்சூழலைப் பார்க்கவும் (ரகசியங்கள் மறைக்கப்பட்டிருக்க வேண்டும்)
azd env get-values

# ரகசியங்கள் சேமிக்கப்பட்டுள்ளதைக் சரிபார்க்கவும்
azd env get DB_PASSWORD  # உண்மையான மதிப்பை காட்ட வேண்டும்
```

**வெற்றி இலக்குகள்:**
- [ ] ரகசியங்கள் டெர்மினலில் காட்டாமல் சேமிக்கப்பட்டிருக்க வேண்டும்
- [ ] `azd env get-values` மறைக்கப்பட்ட ரகசியங்களை காட்டுகிறது
- [ ] தனி `azd env get <SECRET_NAME>` நிஜ மதிப்பை பெறுகிறது

## அடுத்த படிகள்

- [உங்கள் முதல் திட்டம்](first-project.md) - கட்டமைப்பை நடைமுறையில் பயன்படுத்தவும்
- [விநியோக வழிகாட்டி](../chapter-04-infrastructure/deployment-guide.md) - விநியோகத்திற்காக கட்டமைப்பைப் பயன்படுத்தவும்
- [வள ஒதுக்கீடு](../chapter-04-infrastructure/provisioning.md) - தயாரிப்பு-தயாரான கட்டமைப்புகள்

## குறிப்புகள்

- [azd கட்டமைப்பு குறிப்பு](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml ஸ்கீமா](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [சூழல் மாறிகள்](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 Course Home**: [AZD ஆரம்பர்களுக்கான](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [உங்கள் முதல் திட்டம்](first-project.md)
- **➡️ Next Chapter**: [அத்தியாயம் 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [உங்கள் முதல் திட்டம்](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**பொறுப்பு மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காகப் போராடினாலும், தானியக்க மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கக்கூடும் என்பதை கவனத்தில் கொள்ளவும். அசலான மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்களுக்கும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->