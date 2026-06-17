# AI Workshop Lab: உங்கள் AI தீர்வுகளை AZD-Deployable ஆக மாற்றுதல்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநூல் முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதலில் வளர்ச்சி
- **⬅️ முந்தையது**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ அடுத்தது**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 அடுத்த அத்தியாயம்**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## தொழில்துறை மேம்பாடு கையேடு

இந்த கைபயிற்சி நெறி செயல்முறை முறையில் உள்ள AI டெம்ப்ளேட்டை எடுத்து Azure Developer CLI (AZD) மூலம் நிரூபிக்கும் வரை உதவுகிறது. Microsoft Foundry சேவைகளைப் பயன்படுத்தி உற்பத்தி AI டெப்ளॉय்மெண்ட் தொடர்பான அவசியமான வடிவங்களை நீங்கள் கற்றுக்கொள்வீர்கள்.

> **செவ்வணிக்கை குறிப்பு (2026-03-25):** இந்த பட்டறை `azd` `1.23.12` க்கு எதிராக மதிப்பீடு செய்யப்பட்டு உள்ளது. உங்கள் உள்ளூர் நிறுவல் பழையதானால், கீழ்காணும் படிகள் ஒத்துப்போக AZD ஐ புதுப்பிக்கவும்.

**காலம்:** 2-3 மணித்தியாலங்கள்  
**நிலை:** இடைநிலை  
**முந்தைய ஆவமைப்புகள்:** அடிப்படை Azure அறிவு, AI/ML கருத்துக்களில் பண்பழக்கம்

## 🎓 கற்றல் குறிக்கோள்கள்

இந்த பட்டறையின் இறுதியில், நீங்கள் قادرகொள்ளலாம்:
- ✅ ஒரு υπάρத்துள்ள AI பயன்பாட்டை AZD டெம்ப்ளேட்களாக மாற்றுவது
- ✅ AZD மூலம் Microsoft Foundry சேவைகளை கட்டமைக்குவது
- ✅ AI சேவைகளுக்கான பாதுகாப்பான கடவுச்சொல் மேலாண்மையை செயல்படுத்துவது
- ✅ கண்காணிப்பு உடன் உற்பத்தி-தயார் AI பயன்பாடுகளை டெப்ளாய் செய்யுவது
- ✅ பொதுவான AI டெப்ளாய் பிரச்சனைகளை தீர்க்கும் திறன்

## தேவையானவை

### தேவையான கருவிகள்
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) நிறுவப்பட்டிருக்க வேண்டும்
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) நிறுவப்பட்டிருக்க வேண்டும்
- [Git](https://git-scm.com/) நிறுவப்பட்டிருக்க வேண்டும்
- குறியீட்டு ஆசிரியர் (VS Code பரிந்துரைக்கப்படுகிறது)

### Azure வளங்கள்
- contributor அணுகல் கொண்ட Azure subscription
- Microsoft Foundry Models சேவைகளுக்கான அணுகல் (அல்லது அணுகலை கோர முடியும் திறன்)
- Resource group உருவாக்க அனுமதிகள்

### அறிவு தேவைகள்
- Azure சேவைகள் பற்றிய அடிப்படை புரிதல்
- கட்டளை வரி இடைமுகத்துடன் பழக்கமிடல்
- அடிப்படை AI/ML கருத்துக்கள் (APIs, models, prompts)

## ஆய்வு அமைப்பு

### படி 1: சூழலைத் தயாரித்தல்

1. **கருவி நிறுவல்களை சரிபார்க்கவும்:**
```bash
# AZD நிறுவலைச் சரிபார்க்கவும்
azd version

# Azure CLI ஐச் சரிபார்க்கவும்
az --version

# AZD வேலைநடைகளுக்காக Azure-இல் உள்நுழையவும்
azd auth login

# டயக்னோஸ்டிக்ஸ் போது az கட்டளைகள் இயக்கப் திட்டமிட்டால் மட்டுமே Azure CLI-க்கு உள்நுழையவும்
az login
```

பல டெனன்ட்களில் வேலை செய்கிறீர்கள் அல்லது உங்கள் subscription தானாக கண்டுபிடிக்கப்பட்டதில்லை என்றால், `azd auth login --tenant-id <tenant-id>` உடன் மீண்டும் முயற்சி செய்யவும்.

2. **பயிற்சி களஞ்சியத்தை கிளோன் செய்யவும்:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: AI பயன்பாடுகளுக்கான AZD கட்டமைப்பை புரிந்துகொள்ளுதல்

### AI AZD டெம்ப்ளேட்டின் உடமை

AI-தயார் AZD டெம்ப்ளேட்டில் முக்கிய கோப்புகளை ஆராயுங்கள்:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **பயிற்சி 1.1: கட்டமைப்பைப் பார்வையிடுதல்**

1. **azure.yaml கோப்பை பரிசீலிக்கவும்:**
```bash
cat azure.yaml
```

**பார்ப்பதற்கு வேண்டியவை:**
- AI கூறுகளுக்கான சேவை வரையறைகள்
- சுற்றுச்சூழல் மாறிகள் வரைபடங்கள்
- ஹோஸ்ட் கட்டமைப்புகள்

2. **main.bicep உடன் உள்ள கட்டமைப்பை மதிப்பாய்வு செய்யவும்:**
```bash
cat infra/main.bicep
```

**அறிய வேண்டிய முக்கிய AI வடிவங்கள்:**
- Microsoft Foundry Models சேவை வழங்கல்
- Azure AI Search இணையமைப்பு
- பாதுகாப்பான விசை மேலாண்மை
- நெட்வொர்க் பாதுகாப்பு கட்டமைப்புகள்

### **சர்ச்சை புள்ளி:** AI க்கு இந்த வடிவங்கள் ஏன் முக்கியம்

- **சேவை залежности**: AI பயன்பாடுகள் பெரும்பாலும் பல ஒருங்கிணைந்த சேவைகளை தேவை படுத்தும்
- **பாதுகாப்பு**: API விசைகள் மற்றும் endpoint-கள் பாதுகாப்பாக நிர்வகிக்கப்பட வேண்டும்
- **அளவீடு**: AI பணிகள் தனித்துவமான ஸ்கேலிங் தேவைகள் கொண்டவை
- **செலவு மேலாண்மை**: சரியாக அமைவில்லையெனில் AI சேவைகள் அதிக செலவாகி விடும்

## Module 2: உங்கள் முதல் AI பயன்பாட்டை டெப்ளாய் செய்யுதல்

### படி 2.1: சூழலை தொடக்கம் செய்தல்

1. **புதிய AZD சுற்றுச்சூழலை உருவாக்கவும்:**
```bash
azd env new myai-workshop
```

2. **தேவையான பராமரிப்புகளை அமைக்கவும்:**
```bash
# உங்கள் விருப்பமான Azure பிராந்தியத்தை அமைக்கவும்
azd env set AZURE_LOCATION eastus

# விருப்பமாக: குறிப்பிட்ட OpenAI மாதிரியை அமைக்கவும்
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### படி 2.2: கட்டமைப்பு மற்றும் பயன்பாட்டை டெப்ளாய் செய்யவும்

1. **AZD மூலம் டெப்ளாய் செய்யவும்:**
```bash
azd up
```

**`azd up` நடக்கும்போது என்ன நடக்கிறது:**
- ✅ Microsoft Foundry Models சேவையை வழங்குகிறது
- ✅ Azure AI Search சேவையை உருவாக்குகிறது
- ✅ வலை பயன்பாட்டிற்கான App Service அமைக்கிறது
- ✅ நெட்வொர்க்கிங் மற்றும் பாதுகாப்பை கட்டமைக்கிறது
- ✅ பயன்பாட்டு குறியீட்டை டெப்ளாய் செய்கிறது
- ✅ கண்காணிப்பு மற்றும் பதிவு அமைக்கிறது

2. **டெப்ளாய் முன்னேற்றத்தை கண்காணிக்கவும்** மற்றும் உருவாக்கப்படும் வளங்களை நோட் செய்யவும்.

### படி 2.3: உங்கள் டெப்ளாய்மெண்ட் சரிபார்க்கவும்

1. **டெப்ளாய் செய்யப்பட்ட வளங்களை சரிபார்க்கவும்:**
```bash
azd show
```

2. **டெப்ளாய் செய்யப்பட்ட பயன்பாட்டை திறக்கவும்:**
```bash
azd show
```

`azd show` வெளியீட்டில் காட்டப்படும் வலை endpoint-ஐ திறக்கவும்.

3. **AI செயல்பாட்டை சோதிக்கவும்:**
   - வலை பயன்பாட்டுக்கு செல்லவும்
   - மாதிரி கேள்விகளை முயற்சி செய்துகொள்ளவும்
   - AI பதில்கள் வேலை செய்கிறதா என்பதை உறுதிசெய்யவும்

### **பயிற்சி 2.1: தானாக பழகு பிரச்சனை தீர்வு**

**சூழ்நிலை**: உங்கள் டெப்ளாய் வெற்றி கண்டினாலும் AI பதிலளிக்கவில்லை.

**சாதாரணச் சிக்கல்கள் சோதிக்க:**
1. **OpenAI API விசைகள்**: அவை சரியாக அமைக்கப்பட்டுள்ளதா என்பதை சரிபார்க்கவும்
2. **மாதிரி கிடைப்புத்தன்மை**: உங்கள் பிரதேசம் மாதிரியை ஆதரிக்கிறதா என்பதை சரிபார்க்கவும்
3. **நெட்வொர்க்க் இணைப்பு**: சேவைகள் பரஸ்பரம் தொடர்பு கொள்ள முடிகிறதா என்பதை உறுதி செய்யவும்
4. **RBAC அனுமதிகள்**: பயன்பாடு OpenAI-க்கு அணுக முடிகிறதா என்பதை சரிபார்க்கவும்

**டீபக் கட்டளைகள்:**
```bash
# சுற்றுச்சூழல் மாறில்களை சரிபார்க்கவும்
azd env get-values

# வெளியீட்டு பதிவுகளைப் பார்க்கவும்
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI வெளியீட்டு நிலையை சரிபார்க்கவும்
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: உங்கள் தேவைகளுக்காக AI பயன்பாடுகளை Custimise செய்தல்

### படி 3.1: AI கட்டமைப்பை மாற்றுதல்

1. **OpenAI மாதிரியை புதுப்பிக்கவும்:**
```bash
# உங்கள் பகுதியில் கிடைக்கும் பட்சத்தில் வேறொரு மாதிரிக்கு மாறவும்
azd env set AZURE_OPENAI_MODEL gpt-4.1

# புதிய கட்டமைப்புடன் மீண்டும் அமல்படுத்தவும்
azd deploy
```

2. **கூடுதல் AI சேவைகள் சேர்க்கவும்:**

Document Intelligence ஐச் சேர்க்க infra/main.bicep-ஐ தொகுக்கவும்:

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

### படி 3.2: சூழல்-சார்ந்த கட்டமைப்புகள்

**சிறந்த நடைமுறை**: வளர்ச்சிக்கும் உற்பத்திக்கும் வேறுபட்ட கட்டமைப்புகள்.

1. **உற்பத்தி சுற்றுச்சூழலை உருவாக்கவும்:**
```bash
azd env new myai-production
```

2. **உற்பத்தி-சார்ந்த பராமரிப்புகளை அமைக்கவும்:**
```bash
# உற்பத்தி பொதுவாக உயர்ந்த SKU-களைப் பயன்படுத்துகிறது
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# மேலதிக பாதுகாப்பு அம்சங்களை செயல்படுத்தவும்
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **பயிற்சி 3.1: செலவு சிறப்பு செய்தல்**

**சவால்**: வளர்ச்சிக்குத் தகுந்த செலவு குறைந்ததாக டெம்ப்ளேட்டை கட்டமைக்கவும்.

**பணிகள்:**
1. எந்த SKUs-ஐ free/basic நிலைகளுக்கு மாற்றலாம் என்பதை கண்டறியவும்
2. குறைந்த செலவுக்கான சுற்றுச்சூழல் மாறிகளை அமைக்கவும்
3. டெப்ளாய் செய்து உற்பத்தி கட்டமைப்புடன் செலவுகளை ஒப்பிடவும்

**தீர்வு குறிப்புகள்:**
- சாத்தியமെങ്കിൽ Azure AI சேவைகளுக்காக F0 (free) நிலையை பயன்படுத்தவும்
- வளர்ச்சிக்காக Search சேவைக்கு Basic நிலையை பயன்படுத்தவும்
- Functions க்கு Consumption திட்டத்தை பரிசீலிக்கவும்

## Module 4: பாதுகாப்பும் உற்பத்தி சிறந்த நடைமுறைகளும்

### படி 4.1: கடவுச்சொல் பாதுகாப்பு மேலாண்மை

**தற்போதைய சவால்**: பல AI பயன்பாடுகள் API விசைகளை ஹார்கோட் செய்யவோ அல்லது பாதுகாப்பற்ற சேமிப்பகம் பயன்படுத்தவோ செய்கின்றன.

**AZD தீர்வு**: Managed Identity + Key Vault ஒருங்கிணைப்பு.

1. **உங்கள் டெம்ப்ளேட்டில் பாதுகாப்பு கட்டமைப்பை பரிசீலிக்கவும்:**
```bash
# Key Vault மற்றும் Managed Identity உள்ளமைப்புகளைத் தேடவும்
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity செயல்படுகிறதா என்பதை சரிபார்க்கவும்:**
```bash
# வெப் செயலிக்கு சரியான அடையாள அமைப்பு உள்ளதா என்பதை சரிபார்க்கவும்
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### படி 4.2: நெட்வொர்க் பாதுகாப்பு

1. **தனியார் endpoints-ஐ செயல்படுத்தவும்** (ஏற்கனவே கட்டமைக்கப்படவில்லை என்றால்):

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

### படி 4.3: கண்காணிப்பு மற்றும் காட்சிப்படுத்தல்

1. **Application Insights ஐ கட்டமைக்கவும்:**
```bash
# Application Insights தானாகவே கட்டமைக்கப்பட வேண்டும்
# கட்டமைப்பை சரிபார்க்கவும்:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-சார்ந்த கண்காணிப்பைக் அமைக்கவும்:**

AI செயல்பாடுகளுக்கான தனிப்பயன் மீட்ரிக்ஸ்களை சேர்க்கவும்:
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

### **பயிற்சி 4.1: பாதுகாப்பு ஆய்வு**

**பணி**: உங்கள் டெப்ளாய்மெண்டை பாதுகாப்பு சிறந்த நடைமுறைகளுக்கு ஆய்வு செய்யுங்கள்.

**சChecklist:**
- [ ] குறியீட்டிலும் கட்டமைப்பிலும் எந்த ஹார்கோட் சாக்ஸ்டெல்லுமில்லை
- [ ] சேவை-தரையில் அடையாளத்திற்காக Managed Identity பயன்படுத்தப்பட்டது
- [ ] அத்தியாவசிய கட்டமைப்புகள் Key Vault-இல் சேமிக்கப்பட்டுள்ளன
- [ ] நெட்வொர்க் அணுகல் முறையாக கட்டுப்படுத்தப்பட்டுள்ளது
- [ ] கண்காணிப்பு மற்றும் பதிவு இயலுமைப்படுத்தப்பட்டுள்ளன

## Module 5: உங்கள் சொந்த AI பயன்பாட்டை மாற்றுதல்

### படி 5.1: மதிப்பீட்டு வேலைப்பட்டியல்

**உங்கள் செயலியை மாற்றுவதற்கு முன்**, இந்த கேள்விகளுக்கு பதில் அளிக்கவும்:

1. **பயன்பாட்டு معماري:**
   - உங்கள் பயன்பாடு எந்த AI சேவைகளை பயன்படுத்துகிறது?
   - அது எந்த கணக்கு வளங்களை தேவைபடுகிறது?
   - அதற்கு தரவுத்தொகுப்பு தேவைப்படுமா?
   - சேவைகளுக்கிடையில் என்பது எந்த சார்புகள் உள்ளன?

2. **பாதுகாப்பு தேவைகள்:**
   - உங்கள் பயன்பாடு எந்த உணர்ச்சி தகவலை கையாள்கிறது?
   - உங்களுக்கு எந்த இணக்கக் கட்டுப்பாடுகள் தேவை?
   - தனியார் நெட்வொர்க்கிங் தேவையா?

3. **அளவீட்டுத் தேவைகள்:**
   - உங்கள் எதிர்பார்க்கப்படும் லோட் என்ன?
   - தானாக ஸ்கேலிங் தேவையா?
   - பிராந்திய தேவைகள் உள்ளனவா?

### படி 5.2: உங்கள் AZD டெம்ப்ளேட்டை உருவாக்குங்கள்

**உங்கள் செயலியை மாற்ற இந்த வடிவத்தைப் பின்பற்றவும்:**

1. **அடிப்படை கட்டமைப்பை உருவாக்கு:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD வார்ப்புருவை துவக்கவும்
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

3. **இன்ஃபிராஸ்ட்ரக்ஷர் டெம்ப்ளேட்களை உருவாக்கவும்:**

**infra/main.bicep** - பிரதான டெம்ப்ளேட்:
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

**infra/modules/openai.bicep** - OpenAI மொடியூல்:
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

### **பயிற்சி 5.1: டெம்ப்ளேட் உருவாக்க சவால்**

**சவால்**: ஒரு ஆவண செயலாக்க AI பயன்பாட்டிற்கான AZD டெம்ப்ளேட் உருவாக்கவும்.

**தேவைகள்:**
- உள்ளடக்க பகுப்பாய்விற்கு Microsoft Foundry Models
- OCR க்கு Document Intelligence
- ஆவண பதிவுகளுக்கு Storage Account
- செயலாக்கத் தொடர்புக்கான Function App
- பயனர் இடைமுகத்திற்கான Web app

**போனஸ்க்கு:**
- சரியான பிழை கையாளுதலைச் சேர்க்கவும்
- செலவு மதிப்பீட்டை உள்ளடக்கவும்
- கண்காணிப்பு பலகைகளை அமைக்கவும்

## Module 6: பொதுவான சிக்கல்கள் மற்றும் தீர்வுகள்

### பொதுவான டெப்ளாய் சிக்கல்கள்

#### சிக்கல் 1: OpenAI சேவை கொட்டா கடந்து செல்தல்
**அறிகுறிகள்:** டெப்ளாய் கொட்டா பிழையுடன் தோல்வி கொள்கிறது
**தீர்வுகள்:**
```bash
# தற்போதைய வரம்புகளை சரிபார்க்கவும்
az cognitiveservices usage list --location eastus

# வரம்பு அதிகரிப்பை கோரவும் அல்லது வேறு பிராந்தியத்தை முயற்சி செய்யவும்
azd env set AZURE_LOCATION westus2
azd up
```

#### சிக்கல் 2: மாதிரி பிரதேசத்தில் கிடையாது
**அறிகுறிகள்:** AI பதில்கள் தோல்வி அல்லது மாதிரி டெப்ளாய் பிழைகள்
**தீர்வுகள்:**
```bash
# பிராந்தியத்தின் படி மாடல் கிடைப்பை சரிபார்க்கவும்
az cognitiveservices model list --location eastus

# கிடைக்கும் மாடலுக்கு புதுப்பிக்கவும்
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### சிக்கல் 3: அனுமதி பிரச்சனைகள்
**அறிகுறிகள்:** AI சேவைகளை அழைக்கும் போது 403 Forbidden பிழைகள்
**தீர்வுகள்:**
```bash
# பாத்திர ஒதுக்கீடுகளைச் சரிபார்க்கவும்
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# கிடைக்காத பாத்திரங்களைச் சேர்க்கவும்
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### செயல்திறன் பிரச்சனைகள்

#### சிக்கல் 4: மந்தமான AI பதில்கள்
**கண்காணிப்பு படிகள்:**
1. செயல்திறன் மீட்ரிக்ஸ் காண Application Insights-ஐ சரிபார்க்கவும்
2. Azure போர்டலில் OpenAI சேவை மீட்ரிக்ஸ்களை மறுபரிசீலிக்கவும்
3. நெட்வொர்க் இணைப்பு மற்றும் விலகலை சரிபார்க்கவும்

**தீர்வுகள்:**
- பொதுவான கேள்விகளுக்காக கேஷிங் செயல்படுத்தவும்
- உங்கள் பயன்பாட்டிற்கான பொருத்தமான OpenAI மாதிரியை பயன்படுத்தவும்
- அதிக லோடு நிலைகளுக்காக ரீட் ரெப்ளிகாக்களை பரிசீலிக்கவும்

### **பயிற்சி 6.1: டீபக் சவால்**

**சூழ்நிலை**: உங்கள் டெப்ளாய் வெற்றி கண்டுள்ளது, ஆனால் பயன்பாடு 500 பிழைகளைத் தருகிறது.

**டீபக் பணிகள்:**
1. பயன்பாடு பதிவு/log-களை சரிபார்க்கவும்
2. சேவை இணைப்பை சரிபார்க்கவும்
3. அத்தாட்சிப்படுத்தலை சோதிக்கவும்
4. கட்டமைப்பை மறுபரிசீலிக்கவும்

**பயன்படக்க கருவிகள்:**
- டெப்ளாய் கண்ணோட்டத்துக்காக `azd show`
- விரிவான சேவை பதிவு/log-களுக்காக Azure போர்டல்
- பயன்பாட்டு டெலிமெட்டரிக்காக Application Insights

## Module 7: கண்காணிப்பு மற்றும் சிறப்பு செய்யல்

### படி 7.1: விரிவான கண்காணிப்பை அமைக்கவும்

1. **தனிப்பயன் டாஷ்போர்டுகளை உருவாக்கவும்:**

Azure போர்டலுக்கு சென்று பின்வற்றியவற்றுடன் டாஷ்போர்டை உருவாக்கவும்:
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

### படி 7.2: செலவுக் குறைப்பு

1. **தற்போதைய செலவுகளை பகுப்பாய்வு செய்யவும்:**
```bash
# Azure CLI-ஐப் பயன்படுத்தி செலவு தரவுகளைப் பெறவும்
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **செலவுக் கட்டுப்பாடுகளை செயல்படுத்தவும்:**
- பட்ஜெட் அலெர்ட்களை அமைக்கவும்
- autoscaling கொள்கைகளை பயன்படுத்தவும்
- கோரிக்கை கேஷிங்கை செயல்படுத்தவும்
- OpenAI டோக்கன் பயன்பாட்டை கண்காணிக்கவும்

### **பயிற்சி 7.1: செயல்திறன் சிறப்பாக்கம்**

**பணி**: செயல்திறன் மற்றும் செலவுக்கான உங்கள் AI பயன்பாட்டை சிறப்பாக்கவும்.

**மேம்படுத்த வேண்டிய மீட்ரிக்ஸ்:**
- சராசரி பதிலளிப்பு நேரத்தை 20% குறைக்கவும்
- மாதாந்திர செலவுகளை 15% குறைக்கவும்
- 99.9% Uptime பேணவும்

**செயல்திட்டங்கள் முயற்சி செய்ய:**
- பதிலளிப்பு கேஷிங் செயல்படுத்தவும்
- டோக்கன் திறனுக்காக prompts-ஐ சிறப்பாக்கவும்
- பொருத்தமான கணக்கு SKUs-ஐப் பயன்படுத்தவும்
- சரியான autoscaling ஐ அமைக்கவும்

## இறுதி சவால்: தொடக்கம் முதல் முடிவு வரை செயல்படுத்தல்

### சவால் சூழ்நிலை

நீங்கள் ஒரு உற்பத்தி-தயார் AI-சக்தியுள்ள வாடிக்கையாளர் சேவை chatbot உருவாக்கப் பொறுப்பாக இருக்கிறீர்கள், கீழ்காணும் தேவைகளுடன்:

** செயல்முறை தேவைகள்:**
- வாடிக்கையாளர் தொடர்புகளுக்கான வலை இடைமுகம்
- பதில்களுக்கு Microsoft Foundry Models உடன் ஒருங்கிணைப்பு
- Azure AI Search பயன்படுத்தி ஆவண தேடல் திறன்
- உள்ளிருந்த வாடிக்கையாளர் தரவுத்தொகுப்புடன் இணைப்பு
- பல மொழி ஆதரவு

** செயற்பாட்டு அல்லாத தேவைகள்:**
- ஒரே நேரத்தில் 1000 பயனர்களை கையாளுதல்
- 99.9% uptime SLA
- SOC 2 இணக்கமுறை
- மாதத்திற்கு $500 கீழ் செலவு
- பல சுற்றுச்சூழல்களுக்கு (dev, staging, prod) டெப்ளாய் செய்தல்

### செயல்படுத்தல் படிகள்

1. **ஆதாரமைப்பை வடிவமைக்கவும்**
2. **AZD டெம்ப்ளேட்டை உருவாக்கவும்**
3. **பாதுகாப்பு நடவடிக்கைகளை செயல்படுத்தவும்**
4. **கண்காணிப்பு மற்றும் எச்சரிக்கை அமைக்கவும்**
5. **டெப்ளாய் পাইப்லைன்களை உருவாக்கவும்**
6. **தீர்மானத்தை ஆவணப்படுத்தவும்**

### மதிப்பீட்டு நிலைமைகள்

- ✅ **செயல்பாடு**: அனைத்து தேவைகளையும் பூர்த்தி செய்ததா?
- ✅ **பாதுகாப்பு**: சிறந்த நடைமுறைகள் அமல்படுத்தப்பட்டுள்ளதா?
- ✅ **அளவீடு**: ஏற்றத்தை கையாளக்கூடியதா?
- ✅ **பராமரிப்புச் சாத்தியத்தன்மை**: குறியீடு மற்றும் இன்ஃபிராஸ்ட்ரக्चर நன்கு ஒழுங்குபடுத்தப்பட்டுள்ளதா?
- ✅ **செலவு**: பட்ஜெட்டுக்குள் இருக்கிறதா?

## கூடுதல் வளங்கள்

### Microsoft ஆவணங்கள்
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### உதாரண டெம்ப்ளேட்கள்
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 முடிப்பு சான்றிதழ்

வரவுக! நீங்கள் AI பணிமனைபயிற்சி ஆய்வகத்தை முடித்துவிட்டீர்கள். இப்பொழுது நீங்கள் இதைச் செய்யக் கூடியிருக்க வேண்டும்:

- ✅ உள்ள AI பயன்பாடுகளை AZD டெம்ப்ளேட்டுகளாக மாற்ற முடியும்
- ✅ உற்பத்தி-தயார் AI பயன்பாடுகளை நிறுவ மற்றும் பிரயோகத்தில் இயக்க முடியும்
- ✅ AI பணிகளுக்கான பாதுகாப்பு சிறந்த நடைமுறைகளை அமல்படுத்த முடியும்
- ✅ AI பயன்பாட்டின் செயல்திறனை கண்காணித்து மேம்படுத்த முடியும்
- ✅ பொதுவான வெளியீட்டு பிரச்சனைகளை தீர்க்க முடியும்

### அடுத்த படிகள்
1. இந்த மாதிரிகளை உங்கள் சொந்த AI திட்டங்களில் பயன்படுத்தவும்
2. டெம்ப்ளேட்டுகளை சமூகத்திற்கு திருப்பி வழங்கவும்
3. தொடர்ந்த ஆதரவிற்கு Microsoft Foundry Discord இல் சேரவும்
4. பல-பிராந்திய வெளியீடுகள் போன்ற மேம்பட்ட தலைப்புகளை ஆராயவும்

---

**Workshop Feedback**: உங்கள் அனுபவத்தை [Microsoft Foundry Discord #Azure சேனல்](https://discord.gg/microsoft-azure) இல் பகிர்ந்து இந்த பயிற்சியை மேம்படுத்த உதவுங்கள்.

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD தொடக்கக்காரர்கள்](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை அபிவிருத்தி
- **⬅️ முந்தையது**: [AI மாடல் வெளியீடு](ai-model-deployment.md)
- **➡️ அடுத்தது**: [உற்பத்தி AI சிறந்த நடைமுறைகள்](production-ai-practices.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)

**உதவி தேவையா?** AZD மற்றும் AI வெளியீடுகளைப் பற்றிய ஆதரவுக்கும் விவாதங்களுக்கும் எங்கள் சமூகத்தில் சேரவும்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->