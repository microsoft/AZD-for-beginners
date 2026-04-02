# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**అధ్యాయం నావిగేషన్:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## వర్క్‌షాప్ అవలోకనం

ఈ హ్యాండ్‌స్ఓన్ ల్యాబ్ డెవలపర్లకు ఒక ఉన్నతమైన AI టెంప్లేట్‌ను తీసుకుని Azure Developer CLI (AZD) ఉపయోగించి దాన్ని డిప్లాయ్ చేసే ప్రక్రియలో గైడ్ చేస్తుంది. మీరు Microsoft Foundry సేవలను ఉపయోగించి ప్రొడక్షన్ AI డిప్లాయ్‌మెంట్ల కోసం అవసరమైన నమూనాలను నేర్చుకుంటారు.

> **నిర్ధారణ గమనిక (2026-03-25):** ఈ వర్క్‌షాప్‌ను `azd` `1.23.12` ఆధారంగా సమీక్షించారు. మీ స్థానిక ఇన్‌స్టాలేషన్ పాతదైతే, క్రింది దశలతో ఆథ్, టెంప్లేట్ మరియు డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లో సరిపోవడానికి ప్రారంభించే ముందు AZDని అప్‌డేట్ చేయండి.

**వ్యవధి:** 2-3 గంటలు  
**స్తాయి:** మధ్యస్థ  
**ముందస్తు అవసరాలు:** Azure గురించి ప్రాథమిక పరిజ్ఞానం, AI/ML కాన్సెప్ట్‌లతో పరిచయం

## 🎓 అభ్యాస లక్ష్యాలు

ఈ వర్క్‌షాప్ చివరలో, మీరు చేయగలుగుతారు:
- ✅ ఉన్న AI అప్లికేషన్‌ను AZD టెంప్లేట్లను ఉపయోగించేలా మార్చడం
- ✅ AZDతో Microsoft Foundry సేవలను కాన్ఫిగర్ చేయడం
- ✅ AI సేవల కోసం సురక్షిత క్రెడెన్షియల్ నిర్వహణను అమలు చేయడం
- ✅ మానిటరింగ్‌తో ప్రొడక్షన్-రెడీ AI అప్లికేషన్లను డిప్లాయ్ చేయడం
- ✅ సాధారణ AI డిప్లాయ్‌మెంట్ సమస్యలను తొలగించడం

## ముందస్తు అవసరాలు

### అవసరమైన సాధనాలు
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ఇన్‌స్టాల్ చేయబడాలి
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ఇన్‌స్టాల్ చేయబడాలి
- [Git](https://git-scm.com/) ఇన్‌స్టాల్ చేయబడాలి
- కోడ్ ఎడిటర్ (VS Codeను సూచించబడింది)

### Azure వనరులు
- కంట్రిబ్యూటర్ యాక్సెస్ ఉన్న Azure సబ్‌స్క్రిప్షన్
- Microsoft Foundry Models సేవలకు యాక్సెస్ (లేదా యాక్సెస్ కోసం అభ్యర్థించగల సామర్థ్యం)
- రీసోర్సు గ్రూప్ సృష్టించే అనుమతులు

### అవసరమైన జ్ఞాన పూర్వాపరాలు
- Azure సేవల ప్రాథమిక అవగాహన
- కమాండ్-లైన్ ఇంటర్‌ఫేస్‌లతో పరిచయం
- AI/ML ప్రాథమిక కాన్సెప్ట్స్ (APIs, మోడల్స్, ప్రాంప్ట్స్)

## ల్యాబ్ సెటప్

### దశ 1: పరిసరాల సిద్ధత

1. **సాధనాల సంస్థాపనలను ధృవీకరించండి:**
```bash
# AZD సంస్థాపనను తనిఖీ చేయండి
azd version

# Azure CLI ను తనిఖీ చేయండి
az --version

# AZD వర్క్‌ఫ్లోల కోసం Azureలో లాగిన్ చేయండి
azd auth login

# డయాగ్నోస్టిక్స్ సమయంలో az కమాండ్లు నడపాలనుకుంటే మాత్రమే Azure CLIలో లాగిన్ అవ్వండి
az login
```

If you work across multiple tenants or your subscription is not detected automatically, retry with `azd auth login --tenant-id <tenant-id>`.

2. **వర్క్‌షాప్ రేపోజిటరీని క్లోన్ చేయండి:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### AI AZD టెంప్లేట్ యొక్క నిర్మాణం

AI-సిద్ధ AZD టెంప్లేట్‌లోని కీలక ఫైళ్లను పరిశీలించండి:

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

### **ల్యాబ్ వ్యాయామం 1.1: కాన్ఫిగరేషన్ పరిశీలించండి**

1. **azure.yaml ఫైల్‌ను పరిశీలించండి:**
```bash
cat azure.yaml
```

**ఏం చూడాలో:**
- AI కంపోనెంట్‌ల కోసం సర్వీస్ నిర్వచనాలు
- ఎన్విరాన్‌మెంట్ వేరియబుల్ మ్యాపింగ్స్
- హోస్ట్ కాన్ఫిగరేషన్‌లు

2. **main.bicep ఇన్‌ఫ్రాస్ట్రక్చర్‌ను సమీక్షించండి:**
```bash
cat infra/main.bicep
```

**గుర్తించవలసిన కీలక AI నమూనాలు:**
- Microsoft Foundry Models సేవా ప్రావిజనింగ్
- Cognitive Search సమగ్రీకరణ
- సురక్షిత కీ నిర్వహణ
- నెట్‌వర్క్ భద్రత కాన్ఫిగరేషన్‌లు

### **చర్చ పాయింట్:** AI కోసం ఈ నమూనాలు ఎందుకు ముఖ్యం?

- **Service Dependencies**: AI యాప్లు తరచుగా బహుళ సమన్వయిత సేవలను అవసరం పడతాయి
- **Security**: API కీలు మరియు ఎండ్పాయింట్లను సురక్షితంగా నిర్వహించాలి
- **Scalability**: AI వర్క్‌లోడ్స్‌కు వేరుగా స్కేలింగ్ అవసరాలు ఉంటాయి
- **Cost Management**: సరైన కాన్ఫిగరేషన్ లేకపోతే AI సేవలు ఖరీదైనవిగా మారవచ్చు

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# మీ ఇష్టమైన Azure ప్రాంతాన్ని సెట్ చేయండి
azd env set AZURE_LOCATION eastus

# ఐచ్ఛికం: నిర్దిష్ట OpenAI మోడల్‌ను సెట్ చేయండి
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**`azd up` సమయంలో ఏమి జరుగుతుందో:**
- ✅ Microsoft Foundry Models సేవను ప్రావిజన్ చేస్తుంది
- ✅ Cognitive Search సేవను సృష్టిస్తుంది
- ✅ వెబ్ అప్లికేషన్ కోసం App Service సెటప్ చేస్తుంది
- ✅ నెట్‌వర్కింగ్ మరియు భద్రతను కాన్ఫిగర్ చేస్తుంది
- ✅ అప్లికేషన్ కోడ్‌ను డిప్లాయ్ చేస్తుంది
- ✅ మానిటరింగ్ మరియు లాగింగ్‌ను సెటప్ చేస్తుంది

2. **డిప్లాయ్‌మెంట్ పురోగతిని గమనించండి** మరియు సృష్టించబడుతున్న రీసోర్సులను గుర్తించండి.

### Step 2.3: Verify Your Deployment

1. **డిప్లాయ్ చేసిన రీసోర్సులను తనిఖీ చేయండి:**
```bash
azd show
```

2. **డిప్లాయ్ చేసిన అప్లికేషన్ తెరవండి:**
```bash
azd show
```

Open the web endpoint shown in the `azd show` output.

3. **AI ఫంక్షనాలిటీని పరీక్షించండి:**
   - వెబ్ అప్లికేషన్‌కి వెళ్ళండి
   - నమూనా క్వెరీస్ పరీక్షించండి
   - AI ప్రతిస్పందనలు పని చేస్తున్నాయో ధృవీకరించండి

### **ల్యాబ్ వ్యాయామం 2.1: ట్రబుల్‌షూటింగ్ ప్రాక్టీస్**

**సన్నివేశం**: మీ డిప్లాయ్‌మెంట్ విజయవంతమవగా కూడా AI స్పందించటం లేదు.

**సాధారణ సమస్యలు చెక్ చేయవలసినవి:**
1. **OpenAI API keys**: అవి సరిగా సెటింగ్ అయ్యాయో పరీక్షించండి
2. **Model availability**: మీ రీజియన్ ఆ మోడల్‌ను సపోర్ట్ చేస్తోందా చెక్ చేయండి
3. **Network connectivity**: సేవలు పరస్పరం కమ్యూనికేట్ చేయగలవా చూసుకోండి
4. **RBAC permissions**: అప్లికేషన్ OpenAIకి యాక్సెస్ ఉండేలా అనుమతులు ఉన్నాయో ధృవీకరించండి

**డీబగ్గింగ్ కమాండ్లు:**
```bash
# పర్యావరణ చరాలను తనిఖీ చేయండి
azd env get-values

# డిప్లాయ్‌మెంట్ లాగ్‌లను చూడండి
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI డిప్లాయ్‌మెంట్ స్థితిని తనిఖీ చేయండి
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **OpenAI మోడల్‌ను నవీకరించండి:**
```bash
# వేరే మోడల్‌కు మారండి (మీ ప్రాంతంలో అందుబాటులో ఉంటే)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# కొత్త కాన్ఫిగరేషన్‌తో మళ్లీ డిప్లాయ్ చేయండి
azd deploy
```

2. **అదనపు AI సేవలను చేర్చండి:**

Edit `infra/main.bicep` to add Document Intelligence:

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

### Step 3.2: Environment-Specific Configurations

**ఉత్తమ పద్ధతి**: డెవలప్‌మెంట్ మరియు ప్రొడక్షన్‌కు వివిధ కాన్ఫిగరేషన్లు ఉండాలి.

1. **ప్రొడక్షన్ ఎన్విరాన్‌మెంట్ సృష్టించండి:**
```bash
azd env new myai-production
```

2. **ప్రొడక్షన్-స్పెసిఫిక్ పారామీటర్లను సెట్ చేయండి:**
```bash
# ప్రొడక్షన్ సాధారణంగా అధిక SKUsను ఉపయోగిస్తుంది
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# అదనపు భద్రతా ఫీచర్లను సక్రియం చేయండి
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ల్యాబ్ వ్యాయామం 3.1: ఖర్చు ఆప్టిమైజేషన్**

**ఛాలెంజ్**: అభివృద్ధి కోసం ఖర్చు-ప్రభావవంతంగా టెంప్లేట్‌ను కాన్ఫిగర్ చేయండి.

**పనులు:**
1. ఎలాంటి SKUsను ఫ్రీ/బేసిక్ టియర్‌గా సెట్ చేయవచ్చో గుర్తించండి
2. కనిష్ట ఖర్చుకు ఎన్విరాన్‌మెంట్ వేరియబుల్స్‌ను కాన్ఫిగర్ చేయండి
3. డిప్లాయ్ చేసి ప్రొడక్షన్ కాన్ఫిగరేషన్‌తో ఖర్చును తులనా చేయండి

**సమాధాన సూచనలు:**
- సాధ్యమైతే Cognitive Services కోసం F0 (free) టియర్ వినియోగించండి
- డెవ‌లో Search Service కోసం Basic టియర్‌ని ఉపయోగించండి
- Functions కోసం Consumption ప్లాన్ పరిగణలోకి తీసుకోండి

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**ప్రస్తుత సమస్య**: చాలా AI యాప్స్ API కీలు హార్డ్‌కోడ్ చేయటం లేదా అనుభద్రమైన స్టోరేజ్ ఉపయోగించడం.

**AZD పరిష్కారం**: Managed Identity + Key Vault ఇంటిగ్రేషన్.

1. **మీ టెంప్లేట్‌లోని భద్రతా కాన్ఫిగరేషనును సమీక్షించండి:**
```bash
# Key Vault మరియు Managed Identity కాన్ఫిగరేషన్ కోసం చూడండి
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity సక్రమంగా పనిచేస్తున్నదా చెక్ చేయండి:**
```bash
# వెబ్ యాప్‌కు సరిగ్గా గుర్తింపు కాన్ఫిగరేషన్ ఉందో లేదో తనిఖీ చేయండి
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **ప్రైవేట్ ఎండ్పాయింట్లు ఎనేబుల్ చేయండి** (ఇప్పటి వరకు కాన్ఫిగర్ చేయப்படలేదా):

Add to your bicep template:
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

### Step 4.3: Monitoring and Observability

1. **Application Insightsని కాన్ఫిగర్ చేయండి:**
```bash
# Application Insights స్వయంచాలకంగా కాన్ఫిగర్ చేయబడాలి
# కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-స్పెసిఫిక్ మానిటరింగ్ సెటప్ చేయండి:**

AI ఆపరేషన్ల కోసం కస్టమ్ మెట్రిక్స్ జోడించండి:
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

### **ల్యాబ్ వ్యాయామం 4.1: సెక్యూరిటీ ఆడిట్**

**పని**: మీ డిప్లాయ్‌మెంట్‌ను భద్రతా ఉత్తమ పద్ధతుల కోసం సమీక్షించండి.

**చెక్‌లిస్ట్:**
- [ ] కోడ్ లేదా కాన్ఫిగరేషన్‌లో హార్డ్‌కోడ్ చేయబడిన సీక్రెట్స్ ఉండవు
- [ ] సర్వీస్-టు-సర్వీస్ అధికారం కోసం Managed Identity వినియోగించబడుతోందా
- [ ] సున్నితమైన కాన్ఫిగరేషన్ Key Vaultలో నిలిచివుంది
- [ ] నెట్‌వర్క్ యాక్సెస్ సరిగా పరిమితం చేయబడింది
- [ ] మానిటరింగ్ మరియు లాగింగ్ ఎనేబుల్ చేయబడ్డాయి

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**మీ యాప్‌ను మార్చడానికి ముందు**, ఈ ప్రశ్నలకు సమాధానమివ్వండి:

1. **Application Architecture:**
   - మీ యాప్ ఏ AI సేవలను ఉపయోగిస్తుంది?
   - అది ఏ కంప్యూట్ వనరులను అవసరం పడుతుంది?
   - దానికి డేటాబేస్ అవసరమా?
   - సేవల మధ్య ఆధార్యాలు ఏమిటి?

2. **Security Requirements:**
   - మీ యాప్ ఏ సున్నితమైన డేటాను హ్యాండిల్ చేస్తుంది?
   - మీకు ఎలాంటి కంప్లయెన్స్ అవసరమా?
   - ప్రైవేట్ నెట్‌వర్కింగ్ అవసరమా?

3. **Scaling Requirements:**
   - మీ అంచనా లోడ్ ఎంత?
   - ఆటో-స్కేలింగ్ కావాలా?
   - రీజియనల్ అవసరాలున్నాయా?

### Step 5.2: Create Your AZD Template

**మీ యాప్‌ను మార్చడానికి ఈ ప్యాటర్న్‌ను అనుసరించండి:**

1. **బేసిక్ స్ట్రక్చర్ సృష్టించండి:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD టెంప్లేట్‌ను ప్రారంభించండి
azd init --template minimal
```

2. **azure.yaml సృష్టించండి:**
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

3. **ఇన్ఫ్రాస్ట్రక్చర్ టెంప్లేట్లను సృష్టించండి:**

**infra/main.bicep** - ప్రధాన టెంప్లేట్:
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

**infra/modules/openai.bicep** - OpenAI మాడ్యూల్:
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

### **ల్యాబ్ వ్యాయామం 5.1: టెంప్లేట్ సృష్టి ఛాలెంజ్**

**ఛాలెంజ్**: డాక్యుమెంట్ ప్రాసెసింగ్ AI యాప్ కోసం AZD టెంప్లేట్ రూపొందించండి.

**అవసరాలు:**
- కంటెంట్ విశ్లేషణ కోసం Microsoft Foundry Models
- OCR కోసం Document Intelligence
- డాక్యుమెంట్ అప్లోడ్స్ కోసం Storage Account
- ప్రాసెసింగ్ లాజిక్ కోసం Function App
- యూజర్ ఇంటర్‌ఫేస్ కోసం Web app

**బోనస్ పాయింట్లు:**
- సరైన ఎర్రర్ హ్యాండ్లింగ్ చేర్చండి
- ఖర్చు అంచనా చేర్చండి
- మానిటరింగ్ డాష్‌బోర్డ్లు సెటప్ చేయండి

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**లక్షణాలు:** డిప్లాయ్‌మెంట్ క్వోటా ఎర్రర్‌తో విఫలమవుతుంది
**పరిష్కారాలు:**
```bash
# ప్రస్తుత క్వోటాలను తనిఖీ చేయండి
az cognitiveservices usage list --location eastus

# క్వోటా పెంచాలని అభ్యర్థించండి లేదా వేరే ప్రాంతాన్ని ప్రయత్నించండి
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**లక్షణాలు:** AI ప్రతిస్పందనలు విఫలమవడం లేదా మోడల్ డిప్లాయ్‌మెంట్ లో ఎర్రర్లు
**పరిష్కారాలు:**
```bash
# ప్రాంతం ప్రకారం మోడల్ లభ్యతను తనిఖీ చేయండి
az cognitiveservices model list --location eastus

# అందుబాటులో ఉన్న మోడల్‌కు నవీకరించండి
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Issue 3: Permission Issues
**లక్షణాలు:** AI సేవలను పిలిచేప్పుడు 403 Forbidden ఎర్రర్లు
**పరిష్కారాలు:**
```bash
# పాత్రల కేటాయింపులను తనిఖీ చేయండి
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# అభావపడ్డ పాత్రలను జోడించండి
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**పరిశీలన దశలు:**
1. ప్రదర్శన మెట్రిక్స్ కోసం Application Insightsను చెక్ చేయండి
2. Azure పోర్టల్‌లో OpenAI సేవా మెట్రిక్స్‌ను సమీక్షించండి
3. నెట్‌వర్క్ కనెక్టివిటీ మరియు లేటెన్సీని ధృవీకరించండి

**పరిష్కారాలు:**
- సాధారణ క్వెరీస్‌కు క్యాషింగ్ అమలు చేయండి
- మీ ఉపయోగ సందర్భానికి సరిపోయే OpenAI మోడల్ ఉపయోగించండి
- హెచ్చు లోడ్ సన్నివేశాలకు రీడ్ రిప్లికాలకు పరిగణించండి

### **ల్యాబ్ వ్యాయామం 6.1: డీబగ్గింగ్ ఛాలెంజ్**

**సన్నివేశం**: మీ డిప్లాయ్‌మెంట్ విజయవంతమైంది, కానీ అప్లికేషన్ 500 ఎర్రర్స్ ఇచ్చುತ್ತಿದೆ.

**డీబగ్గింగ్ పనులు:**
1. అప్లికేషన్ లాగ్‌లను తనిఖీ చేయండి
2. సేవా కనెక్టివిటీని ధృవీకరించండి
3. ఆథెంటికేషన్‌ను పరీక్షించండి
4. కాన్ఫిగరేషన్‌ను సమీక్షించండి

**ఉపయోగించే టూల్స్:**
- డిప్లాయ్‌మెంట్ అవలోకనానికి `azd show`
- సేవా లాగ్స్ కోసం Azure పోర్టల్
- అప్లికేషన్ టెలిమెట్రీ కోసం Application Insights

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **కస్టమ్ డాష్‌బోర్డ్లు సృష్టించండి:**

Azure పోర్టల్‌కు నావిగేట్ చేసి క్రింది అంశాలతో డాష్‌బోర్డు సృష్టించండి:
- OpenAI అభ్యర్థనల సంఖ్య మరియు లేటెన్సీ
- అప్లికేషన్ లోపాల శాతం
- రీసోర్సు వినియోగం
- ఖర్చు ట్రాకింగ్

2. **అలర్ట్‌లను సెటప్ చేయండి:**
```bash
# అధిక లోపాల రేటుకు హెచ్చరిక
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **ప్రస్తుత ఖర్చులను విశ్లేషించండి:**
```bash
# Azure CLI ఉపయోగించి ఖర్చు డేటాను పొందండి
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **ఖర్చు నియంత్రణలను అమలు చేయండి:**
- బడ్జెట్ అలర్ట్‌లను సెటప్ చేయండి
- ఆటోస్కేలింగ్ పాలసీలను ఉపయోగించండి
- అభ్యర్థన క్యాషింగ్‌ను అమలు చేయండి
- OpenAI కోసం టోకెన్ ఉపయోగాన్ని మానిటర్ చేయండి

### **ల్యాబ్ వ్యాయామం 7.1: ప్రదర్శన ఆప్టిమైజేషన్**

**పని**: ప్రదర్శన మరియు ఖర్చు రెండింటికీ మీ AI అప్లికేషన్‌ను ఆప్టిమైజ్ చేయండి.

**మెట్రిక్స్ మెరుగుపరచాల్సినవి:**
- సగటు స్పందన సమయాన్ని 20% తగ్గించండి
- నెలవారీ ఖర్చును 15% తగ్గించండి
- 99.9% uptime ను నిలబెట్టుకోండి

**ప్రయత్నించవలసిన వ్యూహాలు:**
- స్పందన క్యాషింగ్ అమలు చేయండి
- టోకెన్ సమర్థత కోసం ప్రాంప్ట్స్ ను ఆప్టిమైజ్ చేయండి
- సరైన కంప్యూట్ SKUs ఉపయోగించండి
- సరికొత్త ఆటోస్కేలింగ్ సెటప్స్ ఏర్పాటు చేయండి

## Final Challenge: End-to-End Implementation

### Challenge Scenario

మీ బాధ్యత ఒక ప్రొడక్షన్-రెడీ AI ఆధారిత కస్టమర్ సర్వీస్ చాట్‌బాట్ సృష్టించటమే, క్రింది అవసరాలతో:

**ఫంక్షనల్ అవసరాలు:**
- కస్టమర్ ఇంటరాక్షన్ల కోసం వెబ్ ఇంటర్‌ఫేస్
- ప్రతిస్పందనల కోసం Microsoft Foundry Models సమీకరణ
- Cognitive Search ద్వారా డాక్యుమెంట్ సెర్చ్ సామర్థ్యం
- ఉన్న కస్టమర్ డేటాబేస్‌తో సమగ్రీకరణ
- బహుభాషా మద్దతు

**నాన్-ఫంక్షనల్ అవసరాలు:**
- 1000 సమకాలిక యూజర్లను హ్యాండిల్ చేయగలగడం
- 99.9% uptime SLA
- SOC 2 కంప్లయెన్స్
- $500/నెలకు లోపే ఖర్చు
- బహుళ ఎన్విరాన్‌మెంట్లలో డిప్లాయ్ చేయడం (dev, staging, prod)

### అమలు దశలు

1. ఆర్కిటెక్చర్ డిజైన్ చేయండి
2. AZD టెంప్లేట్ సృష్టించండి
3. భద్రతా చర్యలు అమలు చేయండి
4. మానిటరింగ్ మరియు అలర్టింగ్ సెటప్ చేయండి
5. డిప్లాయ్‌మెంట్ పైప్‌లైన్స్ సృష్టించండి
6. పరిష్కారాన్ని డాక్యుమెంట్ చేయండి

### మూల్యాంకన ప్రమాణాలు

- ✅ **Functionality**: ఇది అన్ని అవసరాలను తీర్చుకుంటుందా?
- ✅ **Security**: ఉత్తమ పద్ధతులు అమలు చేయబడ్డాయా?
- ✅ **Scalability**: ఇవి లోడ్ను భరించగలవా?
- ✅ **Maintainability**: కోడ్ మరియు ఇన్‌ఫ్రాస్ట్రక్చర్ బాగా ఆర్గనైజ్ చేయబడ్డాయా?
- ✅ **Cost**: ఇది బడ్జెట్లలోనే ఉందా?

## అదనపు వనరులు

### Microsoft డాక్యుమెంటేషన్
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### ఉదాహరణ టెంప్లేట్లు
- [Microsoft Foundry Models చాట్ యాప్](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI చాట్ యాప్ క్విక్‌స్టార్ట్](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso చాట్](https://github.com/Azure-Samples/contoso-chat)

### సముదాయ వనరులు
- [Microsoft Foundry డిస్కార్డ్](https://discord.gg/microsoft-azure)
- [Azure డెవలపర్ CLI GitHub](https://github.com/Azure/azure-dev)
- [అద్భుతమైన AZD టెంప్లేట్లు](https://azure.github.io/awesome-azd/)

## 🎓 పూర్తి ధృవపత్రం

అభినందనలు! మీరు AI వర్క్‌షాప్ ప్రయోగశాల పూర్తి చేసారు. ఇప్పుడు మీరు చేయగలరు:

- ✅ ఉన్న AI అప్లికేషన్లను AZD టెంప్లేట్స్‌గా మార్చడం
- ✅ ప్రొడక్షన్-సిద్ధమైన AI అప్లికేషన్లను అమలు చేయడం
- ✅ AI వర్క్‌లోడ్‌ల కోసం భద్రత యొక్క ఉత్తమ ఆచరణలను అమలు చేయడం
- ✅ AI అప్లికేషన్ పనితీరును పర్యవేక్షించి మెరుగుపరచడం
- ✅ సాధారణ డిప్లాయ్‌మెంట్ సమస్యలను పరిష్కరించడం

### తర్వాతి దశలు
1. ఈ నమూనాలను మీ స్వంత AI ప్రాజెక్టులకు వర్తింపచేయండి
2. టెంప్లేట్స్‌ను సముదాయానికి అందించండి
3. కొనసాగుతున్న మద్దతుకు Microsoft Foundry Discordలో చేరండి
4. బహు-ప్రాంత డిప్లాయ్‌మెంట్ల వంటి అధునాతన విషయాలను పరిశీలించండి

---

**వర్క్‌షాప్ ఫీడ్‌బ్యాక్**: మా వర్క్‌షాప్‌ను మెరుగుపరచడంలో సహాయపడేందుకు మీ అనుభవాన్ని [Microsoft Foundry Discord #Azure ఛానెల్](https://discord.gg/microsoft-azure)లో పంచుకోండి.

---

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్స్ హోమ్**: [ప్రారంభుల కోసం AZD](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 2 - AI-ప్రథమ అభివృద్ధి
- **⬅️ మునుపటి**: [AI మోడల్ డిప్లాయ్‌మెంట్](ai-model-deployment.md)
- **➡️ తర్వాతి**: [ప్రొడక్షన్ AI ఉత్తమ ఆచరణలు](production-ai-practices.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/configuration.md)

**సహాయం కావాలా?** AZD మరియు AI డిప్లాయ్‌మెంట్ల గురించి మద్దతు మరియు చర్చల కోసం మా సముదాయంలో చేరండి.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**నిరాకరణ**:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో పొరపాట్లు లేదా లోపాలు ఉండొచ్చు అని దయచేసి గమనించండి. మూల భాషలోని అసలు పత్రాన్ని అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, వృత్తిపరమైన మానవ అనువాదాన్ని చేయించుకోవాలని సూచించబడుతుంది. ఈ అనువాదం ఉపయోగం వల్ల ఏర్పడే ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడంపై మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->