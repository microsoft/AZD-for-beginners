# कन्फिगरेसन मार्गदर्शिका

**अध्याय नेभिगेसन:**
- **📚 पाठ्यक्रम गृह**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 3 - Configuration & Authentication
- **⬅️ अघिल्लो**: [तपाईंको पहिलो परियोजना](first-project.md)
- **➡️ अर्को**: [परिनियोजन मार्गदर्शिका](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 अर्को अध्याय**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## परिचय

यो व्यापक मार्गदर्शिकाले Azure Developer CLI लाई विकास र परिनियोजन वर्कफ्लोलाई अधिकतम बनाउनका लागि कन्फिगरेसनका सबै पक्षहरू समेट्छ। तपाईंले कन्फिगरेसन पदानुक्रम, वातावरण व्यवस्थापन, प्रमाणीकरण विधिहरू, र प्रभावकारी र सुरक्षित Azure परिनियोजनहरू सक्षम गर्ने उन्नत कन्फिगरेसन ढाँचा बारे सिक्नुहुनेछ।

## सिक्ने लक्ष्यहरू

यस पाठको अन्त्यसम्म, तपाईं:
- azd कन्फिगरेसन पदानुक्रममा निपुण हुनुहुनेछ र सेटिङहरू कसरी प्राथमिकता दिइन्छ बुझ्नुहुनेछ
- ग्लोबल र प्रोजेक्ट-विशिष्ट सेटिङहरू प्रभावकारी रूपमा कन्फिगर गर्न सक्नुहुनेछ
- भिन्न कन्फिगरेसनहरू भएका बहु वातावरणहरू व्यवस्थापन गर्न सक्नुहुनेछ
- सुरक्षित प्रमाणीकरण र अनुमतिका ढाँचाहरू लागू गर्न सक्नुहुनेछ
- जटिल परिदृश्यहरूका लागि उन्नत कन्फिगरेसन ढाँचाहरू बुझ्नुहुनेछ

## सिकाइ नतिजाहरू

यस पाठ पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- विकास वर्कफ्लोहरूका लागि azd लाई अनुकूल रूपमा कन्फिगर गर्ने
- बहु परिनियोजन वातावरणहरू सेटअप र व्यवस्थापन गर्ने
- सुरक्षित कन्फिगरेसन व्यवस्थापन अभ्यासहरू लागू गर्ने
- कन्फिगरेसन-संबन्धी समस्याहरू ट्रबलशुट गर्ने
- विशिष्ट संगठनात्मक आवश्यकताका लागि azd व्यवहार अनुकूलित गर्ने

यो व्यापक मार्गदर्शिकाले Azure Developer CLI लाई विकास र परिनियोजन वर्कफ्लोलाई अधिकतम बनाउनका लागि कन्फिगरेसनका सबै पक्षहरू समेट्छ।

## कन्फिगरेसन पदानुक्रम

azd ले एक पदानुक्रमिक कन्फिगरेसन प्रणाली प्रयोग गर्दछ:
1. **Command-line flags** (सर्वोच्च प्राथमिकता)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (न्यूनतम प्राथमिकता)

## ग्लोबल कन्फिगरेसन

### ग्लोबल पूर्वनिर्धारित सेट गर्नुहोस्
```bash
# पूर्वनिर्धारित सदस्यता सेट गर्नुहोस्
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# पूर्वनिर्धारित स्थान सेट गर्नुहोस्
azd config set defaults.location "eastus2"

# पूर्वनिर्धारित स्रोत समूहको नामकरण नियम सेट गर्नुहोस्
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# सबै वैश्विक कन्फिगरेसनहरू हेर्नुहोस्
azd config list

# एक कन्फिगरेसन हटाउनुहोस्
azd config unset defaults.location
```

### सामान्य ग्लोबल सेटिङहरू
```bash
# विकास प्राथमिकताहरू
azd config set alpha.enable true                    # अल्फा सुविधाहरू सक्षम गर्नुहोस्
azd config set telemetry.enabled false             # टेलिमेट्री अक्षम गर्नुहोस्
azd config set output.format json                  # आउटपुट ढाँचा सेट गर्नुहोस्

# सुरक्षा सेटिङहरू
azd config set auth.useAzureCliCredential true     # प्रमाणीकरणका लागि Azure CLI प्रयोग गर्नुहोस्
azd config set tls.insecure false                  # TLS सत्यापन अनिवार्य गर्नुहोस्

# प्रदर्शन अनुकूलन
azd config set provision.parallelism 5             # संसाधनहरूको समानान्तर सिर्जना
azd config set deploy.timeout 30m                  # परिनियोजन समयसीमा
```

## 🏗️ परियोजना कन्फिगरेसन

### azure.yaml संरचना
`azure.yaml` फाइल तपाईंको azd परियोजनाको मुख्य भाग हो:

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

### वातावरणहरू सिर्जना गर्नु
```bash
# नयाँ वातावरण सिर्जना गर्नुहोस्
azd env new development

# विशिष्ट स्थान सहित सिर्जना गर्नुहोस्
azd env new staging --location "westus2"

# टेम्पलेटबाट सिर्जना गर्नुहोस्
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### वातावरण कन्फिगरेसन
प्रत्येक वातावरणको आफ्नै कन्फिगरेसन `.azure/<env-name>/config.json` मा हुन्छ:

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

### वातावरण भेरिएबलहरू
```bash
# पर्यावरण-विशिष्ट चरहरू सेट गर्नुहोस्
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# पर्यावरण चरहरू हेर्नुहोस्
azd env get-values

# अपेक्षित आउटपुट:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# पर्यावरण चर हटाउनुहोस्
azd env unset DEBUG

# हटाइएको प्रमाणित गर्नुहोस्
azd env get-values | grep DEBUG
# (कुनै पनि आउटपुट आउँदैन)
```

### वातावरण ढाँचाहरू
सुसंगत वातावरण सेटअपका लागि `.azure/env.template` सिर्जना गर्नुहोस्:
```bash
# आवश्यक भेरिएबलहरू
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
# Azure CLI क्रेडेन्सियलहरू प्रयोग गर्नुहोस् (पूर्वनिर्धारित)
azd config set auth.useAzureCliCredential true

# विशिष्ट टेनेन्टसँग लगइन गर्नुहोस्
az login --tenant <tenant-id>

# पूर्वनिर्धारित सदस्यता सेट गर्नुहोस्
az account set --subscription <subscription-id>
```

### सेवा प्रिन्सिपल प्रमाणीकरण
CI/CD पाइपलाइनहरूको लागि:
```bash
# पर्‍यावरण चरहरू सेट गर्नुहोस्
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# वा सिधै कन्फिगर गर्नुहोस्
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### प्रबन्धित पहिचान
Azure-होस्ट गरिएको वातावरणहरूको लागि:
```bash
# प्रबन्धित पहिचान प्रमाणीकरण सक्षम गर्नुहोस्
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ इन्फ्रास्ट्रक्चर कन्फिगरेसन

### Bicep प्यारामिटरहरू
इन्फ्रास्ट्रक्चर प्यारामिटरहरू `infra/main.parameters.json` मा कन्फिगर गर्नुहोस्:
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
Terraform परियोजनाहरूका लागि, `infra/terraform.tfvars` मा कन्फिगर गर्नुहोस्:
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

### निगरानी कन्फिगरेसन
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
# कन्फिगरेशन सिन्ट्याक्स जाँच गर्नुहोस्
azd config validate

# वातावरण चरहरू परीक्षण गर्नुहोस्
azd env get-values

# पूर्वाधार मान्य गर्नुहोस्
azd provision --dry-run
```

### कन्फिगरेसन स्क्रिप्टहरू
मान्यकरण स्क्रिप्टहरू `scripts/` मा सिर्जना गर्नुहोस्:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# आवश्यक वातावरण चरहरू जाँच गर्नुहोस्
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml को वाक्य-विन्यास जाँच गर्नुहोस्
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 सर्वोत्तम अभ्यासहरू

### 1. वातावरण भेरिएबलहरूको प्रयोग गर्नुहोस्
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

### 3. संस्करण नियन्त्रण सम्बन्धी विचारहरू
```bash
# .gitignore
.azure/*/config.json         # पर्यावरण कन्फिगहरू (स्रोत ID हरू समावेश)
.azure/*/.env               # पर्यावरण भेरिएबलहरू (गोप्य जानकारी समावेश हुन सक्छ)
.env                        # स्थानीय वातावरण फाइल
```

### 4. कन्फिगरेसन दस्तावेजीकरण
तपाईंको कन्फिगरेसन `CONFIG.md` मा दस्तावेज गर्नुहोस्:
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

## 🎯 व्यावहारिक अभ्यासहरू

### व्यायाम 1: बहु-पर्यावरण कन्फिगरेसन (15 minutes)

**लक्ष्य**: फरक सेटिङ्स भएका तीन वातावरणहरू सिर्जना र कन्फिगर गर्नुहोस्

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
- [ ] प्रत्येक वातावरणको अलग कन्फिगरेसन छ
- [ ] त्रुटीविहीन रूपमा वातावरणहरू बीच स्विच गर्न सकिन्छ
- [ ] `azd env list` ले ती सबै तीन वातावरणहरू देखाउँछ

### व्यायाम 2: गोप्य व्यवस्थापन (10 minutes)

**लक्ष्य**: संवेदनशील डाटासँग सुरक्षित कन्फिगरेसन अभ्यास गर्नुहोस्

```bash
# गोप्य मानहरू सेट गर्नुहोस् (आउटपुटमा देखाइँदैनन्)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# गैर-गोप्य कन्फिग सेट गर्नुहोस्
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# पर्यावरण हेर्नुहोस् (गोप्य जानकारीहरू लुकाइएका हुनुपर्छ)
azd env get-values

# गोप्य जानकारीहरू संग्रहित छन् भन्ने पुष्टि गर्नुहोस्
azd env get DB_PASSWORD  # वास्तविक मान देखाउनुपर्छ
```

**सफलता मापदण्ड:**
- [ ] गोप्य वस्तुहरू टर्मिनलमा देखाइ नदिई सुरक्षित रूपमा स्टोर भएका छन्
- [ ] `azd env get-values` ले गोप्य वस्तुहरू रेड्याक्टेड रूपमा देखाउँछ
- [ ] व्यक्तिगत `azd env get <SECRET_NAME>` ले वास्तविक मान फिर्ता ल्याउँछ

## अर्को कदमहरू

- [तपाईंको पहिलो परियोजना](first-project.md) - अभ्यासमा कन्फिगरेसन लागू गर्नुहोस्
- [परिनियोजन मार्गदर्शिका](../chapter-04-infrastructure/deployment-guide.md) - परिनियोजनका लागि कन्फिगरेसन प्रयोग गर्नुहोस्
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - उत्पादन-तयार कन्फिगरेसनहरू

## सन्दर्भहरू

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**अध्याय नेभिगेसन:**
- **📚 पाठ्यक्रम गृह**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 3 - Configuration & Authentication
- **⬅️ अघिल्लो**: [तपाईंको पहिलो परियोजना](first-project.md)
- **➡️ अर्को अध्याय**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **अर्को पाठ**: [तपाईंको पहिलो परियोजना](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो कागजात AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुन सक्छ। मूल भाषामा रहेको दस्तावेज़लाई अधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानवीय अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार हुनेछैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->