# कन्फिगरेसन मार्गदर्शन

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय ३ - कन्फिगरेसन र प्रमाणीकरण
- **⬅️ अघिल्लो**: [Your First Project](first-project.md)
- **➡️ अर्को**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 अर्को अध्याय**: [अध्याय ४: इन्फ्रास्ट्रक्चर एज कोड](../chapter-04-infrastructure/deployment-guide.md)

## परिचय

यस व्यापक मार्गदर्शनले Azure Developer CLI लाई उत्तम विकास र डिप्लोयमेन्ट वर्कफ्लोहरूको लागि कन्फिगर गर्ने सबै पक्षहरू समेट्छ। तपाईंले कन्फिगरेसन पदानुक्रम, वातावरण व्यवस्थापन, प्रमाणीकरण विधिहरू, र प्रभावकारी र सुरक्षित Azure डिप्लोयमेन्ट सक्षम गर्ने उन्नत कन्फिगरेसन ढाँचाहरूको बारेमा सिक्नुहुनेछ।

## सिकाइ लक्ष्यहरू

यस पाठको अन्त्यसम्म तपाईंले:
- azd कन्फिगरेसन पदानुक्रममा महारत हासिल गर्नुहोस् र सेटिङहरू कसरी प्राथमिकता दिइन्छ बुझ्नुहोस्
- विश्वव्यापी र प्रोजेक्ट-विशेष सेटिङहरू प्रभावकारी रूपमा कन्फिगर गर्नुहोस्
- विभिन्न कन्फिगरेसनहरू सहित बहु वातावरणहरू व्यवस्थापन गर्नुहोस्
- सुरक्षित प्रमाणीकरण र अधिकृत ढाँचाहरू कार्यान्वयन गर्नुहोस्
- जटिल परिदृश्यहरूको लागि उन्नत कन्फिगरेसन ढाँचाहरू बुझ्नुहोस्

## सिकाइ परिणामहरू

यस पाठ पूरा गरेपछि तपाईं सक्षम हुनुहुनेछ:
- उत्तम विकास वर्कफ्लोहरूको लागि azd कन्फिगर गर्न
- बहु डिप्लोयमेन्ट वातावरणहरू सेटअप र व्यवस्थापन गर्न
- सुरक्षित कन्फिगरेसन व्यवस्थापन अभ्यासहरू लागू गर्न
- कन्फिगरेसन-सम्बन्धित समस्या समाधान गर्न
- विशेष संगठनात्मक आवश्यकताहरूको लागि azd व्यवहार अनुकूलित गर्न

यस व्यापक मार्गदर्शनले Azure Developer CLI लाई उत्तम विकास र डिप्लोयमेन्ट वर्कफ्लोहरूको लागि कन्फिगर गर्ने सबै पक्षहरू समेट्छ।

## azd प्रोजेक्टमा AI एजेन्टहरू बुझ्न

यदि तपाईं AI एजेन्टहरूमा नयाँ हुनुहुन्छ भने, azd संसार भित्र तिनीहरूलाई बुझ्ने सरल तरिका यहाँ छ।

### एजेन्ट के हो?

एजेन्ट भनेको सफ्टवेयरको एक अंश हो जुन अनुरोध प्राप्त गर्न, तर्क गर्न, र कारवाही गर्न सक्छ—अक्सर AI मोडल कल गरेर, डेटा खोजेर, वा अन्य सेवाहरूलाई बोलाएर। azd प्रोजेक्टमा, एजेन्ट वेब फ्रन्टएन्ड वा API ब्याकएन्डसँगै अर्को **सेवा** मात्र हो।

### एजेन्टहरू कसरी azd प्रोजेक्ट संरचनामा फिट हुन्छन्

azd प्रोजेक्ट तीन तहहरू मिलेर बनेको हुन्छ: **इन्फ्रास्ट्रक्चर**, **कोड**, र **कन्फिगरेसन**। एजेन्टहरू यी तहहरूमा त्यस्तै सेवा जस्तै जडान हुन्छन्:

| तह | परम्परागत अनुप्रयोगका लागि के गर्दछ | एजेन्टका लागि के गर्दछ |
|-------|-------------------------------------|---------------------------|
| **इन्फ्रास्ट्रक्चर** (`infra/`) | वेब एप र डेटाबेस प्रबन्ध गर्दछ | AI मोडल एन्डपोइन्ट, सर्च इन्डेक्स, वा एजेन्ट होस्ट प्रदान गर्दछ |
| **कोड** (`src/`) | फ्रन्टएन्ड र API स्रोत कोड हुन्छ | एजेन्ट तर्क र प्रॉम्प्ट परिभाषाहरू हुन्छन् |
| **कन्फिगरेसन** (`azure.yaml`) | तपाईंका सेवाहरू र तिनीहरूको होस्टिंग लक्ष्यहरूको सूची | एजेन्टलाई सेवा रूपमा सूचीकृत गर्दछ, यसको कोड र होस्टतर्फ संकेत गर्दै |

### `azure.yaml` को भूमिका

हामीलाई साँचो रूपमा वाक्य संरचना याद गर्न आवश्यक छैन। अवधारणात्मक रूपमा, `azure.yaml` त्यो फाइल हो जहाँ तपाईं azd लाई भन्नुभयो: *"यी मेरा अनुप्रयोगका सेवाहरू हुन्, र तिनीहरूको कोड कहाँ छ।"*

जब तपाईंको प्रोजेक्टमा AI एजेन्ट हुन्छ, `azure.yaml` त्यो एजेन्टलाई सेवाहरूको रूपमा मात्र सूचीकृत गर्दछ। त्यहाँबाट azd सही इन्फ्रास्ट्रक्चर (जस्तै Microsoft Foundry Models एन्डपोइन्ट वा एजेन्ट होस्ट गर्न Container App) प्रदान गर्न जान्दछ र तपाईंको एजेन्ट कोड डिप्लोय गर्दछ—जस्तै वेब एप वा API का लागि गर्दछ।

यसको मतलब तपाईंलाई कुनै नयाँ आधारभूत कुरा सिक्न आवश्यक छैन। यदि तपाईंले वेब सेवा कसरी व्यवस्थापन गर्ने जान्नुहुन्छ भने, तपाईं एजेन्ट कसरी व्यवस्थापन हुन्छ भन्न पनि जान्नुहुन्छ।

## कन्फिगरेसन पदानुक्रम

azd ले पदानुक्रम प्रणाली प्रयोग गर्छ:
1. **कमाण्ड लाइन फ्ल्यागहरू** (सर्वोच्च प्राथमिकता)
2. **पर्यावरण चरहरू**
3. **स्थानीय प्रोजेक्ट कन्फिगरेसन** (`.azd/config.json`)
4. **वैश्विक प्रयोगकर्ता कन्फिगरेसन** (`~/.azd/config.json`)
5. **पूर्वनिर्धारित मानहरू** (सबैभन्दा कम प्राथमिकता)

## वैश्विक कन्फिगरेसन

### वैश्विक पूर्वनिर्धारित सेटिङहरू
```bash
# पूर्वनिर्धारित सदस्यता सेट गर्नुहोस्
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# पूर्वनिर्धारित स्थान सेट गर्नुहोस्
azd config set defaults.location "eastus2"

# पूर्वनिर्धारित स्रोत समूह नामकरण सम्मेलन सेट गर्नुहोस्
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# सबै विश्वव्यापी कन्फिगरेसन हेर्नुहोस्
azd config show

# कन्फिगरेसन हटाउनुहोस्
azd config unset defaults.location
```

### सामान्य वैश्विक सेटिङहरू
```bash
# विकास प्राथमिकताहरू
azd config set alpha.enable true                    # अल्फा सुविधाहरू सक्षम गर्नुहोस्
azd config set telemetry.enabled false             # टेलिमेट्री निष्क्रिय गर्नुहोस्
azd config set output.format json                  # आउटपुट ढाँचा सेट गर्नुहोस्

# सुरक्षा सेटिङहरू
azd config set auth.useAzureCliCredential true     # प्रमाणीकरणको लागि Azure CLI प्रयोग गर्नुहोस्
azd config set tls.insecure false                  # TLS प्रमाणिकरण लागू गर्नुहोस्

# प्रदर्शन ट्युनिंग
azd config set provision.parallelism 5             # समानान्तर स्रोत सिर्जना
azd config set deploy.timeout 30m                  # परिनियोजन समय सीमा
```

## 🏗️ प्रोजेक्ट कन्फिगरेसन

### azure.yaml संरचना
`azure.yaml` फाइल तपाईंको azd प्रोजेक्टको मुटु हो:

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

### सेवा कन्फिगरेसन विकल्पहरू

#### होस्ट प्रकारहरू
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

#### भाषा-विशेष सेटिङहरू
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

## 🌟 वातावरण व्यवस्थापन

### वातावरणहरू सिर्जना गर्दै
```bash
# नयाँ वातावरण सिर्जना गर्नुहोस्
azd env new development

# विशेष स्थानसँग सिर्जना गर्नुहोस्
azd env new staging --location "westus2"

# ढाँचा (टेम्प्लेट) बाट सिर्जना गर्नुहोस्
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### वातावरण कन्फिगरेसन
हरेक वातावरणमा आफ्नै कन्फिगरेसन `.azure/<env-name>/config.json` मा हुन्छ:

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

### वातावरण चरहरू
```bash
# वातावरण-विशिष्ट चरहरू सेट गर्नुहोस्
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# वातावरण चरहरू हेर्नुहोस्
azd env get-values

# अपेक्षित आउटपुट:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# वातावरण चर हटाउनुहोस्
azd env unset DEBUG

# हटाएको पुष्टि गर्नुहोस्
azd env get-values | grep DEBUG
# (कुनै पनि नफर्किनु पर्छ)
```

### वातावरण टेम्प्लेटहरू
समान वातावरण सेटअपका लागि `.azure/env.template` सिर्जना गर्नुहोस्:
```bash
# आवश्यक चरहरू
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# अनुप्रयोग सेटिङहरू
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# वैकल्पिक विकास सेटिङहरू
DEBUG=false
LOG_LEVEL=info
```

## 🔐 प्रमाणीकरण कन्फिगरेसन

### Azure CLI एकीकरण
```bash
# Azure CLI प्रमाणपत्रहरू प्रयोग गर्नुहोस् (पूर्वनिर्धारित)
azd config set auth.useAzureCliCredential true

# निर्दिष्ट टेनन्टसँग लगइन गर्नुहोस्
az login --tenant <tenant-id>

# पूर्वनिर्धारित सदस्यता सेट गर्नुहोस्
az account set --subscription <subscription-id>
```

### सेवा प्रमुख प्रमाणीकरण
CI/CD पाइपलाइनहरूको लागि:
```bash
# वातावरण चल-अचल सेट गर्नुहोस्
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# वा सिधा कन्फिगर गर्नुहोस्
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### व्यवस्थापित पहिचान
Azure होस्ट गरिएको वातावरणहरूको लागि:
```bash
# प्रबंधित पहिचान प्रमाणीकरण सक्षम गर्नुहोस्
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ पूर्वाधार कन्फिगरेसन

### Bicep प्यारामिटरहरू
पूर्वाधार प्यारामिटरहरू `infra/main.parameters.json` मा कन्फिगर गर्नुहोस्:
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

### Terraform कन्फिगरेसन
Terraform प्रोजेक्टहरूको लागि, `infra/terraform.tfvars` मा कन्फिगर गर्नुहोस्:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 डिप्लोयमेन्ट कन्फिगरेसन

### बिल्ड कन्फिगरेसन
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

### Docker कन्फिगरेसन
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
उदाहरण `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 उन्नत कन्फिगरेसन

### कस्टम रिसोर्स नामाकरण
```bash
# नामकरण सम्मेलनहरू सेट गर्नुहोस्
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### नेटवर्क कन्फिगरेसन
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### मोनिटरिङ कन्फिगरेसन
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

## 🎯 वातावरण-विशेष कन्फिगरेसनहरू

### विकास वातावरण
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### स्टेजिङ वातावरण
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### उत्पादन वातावरण
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 कन्फिगरेसन मान्यकरण

### कन्फिगरेसन मान्य बनाउनुहोस्
```bash
# कन्फिगरेसन सिन्ट्याक्स जाँच्नुहोस्
azd config validate

# वातावरणका चर परीक्षण गर्नुहोस्
azd env get-values

# पूर्वाधार प्रमाणीकरण गर्नुहोस्
azd provision --dry-run
```

### कन्फिगरेसन स्क्रिप्टहरू
`scripts/` मा मान्यकरण स्क्रिप्टहरू सिर्जना गर्नुहोस्:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# आवश्यक वातावरण चरहरू जाँच गर्नुहोस्
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml सिन्ट्याक्स मान्य गर्नुहोस्
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 उत्कृष्ट अभ्यासहरू

### १. वातावरण चरहरू प्रयोग गर्नुहोस्
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### २. कन्फिगरेसन फाइलहरू व्यवस्थित गर्नुहोस्
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

### ३. संस्करण नियन्त्रण विचारहरू
```bash
# .gitignore
.azure/*/config.json         # वातावरण कन्फिगहरू (संसाधन आईडीहरू समावेश गर्छ)
.azure/*/.env               # वातावरण भेरिएबलहरू (गोप्य जानकारी समावेश गर्न सक्छ)
.env                        # स्थानीय वातावरण फाइल
```

### ४. कन्फिगरेसन दस्तावेजीकरण
`CONFIG.md` मा आफ्नो कन्फिगरेसन दस्तावेज गर्नुहोस्:
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

## 🎯 व्यावहारिक अभ्यास

### अभ्यास १: बहु-वातावरण कन्फिगरेसन (१५ मिनेट)

**लक्ष्य**: फरक-फरक सेटिङहरू सहित तीनवटा वातावरण सिर्जना र कन्फिगर गर्नुहोस्

```bash
# विकास वातावरण सिर्जना गर्नुहोस्
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# स्टेजिङ वातावरण सिर्जना गर्नुहोस्
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# उत्पादन वातावरण सिर्जना गर्नुहोस्
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# प्रत्येक वातावरणलाई प्रमाणित गर्नुहोस्
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**सफलताको मापदण्ड:**
- [ ] तीन वातावरण सफलतापूर्वक सिर्जना भएका छन्
- [ ] प्रत्येक वातावरणको अलग कन्फिगरेसन छ
- [ ] वातावरणहरूबीच त्रुटिविना स्विच गर्न सकिन्छ
- [ ] `azd env list` ले सबै तीन वातावरण देखाउँछ

### अभ्यास २: गोप्य व्यवस्थापन (१० मिनेट)

**लक्ष्य**: संवेदनशील डाटासँग सुरक्षित कन्फिगरेसन अभ्यास गर्नुहोस्

```bash
# रहस्यों सेट गर्नुहोस् (आउटपुटमा देखाइँदैन)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# गैर-रहस्य कन्फिग सेट गर्नुहोस्
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# वातावरण हेर्नुहोस् (रहस्यहरू लुकाइने छन्)
azd env get-values

# रहस्यों सुरक्षित छन् भनी प्रमाणीकरण गर्नुहोस्
azd env get DB_PASSWORD  # वास्तविक मान देखाउनु पर्छ
```

**सफलताको मापदण्ड:**
- [ ] गोप्य वस्तुहरू टर्मिनलमा देखाए बिना सुरक्षित रूपमा भण्डारण भएका छन्
- [ ] `azd env get-values` ले लुकाइएको गोप्य वस्तुहरू देखाउँछ
- [ ] व्यक्तिगत `azd env get <SECRET_NAME>` वास्तविक मान निकाल्छ

## आगामी चरणहरू

- [Your First Project](first-project.md) - अभ्यासमा कन्फिगरेसन लागू गर्नुहोस्
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - डिप्लोयमेन्टका लागि कन्फिगरेसन प्रयोग गर्नुहोस्
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - उत्पादन तयार कन्फिगरेसनहरू

## सन्दर्भहरू

- [azd कन्फिगरेसन सन्दर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml स्कीमा](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [वातावरण चरहरू](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय ३ - कन्फिगरेसन र प्रमाणीकरण
- **⬅️ अघिल्लो**: [Your First Project](first-project.md)
- **➡️ अर्को अध्याय**: [अध्याय ४: इन्फ्रास्ट्रक्चर एज कोड](../chapter-04-infrastructure/deployment-guide.md)
- **अर्को पाठ**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुन सक्छ। मूल भाषामा रहेको दस्तावेजलाई अधिकारिक स्रोतको रूपमा मान्नुपर्छ। महत्वपूर्ण जानकारीका लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->