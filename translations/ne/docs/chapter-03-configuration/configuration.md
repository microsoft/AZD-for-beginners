# कन्फिगरेसन गाइड

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD शुरुआतीहरूको लागि](../../README.md)
- **📖 हालको अध्याय**: अध्याय ३ - कन्फिगरेसन र प्रमाणीकरण
- **⬅️ अघिल्लो**: [तपाईंको पहिलो प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **➡️ अर्को**: [डिप्लोयमेन्ट गाइड](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 अर्को अध्याय**: [अध्याय ४: इन्फ्रास्ट्रक्चर एज कोड](../chapter-04-infrastructure/deployment-guide.md)

## परिचय

> `azd 1.37.2` विरुद्ध समीक्षा गरिएको (नोभेम्बर 2026)। Bash आदेशहरूले आरम्भ गरिएको azd परियोजना मान्छन्। पूर्ण फाइल रूपमा स्पष्ट रूपमा वर्णन नगरिएको YAML/Bicep अंशहरू मेल खाने परियोजना फाइलहरूमा विलय गर्नका लागि टुक्राहरू हुन्, स्वतन्त्र रूपमा चल्ने परियोजना होइनन्।

यो व्यापक मार्गदर्शकले Azure Developer CLI लाई उत्तम विकास र वितरण कार्यप्रवाहहरूको लागि कन्फिगर गर्ने सबै पक्षहरू समेट्छ। तपाइँलाई कन्फिगरेसन पदानुक्रम, वातावरण व्यवस्थापन, प्रमाणीकरण विधिहरू, र कुशल र सुरक्षित Azure वितरण सक्षम गर्ने उन्नत कन्फिगरेसन ढाँचाहरूको बारेमा जानकारी प्राप्त हुनेछ।

## सिकाइका लक्ष्यहरू

यस पाठ समाप्त हुने बेला, तपाईले:
- azd कन्फिगरेसन पदानुक्रममा पारंगत हुन र कसरि सेटिङहरू प्राथमिकता दिइन्छ बुझ्न
- विश्वव्यापी र परियोजना-विशिष्ट सेटिङहरू प्रभावकारी रूपमा कन्फिगर गर्न
- फरक कन्फिगरेसनहरूसँग बहुविध वातावरणहरू व्यवस्थापन गर्न
- सुरक्षित प्रमाणीकरण र प्राधिकरण ढाँचाहरू कार्यान्वयन गर्न
- जटिल परिदृश्यहरूको लागि उन्नत कन्फिगरेसन ढाँचाहरू बुझ्न

## सिकाइ परिणामहरू

यस पाठ पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- उत्तम विकास कार्यप्रवाहहरूका लागि azd कन्फिगर गर्न
- बहुविध वितरण वातावरणहरू सेटअप र व्यवस्थापन गर्न
- सुरक्षित कन्फिगरेसन व्यवस्थापन अभ्यासहरू कार्यान्वयन गर्न
- कन्फिगरेसन-सम्बन्धित समस्याहरू समाधान गर्न
- विशिष्ट संगठनात्मक आवश्यकताहरूका लागि azd व्यवहार अनुकूलन गर्न

यो व्यापक मार्गदर्शकले Azure Developer CLI लाई उत्तम विकास र वितरण कार्यप्रवाहहरूको लागि कन्फिगर गर्ने सबै पक्षहरू समेट्छ।

## azd परियोजनामा AI एजेन्टहरू बुझ्न

यदि तपाईं AI एजेन्टहरूमा नयाँ हुनुहुन्छ भने, azd संसार भित्र तिनीहरूलाई सोच्ने सरल तरिका यस्ता छन्।

### एजेन्ट भनेको के हो?

एजेन्ट भनेको यस्तो सफ्टवेयर भाग हो जुन अनुरोध प्राप्त गर्न, त्यसको विश्लेषण गर्न, र कार्यहरू लिन सक्छ—अक्सर AI मोडेल कल गरेर, डाटा खोजेर, वा अन्य सेवाहरू बोलाएर। azd परियोजनामा, एजेन्ट तपाईंको वेब फ्रन्टएन्ड वा API ब्याकएन्डसँगै एउटा अर्को **सेवा** हो।

### एजेन्टहरू कसरी azd परियोजना संरचनामा फिट हुन्छन्

azd परियोजना तीन तहहरू मिलेर बनेको हुन्छ: **पूर्वाधार**, **कोड**, र **कन्फिगरेसन**। एजेन्टहरू यी तहहरूमा उही तरिकाले जोडिन्छन् जस्तो कि कुनै अन्य सेवा गर्छ:

| तह | परम्परागत अनुप्रयोगका लागि यो के गर्छ | एजेन्टका लागि यो के गर्छ |
|-------|-------------------------------------|---------------------------|
| **पूर्वाधार** (`infra/`) | वेब अनुप्रयोग र डाटाबेसको प्रावधान गर्दछ | AI मोडेल अन्तबिन्दु, खोज अनुक्रमणिका, वा एजेन्ट होस्टको प्रावधान गर्दछ |
| **कोड** (`src/`) | तपाईंको फ्रन्टएन्ड र API स्रोत कोड समावेश गर्दछ | तपाईंको एजेन्ट तर्क र प्राँप्ट परिभाषाहरू समावेश गर्दछ |
| **कन्फिगरेसन** (`azure.yaml`) | तपाईंका सेवाहरू र तिनीहरूको होस्टिङ लक्ष्यहरू सूचीबद्ध गर्दछ | तपाईंको एजेन्टलाई सेवा रूपमा सूचीबद्ध गर्दछ, यसको कोड र होस्ट तर्फ संकेत गर्दै |

### `azure.yaml` को भूमिका

तपाईंलाई अहिले नै सिन्ट्याक्स सम्झन आवश्यक छैन। अवधारणात्मक रूपमा, `azure.yaml` त्यो फाईल हो जहाँ तपाईं azd लाई भन्नुहुन्छ: *"यी सेवाहरूले मेरो अनुप्रयोग निर्माण गर्छन्, र यहाँ उनीहरूको कोड हुन्छ।"*

जब तपाईंको परियोजनामा एआई एजेन्ट समावेश हुन्छ, `azure.yaml` केवल त्यो एजेन्टलाई सेवाहरू मध्ये एकको रूपमा सूचीबद्ध गर्छ। त्यसपछि azd सही पूर्वाधार (जस्तै Microsoft Foundry मोडेल अन्तबिन्दु वा एजेन्ट होस्ट गर्नको लागि कन्टेनर एप्प) प्रावधान गर्न जान्दछ र तपाईंको एजेन्ट कोडलाई तैनाथ गर्छ—जसरी यसले वेब अनुप्रयोग वा API का लागि गर्छ।

यसको अर्थ तपाईंले कुनै मौलिक नयाँ कुरा सिक्न सक्नुहुन्न। यदि तपाईंलाई azd ले वेब सेवा कसरी व्यवस्थापन गर्छ भन्ने बुझिन्छ भने, तपाईंलाई पहिले नै थाहा छ यसले एजेन्टलाई कसरी व्यवस्थापन गर्छ।

## कन्फिगरेसन पदानुक्रम

azd का फरक फरक कन्फिगरेसन सतहहरू छन्, एउटा सार्वत्रिक ओभरले होइन:
- **वैश्विक प्रयोगकर्ता प्राथमिकताहरू**: `~/.azd/config.json`, जसलाई `azd config` द्वारा व्यवस्थापन गरिन्छ।
- **प्रोजेक्ट परिभाषा**: `azure.yaml` सेवाहरू, पूर्वाधार, र हुकहरू निर्दिष्ट गर्दछ।
- **स्थानीय वातावरण छनौट**: `.azure/config.json`।
- **प्रति-वातावरण मानहरू**: `.azure/<name>/.env`, `azd env` द्वारा व्यवस्थापन; थप सेटिङहरू त्यो वातावरणको `config.json` मा जीवित छन्।
- **फ्ल्यागहरू र प्रक्रिया भेरिएबलहरू**: विशेष आदेश/प्रदाता द्वारा समर्थित सेटिङहरू मात्र ओभरराइड गर्नुहोस्।

कुनै पनि मनमोहक `azd env set` मान स्वतः पूर्वाधार प्यारामिटर वा तैनाथ अनुप्रयोग सेटिङ हुँदैन। स्पष्ट रूपमा त्यसलाई प्यारामिटर फाइल, समर्थित सेवा कन्फिगरेसन, वा हुकमा संदर्भ गर्नुहोस्।

## ग्लोबल कन्फिगरेसन

### ग्लोबल पूर्वनिर्धारित सेट गर्दै
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### सामान्य ग्लोबल सेटिङहरू
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ प्रोजेक्ट कन्फिगरेसन

### azure.yaml संरचना
`azure.yaml` फाइल तपाईको azd प्रोजेक्टको हृदय हो:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

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
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

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

यो एउटा **प्रोजेक्ट-परिभाषा उदाहरण** हो, कुनै उपलब्ध स्टार्टरसँग होइन। रन गर्नु अघि सन्दर्भ गरिएको स्रोत डाइरेक्टरीहरू, हुक स्क्रिप्टहरू, प्याकेज स्क्रिप्टहरू, र मिल्दोजुल्दा `infra/main.bicep`/`main.parameters.json` सिर्जना गर्नुहोस्। डेटाबेसहरू पूर्वाधारमा पर्ने गर्छन्; `postgres` एक इन-बिल्ट सेवा होस्ट होइन। पूर्वाधार प्यारामिटरहरू प्रदायकको प्यारामिटर फाइलमा जान्छन्, `infra.parameters` मा होइन।

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

#### भाषा-विशिष्ट बिल्ड हुकहरू

तलको सेवा खण्डहरूले हुकहरू देखाउँछन्; तिनीहरूलाई प्रत्येक सेवाको वास्तविक `project` र `host` सँग मर्ज गर्नुहोस्। `buildCommand` र `startCommand` सामान्य azd सेवा गुणहरू होइनन्। स्टार्टअप अनुप्रयोग, Dockerfile, वा होस्ट पूर्वाधारमा कन्फिगर गर्नुहोस्।

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 वातावरण व्यवस्थापन

### वातावरणहरू सिर्जना गर्दै
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### वातावरण कन्फिगरेसन
प्रमुख वातावरण मानहरू `.azure/<env-name>/.env` मा जीवित छन्, जसमा `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID`, र `AZURE_LOCATION` समावेश छन्। थप वातावरण JSON सेटिङहरूको लागि `azd env config get/set` प्रयोग गर्नुहोस्। तलको JSON **धारणा अनुप्रयोग अवस्थाको** हो, azd कन्फिग स्कीमा होइन; यसलाई azd फाइलहरूमा नक्कल नगर्नुहोस्:

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

**सादा पाठ प्रदर्शन मात्र।** सामान्य `azd env set` मानहरू `.azure/<name>/.env` मा लेखिन्छन् र रिड आदेशहरूले प्रिन्ट गर्न सक्छन्। उदाहरण API कुञ्जीलाई वास्तविक प्रमाणपत्रको रूपमा न प्रयोग गर्नुहोस्। गोप्यहरूका लागि, `azd env set-secret` र स्पष्ट रनटाइम वायरिङ प्रयोग गर्नुहोस्।

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### वातावरण टेम्प्लेटहरू
Project root मा **गोप्य भन्दा बाहिर, म्यानुअली व्यवस्थापन गरिएको** `.env.example` सिर्जना गर्नुहोस् स्थिर सेटअपको लागि। azd ले स्वतः कुनै `env.template` नामक फाइल लोड गर्दैन:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

### टोलीमा वातावरण साझा गर्दै

जब एक भन्दा धेरै व्यक्तिहरू प्रोजेक्टमा काम गर्छन्, तपाईंले सहमत हुन आवश्यक छ कि **केहि रिपो सँगै जान्छ र के स्थानीय रहन्छ**। azd प्रत्येक वातावरणलाई `.azure/` फोल्डर भित्र राख्छ, र सबै कुरा कमिट गर्नु हुँदैन।

**`.azure/` भित्र के छ:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**के gitignore गर्ने।** azd को डिफ़ल्ट `.gitignore` ले पहिले नै `.azure/` लाई बाहिर राख्दछ। यसलाई त्यहि राख्नुहोस्—`.env` फाइलहरूले रहस्यहरू समावेश गर्न सक्छन्, र स्रोत ID हरू जसले तिनीहरूलाई প্রদান गरेको छ त्यस अनुसार विशेष हुन्छन्। प्रत्येक टिम सदस्यले आफ्नो **आफ्नो** वातावरण स्थानीय रूपमा सिर्जना गर्दछ:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**वातावरणहरू बीच स्विच गर्ने।** धेरै वातावरणहरूको व्यवस्थापन गर्ने विकासकर्ताले आदेश चलाउनु अघि सक्रिय वातावरण चयन गर्दछ:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**टिमलाई गैर-गोप्य पूर्वनिर्धारित मानहरू प्रदान गर्ने।** बाहिर commit गर्नुहोस् `.env.example` अनदेखा गरिएको `.azure/` निर्देशिकाबाट। नयाँ टिम सदस्यले यसलाई स्थानीय अनदेखा फाइलमा प्रतिलिपि गर्छन्, मानहरू भर्छन्, र स्पष्ट रूपमा import गर्छन् `azd env set --file <local-file>` द्वारा। कार्यरत वातावरणमा खाली प्लेसहोल्डरहरू कहिल्यै import नगर्नुहोस्।

**CI/CD मा वातावरणहरू।** पाइपलाइनहरूले तपाईंको स्थानीय `.azure/` फोल्डर पढ्दैन। सट्टा, वातावरण मानहरू पाइपलाइन भेरिएबल/गोप्य रूपमा प्रदान गर्नुहोस्, र azd ले तिनीहरूलाई प्रक्रिया वातावरणबाट पढ्दछ:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **सामान्य नियम:** पूर्वाधार कोड (`infra/`, `azure.yaml`) Git मा साझा गरिन्छ; वातावरणको *स्थिति र रहस्यहरू* (`.azure/`) प्रति विकासकर्ता र प्रति-पाइपलाइन हुने गर्दछ। `azd pipeline config` ले तपाईको लागि पाइपलाइन भेरिएबलहरू स्वचालित रूपमा सेट गर्दछ।

## 🔐 प्रमाणीकरण कन्फिगरेसन

### Azure CLI एकीकरण
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### सेवा प्रिन्सिपल प्रमाणीकरण
CI/CD पाइपलाइनहरूको लागि:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### व्यवस्थापित पहिचान
Azure-होस्ट गरिएको वातावरणहरूको लागि:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ पूर्वाधार कन्फिगरेसन

### Bicep प्यारामिटरहरू
पूर्वाधार प्यारामिटरहरू सञ्झ्यालमा सेट गर्नुहोस् `infra/main.parameters.json`:
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
Terraform प्रोजेक्टहरूको लागि, azd ले प्लेसहोल्डरहरूलाई प्रतिस्थापन गर्छ `infra/main.tfvars.json` भित्र। यी नामहरूले Terraform इनपुट भेरिएबलहरूका घोषणा गरिएका नामहरूसँग मेल खानुपर्छ:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 परिनियोजन कन्फिगरेसन

### निर्माण कन्फिगरेसन
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### Docker कन्फिगरेसन
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
पथहरू सेवा प्रोजेक्टको सापेक्ष हुन्छन्। Dockerfile ले कुनै पनि `ARG` मानहरू जुन यसले उपभोग गर्छ, घोषणा गर्नुपर्छ। बहु-चरण निर्माणका लागि, अन्तिममा डिप्लोएबल चरण राख्नुहोस् वा अनुकूल प्याकेजिङ कार्यप्रवाह प्रयोग गर्नुहोस्; `docker.target` समीक्षा गरिएको स्किमा मा समर्थित गुण होइन।

## 🔧 उन्नत कन्फिगरेसन

### अनुकूलित स्रोत नामकरण
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

वास्तविक स्रोत नामहरू Bicep/Terraform मा परिभाषित गर्नुहोस् र स्रोत-ग्रुप सिर्जना यस सेटिङसँग सुसंगत राख्नुहोस्। कुनै सामान्य `naming.storageAccount` वा `naming.keyVault` कन्फिगरेसन कुञ्जीहरू छैनन्।

### नेटवर्क कन्फिगरेसन
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

यी **उदाहरणात्मक प्यारामिटर प्रविष्टिहरू** लाई `infra/main.parameters.json` भित्र `parameters` अन्तर्गत मिसाउनुहोस्, र मेल खाने प्यारामिटरहरू Bicep मा घोषणा र प्रयोग गर्नुहोस्। तिनीहरू आफैंमा केही गर्दैनन्।

### अनुगमन कन्फिगरेसन
Application Insights र Log Analytics लाई Bicep/Terraform मा प्रविधि गर्नुहोस् र तपाईंको SDK मा अनुप्रयोग टेलिमेट्री कन्फिगर गर्नुहोस्। कुनै सामान्य शीर्ष स्तरको `monitoring` ब्लक `azure.yaml` मा छैन जुन यी स्रोतहरू सिर्जना गर्छ। हेर्नुहोस् [अनुगमन पूर्वाधार](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability)।

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

## 🔍 कन्फिगरेसन प्रमाणिकरण

### कन्फिगरेसन प्रमाणित गर्नुहोस्
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### कन्फिगरेसन स्क्रिप्टहरू
`scripts/` मा प्रमाणिकरण स्क्रिप्टहरू सिर्जना गर्नुहोस्:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 उत्तम अभ्यासहरू

### 1. वातावरण परिवर्तनशीलहरू प्रयोग गर्नुहोस्
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

संवेदनशील मानहरू हार्डकोड नगर्नुहोस् (चित्रणात्मक कन्फिगरेसन अलग राख्नुहोस्, त्यो फाइलमा दोस्रो `database` कुञ्जी होइन):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. कन्फिगरेसन फाइलहरू व्यवस्थापन गर्नुहोस्
```
.azure/
├── config.json              # Global project config
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

### 3. संस्करण नियन्त्रण सम्बन्धि विचारहरू
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. कन्फिगरेसन कागजातिकरण
तपाईँको कन्फिगरेसनलाई `CONFIG.md` मा दस्तावेज गर्नुहोस्:
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

## 🎯 हातमा अभ्यास गर्ने कसरतहरू

### व्यायाम १: बहु-परिवेश कन्फिगरेसन (१५ मिनेट)

**लक्ष्य**: विभिन्न मानहरूसहित तीन स्थानीय वातावरणहरू सिर्जना र कन्फिगर गर्नुहोस्। सुरुमा एक आरम्भ गरिएको प्रोजेक्टमा हुनुहोस्; यदि यी पहिले नै छन् भने प्रयोग नभएका नामहरू प्रयोग गर्नुहोस्। यी एप्लिकेशन-विशेष मानहरूले तबसम्म टेलिमेट्री/रनटाइम सेटिङहरू परिवर्तन गर्दैन जबसम्म तपाईँको ढाँचा तिनीहरूलाई उपभोग गर्दैन।

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**सफलता मापदण्ड:**
- [ ] तीन वातावरणहरू सफलतापूर्वक सिर्जना गरियो
- [ ] प्रत्येक वातावरणको विलक्षित कन्फिगरेसन छ
- [ ] त्रुटिबिना वातावरणहरू बीच स्विच गर्न सकिन्छ
- [ ] `azd env list` सबै तीन वातावरणहरू देखाउँछ

### व्यायाम २: कुञ्जी भाल्ट गोप्य सन्दर्भहरू (१०-२० मिनेट)

**लक्ष्य**: प्लेनटेक्स्टको सट्टा कुञ्जी भाल्ट सन्दर्भ राख्नुहोस्। **असाधारण पोइन्ट:** एक आरम्भ गरिएको वातावरण, Azure साइन-इन, र dummy गोप्य वस्तु सिर्जना/पढ्न अनुमति भएको कुञ्जी भाल्ट पहुँच। भाल्ट अपरेसनहरूले शुल्क लाग्न सक्छ।

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**सफलता मापदण्ड:**
- [ ] अन्तरक्रियात्मक कमाण्डले चयन गरिएको भाल्ट र गोप्य सन्दर्भ रिपोर्ट गर्छ
- [ ] स्थानীয় `.env` मा dummy गोप्य वस्तुको सट्टा सन्दर्भ हुन्छ
- [ ] रनटाइम पहिचान/RBAC र प्रयोग अझै कन्फिगर गर्नुपर्ने कुरा स्पष्ट गर्न सक्छ

**सामान्य समस्याहरू:** ४०३ त्रुटिले सही भाल्ट डाटा-प्लेन भूमिका र प्रसारण समय आवश्यक छ; `azd env set ... --secret` मान्य कमाण्ड होइन। साधारण `get-values`/`get-value` आउटपुटलाई गोप्य मान्न सकिँदैन। प्रशिक्षण सन्दर्भलाई `azd env unset TRAINING_API_KEY` सँग मेटाउनुहोस्; यसले भाल्ट गोप्य वस्तुलाई मेटाउँदैन, जुन तपाईँले अलगबाट सफा गर्नुपर्छ यदि तपाईँले त्यो सिर्जना गर्नुभएको हो भने।

## अर्को चरणहरू

- [तपाईँको पहिलो प्रोजेक्ट](../chapter-01-foundation/first-project.md) - अभ्यासमा कन्फिगरेसन लागू गर्नुहोस्
- [परिनियोजन मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md) - परिनियोजनको लागि कन्फिगरेसन प्रयोग गर्नुहोस्
- [स्रोतहरूको प्राविधान](../chapter-04-infrastructure/provisioning.md) - उत्पादन-तयार कन्फिगरेसनहरू

## सन्दर्भहरू

- [azd कन्फिगरेसन सन्दर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml योजना](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [वातावरण चर](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**अध्याय नेभिगेसन:**
- **📚 कोर्स गृहपृष्ठ**: [AZD शुरुआतीहरूका लागि](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय ३ - कन्फिगरेसन र प्रमाणीकरण
- **⬅️ अघिल्लो**: [तपाईंको पहिलो परियोजना](../chapter-01-foundation/first-project.md)
- **➡️ अर्को अध्याय**: [अध्याय ४: इन्फ्रास्ट्रक्चर एज कोड](../chapter-04-infrastructure/deployment-guide.md)
- **अर्को पाठ**: [प्रमाणीकरण र सुरक्षा](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->