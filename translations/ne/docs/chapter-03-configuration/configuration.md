# कन्फिगरेसन गाइड

**Chapter Navigation:**
- **📚 Course Home**: [AZD शुरुआतीहरूका लागि](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## परिचय

यो व्यापक गाइडले Azure Developer CLI कन्फिगर गर्ने सबै पक्षहरू समेट्छ ताकि विकास र डिप्लोयमेन्ट कार्यप्रवाहहरू उपयुक्त रूपमा संचालन गर्न सकियोस्। तपाईंले कन्फिगरेसन पदानुक्रम, वातावरण व्यवस्थापन, प्रमाणीकरण विधिहरू, र प्रभावकारी र सुरक्षित Azure डिप्लोयमेन्ट सक्षम गर्ने उन्नत कन्फिगरेसन ढाँचाहरूबारे जान्नु हुनेछ।

## सिक्ने लक्ष्यहरू

यस पाठको अन्त्यसम्म, तपाईंले:
- azd कन्फिगरेसन पदानुक्रममा निपुण हुनुहुनेछ र सेटिङहरूको प्राथमिकता कसरी निर्धारण हुन्छ बुझ्नुहुनेछ
- ग्लोबल र परियोजना-विशिष्ट सेटिङहरू प्रभावकारी रूपमा कन्फिगर गर्नुहोस्
- फरक कन्फिगरेसन भएका बहु वातावरणहरू व्यवस्थापन गर्नुहोस्
- सुरक्षित प्रमाणीकरण र प्राधिकरण ढाँचाहरू कार्यान्वयन गर्नुहोस्
- जटिल परिदृश्यहरूको लागि उन्नत कन्फिगरेसन ढाँचाहरू बुझ्नुहोस्

## सिकाइ परिणामहरू

यो पाठ पूरा गरेपछि, तपाईं सक्षम हुनु हुनेछ:
- उत्तम विकास कार्यप्रवाहका लागि azd कन्फिगर गर्न
- बहु डिप्लोयमेन्ट वातावरण सेटअप र व्यवस्थापन गर्न
- सुरक्षित कन्फिगरेसन व्यवस्थापन अभ्यासहरू कार्यान्वयन गर्न
- कन्फिगरेसन-सम्बन्धी समस्याहरू समाधान गर्न
- विशिष्ट संगठनात्मक आवश्यकताहरूका लागि azd को व्यवहार अनुकूलित गर्न

यो व्यापक गाइडले Azure Developer CLI कन्फिगर गर्ने सबै पक्षहरू समेट्छ ताकि विकास र डिप्लोयमेन्ट कार्यप्रवाहहरू उपयुक्त रूपमा संचालन गर्न सकियोस्।

## azd परियोजनामा AI एजेन्टहरू बुझ्न

यदि तपाईं AI एजेन्टहरूमा नयाँ हुनुहुन्छ भने, azd संसारभित्र तिनीहरूलाई सोच्ने सरल तरीका यहाँ छ।

### एजेन्ट भनेको के हो?

एजेन्ट एक सफ्टवेयरको टुक्रा हो जसले अनुरोध प्राप्त गर्न सक्छ, त्यसबारे तर्क गर्न सक्छ, र क्रियाहरू लिन सक्छ—प्रायः AI मोडेल कल गरेर, डेटा हेरेर, वा अन्य सेवाहरू बोलाएर। azd परियोजनामा, एउटा एजेन्ट तपाईंको वेब फ्रन्टएन्ड वा API ब्याकएन्डसँगै अर्को **सेवा** मात्र हो।

### एजेन्टहरू azd परियोजना संरचनामा कसरी फिट हुन्छन्

azd परियोजना तीन तहले बनेको हुन्छ: **अवसंरचना**, **कोड**, र **कन्फिगरेसन**। एजेन्टहरू यी तहहरूमा अन्य सेवाहरूले जस्तै नै जोडिन्छन्:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **अवसंरचना** (`infra/`) | वेब एप र डाटाबेस प्रोभिजन गर्दछ | AI मोडेल अन्तबिन्दु, खोज इन्डेक्स, वा एजेन्ट होस्ट प्रोभिजन गर्दछ |
| **कोड** (`src/`) | तपाईंको फ्रन्टएन्ड र API स्रोत कोड समावेश गर्दछ | तपाईंको एजेन्ट लॉजिक र प्रॉम्प्ट परिभाषाहरू समावेश गर्दछ |
| **कन्फिगरेसन** (`azure.yaml`) | तपाईंका सेवाहरू र तिनीहरूको होस्टिंग लक्ष्यहरू सूचीबद्ध गर्दछ | एजेन्टलाई एउटा सेवा रूपमा सूचीबद्ध गर्छ, यसको कोड र होस्टतर्फ संकेत गर्दै |

### `azure.yaml` को भूमिका

हजुरले अहिले यसको सिन्ट्याक्स याद गर्नु आवश्यक छैन। अवधारणात्मक रूपमा, `azure.yaml` त्यो फाइल हो जहाँ तपाईं azd लाई बताउनुहुन्छ: *"यी हुन् मेरा अनुप्रयोग बनाउने सेवाहरू, र तिनीहरूको कोड कहाँ फेला पार्ने।"*

जब तपाईंको परियोजनामा AI एजेन्ट समावेश हुन्छ, `azure.yaml` ले मात्र त्यो एजेन्टलाई सेवाहरू मध्ये एकको रूपमा सूचीबद्ध गर्दछ। त्यसपछि azd उचित अवसंरचना (जस्तै Microsoft Foundry Models अन्तबिन्दु वा एजेन्ट होस्ट गर्न Container App) प्रोभिजन गर्न र तपाईंको एजेन्ट कोड तैनाथ गर्न जान्दछ—ठिक त्यस्तै जस्तो यो वेब एप वा API का लागि गर्थ्यो।

यसको अर्थ केहि आधारभूत नयाँ कुरा सिक्नु पर्दैन। यदि तपाईं azd ले वेब सेवालाई कसरी व्यवस्थापन गर्छ बुझ्नुहुन्छ भने, तपाईंले पहिले नै बुझिसक्नुभएको छ कि यो एजेन्टलाई कसरी व्यवस्थापन गर्छ।

## कन्फिगरेसन पदानुक्रम

azd ले एउटा पदानुक्रमिक कन्फिगरेसन प्रणाली प्रयोग गर्छ:
1. **कमाण्ड-लाइन फ्ल्यागहरू** (सर्वोच्च प्राथमिकता)
2. **वातावरण चरहरू**
3. **लोकल परियोजना कन्फिगरेसन** (`.azd/config.json`)
4. **ग्लोबल प्रयोगकर्ता कन्फिगरेसन** (`~/.azd/config.json`)
5. **पूर्वनिर्धारित मानहरू** (सबैभन्दा कम प्राथमिकता)

## ग्लोबल कन्फिगरेसन

### ग्लोबल पूर्वनिर्धारित सेटिङहरू सेट गर्नुहोस्
```bash
# पूर्वनिर्धारित सदस्यता सेट गर्नुहोस्
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# पूर्वनिर्धारित स्थान सेट गर्नुहोस्
azd config set defaults.location "eastus2"

# पूर्वनिर्धारित स्रोत समूहको नामकरण परम्परा सेट गर्नुहोस्
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# सबै वैश्विक कन्फिगरेसनहरू हेर्नुहोस्
azd config show

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
azd config set tls.insecure false                  # TLS सत्यापन लागू गर्नुहोस्

# प्रदर्शन अनुकूलन
azd config set provision.parallelism 5             # स्रोतहरूको समांतर सिर्जना
azd config set deploy.timeout 30m                  # परिनियोजन समयसीमा
```

## 🏗️ परियोजना कन्फिगरेसन

### azure.yaml संरचना
`azure.yaml` फाइल तपाईंको azd परियोजनाको केन्द्र हो:

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

### वातावरणहरू सिर्जना गर्दै
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
# (कुनै नतिजा फर्किँदैन)
```

### वातावरण टेम्पलेटहरू
सुसंगत वातावरण सेटअपका लागि `.azure/env.template` सिर्जना गर्नुहोस्:
```bash
# आवश्यक भेरिएबलहरू
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# अनुप्रयोग सेटिङहरू
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# विकास सम्बन्धी वैकल्पिक सेटिङहरू
DEBUG=false
LOG_LEVEL=info
```

### टोलीभरिमा वातावरण साझा गर्ने

जब एकभन्दा बढी व्यक्तिले परियोजनामा काम गर्छन्, तपाईंले सहमति हुनुपर्छ **के रिपो सँगै जान्छ र के स्थानीय रहन्छ** भनी। azd ले हरेक वातावरण `.azure/` फोल्डरअन्तर्गत राख्छ, र यसको सबै भाग कमिट गर्नु हुँदैन।

**`.azure/` मा के हुन्छ:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**के gitignore गर्ने।** azd को डिफल्ट `.gitignore` ले पहिले नै `.azure/` लाई बाहिर राख्छ। यसरी राख्नुहोस्—`.env` फाइलहरूमा गोप्य जानकारी हुन सक्छ, र स्रोत ID हरू तिनीहरूले प्रोभिजन गर्ने व्यक्तिसँग विशिष्ट हुन्छन्। हरेक टोलीका सदस्यले स्थानीय रूपमा आफ्नो **आफ्नै** वातावरण बनाउँछन्:

```bash
# हरेक विकासकर्ताले यो एकपटक चलाएर आफ्नो पृथक वातावरण पाउँछन्
azd env new dev-alice
azd up
```

**वातावरणहरू बीच स्विच गर्ने।** धेरै वातावरणहरू व्यवस्थापन गर्ने विकासकर्ताले कमाण्डहरू चलाउनुअघि सक्रिय वातावरण चयन गर्छ:

```bash
azd env list                 # सबै स्थानीय वातावरणहरू र कुन पूर्वनिर्धारित हो हेर्नुहोस्
azd env select staging       # 'staging' लाई सक्रिय वातावरण बनाउनुहोस्
azd env get-values           # तपाईं सही वातावरणतर्फ निर्देशित हुनुहुन्छ भन्ने पुष्टि गर्नुहोस्
```

**टोलीलाई गोप्य नभएका पूर्वनिर्धारितहरू उपलब्ध गराउने।** सबैले कुन भेरिएबल सेट गर्नुपर्ने थाहा पाउनको लागि टेम्पलेट (जस्तै माथिका `.azure/env.template`) कमिट गर्नुहोस्—तर भरिएका मानहरू कहिल्यै कमिट नगर्नुहोस्। नयाँ साथीहरूले टेम्पलेट कपी गरी आफ्ना मूल्यहरू भर्नेछन्।

**CI/CD मा वातावरणहरू।** पाइपलाइनहरूले तपाईंको स्थानीय `.azure/` फोल्डर पढ्दैनन्। यसको सट्टा, वातावरण मानहरूलाई पाइपलाइन भेरिएबल/गोप्यको रूपमा प्रदान गर्नुहोस्, र azd ले ती प्रक्रियाको वातावरणबाट पढ्छ:

```bash
# CI मा, azd यी वातावरणबाट पढ्छ, .azure/ बाट होइन।
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Rule of thumb:** अवसंरचना कोड (`infra/`, `azure.yaml`) Git मा साझा गरिन्छ; वातावरण *स्थिति र गोप्यहरू* (`.azure/`) डेभलपर र पाइपलाइन अनुसार अलग हुन्छन्। `azd pipeline config` ले पाइपलाइन भेरिएबलहरू तपाईंका लागि स्वचालित रूपमा सेट गर्छ।

## 🔐 प्रमाणीकरण कन्फिगरेसन

### Azure CLI एकीकरण
```bash
# Azure CLI प्रमाण-पत्रहरू प्रयोग गर्नुहोस् (पूर्वनिर्धारित)
azd config set auth.useAzureCliCredential true

# विशिष्ट टेनन्टमा लगइन गर्नुहोस्
az login --tenant <tenant-id>

# पूर्वनिर्धारित सदस्यता सेट गर्नुहोस्
az account set --subscription <subscription-id>
```

### सर्विस प्रिन्सिपल प्रमाणीकरण
CI/CD पाइपलाइनहरूको लागि:
```bash
# पर्यावरण चरहरू सेट गर्नुहोस्
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# वा सिधै कन्फिगर गर्नुहोस्
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### व्यवस्थापित पहिचान
Azure-होस्ट गरिएका वातावरणहरूको लागि:
```bash
# प्रबन्धित पहिचान प्रमाणीकरण सक्षम गर्नुहोस्
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ अवसंरचना कन्फिगरेसन

### Bicep प्यारामीटरहरू
`infra/main.parameters.json` मा अवसंरचना प्यारामीटरहरू कन्फिगर गर्नुहोस्:
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

### अनुकूलित स्रोत नामकरण
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

## 🎯 वातावरण-विशेष कन्फिगरेसनहरू

### विकास वातावरण
```bash
# .azure/विकास/.env
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
# कन्फिगरेसन सिन्ट्याक्स जाँच गर्नुहोस्
azd config validate

# पर्यावरण चरहरू परीक्षण गर्नुहोस्
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

# azure.yaml को सिन्ट्याक्स मान्य गर्नुहोस्
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 उत्तम अभ्यासहरू

### 1. वातावरण चरहरू प्रयोग गर्नुहोस्
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
.azure/*/config.json         # वातावरण कन्फिगहरू (संसाधन IDहरू समावेश गर्छन्)
.azure/*/.env               # वातावरण चरहरू (गोप्य जानकारी समावेश हुन सक्छन्)
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

### अभ्यास 1: बहु-वातावरण कन्फिगरेसन (15 minutes)

**लक्ष्य**: फरक सेटिङहरू भएका तीन वातावरण सिर्जना र कन्फिगर गर्नुहोस्

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

# हरेक वातावरण जाँच गर्नुहोस्
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**सफलताका मापदण्डहरू:**
- [ ] तीन वातावरणहरू सफलतापूर्वक सिर्जना गरियो
- [ ] प्रत्येक वातावरणसँग विशिष्ट कन्फिगरेसन छ
- [ ] त्रुटि बिना वातावरणहरू बीच स्विच गर्न सकिन्छ
- [ ] `azd env list` ले सबै तीन वातावरणहरू देखाउँछ

### अभ्यास 2: गोप्य व्यवस्थापन (10 minutes)

**लक्ष्य**: संवेदनशील डाटासँग सुरक्षित कन्फिगरेसन अभ्यास गर्नुहोस्

```bash
# गोप्य जानकारी सेट गर्नुहोस् (आउटपुटमा देखाइने छैन)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# गैर-गोप्य कन्फिग सेट गर्नुहोस्
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# परिवेश हेर्नुहोस् (गोप्य जानकारीहरू लुकाइएका हुनुपर्छ)
azd env get-values

# गोप्य जानकारीहरू भण्डारण भएका छन् भनी जाँच गर्नुहोस्
azd env get DB_PASSWORD  # वास्तविक मान देखाउनुपर्छ
```

**सफलताका मापदण्डहरू:**
- [ ] गोप्यहरू टर्मिनलमा देखाइ बिना भण्डारित छन्
- [ ] `azd env get-values` ले गोप्यहरू लुकेका देखाउँछ
- [ ] व्यक्तिगत `azd env get <SECRET_NAME>` ले वास्तविक मान प्राप्त गर्छ

## अर्को कदमहरू

- [तपाईंको पहिलो परियोजना](first-project.md) - अभ्यासमा कन्फिगरेसन लागू गर्नुहोस्
- [डिप्लोयमेन्ट गाइड](../chapter-04-infrastructure/deployment-guide.md) - डिप्लोयमेन्टका लागि कन्फिगरेसन प्रयोग गर्नुहोस्
- [संसाधन प्राविजनिङ](../chapter-04-infrastructure/provisioning.md) - उत्पादन-तैयार कन्फिगरेसनहरू

## सन्दर्भहरू

- [azd कन्फिगरेसन सन्दर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml स्कीमा](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [वातावरण चरहरू](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD शुरुआतीहरूका लागि](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->