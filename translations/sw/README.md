<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b2e94dc30cab0675918a6ad34863b05d",
  "translation_date": "2025-11-23T09:27:15+00:00",
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

#### Tafsiri za Kiotomatiki (Zinazosasishwa Kila Wakati)

[Swahili](./README.md)

## Muhtasari wa Kozi

Jifunze Azure Developer CLI (azd) kupitia sura zilizopangwa kwa kujifunza hatua kwa hatua. **Mkazo maalum kwenye kupeleka programu za AI kwa ushirikiano na Microsoft Foundry.**

### Kwa Nini Kozi Hii ni Muhimu kwa Watengenezaji wa Kisasa

Kwa mujibu wa maarifa ya jamii ya Microsoft Foundry Discord, **45% ya watengenezaji wanataka kutumia AZD kwa kazi za AI** lakini wanakutana na changamoto zifuatazo:
- Miundombinu ya AI yenye huduma nyingi
- Mazoea bora ya kupeleka AI katika uzalishaji  
- Ushirikiano na usanidi wa huduma za Azure AI
- Uboreshaji wa gharama kwa kazi za AI
- Kutatua matatizo maalum ya kupeleka AI

### Malengo ya Kujifunza

Kwa kukamilisha kozi hii iliyopangwa, utaweza:
- **Kuelewa Misingi ya AZD**: Dhana za msingi, usakinishaji, na usanidi
- **Kupeleka Programu za AI**: Tumia AZD na huduma za Microsoft Foundry
- **Kutumia Miundombinu kama Nambari**: Simamia rasilimali za Azure kwa kutumia templeti za Bicep
- **Kutatua Matatizo ya Utekelezaji**: Suluhisha masuala ya kawaida na urekebishe matatizo
- **Kuboresha kwa Uzalishaji**: Usalama, upanuzi, ufuatiliaji, na usimamizi wa gharama
- **Kujenga Suluhisho za Wakala Wengi**: Peleka miundombinu ya AI yenye huduma nyingi

## 📚 Sura za Kujifunza

*Chagua njia yako ya kujifunza kulingana na kiwango cha uzoefu na malengo*

### 🚀 Sura ya 1: Msingi & Kuanza Haraka
**Mahitaji ya Awali**: Usajili wa Azure, maarifa ya msingi ya mstari wa amri  
**Muda**: Dakika 30-45  
**Ugumu**: ⭐

#### Unachojifunza
- Kuelewa misingi ya Azure Developer CLI
- Kusakinisha AZD kwenye jukwaa lako
- Utekelezaji wako wa kwanza uliofanikiwa

#### Rasilimali za Kujifunza
- **🎯 Anza Hapa**: [Azure Developer CLI ni nini?](../..)
- **📖 Nadharia**: [Misingi ya AZD](docs/getting-started/azd-basics.md) - Dhana za msingi na istilahi
- **⚙️ Usakinishaji**: [Usakinishaji & Usanidi](docs/getting-started/installation.md) - Mwongozo maalum wa jukwaa
- **🛠️ Vitendo**: [Mradi Wako wa Kwanza](docs/getting-started/first-project.md) - Mafunzo ya hatua kwa hatua
- **📋 Marejeleo ya Haraka**: [Karatasi ya Amri](resources/cheat-sheet.md)

#### Mazoezi ya Vitendo
```bash
# Ukaguzi wa haraka wa usakinishaji
azd version

# Peleka programu yako ya kwanza
azd init --template todo-nodejs-mongo
azd up
```

**💡 Matokeo ya Sura**: Kupeleka programu rahisi ya wavuti kwenye Azure kwa kutumia AZD

**✅ Uthibitisho wa Mafanikio:**
```bash
# Baada ya kumaliza Sura ya 1, unapaswa kuwa na uwezo wa:
azd version              # Inaonyesha toleo lililowekwa
azd init --template todo-nodejs-mongo  # Inaanzisha mradi
azd up                  # Inapeleka kwenye Azure
azd show                # Inaonyesha URL ya programu inayotumika
# Programu inafunguka kwenye kivinjari na inafanya kazi
azd down --force --purge  # Inasafisha rasilimali
```

**📊 Uwekezaji wa Muda:** Dakika 30-45  
**📈 Kiwango cha Ujuzi Baada ya Hapo:** Unaweza kupeleka programu za msingi kwa uhuru

---

### 🤖 Sura ya 2: Maendeleo ya AI Kwanza (Inapendekezwa kwa Watengenezaji wa AI)
**Mahitaji ya Awali**: Sura ya 1 imekamilika  
**Muda**: Saa 1-2  
**Ugumu**: ⭐⭐

#### Unachojifunza
- Ushirikiano wa Microsoft Foundry na AZD
- Kupeleka programu zinazoendeshwa na AI
- Kuelewa usanidi wa huduma za AI

#### Rasilimali za Kujifunza
- **🎯 Anza Hapa**: [Ushirikiano wa Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Mifumo**: [Utekelezaji wa Modeli za AI](docs/microsoft-foundry/ai-model-deployment.md) - Peleka na simamia modeli za AI
- **🛠️ Warsha**: [Maabara ya Warsha ya AI](docs/microsoft-foundry/ai-workshop-lab.md) - Fanya suluhisho zako za AI ziwe tayari kwa AZD
- **🎥 Mwongozo wa Kuingiliana**: [Vifaa vya Warsha](workshop/README.md) - Kujifunza kupitia kivinjari na Mazingira ya DevContainer
- **📋 Templeti**: [Templeti za Microsoft Foundry](../..)
- **📝 Mifano**: [Mifano ya Utekelezaji wa AZD](examples/README.md)

#### Mazoezi ya Vitendo
```bash
# Peleka programu yako ya kwanza ya AI
azd init --template azure-search-openai-demo
azd up

# Jaribu templeti za ziada za AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Matokeo ya Sura**: Kupeleka na kusanidi programu ya mazungumzo inayotumia AI na uwezo wa RAG

**✅ Uthibitisho wa Mafanikio:**
```bash
# Baada ya Sura ya 2, unapaswa kuwa na uwezo wa:
azd init --template azure-search-openai-demo
azd up
# Jaribu kiolesura cha mazungumzo ya AI
# Uliza maswali na upate majibu yanayotokana na AI pamoja na vyanzo
# Hakikisha ujumuishaji wa utafutaji unafanya kazi
azd monitor  # Angalia Application Insights inaonyesha telemetry
azd down --force --purge
```

**📊 Uwekezaji wa Muda:** Saa 1-2  
**📈 Kiwango cha Ujuzi Baada ya Hapo:** Unaweza kupeleka na kusanidi programu za AI tayari kwa uzalishaji  
**💰 Uelewa wa Gharama:** Elewa gharama za $80-150/mwezi kwa maendeleo, $300-3500/mwezi kwa uzalishaji

#### 💰 Mawazo ya Gharama kwa Utekelezaji wa AI

**Mazingira ya Maendeleo (Makadirio $80-150/mwezi):**
- Azure OpenAI (Lipa kadri unavyotumia): $0-50/mwezi (kulingana na matumizi ya tokeni)
- AI Search (Kiwango cha Msingi): $75/mwezi
- Programu za Kontena (Matumizi): $0-20/mwezi
- Hifadhi (Kawaida): $1-5/mwezi

**Mazingira ya Uzalishaji (Makadirio $300-3,500+/mwezi):**
- Azure OpenAI (PTU kwa utendaji thabiti): $3,000+/mwezi AU Lipa kadri unavyotumia kwa kiasi kikubwa
- AI Search (Kiwango cha Kawaida): $250/mwezi
- Programu za Kontena (Zilizojitolea): $50-100/mwezi
- Ufuatiliaji wa Programu: $5-50/mwezi
- Hifadhi (Premium): $10-50/mwezi

**💡 Vidokezo vya Uboreshaji wa Gharama:**
- Tumia **Kiwango cha Bure** cha Azure OpenAI kwa kujifunza (50,000 tokeni/mwezi zinajumuishwa)
- Endesha `azd down` kuondoa rasilimali wakati hauendelezi kikamilifu
- Anza na bili inayotegemea matumizi, boresha hadi PTU tu kwa uzalishaji
- Tumia `azd provision --preview` kukadiria gharama kabla ya utekelezaji
- Washa upanuzi wa kiotomatiki: lipa tu kwa matumizi halisi

**Ufuatiliaji wa Gharama:**
```bash
# Angalia gharama za kila mwezi zinazokadiriwa
azd provision --preview

# Fuatilia gharama halisi katika Azure Portal
az consumption budget list --resource-group <your-rg>
```

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
- **🔐 Usalama**: [Mifumo ya uthibitishaji na utambulisho uliosimamiwa](docs/getting-started/authsecurity.md) - Mifumo ya uthibitishaji
- **📝 Mifano**: [Mfano wa Programu ya Hifadhidata](examples/database-app/README.md) - Mifano ya Hifadhidata ya AZD

#### Mazoezi ya Vitendo
- Sanidi mazingira mengi (maendeleo, majaribio, uzalishaji)
- Sanidi uthibitishaji wa utambulisho uliosimamiwa
- Tekeleza usanidi maalum wa mazingira

**💡 Matokeo ya Sura**: Simamia mazingira mengi kwa uthibitishaji na usalama sahihi

---

### 🏗️ Sura ya 4: Miundombinu kama Nambari & Utekelezaji
**Mahitaji ya Awali**: Sura ya 1-3 imekamilika  
**Muda**: Saa 1-1.5  
**Ugumu**: ⭐⭐⭐

#### Unachojifunza
- Mifumo ya utekelezaji ya hali ya juu
- Miundombinu kama Nambari kwa kutumia Bicep
- Mikakati ya utoaji wa rasilimali

#### Rasilimali za Kujifunza
- **📖 Utekelezaji**: [Mwongozo wa Utekelezaji](docs/deployment/deployment-guide.md) - Mifumo kamili
- **🏗️ Utoaji**: [Utoaji wa Rasilimali](docs/deployment/provisioning.md) - Usimamizi wa rasilimali za Azure
- **📝 Mifano**: [Mfano wa Programu ya Kontena](../../examples/container-app) - Utekelezaji wa programu zilizowekwa kwenye kontena

#### Mazoezi ya Vitendo
- Unda templeti za Bicep maalum
- Peleka programu zenye huduma nyingi
- Tekeleza mikakati ya utoaji wa rasilimali ya blue-green

**💡 Matokeo ya Sura**: Peleka programu zenye huduma nyingi kwa kutumia templeti za miundombinu maalum

---

### 🎯 Sura ya 5: Suluhisho za AI za Wakala Wengi (Juu)
**Mahitaji ya Awali**: Sura ya 1-2 imekamilika  
**Muda**: Saa 2-3  
**Ugumu**: ⭐⭐⭐⭐

#### Unachojifunza
- Mifumo ya usanifu wa wakala wengi
- Uratibu na usimamizi wa wakala
- Utekelezaji wa AI tayari kwa uzalishaji

#### Rasilimali za Kujifunza
- **🤖 Mradi Maarufu**: [Suluhisho la Wakala Wengi wa Rejareja](examples/retail-scenario.md) - Utekelezaji kamili
- **🛠️ Templeti za ARM**: [Pakiti ya Templeti za ARM](../../examples/retail-multiagent-arm-template) - Utekelezaji wa kubofya mara moja
- **📖 Usanifu**: [Mifumo ya uratibu wa wakala wengi](/docs/pre-deployment/coordination-patterns.md) - Mifumo

#### Mazoezi ya Vitendo
```bash
# Peleka suluhisho kamili la mawakala wengi wa rejareja
cd examples/retail-multiagent-arm-template
./deploy.sh

# Chunguza usanidi wa mawakala
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Matokeo ya Sura**: Kusambaza na kusimamia suluhisho la AI lenye mawakala wengi tayari kwa uzalishaji na Mawakala wa Wateja na Hifadhi

---

### 🔍 Sura ya 6: Uthibitishaji Kabla ya Kusambaza & Mipango
**Mahitaji ya awali**: Sura ya 4 imekamilika  
**Muda**: Saa 1  
**Ugumu**: ⭐⭐

#### Unachojifunza
- Mipango ya uwezo na uthibitishaji wa rasilimali
- Mikakati ya kuchagua SKU
- Ukaguzi wa awali na otomatiki

#### Rasilimali za Kujifunza
- **📊 Mipango**: [Mipango ya Uwezo](docs/pre-deployment/capacity-planning.md) - Uthibitishaji wa rasilimali
- **💰 Uchaguzi**: [Uchaguzi wa SKU](docs/pre-deployment/sku-selection.md) - Chaguo za gharama nafuu
- **✅ Uthibitishaji**: [Ukaguzi wa Awali](docs/pre-deployment/preflight-checks.md) - Script za otomatiki

#### Mazoezi ya Vitendo
- Endesha script za uthibitishaji wa uwezo
- Boresha uchaguzi wa SKU kwa gharama
- Tekeleza ukaguzi wa otomatiki kabla ya kusambaza

**💡 Matokeo ya Sura**: Thibitisha na boresha usambazaji kabla ya utekelezaji

---

### 🚨 Sura ya 7: Kutatua Matatizo & Kurekebisha
**Mahitaji ya awali**: Sura yoyote ya usambazaji imekamilika  
**Muda**: Saa 1-1.5  
**Ugumu**: ⭐⭐

#### Unachojifunza
- Mbinu za kurekebisha matatizo kwa utaratibu
- Masuala ya kawaida na suluhisho
- Kutatua matatizo maalum ya AI

#### Rasilimali za Kujifunza
- **🔧 Masuala ya Kawaida**: [Masuala ya Kawaida](docs/troubleshooting/common-issues.md) - Maswali na majibu
- **🕵️ Kurekebisha**: [Mwongozo wa Kurekebisha](docs/troubleshooting/debugging.md) - Mikakati ya hatua kwa hatua
- **🤖 Masuala ya AI**: [Kutatua Matatizo ya AI](docs/troubleshooting/ai-troubleshooting.md) - Matatizo ya huduma za AI

#### Mazoezi ya Vitendo
- Tambua matatizo ya usambazaji
- Suluhisha masuala ya uthibitishaji
- Rekebisha muunganisho wa huduma za AI

**💡 Matokeo ya Sura**: Tambua na suluhisha matatizo ya kawaida ya usambazaji kwa kujitegemea

---

### 🏢 Sura ya 8: Mifumo ya Uzalishaji & Biashara
**Mahitaji ya awali**: Sura ya 1-4 imekamilika  
**Muda**: Saa 2-3  
**Ugumu**: ⭐⭐⭐⭐

#### Unachojifunza
- Mikakati ya usambazaji wa uzalishaji
- Mifumo ya usalama wa biashara
- Ufuatiliaji na uboreshaji wa gharama

#### Rasilimali za Kujifunza
- **🏭 Uzalishaji**: [Mazoezi Bora ya AI ya Uzalishaji](docs/microsoft-foundry/production-ai-practices.md) - Mifumo ya biashara
- **📝 Mifano**: [Mfano wa Huduma Ndogo](../../examples/microservices) - Miundombinu changamani
- **📊 Ufuatiliaji**: [Ujumuishaji wa Application Insights](docs/pre-deployment/application-insights.md) - Ufuatiliaji

#### Mazoezi ya Vitendo
- Tekeleza mifumo ya usalama wa biashara
- Sanidi ufuatiliaji wa kina
- Sambaza kwa uzalishaji kwa usimamizi sahihi

**💡 Matokeo ya Sura**: Sambaza programu tayari kwa biashara na uwezo kamili wa uzalishaji

---

## 🎓 Muhtasari wa Warsha: Uzoefu wa Kujifunza kwa Vitendo

> **⚠️ HALI YA WARSHA: Maendeleo Yanayoendelea**  
> Vifaa vya warsha vinaendelea kutengenezwa na kuboreshwa. Moduli za msingi zinafanya kazi, lakini sehemu za juu bado hazijakamilika. Tunafanya kazi kwa bidii kukamilisha maudhui yote. [Fuatilia maendeleo →](workshop/README.md)

### Vifaa vya Warsha vya Kuingiliana
**Uzoefu wa kujifunza wa vitendo na zana za kivinjari na mazoezi yanayoongozwa**

Vifaa vyetu vya warsha vinatoa uzoefu wa kujifunza ulio na muundo, unaoingiliana ambao unakamilisha mtaala wa msingi wa sura ulio hapo juu. Warsha imeundwa kwa kujifunza kwa kasi yako mwenyewe na vipindi vinavyoongozwa na waalimu.

#### 🛠️ Vipengele vya Warsha
- **Kiolesura cha Kivinjari**: Warsha inayotumia MkDocs yenye utafutaji, nakala, na vipengele vya mandhari
- **Ujumuishaji wa GitHub Codespaces**: Usanidi wa mazingira ya maendeleo kwa kubofya mara moja
- **Njia ya Kujifunza Iliyo na Muundo**: Mazoezi yanayoongozwa kwa hatua 7 (jumla ya saa 3.5)
- **Ugunduzi → Usambazaji → Ubinafsishaji**: Mbinu ya maendeleo
- **Mazingira ya DevContainer ya Kuingiliana**: Zana na utegemezi uliosanidiwa tayari

#### 📚 Muundo wa Warsha
Warsha inafuata mbinu ya **Ugunduzi → Usambazaji → Ubinafsishaji**:

1. **Awamu ya Ugunduzi** (Dakika 45)
   - Chunguza templeti na huduma za Microsoft Foundry
   - Elewa mifumo ya usanifu wa mawakala wengi
   - Kagua mahitaji ya usambazaji na mahitaji ya awali

2. **Awamu ya Usambazaji** (Saa 2)
   - Usambazaji wa vitendo wa programu za AI kwa AZD
   - Sanidi huduma za Azure AI na viunganishi
   - Tekeleza mifumo ya usalama na uthibitishaji

3. **Awamu ya Ubinafsishaji** (Dakika 45)
   - Badilisha programu kwa matumizi maalum
   - Boresha kwa usambazaji wa uzalishaji
   - Tekeleza ufuatiliaji na usimamizi wa gharama

#### 🚀 Kuanza na Warsha
```bash
# Chaguo 1: GitHub Codespaces (Inapendekezwa)
# Bofya "Code" → "Create codespace on main" katika hifadhi

# Chaguo 2: Maendeleo ya Kwenye Kompyuta
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Fuata maelekezo ya usanidi katika workshop/README.md
```

#### 🎯 Matokeo ya Kujifunza ya Warsha
Kwa kukamilisha warsha, washiriki wataweza:
- **Kusambaza Programu za AI za Uzalishaji**: Tumia AZD na huduma za Microsoft Foundry
- **Kumudu Mifumo ya Mawakala Wengi**: Tekeleza suluhisho za mawakala wa AI zilizo na uratibu
- **Tekeleza Mazoezi Bora ya Usalama**: Sanidi uthibitishaji na udhibiti wa ufikiaji
- **Boresha kwa Kiwango**: Buni usambazaji wa gharama nafuu na wenye utendaji mzuri
- **Kutatua Matatizo ya Usambazaji**: Suluhisha matatizo ya kawaida kwa kujitegemea

#### 📖 Rasilimali za Warsha
- **🎥 Mwongozo wa Kuingiliana**: [Vifaa vya Warsha](workshop/README.md) - Mazingira ya kujifunza kwa kivinjari
- **📋 Maelekezo ya Hatua kwa Hatua**: [Mazoezi Yanayoongozwa](../../workshop/docs/instructions) - Maelezo ya kina
- **🛠️ Maabara ya Warsha ya AI**: [Maabara ya Warsha ya AI](docs/microsoft-foundry/ai-workshop-lab.md) - Mazoezi yanayolenga AI
- **💡 Kuanza Haraka**: [Mwongozo wa Usanidi wa Warsha](workshop/README.md#quick-start) - Usanidi wa mazingira

**Inafaa kwa**: Mafunzo ya kampuni, kozi za vyuo vikuu, kujifunza kwa kasi yako mwenyewe, na mafunzo ya watengenezaji.

---

## 📖 Azure Developer CLI ni nini?

Azure Developer CLI (azd) ni kiolesura cha mstari wa amri kinacholenga watengenezaji ambacho huongeza kasi ya mchakato wa kujenga na kusambaza programu kwa Azure. Inatoa:

- **Usambazaji wa msingi wa templeti** - Tumia templeti zilizojengwa tayari kwa mifumo ya programu ya kawaida
- **Miundombinu kama Nambari** - Simamia rasilimali za Azure kwa kutumia Bicep au Terraform  
- **Mtiririko uliounganishwa** - Sambaza, sanidi, na fuatilia programu kwa urahisi
- **Rafiki kwa Watengenezaji** - Imeboreshwa kwa tija na uzoefu wa watengenezaji

### **AZD + Microsoft Foundry: Bora kwa Usambazaji wa AI**

**Kwa nini AZD kwa Suluhisho za AI?** AZD inashughulikia changamoto kuu zinazowakumba watengenezaji wa AI:

- **Templeti Tayari kwa AI** - Templeti zilizosanidiwa tayari kwa Azure OpenAI, Huduma za Utambuzi, na mzigo wa kazi wa ML
- **Usambazaji wa AI Salama** - Mifumo ya usalama iliyojengwa kwa huduma za AI, funguo za API, na viunganishi vya modeli  
- **Mifumo ya AI ya Uzalishaji** - Mazoezi bora kwa usambazaji wa programu za AI zinazoweza kupanuka na za gharama nafuu
- **Mtiririko wa AI wa Mwisho hadi Mwisho** - Kutoka kwa maendeleo ya modeli hadi usambazaji wa uzalishaji na ufuatiliaji sahihi
- **Uboreshaji wa Gharama** - Mikakati ya ugawaji wa rasilimali na upanuzi wa mzigo wa kazi wa AI
- **Ujumuishaji wa Microsoft Foundry** - Muunganisho rahisi na katalogi ya modeli ya Microsoft Foundry na viunganishi

---

## 🎯 Maktaba ya Templeti & Mifano

### Iliyopendekezwa: Templeti za Microsoft Foundry
**Anza hapa ikiwa unakusambaza programu za AI!**

> **Kumbuka:** Templeti hizi zinaonyesha mifumo mbalimbali ya AI. Baadhi ni Sampuli za Azure za nje, nyingine ni utekelezaji wa ndani.

| Templeti | Sura | Ugumu | Huduma | Aina |
|----------|---------|------------|----------|------|
| [**Anza na mazungumzo ya AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Sura ya 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Nje |
| [**Anza na mawakala wa AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Sura ya 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Nje |
| [**Demo ya Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Sura ya 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Nje |
| [**Mwongozo wa Haraka wa Programu ya Mazungumzo ya OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Sura ya 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Nje |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Sura ya 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Nje |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Sura ya 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Nje |
| [**Suluhisho la Mawakala Wengi wa Rejareja**](examples/retail-scenario.md) | Sura ya 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Ndani** |

### Iliyopendekezwa: Mifano Kamili ya Kujifunza
**Templeti za programu tayari kwa uzalishaji zilizopangwa kwa sura za kujifunza**

| Templeti | Sura ya Kujifunza | Ugumu | Kujifunza Muhimu |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Sura ya 2 | ⭐ | Mifumo ya msingi ya usambazaji wa AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Sura ya 2 | ⭐⭐ | Utekelezaji wa RAG na Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Sura ya 4 | ⭐⭐ | Ujumuishaji wa Akili ya Nyaraka |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Sura ya 5 | ⭐⭐⭐ | Mfumo wa mawakala na kupiga kazi |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Sura ya 8 | ⭐⭐⭐ | Uratibu wa AI wa biashara |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Sura ya 5 | ⭐⭐⭐⭐ | Usanifu wa mawakala wengi na Mawakala wa Wateja na Hifadhi |

### Kujifunza kwa Aina ya Mfano

> **📌 Mifano ya Ndani vs. Nje:**  
> **Mifano ya Ndani** (katika repo hii) = Tayari kutumia mara moja  
> **Mifano ya Nje** (Sampuli za Azure) = Clone kutoka kwa repo zilizounganishwa

#### Mifano ya Ndani (Tayari Kutumia)
- [**Suluhisho la Mawakala Wengi wa Rejareja**](examples/retail-scenario.md) - Utekelezaji kamili tayari kwa uzalishaji na templeti za ARM
  - Usanifu wa mawakala wengi (Mawakala wa Wateja + Hifadhi)
  - Ufuatiliaji na tathmini kamili
  - Usambazaji wa kubofya mara moja kupitia templeti ya ARM

#### Mifano ya Ndani - Programu za Kontena (Sura ya 2-5)
**Mifano kamili ya usambazaji wa kontena katika repo hii:**
- [**Mifano ya Programu za Kontena**](examples/container-app/README.md) - Mwongozo kamili wa usambazaji wa kontena
  - [API Rahisi ya Flask](../../examples/container-app/simple-flask-api) - REST API ya msingi yenye kiwango cha sifuri
  - [Usanifu wa Huduma Ndogo](../../examples/container-app/microservices) - Usambazaji wa huduma nyingi tayari kwa uzalishaji
  - Mifumo ya Usambazaji wa Haraka, Uzalishaji, na Juu
  - Mwongozo wa ufuatiliaji, usalama, na uboreshaji wa gharama

#### Mifano ya Nje - Programu Rahisi (Sura ya 1-2)
**Clone repo hizi za Sampuli za Azure ili kuanza:**
- [Programu Rahisi ya Wavuti - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mifumo ya usambazaji wa msingi
- [Tovuti ya Kawaida - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Usambazaji wa maudhui ya kawaida
- [Programu ya Kontena - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Usambazaji wa REST API

#### Mifano ya Nje - Ujumuishaji wa Hifadhidata (Sura ya 3-4)  
- [Programu ya Hifadhidata - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mifumo ya muunganisho wa hifadhidata
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Mtiririko wa data usio na seva

#### Mifano ya Nje - Mifumo ya Juu (Sura ya 4-8)
- [Huduma Ndogo za Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Miundombinu ya huduma nyingi
- [Kazi za Programu za Kontena](https://github.com/Azure-Samples/container-apps-jobs) - Usindikaji wa nyuma  
- [Mfumo wa ML wa Biashara](https://github.com/Azure-Samples/mlops-v2) - Mifumo ya ML tayari kwa uzalishaji

### Mkusanyiko wa Templeti za Nje
- [**Maktaba Rasmi ya Templeti za AZD**](https://azure.github.io/awesome-azd/) - Mkusanyiko wa templeti rasmi na za jamii
- [**Templeti za Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Hati za mafunzo za Microsoft Learn
- [**Orodha ya Mif
### Warsha za Vitendo
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Fanya suluhisho zako za AI ziweze kupelekwa kwa AZD (Masaa 2-3)
- [**Mwongozo wa Warsha ya Kuingiliana**](workshop/README.md) - Warsha inayotumia kivinjari na mazingira ya MkDocs na DevContainer
- [**Njia ya Kujifunza Iliyojipanga**](../../workshop/docs/instructions) - Mazoezi ya hatua 7 (Ugunduzi → Upelekaji → Urekebishaji)
- [**Warsha ya AZD kwa Anayeanza**](workshop/README.md) - Vifaa kamili vya warsha ya vitendo na ujumuishaji wa GitHub Codespaces

### Rasilimali za Kujifunza za Nje
- [Hati za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Kituo cha Usanifu wa Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kikokotoo cha Bei ya Azure](https://azure.microsoft.com/pricing/calculator/)
- [Hali ya Azure](https://status.azure.com/)

---

## 🔧 Mwongozo wa Haraka wa Kutatua Matatizo

**Masuala ya kawaida yanayowakumba wanaoanza na suluhisho za haraka:**

### ❌ "azd: amri haikupatikana"

```bash
# Sakinisha AZD kwanza
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Thibitisha usakinishaji
azd version
```

### ❌ "Hakuna usajili uliopatikana" au "Usajili haujawekwa"

```bash
# Orodhesha usajili unaopatikana
az account list --output table

# Weka usajili wa chaguo-msingi
az account set --subscription "<subscription-id-or-name>"

# Weka kwa mazingira ya AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Thibitisha
az account show
```

### ❌ "InsufficientQuota" au "Quota imezidi"

```bash
# Jaribu eneo tofauti la Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Au tumia SKUs ndogo katika maendeleo
# Hariri infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" inashindwa katikati ya mchakato

```bash
# Chaguo la 1: Safisha na jaribu tena
azd down --force --purge
azd up

# Chaguo la 2: Rekebisha tu miundombinu
azd provision

# Chaguo la 3: Angalia kumbukumbu za kina
azd show
azd logs
```

### ❌ "Uthibitishaji umeshindwa" au "Token imeisha muda wake"

```bash
# Thibitisha tena
az logout
az login

azd auth logout
azd auth login

# Hakiki uthibitisho
az account show
```

### ❌ "Rasilimali tayari ipo" au migongano ya majina

```bash
# AZD hutengeneza majina ya kipekee, lakini ikiwa kuna mgongano:
azd down --force --purge

# Kisha jaribu tena na mazingira mapya
azd env new dev-v2
azd up
```

### ❌ Upelekaji wa template unachukua muda mrefu

**Muda wa kawaida wa kusubiri:**
- Programu rahisi ya wavuti: Dakika 5-10
- Programu yenye hifadhidata: Dakika 10-15
- Programu za AI: Dakika 15-25 (Upelekaji wa OpenAI ni wa polepole)

```bash
# Angalia maendeleo
azd show

# Ikiwa umekwama > dakika 30, angalia Azure Portal:
azd monitor
# Tafuta usambazaji ulioshindwa
```

### ❌ "Ruhusa imekataliwa" au "Imezuiliwa"

```bash
# Angalia jukumu lako la Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Unahitaji angalau jukumu la "Contributor"
# Muulize msimamizi wako wa Azure kutoa:
# - Contributor (kwa rasilimali)
# - User Access Administrator (kwa ugawaji wa majukumu)
```

### ❌ Haiwezi kupata URL ya programu iliyopelekwa

```bash
# Onyesha sehemu zote za huduma
azd show

# Au fungua Azure Portal
azd monitor

# Angalia huduma maalum
azd env get-values
# Tafuta mabadiliko ya *_URL
```

### 📚 Rasilimali Kamili za Kutatua Matatizo

- **Mwongozo wa Masuala ya Kawaida:** [Suluhisho za Kina](docs/troubleshooting/common-issues.md)
- **Masuala Mahususi ya AI:** [Kutatua Matatizo ya AI](docs/troubleshooting/ai-troubleshooting.md)
- **Mwongozo wa Urekebishaji:** [Hatua kwa Hatua za Urekebishaji](docs/troubleshooting/debugging.md)
- **Pata Msaada:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Mwongozo wa Haraka wa Kutatua Matatizo

**Masuala ya kawaida yanayowakumba wanaoanza na suluhisho za haraka:**

<details>
<summary><strong>❌ "azd: amri haikupatikana"</strong></summary>

```bash
# Sakinisha AZD kwanza
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Thibitisha usakinishaji
azd version
```
</details>

<details>
<summary><strong>❌ "Hakuna usajili uliopatikana" au "Usajili haujawekwa"</strong></summary>

```bash
# Orodhesha usajili unaopatikana
az account list --output table

# Weka usajili wa chaguo-msingi
az account set --subscription "<subscription-id-or-name>"

# Weka kwa mazingira ya AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Thibitisha
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" au "Quota imezidi"</strong></summary>

```bash
# Jaribu eneo tofauti la Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Au tumia SKUs ndogo katika maendeleo
# Hariri infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" inashindwa katikati ya mchakato</strong></summary>

```bash
# Chaguo 1: Safisha na jaribu tena
azd down --force --purge
azd up

# Chaguo 2: Rekebisha tu miundombinu
azd provision

# Chaguo 3: Angalia kumbukumbu za kina
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Uthibitishaji umeshindwa" au "Token imeisha muda wake"</strong></summary>

```bash
# Thibitisha tena
az logout
az login

azd auth logout
azd auth login

# Hakiki uthibitisho
az account show
```
</details>

<details>
<summary><strong>❌ "Rasilimali tayari ipo" au migongano ya majina</strong></summary>

```bash
# AZD hutengeneza majina ya kipekee, lakini ikiwa kuna mgongano:
azd down --force --purge

# Kisha jaribu tena na mazingira mapya
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Upelekaji wa template unachukua muda mrefu</strong></summary>

**Muda wa kawaida wa kusubiri:**
- Programu rahisi ya wavuti: Dakika 5-10
- Programu yenye hifadhidata: Dakika 10-15
- Programu za AI: Dakika 15-25 (Upelekaji wa OpenAI ni wa polepole)

```bash
# Angalia maendeleo
azd show

# Ikiwa umekwama > dakika 30, angalia Azure Portal:
azd monitor
# Tafuta usakinishaji ulioshindwa
```
</details>

<details>
<summary><strong>❌ "Ruhusa imekataliwa" au "Imezuiliwa"</strong></summary>

```bash
# Angalia jukumu lako la Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Unahitaji angalau jukumu la "Mchangiaji"
# Muombe msimamizi wako wa Azure kutoa:
# - Mchangiaji (kwa rasilimali)
# - Msimamizi wa Ufikiaji wa Mtumiaji (kwa ugawaji wa majukumu)
```
</details>

<details>
<summary><strong>❌ Haiwezi kupata URL ya programu iliyopelekwa</strong></summary>

```bash
# Onyesha sehemu zote za huduma
azd show

# Au fungua Azure Portal
azd monitor

# Angalia huduma maalum
azd env get-values
# Tafuta mabadiliko ya *_URL
```
</details>

### 📚 Rasilimali Kamili za Kutatua Matatizo

- **Mwongozo wa Masuala ya Kawaida:** [Suluhisho za Kina](docs/troubleshooting/common-issues.md)
- **Masuala Mahususi ya AI:** [Kutatua Matatizo ya AI](docs/troubleshooting/ai-troubleshooting.md)
- **Mwongozo wa Urekebishaji:** [Hatua kwa Hatua za Urekebishaji](docs/troubleshooting/debugging.md)
- **Pata Msaada:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kukamilisha Kozi na Vyeti

### Ufuatiliaji wa Maendeleo
Fuatilia maendeleo yako ya kujifunza kupitia kila sura:

- [ ] **Sura ya 1**: Msingi & Kuanza Haraka ✅
- [ ] **Sura ya 2**: Maendeleo ya AI Kwanza ✅  
- [ ] **Sura ya 3**: Usanidi & Uthibitishaji ✅
- [ ] **Sura ya 4**: Miundombinu kama Msimbo & Upelekaji ✅
- [ ] **Sura ya 5**: Suluhisho za AI za Wakala Wengi ✅
- [ ] **Sura ya 6**: Uthibitishaji Kabla ya Upelekaji & Mipango ✅
- [ ] **Sura ya 7**: Kutatua Matatizo & Urekebishaji ✅
- [ ] **Sura ya 8**: Mifumo ya Uzalishaji & Biashara ✅

### Uthibitishaji wa Kujifunza
Baada ya kukamilisha kila sura, thibitisha maarifa yako kwa:
1. **Zoezi la Vitendo**: Kamilisha upelekaji wa vitendo wa sura
2. **Ukaguzi wa Maarifa**: Pitia sehemu ya Maswali Yanayoulizwa Mara kwa Mara ya sura yako
3. **Majadiliano ya Jamii**: Shiriki uzoefu wako katika Azure Discord
4. **Sura Inayofuata**: Endelea na kiwango kinachofuata cha ugumu

### Faida za Kukamilisha Kozi
Baada ya kukamilisha sura zote, utakuwa na:
- **Uzoefu wa Uzalishaji**: Umepeleka programu halisi za AI kwenye Azure
- **Ujuzi wa Kitaalamu**: Uwezo wa upelekaji wa kiwango cha biashara  
- **Kutambulika na Jamii**: Mwanachama hai wa jamii ya watengenezaji wa Azure
- **Maendeleo ya Kazi**: Utaalamu wa AZD na upelekaji wa AI unaohitajika

---

## 🤝 Jamii & Msaada

### Pata Msaada & Usaidizi
- **Masuala ya Kiufundi**: [Ripoti hitilafu na omba vipengele](https://github.com/microsoft/azd-for-beginners/issues)
- **Maswali ya Kujifunza**: [Jamii ya Microsoft Azure Discord](https://discord.gg/microsoft-azure) na [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Msaada Mahususi wa AI**: Jiunge na [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Hati**: [Hati rasmi za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Maarifa ya Jamii kutoka Microsoft Foundry Discord

**Matokeo ya Kura za Hivi Karibuni kutoka #Azure Channel:**
- **45%** ya watengenezaji wanataka kutumia AZD kwa mizigo ya kazi ya AI
- **Changamoto kuu**: Upelekaji wa huduma nyingi, usimamizi wa hati za kiingilio, utayari wa uzalishaji  
- **Inayohitajika zaidi**: Templates za AI, miongozo ya kutatua matatizo, mbinu bora

**Jiunge na jamii yetu ili:**
- Shiriki uzoefu wako wa AZD + AI na upate msaada
- Pata hakikisho la mapema la templates mpya za AI
- Changia mbinu bora za upelekaji wa AI
- Athiri maendeleo ya vipengele vya baadaye vya AI + AZD

### Kuchangia Kozi
Tunakaribisha michango! Tafadhali soma [Mwongozo wa Kuchangia](CONTRIBUTING.md) kwa maelezo kuhusu:
- **Uboreshaji wa Maudhui**: Boresha sura zilizopo na mifano
- **Mifano Mpya**: Ongeza hali halisi na templates  
- **Tafsiri**: Saidia kudumisha msaada wa lugha nyingi
- **Ripoti za Hitilafu**: Boresha usahihi na uwazi
- **Viwango vya Jamii**: Fuata miongozo yetu ya jamii inayojumuisha

---

## 📄 Taarifa za Kozi

### Leseni
Mradi huu umepewa leseni chini ya Leseni ya MIT - angalia faili ya [LICENSE](../../LICENSE) kwa maelezo.

### Rasilimali Zingine za Kujifunza za Microsoft

Timu yetu inazalisha kozi zingine za kujifunza za kina:

### Azure / Edge / MCP / Wakala
[![AZD kwa Anayeanza](https://img.shields.io/badge/AZD%20kwa%20Anayeanza-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI kwa Anayeanza](https://img.shields.io/badge/Edge%20AI%20kwa%20Anayeanza-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP kwa Anayeanza](https://img.shields.io/badge/MCP%20kwa%20Anayeanza-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Wakala wa AI kwa Anayeanza](https://img.shields.io/badge/Wakala%20wa%20AI%20kwa%20Anayeanza-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---

### Mfululizo wa AI ya Kizazi
[![AI ya Kizazi kwa Anayeanza](https://img.shields.io/badge/AI%20ya%20Kizazi%20kwa%20Anayeanza-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI ya Kizazi (.NET)](https://img.shields.io/badge/AI%20ya%20Kizazi%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI ya Kizazi (Java)](https://img.shields.io/badge/AI%20ya%20Kizazi%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![AI ya Kizazi (JavaScript)](https://img.shields.io/badge/AI%20ya%20Kizazi%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---

### Kujifunza Msingi
[![ML kwa Anayeanza](https://img.shields.io/badge/ML%20kwa%20Anayeanza-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Sayansi ya Takwimu kwa Anayeanza](https://img.shields.io/badge/Sayansi%20ya%20Takwimu%20kwa%20Anayeanza-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI kwa Anayeanza](https://img.shields.io/badge/AI%20kwa%20Anayeanza-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Usalama wa Mtandao kwa Anayeanza](https://img.shields.io/badge/Usalama%20wa%20Mtandao%20kwa%20Anayeanza-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev kwa Anayeanza](https://img.shields.io/badge/Web%20Dev%20kwa%20Anayeanza-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT kwa Kompyuta](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
[![Maendeleo ya XR kwa Kompyuta](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---

### Mfululizo wa Copilot  
[![Copilot kwa Uprogramu wa Pamoja wa AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
[![Copilot kwa C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Uelekezaji wa Kozi  

**🚀 Tayari Kuanza Kujifunza?**

**Kompyuta**: Anza na [Sura ya 1: Msingi & Kuanza Haraka](../..)  
**Watengenezaji wa AI**: Ruka hadi [Sura ya 2: Maendeleo ya Kwanza ya AI](../..)  
**Watengenezaji Wenye Uzoefu**: Anza na [Sura ya 3: Usanidi & Uthibitishaji](../..)  

**Hatua Zifuatazo**: [Anza Sura ya 1 - Misingi ya AZD](docs/getting-started/azd-basics.md) →  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->