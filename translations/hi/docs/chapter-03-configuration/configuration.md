# कॉन्फ़िगरेशन गाइड

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 3 - कॉन्फ़िगरेशन और प्रमाणीकरण
- **⬅️ पिछला**: [आपका पहला प्रोजेक्ट](first-project.md)
- **➡️ अगला**: [डिप्लॉयमेंट गाइड](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 अगला अध्याय**: [अध्याय 4: कोड के रूप में इन्फ्रास्ट्रक्चर](../chapter-04-infrastructure/deployment-guide.md)

## परिचय

यह व्यापक गाइड Azure Developer CLI को इष्टतम विकास और डिप्लॉयमेंट वर्कफ़्लो के लिए कॉन्फ़िगर करने के सभी पहलुओं को कवर करती है। आप कॉन्फ़िगरेशन पदानुक्रम, वातावरण प्रबंधन, प्रमाणीकरण विधियाँ, और उन्नत कॉन्फ़िगरेशन पैटर्न के बारे में जानेंगे जो कुशल और सुरक्षित Azure डिप्लॉयमेंट सक्षम करते हैं।

## सीखने के लक्ष्य

इस पाठ के अंत तक, आप:
- azd कॉन्फ़िगरेशन पदानुक्रम में माहिर हो जाएंगे और समझेंगे कि सेटिंग्स को कैसे प्राथमिकता दी जाती है
- वैश्विक और प्रोजेक्ट-विशिष्ट सेटिंग्स को प्रभावी ढंग से कॉन्फ़िगर करेंगे
- विभिन्न कॉन्फ़िगरेशन के साथ कई वातावरणों का प्रबंधन करेंगे
- सुरक्षित प्रमाणीकरण और प्राधिकरण पैटर्न को लागू करेंगे
- जटिल परिदृश्यों के लिए उन्नत कॉन्फ़िगरेशन पैटर्न समझेंगे

## सीखने के परिणाम

इस पाठ को पूरा करने के बाद, आप सक्षम होंगे:
- विकास वर्कफ़्लोज़ के लिए azd को कॉन्फ़िगर करना
- कई डिप्लॉयमेंट वातावरण स्थापित और प्रबंधित करना
- सुरक्षित कॉन्फ़िगरेशन प्रबंधन अभ्यास लागू करना
- कॉन्फ़िगरेशन से संबंधित समस्याओं का समाधान करना
- विशिष्ट संगठनात्मक आवश्यकताओं के लिए azd व्यवहार को अनुकूलित करना

यह व्यापक गाइड Azure Developer CLI को इष्टतम विकास और डिप्लॉयमेंट वर्कफ़्लो के लिए कॉन्फ़िगर करने के सभी पहलुओं को कवर करती है।

## azd प्रोजेक्ट में AI एजेंट्स को समझना

यदि आप AI एजेंट्स के लिए नए हैं, तो azd की दुनिया में उन्हें एक सरल तरीके से सोचें।

### एजेंट क्या है?

एक एजेंट सॉफ़्टवेयर का ऐसा हिस्सा है जो अनुरोध प्राप्त कर सकता है, उसके बारे में विचार कर सकता है, और क्रियाएँ कर सकता है—अक्सर AI मॉडल को कॉल करके, डेटा खोजकर, या अन्य सेवाओं को सक्रिय करके। एक azd प्रोजेक्ट में, एजेंट आपके वेब फ्रंटेंड या API बैकएंड के साथ एक अन्य **सेवा** होता है।

### एजेंट azd प्रोजेक्ट संरचना में कैसे फिट होते हैं

एक azd प्रोजेक्ट तीन स्तरों से बना होता है: **इन्फ्रास्ट्रक्चर**, **कोड**, और **कॉन्फ़िगरेशन**। एजेंट इन स्तरों में उसी तरह जुड़ते हैं जैसे कोई अन्य सेवा:

| स्तर | पारंपरिक ऐप के लिए क्या करता है | एजेंट के लिए क्या करता है |
|-------|----------------------------------|---------------------------|
| **इन्फ्रास्ट्रक्चर** (`infra/`) | एक वेब ऐप और डेटाबेस प्रोविजन करता है | AI मॉडल एंडपॉइंट, खोज अनुक्रमणिका, या एजेंट होस्ट प्रोविजन करता है |
| **कोड** (`src/`) | आपका फ्रंटेंड और API स्रोत कोड रखता है | एजेंट लॉजिक और प्रांप्ट परिभाषाएँ रखता है |
| **कॉन्फ़िगरेशन** (`azure.yaml`) | आपकी सेवाओं और उनके होस्टिंग लक्ष्य को सूचीबद्ध करता है | एजेंट को एक सेवा के रूप में सूचीबद्ध करता है, जो इसके कोड और होस्ट को पॉइंट करता है |

### `azure.yaml` की भूमिका

आपको अभी इसका सिंटैक्स याद रखने की जरूरत नहीं है। अवधारणात्मक रूप से, `azure.yaml` वह फ़ाइल है जहां आप azd को बताते हैं: *"यहाँ वे सेवाएँ हैं जो मेरे एप्लिकेशन का हिस्सा हैं, और यहाँ उनके कोड कहाँ हैं।"*

जब आपके प्रोजेक्ट में AI एजेंट शामिल होता है, तो `azure.yaml` बस उस एजेंट को सेवाओं में से एक के रूप में सूचीबद्ध करता है। तब azd सही इन्फ्रास्ट्रक्चर (जैसे Microsoft Foundry Models एंडपॉइंट या एजेंट होस्ट करने के लिए कंटेनर ऐप) प्रोविजन करता है और आपके एजेंट कोड को डिप्लॉय करता है—जैसे यह वेब ऐप या API के लिए करता है।

इसका मतलब है कि मूल रूप से सीखने के लिए कुछ नया नहीं है। यदि आप समझते हैं कि azd वेब सेवा को कैसे प्रबंधित करता है, तो आप पहले से ही समझते हैं कि यह एजेंट को कैसे प्रबंधित करता है।

## कॉन्फ़िगरेशन पदानुक्रम

azd एक पदानुक्रमित कॉन्फ़िगरेशन सिस्टम का उपयोग करता है:
1. **कमान लाइन फ्लैग्स** (सबसे उच्च प्राथमिकता)
2. **पर्यावरण चर**
3. **स्थानीय प्रोजेक्ट कॉन्फ़िगरेशन** (`.azd/config.json`)
4. **वैश्विक उपयोगकर्ता कॉन्फ़िगरेशन** (`~/.azd/config.json`)
5. **डिफ़ॉल्ट मान** (सबसे कम प्राथमिकता)

## वैश्विक कॉन्फ़िगरेशन

### वैश्विक डिफ़ॉल्ट सेटिंग्स
```bash
# डिफ़ॉल्ट सब्सक्रिप्शन सेट करें
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# डिफ़ॉल्ट स्थान सेट करें
azd config set defaults.location "eastus2"

# डिफ़ॉल्ट संसाधन समूह नामकरण कन्वेंशन सेट करें
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# सभी वैश्विक कॉन्फ़िगरेशन देखें
azd config show

# एक कॉन्फ़िगरेशन हटाएं
azd config unset defaults.location
```

### सामान्य वैश्विक सेटिंग्स
```bash
# विकास प्राथमिकताएं
azd config set alpha.enable true                    # अल्फा सुविधाओं को सक्षम करें
azd config set telemetry.enabled false             # टेलीमेट्री अक्षम करें
azd config set output.format json                  # आउटपुट फ़ॉर्मेट सेट करें

# सुरक्षा सेटिंग्स
azd config set auth.useAzureCliCredential true     # प्रमाणीकरण के लिए एजुअर CLI का उपयोग करें
azd config set tls.insecure false                  # TLS सत्यापन लागू करें

# प्रदर्शन ट्यूनिंग
azd config set provision.parallelism 5             # समानांतर संसाधन निर्माण
azd config set deploy.timeout 30m                  # तैनाती समय सीमा
```

## 🏗️ प्रोजेक्ट कॉन्फ़िगरेशन

### azure.yaml संरचना
`azure.yaml` फ़ाइल आपके azd प्रोजेक्ट का केंद्र है:

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

### सेवा कॉन्फ़िगरेशन विकल्प

#### होस्ट प्रकार
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

#### भाषा-विशिष्ट सेटिंग्स
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

## 🌟 वातावरण प्रबंधन

### वातावरण बनाना
```bash
# एक नया वातावरण बनाएँ
azd env new development

# विशिष्ट स्थान के साथ बनाएँ
azd env new staging --location "westus2"

# टेम्पलेट से बनाएँ
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### वातावरण कॉन्फ़िगरेशन
प्रत्येक वातावरण का अपना कॉन्फ़िगरेशन `.azure/<env-name>/config.json` में होता है:

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

### वातावरण चर
```bash
# पर्यावरण-विशिष्ट वेरिएबल सेट करें
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# पर्यावरण वेरिएबल देखें
azd env get-values

# अपेक्षित आउटपुट:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# पर्यावरण वेरिएबल हटाएं
azd env unset DEBUG

# हटाने की पुष्टि करें
azd env get-values | grep DEBUG
# (कुछ भी नहीं लौटाना चाहिए)
```

### वातावरण टेम्प्लेट
सुसंगत वातावरण सेटअप के लिए `.azure/env.template` बनायें:
```bash
# आवश्यक वेरिएबल्स
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# एप्लिकेशन सेटिंग्स
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# वैकल्पिक विकास सेटिंग्स
DEBUG=false
LOG_LEVEL=info
```

## 🔐 प्रमाणीकरण कॉन्फ़िगरेशन

### Azure CLI एकीकरण
```bash
# Azure CLI क्रेडेंशियल्स का उपयोग करें (डिफ़ॉल्ट)
azd config set auth.useAzureCliCredential true

# विशिष्ट टेनेन्ट के साथ लॉगिन करें
az login --tenant <tenant-id>

# डिफ़ॉल्ट सब्सक्रिप्शन सेट करें
az account set --subscription <subscription-id>
```

### सर्विस प्रिंसिपल प्रमाणीकरण
CI/CD पाईपलाइनों के लिए:
```bash
# पर्यावरण चर सेट करें
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# या सीधे कॉन्फ़िगर करें
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### प्रबंधित पहचान
Azure-होस्ट किए गए वातावरणों के लिए:
```bash
# प्रबंधित पहचान प्रमाणीकरण सक्षम करें
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ इन्फ्रास्ट्रक्चर कॉन्फ़िगरेशन

### बाइसेप पैरामीटर
`infra/main.parameters.json` में इन्फ्रास्ट्रक्चर पैरामीटर कॉन्फ़िगर करें:
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

### टेराफॉर्म कॉन्फ़िगरेशन
टेराफॉर्म प्रोजेक्ट्स के लिए, `infra/terraform.tfvars` में कॉन्फ़िगर करें:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 डिप्लॉयमेंट कॉन्फ़िगरेशन

### बिल्ड कॉन्फ़िगरेशन
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

### डॉकर कॉन्फ़िगरेशन
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

## 🔧 उन्नत कॉन्फ़िगरेशन

### कस्टम रिसोर्स नामकरण
```bash
# नामकरण कन्वेंशन्स सेट करें
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### नेटवर्क कॉन्फ़िगरेशन
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### मॉनिटरिंग कॉन्फ़िगरेशन
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

## 🎯 वातावरण-विशिष्ट कॉन्फ़िगरेशन

### विकास वातावरण
```bash
# .azure/विकास/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### स्टेजिंग वातावरण
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### प्रोडक्शन वातावरण
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 कॉन्फ़िगरेशन मान्यकरण

### कॉन्फ़िगरेशन मान्य करें
```bash
# विन्यास सिंटैक्स जांचें
azd config validate

# पर्यावरण चर परीक्षण करें
azd env get-values

# इंफ्रास्ट्रक्चर सत्यापित करें
azd provision --dry-run
```

### कॉन्फ़िगरेशन स्क्रिप्ट्स
`scripts/` में मान्यकरण स्क्रिप्ट बनाएँ:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# आवश्यक पर्यावरण चर जांचें
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml सिंटैक्स को मान्य करें
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 सर्वोत्तम अभ्यास

### 1. वातावरण चर का उपयोग करें
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. कॉन्फ़िगरेशन फाइलों का आयोजन करें
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

### 3. संस्करण नियंत्रण विचार
```bash
# .gitignore
.azure/*/config.json         # परिवेश कॉन्फ़िगर (संसाधन आईडी शामिल हैं)
.azure/*/.env               # परिवेश चर (संभव है कि गुप्त जानकारी शामिल हो)
.env                        # स्थानीय परिवेश फ़ाइल
```

### 4. कॉन्फ़िगरेशन दस्तावेज़ीकरण
अपने कॉन्फ़िगरेशन को `CONFIG.md` में दस्तावेज करें:
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

### अभ्यास 1: मल्टी-एंवायरनमेंट कॉन्फ़िगरेशन (15 मिनट)

**लक्ष्य**: तीन अलग-अलग सेटिंग्स के साथ वातावरण बनाएं और कॉन्फ़िगर करें

```bash
# विकास पर्यावरण बनाएं
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# स्टेजिंग पर्यावरण बनाएं
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# उत्पादन पर्यावरण बनाएं
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# प्रत्येक पर्यावरण की जांच करें
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**सफलता मानदंड:**
- [ ] तीनों वातावरण सफलतापूर्वक बनाए गए
- [ ] प्रत्येक वातावरण की अलग कॉन्फ़िगरेशन है
- [ ] वातावरणों के बीच बिना त्रुटि के स्विच किया जा सकता है
- [ ] `azd env list` सभी तीन वातावरण दिखाता है

### अभ्यास 2: गुप्त प्रबंधन (10 मिनट)

**लक्ष्य**: संवेदनशील डेटा के साथ सुरक्षित कॉन्फ़िगरेशन का अभ्यास करें

```bash
# रहस्य सेट करें (आउटपुट में प्रदर्शित नहीं किया गया)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# गैर-रहस्य कॉन्फ़िग सेट करें
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# पर्यावरण देखें (रहस्य लुप्त होने चाहिए)
azd env get-values

# सत्यापित करें कि रहस्य संग्रहीत हैं
azd env get DB_PASSWORD  # वास्तविक मान दिखाना चाहिए
```

**सफलता मानदंड:**
- [ ] गुप्त जानकारी टर्मिनल में प्रदर्शित किए बिना संग्रहीत की गई
- [ ] `azd env get-values` गुप्त जानकारी को रेडैक्टेड दिखाता है
- [ ] व्यक्तिगत `azd env get <SECRET_NAME>` वास्तविक मान प्राप्त करता है

## अगले कदम

- [आपका पहला प्रोजेक्ट](first-project.md) - कॉन्फ़िगरेशन को व्यावहारिक रूप में लागू करें
- [डिप्लॉयमेंट गाइड](../chapter-04-infrastructure/deployment-guide.md) - डिप्लॉयमेंट के लिए कॉन्फ़िगरेशन का उपयोग करें
- [प्रोविजनिंग संसाधन](../chapter-04-infrastructure/provisioning.md) - उत्पादन-तैयार कॉन्फ़िगरेशन

## संदर्भ

- [azd कॉन्फ़िगरेशन संदर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml स्कीमा](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [पर्यावरण चर](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 3 - कॉन्फ़िगरेशन और प्रमाणीकरण
- **⬅️ पिछला**: [आपका पहला प्रोजेक्ट](first-project.md)
- **➡️ अगला अध्याय**: [अध्याय 4: कोड के रूप में इन्फ्रास्ट्रक्चर](../chapter-04-infrastructure/deployment-guide.md)
- **अगला पाठ**: [आपका पहला प्रोजेक्ट](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। यद्यपि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान रखें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ उसकी मूल भाषा में आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->