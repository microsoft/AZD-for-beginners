# Warsha ya AI Lab: Kufanya Suluhisho Zako za AI Ziwe Zinazoweza Kuitishwa na AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD Kwa Waanzaji](../../README.md)
- **📖 Current Chapter**: Sura 2 - Maendeleo ya Kwanza ya AI
- **⬅️ Previous**: [Uwekaji wa Mfano wa AI](ai-model-deployment.md)
- **➡️ Next**: [Mbinu Bora za AI kwa Uzalishaji](production-ai-practices.md)
- **🚀 Next Chapter**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

## Workshop Overview

Warsha hii ya vitendo inaelekeza waendelezaji kupitia mchakato wa kuchukua kiolezo cha AI kilicho tayari na kukiweka kwa kutumia Azure Developer CLI (AZD). Utajifunza mifumo muhimu kwa uanzishaji wa AI kwa uzalishaji kwa kutumia huduma za Microsoft Foundry.

**Duration:** Saa 2-3  
**Level:** Wastani  
**Prerequisites:** Ujuzi wa msingi wa Azure, uzoefu na dhana za AI/ML

## 🎓 Malengo ya Kujifunza

Mwisho wa warsha hii, utakuwa na uwezo wa:
- ✅ Kubadilisha programu ya AI iliyopo ili itumie templeti za AZD
- ✅ Kusanidi huduma za Microsoft Foundry kwa AZD
- ✅ Kutekeleza usimamizi wa siri kwa usalama kwa huduma za AI
- ✅ Kuweka programu za AI tayari kwa uzalishaji zikiwa na ufuatiliaji
- ✅ Kutatua matatizo ya kawaida ya uanzishaji wa AI

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) imewekwa
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) imewekwa
- [Git](https://git-scm.com/) imewekwa
- Mhariri wa nambari (VS Code inapendekezwa)

### Azure Resources
- Usajili wa Azure na ufikiaji wa mchango
- Ufikiaji wa huduma za Microsoft Foundry Models (au uwezo wa kuomba ufikiaji)
- Ruhusa za kuunda kundi la rasilimali

### Knowledge Prerequisites
- Uelewa wa msingi wa huduma za Azure
- Uzoefu wa kiolesura cha amri
- Dhana za msingi za AI/ML (APIs, mifano, prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Thibitisha usakinishaji wa zana:**
```bash
# Angalia usakinishaji wa AZD
azd version

# Angalia Azure CLI
az --version

# Ingia kwenye Azure
az login
azd auth login
```

2. **Nakili (clone) hifadhidata ya warsha:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

Chunguza faili muhimu katika kiolezo cha AZD kilicho tayari kwa AI:

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

### **Lab Exercise 1.1: Explore the Configuration**

1. **Chunguza faili azure.yaml:**
```bash
cat azure.yaml
```

**What to look for:**
- Ufafanuzi wa huduma kwa vipengele vya AI
- Ramani za vigezo vya mazingira (environment variables)
- Usanidi wa mwenyeji (host configurations)

2. **Kagua main.bicep ya miundombinu:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Ugawaji wa huduma ya Microsoft Foundry Models
- Uingizaji wa Cognitive Search
- Usimamizi salama wa funguo
- Usanidi wa usalama wa mtandao

### **Discussion Point:** Why These Patterns Matter for AI

- **Service Dependencies**: Programu za AI mara nyingi zinahitaji huduma nyingi zinazopangishwa
- **Security**: Funguo za API na maeneo ya mwisho yanahitaji usimamizi salama
- **Scalability**: Majukumu ya AI yana mahitaji maalum ya kupanuka
- **Cost Management**: Huduma za AI zinaweza kuwa ghali kama hazijasanidiwa vyema

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Unda mazingira mapya ya AZD:**
```bash
azd env new myai-workshop
```

2. **Weka vigezo vinavyohitajika:**
```bash
# Weka eneo la Azure unalopendelea
azd env set AZURE_LOCATION eastus

# Hiari: Weka modeli maalum ya OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Weka kwa AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Huandaa huduma ya Microsoft Foundry Models
- ✅ Huunda huduma ya Cognitive Search
- ✅ Inaweka App Service kwa programu ya wavuti
- ✅ Inasanidi mtandao na usalama
- ✅ Inapeleka msimbo wa programu
- ✅ Inaweka ufuatiliaji na uandishi wa kumbukumbu (logging)

2. **Tazama maendeleo ya uanzishaji** na kumbuka rasilimali zinazoanzishwa.

### Step 2.3: Verify Your Deployment

1. **Kagua rasilimali zilizowekwa:**
```bash
azd show
```

2. **Fungua programu iliyowekwa:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Jaribu utendakazi wa AI:**
   - Tembelea programu ya wavuti
   - Jaribu maswali ya mfano
   - Thibitisha majibu ya AI yanafanya kazi

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: Uwekaji wako ulifanikiwa lakini AI haijatii.

**Masuala ya kawaida ya kuangalia:**
1. **Funguo za API za OpenAI**: Thibitisha zimewekwa kwa usahihi
2. **Upatikanaji wa modeli**: Angalia kama eneo lako linaunga mkono modeli
3. **Muunganisho wa mtandao**: Hakikisha huduma zinaweza kuwasiliana
4. **Ruhusa za RBAC**: Thibitisha programu inaweza kufikia OpenAI

**Amri za kuandaa tatizo:**
```bash
# Angalia vigezo vya mazingira
azd env get-values

# Tazama kumbukumbu za uenezaji
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Angalia hali ya uenezaji ya OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Sasisha modeli ya OpenAI:**
```bash
# Badilisha kuwa mfano mwingine (ikiwa upo katika eneo lako)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Tekeleza tena kwa usanidi mpya
azd deploy
```

2. **Ongeza huduma za ziada za AI:**

Hariri `infra/main.bicep` ili kuongeza Document Intelligence:

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

**Best Practice**: Usanidi tofauti kwa maendeleo vs uzalishaji.

1. **Unda mazingira ya uzalishaji:**
```bash
azd env new myai-production
```

2. **Weka vigezo maalum vya uzalishaji:**
```bash
# Uzalishaji kawaida hutumia SKU za juu
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Washa vipengele vya ziada vya usalama
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Changamoto**: Sanidi kiolezo kwa maendeleo chenye gharama nafuu.

**Majukumu:**
1. Tambua SKUs ambazo zinaweza kuwekwa kwenye ngazi za bure/msingi
2. Sanidi vigezo vya mazingira kwa gharama ndogo
3. Weka na linganisha gharama na usanidi wa uzalishaji

**Vidokezo vya suluhisho:**
- Tumia ngazi F0 (bure) kwa Cognitive Services inapowezekana
- Tumia ngazi ya Msingi (Basic) kwa Search Service katika maendeleo
- Fikiria kutumia mpango wa Consumption kwa Functions

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: Programu nyingi za AI zinaweka funguo za API moja kwa moja au kutumia hifadhi isiyo salama.

**AZD Solution**: Utambulisho Ulisimamiwa (Managed Identity) + ujumuishaji wa Key Vault.

1. **Kagua usanidi wa usalama katika kiolezo chako:**
```bash
# Tafuta usanidi wa Key Vault na Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Thibitisha Managed Identity inafanya kazi:**
```bash
# Angalia ikiwa programu ya wavuti ina usanidi sahihi wa utambulisho
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Washa private endpoints** (ikiwa bado hazijasanidiwa):

Ongeza kwa kiolezo chako cha bicep:
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

1. **Sanidi Application Insights:**
```bash
# Application Insights inapaswa kusanidiwa kiotomatiki
# Angalia usanidi:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Weka ufuatiliaji maalum kwa AI:**

Ongeza metriksi maalum kwa shughuli za AI:
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

### **Lab Exercise 4.1: Security Audit**

**Kazi**: Kagua uanzishaji wako kwa mbinu bora za usalama.

**Orodha ya ukaguzi:**
- [ ] Hakuna siri zilizowekwa moja kwa moja katika msimbo au usanidi
- [ ] Managed Identity imetumika kwa uthibitishaji kati ya huduma
- [ ] Key Vault inahifadhi usanidi wenye nyeti
- [ ] Ufikiaji wa mtandao umetengwa ipasavyo
- [ ] Ufuatiliaji na uandishi wa kumbukumbu vimewezeshwa

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Kabla ya kubadilisha programu yako**, jibu maswali haya:

1. **Architecture ya Programu:**
   - Ni huduma gani za AI programu yako inazitumia?
   - Inahitaji rasilimali gani za kompyuta?
   - Je, inahitaji hifadhidata?
   - Ni utegemezaji upi kati ya huduma?

2. **Mahitaji ya Usalama:**
   - Ni data nyeti gani programu yako inashughulikia?
   - Je, una mahitaji ya uzingatiaji (compliance)?
   - Je, unahitaji mtandao wa kibinafsi?

3. **Mahitaji ya Kupanuka:**
   - Ni mzigo gani unaotarajiwa?
   - Je, unahitaji auto-scaling?
   - Je, kuna mahitaji ya kikanda?

### Step 5.2: Create Your AZD Template

**Fuata muundo huu kubadilisha programu yako:**

1. **Unda muundo wa msingi:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **Unda azure.yaml:**
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

3. **Unda templeti za miundombinu:**

**infra/main.bicep** - Kiolezo kuu:
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

**infra/modules/openai.bicep** - Moduli ya OpenAI:
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

### **Lab Exercise 5.1: Template Creation Challenge**

**Changamoto**: Tengeneza kiolezo cha AZD kwa programu ya AI ya usindikaji wa hati.

**Mahitaji:**
- Microsoft Foundry Models kwa uchambuzi wa maudhui
- Document Intelligence kwa OCR
- Akaunti ya Hifadhi kwa upakiaji wa hati
- Function App kwa mantiki ya usindikaji
- App ya wavuti kwa kiolesura cha mtumiaji

**Pointi za ziada:**
- Ongeza utawala wa makosa (error handling) unaofaa
- Jumuisha makadirio ya gharama
- Sanidi dashibodi za ufuatiliaji

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** Uwekaji unashindwa kwa kosa la quota
**Solutions:**
```bash
# Angalia mipaka ya sasa
az cognitiveservices usage list --location eastus

# Omba ongezeko la mipaka au jaribu mkoa tofauti
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** Majibu ya AI yanashindwa au uanzishaji wa modeli una makosa
**Solutions:**
```bash
# Angalia upatikanaji wa modeli kulingana na eneo
az cognitiveservices model list --location eastus

# Sasisha hadi modeli inayopatikana
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** Makosa 403 Forbidden wakati wa kuita huduma za AI
**Solutions:**
```bash
# Angalia ugawaji wa majukumu
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Ongeza majukumu yaliyokosekana
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Hatua za uchunguzi:**
1. Angalia Application Insights kwa metriksi za utendaji
2. Kagua metriksi za huduma ya OpenAI kwenye Azure portal
3. Thibitisha muunganisho wa mtandao na latency

**Suluhisho:**
- Tekeleza caching kwa maswali ya kawaida
- Tumia modeli sahihi ya OpenAI kwa matumizi yako
- Fikiria nakala za kusoma (read replicas) kwa mazingira yenye mzigo mkubwa

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: Uwekaji wako ulifanikiwa, lakini programu inarudisha makosa ya 500.

**Majukumu ya kutatua tatizo:**
1. Angalia kumbukumbu za programu
2. Thibitisha muunganisho wa huduma
3. Jaribu uthibitishaji
4. Kagua usanidi

**Vifaa vya kutumia:**
- `azd show` kwa muhtasari wa uanzishaji
- Azure portal kwa kumbukumbu za huduma kwa undani
- Application Insights kwa telemetry ya programu

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Tengeneza dashibodi maalum:**

Tembelea Azure portal na unda dashibodi yenye:
- Idadi ya maombi ya OpenAI na latency
- Viwango vya makosa ya programu
- Matumizi ya rasilimali
- Ufuatiliaji wa gharama

2. **Sanidi arifa:**
```bash
# Onyo kwa kiwango cha juu cha makosa
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **Chambua gharama za sasa:**
```bash
# Tumia Azure CLI kupata data ya gharama
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Tekeleza udhibiti wa gharama:**
- Sanidi arifa za bajeti
- Tumia sera za autoscaling
- Tekeleza caching ya maombi
- Fuata matumizi ya token kwa OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Kazi**: Boreshesha programu yako ya AI kwa utendaji na gharama.

**Metriksi za kuboresha:**
- Punguza wakati wa majibu kwa wastani kwa 20%
- Punguza gharama za kila mwezi kwa 15%
- Dumu 99.9% uptime

**Mikakati ya kujaribu:**
- Tekeleza caching ya majibu
- Boresha prompts kwa ufanisi wa tokeni
- Tumia SKUs za kompyuta zilizofaa
- Sanidi autoscaling vizuri

## Final Challenge: End-to-End Implementation

### Challenge Scenario

Umepewa jukumu la kuunda chatbot ya huduma kwa wateja yenye nguvu ya AI kwa uzalishaji yenye mahitaji haya:

**Mahitaji ya Kazi:**
- Kiolesura cha wavuti kwa mazungumzo ya wateja
- Uunganisho na Microsoft Foundry Models kwa majibu
- Uwezo wa utafutaji wa hati kwa kutumia Cognitive Search
- Uunganisho na hifadhidata ya wateja iliyopo
- Msaada wa lugha nyingi

**Mahitaji yasiyo ya Kazi:**
- Zishughulikie watumiaji 1000 kwa wakati mmoja
- 99.9% SLA ya uptime
- Uzingatiaji wa SOC 2
- Gharama chini ya $500/mwezi
- Weka kwa mazingira mengi (dev, staging, prod)

### Implementation Steps

1. **Tengeneza usanifu**
2. **Unda kiolezo cha AZD**
3. **Tekeleza hatua za usalama**
4. **Sanidi ufuatiliaji na arifa**
5. **Tengeneza mitiririko ya uanzishaji (deployment pipelines)**
6. **Andika nyaraka za suluhisho**

### Evaluation Criteria

- ✅ **Functionality**: Je, inakidhi mahitaji yote?
- ✅ **Security**: Je, mbinu bora zimetekelezwa?
- ✅ **Scalability**: Inaweza kushughulikia mzigo?
- ✅ **Maintainability**: Je, msimbo na miundombinu imepangwa vizuri?
- ✅ **Cost**: Je, inabaki ndani ya bajeti?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate

Hongera! Umekamilisha Warsha ya AI Lab. Sasa unapaswa kuwa na uwezo wa:
- ✅ Badilisha programu za AI zilizopo kuwa templeti za AZD
- ✅ Sambaza programu za AI tayari kwa uzalishaji
- ✅ Tekeleza mbinu bora za usalama kwa mzigo wa kazi za AI
- ✅ Fuatilia na boresha utendaji wa programu za AI
- ✅ Tatua matatizo ya kawaida ya uwekaji

### Hatua Zifuatazo
1. Tumia mifumo hii kwenye miradi yako ya AI
2. Changia templeti kwa jamii
3. Jiunge na Microsoft Foundry Discord kwa msaada unaoendelea
4. Chunguza mada za juu kama uwekaji katika mikoa mingi

---

**Maoni ya Warsha**: Tusaidie kuboresha warsha hii kwa kushiriki uzoefu wako katika the [chaneli ya Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD Kwa Waanzaji](../../README.md)
- **📖 Current Chapter**: Sura 2 - Uendelezaji wa AI wa Kwanza
- **⬅️ Previous**: [Uwekaji wa Modeli za AI](ai-model-deployment.md)
- **➡️ Next**: [Mazoea Bora ya AI kwa Uzalishaji](production-ai-practices.md)
- **🚀 Next Chapter**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

**Unahitaji Msaada?** Jiunge na jamii yetu kwa msaada na mijadala kuhusu AZD na uwekaji wa AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Nyaraka hii imefasirishwa kwa kutumia huduma ya utafsiri wa AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuwa sahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka ya asili katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu iliyotolewa na mtafsiri wa kibinadamu inashauriwa. Hatutawajibika kwa kutoelewana au tafsiri potofu zitakazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->