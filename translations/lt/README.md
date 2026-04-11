# AZD Pradedantiesiems: Struktūruota mokymosi kelionė

![AZD-pradedantiesiems](../../translated_images/lt/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiniai vertimai (visada atnaujinami)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabų](../ar/README.md) | [Bengalų](../bn/README.md) | [Bulgarų](../bg/README.md) | [Birmos (Mianmaras)](../my/README.md) | [Kinų (supaprastinta)](../zh-CN/README.md) | [Kinų (tradicinė, Honkongas)](../zh-HK/README.md) | [Kinų (tradicinė, Makao)](../zh-MO/README.md) | [Kinų (tradicinė, Taivanas)](../zh-TW/README.md) | [Kroatų](../hr/README.md) | [Čekų](../cs/README.md) | [Danų](../da/README.md) | [Olandų](../nl/README.md) | [Estų](../et/README.md) | [Suomi](../fi/README.md) | [Prancūzų](../fr/README.md) | [Vokiečių](../de/README.md) | [Graikų](../el/README.md) | [Hebrajų](../he/README.md) | [Hindi](../hi/README.md) | [Vengrų](../hu/README.md) | [Indoneziečių](../id/README.md) | [Italų](../it/README.md) | [Japonų](../ja/README.md) | [Kannada](../kn/README.md) | [Kmerų](../km/README.md) | [Korėjiečių](../ko/README.md) | [Lietuvių](./README.md) | [Malajų](../ms/README.md) | [Malajalamo](../ml/README.md) | [Maratų](../mr/README.md) | [Nepaliečių](../ne/README.md) | [Nigerijos pidžinas](../pcm/README.md) | [Norvegų](../no/README.md) | [Persų (Farsi)](../fa/README.md) | [Lenkų](../pl/README.md) | [Portugalų (Brazilija)](../pt-BR/README.md) | [Portugalų (Portugalija)](../pt-PT/README.md) | [Pandžabi (Gurmukhi)](../pa/README.md) | [Rumunų](../ro/README.md) | [Rusų](../ru/README.md) | [Serbų (kirilica)](../sr/README.md) | [Slovakų](../sk/README.md) | [Slovėnų](../sl/README.md) | [Ispanų](../es/README.md) | [Svahili](../sw/README.md) | [Švedų](../sv/README.md) | [Tagalog (filipiniečių)](../tl/README.md) | [Tamilų](../ta/README.md) | [Telugų](../te/README.md) | [Tajų](../th/README.md) | [Turkų](../tr/README.md) | [Ukrainiečių](../uk/README.md) | [Urdų](../ur/README.md) | [Vietnamiečių](../vi/README.md)

> **Ar norite klonuoti lokaliai?**
>
> Šiame saugykloje yra daugiau nei 50 kalbų vertimų, kas žymiai padidina parsisiuntimo dydį. Norėdami klonuoti be vertimų, naudokite sparse checkout:
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
> This gives you everything you need to complete the course with a much faster download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Kas naujo azd šiandien

Azure Developer CLI išaugo už tradicinių žiniatinklio programų ir API ribų. Dabar azd yra vienintelis įrankis, skirtas diegti bet kokią programą į Azure — įskaitant dirbtiniu intelektu palaikomas programas ir intelektualius agentus.

Ką tai reiškia jums:

- **AI agentai dabar yra pirmos klasės azd darbo krūviai.** Galite inicijuoti, diegti ir valdyti AI agentų projektus naudodami tą pačią `azd init` → `azd up` eigą, kurią jau pažįstate.
- **Microsoft Foundry integracija** pateikia modelių diegimą, agentų talpinimą ir AI paslaugų konfigūraciją tiesiog į azd šablonų ekosistemą.
- **Pagrindinė eiga nepasikeitė.** Nesvarbu, ar diegiate todo programėlę, mikroservisą ar kelių agentų AI sprendimą, komandos yra tos pačios.

Jei anksčiau naudojote azd, AI palaikymas yra natūralus plėtinys — ne atskiras įrankis ar pažengęs kursas. Jei pradedate nuo nulio, išmoksite vieną eigą, kuri veikia viskam.

---

## 🚀 Kas yra Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** yra programuotojams draugiškas komandų eilutės įrankis, kuris palengvina programų diegimą į Azure. Vietoje to, kad rankiniu būdu kurtumėte ir jungtumėte daugybę Azure išteklių, galite diegti visą programą vienu komandu.

### „azd up“ stebuklas

```bash
# Ši viena komanda atlieka viską:
# ✅ Sukuria visus Azure išteklius
# ✅ Konfigūruoja tinklą ir saugumą
# ✅ Sudeda jūsų programos kodą
# ✅ Diegia į Azure
# ✅ Pateikia veikiančią URL nuorodą
azd up
```

**Tai viskas!** Jokių paspaudimų Azure portale, jokio sudėtingo ARM šablono mokymosi iš anksto, jokios rankinės konfigūracijos — tiesiog veikiantys programos sprendimai Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: koks skirtumas?

Tai dažniausiai užduodamas klausimas pradedantiesiems. Štai paprastas atsakymas:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Valdyti atskirus Azure išteklius | Diegti pilnas programas |
| **Mindset** | Infrastruktūros orientuota | Programos orientuota |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Reikia žinoti Azure paslaugas | Pakanka žinoti savo programą |
| **Best For** | DevOps, infrastruktūra | Programuotojai, prototipavimas |

### Paprasta analogija

- **Azure CLI** yra lyg turėti visus namo statybai reikalingus įrankius — kaltus, pjūklus, vinis. Galite pastatyti viską, bet turite žinoti statybą.
- **Azure Developer CLI** yra lyg samdyti rangovą — apibūdinate, ko norite, o jie pasirūpina statyba.

### Kada naudoti kurį

| Scenario | Use This |
|----------|----------|
| "Noriu greitai išdiegti savo žiniatinklio programą" | `azd up` |
| "Man reikia sukurti tik saugyklos paskyrą" | `az storage account create` |
| "Kuriu pilną AI programą" | `azd init --template azure-search-openai-demo` |
| "Man reikia derinti konkretų Azure išteklių" | `az resource show` |
| "Noriu gamybai paruošto diegimo per kelias minutes" | `azd up --environment production` |

### Jie veikia kartu!

AZD naudoja Azure CLI „po gaubtu“. Galite naudoti abu:
```bash
# Diegti jūsų programą su AZD
azd up

# Tada tiksliai sureguliuokite konkrečius išteklius naudodami Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Raskite šablonus Awesome AZD

Nesikurkite nuo nulio! **Awesome AZD** yra bendruomenės kolekcija paruoštų diegti šablonų:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Naršykite 200+ šablonų su vieno paspaudimo diegimu |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Prisidėkite savo šablonu prie bendruomenės |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Pažymėkite žvaigždute ir tyrinėkite šaltinį |

### Populiariausi AI šablonai iš Awesome AZD

```bash
# RAG pokalbis su Microsoft Foundry modeliais + AI paieška
azd init --template azure-search-openai-demo

# Greita AI pokalbių programa
azd init --template openai-chat-app-quickstart

# AI agentai su Foundry agentais
azd init --template get-started-with-ai-agents
```

---

## 🎯 Pradėkite per 3 žingsnius

Prieš pradėdami, įsitikinkite, kad jūsų mašina paruošta šablonui, kurį norite diegti:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jei bet kuris reikalavimas nepraeina, ištaisykite tai pirmiausia ir tęskite greitą pradžią.

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

### 2 žingsnis: Autentifikacija AZD

```bash
# Pasirinktinai, jei ketinate naudoti Azure CLI komandas tiesiogiai šiame kurse
az login

# Reikalinga AZD darbo eigoms
azd auth login
```

Jei nesate tikri, kurio jums reikia, sekite pilną nustatymo eigą [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### 3 žingsnis: Diegkite savo pirmąją programą

```bash
# Inicializuoti iš šablono
azd init --template todo-nodejs-mongo

# Diegti į Azure (sukuria viską!)
azd up
```

**🎉 Viskas!** Jūsų programa dabar veikia Azure.

### Išvalymas (nepamirškite!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kaip naudotis šiuo kursu

Šis kursas sukurtas progresiniam mokymuisi — pradėkite ten, kur jaučiatės patogiai, ir dirbkite aukštyn:

| Jūsų patirtis | Pradėti čia |
|-----------------|------------|
| **Visiškai naujas Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Žinau Azure, naujas AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Noriu diegti AI programas** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Noriu praktikos rankose** | [🎓 Interactive Workshop](workshop/README.md) - 3–4 valandų vedamas laboratorinis darbas |
| **Reikia gamybos modelių** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Greitas nustatymas

1. **Fork'inkite šį saugyklą**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonuokite ją**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Gaukite pagalbą**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Ar norite klonuoti lokaliai?**

> Šiame saugykloje yra daugiau nei 50 kalbų vertimų, kas žymiai padidina parsisiuntimo dydį. Norėdami klonuoti be vertimų, naudokite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> This gives you everything you need to complete the course with a much faster download.


## Kurso apžvalga

Įvaldykite Azure Developer CLI (azd) per struktūrizuotus skyrius, sukurtus progresiniam mokymuisi. **Ypatingas dėmesys AI programų diegimui su Microsoft Foundry integracija.**

### Kodėl šis kursas yra svarbus šiuolaikiniams programuotojams

Remiantis Microsoft Foundry Discord bendruomenės įžvalgomis, **45% programuotojų nori naudoti AZD AI darbo krūviams**, tačiau susiduria su iššūkiais, tokiais kaip:
- Sudėtingos kelių paslaugų AI architektūros
- Gamybos AI diegimo gerosios praktikos  
- Azure AI paslaugų integracija ir konfigūracija
- Sąnaudų optimizavimas AI darbo krūviams
- Problemų sprendimas, susijęs su AI diegimo klaidomis

### Mokymosi tikslai

Užbaigę šį struktūruotą kursą, jūs:
- **Įvaldysite AZD pagrindus**: pagrindinės sąvokos, diegimas ir konfigūracija
- **Diegsite AI programas**: naudokite AZD su Microsoft Foundry paslaugomis
- **Įgyvendinsite infrastruktūrą kaip kodą**: tvarkykite Azure išteklius su Bicep šablonais
- **Spręsite diegimo problemas**: išspręsite dažnas klaidas ir diagnozuosite problemas
- **Optimizuosite gamybai**: saugumas, skalavimas, stebėsena ir sąnaudų valdymas
- **Kursite kelių agentų sprendimus**: diegsite sudėtingas AI architektūras

## Prieš pradėdami: paskyros, prieiga ir prielaidos

Prieš pradėdami 1 skyrių, įsitikinkite, kad turite šiuos dalykus. Vėlesni šio vadovo diegimo veiksmai daro prielaidą, kad šios pagrindinės sąlygos jau yra sutvarkytos.
- **Azure prenumerata**: Galite naudoti esamą darbo ar asmeninę prenumeratą arba sukurti [free trial](https://aka.ms/azurefreetrial), kad pradėtumėte.
- **Leidimas kurti Azure išteklius**: Daugumai užduočių turėtumėte turėti bent **Contributor** teises tikslinei prenumeratai arba išteklių grupei. Kai kuriuose skyriuose taip pat gali būti daroma prielaida, kad galite kurti išteklių grupes, valdomas tapatybes ir RBAC priskyrimus.
- [**GitHub paskyra**](https://github.com): Tai naudinga šakai sukurti sau repozitoriją, sekti savo pakeitimus ir naudoti GitHub Codespaces dirbtuvei.
- **Šablono vykdymo prielaidos**: Kai kuriems šablonams reikalingi vietiniai įrankiai, tokie kaip Node.js, Python, Java arba Docker. Paleiskite nustatymo tikrintuvą prieš pradėdami, kad anksti pastebėtumėte trūkstamus įrankius.
- **Pagrindinės terminalo žinios**: Jums nereikia būti ekspertu, bet turėtumėte jaustis patogiai vykdydami komandas, tokias kaip `git clone`, `azd auth login` ir `azd up`.

> **Dirbate įmonės prenumeratoje?**
> Jei jūsų Azure aplinka yra valdoma administratorius, iš anksto patvirtinkite, kad galite diegti išteklius prenumeratoje ar išteklių grupėje, kurią planuojate naudoti. Jei ne, paprašykite smėlio dėžės prenumeratos arba Contributor teisių prieš pradėdami.

> **Naujas Azure?**
> Pradėkite su savo Azure bandomąja arba pay-as-you-go prenumerata adresu https://aka.ms/azurefreetrial, kad galėtumėte atlikti pratimus nuo pradžios iki galo nesulaukdami nuomininko lygio patvirtinimų.

## 🗺️ Kurso žemėlapis: Greita navigacija pagal skyrius

Kiekvienas skyrius turi atskirą README su mokymosi tikslais, greitu pradžios vadovu ir pratimais:

| Skyrius | Tema | Pamokos | Trukmė | Sudėtingumas |
|---------|-------|---------|----------|------------|
| **[Skyrius 1: Pagrindai](docs/chapter-01-foundation/README.md)** | Pradžia | [AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) &#124; [Įdiegimas](docs/chapter-01-foundation/installation.md) &#124; [Pirmasis projektas](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Skyrius 2: AI kūrimas](docs/chapter-02-ai-development/README.md)** | AI-pirmumo programos | [Foundry integracija](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agentai](docs/chapter-02-ai-development/agents.md) &#124; [Modelių diegimas](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Dirbtuvės](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 val. | ⭐⭐ |
| **[Skyrius 3: Konfigūracija](docs/chapter-03-configuration/README.md)** | Autentifikacija ir saugumas | [Konfigūracija](docs/chapter-03-configuration/configuration.md) &#124; [Autentifikacija ir saugumas](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Skyrius 4: Infrastruktūra](docs/chapter-04-infrastructure/README.md)** | IaC ir diegimas | [Diegimo vadovas](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Išteklių teikimas](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 val. | ⭐⭐⭐ |
| **[Skyrius 5: Daugiagentinė](examples/retail-scenario.md)** | AI agentų sprendimai | [Retail Scenario](examples/retail-scenario.md) &#124; [Koordinavimo šablonai](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 val. | ⭐⭐⭐⭐ |
| **[Skyrius 6: Priešdieginė](docs/chapter-06-pre-deployment/README.md)** | Planavimas ir patikra | [Priešdieginiai tikrinimai](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Talpos planavimas](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU pasirinkimas](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 val. | ⭐⭐ |
| **[Skyrius 7: Trikčių šalinimas](docs/chapter-07-troubleshooting/README.md)** | Derinimas ir klaidų taisymas | [Dažnos problemos](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Derinimas](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problemos](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 val. | ⭐⭐ |
| **[Skyrius 8: Gamyba](docs/chapter-08-production/README.md)** | Įmonių modeliai | [Gamybos praktikos](docs/chapter-08-production/production-ai-practices.md) | 2-3 val. | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktinės dirbtuvės | [Įvadas](workshop/docs/instructions/0-Introduction.md) &#124; [Pasirinkimas](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstrukcija](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigūravimas](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Tinkrinimas](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Išardymas](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Apibendrinimas](workshop/docs/instructions/7-Wrap-up.md) | 3-4 val. | ⭐⭐ |

**Bendras kurso trukmė:** ~10-14 val. | **Įgūdžių pažanga:** Pradedantysis → Paruoštas gamybai

---

## 📚 Mokymosi skyriai

*Pasirinkite mokymosi kelią pagal savo patirties lygį ir tikslus*

### 🚀 Skyrius 1: Pagrindai & Greitas startas
**Prieš pradedant**: „Azure“ prenumerata, pagrindinės žinios apie komandų eilutę  
**Trukmė**: 30-45 minutės  
**Sudėtingumas**: ⭐

#### Ką išmoksite
- Susipažinimas su Azure Developer CLI pagrindais
- AZD diegimas jūsų platformoje
- Jūsų pirmasis sėkmingas diegimas

#### Mokymosi ištekliai
- **🎯 Pradėkite čia**: [Kas yra Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorija**: [AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) - Pagrindinės sąvokos ir terminologija
- **⚙️ Nustatymas**: [Įdiegimas ir nustatymas](docs/chapter-01-foundation/installation.md) - Platformai pritaikyti vadovai
- **🛠️ Praktika**: [Jūsų pirmasis projektas](docs/chapter-01-foundation/first-project.md) - Žingsnis po žingsnio vadovas
- **📋 Greita nuoroda**: [Komandų atmintinė](resources/cheat-sheet.md)

#### Praktiniai pratimai
```bash
# Greita diegimo patikra
azd version

# Įdiekite savo pirmąją programą
azd init --template todo-nodejs-mongo
azd up
```

**💡 Skyriaus rezultatas**: Sėkmingai įdiegti paprastą interneto programą į Azure naudojant AZD

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

**📊 Laiko sąnaudos:** 30-45 minutės  
**📈 Gebėjimų lygis po:** Gali savarankiškai diegti pagrindines programas
**📈 Gebėjimų lygis po:** Gali savarankiškai diegti pagrindines programas

---

### 🤖 Skyrius 2: AI-pirmumo kūrimas (rekomenduojama AI kūrėjams)
**Prieš pradedant**: Užbaigtas 1 skyrius  
**Trukmė**: 1-2 val.  
**Sudėtingumas**: ⭐⭐

#### Ką išmoksite
- Microsoft Foundry integracija su AZD
- AI palaikomų programų diegimas
- AI paslaugų konfigūracijų supratimas

#### Mokymosi ištekliai
- **🎯 Pradėkite čia**: [Microsoft Foundry integracija](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agentai**: [AI agentų vadovas](docs/chapter-02-ai-development/agents.md) - Diegti intelektualius agentus su AZD
- **📖 Modeliai**: [Modelių diegimas](docs/chapter-02-ai-development/ai-model-deployment.md) - Diegti ir valdyti AI modelius
- **🛠️ Dirbtuvės**: [AI dirbtuvės](docs/chapter-02-ai-development/ai-workshop-lab.md) - Paruoškite savo AI sprendimus AZD
- **🎥 Interaktyvus vadovas**: [Workshop Materials](workshop/README.md) - Naršyklėje pagrįstas mokymasis su MkDocs * DevContainer Environment
- **📋 Šablonai**: [Microsoft Foundry Templates](#dirbtuvių-ištekliai)
- **📝 Pavyzdžiai**: [AZD diegimo pavyzdžiai](examples/README.md)

#### Praktiniai pratimai
```bash
# Įdiekite savo pirmąją DI programą
azd init --template azure-search-openai-demo
azd up

# Išbandykite papildomus DI šablonus
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Skyriaus rezultatas**: Įdiegti ir sukonfigūruoti AI palaikomą pokalbių programą su RAG galimybėmis

**✅ Sėkmės patvirtinimas:**
```bash
# Po 2 skyriaus turėtumėte sugebėti:
azd init --template azure-search-openai-demo
azd up
# Išbandyti dirbtinio intelekto pokalbių sąsają
# Užduoti klausimus ir gauti dirbtinio intelekto generuotus atsakymus su šaltiniais
# Patikrinti, ar paieškos integracija veikia
azd monitor  # Patikrinti, ar Application Insights rodo telemetriją
azd down --force --purge
```

**📊 Laiko sąnaudos:** 1-2 val.  
**📈 Gebėjimų lygis po:** Gali diegti ir sukonfigūruoti gamybai paruoštas AI programas  
**💰 Kainos suvokimas:** Supraskite $80-150/mėn kūrimo išlaidas, $300-3500/mėn gamybos išlaidas

#### 💰 Išlaidų svarstymai AI diegimams

**Kūrimo aplinka (apytiksliai $80-150/mėn):**
- Microsoft Foundry modeliai (Pay-as-you-go): $0-50/mėn (pagal žetonų naudojimą)
- AI Search (Basic tier): $75/mėn
- Container Apps (Consumption): $0-20/mėn
- Storage (Standard): $1-5/mėn

**Gamybinė aplinka (apytiksliai $300-3,500+/mėn):**
- Microsoft Foundry modeliai (PTU dėl nuoseklaus našumo): $3,000+/mėn ARBA Pay-as-go dideliu naudojimu
- AI Search (Standard tier): $250/mėn
- Container Apps (Dedicated): $50-100/mėn
- Application Insights: $5-50/mėn
- Storage (Premium): $10-50/mėn

**💡 Patarimai, kaip optimizuoti išlaidas:**
- Naudokite **Free Tier** Microsoft Foundry modelius mokymuisi (Azure OpenAI 50,000 žetonų/mėn įskaičiuota)
- Paleiskite `azd down`, kad deallokuotumėte išteklius, kai aktyviai nekuriate
- Pradėkite nuo naudojimu pagrįsto apmokėjimo, pereikite prie PTU tik gamybai
- Naudokite `azd provision --preview`, kad įvertintumėte išlaidas prieš diegimą
- Įjunkite automatinį skalavimą: mokėkite tik už faktinį naudojimą

**Išlaidų stebėjimas:**
```bash
# Patikrinkite apskaičiuotas mėnesio išlaidas
azd provision --preview

# Stebėkite faktines išlaidas Azure portale
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Skyrius 3: Konfigūracija & Autentifikacija
**Prieš pradedant**: Užbaigtas 1 skyrius  
**Trukmė**: 45-60 minutės  
**Sudėtingumas**: ⭐⭐

#### Ką išmoksite
- Aplinkos konfigūravimas ir valdymas
- Autentifikacija ir saugumo geriausios praktikos
- Išteklių vardų suteikimas ir organizavimas

#### Mokymosi ištekliai
- **📖 Konfigūracija**: [Konfigūracijos vadovas](docs/chapter-03-configuration/configuration.md) - Aplinkos nustatymas
- **🔐 Saugumas**: [Autentifikavimo modeliai ir valdomos tapatybės](docs/chapter-03-configuration/authsecurity.md) - Autentifikavimo modeliai
- **📝 Pavyzdžiai**: [Duomenų bazės programos pavyzdys](examples/database-app/README.md) - AZD duomenų bazės pavyzdžiai

#### Praktiniai pratimai
- Sukonfigūruokite kelias aplinkas (dev, staging, prod)
- Nustatykite valdomos tapatybės autentifikaciją
- Įgyvendinkite aplinkai specifines konfigūracijas

**💡 Skyriaus rezultatas**: Valdyti kelias aplinkas su tinkama autentifikacija ir saugumu

---

### 🏗️ Skyrius 4: Infrastruktūra kaip kodas & Diegimas
**Prieš pradedant**: Užbaigti 1-3 skyriai  
**Trukmė**: 1-1.5 val.  
**Sudėtingumas**: ⭐⭐⭐

#### Ką išmoksite
- Pažangūs diegimo modeliai
- Infrastruktūra kaip kodas naudojant Bicep
- Išteklių teikimo strategijos

#### Mokymosi ištekliai
- **📖 Diegimas**: [Diegimo vadovas](docs/chapter-04-infrastructure/deployment-guide.md) - Visos darbo eigos
- **🏗️ Teikimas**: [Išteklių teikimas](docs/chapter-04-infrastructure/provisioning.md) - Azure išteklių valdymas
- **📝 Pavyzdžiai**: [Container App pavyzdys](../../examples/container-app) - Konteinerizuoti diegimai

#### Praktiniai pratimai
- Sukurti pasirinktines Bicep šablonus
- Diegti kelių paslaugų taikomąsias programas
- Įgyvendinti blue-green diegimo strategijas

**💡 Skyriaus rezultatas**: Diegti sudėtingas kelių paslaugų programas naudojant pasirinktinius infrastruktūros šablonus

---

### 🎯 Skyrius 5: Daugiagentiniai AI sprendimai (Pažengusiems)
**Prieš pradedant**: Užbaigti 1-2 skyriai  
**Trukmė**: 2-3 val.  
**Sudėtingumas**: ⭐⭐⭐⭐

#### Ką išmoksite
- Daugiagentės architektūros modeliai
- Agentų orkestracija ir koordinavimas
- Gamybai paruošti AI diegimai

#### Mokymosi ištekliai
- **🤖 Pagrindinis projektas**: [Mažmeninės prekybos daugiagentinis sprendimas](examples/retail-scenario.md) - Pilna įgyvendinimo versija
- **🛠️ ARM šablonai**: [ARM šablonų paketas](../../examples/retail-multiagent-arm-template) - Vieno paspaudimo diegimas
- **📖 Architektūra**: [Daugiagentės koordinavimo modeliai](docs/chapter-06-pre-deployment/coordination-patterns.md) - Modeliai

#### Praktiniai pratimai
```bash
# Įdiegti visą mažmeninės prekybos daugiagentinį sprendimą
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tyrinėti agentų konfigūracijas
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Skyriaus rezultatas**: Įdiegti ir valdyti gamybai parengtą daugiagentinį AI sprendimą su Kliento ir Inventoriaus agentais

---

### 🔍 Skyrius 6: Priešdieginė validacija & Planavimas
**Prieš pradedant**: Užbaigtas 4 skyrius  
**Trukmė**: 1 val.  
**Sudėtingumas**: ⭐⭐
#### Ko išmoksite
- Talpos planavimas ir išteklių patikra
- SKU pasirinkimo strategijos
- Priešdiegimo patikrinimai ir automatizavimas

#### Mokymosi ištekliai
- **📊 Planavimas**: [Talpos planavimas](docs/chapter-06-pre-deployment/capacity-planning.md) - Išteklių patikra
- **💰 Pasirinkimas**: [SKU pasirinkimas](docs/chapter-06-pre-deployment/sku-selection.md) - Kaina efektyvūs pasirinkimai
- **✅ Patikra**: [Priešdiegimo patikrinimai](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizuoti skriptai

#### Praktinės užduotys
- Paleisti talpos patikros skriptus
- Optimizuoti SKU pasirinkimus pagal kainą
- Įdiegti automatizuotus priešdiegimo patikrinimus

**💡 Skyriaus rezultatas**: Patikrinti ir optimizuoti diegimus prieš vykdymą

---

### 🚨 7 skyrius: Gedimų šalinimas ir derinimas
**Išankstiniai reikalavimai**: Užbaigtas bet kuris diegimo skyrius  
**Trukmė**: 1–1.5 val.  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Sistemingi derinimo metodai
- Dažnos problemos ir sprendimai
- AI specifinis gedimų šalinimas

#### Mokymosi ištekliai
- **🔧 Dažnos problemos**: [Dažnos problemos](docs/chapter-07-troubleshooting/common-issues.md) - DUK ir sprendimai
- **🕵️ Derinimas**: [Derinimo vadovas](docs/chapter-07-troubleshooting/debugging.md) - Žingsnis po žingsnio strategijos
- **🤖 AI problemos**: [AI specifinis gedimų šalinimas](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI paslaugų problemos

#### Praktinės užduotys
- Diagnostikuoti diegimo klaidas
- Išspręsti autentifikacijos problemas
- Derinti AI paslaugų ryšį

**💡 Skyriaus rezultatas**: Savarankiškai diagnozuoti ir išspręsti įprastas diegimo problemas

---

### 🏢 8 skyrius: Gamybiniai ir įmonių modeliai
**Išankstiniai reikalavimai**: Užbaigti 1–4 skyriai  
**Trukmė**: 2–3 val.  
**Sudėtingumas**: ⭐⭐⭐⭐

#### Ko išmoksite
- Gamybinio diegimo strategijos
- Įmonių saugumo modeliai
- Stebėjimas ir kaštų optimizavimas

#### Mokymosi ištekliai
- **🏭 Gamyba**: [Gamybinės AI gerosios praktikos](docs/chapter-08-production/production-ai-practices.md) - Įmonių modeliai
- **📝 Pavyzdžiai**: [Mikroservisų pavyzdys](../../examples/microservices) - Sudėtingos architektūros
- **📊 Stebėjimas**: [Application Insights integracija](docs/chapter-06-pre-deployment/application-insights.md) - Stebėjimas

#### Praktinės užduotys
- Įgyvendinti įmonių saugumo modelius
- Nustatyti išsamų stebėjimą
- Diegti į gamybą su tinkamu valdymu

**💡 Skyriaus rezultatas**: Diegti įmonėms paruoštas programas su pilnomis gamybinėmis galimybėmis

---

## 🎓 Dirbtuvių apžvalga: praktinis mokymosi patyrimas

> **⚠️ DIRBTUVIŲ STATUSAS: Vykdoma plėtra**  
> Dirbtuvių medžiaga šiuo metu yra ruošiama ir tobulinama. Pagrindiniai moduliai veikia, tačiau kai kurios pažangesnės dalys yra nebaigtos. Intensyviai dirbame, kad užbaigtume visą turinį. [Stebėti pažangą →](workshop/README.md)

### Interaktyvios dirbtuvės medžiagos
**Išsamus praktinis mokymasis su naršyklėje veikiančiais įrankiais ir vedamomis užduotimis**

Mūsų dirbtuvių medžiaga suteikia struktūrizuotą, interaktyvų mokymosi patyrimą, papildantį aukščiau pateiktą skyrių pagrindu sudarytą mokymo programą. Dirbtuvės skirtos tiek savarankiškam mokymuisi, tiek instruktoriaus vedamoms sesijoms.

#### 🛠️ Dirbtuvių ypatybės
- **Naršyklėje veikianti sąsaja**: Pilnos MkDocs pagrindu sukurtos dirbtuvės su paieška, kopijavimo ir temos funkcijomis
- **GitHub Codespaces integracija**: Vieno spustelėjimo kūrimo aplinkos paruošimas
- **Struktūruota mokymosi eiga**: 8 modulių vedamos užduotys (iš viso 3–4 val.)
- **Progresinė metodika**: Įvadas → Parinkimas → Patikra → Išardymas → Konfigūravimas → Priderinimas → Išjungimas → Apibendrinimas
- **Interaktyvi DevContainer aplinka**: Iš anksto sukonfigūruoti įrankiai ir priklausomybės

#### 📚 Dirbtuvių modulio struktūra
Dirbtuvės seka **8 modulų progresinę metodiką**, kuri veda nuo atradimo iki diegimo meistriškumo:

| Modulis | Tema | Ką darysite | Trukmė |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Suprasti mokymosi tikslus, išankstinius reikalavimus ir dirbtuvių struktūrą | 15 min |
| **1. Selection** | Template Discovery | Išnagrinėti AZD šablonus ir pasirinkti tinkamą AI šabloną savo scenarijui | 20 min |
| **2. Validation** | Deploy & Verify | Išdiegti šabloną su `azd up` ir patikrinti, ar infrastruktūra veikia | 30 min |
| **3. Deconstruction** | Understand Structure | Naudoti GitHub Copilot, kad ištirtumėte šablono architektūrą, Bicep failus ir kodo organizavimą | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Išmokti `azure.yaml` konfigūracijos, lifecycle hook'ų ir aplinkos kintamųjų valdymo | 30 min |
| **5. Customization** | Make It Yours | Įjungti AI paiešką, sekimą, vertinimą ir pritaikyti šabloną savo scenarijui | 45 min |
| **6. Teardown** | Clean Up | Saugiu būdu pašalinti resursus naudojant `azd down --purge` | 15 min |
| **7. Wrap-up** | Next Steps | Peržiūrėti pasiektus rezultatus, pagrindines sąvokas ir toliau planuoti mokymąsi | 15 min |

**Dirbtuvių eiga:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Kaip pradėti su dirbtuvėmis
```bash
# Parinktis 1: GitHub Codespaces (rekomenduojama)
# Spustelėkite "Code" → "Create codespace on main" saugykloje

# Parinktis 2: Vietinis vystymas
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Vadovaukitės nustatymo instrukcijomis faile workshop/README.md
```

#### 🎯 Dirbtuvių mokymosi rezultatai
Baigę dirbtuves, dalyviai sugebės:
- **Diegti gamybines AI programas**: Naudoti AZD su Microsoft Foundry paslaugomis
- **Išmanyti daugiaagentų architektūras**: Įgyvendinti koordinuotas AI agentų sprendimus
- **Įgyvendinti geriausias saugumo praktikas**: Konfigūruoti autentifikaciją ir prieigos valdymą
- **Optimizuoti mastelį**: Sukurti ekonomiškus, našius diegimus
- **Diagnostikuoti diegimus**: Savarankiškai spręsti dažnas problemas

#### 📖 Dirbtuvių ištekliai
- **🎥 Interaktyvus vadovas**: [Workshop Materials](workshop/README.md) - Naršyklėje veikianti mokymosi aplinka
- **📋 Instrukcijos modulis po modulio**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Dirbtuvių apžvalga ir tikslai
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Rasti ir pasirinkti AI šablonus
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Išdiegti ir patikrinti šablonus
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Ištirti šablono architektūrą
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Išmanyti azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Pritaikyti šabloną savo scenarijui
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Išvalyti resursus
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Apžvalga ir tolesni žingsniai
- **🛠️ AI dirbtuvių laboratorija**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI orientuotos užduotys
- **💡 Greitas startas**: [Workshop Setup Guide](workshop/README.md#quick-start) - Aplinkos konfigūracija

**Puikiai tinka**: Įmonių mokymams, universiteto kursams, savarankiškam mokymuisi ir programuotojų stovykloms.

---

## 📖 Gilus panirimas: AZD galimybės

Už bazinių funkcijų ribų, AZD suteikia galingas galimybes gamybinėms diegimo sąrankoms:

- **Diegimai remiantis šablonais** - Naudokite iš anksto paruoštus šablonus įprastiems programų modeliams
- **Infrastruktūra kaip kodas** - Valdykite Azure išteklius naudodami Bicep arba Terraform  
- **Integruoti darbų srautai** - Sklandžiai priskirkite, diegkite ir stebėkite programas
- **Draugiška kūrėjui** - Optimizuota kūrėjo produktyvumui ir patirčiai

### **AZD + Microsoft Foundry: Puiku AI diegimams**

**Kodėl AZD AI sprendimams?** AZD sprendžia pagrindines problemas, su kuriomis susiduria AI kūrėjai:

- **AI paruošti šablonai** - Iš anksto sukonfigūruoti šablonai Microsoft Foundry modeliams, Cognitive Services ir ML apkrovoms
- **Saugūs AI diegimai** - Integruoti saugumo modeliai AI paslaugoms, API raktams ir modelių galiniams taškams  
- **Gamybiniai AI modeliai** - Geriausios praktikos skalėms ir kaštų efektyvumui
- **Viso proceso AI srautai** - Nuo modelio vystymo iki gamybinio diegimo su tinkamu stebėjimu
- **Kaštų optimizavimas** - Protingas išteklių paskirstymas ir skaliavimo strategijos AI apkrovoms
- **Microsoft Foundry integracija** - Sklandi sąsaja su Microsoft Foundry modelių katalogu ir galiniais taškais

---

## 🎯 Šablonų ir pavyzdžių biblioteka

### Išskirtiniai: Microsoft Foundry šablonai
**Pradėkite čia, jei diegiate AI programas!**

> **Pastaba:** Šie šablonai demonstruoja įvairius AI modelius. Kai kurie yra išoriniai Azure pavyzdžiai, kiti – vietinės įgyvendinimo versijos.

| Šablonas | Skyrius | Sudėtingumas | Paslaugos | Tipas |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Skyrius 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Išorinis |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Skyrius 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Išorinis |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Skyrius 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Išorinis |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Skyrius 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Išorinis |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Skyrius 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Išorinis |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Skyrius 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Išorinis |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Skyrius 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Vietinis** |

### Išskirtiniai: Pilni mokymosi scenarijai
**Gamybai paruošti programų šablonai, susieti su mokymosi skyriais**

| Šablonas | Mokymosi skyrius | Sudėtingumas | Pagrindinė pamoka |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Skyrius 2 | ⭐ | Pagrindiniai AI diegimo modeliai |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Skyrius 2 | ⭐⭐ | RAG įgyvendinimas su Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Skyrius 4 | ⭐⭐ | Dokumentų intelekto integracija |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Skyrius 5 | ⭐⭐⭐ | Agentų sistema ir funkcijų iškvietimai |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Skyrius 8 | ⭐⭐⭐ | Įmonių AI orkestracija |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Skyrius 5 | ⭐⭐⭐⭐ | Daugiaagentė architektūra su klientų ir inventoriaus agentais |

### Mokymasis per pavyzdžius

> **📌 Vietiniai vs. Išoriniai pavyzdžiai:**  
> **Vietiniai pavyzdžiai** (šioje saugykloje) = Paruošti naudoti iš karto  
> **Išoriniai pavyzdžiai** (Azure Samples) = Klonuoti iš susietų saugyklų

#### Vietiniai pavyzdžiai (paruošti naudoti)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Pilnas gamybai paruoštas įgyvendinimas su ARM šablonais
  - Daugiaagentė architektūra (Klientas + Inventorius agentai)
  - Išsamus stebėjimas ir vertinimas
  - Vieno spustelėjimo diegimas per ARM šabloną

#### Vietiniai pavyzdžiai - Container aplikacijos (Skyriai 2–5)
**Išsamūs konteinerizuotų diegimų pavyzdžiai šiame repozitorijoje:**
- [**Container App Examples**](examples/container-app/README.md) - Pilnas vadovas konteinerizuotiems diegimams
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Pagrindinis REST API su scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Gamybai paruoštas daugiapaslapių paslaugų diegimas
  - Greito starto, gamybos ir pažangūs diegimo modeliai
  - Stebėjimo, saugumo ir kaštų optimizavimo rekomendacijos

#### Išoriniai pavyzdžiai - Paprastos aplikacijos (Skyriai 1–2)
**Klonuokite šias Azure Samples saugyklas, kad pradėtumėte:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pagrindiniai diegimo modeliai
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statinio turinio diegimas
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API diegimas

#### Išoriniai pavyzdžiai - Duomenų bazės integracija (Skyrius 3–4)
- [Duomenų bazės programėlė - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Duomenų bazės ryšio modeliai
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless duomenų darbo eiga

#### Išoriniai pavyzdžiai - pažangūs modeliai (skyrius 4-8)
- [Java mikroservisai](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architektūros su keliais servisais
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Fono apdorojimas  
- [Įmoninis ML srautas](https://github.com/Azure-Samples/mlops-v2) - Gamybai paruošti ML modeliai

### Išorinės šablonų kolekcijos
- [**Oficiali AZD šablonų galerija**](https://azure.github.io/awesome-azd/) - Atrinkta oficialių ir bendruomenės šablonų kolekcija
- [**Azure Developer CLI šablonai**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn šablonų dokumentacija
- [**Pavyzdžių katalogas**](examples/README.md) - Vietiniai mokymosi pavyzdžiai su išsamiais paaiškinimais

---

## 📚 Mokymosi ištekliai ir nuorodos

### Greitos nuorodos
- [**Komandų atmintinė**](resources/cheat-sheet.md) - Būtinos azd komandos suskirstytos pagal skyrių
- [**Sąvokynas**](resources/glossary.md) - Azure ir azd terminai  
- [**DUK**](resources/faq.md) - Dažniausiai užduodami klausimai suskirstyti pagal mokymosi skyrių
- [**Mokymosi vadovas**](resources/study-guide.md) - Išsamios praktikos užduotys

### Praktinės dirbtuvės
- [**AI dirbtuvių laboratorija**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Padarykite savo AI sprendimus diegiamus su AZD (2-3 val.)
- [**Interaktyvios dirbtuvės**](workshop/README.md) - 8 modulių vedami pratimai su MkDocs ir GitHub Codespaces
  - Sekos: Įvadas → Pasirinkimas → Patikrinimas → Išardymas → Konfigūravimas → Pritaikymas → Išjungimas → Apibendrinimas

### Išoriniai mokymosi ištekliai
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure kainų skaičiuoklė](https://azure.microsoft.com/pricing/calculator/)
- [Azure būklė](https://status.azure.com/)

### AI agentų įgūdžiai jūsų redaktoriui
- [**Microsoft Azure įgūdžiai skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 atviri agentų įgūdžiai Azure AI, Foundry, diegimui, diagnostikai, išlaidų optimizavimui ir kt. Įdiekite juos į GitHub Copilot, Cursor, Claude Code ar bet kurį palaikomą agentą:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Greitas trikčių šalinimo vadovas

**Dažniausios problemos, su kuriomis susiduria pradedantieji, ir greiti sprendimai:**

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
# Išvardyti galimas prenumeratas
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
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

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
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Parinktis 1: Išvalyti ir bandyti iš naujo
azd down --force --purge
azd up

# Parinktis 2: Tiesiog sutvarkyti infrastruktūrą
azd provision

# Parinktis 3: Patikrinti išsamią būseną
azd show

# Parinktis 4: Patikrinti žurnalus Azure Monitor įrankyje
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Pakartotinai autentifikuokite AZD
azd auth logout
azd auth login

# Pasirinktinai: taip pat atnaujinkite Azure CLI, jei vykdote az komandas
az logout
az login

# Patikrinkite autentifikaciją
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD generuoja unikalius pavadinimus, bet jei yra konfliktas:
azd down --force --purge

# Tada bandykite dar kartą su nauja aplinka
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Šablono diegimas užtrunka per ilgai</strong></summary>

**Įprasti laukimo laikai:**
- Paprasta žiniatinklio programa: 5-10 minučių
- Programa su duomenų baze: 10-15 minučių
- AI programos: 15-25 minučių (OpenAI teikimas vyksta lėtai)

```bash
# Patikrinkite pažangą
azd show

# Jei užstrigote ilgiau nei 30 minučių, patikrinkite Azure portalą:
azd monitor --overview
# Ieškokite nepavykusių diegimų
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Patikrinkite savo Azure vaidmenį
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Jums reikalingas bent „Contributor“ vaidmuo
# Prašykite savo Azure administratoriaus suteikti:
# - „Contributor“ (resursams)
# - „User Access Administrator“ (vaidmenų priskyrimams)
```
</details>

<details>
<summary><strong>❌ Negalite rasti išdiegto programos URL</strong></summary>

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

- **Bendros problemos vadovas:** [Išsamūs sprendimai](docs/chapter-07-troubleshooting/common-issues.md)
- **AI specifinės problemos:** [AI trikčių šalinimas](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Klaidų paieškos vadovas:** [Žingsnis po žingsnio derinimas](docs/chapter-07-troubleshooting/debugging.md)
- **Gaukite pagalbos:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurso užbaigimas ir sertifikavimas

### Progreso sekimas
Sekite savo mokymosi pažangą per kiekvieną skyrių:

- [ ] **1 skyrius**: Pagrindai ir greitas startas ✅
- [ ] **2 skyrius**: AI pirmumo kūrimas ✅  
- [ ] **3 skyrius**: Konfigūracija ir autentifikacija ✅
- [ ] **4 skyrius**: Infrastruktūra kaip kodas ir diegimas ✅
- [ ] **5 skyrius**: Daugiagentiniai AI sprendimai ✅
- [ ] **6 skyrius**: Išankstinė patikra ir planavimas prieš diegimą ✅
- [ ] **7 skyrius**: Trikčių šalinimas ir derinimas ✅
- [ ] **8 skyrius**: Gamyba ir įmonės modeliai ✅

### Mokymosi patvirtinimas
Po kiekvieno skyriaus atlikite žinių patikrą:
1. **Praktinė užduotis**: Atlikite skyriuje nurodytą diegimą
2. **Žinių patikra**: Peržiūrėkite DUK skiltį savo skyriui
3. **Bendruomenės diskusija**: Pasidalinkite savo patirtimi Azure Discord
4. **Kitas skyrius**: Pereikite prie kito sudėtingumo lygio

### Kurso baigimo privalumai
Baigę visus skyrius, turėsite:
- **Patirtis gamyboje**: Išdiegėte realias AI programas į Azure
- **Profesionalūs įgūdžiai**: Diegimo galimybės, paruoštos įmonėms  
- **Pripažinimas bendruomenėje**: Aktyvus Azure kūrėjų bendruomenės narys
- **Karjeros pažanga**: Paklausa turinti AZD ir AI diegimo ekspertizė

---

## 🤝 Bendruomenė ir pagalba

### Gaukite pagalbą ir palaikymą
- **Techninės problemos**: [Praneškite apie klaidas ir prašykite funkcijų](https://github.com/microsoft/azd-for-beginners/issues)
- **Mokymosi klausimai**: [Microsoft Azure Discord bendruomenė](https://discord.gg/microsoft-azure) ir [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI specifinė pagalba**: Prisijunkite prie [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Oficiali Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Bendruomenės įžvalgos iš Microsoft Foundry Discord

**Neseniai atliktos apklausos rezultatai iš #Azure kanalo:**
- **45%** kūrėjų nori naudoti AZD AI darbo krūviams
- **Pagrindinės problemos**: daugiaservisiai diegimai, kredencialų valdymas, gamybos paruošimas  
- **Dažniausiai prašomi dalykai**: AI specifiniai šablonai, trikčių šalinimo vadovai, geriausios praktikos

**Prisijunkite prie mūsų bendruomenės, kad:**
- Pasidalintumėte savo AZD + AI patirtimi ir gautumėte pagalbą
- Gautumėte ankstyvas naujų AI šablonų peržiūras
- Prisidėtumėte prie AI diegimo geriausios praktikos
- Turėtumėte įtakos būsimam AI + AZD funkcijų vystymui

### Prisidėjimas prie kurso
Laukiame indėlių! Prašome perskaityti mūsų [Contributing Guide](CONTRIBUTING.md) dėl informacijos apie:
- **Turinio patobulinimus**: Tobulinkite esamus skyrius ir pavyzdžius
- **Nauji pavyzdžiai**: Pridėkite realaus pasaulio scenarijus ir šablonus  
- **Vertimas**: Padėkite palaikyti daugakalbystę
- **Klaidų pranešimai**: Pagerinkite tikslumą ir aiškumą
- **Bendruomenės standartai**: Laikykitės mūsų įtraukių bendruomenės gairių

---

## 📄 Kurso informacija

### Licencija
Šis projektas licencijuotas pagal MIT licenciją - daugiau informacijos žr. faile [LICENSE](../../LICENSE).

### Susiję Microsoft mokymosi ištekliai

Mūsų komanda kuria kitus visapusiškus mokymosi kursus:

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
[![AI Agentai pradedantiesiems](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatyvinio AI serija
[![Generatyvinis AI pradedantiesiems](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatyvinis AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatyvinis AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatyvinis AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Pagrindinis mokymasis
[![ML pradedantiesiems](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Duomenų mokslas pradedantiesiems](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Dirbtinis intelektas pradedantiesiems](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kibernetinis saugumas pradedantiesiems](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Tinklapių kūrimas pradedantiesiems](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![Daiktų internetas pradedantiesiems](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR kūrimas pradedantiesiems](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot serija
[![Copilot dirbtinio intelekto poriniam programavimui](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot nuotykiai](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurso navigacija

**🚀 Pasiruošę pradėti mokytis?**

**Pradedantieji**: Pradėkite nuo [1 skyrius: Pagrindai ir greitas startas](#-chapter-1-foundation--quick-start)  
**Dirbtinio intelekto kūrėjai**: Eikite į [2 skyrius: DI-pirmasis vystymas](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Patyrę kūrėjai**: Pradėkite nuo [3 skyrius: Konfigūracija ir autentifikacija](#️-chapter-3-configuration--authentication)

**Tolimesni žingsniai**: [Pradėkite 1 skyrių - AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas patikimiausiu šaltiniu. Dėl svarbios informacijos rekomenduojama kreiptis į profesionalų vertėją. Mes neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kilusius naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->