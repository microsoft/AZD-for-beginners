# AI Workshop Lab: Kufanya Suluhisho Zako za AI Ziweze Kupelekwa na AZD

**Ukurasa wa Sehemu:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Anayeanza](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 2 - Maendeleo ya AI Kwanza
- **⬅️ Iliyopita**: [Upelekaji wa Mfano wa AI](ai-model-deployment.md)
- **➡️ Inayofuata**: [Mazoea Bora ya AI ya Uzalishaji](production-ai-practices.md)
- **🚀 Sura Inayofuata**: [Sura ya 3: Usanidi](../getting-started/configuration.md)

## Muhtasari wa Warsha

Warsha hii ya vitendo inawaongoza watengenezaji kupitia mchakato wa kuchukua kiolezo cha AI kilichopo na kukipeleka kwa kutumia Azure Developer CLI (AZD). Utajifunza mifumo muhimu kwa upelekaji wa AI wa uzalishaji kwa kutumia huduma za Microsoft Foundry.

**Muda:** Saa 2-3  
**Kiwango:** Wastani  
**Mahitaji ya Awali:** Maarifa ya msingi ya Azure, ufahamu wa dhana za AI/ML

## 🎓 Malengo ya Kujifunza

Mwisho wa warsha hii, utaweza:
- ✅ Kubadilisha programu ya AI iliyopo kutumia violezo vya AZD
- ✅ Kusanikisha huduma za Microsoft Foundry na AZD
- ✅ Kutekeleza usimamizi salama wa sifa za huduma za AI
- ✅ Kuweka programu za AI tayari kwa uzalishaji zenye ufuatiliaji
- ✅ Kutatua matatizo ya kawaida ya upelekaji wa AI

## Mahitaji ya Awali

### Zana Zinazohitajika
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) imewekwa
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) imewekwa
- [Git](https://git-scm.com/) imewekwa
- Mhariri wa msimbo (VS Code inapendekezwa)

### Rasilimali za Azure
- Usajili wa Azure wenye ruhusa ya mchangiaji
- Ufikiaji wa huduma za Azure OpenAI (au uwezo wa kuomba ufikiaji)
- Ruhusa za kuunda kikundi cha rasilimali

### Maarifa ya Awali
- Ufahamu wa msingi wa huduma za Azure
- Ufahamu wa kiolesura cha mstari wa amri
- Dhana za msingi za AI/ML (APIs, mifano, maelekezo)

## Usanidi wa Warsha

### Hatua ya 1: Maandalizi ya Mazingira

1. **Hakikisha usakinishaji wa zana:**
```bash
# Angalia usakinishaji wa AZD
azd version

# Angalia Azure CLI
az --version

# Ingia kwenye Azure
az login
azd auth login
```

2. **Nakili hazina ya warsha:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moduli ya 1: Kuelewa Muundo wa AZD kwa Programu za AI

### Muundo wa Kiolezo cha AZD Tayari kwa AI

Chunguza faili muhimu katika kiolezo cha AZD tayari kwa AI:

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

1. **Chunguza faili ya azure.yaml:**
```bash
cat azure.yaml
```

**Unachopaswa kuangalia:**
- Ufafanuzi wa huduma kwa vipengele vya AI
- Ulinganifu wa vigezo vya mazingira
- Usanidi wa mwenyeji

2. **Kagua miundombinu ya main.bicep:**
```bash
cat infra/main.bicep
```

**Mifumo muhimu ya AI ya kutambua:**
- Utoaji wa huduma ya Azure OpenAI
- Ushirikiano wa Utafutaji wa Utambuzi
- Usimamizi salama wa funguo
- Usanidi wa usalama wa mtandao

### **Hoja ya Majadiliano:** Kwa Nini Mifumo Hii Ni Muhimu kwa AI

- **Utegemezi wa Huduma**: Programu za AI mara nyingi zinahitaji huduma nyingi zinazoratibiwa
- **Usalama**: Funguo za API na ncha za mwisho zinahitaji usimamizi salama
- **Uwezo wa Kupanuka**: Mzigo wa kazi wa AI una mahitaji ya kipekee ya kupanuka
- **Usimamizi wa Gharama**: Huduma za AI zinaweza kuwa ghali ikiwa hazijasimamiwa vizuri

## Moduli ya 2: Peleka Programu Yako ya Kwanza ya AI

### Hatua ya 2.1: Anzisha Mazingira

1. **Unda mazingira mapya ya AZD:**
```bash
azd env new myai-workshop
```

2. **Weka vigezo vinavyohitajika:**
```bash
# Weka eneo lako la Azure unalopendelea
azd env set AZURE_LOCATION eastus

# Hiari: Weka mfano maalum wa OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Hatua ya 2.2: Peleka Miundombinu na Programu

1. **Peleka kwa AZD:**
```bash
azd up
```

**Kinachotokea wakati wa `azd up`:**
- ✅ Inatoa huduma ya Azure OpenAI
- ✅ Inaunda huduma ya Utafutaji wa Utambuzi
- ✅ Inasanidi Huduma ya Programu kwa programu ya wavuti
- ✅ Inasanidi mtandao na usalama
- ✅ Inapeleka msimbo wa programu
- ✅ Inasanidi ufuatiliaji na kumbukumbu

2. **Fuatilia maendeleo ya upelekaji** na angalia rasilimali zinazoundwa.

### Hatua ya 2.3: Thibitisha Upelekaji Wako

1. **Angalia rasilimali zilizowekwa:**
```bash
azd show
```

2. **Fungua programu iliyowekwa:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Jaribu utendaji wa AI:**
   - Tembelea programu ya wavuti
   - Jaribu maswali ya mfano
   - Thibitisha majibu ya AI yanafanya kazi

### **Zoezi la Maabara 2.1: Mazoezi ya Utatuzi**

**Hali**: Upelekaji wako umefanikiwa lakini AI haijibu.

**Masuala ya kawaida ya kuangalia:**
1. **Funguo za API za OpenAI**: Thibitisha zimewekwa kwa usahihi
2. **Upatikanaji wa Mfano**: Angalia ikiwa eneo lako linaunga mkono mfano
3. **Muunganisho wa Mtandao**: Hakikisha huduma zinaweza kuwasiliana
4. **Ruhusa za RBAC**: Thibitisha programu inaweza kufikia OpenAI

**Amri za kutatua matatizo:**
```bash
# Angalia vigezo vya mazingira
azd env get-values

# Tazama kumbukumbu za upelekaji
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Angalia hali ya upelekaji wa OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moduli ya 3: Kubinafsisha Programu za AI kwa Mahitaji Yako

### Hatua ya 3.1: Badilisha Usanidi wa AI

1. **Sasisha mfano wa OpenAI:**
```bash
# Badilisha kwa mfano tofauti (ikiwa inapatikana katika eneo lako)
azd env set AZURE_OPENAI_MODEL gpt-4

# Tumia tena na usanidi mpya
azd deploy
```

2. **Ongeza huduma za ziada za AI:**

Hariri `infra/main.bicep` kuongeza Ujasusi wa Nyaraka:

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

**Mazoea Bora**: Usanidi tofauti kwa maendeleo dhidi ya uzalishaji.

1. **Unda mazingira ya uzalishaji:**
```bash
azd env new myai-production
```

2. **Weka vigezo maalum vya uzalishaji:**
```bash
# Uzalishaji kwa kawaida hutumia SKUs za juu zaidi
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Washa vipengele vya ziada vya usalama
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Zoezi la Maabara 3.1: Uboreshaji wa Gharama**

**Changamoto**: Sanidi kiolezo kwa maendeleo ya gharama nafuu.

**Kazi:**
1. Tambua ni SKUs zipi zinaweza kuwekwa kwa viwango vya bure/msingi
2. Sanidi vigezo vya mazingira kwa gharama ndogo
3. Peleka na linganisha gharama na usanidi wa uzalishaji

**Vidokezo vya suluhisho:**
- Tumia kiwango cha F0 (bure) kwa Huduma za Utambuzi inapowezekana
- Tumia kiwango cha Msingi kwa Huduma ya Utafutaji katika maendeleo
- Fikiria kutumia mpango wa Matumizi kwa Kazi

## Moduli ya 4: Usalama na Mazoea Bora ya Uzalishaji

### Hatua ya 4.1: Usimamizi Salama wa Sifa

**Changamoto ya sasa**: Programu nyingi za AI huweka funguo za API au hutumia hifadhi isiyo salama.

**Suluhisho la AZD**: Utambulisho Unaoendeshwa + Ushirikiano wa Hifadhi ya Funguo.

1. **Kagua usanidi wa usalama katika kiolezo chako:**
```bash
# Tafuta usanidi wa Key Vault na Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Thibitisha Utambulisho Unaoendeshwa unafanya kazi:**
```bash
# Angalia kama programu ya wavuti ina usanidi sahihi wa utambulisho
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Hatua ya 4.2: Usalama wa Mtandao

1. **Wezesha ncha za mwisho za kibinafsi** (ikiwa hazijasanikishwa tayari):

Ongeza kwenye kiolezo chako cha bicep:
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

1. **Sanidi Uelewa wa Programu:**
```bash
# Uelekezi wa Maombi unapaswa kusanidiwa kiotomatiki
# Angalia usanidi:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Sanidi ufuatiliaji maalum wa AI:**

Ongeza vipimo maalum kwa shughuli za AI:
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

**Kazi**: Kagua upelekaji wako kwa mazoea bora ya usalama.

**Orodha ya ukaguzi:**
- [ ] Hakuna siri zilizowekwa moja kwa moja kwenye msimbo au usanidi
- [ ] Utambulisho Unaoendeshwa umetumika kwa uthibitishaji wa huduma kwa huduma
- [ ] Hifadhi ya Funguo inahifadhi usanidi nyeti
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
   - Una mahitaji gani ya kufuata?
   - Je, unahitaji mtandao wa kibinafsi?

3. **Mahitaji ya Kupanuka:**
   - Ni mzigo gani unatarajiwa?
   - Je, unahitaji upanuzi wa kiotomatiki?
   - Kuna mahitaji ya kieneo?

### Hatua ya 5.2: Unda Kiolezo Chako cha AZD

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

3. **Unda violezo vya miundombinu:**

**infra/main.bicep** - Kiolezo kikuu:
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

### **Zoezi la Maabara 5.1: Changamoto ya Uundaji wa Kiolezo**

**Changamoto**: Unda kiolezo cha AZD kwa programu ya AI ya usindikaji wa nyaraka.

**Mahitaji:**
- Azure OpenAI kwa uchambuzi wa maudhui
- Ujasusi wa Nyaraka kwa OCR
- Akaunti ya Hifadhi kwa upakiaji wa nyaraka
- Kazi ya Programu kwa mantiki ya usindikaji
- Programu ya wavuti kwa kiolesura cha mtumiaji

**Pointi za ziada:**
- Ongeza usimamizi wa makosa unaofaa
- Jumuisha makadirio ya gharama
- Sanidi dashibodi za ufuatiliaji

## Moduli ya 6: Kutatua Masuala ya Kawaida

### Masuala ya Kawaida ya Upelekaji

#### Tatizo 1: Kiwango cha Huduma ya OpenAI Kimezidi
**Dalili:** Upelekaji unashindwa na kosa la kiwango
**Suluhisho:**
```bash
# Angalia viwango vya sasa
az cognitiveservices usage list --location eastus

# Omba ongezeko la kiwango au jaribu eneo tofauti
azd env set AZURE_LOCATION westus2
azd up
```

#### Tatizo 2: Mfano Haupatikani Katika Eneo
**Dalili:** Majibu ya AI yanashindwa au makosa ya upelekaji wa mfano
**Suluhisho:**
```bash
# Angalia upatikanaji wa modeli kwa kanda
az cognitiveservices model list --location eastus

# Sasisha kwa modeli inayopatikana
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Tatizo 3: Masuala ya Ruhusa
**Dalili:** Makosa ya 403 Forbidden wakati wa kuita huduma za AI
**Suluhisho:**
```bash
# Angalia mgawanyo wa majukumu
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Ongeza majukumu yanayokosekana
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Masuala ya Utendaji

#### Tatizo 4: Majibu ya AI Polepole
**Hatua za uchunguzi:**
1. Angalia Uelewa wa Programu kwa vipimo vya utendaji
2. Kagua vipimo vya huduma ya OpenAI kwenye portal ya Azure
3. Thibitisha muunganisho wa mtandao na ucheleweshaji

**Suluhisho:**
- Tekeleza uhifadhi wa maswali ya kawaida
- Tumia mfano wa OpenAI unaofaa kwa matumizi yako
- Fikiria nakala za kusoma kwa hali za mzigo mkubwa

### **Zoezi la Maabara 6.1: Changamoto ya Utatuzi**

**Hali**: Upelekaji wako umefanikiwa, lakini programu inarudisha makosa ya 500.

**Kazi za kutatua matatizo:**
1. Angalia kumbukumbu za programu
2. Thibitisha muunganisho wa huduma
3. Jaribu uthibitishaji
4. Kagua usanidi

**Zana za kutumia:**
- `azd show` kwa muhtasari wa upelekaji
- Portal ya Azure kwa kumbukumbu za kina za huduma
- Uelewa wa Programu kwa telemetry ya programu

## Moduli ya 7: Ufuatiliaji na Uboreshaji

### Hatua ya 7.1: Sanidi Ufuatiliaji wa Kina

1. **Unda dashibodi maalum:**

Tembelea portal ya Azure na unda dashibodi yenye:
- Idadi ya maombi ya OpenAI na ucheleweshaji
- Viwango vya makosa ya programu
- Matumizi ya rasilimali
- Ufuatiliaji wa gharama

2. **Sanidi arifa:**
```bash
# Tahadhari kwa kiwango cha juu cha makosa
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
# Tumia Azure CLI kupata data ya gharama
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Tekeleza udhibiti wa gharama:**
- Sanidi arifa za bajeti
- Tumia sera za upanuzi wa kiotomatiki
- Tekeleza uhifadhi wa maombi
- Fuatilia matumizi ya tokeni kwa OpenAI

### **Zoezi la Maabara 7.1: Uboreshaji wa Utendaji**

**Kazi**: Boresha programu yako ya AI kwa utendaji na gharama.

**Vipimo vya kuboresha:**
- Punguza muda wa wastani wa majibu kwa 20%
- Punguza gharama za kila mwezi kwa 15%
- Dumisha muda wa upatikanaji wa 99.9%

**Mikakati ya kujaribu:**
- Tekeleza uhifadhi wa majibu
- Boresha maelekezo kwa ufanisi wa tokeni
- Tumia SKUs zinazofaa za kompyuta
- Sanidi upanuzi wa kiotomatiki ipasavyo

## Changamoto ya Mwisho: Utekelezaji wa Mwisho kwa Mwisho

### Hali ya Changamoto

Umepewa jukumu la kuunda chatbot ya huduma kwa wateja inayotumia AI kwa uzalishaji yenye mahitaji haya:

**Mahitaji ya Kazi:**
- Kiolesura cha wavuti kwa mwingiliano wa wateja
- Ushirikiano na Azure OpenAI kwa majibu
- Uwezo wa utafutaji wa nyaraka kwa kutumia Utafutaji wa Utambuzi
- Ushirikiano na hifadhidata ya wateja iliyopo
- Usaidizi wa lugha nyingi

**Mahitaji Yasiyo ya Kazi:**
- Kushughulikia watumiaji 1000 kwa wakati mmoja
- SLA ya muda wa upatikanaji wa 99.9%
- Ufuataji wa SOC 2
- Gharama chini ya $500/mwezi
- Upelekaji kwa mazingira mengi (maendeleo, majaribio, uzalishaji)

### Hatua za Utekelezaji

1. **Buni muundo wa usanifu**
2. **Unda kiolezo cha AZD**
3. **Tekeleza hatua za usalama**
4. **Sanidi ufuatiliaji na arifa**
5. **Unda njia za upelekaji**
6. **Andika nyaraka za suluhisho**

### Vigezo vya Tathmini

- ✅ **Utendaji**: Je, inakidhi mahitaji yote?
- ✅ **Usalama**: Je, mazoea bora yametekelezwa?
- ✅ **Uwezo wa Kupanuka**: Je, inaweza kushughulikia mzigo?
- ✅ **Uwezo wa Kudumisha**: Je, msimbo na miundombinu imepangwa vizuri?
- ✅ **Gharama**: Je, inabaki ndani ya bajeti?

## Rasilimali za Ziada

### Nyaraka za Microsoft
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Nyaraka za Huduma ya Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Nyaraka za Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Violezo vya Mfano
- [Programu ya Mazungumzo ya Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai
Hongera! Umemaliza maabara ya Warsha ya AI. Sasa unapaswa kuwa na uwezo wa:

- ✅ Kubadilisha programu za AI zilizopo kuwa templeti za AZD
- ✅ Kuweka programu za AI tayari kwa uzalishaji
- ✅ Kutekeleza mbinu bora za usalama kwa mizigo ya kazi ya AI
- ✅ Kufuatilia na kuboresha utendaji wa programu za AI
- ✅ Kutatua masuala ya kawaida ya uwekaji

### Hatua Zifuatazo
1. Tumia mifumo hii kwenye miradi yako ya AI
2. Changia templeti kwa jamii
3. Jiunge na Microsoft Foundry Discord kwa msaada endelevu
4. Chunguza mada za juu kama uwekaji wa maeneo mengi

---

**Maoni ya Warsha**: Tusaidie kuboresha warsha hii kwa kushiriki uzoefu wako katika [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Urambazaji wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Wanaoanza](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 2 - Maendeleo ya AI Kwanza
- **⬅️ Iliyopita**: [Uwekaji wa Modeli ya AI](ai-model-deployment.md)
- **➡️ Inayofuata**: [Mbinu Bora za AI za Uzalishaji](production-ai-practices.md)
- **🚀 Sura Inayofuata**: [Sura ya 3: Usanidi](../getting-started/configuration.md)

**Unahitaji Msaada?** Jiunge na jamii yetu kwa msaada na mijadala kuhusu AZD na uwekaji wa AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya asili inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->