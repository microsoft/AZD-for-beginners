# कॉन्फिगरेशन मार्गदर्शक

**अध्याय नेव्हिगेशन:**
- **📚 Course Home**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 Current Chapter**: अध्याय 3 - कॉन्फिगरेशन आणि प्रमाणीकरण
- **⬅️ Previous**: [तुमचे पहिले प्रकल्प](first-project.md)
- **➡️ Next**: [तैनाती मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [अध्याय 4: कोड म्हणून अवसंरचना](../chapter-04-infrastructure/deployment-guide.md)

## परिचय

हा सर्वसमावेशक मार्गदर्शक Azure Developer CLI च्या कॉन्फिगरेशनचे सर्व पैलू समाविष्ट करतो, जे विकास आणि तैनातीच्या कार्यप्रवाहांसाठी अनुकूल आहेत. आपण कॉन्फिगरेशन श्रेणीक्रम, वातावरण व्यवस्थापन, प्रमाणीकरण पद्धती, आणि कार्यक्षम व सुरक्षित Azure तैनाती सक्षम करणाऱ्या प्रगत कॉन्फिगरेशन पद्धती याबद्दल शिका.

## शिक्षणाचे उद्दिष्टे

या धड्याच्या शेवटी आपण:
- azd कॉन्फिगरेशन श्रेणीक्रमात पारंगत व्हाल आणि सेटिंग्ज कशा प्राधान्याने वापरल्या जातात हे समजून घ्याल
- ग्लोबल आणि प्रकल्प-विशिष्ट सेटिंग्ज प्रभावीपणे कॉन्फिगर करू शकाल
- विविध कॉन्फिगरेशनसह एकाधिक वातावरणे व्यवस्थापित करू शकाल
- सुरक्षित प्रमाणीकरण आणि प्राधिकरण पॅटर्न लागू करू शकाल
- गुंतागुंतीच्या परिस्थितीसाठी प्रगत कॉन्फिगरेशन पॅटर्न समजून घेऊ शकाल

## शिकण्याचे परिणाम

हा धडा पूर्ण केल्यानंतर, आपण सक्षम असाल:
- विकास कार्यप्रवाहांसाठी azd कॉन्फिगर करणे
- एकाधिक तैनाती वातावरण सेट अप आणि व्यवस्थापित करणे
- सुरक्षित कॉन्फिगरेशन व्यवस्थापन पद्धती लागू करणे
- कॉन्फिगरेशन-संबंधित समस्या निवारण करणे
- विशिष्ट संस्थात्मक गरजांसाठी azd वर्तन सानुकूल करणे

हा सर्वसमावेशक मार्गदर्शक Azure Developer CLI च्या कॉन्फिगरेशनचे सर्व पैलू समाविष्ट करतो, जे विकास आणि तैनातीच्या कार्यप्रवाहांसाठी अनुकूल आहेत.

## azd प्रकल्पातील AI एजंट्स समजून घेणे

जर आपल्याला AI एजंट्सबद्दल नवीन असाल, तर azd वातावरणात त्यांना कसे समजावे याचा एक सोपा मार्ग येथे आहे.

### एजंट म्हणजे काय?

एजंट हा सॉफ्टवेअरचा एक घटक आहे जो विनंती स्वीकारू शकतो, त्याबद्दल विचार करू शकतो आणि क्रिया करू शकतो—बहुधा AI मॉडेलला कॉल करून, डेटा शोधून किंवा इतर सेवांना कॉल करून. azd प्रकल्पात, एजंट हा आपल्या वेब फ्रंटएंड किंवा API बॅकएंडसह एक दुसरी **सेवा** आहे.

### एजंट्स azd प्रकल्प संरचनेत कसे बसतात

azd प्रकल्प तीन स्तरांनी बनलेला असतो: **इन्फ्रास्ट्रक्चर**, **कोड**, आणि **कॉन्फिगरेशन**. एजंट्स हे इतर कोणत्याही सेवेप्रमाणेच या स्तरांमध्ये समाविष्ट होतात:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **इन्फ्रास्ट्रक्चर** (`infra/`) | वेब अॅप आणि डेटाबेस पुरवतो | AI मॉडेल एन्डपॉइंट, शोध निर्देशांक, किंवा एजंट होस्ट पुरवतो |
| **कोड** (`src/`) | आपले फ्रंटएंड आणि API स्रोत कोड यात समाविष्ट असतो | आपल्या एजंट लॉजिक आणि प्रॉम्प्ट व्याख्या यात असतात |
| **कॉन्फिगरेशन** (`azure.yaml`) | आपल्या सेवांची आणि त्यांच्या होस्टिंग लक्ष्यांची यादी | आपल्या एजंटला सेवेमध्ये सूचीबद्ध करते, जो त्याच्या कोड आणि होस्टकडे निर्देशतो |

### `azure.yaml` ची भूमिका

आपण आत्ता syntax लक्षात ठेवण्याची गरज नाही. संकल्पनेने, `azure.yaml` हा फाईल आहे ज्यात आपण azd ला सांगता: *"हे माझ्या अॅप्लिकेशनचे घटक असलेली सेवा आहेत, आणि येथे त्यांचा कोड कुठे आहे."*

जेव्हा आपल्या प्रकल्पात AI एजंट असतो, तेव्हा `azure.yaml` फक्त त्या एजंटला सेवांपैकी एक म्हणून सूचीबद्ध करते. azd नंतर योग्य इन्फ्रास्ट्रक्चर (उदा. Microsoft Foundry Models endpoint किंवा एजंट होस्ट करण्यासाठी Container App) पुरवते आणि आपल्या एजंट कोडचे डिप्लॉयमेंट करते—जसे ते वेब अॅप किंवा API साठी करेल.

याचा अर्थ मूलभूतदृष्ट्या काही नवीन शिकण्यासारखे नाही. आपल्याला azd कसे वेब सेवा व्यवस्थापित करते हे समजल्यास, आपण आधीच समजता की ते एजंट कसे व्यवस्थापित करते.

## कॉन्फिगरेशन श्रेणीक्रम

azd खालील प्रमाणे श्रेणीक्रम आधारित कॉन्फिगरेशन वापरते:
1. **कमांड-लाइन फ्लॅग** (सर्वोच्च प्राधान्य)
2. **पर्यावरण चल**
3. **स्थानिक प्रकल्प कॉन्फिगरेशन** (`.azd/config.json`)
4. **ग्लोबल वापरकर्ता कॉन्फिगरेशन** (`~/.azd/config.json`)
5. **डिफॉल्ट मूल्ये** (सर्वात कमी प्राधान्य)

## जागतिक कॉन्फिगरेशन

### जागतिक पूर्वनिर्धारित सेट करणे
```bash
# पूर्वनिर्धारित सदस्यता सेट करा
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# पूर्वनिर्धारित स्थान सेट करा
azd config set defaults.location "eastus2"

# पूर्वनिर्धारित संसाधन गट नावकरण पद्धत सेट करा
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# सर्व जागतिक कॉन्फिगरेशन पहा
azd config show

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

# कार्यक्षमता समायोजन
azd config set provision.parallelism 5             # समांतर संसाधन निर्मिती
azd config set deploy.timeout 30m                  # परिनियोजन वेळमर्यादा
```

## 🏗️ प्रकल्प कॉन्फिगरेशन

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

### सेवा कॉन्फिगरेशन विकल्प

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

## 🌟 वातावरण व्यवस्थापन

### वातावरण तयार करणे
```bash
# नवीन वातावरण तयार करा
azd env new development

# विशिष्ट स्थानासह तयार करा
azd env new staging --location "westus2"

# साच्यातून तयार करा
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### वातावरण कॉन्फिगरेशन
प्रत्येक वातावरणाची स्वतःची कॉन्फिगरेशन `.azure/<env-name>/config.json` मध्ये असते:

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

### वातावरण चल
```bash
# पर्यावरण-विशिष्ट चल सेट करा
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# पर्यावरणातील चल पहा
azd env get-values

# अपेक्षित आउटपुट:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# पर्यावरण चल काढा
azd env unset DEBUG

# काढले गेले आहे याची पडताळणी करा
azd env get-values | grep DEBUG
# (काहीही परत करणार नाही)
```

### वातावरण टेम्पलेट्स
सुसंगत वातावरण सेटअपसाठी `.azure/env.template` तयार करा:
```bash
# आवश्यक चल
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# अनुप्रयोग सेटिंग्ज
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ऐच्छिक विकास सेटिंग्ज
DEBUG=false
LOG_LEVEL=info
```

## 🔐 प्रमाणीकरण कॉन्फिगरेशन

### Azure CLI एकत्रीकरण
```bash
# Azure CLI क्रेडेन्शियल वापरा (डिफॉल्ट)
azd config set auth.useAzureCliCredential true

# विशिष्ट टेनॅन्टसह लॉगिन करा
az login --tenant <tenant-id>

# डिफॉल्ट सदस्यता सेट करा
az account set --subscription <subscription-id>
```

### सर्व्हिस प्रिन्सिपल प्रमाणीकरण
CI/CD पाईपलाइन्ससाठी:
```bash
# पर्यावरण चल सेट करा
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# किंवा थेट संरचीत करा
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### व्यवस्थापित ओळख
Azure-होस्ट केलेल्या वातावरणांसाठी:
```bash
# व्यवस्थापित ओळख प्रमाणीकरण सक्षम करा
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ इन्फ्रास्ट्रक्चर कॉन्फिगरेशन

### Bicep पॅरामीटर्स
इन्फ्रास्ट्रक्चर पॅरामीटर्स `infra/main.parameters.json` मध्ये कॉन्फिगर करा:
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

## 🚀 तैनाती कॉन्फिगरेशन

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

### सानुकूल रिसोर्स नावे
```bash
# नावकरणाचे नियम ठेवा
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

## 🎯 वातावरण-विशिष्ट कॉन्फिगरेशन

### विकास वातावरण
```bash
# .azure/development/.env
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

### उत्पादन वातावरण
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 कॉन्फिगरेशन वैधता

### कॉन्फिगरेशन सत्यापित करा
```bash
# कॉन्फिगरेशनचे सिंटॅक्स तपासा
azd config validate

# पर्यावरण चलांची चाचणी करा
azd env get-values

# पायाभूत संरचना सत्यापित करा
azd provision --dry-run
```

### कॉन्फिगरेशन स्क्रिप्ट
`scripts/` मध्ये सत्यापन स्क्रिप्ट तयार करा:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# आवश्यक पर्यावरणीय चल तपासा
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml ची वाक्यरचना तपासा
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 सर्वोत्तम पद्धती

### 1. वातावरण वेरिएबल्स वापरा
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. कॉन्फिगरेशन फायलींना व्यवस्थित करा
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

### 3. व्हर्जन कंट्रोल विचार
```bash
# .gitignore
.azure/*/config.json         # पर्यावरण कॉन्फिग्स (संसाधन आयडी समाविष्ट करतात)
.azure/*/.env               # पर्यावरण चल (गुप्त माहिती असू शकतात)
.env                        # स्थानिक पर्यावरण फाइल
```

### 4. कॉन्फिगरेशन दस्तऐवजीकरण
आपली कॉन्फिगरेशन `CONFIG.md` मध्ये दस्तऐवजीकरण करा:
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

## 🎯 व्यावहारिक सराव व्यायाम

### व्यायाम 1: बहु-वातावरण कॉन्फिगरेशन (15 मिनिटे)

**उद्दिष्ट**: वेगवेगळ्या सेटिंग्जसह तीन वातावरण तयार करा आणि कॉन्फिगर करा

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

# प्रत्येक वातावरणाची पडताळणी करा
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**यश निकष:**
- [ ] तीन वातावरण यशस्वीरित्या तयार झाली
- [ ] प्रत्येक वातावरणाची वेगळी कॉन्फिगरेशन आहे
- [ ] वातावरणांमध्ये त्रुटीशिवाय स्विच करता येते
- [ ] `azd env list` सर्व तीन वातावरण दाखवते

### व्यायाम 2: गोपनीयता व्यवस्थापन (10 मिनिटे)

**उद्दिष्ट**: संवेदनशील डेटासह सुरक्षित कॉन्फिगरेशनचे सराव करा

```bash
# गुपिते सेट करा (आउटपुटमध्ये दाखवली जाणार नाहीत)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# गैर-गुप्त कॉन्फिग सेट करा
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# पर्यावरण पहा (गुपिते लपवलेली असावीत)
azd env get-values

# गुपिते साठवले असल्याची पडताळणी करा
azd env get DB_PASSWORD  # वास्तविक मूल्य दाखवले पाहिजे
```

**यश निकष:**
- [ ] गोपनीय माहिती टर्मिनलमध्ये न दिसता साठवली गेली आहे
- [ ] `azd env get-values` लपवलेली सीक्रेट्स दाखवते
- [ ] वैयक्तिक `azd env get <SECRET_NAME>` वास्तविक मूल्य परत करते

## पुढील पावले

- [तुमचे पहिले प्रकल्प](first-project.md) - प्रत्यक्षात कॉन्फिगरेशन लागू करा
- [तैनाती मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md) - तैनातीसाठी कॉन्फिगरेशन वापरा
- [संसाधने पुरवठा](../chapter-04-infrastructure/provisioning.md) - उत्पादन-तयार कॉन्फिगरेशन

## संदर्भ

- [azd कॉन्फिगरेशन संदर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml स्कीमा](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [पर्यावरण चल](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**अध्याय नेव्हिगेशन:**
- **📚 Course Home**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 Current Chapter**: अध्याय 3 - कॉन्फिगरेशन आणि प्रमाणीकरण
- **⬅️ Previous**: [तुमचे पहिले प्रकल्प](first-project.md)
- **➡️ Next Chapter**: [अध्याय 4: कोड म्हणून अवसंरचना](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [तुमचे पहिले प्रकल्प](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
हा दस्तऐवज एआय अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, तरीही कृपया लक्षात ठेवा की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेतील त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत म्हणून मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमजुतींसाठी किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->