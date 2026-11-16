# Warsha ya AI: Kufanya Suluhisho Zako za AI Ziweze Kuwekwa Kwa AZD

**Mwaliko wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 2 - Maendeleo ya AI-Kwanza
- **⬅️ Iliyopita**: [Uwekaji Mfano wa AI](ai-model-deployment.md)
- **➡️ Ifuatayo**: [Mila Bora za AI za Uzalishaji](../chapter-08-production/production-ai-practices.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

## Muhtasari wa Warsha

Maabara hii ya vitendo inaongoza waendelezaji kupitia mchakato wa kuchukua kiolezo kilicho tayari cha AI na kuikamilisha kwa kutumia Azure Developer CLI (AZD). Utajifunza mifumo muhimu ya kuweka AI katika uzalishaji kwa kutumia huduma za Microsoft Foundry.

> **Ukaguzi wa toleo (2026-11-04):** Miongozo ya amri za AZD na majina ya usanidi wa mfano yalikaguliwa dhidi ya toleo la `azd` `1.37.2` na usanidi wa moja kwa moja wa mfano ulioambatishwa. Huu ni ukaguzi wa nyaraka, si uthibitisho wa uwekaji wa moja kwa moja. Maabara ya RAG haihitaji ugani wa wakala; kwa tathmini za wakala, tumia ugani tofauti wa `azure.ai.evaluations` na [mchakato wa tathmini wa sasa](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), si amri za tathmini za wakala wa zamani.

**Muda:** Masaa 2-3  
**Ngazi:** Kati  
**Mahitaji:** Uelewa wa msingi wa Azure, ufahamu wa dhana za AI/ML

## 🎓 Malengo ya Kujifunza

Mwishoni mwa warsha hii, utaweza:
- ✅ Kuchunguza kiolezo cha AI cha AZD kilicho tayari na kupanga uongofu wa programu yako mwenyewe
- ✅ Kusanidi huduma za Microsoft Foundry kwa kutumia AZD
- ✅ Kutekeleza usimamizi salama wa vibali kwa huduma za AI
- ✅ Kuweka programu ya rejeleo ya AI na ufuatiliaji
- ✅ Kutatua matatizo ya kawaida ya kuweka AI

## Mahitaji

### Zana Zinazohitajika
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) imewekwa
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) imewekwa
- [Git](https://git-scm.com/) imewekwa
- Mhariri wa msimbo (VS Code inapendekezwa)

Vizuizi hivi vya amri vinatumia sintaksia ya Bash (ikiwemo muendelezo wa mistari na `grep`). Katika Windows, tumia Git Bash/WSL au zitafsiri kwa PowerShell. Pia weka zana za lugha, meneja wa pakiti, na kontena zilizoorodheshwa katika [mpangilio wa mazingira ya ndani wa mfano](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Rasilimali za Azure
- Usajili wa Azure wenye ruhusa za utoaji wa rasilimali na mgawanyo wa majukumu (Mchangiaji pekee hawezi kuunda mgawanyo wa RBAC; tumia msimamizi wa jukumu aliyeidhinishwa au sawa na ilivyo katika nyaraka za mfano)
- Upatikanaji wa huduma za Microsoft Foundry Models (au uwezo wa kuomba upatikanaji)
- Ruhusa za kuunda vikundi vya rasilimali

### Ujuzi wa Awali
- Uelewa wa msingi wa huduma za Azure
- Ufahamu wa interfaces za mstari wa amri
- Dhana za msingi za AI/ML (API, mfano, maelekezo)

## Usanidi wa Maabara

### Hatua 1: Maandalizi ya Mazingira

1. **Hakiki usakinishaji wa zana:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Ikiwa unafanya kazi kwenye wapangaji wengi au usajili wako haupatikani moja kwa moja, jaribu tena kwa `azd auth login --tenant-id <tenant-id>`.

2. **Nakili hifadhi ya warsha:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moduli 1: Kuelewa Muundo wa AZD kwa Programu za AI

### Muundo wa Kiolezo cha AI cha AZD

Chunguza faili kuu katika kiolezo cha AI kilicho tayari cha AZD:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

Mfano uliotekwa unaweza kubadilika; `.azure/` huonekana baada ya kuanzishwa kwa mazingira, si lazima katika nakala safi. Angalia checkout halisi badala ya kuunda folda ambazo hazipo ili kuendana na mchoro huu.

### **Zoefisho la Maabara 1.1: Chunguza Usanidi**

1. **Chunguza faili azure.yaml:**
```bash
cat azure.yaml
```

**Jifunze kuangalia:**
- Maelezo ya huduma za vipengele vya AI
- Ramani za vigezo vya mazingira
- Usanidi wa mwenyeji

2. **Angalia miundo ya main.bicep:**
```bash
cat infra/main.bicep
```

**Mifumo kuu ya AI kutambua:**
- Utoaji wa huduma za Microsoft Foundry Models
- Uunganisho wa Azure AI Search
- Usimamizi salama wa funguo
- Usanidi wa usalama wa mtandao

### **Sehemu ya Majadiliano:** Kwa Nini Mifumo Hii ni Muhimu kwa AI

- **Mategemeo ya Huduma**: Programu za AI mara nyingi zinahitaji huduma nyingi zinazoendana
- **Usalama**: Funguo za API na vituo vinahitaji usimamizi salama
- **Ukuaji**: Mizigo ya AI ina mahitaji maalum ya kuongeza ukubwa
- **Usimamizi wa Gharama**: Huduma za AI zinaweza kuwa ghali kama hazijasanidiwa vyema

## Moduli 2: Weka Programu Yako ya Kwanza ya AI

### Hatua 2.1: Anzisha Mazingira

1. **Unda mazingira mapya ya AZD:**
```bash
azd env new myai-workshop
```

2. **Weka vigezo vinavyohitajika:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Hatua 2.2: Tengeneza Miundombinu na Programu

1. **Tekeleza kwa AZD:**
```bash
azd up
```

**Kinachotokea wakati wa `azd up`:**
- ✅ Hutengeneza huduma za Microsoft Foundry Models
- ✅ Hutengeneza huduma za Azure AI Search
- ✅ Husanidi Azure Container Apps kwa nyuma na mbele iliyochanganywa (chaguo-msingi la mfano huu wa sasa)
- ✅ Husanidi mtandao na usalama
- ✅ Huweka msimbo wa programu
- ✅ Hutengeneza ufuatiliaji na uandikishaji

2. **Fuatilia maendeleo ya uwekaji** na kumbuka rasilimali zinazoundwa.

### Hatua 2.3: Thibitisha Uwekaji Wako

1. **Angalia rasilimali zilizowekwa:**
```bash
azd show
```

2. **Fungua programu iliyowekwa:**
```bash
azd show
```

Fungua kiungo cha wavuti kilichoonyeshwa katika pato la `azd show`.

3. **Jaribu utendaji wa AI:**
   - Tembelea programu ya wavuti
   - Jaribu maswali ya mfano
   - Thibitisha kuwa majibu ya AI yanafanya kazi

### **Zoefisho la Maabara 2.1: Mazoezi ya Kutatua Matatizo**

**Hali:** Uwekaji wako umefanikiwa lakini AI haijajibu.

**Masuala ya kawaida ya kuangalia:**
1. **Uthibitishaji**: Thibitisha utambulisho ulioendeshwa na mgawanyo wa majukumu; angalia funguo za API tu ikiwa uliwawezesha uthibitishaji kwa funguo kwa makusudi
2. **Upatikanaji wa Mfano**: Angalia ikiwa eneo lako linaunga mkono mfano
3. **Muunganisho wa Mtandao**: Hakikisha huduma zinaweza kuwasiliana
4. **Ruhusa za RBAC**: Thibitisha programu inaweza kupata OpenAI

**Amri za utatuzi:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moduli 3: Kubinafsisha Programu za AI Kwa Mahitaji Yako

### Hatua 3.1: Badilisha Usanidi wa AI

1. **Sasisha mfano wa OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Ongeza huduma za ziada za AI:**

Hariri `infra/main.bicep` kuongeza Document Intelligence:

Ifuatayo ni sehemu ya mfano, si kiolezo kamili. Mfano huenda tayari unatoa huduma za usindikaji wa hati: angalia miundombinu yake ya sasa kabla ya kuongeza rasilimali zinazojirudia. Nyongeza za kawaida zinahitaji kuunganishwa kwa matokeo, utambulisho, na usanidi wa programu.

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

### Hatua 3.2: Usanidi Maalum kwa Mazingira

**Mila Bora**: Matofauti ya usanidi kwa maendeleo dhidi ya uzalishaji.

1. **Unda mazingira ya uzalishaji:**
```bash
azd env new myai-production
```

2. **Weka vigezo maalum vya uzalishaji:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Majina haya yanatokana na [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) ya mfano. `azd env set` huhifadhi thamani lakini haifanyi mabadiliko yoyote ya vigezo kuwa na athari moja kwa moja: kiolezo lazima kitumie thamani hiyo. Angalia [mwongozo wa kutengwa kwa mtandao](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) wa mfano kabla ya kuzima upatikanaji wa umma, na tumia `azd up` kufanya mabadiliko ya miundombinu. SKU ya OpenAI `S0` pekee haibaini kasi ya mfano; aina ya uwekaji mfano na uwezo pia ni muhimu.

### **Zoefisho la Maabara 3.1: Uboreshaji wa Gharama**

**Changamoto:** Sanidi kiolezo kwa maendeleo ya gharama nafuu.

**Majukumu:**
1. Chagua mazingira ya warsha yanayoweza kuachwa: `azd env select myai-workshop`.
2. Rekodi SKU ya sasa ya Search na uwezo wa mfano kutoka `infra/main.parameters.json` na mazingira uliochagua.
3. Tumia viingilio vinavyotumiwa hapa chini, baada ya kuthibitisha kifungu/quota cha mfano/eneo:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Thibitisha SKU ya Search na uwezo wa uwekaji katika lango la mtandao na tathmini tofauti na kikokotoo cha bei. Usitarajia data za bili kusasishwa mara moja.

**Vigezo vya mafanikio:** Search inatumia Basic, uwekaji wa mazungumzo una uwezo uliotakiwa, na programu bado hujibu swali la mfano. Uwezo wa `10` ni mgawanyiko wa kiwango cha kasi, si punguzo la bei ya tokeni. Mabadiliko ya tabaka la Search yanaweza kuzingirwa au yanahitaji uundaji upya; usijaribu kwenye rasilimali za uzalishaji. F0 ni maalum kwa huduma na si SKU ya mfano wa Azure OpenAI.

## Moduli 4: Usalama na Mila Bora za Uzalishaji

### Hatua 4.1: Usimamizi Salama wa Vibali

**Changamoto ya sasa:** Programu nyingi za AI zinafungua funguo za API au hutumia hifadhi isiyo salama.

**Suluhisho la AZD:** Utambulisho Udhibitiwa + Muunganiko wa Key Vault.

1. **Kagua usanidi wa usalama katika kiolezo chako:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Thibitisha utambulisho uliodhibitiwa unafanya kazi:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Hatua 4.2: Usalama wa Mtandao

1. **Wezesha vituo binafsi** kwa kutumia usanidi wa mitandao unaoungwa mkono wa mfano (ikiwa bado haijasanidiwa).

Kwa kiolezo chako, kipande hiki cha mfano kinaonyesha muunganisho wa kituo cha OpenAI. Pia kinahitaji VNet, usanidi wa DNS binafsi, na muunganisho wa programu; usibadjike moja kwa moja kwenye mfano, ambao tayari una moduli za vituo binafsi:
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

### Hatua 4.3: Ufuatiliaji na Uwezekano wa Kuangalia

1. **Sanidi Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Wezesha muunganiko wa Application Insights wa mfano:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Kifaa cha mfano hutuma telemetry; usanidi wowote wa `OPENAI_MONITOR_ENABLED` hautoi vipimo vya AI. Kagua alama za simu za mfano, ucheleweshaji, kushindwa, na matumizi ya tokeni, na epuka kurekodi maelekezo au majibu nyeti.

### **Zoefisho la Maabara 4.1: Ukaguzi wa Usalama**

**Jukumu:** Kagua uwekaji wako kwa miongozo bora ya usalama.

**Orodha ya ukaguzi:**
- [ ] Hakuna siri zilizowekwa moja kwa moja kwenye msimbo au usanidi
- [ ] Utambulisho Udhibitiwa umetumika kwa uthibitishaji huduma kwa huduma
- [ ] Key Vault huhifadhi usanidi nyeti
- [ ] Ufikiaji wa mtandao umezuiliwa ipasavyo
- [ ] Ufuatiliaji na uandikishaji vimewezeshwa

## Moduli 5: Kubadilisha Programu Yako ya AI

### Hatua 5.1: Fomu ya Tathmini

**Kabla ya kubadilisha programu yako**, jibu maswali haya:

1. **Usanifu wa Programu:**
   - Huduma gani za AI programu yako inatumia?
   - Rasilimali gani za kompyuta inahitaji?
   - Je, inahitaji hifadhidata?
   - Je, kuna utegemezi kati ya huduma?

2. **Mahitaji ya Usalama:**
   - Ni data gani nyeti inashughulikiwa na programu yako?
   - Je, una mahitaji gani ya kufuata sheria?
   - Je, unahitaji mtandao binafsi?

3. **Mahitaji ya Ukuaji:**
   - Uwezo wa mzigo unaotegemea ni kiasi gani?
   - Je, unahitaji kuongeza ukubwa kiotomatiki?
   - Kuna mahitaji ya kikanda?

### Hatua 5.2: Unda Kiolezo Chako cha AZD

**Fuata mfano huu kubadilisha programu yako:**

**Msingi pekee:** Sehemu hii haipakii chanzo cha API/wavuti, miundombinu ya mwenyeji, uwekaji mifano, utambulisho/RBAC, au `main.parameters.json` iliyokamilika. Kiolezo cha Bicep kilichopangwa kwa kundi la rasilimali kinaonyesha muundo wa moduli; kipengele cha kawaida cha AZD kwa usajili kinapaswa kuunda kundi la rasilimali na kukiita katika eneo hilo. Usitarajia `azd up` kuweka programu kamili baada ya kunakili vipande hivi pekee. Kwa msingi unaoweza kuendeshwa, endelea kutumia kiolezo cha RAG kutoka Moduli 1.

1. **Unda muundo wa msingi:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Zoefisho la Maabara 5.1: Changamoto ya Kuunda Kiolezo**

**Changamoto:** Unda kiolezo cha AZD kwa programu ya usindikaji wa hati inayotumia AI.

**Mahitaji:**
- Microsoft Foundry Models kwa uchambuzi wa maudhui
- Document Intelligence kwa OCR
- Akaunti ya Hifadhi kwa kupakia hati
- Programu ya Kazi kwa mantiki ya usindikaji
- Programu ya wavuti kwa mwonekano wa mtumiaji

**Points za ziada:**
- Ongeza utatuzi sahihi wa makosa
- Jumuisha makadirio ya gharama
- Panda dashibodi za ufuatiliaji

## Moduli 6: Kutatua Matatizo ya Kawaida

### Masuala ya Kawaida ya Uwekaji

#### Tatizo 1: Quota ya Huduma ya OpenAI Imezidiwa
**Dalili:** Uwekaji unashindwa kwa kosa la quota
**Suluhisho:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Tatizo 2: Mfano Haupo Kanda Hiyo
**Dalili:** Majibu ya AI yanashindwa au makosa ya uwekaji mfano
**Suluhisho:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Tatizo 3: Masuala ya Ruhusa
**Dalili:** Makosa ya 403 Kupigwa Marufuku wakati wa kuipigia huduma AI simu
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

### Masuala ya Utendaji

#### Tatizo 4: Majibu Polepole ya AI
**Hatua za uchunguzi:**
1. Angalia Application Insights kwa vipimo vya utendaji
2. Kagua vipimo vya huduma ya OpenAI katika lango la Azure
3. Thibitisha muunganisho wa mtandao na ucheleweshaji

**Suluhisho:**
- Tekeleza caching kwa maswali ya kawaida
- Tumia mfano wa OpenAI unaofaa kwa matumizi yako
- Ongeza nakala za programu tu baada ya kukagua kikomo cha RPM/TPM za mfano; uwekaji wa Azure OpenAI hauwazi kuweka mipangilio ya nakala za database kwa jumla

### **Zoefisho la Maabara 6.1: Changamoto ya Utatuzi wa Makosa**

**Hali:** Uwekaji wako umefanikiwa, lakini programu inarudisha makosa 500.

**Majukumu ya utatuzi:**
1. Angalia rejea za programu
2. Thibitisha muunganisho wa huduma
3. Jaribu uthibitisho
4. Kagua usanidi

**Zana za kutumia:**
- `azd show` kwa muhtasari wa usambazaji
- Portal ya Azure kwa kumbukumbu za huduma kwa undani
- Application Insights kwa telemetri ya programu

## Moduli 7: Ufuatiliaji na Uboreshaji

### Hatua 7.1: Weka Ufuatiliaji Kamili

1. **Tengeneza dashibodi za desturi:**

Nenda kwenye portal ya Azure na tengeneza dashibodi yenye:
- Hesabu na ucheleweshaji wa maombi ya OpenAI
- Mfumuko wa makosa ya programu
- Utumiaji wa rasilimali
- Ufuatiliaji wa gharama

2. **Weka arifa:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Thibitisha kuwa kipengele kinatuma telemetry ya maombi na ongeza kikundi cha vitendo ikiwa arifa zinahitajika. Kipimo ni hesabu, si asilimia ya kushindwa; onyo la kiwango kinahitaji swali linalofaa na mgawanyiko.

### Hatua 7.2: Uboreshaji wa Gharama

1. **Chambua gharama za sasa:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Badilisha vigezo vya tarehe. Msaada wa API ya matumizi hutegemea mkataba wa bili; tumia Usimamizi wa Gharama kwenye portal ikiwa maelezo ya matumizi hayaipatikani. Gharama hushindwa kuonyesha mara moja, si jaribio la wakati halisi.

2. **Tekeleza udhibiti wa gharama:**
- Weka arifa za bajeti
- Tumia sera za upanuaji moja kwa moja (autoscaling)
- Tekeleza cache ya maombi
- Fuata matumizi ya tokeni kwa OpenAI

### **Zöo la Maabara 7.1: Uboreshaji wa Utendaji**

**Kazi**: Boresha programu yako ya AI kwa utendaji na gharama.

**Vipimo vya kuboresha:**
- Punguza wastani wa muda wa majibu kwa 20%
- Punguza gharama za kila mwezi kwa 15%
- Tambua SLO ya upatikanaji wa 99.9% na dirisha la kipimo (maabara fupi haiwezi kuonyesha upatikanaji wa kila mwezi)

**Mikakati ya kujaribu:**
- Tekeleza cache ya majibu
- Boresha maombi kwa ufanisi wa tokeni
- Tumia SKU za kompyuta zinazofaa
- Weka upanuaji wa moja kwa moja unaofaa

## Changamoto ya Mwisho: Utekelezaji Kamili

### Muktadha wa Changamoto

Hii ni **changamoto ya hiari ya usanifu/ubinifu**, si zöo la utekelezaji lililotolewa wala cheti cha uzalishaji. Pendekeza chatbot ya huduma kwa wateja inayotumia AI na andika mahitaji yanayohitaji utekelezaji zaidi na ushahidi:

**Mahitaji ya Kazi:**
- Kiolesura cha wavuti kwa mwingiliano wa mteja
- Muunganisho na Microsoft Foundry Models kwa majibu
- Uwezo wa utafutaji wa hati kwa kutumia Azure AI Search
- Muunganisho na hifadhidata ya wateja iliyopo
- Usaidizi wa lugha nyingi

**Mahitaji yasiyo ya Kazi:**
- Shughulikia watumiaji 1000 kwa wakati mmoja
- SLA ya upatikanaji wa 99.9%
- Uzingatiaji wa SOC 2
- Gharama chini ya $500/mwezi
- Sambaza kwenye mazingira mbalimbali (dev, staging, prod)

Haya ni masharti ya wadau wa mfano, si matokeo yanahakikishwa kwa wakati mmoja. Tambua kiwango cha maombi, ukubwa wa ombi/mazao, na muda wa kikao kabla ya kukadiria gharama; watumiaji 1,000 kwa wakati mmoja si mzigo wala si uthibitisho wa bajeti ya $500. SOC 2 ni matokeo ya ukaguzi wa shirika, si kitufe kinachotumika na kiolezo cha AZD. Tambua mapungufu na kata masharti yasiyowezekana kwa ushahidi.

### Hatua za Utekelezaji

1. **Buni usanifu**
2. **Tunga kiolezo cha AZD**
3. **Tekeleza hatua za usalama**
4. **Weka ufuatiliaji na arifa**
5. **Tengeneza njia za usambazaji**
6. **Andika suluhisho**

### Vigezo vya Tathmini

- ✅ **Uwezo wa Kazi**: Je, uwezo uliotekelezwa unaonyeshwa na mapengo yaliyobaki ni wazi?
- ✅ **Usalama**: Je, mbinu bora zimefanyika?
- ✅ **Upanuzi**: Inaweza kushughulikia mzigo?
- ✅ **Utunzaji**: Je, msimbo na miundombinu vimepangwa vizuri?
- ✅ **Gharama**: Je, inabaki ndani ya bajeti?

## Rasilimali Zaidi

### Nyaraka za Microsoft
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Nyaraka za Huduma za Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Nyaraka za Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Violezo vya Mfano
- [App ya Mazungumzo ya Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Anza Haraka App ya Mazungumzo ya OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Mazungumzo ya Contoso](https://github.com/Azure-Samples/contoso-chat)

### Rasilimali za Jamii
- [Discord ya Microsoft Foundry](https://discord.gg/microsoft-azure)
- [GitHub ya Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Violezo Bora vya AZD](https://azure.github.io/awesome-azd/)

## 🎓 Alama ya Kukamilika

Hongera! Umehitimisha maabara ya warsha ya AI. Sasa unapaswa kuwa na uwezo wa:

- ✅ Eleza jinsi ya kubadilisha programu ya AI iliyo tayari kwa kiolezo cha AZD
- ✅ Sambaza na jaribu mfano wa programu ya AI
- ✅ Tekeleza mbinu bora za usalama kwa mzigo wa AI
- ✅ Fuata na boresha utendaji wa programu ya AI
- ✅ Tatua matatizo ya kawaida ya usambazaji

**Safisha:** Endesha `azd env list`, chagua kila mazingira yanayoweza kufutwa yaliyoundwa katika maabara hii (`myai-workshop`, na ikiwa yamesambazwa `myai-production`/`myai-quota-test`), kisha endesha `azd down` kwenye kila moja. Kagua mpango wa kufuta; kufuta usanidi wa eneo pekee hakufuti rasilimali za Azure. Epuka `--purge` isipokuwa unafahamu kufutwa kwa rasilimali kwa hali ngumu isiyoweza kurekebishwa.

### Hatua Zifuatazo
1. Tumia mifumo hii katika miradi yako ya AI
2. Changia violezo kwa jamii
3. Jiunge na Discord ya Microsoft Foundry kwa msaada endelevu
4. Chunguza mada za hali ya juu kama usambazaji wa mikoa mingi

---

**Maoni ya Warsha**: Tusaidie kuboresha warsha hii kwa kushiriki uzoefu wako kwenye [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Menyu ya Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 2 - Maendeleo ya AI Kwanza
- **⬅️ Iliyopita**: [Usambazaji wa Mfano wa AI](ai-model-deployment.md)
- **➡️ Inayofuata**: [Mbinu Bora za AI katika Uzalishaji](../chapter-08-production/production-ai-practices.md)
- **🚀 Sura Inayofuata**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

**Unahitaji Msaada?** Jiunge na jamii yetu kwa msaada na mijadala kuhusu AZD na usambazaji wa AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->