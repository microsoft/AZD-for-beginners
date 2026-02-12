# AZD Pradedantiesiems: Struktūruota mokymosi kelionė

![AZD pradedantiesiems](../../translated_images/lt/azdbeginners.5527441dd9f74068.webp) 

[![GitHub stebėtojai](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub fork'ai](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub žvaigždės](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiniai vertimai (Visada atnaujinama)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabų](../ar/README.md) | [Bengalų](../bn/README.md) | [Bulgarų](../bg/README.md) | [Birmos (Mianmaras)](../my/README.md) | [Kinų (supaprastinta)](../zh-CN/README.md) | [Kinų (tradicinė, Honkongas)](../zh-HK/README.md) | [Kinų (tradicinė, Makao)](../zh-MO/README.md) | [Kinų (tradicinė, Taivanas)](../zh-TW/README.md) | [Kroatų](../hr/README.md) | [Čekų](../cs/README.md) | [Danų](../da/README.md) | [Olandų](../nl/README.md) | [Estų](../et/README.md) | [Suomių](../fi/README.md) | [Prancūzų](../fr/README.md) | [Vokiečių](../de/README.md) | [Graikų](../el/README.md) | [Hebrajų](../he/README.md) | [Hindų](../hi/README.md) | [Vengrų](../hu/README.md) | [Indonėzų](../id/README.md) | [Italų](../it/README.md) | [Japonų](../ja/README.md) | [Kannadų](../kn/README.md) | [Korėjiečių](../ko/README.md) | [Lietuvių](./README.md) | [Malajų](../ms/README.md) | [Malajalamo](../ml/README.md) | [Marati](../mr/README.md) | [Nepalų](../ne/README.md) | [Nigerijos pidžino](../pcm/README.md) | [Norvegų](../no/README.md) | [Persų (Farsi)](../fa/README.md) | [Lenkų](../pl/README.md) | [Portugalų (Brazilija)](../pt-BR/README.md) | [Portugalų (Portugalija)](../pt-PT/README.md) | [Pandžabi (Gurmukhi)](../pa/README.md) | [Rumunų](../ro/README.md) | [Rusų](../ru/README.md) | [Serbų (kirilica)](../sr/README.md) | [Slovakų](../sk/README.md) | [Slovėnų](../sl/README.md) | [Ispanų](../es/README.md) | [Svahili](../sw/README.md) | [Švedų](../sv/README.md) | [Tagalo (Filipinų)](../tl/README.md) | [Tamilų](../ta/README.md) | [Telugų](../te/README.md) | [Tajų](../th/README.md) | [Turkų](../tr/README.md) | [Ukrainiečių](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamiečių](../vi/README.md)

> **Ar norite klonuoti lokaliai?**
>
> Šiame repozitorijoje yra daugiau nei 50 kalbų vertimų, todėl atsisiuntimo dydis ženkliai padidėja. Norėdami klonuoti be vertimų, naudokite ribotą (sparse) checkout:
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
> Tai suteikia viską, ko reikia kurso užbaigimui, ir daug greitesnį atsisiuntimą.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Kas yra Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** yra kūrėjui draugiškas komandų eilutės įrankis, leidžiantis paprastai diegti programas į Azure. Vietoj to, kad rankiniu būdu kurtumėte ir jungtumėte dešimtis Azure išteklių, galite vienu komandų paleidimu įdiegti visą programą.

### `azd up` magija

```bash
# Ši viena komanda atlieka viską:
# ✅ Sukuria visus Azure išteklius
# ✅ Konfigūruoja tinklą ir saugumą
# ✅ Kuria jūsų programos kodą
# ✅ Diegia į Azure
# ✅ Pateikia veikiančią URL adresą
azd up
```

**Viskas!** Jokio spustelėjimo Azure portale, jokių sudėtingų ARM šablonų, kuriuos pirmiausia reikėtų perprasti, jokių rankinių konfigūracijų – tik veikiančios programos Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Kuo skiriasi?

Tai dažniausiai užduodamas klausimas pradedantiesiems. Štai paprastas atsakymas:

| Funkcija | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Paskirtis** | Valdyti atskirus Azure išteklius | Diegti pilnas programas |
| **Požiūris** | Orientuota į infrastruktūrą | Orientuota į programas |
| **Pavyzdys** | `az webapp create --name myapp...` | `azd up` |
| **Mokymosi kreivė** | Reikia žinoti Azure paslaugas | Pakanka žinoti savo programą |
| **Tinka geriausiai** | DevOps, infrastruktūra | Vystytojai, prototipavimas |

### Paprasta analogija

- **Azure CLI** yra tarsi turėti visus įrankius namo statybai – plaktukai, pjūklai, vinys. Galite pastatyti ką tik norite, bet turite žinoti statybą.
- **Azure Developer CLI** yra tarsi samdyti rangovą – jūs apibūdinate, ko norite, o jis pasirūpina statyba.

### Kada naudoti kurį

| Scenarijus | Naudokite |
|----------|----------|
| "Noriu greitai įdiegti savo žiniatinklio programą" | `azd up` |
| "Reikia sukurti tik saugyklos paskyrą" | `az storage account create` |
| "Kuriu pilną DI programą" | `azd init --template azure-search-openai-demo` |
| "Reikia derinti konkretų Azure išteklių" | `az resource show` |
| "Noriu paruošto gamybos diegimo per kelias minutes" | `azd up --environment production` |

### Jie veikia kartu!

AZD naudoja Azure CLI po gaubtu. Galite naudoti abu:
```bash
# Diegkite savo programą su AZD
azd up

# Tada tiksliai sureguliuokite konkrečius išteklius naudodami Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Raskite šablonus Awesome AZD

Nesikurkite nuo nulio! **Awesome AZD** yra bendruomenės paruoštų diegti šablonų rinkinys:

| Išteklius | Aprašymas |
|----------|-------------|
| 🔗 [**Awesome AZD galerija**](https://azure.github.io/awesome-azd/) | Naršykite 200+ šablonų su vieno paspaudimo diegimu |
| 🔗 [**Pateikti šabloną**](https://github.com/Azure/awesome-azd/issues) | Prisidėkite savo šablonu bendruomenei |
| 🔗 [**GitHub saugykla**](https://github.com/Azure/awesome-azd) | Įvertinkite žvaigždute ir tyrinėkite šaltinį |

### Populiariausi DI šablonai iš Awesome AZD

```bash
# RAG pokalbis su Azure OpenAI + AI paieška
azd init --template azure-search-openai-demo

# Greita AI pokalbių programa
azd init --template openai-chat-app-quickstart

# AI agentai su Foundry agentais
azd init --template get-started-with-ai-agents
```

---

## 🎯 Pradėkite per 3 žingsnius

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

### 2 žingsnis: Prisijunkite prie Azure

```bash
azd auth login
```

### 3 žingsnis: Įdiekite savo pirmąją programą

```bash
# Inicializuoti iš šablono
azd init --template todo-nodejs-mongo

# Diegti į Azure (sukuria viską!)
azd up
```

**🎉 Viskas!** Jūsų programa dabar veikia Azure.

### Išvalykite (Neužmirškite!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kaip naudotis šiuo kursu

Šis kursas sukurtas **progresyviam mokymuisi** — pradėkite nuo to, kas jums patogu, ir ženkite toliau:

| Jūsų patirtis | Pradėkite čia |
|-----------------|------------|
| **Neturiu patirties su Azure** | [1 skyrius: Pagrindai](../..) |
| **Žinau Azure, nepažįstu AZD** | [1 skyrius: Pagrindai](../..) |
| **Noriu diegti DI programas** | [2 skyrius: DI orientuotas kūrimas (rekomenduojama DI kūrėjams)](../..) |
| **Noriu praktikos** | [🎓 Interaktyvus seminaras](workshop/README.md) - 3-4 val. vedama laboratorija |
| **Reikia gamybos modelių** | [8 skyrius: Gamyba ir įmonės](../..) |

### Greitas nustatymas

1. **Padarykite fork'ą šiai saugyklai**: [![GitHub fork'ai](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonuokite ją**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Gaukite pagalbą**: [Azure Discord bendruomenė](https://discord.com/invite/ByRwuEEgH4)

> **Ar norite klonuoti lokaliai?**
>
> Šiame repozitorijoje yra daugiau nei 50 kalbų vertimų, todėl atsisiuntimo dydis ženkliai padidėja. Norėdami klonuoti be vertimų, naudokite ribotą (sparse) checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Tai suteikia viską, ko reikia kurso užbaigimui, ir daug greitesnį atsisiuntimą.


## Kurso apžvalga

Įvaldykite Azure Developer CLI (azd) per struktūruotus skyrius, sukurtus progresyviam mokymuisi. **Ypatingas dėmesys DI programų diegimui su Microsoft Foundry integracija.**

### Kodėl šis kursas yra būtinas šiuolaikiniams kūrėjams

Remiantis Microsoft Foundry Discord bendruomenės įžvalgomis, **45% kūrėjų nori naudoti AZD DI užduotims**, tačiau susiduria su šiais iššūkiais:
- Sudėtingos kelių paslaugų DI architektūros
- Gamybinio DI diegimo gerosios praktikos  
- Azure DI paslaugų integracija ir konfigūracija
- Išlaidų optimizavimas DI užduotims
- DI specifinių diegimo problemų trikčių šalinimas

### Mokymosi tikslai

Baigę šį struktūruotą kursą, jūs:
- **Įvaldysite AZD pagrindus**: Pagrindinės sąvokos, diegimas ir konfigūracija
- **Diegsite DI programas**: Naudosite AZD su Microsoft Foundry paslaugomis
- **Įgyvendinsite infrastruktūrą kaip kodą**: Valdykite Azure išteklius su Bicep šablonais
- **Trikčių šalinimas diegimuose**: Išspręskite dažniausias problemas ir derinkite klaidas
- **Optimizuosite gamybai**: Saugumas, skalavimas, stebėsena ir išlaidų valdymas
- **Kursite daugiaagentines sprendimus**: Diegsite sudėtingas DI architektūras

## 🗺️ Kurso žemėlapis: greita navigacija pagal skyrių

Kiekvienas skyrius turi atskirą README su mokymosi tikslais, greitaisiais pradmenimis ir pratimais:

| Skyrius | Tema | Pamokos | Trukmė | Sudėtingumas |
|---------|-------|---------|----------|------------|
| **[1 skyrius: Pagrindai](docs/chapter-01-foundation/README.md)** | Pradžia | [AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) &#124; [Įdiegimas](docs/chapter-01-foundation/installation.md) &#124; [Pirmasis projektas](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[2 skyrius: DI kūrimas](docs/chapter-02-ai-development/README.md)** | DI orientuotos programos | [Foundry integracija](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [DI agentai](docs/chapter-02-ai-development/agents.md) &#124; [Modelių diegimas](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Seminaras](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 val. | ⭐⭐ |
| **[3 skyrius: Konfigūracija](docs/chapter-03-configuration/README.md)** | Autentifikacija ir sauga | [Konfigūracija](docs/chapter-03-configuration/configuration.md) &#124; [Autentifikacija ir sauga](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[4 skyrius: Infrastruktūra](docs/chapter-04-infrastructure/README.md)** | IaC ir diegimas | [Diegimo vadovas](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Resursų aprovisionavimas](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 val. | ⭐⭐⭐ |
| **[5 skyrius: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI agentų sprendimai | [Mažmeninės prekybos scenarijus](examples/retail-scenario.md) &#124; [Koordinavimo modeliai](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 val. | ⭐⭐⭐⭐ |
| **[6 skyrius: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planavimas ir validacija | [Preflight patikrinimai](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Talpos planavimas](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU pasirinkimas](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Programos įžvalgos](docs/chapter-06-pre-deployment/application-insights.md) | 1 val. | ⭐⭐ |
| **[7 skyrius: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Derinimas ir taisymas | [Dažnos problemos](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Derinimas](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problemų sprendimas](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 val. | ⭐⭐ |
| **[8 skyrius: Production](docs/chapter-08-production/README.md)** | Įmonės praktikos | [Gamybos praktikos](docs/chapter-08-production/production-ai-practices.md) | 2-3 val. | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktinis laboratorinis darbas | [Įvadas](workshop/docs/instructions/0-Introduction.md) &#124; [Parinkimas](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstrukcija](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigūracija](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalizavimas](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Infrastruktūros išmontavimas](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Apibendrinimas](workshop/docs/instructions/7-Wrap-up.md) | 3-4 val. | ⭐⭐ |

**Total Course Duration:** ~10-14 hours | **Skill Progression:** Beginner → Production-Ready

---

## 📚 Mokymosi skyriai

*Pasirinkite mokymosi kelią pagal patirties lygį ir tikslus*

### 🚀 1 skyrius: Pagrindai ir greitas startas
**Priešsąlygos**: Azure prenumerata, pagrindinės komandų eilutės žinios  
**Trukmė**: 30-45 minučių  
**Sudėtingumas**: ⭐

#### Ko išmoksite
- Azure Developer CLI pagrindų supratimas
- AZD diegimas jūsų platformoje
- Jūsų pirmasis sėkmingas diegimas

#### Mokymosi ištekliai
- **🎯 Pradėkite čia**: [Kas yra Azure Developer CLI?](../..)
- **📖 Teorija**: [AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) - Pagrindinės sąvokos ir terminologija
- **⚙️ Paruošimas**: [Diegimas ir nustatymai](docs/chapter-01-foundation/installation.md) - Gairės pagal platformą
- **🛠️ Praktika**: [Jūsų pirmasis projektas](docs/chapter-01-foundation/first-project.md) - Žingsnis po žingsnio vadovas
- **📋 Greita atmintinė**: [Komandų atmintinė](resources/cheat-sheet.md)

#### Praktinės užduotys
```bash
# Greitas įdiegimo patikrinimas
azd version

# Įdiekite savo pirmąją programą
azd init --template todo-nodejs-mongo
azd up
```

**💡 Skyriaus rezultatas**: Sėkmingai įdiegti paprastą žiniatinklio programą į Azure naudojant AZD

**✅ Sėkmės patvirtinimas:**
```bash
# Baigę 1 skyrių, turėtumėte sugebėti:
azd version              # Rodo įdiegtą versiją
azd init --template todo-nodejs-mongo  # Inicializuoja projektą
azd up                  # Diegia į Azure
azd show                # Rodo veikiančios programos URL
# Programa atsidaro naršyklėje ir veikia
azd down --force --purge  # Išvalo išteklius
```

**📊 Laiko sąnaudos:** 30-45 minučių  
**📈 Įgūdžių lygis po:** Gali savarankiškai diegti pagrindines programas

**✅ Sėkmės patvirtinimas:**
```bash
# Baigę 1 skyrių, turėtumėte sugebėti:
azd version              # Rodo įdiegtą versiją
azd init --template todo-nodejs-mongo  # Inicializuoja projektą
azd up                  # Diegia į Azure
azd show                # Rodo veikiančios programos URL
# Programa atsidaro naršyklėje ir veikia
azd down --force --purge  # Išvalo išteklius
```

**📊 Laiko sąnaudos:** 30-45 minučių  
**📈 Įgūdžių lygis po:** Gali savarankiškai diegti pagrindines programas

---

### 🤖 2 skyrius: AI-pirmas vystymas (rekomenduojama AI kūrėjams)
**Priešsąlygos**: Baigtas 1 skyrius  
**Trukmė**: 1-2 valandos  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Microsoft Foundry integracija su AZD
- Diegti AI varomas programas
- AI paslaugų konfigūracijų supratimas

#### Mokymosi ištekliai
- **🎯 Pradėkite čia**: [Microsoft Foundry integracija](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agentai**: [AI agentų vadovas](docs/chapter-02-ai-development/agents.md) - Kaip diegti intelektualius agentus su AZD
- **📖 Modelių diegimas**: [AI modelių diegimas](docs/chapter-02-ai-development/ai-model-deployment.md) - AI modelių diegimas ir valdymas
- **🛠️ Praktika**: [AI praktikos laboratorija](docs/chapter-02-ai-development/ai-workshop-lab.md) - Paruoškite savo AI sprendimus AZD
- **🎥 Interaktyvus vadovas**: [Seminaro medžiaga](workshop/README.md) - Naršyklėje pagrįstas mokymasis su MkDocs * DevContainer aplinka
- **📋 Šablonai**: [Microsoft Foundry šablonai](../..)
- **📝 Pavyzdžiai**: [AZD diegimo pavyzdžiai](examples/README.md)

#### Praktinės užduotys
```bash
# Paleiskite savo pirmąją DI programą
azd init --template azure-search-openai-demo
azd up

# Išbandykite papildomus DI šablonus
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Skyriaus rezultatas**: Diegti ir konfigūruoti AI varomą pokalbių programą su RAG galimybėmis

**✅ Sėkmės patvirtinimas:**
```bash
# Po 2-ojo skyriaus turėtumėte sugebėti:
azd init --template azure-search-openai-demo
azd up
# Išbandyti DI pokalbių sąsają
# Užduoti klausimus ir gauti DI pateikiamus atsakymus su šaltiniais
# Patikrinti, ar paieškos integracija veikia
azd monitor  # Patikrinti, ar Application Insights rodo telemetriją
azd down --force --purge
```

**📊 Laiko sąnaudos:** 1-2 valandos  
**📈 Įgūdžių lygis po:** Gali diegti ir konfigūruoti gamybai paruoštas AI programas  
**💰 Sąnaudų suvokimas:** Suprasti $80-150/mėn. kūrimo kaštus, $300-3500/mėn. gamybos kaštus

#### 💰 Sąnaudų aspektai AI diegimams

**Kūrimo aplinka (apytiksliai $80-150/mėn.):**
- Azure OpenAI (mokėkite pagal naudojimą): $0-50/mėn. (priklauso nuo žetonų naudojimo)
- AI Search (pagrindinis lygis): $75/mėn.
- Container Apps (naudojimo pagrindu): $0-20/mėn.
- Saugojimas (standartinis): $1-5/mėn.

**Gamybinė aplinka (apytiksliai $300-3,500+/mėn.):**
- Azure OpenAI (PTU dėl nuoseklaus našumo): $3,000+/mėn. ARBA mokėkite pagal naudojimą esant dideliam apimčiai
- AI Search (standartinis lygis): $250/mėn.
- Container Apps (dedikuotas): $50-100/mėn.
- Application Insights: $5-50/mėn.
- Saugojimas (premium): $10-50/mėn.

**💡 Sąnaudų optimizavimo patarimai:**
- Naudokite **Free Tier** Azure OpenAI mokymuisi (įtraukta 50,000 žetonų/mėn.)
- Paleiskite `azd down`, kad atlaisvintumėte išteklius, kai nedevinate
- Pradėkite nuo mokėjimo pagal naudojimą modelio, PTU pasirinkite tik gamybai
- Naudokite `azd provision --preview`, kad įvertintumėte sąnaudas prieš diegimą
- Įjunkite automatinį skalavimą: mokėkite tik už faktinį naudojimą

**Išlaidų stebėjimas:**
```bash
# Patikrinkite apskaičiuotas mėnesines išlaidas
azd provision --preview

# Stebėkite faktines išlaidas Azure portale
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3 skyrius: Konfigūracija ir autentifikacija
**Priešsąlygos**: Baigtas 1 skyrius  
**Trukmė**: 45-60 minučių  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Aplinkos konfigūravimas ir valdymas
- Autentifikacijos ir saugumo geriausios praktikos
- Išteklių pavadinimų ir organizavimo principai

#### Mokymosi ištekliai
- **📖 Konfigūracija**: [Konfigūracijos vadovas](docs/chapter-03-configuration/configuration.md) - Aplinkos nustatymas
- **🔐 Saugumas**: [Autentifikacijos modeliai ir valdomos tapatybės](docs/chapter-03-configuration/authsecurity.md) - Autentifikacijos modeliai
- **📝 Pavyzdžiai**: [Duomenų bazės programos pavyzdys](examples/database-app/README.md) - AZD duomenų bazės pavyzdžiai

#### Praktinės užduotys
- Konfigūruoti kelias aplinkas (dev, staging, prod)
- Nustatyti valdomos tapatybės autentifikaciją
- Įgyvendinti aplinkai būdingas konfigūracijas

**💡 Skyriaus rezultatas**: Valdyti kelias aplinkas su tinkama autentifikacija ir saugumu

---

### 🏗️ 4 skyrius: Infrastruktūra kaip kodas ir diegimas
**Priešsąlygos**: Baigti 1–3 skyriai  
**Trukmė**: 1-1.5 val.  
**Sudėtingumas**: ⭐⭐⭐

#### Ko išmoksite
- Išplėstiniai diegimo modeliai
- Infrastruktūra kaip kodas naudojant Bicep
- Išteklių aprovisionavimo strategijos

#### Mokymosi ištekliai
- **📖 Diegimas**: [Diegimo vadovas](docs/chapter-04-infrastructure/deployment-guide.md) - Pilni darbo srautai
- **🏗️ Aprovisionavimas**: [Resursų aprovisionavimas](docs/chapter-04-infrastructure/provisioning.md) - Azure išteklių valdymas
- **📝 Pavyzdžiai**: [Container App pavyzdys](../../examples/container-app) - Konteinerizuoti diegimai

#### Praktinės užduotys
- Kurti pasirinktinius Bicep šablonus
- Diegti daugiaservisias programas
- Įgyvendinti blue-green diegimo strategijas

**💡 Skyriaus rezultatas**: Diegti sudėtingas daugiaservisias programas naudojant pasirinktinius infrastruktūros šablonus

---

### 🎯 5 skyrius: Multi-Agent AI sprendimai (Išplėstinis)
**Priešsąlygos**: Baigti 1–2 skyriai  
**Trukmė**: 2-3 val.  
**Sudėtingumas**: ⭐⭐⭐⭐

#### Ko išmoksite
- Multi-agentų architektūros modeliai
- Agentų orkestravimas ir koordinacija
- Gamybai paruošti AI diegimai

#### Mokymosi ištekliai
- **🤖 Pagrindinis projektas**: [Mažmeninės prekybos multi-agent sprendimas](examples/retail-scenario.md) - Pilnas įgyvendinimas
- **🛠️ ARM šablonai**: [ARM šablonų paketas](../../examples/retail-multiagent-arm-template) - Vieno paspaudimo diegimas
- **📖 Architektūra**: [Multi-agentų koordinavimo modeliai](docs/chapter-06-pre-deployment/coordination-patterns.md) - Modeliai

#### Praktinės užduotys
```bash
# Įdiegti visą mažmeninės prekybos daugiaagentinį sprendimą
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tyrinėti agentų konfigūracijas
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Skyriaus rezultatas**: Diegti ir valdyti gamybai paruoštą multi-agent AI sprendimą su Kliento ir Inventoriaus agentais

---

### 🔍 6 skyrius: Pre-diegimo validacija ir planavimas
**Priešsąlygos**: Baigtas 4 skyrius  
**Trukmė**: 1 val.  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Talpos planavimas ir išteklių validacija
- SKU parinkimo strategijos
- Pre-flight patikrinimai ir automatizavimas

#### Mokymosi ištekliai
- **📊 Planavimas**: [Talpos planavimas](docs/chapter-06-pre-deployment/capacity-planning.md) - Išteklių validacija
- **💰 Parinkimas**: [SKU pasirinkimas](docs/chapter-06-pre-deployment/sku-selection.md) - Kaina efektyvūs pasirinkimai
- **✅ Validacija**: [Preflight patikrinimai](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizuoti skriptai

#### Praktinės užduotys
- Vykdyti talpos validacijos skriptus
- Optimizuoti SKU pasirinkimus dėl sąnaudų
- Įgyvendinti automatizuotus pre-diegimo patikrinimus

**💡 Skyriaus rezultatas**: Validuoti ir optimizuoti diegimus prieš vykdymą

---

### 🚨 7 skyrius: Gedimų šalinimas ir derinimas
**Priešsąlygos**: Baigtas bet koks diegimo skyrius  
**Trukmė**: 1-1.5 val.  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Sistemingos derinimo metodikos
- Dažnos problemos ir sprendimai
- AI specifiniai gedimų sprendimai

#### Mokymosi ištekliai
- **🔧 Dažnos problemos**: [Dažnos problemos](docs/chapter-07-troubleshooting/common-issues.md) - D.U.K. ir sprendimai
- **🕵️ Derinimas**: [Derinimo vadovas](docs/chapter-07-troubleshooting/debugging.md) - Žingsnis po žingsnio strategijos
- **🤖 AI problemos**: [AI specifinis gedimų šalinimas](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI paslaugų problemos

#### Praktinės užduotys
- Diagnozuoti diegimo klaidas
- Išspręsti autentifikacijos problemas
- Derinti AI paslaugų ryšį

**💡 Skyriaus rezultatas**: Savarankiškai diagnozuoti ir išspręsti dažnas diegimo problemas

---

### 🏢 8 skyrius: Gamyba ir įmonės modeliai
**Priešsąlygos**: Baigti 1–4 skyriai  
**Trukmė**: 2-3 val.  
**Sudėtingumas**: ⭐⭐⭐⭐

#### Ko išmoksite
- Gamybos diegimo strategijos
- Įmonės saugumo modeliai
- Stebėjimas ir sąnaudų optimizavimas

#### Mokymosi ištekliai
- **🏭 Gamyba**: [Gamybos AI gerosios praktikos](docs/chapter-08-production/production-ai-practices.md) - Įmonės modeliai
- **📝 Pavyzdžiai**: [Microservices pavyzdys](../../examples/microservices) - Sudėtingos architektūros
- **📊 Stebėjimas**: [Application Insights integracija](docs/chapter-06-pre-deployment/application-insights.md) - Stebėjimas

#### Praktinės užduotys
- Įgyvendinti įmonės saugumo modelius
- Nustatyti išsamų stebėjimą
- Diegti į gamybą su tinkama valdymo tvarka

**💡 Skyriaus rezultatas**: Diegti įmonėms paruoštas programas su pilnomis gamybos galimybėmis

---

## 🎓 Seminaro apžvalga: Praktinė mokymosi patirtis

> **⚠️ SEMINARO BŪKLĖ: Vykdomas kūrimas**
> Dirbtuvių medžiaga šiuo metu yra kuriama ir tobulinama. Pagrindiniai moduliai veikia, tačiau kai kurios pažangios skiltys yra neišbaigtos. Mes aktyviai dirbame, kad užbaigtume visą turinį. [Stebėti pažangą →](workshop/README.md)

### Interaktyvių dirbtuvių medžiaga
**Išsamus praktinis mokymasis su naršyklėje veikiančiais įrankiais ir vadovaujamomis užduotimis**

Mūsų dirbtuvių medžiaga suteikia struktūruotą, interaktyvią mokymosi patirtį, papildančią aukščiau pateiktą skyrių pagrindu sudarytą mokymo programą. Dirbtuvės yra skirtos tiek savarankiškam mokymuisi, tiek instruktoriaus vedamoms sesijoms.

#### 🛠️ Dirbtuvių ypatybės
- **Naršyklėje veikianti sąsaja**: Pilnos MkDocs pagrindu veikiančios dirbtuvės su paieška, kopijavimo ir temos funkcijomis
- **GitHub Codespaces integracija**: Vieno paspaudimo vystymo aplinkos nustatymas
- **Struktūruotas mokymosi kelias**: 8 moduliai su vadovaujamomis užduotimis (iš viso 3–4 val.)
- **Progresinė metodika**: Įvadas → Pasirinkimas → Patikra → Dekonstrukcija → Konfigūracija → Pritaikymas → Išardymas → Apibendrinimas
- **Interaktyvi DevContainer aplinka**: Iš anksto sukonfigūruoti įrankiai ir priklausomybės

#### 📚 Dirbtuvių modulio struktūra
Dirbtuvės seka **8 modulų progresinę metodiką**, kuri nuveda jus nuo atradimo iki diegimo meistriškumo:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Įvadas** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 min |
| **1. Pasirinkimas** | Template Discovery | Explore AZD templates and select the right AI template for your scenario | 20 min |
| **2. Patikra** | Deploy & Verify | Deploy the template with `azd up` and validate infrastructure works | 30 min |
| **3. Dekonstrukcija** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 min |
| **4. Konfigūracija** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 min |
| **5. Pritaikymas** | Make It Yours | Enable AI Search, tracing, evaluation, and customize for your scenario | 45 min |
| **6. Išardymas** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 min |
| **7. Apibendrinimas** | Next Steps | Review accomplishments, key concepts, and continue your learning journey | 15 min |

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
# Parinktis 1: GitHub Codespaces (rekomenduojama)
# Spustelėkite "Code" → "Create codespace on main" saugykloje

# Parinktis 2: Vietinis vystymas
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Vadovaukitės sąrankos nurodymais faile workshop/README.md
```

#### 🎯 Dirbtuvių mokymosi rezultatai
Baigę dirbtuves, dalyviai:
- **Diegs gamybines AI programas**: Naudos AZD su Microsoft Foundry paslaugomis
- **Įvaldys daugiaagentės architektūras**: Įgyvendins koordinuotas AI agentų sprendimus
- **Taikys saugumo gerąsias praktikas**: Sukonfigūruos autentifikaciją ir prieigos valdymą
- **Optimizuos mastelį**: Projektuos ekonomiškus ir našius diegimus
- **Spręs diegimo problemas**: Nepriklausomai išspręs dažniausiai pasitaikančias problemas

#### 📖 Dirbtuvių resursai
- **🎥 Interaktyvus vadovas**: [Dirbtuvių medžiaga](workshop/README.md) - Naršyklėje veikianti mokymosi aplinka
- **📋 Žingsnis po žingsnio moduliai**:
  - [0. Įvadas](workshop/docs/instructions/0-Introduction.md) - Dirbtuvių apžvalga ir tikslai
  - [1. Pasirinkimas](workshop/docs/instructions/1-Select-AI-Template.md) - Raskite ir pasirinkite AI šablonus
  - [2. Patikra](workshop/docs/instructions/2-Validate-AI-Template.md) - Diegimas ir šablonų patikra
  - [3. Dekonstrukcija](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Tyrinėkite šablono architektūrą
  - [4. Konfigūracija](workshop/docs/instructions/4-Configure-AI-Template.md) - Išmokite `azure.yaml`
  - [5. Pritaikymas](workshop/docs/instructions/5-Customize-AI-Template.md) - Pritaikykite savo scenarijui
  - [6. Išardymas](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Išvalykite resursus
  - [7. Apibendrinimas](workshop/docs/instructions/7-Wrap-up.md) - Peržiūra ir tolesni žingsniai
- **🛠️ AI dirbtuvių laboratorija**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI orientuotos praktinės užduotys
- **💡 Greitas pradžios vadovas**: [Workshop Setup Guide](workshop/README.md#quick-start) - Aplinkos konfigūracija

**Puikiai tinka**: korporatyviniam mokymui, universiteto kursams, savarankiškam mokymuisi ir programuotojų stovykloms.

---

## 📖 Gilus panirimas: AZD galimybės

Už bazinių funkcijų ribų AZD suteikia galingas galimybes gamybiniams diegimams:

- **Diegimai, pagrįsti šablonais** - Naudokite iš anksto paruoštus šablonus dažniausiems programų modeliams
- **Infrastruktūra kaip kodas** - Valdykite Azure išteklius naudodami Bicep arba Terraform  
- **Integruoti darbų srautai** - Sklandžiai aprovizijuokite, diekite ir stebėkite programas
- **Draugiška kūrėjui** - Optimizuota kūrėjų produktyvumui ir patirčiai

### **AZD + Microsoft Foundry: Puikiai tinka AI diegimams**

**Kodėl AZD AI sprendimams?** AZD sprendžia pagrindines problemas, su kuriomis susiduria AI kūrėjai:

- **AI pasiruošę šablonai** - Iš anksto sukonfigūruoti šablonai Azure OpenAI, Cognitive Services ir ML darbams
- **Saugūs AI diegimai** - Įdėtos saugumo praktikos AI paslaugoms, API raktams ir modelių galiniams taškams  
- **Gamybiniai AI modeliai** - Geriausios praktikos masteliniams, ekonomiškiems AI programų diegimams
- **Pilno ciklo AI darbų srautai** - Nuo modelio kūrimo iki gamybinio diegimo su tinkamu stebėjimu
- **Sąnaudų optimizavimas** - Išmanus išteklių paskirstymas ir mastelio keitimo strategijos AI darbams
- **Microsoft Foundry integracija** - Sklandi prieiga prie Microsoft Foundry modelių katalogo ir galinių taškų

---

## 🎯 Šablonų ir pavyzdžių biblioteka

### Pasižymėję: Microsoft Foundry šablonai
**Pradėkite čia, jei diegiate AI programas!**

> **Pastaba:** Šie šablonai demonstruoja įvairius AI modelius. Kai kurie yra Azure Samples išoriniai pavyzdžiai, kiti yra vietiniai įgyvendinimai.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Vietinis** |

### Pasižymėję: Pilni mokymosi scenarijai
**Gamybai paruošti programų šablonai, susieti su mokymosi skyriais**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### Mokymasis per pavyzdžius

> **📌 Vietiniai vs. išoriniai pavyzdžiai:**  
> **Vietiniai pavyzdžiai** (šioje saugykloje) = Paruošti naudoti iš karto  
> **Išoriniai pavyzdžiai** (Azure Samples) = Klonuokite iš susietų saugyklų

#### Vietiniai pavyzdžiai (paruošta naudoti)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Pilnas gamybai paruoštas įgyvendinimas su ARM šablonais
  - Daugiaagentė architektūra (Customer + Inventory agentai)
  - Išsamus stebėjimas ir vertinimas
  - Vieno paspaudimo diegimas per ARM šabloną

#### Vietiniai pavyzdžiai - konteinerių programos (Skyriai 2–5)
**Išsamūs konteinerių diegimo pavyzdžiai šioje saugykloje:**
- [**Container App Examples**](examples/container-app/README.md) - Pilnas vadovas konteinerizuotiems diegimams
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Pagrindinis REST API su scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Gamybai paruoštas kelių paslaugų diegimas
  - Greitas startas, gamybiniai ir pažangūs diegimo modeliai
  - Stebėjimo, saugumo ir sąnaudų optimizavimo gairės

#### Išoriniai pavyzdžiai - paprastos programos (Skyriai 1–2)
**Klonuokite šias Azure Samples saugyklas, kad pradėtumėte:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pagrindiniai diegimo modeliai
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statinio turinio diegimas
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API diegimas

#### Išoriniai pavyzdžiai - duomenų bazės integracija (Skyrius 3–4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Duomenų bazės ryšio modeliai
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless duomenų srautas

#### Išoriniai pavyzdžiai - pažangūs modeliai (Skyriai 4–8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Kelių paslaugų architektūros
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Fono apdorojimas  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Gamybai paruošti ML modeliai

### Išorinės šablonų kolekcijos
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Atrinkta oficialių ir bendruomenės šablonų kolekcija
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn šablonų dokumentacija
- [**Examples Directory**](examples/README.md) - Vietiniai mokymosi pavyzdžiai su išsamiais paaiškinimais

---

## 📚 Mokymosi ištekliai ir nuorodos

### Greitos nuorodos
- [**Komandų atmintinė**](resources/cheat-sheet.md) - Esminės azd komandos, suskirstytos pagal skyrių
- [**Žodynėlis**](resources/glossary.md) - Azure ir azd terminai  
- [**DUK**](resources/faq.md) - Dažniausiai užduodami klausimai pagal mokymosi skyrių
- [**Mokymosi vadovas**](resources/study-guide.md) - Išsamios praktinės užduotys

### Praktinės dirbtuvės
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Padarykite savo AI sprendimus diegiamus per AZD (2–3 val.)
- [**Interactive Workshop**](workshop/README.md) - 8 modulių vadovaujamos užduotys su MkDocs ir GitHub Codespaces
  - Sekama: Įvadas → Pasirinkimas → Patikra → Dekonstrukcija → Konfigūracija → Pritaikymas → Išardymas → Apibendrinimas

### Išoriniai mokymosi ištekliai
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Greitas trikčių šalinimo vadovas

**Dažniausios pradedančiųjų problemos ir greiti sprendimai:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Pirmiausia įdiekite AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Patikrinkite diegimą
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Rodyti galimas prenumeratas
az account list --output table

# Nustatyti numatytąją prenumeratą
az account set --subscription "<subscription-id-or-name>"

# Nustatyti AZD aplinkai
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Patikrinti
az account show
```
</details>
<details>
<summary><strong>❌ "InsufficientQuota" arba "Quota exceeded"</strong></summary>

```bash
# Išbandykite kitą Azure regioną
azd env set AZURE_LOCATION "westus2"
azd up

# Arba naudokite mažesnius SKU kūrimo metu
# Redaguokite infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" nepavyksta pusiaukelėje</strong></summary>

```bash
# Parinktis 1: Išvalyti ir bandyti iš naujo
azd down --force --purge
azd up

# Parinktis 2: Tiesiog sutvarkyti infrastruktūrą
azd provision

# Parinktis 3: Patikrinti išsamią būseną
azd show

# Parinktis 4: Peržiūrėti žurnalus Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" arba "Token expired"</strong></summary>

```bash
# Autentifikuoti iš naujo
az logout
az login

azd auth logout
azd auth login

# Patikrinti autentifikaciją
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" arba vardų konfliktai</strong></summary>

```bash
# AZD generuoja unikalius pavadinimus, tačiau jei kyla konfliktas:
azd down --force --purge

# Tada bandykite dar kartą su švaria aplinka
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Šablono diegimas užtrunka per ilgai</strong></summary>

**Normalūs laukimo laikai:**
- Paprasta žiniatinklio programa: 5-10 minutes
- Programėlė su duomenų baze: 10-15 minutes
- AI applications: 15-25 minutes (OpenAI provisioning is slow)

```bash
# Patikrinkite pažangą
azd show

# Jei įstrigote daugiau nei 30 minučių, patikrinkite Azure portalą:
azd monitor
# Ieškokite nepavykusių diegimų
```
</details>

<details>
<summary><strong>❌ "Permission denied" arba "Forbidden"</strong></summary>

```bash
# Patikrinkite savo Azure vaidmenį
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Reikalingas bent "Contributor" vaidmuo
# Paprašykite savo Azure administratoriaus suteikti:
# - Contributor (resursams)
# - User Access Administrator (vaidmenų priskyrimams)
```
</details>

<details>
<summary><strong>❌ Nepavyksta rasti išdiegtos programos URL</strong></summary>

```bash
# Rodyti visus paslaugų galinius taškus
azd show

# Arba atidarykite Azure portalą
azd monitor

# Patikrinkite konkrečią paslaugą
azd env get-values
# Ieškokite *_URL kintamųjų
```
</details>

### 📚 Pilni trikčių šalinimo ištekliai

- **Common Issues Guide:** [Išsamūs sprendimai](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-Specific Issues:** [AI trikčių šalinimas](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [Žingsnis po žingsnio derinimas](docs/chapter-07-troubleshooting/debugging.md)
- **Get Help:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurso baigimas ir sertifikavimas

### Pažangos sekimas
Sekite savo mokymosi pažangą per kiekvieną skyrių:

- [ ] **Chapter 1**: Pagrindai ir greitas pradėjimas ✅
- [ ] **Chapter 2**: AI-pagrįstas vystymas ✅  
- [ ] **Chapter 3**: Konfigūracija ir autentifikacija ✅
- [ ] **Chapter 4**: Infrastruktūra kaip kodas ir diegimas ✅
- [ ] **Chapter 5**: Daugiaagentės AI sprendimai ✅
- [ ] **Chapter 6**: Patikra ir planavimas prieš diegimą ✅
- [ ] **Chapter 7**: Trikčių šalinimas ir derinimas ✅
- [ ] **Chapter 8**: Produkcijos ir įmonių modeliai ✅

### Mokymosi patikra
Baigę kiekvieną skyrių, patikrinkite savo žinias atlikdami:
1. **Praktinė užduotis**: Užbaikite skyriaus praktinį diegimą
2. **Žinių patikrinimas**: Peržvelkite jūsų skyriaus DUK skyrių
3. **Bendruomenės diskusija**: Pasidalinkite savo patirtimi Azure Discord
4. **Kitas skyrius**: Pereikite prie kito sudėtingumo lygio

### Kurso baigimo privalumai
Baigę visus skyrius, jūs turėsite:
- **Produkcinė patirtis**: Išdiegėte tikras AI programas Azure
- **Profesionalūs įgūdžiai**: Gebėjimas diegti įmonės lygio sprendimus  
- **Bendruomenės pripažinimas**: Aktyvus Azure kūrėjų bendruomenės narys
- **Karjeros pažanga**: Paklausa turintys AZD ir AI diegimo įgūdžiai

---

## 🤝 Bendruomenė ir palaikymas

### Gaukite pagalbą ir palaikymą
- **Techninės problemos**: [Pranešti apie klaidas ir prašyti funkcijų](https://github.com/microsoft/azd-for-beginners/issues)
- **Mokymosi klausimai**: [Microsoft Azure Discord bendruomenė](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI specifinė pagalba**: Prisijunkite prie [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Oficiali Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Bendruomenės įžvalgos iš Microsoft Foundry Discord

**Naujausi apklausos rezultatai iš #Azure kanalo:**
- **45%** kūrėjų nori naudoti AZD AI darbo krūviams
- **Pagrindinės problemos**: Daugiaservisiniai diegimai, prieigos duomenų valdymas, pasirengimas gamybai  
- **Dažniausiai prašoma**: AI specifiniai šablonai, trikčių šalinimo vadovai, geriausios praktikos

**Prisijunkite prie mūsų bendruomenės, kad:**
- Dalintis savo AZD + AI patirtimi ir gauti pagalbą
- Gauti ankstyvą prieigą prie naujų AI šablonų
- Prisidėti prie AI diegimo geriausių praktikų
- Įtakoti būsimą AI + AZD funkcijų vystymą

### Prisidėjimas prie kurso
Kviečiame prisidėti! Prašome perskaityti mūsų [Prisidėjimo gaires](CONTRIBUTING.md) dėl išsamesnės informacijos apie:
- **Turinio patobulinimai**: Tobulinkite esamus skyrius ir pavyzdžius
- **Nauji pavyzdžiai**: Pridėkite realius scenarijus ir šablonus  
- **Vertimas**: Padėkite palaikyti kelių kalbų paramą
- **Klaidų pranešimai**: Gerinkite tikslumą ir aiškumą
- **Bendruomenės standartai**: Laikykitės mūsų įtraukių bendruomenės gairių

---

## 📄 Kurso informacija

### Licencija
Šis projektas licencijuotas pagal MIT licenciją - detales žr. faile [LICENSE](../../LICENSE).

### Susiję Microsoft mokymosi ištekliai

Mūsų komanda rengia ir kitus visapusiškus mokymo kursus:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j pradedantiesiems](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js pradedantiesiems](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain pradedantiesiems](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agentai
[![AZD pradedantiesiems](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI pradedantiesiems](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP pradedantiesiems](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents pradedantiesiems](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatyvinės AI serija
[![Generatyvinė AI pradedantiesiems](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatyvinė AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatyvinė AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatyvinė AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Pagrindiniai mokymai
[![ML pradedantiesiems](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Duomenų mokslas pradedantiesiems](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI pradedantiesiems](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kibernetinis saugumas pradedantiesiems](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Tinklapių kūrimas pradedantiesiems](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pradedantiesiems](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR kūrimas pradedantiesiems](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot serija
[![Copilot poriniam AI programavimui](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot nuotykiai](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurso naršymas

**🚀 Pasiruošę pradėti mokytis?**

**Pradedantiesiems**: Pradėkite nuo [1 skyrius: Pagrindai ir greitas pradėjimas](../..)  
**AI kūrėjai**: Peršokite į [2 skyrius: AI-pirmasis kūrimas](../..)  
**Patyrę kūrėjai**: Pradėkite nuo [3 skyrius: Konfigūracija ir autentifikacija](../..)

**Tolimesni žingsniai**: [Pradėti 1 skyrių - AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą Co-op Translator (https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas pagrindiniu šaltiniu. Jei informacija yra kritiškai svarbi, rekomenduojama pasinaudoti profesionalaus vertėjo paslaugomis. Mes neatsakome už bet kokius nesusipratimus ar neteisingas interpretacijas, kilusias dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->