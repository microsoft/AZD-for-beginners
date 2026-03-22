# कॉन्फिगरेशन मार्गदर्शिका

**अध्याय मार्गदर्शन:**
- **📚 अभ्यासक्रम गृहपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 3 - कॉन्फिगरेशन आणि प्रमाणीकरण
- **⬅️ मागील**: [तुमचा पहिला प्रकल्प](first-project.md)
- **➡️ पुढील**: [तैनाती मार्गदर्शिका](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 पुढील अध्याय**: [अध्याय 4: कूट म्हणून इन्फ्रास्ट्रक्चर](../chapter-04-infrastructure/deployment-guide.md)

## परिचय

हा सर्वसमावेशक मार्गदर्शक Azure Developer CLI ची सुसंगत विकास आणि तैनाती कार्यप्रवाहासाठी कॉन्फिगर करण्याच्या सर्व पैलूंवर प्रकाश टाकतो. तुम्ही कॉन्फिगरेशन श्रेणी, पर्यावरण व्यवस्थापन, प्रमाणीकरण पद्धती, आणि प्रगत कॉन्फिगरेशन नमुने याबद्दल शिकाल जे कार्यक्षम आणि सुरक्षित Azure तैनातीस सक्षम करतात.

## शिक्षण उद्दिष्टे

या धड्याच्या शेवटी, तुम्ही:
- azd कॉन्फिगरेशन श्रेणीमध्ये पारंगत व्हाल आणि समजूतदारपणे सेटिंग्ज कशा प्राधान्यक्रमाने असतात हे समजून घ्याल
- जागतिक आणि प्रकल्प-विशिष्ट सेटिंग्ज प्रभावीपणे कॉन्फिगर कराल
- भिन्न कॉन्फिगरेशनसह बहुतेक पर्यावरणे व्यवस्थापित कराल
- सुरक्षित प्रमाणीकरण आणि अनुमती नमुने अमलात आणाल
- गुंतागुंतीच्या परिस्थितीसाठी प्रगत कॉन्फिगरेशन नमुन्यांना समजून घ्याल

## शिक्षण परिणाम

हा धडा पूर्ण केल्यावर, तुम्ही सक्षम असाल:
- सर्वोत्तम विकास कार्यप्रवाहासाठी azd कॉन्फिगर करणे
- अनेक तैनाती पर्यावरणांची स्थापना आणि व्यवस्थापन करणे
- सुरक्षित कॉन्फिगरेशन व्यवस्थापन पद्धती अमलात आणणे
- कॉन्फिगरेशन-संबंधित समस्या निराकरण करणे
- विशिष्ट संस्थात्मक आवश्यकतांसाठी azd वर्तन सानुकूलित करणे

हा सर्वसमावेशक मार्गदर्शक Azure Developer CLI ची सुसंगत विकास आणि तैनाती कार्यप्रवाहासाठी कॉन्फिगर करण्याच्या सर्व पैलूंवर प्रकाश टाकतो.

## azd प्रकल्पातील AI एजंट्स समजून घेणे

जर तुम्हाला AI एजंट्सविषयी नवीन असाल, तर azd जगात त्यांना समजून घेण्याचा सोपा मार्ग येथे आहे.

### एजंट म्हणजे काय?

एजंट हा एक सॉफ्टवेअरचा तुकडा आहे जो विनंती प्राप्त करू शकतो, त्याबद्दल विचार करू शकतो आणि क्रिया करू शकतो—अधिकभागी AI मॉडेल कॉल करणे, डेटा शोधणे किंवा इतर सेवा सुरू करणे. azd प्रकल्पात, एजंट तुमच्या वेब फ्रंटेंड किंवा API बॅकएंडसारख्या आणखी एका **सेवा** सारखे आहे.

### एजंट azd प्रकल्प रचनेत कसा बसतो

azd प्रकल्प तीन स्तरांनी बनलेला आहे: **इन्फ्रास्ट्रक्चर**, **कोड**, आणि **कॉन्फिगरेशन**. एजंट हे या स्तरांमध्ये इतर कोणत्याही सेवेप्रमाणे जोडले जातात:

| स्तर | पारंपरिक अॅपसाठी काय करते | एजंटसाठी काय करते |
|-------|----------------------------|---------------------|
| **इन्फ्रास्ट्रक्चर** (`infra/`) | वेब अॅप आणि डेटाबेस तयार करते | AI मॉडेल एंडपॉइंट, शोध अनुक्रमणिका, किंवा एजंट होस्ट तयार करते |
| **कोड** (`src/`) | तुमचा फ्रंटेंड आणि API स्त्रोत कोड असतो | तुमचा एजंट लॉजिक आणि प्रॉम्प्ट संकल्पना असतात |
| **कॉन्फिगरेशन** (`azure.yaml`) | तुमच्या सेवा आणि त्यांचे होस्टिंग लक्षात ठेवते | तुमचा एजंट सेवा म्हणून सूचीत करते, त्याचा कोड आणि होस्ट दर्शवते |

### `azure.yaml` ची भूमिका

तुम्हाला सध्या साक्षात्कारांच्या व्याकरणाची आठवण ठेवण्याची गरज नाही. संकल्पनात्मकदृष्ट्या, `azure.yaml` ही फाइल आहे जिथे तुम्ही azd ला सांगता: *"मेरी अॅप्लिकेशनमध्ये कोणकोणत्या सेवा आहेत आणि त्यांचा कोड कुठे आहे."*

जेव्हा तुमच्या प्रकल्पात AI एजंट समाविष्ट असतो, तेव्हा `azure.yaml` फक्त त्या एजंटला सेवा म्हणून सूचीबद्ध करतो. मग azd योग्य इन्फ्रास्ट्रक्चर (जसे Microsoft Foundry Models एंडपॉइंट किंवा एजंट होस्ट करण्यासाठी कंटेनर अॅप) तयार करतो आणि तुमचा एजंट कोड तैनात करतो—जसे की हे वेब अॅप किंवा API साठी करतो.

याचा अर्थ असा की शिकण्यासाठी काही मूलभूत नवीन नाही. तुम्ही कसे azd वेब सेवा व्यवस्थापित करतो हे समजलात, तर तुम्हाला अजूनच एजंट कसा व्यवस्थापित करतो हे कळेल.

## कॉन्फिगरेशन श्रेणी

azd एक श्रेणीनुसार कॉन्फिगरेशन प्रणाली वापरते:
1. **कमांड-लाइन फ्लॅग्ज** (सर्वोच्च प्राधान्य)
2. **पर्यावरण चल (Environment Variables)**
3. **स्थानिक प्रकल्प कॉन्फिगरेशन** (`.azd/config.json`)
4. **जागतिक वापरकर्ता कॉन्फिगरेशन** (`~/.azd/config.json`)
5. **डीफॉल्ट मूल्ये** (कमी प्राधान्य)

## जागतिक कॉन्फिगरेशन

### जागतिक डीफॉल्ट्स सेट करणे
```bash
# डीफॉल्ट सदस्यता सेट करा
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# डीफॉल्ट स्थान सेट करा
azd config set defaults.location "eastus2"

# डीफॉल्ट रिसोर्स ग्रुप नामकरण पद्धत सेट करा
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# सर्व जागतिक कॉन्फिगरेशन पहा
azd config list

# एक कॉन्फिगरेशन काढा
azd config unset defaults.location
```

### सामान्य जागतिक सेटिंग्ज
```bash
# विकास प्राधान्ये
azd config set alpha.enable true                    # अल्फा वैशिष्ट्ये सक्षम करा
azd config set telemetry.enabled false             # टेलिमेट्री अक्षम करा
azd config set output.format json                  # आउटपुट फॉरमॅट सेट करा

# सुरक्षा सेटिंग्ज
azd config set auth.useAzureCliCredential true     # प्रमाणीकरणासाठी Azure CLI वापरा
azd config set tls.insecure false                  # TLS पडताळणी लागू करा

# कार्यप्रदर्शन ट्यूनिंग
azd config set provision.parallelism 5             # समांतर संसाधन निर्मिती
azd config set deploy.timeout 30m                  # परिनियोजन वेळमर्यादा
```

## 🏗️ प्रकल्प कॉन्फिगरेशन

### azure.yaml चे रचना
`azure.yaml` फाइल तुमच्या azd प्रकल्पाचा केंद्रबिंदू आहे:

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

### पर्यावरण तयार करणे
```bash
# नवीन पर्यावरण तयार करा
azd env new development

# विशिष्ट ठिकाणी तयार करा
azd env new staging --location "westus2"

# साचा वापरून तयार करा
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

### पर्यावरण चल
```bash
# पर्यावरण-विशिष्ट चल सेट करा
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# पर्यावरण चल पहा
azd env get-values

# अपेक्षित आउटपुट:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# पर्यावरण चल काढा
azd env unset DEBUG

# काढले गेले आहे याची खात्री करा
azd env get-values | grep DEBUG
# (काहीही परत येऊ नये)
```

### पर्यावरण साच्यांचे तयार करणे
सुसंगत पर्यावरण सेटअपसाठी `.azure/env.template` तयार करा:
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
# Azure CLI प्रमाणपत्रे वापरा (डीफॉल्ट)
azd config set auth.useAzureCliCredential true

# विशिष्ट टेनंटने लॉगिन करा
az login --tenant <tenant-id>

# डीफॉल्ट सदस्यता सेट करा
az account set --subscription <subscription-id>
```

### सेवा प्राचार्य प्रमाणीकरण
CI/CD पाईपलाइनसाठी:
```bash
# पर्यावरणातील चल सेट करा
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# किंवा थेट कॉन्फिगर करा
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### व्यवस्थापित ओळख (Managed Identity)
Azure-होस्ट केलेल्या पर्यावरणासाठी:
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
Terraform प्रकल्पांसाठी `infra/terraform.tfvars` मध्ये कॉन्फिगर करा:
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

### सानुकूल संसाधन नामकरण
```bash
# नामांकनाच्या संहितांची सेटिंग करा
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

### निरीक्षण कॉन्फिगरेशन
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

## 🎯 पर्यावरण-विशिष्ट कॉन्फिगरेशन

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

## 🔍 कॉन्फिगरेशन वैधता तपासणी

### कॉन्फिगरेशन वैधता तपासा
```bash
# संरचना वाक्यरचना तपासा
azd config validate

# चाचणी पर्यावरण बदल तपासा
azd env get-values

# मूलभूत सुविधा पडताळा
azd provision --dry-run
```

### कॉन्फिगरेशन स्क्रिप्ट्स
`scripts/` मध्ये तपासणी स्क्रिप्ट तयार करा:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# आवश्यक वातावरण चल तपासा
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml वाक्यरचना तपासा
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 सर्वोत्तम पद्धती

### 1. पर्यावरण चल वापरा
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. कॉन्फिगरेशन फाइल्सचे आयोजन करा
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

### 3. आवृत्ती नियंत्रण लक्षात ठेवा
```bash
# .gitignore
.azure/*/config.json         # पर्यावरण कॉन्फिगर (स्त्रोत आयडीस समाविष्ट)
.azure/*/.env               # पर्यावरण चल (गुपिते असू शकतात)
.env                        # स्थानिक पर्यावरण फाइल
```

### 4. कॉन्फिगरेशन कागदपत्रीकरण
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

## 🎯 व्यावहारिक सराव सराव

### सराव 1: मल्टी-पर्यावरण कॉन्फिगरेशन (15 मिनिटे)

**उद्दिष्ट:** वेगवेगळ्या सेटिंग्जसह तीन पर्यावरण तयार करा आणि कॉन्फिगर करा

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

# प्रत्येक वातावरण तपासा
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**यशाची निकषे:**
- [ ] तीन पर्यावरण यशस्वीपणे तयार केले
- [ ] प्रत्येक पर्यावरणाची वेगळी कॉन्फिगरेशन आहे
- [ ] त्रुटीशिवाय पर्यावरणांमध्ये बदल केला जाऊ शकतो
- [ ] `azd env list` सर्व तीन पर्यावरण दाखवते

### सराव 2: गुपित व्यवस्थापन (10 मिनिटे)

**उद्दिष्ट:** संवेदनशील डेटासाठी सुरक्षित कॉन्फिगरेशन प्रॅक्टिस करा

```bash
# रहस्य सेट करा (आउटपुटमध्ये दाखवले जात नाही)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# गुप्त नसलेली कॉन्फिग सेट करा
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# पर्यावरण पाहा (रहस्ये ठेऊ केली पाहिजेत)
azd env get-values

# रहस्ये साठवलेली आहेत की नाही याची पडताळणी करा
azd env get DB_PASSWORD  # खरी किंमत दाखवली पाहिजे
```

**यशाची निकषे:**
- [ ] गुपिते टर्मिनलमध्ये न दिसता संग्रहित केली गेली
- [ ] `azd env get-values` मध्ये लालित गुपिते दाखवली जातात
- [ ] स्वतंत्र `azd env get <SECRET_NAME>` वास्तविक मूल्य प्राप्त करतो

## पुढील पावले

- [तुमचा पहिला प्रकल्प](first-project.md) - प्रत्यक्षात कॉन्फिगरेशन लागू करा
- [तैनाती मार्गदर्शिका](../chapter-04-infrastructure/deployment-guide.md) - तैनातीसाठी कॉन्फिगरेशन वापरा
- [संसाधने पुरवठा करणे](../chapter-04-infrastructure/provisioning.md) - उत्पादन-तयार कॉन्फिगरेशन

## संदर्भ

- [azd कॉन्फिगरेशन संदर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml योजना](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [पर्यावरण चल](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**अध्याय मार्गदर्शन:**
- **📚 अभ्यासक्रम गृहपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 3 - कॉन्फिगरेशन आणि प्रमाणीकरण
- **⬅️ मागील**: [तुमचा पहिला प्रकल्प](first-project.md)
- **➡️ पुढील अध्याय**: [अध्याय 4: कूट म्हणून इन्फ्रास्ट्रक्चर](../chapter-04-infrastructure/deployment-guide.md)
- **पुढील धडा**: [तुमचा पहिला प्रकल्प](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज एआय अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात ठेवा की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेतील त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवादाचा सल्ला दिला जातो. या अनुवादाच्या वापरामुळे झालेल्या कोणत्याही गैरसमजुती किंवा वाक्प्रचारांसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->