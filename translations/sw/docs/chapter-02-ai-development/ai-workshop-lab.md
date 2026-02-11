# Warsha ya Maabara ya AI: Kufanya Suluhisho Zako za AI Ziwe Zinazoweza Kupelekwa kwa AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Current Chapter**: Sura 2 - Maendeleo ya AI-Kwanza
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Muhtasari wa Warsha

Maabara hii ya vitendo inaongoza watengenezaji kupitia mchakato wa kuchukua kiolezo cha AI kilichopo na kukielekeza kwa kutumia Azure Developer CLI (AZD). Utajifunza mifumo muhimu kwa ajili ya utekelezaji wa AI wa uzalishaji kwa kutumia huduma za Microsoft Foundry.

**Muda:** 2-3 hours  
**Kiwango:** Kati  
**Masharti ya awali:** Uelewa msingi wa Azure, ufahamu wa dhana za AI/ML

## 🎓 Malengo ya Kujifunza

Mwisho wa warsha hii, utaweza:
- ✅ Kubadilisha programu ya AI iliyopo ili itumie templeti za AZD
- ✅ Kusanidi huduma za Microsoft Foundry kwa AZD
- ✅ Kutekeleza usimamizi salama wa vibali kwa huduma za AI
- ✅ Kuweka programu za AI zikiwa tayari kwa uzalishaji pamoja na ufuatiliaji
- ✅ Kutatua matatizo ya kawaida ya ueneaji wa AI

## Masharti ya awali

### Zana Zinazohitajika
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installed
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installed
- [Git](https://git-scm.com/) installed
- Mhariri wa msimbo (VS Code inapendekezwa)

### Rasilimali za Azure
- Usajili wa Azure mwenye ruhusa ya contributor
- Ufikiaji wa huduma za Azure OpenAI (au uwezo wa kuomba ufikiaji)
- Ruhusa za kuunda resource group

### Ujuzi wa Awali
- Uelewa wa msingi wa huduma za Azure
- Uzoefu na interfaces za laini ya amri
- Dhana za msingi za AI/ML (APIs, modeli, prompts)

## Kusanidi Maabara

### Hatua 1: Maandalizi ya Mazingira

1. **Thibitisha usakinishaji wa zana:**
```bash
# Kagua usakinishaji wa AZD
azd version

# Kagua CLI ya Azure
az --version

# Ingia kwenye Azure
az login
azd auth login
```

2. **Clone hazina ya warsha:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moduli 1: Kuelewa Muundo wa AZD kwa Programu za AI

### Muundo wa kiolezo cha AZD tayari kwa AI

Chunguza mafaili muhimu katika kiolezo cha AZD kilicho tayari kwa AI:

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

### **Zoefrsha la Maabara 1.1: Chunguza Mipangilio**

1. **Chunguza faili azure.yaml:**
```bash
cat azure.yaml
```

**Mambo ya kuangalia:**
- Ufafanuzi wa huduma kwa vipengele vya AI
- Ramani za vigezo vya mazingira (environment variables)
- Mipangilio ya mwenyeji (host configurations)

2. **Pitia miundombinu ya main.bicep:**
```bash
cat infra/main.bicep
```

**Mifumo muhimu ya AI ya kutambua:**
- Utoaji wa huduma ya Azure OpenAI
- Uunganishaji wa Cognitive Search
- Usimamizi salama wa funguo
- Mipangilio ya usalama wa mtandao

### **Hoja ya Majadiliano:** Kwa Nini Mifumo Hii Ni Muhimu kwa AI

- **Utegenezaji wa Huduma**: Programu za AI mara nyingi zinahitaji huduma nyingi zenye ushirikiano
- **Usalama**: API keys na endpoints zinahitaji usimamizi salama
- **Uwezo wa Kupanuka**: Mizigo ya kazi ya AI ina mahitaji maalum ya kupanuka
- **Usimamizi wa Gharama**: Huduma za AI zinaweza kuwa ghali kama hazijasetwa ipasavyo

## Moduli 2: Weka Programu Yako ya AI ya Kwanza

### Hatua 2.1: Anzisha Mazingira

1. **Unda mazingira mapya ya AZD:**
```bash
azd env new myai-workshop
```

2. **Weka vigezo vinavyohitajika:**
```bash
# Weka eneo la Azure unalopendelea
azd env set AZURE_LOCATION eastus

# Hiari: Weka mfano maalum wa OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Hatua 2.2: Weka Miundombinu na Programu

1. **Weka kwa AZD:**
```bash
azd up
```

**Nini kinatokea wakati wa `azd up`:**
- ✅ Inatoa huduma ya Azure OpenAI
- ✅ Inaunda huduma ya Cognitive Search
- ✅ Inaweka App Service kwa programu ya wavuti
- ✅ Inasanidi mtandao na usalama
- ✅ Inaweka msimbo wa programu
- ✅ Inaweka ufuatiliaji na uandishi wa kumbukumbu

2. **Fuatilia maendeleo ya utekelezaji** na kumbuka rasilimali zinazoanzishwa.

### Hatua 2.3: Thibitisha Utekelezaji Wako

1. **Kagua rasilimali zilizotekelezwa:**
```bash
azd show
```

2. **Fungua programu iliyotekelezwa:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Jaribu utendaji wa AI:**
   - Tembelea programu ya wavuti
   - Jaribu maswali ya mfano
   - Thibitisha majibu ya AI yanafanya kazi

### **Zoefrsha la Maabara 2.1: Mazoea ya Utatuzi wa Matatizo**

**Senario**: Utekelezaji wako ulifanikiwa lakini AI haijibu.

**Masuala ya kawaida ya kuchunguza:**
1. **OpenAI API keys**: Thibitisha zimewekwa kwa usahihi
2. **Upatikanaji wa modeli**: Angalia kama eneo lako linaunga mkono modeli
3. **Uunganishaji wa mtandao**: Hakikisha huduma zinaweza kuwasiliana
4. **Ruhusa za RBAC**: Thibitisha programu inaweza kufikia OpenAI

**Amri za kutatua matatizo:**
```bash
# Angalia vigezo vya mazingira
azd env get-values

# Tazama kumbukumbu za uanzishaji
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Angalia hali ya uanzishaji wa OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moduli 3: Kubadilisha Programu za AI kwa Mahitaji Yako

### Hatua 3.1: Badilisha Mipangilio ya AI

1. **Sasisha modeli ya OpenAI:**
```bash
# Badilisha kwa modeli tofauti (ikiwa inapatikana katika eneo lako)
azd env set AZURE_OPENAI_MODEL gpt-4

# Weka tena kwa usanidi mpya
azd deploy
```

2. **Ongeza huduma za AI za ziada:**

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

### Hatua 3.2: Mipangilio Maalum kwa Mazingira

**Mzoea Bora**: Mipangilio tofauti kwa maendeleo dhidi ya uzalishaji.

1. **Unda mazingira ya uzalishaji:**
```bash
azd env new myai-production
```

2. **Weka vigezo maalum vya uzalishaji:**
```bash
# Uzalishaji kwa kawaida hutumia SKU zenye kiwango cha juu
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Wezesha vipengele vya ziada vya usalama
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Zoefrsha la Maabara 3.1: Uboreshaji wa Gharama**

**Changamoto**: Sanidi kiolezo kwa ajili ya maendeleo yenye gharama nafuu.

**Kazi:**
1. Tambua SKU ambazo zinaweza kuwekwa kwenye ngazi za bure/za msingi
2. Sanidi vigezo vya mazingira kwa gharama ndogo
3. Tekeleza na linganisha gharama na mipangilio ya uzalishaji

**Vidokezo vya suluhisho:**
- Tumia tier ya F0 (free) kwa Cognitive Services inapowezekana
- Tumia tier ya Basic kwa Search Service wakati wa maendeleo
- Fikiria kutumia mpango wa Consumption kwa Functions

## Moduli 4: Usalama na Mazoea Bora kwa Uzalishaji

### Hatua 4.1: Usimamizi Salama wa Vibali

**Changamoto ya sasa**: Programu nyingi za AI zinaweka API keys moja kwa moja au kutumia hifadhi zisizo salama.

**Suluhisho la AZD**: Managed Identity + Key Vault kuunganishwa.

1. **Pitia upangaji wa usalama katika kiolezo chako:**
```bash
# Tafuta usanidi wa Key Vault na Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Thibitisha Managed Identity inafanya kazi:**
```bash
# Angalia kama programu ya wavuti ina usanidi sahihi wa utambulisho
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Hatua 4.2: Usalama wa Mtandao

1. **Washa private endpoints** (ikiwa bado hazijasanidiwa):

Ongeza kwenye template yako ya bicep:
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

### Hatua 4.3: Ufuatiliaji na Uonekana

1. **Sanidi Application Insights:**
```bash
# Application Insights inapaswa kusanidiwa kiotomatiki
# Kagua usanidi:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Sanidi ufuatiliaji maalum kwa AI:**

Ongeza metriku maalum kwa ajili ya operesheni za AI:
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

### **Zoefrsha la Maabara 4.1: Ukaguzi wa Usalama**

**Kazi**: Pitia utekelezaji wako kwa mazoea bora ya usalama.

**Orodha ya ukaguzi:**
- [ ] Hakuna siri zilizowekwa moja kwa moja katika msimbo au mipangilio
- [ ] Managed Identity inatumiwa kwa uthibitisho kati ya huduma
- [ ] Key Vault inahifadhi mipangilio nyeti
- [ ] Ufikiaji wa mtandao umewekewa kikomo ipasavyo
- [ ] Ufuatiliaji na uandishi kumbukumbu vimewezeshwa

## Moduli 5: Kubadilisha Programu Yako ya AI

### Hatua 5.1: Karatasi ya Tathmini

**Kabla ya kubadilisha programu yako**, jibu maswali haya:

1. **Mimarisha ya Programu:**
   - Ni huduma gani za AI programu yako inazitumia?
   - Ni rasilimali za compute gani inazohitaji?
   - Je, inahitaji database?
   - Ni utegemezi gani kati ya huduma?

2. **Mahitaji ya Usalama:**
   - Ni data gani nyeti programu yako inashughulikia?
   - Je, una mahitaji ya kufuata kanuni (compliance)?
   - Je, unahitaji mtandao wa kibinafsi?

3. **Mahitaji ya Kupanua (Scaling):**
   - Ni mzigo gani unatarajia?
   - Je, unahitaji auto-scaling?
   - Je, kuna mahitaji ya kikanda?

### Hatua 5.2: Unda Kiolezo Chako cha AZD

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

### **Zoefrsha la Maabara 5.1: Changamoto ya Uundaji wa Kiolezo**

**Changamoto**: Unda kiolezo cha AZD kwa programu ya AI ya usindikaji wa nyaraka.

**Mahitaji:**
- Azure OpenAI kwa uchambuzi wa yaliyomo
- Document Intelligence kwa OCR
- Storage Account kwa upakiaji wa nyaraka
- Function App kwa mantiki ya usindikaji
- Web app kwa kiolesura cha mtumiaji

**Pointi za ziada:**
- Ongeza utunzaji sahihi wa makosa
- Jumuisha makadirio ya gharama
- Sanidi dashibodi za ufuatiliaji

## Moduli 6: Kutatua Masuala ya Kawaida

### Masuala ya Kawaida ya Utekelezaji

#### Tatizo 1: Quota ya Huduma ya OpenAI Imevuka
**Dalili:** Utekelezaji unashindwa kwa kosa la quota
**Suluhisho:**
```bash
# Angalia vikwazo vya sasa
az cognitiveservices usage list --location eastus

# Omba ongezeko la ukomo au jaribu mkoa tofauti
azd env set AZURE_LOCATION westus2
azd up
```

#### Tatizo 2: Modeli Haipatikani Kwenye Eneo
**Dalili:** Majibu ya AI yanashindwa au utekelezaji wa modeli unakosa mafanikio
**Suluhisho:**
```bash
# Angalia upatikanaji wa modeli kwa kanda
az cognitiveservices model list --location eastus

# Sasisha hadi modeli inayopatikana
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Tatizo 3: Masuala ya Ruhusa
**Dalili:** Makosa ya 403 Forbidden wakati wa kuita huduma za AI
**Suluhisho:**
```bash
# Angalia ugawaji wa majukumu
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Ongeza majukumu yaliyokosekana
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Masuala ya Utendakazi

#### Tatizo 4: Majibu ya AI Polepole
**Hatua za uchunguzi:**
1. Angalia Application Insights kwa metriku za utendakazi
2. Pitia metriku za huduma ya OpenAI katika Azure portal
3. Thibitisha uunganishaji wa mtandao na ucheleweshaji

**Suluhisho:**
- Tekeleza caching kwa maswali ya kawaida
- Tumia modeli ya OpenAI inayofaa kwa matumizi yako
- Fikiria nakala za kusoma (read replicas) kwa mazingira yenye mzigo mkubwa

### **Zoefrsha la Maabara 6.1: Changamoto ya Utatuzi**

**Senario**: Utekelezaji wako ulifanikiwa, lakini programu inarudisha makosa ya 500.

**Kazi za utatuzi:**
1. Angalia logs za programu
2. Thibitisha uunganishaji wa huduma
3. Jaribu uthibitisho
4. Pitia mipangilio

**Zana za kutumia:**
- `azd show` kwa muhtasari wa utekelezaji
- Azure portal kwa logs za huduma kwa undani
- Application Insights kwa telemetry ya programu

## Moduli 7: Ufuatiliaji na Uboreshaji

### Hatua 7.1: Sanidi Ufuatiliaji Kamili

1. **Unda dashibodi maalum:**

Tembelea Azure portal na unda dashibodi yenye:
- Idadi ya maombi ya OpenAI na ucheleweshaji
- Viwango vya makosa ya programu
- Matumizi ya rasilimali
- Ufuatiliaji wa gharama

2. **Sanidi onyo/alerts:**
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
- Sanidi onyo za bajeti
- Tumia sera za autoscaling
- Tekeleza caching ya maombi
- Fuatilia matumizi ya token za OpenAI

### **Zoefrsha la Maabara 7.1: Uboreshaji wa Utendakazi**

**Kazi**: Boresha programu yako ya AI kwa utendakazi na gharama.

**Metriki za kuboresha:**
- Punguza wastani wa wakati wa jibu kwa 20%
- Punguza gharama za kila mwezi kwa 15%
- Dumu 99.9% uptime

**Mikakati ya kujaribu:**
- Tekeleza caching ya majibu
- Boresha prompts kwa ufanisi wa tokeni
- Tumia SKUs sahihi za compute
- Sanidi autoscaling ipasavyo

## Changamoto ya Mwisho: Utekelezaji wa Mwisho-ku-Mwisho

### Senario la Changamoto

Umewekwa jukumu la kuunda chatbot ya huduma kwa wateja inayotumia AI kwa uzalishaji na mahitaji haya:

**Mahitaji ya Kifunctional:**
- Kiolesura cha wavuti kwa mawasiliano ya wateja
- Uunganishaji na Azure OpenAI kwa majibu
- Uwezo wa kutafuta nyaraka kutumia Cognitive Search
- Uunganishaji na database ya wateja iliyopo
- Msaada wa lugha nyingi

**Mahitaji Yasiyo ya Kifunctional:**
- Imudu watumiaji 1000 kwa wakati mmoja
- 99.9% SLA ya uptime
- Umezingatia SOC 2
- Gharama chini ya $500/mwezi
- Tekeleza kwenye mazingira mbalimbali (dev, staging, prod)

### Hatua za Utekelezaji

1. **Buni usanifu**
2. **Unda kiolezo cha AZD**
3. **Tekeleza hatua za usalama**
4. **Sanidi ufuatiliaji na onyo**
5. **Unda mifereji ya ueneaji (deployment pipelines)**
6. **Andaa nyaraka za suluhisho**

### Vigezo vya Tathmini

- ✅ **Utekelezaji**: Je, inakidhi mahitaji yote?
- ✅ **Usalama**: Je, mazoea bora yameitishwa?
- ✅ **Uwezo wa Kupanuka**: Inaweza kushughulikia mzigo?
- ✅ **Uwezo wa Kudumisha**: Je, msimbo na miundombinu vimepangwa vizuri?
- ✅ **Gharama**: Je, inabaki ndani ya bajeti?

## Rasilimali Zaidi

### Nyaraka za Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Templeti za Mfano
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Rasilimali za Jamii
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Cheti cha Kukamilisha
Hongera! Umeikamilisha Warsha ya AI. Sasa unapaswa kuwa na uwezo wa:

- ✅ Geuza programu za AI zilizopo kuwa AZD templates
- ✅ Zindua programu za AI zilizo tayari kwa uzalishaji
- ✅ Tekeleza kanuni bora za usalama kwa mzigo wa kazi wa AI
- ✅ Fuatilia na boresha utendaji wa programu za AI
- ✅ Tatua matatizo ya kawaida ya uanzishaji

### Hatua Zifuatazo
1. Tumia mifumo hii kwenye miradi yako ya AI
2. Changia templeti kwa jamii
3. Jiunge na Microsoft Foundry Discord kwa msaada unaoendelea
4. Chunguza mada za juu kama vile ueneaji katika mikoa mingi

---

**Maoni ya Warsha**: Tutusaidie kuboresha warsha hii kwa kushiriki uzoefu wako katika [Kituo cha Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Uvinjari wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanziaji](../../README.md)
- **📖 Sura ya Sasa**: Sura 2 - Maendeleo ya AI Kwanza
- **⬅️ Iliyotangulia**: [Uanzishaji wa Mfano wa AI](ai-model-deployment.md)
- **➡️ Ifuatayo**: [Mbinu Bora za AI kwa Uzalishaji](production-ai-practices.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Mipangilio](../chapter-03-configuration/configuration.md)

**Unahitaji Msaada?** Jiunge na jamii yetu kwa msaada na mijadala kuhusu AZD na uanzishaji wa AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Tamko la kutokuwajibika:
Hati hii imefasiriwa kwa kutumia huduma ya tafsiri ya AI (Co-op Translator: https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Hati ya asili katika lugha yake inapaswa kutambulika kama chanzo cha mamlaka. Kwa taarifa muhimu, inashauriwa kutumia huduma ya mtafsiri wa kitaalamu aliyebobea. Hatuwezi kuwajibika kwa uelewa au tafsiri potofu zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->