<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "668bc93b35c9249e52245a0b037b6011",
  "translation_date": "2025-09-12T23:00:08+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "sw"
}
-->
# AI Workshop Lab: Kufanya Suluhisho Zako za AI Ziweze Kupelekwa kwa AZD

**Iliyopita:** [Upelekaji wa Modeli ya AI](ai-model-deployment.md) | **Inayofuata:** [Mbinu za AI za Uzalishaji](production-ai-practices.md)

## Muhtasari wa Warsha

Warsha hii ya vitendo inawaongoza watengenezaji kupitia mchakato wa kuchukua programu ya AI iliyopo na kuifanya iweze kupelekwa kwa kutumia Azure Developer CLI (AZD). Utajifunza mifumo muhimu kwa upelekaji wa AI wa uzalishaji kwa kutumia huduma za Azure AI Foundry.

**Muda:** Saa 2-3  
**Kiwango:** Kati  
**Mahitaji ya awali:** Maarifa ya msingi ya Azure, ufahamu wa dhana za AI/ML

## 🎓 Malengo ya Kujifunza

Mwisho wa warsha hii, utaweza:
- ✅ Kubadilisha programu ya AI iliyopo ili kutumia templeti za AZD
- ✅ Kuseti huduma za Azure AI Foundry kwa AZD
- ✅ Kutekeleza usimamizi salama wa hati za huduma za AI
- ✅ Kuweka programu za AI tayari kwa uzalishaji na ufuatiliaji
- ✅ Kutatua changamoto za kawaida za upelekaji wa AI

## Mahitaji ya Awali

### Zana Zinazohitajika
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) imewekwa
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) imewekwa
- [Git](https://git-scm.com/) imewekwa
- Hariri ya msimbo (VS Code inapendekezwa)

### Rasilimali za Azure
- Usajili wa Azure wenye ruhusa ya mchangiaji
- Ufikiaji wa huduma za Azure OpenAI (au uwezo wa kuomba ufikiaji)
- Ruhusa za kuunda kikundi cha rasilimali

### Maarifa ya Awali
- Ufahamu wa msingi wa huduma za Azure
- Uzoefu wa kutumia kiolesura cha mstari wa amri
- Dhana za msingi za AI/ML (API, modeli, maelekezo)

## Mpangilio wa Warsha

### Hatua ya 1: Maandalizi ya Mazingira

1. **Thibitisha usakinishaji wa zana:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Nakili hifadhi ya warsha:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moduli ya 1: Kuelewa Muundo wa AZD kwa Programu za AI

### Muundo wa Templeti ya AZD Tayari kwa AI

Chunguza faili muhimu katika templeti ya AZD inayofaa kwa AI:

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

### **Zoezi la Maabara 1.1: Chunguza Usanidi**

1. **Kagua faili ya azure.yaml:**
```bash
cat azure.yaml
```

**Mambo ya kuangalia:**
- Ufafanuzi wa huduma kwa vipengele vya AI
- Ramani za vigezo vya mazingira
- Usanidi wa mwenyeji

2. **Kagua miundombinu ya main.bicep:**
```bash
cat infra/main.bicep
```

**Mifumo muhimu ya AI ya kutambua:**
- Utoaji wa huduma za Azure OpenAI
- Ujumuishaji wa Cognitive Search
- Usimamizi salama wa funguo
- Usanidi wa usalama wa mtandao

### **Hoja ya Majadiliano:** Kwa Nini Mifumo Hii Ni Muhimu kwa AI

- **Utegemezi wa Huduma**: Programu za AI mara nyingi zinahitaji huduma nyingi zinazoratibiwa
- **Usalama**: Funguo za API na viunganishi vinahitaji usimamizi salama
- **Uwezo wa Kupanuka**: Mizigo ya AI ina mahitaji ya kipekee ya kupanuka
- **Usimamizi wa Gharama**: Huduma za AI zinaweza kuwa ghali ikiwa hazijasetiwa vizuri

## Moduli ya 2: Peleka Programu Yako ya Kwanza ya AI

### Hatua ya 2.1: Anzisha Mazingira

1. **Unda mazingira mapya ya AZD:**
```bash
azd env new myai-workshop
```

2. **Weka vigezo vinavyohitajika:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Hatua ya 2.2: Peleka Miundombinu na Programu

1. **Peleka kwa AZD:**
```bash
azd up
```

**Kinachotokea wakati wa `azd up`:**
- ✅ Inatoa huduma ya Azure OpenAI
- ✅ Inaunda huduma ya Cognitive Search
- ✅ Inaseti App Service kwa programu ya wavuti
- ✅ Inaseti mtandao na usalama
- ✅ Inapeleka msimbo wa programu
- ✅ Inaseti ufuatiliaji na kumbukumbu

2. **Fuatilia maendeleo ya upelekaji** na angalia rasilimali zinazoundwa.

### Hatua ya 2.3: Thibitisha Upelekaji Wako

1. **Angalia rasilimali zilizopelekwa:**
```bash
azd show
```

2. **Fungua programu iliyopelekwa:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Jaribu utendaji wa AI:**
   - Tembelea programu ya wavuti
   - Jaribu maswali ya mfano
   - Thibitisha majibu ya AI yanavyofanya kazi

### **Zoezi la Maabara 2.1: Mazoezi ya Kutatua Changamoto**

**Hali:** Upelekaji wako umefanikiwa lakini AI haijibu.

**Masuala ya kawaida ya kuangalia:**
1. **Funguo za API za OpenAI**: Thibitisha zimewekwa vizuri
2. **Upatikanaji wa modeli**: Angalia ikiwa eneo lako linaunga mkono modeli
3. **Muunganisho wa mtandao**: Hakikisha huduma zinaweza kuwasiliana
4. **Ruhusa za RBAC**: Thibitisha programu inaweza kufikia OpenAI

**Amri za kutatua changamoto:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moduli ya 3: Kubinafsisha Programu za AI kwa Mahitaji Yako

### Hatua ya 3.1: Badilisha Usanidi wa AI

1. **Sasisha modeli ya OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
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

### Hatua ya 3.2: Usanidi Maalum wa Mazingira

**Mbinu Bora**: Usanidi tofauti kwa maendeleo dhidi ya uzalishaji.

1. **Unda mazingira ya uzalishaji:**
```bash
azd env new myai-production
```

2. **Weka vigezo maalum vya uzalishaji:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Zoezi la Maabara 3.1: Uboreshaji wa Gharama**

**Changamoto**: Sakinisha templeti kwa maendeleo ya gharama nafuu.

**Majukumu:**
1. Tambua ni SKUs zipi zinaweza kuwekwa kwa viwango vya bure/msingi
2. Sakinisha vigezo vya mazingira kwa gharama ndogo
3. Peleka na linganisha gharama na usanidi wa uzalishaji

**Vidokezo vya suluhisho:**
- Tumia kiwango cha F0 (bure) kwa Huduma za Utambuzi inapowezekana
- Tumia kiwango cha Msingi kwa Huduma ya Utafutaji katika maendeleo
- Fikiria kutumia mpango wa Matumizi kwa Functions

## Moduli ya 4: Usalama na Mbinu Bora za Uzalishaji

### Hatua ya 4.1: Usimamizi Salama wa Hati

**Changamoto ya sasa**: Programu nyingi za AI huweka funguo za API au hutumia hifadhi isiyo salama.

**Suluhisho la AZD**: Utambulisho Ulioendeshwa + Ujumuishaji wa Key Vault.

1. **Kagua usanidi wa usalama katika templeti yako:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Thibitisha Utambulisho Ulioendeshwa unafanya kazi:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Hatua ya 4.2: Usalama wa Mtandao

1. **Wezesha viunganishi vya kibinafsi** (ikiwa havijasetiwa tayari):

Ongeza kwenye templeti yako ya bicep:
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

### Hatua ya 4.3: Ufuatiliaji na Uangalizi

1. **Sakinisha Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Sakinisha ufuatiliaji maalum wa AI:**

Ongeza vipimo maalum kwa operesheni za AI:
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

### **Zoezi la Maabara 4.1: Ukaguzi wa Usalama**

**Kazi**: Kagua upelekaji wako kwa mbinu bora za usalama.

**Orodha ya ukaguzi:**
- [ ] Hakuna siri zilizowekwa moja kwa moja kwenye msimbo au usanidi
- [ ] Utambulisho Ulioendeshwa unatumika kwa uthibitishaji wa huduma kwa huduma
- [ ] Key Vault inahifadhi usanidi nyeti
- [ ] Ufikiaji wa mtandao umepunguzwa ipasavyo
- [ ] Ufuatiliaji na kumbukumbu vimewezeshwa

## Moduli ya 5: Kubadilisha Programu Yako ya AI

### Hatua ya 5.1: Karatasi ya Tathmini

**Kabla ya kubadilisha programu yako**, jibu maswali haya:

1. **Muundo wa Programu:**
   - Ni huduma gani za AI programu yako inatumia?
   - Inahitaji rasilimali gani za kompyuta?
   - Je, inahitaji hifadhidata?
   - Kuna utegemezi gani kati ya huduma?

2. **Mahitaji ya Usalama:**
   - Je, programu yako inashughulikia data nyeti gani?
   - Una mahitaji gani ya kufuata sheria?
   - Je, unahitaji mtandao wa kibinafsi?

3. **Mahitaji ya Kupanuka:**
   - Mizigo inayotarajiwa ni ipi?
   - Je, unahitaji upanuzi wa kiotomatiki?
   - Kuna mahitaji ya kieneo?

### Hatua ya 5.2: Unda Templeti Yako ya AZD

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

**infra/main.bicep** - Templeti kuu:
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

### **Zoezi la Maabara 5.1: Changamoto ya Uundaji wa Templeti**

**Changamoto**: Unda templeti ya AZD kwa programu ya AI ya usindikaji wa hati.

**Mahitaji:**
- Azure OpenAI kwa uchambuzi wa maudhui
- Document Intelligence kwa OCR
- Akaunti ya Hifadhi kwa upakiaji wa hati
- Function App kwa mantiki ya usindikaji
- Programu ya wavuti kwa kiolesura cha mtumiaji

**Pointi za ziada:**
- Ongeza usimamizi sahihi wa makosa
- Jumuisha makadirio ya gharama
- Sakinisha dashibodi za ufuatiliaji

## Moduli ya 6: Kutatua Changamoto za Kawaida

### Changamoto za Kawaida za Upelekaji

#### Changamoto 1: Kiwango cha Huduma ya OpenAI Kimezidi
**Dalili:** Upelekaji unashindwa na kosa la kiwango
**Suluhisho:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Changamoto 2: Modeli Haipatikani Katika Eneo
**Dalili:** Majibu ya AI yanashindwa au makosa ya upelekaji wa modeli
**Suluhisho:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Changamoto 3: Masuala ya Ruhusa
**Dalili:** Makosa ya 403 Forbidden wakati wa kupiga huduma za AI
**Suluhisho:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Changamoto za Utendaji

#### Changamoto 4: Majibu ya AI Polepole
**Hatua za uchunguzi:**
1. Angalia Application Insights kwa vipimo vya utendaji
2. Kagua vipimo vya huduma ya OpenAI katika portal ya Azure
3. Thibitisha muunganisho wa mtandao na ucheleweshaji

**Suluhisho:**
- Tekeleza uhifadhi wa maswali ya kawaida
- Tumia modeli sahihi ya OpenAI kwa matumizi yako
- Fikiria nakala za kusoma kwa hali ya mzigo mkubwa

### **Zoezi la Maabara 6.1: Changamoto ya Kutatua Changamoto**

**Hali:** Upelekaji wako umefanikiwa, lakini programu inarudisha makosa ya 500.

**Majukumu ya kutatua changamoto:**
1. Angalia kumbukumbu za programu
2. Thibitisha muunganisho wa huduma
3. Jaribu uthibitishaji
4. Kagua usanidi

**Zana za kutumia:**
- `azd show` kwa muhtasari wa upelekaji
- Portal ya Azure kwa kumbukumbu za kina za huduma
- Application Insights kwa telemetry ya programu

## Moduli ya 7: Ufuatiliaji na Uboreshaji

### Hatua ya 7.1: Sakinisha Ufuatiliaji Kamili

1. **Unda dashibodi maalum:**

Tembelea portal ya Azure na unda dashibodi yenye:
- Idadi ya maombi ya OpenAI na ucheleweshaji
- Viwango vya makosa ya programu
- Matumizi ya rasilimali
- Ufuatiliaji wa gharama

2. **Sakinisha arifa:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Hatua ya 7.2: Uboreshaji wa Gharama

1. **Changanua gharama za sasa:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Tekeleza udhibiti wa gharama:**
- Sakinisha arifa za bajeti
- Tumia sera za upanuzi wa kiotomatiki
- Tekeleza uhifadhi wa maombi
- Fuatilia matumizi ya tokeni kwa OpenAI

### **Zoezi la Maabara 7.1: Uboreshaji wa Utendaji**

**Kazi**: Boresha programu yako ya AI kwa utendaji na gharama.

**Vipimo vya kuboresha:**
- Punguza muda wa wastani wa majibu kwa 20%
- Punguza gharama za kila mwezi kwa 15%
- Dumisha uptime ya 99.9%

**Mikakati ya kujaribu:**
- Tekeleza uhifadhi wa majibu
- Boresha maelekezo kwa ufanisi wa tokeni
- Tumia SKUs sahihi za kompyuta
- Sakinisha upanuzi wa kiotomatiki ipasavyo

## Changamoto ya Mwisho: Utekelezaji wa Mwisho hadi Mwisho

### Hali ya Changamoto

Umepewa jukumu la kuunda chatbot ya huduma kwa wateja inayotumia AI tayari kwa uzalishaji yenye mahitaji haya:

**Mahitaji ya Kazi:**
- Kiolesura cha wavuti kwa mwingiliano wa wateja
- Ujumuishaji na Azure OpenAI kwa majibu
- Uwezo wa utafutaji wa hati kwa kutumia Cognitive Search
- Ujumuishaji na hifadhidata ya wateja iliyopo
- Usaidizi wa lugha nyingi

**Mahitaji Yasiyo ya Kazi:**
- Kushughulikia watumiaji 1000 kwa wakati mmoja
- SLA ya uptime ya 99.9%
- Ufuataji wa SOC 2
- Gharama chini ya $500/mwezi
- Upelekaji kwa mazingira mengi (maendeleo, majaribio, uzalishaji)

### Hatua za Utekelezaji

1. **Buni muundo wa usanifu**
2. **Unda templeti ya AZD**
3. **Tekeleza hatua za usalama**
4. **Sakinisha ufuatiliaji na arifa**
5. **Unda njia za upelekaji**
6. **Andika nyaraka za suluhisho**

### Vigezo vya Tathmini

- ✅ **Utendaji**: Je, inakidhi mahitaji yote?
- ✅ **Usalama**: Je, mbinu bora zimetekelezwa?
- ✅ **Uwezo wa Kupanuka**: Je, inaweza kushughulikia mzigo?
- ✅ **Uwezo wa Kudumisha**: Je, msimbo na miundombinu imepangwa vizuri?
- ✅ **Gharama**: Je, inabaki ndani ya bajeti?

## Rasilimali za Ziada

### Nyaraka za Microsoft
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Nyaraka za Huduma ya Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Nyaraka za Azure AI Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Templeti za Mfano
- [Programu ya Mazungumzo ya Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Mwongozo wa Haraka wa Programu ya Mazungumzo ya OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Mazungumzo ya Contoso](https://github.com/Azure-Samples/contoso-chat)

### Rasilimali za Jamii
- [Discord ya Azure AI Foundry](https://discord.gg/microsoft-azure)
- [GitHub ya Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Templeti za Ajabu za AZD](https://azure.github.io/awesome-azd/)

## 🎓 Cheti cha Kukamilisha

Hongera! Umehitimisha Warsha ya AI. Sasa unapaswa kuwa na uwezo wa:

- ✅ Kubadilisha programu za AI
- ✅ Tekeleza mbinu bora za usalama kwa mzigo wa kazi wa AI  
- ✅ Fuatilia na boresha utendaji wa programu za AI  
- ✅ Tatua changamoto za kawaida za usambazaji  

### Hatua Zifuatazo  
1. Tumia mifumo hii kwenye miradi yako ya AI  
2. Changia templeti kurudi kwa jamii  
3. Jiunge na Discord ya Azure AI Foundry kwa msaada unaoendelea  
4. Chunguza mada za juu kama usambazaji wa maeneo mengi  

---

**Maoni ya Warsha**: Tusaidie kuboresha warsha hii kwa kushiriki uzoefu wako katika [Azure AI Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).  

---

**Iliyopita:** [Usambazaji wa Modeli ya AI](ai-model-deployment.md) | **Inayofuata:** [Mbinu za AI za Uzalishaji](production-ai-practices.md)  

**Unahitaji Msaada?** Jiunge na jamii yetu kwa msaada na mijadala kuhusu AZD na usambazaji wa AI.  

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.