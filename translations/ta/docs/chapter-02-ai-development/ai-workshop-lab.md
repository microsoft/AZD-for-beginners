# AI பட்டறை லேப்: உங்கள் AI தீர்வுகளை AZD-பயன்படுத்தக்கூடியதாக செய்வது

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மையான மேம்பாடு
- **⬅️ முந்தையது**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ அடுத்தது**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 அடுத்த அத்தியாயம்**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## பணிப்பயிற்சி கண்ணோட்டம்

இந்த கைமேல்தட்டி லேப் முன் உள்ள AI வார்ப்புருவை எடுத்துக் கொண்டு Azure Developer CLI (AZD) கொண்டு வைப்பதற்கான செயல்முறையை அமைப்பதில் டெவலப்பர்களை வழிநடத்தியது. Microsoft Foundry சேவைகளை பயன்படுத்தி உற்பத்தி AI வைப்பதற்கான முக்கிய முறைமைகளைக் கற்றுக்கொள்வீர்கள்.

**காலம்:** 2-3 மணி நேரம்  
**நிலை:** மத்தியநிலை  
**முன்னுதாரணங்கள்:** அடிப்படை Azure அறிவு, AI/ML கருத்துக்களில் பழகல்

## 🎓 கற்றல் இலக்குகள்

இந்த பணிப்பயிற்சியை முடித்ததும், நீங்கள் சாத்தியப்படுத்தக்கூடியவை:
- ✅ ஒரு உள்ளமைந்த AI பயன்பாட்டை AZD வார்ப்புருக்களைப் பயன்படுத்தும் வகையில் மாற்றவும்
- ✅ AZD கொண்டு Microsoft Foundry சேவைகளை கட்டமைக்கவும்
- ✅ AI சேவைகளுக்கான பாதுகாப்பான க்ரெடென்ஷியல்நிறுவலையை நடைமுறைப்படுத்தவும்
- ✅ கண்காணிப்பு உடன் உற்பத்திக்கு தயார் AI பயன்பாடுகளை வடிவமைக்கவும்
- ✅ பொதுவான AI வைப்புச் சிக்கல்களை தீர்க்கும் திறன் பெறவும்

## முன்னுதாரணங்கள்

### தேவையான கருவிகள்
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) நிறுவப்பட்டிருக்கும்
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) நிறுவப்பட்டிருக்கும்
- [Git](https://git-scm.com/) நிறுவப்பட்டிருக்கும்
- குறியீட்டு ஆசிரியர் (VS Code பரிந்துரைக்கப்படுகிறது)

### Azure வளங்கள்
- contributor அணுகலுடன் Azure சந்தா
- Microsoft Foundry Models சேவைகளுக்கான அணுகல் (அல்லது அணுகலை கோரும் திறன்)
- Resource group உருவாக்க அனுமதிகள்

### அறிவு தேவைகள்
- Azure சேவைகளின் அடிப்படை அறிவு
- கட்டளை வரிசை இடைமுகங்களில் பழகு
- அடிப்படை AI/ML கருத்துக்கள் (APIs, models, prompts)

## லேப் அமைப்பு

### படி 1: சூழ்நிலை தயார் செய்தல்

1. **கருவிகள் நிறுவப்பட்டிருப்பதைச் சோதிக்கவும்:**
```bash
# AZD நிறுவலை சரிபார்க்கவும்
azd version

# Azure CLI ஐ சரிபார்க்கவும்
az --version

# Azure இல் உள்நுழையவும்
az login
azd auth login
```

2. **பாடநெறி கோப்பகத்தை கிளோன் செய்க:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: AI பயன்பாடுகள் కోసం AZD கட்டமைப்பை புரிந்து கொள்ளுதல்

### AI AZD வார்ப்புருவின் அமைப்பு

AI-க்கு தயாரான AZD வார்ப்புருவில் இருக்கும் முக்கிய கோப்புகளை ஆராய்க:

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

### **பயிற்சி 1.1: கட்டமைப்பை ஆராய்ந்து பார்க்கவும்**

1. **azure.yaml கோப்பை பரிசீலிக்கவும்:**
```bash
cat azure.yaml
```

**எதை கவனிக்க வேண்டும்:**
- AI கூறுகளுக்கான சேவை வரையறைகள்
- சூழல் மாறிலி மேப்பிங்குகள்
- ஹோஸ்ட் கட்டமைப்புகள்

2. **main.bicep உடைய உடைமை-அமைப்பை மீளACTIVE பாருங்கள்:**
```bash
cat infra/main.bicep
```

**அடையாளம் காண வேண்டிய முக்கிய AI முறைமைகள்:**
- Microsoft Foundry Models சேவை ஒதுக்கீடு
- Cognitive Search ஒருங்கிணைப்பு
- பாதுகாப்பான விசைப்பலகை மேலாண்மை
- நெட்வொர்க் பாதுகாப்பு கட்டமைப்புகள்

### **பொருத்தமான விவாத புள்ளி:** ஏன் இவை AIக்காக முக்கியம்?

- **சேவை சார்புகள்**: AI செயலிகளில் பல ஒருங்கிணைந்த சேவைகள் தேவைப்படும்
- **பாதுகாப்பு**: API விசைகள் மற்றும் ఎண்ட్ பொயின்ட்கள் பாதுகாப்பாக நிர்வகிக்கப்பட வேண்டும்
- **அளவீடு உத்திகள்**: AI பணி சாரல்களுக்கு தனித்துவமான அளவீட்டு தேவைகள் உள்ளன
- **செலவு நிர்வாகம்**: சரியான முறையில் அமைக்கப்படாவிட்டால் AI சேவைகள் செலவாகும்

## Module 2: உங்கள் முதல் AI பயன்பாட்டை வைக்கவும்

### படி 2.1: சூழ்நிலையை ஆரம்பித்தல்

1. **புதிய AZD சூழ்நிலையை உருவாக்கவும்:**
```bash
azd env new myai-workshop
```

2. **தேவையான அளவுருக்களை அமைக்கவும்:**
```bash
# உங்கள் விருப்பமான Azure பிராந்தியத்தை அமைக்கவும்
azd env set AZURE_LOCATION eastus

# விருப்பமாக: குறிப்பிட்ட OpenAI மாதிரியை அமைக்கவும்
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### படி 2.2: உடைமை மற்றும் பயன்பாட்டை வைக்கவும்

1. **AZD கொண்டு வைப்பு செய்க:**
```bash
azd up
```

**`azd up` நடைபெறும் போது என்ன நிகழ்கிறது:**
- ✅ Microsoft Foundry Models சேவை ஒதுக்கப்படுகிறது
- ✅ Cognitive Search சேவை உருவாக்கப்படுகிறது
- ✅ வலை பயன்பாட்டிற்கான App Service அமைக்கிறது
- ✅ நெட்வொர்க் மற்றும் பாதுகாப்பு கட்டமைக்கப்படுகிறது
- ✅ பயன்பாடு குறியீடு வைப்பு செய்யப்படுகிறது
- ✅ கண்காணிப்பு மற்றும் பதிவு அமைக்கப்படுகிறது

2. **வைப்பு முன்னேற்றத்தை கண்காணிக்கவும்** மற்றும் உருவாக்கப்படும் வளங்களை பதிவு செய்யவும்.

### படி 2.3: உங்கள் வைப்பை சரிபார்க்கவும்

1. **வைப்புச் செய்யப்பட்ட வளங்களை சோதிக்கவும்:**
```bash
azd show
```

2. **வைப்புச் செய்யப்பட்ட பயன்பாட்டை திறக்கவும்:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI செயல்பாட்டை சோதிக்கவும்:**
   - வலை பயன்பாட்டுக்கு செல்லவும்
   - மாதிரி வினாக்களை முயற்சி செய்யவும்
   - AI பதில்கள் வேலை செய்கிறதா என்பதை சரிபார்க்கவும்

### **பயிற்சி 2.1: பிரச்சினை தீர்க்கும் பயிற்சி**

**காட்சி நிலைமை**: உங்கள் வைப்பு வெற்றி பெற்றுள்ளது ஆனாலும் AI பதிலளிக்கவில்லை.

**சாதாரண சிக்கல்கள் சோதிக்க:**
1. **OpenAI API விசைகள்**: அவை சரியாக அமைக்கப்பட்டுள்ளதா என்பதை சரிபார்க்கவும்
2. **மாதிரி கிடைக்கமைதி**: உங்கள் பிராந்தியத்தில் மாதிரி ஆதரிக்கப்படுகிறதா என்பதை சோதிக்கவும்
3. **இணையதளம் இணைப்பு**: சேவைகள் தொடர்பு கொள்ள முடிகிறதா என்பதை உறுதி செய்யவும்
4. **RBAC அனுமதிகள்**: பயன்பாடு OpenAI அணுகலுக்கு அனுமதியுள்ளதா என சரிபார்க்கவும்

**டீபக்கிங் கட்டளைகள்:**
```bash
# சுற்றுச்சூழல் மாறிலிகளை சரிபார்க்கவும்
azd env get-values

# வினியோக பதிவுகளை பார்க்கவும்
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI வினியோக நிலையை சரிபார்க்கவும்
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: உங்கள் தேவைகளுக்காக AI பயன்பாடுகளை விருத்தி செய்யல்

### படி 3.1: AI கட்டமைப்பை மாற்றுதல்

1. **OpenAI மாதிரியை புதுப்பிக்கவும்:**
```bash
# உங்கள் பகுதியில் கிடைக்குமானால் வேறொரு மாதிரிக்கு மாற்றவும்
azd env set AZURE_OPENAI_MODEL gpt-4.1

# புதிய கட்டமைப்புடன் மீண்டும் அமைத்து இயக்கவும்
azd deploy
```

2. **கூடுதல் AI சேவைகளை சேர்க்கவும்:**

`infra/main.bicep` ஐ Document Intelligence சேர்க்க மாற்றவும்:

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

### படி 3.2: சூழ்நிலை-செயல்பாட்டு கட்டமைப்புகள்

**சிறந்த நடைமுறை**: development மற்றும் production க்கு வெவ்வேறு கட்டமைப்புகள் வைக்கவும்.

1. **ஒரு production சூழ்நிலையை உருவாக்கவும்:**
```bash
azd env new myai-production
```

2. **production-க்கு சிறப்பான அளவுருக்களை அமைக்கவும்:**
```bash
# உற்பத்தியில் பொதுவாக உயர் SKU-களைப் பயன்படுத்துகிறது
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# கூடுதல் பாதுகாப்பு அம்சங்களை செயல்படுத்தவும்
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **பயிற்சி 3.1: செலவு ஒருங்கூலி**

**சவால்**: செலவுக்கேற்றவாறு வளர்ச்சிக்கான வார்ப்புருவை கட்டமைக்கவும்.

**பணிகள்:**
1. எந்த SKUs-ஐ free/basic த்தில் அமைக்கலாம் என்பதை கண்டறியவும்
2. குறைந்த செலவுக்கான சூழல் மாறிலிகளை கட்டமைக்கவும்
3. வைப்பு செய்து production கட்டமைப்புடன் செலவுகளை ஒப்பிடவும்

**தீர்வு குறிப்புகள்:**
- சாத்தியமாயின் Cognitive Servicesக்கு F0 (இலவச) தரத்தை பயன்படுத்தவும்
- development இல் Search Serviceக்கு Basic tier பயன்படுத்தவும்
- Functionsக்கு Consumption திட்டத்தை பரிசீலிக்கவும்

## Module 4: பாதுகாப்பு மற்றும் உற்பத்தி சிறந்த நடைமுறைகள்

### படி 4.1: பாதுகாப்பான க்ரெடென்ஷியல்களின் நிர்வாகம்

**தற்போதைய சவால்**: பல AI செயலிகள் API விசைகளை ஹார்கோட் செய்கின்றன அல்லது பாதுகாப்பற்ற சேமிப்பிடத்தைப் பயன்படுத்துகின்றன.

**AZD தீர்வு**: Managed Identity + Key Vault ஒருங்கிணைவு.

1. **உங்கள் வார்ப்புருவில் உள்ள பாதுகாப்பு கட்டமைப்பைப் பரிசீலிக்கவும்:**
```bash
# Key Vault மற்றும் Managed Identity கட்டமைப்பை தேடுங்கள்
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity வேலை செய்கிறதா என்பதை சரிபார்க்கவும்:**
```bash
# வெப் செயலிக்கு சரியான அடையாள அமைப்பு உள்ளதா என்பதை சரிபார்க்கவும்
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### படி 4.2: நெட்வொர்க் பாதுகாப்பு

1. **பிரைவேட் எண்ட்பாயின்ட்களை இயக்கவும்** (இனிமேல் கட்டமைக்கப்படவில்லையெனில்):

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

### படி 4.3: கண்காணிப்பு மற்றும் பார்வைமை

1. **Application Insights ஐ கட்டமைக்கவும்:**
```bash
# Application Insights தானாகவே கட்டமைக்கப்பட வேண்டும்
# கட்டமைப்பை சரிபார்க்கவும்:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-சுபறிவுறுவான கண்காணிப்பை அமைக்கவும்:**

AI செயல்பாடுகளுக்கான தனிப்பயன் அளவுகோல்களைச் சேர்க்கவும்:
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

**பணி**: உங்கள் வைப்பை பாதுகாப்பு சிறந்த நடைமுறைகளுக்கு சரிபார்க்கவும்.

**சோதனை பட்டியல்:**
- [ ] கோடிலும் கட்டமைப்பிலும் எந்தவொரு ஹார்கோட் ரகசியங்களும் கிடையாது
- [ ] சேவை-மீது சேவைக்கு அங்கீகரிக்க Managed Identity பயன்படுத்தப்படுகிறது
- [ ] Key Vault حساس கட்டமைப்புகளை சேமிக்கிறது
- [ ] நெட்வொர்க் அணுகல் சரியான விதத்தில் கட்டுப்படுத்தப்பட்டுள்ளது
- [ ] கண்காணிப்பு மற்றும் பதிவு இயக்கப்பட்டுள்ளன

## Module 5: உங்கள் சொந்த AI பயன்பாட்டை மாற்றுவது

### படி 5.1: மதிப்பீட்டு வேலைப்பட்டியல்

**உங்கள் செயலியை மாற்றுவதற்கு முன்**, இந்த கேள்விகளுக்கு பதிலளிக்கவும்:

1. **பயன்பாடு கட்டிடக்கலை:**
   - உங்கள் செயலி எந்த AI சேவைகளை பயன்படுத்துகிறது?
   - அது எந்த கணக்கீட்டு வளங்களை தேவைப்படுத்துகிறது?
   - அது ஒரு தரவுத்தளத்தைத் தேவைப்படுத்துகிறதா?
   - சேவைகளுக்கு இடையிலான சார்புகள் என்ன?

2. **பாதுகாப்பு தேவைகள்:**
   - உங்கள் செயலி எந்த நூடான தரவை கையாள்கிறது?
   - எந்த சாதுபடுத்தல் தேவைகள் உள்ளன?
   - தனியார் நெட்வொர்க்கிங் தேவைப்படுகிறதா?

3. **அளவீட்டு தேவைகள்:**
   - எதிர்பார்க்கப்படும் ஏற்றம் என்ன?
   - ஆட்டோ-ஸ்கேலிங் தேவையா?
   - பிராந்திய சம்பந்தப்பட்ட தேவைகள் உள்ளனவா?

### படி 5.2: உங்கள் AZD வார்ப்புருவை உருவாக்கவும்

**உங்கள் செயலியை மாற்ற இந்த வடிவத்தை பின்பற்றவும்:**

1. **அடிப்படை அமைப்பை உருவாக்கவும்:**
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

3. **உடைமை வார்ப்புருக்களை உருவாக்கவும்:**

**infra/main.bicep** - முக்கிய வார்ப்புரு:
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

### **பயிற்சி 5.1: வார்ப்புரு உருவாக்க சவால்**

**சவால்**: ஆவண செயலாக்க AI செயலிக்கு AZD வார்ப்புருவை உருவாக்கவும்.

**தேவைகள்:**
- உள்ளடக்கப் பகுப்பாய்விற்கான Microsoft Foundry Models
- OCR க்கான Document Intelligence
- ஆவணப் பதிவுகளுக்கான Storage Account
- செயலாக்க லாஜிக்கிற்கான Function App
- பயனர் இடைமுகத்திற்கான Web app

**ப்ளஸ் புள்ளிகள்:**
- சரியான பிழை கையாளுதலைச் சேர்க்கவும்
- செலவு மதிப்பீட்டை சேர்க்கவும்
- கண்காணிப்பு டாஷ்போர்டுகளை அமைக்கவும்

## Module 6: பொதுவான சிக்கல்களைத் திருத்துதல்

### பொதுவான வைப்பு சிக்கல்கள்

#### சிக்கல் 1: OpenAI சேவை கொட்டா மீறப்பட்டது
**அறிகுறிகள்:** வைப்பு கொட்டா பிழையுடன் தோல்வியடைகிறது
**தீர்வுகள்:**
```bash
# தற்போதைய குவோட்டாக்களை சரிபார்க்க
az cognitiveservices usage list --location eastus

# குவோட்டா உயர்வை கோரவும் அல்லது வேறு பிராந்தியத்தை முயற்சிக்கவும்
azd env set AZURE_LOCATION westus2
azd up
```

#### சிக்கல் 2: மாதிரி பிராந்தியத்தில் கிடையாது
**அறிகுறிகள்:** AI பதில்கள் தோல்வியடையவோ அல்லது மாதிரி வைப்பு பிழைகள் நிகழவோ செய்யும்
**தீர்வுகள்:**
```bash
# பிராந்திய வாரியாக மாடல் கிடைக்கும் நிலையை சரிபார்க்க
az cognitiveservices model list --location eastus

# கிடைக்கும் மாடலுக்கு புதுப்பிக்க
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### சிக்கல் 3: அனுமதி சிக்கல்கள்
**அறிகுறிகள்:** AI சேவைகளை அழைக்கும் போது 403 Forbidden பிழைகள்
**தீர்வுகள்:**
```bash
# பங்கு ஒதுக்கீடுகளைச் சரிபார்க்கவும்
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# காணாமல் போன பங்குகளைச் சேர்க்கவும்
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### செயல்திறன் சிக்கல்கள்

#### சிக்கல் 4: AI பதில்கள் மெதுவாக வரும்
**கணிக்கல் படிநிலைகள்:**
1. செயல்திறன் அளவுகோலுக்காக Application Insights ஐ சரிபார்த்தல்
2. Azure போர்டலில் OpenAI சேவை அளவுகோல்களை பரிசீலித்தல்
3. நெட்வொர்க் இணைப்பு மற்றும் இறக்குமதி சரிபார்த்தல்

**தீர்வுகள்:**
- பொதுவான விசாரணைகளுக்காக கேஷிங் செயல்படுத்தவும்
- உங்கள் பயன்பாட்டிற்கான சரியான OpenAI மாதிரியை பயன்படுத்தவும்
- அதிக ஏற்றத்திற்கு படிப்பு பிரதிகள் (read replicas) பரிசீலிக்கவும்

### **பயிற்சி 6.1: டீபக்கிங் சவால்**

**காட்சி நிலைமை**: உங்கள் வைப்பு வெற்றி பெற்றது, ஆனால் பயன்பாடு 500 பிழைகளை தருகிறது.

**டீபக்கிங் பணிகள்:**
1. பயன்பாட்டு பதிவு файல்களைப் பார்க்கவும்
2. சேவை இணைப்பைச் சரிபார்க்கவும்
3. அங்கீகாரம் பரிசோதிக்கவும்
4. கட்டமைப்பை மீளாய்வு செய்யவும்

**பயன்படுத்த வேண்டிய கருவிகள்:**
- ஒட்டுமொத்த வைப்பு கண்ணோட்டத்திற்கு `azd show`
- விரிவான சேவை பதிவுகளுக்கு Azure போர்டல்
- பயன்பாட்டு தொலைபார்வைக்கான Application Insights

## Module 7: கண்காணிப்பு மற்றும் 최적화

### படி 7.1: முழுமையான கண்காணிப்பை அமைக்கவும்

1. **தனிப்பயன் டாஷ்போர்டுகளை உருவாக்கவும்:**

Azure போர்டலில் சென்று கீழ்க்கண்டவைகளை கொண்ட டாஷ்போர்டை உருவாக்கவும்:
- OpenAI கோரிக்கை எண்ணிக்கை மற்றும் திறைமையாக்கம்
- பயன்பாட்டு பிழை வீதங்கள்
- வளப்பயன்பாடு
- செலவு கண்காணிப்பு

2. **அலெர்ட்களை அமைக்கவும்:**
```bash
# அதிக பிழை வீதத்திற்கான எச்சரிக்கை
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### படி 7.2: செலவு ஒருங்கூலி

1. **தற்போதைய செலவுகளை phân析 செய்யவும்:**
```bash
# செலவு தரவுகளைப் பெற Azure CLI ஐப் பயன்படுத்தவும்
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **செலவுக் கட்டுப்பாடுகளை நடைமுறைப்படுத்தவும்:**
- பட்ஜெட் அலெர்ட்களை அமைக்கவும்
- ஆட்டோஸ்கேலிங் கொள்கைகளை பயன்படுத்தவும்
- கோரிக்கை கேஷிஙை நடைமுறைப்படுத்தவும்
- OpenAI டோக்கன் பயன்பாட்டை கண்காணிக்கவும்

### **பயிற்சி 7.1: செயல்திறன் 최적화**

**பணி**: உங்கள் AI பயன்பாட்டை செயல்திறன் மற்றும் செலவுக்காக 최적ப்படுத்தவும்.

**மேம்படுத்த வேண்டிய அளவுகோல்கள்:**
- சராசரி பதில்திறனை 20% குறைத்தல்
- மாதாந்திர செலவுகளை 15% குறைத்தல்
- 99.9% நேரமுள்ளமை (uptime) பராமரித்தல்

**செயல்முறைகள் முயற்சிக்க:**
- பதில்கள் கேஷிங்கை நடைமுறைப்படுத்தவும்
- டோக்கன் செயல்திறன் குறைப்பதற்காக prompts ஐ 최적화 செய்யவும்
- சரியான கணக்கீட்டு SKUs பயன்படுத்தவும்
- சரியான ஆட்டோஸ்கேலிங்கை அமைக்கவும்

## இறுதி சவால்: தொடக்கத்திலிருந்து முடிவுவரை நடைமுறைப்படுத்தல்

### சவால் காட்சி நிலைமை

உங்களுக்கு உற்பத்திக்கு தயார் AI-இயங்கும் வாடிக்கையாளர் சேவை chatbot உருவாக்க இயலும்எனக்கு பணியை வழங்கப்பட்டிருக்கிறது, இதோ தேவைகள்:

**செயலாக்க தேவைகள்:**
- வாடிக்கையாளர் தொடர்புகளுக்கான வலை இடைமுகம்
- பதில்களுக்கு Microsoft Foundry Models உடன் ஒருங்கிணைவு
- Cognitive Search வைத்து ஆவண தேடல் திறன்
- அறுந்த வாடிக்கையாளர் தரவுத் தளத்துடன் ஒருங்கிணைவு
- பல்மொழி ஆதரவு

**செயல்முறை சாராத தேவைகள்:**
- 1000 ஒரே நேரத்தில் பயன்படுத்துவோரைக் கையாளுதல்
- 99.9% பயன்பாட்டு நேர உறுதி SLA
- SOC 2 συμμόρφωση
- $500/மாதம் கீழ் செலவு
- பல சூழ்நிலைகளில் (dev, staging, prod) வைப்பு

### நடைமுறை படிகள்

1. **கட்டமைப்பை வடிவமைக்கவும்**
2. **AZD வார்ப்புருவை உருவாக்கவும்**
3. **பாதுகாப்பு ஏற்பாடுகளை நடைமுறைப்படுத்தவும்**
4. **கண்காணிப்பு மற்றும் அலெர்டிங் அமைக்கவும்**
5. **வைப்பு குழாய்களைக் (deployment pipelines) உருவாக்கவும்**
6. **தீர்வை ஆவணப்படுத்தவும்**

### மதிப்பீட்டு அளவுகோல்கள்

- ✅ **செயல்பாடு**: எல்லா தேவைகளையும் பூர்த்தி செய்கிறதா?
- ✅ **பாதுகாப்பு**: சிறந்த நடைமுறைகள் அமல்படுத்தப்பட்டுள்ளனவா?
- ✅ **அளவீடு சாத்தியம்**: ஏற்றத்தை சமாளிக்க முடிகிறதா?
- ✅ **பராமரிப்புத்திறன்**: குறியீடு மற்றும் உடைமை நன்கு ஒழுங்குபடுத்தப்பட்டுள்ளதா?
- ✅ **செலவு**: பட்ஜெட்டில் இருக்கிறதா?

## கூடுதல் வளங்கள்

### Microsoft ஆவணங்கள்
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### மாதிரி வார்ப்புருக்கள்
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### சமூக வளங்கள்
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 முடித்தலான சான்றிதழ்

வாழ்த்துக்கள்! நீங்கள் AI பட்டறை லேபைப் பூர்த்தி செய்துள்ளீர்கள். இப்போது நீங்கள் செய்ய இயலும்:
- ✅ உள்ளமைந்த AI பயன்பாடுகளை AZD வார்ப்புருக்களாக மாற்றுதல்
- ✅ உற்பத்திக்கு தயாரான AI பயன்பாடுகளை நடைமுறைப்படுத்துதல்
- ✅ AI பணி சுமைகளுக்கான பாதுகாப்பு சிறந்த நடைமுறைகளை அமல்படுத்துதல்
- ✅ AI பயன்பாடுகளின் செயல்திறனை கண்காணித்து சிறப்புப்படுத்துதல்
- ✅ வழமையான டெப்ளாய்மெண்ட் பிரச்சினைகளை தீர்த்தெடுக்குதல்

### அடுத்த படிகள்
1. இந்த மாதிரிகளை உங்கள் சொந்த AI திட்டங்களில் பொருத்துங்கள்
2. வார்ப்புருக்களை சமுதாயத்திற்கு வழங்குங்கள்
3. தொடர்ந்து ஆதரகவுக்காக Microsoft Foundry Discord இல் சேர்ந்துகொள்ளுங்கள்
4. பல-பிராந்திய டெப்ளாய்மென்ட்கள் போன்ற முன்னேற்றமான தலைப்புகளை ஆராயுங்கள்

---

**Workshop Feedback**: எங்கள் பட்டறையை மேம்படுத்த உதவ உங்கள் அனுபவத்தை [Microsoft Foundry Discord #Azure சேனலில்](https://discord.gg/microsoft-azure) பகிர்ந்து கொள்ளுங்கள்.

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 Course Home**: [AZD ஆரம்பம்](../../README.md)
- **📖 Current Chapter**: அத்தியாயம் 2 - AI-முதன்மை மேம்பாடு
- **⬅️ Previous**: [AI மாதிரி டெப்ளாய்மெண்ட்](ai-model-deployment.md)
- **➡️ Next**: [உற்பத்தி AI சிறந்த நடைமுறைகள்](production-ai-practices.md)
- **🚀 Next Chapter**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)

**உதவி வேண்டுமா?** AZD மற்றும் AI டெப்ளாய்மெண்ட்கள் தொடர்பான ஆதரவு மற்றும் விவாதங்களுக்கு எங்கள் சமுதாயத்தில் சேர்ந்துகொள்ளுங்கள்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிவிப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான Co‑op Translator (https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. துல்லியத்திற்காக நாம் முயற்சி செய்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை कृபையுடன் கவனத்தில் கொள்ளவும். மூல ஆவணம் அதன் சொந்த மொழியிலேயே அதிகாரப்பூர்வமான மூலமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்காக, தொழில்முறை மனித மொழிபெயர்ப்பாளரை அணுக பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படக்கூடிய எந்த தவறான புரிதல்களிற்கோ அல்லது தவறான விளக்கங்களிற்கோ நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->