# Maabara ya Warsha ya AI: Kufanya Suluhisho Zako za AI Ziwe Zinazoweza Kupangwa kwa AZD

**Uongozaji wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 2 - Maendeleo ya Kwanza ya AI
- **⬅️ Iliyopita**: [Uwekaji wa Mfano wa AI](ai-model-deployment.md)
- **➡️ Ifuatayo**: [Mbinu Bora za AI kwa Uzalishaji](production-ai-practices.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

## Muhtasari wa Warsha

Maabara hii ya vitendo inaelekeza waendelezaji kupitia mchakato wa kuchukua templeti ya AI iliyopo na kuipeleka kwa kutumia Azure Developer CLI (AZD). Utajifunza mifumo muhimu kwa ajili ya utoaji wa AI wa uzalishaji ukitumia huduma za Microsoft Foundry.

> **Kumbusho la uthibitisho (2026-03-25):** Warsha hii ilikaguliwa dhidi ya `azd` `1.23.12`. Ikiwa usakinishaji wako wa ndani ni wa zamani zaidi, sasisha AZD kabla ya kuanza ili uthibitisho, templeti, na mtiririko wa utoaji ulingane na hatua zilizo hapa chini.

**Muda:** 2-3 saa  
**Kiwango:** Wastani  
**Masharti ya awali:** Ujuzi wa msingi wa Azure, ufahamu wa dhana za AI/ML

## 🎓 Malengo ya Kujifunza

By the end of this workshop, you will be able to:
- ✅ Badili programu ya AI iliyopo ili itumie templeti za AZD
- ✅ Sanidi huduma za Microsoft Foundry kwa AZD
- ✅ Tekeleza usimamizi salama wa vibali kwa huduma za AI
- ✅ Weka katika uzalishaji programu za AI zilio tayari kwa uzalishaji zenye ufuatiliaji
- ✅ Tatua matatizo ya kawaida ya utoaji wa AI

## Mahitaji ya awali

### Zana Zinazohitajika
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) imewekwa
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) imewekwa
- [Git](https://git-scm.com/) imewekwa
- Mhariri wa msimbo (VS Code inashauriwa)

### Rasilimali za Azure
- Usajili wa Azure lenye ruhusa za mchangiaji
- Ufikiaji wa huduma za Microsoft Foundry Models (au uwezo wa kuomba ufikiaji)
- Ruhusa za kuunda kundi la rasilimali

### Ujuzi Unaohitajika
- Ufahamu wa msingi wa huduma za Azure
- Uzoefu wa kutumia interface za laini ya amri
- Dhana za msingi za AI/ML (APIs, modeli, prompts)

## Usanidi wa Maabara

### Hatua 1: Maandalizi ya Mazingira

1. **Hakikisha zana zimesakinishwa:**
```bash
# Angalia usakinishaji wa AZD
azd version

# Angalia Azure CLI
az --version

# Ingia kwenye Azure kwa mitiririko ya AZD
azd auth login

# Ingia kwenye Azure CLI tu ikiwa unapanga kuendesha amri za az wakati wa uchunguzi
az login
```

If you work across multiple tenants or your subscription is not detected automatically, retry with `azd auth login --tenant-id <tenant-id>`.

2. **Klonisha hazina ya warsha:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moduli 1: Kuelewa Muundo wa AZD kwa Programu za AI

### Muundo wa Templeti ya AZD kwa AI

Chunguza faili kuu katika templeti ya AZD iliyotayarishwa kwa AI:

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

### **Zoezi la Maabara 1.1: Chunguza Mipangilio**

1. **Kagua faili azure.yaml:**
```bash
cat azure.yaml
```

**Unachotafuta:**
- Maelezo ya huduma za vipengele vya AI
- Ramani za vigezo vya mazingira
- Mipangilio ya mwenyeji

2. **Pitia miundombinu ya main.bicep:**
```bash
cat infra/main.bicep
```

**Mifumo muhimu ya AI ya kutambua:**
- Utayarishaji wa huduma za Microsoft Foundry Models
- Ushirikiano na Azure AI Search
- Usimamizi salama wa funguo
- Mipangilio ya usalama wa mtandao

### **Mada ya Mazungumzo:** Kwa Nini Mifumo Hii Inafaa kwa AI

- **Utegemezi wa Huduma**: Programu za AI mara nyingi zinahitaji huduma nyingi zinazoratibiwa
- **Usalama**: Funguo za API na endpoints zinahitaji usimamizi salama
- **Uwezo wa Kupanuka**: Mzigo wa kazi wa AI una mahitaji ya kipekee ya kupanuka
- **Usimamizi wa Gharama**: Huduma za AI zinaweza kuwa ghali ikiwa hazijasanidiwa vizuri

## Moduli 2: Weka Programu Yako ya Kwanza ya AI

### Hatua 2.1: Anzisha Mazingira

1. **Unda mazingira mapya ya AZD:**
```bash
azd env new myai-workshop
```

2. **Weka vigezo vinavyohitajika:**
```bash
# Weka eneo la Azure unalopendeleo
azd env set AZURE_LOCATION eastus

# Hiari: Weka mfano maalum wa OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Hatua 2.2: Toa Miundombinu na Programu

1. **Weka kwa kutumia AZD:**
```bash
azd up
```

**Nini kinatokea wakati wa `azd up`:**
- ✅ Hutayarisha huduma ya Microsoft Foundry Models
- ✅ Huunda huduma ya Azure AI Search
- ✅ Inaweka App Service kwa programu ya wavuti
- ✅ Inasanidi mtandao na usalama
- ✅ Inaweka msimbo wa programu
- ✅ Inaanzisha ufuatiliaji na uandishi wa kumbukumbu

2. **Fuata maendeleo ya utoaji** na kumbuka rasilimali zinazoundwa.

### Hatua 2.3: Thibitisha Utoaji Wako

1. **Kagua rasilimali zilizowekwa:**
```bash
azd show
```

2. **Fungua programu iliyotolewa:**
```bash
azd show
```

Fungua endpoint ya wavuti iliyoonyeshwa katika matokeo ya `azd show`.

3. **Jaribu utendakazi wa AI:**
   - Nenda kwenye programu ya wavuti
   - Jaribu maswali ya mfano
   - Thibitisha majibu ya AI yanafanya kazi

### **Zoezi la Maabara 2.1: Mazoezi ya Utatuzi wa Matatizo**

**Senario**: Utoaji wako ulifanikiwa lakini AI haijatuma majibu.

**Matatizo ya kawaida ya kuangalia:**
1. **Funguo za API za OpenAI**: Hakikisha zimesetwa kwa usahihi
2. **Upatikanaji wa modeli**: Angalia ikiwa kanda yako inaunga mkono modeli
3. **Muunganisho wa mtandao**: Hakikisha huduma zinaweza kuwasiliana
4. **Ruhusa za RBAC**: Thibitisha programu inaweza kufikia OpenAI

**Amri za kutatua hitilafu:**
```bash
# Angalia vigezo vya mazingira
azd env get-values

# Tazama kumbukumbu za uenezaji
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Angalia hali ya uenezaji wa OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moduli 3: Kubinafsisha Programu za AI kwa Mahitaji Yako

### Hatua 3.1: Badilisha Mipangilio ya AI

1. **Sasisha modeli ya OpenAI:**
```bash
# Badilisha kwa mfano tofauti (ikiwa inapatikana katika eneo lako)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Sambaza tena kwa usanidi mpya
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

### Hatua 3.2: Mipangilio Maalumu kwa Mazingira

**Mbinu Bora**: Mipangilio tofauti kwa ajili ya maendeleo dhidi ya uzalishaji.

1. **Unda mazingira ya uzalishaji:**
```bash
azd env new myai-production
```

2. **Weka vigezo maalum vya uzalishaji:**
```bash
# Uzalishaji kwa kawaida hutumia SKU za kiwango cha juu
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Wezesha vipengele vya usalama vya ziada
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Zoezi la Maabara 3.1: Uboreshaji wa Gharama**

**Changamoto**: Sanidi templeti kwa maendeleo ya gharama nafuu.

**Majukumu:**
1. Tambua SKU ambazo zinaweza kuwekwa kwenye ngazi za bure/za msingi
2. Sanidi vigezo vya mazingira kwa gharama ndogo
3. Weka na linganisha gharama na mipangilio ya uzalishaji

**Vidokezo vya suluhisho:**
- Tumia ngazi ya F0 (bure) kwa Azure AI Services inapowezekana
- Tumia ngazi ya Basic kwa Search Service wakati wa maendeleo
- Fikiria kutumia mpango wa Consumption kwa Functions

## Moduli 4: Usalama na Mbinu Bora za Uzalishaji

### Hatua 4.1: Usimamizi Salama wa Vibali

**Changamoto ya sasa**: Programu nyingi za AI zinaweka funguo za API moja kwa moja kwenye msimbo au kutumia hifadhidata zisizo salama.

**Suluhisho la AZD**: Muunganiko wa Managed Identity + Key Vault.

1. **Pitia usanidi wa usalama katika templeti yako:**
```bash
# Tafuta usanidi wa Key Vault na Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Thibitisha Managed Identity inafanya kazi:**
```bash
# Kagua kama programu ya wavuti ina usanidi wa utambulisho sahihi
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Hatua 4.2: Usalama wa Mtandao

1. **Washa private endpoints** (ikiwa bado hazijasanidiwa):

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

### Hatua 4.3: Ufuatiliaji na Uwezo wa Kuonekana

1. **Sanidi Application Insights:**
```bash
# Application Insights inapaswa kusanidiwa kiotomatiki
# Angalia usanidi:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Anzisha ufuatiliaji maalumu kwa AI:**

Ongeza vipimo maalumu kwa operesheni za AI:
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

**Kazi**: Pitia utoaji wako kwa mbinu bora za usalama.

**Orodha ya ukaguzi:**
- [ ] Hakuna siri zilizowekwa moja kwa moja katika msimbo au usanidi
- [ ] Managed Identity imetumika kwa uthibitishaji kati ya huduma
- [ ] Key Vault inahifadhi usanidi wenye siri
- [ ] Ufikiaji wa mtandao umezuiliwa ipasavyo
- [ ] Ufuatiliaji na uandishi wa kumbukumbu vimewezeshwa

## Moduli 5: Kubadilisha Programu Yako Binafsi ya AI

### Hatua 5.1: Karatasi ya Tathmini

**Kabla ya kubadilisha programu yako**, jibu maswali haya:

1. **Miundo ya Programu:**
   - Huduma gani za AI programu yako inazitumia?
   - Rasilimali za kompyuta gani inazohitaji?
   - Je, inahitaji hifadhidata?
   - Ni utegemezi gani kati ya huduma?

2. **Mahitaji ya Usalama:**
   - Ni data nyeti gani programu yako inashughulikia?
   - Una mahitaji gani ya uzingatiaji (compliance)?
   - Je, unahitaji mtandao wa kibinafsi?

3. **Mahitaji ya Kupanuka:**
   - Ni mzigo gani unaotarajiwa?
   - Je, unahitaji auto-scaling?
   - Je, kuna mahitaji ya kikanda?

### Hatua 5.2: Unda Templeti Yako ya AZD

**Fuata muundo huu kubadilisha programu yako:**

1. **Unda muundo wa msingi:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Anzisha kiolezo cha AZD
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

**Changamoto**: Tengeneza templeti ya AZD kwa programu ya AI ya usindikaji wa nyaraka.

**Mahitaji:**
- Microsoft Foundry Models kwa uchambuzi wa yaliyomo
- Document Intelligence kwa OCR
- Akaunti ya Uhifadhi kwa upakiaji wa nyaraka
- Function App kwa mantiki ya usindikaji
- Programu ya wavuti kwa kiolesura cha mtumiaji

**Pointi za ziada:**
- Ongeza utambuzi sahihi wa makosa
- Jumuisha makadirio ya gharama
- Anzisha dashboards za ufuatiliaji

## Moduli 6: Kutatua Matatizo ya Kawaida

### Matatizo ya Kawaida ya Utoaji

#### Tatizo 1: Kiwango cha huduma za OpenAI kimezidiwa
**Dalili:** Utoaji unashindwa kwa kosa la kiwango
**Suluhisho:**
```bash
# Angalia mipaka ya sasa
az cognitiveservices usage list --location eastus

# Omba ongezeko la mipaka au jaribu mkoa mwingine
azd env set AZURE_LOCATION westus2
azd up
```

#### Tatizo 2: Modeli Haipatikani Kwenye Kanda
**Dalili:** Majibu ya AI yanashindwa au kuna makosa ya utoaji wa modeli
**Suluhisho:**
```bash
# Angalia upatikanaji wa modeli kwa kanda
az cognitiveservices model list --location eastus

# Sasisha hadi modeli inayopatikana
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Tatizo 3: Masuala ya Ruhusa
**Dalili:** Makosa ya 403 Forbidden wakati wa kuita huduma za AI
**Suluhisho:**
```bash
# Kagua uteuzi wa majukumu
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Ongeza majukumu yaliyokosekana
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Masuala ya Utendaji

#### Tatizo 4: Majibu ya AI ya polepole
**Hatua za uchunguzi:**
1. Angalia Application Insights kwa vipimo vya utendaji
2. Pitia vipimo vya huduma ya OpenAI kwenye portal ya Azure
3. Thibitisha muunganisho wa mtandao na ucheleweshaji (latency)

**Suluhisho:**
- Tekeleza caching kwa maswali ya kawaida
- Tumia modeli ya OpenAI inayofaa kwa matumizi yako
- Fikiria kutumia nakala za kusoma (read replicas) kwa senario zenye mzigo mkubwa

### **Zoezi la Maabara 6.1: Changamoto ya utatuzi wa kasoro**

**Senario**: Utoaji wako ulifanikiwa, lakini programu inarudisha makosa 500.

**Kazi za kutatua hitilafu:**
1. Angalia kumbukumbu za programu
2. Thibitisha muunganisho wa huduma
3. Jaribu uthibitishaji
4. Pitia usanidi

**Zana za kutumia:**
- `azd show` kwa muhtasari wa utoaji
- Portal ya Azure kwa kumbukumbu za huduma zenye maelezo
- Application Insights kwa telemetry ya programu

## Moduli 7: Ufuatiliaji na Uboreshaji

### Hatua 7.1: Anzisha Ufuatiliaji Kamili

1. **Tengeneza dashboards maalumu:**

Nenda kwenye portal ya Azure na tengeneza dashboard yenye:
- Idadi ya ombi za OpenAI na ucheleweshaji
- Viwango vya makosa ya programu
- Matumizi ya rasilimali
- Ufuatiliaji wa gharama

2. **Sanidi arifa:**
```bash
# Onyo la kiwango cha juu cha makosa
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Hatua 7.2: Uboreshaji wa Gharama

1. **Chambua gharama za sasa:**
```bash
# Tumia Azure CLI kupata data ya gharama
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Tekeleza udhibiti wa gharama:**
- Sanidi arifa za bajeti
- Tumia sera za autoscaling
- Tekeleza caching ya maombi
- Fuatilia matumizi ya tokeni kwa OpenAI

### **Zoezi la Maabara 7.1: Uboreshaji wa Utendaji**

**Kazi**: Boresha programu yako ya AI kwa utendaji na gharama.

**Vipimo vya kuboresha:**
- Punguza muda wa wastani wa majibu kwa 20%
- Punguza gharama za kila mwezi kwa 15%
- Dumu uptime ya 99.9%

**Mikakati ya kujaribu:**
- Tekeleza caching ya majibu
- Boresha prompts kwa ufanisi wa tokeni
- Tumia SKU za kompyuta zinazofaa
- Sanidi autoscaling ipasavyo

## Changamoto ya Mwisho: Utekelezaji Kamili

### Senario la Changamoto

Umepewa jukumu la kuunda chatbot ya huduma kwa wateja yenye nguvu ya AI, tayari kwa uzalishaji ikiwa na mahitaji haya:

**Mahitaji ya Kazi:**
- Kiolesura cha wavuti kwa mwingiliano na wateja
- Uunganisho na Microsoft Foundry Models kwa ajili ya majibu
- Uwezo wa kutafuta nyaraka kwa kutumia Azure AI Search
- Uunganisho na hifadhidata ya wateja iliyopo
- Msaada wa lugha nyingi

**Mahitaji Yasiyo ya Kazi:**
- Shughulikia watumiaji 1000 kwa wakati mmoja
- SLA ya upatikanaji wa 99.9%
- Uzingatiaji wa SOC 2
- Gharama chini ya $500/mwezi
- Weka kwenye mazingira mengi (dev, staging, prod)

### Hatua za Utekelezaji

1. Buni usanifu
2. Unda templeti ya AZD
3. Tekeleza hatua za usalama
4. Anzisha ufuatiliaji na utoaji wa arifa
5. Tengeneza mistari ya utoaji (deployment pipelines)
6. Tengeneza nyaraka za suluhisho

### Vigezo vya Tathmini

- ✅ **Utendakazi**: Je, inakidhi mahitaji yote?
- ✅ **Usalama**: Je, mbinu bora zimewekwa?
- ✅ **Uwezo wa Kupanuka**: Je, inaweza kushughulikia mzigo?
- ✅ **Urahisi wa Kudumisha**: Je, msimbo na miundombinu vimepangwa vizuri?
- ✅ **Gharama**: Je, inabaki ndani ya bajeti?

## Rasilimali Zaidi

### Nyaraka za Microsoft
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Nyaraka za Huduma za Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Nyaraka za Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Templeti Za Mifano
- [Programu ya Chat ya Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Rasilimali za Jamii
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Cheti cha Kukamilisha

Hongera! Umehitimisha Maabara ya Warsha ya AI. Sasa unapaswa kuwa unaweza:

- ✅ Geuza programu za AI zilizopo kuwa templeti za AZD
- ✅ Endesha programu za AI zilizo tayari kwa uzalishaji
- ✅ Tekeleza praktiki bora za usalama kwa mizigo ya kazi ya AI
- ✅ Fuatilia na boresha utendaji wa programu za AI
- ✅ Tatua matatizo ya kawaida ya uzinduzi

### Hatua Zifuatazo
1. Tumia mifano hii kwenye miradi yako ya AI
2. Changia templeti kwenye jamii
3. Jiunge na Microsoft Foundry Discord kwa msaada endelevu
4. Chunguza mada za juu kama vile uenezaji katika maeneo mengi

---

**Maoni ya Warsha**: Tusaidie kuboresha warsha hii kwa kushiriki uzoefu wako kwenye [Microsoft Foundry Discord chaneli ya #Azure](https://discord.gg/microsoft-azure).

---

**Uendeshaji wa Sura:**
- **📚 Nyumbani ya Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 2 - Maendeleo ya AI-Kwanza
- **⬅️ Iliyotangulia**: [Utoaji wa Modeli ya AI](ai-model-deployment.md)
- **➡️ Inayofuata**: [Miongozo Bora ya AI kwa Uzalishaji](production-ai-practices.md)
- **🚀 Sura Inayofuata**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

**Unahitaji Msaada?** Jiunge na jamii yetu kwa msaada na mijadala kuhusu AZD na uenezaji wa AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->