# AZD Kwa Waanzilishi: Safari ya Kujifunza Iliyopangwa

![AZD kwa Waanzilishi](../../translated_images/sw/azdbeginners.5527441dd9f74068.webp) 

[![Watazamaji wa GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forks za GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Nyota za GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord ya Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord ya Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Tafsiri Zinazoendeshwa Kiotomatiki (Zinasasishwa Kila Wakati)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](./README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Unapendelea Kukopa Kwenye Kompyuta Yako?**
>
> Hifadhidata hii inajumuisha tafsiri katika lugha 50+ ambazo zinaongeza kiasi cha kupakua. Ili kukopa bila tafsiri, tumia sparse checkout:
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
> Hii inakupa kila kitu unachohitaji kukamilisha kozi na upakuaji wa kasi zaidi.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Nini Kipya katika azd Leo

Azure Developer CLI imekua zaidi ya programu za wavuti na API za jadi. Leo, azd ni zana moja kwa kupeleka programu yoyote kwenye Azure—ikiwa ni pamoja na programu zinazodhibitiwa na AI na maajenti wenye akili.

Hii inamaanisha nini kwako:

- **Maajenti ya AI sasa ni mizigo ya azd za daraja la juu.** Unaweza kuanzisha, kupeleka, na kusimamia miradi ya maajenti ya AI kwa kutumia mtiririko uleule wa `azd init` → `azd up` unaoujuwa.
- **Uunganishaji wa Microsoft Foundry** unaleta utekelezaji wa modeli, kuweka maajenti, na usanidi wa huduma za AI moja kwa moja ndani ya mfumo wa templates wa azd.
- **Mtiririko wa msingi haujabadilika.** Iwe unapeleka programu ya todo, microservice, au suluhisho la AI lenye maajenti wengi, amri zinaendelea kuwa zile zile.

Ikiwa umewahi kutumia azd hapo awali, msaada wa AI ni nyongeza ya asili—si zana tofauti au njia ya juu. Ikiwa unaanza upya, utajifunza mtiririko mmoja unaofaa kwa kila kitu.

---

## 🚀 Azure Developer CLI (azd) ni Nini?

**Azure Developer CLI (azd)** ni zana rafiki kwa waendelezaji ya mstari wa amri inayofanya iwe rahisi kupeleka programu kwenye Azure. Badala ya kuunda na kuunganisha kwa mikono mabilioni ya rasilimali za Azure, unaweza kupeleka programu nzima kwa amri moja tu.

### Uchawi wa `azd up`

```bash
# Amri hii moja hufanya kila kitu:
# ✅ Inaunda rasilimali zote za Azure
# ✅ Inapanga mitandao na usalama
# ✅ Inajenga msimbo wa programu yako
# ✅ Inaweka kwenye Azure
# ✅ Inakupa URL inayofanya kazi
azd up
```

**Hiyo ni yote!** Hakuna kubofya katika Azure Portal, hakuna templates ngumu za ARM za kujifunza kwanza, hakuna usanidi wa mikono - ni programu zinazofanya kazi kwenye Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Ni Tofauti Gani?

Hii ndiyo swali linaloulizwa mara nyingi na waanzilishi. Hapa kuna jibu rahisi:

| Sifa | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Madhumuni** | Dhibiti rasilimali za Azure binafsi | Tekeleza programu kamili |
| **Mtazamo** | Inazingatia miundombinu | Inazingatia programu |
| **Mfano** | `az webapp create --name myapp...` | `azd up` |
| **Ugumu wa Kujifunza** | Inahitaji kujua huduma za Azure | Fahamu tu programu yako |
| **Inafaa Kwa** | DevOps, Miundombinu | Waendelezaji, Utengenezaji Mifano |

### Mfano Rahisi

- **Azure CLI** ni kama kuwa na zana zote za kujenga nyumba - nyundo, kisu, mabati. Unaweza kujenga chochote, lakini unahitaji uzoefu wa ujenzi.
- **Azure Developer CLI** ni kama kuajiri mkandarasi - unaeleza unachotaka, na wao wanashughulikia ujenzi.

### Wakati wa Kutumia Kila Moja

| Hali | Tumia Hili |
|----------|----------|
| "Nataka kupeleka app yangu ya wavuti haraka" | `azd up` |
| "Nahitaji kuunda akaunti ya hifadhi tu" | `az storage account create` |
| "Ninaunda programu kamili ya AI" | `azd init --template azure-search-openai-demo` |
| "Nahitaji kutatua tatizo kwa rasilimali maalum ya Azure" | `az resource show` |
| "Nataka utekelezaji wa uzalishaji kwa dakika" | `azd up --environment production` |

### Zinatumika Pamoja!

AZD inatumia Azure CLI chini ya uso. Unaweza kutumia zote mbili:
```bash
# Weka programu yako kwa AZD
azd up

# Kisha rekebisha rasilimali maalum kwa Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Pata Mifano katika Awesome AZD

Usianze kutoka mwanzo! **Awesome AZD** ni mkusanyiko wa jamii wa templates tayari-kupelekwa:

| Rasilimali | Maelezo |
|----------|-------------|
| 🔗 [**Galleria ya Awesome AZD**](https://azure.github.io/awesome-azd/) | Tafuta templates 200+ na kuzipeleka kwa bonyeza moja |
| 🔗 [**Wasilisha Template**](https://github.com/Azure/awesome-azd/issues) | Changia template yako kwa jamii |
| 🔗 [**Hifadhi ya GitHub**](https://github.com/Azure/awesome-azd) | Weka nyota na chunguza chanzo |

### Mifano Maarufu ya AI kutoka Awesome AZD

```bash
# Maongezi ya RAG na Models za Microsoft Foundry + Utafutaji wa AI
azd init --template azure-search-openai-demo

# Programu ya Haraka ya Maongezi ya AI
azd init --template openai-chat-app-quickstart

# Wakala wa AI na Wakala wa Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Anza kwa Hatua 3

Kabla ya kuanza, hakikisha mashine yako iko tayari kwa template unayotaka kupeleka:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ikiwa ukaguzi wa lazima ukishindwa, rekebisha hapo kwanza kisha endelea na mwanzo wa haraka.

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

### Hatua 2: Thibitisha kwa AZD

```bash
# Hiari ikiwa unapanga kutumia amri za Azure CLI moja kwa moja katika kozi hii
az login

# Inahitajika kwa ajili ya mifumo ya AZD
azd auth login
```

Ikiwa haujasikia ni ipi unayohitaji, fuata mtiririko kamili wa usanidi katika [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Hatua 3: Tekeleza Programu Yako Ya Kwanza

```bash
# Anzisha kutoka kwa kiolezo
azd init --template todo-nodejs-mongo

# Sambaza kwenda Azure (huunda kila kitu!)
azd up
```

**🎉 Hiyo ni yote!** Programu yako sasa imewekwa mtandaoni kwenye Azure.

### Safisha (Usisahau!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Jinsi ya Kutumia Kozi Hii

Kozi hii imeundwa kwa ajili ya **kujifunza hatua kwa hatua** - anza pale unapoeleweka na endelea kupanda:

| Uzoefu Wako | Anza Hapa |
|-----------------|------------|
| **Mpya kabisa kwa Azure** | [Sura 1: Msingi](#-chapter-1-foundation--quick-start) |
| **Unajua Azure, Mpya kwa AZD** | [Sura 1: Msingi](#-chapter-1-foundation--quick-start) |
| **Unataka kupeleka programu za AI** | [Sura 2: Maendeleo-Kwanza ya AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Unataka mazoezi ya vitendo** | [🎓 Warsha ya Kazi ya Vitendo](workshop/README.md) - maabara ya mwongozo wa masaa 3-4 |
| **Unahitaji mifano ya uzalishaji** | [Sura 8: Uzalishaji & Mifumo ya Kampuni](#-chapter-8-production--enterprise-patterns) |

### Usanidi wa Haraka

1. **Fanya Fork ya Hifadhi Hii**: [![Forks za GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Nakili (Clone) Hii**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Pata Msaada**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Unapendelea Kukopa Kwenye Kompyuta Yako?**

> Hifadhidata hii inajumuisha tafsiri katika lugha 50+ ambazo zinaongeza kiasi cha kupakua. Ili kukopa bila tafsiri, tumia sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Hii inakupa kila kitu unachohitaji kukamilisha kozi kwa upakuaji wa kasi zaidi.


## Muhtasari wa Kozi

Jifunze Azure Developer CLI (azd) kupitia sura zilizo pangwa kwa ajili ya kujifunza hatua kwa hatua. **Mzozo maalum katika utekelezaji wa programu za AI kwa ushirikiano na Microsoft Foundry.**

### Kwa Nini Kozi Hii Ni Muhimu kwa Waendelezaji wa Kisasa

Kulingana na maoni ya jumuiya ya Microsoft Foundry Discord, **45% ya waendelezaji wanataka kutumia AZD kwa mzigo wa AI** lakini wanakutana na changamoto za:
- Miundo tata ya huduma nyingi za AI
- Mifumo bora ya utekelezaji wa AI kwa uzalishaji  
- Uunganishaji na usanidi wa huduma za Azure AI
- Uboreshaji wa gharama kwa huduma za AI
- Kutatua matatizo mahsusi ya utekelezaji wa AI

### Malengo ya Kujifunza

Kwa kukamilisha kozi hii iliyopangwa, utakuwa na uwezo wa:
- **Kumfahamu AZD kwa Undani**: Dhana za msingi, usakinishaji, na usanidi
- **Kupeleka Programu za AI**: Tumia AZD na huduma za Microsoft Foundry
- **Kutumia Infrastructure as Code**: Simamia rasilimali za Azure kwa templates za Bicep
- **Kutatua Matatizo ya Utekelezaji**: Rekebisha matatizo ya kawaida na debug
- **Kuboresha kwa Uzalishaji**: Usalama, upanuaji, ufuatiliaji, na usimamizi wa gharama
- **Kujenga Suluhisho za Maajenti Wengi**: Tekeleza miundo tata ya AI

## Kabla Ya Kuanzia: Akaunti, Ufikiaji, na Matarajio

Kabla ya kuanza Sura ya 1, hakikisha una yafuatayo mahali. Hatua za usakinishaji zilizo baadaye katika mwongozo huu zinadhani kuwa mambo haya ya msingi yameshatatuliwa.
- **Usajili wa Azure**: Unaweza kutumia usajili uliopo kutoka kazini au akaunti yako mwenyewe, au tengeneza [jaribio la bure](https://aka.ms/azurefreetrial) ili kuanza.
- **Ruhusa ya kuunda rasilimali za Azure**: Kwa mazoezi mengi, unapaswa kuwa na angalau **Contributor** access kwenye usajili unalolenga au kikundi cha rasilimali. Sura baadhi zinaweza pia kutegemea kwamba unaweza kuunda makundi ya rasilimali, vitambulisho vinavyosimamiwa, na uteuzi za RBAC.
- [**Akaunti ya GitHub**](https://github.com): Hii inafaa kwa kuforka hazina ya msimbo (repository), kufuatilia mabadiliko yako mwenyewe, na kutumia GitHub Codespaces kwa warsha.
- **Mahitaji ya wakati wa utekelezaji ya templeti**: Templati zingine zinahitaji zana za ndani kama Node.js, Python, Java, au Docker. Endesha validator ya usanidi kabla ya kuanza ili ugundue zana zilizoikosekana mapema.
- **Ujuzi wa msingi wa terminali**: Hauhitaji kuwa mtaalamu, lakini unapaswa kuwa na uwezo wa kutekeleza amri kama `git clone`, `azd auth login`, na `azd up`.

> **Unafanya kazi kwenye usajili wa shirika?**
> Iwapo mazingira yako ya Azure yanadhibitiwa na msimamizi, thibitisha mapema kuwa unaweza kutengeneza rasilimali katika usajili au kikundi cha rasilimali unachopanga kutumia. Ikiwa sivyo, omba usajili wa sandbox au ufikiaji wa Contributor kabla ya kuanza.

> **Mpya kwa Azure?**
> Anza na jaribio lako la Azure au usajili wa pay-as-you-go kupitia https://aka.ms/azurefreetrial ili uweze kumaliza mazoezi kutoka mwanzo hadi mwisho bila kusubiri idhini za ngazi ya mpangaji.

## 🗺️ Ramani ya Kozi: Urambazaji wa Haraka kwa Sura

Kila sura ina README ya kujitolea yenye malengo ya kujifunza, anza za haraka, na mazoezi:

| Sura | Mada | Masomo | Muda | Ugumu |
|---------|-------|---------|----------|------------|
| **[Sura 1: Msingi](docs/chapter-01-foundation/README.md)** | Kuanzia | [Misingi ya AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Usakinishaji](docs/chapter-01-foundation/installation.md) &#124; [Mradi wa Kwanza](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Sura 2: Maendeleo ya AI](docs/chapter-02-ai-development/README.md)** | Programu za AI-Kwanza | [Uunganishaji wa Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Wakala za AI](docs/chapter-02-ai-development/agents.md) &#124; [Utekelezaji wa Mfano wa AI](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Warsha](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Sura 3: Mipangilio](docs/chapter-03-configuration/README.md)** | Uthibitishaji & Usalama | [Mipangilio](docs/chapter-03-configuration/configuration.md) &#124; [Mifumo ya uthibitishaji na vitambulisho vinavyosimamiwa](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Sura 4: Miundombinu](docs/chapter-04-infrastructure/README.md)** | IaC & Utekelezaji | [Mwongozo wa Utekelezaji](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Utayarishaji wa Rasilimali](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Sura 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Suluhisho za Wakala za AI | [Mfano wa Rejareja](examples/retail-scenario.md) &#124; [Mifumo ya Uratibu](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Sura 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Mipango & Uthibitisho | [Uchunguzi wa Kabla ya Kuruka](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Mipango ya Uwezo](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Uchaguzi wa SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Sura 7: Utatuzi wa Matatizo](docs/chapter-07-troubleshooting/README.md)** | Kurekebisha & Kutoa Suluhisho | [Masuala ya Kawaida](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Kudebugi](docs/chapter-07-troubleshooting/debugging.md) &#124; [Masuala ya AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Sura 8: Uzalishaji](docs/chapter-08-production/README.md)** | Mifano ya Kibiashara | [Mazingira ya Uzalishaji](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Warsha](workshop/README.md)** | Maabara ya Vitendo | [Utangulizi](workshop/docs/instructions/0-Introduction.md) &#124; [Uchaguzi](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Uthibitishaji](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Uchambuzi](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Usanidi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Urekebishaji](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Kuondoa Miundombinu](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Hitimisho](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Jumla ya Muda wa Kozi:** ~10-14 masaa | **Maendeleo ya Ujuzi:** Mwanzo → Production-Ready

---

## 📚 Sura za Kujifunza

*Chagua njia yako ya kujifunza kulingana na kiwango chako cha uzoefu na malengo*

### 🚀 Sura 1: Msingi & Anza Haraka
**Mahitaji ya awali**: Usajili wa Azure, ujuzi wa msingi wa mstari wa amri  
**Muda**: 30-45 dakika  
**Ugumu**: ⭐

#### Utakachojifunza
- Kuelewa misingi ya Azure Developer CLI
- Kusakinisha AZD kwenye jukwaa lako
- Utekelezaji wako wa kwanza uliofanikiwa

#### Rasilimali za Kujifunza
- **🎯 Anza Hapa**: [Azure Developer CLI ni Nini?](#what-is-azure-developer-cli)
- **📖 Nadharia**: [Misingi ya AZD](docs/chapter-01-foundation/azd-basics.md) - Dhana kuu na istilahi
- **⚙️ Usanidi**: [Usakinishaji & Usanidi](docs/chapter-01-foundation/installation.md) - Miongozo maalum kwa jukwaa
- **🛠️ Vitendo**: [Mradi Wako wa Kwanza](docs/chapter-01-foundation/first-project.md) - Mafunzo hatua kwa hatua
- **📋 Marejeleo ya Haraka**: [Muhtasari wa Amri](resources/cheat-sheet.md)

#### Mazoezi ya Vitendo
```bash
# Ukaguzi wa haraka wa usanikishaji
azd version

# Weka programu yako ya kwanza
azd init --template todo-nodejs-mongo
azd up
```

**💡 Matokeo ya Sura**: Kuweka kwa mafanikio programu rahisi ya wavuti kwenye Azure ukitumia AZD

**✅ Uthibitisho wa Mafanikio:**
```bash
# Baada ya kumaliza Sura ya 1, unapaswa kuwa na uwezo wa:
azd version              # Inaonyesha toleo lililowekwa
azd init --template todo-nodejs-mongo  # Inaanzisha mradi
azd up                  # Inaweka kwenye Azure
azd show                # Inaonyesha URL ya programu inayokimbia
# Programu inafunguka kwenye kivinjari na inafanya kazi
azd down --force --purge  # Inasafisha rasilimali
```

**📊 Muda wa Kuchukua:** 30-45 dakika  
**📈 Kiwango cha Ujuzi Baada:** Unaweza kuweka programu za msingi kwa kujitegemea
**📈 Kiwango cha Ujuzi Baada:** Unaweza kuweka programu za msingi kwa kujitegemea

---

### 🤖 Sura 2: Maendeleo ya AI-Kwanza (Inayopendekezwa kwa Waendelezaji wa AI)
**Mahitaji ya awali**: Sura 1 imekamilika  
**Muda**: 1-2 saa  
**Ugumu**: ⭐⭐

#### Utakachojifunza
- Uunganishaji wa Microsoft Foundry na AZD
- Kuweka programu zilizoongozwa na AI
- Kuelewa usanidi wa huduma za AI

#### Rasilimali za Kujifunza
- **🎯 Anza Hapa**: [Uunganishaji wa Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Wakala za AI**: [Mwongozo wa Wakala za AI](docs/chapter-02-ai-development/agents.md) - Weka wakala wenye akili kwa kutumia AZD
- **📖 Mifano**: [Utekelezaji wa Mfano wa AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Weka na simamia mifano ya AI
- **🛠️ Warsha**: [Maabara ya Warsha ya AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Fanya suluhisho zako za AI ziwe tayari kwa AZD
- **🎥 Mwongozo wa Kuingiliana**: [Nyenzo za Warsha](workshop/README.md) - Kujifunza katika kivinjari kwa MkDocs * Mazingira ya DevContainer
- **📋 Violezo**: [Violezo vya Microsoft Foundry](#rasilimali-za-warsha)
- **📝 Mifano**: [Mifano ya Utekelezaji wa AZD](examples/README.md)

#### Mazoezi ya Vitendo
```bash
# Weka programu yako ya kwanza ya AI
azd init --template azure-search-openai-demo
azd up

# Jaribu templeti za ziada za AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Matokeo ya Sura**: Weka na sanidi programu ya gumzo inayoendeshwa na AI yenye uwezo wa RAG

**✅ Uthibitisho wa Mafanikio:**
```bash
# Baada ya Sura ya 2, unapaswa kuwa na uwezo wa:
azd init --template azure-search-openai-demo
azd up
# Kujaribu kiolesura cha mazungumzo cha AI
# Uliza maswali na upate majibu ya AI yenye vyanzo
# Thibitisha kuwa ujumuishaji wa utafutaji unafanya kazi
azd monitor  # Angalia Application Insights inaonyesha telemetri
azd down --force --purge
```

**📊 Muda wa Kuchukua:** 1-2 saa  
**📈 Kiwango cha Ujuzi Baada:** Unaweza kuweka na kusanidi programu za AI zilizotayarishwa kwa uzalishaji  
**💰 Uelewa wa Gharama:** Elewa gharama za maendeleo $80-150/kwa mwezi, gharama za uzalishaji $300-3500/kwa mwezi

#### 💰 Mambo ya Kuzingatia kwa Gharama za Utekelezaji wa AI

**Mazingira ya Maendeleo (Makadirio $80-150/kwa mwezi):**
- Mifano ya Microsoft Foundry (Pay-as-you-go): $0-50/kwa mwezi (kutegemea matumizi ya tokeni)
- AI Search (ngazi ya Msingi): $75/kwa mwezi
- Container Apps (Matumizi): $0-20/kwa mwezi
- Uhifadhi (Standard): $1-5/kwa mwezi

**Mazingira ya Uzalishaji (Makadirio $300-3,500+/kwa mwezi):**
- Mifano ya Microsoft Foundry (PTU kwa utendaji thabiti): $3,000+/kwa mwezi AU Pay-as-you-go kwa kiasi kikubwa
- AI Search (ngazi ya Standard): $250/kwa mwezi
- Container Apps (Zilizotengwa): $50-100/kwa mwezi
- Application Insights: $5-50/kwa mwezi
- Uhifadhi (Premium): $10-50/kwa mwezi

**💡 Vidokezo vya Kupunguza Gharama:**
- Tumia **Free Tier** ya Mifano ya Microsoft Foundry kwa kujifunza (Azure OpenAI 50,000 tokens/kwa mwezi zimejumuishwa)
- Endesha `azd down` kuwachilia rasilimali wakati hauendelei kikazi
- Anza na bili inayotegemea matumizi, angalia PTU tu kwa uzalishaji
- Tumia `azd provision --preview` kukadiria gharama kabla ya utekelezaji
- Washa auto-scaling: lipa tu kwa matumizi halisi

**Ufuatiliaji wa Gharama:**
```bash
# Angalia makadirio ya gharama za kila mwezi
azd provision --preview

# Fuatilia gharama halisi katika Portal ya Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Sura 3: Mipangilio & Uthibitishaji
**Mahitaji ya awali**: Sura 1 imekamilika  
**Muda**: 45-60 dakika  
**Ugumu**: ⭐⭐

#### Utakachojifunza
- Usanidi na usimamizi wa mazingira
- Mazoezi bora ya uthibitishaji na usalama
- Uainishaji wa majina ya rasilimali na muundo

#### Rasilimali za Kujifunza
- **📖 Mipangilio**: [Mwongozo wa Mipangilio](docs/chapter-03-configuration/configuration.md) - Usanidi wa mazingira
- **🔐 Usalama**: [Mifumo ya uthibitishaji na vitambulisho vinavyosimamiwa](docs/chapter-03-configuration/authsecurity.md) - Mifumo ya uthibitishaji
- **📝 Mifano**: [Mfano wa Programu ya Hifadhidata](examples/database-app/README.md) - Mifano ya Hifadhidata za AZD

#### Mazoezi ya Vitendo
- Sanidi mazingira mengi (dev, staging, prod)
- Weka uthibitishaji wa vitambulisho vinavyosimamiwa
- Tekeleza usanidi maalum kwa mazingira

**💡 Matokeo ya Sura**: Simamia mazingira mengi kwa uthibitishaji na usalama sahihi

---

### 🏗️ Sura 4: Miundombinu kama Msimbo & Utekelezaji
**Mahitaji ya awali**: Sura 1-3 zimekamilika  
**Muda**: 1-1.5 saa  
**Ugumu**: ⭐⭐⭐

#### Utakachojifunza
- Mifano ya juu ya utekelezaji
- Miundombinu kama Msimbo kwa Bicep
- Mikakati ya utayarishaji wa rasilimali

#### Rasilimali za Kujifunza
- **📖 Utekelezaji**: [Mwongozo wa Utekelezaji](docs/chapter-04-infrastructure/deployment-guide.md) - Mchakato kamili
- **🏗️ Utayarishaji**: [Utayarishaji wa Rasilimali](docs/chapter-04-infrastructure/provisioning.md) - Usimamizi wa rasilimali za Azure
- **📝 Mifano**: [Mfano wa Programu ya Container](../../examples/container-app) - Utekelezaji wa yaliyofungashwa kwenye container

#### Mazoezi ya Vitendo
- Unda violezo vya Bicep vilivyobinafsishwa
- Weka programu zenye huduma nyingi
- Tekeleza mikakati ya utekelezaji ya blue-green

**💡 Matokeo ya Sura**: Weka programu zinazoingiza huduma nyingi zenye ugumu kwa kutumia violezo maalum vya miundombinu

---

### 🎯 Sura 5: Suluhisho za AI za Wakala Wengi (Kiwango cha Juu)
**Mahitaji ya awali**: Sura 1-2 zimekamilika  
**Muda**: 2-3 saa  
**Ugumu**: ⭐⭐⭐⭐

#### Utakachojifunza
- Mifano ya usanifu wa wakala wengi
- Uratibu na uendeshaji wa wakala
- Utekelezaji wa AI tayari kwa uzalishaji

#### Rasilimali za Kujifunza
- **🤖 Mradi Ulioangaziwa**: [Suluhisho la Wakala Wengi kwa Rejareja](examples/retail-scenario.md) - Utekelezaji kamili
- **🛠️ Violezo za ARM**: [Kifurushi cha Violezo vya ARM](../../examples/retail-multiagent-arm-template) - Utekelezaji kwa bonyeza moja
- **📖 Usanifu**: [Mifano ya uratibu wa wakala wengi](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mifano

#### Mazoezi ya Vitendo
```bash
# Sambaza suluhisho kamili la rejareja lenye mawakala wengi
cd examples/retail-multiagent-arm-template
./deploy.sh

# Chunguza usanidi wa mawakala
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Matokeo ya Sura**: Weka na simamia suluhisho la AI la wakala wengi tayari kwa uzalishaji lenye wakala wa Mteja na wa Hesabu

---

### 🔍 Sura 6: Uthibitishaji na Mipango Kabla ya Utekelezaji
**Mahitaji ya awali**: Sura 4 imekamilika  
**Muda**: 1 saa  
**Ugumu**: ⭐⭐
#### Utajifunza Nini
- Upangaji wa uwezo na uhakikisho wa rasilimali
- Mikakati ya kuchagua SKU
- Ukaguzi kabla ya uzinduzi na uendeshaji wa kiotomatiki

#### Vyanzo vya Kujifunzia
- **📊 Upangaji**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Uhakikisho wa rasilimali
- **💰 Uchaguzi**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Chaguo za gharama nafuu
- **✅ Uhakikisho**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Skripti za kiotomatiki

#### Mazoezi ya Vitendo
- Endesha skripti za uhakikisho wa uwezo
- Boresha uchaguzi wa SKU kwa gharama
- Tekeleza ukaguzi wa kiotomatiki kabla ya uzinduzi

**💡 Matokeo ya Sura**: Thibitisha na boresha uanzishaji kabla ya utekelezaji

---

### 🚨 Sura 7: Utatuzi wa Matatizo na Urekebishaji
**Masharti ya Awali**: Sura yoyote ya uanzishaji imekamilika  
**Muda**: 1–1.5 saa  
**Ugumu**: ⭐⭐

#### Utajifunza Nini
- Mbinu za kimfumo za urekebishaji makosa
- Matatizo ya kawaida na suluhisho
- Utatuzi wa matatizo maalum kwa AI

#### Vyanzo vya Kujifunzia
- **🔧 Matatizo ya Kawaida**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - Maswali yanayoulizwa mara kwa mara na suluhisho
- **🕵️ Urekebishaji**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Mikakati hatua kwa hatua
- **🤖 Matatizo ya AI**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Matatizo ya huduma za AI

#### Mazoezi ya Vitendo
- Gunduza kushindwa kwa uanzishaji
- Rekebisha matatizo ya uthibitisho
- Fanya urekebishaji wa uunganisho wa huduma za AI

**💡 Matokeo ya Sura**: Gunduza na suluhisha kwa kujitegemea matatizo ya kawaida ya uanzishaji

---

### 🏢 Sura 8: Mifumo ya Uzalishaji na Biashara
**Masharti ya Awali**: Suras 1-4 zimekamilika  
**Muda**: 2–3 saa  
**Ugumu**: ⭐⭐⭐⭐

#### Utajifunza Nini
- Mikakati ya uanzishaji wa uzalishaji
- Mifumo ya usalama ya biashara
- Ufuatiliaji na uboreshaji wa gharama

#### Vyanzo vya Kujifunzia
- **🏭 Uzalishaji**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Mifumo ya biashara
- **📝 Mifano**: [Microservices Example](../../examples/microservices) - Miundo tata
- **📊 Ufuatiliaji**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Uunganishaji wa Application Insights

#### Mazoezi ya Vitendo
- Tekeleza mifumo ya usalama ya biashara
- Sanidi ufuatiliaji kamili
- Tekeleza uanzishaji kwenye uzalishaji kwa utawala muafaka

**💡 Matokeo ya Sura**: Anzisha programu zilizo tayari kwa biashara zenye uwezo kamili wa uzalishaji

---

## 🎓 Muhtasari wa Warsha: Uzoefu wa Kujifunza Kwa Vitendo

> **⚠️ HALI YA WARSHA: Inapoendelea Kuendelezwa**  
> Vifaa vya warsha kwa sasa vinatengenezwa na kurekebishwa. Moduli za msingi zinafanya kazi, lakini baadhi ya sehemu za juu hazijakamilika. Tunafanya kazi kwa bidii kukamilisha maudhui yote. [Fuata maendeleo →](workshop/README.md)

### Vifaa vya Warsha Vinavyoshirikiana
**Ujifunzaji wa vitendo wa kina kwa kutumia zana za kivinjari na mazoezi yaliyoongozwa**

Vifaa vya warsha vinatoa uzoefu uliopangwa, unaoshirikisha vitendo unaoendana na mtaala uliotajwa hapo juu. Warsha imeundwa kwa ajili ya kujifunza kwa mwendo binafsi na pia kwa kipindi kinachoongozwa na mkufunzi.

#### 🛠️ Sifa za Warsha
- **Kiolesura cha Kivinjari**: Warsha kamili inayotumia MkDocs yenye utafutaji, kunakili, na vipengele vya mandhari
- **Uunganisho wa GitHub Codespaces**: Usanidi wa mazingira ya maendeleo kwa bonyeza moja
- **Njia ya Kujifunza Iliyopangwa**: Mazoezi ya moduli 8 yaliyoongozwa (saa 3–4 jumla)
- **Mbinu Inayoendelea**: Utangulizi → Uchaguzi → Uthibitisho → Uvunjaji → Usanidi → Urekebishaji → Uondoaji → Hitimisho
- **Mazingira ya DevContainer yenye mwingiliano**: Zana na utegemezi zilizosanifiwa awali

#### 📚 Muundo wa Moduli za Warsha
Warsha inafuata mbinu ya **moduli 8 inayoendelea** inayokuchukua kutoka kugundua hadi utaalamu wa uanzishaji:

| Moduli | Mada | Utalofanya | Muda |
|--------|-------|----------------|----------|
| **0. Utangulizi** | Muhtasari wa Warsha | Elewa malengo ya kujifunza, masharti ya awali, na muundo wa warsha | 15 min |
| **1. Uchaguzi** | Ugunduzi wa Kiolezo | Chunguza kiolezo za AZD na chagua kiolezo sahihi cha AI kwa senario yako | 20 min |
| **2. Uthibitisho** | Tuma & Thibitisha | Tuma kiolezo kwa `azd up` na thibitisha miundombinu inafanya kazi | 30 min |
| **3. Uvunjaji** | Elewa Muundo | Tumia GitHub Copilot kuchunguza usanifu wa kiolezo, mafaili ya Bicep, na mpangilio wa msimbo | 30 min |
| **4. Usanidi** | Uchunguzi wa kina wa azure.yaml | Tawala usanidi wa `azure.yaml`, lifecycle hooks, na vigezo vya mazingira | 30 min |
| **5. Urekebishaji** | Ifanye Iwe Yako | Wezesha AI Search, ufuatiliaji, tathmini, na rekebisha kwa senario yako | 45 min |
| **6. Ufutaji** | Safisha | Ondoa rasilimali kwa usalama kwa kutumia `azd down --purge` | 15 min |
| **7. Hitimisho** | Hatua Zifuatazo | Pitia mafanikio, dhana kuu, na endelea safari yako ya kujifunza | 15 min |

**Mtiririko wa Warsha:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Kuanza na Warsha
```bash
# Chaguo 1: GitHub Codespaces (Inapendekezwa)
# Bonyeza "Code" → "Unda codespace kwenye tawi la main" katika hazina

# Chaguo 2: Uendelezaji wa ndani
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Fuata maelekezo ya usanidi katika workshop/README.md
```

#### 🎯 Matokeo ya Kujifunza ya Warsha
Kwa kukamilisha warsha, washiriki wata:
- **Weka Programu za AI za Uzalishaji**: Tumia AZD na huduma za Microsoft Foundry
- **Tawala Miundo ya Mawakala Wengi**: Tekeleza suluhisho za mawakala za AI zilizoratibiwa
- **Tekeleza Mbinu Bora za Usalama**: Sanidi uthibitishaji na udhibiti wa upatikanaji
- **Boresha Kwa Upanuaji**: Buni uanzishaji wa gharama nafuu na wenye utendaji mzuri
- **Tatua Matatizo ya Uanzishaji**: Suluhisha matatizo ya kawaida kwa kujitegemea

#### 📖 Rasilimali za Warsha
- **🎥 Mwongozo wa Mtandaoni**: [Workshop Materials](workshop/README.md) - Mazingira ya kujifunzia yanayotumia kivinjari
- **📋 Maelekezo Kwa Moduli**:
  - [0. Utangulizi](workshop/docs/instructions/0-Introduction.md) - Muhtasari wa warsha na malengo
  - [1. Uchaguzi](workshop/docs/instructions/1-Select-AI-Template.md) - Pata na chagua templeti za AI
  - [2. Uthibitisho](workshop/docs/instructions/2-Validate-AI-Template.md) - Tuma na thibitisha kiolezo
  - [3. Uvunjaji](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Chunguza usanifu wa kiolezo
  - [4. Usanidi](workshop/docs/instructions/4-Configure-AI-Template.md) - Tawala azure.yaml
  - [5. Urekebishaji](workshop/docs/instructions/5-Customize-AI-Template.md) - Rekebisha kwa senario yako
  - [6. Ufutaji](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Safisha rasilimali
  - [7. Hitimisho](workshop/docs/instructions/7-Wrap-up.md) - Pitia na hatua zinazofuata
- **🛠️ Maabara ya Warsha ya AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Mazoezi yanayolenga AI
- **💡 Anza Haraka**: [Workshop Setup Guide](workshop/README.md#quick-start) - Usanidi wa mazingira

**Inafaa kwa**: Mafunzo ya kampuni, kozi za chuo, kujifunza kwa mwendo wako, na bootcamps za watengenezaji.

---

## 📖 Uchunguzi wa Kina: Uwezo wa AZD

Zaidi ya msingi, AZD inatoa vipengele vyenye nguvu kwa uanzishaji wa uzalishaji:

- **Uanzishaji unaotegemea templeti** - Tumia templeti zilizojengwa kabla kwa mifumo ya kawaida ya programu
- **Miundombinu kama Msimbo** - Dhibiti rasilimali za Azure kwa kutumia Bicep au Terraform  
- **Mtiririko uliounganishwa** - Sambamba panga, anzisha, na fuatilia programu kwa urahisi
- **Rafiki kwa Msanidi Programu** - Imeboreshwa kwa uzalishaji na uzoefu wa msanidi programu

### **AZD + Microsoft Foundry: Inafaa kwa Uanzishaji wa AI**

**Kwa Nini AZD kwa Suluhisho za AI?** AZD inashughulikia changamoto kuu zinazowakabili wasanidi programu wa AI:

- **Templeti Tayari kwa AI** - Templeti zilizosanifiwa awali kwa Microsoft Foundry Models, Cognitive Services, na mzigo wa kazi wa ML
- **Uanzishaji Salama wa AI** - Mifumo ya usalama iliyojengewa ndani kwa huduma za AI, funguo za API, na miisho ya modeli  
- **Mifumo ya AI kwa Uzalishaji** - Mbinu bora kwa uanzishaji wa programu za AI zinazoenea na zenye gharama nafuu
- **Mtiririko wa AI Kuanzia Mwangoni Hadi Mwisho** - Kutoka kwenye maendeleo ya modeli hadi uanzishaji wa uzalishaji kwa ufuatiliaji sahihi
- **Uboreshaji wa Gharama** - Ugawaji wa rasilimali kwa busara na mikakati ya upanuaji kwa mzigo wa AI
- **Uunganisho wa Microsoft Foundry** - Muunganisho bila mshono na katalogi ya modeli ya Microsoft Foundry na miisho yake

---

## 🎯 Maktaba ya Templeti na Mifano

### Zilizotajwa: Templeti za Microsoft Foundry
**Anza hapa ukiaanzisha programu za AI!**

> **Kumbuka:** Templeti hizi zinaonyesha mifumo mbalimbali ya AI. Baadhi ni Sampuli za Azure za nje, zingine ni utekelezaji za ndani.

| Templeti | Sura | Ugumu | Huduma | Aina |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Sura 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Nje |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Sura 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Nje |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Sura 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Nje |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Sura 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Nje |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Sura 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Nje |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Sura 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Nje |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Sura 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Ndani** |

### Zilizotajwa: Mifano Kamili ya Kujifunza
**Templeti za programu zinazostahili uzalishaji zimeainishwa kwa sura za kujifunzia**

| Templeti | Sura ya Kujifunzia | Ugumu | Somo Muhimu |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Sura 2 | ⭐ | Mifumo ya msingi ya uanzishaji wa AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Sura 2 | ⭐⭐ | Utekelezaji wa RAG na Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Sura 4 | ⭐⭐ | Uunganishaji wa Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Sura 5 | ⭐⭐⭐ | Mfumo wa mawakala na funcition calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Sura 8 | ⭐⭐⭐ | Uratibu wa AI wa kampuni |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Sura 5 | ⭐⭐⭐⭐ | Miundo ya mawakala wengi na mawakala wa Mteja na Hisa |

### Kujifunza Kwa Aina ya Mfano

> **📌 Mifano ya Ndani dhidi ya Nje:**  
> **Mifano za Ndani** (katika repo hii) = Tayari kutumika mara moja  
> **Mifano za Nje** (Azure Samples) = Nakili kutoka kwa repositori zilizounganishwa

#### Mifano za Ndani (Tayari Kutumika)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Utekelezaji kamili tayari kwa uzalishaji pamoja na templeti za ARM
  - Miundo ya mawakala wengi (Wakala wa Mteja + Wakala wa Hisa)
  - Ufuatiliaji na tathmini kabambe
  - Uanzishaji kwa bonyeza moja kupitia kiolezo cha ARM

#### Mifano za Ndani - Programu za Kontena (Suras 2-5)
**Mifano kamili ya uanzishaji wa kontena katika repo hii:**
- [**Container App Examples**](examples/container-app/README.md) - Mwongozo kamili wa uanzishaji wa programu za kontena
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - REST API msingi yenye scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Uanzishaji wa huduma nyingi unaostahili uzalishaji
  - Mwanzo wa Haraka, Uzalishaji, na mifumo ya uanzishaji ya Juu
  - Mwongozo wa ufuatiliaji, usalama, na uboreshaji wa gharama

#### Mifano za Nje - Programu Rahisi (Suras 1-2)
**Nakili repositori hizi za Azure Samples ili kuanza:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mifumo ya msingi ya uanzishaji
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Uanzishaji wa maudhui tuli
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Uanzishaji wa REST API

#### Mifano za Nje - Uunganishaji wa Hifadhidata (Sura 3-4)
- [Programu ya Hifadhidata - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mifumo ya uunganishaji wa hifadhidata
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Mtiririko wa data usio na seva

#### Mifano ya Nje - Mifumo ya Juu (Sura 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Miundo ya huduma nyingi
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Usindikaji wa kazi za nyuma  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Mifumo ya ML tayari kwa uzalishaji

### Maktaba za Violezo vya Nje
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Makusanyo yaliyoratibiwa ya violezo rasmi na vya jamii
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Nyaraka za kielelezo za Microsoft Learn
- [**Examples Directory**](examples/README.md) - Mifano ya kujifunzia ya ndani yenye maelezo ya kina

---

## 📚 Rasilimali za Kujifunza & Marejeleo

### Marejeleo ya Haraka
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Amri muhimu za azd zilizopangwa kwa sura
- [**Glossary**](resources/glossary.md) - Msamiati wa maneno ya Azure na azd  
- [**FAQ**](resources/faq.md) - Maswali yanayoulizwa mara kwa mara yaliyopangwa kwa sura za kujifunza
- [**Study Guide**](resources/study-guide.md) - Mazoezi ya vitendo ya kina

### Warsha za Vitendo
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tengeneza suluhisho zako za AI ziweze kutumika kwa AZD (2-3 hours)
- [**Interactive Workshop**](workshop/README.md) - Mazoezi ya moduli 8 yaliyoongozwa na MkDocs na GitHub Codespaces
  - Inafuata: Utangulizi → Uchaguzi → Uthibitisho → Uchanganuzi → Usanidi → Ubinafsishaji → Uondoshaji → Hitimisho

### Rasilimali za Kujifunza Nje
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### Ujuzi wa Wakala wa AI kwa Mhariri Wako
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - Ujuzi 37 wazi wa mawakala kwa Azure AI, Foundry, uwasilishaji, uchunguzi, uboreshaji wa gharama, na mengine. Waweke kwenye GitHub Copilot, Cursor, Claude Code, au wakala wowote unaounga mkono:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Mwongozo wa Haraka wa Utatuzi wa Matatizo

**Matatizo ya kawaida ambayo waanzilishi hukutana nayo na suluhisho za papo hapo:**

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
<summary><strong>❌ "InsufficientQuota" au "Quota imezidi"</strong></summary>

```bash
# Jaribu eneo tofauti la Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Au tumia SKUs ndogo kwenye uendelezaji
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

# Chaguo 3: Angalia hali kwa undani
azd show

# Chaguo 4: Angalia kumbukumbu (logs) katika Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Uthibitishaji umefeli" au "Token imeisha"</strong></summary>

```bash
# Thibitisha upya kwa AZD
azd auth logout
azd auth login

# Hiari: sasisha pia Azure CLI ikiwa unafanya amri za az
az logout
az login

# Thibitisha uthibitishaji
az account show
```
</details>

<details>
<summary><strong>❌ "Rasilimali tayari ipo" au "migogoro ya majina"</strong></summary>

```bash
# AZD huunda majina ya kipekee, lakini ikiwa kuna mgongano:
azd down --force --purge

# Kisha jaribu tena kwa mazingira mapya
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Utekelezaji wa kiolezo unachukua muda mrefu</strong></summary>

**Wakati wa kawaida wa kusubiri:**
- Programu rahisi ya wavuti: dakika 5-10
- Programu yenye hifadhidata: dakika 10-15
- Programu za AI: dakika 15-25 (Upangaji wa OpenAI ni polepole)

```bash
# Angalia maendeleo
azd show

# Ikiwa imekwama kwa zaidi ya dakika 30, angalia Azure Portal:
azd monitor --overview
# Tafuta utekelezaji ulioshindwa
```
</details>

<details>
<summary><strong>❌ "Idhini imekataliwa" au "Imezuiwa"</strong></summary>

```bash
# Angalia jukumu lako la Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Unahitaji angalau jukumu la "Contributor"
# Mwombe msimamizi wako wa Azure akupe:
# - Contributor (kwa rasilimali)
# - User Access Administrator (kwa uteuzi wa majukumu)
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

- **Mwongozo wa Matatizo ya Kawaida:** [Suluhisho za Kina](docs/chapter-07-troubleshooting/common-issues.md)
- **Matatizo Maalum ya AI:** [Utatuzi wa AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Mwongozo wa Urekebishaji:** [Uchambuzi hatua kwa hatua](docs/chapter-07-troubleshooting/debugging.md)
- **Pata Msaada:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kukamilika kwa Kozi & Cheti

### Ufuatiliaji wa Maendeleo
Fuata maendeleo yako ya kujifunza kila sura:

- [ ] **Sura 1**: Msingi & Anza Haraka ✅
- [ ] **Sura 2**: Maendeleo ya Kwanza ya AI ✅  
- [ ] **Sura 3**: Usanidi & Uthibitishaji ✅
- [ ] **Sura 4**: Miundombinu kama Msimbo & Utekelezaji ✅
- [ ] **Sura 5**: Suluhisho za AI zenye mawakala wengi ✅
- [ ] **Sura 6**: Uthibitisho kabla ya Utekelezaji & Mipango ✅
- [ ] **Sura 7**: Utatuzi wa Matatizo & Urekebishaji ✅
- [ ] **Sura 8**: Mifumo ya Uzalishaji & Ya Kampuni ✅

### Uhakiki wa Kujifunza
Baada ya kumaliza kila sura, thibitisha maarifa yako kwa:
1. **Mazoezi ya Vitendo**: Kamilisha utekelezaji wa vitendo wa sura
2. **Uhakiki wa Maarifa**: Pitia sehemu ya FAQ ya sura yako
3. **Majadiliano ya Jamii**: Shiriki uzoefu wako kwenye Azure Discord
4. **Sura Iliyofuata**: Hamia ngazi inayofuata ya ugumu

### Manufaa ya Kukamilisha Kozi
Baada ya kumaliza sura zote, utakuwa na:
- **Uzoefu wa Uzalishaji**: Umeweka programu halisi za AI kwenye Azure
- **Ujuzi wa Kitaaluma**: Uwezo wa utekelezaji wa kampuni  
- **Utambuzi wa Jamii**: Mwanachama hai wa jamii ya waendelezaji wa Azure
- **Maendeleo ya Kazi**: Utaalamu unaohitajika wa AZD na utekelezaji wa AI

---

## 🤝 Jamii & Msaada

### Pata Msaada & Usaidizi
- **Matatizo ya Kifundi**: [Ripoti mende na omba vipengele](https://github.com/microsoft/azd-for-beginners/issues)
- **Maswali ya Kujifunza**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Discord ya Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Msaada Maalum wa AI**: Jiunge na [![Discord ya Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Nyaraka**: [Nyaraka Rasmi za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Maarifa ya Jamii kutoka Discord ya Microsoft Foundry

**Matokeo ya kura ya maoni ya hivi karibuni kutoka Kituo #Azure:**
- **45%** ya watengenezaji wanataka kutumia AZD kwa mizigo ya kazi ya AI
- **Changamoto kuu**: Utekelezaji wa huduma nyingi, usimamizi wa vibali, utayari kwa uzalishaji  
- **Iliyoombwa zaidi**: Violezo maalum kwa AI, mwongozo wa utatuzi, mbinu bora

**Jiunge na jamii yetu ili:**
- Shiriki uzoefu wako wa AZD + AI na pata msaada
- Pata mapitio ya awali ya violezo vipya vya AI
- Changia mbinu bora za utekelezaji wa AI
- Kuathiri maendeleo ya vipengele vya AI + AZD zijazo

### Kuchangia kwenye Kozi
Tunakaribisha michango! Tafadhali soma [Mwongozo wa Kuchangia](CONTRIBUTING.md) kwa maelezo kuhusu:
- **Kuboresha Maudhui**: Boresha sura zilizopo na mifano
- **Mifano Mpya**: Ongeza hali halisi na violezo  
- **Tafsiri**: Saidia kudumisha msaada wa lugha nyingi
- **Ripoti za Mende**: Boresha usahihi na uwazi
- **Viwango vya Jamii**: Fuata miongozo yetu ya ujumuishaji wa jamii

---

## 📄 Taarifa za Kozi

### Leseni
Mradi huu umepewa leseni chini ya Leseni ya MIT - angalia faili ya [LICENSE](../../LICENSE) kwa maelezo.

### Rasilimali Zinazohusiana za Kujifunza za Microsoft

Timu yetu hutengeneza kozi zingine za kina za kujifunza:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j kwa Waanzilishi](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js kwa Waanzilishi](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain kwa Waanzilishi](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Mawakala
[![AZD kwa Waanzilishi](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI kwa Waanzilishi](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP kwa Waanzilishi](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Mawakala wa AI kwa Waanzilishi](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Mfululizo wa AI Inayozalisha
[![AI Inayozalisha kwa Waanzilishi](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Inayozalisha (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI Inayozalisha (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![AI Inayozalisha (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kujifunza Msingi
[![ML kwa Waanzilishi](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Sayansi ya Data kwa Waanzilishi](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI kwa Waanzilishi](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Usalama wa Mtandao kwa Waanzilishi](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Uendelezaji wa Wavuti kwa Waanzilishi](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT kwa Waanzilishi](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Uendelezaji wa XR kwa Waanzilishi](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Mfululizo wa Copilot
[![Copilot kwa Uandishi wa Programu Pamoja na AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot kwa C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Safari ya Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Urambazaji wa Kozi

**🚀 Tayari Kuanza Kujifunza?**

**Waanzilishi**: Anza na [Sura 1: Msingi & Anza Haraka](#-chapter-1-foundation--quick-start)  
**Waendelezaji wa AI**: Nenda kwa [Sura 2: Uendelezaji wa Kwanza kwa AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Waendelezaji Wenye Uzoefu**: Anza na [Sura 3: Usanidi & Uthibitisho](#️-chapter-3-configuration--authentication)

**Hatua Zifuatazo**: [Anza Sura 1 - Misingi ya AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tamko la kutokuwajibika**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kufikia usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokukamilika. Nyaraka ya awali katika lugha yake ya asili inapaswa kuzingatiwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inapendekezwa kutumia tafsiri ya kitaalamu ya binadamu. Hatuwajibiki kwa kutoelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->