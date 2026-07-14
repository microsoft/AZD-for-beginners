# AZD Pradedantiesiems: Struktūruotas Mokymosi Kelias

![AZD-for-beginners](../../translated_images/lt/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiniai Vertimai (Visada Naujausi)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](./README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Norite klonuoti lokaliai?**
>
> Šiame repozitorijoje yra daugiau nei 50 kalbų vertimų, kurie ženkliai padidina atsisiuntimo dydį. Norėdami klonuoti be vertimų, naudokite skardų patikrinimą:
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
> Tai suteikia viską, ko reikia kursui užbaigti, su daug greitesniu atsisiuntimu.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Kas Naujai azd Šiandien

> 📌 Šis kursas yra patikrintas su **`azd 1.27.1`** (2026 m. liepa). Paleiskite `azd version`, kad patikrintumėte savo versiją, ir `azd upgrade`, kad atnaujintumėte į naujausią.

Azure Developer CLI išaugo už tradicinių žiniatinklio programų ir API ribų. Šiandien azd yra vienintelis įrankis diegti **bet kokias** programas Azure - įskaitant AI galias turinčias programas ir intelektualius agentus.

Tai reiškia jums:

- **AI agentai dabar yra pirmos klasės azd darbo krūviai.** Galite inicializuoti, diegti ir valdyti AI agentų projektus naudodami tą pačią `azd init` → `azd up` darbo eigą, kurią jau žinote.
- **Visas agento gyvenimo ciklas iš CLI.** `azure.ai.agents` plėtinys dabar apima visą kelionę—`azd ai agent init` norint sukurti pavyzdį, `azd ai agent invoke` testavimui (su atsakymo laiko išvedimu), `azd ai agent eval generate` ir `azd ai agent optimize` kokybei matuoti ir tobulinti, bei `azd ai agent delete` sutvarkymui.
- **Daugiau AI kūrimo blokų.** Nauji peržiūros plėtiniai—`azure.ai.skills` ir `azure.ai.connections`—leidžia valdyti pakartotinai naudojamus agentų įgūdžius ir Foundry jungtis tiesiogiai su azd.
- **Microsoft Foundry integracija** atneša modelio diegimą, agentų talpinimą ir AI paslaugų konfigūraciją tiesiogiai į azd šablonų ekosistemą.
- **Sklandesni kasdieniai pagrindai.** Naujausi leidimai padarė `azd init` beskoniu (saugus pakartotiniam paleidimui), automatiškai išvalė pasenusius raktus `azd auth login` metu ir pridėjo draugišką `azd tool` pirmojo paleidimo nustatymo vedlį.
- **Pagrindinė darbo eiga nepakito.** Nesvarbu, ar diegiate užduočių sąrašą, mikroservisą, ar daugiaagentę AI sprendimą, komandos yra tos pačios.

> **Pastaba Aspire naudotojams:** Microsoft dabar produktą vadina tiesiog **Aspire** (anksčiau ".NET Aspire"). Azd Aspire palaikymas nepasikeitė – tik pavadinimas atnaujintas.

Jei jau naudojote azd anksčiau, AI palaikymas yra natūrali plėtra – ne atskiras įrankis ar pažengęs kursas. Jei pradedate nuo nulio, išmoksite vieną darbo eigą, kuri tinka viskam.

---

## 🚀 Kas Yra Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** yra kūrėjui draugiškas komandų eilutės įrankis, kuris palengvina programų diegimą Azure. Vietoje to, kad rankiniu būdu kurtumėte ir jungtumėte krūvas Azure išteklių, galite diegti visas programas vienu komandos paleidimu.

### `azd up` Magija

```bash
# Ši viena komanda atlieka viską:
# ✅ Sukuria visus Azure išteklius
# ✅ Konfigūruoja tinklus ir saugumą
# ✅ Konstruoja jūsų programos kodą
# ✅ Diegia į Azure
# ✅ Pateikia veikiančią URL nuorodą
azd up
```

**Štai ir viskas!** Nereikia spausti Azure portale, mokytis sudėtingų ARM šablonų ar rankiniu būdu konfigūruoti – tiesiog veikianti programa Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Kuo Skiriasi?

Tai dažniausias pradedančiųjų klausimas. Štai paprastas atsakymas:

| Funkcija | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Paskirtis** | Valdyti atskirus Azure išteklius | Diegti pilnas programas |
| **Mąstysena** | Infrastructure fokusas | Programos fokusas |
| **Pavyzdys** | `az webapp create --name myapp...` | `azd up` |
| **Mokymosi kreivė** | Reikia žinoti Azure paslaugas | Tereikia žinoti savo programą |
| **Tinka geriausiai** | DevOps, Infrastruktūra | Kūrėjai, prototipavimas |

### Paprasta Panašybė

- **Azure CLI** tarsi turėti visus įrankius statyti namą - plaktukus, pjūklus, vinis. Gali statyti bet ką, bet reikia statybų žinių.
- **Azure Developer CLI** tarsi samdyti rangovą - aprašai, ko nori, o jis tvarko statybą.

### Kada Kurią Naudoti

| Scenarijus | Naudokite Šią |
|----------|----------|
| "Noriu greitai įdiegti savo žiniatinklio programą" | `azd up` |
| "Reikia sukurti tik saugyklos paskyrą" | `az storage account create` |
| "Kuriu pilną AI programą" | `azd init --template azure-search-openai-demo` |
| "Reikia derinti konkretų Azure išteklių" | `az resource show` |
| "Noriu gamybai paruošto diegimo per kelias minutes" | `azd up --environment production` |

### Jie Veikia Kartu!

AZD išnaudoja Azure CLI po gaubtu. Galite naudoti abu:
```bash
# Įdiekite savo programą su AZD
azd up

# Tada tiksliai sureguliuokite konkrečius išteklius su Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Raskite Šablonus Awesome AZD

Neskubėkite pradėti nuo nulio! **Awesome AZD** yra bendruomenės paruoštų diegti šablonų kolekcija:

| Išteklis | Aprašymas |
|----------|-------------|
| 🔗 [**Awesome AZD galerija**](https://azure.github.io/awesome-azd/) | Naršykite per 200+ šablonų su vieno paspaudimo diegimu |
| 🔗 [**Pateikti šabloną**](https://github.com/Azure/awesome-azd/issues) | Prisidėkite savo šabloną bendruomenei |
| 🔗 [**GitHub Repozitorija**](https://github.com/Azure/awesome-azd) | Žvaigždėkite ir tyrinėkite šaltinį |

### Populiarūs AI šablonai iš Awesome AZD

```bash
# RAG pokalbis su Microsoft Foundry modeliais + AI paieška
azd init --template azure-search-openai-demo

# Greita AI pokalbių programa
azd init --template openai-chat-app-quickstart

# AI agentai su Foundry agentais
azd init --template get-started-with-ai-agents
```

---

## 🎯 Pradžia per 3 žingsnius

Prieš pradėdami, įsitikinkite, kad jūsų įrenginys paruoštas diegti norimą šabloną:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jei kažkuri reikiama patikra nepraeina, ištaisykite tai pirmiausia, tada tęskite greitą pradžią.

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
# Pasirenkama, jei planuojate naudoti Azure CLI komandas tiesiogiai šiame kurse
az login

# Būtina AZD darbo eigos scenarijams
azd auth login
```

Jei nesate tikri, kurį pasirinkti, sekite pilną nustatymo eigą [Diegimas ir Nustatymas](docs/chapter-01-foundation/installation.md#authentication-setup).

### 3 žingsnis: Įdiekite Pirmą Programą

```bash
# Inicializuoti iš šablono
azd init --template todo-nodejs-mongo

# Diegti į Azure (sukuria viską!)
azd up
```

**🎉 Štai ir viskas!** Jūsų programa dabar veikia Azure.

### Išvalykite (Neužmirškite!)

```bash
# Pašalinkite visus išteklius, kai baigsite eksperimentuoti
azd down --force --purge
```

---

## 📚 Kaip Naudotis Šiuo Kursu

Šis kursas sukurtas **progresyviam mokymuisi** - pradėkite ten, kur jaučiatės patogiai, ir žingsnis po žingsnio tobulėkite:

| Jūsų Patirtis | Pradėkite Čia |
|-----------------|------------|
| **Naujas Azure naudotojas** | [1 skyrius: Pagrindai](#-chapter-1-foundation--quick-start) |
| **Pažįstu Azure, bet AZD naujokas** | [1 skyrius: Pagrindai](#-chapter-1-foundation--quick-start) |
| **Noriu kurti AI programas** | [2 skyrius: AI-pirmiausia kūrimas](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Noriu praktinių užduočių** | [🎓 Interaktyvi Dirbtuvė](workshop/README.md) - 3-4 valandų vadovas |
| **Reikia gamybos modelių** | [8 skyrius: Gamyba ir Įmonės modeliai](#-chapter-8-production--enterprise-patterns) |

### Greitas Nustatymas

1. **Darykite Šaką (Fork) Šio Repozitorijos**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonuokite Jį**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Gaukite Pagalbą**: [Azure Discord Bendruomenė](https://discord.com/invite/ByRwuEEgH4)

> **Norite klonuoti lokaliai?**

> Šiame repozitorijoje yra daugiau nei 50 kalbų vertimų, todėl atsisiuntimo dydis žymiai didesnis. Norėdami klonuoti be vertimų, naudokite skardų patikrinimą:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Tai suteikia viską, ko reikia kursui užbaigti, su daug greitesniu atsisiuntimu.


## Kurso Apžvalga

Išmokite Azure Developer CLI (azd) per struktūruotus skyrius, sukurtus progresyviam mokymuisi. **Ypatingas dėmesys AI programų diegimui su Microsoft Foundry integracija.**


### Kodėl šis kursas yra svarbus šiuolaikiniams kūrėjams

Remiantis Microsoft Foundry Discord bendruomenės įžvalgomis, **45 % kūrėjų nori naudoti AZD dirbtinio intelekto užduotims**, tačiau susiduria su iššūkiais dėl:
- Sudėtingų daugiaservisinių DI architektūrų
- Geriausių gamybos DI diegimo praktikų  
- Azure DI paslaugų integracijos ir konfigūracijos
- KAŠTŲ optimizavimo DI užduotims
- Problemų sprendimo, susijusių su DI diegimu

### Mokymosi tikslai

Baigdami šį struktūruotą kursą, jūs:
- **Įvaldysite AZD pagrindus**: Pagrindines sąvokas, diegimą ir konfigūraciją
- **Diegsite DI programėles**: Naudosite AZD su Microsoft Foundry paslaugomis
- **Įgyvendinsite infrastruktūrą kaip kodą**: Valdyti Azure išteklius su Bicep šablonais
- **Spręsite diegimo problemas**: Išspręsite dažnas problemas ir derinsite
- **Optimizuosite gamybai**: Saugumą, mastelį, stebėjimą ir kaštų valdymą
- **Kursite daugiaagentinius sprendimus**: Diegsite sudėtingas DI architektūras

## Prieš pradėdami: paskyros, prieiga ir prielaidos

Prieš pradėdami 1 skyrių, įsitikinkite, kad turite žemiau nurodytus dalykus. Vėlesni diegimo žingsniai šiame vadove daro prielaidą, kad šie pagrindai jau yra įgyvendinti.

- **Azure prenumerata**: Galite naudoti esamą darbovietės arba savo paskyros prenumeratą, arba sukurti [nemokamą bandomąją versiją](https://aka.ms/azurefreetrial), kad pradėtumėte.
- **Leidimas kurti Azure išteklius**: Daugumai pratimų turėtumėte turėti bent **Bendradarbio** prieigą prie taikinio prenumeratos arba išteklių grupės. Kai kurie skyriai taip pat gali daryti prielaidą, kad galite kurti išteklių grupes, valdomas tapatybes ir RBAC priskyrimus.
- [**GitHub paskyra**](https://github.com): Tai naudinga, norint išsišakojančio repozitorijos, sekti savo pakeitimus ir naudoti GitHub Codespaces dirbtuvėms.
- **Šablonų vykdymo aplinkos reikalavimai**: Kai kuriems šablonams reikalingi vietiniai įrankiai, tokie kaip Node.js, Python, Java arba Docker. Prieš pradėdami paleiskite sąrankos patikrinimą, kad laiku pastebėtumėte trūkstamus įrankius.
- **Pagrindinės terminalo žinios**: Nebūtina būti ekspertu, bet turėtumėte mokėti paleisti komandas kaip `git clone`, `azd auth login` ir `azd up`.

> **Dirbate įmonės prenumeratoje?**
> Jei jūsų Azure aplinką valdo administratorius, iš anksto patikrinkite, ar galite įdiegti išteklius prenumeratoje arba išteklių grupėje, kurią ketinate naudoti. Jei ne, paprašykite smėlio dėžės prenumeratos arba Bendradarbio prieigos prieš pradėdami.

> **Naujas Azure?**
> Pradėkite nuo savo Azure bandomosios arba mokėkite už naudojimą prenumeratos https://aka.ms/azurefreetrial, kad galėtumėte atlikti pratimus pilnai be laukimo dėl nuomininko lygio patvirtinimų.

## 🗺️ Kurso žemėlapis: greita navigacija pagal skyrių

Kiekvienas skyrius turi atskirą README su mokymosi tikslais, trumpuoju pradžios vadovu ir pratimais:

| Skyrius | Tema | Pamokos | Trukmė | Sudėtingumas |
|---------|-------|---------|----------|------------|
| **[1 skyrius: Pagrindai](docs/chapter-01-foundation/README.md)** | Pirmieji žingsniai | [AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) &#124; [Diegimas](docs/chapter-01-foundation/installation.md) &#124; [Pirmas projektas](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[2 skyrius: DI kūrimas](docs/chapter-02-ai-development/README.md)** | DI programėlės | [Foundry integracija](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [DI agentai](docs/chapter-02-ai-development/agents.md) &#124; [Modelių diegimas](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Dirbtuvės](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 val | ⭐⭐ |
| **[3 skyrius: Konfigūracija](docs/chapter-03-configuration/README.md)** | Autentifikacija ir saugumas | [Konfigūracija](docs/chapter-03-configuration/configuration.md) &#124; [Autentifikacija ir saugumas](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[4 skyrius: Infrastruktūra](docs/chapter-04-infrastructure/README.md)** | IaK ir diegimas | [Diegimo vadovas](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Teikimas](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 val | ⭐⭐⭐ |
| **[5 skyrius: Daugiagentiniai sprendimai](docs/chapter-05-multi-agent/README.md)** | DI agentų sprendimai | [Mažmeninė situacija](examples/retail-scenario.md) &#124; [Koordinavimo modeliai](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 val | ⭐⭐⭐⭐ |
| **[6 skyrius: Prieš diegimą](docs/chapter-06-pre-deployment/README.md)** | Planavimas ir patikrinimai | [Pradiniai patikrinimai](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Talpos planavimas](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU pasirinkimas](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 val | ⭐⭐ |
| **[7 skyrius: Triktų šalinimas](docs/chapter-07-troubleshooting/README.md)** | Derinimas ir pataisymai | [Dažnos problemos](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Derinimas](docs/chapter-07-troubleshooting/debugging.md) &#124; [DI problemos](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 val | ⭐⭐ |
| **[8 skyrius: Gamyba](docs/chapter-08-production/README.md)** | Įmonių modeliai | [Gamybos praktikos](docs/chapter-08-production/production-ai-practices.md) | 2-3 val | ⭐⭐⭐⭐ |
| **[🎓 Dirbtuvės](workshop/README.md)** | Praktinės laboratorijos | [Įvadas](workshop/docs/instructions/0-Introduction.md) &#124; [Pasirinkimas](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Patikra](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Išardymas](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigūracija](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Priderinimas](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Ardymas](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Apibendrinimas](workshop/docs/instructions/7-Wrap-up.md) | 3-4 val | ⭐⭐ |

**Viso kurso trukmė:** ~10-14 valandų | **Įgūdžių lygis:** Pradedantysis → Gamybos lygio

---

## 📚 Mokymosi skyriai

*Pasirinkite mokymosi kelią pagal patirties lygį ir tikslus*

### 🚀 1 skyrius: Pagrindai ir greitas startas
**Reikalinga:** Azure prenumerata, pagrindinės komandinės eilutės žinios  
**Trukmė:** 30-45 minutės  
**Sudėtingumas:** ⭐

#### Ko išmoksite
- Suprasti Azure Developer CLI pagrindus
- Įdiegti AZD savo platformoje
- Sėkmingai atlikti pirmą diegimą

#### Mokymosi šaltiniai
- **🎯 Pradėkite čia**: [Kas yra Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorija**: [AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) - Pagrindinės sąvokos ir terminai
- **⚙️ Sąranka**: [Diegimas ir sąranka](docs/chapter-01-foundation/installation.md) - Platformos specifiniai vadovai
- **🛠️ Praktika**: [Jūsų pirmas projektas](docs/chapter-01-foundation/first-project.md) - Žingsnis po žingsnio vadovas
- **📋 Greitos nuorodos**: [Komandų atmintinė](resources/cheat-sheet.md)

#### Praktiniai pratimai
```bash
# Greitas diegimo patikrinimas
azd version

# Diegkite savo pirmąją programėlę
azd init --template todo-nodejs-mongo
azd up
```

**💡 Skyriaus rezultatas**: Sėkmingai įdiegti paprastą interneto programą į Azure naudojant AZD

**✅ Sėkmės patikra:**
```bash
# Baigus 1 skyrių, jūs turėtumėte gebėti:
azd version              # Rodo įdiegtą versiją
azd init --template todo-nodejs-mongo  # Inicializuoja projektą
azd up                  # Diegia į Azure
azd show                # Rodo veikiančios programos URL
# Programa atsidaro naršyklėje ir veikia
azd down --force --purge  # Išvalo resursus
```

**📊 Laiko sąnaudos:** 30-45 minutės  
**📈 Gebėjimų lygis po kurso:** Geba savarankiškai diegti paprastas programėles
**📈 Gebėjimų lygis po kurso:** Geba savarankiškai diegti paprastas programėles

---

### 🤖 2 skyrius: DI pirma kūrimas (Rekomenduojama DI kūrėjams)
**Reikalinga:** Įvykdytas 1 skyrius  
**Trukmė:** 1-2 valandos  
**Sudėtingumas:** ⭐⭐

#### Ko išmoksite
- Microsoft Foundry integraciją su AZD
- Diegti DI varomas programėles
- Suprasti DI paslaugų konfigūracijas

#### Mokymosi šaltiniai
- **🎯 Pradėkite čia**: [Microsoft Foundry integracija](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 DI agentai**: [DI agentų vadovas](docs/chapter-02-ai-development/agents.md) - Diegti intelektualius agentus su AZD
- **📖 Modeliai**: [DI modelių diegimas](docs/chapter-02-ai-development/ai-model-deployment.md) - Diegti ir valdyti DI modelius
- **🛠️ Dirbtuvės**: [DI dirbtuvės](docs/chapter-02-ai-development/ai-workshop-lab.md) - Paruošti DI sprendimus AZD
- **🎥 Interaktyvi gidas**: [Dirbtuvių medžiaga](workshop/README.md) - Naršyklėje mokymasis su MkDocs * DevContainer aplinka
- **📋 Šablonai**: [Microsoft Foundry šablonai](#dirbtuvių-ištekliai)
- **📝 Pavyzdžiai**: [AZD diegimo pavyzdžiai](examples/README.md)

#### Praktiniai pratimai
```bash
# Įdiekite savo pirmąją DI programą
azd init --template azure-search-openai-demo
azd up

# Išbandykite papildomas DI šablonus
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Skyriaus rezultatas**: Įdiegti ir konfigūruoti DI pagrįstą pokalbių programėlę su RAG funkcionalumu

**✅ Sėkmės patikra:**
```bash
# Po 2 skyriaus turėtumėte sugebėti:
azd init --template azure-search-openai-demo
azd up
# Išbandyti AI pokalbių sąsają
# Uždavinėti klausimus ir gauti AI pagrįstus atsakymus su šaltiniais
# Patikrinti, ar paieškos integracija veikia
azd monitor  # Patikrinti, ar Application Insights rodo telemetriją
azd down --force --purge
```

**📊 Laiko sąnaudos:** 1-2 valandos  
**📈 Gebėjimų lygis po kurso:** Geba diegti ir konfigūruoti gamybai paruoštas DI programėles  
**💰 Kaštų suvokimas:** Suprasti $80-150/mėn kūrimo kaštus, $300-3500/mėn gamybos kaštus

#### 💰 Kaštų svarstymai DI diegimams

**Kūrimo aplinka (apytiksliai $80-150/mėn):**
- Microsoft Foundry modeliai (mokėjimas už naudojimą): $0-50/mėn (priklausomai nuo žetonų naudojimo)
- DI paieška (pagrindinis lygis): $75/mėn
- Konteinerių programos (naudojimosi pagrindu): $0-20/mėn
- Saugykla (standartinė): $1-5/mėn

**Gamybos aplinka (apytiksliai $300-3,500+/mėn):**
- Microsoft Foundry modeliai (PTU nuolatiniam našumui): $3,000+/mėn ARBA mokėjimas už naudojimą su dideliais kiekiais
- DI paieška (standartinis lygis): $250/mėn
- Konteinerių programos (dedikuotos): $50-100/mėn
- Programėlių įžvalgos: $5-50/mėn
- Saugykla (premium): $10-50/mėn

**💡 Kaštų optimizavimo patarimai:**
- Naudokite **Nemokamą lygį** Microsoft Foundry modeliams mokymuisi (Azure OpenAI įtraukia 50,000 žetonų/mėn)
- Paleiskite `azd down` deaktyvuoti išteklius, kai neplėtojate aktyviai
- Pradėkite nuo naudojimosi pagrindu mokėjimo, PTU naudokite tik gamyboje
- Naudokite `azd provision --preview` išlaidų apskaičiavimui prieš diegimą
- Įjunkite automatinį mastelį: mokėkite tik už faktinį naudojimą

**Kaštų stebėjimas:**
```bash
# Patikrinkite numatomas mėnesines išlaidas
azd provision --preview

# Stebėkite faktines išlaidas Azure portale
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3 skyrius: Konfigūracija ir autentifikacija
**Reikalinga:** Įvykdytas 1 skyrius  
**Trukmė:** 45-60 minučių  
**Sudėtingumas:** ⭐⭐

#### Ko išmoksite
- Aplinkos konfigūraciją ir valdymą
- Autentifikacijos ir saugumo geriausias praktikas
- Išteklių vardų nustatymą ir organizavimą

#### Mokymosi šaltiniai
- **📖 Konfigūracija**: [Konfigūracijos vadovas](docs/chapter-03-configuration/configuration.md) - Aplinkos nustatymas
- **🔐 Saugumas**: [Autentifikacijos modeliai ir valdomos tapatybės](docs/chapter-03-configuration/authsecurity.md) - Autentifikacijos modeliai
- **📝 Pavyzdžiai**: [Duomenų bazės programėlės pavyzdys](examples/database-app/README.md) - AZD duomenų bazės pavyzdžiai

#### Praktiniai pratimai
- Konfigūruoti kelias aplinkas (vystymas, testavimas, gamyba)
- Įjungti valdomos tapatybės autentifikaciją
- Įgyvendinti aplinkai specifines konfigūracijas

**💡 Skyriaus rezultatas**: Valdyti kelias aplinkas su tinkama autentifikacija ir saugumu

---

### 🏗️ 4 skyrius: Infrastruktūra kaip kodas ir diegimas
**Reikalinga:** Įvykdyti 1-3 skyrius  
**Trukmė:** 1-1.5 valandos  
**Sudėtingumas:** ⭐⭐⭐

#### Ko išmoksite
- Pažangius diegimo modelius
- Infrastruktūrą kaip kodą naudojant Bicep
- Išteklių teikimo strategijas

#### Mokymosi šaltiniai
- **📖 Diegimas**: [Diegimo vadovas](docs/chapter-04-infrastructure/deployment-guide.md) - Visi procesai
- **🏗️ Teikimas**: [Išteklių teikimas](docs/chapter-04-infrastructure/provisioning.md) - Azure išteklių valdymas
- **📝 Pavyzdžiai**: [Konteinerinės programos pavyzdys](../../examples/container-app) - Konteinerizuoti diegimai

#### Praktiniai pratimai
- Kurkite savo Bicep šablonus
- Diegkite daugiaservises programėles
- Įgyvendinkite mėlyno-žalio diegimo modelius

**💡 Skyriaus rezultatas**: Diegti sudėtingas daugiaservises programėles naudojant pasirinktinius infrastruktūros šablonus

---


### 🎯 5 skyrius: Daugiaveiksmės AI sprendimai (Pažengę)
**Prieš sąlygos**: Užbaigti 1-2 skyrius  
**Trukmė**: 2-3 valandos  
**Sudėtingumas**: ⭐⭐⭐⭐

#### Ko išmoksite
- Daugiaveiksmės architektūros modeliai
- Agentų orkestravimas ir koordinavimas
- Produkcijai paruošti AI diegimai

#### Mokymosi ištekliai
- **🤖 Pasižymėtas projektas**: [Daugiaveiksmis sprendimas mažmeninei prekybai](examples/retail-scenario.md) - Pilnas įgyvendinimas
- **🛠️ ARM Šablonai**: [ARM šablonų paketas](../../examples/retail-multiagent-arm-template) - Vieno paspaudimo diegimas
- **📖 Architektūra**: [Daugiaveiksmių koordinavimo modeliai](docs/chapter-06-pre-deployment/coordination-patterns.md) - Modeliai

#### Praktinės užduotys
```bash
# Įdiekite visą mažmeninės prekybos daugiaagentinį sprendimą
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tyrinėkite agentų konfigūracijas
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Skyrelio rezultatas**: Įdiegti ir valdyti produkcijai paruoštą daugiaveiksmę AI sprendimą su Kliento ir Inventoriaus agentais

---

### 🔍 6 skyrius: Išankstinis patikrinimas ir planavimas
**Prieš sąlygos**: Baigtas 4 skyrius  
**Trukmė**: 1 valanda  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Talpos planavimas ir išteklių patikra
- SKU pasirinkimo strategijos
- Išankstiniai patikrinimai ir automatizavimas

#### Mokymosi ištekliai
- **📊 Planavimas**: [Talpos planavimas](docs/chapter-06-pre-deployment/capacity-planning.md) - Išteklių patikra
- **💰 Pasirinkimas**: [SKU pasirinkimas](docs/chapter-06-pre-deployment/sku-selection.md) - Ekonomiškai efektyvūs sprendimai
- **✅ Patikra**: [Išankstiniai patikrinimai](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizuoti skriptai

#### Praktinės užduotys
- Vykdyti talpos patikros skriptus
- Optimizuoti SKU pasirinkimus kaštų mažinimui
- Įgyvendinti automatizuotus išankstinius patikrinimus

**💡 Skyrelio rezultatas**: Patvirtinti ir optimizuoti diegimus prieš vykdymą

---

### 🚨 7 skyrius: Klaidų šalinimas ir derinimas
**Prieš sąlygos**: Užbaigtas bet kuris diegimo skyrius  
**Trukmė**: 1-1,5 valandos  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Sistemingos derinimo metodikos
- Dažniausios problemos ir sprendimai
- AI specifinių problemų sprendimas

#### Mokymosi ištekliai
- **🔧 Dažniausios problemos**: [Dažniausios problemos](docs/chapter-07-troubleshooting/common-issues.md) - DUK ir sprendimai
- **🕵️ Derinimas**: [Derinimo gidas](docs/chapter-07-troubleshooting/debugging.md) - Žingsnis po žingsnio strategijos
- **🤖 AI problemos**: [AI specifinių problemų sprendimas](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI paslaugų problemos

#### Praktinės užduotys
- Diagnostikuoti diegimo klaidas
- Išspręsti autentifikacijos problemas
- Derinti AI paslaugų ryšį

**💡 Skyrelio rezultatas**: Savarankiškai diagnozuoti ir išspręsti dažniausias diegimo problemas

---

### 🏢 8 skyrius: Produkcijos ir įmonių modeliai
**Prieš sąlygos**: Užbaigti 1-4 skyrius  
**Trukmė**: 2-3 valandos  
**Sudėtingumas**: ⭐⭐⭐⭐

#### Ko išmoksite
- Produkcijos diegimo strategijos
- Įmonių saugumo modeliai
- Stebėsena ir kaštų optimizavimas

#### Mokymosi ištekliai
- **🏭 Produkcija**: [Produkcinės AI geriausios praktikos](docs/chapter-08-production/production-ai-practices.md) - Įmonių modeliai
- **📝 Pavyzdžiai**: [Mikropaslaugų pavyzdys](../../examples/microservices) - Sudėtingos architektūros
- **📊 Stebėsena**: [Application Insights integracija](docs/chapter-06-pre-deployment/application-insights.md) - Stebėsena

#### Praktinės užduotys
- Įgyvendinti įmonių saugumo modelius
- Įdiegti išsamią stebėseną
- Diegti į produkciją su tinkama valdymo schema

**💡 Skyrelio rezultatas**: Diegti įmonėms paruoštas programas su pilnu produkcijos funkcionalumu

---

## 🎓 Dirbtuvės santrauka: Praktinis mokymasis

> **⚠️ DIRBTUVIŲ BŪKLĖ: Aktyvus kūrimas**  
> Dirbtuvių medžiaga šiuo metu kuriama ir tobulinama. Pagrindiniai moduliai veikia, tačiau kai kurios pažangios dalys dar neužbaigtos. Aktyviai dirbame, kad užbaigtume visą turinį. [Sekite pažangą →](workshop/README.md)

### Interaktyvios dirbtuvių medžiagos
**Visapusiškas praktinis mokymasis su naršyklėje veikiančiais įrankiais ir vedamomis užduotimis**

Mūsų dirbtuvių medžiaga suteikia struktūrizuotą, interaktyvų mokymosi patyrimą, papildantį aukščiau pateiktą skyrių mokymo programą. Dirbtuvės skirta tiek savarankiškam mokymuisi, tiek instruktorinių sesijų vedimui.

#### 🛠️ Dirbtuvių funkcijos
- **Naršyklės sąsaja**: Pilnai veikiantis MkDocs pagrindu su paieška, kopijavimo ir temomis
- **GitHub Codespaces integracija**: Vieno paspaudimo kūrimo aplinkos nustatymas
- **Struktūrizuota mokymosi eiga**: 8 moduliai su vedamomis užduotimis (iš viso 3-4 valandos)
- **Progresyvios metodikos**: Įvadas → Pasirinkimas → Patikra → Analizė → Konfigūracija → Tinkrinimas → Išardymas → Apibendrinimas
- **Interaktyvi DevContainer aplinka**: Iš anksto sukonfigūruoti įrankiai ir priklausomybės

#### 📚 Dirbtuvių modulio struktūra
Dirbtuvės seka **8 modulių progresyvią metodiką**, kuri veda nuo atradimo iki diegimo meistriškumo:

| Modulis | Tema | Ką darysite | Trukmė |
|--------|-------|----------------|----------|
| **0. Įvadas** | Dirbtuvių apžvalga | Suprasti mokymosi tikslus, prieš sąlygas ir struktūrą | 15 min |
| **1. Pasirinkimas** | Šablonų paieška | Išnarplioti AZD šablonus ir pasirinkti tinkamą AI šabloną savo scenarijai | 20 min |
| **2. Patikra** | Diegti ir patikrinti | Diegti šabloną su `azd up` ir patikrinti infrastruktūros veikimą | 30 min |
| **3. Analizė** | Suprasti struktūrą | Naudoti GitHub Copilot aiškiam šablono architektūros, Bicep failų ir kodo organizacijos peržiūrai | 30 min |
| **4. Konfigūracija** | gilintis į azure.yaml | Įvaldyti `azure.yaml` konfigūraciją, gyvavimo ciklo kablius ir aplinkos kintamuosius | 30 min |
| **5. Tinkrinimas** | Padaryti savo | Įjungti AI paiešką, sekimą, vertinimą ir pritaikyti savo scenarijai | 45 min |
| **6. Išardymas** | Susitvarkyti | Saugiai pašalinti resursus su `azd down --purge` | 15 min |
| **7. Apibendrinimas** | Tolimesni žingsniai | Peržiūrėti pasiektus rezultatus, svarbiausias sąvokas ir tęsti mokymosi kelią | 15 min |

**Dirbtuvių eiga:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Kaip pradėti dirbtuves
```bash
# 1 variantas: GitHub Codespaces (rekomenduojama)
# Spustelėkite „Code“ → „Create codespace on main“ saugykloje

# 2 variantas: Vietinė kūrimo aplinka
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Vadovaukitės nustatymo instrukcijomis faile workshop/README.md
```

#### 🎯 Dirbtuvių mokymosi rezultatai
Baigus dirbtuves, dalyviai:
- **Išdiegs produkcinius AI sprendimus**: Naudos AZD su Microsoft Foundry paslaugomis
- **Įvaldys daugiaveiksmių architektūras**: Įgyvendins koordinuotus AI agentų sprendimus
- **Įgyvendins saugumo geriausias praktikas**: Suves autentifikaciją ir prieigos kontrolę
- **Optimizuos mastelį**: Sukurs ekonomiškus ir našius diegimus
- **Spręs diegimo problemas**: Savarankiškai išspręs dažnas problemas

#### 📖 Dirbtuvių ištekliai
- **🎥 Interaktyvus gidas**: [Dirbtuvių medžiaga](workshop/README.md) - Naršyklėje veikianti mokymosi aplinka
- **📋 Modulio po modulio instrukcijos**:
  - [0. Įvadas](workshop/docs/instructions/0-Introduction.md) - Dirbtuvių apžvalga ir tikslai
  - [1. Pasirinkimas](workshop/docs/instructions/1-Select-AI-Template.md) - Rasti ir pasirinkti AI šablonus
  - [2. Patikra](workshop/docs/instructions/2-Validate-AI-Template.md) - Diegti ir patikrinti šablonus
  - [3. Analizė](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Tyrinėti šablono architektūrą
  - [4. Konfigūracija](workshop/docs/instructions/4-Configure-AI-Template.md) - Įvaldyti azure.yaml
  - [5. Tinkrinimas](workshop/docs/instructions/5-Customize-AI-Template.md) - Pritaikyti savo scenarijai
  - [6. Išardymas](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Išvalyti resursus
  - [7. Apibendrinimas](workshop/docs/instructions/7-Wrap-up.md) - Apžvalga ir toliau mokytis
- **🛠️ AI dirbtuvių laboratorija**: [AI dirbtuvių laboratorija](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI orientuotos užduotys
- **💡 Greitas pradžia**: [Dirbtuvių sąrankos gidas](workshop/README.md#quick-start) - Aplinkos konfigūracija

**Puikiai tinka**: Įmonių mokymams, universitetų kursams, savarankiškam mokymuisi ir programuotojų kursams.

---

## 📖 Giluminis pažinimas: AZD galimybės

Be pagrindų, AZD suteikia galingas funkcijas produkciniams diegimams:

- **Diegimai su šablonais** - Naudokite iš anksto paruoštus šablonus dažnoms programų struktūroms
- **Infrastruktūra kaip kodas** - Valdykite Azure resursus naudodami Bicep arba Terraform  
- **Integruoti darbų srautai** - Sklandus programų paruošimas, diegimas ir stebėsena
- **Draugiškas programuotojui** - Optimizuota kūrėjų produktyvumui ir patirčiai

### **AZD + Microsoft Foundry: Puiku AI diegimams**

**Kodėl AZD AI sprendimams?** AZD sprendžia pagrindines AI kūrėjų problemas:

- **AI paruošti šablonai** - Iš anksto sukonfigūruoti šablonai Microsoft Foundry modeliams, Azure AI paslaugoms ir ML krūviams
- **Saugūs AI diegimai** - Įmontuoti saugumo modeliai AI paslaugoms, API raktams ir modelių galams  
- **Produkciniai AI modeliai** - Geriausios praktikos masteliniams, ekonomiškiems AI programų diegimams
- **End-to-End AI darbų srautai** - Nuo modelio kūrimo iki produkcijos su tinkama stebėsena
- **Kaštų optimizavimas** - Protingas išteklių paskirstymas ir mastelio didinimo strategijos AI krūviams
- **Microsoft Foundry integracija** - Sklandi jungtis su Microsoft Foundry modelių katalogu ir galais

---

## 🎯 Šablonų ir pavyzdžių biblioteka

### Rekomenduojama: Microsoft Foundry šablonai
**Pradėkite čia, jeigu diegiate AI programas!**

> **Pastaba:** Šie šablonai demonstruoja įvairius AI modelius. Kai kurie yra išoriniai Azure pavyzdžiai, kiti - vietinės įgyvendinimo kopijos.

| Šablonas | Skyrius | Sudėtingumas | Paslaugos | Tipas |
|----------|---------|------------|----------|------|
| [**Pradėkite su AI pokalbiais**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2 skyrius | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Išorinis |
| [**Pradėkite su AI agentais**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2 skyrius | ⭐⭐ | Foundry Agentai + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Išorinis |
| [**Azure Search + OpenAI demonstracija**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2 skyrius | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Išorinis |
| [**OpenAI pokalbių programos greitoji pradžia**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2 skyrius | ⭐ | AzureOpenAI + Container Apps + Application Insights | Išorinis |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5 skyrius | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Išorinis |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 8 skyrius | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Išorinis |
| [**Daugiaveiksmis mažmeninės prekybos sprendimas**](examples/retail-scenario.md) | 5 skyrius | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Vietinis** |

### Rekomenduojama: Išsamios mokymosi scenarijos
**Produkciniai programų šablonai, susieti su mokymosi skyriais**

| Šablonas | Mokymosi skyrius | Sudėtingumas | Pagrindiniai mokymai |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2 skyrius | ⭐ | Pagrindiniai AI diegimo modeliai |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2 skyrius | ⭐⭐ | RAG įgyvendinimas su Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4 skyrius | ⭐⭐ | Dokumentų intelekto integracija |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5 skyrius | ⭐⭐⭐ | Agentų sistema ir funkcijų kvietimas |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8 skyrius | ⭐⭐⭐ | Įmonių AI orkestravimas |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5 skyrius | ⭐⭐⭐⭐ | Daugiaveiksmė architektūra su Kliento ir Inventoriaus agentais |

### Mokymasis pagal pavyzdžio tipą

> **📌 Vietiniai vs. Išoriniai pavyzdžiai:**  
> **Vietiniai pavyzdžiai** (šiame repozitorijoje) = Iš karto paruošti naudoti  
> **Išoriniai pavyzdžiai** (Azure pavyzdžiai) = Klonavimas iš nurodytų repozitorijų

#### Vietiniai pavyzdžiai (Paruošti naudoti)
- [**Daugiaveiksmis mažmeninės prekybos sprendimas**](examples/retail-scenario.md) - Pilnas produkcijai paruoštas įgyvendinimas su ARM šablonais
  - Daugiaveiksmė architektūra (Kliento + Inventoriaus agentai)
  - Išsami stebėsena ir vertinimas
  - Vieno paspaudimo diegimas per ARM šabloną

#### Vietiniai pavyzdžiai - konteinerių programos (2-5 skyriai)
**Išsamūs konteinerių diegimo pavyzdžiai šiame repozitorijoje:**

- [**Konteinerių programų pavyzdžiai**](examples/container-app/README.md) - Išsamus vadovas apie konteinerizuotą diegimą
  - [Paprasta Flask API](../../examples/container-app/simple-flask-api) - Pagrindinė REST API su galimybe automatiškai sustabdyti
  - [Mikropaslaugų architektūra](../../examples/container-app/microservices) - Paruošta gamybai daugiapaslaugė diegimo sistema
  - Greitas startas, gamybiniai ir pažangūs diegimo modeliai
  - Stebėjimo, saugumo ir sąnaudų optimizavimo rekomendacijos

#### Išoriniai pavyzdžiai - Paprastos programėlės (1-2 skyriai)
**Klonuokite šiuos Azure pavyzdžių saugyklas, kad pradėtumėte:**
- [Paprasta internetinė programa - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pagrindiniai diegimo modeliai
- [Statinis interneto puslapis - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statinio turinio diegimas
- [Konteinerių programa - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API diegimas

#### Išoriniai pavyzdžiai - Duomenų bazės integracija (3-4 skyriai)  
- [Duomenų bazės programa - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Duomenų bazės prijungimo modeliai
- [Funkcijos + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless duomenų procesai

#### Išoriniai pavyzdžiai - Pažangūs modeliai (4-8 skyriai)
- [Java mikropaslaugos](https://github.com/Azure-Samples/java-microservices-aca-lab) - Daugiapaslaugė architektūra
- [Konteinerių programų užduotys](https://github.com/Azure-Samples/container-apps-jobs) - Foninis apdorojimas  
- [Enterprise ML pipeline](https://github.com/Azure-Samples/mlops-v2) - Paruošti gamybai ML modeliai

### Išorinės šablonų kolekcijos
- [**Oficiali AZD šablonų galerija**](https://azure.github.io/awesome-azd/) - Parinkta oficialių ir bendruomenės šablonų kolekcija
- [**Azure Developer CLI šablonai**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn dokumentacija apie šablonus
- [**Pavyzdžių katalogas**](examples/README.md) - Vietiniai mokymosi pavyzdžiai su išsamiais paaiškinimais

---

## 📚 Mokymosi ištekliai ir nuorodos

### Greitos nuorodos
- [**Komandų iškarpinė**](resources/cheat-sheet.md) - Esminės azd komandos pagal skyrius
- [**Žodynas**](resources/glossary.md) - Azure ir azd terminai  
- [**DUK**](resources/faq.md) - Dažnai užduodami klausimai surūšiuoti pagal skyrių
- [**Mokymosi vadovas**](resources/study-guide.md) - Išsamūs praktikos užsiėmimai

### Praktiniai seminarai
- [**AI seminaro laboratorija**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Padarykite savo AI sprendimus diegiamus su AZD (2-3 val.)
- [**Interaktyvus seminaras**](workshop/README.md) - 8 modulių vedami pratimai su MkDocs ir GitHub Codespaces
  - Sekos: Įvadas → Pasirinkimas → Patvirtinimas → Dekonstrukcija → Konfigūravimas → Individualizavimas → Išardymas → Apibendrinimas

### Išoriniai mokymosi ištekliai
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure kainų skaičiuoklė](https://azure.microsoft.com/pricing/calculator/)
- [Azure būsenos puslapis](https://status.azure.com/)

### AI agentų įgūdžiai jūsų redaktoriui
- [**Microsoft Azure įgūdžiai skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 atviri agentų įgūdžiai Azure AI, Foundry, diegimui, diagnostikai, sąnaudų optimizavimui ir kt. Įdiekite juos GitHub Copilot, Cursor, Claude Code ar bet kuriame palaikomame agentų įrankyje:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Greita trikčių šalinimo pagalba

**Dažniausios pradedančiųjų problemos ir greiti sprendimai:**

<details>
<summary><strong>❌ "azd: komanda nerasta"</strong></summary>

```bash
# Pirmiausia įdiekite AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Patvirtinkite diegimą
azd version
```
</details>

<details>
<summary><strong>❌ "Prenumerata nerasta" arba "Prenumerata nenustatyta"</strong></summary>

```bash
# Išvardyti galimus prenumeratas
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
<summary><strong>❌ "Nepakankamas kvotas" arba "Kvota viršyta"</strong></summary>

```bash
# Išbandykite kitą „Azure“ regioną
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
<summary><strong>❌ "azd up" nepavyksta proceso viduryje</strong></summary>

```bash
# 1 parinktis: Išvalyti ir bandyti dar kartą
azd down --force --purge
azd up

# 2 parinktis: Tiesiog pataisyti infrastruktūrą
azd provision

# 3 parinktis: Patikrinti išsamų būsenos pranešimą
azd show

# 4 parinktis: Patikrinti žurnalus Azure Monitor programoje
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentifikacija nepavyko" arba "Tokenas pasibaigęs"</strong></summary>

```bash
# Vėl autentifikuokite AZD
azd auth logout
azd auth login

# Neprivaloma: atnaujinkite ir Azure CLI, jei vykdote az komandas
az logout
az login

# Patvirtinkite autentifikaciją
az account show
```
</details>

<details>
<summary><strong>❌ "Išteklius jau egzistuoja" arba pavadinimų konfliktai</strong></summary>

```bash
# AZD generuoja unikalius vardus, bet jei kyla konfliktas:
azd down --force --purge

# Tada bandykite dar kartą su nauja aplinka
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Šablono diegimas trunka per ilgai</strong></summary>

**Įprastos laukimo trukmės:**
- Paprasta internetinė programa: 5-10 minučių
- Programa su duomenų baze: 10-15 minučių
- AI programos: 15-25 minučių (OpenAI teikimas vyksta lėtai)

```bash
# Patikrinkite pažangą
azd show

# Jei įstringa daugiau nei 30 minučių, patikrinkite Azure Portalą:
azd monitor --overview
# Ieškokite nepavykusių diegimų
```
</details>

<details>
<summary><strong>❌ "Leidimas atmestas" arba "Draudžiama"</strong></summary>

```bash
# Patikrinkite savo Azure vaidmenį
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Jums reikia bent „Contributor“ vaidmens
# Paprašykite savo Azure administratoriaus suteikti:
# - Contributor (ištekliams)
# - User Access Administrator (vaidmenų priskyrimams)
```
</details>

<details>
<summary><strong>❌ Nepavyksta rasti įdiegto programos URL</strong></summary>

```bash
# Rodyti visus paslaugų galinius taškus
azd show

# Arba atidaryti Azure portalą
azd monitor

# Patikrinti konkrečią paslaugą
azd env get-values
# Ieškoti *_URL kintamųjų
```
</details>

### 📚 Pilni trikčių šalinimo ištekliai

- **Dažniausių problemų vadovas:** [Išsamūs sprendimai](docs/chapter-07-troubleshooting/common-issues.md)
- **AI specifinės problemos:** [AI trikčių šalinimas](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Derinimo vadovas:** [Žingsnis po žingsnio derinimas](docs/chapter-07-troubleshooting/debugging.md)
- **Pagalba:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurso užbaigimas ir sertifikavimas

### Progreso sekimas
Stebėkite savo mokymosi pažangą kiekviename skyriuje:

- [ ] **1 skyrius**: Pagrindai ir greitas startas ✅
- [ ] **2 skyrius**: AI-pirmoji kūrimo praktika ✅  
- [ ] **3 skyrius**: Konfigūravimas ir autentifikavimas ✅
- [ ] **4 skyrius**: Infrastruktūra kaip kodas ir diegimas ✅
- [ ] **5 skyrius**: Daugiapakopiai AI sprendimai ✅
- [ ] **6 skyrius**: Išankstinis patvirtinimas ir planavimas prieš diegiant ✅
- [ ] **7 skyrius**: Trikčių šalinimas ir derinimas ✅
- [ ] **8 skyrius**: Gamybiniai ir įmonės lygio modeliai ✅

### Mokymosi patikrinimas
Baigus kiekvieną skyrių, įvertinkite savo žinias:
1. **Praktinis užsiėmimas**: Atlikite skyriaus diegimo pratimą
2. **Žinių patikra**: Peržiūrėkite savo skyriaus DUK skyrių
3. **Bendruomenės diskusija**: Pasidalinkite patirtimi Azure Discord
4. **Kitas skyrius**: Pereikite prie kito sudėtingumo lygio

### Kurso baigimo pranašumai
Baigus visus skyrius, turėsite:
- **Gamybinės patirties**: Realių AI programų diegimą Azure
- **Profesinių įgūdžių**: Gamybinio lygio diegimo galimybes  
- **Bendruomenės pripažinimą**: Aktyvaus Azure kūrėjų bendruomenės narystę
- **Karjeros augimą**: Paklausią AZD ir AI diegimo kompetenciją

---

## 🤝 Bendruomenė ir pagalba

### Pagalbos ir palaikymo šaltiniai
- **Techninės problemos**: [Praneškite apie klaidas ir siūlykite naujoves](https://github.com/microsoft/azd-for-beginners/issues)
- **Mokymosi klausimai**: [Microsoft Azure Discord bendruomenė](https://discord.gg/microsoft-azure) ir [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI specifinė pagalba**: Prisijunkite prie [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Oficiali Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Bendruomenės įžvalgos iš Microsoft Foundry Discord

**Naujausių apklausų rezultatai #Azure kanale:**
- **45%** programuotojų nori naudoti AZD AI užduotims
- **Pagrindinės problemos**: daugiapaslaugės diegimo, kredencialų valdymas, gamybinis paruošimas  
- **Dažniausiai prašomi dalykai**: AI specifiniai šablonai, trikčių šalinimo vadovai, geriausios praktikos

**Prisijunkite prie mūsų bendruomenės, kad:**
- Pasidalintumėte savo AZD + AI patirtimi ir gautumėte pagalbą
- Gauti ankstyvas naujų AI šablonų peržiūras
- Prisidėtumėte prie AI diegimo geriausios praktikos
- Paveiktumėte būsimą AI + AZD funkcijų vystymą

### Kūrimas kursui
Laukiame jūsų indėlio! Skaitykite mūsų [Prisidėjimo vadovą](CONTRIBUTING.md) apie:
- **Turinio tobulinimai**: Gerinti esamus skyrius ir pavyzdžius
- **Nauji pavyzdžiai**: Pridėti realaus pasaulio scenarijus ir šablonus  
- **Vertimas**: Padėti palaikyti daugiakalbystę
- **Klaidų pranešimai**: Gerinti tikslumą ir aiškumą
- **Bendruomenės standartai**: Laikytis mūsų įtraukiančių bendruomenės taisyklių

---

## 📄 Kursų informacija

### Licencija
Šis projektas licencijuotas pagal MIT licenciją - išsami informacija faile [LICENSE](../../LICENSE).

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
[![Edge AI pradedantiesiems](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP pradedantiesiems](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI agentai pradedantiesiems](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatyvūs AI kursai
[![Generatyvus AI pradedantiesiems](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatyvus AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatyvus AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generatyvusis AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Pagrindinis mokymasis
[![ML pradedantiesiems](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Duomenų mokslas pradedantiesiems](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI pradedantiesiems](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kibernetinis saugumas pradedantiesiems](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Tinklalapių kūrimas pradedantiesiems](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pradedantiesiems](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
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

**Pradedantiesiems**: Pradėkite nuo [1 skyriaus: Pagrindai ir greitas startas](#-chapter-1-foundation--quick-start)  
**Dirbtinio intelekto kūrėjams**: Praleiskite prie [2 skyriaus: Dirbtinio intelekto pirmumo vystymas](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Patyrusiems kūrėjams**: Pradėkite nuo [3 skyriaus: Konfigūracija ir autentifikavimas](#️-chapter-3-configuration--authentication)

**Kiti žingsniai**: [Pradėti 1 skyrių - AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->