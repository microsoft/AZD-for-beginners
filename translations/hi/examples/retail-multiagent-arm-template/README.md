<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T17:14:37+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "hi"
}
-->
# रिटेल मल्टी-एजेंट सॉल्यूशन - ARM टेम्पलेट डिप्लॉयमेंट

**अध्याय 5: प्रोडक्शन डिप्लॉयमेंट पैकेज**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../../README.md)
- **📖 संबंधित अध्याय**: [अध्याय 5: मल्टी-एजेंट AI सॉल्यूशंस](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 परिदृश्य गाइड**: [पूर्ण कार्यान्वयन](../retail-scenario.md)
- **🎯 त्वरित डिप्लॉय**: [वन-क्लिक डिप्लॉयमेंट](../../../../examples/retail-multiagent-arm-template)

यह डायरेक्टरी रिटेल मल्टी-एजेंट कस्टमर सपोर्ट सॉल्यूशन को डिप्लॉय करने के लिए एक संपूर्ण Azure Resource Manager (ARM) टेम्पलेट प्रदान करती है, जो पूरी आर्किटेक्चर के लिए कोड के रूप में इंफ्रास्ट्रक्चर उपलब्ध कराती है।

## 🎯 क्या-क्या डिप्लॉय होता है

### कोर इंफ्रास्ट्रक्चर
- **Azure OpenAI सेवाएं** (उच्च उपलब्धता के लिए मल्टी-रीजन)
  - प्राथमिक रीजन: कस्टमर एजेंट के लिए GPT-4o
  - द्वितीयक रीजन: इन्वेंटरी एजेंट के लिए GPT-4o-mini  
  - तृतीयक रीजन: टेक्स्ट एम्बेडिंग मॉडल
  - मूल्यांकन रीजन: GPT-4o ग्रेडर मॉडल
- **Azure AI सर्च** वेक्टर सर्च क्षमताओं के साथ
- **Azure स्टोरेज अकाउंट** डॉक्यूमेंट्स और अपलोड्स के लिए ब्लॉब कंटेनर्स के साथ
- **Azure कंटेनर ऐप्स एनवायरनमेंट** ऑटो-स्केलिंग के साथ
- **कंटेनर ऐप्स** एजेंट राउटर और फ्रंटएंड के लिए
- **Azure Cosmos DB** चैट हिस्ट्री स्टोरेज के लिए
- **Azure Key Vault** सीक्रेट्स मैनेजमेंट के लिए (वैकल्पिक)
- **Application Insights** और लॉग एनालिटिक्स मॉनिटरिंग के लिए (वैकल्पिक)
- **डॉक्यूमेंट इंटेलिजेंस** डॉक्यूमेंट प्रोसेसिंग के लिए
- **Bing Search API** रियल-टाइम जानकारी के लिए

### डिप्लॉयमेंट मोड्स

| मोड | विवरण | उपयोग का मामला | संसाधन |
|------|-------------|----------|-----------|
| **मिनिमल** | लागत-अनुकूल बेसिक डिप्लॉयमेंट | डेवलपमेंट, टेस्टिंग | बेसिक SKUs, सिंगल रीजन, कम क्षमता |
| **स्टैंडर्ड** | प्रोडक्शन वर्कलोड्स के लिए संतुलित डिप्लॉयमेंट | प्रोडक्शन, मध्यम स्केल | स्टैंडर्ड SKUs, मल्टी-रीजन, स्टैंडर्ड क्षमता |
| **प्रीमियम** | उच्च-प्रदर्शन, एंटरप्राइज-ग्रेड डिप्लॉयमेंट | एंटरप्राइज, उच्च स्केल | प्रीमियम SKUs, मल्टी-रीजन, उच्च क्षमता |

## 📋 आवश्यकताएँ

1. **Azure CLI** इंस्टॉल और कॉन्फ़िगर किया हुआ
2. **सक्रिय Azure सब्सक्रिप्शन** पर्याप्त कोटा के साथ
3. **उपयुक्त अनुमतियाँ** लक्ष्य सब्सक्रिप्शन में संसाधन बनाने के लिए
4. **संसाधन कोटा**:
   - Azure OpenAI (रीजनल उपलब्धता जांचें)
   - कंटेनर ऐप्स (रीजन के अनुसार भिन्न)
   - AI सर्च (स्टैंडर्ड टियर या उच्चतर अनुशंसित)

## 🚀 त्वरित डिप्लॉयमेंट

### विकल्प 1: Azure CLI का उपयोग करके

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

### विकल्प 2: Azure पोर्टल का उपयोग करके

[![Azure पर डिप्लॉय करें](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### विकल्प 3: सीधे Azure CLI का उपयोग करके

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ कॉन्फ़िगरेशन विकल्प

### टेम्पलेट पैरामीटर्स

| पैरामीटर | प्रकार | डिफ़ॉल्ट | विवरण |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | सभी संसाधन नामों के लिए प्रीफिक्स |
| `location` | string | संसाधन समूह स्थान | प्राथमिक डिप्लॉयमेंट रीजन |
| `secondaryLocation` | string | "westus2" | मल्टी-रीजन डिप्लॉयमेंट के लिए द्वितीयक रीजन |
| `tertiaryLocation` | string | "francecentral" | एम्बेडिंग मॉडल के लिए रीजन |
| `environmentName` | string | "dev" | पर्यावरण का नामांकन (dev/staging/prod) |
| `deploymentMode` | string | "standard" | डिप्लॉयमेंट कॉन्फ़िगरेशन (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | मल्टी-रीजन डिप्लॉयमेंट सक्षम करें |
| `enableMonitoring` | bool | true | Application Insights और लॉगिंग सक्षम करें |
| `enableSecurity` | bool | true | Key Vault और उन्नत सुरक्षा सक्षम करें |

### पैरामीटर्स को कस्टमाइज़ करना

`azuredeploy.parameters.json` संपादित करें:

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

## 🏗️ आर्किटेक्चर अवलोकन

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

## 📖 डिप्लॉयमेंट स्क्रिप्ट उपयोग

`deploy.sh` स्क्रिप्ट एक इंटरैक्टिव डिप्लॉयमेंट अनुभव प्रदान करती है:

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

### स्क्रिप्ट फीचर्स

- ✅ **आवश्यकताओं का सत्यापन** (Azure CLI, लॉगिन स्थिति, टेम्पलेट फाइलें)
- ✅ **संसाधन समूह प्रबंधन** (यदि मौजूद नहीं है तो बनाता है)
- ✅ **टेम्पलेट सत्यापन** डिप्लॉयमेंट से पहले
- ✅ **प्रगति मॉनिटरिंग** रंगीन आउटपुट के साथ
- ✅ **डिप्लॉयमेंट आउटपुट्स** प्रदर्शन
- ✅ **डिप्लॉयमेंट के बाद मार्गदर्शन**

## 📊 डिप्लॉयमेंट मॉनिटरिंग

### डिप्लॉयमेंट स्थिति जांचें

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

सफल डिप्लॉयमेंट के बाद, निम्नलिखित आउटपुट्स उपलब्ध हैं:

- **फ्रंटएंड URL**: वेब इंटरफेस के लिए सार्वजनिक एन्डपॉइंट
- **राउटर URL**: एजेंट राउटर के लिए API एन्डपॉइंट
- **OpenAI एन्डपॉइंट्स**: प्राथमिक और द्वितीयक OpenAI सेवा एन्डपॉइंट्स
- **सर्च सेवा**: Azure AI सर्च सेवा एन्डपॉइंट
- **स्टोरेज अकाउंट**: डॉक्यूमेंट्स के लिए स्टोरेज अकाउंट का नाम
- **Key Vault**: Key Vault का नाम (यदि सक्षम है)
- **Application Insights**: मॉनिटरिंग सेवा का नाम (यदि सक्षम है)

## 🔧 डिप्लॉयमेंट के बाद कॉन्फ़िगरेशन

### 1. सर्च इंडेक्स कॉन्फ़िगर करें

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

### 2. प्रारंभिक डेटा अपलोड करें

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. एजेंट एन्डपॉइंट्स का परीक्षण करें

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. कंटेनर ऐप्स कॉन्फ़िगर करें

ARM टेम्पलेट प्लेसहोल्डर कंटेनर इमेजेस डिप्लॉय करता है। वास्तविक एजेंट कोड डिप्लॉय करने के लिए:

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

### सामान्य समस्याएँ

#### 1. Azure OpenAI कोटा समाप्त

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. कंटेनर ऐप्स डिप्लॉयमेंट विफल

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

#### 3. सर्च सेवा प्रारंभिककरण

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### डिप्लॉयमेंट सत्यापन

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

### कुंजी प्रबंधन
- सभी सीक्रेट्स Azure Key Vault में संग्रहीत हैं (यदि सक्षम है)
- कंटेनर ऐप्स प्रबंधित पहचान का उपयोग करते हैं
- स्टोरेज अकाउंट्स में सुरक्षित डिफॉल्ट्स हैं (केवल HTTPS, कोई सार्वजनिक ब्लॉब एक्सेस नहीं)

### नेटवर्क सुरक्षा
- कंटेनर ऐप्स आंतरिक नेटवर्किंग का उपयोग करते हैं जहाँ संभव हो
- सर्च सेवा निजी एन्डपॉइंट्स विकल्प के साथ कॉन्फ़िगर की गई है
- Cosmos DB न्यूनतम आवश्यक अनुमतियों के साथ कॉन्फ़िगर की गई है

### RBAC कॉन्फ़िगरेशन
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 लागत अनुकूलन

### लागत अनुमान (मासिक, USD)

| मोड | OpenAI | कंटेनर ऐप्स | सर्च | स्टोरेज | कुल अनुमानित |
|------|--------|----------------|--------|---------|------------|
| मिनिमल | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| स्टैंडर्ड | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| प्रीमियम | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### लागत मॉनिटरिंग

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

## 🔄 अपडेट्स और रखरखाव

### टेम्पलेट अपडेट्स
- ARM टेम्पलेट फाइल्स का वर्शन कंट्रोल करें
- पहले डेवलपमेंट एनवायरनमेंट में बदलावों का परीक्षण करें
- अपडेट्स के लिए इंक्रीमेंटल डिप्लॉयमेंट मोड का उपयोग करें

### संसाधन अपडेट्स
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### बैकअप और रिकवरी
- Cosmos DB में स्वचालित बैकअप सक्षम है
- Key Vault में सॉफ्ट डिलीट सक्षम है
- कंटेनर ऐप्स में रिवीजन बनाए रखे जाते हैं रोलबैक के लिए

## 📞 सहायता

- **टेम्पलेट समस्याएँ**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure सहायता**: [Azure सहायता पोर्टल](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **समुदाय**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ क्या आप अपना मल्टी-एजेंट सॉल्यूशन डिप्लॉय करने के लिए तैयार हैं?**

शुरू करें: `./deploy.sh -g myResourceGroup`

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।