<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T14:02:20+00:00",
  "source_file": "README.md",
  "language_code": "sw"
}
-->
# AZD Kwa Waanzilishi: Safari Iliyo Pangwa ya Kujifunza

![AZD-for-beginners](../../../../translated_images/sw/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Kuanzisha na Kozi Hii

Fuata hatua hizi kuanza safari yako ya kujifunza AZD:

1. **Fanya Fork ya Hazina**: Bonyeza [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone Hazina**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Jiunge na Jamii**: [Jamii za Azure Discord](https://discord.com/invite/ByRwuEEgH4) kwa msaada wa wataalamu
4. **Chagua Njia Yako ya Kujifunza**: Chagua sura hapa chini inayolingana na kiwango chako cha uzoefu

### Usaidizi wa Lugha Nyingi

#### Tafsiri za Kiotomatiki (Daima Zinazoakiwa Masa)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](./README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Unapendelea Kufeza Clone Kwenye Kompyuta?**

> Hazina hii ina tafsiri zaidi ya 50 za lugha ambayo huongeza kiasi cha kupakua. Ili kufanya clone bila tafsiri, tumia sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Hii inakupa kila kitu unachohitaji kukamilisha kozi kwa upakuaji wa haraka zaidi.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Muhtasari wa Kozi

Tafuta ujuzi wa Azure Developer CLI (azd) kupitia sura zilizo pangwa kwa kujifunza hatua kwa hatua. **Mkazo maalum juu ya usambazaji wa programu za AI kwa ushirikiano wa Microsoft Foundry.**

### Kwa Nini Kozi Hii Ni Muhimu kwa Waendelezaji Wapya

Kulingana na maoni ya jamii ya Microsoft Foundry Discord, **45% ya waendelezaji wanataka kutumia AZD kwa mzigo wa AI** lakini wanakutana na changamoto zifuatazo:
- Miundo tata ya huduma nyingi za AI
- Mbinu bora za usambazaji wa AI kwa uzalishaji  
- Ushirikiano na usanidi wa huduma za Azure AI
- Uboreshaji wa gharama kwa mizigo ya AI
- Utatuzi wa matatizo yanayohusiana na usambazaji wa AI

### Malengo ya Kujifunza

Kwa kukamilisha kozi hii iliyopangwa, utaweza:
- **Kuwa Mtaalamu wa Misingi ya AZD**: Misingi ya msingi, usakinishaji, na usanidi
- **Sambaza Programu za AI**: Tumia AZD na huduma za Microsoft Foundry
- **Tekeleza Miundombinu Kama Msimbo**: Simamia rasilimali za Azure kwa kutumia templeti za Bicep
- **Tatua Matatizo ya Usambazaji**: Rekebisha matatizo ya kawaida na uthibitishe makosa
- **Boresha kwa Uzalishaji**: Usalama, upanuzi, ufuatiliaji, na usimamizi wa gharama
- **Tengeneza Suluhisho za Wakala Wengi**: Sambaza miundo tata ya AI

## 📚 Sura za Kujifunza

*Chagua njia yako ya kujifunza kulingana na kiwango chako cha uzoefu na malengo*

### 🚀 Sura ya 1: Msingi & Kuanzishwa Haraka
**Masharti**: Usajili wa Azure, maarifa ya msingi ya mstari wa amri  
**Muda**: Dakika 30-45  
**Ugumu**: ⭐

#### Utajifunza Nini
- Kuelewa misingi ya Azure Developer CLI
- Kusakinisha AZD kwenye jukwaa lako
- Usambazaji wako wa kwanza wenye mafanikio

#### Rasilimali za Kujifunza
- **🎯 Anza Hapa**: [Azure Developer CLI ni Nini?](../..)
- **📖 Nadharia**: [Misingi ya AZD](docs/getting-started/azd-basics.md) - Misingi na istilahi
- **⚙️ Usanidi**: [Usakinishaji & Usanidi](docs/getting-started/installation.md) - Mwongozo wa majukwaa maalum
- **🛠️ Vitendo**: [Mradi Wako wa Kwanza](docs/getting-started/first-project.md) - Maelekezo ya hatua kwa hatua
- **📋 Marejeleo ya Haraka**: [Karatasi ya Amri](resources/cheat-sheet.md)

#### Mazoezi ya Vitendo
```bash
# Kagua usakinishaji kwa haraka
azd version

# Sambaza programu yako ya kwanza
azd init --template todo-nodejs-mongo
azd up
```

**💡 Matokeo ya Sura**: Sambaza programu rahisi ya wavuti kwa mafanikio kwa kutumia AZD

**✅ Uthibitisho wa Mafanikio:**
```bash
# Baada ya kumaliza Sura ya 1, unapaswa kuwa na uwezo wa:
azd version              # Inaonyesha toleo lililowekwa
azd init --template todo-nodejs-mongo  # Inaanzisha mradi
azd up                  # Inatuma kwenye Azure
azd show                # Inaonyesha URL ya app inayotumia
# Programu hufunguka kwenye kivinjari na inafanya kazi
azd down --force --purge  # Inasafisha rasilimali
```

**📊 Muda wa Jitihada:** Dakika 30-45  
**📈 Kiwango cha Ujuzi Baada:** Anaweza kusambaza programu za msingi kwa uhuru

**✅ Uthibitisho wa Mafanikio:**
```bash
# Baada ya kumaliza Sura ya 1, unapaswa kuwa na uwezo wa:
azd version              # Inaonyesha toleo lililosakinishwa
azd init --template todo-nodejs-mongo  # Anzisha mradi
azd up                  # Inapeleka kwenye Azure
azd show                # Inaonyesha URL ya programu inayofanya kazi
# Programu inafunguka kwenye kivinjari na inafanya kazi
azd down --force --purge  # Inasafisha rasilimali
```

**📊 Muda wa Jitihada:** Dakika 30-45  
**📈 Kiwango cha Ujuzi Baada:** Anaweza kusambaza programu za msingi kwa uhuru

---

### 🤖 Sura ya 2: Maendeleo Yanayoweka AI Kwanza (Inapendekezwa kwa Waendelezaji wa AI)
**Masharti**: Sura ya 1 imekamilika  
**Muda**: Saa 1-2  
**Ugumu**: ⭐⭐

#### Utajifunza Nini
- Ushirikiano wa Microsoft Foundry na AZD
- Kusambaza programu zenye nguvu za AI
- Kuelewa usanidi wa huduma za AI

#### Rasilimali za Kujifunza
- **🎯 Anza Hapa**: [Ushirikiano wa Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Mifumo**: [Usambazaji wa Modeli za AI](docs/microsoft-foundry/ai-model-deployment.md) - Sambaza na simamia modeli za AI
- **🛠️ Maabara**: [Maabara ya AI](docs/microsoft-foundry/ai-workshop-lab.md) - Tengeneza suluhisho za AI zenye AZD
- **🎥 Mwongozo wa Kuingiliana**: [Vifaa vya Maabara](workshop/README.md) - Kujifunza kupitia kivinjari kwa MkDocs * Mazingira ya DevContainer
- **📋 Templeti**: [Templeti za Microsoft Foundry](../..)
- **📝 Mifano**: [Mifano ya Usambazaji ya AZD](examples/README.md)

#### Mazoezi ya Vitendo
```bash
# Tumia programu yako ya kwanza ya AI
azd init --template azure-search-openai-demo
azd up

# Jaribu mifano ya ziada ya AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Matokeo ya Sura**: Sambaza na usanidi programu ya mazungumzo yenye nguvu ya AI yenye uwezo wa RAG

**✅ Uthibitisho wa Mafanikio:**
```bash
# Baada ya Sura ya 2, unapaswa kuwa na uwezo wa:
azd init --template azure-search-openai-demo
azd up
# Jaribu kiolesura cha mazungumzo cha AI
# Uliza maswali na upate majibu ya AI yenye nguvu na vyanzo
# Thibitisha kwamba ujumuishaji wa utaftaji unafanya kazi
azd monitor  # Angalia kuwa Application Insights inaonyesha telemetry
azd down --force --purge
```

**📊 Muda wa Jitihada:** Saa 1-2  
**📈 Kiwango cha Ujuzi Baada:** Anaweza kusambaza na kusanidi programu za AI za uzalishaji  
**💰 Uelewa wa Gharama:** Elewa gharama za $80-150/kila mwezi kwa maendeleo, $300-3500/kila mwezi kwa uzalishaji

#### 💰 Mambo ya Kuzingatia Kuhusu Gharama za Usambazaji wa AI

**Mazingira ya Maendeleo (Makadirio $80-150/kila mwezi):**
- Azure OpenAI (Lipa unavyotumia): $0-50/kila mwezi (kulingana na matumizi ya tokeni)
- AI Search (Kiwango cha msingi): $75/kila mwezi
- Container Apps (Matumizi): $0-20/kila mwezi
- Uhifadhi (Kawaida): $1-5/kila mwezi

**Mazingira ya Uzalishaji (Makadirio $300-3,500+/kila mwezi):**
- Azure OpenAI (PTU kwa utendaji thabiti): $3,000+/kila mwezi AU Lipa unavyotumia kwa wingi mkubwa
- AI Search (Kiwango cha kawaida): $250/kila mwezi
- Container Apps (Iliyotengwa): $50-100/kila mwezi
- Application Insights: $5-50/kila mwezi
- Uhifadhi (Premium): $10-50/kila mwezi

**💡 Vidokezo vya Kuboresha Gharama:**
- Tumia **Azure OpenAI ya Ngazi ya Bure** kwa kujifunza (tokeni 50,000 kwa mwezi ni pamoja)
- Endesha `azd down` kuondoa rasilimali wakati haufanyi maendeleo kwa sasa
- Anza na malipo ya matumizi, ongeza PTU tu kwa ajili ya uzalishaji
- Tumia `azd provision --preview` kutathmini gharama kabla ya usambazaji
- Washa upanuzi wa moja kwa moja: lipa tu kwa matumizi halisi

**Ufuatiliaji wa Gharama:**
```bash
# Angalia makisio ya gharama za kila mwezi
azd provision --preview

# Fuatilia gharama halisi katika Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Sura ya 3: Usanidi & Uthibitishaji
**Masharti**: Sura ya 1 imekamilika  
**Muda**: Dakika 45-60  
**Ugumu**: ⭐⭐

#### Utajifunza Nini
- Usanidi na usimamizi wa mazingira
- Mbinu bora za uthibitishaji na usalama
- Kuweka majina na kupanga rasilimali

#### Rasilimali za Kujifunza
- **📖 Usanidi**: [Mwongozo wa Usanidi](docs/getting-started/configuration.md) - Kuanzisha mazingira
- **🔐 Usalama**: [Mifumo ya uthibitishaji na utambulisho ulio simamiwa](docs/getting-started/authsecurity.md) - Mifumo ya uthibitishaji
- **📝 Mifano**: [Mfano wa Programu ya Database](examples/database-app/README.md) - Mifano ya AZD Database

#### Mazoezi ya Vitendo
- Sanidi mazingira mengi (dev, staging, prod)
- Anzisha uthibitishaji wa utambulisho ulio simamiwa
- Tekeleza usanidi maalum wa mazingira

**💡 Matokeo ya Sura**: Simamia mazingira mengi kwa uthibitishaji na usalama sahihi

---

### 🏗️ Sura ya 4: Miundombinu Kama Msimbo & Usambazaji
**Masharti**: Sura 1-3 zimekamilika  
**Muda**: Saa 1-1.5  
**Ugumu**: ⭐⭐⭐

#### Utajifunza Nini
- Mifumo ya kusambaza ya hali ya juu
- Miundombinu kama msimbo kwa Bicep
- Mikakati ya kuandaa rasilimali

#### Rasilimali za Kujifunza
- **📖 Usambazaji**: [Mwongozo wa Usambazaji](docs/deployment/deployment-guide.md) - Taratibu kamili
- **🏗️ Kuandaa Rasilimali**: [Kuandaa Rasilimali](docs/deployment/provisioning.md) - Usimamizi wa rasilimali za Azure
- **📝 Mifano**: [Mfano wa Programu ya Kontena](../../examples/container-app) - Usambazaji wa programu zinazoendeshwa kwa kontena

#### Mazoezi ya Vitendo
- Tengeneza templeti za Bicep maalum
- Sambaza programu za huduma nyingi
- Tekeleza mikakati ya usambazaji wa blue-green

**💡 Matokeo ya Sura**: Sambaza programu tata za huduma nyingi kwa kutumia templeti maalum za miundombinu

---

### 🎯 Sura ya 5: Suluhisho za AI za Wakala Wengi (Kiwango cha Juu)
**Masharti**: Sura 1-2 zimekamilika  
**Muda**: Saa 2-3  
**Ugumu**: ⭐⭐⭐⭐

#### Utajifunza Nini
- Mifumo ya usanifu wa waki mbalimbali
- Uratibu na usimamizi wa maajenti
- Utekelezaji wa AI tayari kwa uzalishaji

#### Vyanzo vya Kujifunza
- **🤖 Mradi Uliotangazwa**: [Suluhisho la Maajenti Wengi wa Maduka](examples/retail-scenario.md) - Utekelezaji kamili
- **🛠️ Violezo vya ARM**: [Kifurushi cha Violezo vya ARM](../../examples/retail-multiagent-arm-template) - Utekelezaji kwa bonyeza moja
- **📖 Miamala ya Usanifu**: [Mifumo ya Uratibu wa Maajenti Wengi](/docs/pre-deployment/coordination-patterns.md) - Mifumo

#### Mazoezi ya Kivitendo
```bash
# Sambaza suluhisho kamili la mawakala wengi wa rejareja
cd examples/retail-multiagent-arm-template
./deploy.sh

# Chunguza usanidi wa mawakala
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Matokeo ya Sura**: Tekeleza na simamia suluhisho la AI la maajenti wengi linalo tayari kwa uzalishaji likiwa na maajenti wa Wateja na Hesabu

---

### 🔍 Sura ya 6: Uthibitishaji na Mipango Kabla ya Utekelezaji
**Mahitaji**: Sura ya 4 imemalizika  
**Muda**: Saa 1  
**Ugumu**: ⭐⭐

#### Utajifunza Nini
- upangaji wa uwezo na uthibitishaji wa rasilimali
- mikakati ya uteuzi wa SKU
- ukaguzi kabla ya kuanzisha na automatisering

#### Vyanzo vya Kujifunza
- **📊 Mipango**: [Upangaji wa Uwezo](docs/pre-deployment/capacity-planning.md) - Uthibitishaji wa rasilimali
- **💰 Uteuzi**: [Uteuzi wa SKU](docs/pre-deployment/sku-selection.md) - Chaguo zenye gharama nafuu
- **✅ Uthibitishaji**: [Ukaguzi Kabla ya Kuanzisha](docs/pre-deployment/preflight-checks.md) - Scripti za automatiska

#### Mazoezi ya Kivitendo
- Endesha scripta za uthibitishaji wa uwezo
- Rekebisha uteuzi wa SKU kwa gharama nafuu
- Tekeleza ukaguzi wa automatiska kabla ya utekelezaji

**💡 Matokeo ya Sura**: Thibitisha na boresha utekelezaji kabla ya kutekeleza

---

### 🚨 Sura ya 7: Utatuzi na Uchunguzi wa Makosa
**Mahitaji**: Sura yoyote ya utekelezaji imemalizika  
**Muda**: Saa 1 hadi 1.5  
**Ugumu**: ⭐⭐

#### Utajifunza Nini
- Mbinu za utatuzi wa matatizo kwa mfumo mzima
- Masuala yanayojirudia na suluhisho
- Utatuzi maalum wa matatizo ya AI

#### Vyanzo vya Kujifunza
- **🔧 Masuala Yanayojulikana**: [Masuala Yanayojulikana](docs/troubleshooting/common-issues.md) - Maswali ya kawaida na suluhisho
- **🕵️ Uchunguzi wa Makosa**: [Mwongozo wa Utatuzi](docs/troubleshooting/debugging.md) - Mikakati hatua kwa hatua
- **🤖 Masuala ya AI**: [Utatuzi Maalum wa AI](docs/troubleshooting/ai-troubleshooting.md) - Matatizo ya huduma za AI

#### Mazoezi ya Kivitendo
- Tambua sababu za kushindwa kwa utekelezaji
- Rekebisha matatizo ya uthibitishaji
- Tatua matatizo ya muunganisho wa huduma ya AI

**💡 Matokeo ya Sura**: Tambua na tatua matatizo ya kawaida ya utekelezaji peke yako

---

### 🏢 Sura ya 8: Mifumo ya Uzalishaji na Biashara
**Mahitaji**: Suras 1-4 zimekamilika  
**Muda**: Saa 2-3  
**Ugumu**: ⭐⭐⭐⭐

#### Utajifunza Nini
- Mikakati ya utekelezaji wa uzalishaji
- Mifumo ya usalama wa biashara
- Ufuatiliaji na uboreshaji wa gharama

#### Vyanzo vya Kujifunza
- **🏭 Uzalishaji**: [Mazingira Bora ya AI kwa Uzalishaji](docs/microsoft-foundry/production-ai-practices.md) - Mifumo ya biashara
- **📝 Mifano**: [Mfano wa Microservices](../../examples/microservices) - Miundo changamano
- **📊 Ufuatiliaji**: [Muunganisho wa Application Insights](docs/pre-deployment/application-insights.md) - Ufuatiliaji

#### Mazoezi ya Kivitendo
- Tekeleza mifumo ya usalama ya biashara
- Weka mfumo kamili wa ufuatiliaji
- Tekeleza kwenye uzalishaji kwa udhibiti mzuri

**💡 Matokeo ya Sura**: Tekeleza maombi tayari kwa biashara yenye uwezo kamili wa uzalishaji

---

## 🎓 Muhtasari wa Warsha: Uzoefu wa Kujifunza Mkono kwa Mkono

> **⚠️ HALI YA WARSHA: Maendeleo Hai**  
> Vifaa vya warsha vinaendelea kuandaliwa na kuboreshwa. Moduli kuu zinafanya kazi, lakini sehemu fulani za juu hazijakamilika. Tunaendelea kwa bidii kukamilisha maudhui yote. [Fuata maendeleo →](workshop/README.md)

### Vifaa vya Warsha vya Kuingiliana
**Ujifunzaji wa kina wa vitendo kwa kutumia vifaa vya kivinjari na mazoezi yaliyoongozwa**

Vifaa vyetu vya warsha vinatoa uzoefu uliopangwa na wa kuingiliana wa kujifunza unaoendana na mtaala wa sura ulio hapo juu. Warsha hii imeundwa kwa ajili ya kujifunza kwa kasi yako mwenyewe na kipindi cha kufundishwa na mwalimu.

#### 🛠️ Sifa za Warsha
- **Kiolesura cha Kivinjari**: Warsha kamili yenye MkDocs inayotumia utambuzi, kunakili, na sifa za mandhari
- **Muunganisho wa GitHub Codespaces**: Uanzishaji wa mazingira ya maendeleo kwa bonyeza moja
- **Njia Iliyo Pangiliwa ya Kujifunza**: Mazoezi yenye hatua 7 yaliyoongozwa (saa 3.5 jumla)
- **Ugunduzi → Utekelezaji → Ubadilishaji**: Mbinu ya hatua kwa hatua
- **Mazingira ya DevContainer Yanayoshirikiana**: Zana na utegemezi ulioandaliwa awali

#### 📚 Muundo wa Warsha
Warsha inafuata mbinu ya **Ugunduzi → Utekelezaji → Ubadilishaji**:

1. **Awamu ya Ugunduzi** (dakika 45)
   - Chunguza violezo na huduma za Microsoft Foundry
   - Elewa mifumo ya usanifu ya maajenti wengi
   - Pitia mahitaji na mahitaji ya awali ya utekelezaji

2. **Awamu ya Utekelezaji** (masaa 2)
   - Mazoezi ya utekelezaji wa vitendo wa maombi ya AI kwa kutumia AZD
   - Sanidi huduma za Azure AI na viunganishi
   - Tekeleza mifumo ya usalama na uthibitishaji

3. **Awamu ya Ubadilishaji** (dakika 45)
   - Fanya marekebisho ya maombi kwa matumizi maalum
   - Boreshaji kwa ajili ya utekelezaji wa uzalishaji
   - Tekeleza ufuatiliaji na usimamizi wa gharama

#### 🚀 Anza Kutumia Warsha
```bash
# Chaguo 1: GitHub Codespaces (Inapendekezwa)
# Bonyeza "Code" → "Create codespace on main" kwenye hifadhi

# Chaguo 2: Maendeleo ya Ndani
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Fuata maagizo ya usanidi katika workshop/README.md
```

#### 🎯 Matokeo ya Kujifunza Warsha
Kwa kukamilisha warsha, washiriki watakuwa na uwezo wa:
- **Tekeleza Maombi ya AI Tayari kwa Uzalishaji**: Tumia AZD na huduma za Microsoft Foundry
- **Kuwa Mtaalamu wa Miundo ya Maajenti Wengi**: Tekeleza suluhisho la maajenti wa AI iliyoratibiwa
- **Tekeleza Mazoea Bora ya Usalama**: Sanidi uthibitishaji na udhibiti wa upatishaji
- **Boreshaji kwa Kiwango Kikubwa**: Buni utekelezaji wenye gharama nafuu na wenye ufanisi
- **Tatuzi matatizo ya Utekelezaji**: Tatua matatizo ya kawaida peke yako

#### 📖 Vyanzo vya Warsha
- **🎥 Mwongozo wa Kuingiliana**: [Vifaa vya Warsha](workshop/README.md) - Mazingira ya kujifunza kwa kivinjari
- **📋 Maelekezo Hatua kwa Hatua**: [Mazoezi Yaliyoongozwa](../../workshop/docs/instructions) - Mwongozo wa kina
- **🛠️ Maabara ya Warsha ya AI**: [Maabara ya Warsha ya AI](docs/microsoft-foundry/ai-workshop-lab.md) - Mazoezi yenye lengo la AI
- **💡 Anza Haraka**: [Mwongozo wa Usanidi wa Warsha](workshop/README.md#quick-start) - Usanidi wa mazingira

**Inafaa kwa**: Mafunzo ya makampuni, kozi za vyuo vikuu, kujifunza kwa kasi yako mwenyewe, na warsha za mafunzo kwa watengenezaji.

---

## 📖 Azure Developer CLI ni Nini?

Azure Developer CLI (azd) ni kiolesura cha mstari wa amri kinacholenga watengenezaji ambacho huchochea mchakato wa kujenga na kutekeleza maombi kwenye Azure. Inatoa:

- **Utekelezaji kwa kutumia violezo** - Tumia violezo vilivyotengenezwa awali kwa mifumo ya kawaida ya maombi
- **Miundombinu kama Msimbo** - Simamia rasilimali za Azure kwa kutumia Bicep au Terraform  
- **Mchakato uliounganishwa** - Tekeleza, tekeleza, na ufuatilie maombi bila matatizo
- **Rafiki kwa watengenezaji** - Imeboreshwa kwa tija na uzoefu wa mtengenezaji

### **AZD + Microsoft Foundry: Kamili kwa Utekelezaji wa AI**

**Kwa Nini AZD kwa Suluhisho za AI?** AZD inashughulikia changamoto kuu zinazowakabili watengenezaji wa AI:

- **Violezo Tayari kwa AI** - Violezo vilivyosanidiwa kwa Azure OpenAI, Huduma za Cognitive, na mizigo ya ML
- **Utekelezaji wa AI Ulio Salama** - Mifumo ya usalama iliyojengewa ndani kwa huduma za AI, funguo za API, na viunganishi vya modeli  
- **Miamala Bora ya AI kwa Uzalishaji** - Mazoea bora kwa utekelezaji wa maombi ya AI yanayoweza kupanuka na yenye gharama nafuu
- **Mchakato Kamili wa AI** - Kuanzia maendeleo ya modeli hadi utekelezaji wa uzalishaji ukiwa na ufuatiliaji unaofaa
- **Uboreshaji wa Gharama** - Mikakati ya matumizi ya rasilimali kwa busara na upanuzi wa mizigo ya AI
- **Muunganiko wa Microsoft Foundry** - Muunganisho laini na katalogi ya modeli na viunganishi vya Microsoft Foundry

---

## 🎯 Maktaba ya Violezo na Mifano

### Kipekee: Violezo vya Microsoft Foundry
**Anza hapa ikiwa unatekeleza maombi ya AI!**

> **Kumbuka:** Violezo hivi vinaonyesha mifumo mbalimbali ya AI. Baadhi ni Sampuli za Azure za nje, wengine ni utekelezaji wa ndani.

| Kiolezo | Sura | Ugumu | Huduma | Aina |
|----------|---------|------------|----------|------|
| [**Anza na AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Sura 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Wa Nje |
| [**Anza na maajenti wa AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Sura 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Wa Nje |
| [**Demo ya Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Sura 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Wa Nje |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Sura 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Wa Nje |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Sura 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Wa Nje |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Sura 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Wa Nje |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Sura 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Ndani ya Hifadhidata** |

### Kipekee: Hali Kamili za Kujifunza
**Violezo vya maombi tayari kwa uzalishaji vinavyolingana na sura za kujifunza**

| Kiolezo | Sura ya Kujifunza | Ugumu | Kujifunza Muhimu |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Sura 2 | ⭐ | Mifumo ya msingi ya utekelezaji wa AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Sura 2 | ⭐⭐ | Utekelezaji wa RAG na Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Sura 4 | ⭐⭐ | Muunganiko wa Akili za Nyaraka |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Sura 5 | ⭐⭐⭐ | Mfumo wa maajenti na utumiaji wa foni za kazi |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Sura 8 | ⭐⭐⭐ | Uratibu wa Enterprise AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Sura 5 | ⭐⭐⭐⭐ | Miundo ya maajenti wengi yenye maajenti wa Wateja na Hesabu |

### Kujifunza Kwa Aina ya Mfano

> **📌 Mifano ya Ndani vs. Ya Nje:**  
> **Mifano ya Ndani** (katika hifadhidata hii) = Tayari kutumika mara moja  
> **Mifano ya Nje** (Sampuli za Azure) = Nakili kutoka kwa hifadhidata zilizounganishwa

#### Mifano ya Ndani (Tayari Kutumika)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Utekelezaji kamili tayari kwa uzalishaji na violezo vya ARM
  - Miundo ya maajenti wengi (Maajenti wa Wateja + Hesabu)
  - Ufuatiliaji na tathmini kamili
  - Utekelezaji kwa bonyeza moja kupitia kiungo cha ARM

#### Mifano ya Ndani - Maombi ya Kontena (Suras 2-5)
**Mifano kamili ya utekelezaji wa kontena katika hifadhidata hii:**
- [**Mifano ya Maombi ya Kontena**](examples/container-app/README.md) - Mwongozo kamili wa utekelezaji wa huduma zilizobadilishwa kuwa kontena
  - [API rahisi ya Flask](../../examples/container-app/simple-flask-api) - API ya REST yenye upanuzi hadi sifuri
  - [Usanifu wa Microservices](../../examples/container-app/microservices) - Utekelezaji wa huduma nyingi tayari kwa uzalishaji
  - Mifumo ya Anza Haraka, Uzalishaji, na Utekelezaji wa Juu
  - Mwongozo wa ufuatiliaji, usalama, na uboreshaji wa gharama

#### Mifano ya Nje - Maombi Rahisi (Suras 1-2)
**Nakili hifadhidata hizi za Sampuli za Azure kuanza:**
- [Tovuti Rahisi - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mifumo ya msingi ya utekelezaji
- [Tovuti Imara - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Utekelezaji wa maudhui ya tovuti
- [Maombi ya Kontena - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Utekelezaji wa API ya REST

#### Mifano ya Nje - Muunganiko wa Hifadhidata (Sura 3-4)  
- [App ya Hifadhidata - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mifumo ya muunganisho wa hifadhidata
- [Foni + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Mtiririko wa data usiotegemea seva

#### Mifano ya Nje - Mifumo za Juu (Suras 4-8)
- [Microservices za Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Miundo ya huduma nyingi
- [Kazi za Maombi ya Kontena](https://github.com/Azure-Samples/container-apps-jobs) - Usindikaji wa nyuma  
- [Mfumo wa Uzalishaji wa ML wa Enterprise](https://github.com/Azure-Samples/mlops-v2) - Mifumo ya ML tayari kwa uzalishaji

### Maktaba za Violezo vya Nje
- [**Galleria Rasmi ya Violezo vya AZD**](https://azure.github.io/awesome-azd/) - Maktaba iliyochaguliwa ya violezo rasmi na vya jamii
- [**Violezo vya Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Nyaraka za violezo za Microsoft Learn
- [**Orodha ya Mifano**](examples/README.md) - Mifano ya kujifunza ya ndani yenye maelezo ya kina

---

## 📚 Rasilimali za Kujifunza & Marejeleo

### Marejeleo ya Haraka
- [**Karatasi ya Amri za azd**](resources/cheat-sheet.md) - Amri muhimu za azd zilizo pangwa kwa sura
- [**Kamusi**](resources/glossary.md) - Misamiati ya Azure na azd  
- [**Maswali Yanayoulizwa Mara kwa Mara**](resources/faq.md) - Maswali ya kawaida yaliyopangwa kwa sura ya kujifunza
- [**Mwongozo wa Kusoma**](resources/study-guide.md) - Mazoezi kamili ya kutekeleza

### Warsha za Vitendo
- [**Warsha za AI**](docs/microsoft-foundry/ai-workshop-lab.md) - Fanya suluhisho lako la AI liweze kupelekwa kwa AZD (masaa 2-3)
- [**Mwongozo wa Warsha Inayoshirikishwa**](workshop/README.md) - Warsha inayotumia kivinjari na mazingira ya MkDocs na DevContainer
- [**Njia ya Kujifunza Iliyo Pangiliwa**](../../workshop/docs/instructions) - Mazoezi ya hatua 7 (Kubaini → Kuweka → Kubinafsisha)
- [**Warsha ya AZD Kwa Waanzilishi**](workshop/README.md) - Vifaa kamili vya warsha za vitendo pamoja na ushirikiano wa GitHub Codespaces

### Rasilimali za Kujifunza Nje
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Kituo cha Miamala ya Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkuleta ya Bei ya Azure](https://azure.microsoft.com/pricing/calculator/)
- [Hali ya Azure](https://status.azure.com/)

---

## 🔧 Mwongozo wa Haraka wa Kutatua Matatizo

**Matatizo ya kawaida wanayokutana nayo waanzilishi na suluhisho za haraka:**

### ❌ "azd: amri haipatikani"

```bash
# Ingiza AZD kwanza
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Hakiki usakinishaji
azd version
```

### ❌ "Hakuna usajili ulio patikana" au "Usajili haujowekwa"

```bash
# Orodhesha usajili unaopatikana
az account list --output table

# Weka usajili chaguo-msingi
az account set --subscription "<subscription-id-or-name>"

# Weka kwa mazingira ya AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Thibitisha
az account show
```

### ❌ "InsufficientQuota" au "Kiasi cha usajili kimezidiwa"

```bash
# Jaribu eneo tofauti la Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Au tumia SKUs ndogo zaidi katika maendeleo
# Hariri infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" inashindwa katikati

```bash
# Chaguo 1: Safisha na jaribu tena
azd down --force --purge
azd up

# Chaguo 2: Rekebisha miundombinu tu
azd provision

# Chaguo 3: Angalia kumbukumbu za kina
azd show
azd logs
```

### ❌ "Uthibitishaji umefanikiwa" au "Tokeni imeisha muda wake"

```bash
# Thibitisha upya
az logout
az login

azd auth logout
azd auth login

# Thibitisha uthibitishaji
az account show
```

### ❌ "Rasilimali tayari ipo" au migongano ya majina

```bash
# AZD inazalisha majina ya kipekee, lakini ikiwa kuna mgongano:
azd down --force --purge

# Kisha jaribu tena kwa mazingira mapya
azd env new dev-v2
azd up
```

### ❌ Kuweka templeti kunachukua muda mrefu sana

**Muda wa kawaida wa kusubiri:**
- Programu rahisi ya wavuti: dakika 5-10
- Programu yenye hifadhidata: dakika 10-15
- Programu za AI: dakika 15-25 (Upatikanaji wa OpenAI ni polepole)

```bash
# Angalia maendeleo
azd show

# Ikiwa umekwama zaidi ya dakika 30, angalia Azure Portal:
azd monitor
# Tafuta uanzishwaji uliofeli
```

### ❌ "Ruhusa imekataliwa" au "Imekatazwa"

```bash
# Angalia nafasi yako ya Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Unahitaji angalau nafasi ya "Mchangiaji"
# Muombe msimamizi wako wa Azure atoe:
# - Mchangiaji (kwa rasilimali)
# - Msimamizi wa Upatikanaji wa Mtumiaji (kwa uteuzi wa nafasi)
```

### ❌ Haiwezi kupata URL ya programu iliyopelekwa

```bash
# Onyesha vituo vyote vya huduma
azd show

# Au fungua Azure Portal
azd monitor

# Angalia huduma maalum
azd env get-values
# Tafuta vigezo vya *_URL
```

### 📚 Rasilimali Kamili za Kutatua Matatizo

- **Mwongozo wa Matatizo ya Kawaida:** [Suluhisho Zaidi](docs/troubleshooting/common-issues.md)
- **Matatizo Maalum ya AI:** [Kutatua Matatizo ya AI](docs/troubleshooting/ai-troubleshooting.md)
- **Mwongozo wa Kurekebisha:** [Hatua kwa Hatua za Urekebishaji](docs/troubleshooting/debugging.md)
- **Pata Msaada:** [Discord ya Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Mwongozo wa Haraka wa Kutatua Matatizo

**Matatizo ya kawaida wanayokutana nayo waanzilishi na suluhisho za haraka:**

<details>
<summary><strong>❌ "azd: amri haipatikani"</strong></summary>

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
<summary><strong>❌ "Hakuna usajili ulio patikana" au "Usajili haujowekwa"</strong></summary>

```bash
# Orodhesha usajili uliopo
az account list --output table

# Weka usajili wa msingi
az account set --subscription "<subscription-id-or-name>"

# Weka kwa mazingira ya AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Thibitisha
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" au "Kiasi cha usajili kimezidiwa"</strong></summary>

```bash
# Jaribu eneo tofauti la Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Au tumia SKU ndogo katika maendeleo
# Hariri infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" inashindwa katikati</strong></summary>

```bash
# Chaguo 1: Safisha na jaribu tena
azd down --force --purge
azd up

# Chaguo 2: Rekebisha miundombinu tu
azd provision

# Chaguo 3: Kagua kumbukumbu za kina
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Uthibitishaji umefanikiwa" au "Tokeni imeisha muda wake"</strong></summary>

```bash
# Thibitisha tena
az logout
az login

azd auth logout
azd auth login

# Thibitisha uthibitishaji
az account show
```
</details>

<details>
<summary><strong>❌ "Rasilimali tayari ipo" au migongano ya majina</strong></summary>

```bash
# AZD huunda majina ya kipekee, lakini ikiwa kutatokea mgongano:
azd down --force --purge

# Kisha jaribu tena kwa mazingira mapya
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Kuweka templeti kunachukua muda mrefu sana</strong></summary>

**Muda wa kawaida wa kusubiri:**
- Programu rahisi ya wavuti: dakika 5-10
- Programu yenye hifadhidata: dakika 10-15
- Programu za AI: dakika 15-25 (Upatikanaji wa OpenAI ni polepole)

```bash
# Angalia maendeleo
azd show

# Ikiwa umekwama kwa zaidi ya dakika 30, angalia Azure Portal:
azd monitor
# Tazama kwa ajili ya usambazaji uliofeli
```
</details>

<details>
<summary><strong>❌ "Ruhusa imekataliwa" au "Imekatazwa"</strong></summary>

```bash
# Angalia jukumu lako la Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Unahitaji angalau jukumu la "Contributor"
# Muombe msimamizi wako wa Azure kuidhinisha:
# - Contributor (kwa rasilimali)
# - Msimamizi wa Upatikanaji wa Mtumiaji (kwa upangaji wa majukumu)
```
</details>

<details>
<summary><strong>❌ Haiwezi kupata URL ya programu iliyopelekwa</strong></summary>

```bash
# Onyesha vituo vyote vya huduma
azd show

# Au fungua Azure Portal
azd monitor

# Angalia huduma maalum
azd env get-values
# Tafuta vigezo vya *_URL
```
</details>

### 📚 Rasilimali Kamili za Kutatua Matatizo

- **Mwongozo wa Matatizo ya Kawaida:** [Suluhisho Zaidi](docs/troubleshooting/common-issues.md)
- **Matatizo Maalum ya AI:** [Kutatua Matatizo ya AI](docs/troubleshooting/ai-troubleshooting.md)
- **Mwongozo wa Kurekebisha:** [Hatua kwa Hatua za Urekebishaji](docs/troubleshooting/debugging.md)
- **Pata Msaada:** [Discord ya Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kukamilisha Kozi & Cheti

### Ufuatiliaji wa Maendeleo
Fuata maendeleo yako ya kujifunza kupitia kila sura:

- [ ] **Sura ya 1**: Msingi & Anza Haraka ✅
- [ ] **Sura ya 2**: Maendeleo ya Kwanza ya AI ✅  
- [ ] **Sura ya 3**: Usanidi & Uthibitishaji ✅
- [ ] **Sura ya 4**: Miundombinu kama Msimbo & Utoaji ✅
- [ ] **Sura ya 5**: Suluhisho za AI za Wakala Wengi ✅
- [ ] **Sura ya 6**: Ukaguzi & Mipango Kabla ya Utoaji ✅
- [ ] **Sura ya 7**: Kutatua Matatizo & Kurekebisha ✅
- [ ] **Sura ya 8**: Mifumo ya Uzalishaji & Biashara ✅

### Uthibitisho wa Kujifunza
Baada ya kukamilisha kila sura, thibitisha maarifa yako kwa:
1. **Mazoezi ya Vitendo**: Kamilisha utekelezaji wa sura hiyo
2. **Ukaguzi wa Maarifa**: Pitia sehemu ya FAQ kwa sura yako
3. **Majadiliano ya Jamii**: Shiriki uzoefu wako katika Azure Discord
4. **Sura Ifuatayo**: Hamisha kwenye ngazi inayofuata ya ugumu

### Manufaa ya Kukamilisha Kozi
Baada ya kukamilisha sura zote, utakuwa na:
- **Uzoefu wa Uzalishaji**: Umepelekwa programu halisi za AI kwenye Azure
- **Ujuzi wa Kitaalamu**: Uwezo wa utoaji wa viwanda  
- **Utambuzi wa Jamii**: Mwanachama hai wa jumuiya ya waendelezaji Azure
- **Kuendeleza Kazi**: Ujuzi unaohitajika wa AZD na utoaji wa AI

---

## 🤝 Jamii & Msaada

### Pata Msaada & Usaidizi
- **Matatizo ya Kiufundi**: [Ripoti dosari na ombi la sifa](https://github.com/microsoft/azd-for-beginners/issues)
- **Maswali ya Kujifunza**: [Jumuiya ya Microsoft Azure Discord](https://discord.gg/microsoft-azure) na [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Msaada Maalum wa AI**: Jiunge na [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Nyaraka**: [Nyaraka Rasmi za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Maarifa ya Jamii kutoka Microsoft Foundry Discord

**Matokeo ya Uchunguzi wa Hali ya Hivi Karibuni kutoka #Azure Channel:**
- **45%** ya waendelezaji wanataka kutumia AZD kwa mzigo wa AI
- **Changamoto kuu:** Utoaji wa huduma nyingi, usimamizi wa vyeti, maandalizi ya uzalishaji  
- **Ombi la Juu:** Templeti maalum za AI, mwongozo wa kutatua matatizo, mbinu bora

**Jiunge na jamii yetu ili:**
- Shiriki uzoefu wako wa AZD + AI na upate msaada
- Pata maonyesho ya awali ya templeti mpya za AI
- Changia mbinu bora za utoaji wa AI
- Kuathiri maendeleo ya vipengele vya AI + AZD vya baadaye

### Kuchangia Kozi
Tunakaribisha michango! Tafadhali soma [Mwongozo wa Michango](CONTRIBUTING.md) kwa maelezo ya:
- **Kuboresha Maudhui**: Boresha sura na mifano iliyopo
- **Mifano Mpya**: Ongeza hali halisi na templeti  
- **Tafsiri**: Saidia kudumisha msaada wa lugha nyingi
- **Ripoti za Kasoro**: Boresha usahihi na uwazi
- **Viwango vya Jamii**: Fuata miongozo yetu ya jamii jumuishi

---

## 📄 Taarifa za Kozi

### Leseni
Mradi huu umepewa leseni chini ya Leseni ya MIT - angalia faili la [LICENSE](../../LICENSE) kwa maelezo.

### Rasilimali Zinazohusiana za Kujifunza za Microsoft

Timu yetu hutengeneza kozi zingine kamili za kujifunza:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j kwa Waanzilishi](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js kwa Waanzilishi](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Wakala
[![AZD kwa Waanzilishi](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI kwa Waanzilishi](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP kwa Waanzilishi](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Wakala wa AI kwa Waanzilishi](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Mfululizo wa AI wa Kizazi
[![AI ya Kizazi kwa Waanzilishi](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI ya Kizazi (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI ya Kizazi (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![AI ya Kizazi (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kujifunza Msingi
[![ML kwa Waanzilishi](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Sayansi ya Data kwa Waanzilishi](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI kwa Waamuzi](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Usalama wa Mtandao kwa Waamuzi](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Maendeleo ya Wavuti kwa Waamuzi](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT kwa Waamuzi](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Maendeleo ya XR kwa Waamuzi](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Mfululizo wa Copilot
[![Copilot kwa Programu ya Pindi-pindi ya AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot kwa C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Msafiri wa Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Urambazaji wa Kozi

**🚀 Tayari Kuanzia Kujifunza?**

**Waamuzi**: Anza na [Sura 1: Msingi & Anza Haraka](../..)  
**Waendelezaji wa AI**: Ruka hadi [Sura 2: Maendeleo ya Kwanza ya AI](../..)  
**Waendelezaji Wenye Uzoefu**: Anza na [Sura 3: Usanidi & Uthibitishaji](../..)

**Hatua Zifuatazo**: [Anza Sura 1 - Misingi ya AZD](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tangazo la Haki**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka asili katika lugha yake ya asili inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya mtaalamu wa binadamu inapendekezwa. Hatubeba dhamana kwa kutoelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->