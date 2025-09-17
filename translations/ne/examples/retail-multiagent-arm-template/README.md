<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T20:18:35+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "ne"
}
-->
# रिटेल मल्टी-एजेन्ट समाधान - एआरएम टेम्प्लेट डिप्लोयमेन्ट

**अध्याय ५: उत्पादन डिप्लोयमेन्ट प्याकेज**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 सम्बन्धित अध्याय**: [अध्याय ५: मल्टी-एजेन्ट एआई समाधानहरू](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 परिदृश्य गाइड**: [पूर्ण कार्यान्वयन](../retail-scenario.md)
- **🎯 छिटो डिप्लोय**: [एक-क्लिक डिप्लोयमेन्ट](../../../../examples/retail-multiagent-arm-template)

यो डाइरेक्टरीमा रिटेल मल्टी-एजेन्ट ग्राहक समर्थन समाधानको लागि सम्पूर्ण Azure Resource Manager (ARM) टेम्प्लेट समावेश छ, जसले सम्पूर्ण आर्किटेक्चरको लागि कोडको रूपमा पूर्वाधार प्रदान गर्दछ।

## 🎯 के के डिप्लोय हुन्छ

### कोर पूर्वाधार
- **Azure OpenAI सेवाहरू** (उच्च उपलब्धताको लागि मल्टी-क्षेत्र)
  - प्राथमिक क्षेत्र: ग्राहक एजेन्टको लागि GPT-4o
  - द्वितीय क्षेत्र: इन्भेन्टरी एजेन्टको लागि GPT-4o-mini  
  - तृतीय क्षेत्र: टेक्स्ट एम्बेडिङ्स मोडेल
  - मूल्याङ्कन क्षेत्र: GPT-4o ग्रेडर मोडेल
- **Azure AI सर्च** भेक्टर सर्च क्षमतासहित
- **Azure स्टोरेज खाता** दस्तावेज र अपलोडहरूको लागि ब्लब कन्टेनरहरूसहित
- **Azure कन्टेनर एप्स वातावरण** स्वतः स्केलिङसहित
- **कन्टेनर एप्स** एजेन्ट राउटर र फ्रन्टएन्डको लागि
- **Azure Cosmos DB** च्याट इतिहास भण्डारणको लागि
- **Azure Key Vault** गोप्य व्यवस्थापनको लागि (वैकल्पिक)
- **Application Insights** र Log Analytics निगरानीको लागि (वैकल्पिक)
- **डकुमेन्ट इन्टेलिजेन्स** दस्तावेज प्रशोधनको लागि
- **Bing Search API** वास्तविक-समय जानकारीको लागि

### डिप्लोयमेन्ट मोडहरू

| मोड | विवरण | प्रयोग केस | स्रोतहरू |
|------|-------------|----------|-----------|
| **मिनिमल** | लागत-अप्टिमाइज गरिएको आधारभूत डिप्लोयमेन्ट | विकास, परीक्षण | आधारभूत SKUs, एकल क्षेत्र, कम क्षमता |
| **स्ट्यान्डर्ड** | उत्पादन कार्यभारहरूको लागि सन्तुलित डिप्लोयमेन्ट | उत्पादन, मध्यम स्केल | स्ट्यान्डर्ड SKUs, मल्टी-क्षेत्र, मानक क्षमता |
| **प्रिमियम** | उच्च-प्रदर्शन, उद्यम-ग्रेड डिप्लोयमेन्ट | उद्यम, उच्च स्केल | प्रिमियम SKUs, मल्टी-क्षेत्र, उच्च क्षमता |

## 📋 पूर्वापेक्षाहरू

1. **Azure CLI** स्थापना गरिएको र कन्फिग गरिएको
2. **सक्रिय Azure सदस्यता** पर्याप्त कोटा सहित
3. **उपयुक्त अनुमति** लक्ष्य सदस्यतामा स्रोतहरू सिर्जना गर्न
4. **स्रोत कोटा**:
   - Azure OpenAI (क्षेत्रीय उपलब्धता जाँच गर्नुहोस्)
   - कन्टेनर एप्स (क्षेत्र अनुसार फरक)
   - AI सर्च (स्ट्यान्डर्ड टियर वा उच्च सिफारिस गरिएको)

## 🚀 छिटो डिप्लोयमेन्ट

### विकल्प १: Azure CLI प्रयोग गर्दै

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

### विकल्प २: Azure पोर्टल प्रयोग गर्दै

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### विकल्प ३: Azure CLI सिधै प्रयोग गर्दै

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ कन्फिगरेसन विकल्पहरू

### टेम्प्लेट प्यारामिटरहरू

| प्यारामिटर | प्रकार | डिफल्ट | विवरण |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | सबै स्रोत नामहरूको लागि प्रिफिक्स |
| `location` | string | स्रोत समूह स्थान | प्राथमिक डिप्लोयमेन्ट क्षेत्र |
| `secondaryLocation` | string | "westus2" | मल्टी-क्षेत्र डिप्लोयमेन्टको लागि द्वितीय क्षेत्र |
| `tertiaryLocation` | string | "francecentral" | एम्बेडिङ्स मोडेलको लागि क्षेत्र |
| `environmentName` | string | "dev" | वातावरण पदनाम (dev/staging/prod) |
| `deploymentMode` | string | "standard" | डिप्लोयमेन्ट कन्फिगरेसन (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | मल्टी-क्षेत्र डिप्लोयमेन्ट सक्षम गर्नुहोस् |
| `enableMonitoring` | bool | true | Application Insights र लगिङ सक्षम गर्नुहोस् |
| `enableSecurity` | bool | true | Key Vault र उन्नत सुरक्षा सक्षम गर्नुहोस् |

### प्यारामिटरहरू अनुकूलन गर्दै

`azuredeploy.parameters.json` सम्पादन गर्नुहोस्:

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

## 📖 डिप्लोयमेन्ट स्क्रिप्ट प्रयोग

`deploy.sh` स्क्रिप्टले अन्तरक्रियात्मक डिप्लोयमेन्ट अनुभव प्रदान गर्दछ:

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

### स्क्रिप्ट सुविधाहरू

- ✅ **पूर्वापेक्षाहरू मान्यता** (Azure CLI, लगइन स्थिति, टेम्प्लेट फाइलहरू)
- ✅ **स्रोत समूह व्यवस्थापन** (अस्तित्वमा नभएमा सिर्जना गर्दछ)
- ✅ **टेम्प्लेट मान्यता** डिप्लोयमेन्ट अघि
- ✅ **प्रगति निगरानी** रंगीन आउटपुटसहित
- ✅ **डिप्लोयमेन्ट आउटपुटहरू** प्रदर्शन
- ✅ **डिप्लोयमेन्ट पछि मार्गदर्शन**

## 📊 डिप्लोयमेन्ट निगरानी

### डिप्लोयमेन्ट स्थिति जाँच गर्नुहोस्

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

### डिप्लोयमेन्ट आउटपुटहरू

सफल डिप्लोयमेन्ट पछि, निम्न आउटपुटहरू उपलब्ध छन्:

- **फ्रन्टएन्ड URL**: वेब इन्टरफेसको सार्वजनिक अन्त बिन्दु
- **राउटर URL**: एजेन्ट राउटरको API अन्त बिन्दु
- **OpenAI अन्त बिन्दुहरू**: प्राथमिक र द्वितीय OpenAI सेवा अन्त बिन्दुहरू
- **सर्च सेवा**: Azure AI सर्च सेवा अन्त बिन्दु
- **स्टोरेज खाता**: दस्तावेजहरूको लागि स्टोरेज खाताको नाम
- **Key Vault**: Key Vault को नाम (यदि सक्षम छ)
- **Application Insights**: निगरानी सेवाको नाम (यदि सक्षम छ)

## 🔧 डिप्लोयमेन्ट पछि कन्फिगरेसन

### १. सर्च इन्डेक्स कन्फिगर गर्नुहोस्

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

### २. प्रारम्भिक डेटा अपलोड गर्नुहोस्

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### ३. एजेन्ट अन्त बिन्दुहरू परीक्षण गर्नुहोस्

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### ४. कन्टेनर एप्स कन्फिगर गर्नुहोस्

ARM टेम्प्लेटले प्लेसहोल्डर कन्टेनर इमेजहरू डिप्लोय गर्दछ। वास्तविक एजेन्ट कोड डिप्लोय गर्न:

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

## 🛠️ समस्या समाधान

### सामान्य समस्याहरू

#### १. Azure OpenAI कोटा नाघ्यो

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### २. कन्टेनर एप्स डिप्लोयमेन्ट असफल भयो

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

#### ३. सर्च सेवा प्रारम्भिककरण

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### डिप्लोयमेन्ट मान्यता

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

## 🔐 सुरक्षा विचारहरू

### कुञ्जी व्यवस्थापन
- सबै गोप्य जानकारी Azure Key Vault मा भण्डारण गरिन्छ (यदि सक्षम छ)
- कन्टेनर एप्सले प्रबन्धित पहिचान प्रयोग गर्दछ प्रमाणीकरणको लागि
- स्टोरेज खाताहरू सुरक्षित डिफल्टहरू (HTTPS मात्र, सार्वजनिक ब्लब पहुँच छैन) प्रयोग गर्दछ

### नेटवर्क सुरक्षा
- कन्टेनर एप्सले सम्भव भएमा आन्तरिक नेटवर्किङ प्रयोग गर्दछ
- सर्च सेवा निजी अन्त बिन्दु विकल्पसहित कन्फिगर गरिएको छ
- Cosmos DB न्यूनतम आवश्यक अनुमति सहित कन्फिगर गरिएको छ

### RBAC कन्फिगरेसन
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 लागत अप्टिमाइजेसन

### लागत अनुमान (मासिक, USD)

| मोड | OpenAI | कन्टेनर एप्स | सर्च | स्टोरेज | कुल अनुमान |
|------|--------|----------------|--------|---------|------------|
| मिनिमल | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| स्ट्यान्डर्ड | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| प्रिमियम | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### लागत निगरानी

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

## 🔄 अपडेटहरू र मर्मत

### टेम्प्लेट अपडेटहरू
- ARM टेम्प्लेट फाइलहरू संस्करण नियन्त्रण गर्नुहोस्
- विकास वातावरणमा परिवर्तनहरू परीक्षण गर्नुहोस्
- अपडेटहरूको लागि वृद्धिशील डिप्लोयमेन्ट मोड प्रयोग गर्नुहोस्

### स्रोत अपडेटहरू
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### ब्याकअप र रिकभरी
- Cosmos DB स्वचालित ब्याकअप सक्षम
- Key Vault सफ्ट डिलिट सक्षम
- कन्टेनर एप्स संशोधनहरू रोलब्याकको लागि कायम राखिएको

## 📞 समर्थन

- **टेम्प्लेट समस्याहरू**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure समर्थन**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **समुदाय**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ तपाईंको मल्टी-एजेन्ट समाधान डिप्लोय गर्न तयार?**

सुरु गर्नुहोस्: `./deploy.sh -g myResourceGroup`

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी यथार्थताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। यसको मूल भाषा मा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।