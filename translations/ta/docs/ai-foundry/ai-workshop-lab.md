<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-10-11T16:04:45+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "ta"
}
-->
# AI பணிக்கூடம் ஆய்வகம்: உங்கள் AI தீர்வுகளை AZD-Deployable ஆக்குதல்

**அத்தியாய வழிகாட்டுதல்:**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பக்கட்டம்](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை மேம்பாடு
- **⬅️ முந்தையது**: [AI மாடல் பிரயோகம்](ai-model-deployment.md)
- **➡️ அடுத்தது**: [தயாரிப்பு AI சிறந்த நடைமுறைகள்](production-ai-practices.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../getting-started/configuration.md)

## பணிக்கூடம் கண்ணோட்டம்

இந்த கையால் செய்யும் ஆய்வகம், ஏற்கனவே உள்ள AI டெம்ப்ளேட்டை எடுத்து Azure Developer CLI (AZD) மூலம் பிரயோகிக்க வழிகாட்டுகிறது. Azure AI Foundry சேவைகளைப் பயன்படுத்தி தயாரிப்பு AI பிரயோகங்களுக்கான முக்கியமான வடிவங்களை நீங்கள் கற்றுக்கொள்வீர்கள்.

**கால அளவு:** 2-3 மணி நேரம்  
**நிலை:** நடுநிலை  
**முன் தேவைகள்:** அடிப்படை Azure அறிவு, AI/ML கருத்துக்களுடன் பரிச்சயம்

## 🎓 கற்றல் நோக்கங்கள்

இந்த பணிக்கூடத்தின் முடிவில், நீங்கள்:
- ✅ ஏற்கனவே உள்ள AI பயன்பாட்டை AZD டெம்ப்ளேட்டுகளுக்கு மாற்ற முடியும்
- ✅ AZD மூலம் Azure AI Foundry சேவைகளை அமைக்க முடியும்
- ✅ AI சேவைகளுக்கான பாதுகாப்பான சான்றிதழ் மேலாண்மையை செயல்படுத்த முடியும்
- ✅ கண்காணிப்புடன் தயாரிப்பு-தயார் AI பயன்பாடுகளை பிரயோகிக்க முடியும்
- ✅ பொதுவான AI பிரயோகம் சிக்கல்களை சரிசெய்ய முடியும்

## முன் தேவைகள்

### தேவையான கருவிகள்
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) நிறுவப்பட்டது
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) நிறுவப்பட்டது
- [Git](https://git-scm.com/) நிறுவப்பட்டது
- குறியீடு திருத்தி (VS Code பரிந்துரைக்கப்படுகிறது)

### Azure வளங்கள்
- பங்களிப்பாளர் அணுகலுடன் Azure சந்தா
- Azure OpenAI சேவைகளுக்கான அணுகல் (அல்லது அணுகலை கோருவதற்கான திறன்)
- வளக் குழு உருவாக்க அனுமதிகள்

### அறிவு முன் தேவைகள்
- Azure சேவைகளின் அடிப்படை புரிதல்
- கட்டளைகள் வரி இடைமுகங்களுடன் பரிச்சயம்
- அடிப்படை AI/ML கருத்துக்கள் (APIகள், மாடல்கள், உந்துதல்கள்)

## ஆய்வக அமைப்பு

### படி 1: சூழல் தயாரிப்பு

1. **கருவி நிறுவல்களை சரிபார்க்கவும்:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **பணிக்கூடக் களஞ்சியத்தை கிளோன் செய்யவும்:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```


## தொகுதி 1: AI பயன்பாடுகளுக்கான AZD அமைப்பை புரிந்துகொள்வது

### AI-தயார் AZD டெம்ப்ளேட்டின் அமைப்பு

AI-தயார் AZD டெம்ப்ளேட்டில் முக்கிய கோப்புகளை ஆராயுங்கள்:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```


### **ஆய்வக பயிற்சி 1.1: கட்டமைப்பை ஆராயுங்கள்**

1. **azure.yaml கோப்பை பரிசோதிக்கவும்:**
```bash
cat azure.yaml
```

**கண்டறிய வேண்டியவை:**
- AI கூறுகளுக்கான சேவை வரையறைகள்
- சூழல் மாறி வரைபடங்கள்
- ஹோஸ்ட் கட்டமைப்புகள்

2. **main.bicep அடிப்படை அமைப்பை மதிப்பீடு செய்யவும்:**
```bash
cat infra/main.bicep
```

**கண்டறிய வேண்டிய முக்கிய AI வடிவங்கள்:**
- Azure OpenAI சேவை வழங்கல்
- Cognitive Search ஒருங்கிணைப்பு
- பாதுகாப்பான விசை மேலாண்மை
- நெட்வொர்க் பாதுகாப்பு கட்டமைப்புகள்

### **விவாத புள்ளி:** AIக்கு இந்த வடிவங்கள் ஏன் முக்கியம்

- **சேவை சார்புகள்**: AI பயன்பாடுகள் பல ஒருங்கிணைந்த சேவைகளை தேவைப்படுத்துகின்றன
- **பாதுகாப்பு**: API விசைகள் மற்றும் முடிவுகள் பாதுகாப்பாக மேலாண்மை செய்யப்பட வேண்டும்
- **மிகைப்படுத்தல்**: AI பணிகள் தனித்துவமான மிகைப்படுத்தல் தேவைகளை கொண்டுள்ளன
- **செலவு மேலாண்மை**: AI சேவைகள் சரியாக அமைக்கப்படாவிட்டால் செலவாக இருக்கலாம்

## தொகுதி 2: உங்கள் முதல் AI பயன்பாட்டை பிரயோகிக்கவும்

### படி 2.1: சூழலை ஆரம்பிக்கவும்

1. **புதிய AZD சூழலை உருவாக்கவும்:**
```bash
azd env new myai-workshop
```

2. **தேவையான அளவுரைகளை அமைக்கவும்:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```


### படி 2.2: அடிப்படை அமைப்பு மற்றும் பயன்பாட்டை பிரயோகிக்கவும்

1. **AZD மூலம் பிரயோகிக்கவும்:**
```bash
azd up
```

**`azd up` நடக்கும் போது:**
- ✅ Azure OpenAI சேவையை வழங்குகிறது
- ✅ Cognitive Search சேவையை உருவாக்குகிறது
- ✅ வலை பயன்பாட்டுக்கான App Service அமைக்கிறது
- ✅ நெட்வொர்க் மற்றும் பாதுகாப்பை அமைக்கிறது
- ✅ பயன்பாட்டு குறியீட்டை பிரயோகிக்கிறது
- ✅ கண்காணிப்பு மற்றும் பதிவு அமைக்கிறது

2. **பிரயோகம் முன்னேற்றத்தை கண்காணிக்கவும்** மற்றும் உருவாக்கப்படும் வளங்களை கவனிக்கவும்.

### படி 2.3: உங்கள் பிரயோகத்தை சரிபார்க்கவும்

1. **பிரயோகிக்கப்பட்ட வளங்களை சரிபார்க்கவும்:**
```bash
azd show
```

2. **பிரயோகிக்கப்பட்ட பயன்பாட்டை திறக்கவும்:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI செயல்பாட்டை சோதிக்கவும்:**
   - வலை பயன்பாட்டிற்கு செல்லவும்
   - மாதிரி கேள்விகளை முயற்சிக்கவும்
   - AI பதில்கள் செயல்படுகின்றனவா என்பதை உறுதிப்படுத்தவும்

### **ஆய்வக பயிற்சி 2.1: சிக்கல் தீர்க்கும் பயிற்சி**

**தருணம்**: உங்கள் பிரயோகம் வெற்றிகரமாக முடிந்தது, ஆனால் AI பதிலளிக்கவில்லை.

**சோதிக்க வேண்டிய பொதுவான சிக்கல்கள்:**
1. **OpenAI API விசைகள்**: சரியாக அமைக்கப்பட்டுள்ளனவா என்பதை உறுதிப்படுத்தவும்
2. **மாடல் கிடைப்பாடு**: உங்கள் பிராந்தியத்தில் மாடல் ஆதரிக்கப்படுகிறதா என்பதை சரிபார்க்கவும்
3. **நெட்வொர்க் இணைப்பு**: சேவைகள் தொடர்பு கொள்ள முடிகிறதா என்பதை உறுதிப்படுத்தவும்
4. **RBAC அனுமதிகள்**: பயன்பாடு OpenAIயை அணுக முடிகிறதா என்பதை உறுதிப்படுத்தவும்

**பிழைதிருத்த கட்டளைகள்:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```


## தொகுதி 3: உங்கள் தேவைகளுக்கான AI பயன்பாடுகளை தனிப்பயனாக்குதல்

### படி 3.1: AI கட்டமைப்பை மாற்றவும்

1. **OpenAI மாடலை புதுப்பிக்கவும்:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **கூடுதல் AI சேவைகளைச் சேர்க்கவும்:**

Document Intelligence சேர்க்க infra/main.bicep திருத்தவும்:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```


### படி 3.2: சூழல்-குறிப்பிட்ட கட்டமைப்புகள்

**சிறந்த நடைமுறை**: மேம்பாடு மற்றும் தயாரிப்பு ஆகியவற்றுக்கு வேறுபட்ட கட்டமைப்புகள்.

1. **தயாரிப்பு சூழலை உருவாக்கவும்:**
```bash
azd env new myai-production
```

2. **தயாரிப்பு-குறிப்பிட்ட அளவுரைகளை அமைக்கவும்:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```


### **ஆய்வக பயிற்சி 3.1: செலவு மிகைப்படுத்தல்**

**சவால்**: செலவுச்செலவான மேம்பாட்டுக்கான டெம்ப்ளேட்டை அமைக்கவும்.

**பணிகள்:**
1. எந்த SKUs இலவச/அடிப்படை நிலைகளுக்கு அமைக்கப்படலாம் என்பதை கண்டறியவும்
2. குறைந்த செலவுக்கான சூழல் மாறிகளை அமைக்கவும்
3. தயாரிப்பு கட்டமைப்புடன் செலவுகளை ஒப்பிடவும்

**தீர்வு குறிப்புகள்:**
- Cognitive Servicesக்கு F0 (இலவச) நிலையை பயன்படுத்தவும்
- மேம்பாட்டில் Search Serviceக்கு அடிப்படை நிலையை பயன்படுத்தவும்
- Functionsக்கு Consumption திட்டத்தை பயன்படுத்தவும்

## தொகுதி 4: பாதுகாப்பு மற்றும் தயாரிப்பு சிறந்த நடைமுறைகள்

### படி 4.1: பாதுகாப்பான சான்றிதழ் மேலாண்மை

**தற்போதைய சவால்**: பல AI பயன்பாடுகள் API விசைகளை கடினமாக குறியீட்டில் அல்லது பாதுகாப்பற்ற சேமிப்பில் பயன்படுத்துகின்றன.

**AZD தீர்வு**: Managed Identity + Key Vault ஒருங்கிணைப்பு.

1. **உங்கள் டெம்ப்ளேட்டில் பாதுகாப்பு கட்டமைப்பை மதிப்பீடு செய்யவும்:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity செயல்படுகிறதா என்பதை உறுதிப்படுத்தவும்:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```


### படி 4.2: நெட்வொர்க் பாதுகாப்பு

1. **தனியார் முடிவுகளை இயக்கவும்** (இன்னும் அமைக்கப்படவில்லை என்றால்):

உங்கள் bicep டெம்ப்ளேட்டில் சேர்க்கவும்:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```


### படி 4.3: கண்காணிப்பு மற்றும் கண்காணிப்பு திறன்

1. **Application Insights அமைக்கவும்:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-குறிப்பிட்ட கண்காணிப்பை அமைக்கவும்:**

AI செயல்பாடுகளுக்கான தனிப்பயன் அளவுகோள்களைச் சேர்க்கவும்:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```


### **ஆய்வக பயிற்சி 4.1: பாதுகாப்பு ஆய்வு**

**பணி**: உங்கள் பிரயோகத்தை பாதுகாப்பு சிறந்த நடைமுறைகளுக்கான மதிப்பீடு செய்யவும்.

**சரிபார்ப்பு பட்டியல்:**
- [ ] குறியீடு அல்லது கட்டமைப்பில் கடினமாக குறியீட்டப்பட்ட ரகசியங்கள் இல்லை
- [ ] Managed Identity சேவை-சேவை அங்கீகாரத்திற்குப் பயன்படுத்தப்பட்டது
- [ ] Key Vault ரகசியமான கட்டமைப்புகளை சேமிக்கிறது
- [ ] நெட்வொர்க் அணுகல் சரியாக கட்டுப்படுத்தப்பட்டுள்ளது
- [ ] கண்காணிப்பு மற்றும் பதிவு இயக்கப்பட்டுள்ளது

## தொகுதி 5: உங்கள் சொந்த AI பயன்பாட்டை மாற்றுதல்

### படி 5.1: மதிப்பீடு வேலைப்பதிவு

**உங்கள் பயன்பாட்டை மாற்றுவதற்கு முன்**, இந்த கேள்விகளுக்கு பதிலளிக்கவும்:

1. **பயன்பாட்டு கட்டமைப்பு:**
   - உங்கள் பயன்பாடு எந்த AI சேவைகளைப் பயன்படுத்துகிறது?
   - எந்த கணினி வளங்களை தேவைப்படுத்துகிறது?
   - இது தரவுத்தொகையை தேவைப்படுத்துகிறதா?
   - சேவைகளுக்கிடையேயான சார்புகள் என்ன?

2. **பாதுகாப்பு தேவைகள்:**
   - உங்கள் பயன்பாடு எந்த ரகசியமான தரவுகளை கையாளுகிறது?
   - உங்கள் பயன்பாட்டிற்கு என்ன соответствக compliances தேவை?
   - உங்களுக்கு தனியார் நெட்வொர்க் தேவைப்படுகிறதா?

3. **மிகைப்படுத்தல் தேவைகள்:**
   - உங்கள் எதிர்பார்க்கப்படும் சுமை என்ன?
   - உங்களுக்கு தானியக்க மிகைப்படுத்தல் தேவைப்படுகிறதா?
   - பிராந்திய தேவைகள் உள்ளனவா?

### படி 5.2: உங்கள் AZD டெம்ப்ளேட்டை உருவாக்கவும்

**உங்கள் பயன்பாட்டை மாற்ற இந்த வடிவத்தை பின்பற்றவும்:**

1. **அடிப்படை அமைப்பை உருவாக்கவும்:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **azure.yaml உருவாக்கவும்:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **அடிப்படை அமைப்பு டெம்ப்ளேட்டுகளை உருவாக்கவும்:**

**infra/main.bicep** - முக்கிய டெம்ப்ளேட்:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI தொகுதி:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```


### **ஆய்வக பயிற்சி 5.1: டெம்ப்ளேட் உருவாக்க சவால்**

**சவால்**: ஆவண செயலாக்க AI பயன்பாட்டுக்கான AZD டெம்ப்ளேட்டை உருவாக்கவும்.

**தேவைகள்:**
- உள்ளடக்க பகுப்பாய்வுக்கான Azure OpenAI
- OCRக்கான Document Intelligence
- ஆவண பதிவேற்றத்திற்கான Storage Account
- செயலாக்க தர்க்கத்திற்கான Function App
- பயனர் இடைமுகத்திற்கான வலை பயன்பாடு

**கூடுதல் புள்ளிகள்:**
- சரியான பிழை கையாளுதலைச் சேர்க்கவும்
- செலவுக்கான மதிப்பீட்டைச் சேர்க்கவும்
- கண்காணிப்பு டாஷ்போர்டுகளை அமைக்கவும்

## தொகுதி 6: பொதுவான சிக்கல்களை சரிசெய்தல்

### பொதுவான பிரயோகம் சிக்கல்கள்

#### சிக்கல் 1: OpenAI சேவை அளவுரு மீறப்பட்டது
**அறிகுறிகள்:** அளவுரு பிழையுடன் பிரயோகம் தோல்வி
**தீர்வுகள்:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```


#### சிக்கல் 2: மாடல் பிராந்தியத்தில் கிடைக்கவில்லை
**அறிகுறிகள்:** AI பதில்கள் தோல்வி அல்லது மாடல் பிரயோகம் பிழைகள்
**தீர்வுகள்:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```


#### சிக்கல் 3: அனுமதி சிக்கல்கள்
**அறிகுறிகள்:** AI சேவைகளை அழைக்கும் போது 403 தடை பிழைகள்
**தீர்வுகள்:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```


### செயல்திறன் சிக்கல்கள்

#### சிக்கல் 4: மெதுவான AI பதில்கள்
**ஆய்வு படிகள்:**
1. Application Insightsல் செயல்திறன் அளவுகோள்களைச் சரிபார்க்கவும்
2. Azure போர்ட்டலில் OpenAI சேவை அளவுகோள்களை மதிப்பீடு செய்யவும்
3. நெட்வொர்க் இணைப்பு மற்றும் தாமதத்தை சரிபார்க்கவும்

**தீர்வுகள்:**
- பொதுவான கேள்விகளுக்கு காட்சிப்படுத்தல் செயல்படுத்தவும்
- உங்கள் பயன்பாட்டிற்கான சரியான OpenAI மாடலைப் பயன்படுத்தவும்
- அதிக சுமை சூழல்களுக்கு வாசிப்பு பிரதிகளைப் பரிசீலிக்கவும்

### **ஆய்வக பயிற்சி 6.1: பிழைதிருத்த சவால்**

**தருணம்**: உங்கள் பிரயோகம் வெற்றிகரமாக முடிந்தது, ஆனால் பயன்பாடு 500 பிழைகளைத் திருப்புகிறது.

**பிழைதிருத்த பணிகள்:**
1. பயன்பாட்டு பதிவுகளைச் சரிபார்க்கவும்
2. சேவை இணைப்பை உறுதிப்படுத்தவும்
3. அங்கீகாரத்தை சோதிக்கவும்
4. கட்டமைப்பை மதிப்பீடு செய்யவும்

**பயன்படுத்த வேண்டிய கருவிகள்:**
- `azd show` பிரயோகம் கண்ணோட்டத்திற்காக
- Azure போர்ட்டல் விவரமான சேவை பதிவுகளுக்காக
- Application Insights பயன்பாட்டு தொலைநோக்கத்திற்காக

## தொகுதி 7: கண்காணிப்பு மற்றும் மிகைப்படுத்தல்

### படி 7.1: விரிவான கண்காணிப்பை அமைக்கவும்

1. **தனிப்பயன் டாஷ்போர்டுகளை உருவாக்கவும்:**

Azure போர்ட்டலுக்கு செல்லவும் மற்றும் டாஷ்போர்டை உருவாக்கவும்:
- OpenAI கோரிக்கை எண்ணிக்கை மற்றும் தாமதம்
- பயன்பாட்டு பிழை விகிதங்கள்
- வள பயன்பாடு
- செலவு கண்காணிப்பு

2. **எச்சரிக்கைகளை அமைக்கவும்:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```


### படி 7.2: செலவு மிகைப்படுத்தல்

1. **தற்போதைய செலவுகளை மதிப்பீடு செய்யவும்:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **செலவு கட்டுப்பாடுகளை செயல்படுத்தவும்:**
- பட்ஜெட் எச்சரிக்கைகளை அமைக்கவும்
- தானியக்க மிகைப்படுத்தல் கொள்கைகளைப் பயன்படுத்தவும்
- கோரிக்கை காட்சிப்படுத்தலை செயல்படுத்தவும்
- OpenAIக்கு டோக்கன் பயன்பாட்டை கண்காணிக்கவும்

### **ஆய்வக பயிற்சி 7.1: செயல்திறன் மிகைப்படுத்தல்**

**பணி**: உங்கள் AI பயன்பாட்டை செயல்திறன் மற்றும் செலவுக்காக மிகைப்படுத்தவும்.

**மிகைப்படுத்த வேண்டிய அளவுகோள்கள்:**
- சராசரி பதிலளிப்பு நேரத்தை 20% குறைக்கவும்
- மாதாந்திர செலவுகளை 15% குறைக்கவும்
- 99.9% நேரம் பராமரிக்கவும்

**முயற்சிக்க வேண்டிய உத்திகள்:**
- பதிலளிப்பு காட்சிப்படுத்தலை செயல்படுத்தவும்
- டோக்கன் திறனுக்கான உந்துதல்களை மிகைப்படுத்தவும்
- சரியான கணினி SKUs பயன்படுத்தவும்
- சரியான தானியக்க மிகைப்படுத்தலை அமைக்கவும்

## இறுதி சவால்: முடிவுக்கு முழுமையான செயல்பாடு

### சவால் தருணம்

உங்கள் பணி, இந்த தேவைகளுடன் தயாரிப்பு-தயார் AI-சக்தியுள்ள வாடிக்கையாளர் சேவை chatbot உருவாக்குவது:

**
வாழ்த்துக்கள்! நீங்கள் AI பணிக்கான பயிற்சி ஆய்வகத்தை முடித்துவிட்டீர்கள். இப்போது நீங்கள் கீழே உள்ளவற்றை செய்ய முடியும்:

- ✅ ஏற்கனவே உள்ள AI பயன்பாடுகளை AZD டெம்ப்ளேட்களாக மாற்றுதல்
- ✅ உற்பத்திக்கு தயாரான AI பயன்பாடுகளை வெளியிடுதல்
- ✅ AI பணிச்சுமைகளுக்கான பாதுகாப்பு சிறந்த நடைமுறைகளை செயல்படுத்துதல்
- ✅ AI பயன்பாடுகளின் செயல்திறனை கண்காணித்து மேம்படுத்துதல்
- ✅ பொதுவான வெளியீட்டு சிக்கல்களை தீர்க்குதல்

### அடுத்த படிகள்
1. இந்த முறைமைகளை உங்கள் சொந்த AI திட்டங்களில் பயன்படுத்துங்கள்
2. டெம்ப்ளேட்களை சமூகத்திற்குத் திருப்பி வழங்குங்கள்
3. தொடர்ந்த ஆதரவுக்காக Azure AI Foundry Discord-இல் சேருங்கள்
4. பல பிராந்திய வெளியீடுகள் போன்ற மேம்பட்ட தலைப்புகளை ஆராயுங்கள்

---

**பயிற்சி கருத்துகள்**: இந்த பயிற்சியை மேம்படுத்த உங்கள் அனுபவத்தை [Azure AI Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) இல் பகிருங்கள்.

---

**அத்தியாய வழிகாட்டுதல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை மேம்பாடு
- **⬅️ முந்தையது**: [AI மாடல் வெளியீடு](ai-model-deployment.md)
- **➡️ அடுத்தது**: [உற்பத்தி AI சிறந்த நடைமுறைகள்](production-ai-practices.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../getting-started/configuration.md)

**உதவி தேவைதா?** AZD மற்றும் AI வெளியீடுகள் தொடர்பான ஆதரவு மற்றும் விவாதங்களுக்கு எங்கள் சமூகத்தில் சேருங்கள்.

---

**குறிப்பு**:  
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழிபெயர்ப்பு சேவையைப் பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கின்றோம், ஆனால் தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இருக்கக்கூடும் என்பதை கவனத்தில் கொள்ளவும். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.