# कॉन्फ़िगरेशन गाइड

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 3 - कॉन्फ़िगरेशन और प्रमाणीकरण
- **⬅️ पिछला**: [आपका पहला प्रोजेक्ट](first-project.md)
- **➡️ अगला**: [डिप्लॉयमेंट गाइड](../deployment/deployment-guide.md)
- **🚀 अगला अध्याय**: [अध्याय 4: कोड के रूप में इंफ्रास्ट्रक्चर](../deployment/deployment-guide.md)

## परिचय

यह व्यापक गाइड Azure Developer CLI को बेहतर विकास और डिप्लॉयमेंट वर्कफ़्लो के लिए कॉन्फ़िगर करने के सभी पहलुओं को कवर करता है। आप कॉन्फ़िगरेशन पदानुक्रम, पर्यावरण प्रबंधन, प्रमाणीकरण विधियों और उन्नत कॉन्फ़िगरेशन पैटर्न के बारे में जानेंगे जो कुशल और सुरक्षित Azure डिप्लॉयमेंट को सक्षम बनाते हैं।

## सीखने के लक्ष्य

इस पाठ के अंत तक, आप:
- azd कॉन्फ़िगरेशन पदानुक्रम को समझेंगे और जानेंगे कि सेटिंग्स को कैसे प्राथमिकता दी जाती है
- वैश्विक और प्रोजेक्ट-विशिष्ट सेटिंग्स को प्रभावी ढंग से कॉन्फ़िगर करेंगे
- विभिन्न कॉन्फ़िगरेशन के साथ कई पर्यावरण प्रबंधित करेंगे
- सुरक्षित प्रमाणीकरण और प्राधिकरण पैटर्न लागू करेंगे
- जटिल परिदृश्यों के लिए उन्नत कॉन्फ़िगरेशन पैटर्न को समझेंगे

## सीखने के परिणाम

इस पाठ को पूरा करने के बाद, आप:
- विकास वर्कफ़्लो के लिए azd को कॉन्फ़िगर कर पाएंगे
- कई डिप्लॉयमेंट पर्यावरण सेटअप और प्रबंधित कर पाएंगे
- सुरक्षित कॉन्फ़िगरेशन प्रबंधन प्रथाओं को लागू कर पाएंगे
- कॉन्फ़िगरेशन से संबंधित समस्याओं का समाधान कर पाएंगे
- विशिष्ट संगठनात्मक आवश्यकताओं के लिए azd व्यवहार को अनुकूलित कर पाएंगे

यह व्यापक गाइड Azure Developer CLI को बेहतर विकास और डिप्लॉयमेंट वर्कफ़्लो के लिए कॉन्फ़िगर करने के सभी पहलुओं को कवर करता है।

## कॉन्फ़िगरेशन पदानुक्रम

azd एक पदानुक्रमित कॉन्फ़िगरेशन प्रणाली का उपयोग करता है:
1. **कमांड-लाइन फ्लैग्स** (सबसे उच्च प्राथमिकता)
2. **पर्यावरण वेरिएबल्स**
3. **स्थानीय प्रोजेक्ट कॉन्फ़िगरेशन** (`.azd/config.json`)
4. **वैश्विक उपयोगकर्ता कॉन्फ़िगरेशन** (`~/.azd/config.json`)
5. **डिफ़ॉल्ट मान** (सबसे कम प्राथमिकता)

## वैश्विक कॉन्फ़िगरेशन

### वैश्विक डिफ़ॉल्ट सेट करना
```bash
# डिफ़ॉल्ट सदस्यता सेट करें
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# डिफ़ॉल्ट स्थान सेट करें
azd config set defaults.location "eastus2"

# डिफ़ॉल्ट संसाधन समूह नामकरण सम्मेलन सेट करें
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# सभी वैश्विक कॉन्फ़िगरेशन देखें
azd config list

# एक कॉन्फ़िगरेशन हटाएं
azd config unset defaults.location
```

### सामान्य वैश्विक सेटिंग्स
```bash
# विकास प्राथमिकताएँ
azd config set alpha.enable true                    # अल्फा सुविधाएँ सक्षम करें
azd config set telemetry.enabled false             # टेलीमेट्री अक्षम करें
azd config set output.format json                  # आउटपुट प्रारूप सेट करें

# सुरक्षा सेटिंग्स
azd config set auth.useAzureCliCredential true     # प्रमाणीकरण के लिए Azure CLI का उपयोग करें
azd config set tls.insecure false                  # TLS सत्यापन लागू करें

# प्रदर्शन ट्यूनिंग
azd config set provision.parallelism 5             # समानांतर संसाधन निर्माण
azd config set deploy.timeout 30m                  # परिनियोजन समय सीमा
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

## 🌟 पर्यावरण प्रबंधन

### पर्यावरण बनाना
```bash
# एक नया वातावरण बनाएं
azd env new development

# विशिष्ट स्थान के साथ बनाएं
azd env new staging --location "westus2"

# टेम्पलेट से बनाएं
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### पर्यावरण कॉन्फ़िगरेशन
प्रत्येक पर्यावरण की अपनी कॉन्फ़िगरेशन होती है `.azure/<env-name>/config.json` में:

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

### पर्यावरण वेरिएबल्स
```bash
# पर्यावरण-विशिष्ट चर सेट करें
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# पर्यावरण चर देखें
azd env get-values

# अपेक्षित आउटपुट:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# पर्यावरण चर हटाएं
azd env unset DEBUG

# हटाने की पुष्टि करें
azd env get-values | grep DEBUG
# (कुछ भी वापस नहीं आना चाहिए)
```

### पर्यावरण टेम्पलेट्स
सुसंगत पर्यावरण सेटअप के लिए `.azure/env.template` बनाएं:
```bash
# आवश्यक चर
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# अनुप्रयोग सेटिंग्स
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# वैकल्पिक विकास सेटिंग्स
DEBUG=false
LOG_LEVEL=info
```

## 🔐 प्रमाणीकरण कॉन्फ़िगरेशन

### Azure CLI इंटीग्रेशन
```bash
# Azure CLI क्रेडेंशियल्स (डिफ़ॉल्ट) का उपयोग करें
azd config set auth.useAzureCliCredential true

# विशिष्ट टेनेंट के साथ लॉगिन करें
az login --tenant <tenant-id>

# डिफ़ॉल्ट सब्सक्रिप्शन सेट करें
az account set --subscription <subscription-id>
```

### सेवा प्रिंसिपल प्रमाणीकरण
CI/CD पाइपलाइनों के लिए:
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
Azure-होस्टेड पर्यावरण के लिए:
```bash
# प्रबंधित पहचान प्रमाणीकरण सक्षम करें
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ इंफ्रास्ट्रक्चर कॉन्फ़िगरेशन

### Bicep पैरामीटर्स
`infra/main.parameters.json` में इंफ्रास्ट्रक्चर पैरामीटर्स कॉन्फ़िगर करें:
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

### Terraform कॉन्फ़िगरेशन
Terraform प्रोजेक्ट्स के लिए, `infra/terraform.tfvars` में कॉन्फ़िगर करें:
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

### Docker कॉन्फ़िगरेशन
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

### कस्टम संसाधन नामकरण
```bash
# नामकरण परंपराओं को सेट करें
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

## 🎯 पर्यावरण-विशिष्ट कॉन्फ़िगरेशन

### विकास पर्यावरण
```bash
# .azure/विकास/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### स्टेजिंग पर्यावरण
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### उत्पादन पर्यावरण
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 कॉन्फ़िगरेशन सत्यापन

### कॉन्फ़िगरेशन सत्यापित करें
```bash
# कॉन्फ़िगरेशन सिंटैक्स की जांच करें
azd config validate

# पर्यावरण वेरिएबल्स का परीक्षण करें
azd env get-values

# बुनियादी ढांचे को मान्य करें
azd provision --dry-run
```

### कॉन्फ़िगरेशन स्क्रिप्ट्स
`scripts/` में सत्यापन स्क्रिप्ट्स बनाएं:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# आवश्यक पर्यावरण चर जांचें
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml सिंटैक्स मान्य करें
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 सर्वोत्तम प्रथाएं

### 1. पर्यावरण वेरिएबल्स का उपयोग करें
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. कॉन्फ़िगरेशन फ़ाइलों को व्यवस्थित करें
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
# .गिटइग्नोर
.azure/*/config.json         # पर्यावरण कॉन्फ़िग्स (संसाधन आईडी शामिल हैं)
.azure/*/.env               # पर्यावरण वेरिएबल्स (गोपनीय जानकारी हो सकती है)
.env                        # स्थानीय पर्यावरण फ़ाइल
```

### 4. कॉन्फ़िगरेशन दस्तावेज़ीकरण
अपने कॉन्फ़िगरेशन को `CONFIG.md` में दस्तावेज़ित करें:
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

### अभ्यास 1: मल्टी-पर्यावरण कॉन्फ़िगरेशन (15 मिनट)

**लक्ष्य**: तीन पर्यावरण बनाएं और विभिन्न सेटिंग्स के साथ कॉन्फ़िगर करें

```bash
# विकास वातावरण बनाएं
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# स्टेजिंग वातावरण बनाएं
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# उत्पादन वातावरण बनाएं
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# प्रत्येक वातावरण को सत्यापित करें
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**सफलता मानदंड:**
- [ ] तीन पर्यावरण सफलतापूर्वक बनाए गए
- [ ] प्रत्येक पर्यावरण में अद्वितीय कॉन्फ़िगरेशन है
- [ ] पर्यावरण के बीच बिना त्रुटि के स्विच कर सकते हैं
- [ ] `azd env list` सभी तीन पर्यावरण दिखाता है

### अभ्यास 2: सीक्रेट प्रबंधन (10 मिनट)

**लक्ष्य**: संवेदनशील डेटा के साथ सुरक्षित कॉन्फ़िगरेशन का अभ्यास करें

```bash
# गुप्त सेट करें (आउटपुट में प्रदर्शित नहीं)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# गैर-गुप्त कॉन्फ़िगरेशन सेट करें
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# पर्यावरण देखें (गुप्त जानकारी छुपाई जानी चाहिए)
azd env get-values

# सत्यापित करें कि गुप्त जानकारी संग्रहीत है
azd env get DB_PASSWORD  # वास्तविक मान दिखाना चाहिए
```

**सफलता मानदंड:**
- [ ] सीक्रेट्स को टर्मिनल में प्रदर्शित किए बिना संग्रहीत किया गया
- [ ] `azd env get-values` रेडैक्टेड सीक्रेट्स दिखाता है
- [ ] व्यक्तिगत `azd env get <SECRET_NAME>` वास्तविक मान पुनः प्राप्त करता है

## अगले कदम

- [आपका पहला प्रोजेक्ट](first-project.md) - कॉन्फ़िगरेशन को व्यावहारिक रूप से लागू करें
- [डिप्लॉयमेंट गाइड](../deployment/deployment-guide.md) - डिप्लॉयमेंट के लिए कॉन्फ़िगरेशन का उपयोग करें
- [संसाधन प्रोविजनिंग](../deployment/provisioning.md) - उत्पादन-तैयार कॉन्फ़िगरेशन

## संदर्भ

- [azd कॉन्फ़िगरेशन संदर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml स्कीमा](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [पर्यावरण वेरिएबल्स](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 3 - कॉन्फ़िगरेशन और प्रमाणीकरण
- **⬅️ पिछला**: [आपका पहला प्रोजेक्ट](first-project.md)
- **➡️ अगला अध्याय**: [अध्याय 4: कोड के रूप में इंफ्रास्ट्रक्चर](../deployment/deployment-guide.md)
- **अगला पाठ**: [आपका पहला प्रोजेक्ट](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->