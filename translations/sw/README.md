# AZD Kwa Waanzilishi: Safari Iliyojaa Mafunzo Iliyo Pangwa

![AZD-for-beginners](../../translated_images/sw/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Tafsiri Zinazojirudia (Zilizosasishwa Kila Wakati)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](./README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Unapendelea Kufuata Kwenye Kompyuta Yako?**
>
> Hifadhidata hii ina tafsiri za lugha zaidi ya 50 ambazo huongeza kwa kiasi kikubwa ukubwa wa kupakua. Ili kufuata bila tafsiri, tumia sparse checkout:
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
> Hii inakupatia kila kitu unachohitaji ili kumaliza kozi kwa upakuaji wa kasi zaidi.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Nini Kipya katika azd Leo

> 📌 Kozi hii imethibitishwa dhidi ya **`azd 1.27.1`** (Julai 2026). Endesha `azd version` ili kuangalia toleo lako, na `azd upgrade` ili kupata toleo la hivi karibuni.

Azure Developer CLI imekua zaidi ya programu za wavuti za jadi na API. Leo, azd ni zana moja kwa ajili ya kupeleka **programu yoyote** kwa Azure—pamoja na programu zenye AI na wawakilishi wenye akili.

Hapa ni maana yake kwako:

- **Maajenti wa AI sasa ni mizigo ya daraja la kwanza katika azd.** Unaweza kuanzisha, kupeleka, na kusimamia miradi ya maajenti wa AI kwa kutumia mchakato ule ule wa `azd init` → `azd up` ambao tayari unajua.
- **Mzunguko kamili wa maajenti kutoka CLI.** Kiendelezi `azure.ai.agents` sasa kinashughulikia safari yote—`azd ai agent init` kuanzisha mradi, `azd ai agent invoke` kujaribu (pamoja na matokeo ya muda wa majibu), `azd ai agent eval generate` na `azd ai agent optimize` kupima na kuboresha ubora, na `azd ai agent delete` kusafisha.
- **Vipande zaidi vya kujenga AI.** Ongeza vipengele mpya vya mapitio—`azure.ai.skills` na `azure.ai.connections`—vinakuwezesha kusimamia ujuzi wa maajenti unaoweza kutumika tena na muunganisho wa Foundry moja kwa moja na azd.
- **Uunganisho wa Microsoft Foundry** unaleta uenezi wa mfano, usimamizi wa maajenti, na usanidi wa huduma za AI moja kwa moja katika mfumo wa templeti wa azd.
- **Mambo rahisi ya kila siku.** Matoleo ya hivi karibuni yamefanya `azd init` kuwa salama kuendazoa tena (idempotent), kufanya `azd auth login` kusaidia kuondoa tokeni zilizochakaa kiotomatiki, na kuongeza onyesho la usanidi wa kwanza la kirafiki `azd tool`.
- **Mchakato wa msingi haujabadilika.** Iwe unaeneza programu ya kutaka-tenda, huduma ndogo, au suluhisho la AI la maajenti wengi, amri bado ni ile ile.

> **Kumbuka kwa watumiaji wa Aspire:** Microsoft sasa inarejelea bidhaa hii kwa jina rahisi **Aspire** (awali ".NET Aspire"). Usaidizi wa Aspire katika azd haujawahi kubadilika—jina tu ndilo lililobadilika.

Ikiwa umewahi kutumia azd hapo awali, msaada wa AI ni nyongeza ya kawaida—si zana tofauti au njia ya hali ya juu. Ikiwa unaanza sasa, utajifunza mchakato mmoja unaofanya kazi kwa kila kitu.

---

## 🚀 Azure Developer CLI (azd) ni Nini?

**Azure Developer CLI (azd)** ni chombo cha amri rafiki kwa waendelezaji kinachorahisisha kupeleka programu kwa Azure. Badala ya kuunda na kuunganisha rasilimali nyingi za Azure moja kwa moja, unaweza kupeleka programu kamili kwa amri moja.

### Uchawi wa `azd up`

```bash
# Amri hii moja hufanya kila kitu:
# ✅ Inaunda rasilimali zote za Azure
# ✅ Inaweka mtandao na usalama
# ✅ Inajenga msimbo wa programu yako
# ✅ Inaweka kwenye Azure
# ✅ Inakupa URL inayofanya kazi
azd up
```

**Hiyo tu!** Hakuna kubofya kwenye Azure Portal, hakuna kuelewa templeti ngumu za ARM kwanza, wala usanidi wa mkono - ni programu zinazofanya kazi kwenye Azure.

---

## ❓ Azure Developer CLI dhidi ya Azure CLI: Tofauti ni Nini?

Hii ndio swali la kawaida zinazoulizwa na waanzilishi. Hapa ni jibu rahisi:

| Kipengele | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Madhumuni** | Kusimamia rasilimali binafsi za Azure | Kupeleka programu kamili |
| **Mtazamo** | Kujikita kwenye miundombinu | Kujikita kwenye programu |
| **Mfano** | `az webapp create --name myapp...` | `azd up` |
| **Mafunzo** | Lazima ujue huduma za Azure | Jua tu programu yako |
| **Bora Kwa** | DevOps, Miundombinu | Waendelezaji, Uundaji wa mfano |

### Mfano Rahisi

- **Azure CLI** ni kama kuwa na zana zote za kujenga nyumba - nyundo, msumeno, na visu. Unaweza kujenga kitu chochote, lakini unahitaji kujua ujenzi.
- **Azure Developer CLI** ni kama kuajiri mkandarasi - unaelezea kile unachotaka, naye anajenga.

### Wakati wa Kutumia Kila Moja

| Hali | Tumia Hii |
|----------|----------|
| "Nataka kupeleka programu yangu ya wavuti kwa haraka" | `azd up` |
| "Nahitaji kuunda akaunti ya uhifadhi tu" | `az storage account create` |
| "Ninajenga programu kamili ya AI" | `azd init --template azure-search-openai-demo` |
| "Nahitaji kuondoa hitilafu kwenye rasilimali maalum ya Azure" | `az resource show` |
| "Nataka uenezi tayari kwa uzalishaji kwa dakika chache" | `azd up --environment production` |

### Wanatumia Pamoja!

AZD hutumia Azure CLI kwa siri. Unaweza kutumia zote mbili:
```bash
# Tumia app yako kwa AZD
azd up

# Kisha boresha rasilimali maalum kwa Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Tafuta Templeti Katika Awesome AZD

Usianze kutoka mwanzo! **Awesome AZD** ni mkusanyiko wa jumuiya wa templeti tayari kupelekwa:

| Rasilimali | Maelezo |
|----------|-------------|
| 🔗 [**Gallery ya Awesome AZD**](https://azure.github.io/awesome-azd/) | Kagua templeti 200+ na ueneze kwa bonyeza moja |
| 🔗 [**Wasilisha Templeti**](https://github.com/Azure/awesome-azd/issues) | Changia templeti yako binafsi kwa jamii |
| 🔗 [**Hifadhidata ya GitHub**](https://github.com/Azure/awesome-azd) | Chukua na chunguza chanzo |

### Templeti Maarufu za AI kutoka Awesome AZD

```bash
# Maongezi ya RAG na Mifano ya Microsoft Foundry + Utafutaji wa AI
azd init --template azure-search-openai-demo

# Programu ya Mazungumzo ya AI ya Haraka
azd init --template openai-chat-app-quickstart

# Wakala wa AI na Wakala wa Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Anza kwa Hatua 3

Kabla ya kuanza, hakikisha mashine yako iko tayari kwa templeti unayotaka kupeleka:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ikiwa ukaguzi wowote muhimu unashindikana, rekebisha hilo kwanza kisha endelea na maelekezo ya kuanza haraka.

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
# Si lazima ikiwa unapanga kutumia amri za Azure CLI moja kwa moja katika kozi hii
az login

# Inahitajika kwa michakato ya AZD
azd auth login
```

Ikiwa haujui ni ipi unayohitaji, fuata mchakato kamili wa usanidi katika [Usakinishaji & Usanidi](docs/chapter-01-foundation/installation.md#authentication-setup).

### Hatua 3: Peleka Programu Yako ya Kwanza

```bash
# Anzisha kutoka kwa kiolezo
azd init --template todo-nodejs-mongo

# Weka kwenye Azure (inaunda kila kitu!)
azd up
```

**🎉 Hiyo tu!** Programu yako sasa iko mtandaoni kwenye Azure.

### Safisha (Usisahau!)

```bash
# Ondoa rasilimali zote baada ya kumaliza majaribio
azd down --force --purge
```

---

## 📚 Jinsi ya Kutumia Kozi Hii

Kozi hii imeundwa kwa ajili ya **kujifunza kidogo kidogo** - anza mahali unapojisikia vizuri na pandisha taratibu:

| Uzoefu Wako | Anza Hapa |
|-----------------|------------|
| **Mpya kabisa kwa Azure** | [Sura ya 1: Msingi](#-chapter-1-foundation--quick-start) |
| **Unajua Azure, mpya kwa AZD** | [Sura ya 1: Msingi](#-chapter-1-foundation--quick-start) |
| **Unataka kupeleka programu za AI** | [Sura ya 2: Maendeleo ya AI-Kwanza](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Unataka mazoezi ya vitendo** | [🎓 Warsha ya Kujifunza](workshop/README.md) - maabara ya masaa 3-4 yenye mwongozo |
| **Unahitaji mifumo ya uzalishaji** | [Sura ya 8: Mifumo ya Uzalishaji & Biashara](#-chapter-8-production--enterprise-patterns) |

### Usanidi wa Haraka

1. **Fungua Hifadhidata Hii kwa Kufuata**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Fuatilia**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Pata Msaada**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Unapendelea Kufuata Kwenye Kompyuta Yako?**

> Hifadhidata hii ina tafsiri za lugha zaidi ya 50 ambazo huongeza kwa kiasi kikubwa ukubwa wa kupakua. Ili kufuata bila tafsiri, tumia sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Hii inakupatia kila kitu unachohitaji ili kumaliza kozi kwa upakuaji wa kasi zaidi.


## Muhtasari wa Kozi

Jifunze Azure Developer CLI (azd) kupitia sura zilizopangwa kwa ajili ya mafunzo ya hatua kwa hatua. **Msisitizo maalum juu ya kueneza programu za AI kwa ushirikiano wa Microsoft Foundry.**


### Kwa Nini Kozi Hii ni Muhimu kwa Waendelezaji wa Kisasa

Kulingana na maarifa ya jumuiya ya Microsoft Foundry Discord, **45% ya waendelezaji wanataka kutumia AZD kwa kazi za AI** lakini wanakutana na changamoto za:
- Miundo tata ya huduma nyingi za AI
- Mbinu bora za usambazaji wa AI kwa uzalishaji  
- Muunganisho na usanidi wa huduma za Azure AI
- Uboreshaji wa gharama kwa kazi za AI
- Kutatua matatizo maalum ya usambazaji wa AI

### Malengo ya Kujifunza

Kwa kumaliza kozi hii iliyoandaliwa, utakuwa:
- **Mtaalamu wa Misingi ya AZD**: Dhana za msingi, usanidi, na usakinishaji
- **Sambaza Programu za AI**: Tumia AZD na huduma za Microsoft Foundry
- **Tekeleza Miundombinu kama Msimbo**: Simamia rasilimali za Azure kwa kutumia templates za Bicep
- **Tatua Matatizo ya Usambazaji**: Rekebisha masuala ya kawaida na fungua matatizo
- **Boresha kwa Ajili ya Uzalishaji**: Usalama, upanuzi, ufuatiliaji, na usimamizi wa gharama
- **Jenga Suluhisho za Wakala Wingi**: Sambaza miundo tata ya AI

## Kabla Ya Kuanza: Akaunti, Ufikiaji, na Dhahania

Kabla ya kuanza Sura ya 1, hakikisha umeweka yafuatayo. Hatua za usakinishaji baadaye katika mwongozo huu zinadhani kuwa mambo haya ya msingi yameshalipwa.

- **Usajili wa Azure**: Unaweza kutumia usajili uliopo kutoka kazini au akaunti yako mwenyewe, au tengeneza [jaribio la bure](https://aka.ms/azurefreetrial) kuanza.
- **Idhini ya kuunda rasilimali za Azure**: Kwa mazoezi mengi, unapaswa kuwa na angalau ufikiaji wa **Mchangiaji** kwenye usajili au kikundi cha rasilimali unachotaka. Baadhi ya sura pia zinaweza kudhani unaweza kuunda makundi ya rasilimali, vitambulisho vinavyosimamiwa, na utekelezaji wa RBAC.
- [**Akaunti ya GitHub**](https://github.com): Hii ni muhimu kwa kuchonga hifadhi, kufuatilia mabadiliko yako binafsi, na kutumia GitHub Codespaces kwa warsha.
- **Mahitaji ya wakati wa utekelezaji wa templeti**: Baadhi ya templeti zinahitaji zana za ndani kama Node.js, Python, Java, au Docker. Endesha kinasaidia wa usanidi kabla ya kuanza ili kugundua zana zilizokosekana mapema.
- **Uzoefu wa msingi wa terminal**: Huna haja ya kuwa mtaalamu, lakini unapaswa wasiwe na usumbufu kutumia amri kama `git clone`, `azd auth login`, na `azd up`.

> **Unafanya kazi kwa usajili wa kampuni?**
> Ikiwa mazingira yako ya Azure yanadhibitiwa na msimamizi, hakikisha mapema kuwa unaweza kusambaza rasilimali katika usajili au kikundi cha rasilimali unachopanga kutumia. Ikiwa sivyo, omba usajili wa sandbox au ufikiaji wa Mchangiaji kabla ya kuanza.

> **Mpya kwa Azure?**
> Anza na jaribio lako la Azure au usajili wa kulipia-unapotumia https://aka.ms/azurefreetrial ili uweze kumaliza mazoezi kutoka mwanzo hadi mwisho bila kusubiri idhini za ngazi ya kanda.

## 🗺️ Ramani ya Kozi: Uelekevu wa Haraka kwa Sura

Kila sura ina README maalum yenye malengo ya kujifunza, kuanza haraka, na mazoezi:

| Sura | Mada | Masomo | Muda | Ugumu |
|---------|-------|---------|----------|------------|
| **[Sura 1: Msingi](docs/chapter-01-foundation/README.md)** | Kuanzisha | [Misingi ya AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Usakinishaji](docs/chapter-01-foundation/installation.md) &#124; [Mradi wa Kwanza](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Sura 2: Maendeleo ya AI](docs/chapter-02-ai-development/README.md)** | Programu za AI Kwanza | [Muunganisho wa Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Wakala wa AI](docs/chapter-02-ai-development/agents.md) &#124; [Usambazaji wa Mfano](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Warsha](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 saa | ⭐⭐ |
| **[Sura 3: Usanidi](docs/chapter-03-configuration/README.md)** | Utiifu & Usalama | [Usanidi](docs/chapter-03-configuration/configuration.md) &#124; [Utiifu & Usalama](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Sura 4: Miundombinu](docs/chapter-04-infrastructure/README.md)** | IaC & Usambazaji | [Mwongozo wa Usambazaji](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Upangaji](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 saa | ⭐⭐⭐ |
| **[Sura 5: Wakala Wingi](docs/chapter-05-multi-agent/README.md)** | Suluhisho za Wakala wa AI | [Mfano wa Rejareja](examples/retail-scenario.md) &#124; [Mifumo ya Uratibu](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 saa | ⭐⭐⭐⭐ |
| **[Sura 6: Kabla ya Usambazaji](docs/chapter-06-pre-deployment/README.md)** | Upangaji & Uthibitisho | [Ukaguzi wa Kabla ya Usambazaji](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Mpango wa Uwezo](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Uchaguaji wa SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Uchambuzi wa Programu](docs/chapter-06-pre-deployment/application-insights.md) | 1 saa | ⭐⭐ |
| **[Sura 7: Kutatua Matatizo](docs/chapter-07-troubleshooting/README.md)** | Kuchunguza & Rekebisha | [Masuala ya Kawaida](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Uchunguzi](docs/chapter-07-troubleshooting/debugging.md) &#124; [Masuala ya AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 saa | ⭐⭐ |
| **[Sura 8: Uzalishaji](docs/chapter-08-production/README.md)** | Mifumo ya Kampuni | [Mbinu za Uzalishaji](docs/chapter-08-production/production-ai-practices.md) | 2-3 saa | ⭐⭐⭐⭐ |
| **[🎓 Warsha](workshop/README.md)** | Maabara ya Vitendo | [Utangulizi](workshop/docs/instructions/0-Introduction.md) &#124; [Uchaguzi](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Uthibitisho](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Uchanganuzi](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Usanidi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Urekebishaji](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Kuvunjika](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Hitimisho](workshop/docs/instructions/7-Wrap-up.md) | 3-4 saa | ⭐⭐ |

**Muda wa Jumla wa Kozi:** ~10-14 saa | **Maendeleo ya Ujuzi:** Mwanzo → Tayari kwa Uzalishaji

---

## 📚 Sura za Kujifunza

*Chagua njia yako ya kujifunza kulingana na kiwango cha uzoefu na malengo*

### 🚀 Sura 1: Msingi & Kuanzisha Haraka
**Mahitaji ya awali**: Usajili wa Azure, maarifa ya mstari wa amri wa msingi  
**Muda**: Dakika 30-45  
**Ugumu**: ⭐

#### Kile Utakachojifunza
- Kuelewa misingi ya Azure Developer CLI
- Kusakinisha AZD kwenye jukwaa lako
- Usambazaji wako wa kwanza uliofanikiwa

#### Rasilimali za Kujifunza
- **🎯 Anza Hapa**: [Azure Developer CLI ni Nini?](#what-is-azure-developer-cli)
- **📖 Nadharia**: [Misingi ya AZD](docs/chapter-01-foundation/azd-basics.md) - Dhana na istilahi za kimsingi
- **⚙️ Usanidi**: [Usakinishaji & Usanidi](docs/chapter-01-foundation/installation.md) - Mwongozo wa jukwaa maalum
- **🛠️ Vitendo**: [Mradi Wako wa Kwanza](docs/chapter-01-foundation/first-project.md) - Mafunzo kwa hatua kwa hatua
- **📋 Marejeo ya Haraka**: [Karatasi ya Amri](resources/cheat-sheet.md)

#### Mazoezi ya Kivitendo
```bash
# Kagua usakinishaji haraka
azd version

# Tengeneza programu yako ya kwanza
azd init --template todo-nodejs-mongo
azd up
```

**💡 Matokeo ya Sura**: Sambaza programu rahisi ya wavuti kwa Azure ukitumia AZD kwa mafanikio

**✅ Uthibitisho wa Mafanikio:**
```bash
# Baada ya kumaliza Sura ya 1, unapaswa kuwa na uwezo wa:
azd version              # Inaonyesha toleo lililowekwa
azd init --template todo-nodejs-mongo  # Inaanzisha mradi
azd up                  # Inaeneza kwenye Azure
azd show                # Inaonyesha URL ya programu inayotumia
# Programu inafunguka kwenye kivinjari na inafanya kazi
azd down --force --purge  # Inasafisha rasilimali
```

**📊 Muda Uliotumika:** Dakika 30-45  
**📈 Kiwango cha Ujuzi Baadaye:** Anaweza kusambaza programu za msingi mwenyewe
**📈 Kiwango cha Ujuzi Baadaye:** Anaweza kusambaza programu za msingi mwenyewe

---

### 🤖 Sura 2: Maendeleo ya AI Kwanza (Inapendekezwa kwa Waendelezaji wa AI)
**Mahitaji ya awali**: Sura 1 imekamilika  
**Muda**: Saa 1-2  
**Ugumu**: ⭐⭐

#### Kile Utakachojifunza
- Muunganisho wa Microsoft Foundry na AZD
- Kusambaza programu zenye nguvu ya AI
- Kuelewa usanidi wa huduma za AI

#### Rasilimali za Kujifunza
- **🎯 Anza Hapa**: [Muunganisho wa Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Wakala wa AI**: [Mwongozo wa Wakala wa AI](docs/chapter-02-ai-development/agents.md) - Sambaza wakala wenye akili kwa kutumia AZD
- **📖 Mifumo**: [Usambazaji wa Mfano wa AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Sambaza na simamia mifano ya AI
- **🛠️ Warsha**: [Maabara ya Warsha ya AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Fanya suluhisho zako za AI ziwe tayari kwa AZD
- **🎥 Mwongozo wa Mwingiliano**: [Vifaa vya Warsha](workshop/README.md) - Kujifunza kupitia kivinjari kwa MkDocs * Mazingira ya DevContainer
- **📋 Templeti**: [Templeti za Microsoft Foundry](#vyanzo-vya-warsha)
- **📝 Mifano**: [Mifano ya Usambazaji ya AZD](examples/README.md)

#### Mazoezi ya Kivitendo
```bash
# Tumia programu yako ya AI ya kwanza
azd init --template azure-search-openai-demo
azd up

# Jaribu templeti za ziada za AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Matokeo ya Sura**: Sambaza na usanidi wa programu ya mazungumzo yenye nguvu ya AI yenye uwezo wa RAG

**✅ Uthibitisho wa Mafanikio:**
```bash
# Baada ya Sura ya 2, unapaswa kuwa na uwezo wa:
azd init --template azure-search-openai-demo
azd up
# Jaribu kiolesura cha mazungumzo cha AI
# Uliza maswali na upate majibu yanayotolewa na AI ikiwa na vyanzo
# Thibitisha kuunganishwa kwa utaftaji kunafanya kazi
azd monitor  # Angalia Application Insights inaonyesha data za ufuatiliaji
azd down --force --purge
```

**📊 Muda Uliotumika:** Saa 1-2  
**📈 Kiwango cha Ujuzi Baadaye:** Anaweza kusambaza na kusanidi programu za AI tayari kwa uzalishaji  
**💰 Uelewa wa Gharama:** Elewa gharama za maendeleo $80-150/kwa mwezi, gharama za uzalishaji $300-3500/kwa mwezi

#### 💰 Mawazo Kuhusu Gharama za Usambazaji wa AI

**Mazingaombwe ya Maendeleo (Makadirio $80-150/kwa mwezi):**
- Mifano ya Microsoft Foundry (Lipa unavyotumia): $0-50/kwa mwezi (kutegemea matumizi ya tokeni)
- Utafutaji wa AI (Ngazi ya Msingi): $75/kwa mwezi
- Programu za Kontena (Matumizi): $0-20/kwa mwezi
- Hifadhi (Kawaida): $1-5/kwa mwezi

**Mazingaombwe ya Uzalishaji (Makadirio $300-3,500+/kwa mwezi):**
- Mifano ya Microsoft Foundry (PTU kwa utendaji thabiti): $3,000+/kwa mwezi AU Lipa unavyotumia kwa kiwango kikubwa
- Utafutaji wa AI (Ngazi ya Kawaida): $250/kwa mwezi
- Programu za Kontena (Zimejitoa): $50-100/kwa mwezi
- Uchambuzi wa Programu: $5-50/kwa mwezi
- Hifadhi (Premium): $10-50/kwa mwezi

**💡 Vidokezo vya Ukaguzi wa Gharama:**
- Tumia **Ngazi ya Bure** ya Mifano ya Microsoft Foundry kwa kujifunza (Azure OpenAI tokens 50,000 kwa mwezi ziko pamoja)
- Endesha `azd down` ili kuondoa rasilimali wakati huendiendelei kikamilifu
- Anza kwa malipo kulingana na matumizi, boresha hadi PTU tu kwa uzalishaji
- Tumia `azd provision --preview` kukadiria gharama kabla ya usambazaji
- Washa upanuzi wa moja kwa moja: l **ipa kwa matumizi halisi tu

**Ufuatiliaji wa Gharama:**
```bash
# Angalia makadirio ya gharama za kila mwezi
azd provision --preview

# Angalia gharama halisi katika Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Sura 3: Usanidi & Utiifu
**Mahitaji ya awali**: Sura 1 imekamilika  
**Muda**: Dakika 45-60  
**Ugumu**: ⭐⭐

#### Kile Utakachojifunza
- Usanidi na usimamizi wa mazingira
- Mbinu bora za uthibitishaji na usalama
- Kutoa majina ya rasilimali na upangaji

#### Rasilimali za Kujifunza
- **📖 Usanidi**: [Mwongozo wa Usanidi](docs/chapter-03-configuration/configuration.md) - Usanidi wa mazingira
- **🔐 Usalama**: [Mifumo ya uthibitishaji na utambulisho unaosimamiwa](docs/chapter-03-configuration/authsecurity.md) - Mifumo ya uthibitishaji
- **📝 Mifano**: [Mfano wa Programu ya Database](examples/database-app/README.md) - Mifano ya AZD ya Database

#### Mazoezi ya Kivitendo
- Sanidi mazingira mengi (dev, staging, prod)
- Weka uthibitishaji wa utambulisho unaosimamiwa
- Tekeleza usanidi maalum wa mazingira

**💡 Matokeo ya Sura**: Simamia mazingira mengi kwa uthibitishaji na usalama sahihi

---

### 🏗️ Sura 4: Miundombinu kama Msimbo & Usambazaji
**Mahitaji ya awali**: Sura 1-3 zimekamilika  
**Muda**: Saa 1-1.5  
**Ugumu**: ⭐⭐⭐

#### Kile Utakachojifunza
- Mifumo ya kuendeleza usambazaji wa hali ya juu
- Miundombinu kama Msimbo kwa kutumia Bicep
- Mikakati ya upangaji wa rasilimali

#### Rasilimali za Kujifunza
- **📖 Usambazaji**: [Mwongozo wa Usambazaji](docs/chapter-04-infrastructure/deployment-guide.md) - Mchakato kamili
- **🏗️ Upangaji**: [Upangaji wa Rasilimali](docs/chapter-04-infrastructure/provisioning.md) - Usimamizi wa rasilimali za Azure
- **📝 Mifano**: [Mfano wa Programu ya Kontena](../../examples/container-app) - Usambazaji wa programu zilizo kwenye kontena

#### Mazoezi ya Kivitendo
- Unda templeti za Bicep zilizobinafsishwa
- Sambaza programu zenye huduma nyingi
- Tekeleza mikakati ya usambazaji wa blue-green

**💡 Matokeo ya Sura**: Sambaza programu tata zenye huduma nyingi ukitumia templeti za miundombinu zilizobinafsishwa

---


### 🎯 Sura ya 5: Suluhisho za AI za Wakala Wengi (Juu)
**Mahitaji**: Imekamilika Sura 1-2  
**Muda**: Saa 2-3  
**Ugumu**: ⭐⭐⭐⭐

#### Utajifunza Nini
- Mifumo ya usanifu wa wakala wengi
- Uratibu na usimamizi wa mawakala
- Ugawaji wa AI tayari kwa uzalishaji

#### Vyanzo vya Kujifunza
- **🤖 Mradi Maarufu**: [Suluhisho la Wakala Wengi la Rejareja](examples/retail-scenario.md) - Utekelezaji kamili
- **🛠️ Kiolezo cha ARM**: [Kifuniko cha Kiolezo cha ARM](../../examples/retail-multiagent-arm-template) - Ugawaji kwa bonyeza moja
- **📖 Usanifu**: [Mifumo ya uratibu wa wakala wengi](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mifumo

#### Mazoezi ya Kivitendo
```bash
# Sambaza suluhisho kamili la mawakala wengi wa rejareja
cd examples/retail-multiagent-arm-template
./deploy.sh

# Chunguza mipangilio ya wakala
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Matokeo ya Sura**: Sambaza na simamia suluhisho la AI la wakala wengi lililoko tayari kwa uzalishaji likiwa na mawakala wa Mteja na Hesabu

---

### 🔍 Sura ya 6: Uthibitishaji na Mipango Kabla ya Ugawaji
**Mahitaji**: Sura 4 imekamilika  
**Muda**: Saa 1  
**Ugumu**: ⭐⭐

#### Utajifunza Nini
- Mipango ya uwezo na uthibitishaji wa rasilimali
- Mikakati ya kuchagua SKU
- Ukaguzi kabla ya kuanza na uendeshaji wa otomatiki

#### Vyanzo vya Kujifunza
- **📊 Mipango**: [Mipango ya Uwezo](docs/chapter-06-pre-deployment/capacity-planning.md) - Uthibitishaji wa rasilimali
- **💰 Uchaguzi**: [Uchaguzi wa SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Chaguo la gharama nafuu
- **✅ Uthibitishaji**: [Ukaguzi wa Kabla ya Kuanzisha](docs/chapter-06-pre-deployment/preflight-checks.md) - Skripti zinazojitegemea

#### Mazoezi ya Kivitendo
- Endesha skripti za uthibitishaji wa uwezo
- Boresha uchaguzi wa SKU kulingana na gharama
- Tekeleza ukaguzi wa otomatiki kabla ya ugawaji

**💡 Matokeo ya Sura**: Thibitisha na boresha ugawaji kabla ya utekelezaji

---

### 🚨 Sura ya 7: Utatuzi wa Matatizo na Urekebishaji
**Mahitaji**: Sura yoyote ya ugawaji imekamilika  
**Muda**: Saa 1-1.5  
**Ugumu**: ⭐⭐

#### Utajifunza Nini
- Mbinu za urekebishaji wa kimfumo
- Matatizo ya kawaida na suluhisho
- Utatuzi maalum wa AI

#### Vyanzo vya Kujifunza
- **🔧 Matatizo ya Kawaida**: [Matatizo ya Kawaida](docs/chapter-07-troubleshooting/common-issues.md) - Maswali yanayoulizwa mara kwa mara na suluhisho
- **🕵️ Urekebishaji**: [Mwongozo wa Urekebishaji](docs/chapter-07-troubleshooting/debugging.md) - Mikakati hatua kwa hatua
- **🤖 Matatizo ya AI**: [Utatuzi Maalum wa AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Matatizo ya huduma za AI

#### Mazoezi ya Kivitendo
- Tambua makosa ya ugawaji
- Rekebisha matatizo ya uthibitishaji
- Rekebisha muunganisho wa huduma za AI

**💡 Matokeo ya Sura**: Tambua na utatuzi matatizo ya kawaida ya ugawaji kwa uhuru

---

### 🏢 Sura ya 8: Mfumo wa Uzalishaji & Biashara
**Mahitaji**: Sura 1-4 zimekamilika  
**Muda**: Saa 2-3  
**Ugumu**: ⭐⭐⭐⭐

#### Utajifunza Nini
- Mikakati ya ugawaji wa uzalishaji
- Mifumo ya usalama wa biashara
- Ufuatiliaji na ubora wa gharama

#### Vyanzo vya Kujifunza
- **🏭 Uzalishaji**: [Mazingira Bora ya AI kwa Uzalishaji](docs/chapter-08-production/production-ai-practices.md) - Mifumo ya biashara
- **📝 Mifano**: [Mfano wa Microservices](../../examples/microservices) - Mifumo tata
- **📊 Ufuatiliaji**: [Ujumuishaji wa Insights za Programu](docs/chapter-06-pre-deployment/application-insights.md) - Ufuatiliaji

#### Mazoezi ya Kivitendo
- Tekeleza mifumo ya usalama wa biashara
- Weka ufuatiliaji wa kina
- Sambaza uzalishaji kwa utawala sahihi

**💡 Matokeo ya Sura**: Sambaza programu za biashara tayari kwa uzalishaji kwa uwezo kamili

---

## 🎓 Muhtasari wa Warsha: Uzoefu wa Kujifunza kwa Vitendo

> **⚠️ HALI YA WARSHA: Maendeleo Hai**  
> Vifaa vya warsha vinaendelea kutengenezwa na kuboreshwa. Sehemu kuu za moduli zinafanya kazi, lakini baadhi ya sehemu za juu hazijakamilika. Tunaendelea kwa bidii kukamilisha maudhui yote. [Fuatilia maendeleo →](workshop/README.md)

### Vifaa vya Warsha Vinavyoshirikiana
**Kujifunza kwa vitendo kwa kina na vifaa vya kivinjari na mazoezi yaliyopangwa**

Vifaa vyetu vya warsha vina uzoefu wa kujifunza uliobinafsishwa, unaoendana na mtaala wa sura zilizo juu. Warsha hii imejaribiwa kwa kujifunza kwa kasi binafsi na pia vikao vinavyoongozwa na mwalimu.

#### 🛠️ Sifa za Warsha
- **Kiolesura cha Kivinjari**: Warsha kamili iendwayo na MkDocs yenye utafutaji, kunakili, na mandhari
- **Uunganishaji wa GitHub Codespaces**: Mazingira ya maendeleo ya bonyeza moja
- **Njia ya Kujifunza Yaliyopangwa**: Mazoezi yaliyoongozwa ya moduli 8 (jumla ya saa 3-4)
- **Mbinu Inayoendelea**: Utangulizi → Uchaguzi → Uthibitishaji → Uvunjaji → Usanidi → Kubinafsisha → Kufuata → Hitimisho
- **Mazingira ya DevContainer yanayoshirikiana**: Zana na utegemezi uliowekwa awali

#### 📚 Muundo wa Moduli wa Warsha
Warsha inafuata **mbinu ya maendeleo ya moduli 8** inayokupeleka kutoka kugundua hadi ustadi wa ugawaji:

| Moduli | Mada | Utafanya Nini | Muda |
|--------|-------|----------------|----------|
| **0. Utangulizi** | Muhtasari wa Warsha | Elewa malengo ya kujifunza, mahitaji, na muundo wa warsha | Dakika 15 |
| **1. Uchaguzi** | Kugundua Kiolezo | Chunguza kiolezo cha AZD na chagua kiolezo sahihi cha AI kwa tukio lako | Dakika 20 |
| **2. Uthibitishaji** | Sambaza & Thibitisha | Sambaza kiolezo kwa `azd up` na thibitisha mazingira yafanya kazi | Dakika 30 |
| **3. Uvunjaji** | Elewa Muundo | Tumia GitHub Copilot kuchunguza usanifu wa kiolezo, faili za Bicep, na mpangilio wa msimbo | Dakika 30 |
| **4. Usanidi** | Azure.yaml Kwa Undani | Jifunze usanidi wa `azure.yaml`, mizunguko ya maisha, na vigezo vya mazingira | Dakika 30 |
| **5. Kubinafsisha** | Fanya Kuwa Yako | Wezesha AI Search, ufuatiliaji, tathmini, na ubinafsishe kwa tukio lako | Dakika 45 |
| **6. Kufuata** | Safisha | Ondoa rasilimali kwa usalama kwa `azd down --purge` | Dakika 15 |
| **7. Hitimisho** | Hatua Zifuatazo | Pitia mafanikio, dhana kuu, na endelea safari yako ya kujifunza | Dakika 15 |

**Mwendo wa Warsha:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Kuanzisha Warsha
```bash
# Chaguo 1: GitHub Codespaces (Inapendekezwa)
# Bonyeza "Code" → "Create codespace on main" kwenye hazina

# Chaguo 2: Maendeleo ya Ndani
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Fuata maagizo ya usanidi katika workshop/README.md
```

#### 🎯 Matokeo ya Kujifunza ya Warsha
Kwa kukamilisha warsha, washiriki wataweza:
- **Sambaza Programu za AI za Uzalishaji**: Tumia AZD na huduma za Microsoft Foundry
- **Tumia Mifumo ya Wakala Wengi**: Tekeleza suluhisho za mawakala wa AI zilizo ratibiwa
- **Tekeleza Mazoezi Bora ya Usalama**: Sanidi uthibitishaji na udhibiti wa upatikanaji
- **Boresha kwa Upanuzi**: Buni ugawaji wenye gharama nafuu na utendaji mzuri
- **Tatua Matatizo ya Ugawaji**: Rekebisha matatizo ya kawaida kwa uhuru

#### 📖 Vyanzo vya Warsha
- **🎥 Mwongozo wa Kushirikiana**: [Vifaa vya Warsha](workshop/README.md) - Mazingira ya kujifunza kwa kivinjari
- **📋 Maelekezo kwa Moduli**
  - [0. Utangulizi](workshop/docs/instructions/0-Introduction.md) - Muhtasari wa warsha na malengo
  - [1. Uchaguzi](workshop/docs/instructions/1-Select-AI-Template.md) - Tafuta na chagua vilezo vya AI
  - [2. Uthibitishaji](workshop/docs/instructions/2-Validate-AI-Template.md) - Sambaza na thibitisha vilezo
  - [3. Uvunjaji](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Chunguza usanifu wa kiolezo
  - [4. Usanidi](workshop/docs/instructions/4-Configure-AI-Template.md) - Jifunze azure.yaml
  - [5. Kubinafsisha](workshop/docs/instructions/5-Customize-AI-Template.md) - Binafsisha kwa tukio lako
  - [6. Kufuata](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Safisha rasilimali
  - [7. Hitimisho](workshop/docs/instructions/7-Wrap-up.md) - Pitia na hatua zifuatazo
- **🛠️ Maabara ya Warsha ya AI**: [Maabara ya Warsha ya AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Mazoezi ya AI
- **💡 Anza Haraka**: [Mwongozo wa Usanidi wa Warsha](workshop/README.md#quick-start) - Usanidi wa mazingira

**Wanufaika Wanaofaa**: Mafunzo ya kampuni, kozi za vyuo vikuu, kujifunza kwa mwendo binafsi, na bootcamps za waendelezaji.

---

## 📖 Binadamu kwa Kina: Uwezo wa AZD

Zaidi ya mambo ya msingi, AZD hutoa sifa zenye nguvu kwa ugawaji wa uzalishaji:

- **Ugawaji unaotegemea kiolezo** - Tumia vialezo vilivyotengenezwa kwa mifumo ya kawaida ya programu
- **Miundombinu kama Msimbo** - Simamia rasilimali za Azure kwa kutumia Bicep au Terraform  
- **Mtiririko wa kazi uliounganishwa** - Sambaza, andaa, na fuatilia programu bila kizuizi
- **Rahisi kwa waendelezaji** - Imekusudiwa kuongeza ufanisi na uzoefu wa waendelezaji

### **AZD + Microsoft Foundry: Bora kwa Ugawaji wa AI**

**Kwa Nini AZD kwa Suluhisho za AI?** AZD inashughulikia changamoto kuu zinazowakabili waendelezaji wa AI:

- **Vialezo Tayari kwa AI** - Vialezo vilivyosanidiwa kwa Microsoft Foundry Models, Azure AI Services, na mzigo wa ML
- **Ugawaji Salama wa AI** - Mifumo ya usalama kwa huduma za AI, funguo za API, na sehemu za mfano  
- **Mifumo ya AI kwa Uzalishaji** - Mazoezi bora kwa ugawaji wa programu za AI zinazoweza kupanuka na gharama nafuu
- **Mtiririko wa kazi wa AI kuanzia Mwanzo hadi Mwisho** - Kuanzia maendeleo ya mfano hadi ugawaji wa uzalishaji kwa ufuatiliaji sahihi
- **Boresha Gharama** - Mikakati ya kugawanya rasilimali kwa ufanisi na upanuzi wa mzigo wa AI
- **Uunganisho na Microsoft Foundry** - Muunganisho mzuri na katalo ya mfano na sehemu za Microsoft Foundry

---

## 🎯 Maktaba ya Vialezo na Mifano

### Maarufu: Vialezo vya Microsoft Foundry
**Anza hapa ikiwa unasambaza programu za AI!**

> **Kumbuka:** Vialezi hivi vinaonyesha mifumo mbalimbali ya AI. Baadhi ni Mifano ya Azure ya nje, mengine ni utekelezaji wa ndani.

| Kiolezo | Sura | Ugumu | Huduma | Aina |
|----------|---------|------------|----------|------|
| [**Anza na mazungumzo ya AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Sura 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Nje |
| [**Anza na mawakala wa AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Sura 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Nje |
| [**Onyesho la Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Sura 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Nje |
| [**Anza Haraka na App ya Mazungumzo ya OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Sura 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Nje |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Sura 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Nje |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Sura 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Nje |
| [**Suluhisho la Wakala Wengi Rejareja**](examples/retail-scenario.md) | Sura 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Ndani** |

### Maarufu: Mifano Kamili ya Kujifunza
**Vialezo vya programu tayari kwa uzalishaji vilivyoambatanishwa na sura za kujifunza**

| Kiolezo | Sura ya Kujifunza | Ugumu | Jifunze Muhimu |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Sura 2 | ⭐ | Mifumo ya msingi ya ugawaji wa AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Sura 2 | ⭐⭐ | Utekelezaji wa RAG kwa kutumia Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Sura 4 | ⭐⭐ | Ujumuishaji wa Akili ya Hati |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Sura 5 | ⭐⭐⭐ | Mfumo wa wakala na mwito wa kazi |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Sura 8 | ⭐⭐⭐ | Uratibu wa AI wa biashara |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Sura 5 | ⭐⭐⭐⭐ | Usanifu wa wakala wengi na mawakala wa Mteja na Hesabu |

### Kujifunza Kwa Aina ya Mfano

> **📌 Mifano ya Ndani dhidi ya Nje:**  
> **Mifano ya Ndani** (katika hifadhidata hii) = Tayari kutumika mara moja  
> **Mifano ya Nje** (Mifano ya Azure) = Nakili kutoka kwa hifadhidata zilizounganishwa

#### Mifano ya Ndani (Tayari Kutumika)
- [**Suluhisho la Wakala Wengi Rejareja**](examples/retail-scenario.md) - Utekelezaji kamili tayari kwa uzalishaji na vialezo vya ARM
  - Usanifu wa wakala wengi (Mteja + mawakala Hesabu)
  - Ufuatiliaji na tathmini ya kina
  - Ugawaji kwa bonyeza moja kupitia kiolezo cha ARM

#### Mifano ya Ndani - Programu za Kontena (Sura 2-5)
**Mifano kamili ya ugawaji wa kontena katika hifadhidata hii:**

- [**Mifano ya Programu za Kontena**](examples/container-app/README.md) - Mwongozo kamili wa usambazaji wa kontena
  - [API Rahisi ya Flask](../../examples/container-app/simple-flask-api) - REST API ya msingi yenye upanuzi hadi sifuri
  - [Miundo ya Huduma Ndogo](../../examples/container-app/microservices) - Usambazaji wa huduma nyingi tayari kwa uzalishaji
  - Mifumo ya Anza Haraka, Uzalishaji, na Usambazaji wa Juu
  - Mwongozo wa usimamizi, usalama, na uboreshaji wa gharama

#### Mifano ya Nje - Programu Rahisi (Sura 1-2)
**Nakili hizi hazina za sampuli za Azure kuanza:**
- [Programu Rahisi ya Wavuti - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mifumo ya usambazaji ya msingi
- [Tovuti Isiyobadilika - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Usambazaji wa maudhui isiyobadilika
- [Programu ya Kontena - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Usambazaji wa REST API

#### Mifano ya Nje - Uunganishaji wa Hifadhidata (Sura 3-4)  
- [Programu ya Hifadhidata - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mifumo ya uunganishaji wa hifadhidata
- [Fakazi + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Mtiririko wa data usio na seva

#### Mifano ya Nje - Mifumo ya Juu (Sura 4-8)
- [Microservices za Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Miundo ya huduma nyingi
- [Kazi za Programu za Kontena](https://github.com/Azure-Samples/container-apps-jobs) - Usindikaji wa nyuma  
- [Mlolongo wa ML wa Biashara](https://github.com/Azure-Samples/mlops-v2) - Mifumo ya ML tayari kwa uzalishaji

### Mikutano ya Mifano ya Nje
- [**Nyumba ya Mifumo Rasmi ya AZD**](https://azure.github.io/awesome-azd/) - Mkusanyiko uliosafirishwa wa mifumo rasmi na ya jamii
- [**Mifumo ya Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Nyaraka za mifumo za Microsoft Learn
- [**Sarifu za Mifano**](examples/README.md) - Mifano ya ndani ya kujifunza na maelezo ya kina

---

## 📚 Rasilimali za Kujifunza & Marejeleo

### Marejeleo ya Haraka
- [**Kadi ya Amri**](resources/cheat-sheet.md) - Amri muhimu za azd zilizoandaliwa kwa sura
- [**Kamusi**](resources/glossary.md) - Midadi na maneno ya Azure na azd  
- [**Maswali Yanayoulizwa Mara kwa Mara**](resources/faq.md) - Maswali ya kawaida yaliyopangwa kwa sura za kujifunza
- [**Mwongozo wa Somo**](resources/study-guide.md) - Mazoezi kamili ya mazoezi

### Warsha za Mikono
- [**Warsha ya AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Fanya suluhisho zako za AI ziweze kusambazwa kwa AZD (saa 2-3)
- [**Warsha ya Kueleweka**](workshop/README.md) - Mazoezi ya moduli 8 yaliyopangwa na MkDocs na GitHub Codespaces
  - Inafuata: Utangulizi → Uteuzi → Uthibitishaji → Uvunjaji → Mipangilio → Ubadilishaji → Kufunga → Hitimisho

### Rasilimali za Kujifunza Nje
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Kituo cha Miundo ya Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kipimo cha Bei Azure](https://azure.microsoft.com/pricing/calculator/)
- [Hali ya Azure](https://status.azure.com/)

### Ujuzi wa Maajenti wa AI kwa Mhariri Wako
- [**Ujuzi wa Microsoft Azure kwenye skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - Ujuzi 37 wa maajenti wazi kwa AI ya Azure, Foundry, usambazaji, utambuzi, uboreshaji wa gharama, na zaidi. Weka kwenye GitHub Copilot, Cursor, Claude Code, au maajenti yanayoungwa mkono:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Mwongozo wa Haraka wa Ufumbuzi wa Matatizo

**Masuala ya kawaida yanayokumbwa na wanaoanza na suluhisho za papo hapo:**

<details>
<summary><strong>❌ "azd: amri haijapatikana"</strong></summary>

```bash
# Weka AZD kwanza
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
<summary><strong>❌ "Hakuna usajili ulioonekana" au "Usajili haujawekwa"</strong></summary>

```bash
# Orodha ya usajili uliopo
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
<summary><strong>❌ "InsufficientQuota" au "Kiasi kimezidi"</strong></summary>

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
<summary><strong>❌ "azd up" imeshindwa katikati</strong></summary>

```bash
# Chaguo 1: Safisha na jaribu tena
azd down --force --purge
azd up

# Chaguo 2: Rekebisha tu miundombinu
azd provision

# Chaguo 3: Angalia hali ya kina
azd show

# Chaguo 4: Angalia kumbukumbu katika Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Uthibitishaji umeshindikana" au "Msimbo umezama"</strong></summary>

```bash
# Thibitisha upya kwa ajili ya AZD
azd auth logout
azd auth login

# Hiari: fanyia upya Azure CLI pia ikiwa unatumia amri za az
az logout
az login

# Thibitisha uthibitishaji
az account show
```
</details>

<details>
<summary><strong>❌ "Rasilimali tayari ipo" au migongano ya majina</strong></summary>

```bash
# AZD hutengeneza majina ya kipekee, lakini ikiwa kuna mgongano:
azd down --force --purge

# Kisha jaribu tena kwa mazingira mapya
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Usambazaji wa mfumo unachukua muda mwingi</strong></summary>

**Muda wa kawaida wa kungojea:**
- Programu rahisi ya wavuti: dakika 5-10
- Programu na hifadhidata: dakika 10-15
- Programu za AI: dakika 15-25 (Utoaji wa OpenAI ni polepole)

```bash
# Angalia maendeleo
azd show

# Ikiwa umekwama >30 dakika, angalia Azure Portal:
azd monitor --overview
# Tafuta usambazaji ulioishindwa
```
</details>

<details>
<summary><strong>❌ "Ruhusa imekataliwa" au "Imezuiwa"</strong></summary>

```bash
# Angalia nafasi yako ya Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Unahitaji angalau nafasi ya "Mchangiaji"
# Muombe msimamizi wako wa Azure kutoa:
# - Mchangiaji (kwa rasilimali)
# - Msimamizi wa Upatikanaji wa Mtumiaji (kwa upangaji wa nafasi)
```
</details>

<details>
<summary><strong>❌ Haiwezi kupata URL ya programu iliyosambazwa</strong></summary>

```bash
# Onyesha sehemu zote za huduma
azd show

# Au fungua Azure Portal
azd monitor

# Angalia huduma maalum
azd env get-values
# Tafuta vigezo *_URL
```
</details>

### 📚 Rasilimali Kamili za Ufumbuzi wa Matatizo

- **Mwongozo wa Masuala ya Kawaida:** [Suluhisho za Kina](docs/chapter-07-troubleshooting/common-issues.md)
- **Masuala Maalum ya AI:** [Ufumbuzi wa Matatizo ya AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Mwongozo wa Kuchunguza:** [Kuchunguza Hatua kwa Hatua](docs/chapter-07-troubleshooting/debugging.md)
- **Pata Msaada:** [Discord ya Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kumaliza Kozi & Cheti

### Ufuatiliaji wa Maendeleo
Fuata maendeleo yako ya kujifunza kupitia kila sura:

- [ ] **Sura 1**: Msingi & Anza Haraka ✅
- [ ] **Sura 2**: Maendeleo ya AI-Kwanza ✅  
- [ ] **Sura 3**: Mipangilio & Uthibitishaji ✅
- [ ] **Sura 4**: Miundombinu kama Kanuni & Usambazaji ✅
- [ ] **Sura 5**: Suluhisho za Maajenti Wengi wa AI ✅
- [ ] **Sura 6**: Uthibitishaji wa Kabla ya Usambazaji & Mipango ✅
- [ ] **Sura 7**: Ufumbuzi wa Matatizo & Kuchunguza ✅
- [ ] **Sura 8**: Miundo ya Uzalishaji & Biashara ✅

### Uthibitisho wa Kujifunza
Baada ya kumaliza kila sura, hakiki maarifa yako kwa:
1. **Mazoezi ya Kivitendo**: Kamilisha usambazaji wa mikono wa sura
2. **Mtihani wa Maarifa**: Pitia sehemu ya Maswali Yanayoulizwa Mara kwa Mara ya sura yako
3. **Majadiliano ya Jamii**: Shiriki uzoefu wako katika Discord ya Azure
4. **Sura Ifuatayo**: Hamia kwenye ngazi inayofuata ya ugumu

### Manufaa ya Kumaliza Kozi
Ukimaliza sura zote, utakuwa na:
- **Uzoefu wa Uzalishaji**: Programu halisi za AI zilizowekwa kwenye Azure
- **Ujuzi wa Kitaalamu**: Uwezo wa usambazaji tayari kwa biashara  
- **Kutambuliwa na Jamii**: Mwanachama hai wa jamii ya waendelezaji wa Azure
- **Kuendeleza Kazi**: Ujuzi unaohitajika wa usambazaji wa AZD na AI

---

## 🤝 Jamii & Msaada

### Pata Msaada & Msaada
- **Matatizo ya Kiufundi**: [Ripoti mende na omba vipengele](https://github.com/microsoft/azd-for-beginners/issues)
- **Maswali ya Kujifunza**: [Jamii ya Discord ya Microsoft Azure](https://discord.gg/microsoft-azure) na [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Msaada Maalum wa AI**: Jiunge na [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Nyaraka**: [Nyaraka Rasmi za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Maarifa ya Jamii kutoka Microsoft Foundry Discord

**Matokeo ya Kura ya hivi karibuni kutoka #Azure Channel:**
- **45%** ya waendelezaji wanataka kutumia AZD kwa mzigo wa AI
- **Changamoto kuu**: Usambazaji wa huduma nyingi, usimamizi wa cheti, maandalizi ya uzalishaji  
- **Yaliyotakiwa zaidi**: Mifumo maalum ya AI, miongozo ya ufumbuzi wa matatizo, mbinu bora

**Jiunge na jamii yetu ili:**
- Shiriki uzoefu wako wa AZD + AI na pata msaada
- Pata mapokezi ya mapema ya mifumo mipya ya AI
- Changia mbinu bora za usambazaji wa AI
- Kuathiri maendeleo ya sifa za AI + AZD zijazo

### Kuchangia Kozi
Tunakaribisha michango! Tafadhali soma [Mwongozo wa Michango](CONTRIBUTING.md) kwa maelezo kuhusu:
- **Uboreshaji wa Maudhui**: Boreshaji wa sura na mifano iliyopo
- **Mifano Mpya**: Ongeza matukio halisi na mifumo  
- **Tafsiri**: Saidia kudumisha msaada wa lugha nyingi
- **Ripoti za Mende**: Boresha usahihi na uwazi
- **Viwango vya Jamii**: Fuata miongozo yetu jumuishi ya jamii

---

## 📄 Taarifa za Kozi

### Leseni
Mradi huu umeidhinishwa chini ya Leseni ya MIT - tazama faili la [LICENSE](../../LICENSE) kwa maelezo.

### Rasilimali za Kujifunza Zinazohusiana na Microsoft

Timu yetu hutoa kozi zingine kamili za kujifunza:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j kwa Waanziaji](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js kwa Waanziaji](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain kwa Waanziaji](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Maajenti
[![AZD kwa Waanziaji](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI kwa Waanziaji](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP kwa Waanziaji](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Maajenti wa AI kwa Waanziaji](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Mfululizo wa AI Zaizozalisha
[![AI Zaizozalisha kwa Waanziaji](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Zaizozalisha (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI Zaizozalisha (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kujifunza Msingi
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Mfululizo wa Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Uelekezaji wa Kozi

**🚀 Tayari Kuanzia Kujifunza?**

**Waanzilishi**: Anza na [Sura ya 1: Msingi na Anza Haraka](#-chapter-1-foundation--quick-start)  
**Waendelezaji AI**: Ruka hadi [Sura ya 2: Maendeleo ya AI Kwanza](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Waendelezaji Wenye Uzoefu**: Anza na [Sura ya 3: Usanidi na Uthibitishaji](#️-chapter-3-configuration--authentication)

**Hatua Zifuatazo**: [Anza Sura 1 - Misingi ya AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->