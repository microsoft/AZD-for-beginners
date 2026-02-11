# AZD Kwa Waanzilishi: Safari ya Kujifunza Iliyopangwa

![AZD kwa Waanzilishi](../../translated_images/sw/azdbeginners.5527441dd9f74068.webp) 

[![Watazamaji wa GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forks za GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Nyota za GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord ya Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord ya Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Tafsiri za Kiotomatiki (Zinazosasishwa Kila Wakati)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](./README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Ungependelea Kutumia Nakala (Clone) Kwenye Kompyuta Yako?**
>
> Hazina hii ina tafsiri za lugha 50+ ambazo zinaongeza kwa kiasi kikubwa saizi ya kupakua. Ili kukopa bila tafsiri, tumia sparse checkout:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Hii inakupa kila kitu unachohitaji kukamilisha kozi kwa kupakua kwa haraka zaidi.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) ni Nini?

**Azure Developer CLI (azd)** ni chombo cha mstari wa amri kilichotengenezwa kwa msanidi programu kinachorahisisha kupeleka programu kwenye Azure. Badala ya kuunda na kuunganisha rasilimali nyingi za Azure kwa mkono, unaweza kupeleka programu nzima kwa amri moja.

### Uchawi wa `azd up`

```bash
# Amri hii moja inafanya kila kitu:
# ✅ Inawekeza rasilimali zote za Azure
# ✅ Inaandaa mtandao na usalama
# ✅ Inajenga msimbo wa programu yako
# ✅ Inawekeza kwenye Azure
# ✅ Inakupa URL inayofanya kazi
azd up
```

**Hivyo ndivyo!** Hakuna kubofya kwenye Azure Portal, hakuna templates ngumu za ARM za kujifunza kwanza, hakuna usanidi wa mkono - tu programu zinazofanya kazi kwenye Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Tofauti ni Nini?

Hii ndiyo swali linaloulizwa mara kwa mara na waanzilishi. Hapa kuna jibu rahisi:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Madhumuni** | Dhibiti rasilimali za Azure kibinafsi | Peleka programu kamili |
| **Mtazamo** | Inazingatia miundombinu | Inazingatia programu |
| **Mfano** | `az webapp create --name myapp...` | `azd up` |
| **Mara ya Kujifunza** | Lazima ujue huduma za Azure | Jua tu programu yako |
| **Bora Kwa** | DevOps, Miundombinu | Waendelezaji, Uundaji wa majaribio |

### Mfano Rahisi

- **Azure CLI** ni kama kuwa na zana zote za kujenga nyumba - vijiti, nyundo, msumari. Unaweza kujenga chochote, lakini unahitaji ujuzi wa ujenzi.
- **Azure Developer CLI** ni kama kuajiri mkandarasi - unaelezea unachotaka, wao wanashughulikia ujenzi.

### Wakati wa Kutumia Kila Moja

| Scenario | Tumia Hii |
|----------|----------|
| "Nataka kupeleka web app yangu haraka" | `azd up` |
| "Nahitaji kuunda akaunti ya uhifadhi pekee" | `az storage account create` |
| "Ninaunda programu kamili ya AI" | `azd init --template azure-search-openai-demo` |
| "Nahitaji kufuata kosa kwenye rasilimali maalum ya Azure" | `az resource show` |
| "Nataka utoaji wa uzalishaji kwa dakika chache" | `azd up --environment production` |

### Wanatumika Pamoja!

AZD hutumia Azure CLI chini ya hood. Unaweza kutumia zote:
```bash
# Weka app yako na AZD
azd up

# Kisha rekebisha rasilimali maalum kwa Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Pata Violezo kwenye Awesome AZD

Usianze kutoka sifuri! **Awesome AZD** ni mkusanyiko wa jamii wa violezo vinavyotumika moja kwa moja:

| Rasilimali | Maelezo |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Vinjari 200+ vya templates na upeleke kwa bonyeza moja |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Changia kiolezo chako kwa jamii |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Piga nyota na uchambue chanzo |

### Violezo maarufu vya AI kutoka Awesome AZD

```bash
# Mazungumzo ya RAG na Azure OpenAI + Utafutaji wa AI
azd init --template azure-search-openai-demo

# Programu ya Mazungumzo ya AI ya Haraka
azd init --template openai-chat-app-quickstart

# Wakala wa AI kwa Wakala wa Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Kuanzia kwa Hatua 3

### Hatua 1: Sakinisha AZD (dakika 2)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Hatua 2: Ingia kwenye Azure

```bash
azd auth login
```

### Hatua 3: Peleka Programu Yako ya Kwanza

```bash
# Anzisha kutoka kwenye kiolezo
azd init --template todo-nodejs-mongo

# Tumia kwenye Azure (huunda kila kitu!)
azd up
```

**🎉 Hivyo ndivyo!** Programu yako sasa iko hai kwenye Azure.

### Usafishaji (Usisahau!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Jinsi ya Kutumia Kozi Hii

Kozi hii imeundwa kwa ajili ya **kujifunza hatua kwa hatua** - anza mahali unapo jiachilia na endelea pole pole:

| Uzoefu Wako | Anza Hapa |
|-----------------|------------|
| **Mpya kabisa kwa Azure** | [Sura 1: Misingi](../..) |
| **Unajua Azure, mpya kwa AZD** | [Sura 1: Misingi](../..) |
| **Unataka kupeleka programu za AI** | [Sura 2: Maendeleo ya AI](../..) |
| **Unataka mazoezi ya vitendo** | [🎓 Warsha ya Kiutendaji](workshop/README.md) - maabara ya masaa 3-4 yenye mwongozo |
| **Unahitaji mifumo ya uzalishaji** | [Sura 8: Uzalishaji & Shirika](../..) |

### Usanidi wa Haraka

1. **Tengeneza Fork ya Hazina Hii**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Nakili (Clone)**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Pata Msaada**: [Jamii ya Azure kwenye Discord](https://discord.com/invite/ByRwuEEgH4)

> **Unapendelea Kufanya Clone Kwenye Kompyuta Yako?**

> Hazina hii ina tafsiri za lugha 50+ ambazo zinaongeza kwa kiasi kikubwa saizi ya kupakua. Ili kukopa bila tafsiri, tumia sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Hii inakupa kila kitu unachohitaji kukamilisha kozi kwa kupakua kwa haraka zaidi.


## Muhtasari wa Kozi

Tawala Azure Developer CLI (azd) kupitia sura zilizoandaliwa kwa kujifunza hatua kwa hatua. **Kipaumbele maalum kwa upeleka wa programu za AI kwa integracji ya Microsoft Foundry.**

### Kwa Nini Kozi Hii ni Muhimu kwa Waendelezaji wa Kisasa

Kulingana na maoni ya jamii ya Discord ya Microsoft Foundry, **watengenezaji 45% wanataka kutumia AZD kwa mzigo wa kazi wa AI** lakini wanakutana na changamoto za:
- Miundombinu tata ya huduma nyingi za AI
- Mifumo bora ya utoaji wa AI kwenye uzalishaji  
- Uunganishaji na usanidi wa huduma za Azure AI
- Uboreshaji wa gharama kwa mzigo wa kazi wa AI
- Utatuzi wa matatizo maalum ya utoaji wa AI

### Malengo ya Kujifunza

Kwa kukamilisha kozi hii iliyoandaliwa, utakuwa na uwezo wa:
- **Tumia Misingi ya AZD**: Mfahamu dhana za msingi, usakinishaji, na usanidi
- **Peleka Programu za AI**: Tumia AZD na huduma za Microsoft Foundry
- **Tekeleza Miundombinu kama Msimbo**: Simamia rasilimali za Azure kwa templates za Bicep
- **Tafuta na Rekebisha Tatizo za Utoaji**: Rejesha matatizo ya kawaida na utumie debugging
- **Boresha kwa Uzalishaji**: Usalama, upanuaji, ufuatiliaji, na usimamizi wa gharama
- **Jenga Suluhisho za Wakala-Mengi**: Peleka miundo ngumu ya AI

## 🗺️ Ramani ya Kozi: Uvinjari wa Haraka kwa Sura

Kila sura ina README maalum na malengo ya kujifunza, kuanza kwa haraka, na mazoezi:

| Sura | Mada | Masomo | Muda | Ugumu |
|---------|-------|---------|----------|------------|
| **[Sura 1: Misingi](docs/chapter-01-foundation/README.md)** | Kuanzishwa | [Misingi ya AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Usakinishaji](docs/chapter-01-foundation/installation.md) &#124; [Mradi wa Kwanza](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Sura 2: Maendeleo ya AI](docs/chapter-02-ai-development/README.md)** | Programu za AI-Kwanza | [Uunganishaji na Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Maajenti ya AI](docs/chapter-02-ai-development/agents.md) &#124; [Uwekaji wa Modeli](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Warsha](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Sura 3: Usanidi](docs/chapter-03-configuration/README.md)** | Uthibitisho & Usalama | [Usanidi](docs/chapter-03-configuration/configuration.md) &#124; [Uthibitisho & Usalama](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Miundombinu](docs/chapter-04-infrastructure/README.md)** | IaC na Uwekaji | [Mwongozo wa Uwekaji](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Upangaji Rasilimali](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 saa | ⭐⭐⭐ |
| **[Ch 5: Wakala Mingi](docs/chapter-05-multi-agent/README.md)** | Suluhisho za Wakala za AI | [Mfano wa Rejareja](examples/retail-scenario.md) &#124; [Mifumo ya Uratibu](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 saa | ⭐⭐⭐⭐ |
| **[Ch 6: Kabla ya Uwekaji](docs/chapter-06-pre-deployment/README.md)** | Mipango na Uthibitisho | [Ukaguzi wa Kabla ya Uwekaji](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Mipango ya Uwezo](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Uchaguzi wa SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 saa | ⭐⭐ |
| **[Ch 7: Utatuzi wa Matatizo](docs/chapter-07-troubleshooting/README.md)** | Utatuzi & Urekebishaji | [Masuala ya Kawaida](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Uchambuzi wa Mende](docs/chapter-07-troubleshooting/debugging.md) &#124; [Masuala ya AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 saa | ⭐⭐ |
| **[Ch 8: Uzalishaji](docs/chapter-08-production/README.md)** | Mifumo ya Shirika | [Maboresho ya Uzalishaji](docs/chapter-08-production/production-ai-practices.md) | 2-3 saa | ⭐⭐⭐⭐ |
| **[🎓 Warsha](workshop/README.md)** | Maabara ya Vitendo | [Utangulizi](workshop/docs/instructions/0-Introduction.md) &#124; [Uteuzi](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Uthibitisho](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Uchanganuzi](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Usanidi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Marekebisho](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Kuvunja Miundombinu](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Hitimisho](workshop/docs/instructions/7-Wrap-up.md) | 3-4 saa | ⭐⭐ |

**Jumla ya Muda wa Kozi:** ~10-14 masaa | **Maendeleo ya Ujuzi:** Mwanzo → Tayari kwa Uzalishaji

---

## 📚 Sura za Kujifunza

*Chagua njia yako ya kujifunza kulingana na kiwango cha uzoefu na malengo*

### 🚀 Sura 1: Msingi & Anza Haraka
**Masharti ya awali**: Usajili wa Azure, maarifa ya msingi ya mstari wa amri  
**Muda**: dakika 30-45  
**Ugumu**: ⭐

#### Kile Utakachojifunza
- Kuelewa msingi wa Azure Developer CLI
- Kusakinisha AZD kwenye jukwaa lako
- Uwekaji wako wa kwanza uliofanikiwa

#### Rasilimali za Kujifunzia
- **🎯 Anza Hapa**: [Azure Developer CLI ni nini?](../..)
- **📖 Nadharia**: [Msingi wa AZD](docs/chapter-01-foundation/azd-basics.md) - Dhana msingi na istilahi
- **⚙️ Usanidi**: [Ufungaji & Usanidi](docs/chapter-01-foundation/installation.md) - Mwongozo maalum wa jukwaa
- **🛠️ Vitendo**: [Mradi Wako wa Kwanza](docs/chapter-01-foundation/first-project.md) - Mafunzo hatua kwa hatua
- **📋 Rejea ya Haraka**: [Orodha ya Mwongozo wa Amri](resources/cheat-sheet.md)

#### Mazoezi ya Vitendo
```bash
# Ukaguzi wa haraka wa usakinishaji
azd version

# Sambaza programu yako ya kwanza
azd init --template todo-nodejs-mongo
azd up
```

**💡 Matokeo ya Sura**: Kuweka kwa mafanikio programu rahisi ya wavuti kwenye Azure kwa kutumia AZD

**✅ Uthibitisho wa Mafanikio:**
```bash
# Baada ya kumaliza Sura ya 1, unapaswa kuwa na uwezo wa:
azd version              # Inaonyesha toleo lililosakinishwa
azd init --template todo-nodejs-mongo  # Inaanzisha mradi
azd up                  # Inaweka kwenye Azure
azd show                # Inaonyesha URL ya programu inayokimbia
# Programu inafunguka kwenye kivinjari na inafanya kazi
azd down --force --purge  # Inasafisha rasilimali
```

**📊 Muda uliotumika:** dakika 30-45  
**📈 Kiwango cha Ujuzi Baadaye:** Unaweza kuweka programu za msingi kwa kujitegemea

**✅ Uthibitisho wa Mafanikio:**
```bash
# Baada ya kumaliza Sura ya 1, unapaswa kuwa na uwezo wa:
azd version              # Inaonyesha toleo lililosakinishwa
azd init --template todo-nodejs-mongo  # Inaanzisha mradi
azd up                  # Inaweka kwenye Azure
azd show                # Inaonyesha URL ya programu inayokimbia
# Programu inafunguka kwenye kivinjari na inafanya kazi
azd down --force --purge  # Inasafisha rasilimali
```

**📊 Muda uliotumika:** dakika 30-45  
**📈 Kiwango cha Ujuzi Baadaye:** Unaweza kuweka programu za msingi kwa kujitegemea

---

### 🤖 Sura 2: Maendeleo ya AI-Kwanza (Inayopendekezwa kwa Waendelezaji wa AI)
**Masharti ya awali**: Sura 1 imekamilika  
**Muda**: 1-2 saa  
**Ugumu**: ⭐⭐

#### Kile Utakachojifunza
- Uingiliano wa Microsoft Foundry na AZD
- Kuweka programu zinazotumia AI
- Kuelewa usanidi wa huduma za AI

#### Rasilimali za Kujifunzia
- **🎯 Anza Hapa**: [Uingiliano wa Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Mawakala ya AI**: [Mwongozo wa Mawakala ya AI](docs/chapter-02-ai-development/agents.md) - Weka mawakala wa akili kwa kutumia AZD
- **📖 Mifumo**: [Uwekaji wa Mifano ya AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Weka na simamia mifano ya AI
- **🛠️ Warsha**: [Lab ya Warsha ya AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tengeneza suluhisho za AI ziko tayari kwa AZD
- **🎥 Mwongozo wa Kimingiliano**: [Vifaa vya Warsha](workshop/README.md) - Mafunzo kwa kivinjari kwa MkDocs * DevContainer Environment
- **📋 Violezo**: [Violezo vya Microsoft Foundry](../..)
- **📝 Mifano**: [Mifano za Uwekaji wa AZD](examples/README.md)

#### Mazoezi ya Vitendo
```bash
# Weka programu yako ya kwanza ya AI
azd init --template azure-search-openai-demo
azd up

# Jaribu templeti za ziada za AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Matokeo ya Sura**: Kuweka na kusanidi programu ya mazungumzo inayotumia AI yenye uwezo wa RAG

**✅ Uthibitisho wa Mafanikio:**
```bash
# Baada ya Sura ya 2, unapaswa kuwa na uwezo wa:
azd init --template azure-search-openai-demo
azd up
# Jaribu kiolesura cha mazungumzo cha AI
# Uliza maswali na upate majibu ya AI yanayokuja na vyanzo
# Thibitisha kwamba ujumuishaji wa utafutaji unafanya kazi
azd monitor  # Angalia Application Insights inaonyesha data za telemetri
azd down --force --purge
```

**📊 Muda uliotumika:** 1-2 saa  
**📈 Kiwango cha Ujuzi Baadaye:** Unaweza kuweka na kusanidi programu za AI zinazostahiki uzalishaji  
**💰 Uelewa wa Gharama:** Elewa gharama za maendeleo $80-150/mwezi, gharama za uzalishaji $300-3500/mwezi

#### 💰 Mambo ya Kuzingatia Gharama kwa Uwekaji wa AI

**Mazingira ya Maendeleo (Makadirio $80-150/mwezi):**
- Azure OpenAI (Pay-as-you-go): $0-50/mwezi (kutegemea matumizi ya tokeni)
- AI Search (tier ya Basic): $75/mwezi
- Container Apps (Consumption): $0-20/mwezi
- Storage (Standard): $1-5/mwezi

**Mazingira ya Uzalishaji (Makadirio $300-3,500+/mwezi):**
- Azure OpenAI (PTU kwa utendaji thabiti): $3,000+/mwezi AU Pay-as-you-go kwa matumizi makubwa
- AI Search (tier ya Standard): $250/mwezi
- Container Apps (Dedicated): $50-100/mwezi
- Application Insights: $5-50/mwezi
- Storage (Premium): $10-50/mwezi

**💡 Vidokezo vya Kupunguza Gharama:**
- Tumia **Free Tier** ya Azure OpenAI kwa kujifunza (tokeni 50,000/mwezi ziko ndani)
- Endesha `azd down` ili kuondoa rasilimali wakati hauendi kwa maendeleo
- Anza kwa bili inayotokana na matumizi (consumption-based), ongeza hadi PTU tu kwa uzalishaji
- Tumia `azd provision --preview` kukadiria gharama kabla ya uwekaji
- Washa auto-scaling: lipa tu kwa matumizi halisi

**Ufuatiliaji wa Gharama:**
```bash
# Angalia makadirio ya gharama za kila mwezi
azd provision --preview

# Fuatilia gharama halisi katika Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Sura 3: Usanidi & Uthibitishaji
**Masharti ya awali**: Sura 1 imekamilika  
**Muda**: dakika 45-60  
**Ugumu**: ⭐⭐

#### Kile Utakachojifunza
- Usanidi na usimamizi wa mazingira
- Uthibitishaji na mbinu bora za usalama
- Kujaribu majina ya rasilimali na upangaji

#### Rasilimali za Kujifunzia
- **📖 Usanidi**: [Mwongozo wa Usanidi](docs/chapter-03-configuration/configuration.md) - Usanidi wa mazingira
- **🔐 Usalama**: [Mifumo ya uthibitishaji na utambulisho uliosimamiwa](docs/chapter-03-configuration/authsecurity.md) - Mifumo ya uthibitishaji
- **📝 Mifano**: [Mfano wa Programu ya Hifadhidata](examples/database-app/README.md) - Mifano ya Hifadhidata ya AZD

#### Mazoezi ya Vitendo
- Sanidi mazingira mengi (dev, staging, prod)
- Weka uthibitishaji wa utambulisho uliosimamiwa
- Tekeleza usanidi maalumu kwa mazingira

**💡 Matokeo ya Sura**: Dhibiti mazingira mengi kwa uthibitishaji na usalama sahihi

---

### 🏗️ Sura 4: Miundombinu kama Msimbo & Uwekaji
**Masharti ya awali**: Sura 1-3 zimekamilika  
**Muda**: 1-1.5 saa  
**Ugumu**: ⭐⭐⭐

#### Kile Utakachojifunza
- Mifumo ya juu ya uwekaji
- Miundombinu kama Msimbo kwa Bicep
- Mikakati ya upangaji rasilimali

#### Rasilimali za Kujifunzia
- **📖 Uwekaji**: [Mwongozo wa Uwekaji](docs/chapter-04-infrastructure/deployment-guide.md) - Mchakato kamili
- **🏗️ Upangaji Rasilimali**: [Upangaji Rasilimali](docs/chapter-04-infrastructure/provisioning.md) - Usimamizi wa rasilimali za Azure
- **📝 Mifano**: [Mfano wa Container App](../../examples/container-app) - Uwekaji kwa kutumia container

#### Mazoezi ya Vitendo
- Tengeneza violezo vya Bicep maalum
- Weka programu za huduma nyingi
- Tekeleza mikakati ya uwasilishaji blue-green

**💡 Matokeo ya Sura**: Weka programu tata za huduma nyingi kwa kutumia violezo vya miundombinu vilivyotengenezwa maalum

---

### 🎯 Sura 5: Suluhisho za AI za Wakala Mingi (Kiwango cha Juu)
**Masharti ya awali**: Sura 1-2 zimekamilika  
**Muda**: 2-3 saa  
**Ugumu**: ⭐⭐⭐⭐

#### Kile Utakachojifunza
- Mifumo ya usanifu wa mawakala wengi
- Uratibu na uratibu wa mawakala
- Uwekaji wa AI tayari kwa uzalishaji

#### Rasilimali za Kujifunzia
- **🤖 Mradi Ulioangaziwa**: [Suluhisho la Wakala Wingi la Rejareja](examples/retail-scenario.md) - Utekelezaji kamili
- **🛠️ Kifurushi cha Violezo vya ARM**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Uwekaji kwa bonyeza moja
- **📖 Usanifu**: [Mifumo ya uratibu wa mawakala wengi](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mifumo

#### Mazoezi ya Vitendo
```bash
# Weka suluhisho kamili la mawakala wengi kwa rejareja
cd examples/retail-multiagent-arm-template
./deploy.sh

# Chunguza mipangilio ya mawakala
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Matokeo ya Sura**: Weka na simamia suluhisho la AI la mawakala wengi linalostahiki uzalishaji na Mawakala wa Mteja na Hesabu

---

### 🔍 Sura 6: Uhakiki na Mipango Kabla ya Uwekaji
**Masharti ya awali**: Sura 4 imekamilika  
**Muda**: 1 saa  
**Ugumu**: ⭐⭐

#### Kile Utakachojifunza
- Mipango ya uwezo na uhakiki wa rasilimali
- Mikakati ya uchaguzi wa SKU
- Ukaguzi wa kabla ya uwekaji na uautomatishaji

#### Rasilimali za Kujifunzia
- **📊 Mipango**: [Mipango ya Uwezo](docs/chapter-06-pre-deployment/capacity-planning.md) - Uhakiki wa rasilimali
- **💰 Uchaguzi**: [Uchaguzi wa SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Chaguzi za gharama nafuu
- **✅ Uthibitisho**: [Ukaguzi wa Kabla ya Uwekaji](docs/chapter-06-pre-deployment/preflight-checks.md) - Skripti za otomatiki

#### Mazoezi ya Vitendo
- Endesha skripti za uhakiki wa uwezo
- Boresha uchaguzi wa SKU kwa gharama
- Tekeleza ukaguzi wa kabla ya uwekaji kwa njia ya otomatiki

**💡 Matokeo ya Sura**: Thibitisha na boresha uwekaji kabla ya utekelezaji

---

### 🚨 Sura 7: Utatuzi wa Matatizo & Urekebishaji
**Masharti ya awali**: Sura yoyote ya uwekaji imekamilika  
**Muda**: 1-1.5 saa  
**Ugumu**: ⭐⭐

#### Kile Utakachojifunza
- Mbinu za kimfumo za uchambuzi wa matatizo
- Masuala ya kawaida na suluhisho
- Utatuzi maalumu wa AI

#### Rasilimali za Kujifunzia
- **🔧 Masuala ya Kawaida**: [Masuala ya Kawaida](docs/chapter-07-troubleshooting/common-issues.md) - Maswali yanayoulizwa mara kwa mara na suluhisho
- **🕵️ Uchambuzi wa Mende**: [Mwongozo wa Uchambuzi wa Mende](docs/chapter-07-troubleshooting/debugging.md) - Mikakati hatua kwa hatua
- **🤖 Masuala ya AI**: [Utatuzi wa Matatizo Maalumu kwa AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Matatizo ya huduma za AI

#### Mazoezi ya Vitendo
- Tambua kushindwa kwa uwekaji
- Tatua matatizo ya uthibitishaji
- Fuatilia muunganisho wa huduma za AI

**💡 Matokeo ya Sura**: Tambua na tatua matatizo ya kawaida ya uwekaji kwa kujitegemea

---

### 🏢 Sura 8: Uzalishaji & Mifumo ya Shirika
**Masharti ya awali**: Sura 1-4 zimekamilika  
**Muda**: 2-3 saa  
**Ugumu**: ⭐⭐⭐⭐

#### Kile Utakachojifunza
- Mikakati ya uwekaji kwa uzalishaji
- Mifumo ya usalama ya shirika
- Ufuatiliaji na uboreshaji wa gharama

#### Rasilimali za Kujifunzia
- **🏭 Uzalishaji**: [Mbinu Bora za AI kwa Uzalishaji](docs/chapter-08-production/production-ai-practices.md) - Mifumo ya shirika
- **📝 Mifano**: [Mfano wa Microservices](../../examples/microservices) - Miamala tata
- **📊 Ufuatiliaji**: [Uunganisho wa Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Ufuatiliaji

#### Mazoezi ya Vitendo
- Tekeleza mifumo ya usalama ya shirika
- Sanidi ufuatiliaji kamili
- Weka kwenye uzalishaji kwa utawala unaofaa

**💡 Matokeo ya Sura**: Weka programu zenye ubora wa shirika na uwezo kamili wa uzalishaji

---

## 🎓 Muhtasari wa Warsha: Uzoefu wa Kujifunza kwa Vitendo

> **⚠️ HALI YA WARSHA: Inaendelea Kuendelezwa**
> Vifaa vya warsha vinaendelea kutengenezwa na kuboreshwa. Moduli za msingi zinafanya kazi, lakini baadhi ya sehemu za juu hazijakamilika. Tunafanya kazi kwa dhati kukamilisha maudhui yote. [Fuatilia maendeleo →](workshop/README.md)

### Vifaa vya Warsha Vinavyoshirikisha
**Uzoefu kamili wa kujifunza kwa vitendo kwa kutumia zana za kivinjari na mazoezi yaliyoongozwa**

Vifaa vya warsha yetu vinatoa uzoefu wa kujifunza uliopangwa na unaoshirikisha ambao unakamilisha mtaala uliotengenezwa kwa sura hapo juu. Warsha imeundwa kwa kujifunza kwa mwendo wako mwenyewe na pia kwa vikao vinavyoongozwa na mwalimu.

#### 🛠️ Vipengele vya Warsha
- **Kiolesura Kinachotumika Kivinjari**: Warsha kamili yenye MkDocs yenye utafutaji, kunakili, na vipengele vya mandhari
- **Uunganisho wa GitHub Codespaces**: Usanidi wa mazingira ya maendeleo kwa bonyeza moja
- **Njia ya Kujifunza Iliyopangwa**: Mazoezi yaliyoongozwa kwa moduli 8 (saa 3-4 kwa jumla)
- **Mbinu ya Hatua kwa Hatua**: Utangulizi → Uchaguzi → Uthibitisho → Uvunjaji → Usanidi → Ubinafsishaji → Uondoaji → Hitimisho
- **Mazingira ya DevContainer Yanayoshirikisha**: Zana na utegemezi zilizopangwa kabla

#### 📚 Muundo wa Moduli za Warsha
Warsha inafuata **mbinu ya hatua 8** inayokuchukua kutoka kwa ugunduzi hadi utaalamu wa utekelezaji:

| Moduli | Mada | Utachofanya | Muda |
|--------|-------|----------------|----------|
| **0. Utangulizi** | Muhtasari wa Warsha | Elewa malengo ya kujifunza, masharti ya awali, na muundo wa warsha | 15 min |
| **1. Uchaguzi** | Ugunduzi wa Violezo | Chunguza violezo vya AZD na chagua kiolezo sahihi cha AI kwa tukio lako | 20 min |
| **2. Uthibitisho** | Weka & Thibitisha | Weka kiolezo kwa `azd up` na thibitisha miundombinu inafanya kazi | 30 min |
| **3. Uvunjaji** | Elewa Muundo | Tumia GitHub Copilot kuchunguza usanifu wa kiolezo, faili za Bicep, na mpangilio wa msimbo | 30 min |
| **4. Usanidi** | Uchunguzi wa Kina wa azure.yaml | Zoea usanidi wa `azure.yaml`, hooks za mzunguko wa maisha, na vigezo vya mazingira | 30 min |
| **5. Ubinafsishaji** | Ifanye Kuwa Yako | Washa AI Search, ufuatiliaji, tathmini, na ubinafsishe kwa tukio lako | 45 min |
| **6. Uondoaji** | Safisha | Ondoa rasilimali kwa usalama kwa `azd down --purge` | 15 min |
| **7. Hitimisho** | Hatua Zifuatazo | Rudia mafanikio, dhana kuu, na endelea safari yako ya kujifunza | 15 min |

**Mtiririko wa Warsha:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Kuanzisha Warsha
```bash
# Chaguo 1: GitHub Codespaces (Inayopendekezwa)
# Bonyeza "Code" → "Create codespace on main" katika hazina

# Chaguo 2: Maendeleo ya ndani
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Fuata maelekezo ya usanidi katika workshop/README.md
```

#### 🎯 Matokeo ya Kujifunza ya Warsha
Kwa kukamilisha warsha, washiriki watakuwa:
- **Weka Programu za AI za Uzalishaji**: Tumia AZD na huduma za Microsoft Foundry
- **Zoea Miundo ya Wakala Wengi**: Tekeleza suluhisho za wakala wa AI zinazoendeshwa kwa uratibu
- **Tekeleza Mambo Bora ya Usalama**: Sanidi uthibitishaji na udhibiti wa ufikiaji
- **Boresha kwa Upanuzi**: Unda ueneaji wa gharama nafuu na wenye utendaji mzuri
- **Tatua Matatizo ya Utekelezaji**: Rekebisha masuala ya kawaida kwa uhuru

#### 📖 Rasilimali za Warsha
- **🎥 Mwongozo wa Kuingiliana**: [Vifaa vya Warsha](workshop/README.md) - Mazingira ya kujifunzia yanayotumia kivinjari
- **📋 Maelekezo Kila Moduli kwa Moduli**:
  - [0. Utangulizi](workshop/docs/instructions/0-Introduction.md) - Muhtasari wa warsha na malengo
  - [1. Uchaguzi](workshop/docs/instructions/1-Select-AI-Template.md) - Tafuta na chagua violezo vya AI
  - [2. Uthibitisho](workshop/docs/instructions/2-Validate-AI-Template.md) - Weka na thibitisha violezo
  - [3. Uvunjaji](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Chunguza usanifu wa kiolezo
  - [4. Usanidi](workshop/docs/instructions/4-Configure-AI-Template.md) - Zoea azure.yaml
  - [5. Ubinafsishaji](workshop/docs/instructions/5-Customize-AI-Template.md) - Ubinafsishaji kwa tukio lako
  - [6. Uondoaji](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Safisha rasilimali
  - [7. Hitimisho](workshop/docs/instructions/7-Wrap-up.md) - Rudia na hatua zinazofuata
- **🛠️ Maabara ya Warsha ya AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Mazoezi yaliyoelekezwa kwa AI
- **💡 Anza Haraka**: [Mwongozo wa Usanidi wa Warsha](workshop/README.md#quick-start) - Usanidi wa mazingira

**Inafaa kwa**: Mafunzo ya kampuni, kozi za chuo kikuu, kujifunza kwa mwendo wako mwenyewe, na bootcamps za watengenezaji.

---

## 📖 Uchunguzi wa Kina: Uwezo wa AZD

Zaidi ya msingi, AZD hutoa vipengele vingi vyenye nguvu kwa utekelezaji wa uzalishaji:

- **Utekelezaji unaotegemea violezo** - Tumia violezo vilivyotengenezwa mapema kwa mifumo ya kawaida ya programu
- **Miundombinu kama Msimbo** - Dhibiti rasilimali za Azure ukitumia Bicep au Terraform  
- **Mtiririko umeunganishwa** - Kwa urahisi tunga, weka, na fuatilia programu
- **Rafiki kwa watengenezaji** - Imeboreshwa kwa uzalishaji na uzoefu wa watengenezaji

### **AZD + Microsoft Foundry: Inafaa kwa Utekelezaji wa AI**

**Kwa nini AZD kwa Suluhisho za AI?** AZD inashughulikia changamoto kuu zinazowakabili watengenezaji wa AI:

- **Violezo Tayari kwa AI** - Violezo vilivyopangwa kabla kwa Azure OpenAI, Cognitive Services, na mizigo ya kazi ya ML
- **Utekelezaji wa AI Salama** - Mifumo ya usalama iliyojengwa kwa huduma za AI, API keys, na model endpoints  
- **Mifumo ya AI kwa Uzalishaji** - Mbinu bora za utekelezaji wa programu za AI zinazoweza kupanuka na gharama nafuu
- **Mtiririko wa AI Kuanzia Mwisho kwa Mwisho** - Kutoka katika ukuzaji wa modeli hadi utekelezaji wa uzalishaji na ufuatiliaji sahihi
- **Uboreshaji wa Gharama** - Ugawaji wa rasilimali wenye busara na mikakati ya kupanua kwa mizigo ya kazi ya AI
- **Uunganisho na Microsoft Foundry** - Muunganisho usio na mshono na katalogi ya modeli na endpoints za Microsoft Foundry

---

## 🎯 Maktaba ya Violezo & Mifano

### Imeangaziwa: Violezo vya Microsoft Foundry
**Anza hapa ikiwa unatekeleza programu za AI!**

> **Kumbuka:** Violezo hivi vinaonyesha mifumo mbalimbali ya AI. Baadhi ni Azure Samples za nje, wengine ni utekelezaji wa ndani.

| Template | Sura | Ugumu | Huduma | Aina |
|----------|---------|------------|----------|------|
| [**Anza na mazungumzo ya AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Sura 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Nje |
| [**Anza na mawakala wa AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Sura 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Nje |
| [**Demo: Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Sura 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Nje |
| [**Mwanzo wa OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Sura 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Nje |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Sura 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Nje |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Sura 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Nje |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Sura 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Ndani** |

### Imeangaziwa: Mifano Kamili ya Kujifunza
**Violezo vya programu ziko tayari kwa uzalishaji vilivyopangwa kwa sura za kujifunza**

| Template | Sura ya Kujifunza | Ugumu | Mafunzo Muhimu |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Sura 2 | ⭐ | Mifumo ya msingi ya utekelezaji wa AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Sura 2 | ⭐⭐ | Utekelezaji wa RAG kwa kutumia Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Sura 4 | ⭐⭐ | Uunganishaji wa Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Sura 5 | ⭐⭐⭐ | Mfumo wa wakala na function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Sura 8 | ⭐⭐⭐ | Uratibu wa AI kwa kiwango cha kampuni |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Sura 5 | ⭐⭐⭐⭐ | Miundo ya wakala wengi kwa Wateja na Wakala wa Mali |

### Kujifunza kwa Aina ya Mfano

> **📌 Mifano ya Ndani vs. Mifano ya Nje:**  
> **Mifano ya Ndani** (katika repo hii) = Tayari kutumika mara moja  
> **Mifano ya Nje** (Azure Samples) = Nakili kutoka kwa repositories zilizopeanwa

#### Mifano ya Ndani (Tayari Kutumika)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Utekelezaji kamili wenye uzalishaji tayari na templates za ARM
  - Miundo ya wakala wengi (Wakala wa Mteja + Wakala wa Ghavamaji)
  - Ufuatiliaji na tathmini kamili
  - Uwekaji kwa bonyeza moja kupitia template ya ARM

#### Mifano ya Ndani - Programu za Container (Sura 2-5)
**Mifano kamili ya utekelezaji wa kontena katika repo hii:**
- [**Mifano ya Programu za Container**](examples/container-app/README.md) - Mwongozo kamili wa utekelezaji wa kontena
  - [API Rahisi ya Flask](../../examples/container-app/simple-flask-api) - REST API ya msingi yenye scale-to-zero
  - [Usanifu wa Microservices](../../examples/container-app/microservices) - Utekelezaji wa huduma nyingi kwa uzalishaji
  - Mwanzo wa Haraka, Uzalishaji, na mifumo ya Kuendelea
  - Ufuatiliaji, usalama, na miongozo ya uboreshaji wa gharama

#### Mifano ya Nje - Programu Rahisi (Sura 1-2)
**Nakili repositories hizi za Azure Samples ili kuanza:**
- [Programu Rahisi ya Wavuti - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mifumo ya msingi ya utekelezaji
- [Tovuti Tulivu - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Utekelezaji wa maudhui ya static
- [Programu ya Container - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Utekelezaji wa REST API

#### Mifano ya Nje - Uunganishaji wa Database (Sura 3-4)  
- [Programu ya Database - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mifumo ya muunganisho wa database
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Mtiririko wa data bila server

#### Mifano ya Nje - Mifumo ya Juu (Sura 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Miundo ya huduma nyingi
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Usindikaji wa kazi za nyuma  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Mifumo ya ML inayofaa kwa uzalishaji

### Mkusanyiko wa Violezo vya Nje
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Mkusanyiko uliokokotolewa wa violezo rasmi na vya jamii
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Nyaraka za violezo za Microsoft Learn
- [**Examples Directory**](examples/README.md) - Mifano ya kujifunzia ya ndani yenye maelezo ya kina

---

## 📚 Rasilimali za Kujifunza & Marejeo

### Marejeo ya Haraka
- [**Karatasi ya Mbinu za Amri**](resources/cheat-sheet.md) - Amri muhimu za azd zilizopangwa kwa sura
- [**Kamusi**](resources/glossary.md) - Nomenklatura ya Azure na azd  
- [**Maswali Yanayoulizwa Mara kwa Mara**](resources/faq.md) - Maswali ya kawaida yaliyopangwa kwa sura za kujifunza
- [**Mwongozo wa Kusoma**](resources/study-guide.md) - Mazoezi ya kina ya mazoezi

### Warsha za Vitendo
- [**Maabara ya Warsha ya AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Fanya suluhisho zako za AI ziwe zinazoeleweka na AZD (saa 2-3)
- [**Warsha Inayoshirikisha**](workshop/README.md) - Mazoezi yaliyoongozwa ya moduli 8 kwa MkDocs na GitHub Codespaces
  - Inafuata: Utangulizi → Uchaguzi → Uthibitisho → Uvunjaji → Usanidi → Ubinafsishaji → Uondoaji → Hitimisho

### Rasilimali za Kujifunza za Nje
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Mwongozo wa Haraka wa Utatuzi wa Matatizo

Masuala ya kawaida watazamaji wapya hukutana nayo na suluhisho za papo hapo:

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

# Thibitisha usanikishaji
azd version
```
</details>

<details>
<summary><strong>❌ "Hakuna usajili uliopatikana" au "Usajili haujawekwa"</strong></summary>

```bash
# Orodhesha usajili zilizopo
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
<summary><strong>❌ "InsufficientQuota" au "Quota exceeded"</strong></summary>

```bash
# Jaribu mkoa tofauti wa Azure
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
# Chaguo 1: Safisha na ujaribu tena
azd down --force --purge
azd up

# Chaguo 2: Rekebisha miundombinu tu
azd provision

# Chaguo 3: Angalia hali kwa undani
azd show

# Chaguo 4: Angalia logi kwenye Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" au "Token expired"</strong></summary>

```bash
# Thibitisha upya
az logout
az login

azd auth logout
azd auth login

# Thibitisha uthibitisho
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" au migongano ya majina</strong></summary>

```bash
# AZD huzalisha majina ya kipekee, lakini ikiwa kuna mgongano:
azd down --force --purge

# Kisha jaribu tena kwa mazingira mapya
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Utekelezaji wa kiolezo unachukua muda mrefu</strong></summary>

**Wakati wa kawaida wa kusubiri:**
- Programu ya wavuti rahisi: dakika 5-10
- Programu yenye hifadhidata: dakika 10-15
- Maombi ya AI: dakika 15-25 (utoaji wa OpenAI ni polepole)

```bash
# Angalia maendeleo
azd show

# Kama umekwama kwa zaidi ya dakika 30, angalia Azure Portal:
azd monitor
# Tafuta utekelezaji uliofeli
```
</details>

<details>
<summary><strong>❌ "Permission denied" au "Forbidden"</strong></summary>

```bash
# Angalia jukumu lako la Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Unahitaji angalau jukumu la "Contributor"
# Omba msimamizi wako wa Azure atoe:
# - Contributor (kwa rasilimali)
# - User Access Administrator (kwa upangaji wa majukumu)
```
</details>

<details>
<summary><strong>❌ Haiwezi kupata URL ya programu iliyowekwa</strong></summary>

```bash
# Onyesha vituo vyote vya huduma
azd show

# Au fungua Portal ya Azure
azd monitor

# Angalia huduma maalum
azd env get-values
# Tafuta vigezo vya *_URL
```
</details>

### 📚 Rasilimali Kamili za Utatuzi wa Matatizo

- **Mwongozo wa Matatizo ya Kawaida:** [Suluhisho Zilizofafanuliwa](docs/chapter-07-troubleshooting/common-issues.md)
- **Matatizo Maalum ya AI:** [Utatuzi wa AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Mwongozo wa Kurekebisha Hitilafu:** [Utatuzi wa Hatua kwa Hatua](docs/chapter-07-troubleshooting/debugging.md)
- **Pata Msaada:** [Discord ya Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kukamilika kwa Kozi & Cheti

### Ufuatiliaji wa Maendeleo
Fuata maendeleo yako ya kujifunza kupitia kila sura:

- [ ] **Sura 1**: Msingi & Anza Haraka ✅
- [ ] **Sura 2**: Uendelezaji wa AI Kwanza ✅  
- [ ] **Sura 3**: Usanidi & Uthibitishaji ✅
- [ ] **Sura 4**: Miundombinu kama Msimbo & Utekelezaji ✅
- [ ] **Sura 5**: Suluhisho za AI za Wakala Wengi ✅
- [ ] **Sura 6**: Uhakiki na Mipango kabla ya Utekelezaji ✅
- [ ] **Sura 7**: Utatuzi wa Matatizo & Kurekebisha Hitilafu ✅
- [ ] **Sura 8**: Mifumo ya Uzalishaji & Biashara ✅

### Uthibitisho wa Kujifunza
Baada ya kumaliza kila sura, thibitisha ujuzi wako kwa:
1. **Mazoezi ya Vitendo**: Kamilisha utekelezaji wa vitendo wa sura
2. **Ukaguzi wa Maarifa**: Pitia sehemu ya Maswali (FAQ) ya sura yako
3. **Mjadala wa Jamii**: Shiriki uzoefu wako katika Discord ya Azure
4. **Sura Ifuatayo**: Hamia kwenye ngazi inayofuata ya ugumu

### Manufaa ya Kukamilisha Kozi
Ukiwa umemaliza sura zote, utakuwa na:
- **Uzoefu wa Uzalishaji**: Umeweka programu halisi za AI kwenye Azure
- **Ujuzi wa Kitaaluma**: Uwezo wa utekelezaji tayari kwa biashara  
- **Utambuzi wa Jamii**: Mwanachama hai wa jamii ya waendelezaji wa Azure
- **Kuendeleza Kazi**: Utaalamu unaohitajika wa utekelezaji wa AZD na AI

---

## 🤝 Jamii & Msaada

### Pata Msaada & Uungaji Mkono
- **Masuala ya Kiufundi**: [Ripoti mende na omba vipengele](https://github.com/microsoft/azd-for-beginners/issues)
- **Maswali ya Kujifunza**: [Jumuiya ya Discord ya Microsoft Azure](https://discord.gg/microsoft-azure) na [![Discord ya Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Msaada Maalum wa AI**: Jiunge na [![Discord ya Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Nyaraka**: [Nyaraka Rasmi za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Maarifa ya Jamii kutoka Discord ya Microsoft Foundry

**Matokeo ya Utafiti wa Maoni wa Karibuni kutoka Kituo #Azure:**
- **45%** ya waendelezaji wanataka kutumia AZD kwa mzigo wa kazi za AI
- **Changamoto Kuu**: Utekelezaji wa huduma nyingi, usimamizi wa vyeti, utayari wa uzalishaji  
- **Yaliyotakiwa Zaidi**: Violezo maalum vya AI, miongozo ya utatuzi wa matatizo, mbinu bora

**Jiunge na jamii yetu ili:**
- Shiriki uzoefu wako wa AZD + AI na pata msaada
- Pata mapitio ya awali ya violezo vipya vya AI
- Changia mbinu bora za utekelezaji wa AI
- Weka ushawishi katika maendeleo ya vipengele vya AI + AZD vya baadaye

### Kuchangia kwenye Kozi
Tunakaribisha michango! Tafadhali soma [Mwongozo wa Kuchangia](CONTRIBUTING.md) kwa maelezo kuhusu:
- **Kuboresha Yaliyomo**: Boresha sura na mifano iliyopo
- **Mifano Mpya**: Ongeza hali halisi na violezo  
- **Tafsiri**: Saidia kudumisha msaada wa lugha nyingi
- **Ripoti za Mende**: Boresha usahihi na uwazi
- **Viwango vya Jamii**: Fuata miongozo yetu ya jamii inayojumuisha

---

## 📄 Taarifa za Kozi

### Leseni
Mradi huu umepewa leseni chini ya Leseni ya MIT - tazama faili ya [LICENSE](../../LICENSE) kwa maelezo.

### Rasilimali Zinazohusiana za Kujifunza za Microsoft

Timu yetu inatengeneza kozi zingine za kina za kujifunza:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j kwa Waanzilishi](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js kwa Waanzilishi](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain kwa Waanzilishi](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD kwa Waanzilishi](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI kwa Waanzilishi](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP kwa Waanzilishi](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents kwa Waanzilishi](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI kwa Waanzilishi](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET) kwa Waanzilishi](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java) kwa Waanzilishi](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript) kwa Waanzilishi](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kujifunza Msingi
[![ML kwa Waanzilishi](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science kwa Waanzilishi](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI kwa Waanzilishi](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity kwa Waanzilishi](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev kwa Waanzilishi](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT kwa Waanzilishi](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development kwa Waanzilishi](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Mfululizo wa Copilot
[![Copilot kwa Kuprogramu Pamoja na AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot kwa C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure kwa Waanzilishi](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Urambazaji wa Kozi

**🚀 Tayari Kuanza Kujifunza?**

**Waanzilishi**: Anza na [Sura 1: Msingi & Mwongozo wa Haraka](../..)  
**Watengenezaji wa AI**: Ruka kwenye [Sura 2: Uendelezaji wa AI-Kwanza](../..)  
**Watengenezaji Waliobobea**: Anza na [Sura 3: Usanidi & Uthibitishaji](../..)

**Hatua Zifuatazo**: [Anza Sura 1 - Misingi ya AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Kifungu cha kutokuwa na dhamana:
Hati hii imetafsiriwa kwa kutumia huduma ya kutafsiri kwa AI Co-op Translator (https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali kumbuka kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nakala ya awali ya hati kwa lugha yake ya asili inapaswa kuchukuliwa kama chanzo rasmi. Kwa taarifa muhimu, tunapendekeza kutumia huduma ya tafsiri ya mtaalamu wa binadamu. Hatuwajibiki kwa kutokuelewana au tafsiri isiyo sahihi inayotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->