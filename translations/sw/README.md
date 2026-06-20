# AZD Kwa Waanzilishi: Safari ya Kujifunza Yenye Muundo

![AZD kwa Waanzilishi](../../translated_images/sw/azdbeginners.5527441dd9f74068.webp) 

[![Wafuasi wa GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forks za GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Nyota za GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord ya Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord ya Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Tafsiri Otomatiki (Zilizosasishwa Daima)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](./README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Unapendelea Kukopa Kwenye Kompyuta?**
>
> Hifadhidata hii ina tafsiri zaidi ya 50 ambazo zinaongeza ukubwa wa kupakua. Ili kukopa bila tafsiri, tumia sparse checkout:
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
> Hii inakupa kila kitu unachohitaji kukamilisha kozi kwa upakua haraka zaidi.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Nini Kipya katika azd Leo

> 📌 Kozi hii imethibitishwa dhidi ya **`azd 1.25.6`** (Juni 2026). Endesha `azd version` kuona jengo lako, na `azd upgrade` kupata toleo jipya.

Azure Developer CLI imekua zaidi ya tovuti za wavuti na API za jadi. Leo, azd ni chombo kimoja cha kuweka programu yoyote kwenye Azure—pamoja na programu zinazoendeshwa na AI na maajenti wanajuzi.

Hii inamaanisha nini kwako:

- **Maajenti za AI sasa ni mzigo wa daraja la kwanza kwa azd.** Unaweza kuanzisha, kuweka, na kusimamia miradi ya maajenti wa AI ukitumia mtiririko uleule `azd init` → `azd up` unaoufahamu.
- **Mzunguko kamili wa maisha ya maajenti kupitia CLI.** Kiendelezi `azure.ai.agents` sasa kinashughulikia safari nzima—`azd ai agent init` kuunda muundo, `azd ai agent invoke` kujaribu (kwa matokeo ya muda wa majibu), `azd ai agent eval generate` na `azd ai agent optimize` kupima na kuboresha ubora, na `azd ai agent delete` kusafisha.
- **Vijenga vilivyo zaidi vya AI.** Viendelezi vipya vya onyesho—`azure.ai.skills` na `azure.ai.connections`—vinakuruhusu kusimamia ujuzi unaoweza kutumika tena wa maajenti na muunganisho wa Foundry moja kwa moja kupitia azd.
- **Uunganisho wa Microsoft Foundry** unaleta uwekezaji wa mifano, ukaazi wa maajenti, na usanidi wa huduma za AI moja kwa moja katika mfumo wa templati za azd.
- **Msingi wa kazi wa kila siku umep smoother.** Matoleo ya hivi karibuni yalifanya `azd init` kuwa idempotent (salama kurudi kumfanya), `azd auth login` kusafisha tokeni zilizozeeka moja kwa moja, na kuongeza mwaliko wa usanidi wa kwanza wa `azd tool`.
- **Mtiririko wa msingi haujakabadilika.** Iwe unapeleka app ya todo, microservice, au suluhisho la AI lenye maajenti wengi, amri ni zile zile.

> **Kumbuka kwa watumiaji wa Aspire:** Microsoft sasa inarejea bidhaa kwa jina **Aspire** (zamani ".NET Aspire"). Msaada wa azd kwa Aspire haujabadilika—jina tu ndilo lililobadilika.

Ikiwa umewahi kutumia azd kabla, msaada wa AI ni nyongeza ya asili—si chombo tofauti au mwendo wa juu. Ikiwa unaanza mpya, utajifunza mtiririko mmoja unaofanya kazi kwa kila kitu.

---

## 🚀 Nini ni Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** ni chombo cha mstari wa amri rafiki kwa msanidi programu kinachofanya iwe rahisi kuweka programu kwenye Azure. Badala ya kuunda na kuunganisha rasilimali nyingi za Azure kwa mikono, unaweza kupeleka programu nzima kwa amri moja.

### Uchawi wa `azd up`

```bash
# Amri hii moja hufanya kila kitu:
# ✅ Inaunda rasilimali zote za Azure
# ✅ Inasanidi mtandao na usalama
# ✅ Inajenga msimbo wa programu yako
# ✅ Inaingiza kwenye Azure
# ✅ Inakupa URL inayofanya kazi
azd up
```

**Ndivyo tu!** Hakuna kubonyeza Portal ya Azure, hakuna templati tata za ARM za kujifunza kwanza, hakuna usanidi wa mikono - tu programu zinazoendelea kwenye Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Tofauti ni Nini?

Hili ndilo swali la kawaida zaidi kwa waanzilishi. Hapa kuna jibu rahisi:

| Sifa | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Madhumuni** | Dhibiti rasilimali za Azure moja moja | Zindua programu kamili |
| **Mtazamo** | Inajikita kwenye miundombinu | Inalenga programu |
| **Mfano** | `az webapp create --name myapp...` | `azd up` |
| **Ugumu wa Kujifunza** | Inahitaji kujua huduma za Azure | Jua tu programu yako |
| **Inafaa Kwa** | DevOps, Miundombinu | Watengenezaji, Uundaji wa mfano |

### Mfano Rahisi

- **Azure CLI** ni kama kuwa na zana zote za kujenga nyumba - mafundo, msumari, matepe. Unaweza kujenga chochote, lakini unahitaji kujua ujenzi.
- **Azure Developer CLI** ni kama kuajiri mkandarasi - unasema unachotaka, na wao wanashughulikia ujenzi.

### Wakati wa Kutumia Kila Moja

| Hali | Tumia Hili |
|----------|----------|
| "Nataka kuweka app yangu ya wavuti haraka" | `azd up` |
| "Nahitaji kuunda tu akaunti ya storage" | `az storage account create` |
| "Ninajenga programu kamili ya AI" | `azd init --template azure-search-openai-demo` |
| "Nahitaji kutatua tatizo la rasilimali maalum ya Azure" | `az resource show` |
| "Nataka kuweka utoaji wa uzalishaji kwa dakika" | `azd up --environment production` |

### Hufanya Kazi Pamoja!

azd inatumia Azure CLI chini ya kapeti. Unaweza kutumia zote mbili:
```bash
# Tumia AZD kuzindua programu yako
azd up

# Kisha rekebisha rasilimali maalum kwa Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Pata Templates katika Awesome AZD

Usianze kutoka mwanzo! **Awesome AZD** ni mkusanyiko wa jamii wa templati tayari-kuwekwa:

| Rasilimali | Maelezo |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Pitia templati 200+ na kuweka kwa bonyeza moja |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Changia templeti yako kwa jamii |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Piga nyota na chunguza chanzo |

### Templati Maarufu za AI kutoka Awesome AZD

```bash
# Mazungumzo ya RAG na Modeli za Microsoft Foundry + Utafutaji wa AI
azd init --template azure-search-openai-demo

# Programu ya Mazungumzo ya Haraka ya AI
azd init --template openai-chat-app-quickstart

# Wakala wa AI na Wakala wa Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Kuanzia katika Hatua 3

Kabla haujaanza, hakikisha mashine yako iko tayari kwa templati unayotaka kupeleka:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Kama ukaguzi wowote unaohitajika utakosa, rekebisha kwanza kisha enda mbele na kuanza haraka.

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

# Inahitajika kwa mikondo ya kazi ya AZD
azd auth login
```

Kama huna uhakika ni ipi unayohitaji, fuata mtiririko kamili wa usanidi katika [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Hatua 3: Weka Programu Yako ya Kwanza

```bash
# Anzisha kutoka kwenye kiolezo
azd init --template todo-nodejs-mongo

# Tengeneza kwenye Azure (inaunda kila kitu!)
azd up
```

**🎉 Hiyo ndiyo!** Programu yako sasa iko hai kwenye Azure.

### Safisha (Usisahau!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Jinsi ya Kutumia Kozi Hii

Kozi hii imeundwa kwa ajili ya **kujifunza taratibu** - anza mahali unapojisikia vizuri na jifunze hatua kwa hatua:

| Uzoefu Wako | Anza Hapa |
|-----------------|------------|
| **Mpya kabisa kwa Azure** | [Sura 1: Msingi](#-chapter-1-foundation--quick-start) |
| **Unajua Azure, mpya kwa AZD** | [Sura 1: Msingi](#-chapter-1-foundation--quick-start) |
| **Unataka kuweka programu za AI** | [Sura 2: Maendeleo Kwanza kwa AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Unataka mazoezi ya vitendo** | [🎓 Warsha ya Vitendo](workshop/README.md) - maabara ya kuongozwa ya saa 3-4 |
| **Unahitaji mifumo ya uzalishaji** | [Sura 8: Uzalishaji & Mifumo ya Kampuni](#-chapter-8-production--enterprise-patterns) |

### Usanidi wa Haraka

1. **Fork This Repository**: [![Forks za GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloni Hii**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Pata Msaada**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Unapendelea Kukopa Kwenye Kompyuta?**

> Hifadhidata hii ina tafsiri zaidi ya 50 ambazo zinaongeza ukubwa wa kupakua. Ili kukopa bila tafsiri, tumia sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Hii inakupa kila kitu unachohitaji kukamilisha kozi kwa upakua haraka zaidi.


## Muhtasari wa Kozi

Tumia Azure Developer CLI (azd) kwa ustadi kupitia sura zilizopangwa kwa ajili ya kujifunza taratibu. **Kipaumbele maalum kwenye utoaji wa programu za AI kwa kuunganishwa na Microsoft Foundry.**
### Kwanini Kozi Hii ni Muhimu kwa Waendelezaji wa Kisasa

Kulingana na mawazo ya jamii ya Microsoft Foundry Discord, **waendelezaji 45% wanataka kutumia AZD kwa kazi za AI** lakini wanakutana na changamoto zifuatazo:
- Miundombinu tata ya huduma nyingi za AI
- Mbinu bora za utoaji wa AI uzalisheni  
- Uinganishaji na usanidi wa huduma za Azure AI
- Uboreshaji wa gharama kwa kazi za AI
- Utatuzi wa matatizo maalum ya utoaji wa AI

### Malengo ya Kujifunza

Kwa kukamilisha kozi hii iliyopangwa, utakuwa na uwezo wa:
- **Kuwa Mtaalamu wa Misingi ya AZD**: Dhana za msingi, usakinishaji, na usanidi
- **Weka Programu za AI**: Tumia AZD na huduma za Microsoft Foundry
- **Tekeleza Miundombinu kama Msimbo**: Dhibiti rasilimali za Azure kwa templet za Bicep
- **Tatua Matatizo ya Utoaji**: Rekebisha masuala ya kawaida na tatua kasoro
- **Boreshaji kwa Uzalishaji**: Usalama, upanuaji, ufuatiliaji, na usimamizi wa gharama
- **Jenga Suluhisho za Wakala Wengi**: Weka miundombinu tata ya AI

## Kabla ya Kuanzia: Akaunti, Ufikiaji, na Dhana

Kabla ya kuanza Sura ya 1, hakikisha una yafuatayo tayari. Hatua za usakinishaji zilizo baadaye katika mwongozo huu zinatumia kuwa misingi hii tayari imeshashughulikiwa.

- **Chombo cha usajili cha Azure**: Unaweza kutumia usajili uliopo wa kazi au akaunti yako mwenyewe, au kuunda [jaribio la bure](https://aka.ms/azurefreetrial) kuanza.
- **Ruhusa ya kuunda rasilimali za Azure**: Kwa mazoezi mengi, unapaswa kuwa na angalau ufikiaji wa **Contributor** kwenye usajili unaolenga au kikundi cha rasilimali. Baadhi ya sura zinaweza pia kudhani unaweza kuunda vikundi vya rasilimali, utambulisho ulioendeshwa (managed identities), na uteuzi za RBAC.
- [**Akaunti ya GitHub**](https://github.com): Hii inafaa kwa kutenganisha (fork) ghala, kufuatilia mabadiliko yako mwenyewe, na kutumia GitHub Codespaces kwa warsha.
- **Vigezo vya wakati wa utekelezaji wa templeti**: Templeti zingine zinahitaji zana za eneo la mtumiaji kama Node.js, Python, Java, au Docker. Endesha programu inayothibitisha usanidi kabla ya kuanza ili ugundue zana zilizokosekana mapema.
- **Ufahamu wa msingi wa terminali**: Huna haja ya kuwa mtaalamu, lakini unapaswa kujisikia vizuri kuendesha amri kama `git clone`, `azd auth login`, na `azd up`.

> **Unafanya kazi kwa usajili wa shirika?**
> Ikiwa mazingira yako ya Azure yanadhibitiwa na msimamizi, thibitisha kabla kwamba unaweza kupeleka rasilimali katika usajili au kikundi cha rasilimali unachopanga kutumia. Ikiwa si hivyo, omba usajili wa sandbox au ufikiaji wa Contributor kabla ya kuanza.

> **Mpya kwa Azure?**
> Anza na jaribio lako la Azure au usajili wa lipa-kama-unavyotumia kwa https://aka.ms/azurefreetrial ili uweze kukamilisha mazoezi kutoka mwanzo hadi mwisho bila kusubiri idhini ya ngazi ya tenanti.

## 🗺️ Ramani ya Kozi: Uvinjari wa Haraka kwa Sura

Kila sura ina README maalum yenye malengo ya kujifunza, uanzishwaji wa haraka, na mazoezi:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Sura 1: Msingi](docs/chapter-01-foundation/README.md)** | Kuanzisha | [Misingi ya AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Usakinishaji](docs/chapter-01-foundation/installation.md) &#124; [Mradi Wako wa Kwanza](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Sura 2: Maendeleo ya AI](docs/chapter-02-ai-development/README.md)** | Programu za Kwanza za AI | [Uinganishaji na Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Wakala za AI](docs/chapter-02-ai-development/agents.md) &#124; [Utoaji wa Mfano](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Warsha](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Sura 3: Usanidi](docs/chapter-03-configuration/README.md)** | Uthibitishaji & Usalama | [Usanidi](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Sura 4: Miundombinu](docs/chapter-04-infrastructure/README.md)** | IaC & Utoaji | [Mwongozo wa Utoaji](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Upatikanaji](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Sura 5: Wakala Wengi](docs/chapter-05-multi-agent/README.md)** | Suluhisho za Wakala wa AI | [Mazingira ya Rejareja](examples/retail-scenario.md) &#124; [Mifumo ya Uratibu](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Sura 6: Kabla ya Utoaji](docs/chapter-06-pre-deployment/README.md)** | Mipango & Uthibitisho | [Ukaguzi wa Kabla ya Kuruka](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Mipango ya Uwezo](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Uchaguzi wa SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Sura 7: Utatuzi matatizo](docs/chapter-07-troubleshooting/README.md)** | Kukanusha & Rekebisha | [Masuala ya Kawaida](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Kukanusha](docs/chapter-07-troubleshooting/debugging.md) &#124; [Masuala ya AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Sura 8: Uzalishaji](docs/chapter-08-production/README.md)** | Mifumo ya Shirika | [Mazingira ya Uzalishaji](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Warsha ya Kazi](workshop/README.md)** | Maabara ya Vitendo | [Utangulizi](workshop/docs/instructions/0-Introduction.md) &#124; [Uchaguzi](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Uthibitisho](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Uchambuzi](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Usanidi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Ubinafsishaji](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Uondishaji Miundombinu](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [KuHitimisha](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Jumla ya Mudhuli wa Kozi:** ~10-14 hours | **Mchakato wa Ustadi:** Msingi → Tayari kwa Uzalishaji

---

## 📚 Suras za Kujifunza

*Chagua njia yako ya kujifunza kulingana na kiwango cha uzoefu na malengo*

### 🚀 Sura 1: Msingi & Anza Haraka
**Sharti za awali**: usajili wa Azure, ujuzi wa msingi wa laini ya amri  
**Muda**: 30-45 dakika  
**Nguvu ngumu**: ⭐

#### Uta Jifunza Nini
- Kuelewa misingi ya Azure Developer CLI
- Kusakinisha AZD kwenye jukwaa lako
- Utoaji wako wa kwanza uliofanikiwa

#### Vyanzo vya Kujifunza
- **🎯 Anza Hapa**: [Azure Developer CLI ni Nini?](#what-is-azure-developer-cli)
- **📖 Nadharia**: [Misingi ya AZD](docs/chapter-01-foundation/azd-basics.md) - Dhana za msingi na istilahi
- **⚙️ Usanidi**: [Usakinishaji & Usanidi](docs/chapter-01-foundation/installation.md) - Mwongozo maalum kwa jukwaa
- **🛠️ Vitendo**: [Mradi Wako wa Kwanza](docs/chapter-01-foundation/first-project.md) - Mafunzo hatua kwa hatua
- **📋 Marejeleo ya Haraka**: [Karatasi ya Amri](resources/cheat-sheet.md)

#### Mazoezi ya Kivitendo
```bash
# Ukaguzi wa haraka wa usakinishaji
azd version

# Sambaza programu yako ya kwanza
azd init --template todo-nodejs-mongo
azd up
```

**💡 Matokeo ya Sura**: Weka kwa mafanikio programu rahisi ya wavuti kwenye Azure ukitumia AZD

**✅ Uthibitisho wa Mafanikio:**
```bash
# Baada ya kumalizia Sura ya 1, unapaswa kuwa na uwezo wa:
azd version              # Inaonyesha toleo lililosakinishwa
azd init --template todo-nodejs-mongo  # Inaanzisha mradi
azd up                  # Inaweka kwenye Azure
azd show                # Inaonyesha URL ya programu inayokimbia
# Programu inafunguliwa katika kivinjari na inafanya kazi
azd down --force --purge  # Inasafisha rasilimali
```

**📊 Muda uliowekwa:** 30-45 dakika  
**📈 Kiwango cha Ujuzi Baada:** Anaweza kuweka programu za msingi kwa kujitegemea
**📈 Kiwango cha Ujuzi Baada:** Anaweza kuweka programu za msingi kwa kujitegemea

---

### 🤖 Sura 2: Maendeleo ya AI-Kwanza (Inapendekezwa kwa Waendelezaji wa AI)
**Sharti za awali**: Sura 1 imekamilika  
**Muda**: 1-2 saa  
**Nguvu ngumu**: ⭐⭐

#### Uta Jifunza Nini
- Uinganishaji wa Microsoft Foundry na AZD
- Kuweka programu zenye uwezo wa AI
- Kuelewa usanidi wa huduma za AI

#### Vyanzo vya Kujifunza
- **🎯 Anza Hapa**: [Uinganishaji wa Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Wakala za AI**: [Mwongozo wa Wakala za AI](docs/chapter-02-ai-development/agents.md) - Weka mawakala wenye akili kwa AZD
- **📖 Mifumo**: [Utoaji wa Mfano wa AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Weka na dhibiti mifano ya AI
- **🛠️ Warsha**: [Maabara ya AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Fanya suluhisho zako za AI ziwe tayari kwa AZD
- **🎥 Mwongozo wa Kiingilio**: [Vifaa vya Warsha](workshop/README.md) - Kujifunza kwa kivinjari kwa MkDocs * Mazingira ya DevContainer
- **📋 Templeti**: [Microsoft Foundry Templates](#rasilimali-za-warsha)
- **📝 Mifano**: [Mifano ya Utoaji wa AZD](examples/README.md)

#### Mazoezi ya Kivitendo
```bash
# Weka programu yako ya kwanza ya AI
azd init --template azure-search-openai-demo
azd up

# Jaribu templeti za ziada za AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Matokeo ya Sura**: Weka na kusanidi programu ya gumzo yenye uwezo wa AI na uwezo wa RAG

**✅ Uthibitisho wa Mafanikio:**
```bash
# Baada ya Sura ya 2, unapaswa kuwa na uwezo wa:
azd init --template azure-search-openai-demo
azd up
# Jaribu kiolesura cha mazungumzo cha AI
# Uliza maswali na upate majibu yanayoungwa mkono na AI pamoja na vyanzo
# Thibitisha kwamba muunganisho wa utafutaji unafanya kazi
azd monitor  # Angalia Application Insights inaonyesha data za telemetri
azd down --force --purge
```

**📊 Muda uliowekwa:** 1-2 saa  
**📈 Kiwango cha Ujuzi Baada:** Anaweza kuweka na kusanidi programu za AI zilizotengenezwa kwa uzalishaji  
**💰 Uelewa wa Gharama:** Elewa gharama za $80-150/mwezi kwa maendeleo, $300-3500/mwezi kwa uzalishaji

#### 💰 Mambo ya Kuzingatia Gharama kwa Utoaji wa AI

**Mazingira ya Maendeleo (Kadirio $80-150/mwezi):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/month (kulingana na matumizi ya tokeni)
- AI Search (tier ya Msingi): $75/month
- Container Apps (Consumption): $0-20/month
- Storage (Standard): $1-5/month

**Mazingira ya Uzalishaji (Kadirio $300-3,500+/mwezi):**
- Microsoft Foundry Models (PTU kwa utendaji thabiti): $3,000+/month AU Pay-as-go kwa kiasi kikubwa cha matumizi
- AI Search (tier ya Standard): $250/month
- Container Apps (Dedicated): $50-100/month
- Application Insights: $5-50/month
- Storage (Premium): $10-50/month

**💡 Vidokezo vya Kupunguza Gharama:**
- Tumia **Free Tier** ya Microsoft Foundry Models kwa kujifunza (Azure OpenAI 50,000 tokens/month imejumuishwa)
- Endesha `azd down` ili kuondoa rasilimali wakati hauko kwenye maendeleo kwa bidii
- Anza na bili inayotegemea matumizi (consumption), boresha kwa PTU tu kwa uzalishaji
- Tumia `azd provision --preview` kukadiria gharama kabla ya utoaji
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
**Sharti za awali**: Sura 1 imekamilika  
**Muda**: 45-60 dakika  
**Nguvu ngumu**: ⭐⭐

#### Uta Jifunza Nini
- Usanidi wa mazingira na usimamizi
- Mbinu bora za uthibitishaji na usalama
- Kununua majina ya rasilimali na upangaji

#### Vyanzo vya Kujifunza
- **📖 Usanidi**: [Mwongozo wa Usanidi](docs/chapter-03-configuration/configuration.md) - Usanidi wa mazingira
- **🔐 Usalama**: [Mifumo ya uthibitishaji na utambulisho ulioendeshwa](docs/chapter-03-configuration/authsecurity.md) - Mifumo ya uthibitishaji
- **📝 Mifano**: [Mfano wa Programu ya Database](examples/database-app/README.md) - Mifano ya Database ya AZD

#### Mazoezi ya Kivitendo
- Sanidi mazingira mengi (dev, staging, prod)
- Weka uthibitishaji wa utambulisho ulioendeshwa
- Tekeleza usanidi maalum kwa mazingira

**💡 Matokeo ya Sura**: Dhibiti mazingira mengi kwa uthibitishaji na usalama sahihi

---

### 🏗️ Sura 4: Miundombinu kama Msimbo & Utoaji
**Sharti za awali**: Suras 1-3 zimekamilika  
**Muda**: 1-1.5 saa  
**Nguvu ngumu**: ⭐⭐⭐

#### Uta Jifunza Nini
- Mifumo ya juu ya utoaji
- Miundombinu kama Msimbo na Bicep
- Mikakati ya upatikanaji wa rasilimali

#### Vyanzo vya Kujifunza
- **📖 Utoaji**: [Mwongozo wa Utoaji](docs/chapter-04-infrastructure/deployment-guide.md) - Mifumo kamili ya kazi
- **🏗️ Utoaji wa Rasilimali**: [Upatikanaji wa Rasilimali](docs/chapter-04-infrastructure/provisioning.md) - Usimamizi wa rasilimali za Azure
- **📝 Mifano**: [Mfano wa Container App](../../examples/container-app) - Utoaji wa containerized

#### Mazoezi ya Kivitendo
- Unda templeti za Bicep za desturi
- Weka programu za huduma nyingi
- Tekeleza mikakati ya utoaji ya blue-green

**💡 Matokeo ya Sura**: Weka programu tata za huduma nyingi ukitumia templeti za miundombinu za desturi

---
### 🎯 Sura 5: Suluhisho za AI za Wakala Wengi (Hali ya Juu)
**Mahitaji ya awali**: Sura 1-2 zimekamilika  
**Muda**: 2-3 saa  
**Ugumu**: ⭐⭐⭐⭐

#### Utajifunza Nini
- Mifumo ya usanifu wa wakala wengi
- Kuandamana na kuratibu wakala
- Uwekaji katika uzalishaji tayari kwa matumizi

#### Rasilimali za Kujifunzia
- **🤖 Mradi Ulioangaziwa**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Utekelezaji kamili
- **🛠️ Violezo vya ARM**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Uwekaji kwa bonyeza moja
- **📖 Usanifu**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mifumo

#### Mazoezi ya Kivitendo
```bash
# Weka suluhisho kamili la rejareja la mawakala wengi
cd examples/retail-multiagent-arm-template
./deploy.sh

# Chunguza usanidi wa mawakala
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Matokeo ya Sura**: Weka na usimamishe suluhisho la AI la wakala wengi tayari kwa uzalishaji na wakala wa Mteja na Mkandarasi wa Hesabu

---

### 🔍 Sura 6: Uthibitishaji & Mipango Kabla ya Uwekaji
**Mahitaji ya awali**: Sura 4 imekamilika  
**Muda**: 1 saa  
**Ugumu**: ⭐⭐

#### Utajifunza Nini
- Mipango ya uwezo na uthibitishaji wa rasilimali
- Mikakati ya uteuzi wa SKU
- Ukaguzi wa kabla ya safari na uundaji wa otomatiki

#### Rasilimali za Kujifunzia
- **📊 Mipango**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Uthibitishaji wa rasilimali
- **💰 Uteuzi**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Chaguo za gharama nafuu
- **✅ Uthibitishaji**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Skripti za otomatiki

#### Mazoezi ya Kivitendo
- Endesha skripti za uthibitishaji wa uwezo
- Boresha uteuzi wa SKU kwa gharama
- Tekeleza ukaguzi wa otomatiki kabla ya uwekaji

**💡 Matokeo ya Sura**: Thibitisha na boresha uwekezaji kabla ya utekelezaji

---

### 🚨 Sura 7: Utatuzi Tatizo & Ufungaji Hitilafu
**Mahitaji ya awali**: Sura yoyote ya uwekaji imekamilika  
**Muda**: 1-1.5 saa  
**Ugumu**: ⭐⭐

#### Utajifunza Nini
- Mbinu za kimfumo za utafutaji hitilafu
- Masuala ya kawaida na suluhisho
- Utatuzi wa matatizo maalum ya AI

#### Rasilimali za Kujifunzia
- **🔧 Masuala ya Kawaida**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - Maswali ya mara kwa mara na suluhisho
- **🕵️ Ufungaji Hitilafu**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Mikakati hatua kwa hatua
- **🤖 Masuala ya AI**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Matatizo ya huduma za AI

#### Mazoezi ya Kivitendo
- Tambua kushindwa kwa uwekaji
- Rekebisha matatizo ya uthibitisho
- Fufua muunganisho wa huduma za AI

**💡 Matokeo ya Sura**: Tafiti na utatatue kwa uhuru matatizo ya kawaida ya uwekaji

---

### 🏢 Sura 8: Uzalishaji & Mifumo ya Shirika
**Mahitaji ya awali**: Sura 1-4 zimekamilika  
**Muda**: 2-3 saa  
**Ugumu**: ⭐⭐⭐⭐

#### Utajifunza Nini
- Mikakati ya uwekaji wa uzalishaji
- Mifumo ya usalama ya shirika
- Ufuatiliaji na uboreshaji wa gharama

#### Rasilimali za Kujifunzia
- **🏭 Uzalishaji**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Mifumo ya shirika
- **📝 Mifano**: [Microservices Example](../../examples/microservices) - Mifumo tata
- **📊 Ufuatiliaji**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Ufuatiliaji

#### Mazoezi ya Kivitendo
- Tekeleza mifumo ya usalama ya shirika
- Weka ufuatiliaji kamili
- Wezesha uwekaji wa uzalishaji kwa udhibiti unaofaa

**💡 Matokeo ya Sura**: Weka programu zinazofaa kwa shirika zenye uwezo kamili wa uzalishaji

---

## 🎓 Muhtasari wa Warsha: Uzoefu wa Kujifunza kwa Vitendo

> **⚠️ HALI YA WARSHA: Inaendelezwa**  
> Vifaa vya warsha vinaendelezwa na kuboreshwa kwa sasa. Moduli za msingi zinafanya kazi, lakini baadhi ya sehemu za juu hazijaokolewa. Tunaendelea kazi ili kukamilisha yote. [Fuata maendeleo →](workshop/README.md)

### Vifaa Vinavyoshirikiana vya Warsha
**Uzoefu kamili wa kujifunza kwa vitendo kwa kutumia zana za kivinjari na mazoezi yaliyoongozwa**

Vifaa vya warsha vinatoa uzoefu wa kujifunza uliopangwa, wa kushirikiana unaoendana na mtaala wa sura zilizotajwa hapo juu. Warsha imeundwa kwa kujifunza kwa mwendo wako mwenyewe na pia kwa vikao vinavyoongozwa na mwalimu.

#### 🛠️ Sifa za Warsha
- **Kiolesura cha Kivinjari**: Warsha kamili yenye MkDocs yenye mfumo wa utafutaji, kunakili, na mandhari
- **Uunganisho wa GitHub Codespaces**: Utekelezaji wa mazingira ya maendeleo kwa bonyeza moja
- **Njia ya Kujifunza Iliyopangwa**: Mazoezi yaliyoongozwa katika moduli 8 (3-4 saa jumla)
- **Mbinu Inayoendelea**: Utambulisho → Uteuzi → Uthibitishaji → Uvunjaji → Uundaji → Ubinafsishaji → Kuondoa → Muhtasari
- **Mazingira ya DevContainer Yanayoshirikiana**: Zana na utegemezi vimepangwa kabla

#### 📚 Muundo wa Moduli za Warsha
Warsha inafuata mbinu ya **moduli 8 inayozidi** inayokuchukua kutoka kugundua hadi utaalamu wa uwekaji:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 dak |
| **1. Selection** | Template Discovery | Explore AZD templates and select the right AI template for your scenario | 20 dak |
| **2. Validation** | Deploy & Verify | Deploy the template with `azd up` and validate infrastructure works | 30 dak |
| **3. Deconstruction** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 dak |
| **4. Configuration** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 dak |
| **5. Customization** | Make It Yours | Enable AI Search, tracing, evaluation, and customize for your scenario | 45 dak |
| **6. Teardown** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 dak |
| **7. Wrap-up** | Next Steps | Review accomplishments, key concepts, and continue your learning journey | 15 dak |

**Mtiririko wa Warsha:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Jinsi ya Kuanza na Warsha
```bash
# Chaguo 1: GitHub Codespaces (Inapendekezwa)
# Bonyeza "Code" → "Create codespace on main" katika hazina ya mradi

# Chaguo 2: Maendeleo ya ndani
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Fuata maagizo ya usanidi katika workshop/README.md
```

#### 🎯 Matokeo ya Kujifunza ya Warsha
Kwa kukamilisha warsha, washiriki wataweza:
- **Weka Programu za AI za Uzalishaji**: Tumia AZD na huduma za Microsoft Foundry
- **Tengeneza Mifumo ya Wakala Wengi**: Tekeleza suluhisho za wakala za AI zilizo na ushirikiano
- **Tekeleza Mazoezi Bora ya Usalama**: Sanidi uthibitisho na udhibiti wa upatikanaji
- **Boreshaji kwa Kiwango**: Buni uwekezaji wa gharama nafuu na wenye utendaji
- **Tatua Matatizo ya Uwekaji**: Rekebisha matatizo ya kawaida kwa uhuru

#### 📖 Rasilimali za Warsha
- **🎥 Mwongozo wa Kuelimisha**: [Workshop Materials](workshop/README.md) - Mazingira ya kujifunzia kwa kivinjari
- **📋 Maelekezo Moduli kwa Moduli**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Muhtasari wa warsha na malengo
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Tafuta na chagua templeti za AI
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Weka na thibitisha templeti
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Chunguza usanifu wa templeti
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Mwelekeo wa azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Binafsisha kwa tukio lako
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Safisha rasilimali
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Pitia na hatua zinazofuata
- **🛠️ Maabara ya Warsha ya AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Mazoezi yanayolenga AI
- **💡 Mwanzilishi Haraka**: [Workshop Setup Guide](workshop/README.md#quick-start) - Usanidi wa mazingira

**Inafaa kwa**: Mafunzo ya kampuni, kozi za vyuo vikuu, kujifunza kwa mwendo wako mwenyewe, na bootcamps za watengenezaji.

---

## 📖 Uchunguzi wa Kina: Uwezo wa AZD

Zaidi ya msingi, AZD inatoa sifa zenye nguvu kwa uwekaji wa uzalishaji:

- **Uwekaji kulingana na violezo** - Tumia violezo vilivyotengenezwa tayari kwa mifumo ya kawaida ya programu
- **Miundombinu kama Msimbo** - Dhibiti rasilimali za Azure kwa kutumia Bicep au Terraform  
- **Mtiririko ulioingiliana** - Weka, wekeza, na fuatilia programu bila mshikamano
- **Rafiki kwa watengenezaji** - Imerekebishwa kwa uzalishaji wa tija na uzoefu wa mtengenezaji

### **AZD + Microsoft Foundry: Inafaa kwa Uwekaji wa AI**

**Kwa nini AZD kwa Suluhisho za AI?** AZD inashughulikia changamoto kuu zinazokabiliwa na watengenezaji wa AI:

- **Violezo Tayari kwa AI** - Violezo vilivyopangwa awali kwa Microsoft Foundry Models, Azure AI Services, na mzigo wa kazi wa ML
- **Uwekaji wa AI Ulio Salama** - Mifumo ya usalama iliyojengwa kwa huduma za AI, funguo za API, na viambatisho vya mifano  
- **Mifumo ya AI kwa Uzalishaji** - Mazoezi bora kwa uwekeaji unaoweza kupanuka na gharama nafuu
- **Mtiririko wa Kazi wa AI Kuanzia Mwisho hadi Mwisho** - Kutoka kwenye maendeleo ya modeli hadi uwekaji uzalishaji na ufuatiliaji unaofaa
- **Ukaguzi wa Gharama** - Ugawaji wa rasilimali kwa busara na mikakati ya kupanua kwa mzigo wa AI
- **Uunganisho wa Microsoft Foundry** - Muunganisho bila mshiko kwa katalogi ya modeli za Microsoft Foundry na viambatisho

---

## 🎯 Maktaba ya Violezo & Mifano

### Iliyotajwa: Violezo za Microsoft Foundry
**Anza hapa ukiacha ikiwa unaweka programu za AI!**

> **Kumbuka:** Violezo hivi vinaonyesha mifumo mbalimbali ya AI. Baadhi ni Azure Samples za nje, wengine ni utekelezaji wa ndani.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Nje |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Nje |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Nje |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Nje |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Nje |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Nje |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Ndani** |

### Iliyotajwa: Mifano Kamili ya Kujifunzia
**Violezo vya programu vinavyostahili uzalishaji vinavyopangwa kulingana na sura za kujifunzia**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### Kujifunza kwa Aina ya Mfano

> **📌 Mifano ya Ndani dhidi ya Nje:**  
> **Mifano ya Ndani** (katika repo hii) = Tayari kutumika mara moja  
> **Mifano ya Nje** (Azure Samples) = Nakili kutoka kwa repo zilizo na viungo

#### Mifano ya Ndani (Tayari Kutumika)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Utekelezaji kamili tayari kwa uzalishaji na violezo vya ARM
  - Usanifu wa wakala wengi (Mteja + Wakala wa Hisa)
  - Ufuatiliaji na tathmini kamili
  - Uwekaji kwa bonyeza moja kupitia templeti ya ARM

#### Mifano ya Ndani - Maombi ya Kontena (Sura 2-5)
**Mifano kamili ya uwekaji wa kontena katika repo hii:**
- [**Mifano ya Container App**](examples/container-app/README.md) - Mwongozo kamili kwa utoaji wa programu kwa kutumia container
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API ya msingi ya REST yenye uwezo wa kupungua hadi sifuri (scale-to-zero)
  - [Miundombinu ya Microservices](../../examples/container-app/microservices) - Utoaji wa huduma nyingi tayari kwa uzalishaji
  - Mwanzoni kwa Haraka, Uzalishaji, na mifumo ya utoaji ya juu
  - Ufuatiliaji, usalama, na mwongozo wa uboreshaji wa gharama

#### Mifano ya Nje - Programu Rahisi (Sura 1-2)
**Fanya clone ya hazina hizi za Azure Samples ili kuanza:**
- [Programu ya Wavuti Rahisi - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mifumo ya msingi ya utoaji
- [Tovuti ya Statiki - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Utoaji wa maudhui ya statiki
- [Programu ya Container - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Utoaji wa API ya REST

#### Mifano ya Nje - Uunganishaji wa Hifadhidata (Sura 3-4)  
- [Programu ya Hifadhidata - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mifumo ya muunganisho wa hifadhidata
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Mtiririko wa data usio na seva

#### Mifano ya Nje - Mifumo ya Juu (Sura 4-8)
- [Microservices za Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Miundo ya huduma nyingi
- [Kazi za Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Usindikaji wa nyuma  
- [Mlolongo wa ML wa Kampuni](https://github.com/Azure-Samples/mlops-v2) - Mifumo ya ML tayari kwa uzalishaji

### Mkusanyiko wa Mifano za Nje
- [**Jukwaa Rasmi la Mifano za AZD**](https://azure.github.io/awesome-azd/) - Mkusanyiko ulioratibiwa wa mifano rasmi na ya jamii
- [**Mifano za Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Nyaraka za Microsoft Learn kuhusu mifano
- [**Katalogi ya Mifano**](examples/README.md) - Mifano ya kujifunzia ya ndani yenye maelezo ya kina

---

## 📚 Rasilimali za Kujifunza na Marejeo

### Marejeo ya Haraka
- [**Muhtasari wa Amri**](resources/cheat-sheet.md) - Amri muhimu za azd zilizoandaliwa kwa sura
- [**Kamusi**](resources/glossary.md) - Istilahi za Azure na azd  
- [**Maswali Yanayoulizwa Mara kwa Mara**](resources/faq.md) - Maswali ya kawaida yaliyopangwa kwa sura za kujifunza
- [**Mwongozo wa Masomo**](resources/study-guide.md) - Mazoezi kamili ya vitendo

### Warsha za Vitendo
- [**Maabara ya Warsha ya AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Fanya suluhisho zako za AI ziweze kupelekwa na AZD (2-3 saa)
- [**Warsha ya Kihusishi**](workshop/README.md) - Mazoezi ya moduli 8 yaliyoongozwa na MkDocs na GitHub Codespaces
  - Inafuata: Utangulizi → Uchaguzi → Uthibitisho → Uchambuzi → Usanidi → Ubinafsishaji → Uondoshaji → Hitimisho

### Rasilimali za Kujifunza za Nje
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### Ujuzi wa Wakala wa AI kwa Mhariri Wako
- [**Ujuzi za Microsoft Azure kwenye skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - Ujuzi 37 za wakala zilizoungwa wazi kwa Azure AI, Foundry, utoaji, uchunguzi, uboreshaji wa gharama, na zaidi. Zisakinishe kwenye GitHub Copilot, Cursor, Claude Code, au wakala yeyote unaoungwa mkono:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Mwongozo Mfupi wa Utatuzi wa Matatizo

**Matatizo ya kawaida ambayo wanaoanza hukutana nayo na suluhisho za haraka:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

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
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Orodhesha usajili yanayopatikana
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
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

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
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Chaguo 1: Safisha na ujaribu tena
azd down --force --purge
azd up

# Chaguo 2: Rekebisha tu miundombinu
azd provision

# Chaguo 3: Angalia hali ya kina
azd show

# Chaguo 4: Angalia rejista katika Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Thibitisha upya kwa AZD
azd auth logout
azd auth login

# Hiari: fanya upya Azure CLI pia ikiwa unaendesha amri za az
az logout
az login

# Thibitisha uthibitishaji
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD inazalisha majina ya kipekee, lakini ikiwa kuna mgongano:
azd down --force --purge

# Kisha jaribu tena kwa mazingira mapya
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Muda wa kawaida wa kusubiri:**
- Programu ya wavuti rahisi: 5-10 dakika
- Programu yenye hifadhidata: 10-15 dakika
- Programu za AI: 15-25 dakika (Utoaji wa OpenAI ni polepole)

```bash
# Angalia maendeleo
azd show

# Ikiwa umekwama kwa zaidi ya dakika 30, angalia Azure Portal:
azd monitor --overview
# Tafuta utekelezaji ulioshindwa
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Angalia jukumu lako la Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Unahitaji angalau jukumu la "Contributor"
# Omba msimamizi wako wa Azure atoe:
# - Contributor (kwa rasilimali)
# - User Access Administrator (kwa ugawaji wa majukumu)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Onyesha miisho yote ya huduma
azd show

# Au fungua Portal ya Azure
azd monitor

# Angalia huduma maalum
azd env get-values
# Tafuta vigezo vya *_URL
```
</details>

### 📚 Rasilimali Kamili za Utatuzi wa Matatizo

- **Mwongozo wa Masuala ya Kawaida:** [Suluhisho Zaidi](docs/chapter-07-troubleshooting/common-issues.md)
- **Masuala Maalum ya AI:** [Utatuzi wa AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Mwongozo wa Kupima Hitilafu:** [Kupima Hitilafu Hatua kwa Hatua](docs/chapter-07-troubleshooting/debugging.md)
- **Pata Msaada:** [Discord ya Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kukamilisha Kozi & Cheti

### Ufuatiliaji wa Maendeleo
Fuata maendeleo yako ya kujifunza kupitia kila sura:

- [ ] **Sura 1**: Msingi & Mwanzo wa Haraka ✅
- [ ] **Sura 2**: Maendeleo ya AI-Kwanza ✅  
- [ ] **Sura 3**: Usanidi & Uthibitishaji ✅
- [ ] **Sura 4**: Miundombinu kama Msimbo & Utoaji ✅
- [ ] **Sura 5**: Suluhisho za AI za Mawakala Wengi ✅
- [ ] **Sura 6**: Uthibitishaji na Mipango Kabla ya Utoaji ✅
- [ ] **Sura 7**: Utatuzi wa Matatizo & Kupima Hitilafu ✅
- [ ] **Sura 8**: Mifumo ya Uzalishaji & Kampuni ✅

### Uhakiki wa Kujifunza
Baada ya kukamilisha kila sura, thibitisha maarifa yako kwa:
1. **Mazoezi ya Vitendo**: Kamilisha utekelezaji wa vitendo wa sura
2. **Ukaguzi wa Maarifa**: Pitia sehemu ya Maswali Yanayoulizwa Mara kwa Mara kwa sura yako
3. **Majadiliano ya Jamii**: Sambaza uzoefu wako kwenye Discord ya Azure
4. **Sura Ifuatayo**: Hamia kwenye ngazi inayofuata ya ugumu

### Manufaa ya Kukamilisha Kozi
Baada ya kukamilisha sura zote, utakuwa na:
- **Uzoefu wa Uzalishaji**: Umeweka programu halisi za AI kwenye Azure
- **Ujuzi wa Kitaalamu**: Uwezo wa utoaji kwa kiwango cha kampuni  
- **Utambuzi wa Jamii**: Mwanachama hai wa jamii ya watengenezaji wa Azure
- **Maendeleo ya Kazi**: Ustadi unaotakikana wa AZD na utoaji wa AI

---

## 🤝 Jamii & Msaada

### Pata Msaada & Usaidizi
- **Masuala ya Kiufundi**: [Ripoti mende na omba vipengele vipya](https://github.com/microsoft/azd-for-beginners/issues)
- **Maswali ya Kujifunza**: [Jumuiya ya Discord ya Microsoft Azure](https://discord.gg/microsoft-azure) na [![Discord ya Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Msaada Maalum wa AI**: Jiunge na [![Discord ya Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Nyaraka**: [Nyaraka Rasmi za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Maarifa ya Jamii kutoka Discord ya Microsoft Foundry

**Matokeo ya Kura za Karibuni kutoka Kituo #Azure:**
- **45%** ya watengenezaji wanataka kutumia AZD kwa kazi za AI
- **Changamoto kuu**: Utoaji wa huduma nyingi, usimamizi wa vyeti, utayari kwa uzalishaji  
- **Zilizohitajiwa zaidi**: Mifano maalum ya AI, mwongozo wa utatuzi wa matatizo, mbinu bora

**Jiunge na jamii yetu ili:**
- Shirikisha uzoefu wako wa AZD + AI na upate msaada
- Pata muhtasari wa awali wa mifano mpya ya AI
- Changia katika mbinu bora za utoaji wa AI
- Kuathiri maendeleo ya vipengele vya AI + AZD vijavyo

### Kuchangia kwenye Kozi
Tunakaribisha michango! Tafadhali soma [Mwongozo wa Kuchangia](CONTRIBUTING.md) kwa maelezo juu ya:
- **Marekebisho ya Yaliyomo**: Boreshaji sura na mifano iliyopo
- **Mifano Mpya**: Ongeza matukio ya ulimwengu halisi na mifano  
- **Tafsiri**: Saidia kudumisha msaada wa lugha nyingi
- **Ripoti za Mende**: Boresha usahihi na uwazi
- **Vigezo vya Jamii**: Fuata miongozo yetu ya jamii jumuishi

---

## 📄 Taarifa za Kozi

### Leseni
Mradi huu umepewa leseni chini ya Leseni ya MIT - angalia faili ya [LICENSE](../../LICENSE) kwa maelezo.

### Rasilimali Zinazohusiana za Kujifunza za Microsoft

Timu yetu inatengeneza kozi nyingine za kina za kujifunza:

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
 
### Generative AI Series
[![Generative AI kwa Waanzilishi](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![AI Inayozalisha (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Mafunzo ya Msingi
[![ML kwa Waanzilishi](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Sayansi ya Takwimu kwa Waanzilishi](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI kwa Waanzilishi](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Usalama wa Mtandao kwa Waanzilishi](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Utengenezaji wa Wavuti kwa Waanzilishi](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT kwa Waanzilishi](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Maendeleo ya XR kwa Waanzilishi](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Mfululizo wa Copilot
[![Copilot kwa Kuprogramu Pamoja na AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot kwa C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Adventure ya Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Mwongozo wa Kozi

**🚀 Tayari kuanza kujifunza?**

**Waanzilishi**: Anza na [Sura 1: Msingi & Mwanzoni kwa Haraka](#-chapter-1-foundation--quick-start)  
**Waendelezaji wa AI**: Nenda kwenye [Sura 2: Maendeleo ya AI-Kwanza](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Waendelezaji Wenye Uzoefu**: Anza na [Sura 3: Usanidi & Uthibitishaji](#️-chapter-3-configuration--authentication)

**Hatua Zifuatazo**: [Anza Sura 1 - Misingi ya AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->