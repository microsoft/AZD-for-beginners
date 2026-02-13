# AI பணிமனை பயிலரங்கு: உங்கள் AI தீர்வுகளை AZD மூலம் பயன்படுத்தக்கூடியதாக மாற்றுதல்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD தொடக்கர்கள்](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை அபிவிருத்தி
- **⬅️ முந்தையது**: [AI மாடல் வெளியீடு](ai-model-deployment.md)
- **➡️ அடுத்தது**: [உற்பத்தி AI சிறந்த நடைமுறைகள்](production-ai-practices.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)

## பணிமனை கண்ணோட்டம்

இந்த ஹாந்த்ஸ்-ஆன் லேப் உருவாக்குனர்களை உள்ளமைக்கப்பட்ட AI வார்ப்புருவை எடுத்துக் கொண்டு Azure Developer CLI (AZD) பயன்படுத்தி அதை வெளியிடும் செயல்முறையின் வழியாக வழிநடத்துகிறது. நீங்கள் Microsoft Foundry சேவைகளைப் பயன்படுத்தி உற்பத்தி நிலை AI வெளியீடுகளுக்கான அவசியமான வடிவமைப்புகளை கற்றுக்கொள்ளப்போகிறீர்கள்.

**கால அளவு:** 2-3 hours  
**நிலை:** Intermediate  
**முன்னுணர்வுகள்:** அடிப்படை Azure அறிவு, AI/ML கருத்துக்களுடன் பரிச்சயம்

## 🎓 கற்றல் இலக்குகள்

இந்த பணிமனை முடிந்தவிடிக்கையில், நீங்கள் இதைச் செய்யக்கூடியவராக இருப்பீர்கள்:
- ✅ மேற்பட்ட AI பயன்பாட்டை AZD வார்ப்புருக்களைப் பயன்படுத்தும்படி மாற்றுதல்
- ✅ AZD மூலம் Microsoft Foundry சேவைகளை அமைத்தல்
- ✅ AI சேவைகளுக்கான பாதுகாப்பான அங்கீகார (credential) நிர்வாகத்தை நடைமுறைப்படுத்துதல்
- ✅ கண்காணிப்பு உடன் உற்பத்தி-தயார் AI பயன்பாடுகளை வெளியிடுதல்
- ✅ பொதுவான AI வெளியீட்டு பிரச்சனைகளை தீர்ப்பது

## முன் தேவைகள்

### தேவையான கருவிகள்
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) நிறுவப்பட்டிருக்க வேண்டும்
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) நிறுவப்பட்டிருக்க வேண்டும்
- [Git](https://git-scm.com/) நிறுவப்பட்டிருக்க வேண்டும்
- குறியீட்டு தொகுப்பி (VS Code பரிந்துரைக்கப்படுகிறது)

### Azure வளங்கள்
- Contributor அணுகலுடன் Azure subscription
- Azure OpenAI சேவைகளுக்கு அணுகல் (அல்லது அணுகலை கோரக்கூடிய திறன்)
- Resource group உருவாக்கும் அனுமதிகள்

### அறிவு தேவைகள்
- Azure சேவைகள் பற்றிய அடிப்படை புரிதல்
- கட்டளை வரி இடைமுகங்களுடன் பரிச்சயம்
- அடிப்படை AI/ML கருத்துகள் (APIs, மாதிரிகள், prompts)

## பயிற்சி அமைப்பு

### படி 1: சூழல் தயார்

1. **கருவி நிறுவல்களை சரிபார்க்கவும்:**
```bash
# AZD நிறுவலை சரிபார்க்கவும்
azd version

# Azure CLI ஐ சரிபார்க்கவும்
az --version

# Azure இல் உள்நுழையவும்
az login
azd auth login
```

2. **பயிற்சி கிடைக்குறிப்பை (repository) கிளோன் செய்க:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: AI பயன்பாடுகளுக்கான AZD அமைப்பை புரிந்துகொள்ளுதல்

### ஒரு AI AZD வார்ப்புருவின் அமைப்பு

AI-அணிக AZD வார்ப்புருவில் முக்கியக் கோப்புகளை ஆராய்க:

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

### **லேப் பயிற்சி 1.1: கட்டமைப்பைப் ஆராய்க**

1. **azure.yaml கோப்பை பரிசீலிக்கவும்:**
```bash
cat azure.yaml
```

**எதை நோக்க வேண்டும்:**
- AI கூறுகளுக்கான சேவை வரைவுகள்
- சூழல் மாறிலிகள் வரைபடங்கள்
- ஹோஸ்ட் அமைப்புகள்

2. **main.bicep கட்டமைப்பை பரிசீலிக்கவும்:**
```bash
cat infra/main.bicep
```

**கண்டறிய வேண்டிய முக்கிய AI வடிவமைப்புகள்:**
- Azure OpenAI சேவை வழங்கல்
- Cognitive Search ஒருங்கிணைப்பு
- பாதுகாப்பான விசை நிர்வாகம்
- பிணைய பாதுகாப்பு கட்டமைப்புகள்

### **சர்ச்சை பங்கு:** இந்த வடிவமைப்புகள் AIக்காக ஏன் முக்கியம்?

- **சேவை சார்புகள்**: AI பயன்பாடுகள் பெரும்பாலும் பல ஒத்துழைக்கும் சேவைகளைக் கோருகின்றன
- **பாதுகாப்பு**: API விசைகள் மற்றும் endpointகளை பாதுகாப்பாக நிர்வகிக்கவேண்டும்
- **அளவீட்டுத்திறன்**: AI பணிகள் தனித்துவமான அளவீட்டு தேவைகள் கொண்டவை
- **செலவு மேலாண்மை**: சரியாக கட்டமைக்கப்படாவிட்டால் AI சேவைகள் செலவானவையாக இருக்கலாம்

## Module 2: உங்கள் முதல் AI பயன்பாட்டை வெளியிடுதல்

### படி 2.1: சூழலை தொடங்குதல்

1. **புதிய AZD சூழலை உருவாக்கவும்:**
```bash
azd env new myai-workshop
```

2. **தேவையான ப்ராமேட்டர்களை அமைக்கவும்:**
```bash
# உங்கள் விருப்பமான Azure பிராந்தியத்தை அமைக்கவும்
azd env set AZURE_LOCATION eastus

# விருப்பமாக: குறிப்பிட்ட OpenAI மாடலை அமைக்கவும்
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### படி 2.2: நெடுவரிசையும் பயன்பாட்டையும் வெளியிடுதல்

1. **AZD கொண்டு வெளியிடவும்:**
```bash
azd up
```

**`azd up` நடைபெறும் போது என்ன நடக்கும்:**
- ✅ Azure OpenAI சேவையை வழங்குகிறது
- ✅ Cognitive Search சேவையை உருவாக்குகிறது
- ✅ வலை பயன்பாட்டிற்காக App Service-ஐ அமைக்கிறது
- ✅ பிணையம் மற்றும் பாதுகாப்பை அமைக்கிறது
- ✅ பயன்பாட்டு குறியீட்டைக் வெளியிடுகிறது
- ✅ கண்காணிப்பு மற்றும் பதிவேட்டினைப் (logging) அமைக்கிறது

2. **வெளியீட்டு முன்னேற்றத்தை கண்காணிக்கவும்** மற்றும் உருவாக்கப்படும் வளங்களை குறித்துக்கொள்ளுங்கள்.

### படி 2.3: உங்கள் வெளியீட்டினை சரிபார்க்கவும்

1. **வெளியிடப்பட்ட வளங்களை சரிபார்க்கவும்:**
```bash
azd show
```

2. **வெளியிடப்பட்ட பயன்பாட்டை திறக்கவும்:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI செயல்பாட்டை சோதிக்கவும்:**
   - வலை பயன்பாட்டிற்கு செல்லுங்கள்
   - மாதிரி கேள்விகளை முயற்சிக்கவும்
   - AI பதில்கள் செயல்படுகின்றன என்பதை சரிபார்க்கவும்

### **லேப் பயிற்சி 2.1: பிழைத்திருத்த நடைமுறை**

**நிகழ்நிலை**: உங்கள் வெளியீடு வெற்றியடைந்தது ஆனால் AI பதிலளிக்கவில்லை.

**சாதாரண சிக்கல்களைச் சரிபார்க்கவும்:**
1. **OpenAI API விசைகள்**: அவை சரியாக அமைக்கப்பட்டுள்ளதா என்பதை சரிபார்க்கவும்
2. **மாதிரி கிடைக்கும் நிலை**: உங்கள் மண்டலம் மாதிரிக்கு ஆதரவளிக்குமா என்பதை சோதிக்கவும்
3. **பிணைய இணைப்பு**: சேவைகள் தொடர்பு கொள்ளக்கூடியவையாக உள்ளதா உறுதி செய்யவும்
4. **RBAC அனுமதிகள்**: பயன்பாடு OpenAI-ஐ அணுகக்கூடியதா என்பதை சரிபார்க்கவும்

**பிழைத்திருத்த கட்டளைகள்:**
```bash
# சூழல் மாறிலிகளை சரிபார்க்கவும்
azd env get-values

# அமர்த்தல் பதிவுகளை பார்க்கவும்
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI அமர்த்தல் நிலையை சரிபார்க்கவும்
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: உங்கள் தேவைகளுக்காக AI பயன்பாடுகளை தனிப்பயனாக்குதல்

### படி 3.1: AI கட்டமைப்பைப் மாற்றுதல்

1. **OpenAI மாதிரியை புதுப்பிக்கவும்:**
```bash
# வேறொரு மாதிரிக்கு மாற்றவும் (உங்கள் பிராந்தியத்தில் கிடைக்குமானால்)
azd env set AZURE_OPENAI_MODEL gpt-4

# புதிய கட்டமைப்புடன் மீண்டும் நிலைநிறுத்தவும்
azd deploy
```

2. **கூடுதல் AI சேவைகள் சேர்க்கவும்:**

Document Intelligence சேர்க்க `infra/main.bicep` ஐ திருத்தவும்:
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

### படி 3.2: சூழல்-தனித்துவ கட்டமைப்புகள்

**சிறந்த நடைமுறை**: மேம்பாடு மற்றும் உற்பத்திக்கான வேறுபட்ட கட்டமைப்புகள்.

1. **உற்பத்தி சூழலை உருவாக்கவும்:**
```bash
azd env new myai-production
```

2. **உற்பத்தி-சார்ந்த ப்ராமேட்டர்களை அமைக்கவும்:**
```bash
# உற்பத்தி சூழல் பொதுவிலேயே உயர்ந்த SKU-களைப் பயன்படுத்துகிறது
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# கூடுதல் பாதுகாப்பு அம்சங்களை செயல்படுத்தவும்
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **லேப் பயிற்சி 3.1: செலவு சிறந்தமை**

**சவால்**: செலவுச்சார்பு மேம்பாட்டுக்காக வார்ப்புருவை அமைக்கவும்.

**பணிகள்:**
1. எந்த SKUs-ஐ இலவச/அடிப்படை தரங்களுக்கு அமைக்க முடியும் என்பதை கண்டறியவும்
2. குறைந்த செலவுக்கு சூழல் மாறிலிகளை அமைக்கவும்
3. வெளியிட்டு உற்பத்தி கட்டமைப்புடன் செலவுகளை ஒப்பிடவும்

**தீர்வு குறிப்புகள்:**
- சாத்தியமுள்ள போது Cognitive Services-க்கு F0 (இலவச) தரத்தைப் பயன்படுத்தவும்
- மேம்பாட்டில் Search சேவைக்கு Basic தரத்தைப் பயன்படுத்தவும்
- Functions க்கான Consumption திட்டத்தைப் பயன்படுத்த பரிசீலிக்கவும்

## Module 4: பாதுகாப்பு மற்றும் உற்பத்தி சிறந்த நடைமுறைகள்

### படி 4.1: பாதுகாப்பான அங்கீகார நிர்வாகம்

**தற்போதைய சவால்**: பல AI பயன்பாடுகள் API விசைகளை கோடில் நேரடியாக (hardcode) சேர்க்கின்றன அல்லது பாதுகாப்பற்ற சேமிப்பை பயன்படுத்துகின்றன.

**AZD தீர்வு**: Managed Identity + Key Vault ஒருங்கிணைப்பு.

1. **உங்கள் வார்ப்புருவில் பாதுகாப்பு கட்டமைப்பை பரிசீலிக்கவும்:**
```bash
# Key Vault மற்றும் Managed Identity கட்டமைப்பைக் தேடுங்கள்
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity செயல்படுவதைச் சரிபார்க்கவும்:**
```bash
# இணைய செயலியில் சரியான அடையாள அமைப்பு உள்ளதா என்பதை சரிபார்க்கவும்
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### படி 4.2: பிணையப் பாதுகாப்பு

1. **பிரைவேட் எண்ட்பாயிண்ட்களை இயக்கு** (இன்னும் அமைக்கப்படவில்லையென்றால்):

உங்கள் bicep வார்ப்புருவில் சேர்க்கவும்:
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

### படி 4.3: கண்காணித்தல் மற்றும் பார்வை

1. **Application Insights-ஐ கட்டமைக்கவும்:**
```bash
# Application Insights தானாகக் கட்டமைக்கப்பட வேண்டும்
# கட்டமைப்பை சரிபார்க்கவும்:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-சார்ந்த கண்காணிப்பை அமைக்கவும்:**

AI செயல்பாடுகளுக்கான தனிப்பயன் அளவுகோல்களை (metrics) சேர்க்கவும்:
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

### **லேப் பயிற்சி 4.1: பாதுகாப்பு ஆய்வு**

**பணி**: பாதுகாப்பு சிறந்த நடைமுறைகளுக்காக உங்கள் வெளியீட்டை பரிசீலிக்கவும்.

**சரிபார்க்கும் பட்டியல்:**
- [ ] கோடு அல்லது கட்டமைப்பில் நேரடியாக சேர்க்கப்பட்ட இரகசியங்கள் கிடையாது
- [ ] சேவை-சேவை அங்கீகத்திற்காக Managed Identity பயன்படுத்தப்பட்டுள்ளது
- [ ] Key Vault நுணுக்கமான கட்டமைப்புகளை சேமிக்கிறது
- [ ] பிணைய அணுகல் சரியாக கட்டுப்படுத்தப்பட்டுள்ளது
- [ ] கண்காணிப்பு மற்றும் பதிவேட்டுகள் இயக்கப்பட்டுள்ளன

## Module 5: உங்கள் சொந்த AI பயன்பாட்டை மாற்றுதல்

### படி 5.1: மதிப்பீட்டு வொர்க்ஷீட்

**உங்கள் பயன்பாட்டைப் மாற்றுவதற்கு முன்**, கீழ்காணும் கேள்விகளுக்கு பதிலளிக்கவும்:

1. **பயன்பாட்டு கட்டமைப்பு:**
   - உங்கள் பயன்பாடு எந்த AI சேவைகளை பயன்படுத்துகிறது?
   - அது எந்த கணினி வளங்களை (compute resources) தேவைப்படுத்துகிறது?
   - அதற்கு ஒரு தரவுத்தளம் தேவைவாய்த்தா?
   - சேவைகளிடையே என்ன சார்புகள் உள்ளன?

2. **பாதுகாப்பு தேவைகள்:**
   - உங்கள் பயன்பாடு எந்த நுணுக்கமான தரவுகளை கையாள்கிறது?
   - உங்களுக்கு உள்ள இணக்கவழிப்புத் தேவைகள் என்ன?
   - தனிப்பட்ட பிணையம் தேவைபடுமா?

3. **அளவீட்டு தேவைகள்:**
   - உங்கள் எதிர்பார்க்கப்படும் ஏற்றம் என்ன?
   - ஆட்டோ-அளவீட்டு தேவைப்படுகிறதா?
   - மண்டல சார்ந்த தேவைகள் உள்ளனவா?

### படி 5.2: உங்கள் AZD வார்ப்புருவை உருவாக்கவும்

**உங்கள் பயன்பாட்டை மாற்ற இந்த வடிவத்தை பின்செல்க:**

1. **அடிப்படை அமைப்பை உருவாக்கவும்:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD டெம்ப்ளேட்டை துவக்கவும்
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

3. **கட்டமைப்பு வார்ப்புருக்களை உருவாக்கவும்:**

**infra/main.bicep** - முக்கிய வார்ப்புரை:
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

### **லேப் பயிற்சி 5.1: வார்ப்புரை உருவாக்க சவால்**

**சவால்**: ஒரு ஆவண செயலாக்க AI பயன்பாட்டிற்கான AZD வார்ப்புருவை உருவாக்கவும்.

**தேவைகள்:**
- உள்ளடக்க பகுப்பாய்வுக்கு Azure OpenAI
- OCR க்காக Document Intelligence
- ஆவணப் பதிவேற்றங்களுக்கு Storage Account
- செயலாக்க லாஜிக்கிற்கான Function App
- பயனர் இடைமுகத்திற்கு Web app

**போனஸ் புள்ளிகள்:**
- சரியான பிழை கையாளுதலை சேர்க்கவும்
- செலவு மதிப்பீட்டை சேர்க்கவும்
- கண்காணிப்பு டாஷ்போர்ட்களை அமைக்கவும்

## Module 6: பொதுவான சிக்கல்களின் தீர்வு

### பொதுவான வெளியீட்டு பிரச்சனைகள்

#### பிரச்னை 1: OpenAI சேவை கோட்டா மீறப்பட்டுள்ளது
**அறிகுறிகள்:** கோட்டா பிழையுடன் வெளியீடு தோல்வி அடைகிறது
**தீர்வுகள்:**
```bash
# தற்போதைய ஒதுக்கீடுகளை சரிபார்க்கவும்
az cognitiveservices usage list --location eastus

# ஒதுக்கீடு அதிகரிப்பை கோரவும் அல்லது வேறு பிராந்தியத்தை முயற்சிக்கவும்
azd env set AZURE_LOCATION westus2
azd up
```

#### பிரச்சனை 2: மாதிரி மண்டலத்தில் கிடைக்கவில்லை
**அறிகுறிகள்:** AI பதில்கள் தோல்வியடைகின்றன அல்லது மாதிரி வெளியீடு பிழைகள்
**தீர்வுகள்:**
```bash
# பிராந்தியத்தின்படி மாடல் கிடைப்பதை சரிபார்க்கவும்
az cognitiveservices model list --location eastus

# கிடைக்கும் மாடலுக்கு புதுப்பிக்கவும்
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### பிரச்சனை 3: அனுமதி பிரச்சனைகள்
**அறிகுறிகள்:** AI சேவைகளை அழைக்கும் போது 403 Forbidden பிழைகள்
**தீர்வுகள்:**
```bash
# பங்கு ஒதுக்கீடுகளைச் சரிபார்க்க
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# காணாமல் உள்ள பங்குகளைச் சேர்க்க
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### செயல்திறன் பிரச்சனைகள்

#### பிரச்சனை 4: AI பதில்கள் மந்தமாக இருப்பது
**ஆய்வு படிகள்:**
1. செயல்திறன் அளவுகோல்களுக்கு Application Insights ஐச் சரிபார்க்கவும்
2. Azure போர்ட்லில் OpenAI சேவை அளவுகோல்களை பரிசீலிக்கவும்
3. பிணைய இணைப்பு மற்றும் நேரம் தாமதத்தை சரிபார்க்கவும்

**தீர்வுகள்:**
- பொதுவான கேள்விகளுக்காக கேச்சிங் (caching) அமல் படுத்தவும்
- உங்கள் பயன்பாட்டுக்கிணங்க பொருத்தமான OpenAI மாதிரியைப் பயன்படுத்தவும்
- அதிக ஏற்றம் கொண்ட நிலைகளுக்காக read replicas பற்றி பரிசீலிக்கவும்

### **லேப் பயிற்சி 6.1: பிழைத்திருத்த சவால்**

**நிகழ்நிலை**: உங்கள் வெளியீடு வெற்றியடைந்தது, ஆனால் பயன்பாடு 500 பிழைகளை திருப்பிக்கொள்ளுகிறது.

**பிழைத்திருத்த பணிகள்:**
1. பயன்பாட்டு பதிவுகளை சரிபார்க்கவும்
2. சேவை இணைப்பைக் சரிபார்க்கவும்
3. அங்கீகத்தை சோதிக்கவும்
4. கட்டமைப்பை பரிசீலிக்கவும்

**பயன்படுத்த வேண்டிய கருவிகள்:**
- `azd show` வெளியீட்டு சுருக்கத்திற்கு
- விரிவான சேவை பதிவுகளுக்காக Azure போர்டல்
- பயன்பாட்டு டெலிமெட்ரிக்காக Application Insights

## Module 7: கண்காணிப்பு மற்றும் சிறப்பு

### படி 7.1: விசாலமான கண்காணிப்பை அமைக்குங்கள்

1. **தனிப்பயன் டாஷ்போர்ட்களை உருவாக்கவும்:**

Azure போர்ட்டலில் செல்லவும் மற்றும் பின்வற்ற டாஷ்போர்டை உருவாக்கவும்:
- OpenAI கோரிக்கை எண்ணிக்கை மற்றும் தாமதம்
- பயன்பாட்டு பிழை வீதங்கள்
- வள பயன்பாடு
- செலவு கண்காணிப்பு

2. **அலெர்ட்களை அமைக்கவும்:**
```bash
# உயர் பிழை விகிதத்திற்கான எச்சரிக்கை
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### படி 7.2: செலவு சிறப்பாக்கம்

1. **தற்போதைய செலவுகளை பகுப்பாய்வு செய்யவும்:**
```bash
# Azure CLI-ஐப் பயன்படுத்தி செலவு தரவுகளைப் பெறவும்
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **செலவு கட்டுப்பாடுகளை நடைமுறைப்படுத்தவும்:**
- பட்ஜெட் அலெர்ட்களை அமைக்கவும்
- ஆட்டோஸ்கேலிங் கொள்கைகளைப் பயன்படுத்தவும்
- கோரிக்கை கேச்சிங்கை நடைமுறைப்படுத்தவும்
- OpenAI க்கான டோக்கன் பயன்பாட்டை கண்காணிக்கவும்

### **லேப் பயிற்சி 7.1: செயல்திறன் சிறப்பாக்கம்**

**பணி**: உங்கள் AI பயன்பாட்டை செயல்திறனுக்கும் செலவுக்கும் ஏற்றவாறு சிறப்பாக்கவும்.

**மேம்படுத்த வேண்டிய அளவுகோல்கள்:**
- சராசரி பதில் நேரத்தை 20% குறைக்கவும்
- மாதாந்திர செலவுகளை 15% குறைக்கவும்
- 99.9% uptime-ஐ பராமரிக்கவும்

**சோதிக்க வேண்டிய தந்திரங்கள்:**
- பதில்தீர்வு கேச்சிங்கை அமல்படுத்தவும்
- டோக்கன் செயல்திறனுக்காக prompts-ஐ சிறப்பாக்கவும்
- பொருத்தமான compute SKUs-ஐப் பயன்படுத்தவும்
- சரியான ஆட்டோஸ்கேலிங் அமைவை அமைக்கவும்

## இறுதி சவால்: தொடக்கம் முதல் முடிவு வரை செயல்படுத்தல்

### சவால் நிகழ்நிலை

உங்களுக்கு பின்வரும் தேவைகளுடன் உற்பத்திக்கு தயாரான AI-சாதனப்பட்ட வாடிக்கையாளர் சேவை chatbot ஒன்றை உருவாக்க பொறுப்பு வழங்கப்பட்டுள்ளது:

**செயல்பாட்டு தேவைகள்:**
- வாடிக்கையாளர் தொடர்புகளுக்கான வலை இடைமுகம்
- பதில்களுக்கு Azure OpenAI உடன் ஒருங்கிணைவு
- Cognitive Search பயன்படுத்தி ஆவணத் தேடல் திறன்
- உள்ளமைவு வாடிக்கையாளர் தரவுத்தளத்துடன் ஒருங்கிணைவு
- பல மொழி ஆதரவு

**அநிறைவேற்றும் தேவைகள்:**
- ஒரே நேரத்தில் 1000 பயனர்களை கையாளும் திறன்
- 99.9% uptime SLA
- SOC 2 இணக்கத்தன்மை
- செலவு மாதத்திற்கு $500 க்கும் கீழ்
- பல சூழல்களில் (dev, staging, prod) வெளியிடுதல்

### அமல்படுத்தல் படிகள்

1. கட்டமைப்பை வடிவமைக்கவும்
2. AZD வார்ப்புருவை உருவாக்கவும்
3. பாதுகாப்பு நடவடிக்கைகளை நடைமுறைப்படுத்தவும்
4. கண்காணிப்பு மற்றும் அலெர்டுகளை அமைக்கவும்
5. வெளியீட்டு பைப்‌லைன்களை உருவாக்கவும்
6. தீர்வைப் ஆவணப்படுத்தவும்

### மதிப்பீட்டு அளவுகோல்கள்

- ✅ **செயல்பாடு**: இது அனைத்து தேவைகளையும் பூர்த்தி செய்கிறதா?
- ✅ **பாதுகாப்பு**: சிறந்த நடைமுறைகள் நடைமுறைப்படுத்தப்பட்டுள்ளதா?
- ✅ **அளவீட்டுத்திறன்**: இது ஏற்றத்தை கையாள முடியுமா?
- ✅ **பராமரிப்பு சாத்தியத்தன்மை**: குறியீட்டும் கட்டமைப்பும் நன்றாக ஏற்போக்கப்பட்டுள்ளனவா?
- ✅ **செலவு**: இது பட்ஜெட்டுக்குள் இருக்கிறதா?

## கூடுதல் வளங்கள்

### Microsoft ஆவணங்கள்
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### மாதிரி வார்ப்புருக்கள்
- [Azure OpenAI உரையாடல் செயலி](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### சமூக வளங்கள்
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 முடிவு சான்றிதழ்
வாழ்த்துக்கள்! நீங்கள் AI ஆய்வக பணிமனை (Workshop Lab) முடித்துவிட்டீர்கள். இப்போது நீங்கள் கீழ்வரும் திறன்களை பெற்றிருக்க வேண்டும்:

- ✅ முன்னரே உள்ள AI பயன்பாடுகளை AZD டெம்ப்ளேட்களாக மாற்றவும்
- ✅ உற்பத்திக்குக் தயாரான AI பயன்பாடுகளை வெளியிடவும்
- ✅ AI வேலைபளுக்கள் uchun பாதுகாப்பு சிறந்த நடைமுறைகளை செயல்படுத்தவும்
- ✅ AI பயன்பாட்டு செயல்திறனை கண்காணித்து மேம்படுத்தவும்
- ✅ பொதுவான வெளியீட்டு சிக்கல்களை தீர்க்கவும்

### அடுத்து செய்யவேண்டியவை
1. இந்த மாதிரிகளை உங்கள் சொந்த AI திட்டங்களில் பயன்படுத்துங்கள்
2. டெம்ப்ளேட்களை சமுதாயத்திற்கு திருப்பி கொடுங்கள்
3. தொடர்ந்த ஆதரக்காக Microsoft Foundry Discord-இல் சேருங்கள்
4. பல பிரதேசங்களில் வெளியீடுகள் போன்ற மேம்பட்ட தலைப்புகளை ஆராயுங்கள்

---

**பயிற்சி கருத்து**: இந்த பயிற்சியை மேம்படுத்த எங்களுக்கு உதவ உங்கள் அனுபவத்தை [Microsoft Foundry Discord #Azure சேனல்](https://discord.gg/microsoft-azure) இல் பகிரவும்.

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 Course Home**: [AZD தொடக்கர்களுக்காக](../../README.md)
- **📖 Current Chapter**: அத்தியாயம் 2 - AI முதன்மை அபிவிருத்தி
- **⬅️ Previous**: [AI மாடல் அமர்த்தல்](ai-model-deployment.md)
- **➡️ Next**: [உற்பத்தி AI சிறந்த நடைமுறைகள்](production-ai-practices.md)
- **🚀 Next Chapter**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)

**உதவி வேண்டுமா?** AZD மற்றும் AI வெளியீடுகள் பற்றி ஆதரவு மற்றும் விவாதங்களுக்கு எங்கள் சமுதாயத்தில் சேருங்கள்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான Co‑op Translator (https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாம் துல்லியத்திற்காக முயற்சிக்கிறோம்; இருப்பினும் தானாக生成 செய்யப்பட்ட மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான பொருள் இருக்கலாம் என்பதை கவனிக்கவும். அசல் ஆவணம் அதன் சொந்த மொழியிலேயே அதிகாரபூர்வமானதாக கருதப்பட வேண்டும். மிக முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பின் பயன்பாட்டால் உண்டாகும் ஏதேனும் தவறுகள் அல்லது தவறான புரிதல்களுக்கு நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->