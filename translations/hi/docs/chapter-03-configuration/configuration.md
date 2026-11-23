# कॉन्फ़िगरेशन गाइड

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 3 - कॉन्फ़िगरेशन और प्रमाणीकरण
- **⬅️ पिछला**: [आपका पहला प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **➡️ अगला**: [डिप्लॉयमेंट गाइड](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 अगला अध्याय**: [अध्याय 4: इन्फ्रास्ट्रक्चर ऐज़ कोड](../chapter-04-infrastructure/deployment-guide.md)

## परिचय

> `azd 1.37.2` के खिलाफ समीक्षा की गई (नवंबर 2026)। Bash कमांड एक आरंभिक azd प्रोजेक्ट मानती हैं। जब तक इसे स्पष्ट रूप से एक पूर्ण फ़ाइल के रूप में वर्णित न किया गया हो, YAML/Bicep स्निपेट्स उन अंशों के लिए हैं जिन्हें संगत प्रोजेक्ट फ़ाइलों में मर्ज किया जाना है, न कि स्वतंत्र चलने वाले प्रोजेक्ट।

यह व्यापक मार्गदर्शिका Azure Developer CLI को सर्वोत्तम विकास और तैनाती कार्यप्रवाहों के लिए कॉन्फ़िगर करने के सभी पहलुओं को कवर करती है। आप कॉन्फ़िगरेशन पदानुक्रम, पर्यावरण प्रबंधन, प्रमाणीकरण विधियों, और उन्नत कॉन्फ़िगरेशन पैटर्न्स के बारे में जानेंगे जो दक्ष और सुरक्षित Azure तैनातियों को सक्षम बनाते हैं।

## सीखने के लक्ष्य

इस पाठ के अंत तक, आप:
- azd कॉन्फ़िगरेशन पदानुक्रम में माहिर होंगे और समझेंगे कि सेटिंग्स को कैसे प्राथमिकता दी जाती है
- वैश्विक और प्रोजेक्ट-विशिष्ट सेटिंग्स को प्रभावी ढंग से कॉन्फ़िगर करेंगे
- विभिन्न कॉन्फ़िगरेशन वाले कई पर्यावरणों का प्रबंधन करेंगे
- सुरक्षित प्रमाणीकरण और प्राधिकरण पैटर्न लागू करेंगे
- जटिल परिदृश्यों के लिए उन्नत कॉन्फ़िगरेशन पैटर्न को समझेंगे

## सीखने के परिणाम

इस पाठ को पूरा करने के बाद, आप सक्षम होंगे:
- सर्वोत्तम विकास कार्यप्रवाहों के लिए azd को कॉन्फ़िगर करना
- कई तैनाती पर्यावरणों की स्थापना और प्रबंधन करना
- सुरक्षित कॉन्फ़िगरेशन प्रबंधन प्रथाओं को लागू करना
- कॉन्फ़िगरेशन-संबंधित मुद्दों का समाधान करना
- विशिष्ट संगठनात्मक आवश्यकताओं के लिए azd व्यवहार को अनुकूलित करना

यह व्यापक मार्गदर्शिका Azure Developer CLI को सर्वोत्तम विकास और तैनाती कार्यप्रवाहों के लिए कॉन्फ़िगर करने के सभी पहलुओं को कवर करती है।

## azd प्रोजेक्ट में AI एजेंट्स को समझना

यदि आप AI एजेंट्स में नए हैं, तो यहाँ azd दुनिया में उन्हें समझने का एक सरल तरीका है।

### एजेंट क्या है?

एक एजेंट एक सॉफ़्टवेयर का टुकड़ा है जो अनुरोध प्राप्त कर सकता है, उसके बारे में सोच सकता है, और कार्रवाई कर सकता है—अक्सर एक AI मॉडल को कॉल करके, डेटा खोजकर, या अन्य सेवाओं को invoke करके। एक azd प्रोजेक्ट में, एजेंट आपके वेब फ्रंटेंड या API बैकएंड के साथ एक और **सेवा** है।

### एजेंट azd प्रोजेक्ट संरचना में कैसे फिट होते हैं

एक azd प्रोजेक्ट तीन परतों से बना होता है: **इन्फ्रास्ट्रक्चर**, **कोड**, और **कॉन्फ़िगरेशन**। एजेंट इन परतों में उसी तरह प्लग होते हैं जैसे कोई अन्य सेवा करती है:

| परत | यह पारंपरिक ऐप के लिए क्या करता है | यह एक एजेंट के लिए क्या करता है |
|-------|-------------------------------------|---------------------------|
| **इन्फ्रास्ट्रक्चर** (`infra/`) | एक वेब ऐप और डेटाबेस प्रोविजन करता है | एक AI मॉडल एंडपॉइंट, सर्च इंडेक्स, या एजेंट होस्ट प्रोविजन करता है |
| **कोड** (`src/`) | आपके फ्रंटेंड और API सोर्स कोड को रखता है | आपके एजेंट लॉजिक और प्रॉम्प्ट डेफिनिशन्स को रखता है |
| **कॉन्फ़िगरेशन** (`azure.yaml`) | आपकी सेवाओं और उनके होस्टिंग टार्गेट्स को सूचीबद्ध करता है | आपके एजेंट को एक सेवा के रूप में सूचीबद्ध करता है, जो उसके कोड और होस्ट की ओर इशारा करता है |

### `azure.yaml` की भूमिका

आपको अभी सिंटैक्स याद रखने की जरूरत नहीं है। अवधारणात्मक रूप से, `azure.yaml` वह फाइल है जहाँ आप azd को बताते हैं: *"यहाँ वे सेवाएं हैं जो मेरे आवेदन को बनाती हैं, और इनका कोड कहाँ मिलेगा।"*

जब आपका प्रोजेक्ट एक AI एजेंट शामिल करता है, तब `azure.yaml` बस उस एजेंट को सेवाओं में से एक के रूप में सूचीबद्ध करता है। इसके बाद azd सही इंफ्रास्ट्रक्चर (जैसे Microsoft Foundry Models एंडपॉइंट या एजेंट होस्ट करने के लिए एक कंटेनर ऐप) प्रोविजन करना और आपके एजेंट कोड को डिप्लॉय करना जानता है—बिल्कुल उसी तरह जैसे यह एक वेब ऐप या API के लिए करता है।

इसका मतलब है कि सीखने के लिए कुछ मूल रूप से नया नहीं है। यदि आप समझते हैं कि azd वेब सेवा को कैसे प्रबंधित करता है, तो आप पहले से ही समझते हैं कि यह एजेंट को कैसे प्रबंधित करता है।

## कॉन्फ़िगरेशन की पदानुक्रम

azd की अलग-अलग कॉन्फ़िगरेशन सतहें होती हैं, एक सार्वभौमिक ओवरले नहीं:
- **वैश्विक उपयोगकर्ता प्राथमिकताएँ**: `~/.azd/config.json`, जिसे `azd config` द्वारा प्रबंधित किया जाता है।
- **परियोजना परिभाषा**: `azure.yaml` सेवाओं, अवसंरचना, और हुक्स को निर्दिष्ट करता है।
- **स्थानीय पर्यावरण चयन**: `.azure/config.json`।
- **प्रति-पर्यावरण मान**: `.azure/<name>/.env`, `azd env` द्वारा प्रबंधित; अतिरिक्त सेटिंग्स उस पर्यावरण के `config.json` में रहती हैं।
- **फ्लैग और प्रक्रिया चर**: केवल उस विशेष कमांड/प्रदाता द्वारा समर्थित सेटिंग्स को अधिलेखित करें।

एक मनमाना `azd env set` मान स्वचालित रूप से अवसंरचना पैरामीटर या तैनात अनुप्रयोग सेटिंग नहीं बनता। इसे पैरामीटर फ़ाइल, समर्थित सेवा विन्यास, या एक हुक में स्पष्ट रूप से संदर्भित करें।

## वैश्विक विन्यास

### वैश्विक डिफ़ॉल्ट सेट करना
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

### सामान्य वैश्विक सेटिंग्स
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

## 🏗️ परियोजना विन्यास

### azure.yaml संरचना
`azure.yaml` फ़ाइल आपकी azd परियोजना का मूल है:

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

यह एक **परियोजना-परिभाषा उदाहरण** है, कोई प्रदान किया गया प्रारंभिक नहीं। संदर्भित स्रोत निर्देशिकाएँ, हुक स्क्रिप्ट, पैकेज स्क्रिप्ट, और मेल खाते `infra/main.bicep`/`main.parameters.json` चलाने से पहले बनाएं। डेटाबेस अवसंरचना में आते हैं; `postgres` एक बिल्ट-इन सेवा होस्ट नहीं है। अवसंरचना पैरामीटर प्रदाता के पैरामीटर फ़ाइल में जाते हैं, `infra.parameters` में नहीं।

### सेवा विन्यास विकल्प

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

#### भाषा-विशिष्ट बिल्ड हुक्स

निम्नलिखित सेवा खंड हुक्स को दर्शाते हैं; इन्हें प्रत्येक सेवा के असली `project` और `host` के साथ मिलाएं। `buildCommand` और `startCommand` सामान्य azd सेवा गुण नहीं हैं। एप्लिकेशन, Dockerfile, या होस्ट अवसंरचना में आरंभ सेट करें।

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

## 🌟 पर्यावरण प्रबंधन

### पर्यावरण बनाना
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### पर्यावरण विन्यास
मुख्य पर्यावरण मान `.azure/<env-name>/.env` में रहते हैं, जिनमें `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID`, और `AZURE_LOCATION` शामिल हैं। अतिरिक्त पर्यावरण JSON सेटिंग्स के लिए `azd env config get/set` का उपयोग करें। निम्न JSON **सैद्धांतिक अनुप्रयोग स्थिति** है, azd विन्यास योजना नहीं; इसे azd की फ़ाइलों में न कॉपी करें:

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

### पर्यावरण चर

**केवल सादे पाठ का प्रदर्शन।** सामान्य `azd env set` मान `.azure/<name>/.env` में लिखे जाते हैं और पढ़ने के आदेशों द्वारा मुद्रित किए जा सकते हैं। उदाहरण API कुंजी को वास्तविक प्रमाण पत्र के रूप में न उपयोग करें। रहस्यों के लिए `azd env set-secret` और स्पष्ट रनटाइम वायरिंग का उपयोग करें।

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

### पर्यावरण टेम्पलेट्स
परियोजना रूट में एक **गोपनीय नहीं, मैनुअल रूप से संचालित** `.env.example` बनाएँ ताकि स्थिर सेटअप हो। azd स्वचालित रूप से `env.template` नाम की फ़ाइल लोड नहीं करता:
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

### टीम में पर्यावरण साझा करना

जब एक से अधिक व्यक्ति किसी परियोजना पर काम करते हैं, तो आपको सहमत होना होता है कि **क्या रिपो के साथ चलता है और क्या स्थानीय रहता है**। azd प्रत्येक पर्यावरण को `.azure/` फ़ोल्डर के अंतर्गत रखता है, और इसका सभी हिस्सा कमिट नहीं किया जाना चाहिए।

**`.azure/` में क्या है:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**क्या gitignore करें।** azd का डिफ़ॉल्ट `.gitignore` पहले से ही `.azure/` को बाहर करता है। इसे वैसा ही रहने दें—`.env` फाइलों में गुप्त जानकारी हो सकती है, और संसाधन ID उन लोगों के लिए विशिष्ट होती हैं जिन्होंने उन्हें प्रोविजन किया है। प्रत्येक टीम का सदस्य अपने **अपने** स्थानीय वातावरण बनाता है:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**परिवेशों के बीच स्विच करना।** एक डेवलपर जो कई परिवेश चलाता है, कमांड चलाने से पहले सक्रिय पर्यावरण चुनता है:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**टीम को गैर-गुप्त डिफ़ॉल्ट प्रदान करना।** प्रतिबद्ध करें `.env.example` उस `.azure/` डायरेक्टरी के बाहर जो अनदेखी की गई हो। नए टीम के सदस्य इसे एक स्थानीय अनदेखी की गई फाइल में कॉपी करते हैं, मान भरते हैं, और इसे स्पष्ट रूप से `azd env set --file <local-file>` के साथ इम्पोर्ट करते हैं। कभी भी कार्यशील पर्यावरण पर खाली प्लेसहोल्डर का आयात न करें।

**CI/CD में पर्यावरण।** पाइपलाइनों को आपकी स्थानीय `.azure/` फ़ोल्डर की पढ़ाई नहीं होती। इसके बजाय, पर्यावरण मानों को पाइपलाइन चर/गोपनीयताओं के रूप में Provide करें, और azd उन्हें प्रोसेस पर्यावरण से पढ़ता है:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **अनुमानित नियम:** इंफ्रास्ट्रक्चर कोड (`infra/`, `azure.yaml`) Git में साझा किया जाता है; पर्यावरण *स्थिति और गुप्त बातें* (`.azure/`) प्रति-विकासकर्ता और प्रति-पाइपलाइन के लिए होती हैं। `azd pipeline config` आपके लिए पाइपलाइन वेरिएबल्स को स्वचालित रूप से सेट करता है।

## 🔐 प्रमाणीकरण विन्यास

### Azure CLI एकीकरण
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### सर्विस प्रिंसिपल प्रमाणीकरण
CI/CD पाइपलाइनों के लिए:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### प्रबंधित पहचान
Azure-होस्ट किए गए वातावरणों के लिए:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ आधारभूत संरचना विन्यास

### बाइसप पैरामीटर
आधारभूत संरचना पैरामीटर को `infra/main.parameters.json` में कॉन्फ़िगर करें:
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

### टेराफॉर्म विन्यास
टेराफॉर्म परियोजनाओं के लिए, azd `infra/main.tfvars.json` में प्लेसहोल्डर्स को प्रतिस्थापित करता है। ये नाम घोषित टेराफॉर्म इनपुट वेरिएबल्स से मेल खाने चाहिए:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 तैनाती विन्यास

### बिल्ड कॉन्फ़िगरेशन
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

### डॉकर कॉन्फ़िगरेशन
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
पथ सेवा परियोजना के सापेक्ष हैं। डॉकरफ़ाइल को किसी भी `ARG` मानों का घोषित करना चाहिए जिसे वह उपयोग करता है। एक मल्टी-स्टेज बिल्ड के लिए, परिनियोज्य स्टेज को अंतिम में रखें या एक कस्टम पैकेजिंग वर्कफ़्लो का उपयोग करें; `docker.target` समीक्षित स्कीमा में समर्थित संपत्ति नहीं है।

## 🔧 उन्नत कॉन्फ़िगरेशन

### कस्टम संसाधन नामकरण
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Bicep/Terraform में वास्तविक संसाधन नाम परिभाषित करें और संसाधन-समूह निर्माण को इस सेटिंग के अनुरूप बनाएँ। कोई सामान्य `naming.storageAccount` या `naming.keyVault` कॉन्फ़िगरेशन कुंजी नहीं हैं।

### नेटवर्क कॉन्फ़िगरेशन
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

इन **उदाहरणात्मक पैरामीटर प्रविष्टियों** को `infra/main.parameters.json` के अंतर्गत `parameters` में सम्मिलित करें, और मिलते-जुलते पैरामीटर Bicep में घोषित और उपयोग करें। ये अकेले कुछ नहीं करते।

### निगरानी कॉन्फ़िगरेशन
Bicep/Terraform में एप्लिकेशन इंसाइट्स और लॉग एनालिटिक्स प्रोविजन करें और अपने SDK में एप्लिकेशन टेलीमेट्री कॉन्फ़िगर करें। कोई सामान्य शीर्ष-स्तरीय `monitoring` ब्लॉक `azure.yaml` में नहीं है जो ये संसाधन बनाता है। देखें [निगरानी अवसंरचना](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability)।

## 🎯 पर्यावरण-विशिष्ट कॉन्फ़िगरेशन

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

### उत्पादन पर्यावरण
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 विन्यास सत्यापन

### विन्यास सत्यापित करें
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### विन्यास स्क्रिप्ट्स
में सत्यापन स्क्रिप्ट बनाएं `scripts/`:

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

## 🎓 सर्वश्रेष्ठ अभ्यास

### 1. पर्यावरण चर (Environment Variables) का उपयोग करें
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

संवेदनशील मान हार्डकोड करने से बचें (अलग पृथक विन्यास, एक ही फ़ाइल में दूसरा `database` कुंजी नहीं):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. विन्यास फ़ाइलों का आयोजन करें
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

### 3. संस्करण नियंत्रण पर विचार
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. विन्यास दस्तावेज़ीकरण
में अपने विन्यास को दस्तावेज़ित करें `CONFIG.md`:
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

## 🎯 प्रायोगिक अभ्यास के प्रश्न

### अभ्यास 1: मल्टी-पर्यावरण विन्यास (15 मिनट)

**लक्ष्य**: तीन स्थानीय पर्यावरण बनाएँ और विन्यस्त करें जिनके अलग मान हों। एक आरंभिक परियोजना से प्रारंभ करें; यदि ये नाम पहले से मौजूद हैं तो अप्रयुक्त नामों का प्रयोग करें। ये एप्लिकेशन-विशिष्ट मान टेलीमिति/रनटाइम सेटिंग्स को तब तक बदलते नहीं जब तक आपका टेम्पलेट उनका उपयोग न करे।

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

**सफलता के मानदंड:**
- [ ] तीन पर्यावरण सफलतापूर्वक बनाए गए
- [ ] प्रत्येक पर्यावरण का विन्यास अद्वितीय है
- [ ] त्रुटि के बिना पर्यावरणों के बीच स्विच कर सकते हैं
- [ ] `azd env list` सभी तीन पर्यावरण दिखाता है

### अभ्यास 2: की वॉल्ट सीक्रेट संदर्भ (10-20 मिनट)

**लक्ष्य**: प्लेनटेक्स्ट के बजाय की वॉल्ट संदर्भ संग्रहीत करें। **आरंभिक बिंदु:** एक आरंभिक पर्यावरण, Azure साइन-इन, और की वॉल्ट तक पहुंच जिसके पास डमी सीक्रेट बनाने/पढ़ने की अनुमतियाँ हों। वॉल्ट संचालन शुल्क लगा सकते हैं।

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

**सफलता के मानदंड:**
- [ ] इंटरैक्टिव कमांड चयनित वॉल्ट और सीक्रेट संदर्भ रिपोर्ट करता है
- [ ] स्थानीय `.env` में डमी सीक्रेट की बजाय संदर्भ होता है
- [ ] स्पष्ट कर सकते हैं कि रनटाइम आईडेंटिटी/RBAC और उपभोग अभी भी विन्यस्त होना चाहिए

**सामान्य समस्याएं:** 403 त्रुटि के लिए सही वॉल्ट डेटा-प्लेन भूमिका और प्रसारण समय आवश्यक है; `azd env set ... --secret` मान्य कमांड नहीं है। सामान्य `get-values`/`get-value` आउटपुट को सेंसर कहा नहीं जाना चाहिए। प्रशिक्षण संदर्भ को `azd env unset TRAINING_API_KEY` से हटाएँ; इससे वॉल्ट सीक्रेट डिलीट नहीं होता, जिसे अगर आपने बनाया हो तो अलग से हटाना होगा।

## अगले कदम

- [आपकी पहली परियोजना](../chapter-01-foundation/first-project.md) - विन्यास को अभ्यास में लागू करें
- [परिनियोजन गाइड](../chapter-04-infrastructure/deployment-guide.md) - परिनियोजन के लिए विन्यास का उपयोग करें
- [प्राविजनिंग संसाधन](../chapter-04-infrastructure/provisioning.md) - उत्पादन के लिए तैयार विन्यास

## संदर्भ

- [azd विन्यास संदर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml स्कीमा](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [पर्यावरण चर](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 3 - विन्यास और प्रमाणीकरण
- **⬅️ पिछला**: [आपका पहला प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **➡️ अगला अध्याय**: [अध्याय 4: कोड के रूप में इंफ्रास्ट्रक्चर](../chapter-04-infrastructure/deployment-guide.md)
- **अगका पाठ**: [प्रमाणीकरण और सुरक्षा](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->