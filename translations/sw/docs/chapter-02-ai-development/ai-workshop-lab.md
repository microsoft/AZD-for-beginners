# Warsha ya AI Lab: Kufanya Suluhisho Zako za AI Ziweze Kutumwa kwa AZD

**Uvinjari wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 2 - Maendeleo ya AI-Kwanza
- **⬅️ Iliyopita**: [Usambazaji wa Mfano wa AI](ai-model-deployment.md)
- **➡️ Ifuatayo**: [Mbinu Bora za AI kwa Uzalishaji](production-ai-practices.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

## Muhtasari wa Warsha

Warsha hii ya vitendo inaongoza watengenezaji kupitia mchakato wa kuchukua kiolezo kilichopo cha AI na kukiwasilisha kwa kutumia Azure Developer CLI (AZD). Utafundishwa mifumo muhimu kwa ajili ya usambazaji wa AI kwa uzalishaji kwa kutumia huduma za Microsoft Foundry.

> **Kumbuka uthibitisho (2026-07-13):** Warsha hii ilikaguliwa dhidi ya `azd` `1.27.1`. Ikiwa usakinishaji wako wa ndani ni wa zamani, sasisha AZD kabla ya kuanza ili uthibitisho, kiolezo, na mchakato wa usambazaji ulingane na hatua zilizo hapa chini.

**Muda:** Masaa 2-3  
**Kiwango:** Kati  
**Mahitaji ya awali:** Uelewa wa msingi wa Azure, ufahamu wa dhana za AI/ML

## 🎓 Malengo ya Kujifunza

Mwishoni mwa warsha hii, utaweza:
- ✅ Kubadilisha programu ya AI iliyopo kutumia violezo vya AZD
- ✅ Kusanidi huduma za Microsoft Foundry kwa AZD
- ✅ Kutekeleza usimamizi wa usalama wa huduma za AI
- ✅ Kusambaza programu za AI tayari kwa uzalishaji na ufuatiliaji
- ✅ Kutatua matatizo ya kawaida ya usambazaji wa AI

## Mahitaji ya awali

### Vyombo Vinavyohitajika
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) vimesakinishwa
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) vimesakinishwa
- [Git](https://git-scm.com/) vimesakinishwa
- Mhariri wa msimbo (VS Code inapendekezwa)

### Rasilimali za Azure
- Usajili wa Azure ulio na ruhusa ya mchangiaji
- Ufikiaji wa huduma za Microsoft Foundry Models (au uwezo wa kuomba ufikiaji)
- Ruhusa za kuunda kundi la rasilimali

### Mahitaji ya Maarifa
- Uelewa wa msingi wa huduma za Azure
- Ufahamu wa matumizi ya safu za amri
- Dhana za msingi za AI/ML (API, mifano, maelekezo)

## Usanidi wa Maabara

### Hatua 1: Kuandaa Mazingira

1. **Thibitisha usakinishaji wa vyombo:**
```bash
# Angalia usakinishaji wa AZD
azd version

# Angalia Azure CLI
az --version

# Ingia kwenye Azure kwa ajili ya michakato ya AZD
azd auth login

# Ingia kwenye Azure CLI tu ikiwa unapanga kuendesha amri za az wakati wa uchunguzi
az login
```

Ikiwa unafanya kazi kwa wapangaji wengi au usajili wako haupatikani moja kwa moja, jaribu tena kwa `azd auth login --tenant-id <tenant-id>`.

2. **Nakili hifadhi ya warsha:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Sehemu ya 1: Kuelewa Muundo wa AZD kwa Programu za AI

### Muhtasari wa Kiolezo cha AI AZD

Chunguza faili muhimu katika kiolezo cha AZD tayari kwa AI:

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

### **Mazoezi 1.1 ya Maabara: Chunguza Usanidi**

1. **Chunguza faili azure.yaml:**
```bash
cat azure.yaml
```

**Kitu cha kutazama:**
- Maelezo ya huduma kwa vipengele vya AI
- Ramani za mabadiliko ya mazingira
- Usanidi wa mwenyeji

2. **Rudia muundo wa main.bicep ya miundombinu:**
```bash
cat infra/main.bicep
```

**Mifumo muhimu ya AI ya kutambua:**
- Huduma ya Microsoft Foundry Models inatolewa
- Muunganiko wa Azure AI Search
- Usimamizi wa kisahihi wa funguo
- Usanidi wa usalama wa mtandao

### **Mada ya Majadiliano:** Kwa Nini Mifumo Hii ni Muhimu kwa AI

- **Utegemezi wa Huduma**: Programu za AI mara nyingi zinahitaji huduma nyingi zinazoshirikiana
- **Usalama**: Funguo za API na sehemu za kuingia zinahitaji usimamizi salama
- **Ukuaji**: Mipango ya AI ina mahitaji ya kipekee ya kupanua
- **Usimamizi wa Gharama**: Huduma za AI zinaweza kuwa ghali ikiwa hazijasanidiwa vizuri

## Sehemu ya 2: Sambaza Programu Yako ya Kwanza ya AI

### Hatua 2.1: Anzisha Mazingira

1. **Unda mazingira mapya ya AZD:**
```bash
azd env new myai-workshop
```

2. **Weka vigezo vinavyohitajika:**
```bash
# Weka eneo lako la Azure unalotaka
azd env set AZURE_LOCATION eastus

# Hiari: Weka mfano maalum wa OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Hatua 2.2: Sambaza Miundombinu na Programu

1. **Sambaza kwa kutumia AZD:**
```bash
azd up
```

**Kinachotokea wakati wa `azd up`:**
- ✅ Huduma ya Microsoft Foundry Models inatolewa
- ✅ Huduma ya Azure AI Search inaundwa
- ✅ Huduma ya App Service kwa programu ya wavuti inaanzishwa
- ✅ Muundo wa mtandao na usalama unasanidiwa
- ✅ Msimbo wa programu unasambazwa
- ✅ Ufuatiliaji na utumwa wa kumbukumbu vimewezeshwa

2. **Fuatilia maendeleo ya usambazaji** na kumbuka rasilimali zinazoanzishwa.

### Hatua 2.3: Thibitisha Usambazaji Wako

1. **Angalia rasilimali zilizosambazwa:**
```bash
azd show
```

2. **Fungua programu iliyowasilishwa:**
```bash
azd show
```

Fungua sehemu ya wavuti iliyoonyeshwa katika matokeo ya `azd show`.

3. **Jaribu utendakazi wa AI:**
   - Nenda kwenye programu ya wavuti
   - Jaribu maswali ya mfano
   - Thibitisha majibu ya AI yanafanya kazi

### **Mazoezi 2.1 ya Maabara: Mazoezi ya Kutatua Matatizo**

**Hali:** Usambazaji wako umefanikiwa lakini AI haisaidii majibu.

**Matatizo ya kawaida ya kuangalia:**
1. **Funguo za OpenAI API**: Thibitisha zimewekwa kwa usahihi
2. **Upatikanaji wa mfano**: Angalia kama eneo lako linaunga mkono mfano
3. **Muunganisho wa mtandao**: Hakikisha huduma zinaweza kuwasiliana
4. **Ruhusa za RBAC**: Thibitisha programu inaweza kufikia OpenAI

**Amri za kutatua tatizo:**
```bash
# Angalia vigezo vya mazingira
azd env get-values

# Tazama kumbukumbu za uenezaji
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Angalia hali ya uenezaji wa OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Sehemu ya 3: Kubinafsisha Programu za AI Kwa Mahitaji Yako

### Hatua 3.1: Badilisha Usanidi wa AI

1. **Sasisha mfano wa OpenAI:**
```bash
# Badilisha kwenda mfano tofauti (ikiwa upo katika eneo lako)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Rudi kuweka upya kwa usanidi mpya
azd deploy
```

2. **Ongeza huduma nyingine za AI:**

Hariri `infra/main.bicep` kuongeza Document Intelligence:

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

### Hatua 3.2: Usanidi wa Mazingira Mahususi

**Mwenendo Bora**: Usanidi tofauti kwa maendeleo dhidi ya uzalishaji.

1. **Unda mazingira ya uzalishaji:**
```bash
azd env new myai-production
```

2. **Weka vigezo maalum kwa uzalishaji:**
```bash
# Uzalishaji kawaida hutumia SKU za juu zaidi
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Washa vipengele vya ziada vya usalama
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Mazoezi 3.1 ya Maabara: Uboreshaji wa Gharama**

**Changamoto**: Sanidi kiolezo kwa maendeleo yenye gharama nafuu.

**Majukumu:**
1. Tambua SKU ambazo zinaweza kuwekwa kwenye ngazi za bure/msingi
2. Sanidi mabadiliko ya mazingira kwa gharama ndogo
3. Sambaza na linganisha gharama na usanidi wa uzalishaji

**Vidokezo vya suluhisho:**
- Tumia ngazi ya F0 (bure) kwa Huduma za Azure AI inapowezekana
- Tumia ngazi ya Msingi kwa Huduma ya Utafutaji katika maendeleo
- Fikiria kutumia mpango wa Matumizi kwa Functions

## Sehemu ya 4: Usalama na Mbinu Bora za Uzalishaji

### Hatua 4.1: Usimamizi Salama wa Viambatisho

**Changamoto ya sasa**: Programu nyingi za AI hutumia funguo za API kufichwa au kuhifadhi vibaya.

**Suluhisho la AZD**: Utambulisho ulioendeshwa + ushirikiano wa Key Vault.

1. **Kagua usanidi wa usalama katika kiolezo chako:**
```bash
# Angalia usanidi wa Key Vault na Hazina Iliyosimamiwa
grep -r "keyVault\|managedIdentity" infra/
```

2. **Thibitisha Utambulisho Ulioendeshwa unafanya kazi:**
```bash
# Angalia ikiwa programu ya wavuti ina usanidi sahihi wa utambulisho
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Hatua 4.2: Usalama wa Mtandao

1. **wezeshsha njia za kibinafsi** (kama hazijasanidiwa tayari):

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

### Hatua 4.3: Ufuatiliaji na Uwezo wa Kuona

1. **Sanidi Application Insights:**
```bash
# Application Insights inapaswa kusanidiwa moja kwa moja
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

### **Mazoezi 4.1 ya Maabara: Ukaguzi wa Usalama**

**Jukumu**: Kagua usambazaji wako kwa mbinu bora za usalama.

**Orodha ya ukaguzi:**
- [ ] Hakuna siri zilizomo kwenye msimbo au usanidi
- [ ] Utambulisho Ulioendeshwa umetumika kwa uthibitisho wa huduma kwa huduma
- [ ] Key Vault huhifadhi usanidi wenye nyeti
- [ ] Ufikiaji wa mtandao umefikiwa kwa usahihi
- [ ] Ufuatiliaji na utumwa wa kumbukumbu vimewezeshwa

## Sehemu ya 5: Kubadilisha Programu Yako ya AI Mwenyewe

### Hatua 5.1: Karatasi ya Tathmini

**Kabla ya kubadilisha programu yako**, jibu maswali haya:

1. **Muundo wa Programu:**
   - Huduma gani za AI programu yako inazitumia?
   - Rasilimali gani za kompyuta zinahitajika?
   - Je, inahitaji hifadhidata?
   - Ni utegemezi gani kati ya huduma?

2. **Mahitaji ya Usalama:**
   - Data nyeti gani programu yako inashughulikia?
   - Mahitaji gani ya utii unao?
   - Je, unahitaji mtandao binafsi?

3. **Mahitaji ya Kupanua:**
   - Je, mzigo unaotarajiwa ni upi?
   - Unahitaji kupanua kiotomatiki?
   - Kuna mahitaji ya kikanda?

### Hatua 5.2: Unda Kiolezo Chako cha AZD

**Fuata mfumo huu kubadilisha programu yako:**

1. **Unda muundo msingi:**
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

**infra/modules/openai.bicep** - Kiolezo cha moduli ya OpenAI:
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

### **Mazoezi 5.1 ya Maabara: Changamoto ya Kuunda Kiolezo**

**Changamoto**: Unda kiolezo cha AZD kwa programu ya AI ya usindikaji wa hati.

**Mahitaji:**
- Microsoft Foundry Models kwa uchambuzi wa maudhui
- Document Intelligence kwa OCR
- Akaunti ya Hifadhidata kwa kupakia hati
- Programu ya Function kwa mantiki ya usindikaji
- Programu ya wavuti kwa kiolesura cha mtumiaji

**Alama za ziada:**
- Ongeza usimamizi sahihi wa makosa
- Jumuisha makadirio ya gharama
- Sanidi dashibodi za ufuatiliaji

## Sehemu ya 6: Kutatua Matatizo ya Kawaida

### Matatizo ya Kawaida ya Usambazaji

#### Tatizo 1: Kiasi cha Huduma ya OpenAI Kimezidiwa
**Dalili:** Usambazaji unapoteza kwa kosa la kiasi
**Suluhisho:**
```bash
# Kagua makato ya sasa
az cognitiveservices usage list --location eastus

# Omba ongezeko la makato au jaribu mkoa tofauti
azd env set AZURE_LOCATION westus2
azd up
```

#### Tatizo 2: Mfano Haupatikani Kwenye Eneo
**Dalili:** Majibu ya AI yanashindwa au makosa ya usambazaji wa mfano
**Suluhisho:**
```bash
# Angalia upatikanaji wa mfano kwa mkoa
az cognitiveservices model list --location eastus

# Sasisha kuwa mfano unaopatikana
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Tatizo 3: Masuala ya Ruhusa
**Dalili:** Makosa ya 403 Forbidden wakati wa kuita huduma za AI
**Suluhisho:**
```bash
# Angalia mgawanyo wa nafasi
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Ongeza nafasi zilizokosekana
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Masuala ya Utendaji

#### Tatizo 4: Majibu ya AI Polepole
**Hatua za uchunguzi:**
1. Angalia Application Insights kwa vipimo vya utendaji
2. Rudia vipimo vya huduma ya OpenAI katika lango la Azure
3. Thibitisha muunganisho wa mtandao na ucheleweshaji

**Suluhisho:**
- Tekeleza uhifadhi wa majibu kwa maswali ya kawaida
- Tumia mfano sahihi wa OpenAI kwa matumizi yako
- Fikiria nakala za kusoma kwa hali za mzigo mkubwa

### **Mazoezi 6.1 ya Maabara: Changamoto ya Kutatua Hitilafu**

**Hali:** Usambazaji wako umefanikiwa, lakini programu inarudisha makosa ya 500.

**Majukumu ya kutatua hitilafu:**
1. Angalia kumbukumbu za programu
2. Thibitisha muunganisho wa huduma
3. Jaribu uthibitisho
4. Rudia usanidi

**Vyombo vya kutumia:**
- `azd show` kwa muhtasari wa usambazaji
- Lango la Azure kwa kumbukumbu za huduma kwa undani
- Application Insights kwa telemetri ya programu

## Sehemu ya 7: Ufuatiliaji na Uboreshaji

### Hatua 7.1: Sanidi Ufuatiliaji Kamili

1. **Unda dashibodi maalum:**

Nenda kwenye lango la Azure na unda dashibodi yenye:
- Hesabu na ucheleweshaji wa maombi ya OpenAI
- Viwango vya makosa ya programu
- Matumizi ya rasilimali
- Ufuatiliaji wa gharama

2. **Sanidi arifa:**
```bash
# Onyo kwa kiwango kikubwa cha makosa
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
# Tumia Azure CLI kupata data za gharama
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Tekeleza udhibiti wa gharama:**
- Sanidi arifa za bajeti
- Tumia sera za kupanua kiotomatiki
- Tekeleza uhifadhi wa maombi
- Fuatilia matumizi ya tokeni kwa OpenAI

### **Mazoezi 7.1 ya Maabara: Uboreshaji wa Utendaji**

**Jukumu**: Boresha programu yako ya AI kwa utendaji na gharama.

**Vipimo vya kuboresha:**
- Punguza wastani wa muda wa majibu kwa 20%
- Punguza gharama za kila mwezi kwa 15%
- Dumisha upatikanaji wa 99.9%

**Mikakati ya kujaribu:**
- Tekeleza uhifadhi wa majibu
- Boresha maelekezo kwa ufanisi wa tokeni
- Tumia SKUs za kompyuta zinazofaa
- Sanidi upanuzi wa kiotomatiki kwa usahihi

## Changamoto ya Mwisho: Utekelezaji Kamili

### Hali ya Changamoto

Umepewa jukumu la kuunda chatbot ya huduma kwa wateja inayotumia AI tayari kwa uzalishaji yenye mahitaji haya:

**Mahitaji ya Kazi:**
- Kiolesura cha wavuti kwa mawasiliano ya wateja
- Muunganiko na Microsoft Foundry Models kwa majibu
- Uwezo wa kutafuta hati kwa kutumia Azure AI Search
- Muunganiko na hifadhidata ya wateja iliyopo
- Usaidizi wa lugha nyingi

**Mahitaji Yasiyo ya Kazi:**
- Hudumia watumiaji 1000 kwa wakati mmoja
- SLA ya upatikanaji wa 99.9%
- Utii wa SOC 2
- Gharama chini ya $500/mwezi
- Sambaza kwa mazingira mengi (maendeleo, hatua, uzalishaji)

### Hatua za Utekelezaji

1. **Buni usanifu**
2. **Unda kiolezo cha AZD**
3. **Tekeleza hatua za usalama**
4. **Sanidi ufuatiliaji na arifa**
5. **Unda njia za usambazaji**
6. **Andika nyaraka za suluhisho**

### Vigezo vya Tathmini

- ✅ **Utendaji**: Je, inakidhi mahitaji yote?
- ✅ **Usalama**: Je, mbinu bora zimetekelezwa?
- ✅ **Ukuaji**: Je, inaweza kushughulikia mzigo?
- ✅ **Urahisi wa Kutunza**: Je, msimbo na miundombinu zimepangwa vizuri?
- ✅ **Gharama**: Je, inaelea ndani ya bajeti?

## Rasilimali Zaidi

### Nyaraka za Microsoft
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Nyaraka za Huduma za Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Nyaraka za Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Violezo vya Mfano
- [Programu ya Chat ya Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Mwanzo wa Haraka wa Programu ya Chat ya OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Rasilimali za Jamii
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Cheti cha Kukamilika

Hongera! Umehitimisha Maabara ya Warsha ya AI. Sasa unapaswa kuwa na uwezo wa:

- ✅ Badilisha matumizi ya AI yaliyopo kuwa templeti za AZD
- ✅ Tengeneza matumizi ya AI yayaoyakamilika kwa ajili ya uzalishaji
- ✅ Tekeleza mbinu bora za usalama kwa mizigo ya AI
- ✅ Simamia na boresha utendaji wa matumizi ya AI
- ✅ Tatua matatizo ya kawaida ya usambazaji

### Hatua Zifuatazo
1. Tumia miundo hii kwenye miradi yako binafsi ya AI
2. Changia templeti kwa jamii
3. Jiunge na Microsoft Foundry Discord kwa msaada unaoendelea
4. Chunguza mada za juu kama usambazaji wa maeneo mengi

---

**Maoni kuhusu Warsha**: Tusaidie kuboresha warsha hii kwa kushiriki uzoefu wako kwenye [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Uchaguzi wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD For Beginners](../../README.md)
- **📖 Sura ya Sasa**: Sura 2 - Maendeleo ya Kwanza ya AI
- **⬅️ Iliyopita**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Ifuatayo**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

**Unahitaji Msaada?** Jiunge na jamii yetu kwa msaada na mjadala kuhusu AZD na usambazaji wa AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->