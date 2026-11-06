# AZD Pradedantiesiems: Struktūruota mokymosi kelionė

![AZD-for-beginners](../../translated_images/lt/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiniai vertimai (Visada naujausi)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](./README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Manipuri (Meitei Mayek)](../mni/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Norite klonuoti vietoje?**
>
> Šis saugykla apima daugiau nei 50 kalbų vertimų, dėl ko gerokai padidėja atsisiuntimo dydis. Norėdami klonuoti be vertimų, naudokite sparse checkout:
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
> Tai suteikia viską, ko reikia kurso užbaigimui su daug greitesniu atsisiuntimu.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Kas naujo šiandien azd

> 📌 Šis kursas patikrintas su **`azd 1.27.1`** (2026 m. liepa). Paleiskite `azd version`, kad patikrintumėte savo versiją, ir `azd upgrade`, kad gautumėte naujausią.

Azure Developer CLI išaugo toliau nei tradicinės žiniatinklio programos ir API. Šiandien azd yra vienintelis įrankis bet kurios programos diegimui Azure — įskaitant dirbtiniu intelektu valdomas programas ir intelektualius agentus.

Štai ką tai reiškia jums:

- **DI agentai dabar yra pirmos klasės azd užduotys.** Galite inicijuoti, diegti ir valdyti DI agentų projektus naudodami tą patį `azd init` → `azd up` darbo eigą, kurią jau pažįstate.
- **Pilnas agento gyvavimo ciklas iš CLI.** Dabar `azure.ai.agents` plėtinys apima visą kelią—`azd ai agent init` kuriant, `azd ai agent invoke` testuojant (su atsako laiko išvestimi), `azd ai agent eval generate` ir `azd ai agent optimize` kokybės matavimui ir gerinimui, bei `azd ai agent delete` švarinimui.
- **Daugiau AI sudedamųjų dalių.** Nauji peržiūros plėtiniai—`azure.ai.skills` ir `azure.ai.connections`—leidžia tiesiogiai valdyti dauginamus agentų įgūdžius ir Foundry jungtis per azd.
- **Microsoft Foundry integracija** įtraukia modelio diegimą, agentų hostinimą ir AI paslaugų konfigūravimą tiesiog į azd šablonų ekosistemą.
- **Sklandesni kasdieniai pagrindai.** Naujausi leidimai padarė `azd init` idempotentinį (saugų pakartotinai paleisti), automatiškai išvalė pasenusius `azd auth login` žetonus, ir pridėjo draugišką `azd tool` pirmo paleidimo sąrankos raginimą.
- **Pagrindinis darbo procesas nepasikeitė.** Nesvarbu ar diegiate užduočių programėlę, mikroservisą ar daugiagentinį AI sprendimą, komandos išlieka tos pačios.

> **Pastaba Aspire naudotojams:** Microsoft dabar produktą vadina tiesiog **Aspire** (anksčiau „.NET Aspire“). azd Aspire palaikymas nesikeitė—tik pavadinimas atnaujintas.

Jei naudojote azd anksčiau, AI palaikymas yra natūrali plėtra—ne atskiras įrankis ar pažengusiųjų sritis. Jei pradedate naujai, išmoksite vieną darbo procesą, tinkantį viskam.

---

## 🚀 Kas yra Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** yra kūrėjams draugiškas komandų eilutės įrankis, leidžiantis paprastai diegti programas į Azure. Vietoj to, kad rankiniu būdu kurtumėte ir jungtumėte dešimtis Azure išteklių, galite diegti visą programą su viena komanda.

### Magija už `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

**Viskas!** Nereikia spustelėti Azure portale, nereikia pirmiausia mokytis sudėtingų ARM šablonų, nėra rankinio konfigūravimo - tiesiog veikiantys programos Azure platformoje.

---

## ❓ Azure Developer CLI vs Azure CLI: Kurie skirtumai?

Tai dažniausias klausimas, kurį užduoda pradedantieji. Čia yra paprastas atsakymas:

| Funkcija | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Paskirtis** | Valdyti atskirus Azure išteklius | Diegti pilnas programas |
| **Mąstymas** | Infrastruktūra orientuotas | Programa orientuotas |
| **Pavyzdys** | `az webapp create --name myapp...` | `azd up` |
| **Mokymosi kreivė** | Privalote žinoti Azure paslaugas | Tiesiog žinokite savo programą |
| **Geriau tinka** | DevOps, infrastruktūra | Kūrėjai, prototipavimas |

### Paprasta analogija

- **Azure CLI** yra kaip turėti visus įrankius namui statyti – plaktukai, pjūklai, vinys. Galite pastatyti bet ką, bet turite išmanyti statybą.
- **Azure Developer CLI** yra kaip samdyti rangovą – jūs aprašote, ko norite, o jis atlieka statybą.

### Kada naudoti kurią?

| Scenarijus | Naudokite šį įrankį |
|----------|----------|
| "Noriu greitai diegti savo žiniatinklio programą" | `azd up` |
| "Man reikia sukurti tik saugyklos paskyrą" | `az storage account create` |
| "Aš kuriu pilną DI programėlę" | `azd init --template azure-search-openai-demo` |
| "Man reikia derinti konkretų „Azure“ išteklių" | `az resource show` |
| "Noriu gamybai paruošto diegimo per kelias minutes" | `azd up --environment production` |

### Jie veikia kartu!

AZD po gaubtu naudoja Azure CLI. Galite naudoti abu šiuos įrankius:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Raskite Šablonus „Awesome AZD“

Nesiženkite nuo nulio! **Awesome AZD** yra bendruomenės kolekcija paruoštų diegti šablonų:

| Išteklius | Aprašymas |
|----------|-------------|
| 🔗 [**Awesome AZD galerija**](https://azure.github.io/awesome-azd/) | Naršykite daugiau nei 200 šablonų su vieno paspaudimo diegimu |
| 🔗 [**Pateikite šabloną**](https://github.com/Azure/awesome-azd/issues) | Prisidėkite savo šablonu bendruomenei |
| 🔗 [**GitHub saugykla**](https://github.com/Azure/awesome-azd) | Suteikite žvaigždutę ir tyrinėkite šaltinį |

### Populiarūs AI šablonai iš Awesome AZD

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Pradėkite per 3 žingsnius

Prieš pradėdami įsitikinkite, kad jūsų mašina paruošta šablonui, kurį norite diegti:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jei kuris nors būtinas patikrinimas nepavyksta, ištaisykite tai pirmiausia ir tada tęskite greitą startą.

### 1 žingsnis: Įdiekite AZD (2 minutės)

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

### 2 žingsnis: Autentifikuokitės AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Jei nesate tikri, kurio jums reikia, sekite visą nustatymo eigą [Diegimas ir Nustatymas](docs/chapter-01-foundation/installation.md#authentication-setup).

### 3 žingsnis: Įdiekite pirmąją savo programą

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Štai ir viskas!** Jūsų programa dabar gyvai veikia Azure.

### Išvalykite (Neužmirškite!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kaip naudotis šiuo kursu

Šis kursas sukurtas **progresyviam mokymuisi** – pradėkite nuo to, ką mokate, ir žengdami aukštyn tobulėkite:

| Jūsų patirtis | Pradėkite čia |
|-----------------|------------|
| **Visai naujas Azure** | [1 skyrius: Pagrindai](#-chapter-1-foundation--quick-start) |
| **Žinote Azure, naujas AZD** | [1 skyrius: Pagrindai](#-chapter-1-foundation--quick-start) |
| **Norite diegti AI programas** | [2 skyrius: AI-pirmiausia kūrimas](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Norite praktikuotis praktiškai** | [🎓 Interaktyvi dirbtuvė](workshop/README.md) - 3-4 valandų vedama laboratorija |
| **Reikia gamybos modelių** | [8 skyrius: Gamyba ir verslas](#-chapter-8-production--enterprise-patterns) |

### Greitas paruošimas

1. **Atšakokite šią saugyklą**: [![GitHub forknai](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonuokite ją**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Gaunate pagalbą**: [Azure Discord bendruomenė](https://discord.com/invite/ByRwuEEgH4)

> **Verčiau klonuoti vietoje?**

> Ši repozitorija apima daugiau nei 50 kalbų vertimų, kurie žymiai padidina atsisiuntimo dydį. Norint klonuoti be vertimų, naudokite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Tai suteikia viską, ko reikia kursui užbaigti, su daug greitesniu atsisiuntimu.


## Kurso apžvalga

Išmokite Azure Developer CLI (azd) per struktūrizuotus skyrius, skirtus palaipsniui mokytis. **Specialus dėmesys AI taikomųjų programų diegimui su Microsoft Foundry integracija.**

### Kodėl šis kursas yra svarbus šiuolaikiniams kūrėjams

Remiantis Microsoft Foundry Discord bendruomenės įžvalgomis, **45% kūrėjų nori naudoti AZD AI darbo krūviams**, tačiau susiduria su iššūkiais:
- Sudėtingos kelių paslaugų AI architektūros
- Gerosios praktikos gamybiniam AI diegimui  
- Azure AI paslaugų integracija ir konfigūravimas
- AI darbo krūvių sąnaudų optimizavimas
- AI specifinių diegimo problemų šalinimas

### Mokymosi tikslai

Baigę šį struktūrizuotą kursą, jūs:
- **Įvaldysite AZD pagrindus**: Pagrindines sąvokas, diegimą ir konfigūravimą
- **Įdiegsite AI taikomąsias programas**: Naudojant AZD su Microsoft Foundry paslaugomis
- **Įgyvendinkite infrastruktūrą kaip kodą**: Tvarkykite Azure išteklius naudodami Bicep šablonus
- **Spręskite diegimo problemas**: Išspręskite dažniausias problemas ir triktis
- **Optimizuokite gamybai**: Saugumas, mastelio keitimas, stebėsena ir kaštų valdymas
- **Kurti daugiaveiksmes sprendimus**: Diegti sudėtingas DI architektūras

## Prieš pradėdami: Paskyros, prieiga ir prielaidų patikrinimas

Prieš pradėdami 1 skyrių, įsitikinkite, kad turite šiuos dalykus. Vėlesni diegimo veiksmai šiame vadove prielaida, kad šie pagrindai jau yra sutvarkyti.

- **Azure prenumerata**: Galite naudoti esamą darbo ar savo paskyros prenumeratą arba sukurti [nemokamą bandomąją versiją](https://aka.ms/azurefreetrial) pradžiai.
- **Leidimas kurti Azure išteklius**: Daugumai užduočių turėtumėte turėti bent **Bendradarbio** prieigą prie paskyros ar išteklių grupės. Kai kurie skyriai gali manyti, kad galite kurti išteklių grupes, valdomas tapatybes ir RBAC priskyrimus.
- [**GitHub paskyra**](https://github.com): Tai naudinga depo šakų kūrimui, savo pakeitimų sekimui ir GitHub Codespaces naudojimui mokymams.
- **Šablonų vykdymo prielaidos**: Kai kurie šablonai reikalauja vietinių įrankių, tokių kaip Node.js, Python, Java ar Docker. Paleiskite paruošimo tikrintuvą prieš pradedant, kad anksti pastebėtumėte trūkstamus įrankius.
- **Pagrindinės terminalo žinios**: Nereikia būti ekspertu, bet turėtumėte gebėti patogiai vykdyti tokias komandas kaip `git clone`, `azd auth login`, ir `azd up`.

> **Dirbate įmonės prenumeratoje?**
> Jei jūsų Azure aplinką valdo administratorius, iš anksto patikrinkite, ar galite diegti išteklius paskyroje ar išteklių grupėje, kurią planuojate naudoti. Jei negalite, paprašykite smėlio dėžės prenumeratos arba Bendradarbio prieigos prieš pradedant.

> **Naujas Azure naudotojas?**
> Pradėkite nuo savo Azure bandomosios ar mokėk už naudojimą prenumeratos adresu https://aka.ms/azurefreetrial, kad galėtumėte užbaigti pratimus nuo pradžios iki pabaigos nelaukdami nuomininko lygio patvirtinimų.

## 🗺️ Kurso schema: Greita navigacija pagal skyrių

Kiekvienas skyrius turi atskirą README su mokymosi tikslais, greitais pradžios žingsniais ir pratimais:

| Skyrius | Tema | Pamokos | Trukmė | Sudėtingumas |
|---------|-------|---------|----------|------------|
| **[1 skyrius: Pagrindai](docs/chapter-01-foundation/README.md)** | Pradžia | [AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) &#124; [Įdiegimas](docs/chapter-01-foundation/installation.md) &#124; [Pirmas projektas](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[2 skyrius: DI kūrimas](docs/chapter-02-ai-development/README.md)** | DI pirmiau programėlės | [Foundry integracija](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [DI agentai](docs/chapter-02-ai-development/agents.md) &#124; [Modelio diegimas](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Dirbtuvės](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 val | ⭐⭐ |
| **[3 skyrius: Konfigūracija](docs/chapter-03-configuration/README.md)** | Autentifikacija ir saugumas | [Konfigūracija](docs/chapter-03-configuration/configuration.md) &#124; [Autentifikacija ir saugumas](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[4 skyrius: Infrastruktūra](docs/chapter-04-infrastructure/README.md)** | IaC & diegimas | [Diegimo vadovas](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Apžvalga](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 val | ⭐⭐⭐ |
| **[5 skyrius: Daugiaveiksmių sprendimai](docs/chapter-05-multi-agent/README.md)** | DI agentų sprendimai | [Mažmeninės prekybos scenarijus](examples/retail-scenario.md) &#124; [Koordinavimo modeliai](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 val | ⭐⭐⭐⭐ |
| **[6 skyrius: Prieš diegimą](docs/chapter-06-pre-deployment/README.md)** | Planavimas ir tikrinimas | [Patikrinimai prieš skrydį](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Talpos planavimas](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU parinkimas](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 val | ⭐⭐ |
| **[7 skyrius: Problemų sprendimas](docs/chapter-07-troubleshooting/README.md)** | Derinimas ir taisymas | [Dažnos problemos](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Derinimas](docs/chapter-07-troubleshooting/debugging.md) &#124; [DI problemos](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 val | ⭐⭐ |
| **[8 skyrius: Gamyba](docs/chapter-08-production/README.md)** | Įmonių modeliai | [Gamybinės praktikos](docs/chapter-08-production/production-ai-practices.md) | 2-3 val | ⭐⭐⭐⭐ |
| **[🎓 Dirbtuvės](workshop/README.md)** | Praktinis laboratorinis darbas | [Įvadas](workshop/docs/instructions/0-Introduction.md) &#124; [Pasirinkimas](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deformavimas](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigūracija](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Individualizavimas](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Išardymas](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Apibendrinimas](workshop/docs/instructions/7-Wrap-up.md) | 3-4 val | ⭐⭐ |

**Viso kurso trukmė:** ~10-14 val | **Įgūdžių pažanga:** Pradedantysis → Paruoštas gamybai

---

## 📚 Mokymosi skyriai

*Pasirinkite savo mokymosi kelią pagal patirties lygį ir tikslus*

### 🚀 1 skyrius: Pagrindai ir greitas startas
**Reikalavimai**: Azure prenumerata, pagrindinės komandinės eilutės žinios  
**Trukmė**: 30-45 minutės  
**Sudėtingumas**: ⭐

#### Ką išmoksite
- Azure Developer CLI pagrindų supratimas
- AZD įdiegimas jūsų platformoje
- Jūsų pirmas sėkmingas diegimas

#### Mokymosi ištekliai
- **🎯 Pradėkite čia**: [Kas yra Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorija**: [AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) - Pagrindinės koncepcijos ir terminai
- **⚙️ Įdiegimas**: [Diegimas ir paruošimas](docs/chapter-01-foundation/installation.md) - Platformos specifinės instrukcijos
- **🛠️ Praktika**: [Jūsų pirmas projektas](docs/chapter-01-foundation/first-project.md) - žingsnis po žingsnio pamoka
- **📋 Greita referencija**: [Komandų greitosios naudojimo instrukcijos](resources/cheat-sheet.md)

#### Praktinės užduotys
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Skyrių rezultatas**: Sėkmingai diegti paprastą žiniatinklio programą į Azure naudodami AZD

**✅ Sėkmės patikrinimas:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Laiko sąnaudos:** 30-45 minutės  
**📈 Įgūdžių lygis po to:** Geba savarankiškai diegti pagrindines programas
**📈 Įgūdžių lygis po to:** Geba savarankiškai diegti pagrindines programas

---

### 🤖 2 skyrius: DI pirmiausia kūrimas (Rekomenduojama DI kūrėjams)
**Reikalavimai**: Baigtas 1 skyrius  
**Trukmė**: 1-2 valandos  
**Sudėtingumas**: ⭐⭐

#### Ką išmoksite
- Microsoft Foundry integracija su AZD
- DI programėlių diegimas
- DI paslaugų konfigūracijų supratimas

#### Mokymosi ištekliai
- **🎯 Pradėkite čia**: [Microsoft Foundry integracija](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 DI agentai**: [DI agentų vadovas](docs/chapter-02-ai-development/agents.md) - Protingų agentų diegimas su AZD
- **📖 Modeliai**: [DI modeliavimo diegimas](docs/chapter-02-ai-development/ai-model-deployment.md) - DI modelių diegimas ir valdymas
- **🛠️ Dirbtuvės**: [DI dirbtuvių laboratorija](docs/chapter-02-ai-development/ai-workshop-lab.md) - Paruoškite savo DI sprendimus AZD
- **🎥 Interaktyvus vadovas**: [Dirbtuvių medžiaga](workshop/README.md) - Mokymasis naršyklėje su MkDocs * DevContainer aplinka
- **📋 Šablonai**: [Microsoft Foundry šablonai](#featured-microsoft-foundry-templates)
- **📝 Pavyzdžiai**: [AZD diegimo pavyzdžiai](examples/README.md)

#### Praktinės užduotys
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Skyrių rezultatas**: Diegti ir konfigūruoti DI pagrindu veikiančią pokalbių programą su RAG funkcionalumu

**✅ Sėkmės patikrinimas:**
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

**📊 Laiko sąnaudos:** 1-2 valandos  
**📈 Įgūdžių lygis po to:** Geba diegti ir konfigūruoti gamybai tinkamas DI programas  
**💰 Kaštų suvokimas:** Supranta $80-150/mėn kūrimo išlaidas, $300-3500/mėn gamybos išlaidas

#### 💰 Kaštų svarstymai DI diegimams

**Kūrimo aplinka (apytikriai $80-150/mėn):**
- Microsoft Foundry modeliai (mokestis pagal panaudoto token skaičių): $0-50/mėn (pagal naudojimą)
- DI paieška (pagrindinis lygis): $75/mėn
- Container Apps (vartojimu grįsti): $0-20/mėn
- Saugykla (standartinė): $1-5/mėn

**Gamybinė aplinka (apytikriai $300-3,500+/mėn):**
- Microsoft Foundry modeliai (PTU – nuosekliam našumui): $3,000+/mėn ARBA Mokestis pagal naudojimą su dideliu apimčiu
- DI paieška (standartinis lygis): $250/mėn
- Container Apps (dedikuoti): $50-100/mėn
- Application Insights: $5-50/mėn
- Saugykla (premium): $10-50/mėn

**💡 Kaštų optimizavimo patarimai:**
- Naudokite **Nemokamą lygį** Microsoft Foundry modeliams mokymuisi (Azure OpenAI įtraukia 50,000 tokenų/mėn)
- Paleiskite `azd down`, kad atjungtumėte išteklius, kai nevystote aktyviai
- Pradėkite nuo vartojimu pagrįsto apmokėjimo, PTU naudokite tik gamyboje
- Naudokite `azd provision --preview` kad įvertintumėte kaštus prieš diegiant
- Įjunkite automatinį mastelio keitimą: mokėkite tik už faktinį naudojimą

**Kaštų stebėsena:**
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3 skyrius: Konfigūracija ir autentifikacija
**Reikalavimai**: Baigtas 1 skyrius  
**Trukmė**: 45-60 minučių  
**Sudėtingumas**: ⭐⭐

#### Ką išmoksite
- Aplinkos konfigūravimas ir valdymas
- Autentifikacijos ir saugumo geriausios praktikos
- Išteklių pavadinimų ir organizavimo tvarkymas

#### Mokymosi ištekliai
- **📖 Konfigūracija**: [Konfigūracijos vadovas](docs/chapter-03-configuration/configuration.md) - Aplinkos nustatymai
- **🔐 Saugumas**: [Autentifikacijos modeliai ir valdomos tapatybės](docs/chapter-03-configuration/authsecurity.md) - Autentifikacijos modeliai
- **📝 Pavyzdžiai**: [Duomenų bazės programėlės pavyzdys](examples/database-app/README.md) - AZD duomenų bazės pavyzdžiai

#### Praktinės užduotys
- Konfigūruokite kelias aplinkas (kūrimo, pristatymo, gamybos)
- Nustatykite valdomos tapatybės autentifikaciją
- Įgyvendinkite aplinkai specifines konfigūracijas

**💡 Skyrių rezultatas**: Valdykite kelias aplinkas su tinkama autentifikacija ir saugumu

---

### 🏗️ 4 skyrius: Infrastruktūra kaip kodas ir diegimas
**Reikalavimai**: Baigti 1-3 skyrius  
**Trukmė**: 1-1.5 valandos  
**Sudėtingumas**: ⭐⭐⭐

#### Ką išmoksite
- Pažangūs diegimo modeliai
- Infrastruktūra kaip kodas naudojant Bicep
- Išteklių teikimo strategijos

#### Mokymosi ištekliai
- **📖 Diegimas**: [Diegimo vadovas](docs/chapter-04-infrastructure/deployment-guide.md) - Pilni darbo srautai
- **🏗️ Ištekliai**: [Ištekliai Azure](docs/chapter-04-infrastructure/provisioning.md) - Azure išteklių valdymas
- **📝 Pavyzdžiai**: [Container App pavyzdys](../../examples/container-app) - Konteinerizuoti diegimai

#### Praktinės užduotys
- Kurkite pasirinktinius Bicep šablonus
- Diegti daugiapakopes programas
- Įgyvendinti mėlynos-žalios diegimo strategijas

**💡 Skyrių rezultatas**: Diegti sudėtingas daugiapakopes programas naudojant pasirinktinius infrastruktūros šablonus

---

### 🎯 5 skyrius: Daugiaveiksmių DI sprendimai (Pažengusiesiems)
**Reikalavimai**: Baigti 1-2 skyrius  
**Trukmė**: 2-3 valandos  
**Sudėtingumas**: ⭐⭐⭐⭐

#### Ką išmoksite
- Daugiaveiksmių architektūros modeliai
- Agentų orkestravimas ir koordinacija
- Gamybinės DI diegimai

#### Mokymosi ištekliai
- **🤖 Pagrindinis projektas**: [Daugiaveiksmių mažmeninės prekybos sprendimas](examples/retail-scenario.md) - Pilnas įgyvendinimas
- **🛠️ ARM šablonai**: [ARM šablonų paketas](../../examples/retail-multiagent-arm-template) - Vieno paspaudimo diegimas
- **📖 Architektūra**: [Daugiaveiksmių koordinavimo modeliai](docs/chapter-06-pre-deployment/coordination-patterns.md) - Modeliai

#### Praktinės užduotys
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Skyrių rezultatas**: Diegti ir valdyti gamybai paruoštą daugiaveiksmių DI sprendimą su Klientų ir Atsargų agentais

---

### 🔍 6 skyrius: Prieš diegimą validacija ir planavimas
**Reikalavimai**: Baigtas 4 skyrius  
**Trukmė**: 1 valanda  
**Sudėtingumas**: ⭐⭐

#### Ką išmoksite
- Talpos planavimas ir išteklių validavimas
- SKU parinkimo strategijos
- Patikrinimai prieš pradžią ir automatizacija

#### Mokymosi ištekliai
- **📊 Planavimas**: [Talpos planavimas](docs/chapter-06-pre-deployment/capacity-planning.md) - Išteklių patikra
- **💰 Pasirinkimas**: [SKU pasirinkimas](docs/chapter-06-pre-deployment/sku-selection.md) - Ekonomiški sprendimai
- **✅ Patvirtinimas**: [Išankstiniai patikrinimai](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiniai scenarijai

#### Praktiniai pratimai
- Vykdyti talpos patikros scenarijus
- Optimizuoti SKU pasirinkimus dėl sąnaudų
- Įgyvendinti automatinius išankstinius patikrinimus prieš diegimą

**💡 Skyriaus rezultatas**: Patvirtinti ir optimizuoti diegimus prieš vykdymą

---

### 🚨 7 skyrius: Gedimų šalinimas ir derinimas
**Reikalavimai**: Baigtas bet kuris diegimo skyrius  
**Trukmė**: 1–1,5 valandos  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Sistemingus derinimo metodus
- Dažnas problemas ir sprendimus
- Dirbtinio intelekto specifinius gedimų šalinimus

#### Mokymosi ištekliai
- **🔧 Dažnos problemos**: [Dažnos problemos](docs/chapter-07-troubleshooting/common-issues.md) - DUK ir sprendimai
- **🕵️ Derinimas**: [Derinimo vadovas](docs/chapter-07-troubleshooting/debugging.md) - Žingsnis po žingsnio strategijos
- **🤖 DI problemos**: [DI-specifinis gedimų šalinimas](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - DI paslaugų problemos

#### Praktiniai pratimai
- Diagnostikuoti diegimo klaidas
- Išspręsti autentifikavimo problemas
- Derinti DI paslaugų ryšį

**💡 Skyriaus rezultatas**: Savarankiškai diagnozuoti ir išspręsti dažnas diegimo problemas

---

### 🏢 8 skyrius: Produkciniai ir įmonių modeliai
**Reikalavimai**: Baigti 1-4 skyrius  
**Trukmė**: 2–3 valandos  
**Sudėtingumas**: ⭐⭐⭐⭐

#### Ko išmoksite
- Produkcinių diegimų strategijas
- Įmonių saugumo modelius
- Stebėjimą ir kaštų optimizavimą

#### Mokymosi ištekliai
- **🏭 Produkcija**: [Produkcijos DI geriausios praktikos](docs/chapter-08-production/production-ai-practices.md) - Įmonių modeliai
- **📝 Pavyzdžiai**: [Mikropaslaugų pavyzdys](../../examples/microservices) - Sudėtingos architektūros
- **📊 Stebėjimas**: [Application Insights integracija](docs/chapter-06-pre-deployment/application-insights.md) - Monitoringo įrankiai

#### Praktiniai pratimai
- Įgyvendinti įmonių saugumo modelius
- Įrengti išsamų stebėjimą
- Diegti produkcijoje laikantis tinkamo valdymo

**💡 Skyriaus rezultatas**: Diegti įmonėms paruoštas programas su pilna produkcine funkcionalumu

---

## 🎓 Dirbtuvės apžvalga: Praktinis mokymasis

> **⚠️ DIRBTUVIŲ STATUSAS: Aktyvus kūrimas**  
> Dirbtuvių medžiaga šiuo metu kuriama ir tobulinama. Pagrindiniai moduliai veikia, bet kai kurios pažangios dalys dar nebaigtos. Mes aktyviai stengiamės užbaigti visą turinį. [Stebėkite progresą →](workshop/README.md)

### Interaktyvūs dirbtuvių materialai
**Išsamus praktinis mokymasis su naršyklės pagrindu veikiančiais įrankiais ir vedamais pratimais**

Mūsų dirbtuvių medžiaga suteikia struktūruotą, interaktyvią mokymosi patirtį, papildančią aukščiau pateiktą skyrių programą. Dirbtuvės pritaikytos tiek savarankiškam mokymuisi, tiek dėstytojo vedamoms pamokoms.

#### 🛠️ Dirbtuvių savybės
- **Naršyklės sąsaja**: Pilna MkDocs pagrindu sukurta dirbtuvių aplinka su paieška, kopijavimo ir temos funkcijomis
- **GitHub Codespaces integracija**: Vieno paspaudimo kūrimo aplinkos įrengimas
- **Struktūruotas mokymosi kelias**: 8 moduliai vedami pratimai (iš viso 3-4 valandos)
- **Progresyvi metodologija**: Įvadas → Pasirinkimas → Patvirtinimas → Deconstruavimas → Konfigūravimas → Tinkninimas → Išardymas → Apibendrinimas
- **Interaktyvi DevContainer aplinka**: Iš anksto sukonfigūruoti įrankiai ir priklausomybės

#### 📚 Dirbtuvių modulių struktūra
Dirbtuvės seka **8 modulių progresyvų metodą**, kuris veda nuo atradimo iki diegimo meistriškumo:

| Modulis | Tema | Ką darysite | Trukmė |
|--------|-------|----------------|----------|
| **0. Įvadas** | Dirbtuvių apžvalga | Suprasti mokymosi tikslus, reikalavimus ir dirbtuvių struktūrą | 15 min |
| **1. Pasirinkimas** | Šablonų atradimas | Išnagrinėti AZD šablonus ir pasirinkti tinkamiausią DI šabloną jūsų scenarijui | 20 min |
| **2. Patvirtinimas** | Diegimas ir tikrinimas | Diegti šabloną su `azd up` ir patikrinti infrastruktūros darbą | 30 min |
| **3. Deconstruavimas** | Struktūros supratimas | Naudoti GitHub Copilot nagrinėti šablono architektūrą, Bicep failus ir kodo organizaciją | 30 min |
| **4. Konfigūravimas** | Azure.yaml giluminis nagrinėjimas | Išmokti valdyti `azure.yaml` konfigūraciją, gyvenimo ciklo kablius ir aplinkos kintamuosius | 30 min |
| **5. Tinkninimas** | Pritaikymas sau | Įgalinti DI paiešką, sekimą, vertinimą ir pritaikyti jūsų scenarijui | 45 min |
| **6. Išardymas** | Valymas | Saugiai panaikinti išteklius naudojant `azd down --purge` | 15 min |
| **7. Apibendrinimas** | Tolimesni žingsniai | Peržiūrėti pasiekimus, pagrindines sąvokas ir tęsti mokymosi kelią | 15 min |

**Dirbtuvių eiga:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Pradžia su dirbtuvėmis
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Dirbtuvių mokymosi rezultatai
Baigus dirbtuves, dalyviai sugebės:
- **Diegti produkcines DI programas**: Naudojant AZD kartu su Microsoft Foundry paslaugomis
- **Įvaldyti daugiaagentines architektūras**: Įgyvendinti koordinuotus DI agentų sprendimus
- **Įgyvendinti saugumo geriausias praktikas**: Konfigūruoti autentifikaciją ir prieigos valdymą
- **Optimizuoti mastelį**: Kurti ekonomiškus ir našius diegimus
- **Šalinti diegimo problemas**: Savarankiškai spręsti dažnas problemas

#### 📖 Dirbtuvių ištekliai
- **🎥 Interaktyvus vadovas**: [Dirbtuvių medžiaga](workshop/README.md) - Naršykle pagrįsta mokymosi aplinka
- **📋 Moduliai po modulių instrukcijos**:
  - [0. Įvadas](workshop/docs/instructions/0-Introduction.md) - Dirbtuvių apžvalga ir tikslai
  - [1. Pasirinkimas](workshop/docs/instructions/1-Select-AI-Template.md) - Rasti ir pasirinkti DI šablonus
  - [2. Patvirtinimas](workshop/docs/instructions/2-Validate-AI-Template.md) - Diegti ir tikrinti šablonus
  - [3. Deconstruavimas](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Tirti šablonų architektūrą
  - [4. Konfigūravimas](workshop/docs/instructions/4-Configure-AI-Template.md) - Įvaldyti azure.yaml
  - [5. Tinkninimas](workshop/docs/instructions/5-Customize-AI-Template.md) - Priderinti prie savo scenarijaus
  - [6. Išardymas](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Valyti išteklius
  - [7. Apibendrinimas](workshop/docs/instructions/7-Wrap-up.md) - Apžvalga ir tolesni žingsniai
- **🛠️ DI dirbtuvių laboratorija**: [DI dirbtuvių laboratorija](docs/chapter-02-ai-development/ai-workshop-lab.md) - DI orientuoti pratimai
- **💡 Greitas startas**: [Dirbtuvių nustatymo vadovas](workshop/README.md#quick-start) - Aplinkos konfigūravimas

**Puikiai tinka**: Įmonių mokymams, universitetų kursams, savarankiškam mokymuisi ir programuotojų stovykloms.

---

## 📖 Giluminis tyrimas: AZD galimybės

Be pagrindų, AZD suteikia galingus įrankius produkciniams diegimams:

- **Šablonais pagrįsti diegimai** - Naudokite iš anksto paruoštus šablonus dažnai pasitaikantiems programų modeliams
- **Infrastruktūra kaip kodas** - Valdykite Azure išteklius naudojant Bicep arba Terraform  
- **Integruoti darbo srautai** - Sklandžiai paruoškite, diekite ir stebėkite programas
- **Draugiška programuotojams** - Optimizuota programuotojų produktyvumui ir patirčiai

### **AZD + Microsoft Foundry: Idealu DI diegimams**

**Kodėl AZD DI sprendimams?** AZD sprendžia pagrindines DI kūrėjų problemas:

- **DI paruošti šablonai** - Iš anksto sukonfigūruoti Microsoft Foundry modeliams, Azure DI paslaugoms ir ML krūviams
- **Saugūs DI diegimai** - Saugumo modeliai AI paslaugoms, API raktams ir modelių galams  
- **Produkcijos DI modeliai** - Geriausios praktikos masteliniams, ekonomiškiems DI programų diegimams
- **Galutiniai DI darbo srautai** - Nuo modelio kūrimo iki produkcijos diegimo su tinkamu stebėjimu
- **Kaštų optimizavimas** - Išmanios išteklių paskirstymo ir skalavimo strategijos DI krūviams
- **Microsoft Foundry integracija** - Sklandi sąsaja su Microsoft Foundry modelių katalogu ir galais

---

## 🎯 Šablonų ir pavyzdžių biblioteka

### Rekomenduojama: Microsoft Foundry šablonai
**Pradėkite čia, jei diegiate DI programas!**

> **Pastaba:** Šie šablonai demonstruoja įvairius DI modelius. Kai kurie yra išoriniai Azure pavyzdžiai, kiti – vietinės realizacijos.

| Šablonas | Skyrius | Sudėtingumas | Paslaugos | Tipas |
|----------|---------|------------|----------|------|
| [**Pradėkite su AI pokalbiu**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2 skyrius | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Išorinis |
| [**Pradėkite su AI agentais**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2 skyrius | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Išorinis |
| [**Azure Search + OpenAI demonstracija**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2 skyrius | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Išorinis |
| [**OpenAI pokalbių programos greitas startas**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2 skyrius | ⭐ | AzureOpenAI + Container Apps + Application Insights | Išorinis |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5 skyrius | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Išorinis |
| [**Contoso pokalbių RAG**](https://github.com/Azure-Samples/contoso-chat) | 8 skyrius | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Išorinis |
| [**Mažmeninės prekybos daugiaagentinis sprendimas**](examples/retail-scenario.md) | 5 skyrius | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Vietinis** |

### Rekomenduojama: Pilni mokymosi scenarijai
**Produkcijai paruošti programų šablonai, suderinti su mokymosi skyriais**

| Šablonas | Mokymosi skyrius | Sudėtingumas | Pagrindinis išmokimas |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2 skyrius | ⭐ | Pagrindiniai DI diegimo modeliai |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2 skyrius | ⭐⭐ | RAG įgyvendinimas su Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4 skyrius | ⭐⭐ | Dokumentų intelekto integracija |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5 skyrius | ⭐⭐⭐ | Agentų sistema ir funkcijų kvietimas |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8 skyrius | ⭐⭐⭐ | Įmonių DI orkestracija |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5 skyrius | ⭐⭐⭐⭐ | Daugiaagentė architektūra su Kliento ir Inventoriaus agentais |

### Mokymasis pagal pavyzdžių tipą

> **📌 Vietiniai vs Išoriniai pavyzdžiai:**  
> **Vietiniai pavyzdžiai** (šiame repo) = Nedelsiant paruošti naudoti  
> **Išoriniai pavyzdžiai** (Azure Samples) = Klonuoti iš susietų repo

#### Vietiniai pavyzdžiai (paruošti naudoti)
- [**Mažmeninės prekybos daugiaagentinis sprendimas**](examples/retail-scenario.md) - Pilnas produkcijai paruoštas įgyvendinimas su ARM šablonais
  - Daugiaagentė architektūra (Klientas + Inventoriaus agentai)
  - Išsamus stebėjimas ir vertinimas
  - Vieno spustelėjimo diegimas per ARM šabloną

#### Vietiniai pavyzdžiai - konteinerių programos (2–5 skyriai)
**Išsamūs konteinerinių diegimų pavyzdžiai šiame repozitoriume:**
- [**Konteinerių programų pavyzdžiai**](examples/container-app/README.md) - Pilnas konteinerinių diegimų vadovas
  - [Paprasta Flask API](../../examples/container-app/simple-flask-api) - Pagrindinis REST API su mastelio iki nulio funkcija
  - [Mikropaslaugų architektūra](../../examples/container-app/microservices) - Produkcijai paruoštas daugiapaslaugis diegimas
  - Greitas startas, produkcija ir pažangūs diegimų modeliai
  - Stebėjimo, saugumo ir kaštų optimizavimo gairės

#### Išoriniai pavyzdžiai - paprastos programos (1–2 skyriai)
**Klonuokite šiuos Azure Samples repo, kad pradėtumėte:**
- [Paprasta internetinė programa - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pagrindiniai diegimų modeliai
- [Statinis tinklalapis - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statinio turinio diegimas
- [Konteinerių programa - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API diegimas

#### Išoriniai pavyzdžiai - duomenų bazės integracija (3–4 skyriai)  
- [Duomenų bazės programa - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Duomenų bazės jungties modeliai
- [Funkcijos + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless duomenų darbo eiga

#### Išoriniai pavyzdžiai - pažangūs modeliai (4–8 skyriai)
- [Java mikropaslaugos](https://github.com/Azure-Samples/java-microservices-aca-lab) - Daugiaservisės architektūros
- [Konteinerių programų užduotys](https://github.com/Azure-Samples/container-apps-jobs) - Fono apdorojimas  
- [Įmonių ML vamzdis](https://github.com/Azure-Samples/mlops-v2) - Produkcijai paruošti ML modeliai

### Išorinės šablonų kolekcijos
- [**Oficiali AZD šablonų galerija**](https://azure.github.io/awesome-azd/) - Atrinkta oficialių ir bendruomenės šablonų kolekcija
- [**Azure Developer CLI šablonai**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn šablonų dokumentacija
- [**Pavyzdžių katalogas**](examples/README.md) - Vietiniai mokymosi pavyzdžiai su išsamiais paaiškinimais

---

## 📚 Mokymosi ištekliai ir nuorodos

### Greitos nuorodos
- [**Komandų suvestinė**](resources/cheat-sheet.md) - Pagrindinės azd komandos, suskirstytos pagal skyrius
- [**Žodynas**](resources/glossary.md) - Azure ir azd terminologija  
- [**DUK**](resources/faq.md) - Dažniausiai užduodami klausimai, suskirstyti pagal mokymosi skyrius
- [**Studijų vadovas**](resources/study-guide.md) - Išsamios praktinės užduotys

### Praktiniai užsiėmimai
- [**DI dirbtuvės laboratorija**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Padarykite savo DI sprendimus diegiamus per AZD (2–3 valandos)
- [**Interaktyvios dirbtuvės**](workshop/README.md) - 8 modulių vadovaujami užsiėmimai su MkDocs ir GitHub Codespaces
  - Sekimas: Įvadas → Pasirinkimas → Patikra → Analizė → Konfigūracija → Prieinamumas → Demontavimas → Apibendrinimas

### Išoriniai mokymosi ištekliai
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure kainų skaičiuoklė](https://azure.microsoft.com/pricing/calculator/)
- [Azure būklė](https://status.azure.com/)

### DI agentų įgūdžiai jūsų redaktoriui
- [**Microsoft Azure įgūdžiai skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 atviro kodo agentų įgūdžių Azure DI, Foundry, diegimo, diagnostikos, sąnaudų optimizavimo ir daugiau. Įdiekite juos GitHub Copilot, Cursor, Claude Code ar kitame palaikomame agente:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Greita trikčių šalinimo gairė

**Įprastos klaidos, su kuriomis susiduria pradedantieji, ir greiti sprendimai:**

<details>
<summary><strong>❌ "azd: komanda nerasta"</strong></summary>

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
<summary><strong>❌ "Prenumerata nerasta" arba "Prenumerata nenustatyta"</strong></summary>

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
<summary><strong>❌ "Nepakankamas kvotas" arba "Viršytas kvotas"</strong></summary>

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
<summary><strong>❌ "azd up" nepavyksta viduryje</strong></summary>

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
<summary><strong>❌ "Autentifikacija nepavyko" arba "Tokenas pasibaigė"</strong></summary>

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
<summary><strong>❌ "Išteklius jau egzistuoja" arba pavadinimų konfliktai</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Šablono diegimas užtrunka per ilgai</strong></summary>

**Įprasti laukimo laikai:**
- Paprasta žiniatinklio programa: 5–10 minučių
- Programa su duomenų baze: 10–15 minučių
- DI programos: 15–25 minučių (OpenAI teikimas vyksta lėtai)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Leidimas uždraustas" arba "Draudžiama"</strong></summary>

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
<summary><strong>❌ Nepavyksta rasti diegto programos URL</strong></summary>

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

### 📚 Visapusiški trikčių šalinimo ištekliai

- **Dažniausių problemų vadovas:** [Išsamūs sprendimai](docs/chapter-07-troubleshooting/common-issues.md)
- **DI specifinės problemos:** [DI trikčių šalinimas](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Derinimo vadovas:** [Žingsnis po žingsnio derinimas](docs/chapter-07-troubleshooting/debugging.md)
- **Pagalbos gavimas:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurso baigimas ir sertifikavimas

### Progreso sekimas
Sekite savo mokymosi pažangą kiekviename skyriuje:

- [ ] **1 skyrius**: Pagrindai ir greitas pradėjimas ✅
- [ ] **2 skyrius**: DI pirmenybės vystymas ✅  
- [ ] **3 skyrius**: Konfigūracija ir autentifikacija ✅
- [ ] **4 skyrius**: Infrastruktūra kaip kodas ir diegimas ✅
- [ ] **5 skyrius**: Daugiagentės DI sprendimai ✅
- [ ] **6 skyrius**: Išankstinė diegimo patikra ir planavimas ✅
- [ ] **7 skyrius**: Trikčių šalinimas ir derinimas ✅
- [ ] **8 skyrius**: Produkcija ir įmonių modeliai ✅

### Mokymosi patvirtinimas
Baigus kiekvieną skyrių, patikrinkite savo žinias:
1. **Praktinė užduotis**: Atlikite skyriaus praktinį diegimą
2. **Žinių patikra**: Peržiūrėkite DUK skyriaus aspektus
3. **Bendruomenės diskusija**: Pasidalinkite savo patirtimi Azure Discord
4. **Kitas skyrius**: Pereikite prie kito sudėtingumo lygio

### Kurso baigimo privalumai
Baigus visus skyrius, jūs turėsite:
- **Produkcinė patirtis**: Išteklius realiai įdiegias DI programas Azure aplinkoje
- **Profesionalūs įgūdžiai**: Įmonių diegimo galimybes  
- **Bendruomenės pripažinimas**: Aktyvus Azure kūrėjų bendruomenės narys
- **Karjeros augimas**: Paklausa AZD ir DI diegimo kompetencijoms

---

## 🤝 Bendruomenė ir pagalba

### Pagalbos ir palaikymo gavimas
- **Techninės problemos**: [Pranešti apie klaidas ir prašyti funkcijų](https://github.com/microsoft/azd-for-beginners/issues)
- **Mokymosi klausimai**: [Microsoft Azure Discord bendruomenė](https://discord.gg/microsoft-azure) ir [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **DI specifinė pagalba**: Prisijunkite prie [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Oficiali Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Bendruomenės įžvalgos iš Microsoft Foundry Discord

**Naujausios apklausos rezultatai iš #Azure kanalo:**
- **45 %** kūrėjų nori naudoti AZD DI užduotims
- **Pagrindinės problemos**: Daugiapaslapių diegimas, kredencialų valdymas, pasirengimas produkcijai  
- **Dažniausiai prašoma**: DI specifiniai šablonai, trikčių šalinimo gairės, geros praktikos

**Prisijunkite prie mūsų bendruomenės, kad galėtumėte:**
- Dalintis savo AZD + DI patirtimi ir gauti pagalbos
- Gauti ankstyvas naujų DI šablonų versijas
- Prisidėti prie DI diegimo geros praktikos
- Įtakoti būsimų DI + AZD funkcijų kūrimą

### Kurso prisidėjimas
Laukiame jūsų indėlio! Prašome perskaityti mūsų [Prisidėjimo vadovą](CONTRIBUTING.md) dėl informacijos apie:
- **Turinio tobulinimai**: Patobulinkite esamus skyrius ir pavyzdžius
- **Nauji pavyzdžiai**: Pridėkite realaus pasaulio scenarijus ir šablonus  
- **Vertimas**: Padėkite išlaikyti daugiakalbę paramą
- **Klaidų pranešimai**: Pagerinkite tikslumą ir aiškumą
- **Bendruomenės standartai**: Laikykitės mūsų įtraukiančių bendruomenės gairių

---

## 📄 Kurso informacija

### Licencija
Šis projektas licencijuotas pagal MIT licenciją – daugiau informacijos rasite faile [LICENSE](../../LICENSE).

### Susiję Microsoft mokymosi ištekliai

Mūsų komanda kuria kitus išsamius mokymosi kursus:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j pradedantiesiems](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js pradedantiesiems](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain pradedantiesiems](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agentai
[![AZD pradedantiesiems](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge DI pradedantiesiems](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP pradedantiesiems](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![DI agentai pradedantiesiems](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatyvinio DI serija
[![Generatyvinis DI pradedantiesiems](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatyvinis DI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatyvinis DI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatyvinis DI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Pagrindinis mokymasis
[![ML pradedantiesiems](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Duomenų mokslas pradedantiesiems](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![DI pradedantiesiems](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kibernetinis saugumas pradedantiesiems](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Tinklalapių kūrimas pradedantiesiems](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![Daiktų internetas pradedantiesiems](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR kūrimas pradedantiesiems](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot serija
[![Copilot DI partneriui programavime](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot nuotykiai](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurso navigacija

**🚀 Pasiruošę pradėti mokytis?**

**Pradedantieji**: Pradėkite nuo [1 skyrius: Pagrindai ir greitas pradėjimas](#-chapter-1-foundation--quick-start)  
**DI kūrėjai**: Pereikite prie [2 skyrius: DI pirmenybės vystymas](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Patyrę kūrėjai**: Pradėkite nuo [3 skyrius: Konfigūracija ir autentifikacija](#️-chapter-3-configuration--authentication)

**Kiti žingsniai**: [Pradėti 1 skyrių – AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->