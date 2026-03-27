# AZD Kwa Waanzilishi: Safari ya Kujifunza Iliyopangwa

![AZD kwa Waanzilishi](../../translated_images/sw/azdbeginners.5527441dd9f74068.webp) 

[![Watazamaji wa GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forks za GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Nyota za GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord ya Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord ya Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Tafsiri Zinazofanywa Kiotomatiki (Zinasasishwa Daima)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](./README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Unapendelea Kufanya clone Kwenye Kompyuta Yako?**
>
> Hifadhi hii inajumuisha tafsiri za lugha 50+ ambazo zinaongeza sana ukubwa wa kupakua. Ili kufanya clone bila tafsiri, tumia sparse checkout:
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
> Hii inakupa kila kitu unachohitaji kukamilisha kozi kwa upakuaji wa haraka zaidi.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Nini Kipya katika azd Leo

Azure Developer CLI imekua zaidi ya programu za wavuti za jadi na API. Leo, azd ni chombo kimoja kwa kupeleka programu yoyote Azure—ikiwa ni pamoja na programu zinazotumia AI na maajenti wenye akili.

Hapa ni maana yake kwako:

- **Maajenti ya AI sasa ni mizigo ya azd za daraja la kwanza.** Unaweza kuanzisha, kupeleka, na kusimamia miradi ya maajenti ya AI ukitumia mzunguko ule ule wa `azd init` → `azd up` unaofahamu.
- **Uunganishaji wa Microsoft Foundry** unaletesha uenezaji wa modeli, uhosti wa maajenti, na usanidi wa huduma za AI moja kwa moja katika mfumo wa templeti za azd.
- **Mzunguko wa msingi haujabadilika.** Iwapo unaweka programu ya todo, microservice, au suluhisho la AI lenye maajenti wengi, amri ni zile zile.

Kama umewahi kutumia azd hapo awali, msaada wa AI ni ugani wa asili—si chombo tofauti au njia ya juu. Ikiwa unaanza kutoka mwanzoni, utajifunza mzunguko mmoja unaofanya kazi kwa kila kitu.

---

## 🚀 Azure Developer CLI (azd) ni nini?

**Azure Developer CLI (azd)** ni chombo rahisi kwa watengenezaji kwenye mstari wa amri kinachofanya iwe rahisi kupeleka programu kwenda Azure. Badala ya kuunda na kuunganisha rasilimali nyingi za Azure kwa mkono, unaweza kupeleka programu nzima kwa amri moja.

### Uchawi wa `azd up`

```bash
# Amri hii moja hufanya kila kitu:
# ✅ Huunda rasilimali zote za Azure
# ✅ Huandaa mtandao na usalama
# ✅ Huunda msimbo wa programu yako
# ✅ Huinua kwenye Azure
# ✅ Hukupa URL inayofanya kazi
azd up
```

**Hivyo tu!** Hakuna kubonyeza kwenye Azure Portal, hakuna templeti tata za ARM za kujifunza kwanza, hakuna usanidi wa mkono - tu programu zinazofanya kazi kwenye Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Ni Tofauti Gani?

Hili ndilo swali linaloulizwa zaidi na wanaoanza. Hapa kuna jibu rahisi:

| Kipengele | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Madhumuni** | Dhibiti rasilimali za Azure mtu mmoja mmoja | Weka programu kamili |
| **Mtazamo** | Inalenga miundombinu | Inalenga programu |
| **Mfano** | `az webapp create --name myapp...` | `azd up` |
| **Muda wa Kujifunza** | Inahitaji kujua huduma za Azure | Tajua tu programu yako |
| **Bora Kwa** | DevOps, Miundombinu | Waendelezaji, Uundaji wa Mifano |

### Mfano Rahisi

- **Azure CLI** ni kama kuwa na zana zote za kujenga nyumba - nyundo, sega, naili. Unaweza kujenga chochote, lakini unahitaji kujua ujenzi.
- **Azure Developer CLI** ni kama kumchagua mkandarasi - unaelezea unachotaka, nao wanashughulikia ujenzi.

### Wakati wa Kutumia Kila Moja

| Muktadha | Tumia Hili |
|----------|----------|
| "Nataka kupeleka programu yangu ya wavuti haraka" | `azd up` |
| "Nahitaji kuunda tu akaunti ya uhifadhi" | `az storage account create` |
| "Ninaunda programu kamili ya AI" | `azd init --template azure-search-openai-demo` |
| "Nahitaji kutatua tatizo kwenye rasilimali maalum ya Azure" | `az resource show` |
| "Nataka uwasilishaji wa uzalishaji ndani ya dakika" | `azd up --environment production` |

### Zinatumika Pamoja!

AZD inatumia Azure CLI ndani yake. Unaweza kutumia zote mbili:
```bash
# Tengeneza programu yako na AZD
azd up

# Kisha boresha rasilimali maalum kwa kutumia Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Pata Violezo katika Awesome AZD

Usianze kutoka mwanzo! **Awesome AZD** ni mkusanyiko wa jamii wa templeti tayari-kuwekwa:

| Rasilimali | Maelezo |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Pitia violezo 200+ na uvipeleke kwa kubofya mara moja |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Changia kiolezo chako kwa jamii |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Nyenyeka nyota na chunguza chanzo |

### Violezo Maarufu vya AI kutoka Awesome AZD

```bash
# Mazungumzo ya RAG na Miundo ya Microsoft Foundry + Utafutaji wa AI
azd init --template azure-search-openai-demo

# Programu ya Haraka ya Mazungumzo ya AI
azd init --template openai-chat-app-quickstart

# Wakala wa AI na Wakala wa Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Anza kwa Hatua 3

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

### Hatua 3: Weka Programu Yako ya Kwanza

```bash
# Anzisha kutoka kwa kiolezo
azd init --template todo-nodejs-mongo

# Sambaza hadi Azure (inaumba kila kitu!)
azd up
```

**🎉 Hivyo tu!** Programu yako sasa iko mtandaoni kwenye Azure.

### Usafisha (Usisahau!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Jinsi ya Kutumia Kozi Hii

Kozi hii imeundwa kwa ajili ya **ujifunzaji wa hatua kwa hatua** - anza mahali unapojisikia vizuri na endelea hadi juu:

| Uzoefu Wako | Anza Hapa |
|-----------------|------------|
| **Mpya kabisa kwa Azure** | [Sura 1: Msingi](#-chapter-1-foundation--quick-start) |
| **Unajua Azure, mpya kwa AZD** | [Sura 1: Msingi](#-chapter-1-foundation--quick-start) |
| **Unataka kupeleka programu za AI** | [Sura 2: Maendeleo Yanayomwanzia AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Unataka mazoezi ya vitendo** | [🎓 Interactive Workshop](workshop/README.md) - maabara ya kuongozwa ya saa 3-4 |
| **Unahitaji mifano ya uzalishaji** | [Sura 8: Uzalishaji & Mifumo ya Kampuni](#-chapter-8-production--enterprise-patterns) |

### Usanidi wa Haraka

1. **Tengeneza fork ya Hifadhi Hii**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Nakili (clone)**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Pata Msaada**: [Jamii ya Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Unapendelea Kufanya clone Kwenye Kompyuta Yako?**
>
> Hifadhi hii inajumuisha tafsiri za lugha 50+ ambazo zinaongeza sana ukubwa wa kupakua. Ili kufanya clone bila tafsiri, tumia sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Hii inakupa kila kitu unachohitaji kukamilisha kozi kwa upakuaji wa haraka zaidi.


## Muhtasari wa Kozi

Pata ujuzi wa Azure Developer CLI (azd) kupitia sura zilizo pangiliwa kwa kujifunza kwa hatua. **Umuhimu maalum katika upelekaaji wa programu za AI kwa kuingiliana na Microsoft Foundry.**

### Kwa Nini Kozi Hii ni Muhimu kwa Waendelezaji wa Kisasa

Kulingana na maoni ya jamii ya Microsoft Foundry Discord, **45% ya waendelezaji wanataka kutumia AZD kwa mizigo ya AI** lakini wanakutana na changamoto za:
- Miundombinu tata za huduma nyingi za AI
- Mifumo bora ya kupeleka AI kwa uzalishaji  
- Uunganishaji na usanidi wa huduma za AI za Azure
- Uboreshaji wa gharama kwa mizigo ya AI
- Kutatua matatizo maalum ya upelekaaji wa AI

### Malengo ya Kujifunza

Kwa kukamilisha kozi hii iliyopangwa, utaweza:
- **Kuangalia Misingi ya AZD**: Misingi, usakinishaji, na usanidi
- **Kuweka Programu za AI**: Tumia AZD na huduma za Microsoft Foundry
- **Tekeleza Miundombinu kama Msimbo**: Dumisha rasilimali za Azure kwa templeti za Bicep
- **Tatuza Matatizo ya Upelekaaji**: Tatua matatizo ya kawaida na fanya debug
- **Boresha kwa Uzalishaji**: Usalama, upanuaji, ufuatiliaji, na usimamizi wa gharama
- **Jenga Suluhisho za Maajenti Mengi**: Weka miundo tata ya AI

## 🗺️ Ramani ya Kozi: Urambazaji wa Haraka kwa Sura

Kila sura ina README ya kujitolea yenye malengo ya kujifunza, kuanza kwa haraka, na mazoezi:

| Sura | Mada | Masomo | Muda | Ugumu |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Kuanzia | [Misingi ya AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Ufungaji](docs/chapter-01-foundation/installation.md) &#124; [Mradi wa Kwanza](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Sura 2: Maendeleo ya AI](docs/chapter-02-ai-development/README.md)** | Programu Zilizolenga AI | [Uunganishaji wa Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Maajenti ya AI](docs/chapter-02-ai-development/agents.md) &#124; [Utekelezaji wa Mifano](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Warsha](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 saa | ⭐⭐ |
| **[Sura 3: Usanidi](docs/chapter-03-configuration/README.md)** | Uthibitishaji & Usalama | [Usanidi](docs/chapter-03-configuration/configuration.md) &#124; [Uthibitishaji & Usalama](docs/chapter-03-configuration/authsecurity.md) | 45-60 dakika | ⭐⭐ |
| **[Sura 4: Miundombinu](docs/chapter-04-infrastructure/README.md)** | IaC & Uenezaji | [Mwongozo wa Uenezaji](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Utayarishaji](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 saa | ⭐⭐⭐ |
| **[Sura 5: Mawakala Nyingi](docs/chapter-05-multi-agent/README.md)** | Suluhisho za Mawakala wa AI | [Mfano wa Rejareja](examples/retail-scenario.md) &#124; [Mifumo ya Uratibu](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 saa | ⭐⭐⭐⭐ |
| **[Sura 6: Kabla ya Uenezaji](docs/chapter-06-pre-deployment/README.md)** | Upangaji & Uthibitisho | [Ukaguzi wa Awali](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Upangaji wa Uwezo](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Uchaguzi wa SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 saa | ⭐⭐ |
| **[Sura 7: Utatuzi wa Matatizo](docs/chapter-07-troubleshooting/README.md)** | Uchambuzi & Marekebisho | [Masuala ya Kawaida](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Kuchunguza Hitilafu](docs/chapter-07-troubleshooting/debugging.md) &#124; [Masuala ya AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 saa | ⭐⭐ |
| **[Sura 8: Uzalishaji](docs/chapter-08-production/README.md)** | Mifumo ya Shirika | [Mienendo ya Uzalishaji](docs/chapter-08-production/production-ai-practices.md) | 2-3 saa | ⭐⭐⭐⭐ |
| **[🎓 Warsha](workshop/README.md)** | Maabara ya Vitendo | [Utangulizi](workshop/docs/instructions/0-Introduction.md) &#124; [Uchaguzi](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Uthibitishaji](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Uchambuzi](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Usanidi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Ubinafsishaji](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Kuvunja Miundombinu](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Hitimisho](workshop/docs/instructions/7-Wrap-up.md) | 3-4 saa | ⭐⭐ |

**Jumla ya Muda wa Kozi:** ~10-14 saa | **Maendeleo ya Ujuzi:** Mwanzo → Tayari kwa Uzalishaji

---

## 📚 Sura za Kujifunza

*Chagua njia yako ya kujifunza kulingana na kiwango cha uzoefu na malengo*

### 🚀 Sura 1: Msingi na Anza Haraka
**Mahitaji ya awali**: usajili wa Azure, ujuzi wa msingi wa mstari wa amri  
**Muda**: 30-45 dakika  
**Ugumu**: ⭐

#### Kile Utakachojifunza
- Kuelewa misingi ya Azure Developer CLI
- Kusakinisha AZD kwenye jukwaa lako
- Uenezaji wako wa kwanza uliofanikiwa

#### Vyanzo vya Kujifunza
- **🎯 Anza Hapa**: [Azure Developer CLI ni nini?](#what-is-azure-developer-cli)
- **📖 Nadharia**: [Misingi ya AZD](docs/chapter-01-foundation/azd-basics.md) - Dhana kuu na istilahi
- **⚙️ Usanidi**: [Usakinishaji & Usanidi](docs/chapter-01-foundation/installation.md) - Mwongozo maalum kwa jukwaa
- **🛠️ Vitendo**: [Mradi Wako wa Kwanza](docs/chapter-01-foundation/first-project.md) - Mwongozo wa hatua kwa hatua
- **📋 Marejeo ya Haraka**: [Marejeo ya Amri](resources/cheat-sheet.md)

#### Mazoezi ya Vitendo
```bash
# Ukaguzi wa haraka wa usakinishaji
azd version

# Sambaza programu yako ya kwanza
azd init --template todo-nodejs-mongo
azd up
```

**💡 Matokeo ya Sura**: Tengeneza uenezaji wa programu rahisi ya wavuti kwenye Azure kwa kutumia AZD

**✅ Uthibitisho wa Mafanikio:**
```bash
# Baada ya kumaliza Sura ya 1, unapaswa kuwa na uwezo wa:
azd version              # Inaonyesha toleo lililowekwa
azd init --template todo-nodejs-mongo  # Inaanzisha mradi
azd up                  # Inapeleka kwenye Azure
azd show                # Inaonyesha URL ya programu inayokimbia
# Programu inafunguka kwenye kivinjari na inafanya kazi
azd down --force --purge  # Inasafisha rasilimali
```

**📊 Muda wa Kuwekeza:** 30-45 dakika  
**📈 Kiwango cha Ujuzi Baadaye:** Inaweza kueneza programu za msingi kwa kujitegemea
**📈 Kiwango cha Ujuzi Baadaye:** Inaweza kueneza programu za msingi kwa kujitegemea

---

### 🤖 Sura 2: Maendeleo ya AI-Kwanza (Inapendekezwa kwa Waendelezaji wa AI)
**Mahitaji ya awali**: Sura 1 imekamilika  
**Muda**: 1-2 saa  
**Ugumu**: ⭐⭐

#### Kile Utakachojifunza
- Uunganishaji wa Microsoft Foundry na AZD
- Kuweka programu zinazotumia AI
- Kuelewa usanidi wa huduma za AI

#### Vyanzo vya Kujifunza
- **🎯 Anza Hapa**: [Uunganishaji wa Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Maajenti ya AI**: [Mwongozo wa Maajenti ya AI](docs/chapter-02-ai-development/agents.md) - Sakinisha maajenti wenye akili kwa kutumia AZD
- **📖 Mifano**: [Utekelezaji wa Mifano ya AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Weka na simamia mifano ya AI
- **🛠️ Warsha**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Fanya suluhisho zako za AI ziwe tayari kwa AZD
- **🎥 Mwongozo wa Mwingiliano**: [Vifaa vya Warsha](workshop/README.md) - Kujifunza kwa kivinjari kwa MkDocs * DevContainer Environment
- **📋 Violezo**: [Violezo vya Microsoft Foundry](#rasilimali-za-warsha)
- **📝 Mifano**: [Mifano ya Uenezaji wa AZD](examples/README.md)

#### Mazoezi ya Vitendo
```bash
# Weka programu yako ya kwanza ya AI
azd init --template azure-search-openai-demo
azd up

# Jaribu templeti za ziada za AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Matokeo ya Sura**: Weka na sanidi programu ya mazungumzo inayotumia AI yenye uwezo wa RAG

**✅ Uthibitisho wa Mafanikio:**
```bash
# Baada ya Sura ya 2, unapaswa kuwa na uwezo wa:
azd init --template azure-search-openai-demo
azd up
# Kujaribu kiolesura cha mazungumzo cha AI
# Uliza maswali na upate majibu yanayotolewa na AI pamoja na vyanzo
# Thibitisha kuwa ujumuishaji wa utafutaji unafanya kazi
azd monitor  # Angalia Application Insights inaonyesha data za telemetri
azd down --force --purge
```

**📊 Muda wa Kuwekeza:** 1-2 saa  
**📈 Kiwango cha Ujuzi Baadaye:** Inaweza kueneza na kusanidi programu za AI tayari kwa uzalishaji  
**💰 Uelewa wa Gharama:** Elewa gharama za maendeleo $80-150/mwezi, gharama za uzalishaji $300-3,500/mwezi

#### 💰 Mambo ya Kuzingatia Kuhusu Gharama kwa Uenezaji wa AI

**Mazingira ya Maendeleo (Makadirio $80-150/mwezi):**
- Modeli za Microsoft Foundry (Lipa-unavyotumia): $0-50/mwezi (kutegemea matumizi ya tokeni)
- AI Search (ngazi ya Msingi): $75/mwezi
- Container Apps (Matumizi): $0-20/mwezi
- Hifadhi (Kiwango cha Kawaida): $1-5/mwezi

**Mazingira ya Uzalishaji (Makadirio $300-3,500+/mwezi):**
- Modeli za Microsoft Foundry (PTU kwa utendaji thabiti): $3,000+/mwezi AU Lipa-unavyotumia kwa wingi mkubwa
- AI Search (ngazi ya Kawaida): $250/mwezi
- Container Apps (Zilizotengwa): $50-100/mwezi
- Application Insights: $5-50/mwezi
- Hifadhi (Premium): $10-50/mwezi

**💡 Vidokezo vya Kuokoa Gharama:**
- Tumia **Ngazi ya Bure** Microsoft Foundry Models kwa kujifunza (Azure OpenAI 50,000 tokens/mwezi imejumuishwa)
- Endesha `azd down` kuondoa rasilimali wakati haujafanya kazi ya maendeleo
- Anza kwa uhasibu unaotokana na matumizi, boresha hadi PTU tu kwa uzalishaji
- Tumia `azd provision --preview` kukadiria gharama kabla ya uenezaji
- Wezesha auto-scaling: lipa tu kwa matumizi halisi

**Ufuatiliaji wa Gharama:**
```bash
# Angalia makadirio ya gharama za kila mwezi
azd provision --preview

# Fuatilia gharama halisi kwenye Portal ya Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Sura 3: Usanidi & Uthibitishaji
**Mahitaji ya awali**: Sura 1 imekamilika  
**Muda**: 45-60 dakika  
**Ugumu**: ⭐⭐

#### Kile Utakachojifunza
- Usanidi na usimamizi wa mazingira
- Mbinu bora za uthibitishaji na usalama
- Uainishaji na upangaji wa rasilimali

#### Vyanzo vya Kujifunza
- **📖 Usanidi**: [Mwongozo wa Usanidi](docs/chapter-03-configuration/configuration.md) - Usanidi wa mazingira
- **🔐 Usalama**: [Mifumo ya uthibitishaji na utambulisho ulioendeshwa](docs/chapter-03-configuration/authsecurity.md) - Mifumo ya uthibitishaji
- **📝 Mifano**: [Mfano wa Programu ya Hifadhidata](examples/database-app/README.md) - Mifano ya Hifadhidata za AZD

#### Mazoezi ya Vitendo
- Sanidi mazingira mengi (dev, staging, prod)
- Weka uthibitishaji wa utambulisho ulioendeshwa
- Tekeleza usanidi maalum kwa mazingira

**💡 Matokeo ya Sura**: Simamia mazingira mengi kwa uthibitishaji na usalama sahihi

---

### 🏗️ Sura 4: Miundombinu kama Msimbo & Uenezaji
**Mahitaji ya awali**: Sura 1-3 zimekamilika  
**Muda**: 1-1.5 saa  
**Ugumu**: ⭐⭐⭐

#### Kile Utakachojifunza
- Mifumo ya juu ya uenezaji
- Miundombinu kama Msimbo kwa Bicep
- Mikakati ya utayarishaji wa rasilimali

#### Vyanzo vya Kujifunza
- **📖 Uenezaji**: [Mwongozo wa Uenezaji](docs/chapter-04-infrastructure/deployment-guide.md) - Mchakato kamili wa kazi
- **🏗️ Utayarishaji**: [Utayarishaji wa Rasilimali](docs/chapter-04-infrastructure/provisioning.md) - Usimamizi wa rasilimali za Azure
- **📝 Mifano**: [Mfano wa Container App](../../examples/container-app) - Uenezaji uliowekwa ndani ya kontena

#### Mazoezi ya Vitendo
- Tengeneza violezo vya Bicep vilivyobinafsishwa
- Enezaji programu zenye huduma nyingi
- Tekeleza mikakati ya uenezaji ya blue-green

**💡 Matokeo ya Sura**: Enezaji programu ngumu zenye huduma nyingi kwa kutumia violezo vya miundombinu vilivyobinafsishwa

---

### 🎯 Sura 5: Suluhisho za AI za Mawakala Nyingi (Mtaalamu)
**Mahitaji ya awali**: Sura 1-2 zimekamilika  
**Muda**: 2-3 saa  
**Ugumu**: ⭐⭐⭐⭐

#### Kile Utakachojifunza
- Mifano ya usanifu wa mawakala wengi
- Uratibu na umoja wa mawakala
- Uenezaji wa AI tayari kwa uzalishaji

#### Vyanzo vya Kujifunza
- **🤖 Mradi Uliotajwa**: [Suluhisho la Mawakala Wengi kwa Sekta ya Rejareja](examples/retail-scenario.md) - Utekelezaji kamili
- **🛠️ Violezo vya ARM**: [Kifurushi cha Violezo vya ARM](../../examples/retail-multiagent-arm-template) - Uenezaji kwa kubofya mara moja
- **📖 Usanifu**: [Mifumo ya uratibu ya mawakala wengi](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mifano

#### Mazoezi ya Vitendo
```bash
# Sakinisha suluhisho kamili la rejareja lenye maajenti wengi
cd examples/retail-multiagent-arm-template
./deploy.sh

# Chunguza usanidi wa maajenti
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Matokeo ya Sura**: Enezaji na usimamizi wa suluhisho la AI la mawakala wengi linalostahili uzalishaji lenye mawakala wa Mteja na Hesabu

---

### 🔍 Sura 6: Uthibitisho & Upangaji kabla ya Uenezaji
**Mahitaji ya awali**: Sura 4 imekamilika  
**Muda**: 1 saa  
**Ugumu**: ⭐⭐

#### Kile Utakachojifunza
- Upangaji wa uwezo na uthibitisho wa rasilimali
- Mikakati ya uchaguzi wa SKU
- Ukaguzi wa kabla ya uenezaji na uendeshaji wa kiotomatiki

#### Vyanzo vya Kujifunza
- **📊 Upangaji**: [Upangaji wa Uwezo](docs/chapter-06-pre-deployment/capacity-planning.md) - Uthibitisho wa rasilimali
- **💰 Uchaguzi**: [Uchaguzi wa SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Chaguzi za gharama nafuu
- **✅ Uthibitisho**: [Ukaguzi wa Awali](docs/chapter-06-pre-deployment/preflight-checks.md) - Skiripti za kiotomatiki

#### Mazoezi ya Vitendo
- Endesha skiripti za uthibitisho wa uwezo
- Boresha uchaguzi wa SKU kwa gharama
- Tekeleza ukaguzi wa kabla ya uenezaji uliotekelezwa kiotomatiki

**💡 Matokeo ya Sura**: Thibitisha na boresha uenezaji kabla ya utekelezaji

---

### 🚨 Sura 7: Utatuzi wa Matatizo & Urekebishaji
**Mahitaji ya awali**: Sura yoyote ya uenezaji imekamilika  
**Muda**: 1-1.5 saa  
**Ugumu**: ⭐⭐

#### Kile Utakachojifunza
- Mbinu za kimfumo za uchambuzi wa hitilafu
- Masuala ya kawaida na suluhisho
- Utatuzi wa matatizo maalum kwa AI

#### Vyanzo vya Kujifunza
- **🔧 Masuala ya Kawaida**: [Masuala ya Kawaida](docs/chapter-07-troubleshooting/common-issues.md) - Maswali yanayoulizwa mara kwa mara na suluhisho
- **🕵️ Uchambuzi wa Hitilafu**: [Mwongozo wa Kuchunguza Hitilafu](docs/chapter-07-troubleshooting/debugging.md) - Mikakati hatua kwa hatua
- **🤖 Masuala ya AI**: [Utatuzi wa Matatizo Maalum kwa AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Matatizo ya huduma za AI

#### Mazoezi ya Vitendo
- Tambua kushindwa kwa uenezaji
- Rekebisha matatizo ya uthibitishaji
- Chunguza hitilafu za uunganishaji wa huduma za AI

**💡 Matokeo ya Sura**: Tambua na kutatua matatizo ya kawaida ya uenezaji kwa kujitegemea

---

### 🏢 Sura 8: Uzalishaji & Mifumo ya Shirika
**Mahitaji ya awali**: Sura 1-4 zimekamilika  
**Muda**: 2-3 saa  
**Ugumu**: ⭐⭐⭐⭐

#### Kile Utakachojifunza
- Mikakati ya uenezaji wa uzalishaji
- Mifumo ya usalama ya shirika
- Ufuatiliaji na uboreshaji wa gharama

#### Vyanzo vya Kujifunza
- **🏭 Uzalishaji**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Enterprise patterns
- **📝 Mifano**: [Microservices Example](../../examples/microservices) - Complex architectures
- **📊 Ufuatiliaji**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Mazoezi ya Kivitendo
- Tekeleza mifumo ya usalama ya kampuni
- Sanidi ufuatiliaji kamili
- Sambaza kwenye uzalishaji kwa udhibiti mwafaka

**💡 Matokeo ya Sura**: Sambaza programu zinazostahili kampuni zenye uwezo kamili wa uzalishaji

---

## 🎓 Muhtasari wa Warsha: Uzoefu wa Kujifunza kwa Vitendo

> **⚠️ HALI YA WARSHA: Maendeleo hai**  
> Vifaa vya warsha kwa sasa vinatengenezwa na kuboreshwa. Moduli za msingi zinafanya kazi, lakini baadhi ya sehemu za juu hazijakamilika. Tunaendelea kufanya kazi kukamilisha maudhui yote. [Fuatilia maendeleo →](workshop/README.md)

### Vifaa vya Warsha vinavyoshirikiana
**Mafunzo kamili ya vitendo kwa kutumia zana za kivinjari na mazoezi yaliyoongozwa**

Vifaa vya warsha vinatoa uzoefu wa kujifunza uliopangwa na unaoshirikisha ambao unakamilisha mtaala wa sura ulio hapo juu. Warsha imeundwa kwa kujitegemea na pia kwa mikutano inayoongozwa na mwalimu.

#### 🛠️ Sifa za Warsha
- **Kiwango cha Kivinjari**: Warsha kamili inayofadhiliwa na MkDocs yenye utafutaji, nakili, na vipengele vya mandhari
- **Muunganisho wa GitHub Codespaces**: Usanidi wa mazingira ya maendeleo kwa bonyeza moja
- **Njia ya Kujifunza Imepangwa**: Mazoezi yaliyoongozwa ya moduli 8 (saa 3-4 jumla)
- **Mbinu ya Kujaribu hatua kwa hatua**: Utangulizi → Uchaguzi → Uthibitisho → Ufafanuzi → Usanidi → Urekebishaji → Kuondoa → Hitimisho
- **Mazingira ya DevContainer ya Kiuingiliano**: Zana na utegemezi vilivyowekwa kabla

#### 📚 Muundo wa Moduli za Warsha
Warsha inafuata mbinu ya maendeleo ya moduli 8 ambayo inakupeleka kutoka ugunduzi hadi ustadi wa usambazaji:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Utangulizi** | Muhtasari wa Warsha | Elewa malengo ya kujifunza, masharti ya awali, na muundo wa warsha | 15 min |
| **1. Uchaguzi** | Ugunduzi wa Templeti | Chunguza templeti za AZD na chagua templeti sahihi ya AI kwa hali yako | 20 min |
| **2. Uthibitisho** | Sambaza & Thibitisha | Sambaza templeti kwa `azd up` na thibitisha miundombinu inafanya kazi | 30 min |
| **3. Ufafanuzi** | Elewa Muundo | Tumia GitHub Copilot kuchunguza usanifu wa templeti, faili za Bicep, na mpangilio wa msimbo | 30 min |
| **4. Usanidi** | Uchunguzi wa kina wa `azure.yaml` | Zhuza usanidi wa `azure.yaml`, hooks za maisha, na vigezo vya mazingira | 30 min |
| **5. Urekebishaji** | Ifanyie Yako | Washa AI Search, ufuatiliaji, tathmini, na ubinafsishe kwa hali yako | 45 min |
| **6. Kuondoa** | Safisha | Ondoa rasilimali kwa usalama kwa `azd down --purge` | 15 min |
| **7. Hitimisho** | Hatua zinazofuata | Pitia mafanikio, dhana muhimu, na endelea safari yako ya kujifunza | 15 min |

**Mtiririko wa Warsha:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Kuanzia na Warsha
```bash
# Chaguo 1: GitHub Codespaces (Inayopendekezwa)
# Bonyeza "Code" → "Create codespace on main" kwenye hazina

# Chaguo 2: Maendeleo ya ndani
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Fuata maelekezo ya usanidi katika workshop/README.md
```

#### 🎯 Matokeo ya Kujifunza ya Warsha
Kwa kukamilisha warsha, washiriki wataweza:
- **Sambaza Programu za AI kwa Uzalishaji**: Tumia AZD na huduma za Microsoft Foundry
- **Tawala Miundo ya Maajenti Mengi**: Tekeleza suluhisho za maajenti wa AI zitakazofanya kazi kwa pamoja
- **Tekeleza Mbinu Bora za Usalama**: Sanidi uthibitishaji na udhibiti wa upatikanaji
- **Boresha kwa Upanuzi**: Buni usambazaji wenye gharama nafuu na utendaji mzuri
- **Tatua Matatizo ya Usambazaji**: Rekebisha maswala ya kawaida kwa kujitegemea

#### 📖 Rasilimali za Warsha
- **🎥 Mwongozo wa Maingiliano**: [Vifaa vya Warsha](workshop/README.md) - Mazingira ya kujifunzia vinavyotumia kivinjari
- **📋 Maelekezo kwa Moduli-Kwa-Moduli**:
  - [0. Utangulizi](workshop/docs/instructions/0-Introduction.md) - Muhtasari wa warsha na malengo
  - [1. Uchaguzi](workshop/docs/instructions/1-Select-AI-Template.md) - Pata na chagua templeti za AI
  - [2. Uthibitisho](workshop/docs/instructions/2-Validate-AI-Template.md) - Sambaza na thibitisha templeti
  - [3. Ufafanuzi](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Chunguza usanifu wa templeti
  - [4. Usanidi](workshop/docs/instructions/4-Configure-AI-Template.md) - Zhuza `azure.yaml`
  - [5. Urekebishaji](workshop/docs/instructions/5-Customize-AI-Template.md) - Ubinafsishe kwa hali yako
  - [6. Kuondoa](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Safisha rasilimali
  - [7. Hitimisho](workshop/docs/instructions/7-Wrap-up.md) - Pitisha na hatua zinazofuata
- **🛠️ Maabara ya Warsha ya AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Mazoezi yanayolenga AI
- **💡 Mwanzo Haraka**: [Workshop Setup Guide](workshop/README.md#quick-start) - Usanidi wa mazingira

**Inafaa kwa**: Mafunzo ya kampuni, kozi za vyuo vikuu, kujifunza kwa kujitegemea, na bootcamps za watengenezaji.

---

## 📖 Uchunguzi wa Kina: Uwezo wa AZD

Zaidi ya mambo ya msingi, AZD inatoa vipengele vyenye nguvu kwa usambazaji wa uzalishaji:

- **Usambazaji unaotegemea Templeti** - Tumia templeti zilizojengwa mapema kwa mifumo ya kawaida ya programu
- **Miundombinu kama Msimbo** - Dhibiti rasilimali za Azure ukitumia Bicep au Terraform  
- **Mtiririko umeunganishwa** - Panga, sambaza, na fuatilia programu kwa urahisi
- **Rafiki kwa Msimengenezaji** - Imeboreshwa kwa uzalishaji na uzoefu wa msanidi programu

### **AZD + Microsoft Foundry: Inafaa kwa Usambazaji wa AI**

**Kwanini AZD kwa Suluhisho za AI?** AZD inashughulikia changamoto kuu ambazo waendelezaji wa AI wanakutana nazo:

- **Templeti Zmeandaliwa kwa AI** - Templeti zilizo tayari kwa Microsoft Foundry Models, Cognitive Services, na mizigo ya kazi ya ML
- **Usambazaji Salama wa AI** - Mifumo ya usalama iliyojengwa kwa huduma za AI, funguo za API, na viungo vya modeli  
- **Mifumo ya AI kwa Uzalishaji** - Mbinu bora za kusambaza programu za AI zinazoweza kupanuka kwa gharama nafuu
- **Mtiririko wa AI Kuanzia Mwisho hadi Mwisho** - Kutoka kwenye ukuzaji wa modeli hadi usambazaji wa uzalishaji na ufuatiliaji unaofaa
- **Uboreshaji wa Gharama** - Mgawanyo wa rasilimali kwa busara na mikakati ya ukuzaji kwa mizigo ya kazi ya AI
- **Muunganisho wa Microsoft Foundry** - Muunganisho usio na mshono kwenye katalogi ya modeli za Microsoft Foundry na viungo

---

## 🎯 Maktaba ya Templeti & Mifano

### Iliyotajwa: Templeti za Microsoft Foundry
**Anza hapa ikiwa unasambaza programu za AI!**

> **Kumbuka:** Templeti hizi zinaonyesha mifumo mbalimbali ya AI. Baadhi ni Azure Samples za nje, nyingine ni utekelezaji wa ndani.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Anza na Gumzo la AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Sura 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Nje |
| [**Anza na Maajenti wa AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Sura 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Nje |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Sura 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Nje |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Sura 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Nje |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Sura 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Nje |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Sura 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Nje |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Sura 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Ndani** |

### Iliyotajwa: Matukio ya Kujifunza Kamili
**Templeti za programu tayari kwa uzalishaji zilizoambatishwa na sura za kujifunza**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Sura 2 | ⭐ | Mbinu za msingi za usambazaji wa AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Sura 2 | ⭐⭐ | Utekelezaji wa RAG na Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Sura 4 | ⭐⭐ | Muunganisho wa Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Sura 5 | ⭐⭐⭐ | Mfumo wa maajenti na kuita kazi za function |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Sura 8 | ⭐⭐⭐ | Kuongoza AI kwa kampuni |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Sura 5 | ⭐⭐⭐⭐ | Muundo wa maajenti mengi kwa Ajenti wa Wateja na Hesabu ya Bidhaa |

### Kujifunza kwa Aina ya Mfano

> **📌 Mifano Ndani vs Nje:**  
> **Mifano Ndani** (katika repo hii) = Tayari kutumika mara moja  
> **Mifano Nje** (Azure Samples) = Kloni kutoka kwa repositories zilizounganishwa

#### Mifano Ndani (Tayari Kutumika)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Utekelezaji kamili uliokamilika kwa uzalishaji na templeti za ARM
  - Muundo wa maajenti mengi (Maajenti ya Mteja + Hesabu ya Bidhaa)
  - Ufuatiliaji kamili na tathmini
  - Usambazaji kwa bonyeza moja kupitia templeti ya ARM

#### Mifano Ndani - Programu za Container (Sura 2-5)
**Mifano kamili ya usambazaji wa container katika repo hii:**
- [**Mfano wa Container App**](examples/container-app/README.md) - Mwongozo kamili wa usambazaji wa container
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API rahisi ya REST yenye scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Usambazaji wa huduma nyingi unaostahili uzalishaji
  - Mwanzo Haraka, Uzalishaji, na Mifano ya Usambazaji wa Juu
  - Mwongozo wa ufuatiliaji, usalama, na uboreshaji wa gharama

#### Mifano Nje - Programu Rahisi (Sura 1-2)
**Kloni hizi za Azure Samples ili kuanza:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mifano ya msingi ya usambazaji
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Usambazaji wa maudhui thabiti
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Usambazaji wa API ya REST

#### Mifano Nje - Muunganisho wa Hifadhidata (Sura 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mifano ya uunganishaji wa hifadhidata
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Mtiririko wa data usiokuwa na seva

#### Mifano Nje - Mifumo ya Juu (Sura 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Miundo ya huduma nyingi
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Usindikaji wa nyuma  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Mifano ya ML inayostahili uzalishaji

### Mkusanyiko wa Templeti za Nje
- [**Jukwaa Rasmi la Templeti za AZD**](https://azure.github.io/awesome-azd/) - Mkusanyiko uliosafirishwa wa templeti rasmi na za jamii
- [**Templeti za Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Nyaraka za templeti za Microsoft Learn
- [**Saraka ya Mifano**](examples/README.md) - Mifano ya kujifunza ya ndani yenye maelezo ya kina

---

## 📚 Rasilimali za Kujifunza & Marejeleo

### Marejeleo ya Haraka
- [**Muhtasari wa Amri**](resources/cheat-sheet.md) - Amri muhimu za azd zimepangwa kwa sura
- [**Kamusi**](resources/glossary.md) - Istilahi za Azure na azd  
- [**Maswali Yanayoulizwa (FAQ)**](resources/faq.md) - Maswali ya kawaida yamepangwa kwa sura za kujifunza
- [**Mwongozo wa Kusoma**](resources/study-guide.md) - Mazoezi ya kina ya mazoezi

### Warsha za Vitendo
- [**Maabara ya Warsha ya AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Fanya suluhisho zako za AI ziwe zinazosambazwa kwa AZD (saa 2-3)
- [**Warsha Shirikishi**](workshop/README.md) - Mazoezi yaliyoongozwa ya moduli 8 kwa MkDocs na GitHub Codespaces
  - Inafuata: Utangulizi → Uchaguzi → Uthibitisho → Ufafanuzi → Usanidi → Urekebishaji → Kuondoa → Hitimisho

### Rasilimali za Kujifunza za Nje
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Kituo cha Usanifu wa Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkuleta ya Bei ya Azure](https://azure.microsoft.com/pricing/calculator/)
- [Hali ya Azure](https://status.azure.com/)

### Ujuzi wa Wakala wa AI kwa Mhariri Wako
- [**Ujuzi wa Microsoft Azure kwenye skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 ujuzi wazi wa wakala kwa Azure AI, Foundry, utoaji, utambuzi wa matatizo, uboreshaji wa gharama, na zaidi. Sakinisha katika GitHub Copilot, Cursor, Claude Code, au wakala mwingine wowote unaounga mkono:
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
# Orodhesha usajili zinazopatikana
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
<summary><strong>❌ "InsufficientQuota" au "Kiasi kilizidi"</strong></summary>

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
<summary><strong>❌ "azd up" inashindwa katikati ya mchakato</strong></summary>

```bash
# Chaguo 1: Safisha na jaribu tena
azd down --force --purge
azd up

# Chaguo 2: Rekebisha miundombinu tu
azd provision

# Chaguo 3: Angalia hali ya kina
azd show

# Chaguo 4: Angalia kumbukumbu za shughuli katika Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Uthibitisho umeshindwa" au "Token imeisha"</strong></summary>

```bash
# Fanya uthibitishaji tena
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
# AZD inazalisha majina ya kipekee, lakini ikiwa kuna mgongano:
azd down --force --purge

# Kisha jaribu tena kwa mazingira safi
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Utoaji wa templeti unachukua muda mrefu</strong></summary>

**Muda wa kawaida wa kusubiri:**
- Programu rahisi ya wavuti: 5-10 dakika
- Programu yenye hifadhidata: 10-15 dakika
- Programu za AI: 15-25 dakika (Utoaji wa OpenAI ni polepole)

```bash
# Angalia maendeleo
azd show

# Kama umekwama kwa zaidi ya dakika 30, angalia Azure Portal:
azd monitor
# Tafuta utekelezaji ulioshindwa
```
</details>

<details>
<summary><strong>❌ "Ruhusa imekataliwa" au "Forbidden"</strong></summary>

```bash
# Angalia jukumu lako la Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Unahitaji angalau jukumu la "Contributor"
# Omba msimamizi wako wa Azure akupe:
# - Contributor (kwa rasilimali)
# - User Access Administrator (kwa ugawaji wa majukumu)
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
- **Masuala Maalum ya AI:** [Utatuzi wa AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Mwongozo wa Utatuzi wa Hitilafu:** [Utatuzi hatua kwa hatua](docs/chapter-07-troubleshooting/debugging.md)
- **Pata Msaada:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Ukamilishaji wa Kozi na Cheti

### Ufuatiliaji wa Maendeleo
Fuata maendeleo yako ya kujifunza kupitia kila sura:

- [ ] **Sura 1**: Misingi & Mwanzo wa Haraka ✅
- [ ] **Sura 2**: Maendeleo ya AI Kwanza ✅  
- [ ] **Sura 3**: Usanidi & Uthibitisho ✅
- [ ] **Sura 4**: Miundombinu kama Msimbo & Utoaji ✅
- [ ] **Sura 5**: Suluhisho za AI za Mawakala Wengi ✅
- [ ] **Sura 6**: Uthibitisho na Mipango kabla ya Utoaji ✅
- [ ] **Sura 7**: Utatuzi wa Matatizo & Utatuzi wa Hitilafu ✅
- [ ] **Sura 8**: Mifumo kwa Uzalishaji na Biashara ✅

### Uthibitisho wa Kujifunza
Baada ya kumaliza kila sura, thibitisha ujuzi wako kwa:
1. **Mazoezi ya Vitendo**: Kamilisha utekelezaji wa vitendo wa sura
2. **Jaribio la Maarifa**: Pitia sehemu ya FAQ ya sura yako
3. **Majadiliano ya Jamii**: Shiriki uzoefu wako kwenye Azure Discord
4. **Sura Inayofuata**: Hamia kwenye ngazi inayofuata ya ugumu

### Manufaa ya Kukamilisha Kozi
Ukimaliza sura zote, utakuwa na:
- **Uzoefu wa Uzalishaji**: Umeweka programu halisi za AI kwenye Azure
- **Ujuzi wa Kitaalamu**: Uwezo wa utoaji kwa kiwango cha kampuni  
- **Utambuzi wa Jamii**: Mwanachama hai wa jamii ya waendelezaji wa Azure
- **Mafanikio ya Kazi**: Ujuzi unaohitajika wa AZD na utoaji wa AI

---

## 🤝 Jamii na Msaada

### Pata Msaada & Usaidizi
- **Masuala ya Kiufundi**: [Ripoti mende na omba vipengele](https://github.com/microsoft/azd-for-beginners/issues)
- **Maswali ya Kujifunza**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) na [![Discord ya Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Msaada Maalum wa AI**: Jiunge na [![Discord ya Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Nyaraka**: [Nyaraka rasmi za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Maarifa ya Jamii kutoka Discord ya Microsoft Foundry

**Matokeo ya kura za hivi karibuni kutoka kwa Kituo #Azure:**
- **45%** ya waendelezaji wanataka kutumia AZD kwa kazi za AI
- **Changamoto kubwa**: Utoaji wa huduma nyingi, usimamizi wa vyeti, utayari wa uzalishaji  
- **Vinavyoombwa zaidi**: Templeti maalum za AI, mwongozo wa utatuzi wa matatizo, mbinu bora

**Jiunge na jamii yetu ili:**
- Shiriki uzoefu wako wa AZD + AI na pata msaada
- Pata mapitio ya awali ya templeti mpya za AI
- Changia mbinu bora za utoaji wa AI
- Kuathiri maendeleo ya vipengele vijavyo vya AI + AZD

### Kuchangia kwa Kozi
Tunakaribisha michango! Tafadhali soma [Mwongozo wa Kuchangia](CONTRIBUTING.md) kwa maelezo kuhusu:
- **Maboresho ya Maudhui**: Boresha sura zilizopo na mifano
- **Mifano Mpya**: Ongeza hali halisi za matumizi na templeti  
- **Tafsiri**: Saidia kudumisha msaada wa lugha nyingi
- **Ripoti za Mende**: Boresha usahihi na uwazi
- **Viwango vya Jamii**: Fuata miongozo yetu ya jamii inayojumuisha

---

## 📄 Taarifa za Kozi

### Leseni
Mradi huu umepewa leseni chini ya Leseni ya MIT - angalia faili ya [LICENSE](../../LICENSE) kwa maelezo.

### Rasilimali Zinazohusiana za Kujifunzia za Microsoft

Our team produces other comprehensive learning courses:

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
[![Wakala wa AI kwa Waanzilishi](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI kwa Waanzilishi](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML kwa Waanzilishi](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Sayansi ya Data kwa Waanzilishi](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI kwa Waanzilishi](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Usalama wa Mtandao kwa Waanzilishi](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Utengenezaji wa Wavuti kwa Waanzilishi](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT kwa Waanzilishi](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Maendeleo ya XR kwa Waanzilishi](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Mfululizo wa Copilot
[![Copilot kwa Kuprogramu Pamoja na AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot kwa C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Safari ya Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Urambazaji wa Kozi

**🚀 Tayari Kuanza Kujifunza?**

**Waanzilishi**: Anza na [Sura 1: Msingi & Mwanzo wa Haraka](#-chapter-1-foundation--quick-start)  
**Waendelezaji wa AI**: Nelekea [Sura 2: Uendelezaji wa AI-Kwanza](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Waendelezaji Wenye Uzoefu**: Anza na [Sura 3: Usanidi & Uthibitishaji](#️-chapter-3-configuration--authentication)

**Hatua Zifuatazo**: [Anza Sura 1 - Misingi ya AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kauli ya kutokuwajibika**:
Dokumenti hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kufikia usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kasoro. Nyaraka ya asili katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatuwajibiki kwa uelewa au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->