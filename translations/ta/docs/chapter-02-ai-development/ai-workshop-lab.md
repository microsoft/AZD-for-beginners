# AI பணிமனை ஆய்வு: உங்கள் AI தீர்வுகளை AZD-இல் விநியோகிக்கக்கூடியதாக செய்வது

**அத்தியாய வழிசெலவுகள்:**
- **📚 பாடநெறி முகப்பு**: [ஆரம்பிகளுக்கான AZD](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI முதன்மை வளர்ச்சி
- **⬅️ முந்தையது**: [AI மாதிரி விநியோகம்](ai-model-deployment.md)
- **➡️ அடுத்து**: [தயாரிப்பு AI சிறந்த நடைமுறைகள்](production-ai-practices.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)

## பணிமனை கண்ணோட்டம்

இந்த கைநடத்தும் பயிற்சி லேப், ஏற்கனவே உள்ள AI வார்ப்புருவை எடுத்து Azure Developer CLI (AZD) மூலம்.deploy செய்வதற்கான செயல்முறைகளைக் கம்பியர்களை வழிநடத்துகிறது. நீங்கள் Microsoft Foundry சேவைகளைப் பயன்படுத்தி தயாரிப்பு AI deployment-க்கு அவசியமான முன்னுரிமைகள் மற்றும் நடைமுறைகளை கற்றுக்கொள்வீர்கள்.

> **சரிபார்ப்பு குறிப்பு (2026-03-25):** இந்த பணிமனை `azd` `1.23.12` உடன் ஒப்பிட்டு பரிசீலிக்கப்பட்டது. உங்கள் உள்ளூர் நிறுவல் பழையதானால், கீழ்காணும் அடிப்படைக் கட்டங்களுடன் ஒத்துப்போக AZD-ஐ ஆரம்பிப்பதற்கு முன் புதுப்பிக்கவும்.

**காலம்:** 2-3 மணி நேரம்  
**அருகாமை:** நடுத்தர  
**முன்தயாரிப்புகள்:** Azure அடிப்படை அறிவு, AI/ML கருத்துக்களில் அறிமுகம்

## 🎓 கற்றல் குறிக்கோள்கள்

இந்த பணிமனை முடிந்தபின், நீங்கள் முடிந்துவிடுவீர்கள்:
- ✅ ஏற்கனவே உள்ள AI பயன்பாட்டை AZD வார்ப்புருக்களுக்கு மாற்றுவது
- ✅ AZD மூலம் Microsoft Foundry சேவைகளை அமைப்பது
- ✅ AI சேவைகளுக்கான பாதுகாப்பான கடவுச்சாவு (credential) நிர்வாகத்தை நடைமுறைப்படுத்துவது
- ✅ கண்காணிப்புடன் தயாரிப்பு-தயார் AI பயன்பாடுகளை deploy செய்வது
- ✅ பொதுவான AI deployment சிக்கல்களை தீர்க்க தெரிந்துகொள்வது

## தேவையான முன்‌அறிவுகள்

### தேவையான கருவிகள்
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) நிறுவப்பட்டது
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) நிறுவப்பட்டது
- [Git](https://git-scm.com/) நிறுவப்பட்டது
- குறியீட்டு தொகுப்பி (VS Code பரிந்துரைக்கப்படுகிறது)

### Azure வளங்கள்
- contributor access உடன் Azure subscription
- Microsoft Foundry Models சேவைகளுக்கான அணுகல் (அணுகலை கோர முடியும்)
- Resource group உருவாக்கு அனுமதிகள்

### அறிவியல் முன்‌அறிவுகள்
- Azure சேவைகளின் அடிப்படை புரிதல்
- கட்டளைபோன்ற இடைமுகங்களில் (CLI) பணியாற்றும் அனுபவம்
- AI/ML அடிப்படை கருத்துகள் (APIs, மாதிரிகள், prompts)

## பணிமனை அமைப்பு

### படி 1: சூழல் தயாரிப்பு

1. **கருவி நிறுவல்களைச் சரிபார்க்கவும்:**
```bash
# AZD நிறுவல் சரிபார்க்கவும்
azd version

# Azure CLI ஐச் சரிபார்க்கவும்
az --version

# AZD பணிகளில் பயன்படுத்த Azure-க்கு உள்நுழையவும்
azd auth login

# டைக்னோஸ்டிக்ஸ் போது az கட்டளைகளை இயக்க திட்டமிட்டால் மட்டுமே Azure CLI-க்கு உள்நுழையவும்
az login
```

நீங்கள் பல tenants-களுக்கு இடையே பணியாற்றினால் அல்லது உங்கள் subscription தானாக கண்டறியப்படவில்லை என்றால், `azd auth login --tenant-id <tenant-id>` என்று மீண்டும் முயற்சிக்கவும்.

2. **பயிற்சி களஞ்சியத்தை கிளோன் செய்யவும்:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: AZD அமைப்பை AI பயன்பாடுகளுக்காகப் புரிந்துகொள்ளுதல்

### AI AZD வார்ப்புருவின் அமைப்பு

AI-உட்படத் தயாரான AZD வார்ப்புருவில் முக்கிய கோப்புகளை ஆராய்க:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **பயிற்சி 1.1: கட்டமைப்பை ஆராய்க**

1. **azure.yaml கோப்பினை பரிசீலிக்கவும்:**
```bash
cat azure.yaml
```

**பார்க்கவேண்டியவை:**
- AI கூறுகளுக்கான சேவை வரையறைகள்
- சுற்றுச்சூழல் மாறிலி மேப்பிங்(கள்)
- ஹோஸ்ட் கட்டமைப்புகள்

2. **main.bicep உள்கட்டமைப்பை மதிப்பாய்வு செய்யவும்:**
```bash
cat infra/main.bicep
```

**அடையாளம் காண வேண்டிய முக்கிய AI மாதிரிகள்:**
- Microsoft Foundry Models சேவை வழங்கல் provisioning
- Cognitive Search ஒருங்கிணைப்பு
- பாதுகாப்பான விசை நிர்வாகம்
- நெட்வொர்க் பாதுகாப்பு கட்டமைப்புகள்

### **பரிசீலனை புள்ளி:** AI க்காக இந்த மாதிரிகள் ஏன் முக்கியம்

- **சேவை சார்பு தொடர்புகள்**: AI பயன்பாடுகள் பல ஒருங்கிணைந்த சேவைகளை அடிக்கோடையாகப் போலவே தேவைப்படுத்துபவை
- **பாதுகாப்பு**: API விசைகள் மற்றும் முடிவுப் புள்ளிகள் பாதுகாப்பாக நிர்வகிக்கப்பட வேண்டும்
- **பரிமாணத்திறன்**: AI வேலைபாடுகளுக்கு தனித்துவமான அளவீட்டு தேவைகள் உள்ளன
- **காசு மேலாண்மை**: சரியானபடி கட்டமைக்கப்படாவிடில் AI சேவைகள் செலவாகவும் முடியும்

## Module 2: உங்கள் முதல் AI பயன்பாட்டை வெளியிடுதல்

### படி 2.1: சூழலை துவக்குதல்

1. **ஒரு புதிய AZD சூழலை உருவாக்கவும்:**
```bash
azd env new myai-workshop
```

2. **தேவையான பராமீட்டர்களை அமைக்கவும்:**
```bash
# உங்கள் விருப்பமான Azure பிராந்தியத்தை அமைக்கவும்
azd env set AZURE_LOCATION eastus

# விருப்பமான: குறிப்பிட்ட OpenAI மாதிரியை அமைக்கவும்
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### படி 2.2: உட்பொறுப்பு மற்றும் பயன்பாட்டினை வெளியிடுதல்

1. **AZD மூலம் வெளியிடவும்:**
```bash
azd up
```

**`azd up` என்றபோது நடந்துகொள்ளும் செயல்கள்:**
- ✅ Microsoft Foundry Models சேவையை provision செய்கிறது
- ✅ Cognitive Search சேவையை உருவாக்குகிறது
- ✅ வலை பயன்பாட்டிற்கான App Service அமைக்கிறது
- ✅ நெட்வொர்க் மற்றும் பாதுகாப்பை கட்டமைக்கிறது
- ✅ பயன்பாட்டு குறியீட்டை deploy செய்கிறது
- ✅ கண்காணிப்பு மற்றும் பதிவு அமைப்புகளை அமைக்கிறது

2. **விரிவாக deployment முன்னேற்றத்தை கண்காணிக்கவும்** மற்றும் உருவாக்கப்படும் வளங்களை குறியீட்டுக் கவனிக்கவும்.

### படி 2.3: உங்கள் Deployment-ஐ சரிபார்க்கவும்

1. **வினியோகிக்கப்பட்ட வளங்களை சரிபார்க்கவும்:**
```bash
azd show
```

2. **வினியோகிக்கப்பட்ட பயன்பாட்டை திறக்கவும்:**
```bash
azd show
```

`azd show` வெளியீட்டில் காட்டப்பட்டுள்ள web endpoint-ஐ திறக்கவும்.

3. **AI செயல்பாடுகளை பரிசோதிக்கவும்:**
   - வலை பயன்பாட்டிற்கு சென்று
   - மாதிரி வினாக்களை முயற்சிக்கவும்
   - AI பதில்கள் சரியாக செயல்படுவதை உறுதி செய்யவும்

### **பயிற்சி 2.1: சிக்கல்களுக்கு எதிரான பயிற்சி**

**நிகழ்வு**: உங்கள் deployment வெற்றியடைந்தது ஆனால் AI பதிலளிக்கவில்லை.

**சாதாரண சிக்கல்கள் சரிபார்க்க:**
1. **OpenAI API விசைகள்**: அவை சரியாக அமைக்கப்பட்டுள்ளனவா என்று சரிபார்க்கவும்
2. **மாதிரி கிடையாது**: உங்கள் பிராந்தியத்தில் மாதிரி ஆதரிக்கப்படுகிறதா எனச் சோதிக்கவும்
3. **நெட்வொர்க் இணைப்பு**: சேவைகள் தொடர்பு கொள்வதை உறுதிசெய்
4. **RBAC அனுமதிகள்**: பயன்பாடு OpenAI க்கு அணுக முடிகிறதா என சரிபார்க்கவும்

**தவறுதிருத்தக் கட்டளைகள்:**
```bash
# சுற்றுச்சூழல் மாறிலிகளை சரிபார்க்கவும்
azd env get-values

# டிப்ளாய்மென்ட் பதிவுகளைப் பார்க்கவும்
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI டிப்ளாய்மென்ட் நிலையை சரிபார்க்கவும்
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: உங்கள் தேவைகளுக்காக AI பயன்பாடுகளை தனிப்பயனாக்குதல்

### படி 3.1: AI கட்டமைப்பை மாற்றுதல்

1. **OpenAI மாதிரியை புதுப்பிக்கவும்:**
```bash
# உங்கள் பகுதியில் கிடைக்குமானால் வேறொரு மாதிரிக்கு மாற்றவும்
azd env set AZURE_OPENAI_MODEL gpt-4.1

# புதிய கட்டமைப்புடன் மீண்டும் நடைமுறைப்படுத்தவும்
azd deploy
```

2. **கூடுதல் AI சேவைகளை சேர்க்கவும்:**

`infra/main.bicep` ஐத் திருத்தி Document Intelligence ஐச் சேர்க்கவும்:

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

### படி 3.2: சூழல்-விதமான கட்டமைப்புகள்

**சிறந்த நடைமுறை**: வளர்ச்சி மற்றும் தயாரிப்பு கொண்ட அமைப்புகளுக்கு வெவ்வேறு கட்டமைப்புகள்.

1. **ஒரு தயாரிப்பு சூழலை உருவாக்கவும்:**
```bash
azd env new myai-production
```

2. **தயாரிப்பிற்கான குறிப்பிட்ட பராமீட்டர்களை அமைக்கவும்:**
```bash
# உற்பத்தி சூழலில் பொதுவாக உயர்ந்த SKU-கள் பயன்படுத்தப்படுகின்றன
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# கூடுதல் பாதுகாப்பு அம்சங்களை இயக்கவும்
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **பயிற்சி 3.1: செலவு குறைப்புத் திட்டம்**

**சவால்**: செலவின்நேரமான வளர்ச்சிக்காக வார்ப்புருவை கட்டமைக்கவும்.

**பணிகள்:**
1. எந்த SKUs-களை free/basic தளங்களுக்காக அமைக்க முடியும் என்பதை கண்டறியவும்
2. குறைந்த செலவுக்கு சுற்றுச்சூழல் மாறிலிகளை அமைக்கவும்
3. வெளியிட்டு, தயாரிப்பு கட்டமைப்புடன் செலவுகளை ஒப்பிடவும்

**தீர்வு குறிப்பு:**
- சாத்தியமான இடங்களில் Cognitive Services க்கு F0 (இலவச) நிலையை பயன்படுத்தவும்
- வளர்ச்சிக்காக Search Service-க்கு Basic நிலையை பயன்படுத்தவும்
- Functions க்கு Consumption திட்டத்தை பரிசீலிக்கவும்

## Module 4: பாதுகாப்பும் தயாரிப்பு சிறந்த நடைமுறைகளும்

### படி 4.1: கடவுச்சாவு பாதுகாப்பு மேலாண்மை

**தற்போதைய சவால்**: பல AI பயன்பாடுகள் API விசைகளை ஹார்ட்கோடு செய்தாகப் போடுகின்றன அல்லது பாதுகாப்பற்ற சேமிப்பகங்களைப் பயன்படுத்துகின்றன.

**AZD தீர்வு**: Managed Identity + Key Vault ஒருங்கிணைப்பு.

1. **உங்கள் வார்ப்புருவில் பாதுகாப்பு கட்டமைப்பை பரிசீலிக்கவும்:**
```bash
# Key Vault மற்றும் Managed Identity கட்டமைப்பைக் தேடுங்கள்
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity செயல்படுகிறது என்பதை உறுதிசெய்தல்:**
```bash
# வலை பயன்பாட்டுக்கு சரியான அடையாளக் கட்டமைப்பு உள்ளதா என்பதை சரிபார்க்கவும்
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### படி 4.2: நெட்வொர்க் பாதுகாப்பு

1. **Private endpoints-ஐ இயக்கு** (இருந்துவிடைமைச் சீரமைக்கப்படாதிருந்தால்):

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

### படி 4.3: கண்காணிப்பு மற்றும் கண்காணிக்கத்தக்க தன்மை

1. **Application Insights-ஐ கட்டமைக்கவும்:**
```bash
# Application Insights தானாகவே கட்டமைக்கப்பட வேண்டும்
# கட்டமைப்பை சரிபார்க்கவும்:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-க்கான குறிப்பிட்ட கண்காணிப்பை அமைக்கவும்:**

AI செயல்பாடுகளுக்கான தனிப்பயன் metrics சேர்க்கவும்:
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

### **பயிற்சி 4.1: பாதுகாப்பு ஆராய்ச்சி**

**பணி**: உங்கள் deployment-ஐ பாதுகாப்பு சிறந்த நடைமுறைகளுக்காக மதிப்பாய்வு செய்யவும்.

**சரிபார்ப்பு பட்டியல்:**
- [ ] குறியீட்டில் அல்லது கட்டமைப்பில் ஹார்ட்கோடான ரகசியங்கள் இல்லை
- [ ] சேவை-தனி சேவைக்கு Managed Identity பயன்படுத்தப்படுகிறது
- [ ] Key Vault حساس கட்டமைப்புகளை சேமிக்கிறது
- [ ] நெட்வொர்க் அணுகல் சரியாக வரையறுக்கப்பட்டுள்ளது
- [ ] கண்காணிப்பு மற்றும் பதிவு இயங்குகின்றன

## Module 5: உங்கள் சொந்த AI பயன்பாட்டை மாற்றுதல்

### படி 5.1: மதிப்பீட்டு வேலைத்தாள்

**உங்கள் பயன்பாட்டை மாற்றுவதற்கு முன்**, இந்த கேள்விகளை பதிலளிக்கவும்:

1. **பயன்பாட்டு கட்டமைப்பு:**
   - உங்கள் பயன்பாடு எந்த AI சேவைகளைப் பயன்படுத்துகிறது?
   - அதற்கு எந்த கணினி வளங்கள் தேவை?
   - இத்தவாறு ஒரு தரவுத்தளத்தை தேவையா?
   - சேவைகளுக்கிடையிலான சார்புகள் என்ன?

2. **பாதுகாப்பு தேவைகள்:**
   - உங்கள் பயன்பாடு எந்த உணர்வுபூர்வமான தரவுகளை கையாள்கிறது?
   - உங்கள் உயித்தல் (compliance) தேவைகள் என்ன?
   - தனியார் நெட்வொர்க்கை பிரயோஜனப்படுத்த வேண்டுமா?

3. **அளவீட்டு தேவைகள்:**
   - உங்கள் எதிர்பார்க்கப்படும் படைப்பு சுமை என்ன?
   - auto-scaling வேண்டுமா?
   - பிராந்திய தேவைகள் உள்ளதா?

### படி 5.2: உங்கள் AZD வார்ப்புருவை உருவாக்கவும்

**உங்கள் பயன்பாட்டை மாற்ற இந்த மாதிரியை பின்பற்றவும்:**

1. **அடிப்படை அமைப்பை உருவாக்கவும்:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD மாதிரியை ஆரம்பிக்கவும்
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

3. **உள்கட்டமைப்பு வார்ப்புருக்களை உருவாக்கவும்:**

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

**infra/modules/openai.bicep** - OpenAI மொட்யூல்:
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

### **பயிற்சி 5.1: வார்ப்புரு உருவாக்க சவால்**

**சவால்**: ஆவணம் செயலாக்க AI பயன்பாட்டிற்கு ஒரு AZD வார்ப்புருவை உருவாக்கவும்.

**தேவைகள்:**
- உள்ளடக்கம் பகுப்பாய்விற்கு Microsoft Foundry Models
- OCR க்கான Document Intelligence
- ஆவண பதிவுகளுக்கான Storage Account
- செயலாக்க தர்க்கத்திற்கு Function App
- பயனர் முகப்பிற்கு Web app

**போனஸ் புள்ளிகள்:**
- சரியான பிழை கையாள்தலைச் சேர்க்கவும்
- செலவு மதிப்பீட்டினைச் சேர்க்கவும்
- கண்காணிப்பு டாஷ்போர்டுகளை அமைக்கவும்

## Module 6: பொதுவான சிக்கல்களை தீர்க்குதல்

### பொதுவான Deployment சிக்கல்கள்

#### சிக்கல் 1: OpenAI சேவை அதிகார வரம்பு மீறப்பட்டுள்ளது
**அறிகுறிகள்:** Deployment quota பிழையுடன் தோல்வி
**தீர்வுகள்:**
```bash
# தற்போதைய ஒதுக்கீட்டுகளை சரிபார்க்கவும்
az cognitiveservices usage list --location eastus

# ஒதுக்கீட்டை அதிகரிக்கக் கோரிக்கை செய்யவும் அல்லது வேறு பிரதேசத்தை முயற்சிக்கவும்
azd env set AZURE_LOCATION westus2
azd up
```

#### சிக்கல் 2: மாதிரி பிராந்தியத்தில் கிடைக்கவில்லை
**அறிகுறிகள்:** AI பதில்கள் தோல்வியடையலாம் அல்லது மாதிரி deployment பிழைகள்
**தீர்வுகள்:**
```bash
# பிராந்தியத்தின்படி மாதிரி கிடைப்பை சரிபார்க்கவும்
az cognitiveservices model list --location eastus

# கிடைக்கும் மாதிரிக்கு புதுப்பிக்கவும்
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### சிக்கல் 3: அனுமதி பிரச்சினைகள்
**அறிகுறிகள்:** AI சேவைகளை அழைக்கும் போது 403 Forbidden பிழைகள்
**தீர்வுகள்:**
```bash
# பாத்திர ஒதுக்கீடுகளை சரிபார்க்கவும்
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# கிடைக்காமல் உள்ள பாத்திரங்களைச் சேர்க்கவும்
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### செயல்திறன் பிரச்சினைகள்

#### சிக்கல் 4: AI பதில்கள் மெதுவாக வருகிறது
**பரிசோதனை படிகள்:**
1. செயல்திறன் கணக்கெடுப்புகளுக்கு Application Insights-ஐச் சரிபார்க்கவும்
2. Azure போர்ட்டலில் OpenAI சேவை metrics-ஐ மதிப்பாய்வு செய்யவும்
3. நெட்வொர்க் இணைப்பு மற்றும் தாமதத்தை சரிபார்க்கவும்

**தீர்வுகள்:**
- பொதுவான வினாக்களுக்காக கேஷிங் நடைமுறைப்படுத்தவும்
- உங்கள் பயன்பாட்டிற்கு பொருந்தக்கூடிய OpenAI மாதிரியை பயன்படுத்தவும்
- அதிக-சுமை நிலைகளுக்காக படிப்புக் பிரதிகளைக் (read replicas) பராமரிக்க பரிசீலிக்கவும்

### **பயிற்சி 6.1: தப்புகளை கண்டறிதல் சவால்**

**நிகழ்வு**: உங்கள் deployment வெற்றிகரமாக завершியுள்ளது, ஆனால் பயன்பாடு 500 பிழைகளை திரும்ப விடுகிறது.

**தவறுதிருத்தப் பணிகள்:**
1. பயன்பாட்டு பதிவுகளை சரிபார்க்கவும்
2. சேவை இணைப்பை சரிபார்க்கவும்
3. அங்கீகாரத்தை சோதிக்கவும்
4. கட்டமைப்பை பரிசீலிக்கவும்

**பயன்படுத்த வேண்டிய கருவிகள்:**
- deployment கண்ணோட்டத்திற்கு `azd show`
- விரிவான சேவை பதிவுகளுக்காக Azure போர்டல்
- பயன்பாட்டு டெலிமெட்ரிக்காக Application Insights

## Module 7: கண்காணிப்பு மற்றும் 최적화

### படி 7.1: விரிவான கண்காணிப்பை அமைக்கவும்

1. **தனிப்பயன் டாஷ்போர்டுகளை உருவாக்கவும்:**

Azure போர்ட்டலை நோக்கி பின்வட்டியுடன் ஒரு டாஷ்போர்டு உருவாக்கவும்:
- OpenAI கோரிக்கை எண்ணிக்கை மற்றும் தாமதம்
- பயன்பாட்டு பிழை விகிதங்கள்
- வள பயன்பாடு
- செலவுக் கண்காணிப்பு

2. **எச்சரிக்கைகளை அமைக்கவும்:**
```bash
# அதிக பிழை விகிதத்திற்கு எச்சரிக்கை
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### படி 7.2: செலவு 최적화

1. **தற்போதைய செலவுகளை분석 செய்யவும்:**
```bash
# Azure CLI ஐப் பயன்படுத்தி செலவு தரவைப் பெறவும்
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **செலவு கட்டுப்பாடுகளை அமலாக்கவும்:**
- பட்ஜெட் எச்சரிக்கைகளை அமைக்கவும்
- autoscaling கொள்கைகளை பயன்படுத்தவும்
- கோரிக்கை கேஷிங்கை நடைமுறைப்படுத்தவும்
- OpenAI token பயன்பாட்டை கண்காணிக்கவும்

### **பயிற்சி 7.1: செயல்திறன் 최적화**

**பணி**: உங்கள் AI பயன்பாட்டை செயல்திறன் மற்றும் செலவுக்காக 최적화 செய்யவும்.

**மேம்படுத்த வேண்டிய அளவுருக்கள்:**
- சராசரி பதிலளிக்கும் நேரத்தை 20% குறைக்கவும்
- மாதாந்திர செலவுகளை 15% குறைக்கவும்
- 99.9% uptime-ஐ பேணவும்

**செயல்திட்டங்கள் முயற்சிக்க:**
- பதில்திறன் கேஷிங்கை நடைமுறைப்படுத்தவும்
- token திறமையாக்கத்திற்காக prompts-ஐ 최적화 செய்யவும்
- பொருத்தமான கணினி SKUs-ஐப் பயன்படுத்தவும்
- சரியான autoscaling அமைப்புகளை ஏற்படுத்தவும்

## இறுதி சவால்: தொடக்கம் முதல் முடிவுவரை செயல்திறன் அமலாக்கம்

### சவால் நிகழ்வு

நீங்கள் தயாரிப்பு-தயார் AI-சக்தியோடு கூடிய வாடிக்கையாளர் சேவை chatbot ஒன்றை உருவாக்க வாய்ப்பு பெற்றுள்ளீர்கள், இதற்கான தேவைகள்:

** செயல்திறன் தேவைகள்:**
- வாடிக்கையாளர் பரஸ்பர தொடர்புகளுக்கான web இடைமுகம்
- பதில்களுக்கு Microsoft Foundry Models உடன் ஒருங்கிணைப்பு
- Cognitive Search மூலம் ஆவண தேடல் திறன்
- இருக்கின்ற வாடிக்கையாளர் தரவுத்தளத்துடன் ஒருங்கிணைவு
- பன்மொழி ஆதரவு

** செயல்திறனற்ற தேவைகள் (Non-Functional):**
- ஒரே நேரத்தில் 1000 பயனர்களை கையாள்க
- 99.9% uptime SLA
- SOC 2 ஒத்துழைப்பு (compliance)
- மாதத்திற்கு $500 க்குள் செலவு
- பல சூழல்களில் deploy (dev, staging, prod)

### செயலாக்க படிகள்

1. கட்டமைப்பை வடிவமைக்கவும்
2. AZD வார்ப்புருவை உருவாக்கவும்
3. பாதுகாப்பு நடவடிக்கைகளை அமல்படுத்தவும்
4. கண்காணிப்பு மற்றும் எச்சரிப்புகளை அமைக்கவும்
5. Deployment குழாய்களை உருவாக்கவும்
6. தீர்வை ஆவணப்படுத்தவும்

### மதிப்பீட்டுக் критерியங்கள்

- ✅ **செயல்முறை**: அது அனைத்து தேவைகளையும் பூர்த்தி செய்கிறதா?
- ✅ **பாதுகாப்பு**: சிறந்த நடைமுறைகள் நடைமுறைப்படுத்தப்பட்டுள்ளனவா?
- ✅ **அளவீட்டுத்தன்மை**: சுமையை கையாளக்கூடியதா?
- ✅ **பராமரிப்பு சிரமம்**: குறியீடு மற்றும் உள்கட்டமைப்பு நன்கு ஏற்பாடு செய்யப்பட்டுள்ளதா?
- ✅ **செலவு**: பட்ஜெட்டுக்குள் இருக்கிறதா?

## கூடுதல் வளங்கள்

### Microsoft ஆவணங்கள்
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### மாதிரி வார்ப்புருக்கள்
- [Microsoft Foundry மாதிரிகள் சாட் செயலி](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI சாட் செயலி துவக்க வழிகாட்டி](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso சாட்](https://github.com/Azure-Samples/contoso-chat)

### சமூக வளங்கள்
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [அற்புதமான AZD மாதிரிகள்](https://azure.github.io/awesome-azd/)

## 🎓 முடிவு சான்றிதழ்

வாழ்த்துக்கள்! நீங்கள் AI வேலைச்சாலை ஆய்வினை முடித்துவிட்டீர்கள். இப்போது நீங்கள் இதை செய்யக்கூடியதாக இருக்க வேண்டும்:

- ✅ தற்போதைய AI பயன்பாடுகளை AZD மாதிரிகளாக மாற்றுதல்
- ✅ உற்பத்திக்கு தயாரான AI பயன்பாடுகளை நிறுவுதல்
- ✅ AI வேலைப்பளுக்கான பாதுகாப்பு சிறந்த நடைமுறைகளை அமல்படுத்துதல்
- ✅ AI பயன்பாட்டின் செயல்திறனை கண்காணித்து மேம்படுத்துதல்
- ✅ பொதுவான நிறுவல் சிக்கல்களை தீர்க்குதல்

### அடுத்த படிகள்
1. இந்த மாதிரிகளை உங்கள் சொந்த AI திட்டங்களில் நடைமுறைப்படுத்துங்கள்
2. மாதிரிகளை சமூகத்திற்கு பங்களிக்கவும்
3. தொடர்ந்த ஆதரக்காக Microsoft Foundry Discord-இல் இணையுங்கள்
4. பல பிரதேச நியமனங்கள் போன்ற முன்னணித் தலைப்புகளை ஆராயுங்கள்

---

**பயிற்சி பின்னூட்டம்**: இந்த பயிற்சியை மேம்படுத்த உங்கள் அனுபவத்தை [Microsoft Foundry Discord #Azure சேனல்](https://discord.gg/microsoft-azure) இல் பகிர்ந்து எங்களுக்கு உதவுங்கள்.

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [ஆரம்பர்களுக்கான AZD](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை அபிவிருத்தி
- **⬅️ முந்தைய**: [AI மாடல் நியமனம்](ai-model-deployment.md)
- **➡️ அடுத்தது**: [உற்பத்தி AI சிறந்த நடைமுறைகள்](production-ai-practices.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)

**உதவி தேவையா?** AZD மற்றும் AI நியமனங்கள் தொடர்பான ஆதரவு மற்றும் விவாதங்களுக்காக எங்கள் சமூகத்தில் சேரவும்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையாகிய [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்வதாக இருந்தாலும், தானாக செய்யப்பட்ட மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை மனதில் கொள்ளவும். மூல மொழியில் உள்ள அசல் ஆவணம் அதிகாரபூர்வ ஆதாரமாக கருதப்படவேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பின் பயன்படுத்தலினால் ஏற்படும் எந்தவொரு தவறான புரிதலுக்கும் அல்லது தவறான விளக்கத்திற்கும் எங்களுக்கு பொறுப்பில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->