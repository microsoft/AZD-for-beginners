# कॉन्फिगरेशन मार्गदर्शक

**प्रकरण नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान प्रकरण**: प्रकरण 3 - कॉन्फिगरेशन आणि प्रमाणीकरण
- **⬅️ मागील**: [Your First Project](first-project.md)
- **➡️ पुढील**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 पुढील प्रकरण**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## परिचय

हा सर्वसमावेशक मार्गदर्शक Azure Developer CLI साठी कॉन्फिगरेशनचे सर्व पैलू समाविष्ट करतो ज्यामुळे विकास व वितरण कार्यप्रवाह आदर्श प्रकारे केली जाऊ शकते. आपण कॉन्फिगरेशन श्रेणी, पर्यावरण व्यवस्थापन, प्रमाणीकरण पद्धती आणि प्रगत कॉन्फिगरेशन नमुने शिकाल जे प्रभावी आणि सुरक्षित Azure वितरणांना सक्षम करतात.

## शिकण्याचे उद्दिष्ट

या धड्याच्या शेवटी, आपण:
- azd कॉन्फिगरेशन श्रेणी मास्टर कराल आणि समजून घ्याल की सेटिंग्ज कशा प्राधान्याने घेतल्या जातात
- जागतिक आणि प्रकल्प-विशिष्ट सेटिंग्ज प्रभावीपणे कॉन्फिगर कराल
- वेगवेगळ्या कॉन्फिगरेशनसह अनेक पर्यावरणे व्यवस्थापित कराल
- सुरक्षित प्रमाणीकरण आणि प्राधिकरण नमुने लागू कराल
- गुंतागुंतीच्या परिस्थितीसाठी प्रगत कॉन्फिगरेशन नमुने समजून घ्याल

## शिकण्याचे परिणाम

हा धडा पूर्ण केल्यानंतर, आपण सक्षम असाल:
- आदर्श विकास कार्यप्रवाहांसाठी azd कॉन्फिगर करणे
- अनेक वितरण पर्यावरणे सेट अप आणि व्यवस्थापित करणे
- सुरक्षित कॉन्फिगरेशन व्यवस्थापन प्रथा लागू करणे
- कॉन्फिगरेशन-संबंधित समस्या सोडवणे
- विशिष्ट संस्थात्मक गरजांसाठी azd वर्तन सानुकूलित करणे

हा सर्वसमावेशक मार्गदर्शक Azure Developer CLI साठी कॉन्फिगरेशनचे सर्व पैलू समाविष्ट करतो ज्यामुळे विकास व वितरण कार्यप्रवाह आदर्श प्रकारे केली जाऊ शकते.

## azd प्रकल्पातील AI एजंट समजणे

जर आपण AI एजंटसाठी नवीन असाल, तर azd जगात त्यांना सोप्या शब्दांत कसा विचार करायचा ते येथे दिले आहे.

### एजंट म्हणजे काय?

एजंट हा सॉफ्टवेयरचा एक भाग आहे जो विनंती प्राप्त करू शकतो, त्यावर विचार करू शकतो आणि क्रिया करू शकतो—साधारणपणे AI मॉडेल कॉल करून, डेटा शोधून किंवा इतर सेवा वापरून. azd प्रकल्पात, एजंट हा फक्त तुमच्या वेब फ्रंटएंड किंवा API बॅकएंडसाठी असलेल्या **सेवे**सारखा आहे.

### एजंट azd प्रकल्पाच्या रचनेत कसा बसतो

एक azd प्रकल्प तीन स्तरांनी बनलेला आहे: **पायाभूत सुविधा**, **कोड** आणि **कॉन्फिगरेशन**. एजंट या स्तरांमध्ये तशीच जोड होते जशी इतर कोणत्याही सेवेची:

| स्तर | पारंपारिक अ‍ॅपसाठी काय करतो | एजंटसाठी काय करतो |
|-------|-----------------------------|--------------------|
| **पायाभूत सुविधा** (`infra/`) | वेब अ‍ॅप आणि डेटाबेस तयार करतो | AI मॉडेल एंडपॉईंट, शोध निर्देशांक किंवा एजंट होस्ट तयार करतो |
| **कोड** (`src/`) | तुमचा फ्रंटएंड आणि API स्रोत कोड ठेवतो | तुमचा एजंट लॉजिक आणि प्रॉम्प्ट व्याख्याने ठेवतो |
| **कॉन्फिगरेशन** (`azure.yaml`) | तुमच्या सेवा आणि त्यांचे होस्टिंग लक्ष्य सूचीबद्ध करतो | तुमचा एजंट सेवा म्हणून सूचीबद्ध करतो, त्याचा कोड आणि होस्ट दर्शवितो |

### `azure.yaml` ची भूमिका

आपल्याला आत्ता सिंटॅक्स लक्षात ठेवण्याची गरज नाही. संकल्पनात्मकदृष्ट्या, `azure.yaml` ही फाइल आहे जिथे आपण azd ला सांगता: *"हे माझ्या अनुप्रयोगातील सेवांचा भाग आहे आणि कोड कुठे आहे."*

आपल्या प्रकल्पात एखादा AI एजंट समाविष्ट असल्यास, `azure.yaml` फक्त त्या एजंटला सेवा म्हणून सूचीबद्ध करतो. azd नंतर योग्य पायाभूत सुविधा (जसे Microsoft Foundry Models एंडपॉईंट किंवा एजंट होस्ट करण्यासाठी Container App) तयार करतो आणि तुमचा एजंट कोड तशाप्रकारे वितरित करतो—जसे तो वेब अ‍ॅप किंवा API साठी करतो.

याचा अर्थ काहीही मूलतः नवीन शिकण्यासारखे नाही. जर तुम्हाला azd कसे वेब सेवा व्यवस्थापित करते हे समजले, तर तुम्हाला एजंट कसे व्यवस्थापित करतो हे आधीच समजले आहे.

## कॉन्फिगरेशन श्रेणी

azd एक श्रेणीबद्ध कॉन्फिगरेशन प्रणाली वापरतो:
1. **कमांड-लाइन फ्लॅग्स** (सर्वात उच्च प्राधान्य)
2. **पर्यावरण चल**
3. **स्थानिक प्रकल्प कॉन्फिगरेशन** (`.azd/config.json`)
4. **जागतिक वापरकर्ता कॉन्फिगरेशन** (`~/.azd/config.json`)
5. **डिफॉल्ट मूल्ये** (सर्वात कमी प्राधान्य)

## जागतिक कॉन्फिगरेशन

### जागतिक डीफॉल्ट सेटिंग्ज
```bash
# डीफॉल्ट सदस्यता सेट करा
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# डीफॉल्ट स्थान सेट करा
azd config set defaults.location "eastus2"

# डीफॉल्ट संसाधन गटाचे नामकरण परंपरा सेट करा
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
azd config set telemetry.enabled false             # टेलिमेट्री अक्षम करा
azd config set output.format json                  # आउटपुट फॉरमॅट सेट करा

# सुरक्षितता सेटिंग्ज
azd config set auth.useAzureCliCredential true     # प्रमाणीकरणासाठी Azure CLI वापरा
azd config set tls.insecure false                  # TLS पडताळणी लागू करा

# कार्यक्षमता ट्यूनिंग
azd config set provision.parallelism 5             # समांतर संसाधन निर्मिती
azd config set deploy.timeout 30m                  # वितरण वेळमर्यादा
```

## 🏗️ प्रकल्प कॉन्फिगरेशन

### azure.yaml संरचना
`azure.yaml` फाइल तुमच्या azd प्रकल्पाचा मुख्य भाग आहे:

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

#### भाषा विशिष्ट सेटिंग्ज
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

# विशिष्ट स्थानासह तयार करा
azd env new staging --location "westus2"

# टेम्प्लेटमधून तयार करा
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### पर्यावरण कॉन्फिगरेशन
प्रत्येक पर्यावरणाची स्वतःची कॉन्फिगरेशन `.azure/<env-name>/config.json` मध्ये असते:

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

### पर्यावरणीय चल
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

# काढल्याची खात्री करा
azd env get-values | grep DEBUG
# (काहीही परत करू नये)
```

### पर्यावरण टेम्पलेट्स
सुसंगत पर्यावरण सेटअपसाठी `.azure/env.template` तयार करा:
```bash
# आवश्यक व्हेरिएबल्स
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# अर्ज सेटिंग्ज
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ऐच्छिक विकास सेटिंग्ज
DEBUG=false
LOG_LEVEL=info
```

### संघात पर्यावरणे सामायिकरण

जेव्हा एकापेक्षा जास्त व्यक्ती प्रकल्पावर काम करतात, तेव्हा तुम्हाला सहमत व्हावे लागते की **काय रीपो सोबत प्रवास करते आणि काय स्थानिक राहते**. azd प्रत्येक पर्यावरण `.azure/` फोल्डरखाली ठेवतो, आणि त्याचा सगळा भाग कमिट केला जाऊ नये.

**`.azure/` मध्ये काय आहे:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**गिटइनोर काय करावे.** azd ची डीफॉल्ट `.gitignore` आधीच `.azure/` वगळते. तसेच ठेवा—`.env` फाइल्समध्ये गुपिते असू शकतात, आणि संसाधन आयडी कोणाने तयार केला त्याप्रमाणे असतात. प्रत्येक सहकारी स्वतःचे **स्थानिक** पर्यावरण तयार करतो:

```bash
# प्रत्येक विकसक त्यांचा स्वतःचा स्वतंत्र पर्यावरण मिळवण्यासाठी हे एकदा चालवतो
azd env new dev-alice
azd up
```

**पर्यावरणांमध्ये स्विच करणे.** अनेक पर्यावरणे व्यवस्थापित करणारा विकसक आदेश चालवण्यापूर्वी सक्रिय पर्यावरण निवडतो:

```bash
azd env list                 # सर्व स्थानिक वातावरण आणि कोणते डिफॉल्ट आहे ते पाहा
azd env select staging       # 'staging' हे सक्रिय वातावरण बनवा
azd env get-values           # आपण योग्य कडे निर्देशित आहात का हे पडताळा
```

**टीमसाठी गैर-गुप्त डीफॉल्ट पुरवणे.** टेम्पलेट (जसे वरील `.azure/env.template`) कमिट करा ज्यामुळे प्रत्येकजण जाणून घेऊ शकेल कोणते चल सेट करायचे—पण कधीही पूर्ण मूल्ये कमिट करू नका. नवीन सहकारी टेम्पलेट कॉपी करतात आणि स्वतःची माहिती भरतात.

**CI/CD मध्ये पर्यावरणे.** पाइपलाईन तुमचा स्थानिक `.azure/` फोल्डर वाचत नाही. त्याऐवजी, पर्यावरण मूल्ये पाइपलाईन चल/गुपित म्हणून द्या, आणि azd ती प्रक्रियेच्या पर्यावरणात वाचतो:

```bash
# CI मध्ये, azd हे .azure/ मधून नाही तर पर्यावरणातून वाचते.
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **नियम:** पायाभूत सुविधा कोड (`infra/`, `azure.yaml`) Git मध्ये सामायिक केला जातो; पर्यावरण *स्थिती आणि गुपिते* (`.azure/`) विकसक आणि पाइपलाईन नुसार वेगळे असतात. `azd pipeline config` तुमच्यासाठी पाइपलाईन चल पूर्वनिर्धारित करते.

## 🔐 प्रमाणीकरण कॉन्फिगरेशन

### Azure CLI समाकालीनरण
```bash
# Azure CLI क्रेडेन्शियल्स वापरा (मूलभूत)
azd config set auth.useAzureCliCredential true

# विशिष्ट टेनंटसह लॉगिन करा
az login --tenant <tenant-id>

# मूलभूत सदस्यत्व सेट करा
az account set --subscription <subscription-id>
```

### सेवा प्रमाणीकरण
CI/CD पाइपलाईन्ससाठी:
```bash
# पर्यावरण व्हेरिएबल्स सेट करा
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# किंवा थेट संरचीत करा
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### व्यवस्थापित ओळख
Azure-होस्ट केलेल्या पर्यावरणांसाठी:
```bash
# व्यवस्थापित ओळख प्रमाणीकरण सक्षम करा
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ पायाभूत सुविधा कॉन्फिगरेशन

### बाइसप पॅरामीटर्स
`infra/main.parameters.json` मध्ये पायाभूत सुविधा पॅरामीटर्स कॉन्फिगर करा:
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

## 🚀 वितरण कॉन्फिगरेशन

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

### डॉकर कॉन्फिगरेशन
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
उदा. `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 प्रगत कॉन्फिगरेशन

### सानुकूल संसाधन नावे
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

### देखरेख कॉन्फिगरेशन
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
# .azure/development/.env
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

### प्रॉडक्शन पर्यावरण
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 कॉन्फिगरेशन चाचणी

### कॉन्फिगरेशन पडताळणी
```bash
# कॉन्फिगरेशन_Syntax तपासा
azd config validate

# टेस्ट पर्यावरणीय चल तपासा
azd env get-values

# इन्फ्रास्ट्रक्चर वैधता तपासा
azd provision --dry-run
```

### कॉन्फिगरेशन स्क्रिप्ट्स
`script/` मध्ये पडताळणी स्क्रिप्ट्स तयार करा:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# आवश्यक पर्यावरण चल तपासा
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml चे व्याकरण तपासा
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 सर्वोत्तम पद्धती

### 1. पर्यावरणीय चल वापरा
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. कॉन्फिगरेशन फाइल्स आयोजित करा
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
.azure/*/config.json         # पर्यावरण कॉन्फिगरेशन (संसाधन आयडीज समाविष्ट असू शकतात)
.azure/*/.env               # पर्यावरण चल (मद्यांत रहस्ये असू शकतात)
.env                        # स्थानिक पर्यावरण फाईल
```

### 4. कॉन्फिगरेशन दस्तऐवजीकरण
तुमच्या कॉन्फिगरेशनचा दस्तऐवज `CONFIG.md` मध्ये करा:
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

## 🎯 प्रात्यक्षिक सराव व्यायाम

### सराव 1: बहु-पर्यावरण कॉन्फिगरेशन (15 मिनिटे)

**ध्येय:** तीन वेगळ्या सेटिंग्जसह पर्यावरण तयार आणि कॉन्फिगर करा

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

**यशस्वी निकष:**
- [ ] यशस्वीपणे तीन पर्यावरण तयार केले
- [ ] प्रत्येक पर्यावरणाची वेगळी कॉन्फिगरेशन आहे
- [ ] त्रुटीविनाशिवाय पर्यावरणांमध्ये स्विच करू शकता
- [ ] `azd env list` सर्व तीन पर्यावरणे दाखवते

### सराव 2: गुप्त व्यवस्थापन (10 मिनिटे)

**ध्येय:** संवेदनशील डेटा सुरक्षित कॉन्फिगरेशनचा सराव करा

```bash
# गुपिते सेट करा (आउटपुटमध्ये दाखवली जात नाहीत)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# गुपित नसलेला कॉन्फिग सेट करा
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# पर्यावरण पाहा (गुपिते लपवलेली असावीत)
azd env get-values

# गुपिते साठवलेली आहेत का तपासा
azd env get DB_PASSWORD  # खरी किंमत दाखवायला हवी
```

**यशस्वी निकष:**
- [ ] गुपिते टर्मिनलमध्ये न दाखवता संग्रहित केली
- [ ] `azd env get-values` मध्ये गुपिते लपवलेली आहेत
- [ ] वैयक्तिक `azd env get <SECRET_NAME>` खरी किंमत प्राप्त करते

## पुढील पाऊले

- [Your First Project](first-project.md) - प्रत्यक्षात कॉन्फिगरेशन लागू करा
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - वितरणासाठी कॉन्फिगरेशन वापरा
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - उत्पादनासाठी तयार कॉन्फिगरेशन

## संदर्भ

- [azd कॉन्फिगरेशन संदर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml स्कीमा](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [पर्यावरणीय चल](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**प्रकरण नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान प्रकरण**: प्रकरण 3 - कॉन्फिगरेशन आणि प्रमाणीकरण
- **⬅️ मागील**: [Your First Project](first-project.md)
- **➡️ पुढील प्रकरण**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **पुढील धडा**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->