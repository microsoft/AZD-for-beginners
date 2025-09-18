<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-18T08:48:33+00:00",
  "source_file": "README.md",
  "language_code": "sw"
}
-->
# AZD Kwa Kompyuta: Safari ya Kujifunza Iliyojipanga

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.sw.png) 

## Kuanza na Kozi Hii

Fuata hatua hizi kuanza safari yako ya kujifunza AZD:

1. **Fork Hifadhi**: Bonyeza [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone Hifadhi**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Jiunge na Jamii**: [Jamii za Azure Discord](https://discord.com/invite/ByRwuEEgH4) kwa msaada wa wataalamu
4. **Chagua Njia ya Kujifunza**: Chagua sura hapa chini inayolingana na kiwango chako cha uzoefu

### Msaada wa Lugha Nyingi

#### Tafsiri za Kiotomatiki (Zinasasishwa Kila Wakati)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](./README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## Muhtasari wa Kozi

Jifunze Azure Developer CLI (azd) kupitia sura zilizopangwa kwa ajili ya kujifunza hatua kwa hatua. **Mkazo maalum kwenye kupeleka programu za AI kwa kutumia ujumuishaji wa Azure AI Foundry.**

### Kwa Nini Kozi Hii ni Muhimu kwa Watengenezaji wa Kisasa

Kwa mujibu wa maarifa kutoka jamii ya Azure AI Foundry Discord, **asilimia 45 ya watengenezaji wanataka kutumia AZD kwa kazi za AI** lakini wanakutana na changamoto zifuatazo:
- Miundombinu tata ya huduma nyingi za AI
- Mazoea bora ya kupeleka AI katika uzalishaji  
- Ujumuishaji na usanidi wa huduma za Azure AI
- Uboreshaji wa gharama kwa kazi za AI
- Kutatua matatizo maalum ya kupeleka AI

### Malengo ya Kujifunza

Kwa kukamilisha kozi hii iliyopangwa, utaweza:
- **Kuelewa Misingi ya AZD**: Dhana za msingi, usakinishaji, na usanidi
- **Kupeleka Programu za AI**: Tumia AZD na huduma za Azure AI Foundry
- **Kutumia Miundombinu kama Nambari**: Dhibiti rasilimali za Azure kwa kutumia templeti za Bicep
- **Kutatua Matatizo ya Upelekwaji**: Suluhisha masuala ya kawaida na urekebishe matatizo
- **Kuboresha kwa Uzalishaji**: Usalama, upanuzi, ufuatiliaji, na usimamizi wa gharama
- **Kujenga Suluhisho za Wakala Wengi**: Peleka miundombinu tata ya AI

## 📚 Sura za Kujifunza

*Chagua njia yako ya kujifunza kulingana na kiwango cha uzoefu na malengo*

### 🚀 Sura ya 1: Msingi & Kuanza Haraka
**Mahitaji ya Awali**: Usajili wa Azure, maarifa ya msingi ya mstari wa amri  
**Muda**: Dakika 30-45  
**Ugumu**: ⭐

#### Unachojifunza
- Kuelewa misingi ya Azure Developer CLI
- Kusakinisha AZD kwenye jukwaa lako
- Upelekwaji wako wa kwanza uliofanikiwa

#### Rasilimali za Kujifunza
- **🎯 Anza Hapa**: [Azure Developer CLI ni Nini?](../..)
- **📖 Nadharia**: [Misingi ya AZD](docs/getting-started/azd-basics.md) - Dhana za msingi na istilahi
- **⚙️ Usanidi**: [Usakinishaji & Usanidi](docs/getting-started/installation.md) - Mwongozo maalum wa jukwaa
- **🛠️ Vitendo**: [Mradi Wako wa Kwanza](docs/getting-started/first-project.md) - Mafunzo ya hatua kwa hatua
- **📋 Marejeleo ya Haraka**: [Karatasi ya Amri](resources/cheat-sheet.md)

#### Mazoezi ya Vitendo
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Matokeo ya Sura**: Kupeleka programu rahisi ya wavuti kwenye Azure kwa kutumia AZD

---

### 🤖 Sura ya 2: Maendeleo ya Kwanza ya AI (Inapendekezwa kwa Watengenezaji wa AI)
**Mahitaji ya Awali**: Sura ya 1 imekamilika  
**Muda**: Saa 1-2  
**Ugumu**: ⭐⭐

#### Unachojifunza
- Ujumuishaji wa Azure AI Foundry na AZD
- Kupeleka programu zinazoendeshwa na AI
- Kuelewa usanidi wa huduma za AI

#### Rasilimali za Kujifunza
- **🎯 Anza Hapa**: [Ujumuishaji wa Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Mifumo**: [Upelekwaji wa Mfano wa AI](docs/ai-foundry/ai-model-deployment.md) - Peleka na dhibiti mifano ya AI
- **🛠️ Warsha**: [Maabara ya Warsha ya AI](docs/ai-foundry/ai-workshop-lab.md) - Fanya suluhisho zako za AI ziwe tayari kwa AZD
- **📋 Templeti**: [Templeti za Azure AI Foundry](../..)

#### Mazoezi ya Vitendo
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Matokeo ya Sura**: Kupeleka na kusanidi programu ya mazungumzo inayotumia AI na uwezo wa RAG

---

### ⚙️ Sura ya 3: Usanidi & Uthibitishaji
**Mahitaji ya Awali**: Sura ya 1 imekamilika  
**Muda**: Dakika 45-60  
**Ugumu**: ⭐⭐

#### Unachojifunza
- Usanidi wa mazingira na usimamizi
- Mazoea bora ya uthibitishaji na usalama
- Uwekaji majina wa rasilimali na mpangilio

#### Rasilimali za Kujifunza
- **📖 Usanidi**: [Mwongozo wa Usanidi](docs/getting-started/configuration.md) - Usanidi wa mazingira
- **🔐 Usalama**: Mifumo ya uthibitishaji na utambulisho uliosimamiwa
- **📝 Mifano**: [Mfano wa Programu ya Hifadhidata](../../examples/database-app) - Mifumo ya usanidi

#### Mazoezi ya Vitendo
- Sanidi mazingira mengi (maendeleo, majaribio, uzalishaji)
- Sanidi uthibitishaji wa utambulisho uliosimamiwa
- Tekeleza usanidi maalum wa mazingira

**💡 Matokeo ya Sura**: Kusimamia mazingira mengi kwa uthibitishaji na usalama sahihi

---

### 🏗️ Sura ya 4: Miundombinu kama Nambari & Upelekwaji
**Mahitaji ya Awali**: Sura ya 1-3 imekamilika  
**Muda**: Saa 1-1.5  
**Ugumu**: ⭐⭐⭐

#### Unachojifunza
- Mifumo ya upelekwaji wa hali ya juu
- Miundombinu kama Nambari kwa kutumia Bicep
- Mikakati ya utoaji wa rasilimali

#### Rasilimali za Kujifunza
- **📖 Upelekwaji**: [Mwongozo wa Upelekwaji](docs/deployment/deployment-guide.md) - Mifumo kamili
- **🏗️ Utoaji**: [Utoaji wa Rasilimali](docs/deployment/provisioning.md) - Usimamizi wa rasilimali za Azure
- **📝 Mifano**: [Mfano wa Programu ya Kontena](../../examples/container-app) - Upelekwaji wa programu zilizowekwa kwenye kontena

#### Mazoezi ya Vitendo
- Unda templeti za Bicep maalum
- Peleka programu za huduma nyingi
- Tekeleza mikakati ya upelekwaji wa blue-green

**💡 Matokeo ya Sura**: Kupeleka programu tata za huduma nyingi kwa kutumia templeti za miundombinu maalum

---

### 🎯 Sura ya 5: Suluhisho za AI za Wakala Wengi (Juu)
**Mahitaji ya Awali**: Sura ya 1-2 imekamilika  
**Muda**: Saa 2-3  
**Ugumu**: ⭐⭐⭐⭐

#### Unachojifunza
- Mifumo ya usanifu wa wakala wengi
- Uratibu na usimamizi wa wakala
- Upelekwaji wa AI tayari kwa uzalishaji

#### Rasilimali za Kujifunza
- **🤖 Mradi Maarufu**: [Suluhisho la Wakala Wengi la Rejareja](examples/retail-scenario.md) - Utekelezaji kamili
- **🛠️ Templeti za ARM**: [Pakiti ya Templeti za ARM](../../examples/retail-multiagent-arm-template) - Upelekwaji wa bonyeza moja
- **📖 Usanifu**: Mifumo ya uratibu wa wakala wengi

#### Mazoezi ya Vitendo
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Matokeo ya Sura**: Kupeleka na kusimamia suluhisho la AI tayari kwa uzalishaji lenye wakala wa Wateja na Hifadhi

---

### 🔍 Sura ya 6: Uthibitishaji Kabla ya Upelekwaji & Mipango
**Mahitaji ya Awali**: Sura ya 4 imekamilika  
**Muda**: Saa 1  
**Ugumu**: ⭐⭐

#### Unachojifunza
- Mipango ya uwezo na uthibitishaji wa rasilimali
- Mikakati ya kuchagua SKU
- Ukaguzi wa awali na otomatiki

#### Rasilimali za Kujifunza
- **📊 Mipango**: [Mipango ya Uwezo](docs/pre-deployment/capacity-planning.md) - Uthibitishaji wa rasilimali
- **💰 Uchaguzi**: [Uchaguzi wa SKU](docs/pre-deployment/sku-selection.md) - Chaguo za gharama nafuu
- **✅ Uthibitishaji**: [Ukaguzi wa Awali](docs/pre-deployment/preflight-checks.md) - Hati za otomatiki

#### Mazoezi ya Vitendo
- Endesha hati za uthibitishaji wa uwezo
- Boresha uchaguzi wa SKU kwa gharama
- Tekeleza ukaguzi wa awali wa upelekwaji otomatiki

**💡 Matokeo ya Sura**: Thibitisha na boresha upelekwaji kabla ya utekelezaji

---

### 🚨 Sura ya 7: Kutatua Matatizo & Kurekebisha
**Mahitaji ya Awali**: Sura yoyote ya upelekwaji imekamilika  
**Muda**: Saa 1-1.5  
**Ugumu**: ⭐⭐

#### Unachojifunza
- Mbinu za kurekebisha matatizo kwa utaratibu
- Masuala ya kawaida na suluhisho
- Kutatua matatizo maalum ya AI

#### Rasilimali za Kujifunza
- **🔧 Masuala ya Kawaida**: [Masuala ya Kawaida](docs/troubleshooting/common-issues.md) - Maswali yanayoulizwa mara kwa mara na suluhisho
- **🕵️ Kurekebisha**: [Mwongozo wa Kurekebisha](docs/troubleshooting/debugging.md) - Mikakati ya hatua kwa hatua
- **🤖 Masuala ya AI**: [Kutatua Matatizo ya AI](docs/troubleshooting/ai-troubleshooting.md) - Matatizo ya huduma za AI

#### Mazoezi ya Vitendo
- Tambua matatizo ya upelekwaji
- Suluhisha masuala ya uthibitishaji
- Rekebisha muunganisho wa huduma za AI

**💡 Matokeo ya Sura**: Kutambua na kutatua matatizo ya kawaida ya upelekwaji kwa kujitegemea

---

### 🏢 Sura ya 8: Mifumo ya Uzalishaji & Biashara
**Mahitaji ya Awali**: Sura ya 1-4 imekamilika  
**Muda**: Saa 2-3  
**Ugumu**: ⭐⭐⭐⭐

#### Unachojifunza
- Mikakati ya upelekwaji wa uzalishaji
- Mifumo ya usalama wa biashara
- Ufuatiliaji na uboreshaji wa gharama

#### Rasilimali za Kujifunza
- **🏭 Uzalishaji**: [Mazoea Bora ya AI ya Uzalishaji](docs/ai-foundry/production-ai-practices.md) - Mifumo ya biashara
- **📝 Mifano**: [Mfano wa Huduma Ndogo](../../examples/microservices) - Miundombinu tata
- **📊 Ufuatiliaji**: Muunganisho wa Application Insights

#### Mazoezi ya Vitendo
- Tekeleza mifumo ya usalama ya biashara
- Sanidi ufuatiliaji wa kina
- Peleka kwenye uzalishaji kwa utawala sahihi

**💡 Matokeo ya Sura**: Peleka programu zilizo tayari kwa biashara zenye uwezo kamili wa uzalishaji

---

## 📖 Azure Developer CLI ni nini?

Azure Developer CLI (azd) ni kiolesura cha mstari wa amri kinacholenga watengenezaji ambacho huharakisha mchakato wa kujenga na kupeleka programu kwenye Azure. Inatoa:

- **Upelekaji wa msingi wa templeti** - Tumia templeti zilizojengwa awali kwa mifumo ya kawaida ya programu
- **Miundombinu kama Nambari** - Dhibiti rasilimali za Azure ukitumia Bicep au Terraform  
- **Mtiririko wa kazi uliounganishwa** - Sanidi, peleka, na fuatilia programu bila usumbufu
- **Rafiki kwa watengenezaji** - Imeboreshwa kwa tija na uzoefu wa watengenezaji

### **AZD + Azure AI Foundry: Bora kwa Upelekaji wa AI**

**Kwa nini AZD kwa Suluhisho za AI?** AZD hushughulikia changamoto kuu zinazowakumba watengenezaji wa AI:

- **Templeti Tayari kwa AI** - Templeti zilizosanidiwa awali kwa Azure OpenAI, Huduma za Utambuzi, na mzigo wa kazi wa ML
- **Upelekaji Salama wa AI** - Mifumo ya usalama iliyojengwa ndani kwa huduma za AI, funguo za API, na sehemu za mwisho za modeli  
- **Mifumo ya AI ya Uzalishaji** - Mbinu bora kwa upelekaji wa programu za AI zinazoweza kupanuka na za gharama nafuu
- **Mtiririko wa Kazi wa AI wa Mwisho hadi Mwisho** - Kuanzia ukuzaji wa modeli hadi upelekaji wa uzalishaji na ufuatiliaji sahihi
- **Uboreshaji wa Gharama** - Mikakati ya ugawaji wa rasilimali na upanuzi wa mzigo wa kazi wa AI
- **Muunganisho wa Azure AI Foundry** - Muunganisho usio na mshono na katalogi ya modeli ya AI Foundry na sehemu za mwisho

---

## 🎯 Maktaba ya Templeti na Mifano

### Iliyopendekezwa: Templeti za Azure AI Foundry
**Anza hapa ikiwa unapeleka programu za AI!**

| Templeti | Sura | Ugumu | Huduma |
|----------|---------|------------|----------|
| [**Anza na mazungumzo ya AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Sura ya 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Anza na mawakala wa AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Sura ya 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Automatiki ya mtiririko wa kazi wa mawakala wengi**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Sura ya 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Tengeneza hati kutoka kwa data yako**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Sura ya 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Boresha mikutano ya wateja kwa mawakala**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Sura ya 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Boresha msimbo wako kwa mawakala**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Sura ya 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Jenga wakala wako wa mazungumzo**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Sura ya 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Fungua maarifa kutoka kwa data ya mazungumzo**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Sura ya 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Usindikaji wa maudhui ya njia nyingi**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Sura ya 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Iliyopendekezwa: Templeti Kamili za Kujifunza
**Templeti za programu zilizo tayari kwa uzalishaji zilizopangwa kwa sura za kujifunza**

| Templeti | Sura ya Kujifunza | Ugumu | Kujifunza Muhimu |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Sura ya 2 | ⭐ | Mifumo ya msingi ya upelekaji wa AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Sura ya 2 | ⭐⭐ | Utekelezaji wa RAG na Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Sura ya 4 | ⭐⭐ | Muunganisho wa Akili ya Nyaraka |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Sura ya 5 | ⭐⭐⭐ | Mfumo wa wakala na kupiga kazi |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Sura ya 8 | ⭐⭐⭐ | Uratibu wa AI wa biashara |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Sura ya 5 | ⭐⭐⭐⭐ | Usanifu wa mawakala wengi na Mawakala wa Wateja na Hifadhi |

### Kujifunza kwa Aina ya Mfano

#### Programu Rahisi (Sura ya 1-2)
- [Programu Rahisi ya Wavuti](../../examples/simple-web-app) - Mifumo ya msingi ya upelekaji
- [Tovuti ya Kawaida](../../examples/static-site) - Upelekaji wa maudhui ya tuli
- [API ya Msingi](../../examples/basic-api) - Upelekaji wa REST API

#### Muunganisho wa Hifadhidata (Sura ya 3-4)  
- [Programu ya Hifadhidata](../../examples/database-app) - Mifumo ya muunganisho wa hifadhidata
- [Usindikaji wa Data](../../examples/data-processing) - Upelekaji wa mtiririko wa kazi wa ETL

#### Mifumo ya Juu (Sura ya 4-8)
- [Programu za Kontena](../../examples/container-app) - Upelekaji wa kontena
- [Huduma Ndogo](../../examples/microservices) - Usanifu wa huduma nyingi  
- [Suluhisho za Biashara](../../examples/enterprise) - Mifumo ya tayari kwa uzalishaji

### Mkusanyiko wa Templeti za Nje
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - Sampuli rasmi za Microsoft
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Templeti zilizochangiwa na jamii
- [**Maktaba ya Mifano**](examples/README.md) - Mifano ya kujifunza ya ndani yenye maelezo ya kina

---

## 📚 Rasilimali za Kujifunza na Marejeleo

### Marejeleo ya Haraka
- [**Karatasi ya Amri**](resources/cheat-sheet.md) - Amri muhimu za azd zilizopangwa kwa sura
- [**Kamusi**](resources/glossary.md) - Istilahi za Azure na azd  
- [**Maswali Yanayoulizwa Mara kwa Mara**](resources/faq.md) - Maswali ya kawaida yaliyopangwa kwa sura ya kujifunza
- [**Mwongozo wa Kujifunza**](resources/study-guide.md) - Mazoezi ya vitendo ya kina

### Warsha za Vitendo
- [**Maabara ya Warsha ya AI**](docs/ai-foundry/ai-workshop-lab.md) - Fanya suluhisho zako za AI ziweze kupelekwa na AZD
- [**Warsha ya AZD kwa Kompyuta**](workshop/README.md) - Vifaa kamili vya warsha ya vitendo

### Rasilimali za Kujifunza za Nje
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Kituo cha Usanifu wa Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kikokotoo cha Bei cha Azure](https://azure.microsoft.com/pricing/calculator/)
- [Hali ya Azure](https://status.azure.com/)

---

## 🎓 Kukamilisha Kozi na Vyeti

### Ufuatiliaji wa Maendeleo
Fuatilia maendeleo yako ya kujifunza kupitia kila sura:

- [ ] **Sura ya 1**: Msingi na Kuanza Haraka ✅
- [ ] **Sura ya 2**: Ukuzaji wa Kwanza wa AI ✅  
- [ ] **Sura ya 3**: Usanidi na Uthibitishaji ✅
- [ ] **Sura ya 4**: Miundombinu kama Nambari na Upelekaji ✅
- [ ] **Sura ya 5**: Suluhisho za AI za Mawakala Wengi ✅
- [ ] **Sura ya 6**: Uthibitishaji wa Kabla ya Upelekaji na Mipango ✅
- [ ] **Sura ya 7**: Utatuzi wa Hitilafu na Urekebishaji ✅
- [ ] **Sura ya 8**: Mifumo ya Uzalishaji na Biashara ✅

### Uthibitishaji wa Kujifunza
Baada ya kukamilisha kila sura, thibitisha maarifa yako kwa:
1. **Zoezi la Vitendo**: Kamilisha upelekaji wa vitendo wa sura
2. **Ukaguzi wa Maarifa**: Pitia sehemu ya Maswali Yanayoulizwa Mara kwa Mara ya sura yako
3. **Majadiliano ya Jamii**: Shiriki uzoefu wako kwenye Discord ya Azure
4. **Sura Inayofuata**: Endelea kwa kiwango kinachofuata cha ugumu

### Faida za Kukamilisha Kozi
Baada ya kukamilisha sura zote, utakuwa na:
- **Uzoefu wa Uzalishaji**: Umepeleka programu halisi za AI kwenye Azure
- **Ujuzi wa Kitaalamu**: Uwezo wa upelekaji wa biashara  
- **Kutambulika kwa Jamii**: Mwanachama hai wa jamii ya watengenezaji wa Azure
- **Maendeleo ya Kazi**: Utaalamu wa AZD na upelekaji wa AI unaohitajika

---

## 🤝 Jamii na Usaidizi

### Pata Msaada na Usaidizi
- **Masuala ya Kiufundi**: [Ripoti hitilafu na omba vipengele](https://github.com/microsoft/azd-for-beginners/issues)
- **Maswali ya Kujifunza**: [Jamii ya Discord ya Microsoft Azure](https://discord.gg/microsoft-azure)
- **Msaada Maalum wa AI**: Jiunge na [#Azure channel](https://discord.gg/microsoft-azure) kwa majadiliano ya AZD + AI Foundry
- **Nyaraka**: [Nyaraka rasmi za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Maarifa ya Jamii kutoka Discord ya Azure AI Foundry

**Matokeo ya Kura ya Hivi Karibuni kutoka #Azure Channel:**
- **45%** ya watengenezaji wanataka kutumia AZD kwa mzigo wa kazi wa AI
- **Changamoto kuu**: Upelekaji wa huduma nyingi, usimamizi wa hati za kuingia, utayari wa uzalishaji  
- **Inayohitajika zaidi**: Templeti maalum za AI, miongozo ya utatuzi wa hitilafu, mbinu bora

**Jiunge na jamii yetu ili:**
- Shiriki uzoefu wako wa AZD + AI na upate msaada
- Pata hakikisho la mapema la templeti mpya za AI
- Changia mbinu bora za upelekaji wa AI
- Kuathiri maendeleo ya vipengele vya baadaye vya AI + AZD

### Kuchangia Kozi
Tunakaribisha michango! Tafadhali soma [Mwongozo wa Kuchangia](CONTRIBUTING.md) kwa maelezo kuhusu:
- **Uboreshaji wa Maudhui**: Boresha sura na mifano iliyopo
- **Mifano Mpya**: Ongeza mifano halisi ya ulimwengu na templeti  
- **Tafsiri**: Saidia kudumisha msaada wa lugha nyingi
- **Ripoti za Hitilafu**: Boresha usahihi na uwazi
- **Viwango vya Jamii**: Fuata miongozo yetu ya jamii jumuishi

---

## 📄 Taarifa za Kozi

### Leseni
Mradi huu umepewa leseni chini ya Leseni ya MIT - angalia faili ya [LICENSE](../../LICENSE) kwa maelezo.

### Rasilimali za Kujifunza za Microsoft Zinazohusiana

Timu yetu inazalisha kozi zingine za kujifunza za kina:

- [**MPYA** Itifaki ya Muktadha wa Modeli (MCP) Kwa Kompyuta](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Mawakala wa AI kwa Kompyuta](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Jenereta kwa Kompyuta ukitumia .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [AI Jenereta kwa Kompyuta](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Jenereta kwa Kompyuta ukitumia Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML kwa Kompyuta](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Sayansi ya Data kwa Kompyuta](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI kwa Kompyuta](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Usalama wa Mtandao kwa Kompyuta](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web Dev kwa Kompyuta](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT kwa Kompyuta](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [Maendeleo ya XR kwa Kompyuta](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Kumiliki GitHub Copilot kwa Uandishi wa Programu wa AI](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Kumiliki GitHub Copilot kwa Watengenezaji wa C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Chagua Safari Yako ya Copilot](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ Uelekezaji wa Kozi

**🚀 Tayari Kuanza Kujifunza?**

**Kompyuta**: Anza na [Sura ya 1: Msingi na Kuanza Haraka](../..)  
**Watengenezaji wa AI**: Ruka hadi [Sura ya 2: Ukuzaji wa Kwanza wa AI](../..)
**Wataalamu Wenye Uzoefu**: Anza na [Sura ya 3: Usanidi & Uthibitishaji](../..)

**Hatua Zifuatazo**: [Anza Sura ya 1 - Misingi ya AZD](docs/getting-started/azd-basics.md) →

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya kutafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutokuelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.