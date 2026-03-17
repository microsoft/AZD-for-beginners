# कन्फिगरेसन गाइड

**Chapter Navigation:**
- **📚 Course Home**: [AZD शुरुआतीहरूका लागि](../../README.md)
- **📖 Current Chapter**: अध्याय 3 - कन्फिगरेसन र प्रमाणीकरण
- **⬅️ Previous**: [तपाईंको पहिलो परियोजना](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [अध्याय 4: पूर्वाधारलाई कोडको रूपमा](../chapter-04-infrastructure/deployment-guide.md)

## परिचय

यो व्यापक गाइडले Azure Developer CLI लाई उत्तम विकास र परिनियोजन कार्यप्रवाहहरूको लागि कन्फिगर गर्ने सबै पक्षहरू समेट्दछ। तपाईंले कन्फिगरेसन पदानुक्रम, वातावरण व्यवस्थापन, प्रमाणीकरण विधिहरू, र सुरक्षित तथा प्रभावकारी Azure परिनियोजन सक्षम बनाउने उन्नत कन्फिगरेसन ढाँचाहरूका बारेमा सिक्नुहुनेछ।

## सिकाइ लक्ष्यहरू

यो पाठ समाप्त भएपछि, तपाईंले:
- azd कन्फिगरेसन पदानुक्रममा निपुणता हासिल गर्नु र सेटिङहरू कसरी प्राथमिकता गरिन्छ भन्ने बुझ्नु
- ग्लोबल र परियोजना-विशिष्ट सेटिङहरू प्रभावकारी रूपमा कन्फिगर गर्नु
- फरक कन्फिगरेसनहरूसहित बहु वातावरणहरू व्यवस्थापन गर्नु
- सुरक्षित प्रमाणीकरण र प्राधिकरण ढाँचाहरू लागू गर्नु
- जटिल परिदृश्यहरूको लागि उन्नत कन्फिगरेसन ढाँचाहरू बुझ्नु

## सिकाइ नतिजा

यो पाठ पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- विकास कार्यप्रवाहहरूको लागि azd कन्फिगर गर्नु
- बहु परिनियोजन वातावरणहरू सेटअप र व्यवस्थापन गर्नु
- सुरक्षित कन्फिगरेसन व्यवस्थापन अभ्यासहरू लागू गर्नु
- कन्फिगरेसन सम्बन्धी समस्याहरू टुंग्याउनु
- विशिष्ट संगठनात्मक आवश्यकताहरूका लागि azd व्यवहार अनुकूलन गर्नु

यो व्यापक गाइडले Azure Developer CLI लाई उत्तम विकास र परिनियोजन कार्यप्रवाहहरूको लागि कन्फिगर गर्ने सबै पक्षहरू समेट्दछ।

## azd परियोजनामा AI एजेन्टहरू बुझ्नुहोस्

यदि तपाईं AI एजेन्टहरूमा नयाँ हुनुहुन्छ भने, यहाँ azd संसार भित्र तिनीहरूबारे सोच्ने सजिलो तरिका छ।

### एजेन्ट भनेको के हो?

एजेन्ट एउटा सफ्टवेयरको टुक्रा हो जसले अनुरोध प्राप्त गर्न, त्यसबारे तर्क गर्न, र कार्यहरू लिन सक्छ—प्राय: एउटा AI मोडललाई कल गरेर, डाटा खोजेर, वा अन्य सेवाहरूलाई बोलाएर। azd परियोजनामा, एजेन्ट तपाईंको वेब फ्रन्टएन्ड वा API ब्याकएन्डसँगै एउटा अर्को **service** जस्तै हुन्छ।

### एजेन्टहरू कसरी azd परियोजना संरचनामा फिट हुन्छन्

azd परियोजना तीन तहबाट बनेको हुन्छ: **पूर्वाधार**, **कोड**, र **कन्फिगरेसन**। एजेन्टहरू यी तहहरूमा अर्को कुनै पनि सेवाले जस्तै प्लग इन गर्छन्:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **पूर्वाधार** (`infra/`) | वेब एप र डाटाबेसको प्रावधान गर्दछ | AI मोडल इन्डपोइन्ट, सर्च इन्डेक्स, वा एजेन्ट होस्ट प्रावधान गर्दछ |
| **कोड** (`src/`) | तपाईंको फ्रन्टएन्ड र API स्रोत कोड समावेश गर्दछ | तपाईंको एजेन्ट लजिक र प्रॉम्प्ट परिभाषाहरू समावेश गर्दछ |
| **कन्फिगरेसन** (`azure.yaml`) | तपाईंका सेवाहरू र तिनको होस्टिङ लक्ष्यहरू सूचीबद्ध गर्दछ | एजेन्टलाई एउटा सेवा रूपमा सूचीबद्ध गर्दछ, जसले त्यसको कोड र होस्टतर्फ संकेत गर्दछ |

### The Role of `azure.yaml`

हिजोको वेला सम्म सिन्ट्याक्स याद गर्नु आवश्यक छैन। अवधारणात्मक रूपमा, `azure.yaml` फाइल हो जहाँ तपाईं azd लाई बताउनुहुन्छ: *"यी मेरा एप्लिकेसन बनाउने सेवाहरू हुन्, र यहाँ तिनीहरूको कोड कहाँ पाउन सकिन्छ।"*

जब तपाईंको परियोजनामा एउटा AI एजेन्ट समावेश हुन्छ, `azure.yaml` ले त्यो एजेन्टलाई एउटा सेवा मध्येको रूपमा मात्र सूचीबद्ध गर्छ। त्यसपछि azd ले सहि पूर्वाधार (जस्तै Microsoft Foundry Models endpoint वा एजेन्ट होस्ट गर्ने Container App) प्रावधान गर्न र तपाईंको एजेन्ट कोड परिनियोजन गर्न जान्दछ—ठ्याक्कै जस्तो यसले वेब एप वा API का लागि गर्थ्यो।

यसको अर्थ केहि मौलिक नयाँ सिक्नुपर्ने छैन। यदि तपाईंले azd कसरी वेब सेवा व्यवस्थापन गर्छ बुझ्नुभयो भने, तपाईंले कसरी एजेन्ट व्यवस्थापन गरिन्छ पनि पहिले नै बुझ्नुभएको छ।

## कन्फिगरेसन पदानुक्रम

azd ले एउटा पदानुक्रमिक कन्फिगरेसन प्रणाली प्रयोग गर्छ:
1. **Command-line flags** (highest priority)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (lowest priority)

## ग्लोबल कन्फिगरेसन

### Setting Global Defaults
```bash
# पूर्वनिर्धारित सदस्यता सेट गर्नुहोस्
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# पूर्वनिर्धारित स्थान सेट गर्नुहोस्
azd config set defaults.location "eastus2"

# पूर्वनिर्धारित संसाधन समूह नामकरण परम्परा सेट गर्नुहोस्
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# सबै वैश्विक विन्यास हेर्नुहोस्
azd config list

# एक विन्यास हटाउनुहोस्
azd config unset defaults.location
```

### Common Global Settings
```bash
# विकास प्राथमिकताहरू
azd config set alpha.enable true                    # अल्फा सुविधाहरू सक्षम गर्नुहोस्
azd config set telemetry.enabled false             # टेलिमेट्री निष्क्रिय गर्नुहोस्
azd config set output.format json                  # आउटपुट ढाँचा सेट गर्नुहोस्

# सुरक्षा सेटिङहरू
azd config set auth.useAzureCliCredential true     # प्रमाणीकरणका लागि Azure CLI प्रयोग गर्नुहोस्
azd config set tls.insecure false                  # TLS प्रमाणीकरण अनिवार्य गर्नुहोस्

# प्रदर्शन ट्यूनिङ
azd config set provision.parallelism 5             # समानान्तर स्रोत सिर्जना
azd config set deploy.timeout 30m                  # परिनियोजन समयसीमा
```

## 🏗️ परियोजना कन्फिगरेसन

### azure.yaml संरचना
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

#### भाषा-विशिष्ट सेटिङहरू
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

### वातावरण सिर्जना
```bash
# नयाँ वातावरण सिर्जना गर्नुहोस्
azd env new development

# निर्दिष्ट स्थान सहित सिर्जना गर्नुहोस्
azd env new staging --location "westus2"

# टेम्पलेटबाट सिर्जना गर्नुहोस्
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### वातावरण कन्फिगरेसन
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

### वातावरण चरहरू
```bash
# पर्यावरण-विशिष्ट भेरिएबलहरू सेट गर्नुहोस्
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# पर्यावरण भेरिएबलहरू हेर्नुहोस्
azd env get-values

# अपेक्षित आउटपुट:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# पर्यावरण भेरिएबल हटाउनुहोस्
azd env unset DEBUG

# हटाइएको पुष्टि गर्नुहोस्
azd env get-values | grep DEBUG
# (कुनै पनि फर्किनु हुँदैन)
```

### वातावरण टेम्पलेटहरू
Create `.azure/env.template` for consistent environment setup:
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

## 🔐 प्रमाणीककरण कन्फिगरेसन

### Azure CLI एकीकरण
```bash
# Azure CLI प्रमाण-पत्रहरू प्रयोग गर्नुहोस् (पूर्वनिर्धारित)
azd config set auth.useAzureCliCredential true

# विशिष्ट टेनन्टसँग लगइन गर्नुहोस्
az login --tenant <tenant-id>

# पूर्वनिर्धारित सदस्यता सेट गर्नुहोस्
az account set --subscription <subscription-id>
```

### Service Principal प्रमाणीकरण
For CI/CD pipelines:
```bash
# पर्यावरण भेरिएबलहरू सेट गर्नुहोस्
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# वा सिधै कन्फिगर गर्नुहोस्
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### व्यवस्थापित पहिचान
For Azure-hosted environments:
```bash
# प्रबन्धित पहिचान प्रमाणीकरण सक्षम गर्नुहोस्
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ पूर्वाधार कन्फिगरेसन

### Bicep प्यारामिटरहरू
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

### Terraform कन्फिगरेसन
For Terraform projects, configure in `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 परिनियोजन कन्फिगरेसन

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
Example `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 उन्नत कन्फिगरेसन

### कस्टम स्रोत नामकरण
```bash
# नामकरण नियमहरू सेट गर्नुहोस्
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

### अनुगमन कन्फिगरेसन
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

## 🎯 वातावरण-विशिष्ट कन्फिगरेसनहरू

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

### कन्फिगरेसन मान्य गर्नुहोस्
```bash
# कन्फिगरेसनको वाक्यविन्यास जाँच्नुहोस्
azd config validate

# पर्यावरण चरहरू परीक्षण गर्नुहोस्
azd env get-values

# पूर्वाधार मान्य गर्नुहोस्
azd provision --dry-run
```

### कन्फिगरेसन स्क्रिप्टहरू
Create validation scripts in `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# आवश्यक वातावरण चरहरू जाँच गर्नुहोस्
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml को वाक्य रचना मान्य गर्नुहोस्
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 उत्तम अभ्यासहरू

### 1. वातावरण चरहरूको प्रयोग गर्नुहोस्
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. कन्फिगरेसन फाइलहरू व्यवस्थित गर्नुहोस्
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

### 3. भर्सन कन्ट्रोल विचारहरू
```bash
# .gitignore
.azure/*/config.json         # पर्यावरण कन्फिगहरू (स्रोत IDहरू समावेश गर्छन्)
.azure/*/.env               # पर्यावरण भेरिएबलहरू (गोप्य जानकारी समावेश हुन सक्छन्)
.env                        # स्थानीय पर्यावरण फाइल
```

### 4. कन्फिगरेसन दस्तावेजीकरण
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

## 🎯 व्यवहारिक अभ्यासहरू

### अभ्यास 1: बहु-वातावरण कन्फिगरेसन (15 मिनेट)

**लक्ष्य**: फरक सेटिङहरू सहित तीन वातावरणहरू सिर्जना र कन्फिगर गर्नुहोस्

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

# प्रत्येक वातावरण जाँच गर्नुहोस्
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**सफलता मापदण्ड:**
- [ ] तीन वातावरणहरू सफलतापूर्वक सिर्जना भएका छन्
- [ ] प्रत्येक वातावरणको कन्फिगरेसन अलग छ
- [ ] त्रुटि बिना वातावरणहरू बीच स्विच गर्न सकिन्छ
- [ ] `azd env list` ले ती सबै तीन वातावरणहरू देखाउँछ

### अभ्यास 2: गोप्य व्यवस्थापन (10 मिनेट)

**लक्ष्य**: संवेदनशील डाटासँग सुरक्षित कन्फिगरेसन अभ्यास गर्नुहोस्

```bash
# रहस्यहरू सेट गर्नुहोस् (आउटपुटमा प्रदर्शित हुँदैन)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# गैर-रहस्य कन्फिग सेट गर्नुहोस्
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# वातावरण हेर्नुहोस् (रहस्यहरू लुकाइएका हुनुपर्छ)
azd env get-values

# रहस्यहरू भण्डारण गरिएको छ भनेर जाँच गर्नुहोस्
azd env get DB_PASSWORD  # वास्तविक मान देखिनु पर्छ
```

**सफलता मापदण्ड:**
- [ ] गोप्य वस्तुहरू टर्मिनलमा देखिने गरी होइन, सुरक्षित रूपमा भण्डारण गरिएका छन्
- [ ] `azd env get-values` ले लुकाइएका गोप्यहरू देखाउँछ
- [ ] व्यक्तिगत `azd env get <SECRET_NAME>` ले वास्तविक मान फिर्ता गर्छ

## अर्को कदमहरू

- [तपाईंको पहिलो परियोजना](first-project.md) - व्यावहारिक रूपमा कन्फिगरेसन लागू गर्नुहोस्
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - परिनियोजनका लागि कन्फिगरेसन प्रयोग गर्नुहोस्
- [संसाधन प्रावधान](../chapter-04-infrastructure/provisioning.md) - उत्पादन-तयार कन्फिगरेसनहरू

## सन्दर्भहरू

- [azd कन्फिगरेसन सन्दर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml स्कीमा](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [वातावरण चरहरू](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD शुरुआतीहरूका लागि](../../README.md)
- **📖 Current Chapter**: अध्याय 3 - कन्फिगरेसन र प्रमाणीकरण
- **⬅️ Previous**: [तपाईंको पहिलो परियोजना](first-project.md)
- **➡️ Next Chapter**: [अध्याय 4: पूर्वाधारलाई कोडको रूपमा](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [तपाईंको पहिलो परियोजना](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सटीकताको लागि प्रयासरत भए तापनि कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धि हुन सक्छ। मूल दस्तावेजलाई यसको मूल भाषामा आधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानवीय अनुवाद सिफारिश गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->