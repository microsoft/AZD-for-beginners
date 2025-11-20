<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8399160e4ce8c3eb6fd5d831f6602e18",
  "translation_date": "2025-11-20T13:22:55+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "mr"
}
-->
# कॉन्फिगरेशन मार्गदर्शक

**प्रकरण नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू प्रकरण**: प्रकरण 3 - कॉन्फिगरेशन आणि प्रमाणीकरण
- **⬅️ मागील**: [तुमचा पहिला प्रकल्प](first-project.md)
- **➡️ पुढील**: [डिप्लॉयमेंट मार्गदर्शक](../deployment/deployment-guide.md)
- **🚀 पुढील प्रकरण**: [प्रकरण 4: कोड म्हणून इन्फ्रास्ट्रक्चर](../deployment/deployment-guide.md)

## परिचय

हा सविस्तर मार्गदर्शक Azure Developer CLI च्या कॉन्फिगरेशनच्या सर्व पैलूंवर प्रकाश टाकतो, ज्यामुळे विकास आणि डिप्लॉयमेंट वर्कफ्लो अधिक कार्यक्षम होतो. तुम्ही कॉन्फिगरेशन हायरार्की, पर्यावरण व्यवस्थापन, प्रमाणीकरण पद्धती आणि प्रगत कॉन्फिगरेशन पॅटर्न शिकाल, जे Azure डिप्लॉयमेंटसाठी सुरक्षितता आणि कार्यक्षमता सुनिश्चित करतात.

## शिकण्याची उद्दिष्टे

या धड्याच्या शेवटी, तुम्ही:
- azd कॉन्फिगरेशन हायरार्कीमध्ये प्राविण्य मिळवाल आणि सेटिंग्ज कशा प्राधान्य दिल्या जातात हे समजून घ्याल
- जागतिक आणि प्रकल्प-विशिष्ट सेटिंग्ज प्रभावीपणे कॉन्फिगर कराल
- वेगवेगळ्या कॉन्फिगरेशनसह एकाधिक पर्यावरणे व्यवस्थापित कराल
- सुरक्षित प्रमाणीकरण आणि अधिकृतता पॅटर्न लागू कराल
- जटिल परिस्थितीसाठी प्रगत कॉन्फिगरेशन पॅटर्न समजून घ्याल

## शिकण्याचे परिणाम

हा धडा पूर्ण केल्यानंतर, तुम्ही:
- विकास वर्कफ्लोसाठी azd कॉन्फिगर करू शकाल
- एकाधिक डिप्लॉयमेंट पर्यावरणे सेट अप आणि व्यवस्थापित करू शकाल
- सुरक्षित कॉन्फिगरेशन व्यवस्थापन पद्धती लागू करू शकाल
- कॉन्फिगरेशनशी संबंधित समस्या सोडवू शकाल
- विशिष्ट संस्थात्मक गरजांसाठी azd चा वर्तन सानुकूलित करू शकाल

हा सविस्तर मार्गदर्शक Azure Developer CLI च्या कॉन्फिगरेशनच्या सर्व पैलूंवर प्रकाश टाकतो, ज्यामुळे विकास आणि डिप्लॉयमेंट वर्कफ्लो अधिक कार्यक्षम होतो.

## कॉन्फिगरेशन हायरार्की

azd एक हायरार्किकल कॉन्फिगरेशन प्रणाली वापरतो:
1. **कमांड-लाइन फ्लॅग्स** (सर्वोच्च प्राधान्य)
2. **पर्यावरणीय व्हेरिएबल्स**
3. **स्थानिक प्रकल्प कॉन्फिगरेशन** (`.azd/config.json`)
4. **जागतिक वापरकर्ता कॉन्फिगरेशन** (`~/.azd/config.json`)
5. **डीफॉल्ट मूल्ये** (सर्वात कमी प्राधान्य)

## जागतिक कॉन्फिगरेशन

### जागतिक डीफॉल्ट्स सेट करणे
```bash
# डीफॉल्ट सदस्यता सेट करा
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# डीफॉल्ट स्थान सेट करा
azd config set defaults.location "eastus2"

# डीफॉल्ट संसाधन गट नामकरण पद्धत सेट करा
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# सर्व जागतिक कॉन्फिगरेशन पहा
azd config list

# कॉन्फिगरेशन काढा
azd config unset defaults.location
```

### सामान्य जागतिक सेटिंग्ज
```bash
# विकास प्राधान्ये
azd config set alpha.enable true                    # अल्फा वैशिष्ट्ये सक्षम करा
azd config set telemetry.enabled false             # टेलीमेट्री अक्षम करा
azd config set output.format json                  # आउटपुट स्वरूप सेट करा

# सुरक्षा सेटिंग्ज
azd config set auth.useAzureCliCredential true     # प्रमाणीकरणासाठी Azure CLI वापरा
azd config set tls.insecure false                  # TLS पडताळणी लागू करा

# कार्यक्षमता ट्यूनिंग
azd config set provision.parallelism 5             # समांतर संसाधन निर्मिती
azd config set deploy.timeout 30m                  # उपयोजन वेळमर्यादा
```

## 🏗️ प्रकल्प कॉन्फिगरेशन

### azure.yaml रचना
`azure.yaml` फाइल तुमच्या azd प्रकल्पाचे केंद्र आहे:

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

### सेवा कॉन्फिगरेशन पर्याय

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

#### भाषा-विशिष्ट सेटिंग्ज
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

## 🌟 पर्यावरण व्यवस्थापन

### पर्यावरणे तयार करणे
```bash
# नवीन वातावरण तयार करा
azd env new development

# विशिष्ट स्थानासह तयार करा
azd env new staging --location "westus2"

# टेम्पलेटमधून तयार करा
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### पर्यावरण कॉन्फिगरेशन
प्रत्येक पर्यावरणाचे स्वतःचे कॉन्फिगरेशन `.azure/<env-name>/config.json` मध्ये असते:

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

### पर्यावरणीय व्हेरिएबल्स
```bash
# पर्यावरण-विशिष्ट व्हेरिएबल्स सेट करा
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# पर्यावरण व्हेरिएबल्स पहा
azd env get-values

# अपेक्षित आउटपुट:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=गुप्त-api-key
# DEBUG=true

# पर्यावरण व्हेरिएबल काढा
azd env unset DEBUG

# काढण्याची पुष्टी करा
azd env get-values | grep DEBUG
# (काहीही परत येऊ नये)
```

### पर्यावरण टेम्पलेट्स
सुसंगत पर्यावरण सेटअपसाठी `.azure/env.template` तयार करा:
```bash
# आवश्यक चल
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# अनुप्रयोग सेटिंग्ज
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# पर्यायी विकास सेटिंग्ज
DEBUG=false
LOG_LEVEL=info
```

## 🔐 प्रमाणीकरण कॉन्फिगरेशन

### Azure CLI एकत्रीकरण
```bash
# Azure CLI क्रेडेन्शियल्स (डिफॉल्ट) वापरा
azd config set auth.useAzureCliCredential true

# विशिष्ट टेनंटसह लॉगिन करा
az login --tenant <tenant-id>

# डिफॉल्ट सबस्क्रिप्शन सेट करा
az account set --subscription <subscription-id>
```

### सेवा प्रिन्सिपल प्रमाणीकरण
CI/CD पाईपलाइन्ससाठी:
```bash
# पर्यावरण व्हेरिएबल्स सेट करा
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# किंवा थेट कॉन्फिगर करा
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### व्यवस्थापित ओळख
Azure-होस्टेड पर्यावरणांसाठी:
```bash
# व्यवस्थापित ओळख प्रमाणीकरण सक्षम करा
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ इन्फ्रास्ट्रक्चर कॉन्फिगरेशन

### Bicep पॅरामीटर्स
`infra/main.parameters.json` मध्ये इन्फ्रास्ट्रक्चर पॅरामीटर्स कॉन्फिगर करा:
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

### Terraform कॉन्फिगरेशन
Terraform प्रकल्पांसाठी, `infra/terraform.tfvars` मध्ये कॉन्फिगर करा:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 डिप्लॉयमेंट कॉन्फिगरेशन

### बिल्ड कॉन्फिगरेशन
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

### Docker कॉन्फिगरेशन
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

## 🔧 प्रगत कॉन्फिगरेशन

### सानुकूल संसाधन नामकरण
```bash
# नामकरण परंपरा सेट करा
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### नेटवर्क कॉन्फिगरेशन
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### मॉनिटरिंग कॉन्फिगरेशन
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

## 🎯 पर्यावरण-विशिष्ट कॉन्फिगरेशन्स

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

## 🔍 कॉन्फिगरेशन पडताळणी

### कॉन्फिगरेशन पडताळा
```bash
# कॉन्फिगरेशन सिंटॅक्स तपासा
azd config validate

# पर्यावरण व्हेरिएबल्स चाचणी करा
azd env get-values

# पायाभूत सुविधा सत्यापित करा
azd provision --dry-run
```

### कॉन्फिगरेशन स्क्रिप्ट्स
`scripts/` मध्ये पडताळणी स्क्रिप्ट्स तयार करा:

```bash
#!/bin/bash
# स्क्रिप्ट्स/validate-config.sh

echo "Validating configuration..."

# आवश्यक पर्यावरण व्हेरिएबल्स तपासा
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml सिंटॅक्स सत्यापित करा
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 सर्वोत्तम पद्धती

### 1. पर्यावरणीय व्हेरिएबल्स वापरा
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. कॉन्फिगरेशन फाइल्स व्यवस्थित करा
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

### 3. आवृत्ती नियंत्रण विचार
```bash
# .gitignore
.azure/*/config.json         # पर्यावरण कॉन्फिग्स (संसाधन आयडी समाविष्ट करतात)
.azure/*/.env               # पर्यावरण व्हेरिएबल्स (गुपिते समाविष्ट असू शकतात)
.env                        # स्थानिक पर्यावरण फाइल
```

### 4. कॉन्फिगरेशन दस्तऐवजीकरण
तुमच्या कॉन्फिगरेशनचे दस्तऐवजीकरण `CONFIG.md` मध्ये करा:
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

## 🎯 प्रॅक्टिकल सराव व्यायाम

### व्यायाम 1: मल्टी-पर्यावरण कॉन्फिगरेशन (15 मिनिटे)

**उद्दिष्ट**: वेगवेगळ्या सेटिंग्जसह तीन पर्यावरणे तयार करा आणि कॉन्फिगर करा

```bash
# विकास वातावरण तयार करा
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# स्टेजिंग वातावरण तयार करा
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# उत्पादन वातावरण तयार करा
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# प्रत्येक वातावरण सत्यापित करा
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**यशस्वी निकष:**
- [ ] तीन पर्यावरणे यशस्वीरित्या तयार केली
- [ ] प्रत्येक पर्यावरणाचे अद्वितीय कॉन्फिगरेशन आहे
- [ ] पर्यावरणांमध्ये त्रुटीशिवाय स्विच करू शकता
- [ ] `azd env list` सर्व तीन पर्यावरणे दर्शवते

### व्यायाम 2: गुपित व्यवस्थापन (10 मिनिटे)

**उद्दिष्ट**: संवेदनशील डेटासह सुरक्षित कॉन्फिगरेशनचा सराव करा

```bash
# गुपिते सेट करा (आउटपुटमध्ये प्रदर्शित नाही)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# गैर-गुपित कॉन्फिग सेट करा
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# वातावरण पहा (गुपिते लपवलेली असावीत)
azd env get-values

# गुपिते संग्रहित आहेत याची खात्री करा
azd env get DB_PASSWORD  # वास्तविक मूल्य दर्शवले पाहिजे
```

**यशस्वी निकष:**
- [ ] गुपिते टर्मिनलमध्ये न दाखवता संग्रहित केली
- [ ] `azd env get-values` गुपिते लपवलेली दर्शवते
- [ ] वैयक्तिक `azd env get <SECRET_NAME>` वास्तविक मूल्य पुनर्प्राप्त करते

## पुढील पावले

- [तुमचा पहिला प्रकल्प](first-project.md) - कॉन्फिगरेशन प्रत्यक्षात लागू करा
- [डिप्लॉयमेंट मार्गदर्शक](../deployment/deployment-guide.md) - डिप्लॉयमेंटसाठी कॉन्फिगरेशन वापरा
- [संसाधने प्रोव्हिजन करणे](../deployment/provisioning.md) - उत्पादन-तयार कॉन्फिगरेशन्स

## संदर्भ

- [azd कॉन्फिगरेशन संदर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml स्कीमा](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [पर्यावरणीय व्हेरिएबल्स](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**प्रकरण नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू प्रकरण**: प्रकरण 3 - कॉन्फिगरेशन आणि प्रमाणीकरण
- **⬅️ मागील**: [तुमचा पहिला प्रकल्प](first-project.md)
- **➡️ पुढील प्रकरण**: [प्रकरण 4: कोड म्हणून इन्फ्रास्ट्रक्चर](../deployment/deployment-guide.md)
- **पुढील धडा**: [तुमचा पहिला प्रकल्प](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून निर्माण झालेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->