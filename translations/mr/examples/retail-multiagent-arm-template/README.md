<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T20:18:08+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "mr"
}
-->
# रिटेल मल्टी-एजंट सोल्यूशन - ARM टेम्पलेट डिप्लॉयमेंट

**अध्याय ५: उत्पादन डिप्लॉयमेंट पॅकेज**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../../README.md)
- **📖 संबंधित अध्याय**: [अध्याय ५: मल्टी-एजंट AI सोल्यूशन्स](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 परिस्थिती मार्गदर्शक**: [पूर्ण अंमलबजावणी](../retail-scenario.md)
- **🎯 जलद डिप्लॉय**: [वन-क्लिक डिप्लॉयमेंट](../../../../examples/retail-multiagent-arm-template)

या डिरेक्टरीमध्ये रिटेल मल्टी-एजंट कस्टमर सपोर्ट सोल्यूशनसाठी संपूर्ण Azure Resource Manager (ARM) टेम्पलेट आहे, जे संपूर्ण आर्किटेक्चरसाठी कोडच्या स्वरूपात इन्फ्रास्ट्रक्चर प्रदान करते.

## 🎯 काय डिप्लॉय केले जाते

### मुख्य इन्फ्रास्ट्रक्चर
- **Azure OpenAI Services** (उच्च उपलब्धतेसाठी मल्टी-रीजन)
  - प्राथमिक रीजन: ग्राहक एजंटसाठी GPT-4o
  - दुय्यम रीजन: इन्व्हेंटरी एजंटसाठी GPT-4o-mini  
  - तृतीय रीजन: टेक्स्ट एम्बेडिंग मॉडेल
  - मूल्यांकन रीजन: GPT-4o ग्रेडर मॉडेल
- **Azure AI Search** व्हेक्टर सर्च क्षमतांसह
- **Azure Storage Account** दस्तऐवज आणि अपलोडसाठी ब्लॉब कंटेनर्ससह
- **Azure Container Apps Environment** ऑटो-स्केलिंगसह
- **Container Apps** एजंट राउटर आणि फ्रंटएंडसाठी
- **Azure Cosmos DB** चॅट हिस्टरी स्टोरेजसाठी
- **Azure Key Vault** गुपित व्यवस्थापनासाठी (पर्यायी)
- **Application Insights** आणि लॉग अॅनालिटिक्स मॉनिटरिंगसाठी (पर्यायी)
- **Document Intelligence** दस्तऐवज प्रक्रिया करण्यासाठी
- **Bing Search API** रिअल-टाइम माहिती मिळवण्यासाठी

### डिप्लॉयमेंट मोड्स

| मोड | वर्णन | उपयोग प्रकरण | संसाधने |
|------|-------------|----------|-----------|
| **मिनिमल** | खर्च-ऑप्टिमाइझ केलेले मूलभूत डिप्लॉयमेंट | विकास, चाचणी | बेसिक SKUs, सिंगल रीजन, कमी क्षमता |
| **स्टँडर्ड** | उत्पादन वर्कलोडसाठी संतुलित डिप्लॉयमेंट | उत्पादन, मध्यम प्रमाण | स्टँडर्ड SKUs, मल्टी-रीजन, स्टँडर्ड क्षमता |
| **प्रिमियम** | उच्च-प्रदर्शन, एंटरप्राइझ-ग्रेड डिप्लॉयमेंट | एंटरप्राइझ, उच्च प्रमाण | प्रिमियम SKUs, मल्टी-रीजन, उच्च क्षमता |

## 📋 पूर्वअट

1. **Azure CLI** स्थापित आणि कॉन्फिगर केलेले
2. **सक्रिय Azure सदस्यता** पुरेशा कोटासह
3. **योग्य परवानग्या** लक्ष्य सदस्यतेमध्ये संसाधने तयार करण्यासाठी
4. **संसाधन कोटा**:
   - Azure OpenAI (रीजनल उपलब्धता तपासा)
   - Container Apps (रीजननुसार बदलते)
   - AI Search (स्टँडर्ड टियर किंवा उच्च शिफारस केलेले)

## 🚀 जलद डिप्लॉयमेंट

### पर्याय १: Azure CLI वापरून

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### पर्याय २: Azure पोर्टल वापरून

[![Azure वर डिप्लॉय करा](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### पर्याय ३: थेट Azure CLI वापरून

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ कॉन्फिगरेशन पर्याय

### टेम्पलेट पॅरामीटर्स

| पॅरामीटर | प्रकार | डीफॉल्ट | वर्णन |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | सर्व संसाधन नावांसाठी प्रिफिक्स |
| `location` | string | संसाधन गट स्थान | प्राथमिक डिप्लॉयमेंट रीजन |
| `secondaryLocation` | string | "westus2" | मल्टी-रीजन डिप्लॉयमेंटसाठी दुय्यम रीजन |
| `tertiaryLocation` | string | "francecentral" | एम्बेडिंग मॉडेलसाठी रीजन |
| `environmentName` | string | "dev" | वातावरणाचे नाव (dev/staging/prod) |
| `deploymentMode` | string | "standard" | डिप्लॉयमेंट कॉन्फिगरेशन (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | मल्टी-रीजन डिप्लॉयमेंट सक्षम करा |
| `enableMonitoring` | bool | true | Application Insights आणि लॉगिंग सक्षम करा |
| `enableSecurity` | bool | true | Key Vault आणि सुधारित सुरक्षा सक्षम करा |

### पॅरामीटर्स सानुकूलित करणे

`azuredeploy.parameters.json` संपादित करा:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ आर्किटेक्चर विहंगावलोकन

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 डिप्लॉयमेंट स्क्रिप्ट वापर

`deploy.sh` स्क्रिप्ट परस्पर डिप्लॉयमेंट अनुभव प्रदान करते:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### स्क्रिप्ट वैशिष्ट्ये

- ✅ **पूर्वअट पडताळणी** (Azure CLI, लॉगिन स्थिती, टेम्पलेट फाइल्स)
- ✅ **संसाधन गट व्यवस्थापन** (असल्यास तयार करते)
- ✅ **टेम्पलेट पडताळणी** डिप्लॉयमेंटपूर्वी
- ✅ **प्रगती मॉनिटरिंग** रंगीत आउटपुटसह
- ✅ **डिप्लॉयमेंट आउटपुट्स** प्रदर्शन
- ✅ **डिप्लॉयमेंटनंतर मार्गदर्शन**

## 📊 डिप्लॉयमेंट मॉनिटरिंग

### डिप्लॉयमेंट स्थिती तपासा

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### डिप्लॉयमेंट आउटपुट्स

यशस्वी डिप्लॉयमेंटनंतर, खालील आउटपुट्स उपलब्ध असतात:

- **फ्रंटएंड URL**: वेब इंटरफेससाठी सार्वजनिक एन्डपॉइंट
- **राउटर URL**: एजंट राउटरसाठी API एन्डपॉइंट
- **OpenAI एन्डपॉइंट्स**: प्राथमिक आणि दुय्यम OpenAI सेवा एन्डपॉइंट्स
- **सर्च सेवा**: Azure AI Search सेवा एन्डपॉइंट
- **स्टोरेज अकाउंट**: दस्तऐवजांसाठी स्टोरेज अकाउंटचे नाव
- **Key Vault**: Key Vault चे नाव (सक्षम असल्यास)
- **Application Insights**: मॉनिटरिंग सेवेसाठी नाव (सक्षम असल्यास)

## 🔧 डिप्लॉयमेंटनंतर कॉन्फिगरेशन

### १. सर्च इंडेक्स कॉन्फिगर करा

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### २. प्रारंभिक डेटा अपलोड करा

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### ३. एजंट एन्डपॉइंट्स चाचणी करा

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### ४. कंटेनर अॅप्स कॉन्फिगर करा

ARM टेम्पलेट प्लेसहोल्डर कंटेनर इमेजेस डिप्लॉय करते. वास्तविक एजंट कोड डिप्लॉय करण्यासाठी:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ समस्या निवारण

### सामान्य समस्या

#### १. Azure OpenAI कोटा ओलांडला

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### २. कंटेनर अॅप्स डिप्लॉयमेंट अयशस्वी

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### ३. सर्च सेवा प्रारंभिकरण

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### डिप्लॉयमेंट पडताळणी

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 सुरक्षा विचार

### की व्यवस्थापन
- सर्व गुपिते Azure Key Vault मध्ये संग्रहित केली जातात (सक्षम असल्यास)
- कंटेनर अॅप्स व्यवस्थापित ओळख वापरतात
- स्टोरेज अकाउंट्स सुरक्षित डीफॉल्ट्ससह (फक्त HTTPS, सार्वजनिक ब्लॉब प्रवेश नाही)

### नेटवर्क सुरक्षा
- कंटेनर अॅप्स शक्य असल्यास अंतर्गत नेटवर्किंग वापरतात
- सर्च सेवा खाजगी एन्डपॉइंट्स पर्यायासह कॉन्फिगर केली जाते
- Cosmos DB आवश्यक किमान परवानग्यांसह कॉन्फिगर केली जाते

### RBAC कॉन्फिगरेशन
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 खर्च ऑप्टिमायझेशन

### खर्च अंदाज (मासिक, USD)

| मोड | OpenAI | कंटेनर अॅप्स | सर्च | स्टोरेज | एकूण अंदाज |
|------|--------|----------------|--------|---------|------------|
| मिनिमल | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| स्टँडर्ड | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| प्रिमियम | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### खर्च मॉनिटरिंग

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 अद्यतने आणि देखभाल

### टेम्पलेट अद्यतने
- ARM टेम्पलेट फाइल्स आवृत्ती नियंत्रणात ठेवा
- विकास वातावरणात बदलांची चाचणी करा
- अद्यतनांसाठी इनक्रिमेंटल डिप्लॉयमेंट मोड वापरा

### संसाधन अद्यतने
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### बॅकअप आणि पुनर्प्राप्ती
- Cosmos DB स्वयंचलित बॅकअप सक्षम
- Key Vault सॉफ्ट डिलीट सक्षम
- कंटेनर अॅप्स पुनरावृत्त्या रोलबॅकसाठी राखल्या जातात

## 📞 समर्थन

- **टेम्पलेट समस्या**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure समर्थन**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **समुदाय**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ तुमचे मल्टी-एजंट सोल्यूशन डिप्लॉय करण्यासाठी तयार आहात?**

सुरू करा: `./deploy.sh -g myResourceGroup`

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात ठेवा की स्वयंचलित भाषांतरे त्रुटी किंवा अचूकतेच्या अभावाने युक्त असू शकतात. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.