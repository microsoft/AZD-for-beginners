# AZD Kwa Waanzilishi: Safari ya Kujifunza Iliyo Pangwa

![AZD-for-beginners](../../translated_images/sw/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Tafsiri Moja Kwa Moja (Daima Zilizosasishwa)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Manipuri (Meitei Mayek)](../mni/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](./README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Unapendelea Kunakili Kwenye Kompyuta Yako?**
>
> Hifadhi hii ina tafsiri za lugha 50+ ambazo huongeza ukubwa wa kupakua kwa kiasi kikubwa. Ili kunakili bila tafsiri, tumia sparse checkout:
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
> Hii inakupa kila kitu unachohitaji kukamilisha kozi kwa upakuaji wa kasi zaidi.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Nini Kipya katika azd Leo

> 📌 Kozi hii imethibitishwa dhidi ya **`azd 1.27.1`** (Julai 2026). Endesha `azd version` ili kuangalia ujenzi wako, na `azd upgrade` kupata toleo jipya.

Azure Developer CLI imekua zaidi ya programu za wavuti za jadi na API. Leo, azd ni chombo kimoja kwa ajili ya kuweka **programu yoyote** Azure—kama vile programu zilizo na AI na mawakala wenye akili.

Hapa kuna maana yake kwako:

- **Mawakala wa AI sasa ni mzigo wa daraja la azd la daraja la kwanza.** Unaweza kuanzisha, kuweka na kusimamia miradi ya wakala wa AI ukitumia mtiririko wa kazi wa `azd init` → `azd up` ambao tayari unajua.
- **Mzunguko kamili wa wakala kutoka kwa CLI.** Kiongezwa cha `azure.ai.agents` sasa kinashughulikia safari yote—`azd ai agent init` kuunda msingi, `azd ai agent invoke` kujaribu (kwa matokeo ya wakati wa jibu), `azd ai agent eval generate` na `azd ai agent optimize` kupima na kuboresha ubora, na `azd ai agent delete` kusafisha.
- **Vijengo vya AI zaidi.** Viendelezaji vipya vya preview—`azure.ai.skills` na `azure.ai.connections`—vinakuwezesha kusimamia ujuzi wa wakala unaoweza kutumika tena na muunganisho wa Foundry moja kwa moja na azd.
- **Muunganisho wa Microsoft Foundry** huleta usambazaji wa modeli, usimamizi wa wakala, na usanidi wa huduma za AI moja kwa moja ndani ya mfumo wa templeti wa azd.
- **Msingi wa kila siku ulio laini zaidi.** Matoleo ya hivi karibuni yamefanya `azd init` kuwa idempotent (salama kuendesha tena), yaliyofanya `azd auth login` kufuta tokeni za zamani moja kwa moja, na kuongeza kauli nzuri ya mtoto wa kwanza wa usanidi wa `azd tool`.
- **Mtiririko wa msingi haujabadilika.** Iwe unakitumia kupeleka programu ya todo, microservice, au suluhisho la AI lenye mawakala wengi, amri ni zile zile.

> **Kumbuka kwa watumiaji wa Aspire:** Microsoft sasa inataja bidhaa hii kwa jina rahisi **Aspire** (zamani ".NET Aspire"). Usaidizi wa Aspire wa azd haujabadilika—jina pekee ndilo lililobadilika.

Ikiwa umewahi kutumia azd hapo awali, msaada wa AI ni ongezeko la asili—si chombo tofauti au njia ya juu zaidi. Ikiwa unaanza mpya, utajifunza mtiririko mmoja unaofanya kazi kwa kila kitu.

---

## 🚀 Azure Developer CLI (azd) ni Nini?

**Azure Developer CLI (azd)** ni chombo cha amri rahisi kwa waendelezaji ambacho hufanya iwe rahisi kuweka programu kwenye Azure. Badala ya kuanzisha na kuunganisha rasilimali nyingi za Azure kwa mkono, unaweza kuweka programu nzima kwa amri moja.

### Uchawi wa `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

**Hiyo ni yote!** Hakuna kubofya Azure Portal, hakuna templates tata za ARM za kujifunza kwanza, hakuna usanidi wa mkono - programu zenye kazi tu kwenye Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Tofauti ni Nini?

Huu ndio swali maarufu zaidi kwa waanzilishi. Hapa ni jibu rahisi:

| Kipengele | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Madhumuni** | Kusimamia rasilimali za Azure binafsi | Kuweka programu kamili |
| **Mtazamo** | Kuangalia msingi wa miundombinu | Kuangalia programu |
| **Mfano** | `az webapp create --name myapp...` | `azd up` |
| **Kiwango cha Kujifunza** | Inabidi ujue huduma za Azure | Jua programu yako tu |
| **Bora Kwa** | DevOps, Miundombinu | Waendelezaji, Uundaji mfano |

### Mfano Rahisi

- **Azure CLI** ni kama kuwa na zana zote za kujenga nyumba - nyundo, pembejeo, pua. Unaweza kujenga chochote, lakini unahitaji kujua ujenzi.
- **Azure Developer CLI** ni kama kuwa na mkandarasi - unaeleza unachotaka, na wao wanashughulikia ujenzi.

### Wakati wa Kutumia Kila Moja

| Hali | Tumia Hii |
|----------|----------|
| "Nataka kuweka programu yangu ya wavuti kwa haraka" | `azd up` |
| "Nahitaji kuunda akaunti ya kuhifadhi tu" | `az storage account create` |
| "Ninaunda programu kamili ya AI" | `azd init --template azure-search-openai-demo` |
| "Nahitaji kutatua hitilafu ya rasilimali maalum ya Azure" | `az resource show` |
| "Nataka kuweka uzalishaji tayari kwa dakika chache" | `azd up --environment production` |

### Wanatumika Pamoja!

AZD hutumia Azure CLI chini ya kifuniko. Unaweza kutumia zote mbili:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Pata Templeti katika Awesome AZD

Usianze kutoka mwanzo! **Awesome AZD** ni mkusanyiko wa jamii wa templeti tayari kuwekwa:

| Rasilimali | Maelezo |
|----------|-------------|
| 🔗 [**Gallery ya Awesome AZD**](https://azure.github.io/awesome-azd/) | Vinjari templeti 200+ kwa kuweka kwa kubofya mara moja |
| 🔗 [**Wasilisha Templeti**](https://github.com/Azure/awesome-azd/issues) | Changia templeti yako binafsi kwa jamii |
| 🔗 [**Hifadhi ya GitHub**](https://github.com/Azure/awesome-azd) | Ingia na chunguza chanzo |

### Templeti maarufu za AI kutoka Awesome AZD

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Anza Kwa Hatua 3

Kabla hujaanza, hakikisha kifaa chako kiko tayari kwa templeti unayotaka kuweka:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ikiwa ukaguzi wowote muhimu umetokewa, rekebisha kwanza kisha endelea na kuanza kwa haraka.

### Hatua 1: Sakinisha AZD (Dakika 2)

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

### Hatua 2: Thibitisha kwa ajili ya AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Ikiwa huna uhakika unahitaji ipi, fuata mchakato kamili wa usanidi katika [Usanidi & Kuwasha](docs/chapter-01-foundation/installation.md#authentication-setup).

### Hatua 3: Weka Programu Yako ya Kwanza

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Hiyo ni yote!** Programu yako sasa iko mtandaoni kwenye Azure.

### Safisha (Usisahau!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Jinsi ya Kutumia Kozi Hii

Kozi hii imeundwa kwa ajili ya **kujifunza kwa hatua kadhaa** - anza pale unapohisi unaeleweka na jifunze taratibu:

| Uzoefu Wako | Anza Hapa |
|-----------------|------------|
| **Mpya kabisa kwa Azure** | [Sura ya 1: Msingi](#-chapter-1-foundation--quick-start) |
| **Unajua Azure, Mpya kwa AZD** | [Sura ya 1: Msingi](#-chapter-1-foundation--quick-start) |
| **Unataka kuweka programu za AI** | [Sura ya 2: Maendeleo ya AI-Kwanza](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Unataka mazoezi ya vitendo** | [🎓 Warsha ya Kuingiliana](workshop/README.md) - maabara ya muda wa saa 3-4 inayotolewa kidogo |
| **Unahitaji mifumo ya uzalishaji** | [Sura ya 8: Uzalishaji & Biashara](#-chapter-8-production--enterprise-patterns) |

### Usanidi wa Haraka

1. **Fagia Hifadhi Hii**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Nakili**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Pata Msaada**: [Jamii ya Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Unapendelea Kunakili Kwenye Kompyuta Yako?**

> Hifadhi hii ina tafsiri za lugha 50+ ambazo huongeza ukubwa wa kupakua kwa kiasi kikubwa. Ili kunakili bila tafsiri, tumia sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Hii inakupa kila unachohitaji kukamilisha kozi kwa upakuaji wa kasi zaidi.


## Muhtasari wa Kozi

Jifunze Azure Developer CLI (azd) kupitia sura zilizopangwa kwa ajili ya kujifunza hatua kwa hatua. **Kipaumbele maalum kwa usambazaji wa programu za AI kwa muunganiko wa Microsoft Foundry.**

### Kwa nini Kozi Hii ni Muhimu kwa Waendelezaji Wapya

Kulingana na maoni ya jamii ya Microsoft Foundry Discord, **45% ya waendelezaji wanataka kutumia AZD kwa mzigo wa AI** lakini wanakutana na changamoto za:
- Miundombinu tata ya zaidi ya huduma moja ya AI
- Vigezo bora vya usambazaji wa AI uzalishaji  
- Muunganisho wa huduma za AI wa Azure na usanidi
- Kuboresha gharama kwa mzigo wa AI
- Kukabiliana na matatizo maalum ya usambazaji ya AI

### Malengo ya Kujifunza

Kwa kukamilisha kozi hii iliyopangwa, utakuwa:
- **Mtaalamu wa Misingi ya AZD**: Misingi, usakinishaji, na usanidi
- **Muweka Programu za AI**: Tumia AZD na huduma za Microsoft Foundry
- **Tekeleza Miundombinu kama Msimbo**: Simamia rasilimali za Azure kwa kutumia templeti za Bicep  
- **Tatua Matatizo ya Uwekaji**: Rekebisha matatizo ya kawaida na tambua kasoro  
- **Boresha kwa Uzalishaji**: Usalama, upanuzi, ufuatiliaji, na usimamizi wa gharama  
- **Jenga Suluhisho za Wakala Wengi**: Tengeneza usanifu tata wa AI  

## Kabla ya Kuanzia: Akaunti, Ufikiaji, na Dharura  

Kabla hujaanza Sura ya 1, hakikisha una mambo yafuatayo tayari. Hatua za usakinishaji baadaye katika mwongozo huu zinadhania kwamba haya mambo ya msingi yameshafanyika.  

- **Usajili wa Azure**: Unaweza kutumia usajili uliopo kutoka kazini au akaunti yako mwenyewe, au tengeneza [jaribio la bure](https://aka.ms/azurefreetrial) kuanza.  
- **Ruhusa ya kuunda rasilimali za Azure**: Kwa mazoezi mengi, unapaswa kuwa na angalau ruhusa ya **Mchangiaji** kwenye usajili au kikundi cha rasilimali kinacholengwa. Baadhi ya sura pia zinaweza kudhani kwamba unaweza kuunda makundi ya rasilimali, vitambulisho vilivyoendeshwa, na uteuzi wa RBAC.  
- [**Akaunti ya GitHub**](https://github.com): Hii ni muhimu kwa kunakili hifadhi, kufuatilia mabadiliko yako mwenyewe, na kutumia GitHub Codespaces kwa warsha.  
- **Mahitaji ya wakati wa templeti**: Baadhi ya templeti zinahitaji zana za eneo kama Node.js, Python, Java, au Docker. Endesha kinyang'anyiro cha usanidi kabla ya kuanza ili ugundue zana zinazokosekana mapema.  
- **Ujuzi wa msingi wa terminal**: Huhitaji kuwa mtaalamu, lakini unapaswa kuwa na uhakika wa kuendesha amri kama `git clone`, `azd auth login`, na `azd up`.  

> **Unafanya kazi kwa usajili wa kampuni?**  
> Ikiwa mazingira yako ya Azure yanadhibitiwa na msimamizi, thibitisha mapema kwamba unaweza kuweka rasilimali katika usajili au kikundi cha rasilimali unachopanga kutumia. Ikiwa sivyo, omba usajili wa eneo la majaribio (sandbox) au ruhusa ya Mchangiaji kabla ya kuanza.  

> **Mpya katika Azure?**  
> Anza na jaribio lako la bure la Azure au usajili wa pay-as-you-go kwenye https://aka.ms/azurefreetrial ili uweze kumaliza mazoezi yote bila kusubiri idhini za ngazi ya mpangaji.  

## 🗺️ Ramani ya Kozi: Urambazaji wa Haraka kwa Kura  

Kila sura ina README ya kujitolea yenye malengo ya kujifunza, kuanza kwa haraka, na mazoezi:  

| Sura | Mada | Mafunzo | Muda | Ugumu |  
|---------|-------|---------|----------|------------|  
| **[Sura 1: Msingi](docs/chapter-01-foundation/README.md)** | Kuanzia | [Misingi ya AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Usakinishaji](docs/chapter-01-foundation/installation.md) &#124; [Mradi wa Kwanza](docs/chapter-01-foundation/first-project.md) | Dakika 30-45 | ⭐ |  
| **[Sura 2: Maendeleo ya AI](docs/chapter-02-ai-development/README.md)** | Programu za AI-Kwanza | [Muunganiko wa Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Wakala wa AI](docs/chapter-02-ai-development/agents.md) &#124; [Uwekaji wa Mfano](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Warsha](docs/chapter-02-ai-development/ai-workshop-lab.md) | Saa 1-2 | ⭐⭐ |  
| **[Sura 3: Usanidi](docs/chapter-03-configuration/README.md)** | Uthibitisho & Usalama | [Usanidi](docs/chapter-03-configuration/configuration.md) &#124; [Uthibitisho & Usalama](docs/chapter-03-configuration/authsecurity.md) | Dakika 45-60 | ⭐⭐ |  
| **[Sura 4: Miundombinu](docs/chapter-04-infrastructure/README.md)** | IaC & Uwekaji | [Mwongozo wa Uwekaji](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Utoaji](docs/chapter-04-infrastructure/provisioning.md) | Saa 1-1.5 | ⭐⭐⭐ |  
| **[Sura 5: Wakala Wengi](docs/chapter-05-multi-agent/README.md)** | Suluhisho za Wakala wa AI | [Hali ya Rejareja](examples/retail-scenario.md) &#124; [Mifumo ya Uratibu](docs/chapter-06-pre-deployment/coordination-patterns.md) | Saa 2-3 | ⭐⭐⭐⭐ |  
| **[Sura 6: Kabla ya Uwekaji](docs/chapter-06-pre-deployment/README.md)** | Mipango & Uhakiki | [Ukaguzi wa Kabla ya Kuondoka](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Mipango ya Uwezo](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Uteuzi wa SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | Saa 1 | ⭐⭐ |  
| **[Sura 7: Utatuzi wa Matatizo](docs/chapter-07-troubleshooting/README.md)** | Tambua & Rekebisha | [Matatizo ya Kawaida](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Utambuzi wa Kasoro](docs/chapter-07-troubleshooting/debugging.md) &#124; [Matatizo ya AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | Saa 1-1.5 | ⭐⭐ |  
| **[Sura 8: Uzalishaji](docs/chapter-08-production/README.md)** | Mifumo ya Kampuni | [Mifumo ya Uzalishaji](docs/chapter-08-production/production-ai-practices.md) | Saa 2-3 | ⭐⭐⭐⭐ |  
| **[🎓 Warsha](workshop/README.md)** | Maabara ya Mikono | [Utangulizi](workshop/docs/instructions/0-Introduction.md) &#124; [Uteuzi](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Uhakiki](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Uchambuzi](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Usanidi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Ubinafsishaji](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Kumaliza](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Hitimisho](workshop/docs/instructions/7-Wrap-up.md) | Saa 3-4 | ⭐⭐ |  

**Jumla ya Muda wa Kozi:** ~Saa 10-14 | **Maendeleo ya Ujuzi:** Mwanzo → Tayari kwa Uzalishaji  

---  

## 📚 Sura za Kujifunza  

*Chagua njia yako ya kujifunza kulingana na kiwango cha uzoefu na malengo*  

### 🚀 Sura 1: Msingi & Kuanzia Haraka  
**Mahitaji**: Usajili wa Azure, ujuzi wa amri za msingi  
**Muda**: Dakika 30-45  
**Ugumu**: ⭐  

#### Kile Utakachojifunza  
- Kuelewa misingi ya Azure Developer CLI  
- Kusakinisha AZD kwenye jukwaa lako  
- Uwekaji wako wa kwanza wenye mafanikio  

#### Vyanzo vya Kujifunza  
- **🎯 Anza Hapa**: [Azure Developer CLI ni Nini?](#what-is-azure-developer-cli)  
- **📖 Nadharia**: [Misingi ya AZD](docs/chapter-01-foundation/azd-basics.md) - Dhana kuu na istilahi  
- **⚙️ Usanidi**: [Usakinishaji & Usanidi](docs/chapter-01-foundation/installation.md) - Mwongozo maalum wa jukwaa  
- **🛠️ Mikono-Kazini**: [Mradi Wako wa Kwanza](docs/chapter-01-foundation/first-project.md) - Mafunzo kwa hatua kwa hatua  
- **📋 Marejeleo ya Haraka**: [Karata ya Amri](resources/cheat-sheet.md)  

#### Mazoezi ya Vitendo  
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 Matokeo ya Sura**: Weka kwa mafanikio programu rahisi ya wavuti kwenye Azure kwa kutumia AZD  

**✅ Uthibitisho wa Mafanikio:**  
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```
  
**📊 Muda uliotumika:** Dakika 30-45  
**📈 Kiwango cha Ujuzi Baada Ya Hii:** Unaweza kuweka programu za msingi pekee  
**📈 Kiwango cha Ujuzi Baada Ya Hii:** Unaweza kuweka programu za msingi pekee  

---  

### 🤖 Sura 2: Maendeleo ya AI-Kwanza (Inapendekezwa kwa Waundaji wa AI)  
**Mahitaji**: Sura 1 imemalizika  
**Muda**: Saa 1-2  
**Ugumu**: ⭐⭐  

#### Kile Utakachojifunza  
- Muunganiko wa Microsoft Foundry na AZD  
- Kuweka programu zenye nguvu ya AI  
- Kuelewa usanifu wa huduma za AI  

#### Vyanzo vya Kujifunza  
- **🎯 Anza Hapa**: [Muunganiko wa Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 Wakala wa AI**: [Mwongozo wa Wakala wa AI](docs/chapter-02-ai-development/agents.md) - Weka wakala wenye akili kwa AZD  
- **📖 Mifumo**: [Uwekaji wa Mfano wa AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Weka na simamia mifano ya AI  
- **🛠️ Warsha**: [Laboratori ya Warsha ya AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tengeneza suluhisho za AI zinazokaribiana na AZD  
- **🎥 Mwongozo wa Kuingiliana**: [Vifaa vya Warsha](workshop/README.md) - Kujifunza kwa kivinjari na MkDocs * Mazingira ya DevContainer  
- **📋 Templeti**: [Templeti za Microsoft Foundry](#featured-microsoft-foundry-templates)  
- **📝 Mifano**: [Mifano ya Uwekaji wa AZD](examples/README.md)  

#### Mazoezi ya Vitendo  
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 Matokeo ya Sura**: Weka na sanidi programu ya mazungumzo yenye nguvu ya AI yenye uwezo wa RAG  

**✅ Uthibitisho wa Mafanikio:**  
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```
  
**📊 Muda uliotumika:** Saa 1-2  
**📈 Kiwango cha Ujuzi Baada Ya Hii:** Unaweza kuweka na kusanidi programu za AI tayari kwa uzalishaji  
**💰 Ufahamu wa Gharama:** Elewa gharama za maendeleo $80-150/mwezi, gharama za uzalishaji $300-3500/mwezi  

#### 💰 Vizingiti vya Gharama kwa Uwekaji AI  

**Mazingira ya Maendeleo (Makadirio $80-150/mwezi):**  
- Mifano ya Microsoft Foundry (Lipa-kama-unatumia): $0-50/mwezi (kutegemea matumizi ya tokeni)  
- Utafutaji wa AI (Kiwango cha msingi): $75/mwezi  
- Programu za Kontena (Matumizi): $0-20/mwezi  
- Hifadhi (Kawaida): $1-5/mwezi  

**Mazingira ya Uzalishaji (Makadirio $300-3,500+/mwezi):**  
- Mifano ya Microsoft Foundry (PTU kwa utendaji thabiti): $3,000+/mwezi AU Lipa-kama-unatumia kwa kiasi kikubwa  
- Utafutaji wa AI (Kiwango cha kawaida): $250/mwezi  
- Programu za Kontena (Maandamizi): $50-100/mwezi  
- Mwangaza wa Programu: $5-50/mwezi  
- Hifadhi (Premium): $10-50/mwezi  

**💡 Vidokezo vya Kuboresha Gharama:**  
- Tumia **Kiwango cha Bure** cha Mifano ya Microsoft Foundry kwa kujifunza (Azure OpenAI inajumuisha tokeni 50,000/mwezi)  
- Endesha `azd down` kutenganisha rasilimali wakati hauendelei kwa makini  
- Anza kwa bili ya matumizi, boresha hadi PTU tu kwa uzalishaji  
- Tumia `azd provision --preview` kubaini gharama kabla ya kuweka  
- Wezesha upanuzi wa kiotomatiki: lipa tu kwa matumizi halisi  

**Ufuatiliaji wa Gharama:**  
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```
  
---  

### ⚙️ Sura 3: Usanidi & Uthibitisho  
**Mahitaji**: Sura 1 imemalizika  
**Muda**: Dakika 45-60  
**Ugumu**: ⭐⭐  

#### Kile Utakachojifunza  
- Usanidi na usimamizi wa mazingira  
- Mbinu bora za uthibitisho na usalama  
- Kuweka majina ya rasilimali na upangaji  

#### Vyanzo vya Kujifunza  
- **📖 Usanidi**: [Mwongozo wa Usanidi](docs/chapter-03-configuration/configuration.md) - Kuweka mazingira  
- **🔐 Usalama**: [Mifumo ya uthibitisho na kitambulisho kilichosimamiwa](docs/chapter-03-configuration/authsecurity.md) - Mifumo ya uthibitisho  
- **📝 Mifano**: [Mfano wa Programu ya Hifadhidata](examples/database-app/README.md) - Mifano ya Hifadhidata ya AZD  

#### Mazoezi ya Vitendo  
- Sanidi mazingira mengi (dev, staging, prod)  
- Weka uthibitisho wa kitambulisho kilichosimamiwa  
- Tekeleza usanidi maalum wa mazingira  

**💡 Matokeo ya Sura**: Simamia mazingira mengi kwa uthibitisho na usalama sahihi  

---  

### 🏗️ Sura 4: Miundombinu kama Msimbo & Uwekaji  
**Mahitaji**: Sura 1-3 zimekamilika  
**Muda**: Saa 1-1.5  
**Ugumu**: ⭐⭐⭐  

#### Kile Utakachojifunza  
- Mifumo ya juu ya uwekaji  
- Miundombinu kama Msimbo kwa kutumia Bicep  
- Mikakati ya utoaji wa rasilimali  

#### Vyanzo vya Kujifunza  
- **📖 Uwekaji**: [Mwongozo wa Uwekaji](docs/chapter-04-infrastructure/deployment-guide.md) - Masuala kamili  
- **🏗️ Utoaji**: [Utoaji wa Rasilimali](docs/chapter-04-infrastructure/provisioning.md) - Usimamizi wa rasilimali za Azure  
- **📝 Mifano**: [Mfano wa Programu ya Kontena](../../examples/container-app) - Uwekaji wa kontena  

#### Mazoezi ya Vitendo  
- Tengeneza templeti za Bicep za kibinafsi  
- Weka programu zenye huduma nyingi  
- Tekeleza mikakati ya uwekaji wa blue-green  

**💡 Matokeo ya Sura**: Weka programu tata zenye huduma nyingi kwa kutumia templeti binafsi za miundombinu  

---  

### 🎯 Sura 5: Suluhisho za AI za Wakala Wengi (Juu)  
**Mahitaji**: Sura 1-2 zimekamilika  
**Muda**: Saa 2-3  
**Ugumu**: ⭐⭐⭐⭐  

#### Kile Utakachojifunza  
- Mifumo ya usanifu wa wakala wengi  
- Uratibu na usimamizi wa wakala  
- Uwekaji wa AI tayari kwa uzalishaji  

#### Vyanzo vya Kujifunza  
- **🤖 Mradi Ulioangaziwa**: [Suluhisho la Wakala Wengi la Rejareja](examples/retail-scenario.md) - Utekelezaji kamili  
- **🛠️ ARM Templates**: [Pakiti ya ARM Template](../../examples/retail-multiagent-arm-template) - Uwekaji kwa bonyeza moja  
- **📖 Usanifu**: [Mifumo ya uratibu wa wakala wengi](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mifumo  

#### Mazoezi ya Vitendo  
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Matokeo ya Sura**: Weka na simamia suluhisho la AI la wakala wengi tayari kwa uzalishaji lenye wakala wa Mteja na hesabu  

---  

### 🔍 Sura 6: Uhakiki na Mipango Kabla ya Uwekaji  
**Mahitaji**: Sura 4 imemalizika  
**Muda**: Saa 1  
**Ugumu**: ⭐⭐  

#### Kile Utakachojifunza  
- Mipango ya uwezo na uhakikishaji wa rasilimali  
- Mikakati ya uteuzi wa SKU  
- Ukaguzi wa kabla ya ndege (pre-flight) na kiotomatiki  

#### Vyanzo vya Kujifunza  
- **📊 Kupanga**: [Kupanga Uwezo](docs/chapter-06-pre-deployment/capacity-planning.md) - Ukaguzi wa rasilimali
- **💰 Uchaguzi**: [Uchaguzi wa SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Chaguzi za gharama nafuu
- **✅ Uhakiki**: [Ukaguzi wa Kabla ya Kuendesha](docs/chapter-06-pre-deployment/preflight-checks.md) - Skiripti za kiotomatiki

#### Mazoezi ya Kivitendo
- Endesha skiripti za uhakiki wa uwezo
- Boresha uchaguzi wa SKU kwa gharama
- Tekeleza ukaguzi wa kabla ya uenezaji kwa kiotomatiki

**💡 Matokeo ya Sura**: Hakiki na boresha uenezaji kabla ya utekelezaji

---

### 🚨 Sura 7: Kutatua Matatizo & Kurekebisha Makosa
**Mahitaji**: Sura yoyote ya uenezaji imekamilika  
**Muda**: Saa 1-1.5  
**Ngumu**: ⭐⭐

#### Utakachojifunza
- Mbinu za kimfumo za kurekebisha makosa
- Matatizo na suluhisho ya kawaida
- Kutatua matatizo maalum ya AI

#### Vyanzo vya Kujifunza
- **🔧 Matatizo ya Kawaida**: [Matatizo ya Kawaida](docs/chapter-07-troubleshooting/common-issues.md) - Maswali yanayoulizwa mara kwa mara na suluhisho
- **🕵️ Kurekebisha Makosa**: [Mwongozo wa Kurekebisha](docs/chapter-07-troubleshooting/debugging.md) - Mikakati hatua kwa hatua
- **🤖 Matatizo ya AI**: [Kutatua Matatizo maalum ya AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Matatizo ya huduma za AI

#### Mazoezi ya Kivitendo
- Tambua sababu za kushindwa kwa uenezaji
- Rekebisha matatizo ya uthibitishaji
- Rekebisha muunganisho wa huduma za AI

**💡 Matokeo ya Sura**: Tambua na urekebishe matatizo ya kawaida ya uenezaji peke yako

---

### 🏢 Sura 8: Mifumo ya Uzalishaji & Kampuni
**Mahitaji**: Sura 1-4 zimekamilika  
**Muda**: Saa 2-3  
**Ngumu**: ⭐⭐⭐⭐

#### Utakachojifunza
- Mikakati ya uenezaji wa uzalishaji
- Mifumo ya usalama wa kampuni
- Ufuatiliaji na uboreshaji wa gharama

#### Vyanzo vya Kujifunza
- **🏭 Uzalishaji**: [Mbinu Bora za AI za Uzalishaji](docs/chapter-08-production/production-ai-practices.md) - Mifumo ya kampuni
- **📝 Mifano**: [Mfano wa Microservices](../../examples/microservices) - Miundo tata
- **📊 Ufuatiliaji**: [Uhusiano wa Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Ufuatiliaji

#### Mazoezi ya Kivitendo
- Tekeleza mifumo ya usalama wa kampuni
- Weka ufuatiliaji kamili
- Tengeneza uenezaji wa uzalishaji na udhibiti sahihi

**💡 Matokeo ya Sura**: Tengeneza programu zinazostahili kampuni zenye uwezo kamili wa uzalishaji

---

## 🎓 Muhtasari wa Warsha: Uzoefu wa Kujifunza wa Kivitendo

> **⚠️ HALI YA WARSHI: Maendeleo Hai**  
> Vifaa vya warsha vinaendelea kutengenezwa na kuboreshwa. Moduli kuu zinafanya kazi, lakini baadhi ya sehemu za juu hazijakamilika. Tunaendelea kufanya kazi kukamilisha maudhui yote. [Fuata maendeleo →](workshop/README.md)

### Vifaa vya Warsha vya Kiingiliano
**Mafunzo kamili ya vitendo kwa kutumia zana za kivinjari na mazoezi ya kuelekezwa**

Vifaa vyetu vya warsha vinatoa uzoefu wa kujifunza uliopangwa na mwingiliano unaoendana na mitaala ya sura zilizotajwa hapo juu. Warsha imeundwa kwa ajili ya kujifunza peke yako na pia kipindi za kikundi kinachoongozwa na mwalimu.

#### 🛠️ Sifa za Warsha
- **Kiolesura cha Kivinjari**: Warsha kamili iliyotegemea MkDocs yenye utafutaji, kunakili, na vipengele vya mandhari
- **Muunganisho wa GitHub Codespaces**: Usanidi wa mazingira ya maendeleo kwa bonyeza moja
- **Njia ya Kujifunza Iliyopangwa**: Mazoezi ya moduli 8 (masaa 3-4 jumla)
- **Mbinu ya Kukuza Mkakati**: Utangulizi → Uchaguzi → Uhakiki → Uvunjaji → Mpangilio → Ubinafsishaji → Ufutaji → Hitimisho
- **Mazingira ya Kukuza ya DevContainer**: Zana na vianzishi vilivyopangwa mapema

#### 📚 Muundo wa Moduli za Warsha
Warsha inafuata **mbinu ya hatua 8 iliyoendelea** inayokupeleka kutoka ugunduzi hadi utaalamu wa uenezaji:

| Moduli | Mada | Utakachofanya | Muda |
|--------|-------|----------------|----------|
| **0. Utangulizi** | Muhtasari wa Warsha | Elewa malengo ya kujifunza, mahitaji, na muundo wa warsha | Dak 15 |
| **1. Uchaguzi** | Ugunduzi wa Kiolezo | Chunguza violezo vya AZD na chagua kiolezo sahihi cha AI kwa hali yako | Dak 20 |
| **2. Uhakiki** | Tengeneza & Hakiki | Tengeneza kiolezo na `azd up` na hakiki miundombinu inavyofanya kazi | Dak 30 |
| **3. Uvunjaji** | Elewa Muundo | Tumia GitHub Copilot kuchunguza usanifu wa kiolezo, faili za Bicep, na upangaji wa msimbo | Dak 30 |
| **4. Mpangilio** | Azure.yaml Chungu Nzito | Jifunze mpangilio wa `azure.yaml`, vishikizo vya maisha ya mzunguko, na vigezo vya mazingira | Dak 30 |
| **5. Ubinafsishaji** | Ifanye Kuwa Yako | Washa AI Search, ufuatiliaji, tathmini, na ubinafsishe kwa hali yako | Dak 45 |
| **6. Ufutaji** | Safisha | Ondoa rasilimali kwa usalama kwa kutumia `azd down --purge` | Dak 15 |
| **7. Hitimisho** | Hatua Zifuatazo | Kagua mafanikio, dhana muhimu, na endelea safari yako ya kujifunza | Dak 15 |

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
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Matokeo ya Kujifunza Warsha
Kwa kukamilisha warsha, washiriki wataweza:
- **Tengeneza Programu za AI za Uzalishaji**: Tumia AZD na huduma za Microsoft Foundry
- **Tumia Miundo ya Mawakala Wengi**: Tekeleza suluhisho za wakala wa AI walioko kwa ushirikiano
- **Tekeleza Mbinu Bora za Usalama**: Panga uthibitishaji na udhibiti wa upatikanaji
- **Boresha kwa Kiwango Kikubwa**: Tazama miundo ya gharama nafuu na yenye utendaji
- **Tatua Matatizo ya Uenezaji**: Rekebisha matatizo ya kawaida peke yako

#### 📖 Vyanzo vya Warsha
- **🎥 Mwongozo wa Kueleweka**: [Vifaa vya Warsha](workshop/README.md) - Mazingira ya kujifunza kupitia kivinjari
- **📋 Maelekezo kwa Moduli**:
  - [0. Utangulizi](workshop/docs/instructions/0-Introduction.md) - Muhtasari wa warsha na malengo
  - [1. Uchaguzi](workshop/docs/instructions/1-Select-AI-Template.md) - Pata na chagua violezo vya AI
  - [2. Uhakiki](workshop/docs/instructions/2-Validate-AI-Template.md) - Tengeneza na hakiki violezo
  - [3. Uvunjaji](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Chunguza usanifu wa kiolezo
  - [4. Mpangilio](workshop/docs/instructions/4-Configure-AI-Template.md) - Jifunze azure.yaml
  - [5. Ubinafsishaji](workshop/docs/instructions/5-Customize-AI-Template.md) - Boresha kwa hali yako
  - [6. Ufutaji](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Safisha rasilimali
  - [7. Hitimisho](workshop/docs/instructions/7-Wrap-up.md) - Kagua na hatua zinazofuata
- **🛠️ Maabara ya Warsha ya AI**: [Maabara ya Warsha ya AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Mazoezi yanayolenga AI
- **💡 Anza Haraka**: [Mwongozo wa Usanidi wa Warsha](workshop/README.md#quick-start) - Mpangilio wa mazingira

**Inafaa kwa**: Mafunzo ya kampuni, kozi za vyuo vikuu, kujifunza kwa muda wako, na mafunzo ya waendelezaji.

---

## 📖 Kina: Uwezo wa AZD

Zaidi ya misingi, AZD hutoa sifa zenye nguvu kwa uenezaji wa uzalishaji:

- **Uenezaji unaotegemea Kiolezo** - Tumia violezo vilivyotengenezwa awali kwa mifumo ya kawaida ya programu
- **Miundombinu kama Msimbo** - Simamia rasilimali za Azure kwa kutumia Bicep au Terraform  
- **Mtiririko uliojumuishwa** - Tengeneza, enezaji, na fuatilia programu kwa urahisi
- **Rahisi kwa Mendelezaji** - Imerekebishwa kwa ufanisi na uzoefu wa mendelezaji

### **AZD + Microsoft Foundry: Sawa Kwa Uenezaji wa AI**

**Kwa nini AZD kwa Suluhisho za AI?** AZD inaangazia changamoto kuu zinazokabiliwa na waendelezaji wa AI:

- **Violezo Tayari kwa AI** - Violezo vilivyosanidiwa awali kwa Microsoft Foundry Models, Azure AI Services, na mzigo wa ML
- **Uenezaji wa AI Salama** - Mifumo ya usalama iliyoingia kwa huduma za AI, funguo za API, na viambatisho vya mfano  
- **Mifumo ya AI za Uzalishaji** - Mbinu bora za uenezaji wa programu za AI zinazoweza kupanuka kwa gharama nafuu
- **Mtiririko wa AI Kuanzia Mwisho-Mwisho** - Kutoka maendeleo ya mfano hadi uenezaji wa uzalishaji na ufuatiliaji sahihi
- **Uboreshaji wa Gharama** - Mikakati smart ya kugawa rasilimali na kupanua mzigo wa AI
- **Muunganisho wa Microsoft Foundry** - Muunganisho mzuri wa orodha ya mfano ya Microsoft Foundry na viambatisho

---

## 🎯 Maktaba ya Violezo & Mifano

### Inayojulikana: Violezo vya Microsoft Foundry
**Anza hapa ikiwa unaeneza programu za AI!**

> **Kumbuka:** Violezo hivi vinaonyesha mifumo mbalimbali ya AI. Baadhi ni Sampuli za Azure za nje, zingine ni utekelezaji wa ndani.

| Kiolezo | Sura | Ngumu | Huduma | Aina |
|----------|---------|------------|----------|------|
| [**Anza na mazungumzo ya AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Sura ya 2 | ⭐⭐ | AzureOpenAI + API ya Ufafanuzi wa Mfano wa Azure AI + Azure AI Search + Azure Container Apps + Application Insights | Nje |
| [**Anza na mawakala wa AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Sura ya 2 | ⭐⭐ | Wakala wa Foundry + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Nje |
| [**Demo ya Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Sura ya 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Hifadhi | Nje |
| [**Anza Haraka ya OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Sura ya 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Nje |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Sura ya 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Nje |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Sura ya 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Nje |
| [**Suluhisho la Mawakala Wengi la Rejareja**](examples/retail-scenario.md) | Sura ya 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Hifadhi + Container Apps + Cosmos DB | **Ndani** |

### Inayojulikana: Hali Kamili za Kujifunza
**Violezo vya programu zinazostahili uzalishaji vilivyopangwa kwa sura za kujifunza**

| Kiolezo | Sura ya Kujifunza | Ngumu | Kujifunza Muhimu |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Sura ya 2 | ⭐ | Mifumo ya msingi ya uenezaji wa AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Sura ya 2 | ⭐⭐ | Utekelezaji wa RAG kwa Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Sura ya 4 | ⭐⭐ | Uhusiano wa Akili ya Nyaraka |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Sura ya 5 | ⭐⭐⭐ | Mfumo wa wakala na mitambo ya simu |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Sura ya 8 | ⭐⭐⭐ | Uandikaji wa AI kwa kampuni |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Sura ya 5 | ⭐⭐⭐⭐ | Muundo wa mawakala wengi na mawakala wa Mteja na Akiba |

### Kujifunza Kwa Aina ya Mfano

> **📌 Mifano ya Ndani dhidi ya Nje:**  
> **Mifano ya Ndani** (katika hii repo) = Tayari kutumika mara moja  
> **Mifano ya Nje** (Sampuli za Azure) = Nakili kutoka kwa repositori zilizoambatanishwa

#### Mifano ya Ndani (Tayari Kutumika)
- [**Suluhisho la Mawakala Wengi la Rejareja**](examples/retail-scenario.md) - Utekelezaji kamili wa programu zinazostahili uzalishaji kwa kutumia violezo vya ARM
  - Muundo wa mawakala wengi (Mteja + Wakala wa Akiba)
  - Ufuatiliaji kamili na tathmini
  - Uenezaji kwa bonyeza moja kupitia kiolezo cha ARM

#### Mifano ya Ndani - Programu za Kontena (Sura 2-5)
**Mifano kamili ya uenezaji wa kontena katika hifadhi hii:**
- [**Mifano ya Programu za Kontena**](examples/container-app/README.md) - Mwongozo kamili wa uenezaji wa programu za kontena
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API ya msingi ya REST yenye upanuaji hadi sifuri
  - [Miundo ya Microservices](../../examples/container-app/microservices) - Uenezaji wa huduma nyingi unaostahili uzalishaji
  - Mifumo ya Kuanzisha Haraka, Uzalishaji, na Uenezaji wa Juu
  - Mwongozo wa ufuatiliaji, usalama, na uboreshaji wa gharama

#### Mifano ya Nje - Programu Rahisi (Sura 1-2)
**Nakili hizi hifadhi za Sampuli za Azure ili kuanza:**
- [Programu Rahisi ya Wavuti - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mifumo ya msingi ya uenezaji
- [Tovuti Tulivu - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Uenezaji wa maudhui tulivu
- [Programu ya Kontena - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Uenezaji wa API ya REST

#### Mifano ya Nje - Uhusiano wa Database (Sura 3-4)  
- [Programu ya Database - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mifumo ya muunganisho wa database
- [Kazi + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Mtiririko wa data usio na seva

#### Mifano ya Nje - Mifumo ya Juu (Sura 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Miundo ya huduma nyingi
- [Kazi za Programu za Kontena](https://github.com/Azure-Samples/container-apps-jobs) - Usindikaji wa nyuma  
- [Mlolongo wa ML ya Kampuni](https://github.com/Azure-Samples/mlops-v2) - Mifumo ya ML inayostahili uzalishaji

### Maktaba za Violezo vya Nje
- [**Maktaba Rasmi ya Violezo vya AZD**](https://azure.github.io/awesome-azd/) - Maktaba iliyoratibiwa ya violezo rasmi na za jamii
- [**Violezo vya Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Nyaraka za violezo za Microsoft Learn
- [**Kabrasha la Mifano**](examples/README.md) - Mifano ya kujifunza ya ndani na maelezo ya kina

---

## 📚 Vyanzo vya Kujifunza & Marejeleo

### Marejeleo ya Haraka
- [**Karatasi ya Amri**](resources/cheat-sheet.md) - Amri muhimu za azd zilizo pangiliwa kwa sura
- [**Kamusi**](resources/glossary.md) - Neno la Azure na azd  
- [**Maswali Yanayoulizwa Mara kwa Mara**](resources/faq.md) - Maswali ya kawaida yaliyopangwa kwa sura za kujifunza
- [**Mwongozo wa Kusoma**](resources/study-guide.md) - Mazoezi kamili ya mazoezi

### Warsha za Vitendo
- [**Maabara ya Warsha ya AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tengeneza suluhisho lako la AI liweze kutumika AZD (saa 2-3)
- [**Warsha Inayoshirikisha**](workshop/README.md) - Mazoezi ya moduli 8 yanayoongozwa na MkDocs na GitHub Codespaces
  - Inafuata: Utangulizi → Uchaguzi → Uthibitisho → Ugawaji → Usanidi → Ubinafsishaji → Kufunga → Muhtasari

### Rasilimali za Kujifunza za Nje
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Kituo cha Ubunifu wa Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kihesabu cha Bei cha Azure](https://azure.microsoft.com/pricing/calculator/)
- [Hali ya Azure](https://status.azure.com/)

### Ujuzi wa Wakala wa AI Kwa Mhariri Wako
- [**Ujuzi wa Microsoft Azure kwenye skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - Ujuzi 37 wa wakala wazi kwa AI ya Azure, Foundry, usambazaji, uchunguzi, uboreshaji wa gharama, na zaidi. Waweke kwenye GitHub Copilot, Cursor, Claude Code, au wakala wowote unaoungwa mkono:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Mwongozo wa Haraka wa Kutatua Matatizo

**Masuala ya kawaida yanayokumba wanaoanza na ufumbuzi wa papo hapo:**

<details>
<summary><strong>❌ "azd: amri haikuonekana"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "Hakuna usajili uliopatikana" au "Usajili haujafafanuliwa"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" au "Kiasi kimeshindikana"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" imeshindikana katikati ya mchakato</strong></summary>

```bash
# Option 1: Clean and retry
azd down --force --purge
azd up

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Uthibitishaji umeshindikana" au "Tokeni imeisha muda"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "Rasilimali tayari ipo" au migogoro ya majina</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Usambazaji wa kiolezo unachukua muda mrefu sana</strong></summary>

**Muda wa kusubiri wa kawaida:**
- Programu rahisi ya mtandao: dakika 5-10
- Programu yenye hifadhidata: dakika 10-15
- Maombi ya AI: dakika 15-25 (Utoaji wa OpenAI ni polepole)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Ruhusa imekataliwa" au "Imezuiwa"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ Haiwezi kupata URL ya programu iliyosambazwa</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Rasilimali Kamili za Kutatua Matatizo

- **Mwongozo wa Masuala ya Kawaida:** [Suluhisho Zaidi](docs/chapter-07-troubleshooting/common-issues.md)
- **Masuala Maalum ya AI:** [Kutatua Matatizo ya AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Mwongozo wa Kuchunguza Makosa:** [Kuchunguza Hatua kwa Hatua](docs/chapter-07-troubleshooting/debugging.md)
- **Pata Msaada:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kumaliza Kozi & Cheti

### Ufuatiliaji wa Maendeleo
Fuata maendeleo yako ya kujifunza kupitia kila sura:

- [ ] **Sura 1**: Msingi & Anza Haraka ✅
- [ ] **Sura 2**: Maendeleo ya AI-Kwanza ✅  
- [ ] **Sura 3**: Usanidi & Uthibitishaji ✅
- [ ] **Sura 4**: Miundombinu kama Msimbo & Usambazaji ✅
- [ ] **Sura 5**: Suluhisho za Wakala Wengi wa AI ✅
- [ ] **Sura 6**: Uthibitisho & Mipango Kabla ya Usambazaji ✅
- [ ] **Sura 7**: Kutatua Matatizo & Kuchunguza Makosa ✅
- [ ] **Sura 8**: Mifumo ya Uzalishaji & Biashara ✅

### Uthibitisho wa Kujifunza
Baada ya kumaliza kila sura, thibitisha maarifa yako kwa:
1. **Mazoezi ya Vitendo**: Maliza usambazaji wa vitendo wa sura
2. **Kukagua Maarifa**: Pitia sehemu ya FAQ ya sura yako
3. **Mjadala wa Jamii**: Shiriki uzoefu wako kwenye Azure Discord
4. **Sura Ifuatayo**: Hama kwa ngazi inayofuata ya ugumu

### Faida za Kumaliza Kozi
Baada ya kumaliza sura zote, utakuwa na:
- **Uzoefu wa Uzalishaji**: Programu halisi za AI zilizowekwa Azure
- **Ujuzi wa Kitaalamu**: Uwezo wa usambazaji wa biashara  
- **Kutambuliwa na Jamii**: Mwanachama hai wa jamii ya waendelezaji Azure
- **Kuendeleza Kazi**: Ujuzi unaohitajika wa AZD na usambazaji wa AI

---

## 🤝 Jamii & Msaada

### Pata Msaada & Msaada
- **Masuala ya Kiufundi**: [Ripoti matatizo na omba vipengele](https://github.com/microsoft/azd-for-beginners/issues)
- **Maswali ya Kujifunza**: [Jamii ya Microsoft Azure Discord](https://discord.gg/microsoft-azure) na [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Msaada Maalum wa AI**: Jiunge na [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Nyaraka**: [Nyaraka Rasmi za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Maarifa ya Jamii kutoka Microsoft Foundry Discord

**Matokeo ya Dodoso la Hivi Punde kutoka #Azure Channel:**
- **45%** ya waendelezaji wanataka kutumia AZD kwa kazi za AI
- **Changamoto kuu**: Usambazaji wa huduma nyingi, usimamizi wa leseni, kuandaliwa kwa uzalishaji  
- **Yaliyotakiwa zaidi**: Violezo maalum vya AI, mwongozo wa kutatua matatizo, mbinu bora

**Jiunge na jamii yetu ili:**
- Shiriki uzoefu wako wa AZD + AI na pata msaada
- Pata maonyesho ya awali ya violezo vipya vya AI
- Changia mbinu bora za usambazaji wa AI
- Shiriki maendeleo ya vipengele vya AI + AZD baadaye

### Kuchangia katika Kozi
Tunakaribisha michango! Tafadhali soma [Mwongozo wa Michango](CONTRIBUTING.md) kwa maelezo kuhusu:
- **Kuboresha Maudhui**: Boresha sura na mifano iliyopo
- **Mifano Mpya**: Ongeza visa halisi na violezo  
- **Tafsiri**: Saidia kudumisha msaada wa lugha nyingi
- **Ripoti za Hitilafu**: Boresha usahihi na uwazi
- **Vigezo vya Jamii**: Fuata miongozo yetu ya jamii jumuishi

---

## 📄 Taarifa za Kozi

### Leseni
Mradi huu umepewa leseni chini ya Leseni ya MIT - angalia faili la [LICENSE](../../LICENSE) kwa maelezo.

### Rasilimali Zaidi za Kujifunza za Microsoft

Timu yetu hutengeneza kozi nyingine kamili za kujifunza:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j kwa Wananchi Waanzilishi](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js kwa Wananchi Waanzilishi](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain kwa Wananchi Waanzilishi](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Wakala
[![AZD kwa Wananchi Waanzilishi](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI kwa Wananchi Waanzilishi](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP kwa Wananchi Waanzilishi](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Wakala wa AI kwa Wananchi Waanzilishi](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Mfululizo wa AI ya Kizazi
[![AI ya Kizazi kwa Wananchi Waanzilishi](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI ya Kizazi (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI ya Kizazi (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![AI ya Kizazi (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kujifunza Msingi
[![ML kwa Wananchi Waanzilishi](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Sayansi ya Data kwa Wananchi Waanzilishi](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI kwa Wananchi Waanzilishi](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Usalama wa Mtandao kwa Wananchi Waanzilishi](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Uendelezaji wa Mtandao kwa Wananchi Waanzilishi](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT kwa Wananchi Waanzilishi](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Uendelezaji wa XR kwa Wananchi Waanzilishi](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Mfululizo wa Copilot
[![Copilot kwa Uandikishaji wa Pamoja wa AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot kwa C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Urambazaji wa Kozi

**🚀 Tayari kuanza kujifunza?**

**Waanzilishi**: Anza na [Sura 1: Msingi & Anza Haraka](#-chapter-1-foundation--quick-start)  
**Waendelezaji wa AI**: Ruka hadi [Sura 2: Maendeleo ya AI-Kwanza](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Waendelezaji Wenye Uzoefu**: Anza na [Sura 3: Usanidi & Uthibitishaji](#️-chapter-3-configuration--authentication)

**Hatua Ifuatayo**: [Anza Sura 1 - Msingi wa AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->