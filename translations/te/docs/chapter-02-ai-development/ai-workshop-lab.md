# AI వర్క్‌షాప్ ల్యాబ్: మీ AI పరిష్కారాలను AZD-లో డిప్లాయ్ చేయడం

**అధ్యాయ మార్గదర్శనం:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 2 - AI-ఆధారిత అభివృద్ధి
- **⬅️ మునుపటి**: [AI మోడల్ డిప్లాయ్‌మెంట్](ai-model-deployment.md)
- **➡️ తదుపరి**: [ప్రొడక్షన్ AI ఉత్తమ విధానాలు](production-ai-practices.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/configuration.md)

## వర్క్‌షాప్ అవలోకనం

ఈ ప్రాక్టికల్ ల్యాబ్ డెవలపర్లకు ఉన్న AI టెంప్లేట్‌ను తీసుకొని Azure Developer CLI (AZD) ఉపయోగించి డిప్లాయ్ చేయడంపై దశల వారీగా మార్గదర్శనం చేస్తుంది. Microsoft Foundry సేవలను ఉపయోగించి ప్రొడక్షన్ AI డిప్లాయ్‌మెంట్‌ల కోసం ముఖ్యమైన నమూనాలను మీరు నేర్చుకుంటారు.

**కాలవ్యాప్తి:** 2-3 గంటలు  
**స్థాయి:** మధ్యస్థ  
**అవశ్యకతలు:** ప్రాథమిక Azure జ్ఞానం, AI/ML కాన్సెప్ట్‌ల పరిచయం

## 🎓 నేర్చుకోవాల్సిన లక్ష్యాలు

ఈ వర్క్‌షాప్ ముగిసే సమయానికి, మీరు చేయగలుగుతారు:
- ✅ ముందుగా ఉన్న AI అప్లికేషన్‌ను AZD టెంప్లెట్లను ఉపయోగించేలా మార్చడం
- ✅ AZD తో Microsoft Foundry సేవలను కాన్ఫిగర్ చేయడం
- ✅ AI సేవలకు సురక్షిత గుర్తింపు (క్రెడెన్షియల్స్) నిర్వహణ అమలు చేయడం
- ✅ మానిటరింగ్‌తో ప్రొడక్షన్-సిద్ధ AI అప్లికేషన్లను డిప్లాయ్ చేయడం
- ✅ సాధారణ AI డిప్లాయ్‌మెంట్ సమస్యలను డీబగ్గింగ్ చేయడం

## ముందస్తు అవసరాలు

### అవసరమైన టూల్స్
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ఇన్స్టాల్ చేయబడింది
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ఇన్స్టాల్ చేయబడింది
- [Git](https://git-scm.com/) ఇన్స్టాల్ చేయబడింది
- కోడ్ ఎడిటర్ (VS Code సిఫార్సు చేయబడింది)

### Azure వనరులు
- కంట్రిబ్యూటర్ యాక్సెస్‌తో Azure సబ్‌స్క్రిప్షన్
- Azure OpenAI సేవల యాక్సెస్ (లేదా యాక్సెస్ కోసం అభ్యర్థించగల సామర్థ్యం)
- రిసోర్సు గ్రూప్ సృష్టి అనుమతులు

### జ్ఞాన ఆవశ్యకతలు
- Azure సేవల పై ప్రాథమిక అవగాహన
- కమాండ్-లైన్ ఇంటర్‌ఫేస్‌లతో పరిచయం
- AI/ML ప్రాథమిక కాన్సెప్ట్‌లు (APIs, మోడల్స్, ప్రాంప్ట్‌లు)

## ల్యాబ్ సెటప్

### దశ 1: పర్యావరణ తయారీ

1. **టూల్ ఇన్స్టాలేషన్‌లు ధృవీకరించండి:**
```bash
# AZD సంస్థాపనను తనిఖీ చేయండి
azd version

# Azure CLIని తనిఖీ చేయండి
az --version

# Azureలో లాగిన్ చేయండి
az login
azd auth login
```

2. **వర్క్‌షాప్ రిపోజిటరీని క్లోన్ చేయండి:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## మాడ్యూల్ 1: AI అప్లికేషన్ల కోసం AZD నిర్మాణాన్ని అర్థం చేసుకోవడం

### ఒక AI AZD టెంప్లేట్ యొక్క నిర్మాణం

AI-రెడీ AZD టెంప్లేట్‌లోని ముఖ్య ఫైళ్లు పరిశీలించండి:

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

### **ల్యాబ్ వ్యాయామం 1.1: కాన్ఫిగరేషన్‌ను ఎక్స్‌ప్లోర్ చేయండి**

1. **azure.yaml ఫైల్‌ను పరిశీలించండి:**
```bash
cat azure.yaml
```

**ఏది చూడాలి:**
- AI భాగాల కోసం సేవ నిర్వచనాలు
- పర్యావరణ వేరియబుల్ మ్యాపింగ్లు
- హోస్ట్ కాన్ఫిగరేషన్‌లు

2. **main.bicep ఇన్‌ఫ్రాస్ట్రక్చర్ని సమీక్షించండి:**
```bash
cat infra/main.bicep
```

**గుర్తించవలసిన కీలక AI నమూనాలు:**
- Azure OpenAI సేవ ప్రొవిజనింగ్
- Cognitive Search ఇంటిగ్రేషన్
- సురక్షిత కీ నిర్వహణ
- నెట్‌వర్క్ సెక్యూరిటీ కాన్ఫిగరేషన్‌లు

### **చర్చ పాయింట్:** AI కోసం ఈ నమూనాలు ఎందుకు ముఖ్యం

- **సేవా ఆధారితతలు**: AI అప్లికేషన్లు తరచుగా అనేక సమన్వయిత సేవలను అవసరం చేస్తాయి
- **సెక్యూరిటీ**: API కీస్ మరియు ఎండ్పాయింట్‌లకు సురక్షిత నిర్వహణ అవసరం
- **స్కేలిబిలిటీ**: AI పనిభారం ప్రత్యేకమైన స్కేలింగ్ అవసరాలను కలిగి ఉంటాయి
- **ఖర్చు నిర్వహణ**: సరైనగా కాన్ఫిగర్ చేయకపోతే AI సేవలు ఖరీదైనవి కావచ్చు

## మాడ్యూల్ 2: మీ మొదటి AI అప్లికేషన్‌ను డిప్లాయ్ చేయండి

### దశ 2.1: పర్యావరణాన్ని ఇనిషియలైజ్ చేయండి

1. **కొత్త AZD పర్యావరణం సృష్టించండి:**
```bash
azd env new myai-workshop
```

2. **అవసరమైన పారామితులను సెట్ చేయండి:**
```bash
# మీ ఇష్టమైన Azure ప్రాంతాన్ని సెట్ చేయండి
azd env set AZURE_LOCATION eastus

# ఐచ్ఛికం: నిర్దిష్ట OpenAI మోడల్‌ను సెట్ చేయండి
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### దశ 2.2: ఇన్‌ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్‌ను డిప్లాయ్ చేయండి

1. **AZD తో డిప్లాయ్ చేయండి:**
```bash
azd up
```

**`azd up` సమయంలో ఏం జరుగుతుంది:**
- ✅ Azure OpenAI సేవను ప్రొవైజన్ చేస్తుంది
- ✅ Cognitive Search సేవను సృష్టిస్తుంది
- ✅ వెబ్ అప్లికేషన్ కోసం App Service ను సెటప్ చేస్తుంది
- ✅ నెట్‌వర్కింగ్ మరియు సెక్యూరిటీని కాన్ఫిగర్ చేస్తుంది
- ✅ అప్లికేషన్ కోడ్‌ను డిప్లాయ్ చేస్తుంది
- ✅ మానిటరింగ్ మరియు లాగింగ్ ను సెటప్ చేస్తుంది

2. **డిప్లాయ్‌మెంట్ పురోగతిని పర్యవేక్షించండి** మరియు సృష్టించబడ్డ రీసోర్సులను గమనించండి.

### దశ 2.3: మీ డిప్లాయ్‌మెంట్‌ను నిర్ధారించండి

1. **డిప్లాయ్ చేసిన రీసోర్సులను తనిఖీ చేయండి:**
```bash
azd show
```

2. **డిప్లాయ్ చేసిన అప్లికేషన్‌ను ఓపెన్ చేయండి:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI ఫంక్షనాలిటీని పరీక్షించండి:**
   - వెబ్ అప్లికేషన్‌కి వెళ్ళండి
   - నమూనా ప్రశ్నలను ప్రయత్నించండి
   - AI ప్రతిస్పందనలు పనిచేస్తున్నాయా అని నిర్ధారించండి

### **ల్యాబ్ వ్యాయామం 2.1: ట్రబుల్షూటింగ్ ప్యాక్టీస్**

**సన్నివేశం**: మీ డిప్లాయ్‌మెంట్ విజయం పొందింది కానీ AI స్పందించడం లేదు.

**పరిశీలించవలసిన సాధారణ సమస్యలు:**
1. **OpenAI API కీలు**: అవి సరిగా సెట్ చేయబడ్డాయా అని ధృవీకరించండి
2. **మోడల్ లభ్యత**: మీ రీజియన్ ఆ మోడల్‌ను మద్దతు ఇవ్వుచున్నదో పరీక్షించండి
3. **నెట్‌వర్క్ కనెక్టివిటీ**: సేవలు పరస్పరం కమ్యూనికెట్ చేయగలిగేలా ఉందో నిర్ధారించండి
4. **RBAC అనుమతులు**: అప్లికేషన్ OpenAI ను యాక్సెస్ చేయగలదని ధృవీకరించండి

**డీబగ్గింగ్ కమాండ్లు:**
```bash
# పర్యావరణ చరాలను తనిఖీ చేయండి
azd env get-values

# డిప్లాయ్‌మెంట్ లాగ్‌లను వీక్షించండి
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI డిప్లాయ్‌మెంట్ స్థితిని తనిఖీ చేయండి
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## మాడ్యూల్ 3: మీ అవసరాల కోసం AI అప్లికేషన్లను అనుకూలీకరించడం

### దశ 3.1: AI కాన్ఫిగరేషన్‌ని మార్చండి

1. **OpenAI మోడల్‌ను అప్డేట్ చేయండి:**
```bash
# మీ ప్రాంతంలో అందుబాటులో ఉంటే వేరే మోడల్‌కు మార్చండి
azd env set AZURE_OPENAI_MODEL gpt-4

# కొత్త కాన్ఫిగరేషన్‌తో మళ్ళీ అమలు చేయండి
azd deploy
```

2. **అదనపు AI సేవలను జోడించండి:**

Document Intelligence జోడించడానికి `infra/main.bicep` ను సవరించండి:
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

### దశ 3.2: పర్యావరణ-విశేష కాన్ఫిగరేషన్‌లు

**ఉత్తమ అభ్యాసం**: డెవలప్‌మెంట్ మరియు ప్రొడక్షన్ కోసం వేర్వేరు కాన్ఫిగరేషన్‌లు.

1. **ప్రొడక్షన్ పర్యావరణం సృష్టించండి:**
```bash
azd env new myai-production
```

2. **ప్రొడక్షన్-ప్రత్యేక పారామితులను సెట్ చేయండి:**
```bash
# ఉత్పత్తి సాధారణంగా ఉన్నతమైన SKUలను ఉపయోగిస్తుంది
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# అదనపు భద్రతా లక్షణాలను సక్రియం చేయండి
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ల్యాబ్ వ్యాయామం 3.1: ఖర్చు ఆప్టిమైజేషన్**

**చాలెంజ్**: ఖర్చు-ప్రభావవంతమైన డెవలప్‌మెంట్ కోసం టెంప్లేట్‌ని కాన్ఫిగర్ చేయండి.

**పనులు:**
1. ఏ SKUs ని ఫ్రీ/మూల స్థాయిలుగా (free/basic tiers) సెట్ చేయవచ్చో గుర్తించండి
2. కనీస ఖర్చు కోసం పర్యావరణ వేరియబుల్స్‌ను కాన్ఫిగర్ చేయండి
3. డిప్లాయ్ చేసి ప్రొడక్షన్ కాన్ఫిగరేషన్‌తో ఖర్చులను పోల్చండి

**సమాధాన సూచనలు:**
- సాధ్యమైనప్పుడు Cognitive Services కోసం F0 (ఉచిత) టియర్ ఉపయోగించండి
- డెవలప్‌మెంట్‌లో Search Service కోసం Basic టియర్ ఉపయోగించండి
- Functions కోసం Consumption ప్లాన్ ఉపయోగించడం గురించి పరిగణించండి

## మాడ్యూల్ 4: సెక్యూరిటీ మరియు ప్రొడక్షన్ ఉత్తమ అభ్యాసాలు

### దశ 4.1: సురక్షిత క్రెడెన్షియల్ నిర్వహణ

**ప్రస్తుత సవాలు**: చాలా AI అప్లికేషన్లు API కీస్‌ను హార్డ్‌కోడ్ చేస్తాయి లేదా అసురక్షిత నిల్వ ఉపయోగిస్తాయి.

**AZD పరిష్కారం**: Managed Identity + Key Vault సమాహారం.

1. **మీ టెంప్లేట్‌లోని సెక్యూరిటీ కాన్ఫిగరేషన్‌ను సమీక్షించండి:**
```bash
# Key Vault మరియు Managed Identity కాన్ఫిగరేషన్ కోసం చూడండి
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity పని చేస్తున్నదని ధృవీకరించండి:**
```bash
# వెబ్ యాప్‌కు సరైన గుర్తింపు కాన్ఫిగరేషన్ ఉన్నదో లేదో తనిఖీ చేయండి
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### దశ 4.2: నెట్‌వర్క్ సెక్యూరిటీ

1. **ప్రైవేట్ ఎండ్‌పాయింట్‌లను ఎనేబుల్ చేయండి** (ఇప్పటికే కాన్ఫిగర్ చేయబడకపోతే):

మీ bicep టెంప్లేట్‌లో జోడించండి:
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

### దశ 4.3: మానిటరింగ్ మరియు ఆబ్జర్వబిలిటీ

1. **Application Insights ను కాన్ఫిగర్ చేయండి:**
```bash
# Application Insights స్వయంచాలకంగా కాన్ఫిగర్ చేయబడాలి
# కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-ప్రత్యేక మానిటరింగ్ ను సెటప్ చేయండి:**

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

**పని**: మీ డిప్లాయ్‌మెంట్‌ను సెక్యూరిటీ ఉత్తమ ప్రాక్టీసులకి సమీక్షించండి.

**చెక్‌లిస్ట్:**
- [ ] కోడ్ లేదా కాన్ఫిగరేషన్‌లో ఏ హార్డ్‌కోడ్ చేసిన రహస్యాలు ఉండకూడదు
- [ ] సర్వీస్-టు-సర్వీస్ ఆథెంటికేషన్ కోసం Managed Identity ఉపయోగించినదిగా ఉండాలి
- [ ] Key Vault సున్నితమైన కాన్ఫిగరేషన్‌ను స్టోర్ చేయాలి
- [ ] నెట్‌వర్క్ యాక్సెస్ సరైన విధంగా పరిమితం చేయబడింది
- [ ] మానిటరింగ్ మరియు లాగింగ్ ఎనేబుల్ చేయబడ్డాయి

## మాడ్యూల్ 5: మీ స్వంత AI అప్లికేషన్‌ను కన్వర్ట్ చేయడం

### దశ 5.1: ఆసెస్‌మెంట్ వర్క్షీట్

**మీ అప్లికేషన్‌ను మార్చే ముందు**, ఈ ప్రశ్నలకు సమాధానమివ్వండి:

1. **అప్లికేషన్ ఆర్కిటెక్చర్:**
   - మీ అప్లికేషన్ ఏ AI సేవలను ఉపయోగిస్తుంది?
   - ఇది ఎటువంటి కంప్యూట్ రీసోర్సులను అవసరం పడుతుంది?
   - దానికి డేటాబేస్ అవసరమా?
   - సేవల మధ్య ఆధారితతలు ఏమిటి?

2. **సెక్యూరిటీ అవసరాలు:**
   - మీ అప్లికేషన్ ఎలాంటి సున్నితమైన డాటాను నిర్వహిస్తుంది?
   - మీకు ఏ కంప్లయన్స్ అవసరాలు ఉన్నవి?
   - ప్రైవేట్ నెట్‌వర్కింగ్ అవసరమా?

3. **స్కేలింగ్ అవసరాలు:**
   - మీ ఊహించిన లోడ్ ఎంత?
   - మీకు ఆటో-స్కేలింగ్ అవసరమా?
   - ప్రాంతీయ (రీజనల్) అవసరాలు ఉన్నాయా?

### దశ 5.2: మీ AZD టెంప్లేట్ సృష్టించండి

**మీ అప్లికేషన్‌ను మార్చడానికి ఈ వైఖరిని అనుసరించండి:**

1. **ప్రాథమిక నిర్మాణాన్ని సృష్టించండి:**
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

3. **ఇన్‌ఫ్రాస్ట్రక్చర్ టెంప్లెట్లను సృష్టించండి:**

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

**చాలెంజ్**: డాక్యుమెంట్ ప్రాసెసింగ్ AI అప్లికేషన్ కోసం AZD టెంప్లేట్ సృష్టించండి.

**అవసరమైనవి:**
- కంటెంట్ విశ్లేషణ కోసం Azure OpenAI
- OCR కోసం Document Intelligence
- డాక్యుమెంట్ అప్లోడ్స్ కోసం Storage Account
- ప్రాసెసింగ్ లాజిక్ కోసం Function App
- యూజర్ ఇంటర్‌ఫేస్ కోసం వెబ్ అప్

**బోనస్ పాయింట్లు:**
- సరైన ఏర్రర్ హ్యాండ్లింగ్ జోడించండి
- ఖర్చు అంచనాను చేర్చండి
- మానిటరింగ్ డ్యాష్‌బోర్డ్స్‌ను సెటప్ చేయండి

## మాడ్యూల్ 6: సాధారణ సమస్యలను ట్రబుల్షూట్ చేయడం

### సాధారణ డిప్లాయ్‌మెంట్ సమస్యలు

#### సమస్య 1: OpenAI సేవ క్వోటా అధిగమించబడింది
**లక్షణాలు:** క్వోటా లోపంతో డిప్లాయ్‌మెంట్ విఫలమవుతుంది
**పరిష్కారాలు:**
```bash
# ప్రస్తుత క్వోటాలను తనిఖీ చేయండి
az cognitiveservices usage list --location eastus

# క్వోటా పెంపును అభ్యర్థించండి లేదా వేరే ప్రాంతాన్ని ప్రయత్నించండి
azd env set AZURE_LOCATION westus2
azd up
```

#### సమస్య 2: మీ రీజియన్లో మోడల్ అందుబాటులో లేదు
**లక్షణాలు:** AI ప్రత్యుత్తరాలు విఫలమవుతాయి లేదా మోడల్ డిప్లాయ్‌మెంట్ లో లోపాలు ఉంటాయి
**పరిష్కారాలు:**
```bash
# ప్రాంతం వారీగా మోడల్ లభ్యతను తనిఖీ చేయండి
az cognitiveservices model list --location eastus

# అందుబాటులో ఉన్న మోడల్‌కు నవీకరించండి
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### సమస్య 3: అనుమతి సమస్యలు
**లక్షణాలు:** AI సేవలను పిలిచేటప్పుడు 403 Forbidden లోపాలు
**పరిష్కారాలు:**
```bash
# పాత్రల కేటాయింపులను తనిఖీ చేయండి
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# లేకపోయిన పాత్రలను చేర్చండి
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### పనితీరు సమస్యలు

#### సమస్య 4: AI ప్రత్యుత్తరాలు మందగించటం
**పరిశీలనా దశలు:**
1. పనితీరు మెట్రిక్స్ కోసం Application Insights ను తనిఖీ చేయండి
2. Azure పోర్టల్‌లో OpenAI సేవ మెట్రిక్స్ ను సమీక్షించండి
3. నెట్‌వర్క్ కనెక్టివిటీ మరియు లేటెన్సీని నిర్ధారించండి

**పరిష్కారాలు:**
- సాధారణ ప్రశ్నలకు కోసం క్యాషింగ్ అమలు చేయండి
- మీ ఉపయోగ కేస్‌కు అనుకూలమైన OpenAI మోడల్‌ను ఉపయోగించండి
- అధిక లోడ్ పరిస్థితుల కోసం రీట్ రిప్లిక్స్ (read replicas) గురించి పరిగణించండి

### **ల్యాబ్ వ్యాయామం 6.1: డీబగ్గింగ్ ఛాలెంజ్**

**సన్నివేశం**: మీ డిప్లాయ్‌మెంట్ విజయవంతమయింది, కానీ అప్లికేషన్ 500 లోపాలను అందిస్తోంది.

**డీబగ్గింగ్ పనులు:**
1. అప్లికేషన్ లాగ్‌లను తనిఖీ చేయండి
2. సేవ కనెక్టివిటీని ధృవీకరించండి
3. ఆథెంటికేషన్‌ను పరీక్షించండి
4. కాన్ఫిగరేషన్‌ను సమీక్షించండి

**ఉపయోగించవలసిన టూల్స్:**
- డిప్లాయ్‌మెంట్ అవలోకనం కోసం `azd show`
- వివరమైన సేవల లాగ్స్ కోసం Azure పోర్టల్
- అప్లికేషన్ టెలిమెట్రికి Application Insights

## మాడ్యూల్ 7: మానిటరింగ్ మరియు ఆప్టిమైజేషన్

### దశ 7.1: సమగ్ర మానిటరింగ్ ను సెటప్ చేయండి

1. **కస్టమ్ డ్యాష్‌బోర్డ్స్ రూపొందించండి:**

Azure పోర్టల్‌కు వెళ్లి ఈ విధంగా డ్యాష్‌బోర్డ్ సృష్టించండి:
- OpenAI అభ్యర్థనల సంఖ్య మరియు లేటెన్సీ
- అప్లికేషన్ లోపాల రేట్లు
- రీసోర్స్ వినియోగం
- ఖర్చు ట్రాకింగ్

2. **అలెర్ట్‌లను సెటప్ చేయండి:**
```bash
# అధిక దోషాల రేటుకు హెచ్చరిక
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
# ఖర్చు డేటాను పొందడానికి Azure CLI ఉపయోగించండి
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **ఖర్చు నియంత్రణలను అమలు చేయండి:**
- బడ్జెట్ అలెర్ట్‌లను సెటప్ చేయండి
- ఆటోస్కేలింగ్ పాలసీలను ఉపయోగించండి
- అభ్యర్థన క్యాషింగ్ అమలు చేయండి
- OpenAI కోసం టోకెన్ వినియోగాన్ని పర్యవేక్షించండి

### **ల్యాబ్ వ్యాయామం 7.1: పనితీరు ఆప్టిమైజేషన్**

**పని**: పనితీరు మరియు ఖర్చు రెండింటికీ మీ AI అప్లికేషన్‌ను ఆప్టిమైజ్ చేయండి.

**మెట్రిక్స్ మెరుగుపరచాల్సినవి:**
- సగటు స్పందనా సమయాన్ని 20% తగ్గించండి
- నెలవారీ ఖర్చులను 15% తగ్గించండి
- 99.9% అప్టైమ్ ను నిర్వహించండి

**ప్రయత్నించవలసిన వ్యూహాలు:**
- ప్రతిస్పందన క్యాషింగ్ అమలు చేయండి
- టోకెన్ సామర్థ్యానికి అనుగుణంగా ప్రాంప్ట్‌లను ఆప్టిమైజ్ చేయండి
- అనుకూలమైన compute SKUs ను ఉపయోగించండి
- సరైన ఆటోస్కేలింగ్ సెటప్ చేయండి

## ఫైనల్ చాలెంజ్: ఎండ్-టు-ఎండ్ అమలు

### చాలెంజ్ పరిస్థితి

ఈ తప్పనిసరి లక్షణాలతో ప్రొడక్షన్-సిద్ధ AI ఆధారిత కస్టమర్ సర్వీస్ చాట్బాట్ సృష్టించడం మీ విధంగా ఉంచబడి ఉంది:

**ఫంక్షనల్ అవసరాలు:**
- కస్టమర్ ఇంటరాక్షన్స్ కోసం వెబ్ ఇంటర్‌ఫేస్
- ప్రత్యుత్తరాల కోసం Azure OpenAI తో ఇంటిగ్రేషన్
- Cognitive Search ఉపయోగించి డాక్యుమెంట్ శోధన సామర్థ్యం
- ఉన్న కస్టమర్ డేటాబేస్‌తో ఇంటిగ్రేషన్
- బహుభాషా మద్దతు

**నాన్-ఫంక్షనల్ అవసరాలు:**
- 1000 సమకాలీన వినియోగదారులను నిర్వహించండి
- 99.9% అప్టైమ్ SLA
- SOC 2 అనుగుణత (compliance)
- ఖర్చు నెలకి $500 కంటే తక్కువ
- బహుముఖ పర్యావరణాలకు (dev, staging, prod) డిప్లాయ్ చేయండి

### అమలు దశలు

1. **ఆర్కిటెక్చర్ డిజైన్ చేయండి**
2. **AZD టెంప్లేట్ సృష్టించండి**
3. **సెక్యూరిటీ చర్యలను అమలు చేయండి**
4. **మానిటరింగ్ మరియు అలెర్టింగ్ సెటప్ చేయండి**
5. **డిప్లాయ్‌మెంట్ పైప్లైన్స్‌ను సృష్టించండి**
6. **సొల్యూషన్‌ను డాక్యుమెంట్ చేయండి**

### మూల్యాంకన క్రైటీరియా

- ✅ **ఫంక్షనాలిటీ**: ఇది అన్ని అవసరాలను తీర్చుతుందా?
- ✅ **సెక్యూరిటీ**: ఉత్తమ అభ్యాసాలు అమలు చేయబడ్డాయా?
- ✅ **స్కేలబిలిటీ**: ఇది లోడ్‌ని నిర్వహించగలదా?
- ✅ **నిర్వహణ సామర్థ్యం**: కోడ్ మరియు ఇన్‌ఫ్రాస్ట్రక్చర్ బాగా వ్యవస్థీకృతంగా ఉన్నాయా?
- ✅ **ఖర్చు**: ఇది బడ్జెట్‌లోనే ఉందా?

## అదనపు వనరులు

### Microsoft డాక్యుమెంటేషన్
- [Azure Developer CLI డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/ai-studio/)

### శాంపిల్ టెంప్లెట్లు
- [Azure OpenAI చాట్ యాప్](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App క్విక్‌స్టార్ట్](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### కమ్యూనిటీ వనరులు
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 పూర్తి చేసిన సర్టిఫికెట్
అభినందనలు! మీరు AI వర్క్‌షాప్ ల్యాబ్‌ను పూర్తి చేశారు. ఇప్పుడు మీరు చేయగలరు:

- ✅ ఉన్న AI అనువర్తనాలను AZD టెంప్లేట్స్‌కి మార్చడం
- ✅ ప్రొడక్షన్-సిద్ధమైన AI అనువర్తనాలను డిప్లాయ్ చేయడం
- ✅ AI వర్క్లోడ్స్ కోసం భద్రత ఉత్తమ వ్యావహారికాలను అమలు చేయడం
- ✅ AI అనువర్తన పనితీరును మానిటర్ చేయడం మరియు ఆప్టిమైజ్ చేయడం
- ✅ సాధారణ డిప్లాయ్‌మెంట్ సమస్యలను ట్రబుల్‌షూట్ చేయడం

### తదుపరి దశలు
1. ఈ ప్యాటర్న్‌లను మీ స్వంత AI ప్రాజెక్టులకు వర్తింపచేయండి
2. టెంప్లేట్లను కమ్యూనిటీకి తిరిగి అందించండి
3. కొనసాగుతున్న మద్దతు కోసం Microsoft Foundry Discordలో చేరండి
4. బహు-రీజియన్ డిప్లాయ్‌మెంట్స్ వంటి అధునిక అంశాలను అన్వేషించండి

---

**Workshop Feedback**: ఈ వర్క్‌షాప్‌ను మెరుగుపరచడానికి మీ అనుభవాన్ని [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure)లో పంచుకొని మాకు సహాయం చేయండి.

---

**అధ్యాయం నావిగేషన్:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: అధ్యాయం 2 - AI-ప్రధాన అభివృద్ధి
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**సహాయం కావాలా?** AZD మరియు AI డిప్లాయ్‌మెంట్స్ గురించి మద్దతు మరియు చర్చల కోసం మా కమ్యూనిటీకి చేరండి.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
నిరాకరణ:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో పొరపాట్లు లేదా తప్పుదోవకల్పనలు ఉండవచ్చు. అసలైన పత్రాన్ని దాని స్థానిక భాషలోని సంస్కరణను అధికారిక మూలంగా పరిగణించాలి. ముఖ్యమైన సమాచారానికి, ప్రొఫెషనల్ మానవ అనువాదాన్ని ఎంపిక చేయడం శిఫార్సు చేయబడుతుంది. ఈ అనువాదం ఉపయోగం వల్ల ఏర్పడిన ఏవైనా అపర్థాలు లేదా తప్పుడు అర్థాల కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->