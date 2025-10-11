<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-10-11T15:40:44+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "ta"
}
-->
# ரீடெயில் மல்டி-ஏஜென்ட் தீர்வு - ARM டெம்ப்ளேட் டெப்ளாய்மென்ட்

**அத்தியாயம் 5: உற்பத்தி டெப்ளாய்மென்ட் தொகுப்பு**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தொடர்புடைய அத்தியாயம்**: [அத்தியாயம் 5: மல்டி-ஏஜென்ட் AI தீர்வுகள்](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 சூழல் வழிகாட்டி**: [முழுமையான செயல்படுத்தல்](../retail-scenario.md)
- **🎯 விரைவான டெப்ளாய்மென்ட்**: [ஒரே கிளிக் டெப்ளாய்மென்ட்](../../../../examples/retail-multiagent-arm-template)

இந்த கோப்புறை முழுமையான Azure Resource Manager (ARM) டெம்ப்ளேட்டை கொண்டுள்ளது, இது ரீடெயில் மல்டி-ஏஜென்ட் கஸ்டமர் சப்போர்ட் தீர்வை டெப்ளாய் செய்யும், முழு கட்டமைப்பிற்கான கோடாக செயல்படுகிறது.

## 🎯 என்னென்ன டெப்ளாய் செய்யப்படும்

### மைய கட்டமைப்பு
- **Azure OpenAI சேவைகள்** (உயர் கிடைக்கும் தன்மைக்காக மல்டி-பிராந்திய)
  - முதன்மை பிராந்தியம்: GPT-4o கஸ்டமர் ஏஜென்டிற்காக
  - இரண்டாம் நிலை பிராந்தியம்: GPT-4o-mini இன்வென்டரி ஏஜென்டிற்காக  
  - மூன்றாம் நிலை பிராந்தியம்: டெக்ஸ்ட் எம்பெடிங்ஸ் மாடல்
  - மதிப்பீட்டு பிராந்தியம்: GPT-4o கிரேடர் மாடல்
- **Azure AI Search** வெக்டர் தேடல் திறன்களுடன்
- **Azure Storage Account** ஆவணங்கள் மற்றும் பதிவேற்றங்களுக்கான பிளாப் கண்டெய்னர்களுடன்
- **Azure Container Apps Environment** தானியங்கி அளவீடு வசதியுடன்
- **Container Apps** ஏஜென்ட் ரவுடர் மற்றும் முன்னணி பயன்பாட்டிற்காக
- **Azure Cosmos DB** உரையாடல் வரலாறு சேமிப்பிற்காக
- **Azure Key Vault** ரகசியங்களை மேலாண்மை செய்ய (விருப்பத்தேர்வு)
- **Application Insights** மற்றும் Log Analytics கண்காணிப்பிற்காக (விருப்பத்தேர்வு)
- **Document Intelligence** ஆவண செயலாக்கத்திற்காக
- **Bing Search API** நேரடி தகவலுக்காக

### டெப்ளாய்மென்ட் முறைகள்

| முறை | விளக்கம் | பயன்பாடு | வளங்கள் |
|------|-------------|----------|-----------|
| **குறைந்தது** | செலவினத்தை குறைக்கும் அடிப்படை டெப்ளாய்மென்ட் | மேம்பாடு, சோதனை | அடிப்படை SKUs, ஒற்றை பிராந்தியம், குறைந்த திறன் |
| **நிலையானது** | உற்பத்தி வேலைப்பளுவுக்கான சமநிலை டெப்ளாய்மென்ட் | உற்பத்தி, மிதமான அளவு | நிலையான SKUs, மல்டி-பிராந்தியம், நிலையான திறன் |
| **பிரீமியம்** | உயர் செயல்திறன், நிறுவன தர டெப்ளாய்மென்ட் | நிறுவனம், உயர் அளவு | பிரீமியம் SKUs, மல்டி-பிராந்தியம், உயர் திறன் |

## 📋 முன் தேவைகள்

1. **Azure CLI** நிறுவப்பட்டு உள்ளமைக்கப்பட்டிருக்க வேண்டும்
2. **செயலில் உள்ள Azure சந்தா** போதுமான அளவிலான கோட்டாக்களுடன்
3. **சரியான அனுமதிகள்** இலக்கு சந்தாவில் வளங்களை உருவாக்க
4. **வள கோட்டாக்கள்**:
   - Azure OpenAI (பிராந்திய கிடைக்கும் தன்மை சரிபார்க்கவும்)
   - Container Apps (பிராந்தியத்தால் மாறுபடும்)
   - AI Search (நிலையான நிலை அல்லது அதற்கு மேல் பரிந்துரைக்கப்படுகிறது)

## 🚀 விரைவான டெப்ளாய்மென்ட்

### விருப்பம் 1: Azure CLI பயன்படுத்தி

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

### விருப்பம் 2: Azure Portal பயன்படுத்தி

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### விருப்பம் 3: நேரடியாக Azure CLI பயன்படுத்தி

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ உள்ளமைவு விருப்பங்கள்

### டெம்ப்ளேட் அளவுருக்கள்

| அளவுரு | வகை | இயல்புநிலை | விளக்கம் |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | அனைத்து வளங்களின் முன்னொட்டு பெயர் |
| `location` | string | Resource group location | முதன்மை டெப்ளாய்மென்ட் பிராந்தியம் |
| `secondaryLocation` | string | "westus2" | மல்டி-பிராந்திய டெப்ளாய்மென்ட்டிற்கான இரண்டாம் நிலை பிராந்தியம் |
| `tertiaryLocation` | string | "francecentral" | எம்பெடிங்ஸ் மாடலுக்கான பிராந்தியம் |
| `environmentName` | string | "dev" | சூழல் அடையாளம் (dev/staging/prod) |
| `deploymentMode` | string | "standard" | டெப்ளாய்மென்ட் அமைப்பு (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | மல்டி-பிராந்திய டெப்ளாய்மென்ட் இயக்கவும் |
| `enableMonitoring` | bool | true | Application Insights மற்றும் பதிவு இயக்கவும் |
| `enableSecurity` | bool | true | Key Vault மற்றும் மேம்பட்ட பாதுகாப்பை இயக்கவும் |

### அளவுருக்களை தனிப்பயனாக்குதல்

`azuredeploy.parameters.json` ஐ திருத்தவும்:

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

## 🏗️ கட்டமைப்பு கண்ணோட்டம்

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

## 📖 டெப்ளாய்மென்ட் ஸ்கிரிப்ட் பயன்பாடு

`deploy.sh` ஸ்கிரிப்ட் ஒரு இடைமுக டெப்ளாய்மென்ட் அனுபவத்தை வழங்குகிறது:

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

### ஸ்கிரிப்ட் அம்சங்கள்

- ✅ **முன் தேவைகள் சரிபார்ப்பு** (Azure CLI, உள்நுழைவு நிலை, டெம்ப்ளேட் கோப்புகள்)
- ✅ **வளக் குழு மேலாண்மை** (இல்லை என்றால் உருவாக்குகிறது)
- ✅ **டெம்ப்ளேட் சரிபார்ப்பு** டெப்ளாய்மென்ட்டுக்கு முன்
- ✅ **முன்னேற்ற கண்காணிப்பு** வண்ண வெளியீட்டுடன்
- ✅ **டெப்ளாய்மென்ட் வெளியீடுகள்** காட்சி
- ✅ **டெப்ளாய்மென்ட் பிந்தைய வழிகாட்டல்**

## 📊 டெப்ளாய்மென்ட் கண்காணிப்பு

### டெப்ளாய்மென்ட் நிலையை சரிபார்க்க

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

### டெப்ளாய்மென்ட் வெளியீடுகள்

வெற்றிகரமாக டெப்ளாய் செய்த பிறகு, பின்வரும் வெளியீடுகள் கிடைக்கும்:

- **முன்னணி URL**: வலை இடைமுகத்திற்கான பொது முடிவகம்
- **ரவுடர் URL**: ஏஜென்ட் ரவுடருக்கான API முடிவகம்
- **OpenAI முடிவகங்கள்**: முதன்மை மற்றும் இரண்டாம் நிலை OpenAI சேவை முடிவகங்கள்
- **தேடல் சேவை**: Azure AI Search சேவை முடிவகம்
- **ஸ்டோரேஜ் கணக்கு**: ஆவணங்களுக்கான ஸ்டோரேஜ் கணக்கின் பெயர்
- **Key Vault**: Key Vault இன் பெயர் (இயக்கப்பட்டால்)
- **Application Insights**: கண்காணிப்பு சேவையின் பெயர் (இயக்கப்பட்டால்)

## 🔧 டெப்ளாய்மென்ட் பிந்தைய உள்ளமைவு

### 1. தேடல் குறியீட்டை உள்ளமைக்கவும்

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

### 2. ஆரம்ப தரவுகளை பதிவேற்றவும்

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. ஏஜென்ட் முடிவகங்களை சோதிக்கவும்

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. கண்டெய்னர் பயன்பாடுகளை உள்ளமைக்கவும்

ARM டெம்ப்ளேட் இடைநிலை கண்டெய்னர் படங்களை டெப்ளாய் செய்கிறது. உண்மையான ஏஜென்ட் குறியீட்டை டெப்ளாய் செய்ய:

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

## 🛠️ பிழைதிருத்தம்

### பொதுவான பிரச்சினைகள்

#### 1. Azure OpenAI கோட்டா மீறப்பட்டது

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. கண்டெய்னர் பயன்பாடுகள் டெப்ளாய்மென்ட் தோல்வியடைந்தது

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

#### 3. தேடல் சேவை ஆரம்பம்

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### டெப்ளாய்மென்ட் சரிபார்ப்பு

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

## 🔐 பாதுகாப்பு கருத்துக்கள்

### முக்கிய மேலாண்மை
- அனைத்து ரகசியங்களும் Azure Key Vault இல் சேமிக்கப்படும் (இயக்கப்பட்டால்)
- கண்டெய்னர் பயன்பாடுகள் நிர்வகிக்கப்படும் அடையாளத்தை அங்கீகரிக்க பயன்படுத்துகின்றன
- ஸ்டோரேஜ் கணக்குகள் பாதுகாப்பான இயல்புநிலைகளை கொண்டுள்ளன (HTTPS மட்டும், பொது பிளாப் அணுகல் இல்லை)

### நெட்வொர்க் பாதுகாப்பு
- கண்டெய்னர் பயன்பாடுகள் சாத்தியமான இடங்களில் உள்நாட்டு நெட்வொர்க்கை பயன்படுத்துகின்றன
- தேடல் சேவை தனியார் முடிவகங்கள் விருப்பத்துடன் உள்ளமைக்கப்பட்டுள்ளது
- Cosmos DB குறைந்த தேவையான அனுமதிகளுடன் உள்ளமைக்கப்பட்டுள்ளது

### RBAC உள்ளமைவு
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 செலவினத்தை மேம்படுத்தல்

### செலவீன மதிப்பீடுகள் (மாதாந்திரம், USD)

| முறை | OpenAI | Container Apps | Search | Storage | மொத்த மதிப்பீடு |
|------|--------|----------------|--------|---------|------------|
| குறைந்தது | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| நிலையானது | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| பிரீமியம் | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### செலவீன கண்காணிப்பு

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

## 🔄 புதுப்பிப்புகள் மற்றும் பராமரிப்பு

### டெம்ப்ளேட் புதுப்பிப்புகள்
- ARM டெம்ப்ளேட் கோப்புகளை பதிப்பு கட்டுப்பாட்டில் வைத்திருங்கள்
- மேம்பாடுகளை முதலில் மேம்பாட்டு சூழலில் சோதிக்கவும்
- புதுப்பிப்புகளுக்கு இன்க்ரிமென்டல் டெப்ளாய்மென்ட் முறையை பயன்படுத்தவும்

### வள புதுப்பிப்புகள்
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### காப்புப்பிரதி மற்றும் மீட்பு
- Cosmos DB தானியங்கி காப்புப்பிரதி இயக்கப்பட்டுள்ளது
- Key Vault மென்மையான நீக்கம் இயக்கப்பட்டுள்ளது
- கண்டெய்னர் பயன்பாட்டு திருத்தங்கள் திரும்ப பெறுவதற்கான வசதியுடன் பராமரிக்கப்படுகின்றன

## 📞 ஆதரவு

- **டெம்ப்ளேட் பிரச்சினைகள்**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure ஆதரவு**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **சமூகம்**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ உங்கள் மல்டி-ஏஜென்ட் தீர்வை டெப்ளாய் செய்ய தயாரா?**

தொடங்க: `./deploy.sh -g myResourceGroup`

---

**அறிவிப்பு**:  
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழிபெயர்ப்பு சேவையைப் பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கிறோம், ஆனால் தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளவும். அதன் சொந்த மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்களுக்கும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பல்ல.