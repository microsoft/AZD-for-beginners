# AI Workshop Lab: మీ AI పరిష్కారాలను AZD-Deployable గా తయారు చేయడం

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: Chapter 2 - AI-First Development
- **⬅️ మునుపటి**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ తదుపరి**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 తదుపరి అధ్యాయం**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## వర్కషాప్ అవలోకనం

ఈ ప్రాక్టికల్ ల్యాబ్ ఇప్పటికే ఉన్న AI టెంప్లేట్‌ను తీసుకుని Azure Developer CLI (AZD) ఉపయోగించి డిప్లాయ్ చేయడం ఎలా చేయాలో అభివృద్ధిదారులకు దశలవారీగా మార్గనిర్దేశం చేస్తుంది. మీరు Microsoft Foundry సేవలను ఉపయోగించి ప్రొడక్షన్ AI డిప్లాయ్‌మెంట్స్ కోసం ముఖ్యమైన నమూనాలను నేర్చుకుంటారు.

> **చెల్లింపుదారుడి గమనిక (2026-03-25):** ఈ వర్కషాప్‌ను `azd` `1.23.12` కంటే స్పష్టంగా సమీక్షించారు. మీ స్థానిక ఇన్‌స్టాలేషన్ పాతదే అయితే, auth, టెంప్లేట్ మరియు డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లో కింద ఇచ్చిన అడుగులకు అనుగుణంగా ఉండాలంటే AZD ని అప్డేట్ చేయండి.

**కాలవ్యవధి:** 2-3 గంటలు  
**స్థాయి:** మధ్యస్థం  
**ముందస్తు అవసరాలు:** Azure గురించి ప్రాథమిక జ్ఞానం, AI/ML కాన్సెప్ట్‌లతో పరిచయం

## 🎓 శిక్షణ లక్ష్యాలు

ఈ వర్కషాప్ ముగిసే సమయానికి, మీరు చేయగలుగుతారు:
- ✅ ఉన్న AI అప్లికేషన్‌ను AZD టెంప్లేట్స్ ఉపయోగించేలా మార్పిడి చేయడం
- ✅ AZD తో Microsoft Foundry సేవలను కాన్ఫిగర్ చేయడం
- ✅ AI సేవల కోసం సురక్షిత క్రెడెన్షియల్ నిర్వహణ అమలు చేయడం
- ✅ మానిటరింగ్‌తో ప్రొడక్షన్-సిద్ధ AI అప్లికేషన్స్‌ను డిప్లాయ్ చేయడం
- ✅ సాధారణ AI డిప్లాయ్‌మెంట్ సమస్యలను ట్రబుల్‌షూట్ చేయడం

## ముందస్తు అవసరాలు

### అవసరమైన టూల్స్
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ఇన్స్టాల్ చేయాలి
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ఇన్స్టాల్ చేయాలి
- [Git](https://git-scm.com/) ఇన్స్టాల్ చేయాలి
- కోడ్ ఎడిటర్ (VS Code సిఫార్సు)

### Azure వనరులు
- కంట్రిబ్యూటర్ యాక్సెస్ ఉన్న Azure subscription
- Microsoft Foundry Models సేవలకు యాక్సెస్ (లేదా యాక్సెస్ కోరగల సామర్థ్యం)
- Resource group సృష్టి అనుమతులు

### జ్ఞాన అవసరాలు
- Azure సేవల ప్రాథమిక అవగాహన
- క‌మాండ్-లైన్ ఇంటర్‌ఫేస్‌ల పరిచయం
- AI/ML ప్రాథమిక ధారణలు (APIs, models, ప్రాంప్ట్‌లు)

## ల్యాబ్ సెటప్

### దశ 1: పరిసరాల సిద్ధత

1. **టూల్ ఇన్‌స్టాలేషన్లను నిర్ధారించండి:**
```bash
# AZD ఇన్‌స్టాలేషన్‌ను తనిఖీ చేయండి
azd version

# Azure CLIను తనిఖీ చేయండి
az --version

# AZD వర్క్‌ఫ్లోల కోసం Azureలో లాగిన్ అవ్వండి
azd auth login

# డయాగ్నోస్టిక్స్ సమయంలో az కమాండ్లు నడపాలని ఉంటే మాత్రమే Azure CLIలో లాగిన్ అవ్వండి
az login
```

If you work across multiple tenants or your subscription is not detected automatically, retry with `azd auth login --tenant-id <tenant-id>`.

2. **వర్కషాప్ రిపాజిటరీను క్లోన్ చేయండి:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: AI అప్లికేషనుల కోసం AZD నిర్మాణం అర్థం చేసుకోవడం

### AI AZD టెంప్లేట్ నిర్మాణం

AI-సిద్ధ AZD టెంప్లేట్‌లోని కీలక ఫైళ్లను అన్వేషించండి:

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

### **ల్యాబ్ వ్యాయామం 1.1: కాన్ఫిగరేషన్‌ను అన్వేషించండి**

1. **azure.yaml ఫైల్‌ను పరిశీలించండి:**
```bash
cat azure.yaml
```

**ఎలాంటి విషయాలపై చూడాలి:**
- AI భాగాల కోసం సర్వీస్ నిర్వచనలు
- పరిసర వేరియబుల్ మ్యాపింగ్స్
- హోస్ట్ కాన్ఫిగరేషన్లు

2. **main.bicep ఇన్ఫ్రాస్ట్రక్చర్‌ను సమీక్షించండి:**
```bash
cat infra/main.bicep
```

**గమనించవలసిన ప్రధాన AI నమూనాలు:**
- Microsoft Foundry Models సేవ ప్రావిజనింగ్
- Azure AI Search ఇంటిగ్రేషన్
- సురక్షిత కీ నిర్వహణ
- నెట్‌వర్క్ భద్రత కాన్ఫిగరేషన్లు

### **చర్చ పాయింట్:** AI కోసం ఈ నమూనాలు ఎందుకు ముఖ్యమయ్యాయి

- **సర్వీస్ ఆధారితతలు**: AI అనువర్తనాలకు తరచుగా అనేక సమన్వయమైన సేవలు అవసరం అవుతాయి
- **భద్రత**: API కీలు మరియు ఎండ్‌పాయింట్లను సురక్షితంగా నిర్వహించాలని ఉంటుంది
- **స్కేలబిలిటీ**: AI పనినిర్వహణలకు ప్రత్యేకమైన స్కేలింగ్ అవసరాలు ఉంటాయి
- **ఖర్చు నిర్వహణ**: సరైన‌గా కాన్ఫిగర్ చేయకపోతే AI సేవలు ఖరీదైనవిగా మారవచ్చు

## Module 2: మీ మొదటి AI అప్లికేషన్‌ను డిప్లాయ్ చేయండి

### దశ 2.1: వాతావరణాన్ని ప్రారంభించండి

1. **కొత్త AZD ఎన్విరాన్‌మెంట్‌ను సృష్టించండి:**
```bash
azd env new myai-workshop
```

2. **అవసరమైన పారామీటర్లను సెట్ చేయండి:**
```bash
# మీకు ఇష్టమైన Azure ప్రాంతాన్ని సెట్ చేయండి
azd env set AZURE_LOCATION eastus

# ఐచ్ఛిక: నిర్దిష్ట OpenAI మోడల్‌ను సెట్ చేయండి
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### దశ 2.2: ఇన్ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్‌ను డిప్లాయ్ చేయండి

1. **AZD తో డిప్లాయ్ చేయండి:**
```bash
azd up
```

**`azd up` నడుస్తున్న సమయంలో ఏమి జరుగుతుంది:**
- ✅ Microsoft Foundry Models సేవను ప్రావిజన్ చేస్తుంది
- ✅ Azure AI Search సేవను సృష్టిస్తుంది
- ✅ వెబ్ అప్లికేషన్ కోసం App Service సెటప్ చేస్తుంది
- ✅ నెట్‌వర్కింగ్ మరియు భద్రతని కాన్ఫిగర్ చేస్తుంది
- ✅ అప్లికేషన్ కోడ్‌ను డిప్లాయ్ చేస్తుంది
- ✅ మానిటరింగ్ మరియు లాగింగ్ సెటప్ చేస్తుంది

2. **డిప్లాయ్‌మెంట్ ప్రगతిని పర్యవేక్షించండి** మరియు సృష్టించబడుతున్న వనరుల‌ను గమనించండి.

### దశ 2.3: మీ డిప్లాయ్‌మెంట్‌ను నిర్ధారించుకోండి

1. **డిప్లాయ్ చేసిన వనరులను తనిఖీ చేయండి:**
```bash
azd show
```

2. **డిప్లాయ్ చేసిన అప్లికేషన్‌ను తెరవండి:**
```bash
azd show
```

Open the web endpoint shown in the `azd show` output.

3. **AI ఫంక్షనాలిటీని పరీక్షించండి:**
   - వెబ్ అప్లికేషన్‌కు వెళ్లండి
   - ఉదాహరణ ప్రశ్నలు ప్రయత్నించండి
   - AI ప్రతిస్పందనలు పనిచేస్తున్నాయా అని ధృవీకరించండి

### **ల్యాబ్ వ్యాయామం 2.1: ట్రబుల్‌షూటింగ్ ప్రాక్టీస్**

**సన్నివేశం**: మీ డిప్లాయ్‌మెంట్ విజయవంతమయిందీ కానీ AI స్పందించటం లేదు.

**పరిశీలించవలసిన సాధారణ సమస్యలు:**
1. **OpenAI API కీలు**: అవి సరైనుగా సెటయ్యాయా చూసుకోండి
2. **మోడల్ లభ్యత**: మీ రీజియన్ ఆ మోడల్‌ను మద్దతిస్తుందో లేదో తనిఖీ చేయండి
3. **నెట్‌వర్క్ కనెక్టివిటీ**: సేవలు పరస్పరంగా కమ్యూనికేట్ చేయగలవో లేదో నిర్ధారించండి
4. **RBAC అనుమతులు**: యాప్ OpenAI ను యాక్సెస్ చేయగలదని నిర్ధారించండి

**డీబగ్గింగ్ కమాండ్లు:**
```bash
# పర్యావరణ వేరియబుల్స్‌ను తనిఖీ చేయండి
azd env get-values

# డిప్లాయ్‌మెంట్ లాగ్‌లను వీక్షించండి
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI డిప్లాయ్‌మెంట్ స్థితిని తనిఖీ చేయండి
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: మీ అవసరాలకు అనుగుణంగా AI అప్లికేషన్స్‌ను అనుకూలీకరించండి

### దశ 3.1: AI కాన్ఫిగరేషన్ మార్చండి

1. **OpenAI మోడల్‌ను నవీకరించండి:**
```bash
# వేరే మోడల్‌కు మార్చండి (మీ ప్రాంతంలో లభ్యమైతే)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# కొత్త కాన్ఫిగరేషన్‌తో మళ్లీ డిప్లాయ్ చేయండి
azd deploy
```

2. **అదనపు AI సేవలను జోడించండి:**

Document Intelligence జోడించడానికి `infra/main.bicep` ను ఎడిట్ చేయండి:

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

### దశ 3.2: వాతావరణ-నిర్దిష్ట కాన్ఫిగరేషన్లు

**ఉత్తమ పద్ధతి**: డెవలప్‌మెంట్ మరియు ప్రొడక్షన్ కోసం వేరే కాన్ఫిగరేషన్లు ఉండాలి.

1. **ప్రొడక్షన్ వాతావరణాన్ని సృష్టించండి:**
```bash
azd env new myai-production
```

2. **ప్రొడక్షన్-నిర్దిష్ట పారామీటర్లను సెట్ చేయండి:**
```bash
# ఉత్పత్తి సాధారణంగా అధిక స్థాయి SKUలను ఉపయోగిస్తుంది
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# అదనపు భద్రతా లక్షణాలను సక్రియం చేయండి
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ల్యాబ్ వ్యాయామం 3.1: ఖర్చు ఆప్టిమైజేషన్**

**సవాల్**: డెవలప్‌మెంట్ కోసం టెంప్లేట్‌ను ఖర్చు-సమర్థవంతంగా కాన్ఫిగర్ చేయండి.

**పనులు:**
1. ఉచిత/బేసిక్ టియర్‌లుగా సెట్ చేయదగిన SKUs‌ని గుర్తించండి
2. కనిష్ట ఖర్చు కోసం పరిసర వేరియబుల్స్‌ను కాన్ఫిగర్ చేయండి
3. డిప్లాయ్ చేసి ప్రొడక్షన్ కాన్ఫిగరేషన్‌తో ఖర్చులను తూగించండి

**పరిష్కార సూచనలు:**
- সম্ভవ అయితే Azure AI Services కోసం F0 (free) టియర్ ఉపయోగించండి
- డెవలప్‌మెంట్‌లో Search Service కోసం Basic టియర్ ఉపయోగించండి
- Functions కోసం Consumption ప్లాన్ ఉపయోగించడంపై శ్రద్ధ పెట్టండి

## Module 4: భద్రత మరియు ప్రొడక్షన్ ఉత్తమ పద్ధతులు

### దశ 4.1: సెక్యూర్ క్రెడెన్షియల్ నిర్వహణ

**ప్రస్తుత సవాల్**: బహుళ AI అప్లికేషన్లు API కీలు హార్డ్‌కోడ్ చేస్తాయి లేదా అసురక్షిత స్టోరేజ్ ఉపయోగిస్తాయి.

**AZD పరిష్కారం**: Managed Identity + Key Vault ఇంటిగ్రేషన్.

1. **మీ టెంప్లేట్‌లోని సెక్యూరిటీ కాన్ఫిగరేషన్‌ను సమీక్షించండి:**
```bash
# Key Vault మరియు Managed Identity కాన్ఫిగరేషన్ కోసం చూడండి
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity పనిచేస్తుందో లేదో నిర్ధారించండి:**
```bash
# వెబ్ యాప్‌లో సరైన ఐడెంటిటీ కాన్ఫిగరేషన్ ఉన్నదో తనిఖీ చేయండి
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### దశ 4.2: నెట్‌వర్క్ భద్రత

1. **ప్రైవేట్ ఎండ్‌పాయింట్లను ఎనేబుల్ చేయండి** (ఇప్పటికే కాన్ఫిగర్ చేయబడకపోయినట్లయితే):

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

### దశ 4.3: మానిటరింగ్ మరియు అవలీలబిలిటీ

1. **Application Insights ను కాన్ఫిగర్ చేయండి:**
```bash
# Application Insights స్వయంగా కాన్ఫిగర్ చేయబడాలి
# కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-నిర్దిష్ట మానిటరింగ్‌ను సెటప్ చేయండి:**

AI కార్యకలాపాల కోసం కస్టమ్ మెట్రిక్స్ జోడించండి:
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

**పనిది**: మీ డిప్లాయ్‌మెంట్‌ను సెక్యూరిటీ ఉత్తమ పద్ధతుల కోసం సమీక్షించండి.

**చెక్‌లిస్ట్:**
- [ ] కోడ్ లేదా కాన్ఫిగరేషన్‌లో హార్డ్‌కోడ్ చేయబడిన సీక్రెట్స్ లేవు
- [ ] సర్వీస్-టు-సర్వీస్ ఆథెంటికేషన్కోసం Managed Identity ఉపయోగించబడింది
- [ ] Key Vault సున్నితమైన కాన్ఫిగరేషన్‌ను నిల్వ చేస్తోంది
- [ ] నెట్‌వర్క్ యాక్సెస్ సరైనంగా పరిమితం చేయబడింది
- [ ] పర్యవేక్షణ మరియు లాగింగ్ ఎనేబుల్ చేయబడ్డాయి

## Module 5: మీ స్వంత AI అనువర్తనాన్ని మార్చడం

### దశ 5.1: అంచనా వర్క్‌షీట్

**మీ యాప్‌ను మార్చేముందు**, ఈ ప్రశ్నలకు సమాధానం ఇవ్వండి:

1. **అప్లికేషన్ ఆర్కిటెక్చర్:**
   - మీ యాప్ ఏ AI సేవలను ఉపయోగిస్తుంది?
   - ఇది ఏ compute వనరులను అవసరం చేస్తుంది?
   - దీనికి డేటాబేస్ అవసరమా?
   - సేవల మధ్యขึ้นా ఆశ్రితతలు ఏమిటి?

2. **భద్రతా అవసరాలు:**
   - మీ యాప్ ఏ సున్నితమైన డేటాను నిర్వహిస్తుంది?
   - మీకు ఉండవలసిన కంప్లయన్స్ అవసరాలు ఏమిటి?
   - ప్రైవేట్ నెట్వర్కింగ్ అవసరమేనా?

3. **స్కేలింగ్ అవసరాలు:**
   - మీ అంచనా లోడ్ ఏమిటి?
   - ఆటో-స్కేలింగ్ అవసరమా?
   - ప్రাদেশిక (regional) అవసరాలున్నాయా?

### దశ 5.2: మీ AZD టెంప్లేట్‌ను సృష్టించండి

**మీ యాప్‌ను మార్చడానికి ఈ నమూనాను అనుసరించండి:**

1. **మూల నిర్మాణాన్ని సృష్టించండి:**
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

3. **ఇన్ఫ్రాస్ట్రక్చర్ టెంప్లేట్స్ సృష్టించండి:**

**infra/main.bicep** - మెయిన్ టెంప్లేట్:
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

### **ల్యాబ్ వ్యాయామం 5.1: టెంప్లేట్ సృష్టి సవాల్**

**సవాల్**: డాక్యుమెంట్ ప్రాసెసింగ్ AI యాప్ కోసం AZD టెంప్లేట్ రూపొందించండి.

**ఆవశ్యకతలు:**
- కంటెంట్ విశ్లేషణ కోసం Microsoft Foundry Models
- OCR కోసం Document Intelligence
- డాక్యుమెంట్ అప్లోడ్స్ కోసం Storage Account
- ప్రాసెసింగ్ లాజిక్ కోసం Function App
- యూజర్ ఇంటర్‌ఫేస్ కోసం వెబ్ అప్లికేషన్

**బోనస్ పాయింట్లు:**
- సరైన ఎర్రర్ హ్యాండ్లింగ్ జోడించండి
- ఖర్చు అంచనాను చేర్చండి
- మానిటరింగ్ డ్యాష్‌బోర్డులను సెటప్ చేయండి

## Module 6: సాధారణ సమస్యల పరిష్కారం

### సాధారణ డిప్లాయ్‌మెంట్ సమస్యలు

#### సమస్య 1: OpenAI సేవ కోటా మించిపోయింది
**లక్షణాలు:** డిప్లాయ్‌మెంట్ కోటా పొరపాటు‌తో విఫలమవుతుంది  
**పరిష్కారాలు:**
```bash
# ప్రస్తుత క్వోటాలను తనిఖీ చేయండి
az cognitiveservices usage list --location eastus

# క్వోటా పెంపును అభ్యర్థించండి లేదా వేరే ప్రాంతాన్ని ప్రయత్నించండి
azd env set AZURE_LOCATION westus2
azd up
```

#### సమస్య 2: మీ రీజియన్‌లో మోడల్ అందుబాటులో లేదని కనిపిస్తోంది
**లక్షణాలు:** AI ప్రతిస్పందనలు working కాదు లేదా మోడల్ డిప్లాయ్ లోపాలు వస్తున్నాయి  
**పరిష్కారాలు:**
```bash
# ప్రాంతం వారీగా మోడల్ అందుబాటును తనిఖీ చేయండి
az cognitiveservices model list --location eastus

# అందుబాటులో ఉన్న మోడల్‌కు నవీకరించండి
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### సమస్య 3: అనుమతి సమస్యలు
**లక్షణాలు:** AI సేవలను పిలవగల వేళ 403 Forbidden లోపాలు వస్తున్నాయి  
**పరిష్కారాలు:**
```bash
# పాత్ర కేటాయింపులను తనిఖీ చేయండి
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# లేని పాత్రలను చేర్చండి
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### ప్రదర్శన సంబంధ సమస్యలు

#### సమస్య 4: AI స్పందనలు నెమ్మదిగా వస్తున్నవి
**తనిఖీ దశలు:**
1. Application Insights లో ప్రదర్శన మెట్రిక్స్ తనిఖీ చేయండి
2. Azure పోర్టల్‌లో OpenAI సేవ మెట్రిక్స్‌ని సమీక్షించండి
3. నెట్‌వర్క్ కనెక్టివిటీ మరియు లాటెన్సీని చెక్ చేయండి

**పరిష్కారాలు:**
- సాధారణ ప్రశ్నల కోసం క్యాషింగ్ అమలు చేయండి
- మీ వినియోగానికి సరిపోయే OpenAI మోడల్‌ను ఉపయోగించండి
- హై-లోడ్ పరిస్థితుల కోసం రీడ్ రిప్లికాస్‌లను పరిగణించండి

### **ల్యాబ్ వ్యాయామం 6.1: డీబగ్గింగ్ సవాల్**

**సన్నివేశం**: మీ డిప్లాయ్‌మెంట్ విజయవంతమయింది, కానీ అప్లికేషన్ 500 లోపాలను తిరిగి ఇస్తుంది.

**డీబగ్గింగ్ విధులు:**
1. అప్లికేషన్ లాగ్స్ ను తనిఖీ చేయండి
2. సేవ కనెక్టివిటీని నిర్ధారించండి
3. ఆటెంటికేషన్‌ను పరీక్షించండి
4. కాన్ఫిగరేషన్‌ని సమీక్షించండి

**ఉపయోగించదగిన టూల్స్:**
- `azd show` డిప్లాయ్‌మెంట్ ఓవర్వ్యూ కోసం
- వివరమైన సేవ లాగ్స్ కోసం Azure పోర్టల్
- అప్లికేషన్ టెలిమెట్రీ కోసం Application Insights

## Module 7: మానిటరింగ్ మరియు ఆప్టిమైజేషన్

### దశ 7.1: సమగ్ర మానిటరింగ్ సెటప్ చేయండి

1. **కస్టమ్ డాష్‌బోర్డ్లు సృష్టించండి:**

Azure పోర్టల్‌లోకి నావిగేట్ చేసి క్రింది అంశాలతో డాష్‌బోర్డ్ సృష్టించండి:
- OpenAI అభ్యర్థనల సంఖ్య మరియు లేటెన్సీ
- అప్లికేషన్ లోపాల రేట్స్
- వనరు ఉపయోగం
- ఖర్చుల ట్రాకింగ్

2. **అలర్ట్‌ల‌ను సెటప్ చేయండి:**
```bash
# అధిక లోపాల రేటు కోసం హెచ్చరిక
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### దశ 7.2: ఖర్చు ఆప్టిమైజేషన్

1. **ప్రస్తుత ఖర్చులను విశ్లేషించండి:**
```bash
# ఖర్చుల డేటాను పొందడానికి Azure CLIని ఉపయోగించండి
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **ఖర్చు నియంత్రణలు అమలు చేయండి:**
- బడ్జెట్ అలర్ట్‌లను సెటప్ చేయండి
- ఆటోస్కేలింగ్ పాలసీలను ఉపయోగించండి
- అభ్యర్థన క్యాషింగ్ అమలు చేయండి
- OpenAI కోసం టోకెన్ వినియోగాన్ని పర్యవేక్షించండి

### **ల్యాబ్ వ్యాయామం 7.1: ప్రదర్శన ఆప్టిమైజేషన్**

**పనిది**: ప్రదర్శన మరియు ఖర్చు రెండింటికీ మీ AI అప్లికేషన్‌ను ఆప్టిమైజ్ చేయండి.

**సూచించవలసిన మెట్రిక్స్:**
- సగటు ప్రతిస్పందన సమయాన్ని 20% తగ్గించండి
- నెలవారీ ఖర్చును 15% తగ్గించండి
- 99.9% అప్‌టైమ్ కాపాడండి

**ప్రయత్నించవలసిన వ్యూహాలు:**
- ప్రతిస్పందనా క్యాషింగ్ అమలు చేయండి
- టోకెన్ సమర్థవంతత కోసం ప్రాంప్ట్‌లను ఆప్టిమైజ్ చేయండి
- సరైన compute SKUs ను ఎంపిక చేసుకోండి
- సరైన ఆటోస్కేలింగ్ సెట్టింగ్‌లను ఏర్పాటు చేయండి

## ఫైనల్ సవాల్: ఎండ్-టు-ఎండ్ అమలు

### సవాల్ సన్నివేశం

మీరు ఉద్దేశించినది: ఈ అవసరాలతో ప్రొడక్షన్-సిద్ధ AI-పవర్డ్ కస్టమర్ సర్వీస్ చాట్‌బాట్ రూపొందించడం:

**ఫంక్షనల్ అవసరాలు:**
- కస్టమర్ ఇంటరాక్షన్ల కోసం వెబ్ ఇంటర్‌ఫేస్
- ప్రతిస్పందనల కోసం Microsoft Foundry Models తో ఇంటిగ్రేషన్
- Azure AI Search ఉపయోగించి డాక్యుమెంట్ సెర్చ్ సామర్థ్యం
- ఉన్న కస్టమర్ డేటాబేస్‌తో ఇంటిగ్రేషన్
- బహుభాషా మద్దతు

**నాన్-ఫంక్షనల్ అవసరాలు:**
- 1000 సమాంతర యూజర్లను హ్యాండల్ చేయగలగటం
- 99.9% అప్‌టైమ్ SLA
- SOC 2 కంప్లయన్స్
- నెలకి $500 కన్నా తక్కువ ఖర్చు
- బహు వాతావరణాలలో డిప్లాయ్ చేయాలి (dev, staging, prod)

### అమలు దశలు

1. ఆర్కిటెక్చర్ డిజైన్ చేయండి
2. AZD టెంప్లేట్ సృష్టించండి
3. భద్రతా చర్యలు అమలు చేయండి
4. మానిటరింగ్ మరియు అలర్టింగ్ సెటప్ చేయండి
5. డిప్లాయ్‌మెంట్ పైప్‌లైన్స్ సృష్టించండి
6. సొల్యూషన్‌ను డాక్యుమెంట్ చేయండి

### మూల్యాంకన ప్రమాణాలు

- ✅ **ఫంక్షనాలిటీ**: ఇది అన్ని అవసరాలను తీర్చడం జరిగిందా?
- ✅ **భద్రత**: ఉత్తమ పద్ధతులు అమలులో ఉన్నాయా?
- ✅ **స్కేలబిలిటీ**: భారం నిర్వర్తించగలదా?
- ✅ **నిర్వహణ సౌకర్యం**: కోడ్ మరియు ఇన్ఫ్రాస్ట్రక్చర్ బాగా ఏర్పాటై ఉన్నాయా?
- ✅ **ఖర్చు**: బడ్జెట్‌లో ఉండేలా ఉందా?

## అదనపు వనరులు

### Microsoft డాక్యుమెంటేషన్
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### నమూనా టెంప్లేట్స్
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### సముదాయ వనరులు
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 పూర్తి చేసినట్లు సర్టిఫికెట్

అభినందనలు! మీరు AI వర్క్‌షాప్ ప్రయోగశాలను పూర్తి చేసారు. ఇప్పుడు మీరు చేయగలరనుకున్నవి:

- ✅ ఉన్న AI అప్లికేషన్లను AZD టెంప్లేట్లుగా మార్చగలరు
- ✅ ఉత్పత్తి-సిద్ధమైన AI అప్లికేషన్లను డిప్లాయ్ చేయగలరు
- ✅ AI వర్క్‌లోడ్ల కోసం భద్రత ఉత్తమ పద్ధతులు అమలు చేయగలరు
- ✅ AI అప్లికేషన్ పనితీరును పర్యవేక్షించి ఆప్టిమైజ్ చేయగలరు
- ✅ సాధారణ డిప్లాయ్‌మెంట్ సమస్యలను ట్రబుల్షూట్ చేయగలరు

### తదుపరి దశలు
1. ఈ నమూనాలను మీ స్వంత AI ప్రాజెక్టులకు వర్తింప చేయండి
2. టెంప్లేట్లను కమ్యూనిటీకి తిరిగి సహకరించండి
3. నిరంతర మద్దతుకు Microsoft Foundry Discordలో చేరండి
4. బహుళ-రీజియన్ డిప్లోయ్‌మెంట్ల వంటి అభివృద్ధి అంశాలను అన్వేషించండి

---

**Workshop Feedback**: మా వర్క్‌షాప్‌ను మెరుగుపరచడంలో సహాయపడడానికి మీ అనుభవాన్ని [Microsoft Foundry Discord #Azure చానెల్](https://discord.gg/microsoft-azure) లో పంచుకోండి.

---

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 వర్తమాన అధ్యాయం**: అధ్యాయం 2 - AI-మొదటి అభివృద్ధి
- **⬅️ మునుపటి**: [AI మోడల్ డిప్లాయ్‌మెంట్](ai-model-deployment.md)
- **➡️ తదుపరి**: [ఉత్పత్తి AI ఉత్తమ పద్ధతులు](production-ai-practices.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/configuration.md)

**సహాయం కావాలా?** AZD మరియు AI డిప్లాయ్‌మెంట్ల గురించి మద్దతు మరియు చర్చల కోసం మా కమ్యూనిటీకి చేరండి.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->