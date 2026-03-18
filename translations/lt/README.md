# AZD Pradedantiesiems: Struktūruota mokymosi kelionė

![AZD-pradedantiesiems](../../translated_images/lt/azdbeginners.5527441dd9f74068.webp) 

[![GitHub stebėtojai](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub fork'ai](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub žvaigždės](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatizuoti vertimai (visada atnaujinami)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabų](../ar/README.md) | [Bengalų](../bn/README.md) | [Bulgarų](../bg/README.md) | [Birmos (Mianmaras)](../my/README.md) | [Kinų (supaprastinta)](../zh-CN/README.md) | [Kinų (tradicinė, Honkongas)](../zh-HK/README.md) | [Kinų (tradicinė, Makao)](../zh-MO/README.md) | [Kinų (tradicinė, Taivanas)](../zh-TW/README.md) | [Kroatų](../hr/README.md) | [Čekų](../cs/README.md) | [Danų](../da/README.md) | [Olandų](../nl/README.md) | [Estų](../et/README.md) | [Suomi](../fi/README.md) | [Prancūzų](../fr/README.md) | [Vokiečių](../de/README.md) | [Graikų](../el/README.md) | [Hebrajų](../he/README.md) | [Hindų](../hi/README.md) | [Vengrų](../hu/README.md) | [Indoneziečių](../id/README.md) | [Italų](../it/README.md) | [Japonų](../ja/README.md) | [Kannada](../kn/README.md) | [Korėjiečių](../ko/README.md) | [Lietuvių](./README.md) | [Malajų](../ms/README.md) | [Malajalamų](../ml/README.md) | [Maratų](../mr/README.md) | [Nepaliečių](../ne/README.md) | [Nigerijos pidžinas](../pcm/README.md) | [Norvegų](../no/README.md) | [Persų (farsi)](../fa/README.md) | [Lenkų](../pl/README.md) | [Portugalų (Brazilija)](../pt-BR/README.md) | [Portugalų (Portugalija)](../pt-PT/README.md) | [Pundžabų (Gurmukhi)](../pa/README.md) | [Rumunų](../ro/README.md) | [Rusų](../ru/README.md) | [Serbų (kirilica)](../sr/README.md) | [Slovakų](../sk/README.md) | [Slovėnų](../sl/README.md) | [Ispanų](../es/README.md) | [Svahili](../sw/README.md) | [Švedų](../sv/README.md) | [Tagalog (filipiniečių)](../tl/README.md) | [Tamilų](../ta/README.md) | [Telugų](../te/README.md) | [Tailandiečių](../th/README.md) | [Turkų](../tr/README.md) | [Ukrainiečių](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamių](../vi/README.md)

> **Ar norite klonuoti vietoje?**
>
> Ši saugykla apima daugiau nei 50 vertimų į kalbas, dėl ko reikšmingai padidėja atsisiuntimo dydis. Norėdami klonuoti be vertimų, naudokite sparse checkout:
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
> Tai suteikia viską, ko reikia kursui užbaigti, ir leidžia atsisiųsti kur kas greičiau.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Kas naujo azd šiandien

Azure Developer CLI išaugo už tradicinių internetinių programų ir API ribų. Šiandien azd yra vienintelis įrankis, skirtas diegti bet kurią programą į Azure — įskaitant dirbtiniu intelektu paremtas programas ir intelektualius agentus.

Štai ką tai jums reiškia:

- **DI agentai dabar yra pirmos klasės azd darbo krūviai.** Galite inicializuoti, diegti ir valdyti DI agentų projektus naudodami tą patį `azd init` → `azd up` darbo eigą, kurią jau pažįstate.
- **Microsoft Foundry integracija** suteikia modelių diegimą, agentų talpinimą ir DI paslaugų konfigūravimą tiesiogiai į azd šablonų ekosistemą.
- **Pagrindinė darbo eiga nepasikeitė.** Nesvarbu, ar diegiate todo programėlę, mikroservisą ar daugiaagentį DI sprendimą — komandos išlieka tos pačios.

Jei jau naudojote azd anksčiau, DI palaikymas yra natūralus išplėtimas — ne atskiras įrankis ar pažengęs kelias. Jei pradedate nuo nulio, išmoksite vieną darbo eigą, tinkamą viskam.

---

## 🚀 Kas yra Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** yra patogus kūrėjui komandinės eilutės įrankis, kuris supaprastina programų diegimą į Azure. Vietoj to, kad rankiniu būdu kurtumėte ir jungtumėte dešimtis Azure išteklių, galite vienu komandos paleidimu išdiegti visą programą.

### `azd up` magija

```bash
# Ši viena komanda atlieka viską:
# ✅ Sukuria visas Azure išteklius
# ✅ Konfigūruoja tinklus ir saugumą
# ✅ Konstravoja jūsų programinės įrangos kodą
# ✅ Diegia į Azure
# ✅ Pateikia veikiantį URL
azd up
```

**Štai ir viskas!** Nereikia spustelėti Azure portale, nereikia išmokti sudėtingų ARM šablonų iš anksto, jokių rankinių konfigūracijų — tiesiog veikianti programa Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Kuo skiriasi?

Tai dažniausiai pradedančiųjų užduodamas klausimas. Štai paprastas atsakymas:

| Funkcija | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Paskirtis** | Valdyti atskirus Azure išteklius | Diegti pilnas programas |
| **Požiūris** | Orientuota į infrastruktūrą | Orientuota į programas |
| **Pavyzdys** | `az webapp create --name myapp...` | `azd up` |
| **Mokymosi kreivė** | Reikia žinoti Azure paslaugas | Tereikia žinoti savo programą |
| **Geriausia tiems** | DevOps, infrastruktūra | Kūrėjai, prototipavimas |

### Paprasta analogija

- **Azure CLI** yra tarsi turėti visus įrankius namo statybai — plaktukai, pjūklai, vinys. Galite pastatyti bet ką, bet turite išmanyti statybą.
- **Azure Developer CLI** yra tarsi samdyti rangovą — jūs apibūdinate, ko norite, o jis pasirūpina statyba.

### Kada naudoti kurią

| Scenarijus | Naudokite |
|----------|----------|
| "Noriu greitai išdiegti savo žiniatinklio programą" | `azd up` |
| "Reikia sukurti tik saugyklos paskyrą" | `az storage account create` |
| "Kuriu pilną DI programą" | `azd init --template azure-search-openai-demo` |
| "Turiu derinti konkretų Azure išteklių" | `az resource show` |
| "Noriu produkcijai paruošto diegimo per kelias minutes" | `azd up --environment production` |

### Jie veikia kartu!

AZD po gaubtu naudoja Azure CLI. Galite naudoti abu:
```bash
# Diegti savo programėlę naudojant AZD
azd up

# Tada patikslinkite konkrečius išteklius su Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Raskite šablonus Awesome AZD

Nesiveržkite iš nulio! **Awesome AZD** yra bendruomenės rinkinys paruoštų diegti šablonų:

| Ištekliai | Aprašymas |
|----------|-------------|
| 🔗 [**Awesome AZD galerija**](https://azure.github.io/awesome-azd/) | Naršykite 200+ šablonų ir diegkite vienu paspaudimu |
| 🔗 [**Pateikti šabloną**](https://github.com/Azure/awesome-azd/issues) | Prisidėkite savo šablonu bendruomenei |
| 🔗 [**GitHub saugykla**](https://github.com/Azure/awesome-azd) | Pridėkite žvaigždutę ir peržiūrėkite šaltinį |

### Populiarūs DI šablonai iš Awesome AZD

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

### 3 žingsnis: Išdiekite savo pirmąją programą

```bash
# Inicializuoti iš šablono
azd init --template todo-nodejs-mongo

# Diegti į Azure (sukuria viską!)
azd up
```

**🎉 Štai ir viskas!** Jūsų programa dabar veikia Azure.

### Išvalymas (Neužmirškite!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kaip naudotis šiuo kursu

Šis kursas skirtas **nuosekliam mokymuisi** - pradėkite ten, kur jaučiatės patogiai, ir žingsnis po žingsnio tobulėkite:

| Jūsų patirtis | Pradėkite čia |
|-----------------|------------|
| **Visai naujas Azure** | [1 skyrius: Pagrindai](#-chapter-1-foundation--quick-start) |
| **Pažįstate Azure, bet naujas AZD** | [1 skyrius: Pagrindai](#-chapter-1-foundation--quick-start) |
| **Norite diegti DI programas** | [2 skyrius: DI-pirmasis vystymas (rekomenduojama DI kūrėjams)](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Norite praktikos** | [🎓 Interaktyvus seminaras](workshop/README.md) - 3-4 val. vedama laboratorija |
| **Reikia produkcinių šablonų** | [8 skyrius: Gamyba & Įmonės](#-chapter-8-production--enterprise-patterns) |

### Greitas nustatymas

1. **Sukurkite šio saugyklos fork'ą**: [![GitHub fork'ai](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonuokite jį**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Gaukite pagalbą**: [Azure Discord bendruomenė](https://discord.com/invite/ByRwuEEgH4)

> **Ar norite klonuoti vietoje?**
>
> Ši saugykla apima daugiau nei 50 vertimų į kalbas, dėl ko reikšmingai padidėja atsisiuntimo dydis. Norėdami klonuoti be vertimų, naudokite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Tai suteikia viską, ko reikia kursui užbaigti, ir leidžia atsisiųsti kur kas greičiau.


## Kurso apžvalga

Įvaldykite Azure Developer CLI (azd) per struktūrizuotus skyrius, skirtus nuosekliam mokymuisi. **Ypatingas dėmesys DI taikomųjų programų diegimui su Microsoft Foundry integracija.**

### Kodėl šis kursas yra būtinas šiuolaikiniams kūrėjams

Remiantis Microsoft Foundry Discord bendruomenės įžvalgomis, **45% kūrėjų nori naudoti AZD DI darbo krūviams**, tačiau susiduria su iššūkiais:
- Kompleksinė daugiapaslapių DI architektūra
- Geriausios praktikos DI diegimui gamyboje  
- Azure DI paslaugų integracija ir konfigūracija
- DI darbo krūvių kaštų optimizavimas
- Trikčių šalinimas su DI specifiniais diegimo klausimais

### Mokymosi tikslai

Baigę šį struktūruotą kursą, jūs:
- **Įvaldysite AZD pagrindus**: pagrindinės sąvokos, diegimas ir konfigūracija
- **Diegsite DI programas**: naudosite AZD su Microsoft Foundry paslaugomis
- **Įgyvendinsite infrastruktūrą kaip kodą**: valdysite Azure išteklius su Bicep šablonais
- **Spręsite diegimo problemas**: išspręsite dažnas problemas ir derinsite klaidas
- **Optimizuosite produkcijai**: saugumas, mastelio keitimas, stebėjimas ir išlaidų valdymas
- **Kursite daugiaagentines sistemas**: diegsite sudėtingas DI architektūras

## 🗺️ Kurso žemėlapis: greita naršyba pagal skyrių

Kiekviename skyriuje yra skirtas README su mokymosi tikslais, greitais pradžios vadovais ir užduotimis:

| Skyrius | Tema | Pamokos | Trukmė | Sudėtingumas |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Pradžia | [AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) &#124; [Įdiegimas](docs/chapter-01-foundation/installation.md) &#124; [Pirmasis projektas](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Skyrius 2: DI kūrimas](docs/chapter-02-ai-development/README.md)** | DI pirmosios programos | [Foundry integracija](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [DI agentai](docs/chapter-02-ai-development/agents.md) &#124; [Modelių diegimas](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Dirbtuvės](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 val. | ⭐⭐ |
| **[Skyrius 3: Konfigūracija](docs/chapter-03-configuration/README.md)** | Autentifikavimas ir saugumas | [Konfigūracija](docs/chapter-03-configuration/configuration.md) &#124; [Autentifikavimas ir saugumas](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Skyrius 4: Infrastruktūra](docs/chapter-04-infrastructure/README.md)** | IaC ir diegimas | [Diegimo vadovas](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Resursų paruošimas](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 val. | ⭐⭐⭐ |
| **[Skyrius 5: Daugiagentė](docs/chapter-05-multi-agent/README.md)** | DI agentų sprendimai | [Mažmeninės prekybos scenarijus](examples/retail-scenario.md) &#124; [Koordinavimo šablonai](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 val. | ⭐⭐⭐⭐ |
| **[Skyrius 6: Prieš diegimą](docs/chapter-06-pre-deployment/README.md)** | Planavimas ir patvirtinimas | [Prieš diegimo patikrinimai](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Talpos planavimas](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU pasirinkimas](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 val. | ⭐⭐ |
| **[Skyrius 7: Gedimų šalinimas](docs/chapter-07-troubleshooting/README.md)** | Derinimas ir taisymas | [Dažnos problemos](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Derinimas](docs/chapter-07-troubleshooting/debugging.md) &#124; [DI problemos](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 val. | ⭐⭐ |
| **[Skyrius 8: Produkcija](docs/chapter-08-production/README.md)** | Įmonių šablonai | [Produkcinės praktikos](docs/chapter-08-production/production-ai-practices.md) | 2-3 val. | ⭐⭐⭐⭐ |
| **[🎓 Dirbtuvės](workshop/README.md)** | Praktinė laboratorija | [Įvadas](workshop/docs/instructions/0-Introduction.md) &#124; [Pasirinkimas](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Patvirtinimas](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Išardymas](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigūracija](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Tinkinkimas](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Infrastruktūros išardymas](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Apibendrinimas](workshop/docs/instructions/7-Wrap-up.md) | 3-4 val. | ⭐⭐ |

**Bendra kurso trukmė:** ~10-14 valandų | **Įgūdžių pažanga:** Pradedantysis → Paruoštas gamybai

---

## 📚 Mokymosi skyriai

*Pasirinkite mokymosi kelią pagal patirties lygį ir tikslus*

### 🚀 Skyrius 1: Pagrindai ir greitas startas
**Priešsąlygos**: Azure prenumerata, pagrindinės komandų eilutės žinios  
**Trukmė**: 30-45 minučių  
**Sudėtingumas**: ⭐

#### Ko išmoksite
- Azure Developer CLI pagrindų supratimas
- AZD diegimas jūsų platformoje
- Jūsų pirmasis sėkmingas diegimas

#### Mokymosi šaltiniai
- **🎯 Pradėkite čia**: [Kas yra Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorija**: [AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) - Pagrindinės sąvokos ir terminologija
- **⚙️ Diegimas**: [Diegimas & Nustatymas](docs/chapter-01-foundation/installation.md) - Platformai pritaikyti vadovai
- **🛠️ Praktika**: [Jūsų pirmasis projektas](docs/chapter-01-foundation/first-project.md) - Žingsnis po žingsnio vadovas
- **📋 Greitas žinynas**: [Komandų atmintinė](resources/cheat-sheet.md)

#### Praktiniai užsiėmimai
```bash
# Greitas įdiegimo patikrinimas
azd version

# Įdiekite savo pirmąją programą
azd init --template todo-nodejs-mongo
azd up
```

**💡 Skyrelio rezultatas**: Sėkmingai įdiekite paprastą žiniatinklio programą į Azure naudojant AZD

**✅ Sėkmės patikrinimas:**
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
**📈 Gebėjimų lygis po:** Gali savarankiškai diegti pagrindines programas
**📈 Gebėjimų lygis po:** Gali savarankiškai diegti pagrindines programas

---

### 🤖 Skyrius 2: DI pirmumo kūrimas (rekomenduojama DI kūrėjams)
**Priešsąlygos**: Baigtas 1 skyrius  
**Trukmė**: 1-2 val.  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Microsoft Foundry integracija su AZD
- DI varomų programų diegimas
- DI paslaugų konfigūracijų supratimas

#### Mokymosi ištekliai
- **🎯 Pradėkite čia**: [Microsoft Foundry integracija](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 DI agentai**: [DI agentų vadovas](docs/chapter-02-ai-development/agents.md) - Diegkite protingus agentus su AZD
- **📖 Šablonai**: [Modelių diegimas](docs/chapter-02-ai-development/ai-model-deployment.md) - Diegti ir valdyti DI modelius
- **🛠️ Dirbtuvės**: [DI dirbtuvių laboratorija](docs/chapter-02-ai-development/ai-workshop-lab.md) - Paruoškite DI sprendimus AZD
- **🎥 Interaktyvus vadovas**: [Dirbtuvių medžiaga](workshop/README.md) - Naršyklės pagrindu mokymasis su MkDocs * DevContainer aplinka
- **📋 Šablonai**: [Microsoft Foundry šablonai](#dirbtuvių-ištekliai)
- **📝 Pavyzdžiai**: [AZD diegimo pavyzdžiai](examples/README.md)

#### Praktiniai užsiėmimai
```bash
# Įdiekite savo pirmąją dirbtinio intelekto programą
azd init --template azure-search-openai-demo
azd up

# Išbandykite papildomus dirbtinio intelekto šablonus
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Skyrelio rezultatas**: Įdiekite ir sukonfigūruokite DI varomą pokalbių programą su RAG galimybėmis

**✅ Sėkmės patikrinimas:**
```bash
# Po 2 skyriaus turėtumėte sugebėti:
azd init --template azure-search-openai-demo
azd up
# Išbandyti DI pokalbių sąsają
# Užduoti klausimus ir gauti DI pagrįstus atsakymus su šaltiniais
# Patikrinti, ar paieškos integracija veikia
azd monitor  # Patikrinti, ar Application Insights rodo telemetriją
azd down --force --purge
```

**📊 Laiko sąnaudos:** 1-2 val.  
**📈 Gebėjimų lygis po:** Gali diegti ir konfigūruoti produkcijai paruoštas DI programas  
**💰 Kainos suvokimas:** Suprasti apie $80-150/mėn kūrimo išlaidas, $300-3500/mėn produkcines išlaidas

#### 💰 Kainos aspektai DI diegimams

**Kūrimo aplinka (apytikriai $80-150/mėn):**
- Microsoft Foundry modeliai (mokėti už naudojimą): $0-50/mėn (atsižvelgiant į žetonų naudojimą)
- AI Search (Basic lygis): $75/mėn
- Container Apps (vartojimas): $0-20/mėn
- Saugykla (Standartinė): $1-5/mėn

**Produkcijos aplinka (apytikriai $300-3,500+/mėn):**
- Microsoft Foundry modeliai (PTU nuolatiniam našumui): $3,000+/mėn ARBA mokestis už naudojimą esant dideliam srautui
- AI Search (Standartinis lygis): $250/mėn
- Container Apps (dedikuota): $50-100/mėn
- Application Insights: $5-50/mėn
- Saugykla (Premium): $10-50/mėn

**💡 Patarimai dėl kaštų optimizavimo:**
- Naudokite **nemokamą lygį** Microsoft Foundry modeliams mokymuisi (Azure OpenAI įtraukta 50,000 žetonų/mėn)
- Paleiskite `azd down` kad atlaisvintumėte resursus kai neaktyviai vystote
- Pradėkite su vartojimu pagrįstu apmokestinimu, PTU naudokite tik produkcijai
- Naudokite `azd provision --preview` kad įvertintumėte kaštus prieš diegimą
- Įjunkite automatinį mastelį: mokėkite tik už faktinį naudojimą

**Kaštų stebėjimas:**
```bash
# Patikrinkite numatomas mėnesines išlaidas
azd provision --preview

# Stebėkite faktines išlaidas Azure portale
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Skyrius 3: Konfigūracija ir autentifikacija
**Priešsąlygos**: Baigtas 1 skyrius  
**Trukmė**: 45-60 minučių  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Aplinkos konfigūracija ir valdymas
- Autentifikavimo ir saugumo geriausios praktikos
- Resursų vardinimas ir organizavimas

#### Mokymosi šaltiniai
- **📖 Konfigūracija**: [Konfigūracijos vadovas](docs/chapter-03-configuration/configuration.md) - Aplinkos nustatymas
- **🔐 Saugumas**: [Autentifikavimo šablonai ir valdomos tapatybės](docs/chapter-03-configuration/authsecurity.md) - Autentifikavimo šablonai
- **📝 Pavyzdžiai**: [Duomenų bazės programos pavyzdys](examples/database-app/README.md) - AZD duomenų bazių pavyzdžiai

#### Praktiniai užsiėmimai
- Konfigūruokite kelias aplinkas (dev, staging, prod)
- Nustatykite valdomos tapatybės autentifikavimą
- Įdiekite aplinkai specifines konfigūracijas

**💡 Skyrelio rezultatas**: Valdykite kelias aplinkas su tinkamu autentifikavimu ir saugumu

---

### 🏗️ Skyrius 4: Infrastruktūra kaip kodas ir diegimas
**Priešsąlygos**: Baigti 1-3 skyriai  
**Trukmė**: 1-1.5 val.  
**Sudėtingumas**: ⭐⭐⭐

#### Ko išmoksite
- Išplėstiniai diegimo modeliai
- Infrastruktūra kaip kodas su Bicep
- Resursų paskirstymo strategijos

#### Mokymosi šaltiniai
- **📖 Diegimas**: [Diegimo vadovas](docs/chapter-04-infrastructure/deployment-guide.md) - Pilni darbo srautai
- **🏗️ Paruošimas**: [Resursų paruošimas](docs/chapter-04-infrastructure/provisioning.md) - Azure resursų valdymas
- **📝 Pavyzdžiai**: [Container App pavyzdys](../../examples/container-app) - Kontenerizuoti diegimai

#### Praktiniai užsiėmimai
- Sukurkite pasirinktinius Bicep šablonus
- Įdiekite kelių paslaugų programas
- Įgyvendinkite blue-green diegimo strategijas

**💡 Skyrelio rezultatas**: Įdiekite sudėtingas kelių paslaugų programas naudodami pasirinktinius infrastruktūros šablonus

---

### 🎯 Skyrius 5: Daugiagentė DI sprendimai (Išplėstinis)
**Priešsąlygos**: Baigti 1-2 skyriai  
**Trukmė**: 2-3 val.  
**Sudėtingumas**: ⭐⭐⭐⭐

#### Ko išmoksite
- Daugiagentės architektūros modeliai
- Agentų orkestracija ir koordinavimas
- Produkciniams paruošti DI diegimai

#### Mokymosi šaltiniai
- **🤖 Pagrindinis projektas**: [Mažmeninės prekybos daugiagentis sprendimas](examples/retail-scenario.md) - Pilnas įgyvendinimas
- **🛠️ ARM šablonai**: [ARM šablonų paketas](../../examples/retail-multiagent-arm-template) - Vieno paspaudimo diegimas
- **📖 Architektūra**: [Daugiagentų koordinavimo modeliai](docs/chapter-06-pre-deployment/coordination-patterns.md) - Modeliai

#### Praktiniai užsiėmimai
```bash
# Diegti pilną mažmeninės prekybos kelių agentų sprendimą
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tyrinėti agentų konfigūracijas
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Skyrelio rezultatas**: Įdiekite ir valdykite produkcijai paruoštą daugiagentį DI sprendimą su Kliento ir Inventoriaus agentais

---

### 🔍 Skyrius 6: Prieš diegimo patikrinimo ir planavimo
**Priešsąlygos**: Baigtas 4 skyrius  
**Trukmė**: 1 val.  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Talpos planavimas ir resursų patikrinimas
- SKU pasirinkimo strategijos
- Prieš diegimo patikrinimai ir automatizavimas

#### Mokymosi šaltiniai
- **📊 Planavimas**: [Talpos planavimas](docs/chapter-06-pre-deployment/capacity-planning.md) - Resursų patikrinimas
- **💰 Pasirinkimas**: [SKU pasirinkimas](docs/chapter-06-pre-deployment/sku-selection.md) - Taupūs sprendimai
- **✅ Patikrinimas**: [Prieš diegimo patikrinimai](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiniai skriptai

#### Praktiniai užsiėmimai
- Paleiskite talpos patikrinimo skriptus
- Optimizuokite SKU pasirinkimus dėl kainos
- Įdiekite automatizuotus prieš diegimo patikrinimus

**💡 Skyrelio rezultatas**: Patikrinkite ir optimizuokite diegimus prieš vykdymą

---

### 🚨 Skyrius 7: Gedimų šalinimas ir derinimas
**Priešsąlygos**: Baigtas bet kuris diegimo skyrius  
**Trukmė**: 1-1.5 val.  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Sisteminiai derinimo metodai
- Dažnos problemos ir sprendimai
- DI specifinis gedimų šalinimas

#### Mokymosi šaltiniai
- **🔧 Dažnos problemos**: [Dažnos problemos](docs/chapter-07-troubleshooting/common-issues.md) - DUK ir sprendimai
- **🕵️ Derinimas**: [Derinimo vadovas](docs/chapter-07-troubleshooting/debugging.md) - Žingsnis po žingsnio strategijos
- **🤖 DI problemos**: [DI specifinis gedimų šalinimas](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - DI paslaugų problemos

#### Praktiniai užsiėmimai
- Diagnostikuokite diegimo klaidas
- Išspręskite autentifikavimo problemas
- Derinkite DI paslaugų ryšį

**💡 Skyrelio rezultatas**: Savarankiškai diagnozuokite ir išspręskite dažnas diegimo problemas

---

### 🏢 Skyrius 8: Produkcija ir įmonių šablonai
**Priešsąlygos**: Baigti 1-4 skyriai  
**Trukmė**: 2-3 val.  
**Sudėtingumas**: ⭐⭐⭐⭐

#### Ko išmoksite
- Produkcinio diegimo strategijos
- Įmonių saugumo modeliai
- Stebėjimas ir kaštų optimizavimas

#### Mokymosi šaltiniai
- **🏭 Gamyba**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Įmonių modeliai
- **📝 Pavyzdžiai**: [Microservices Example](../../examples/microservices) - Sudėtingos architektūros
- **📊 Stebėsena**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Stebėsena

#### Praktinės užduotys
- Įgyvendinti įmonės saugumo modelius
- Sukurti išsamią stebėseną
- Paleisti į gamybą su tinkama valdymo kontrole

**💡 Skyriaus rezultatas**: Diegti įmonėms paruoštas programas su pilnu gamybiniu funkcionalumu

---

## 🎓 Seminaro apžvalga: praktinė mokymosi patirtis

> **⚠️ DIRBTUVIŲ BŪKLĖ: Vykdomas vystymas**  
> Dirbtuvių medžiaga šiuo metu yra kuriama ir tobulinama. Pagrindiniai moduliai veikia, tačiau kai kurios pažangios skirsniai dar nebaigti. Aktyviai dirbame, kad užbaigtume visą turinį. [Stebėti pažangą →](workshop/README.md)

### Interaktyvi dirbtuvių medžiaga
**Išsamus praktinis mokymasis su naršyklės įrankiais ir vedamomis užduotimis**

Mūsų dirbtuvės suteikia struktūrizuotą, interaktyvią mokymosi patirtį, kuri papildo aukščiau pateiktą skyrių pagrindu parengtą mokymą. Dirbtuvės skirtos tiek savarankiškam mokymuisi, tiek instruktoriaus vedamoms sesijoms.

#### 🛠️ Dirbtuvių ypatybės
- **Naršyklėje veikianti sąsaja**: Pilnos MkDocs pagrindu veikiamos dirbtuvės su paieškos, kopijavimo ir temų funkcijomis
- **GitHub Codespaces integracija**: Vieno paspaudimo vystymo aplinkos nustatymas
- **Struktūrizuota mokymosi eiga**: 8-modulių vedamos užduotys (iš viso 3–4 val.)
- **Progresinė metodika**: Įvadas → Pasirinkimas → Validacija → Dekonstrukcija → Konfigūravimas → Personalizavimas → Išmontavimas → Apibendrinimas
- **Interaktyvi DevContainer aplinka**: Iš anksto sukonfigūruoti įrankiai ir priklausomybės

#### 📚 Dirbtuvių modulio struktūra
Dirbtuvės seka **8-modulių progresinę metodiką**, kuri nuveda nuo atradimo iki diegimo meistriškumo:

| Modulis | Tema | Ką darysite | Trukmė |
|--------|-------|----------------|----------|
| **0. Įvadas** | Dirbtuvių apžvalga | Suprasti mokymosi tikslus, išankstines sąlygas ir dirbtuvių struktūrą | 15 min |
| **1. Pasirinkimas** | Šablonų atranka | Tyrinėkite AZD šablonus ir pasirinkite tinkamą AI šabloną jūsų scenarijui | 20 min |
| **2. Validacija** | Diegimas ir tikrinimas | Įdiekite šabloną naudodami `azd up` ir patikrinkite, ar infrastruktūra veikia | 30 min |
| **3. Dekonstrukcija** | Suprasti struktūrą | Naudokite GitHub Copilot, kad ištirtumėte šablono architektūrą, Bicep failus ir kodo organizavimą | 30 min |
| **4. Konfigūravimas** | azure.yaml išsamiai | Išmokite valdyti `azure.yaml` konfigūraciją, gyvenimo ciklo kabliukus ir aplinkos kintamuosius | 30 min |
| **5. Personalizavimas** | Pritaikymas | Įjunkite AI paiešką, stebėjimą, vertinimą ir pritaikykite pagal savo scenarijų | 45 min |
| **6. Išmontavimas** | Išvalymas | Saugiai ištrinkite resursus naudodami `azd down --purge` | 15 min |
| **7. Apibendrinimas** | Kiti žingsniai | Peržvelkite pasiekimus, pagrindines sąvokas ir tęskite mokymosi kelią | 15 min |

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
# Spustelėkite "Code" → "Create codespace on main" repozitorijoje

# Parinktis 2: Vietinis vystymas
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Sekite sąrankos instrukcijas faile workshop/README.md
```

#### 🎯 Dirbtuvių mokymosi rezultatai
Baigę dirbtuves dalyviai sugebės:
- **Diegti gamybines AI programas**: Naudoti AZD su Microsoft Foundry paslaugomis
- **Įvaldyti daugiagentines architektūras**: Įgyvendinti koordinuotas AI agentų sprendimus
- **Įdiegti saugumo gerąsias praktikas**: Sukonfigūruoti autentifikaciją ir prieigos kontrolę
- **Optimizuoti mastelį**: Projektuoti ekonomiškus ir našius diegimus
- **Išspręsti diegimų problemas**: Savarankiškai spręsti dažnas problemas

#### 📖 Dirbtuvių ištekliai
- **🎥 Interaktyvus vadovas**: [Dirbtuvių medžiaga](workshop/README.md) - Naršyklėje veikianti mokymosi aplinka
- **📋 Modulis po modulio instrukcijos**:
  - [0. Įvadas](workshop/docs/instructions/0-Introduction.md) - Dirbtuvių apžvalga ir tikslai
  - [1. Pasirinkimas](workshop/docs/instructions/1-Select-AI-Template.md) - Raskite ir pasirinkite AI šablonus
  - [2. Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) - Įdiekite ir patikrinkite šablonus
  - [3. Dekonstrukcija](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Tyrinėkite šablono architektūrą
  - [4. Konfigūravimas](workshop/docs/instructions/4-Configure-AI-Template.md) - Išmokite `azure.yaml`
  - [5. Personalizavimas](workshop/docs/instructions/5-Customize-AI-Template.md) - Pritaikykite pagal savo scenarijų
  - [6. Išmontavimas](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Išvalykite resursus
  - [7. Apibendrinimas](workshop/docs/instructions/7-Wrap-up.md) - Peržvalga ir tolesni žingsniai
- **🛠️ AI dirbtuvių laboratorija**: [AI dirbtuvių laboratorija](docs/chapter-02-ai-development/ai-workshop-lab.md) - Užduotys, orientuotos į AI
- **💡 Greitas startas**: [Dirbtuvių nustatymo vadovas](workshop/README.md#quick-start) - Aplinkos konfigūracija

Puikiai tinka: įmonių mokymai, universitetų kursai, savarankiškas mokymasis ir kūrėjų stovyklos.

---

## 📖 Detalus apžvalga: AZD galimybės

Be pagrindų, AZD suteikia galingas funkcijas gamybiniams diegimams:

- **Diegimai pagal šablonus** - Naudokite iš anksto paruoštus šablonus bendroms programų struktūroms
- **Infrastruktūra kaip kodas** - Valdykite Azure išteklius naudodami Bicep arba Terraform  
- **Integruotos darbo eigos** - Sklandžiai paruoškite, diekite ir stebėkite programas
- **Draugiškas kūrėjui** - Optimizuota kūrėjų produktyvumui ir patirčiai

### **AZD + Microsoft Foundry: Puikiai tinka AI diegimams**

**Kodėl AZD AI sprendimams?** AZD sprendžia pagrindines problemas, su kuriomis susiduria AI kūrėjai:

- **AI paruošti šablonai** - Iš anksto sukonfigūruoti šablonai Microsoft Foundry modeliams, Cognitive Services ir ML apkrovoms
- **Saugūs AI diegimai** - Įmontuotos saugumo praktikos AI paslaugoms, API raktams ir modelių galiniams taškams  
- **Gamybiniai AI modeliai** - Geriausios praktikos skalėms, ekonomiškiems AI programų diegimams
- **End-to-End AI darbo eigos** - Nuo modelio kūrimo iki gamybinio diegimo su tinkama stebėsena
- **Kaštų optimizavimas** - Išmanus išteklių paskirstymas ir mastelio keitimo strategijos AI apkrovoms
- **Microsoft Foundry integracija** - Sklandi integracija su Microsoft Foundry modelių katalogu ir galiniais taškais

---

## 🎯 Šablonų ir pavyzdžių biblioteka

### Išskirtiniai: Microsoft Foundry šablonai
**Pradėkite čia, jei diegiate AI programas!**

> **Pastaba:** Šie šablonai demonstruoja įvairius AI modelius. Kai kurie yra išoriniai Azure Samples, kiti - vietinės įgyvendinimo versijos.

| Šablonas | Skyrius | Sudėtingumas | Paslaugos | Tipas |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2 skyrius | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Išorinis |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2 skyrius | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Išorinis |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2 skyrius | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Išorinis |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2 skyrius | ⭐ | AzureOpenAI + Container Apps + Application Insights | Išorinis |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5 skyrius | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Išorinis |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 8 skyrius | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Išorinis |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | 5 skyrius | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Vietinis** |

### Išskirtiniai: Pilni mokymosi scenarijai
**Gamybai paruošti programų šablonai, susieti su mokymosi skyriais**

| Šablonas | Mokymosi skyrius | Sudėtingumas | Pagrindinė pamoka |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2 skyrius | ⭐ | Pagrindiniai AI diegimo modeliai |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2 skyrius | ⭐⭐ | RAG įgyvendinimas su Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4 skyrius | ⭐⭐ | Dokumentų intelekto integracija |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5 skyrius | ⭐⭐⭐ | Agentų sistema ir funkcijų iškvietimas |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8 skyrius | ⭐⭐⭐ | Įmonių AI orkestracija |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5 skyrius | ⭐⭐⭐⭐ | Daugiagentinė architektūra su Klientų ir Inventoriaus agentais |

### Mokymasis pagal pavyzdžių tipą

> **📌 Vietiniai vs. Išoriniai pavyzdžiai:**  
> **Vietiniai pavyzdžiai** (šiame repozitorijoje) = Paruošti naudoti iš karto  
> **Išoriniai pavyzdžiai** (Azure Samples) = Klonuokite iš nurodytų saugyklų

#### Vietiniai pavyzdžiai (paruošta naudoti)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Pilnas gamybai paruoštas įgyvendinimas su ARM šablonais
  - Daugiagentinė architektūra (Klientų ir Inventoriaus agentai)
  - Išsami stebėsena ir vertinimas
  - Vieno paspaudimo diegimas per ARM šabloną

#### Vietiniai pavyzdžiai - konteinerių programos (2-5 skyriai)
**Išsamūs konteinerių diegimo pavyzdžiai šiame repozitorijoje:**
- [**Container App Examples**](examples/container-app/README.md) - Pilnas vadovas apie konteinerių diegimus
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Paprastas REST API su mastelio mažinimu iki nulio
  - [Microservices Architecture](../../examples/container-app/microservices) - Gamybai paruoštas daugiaservisinis diegimas
  - Greitas startas, gamybiniai ir pažangūs diegimo modeliai
  - Stebėsena, saugumas ir kaštų optimizavimo gairės

#### Išoriniai pavyzdžiai - paprastos programos (1-2 skyriai)
**Klonuokite šias Azure Samples saugyklas, kad pradėtumėte:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pagrindiniai diegimo modeliai
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statinio turinio diegimas
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API diegimas

#### Išoriniai pavyzdžiai - duomenų bazės integracija (3-4 skyriai)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Duomenų bazės prijungimo modeliai
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless duomenų darbo eiga

#### Išoriniai pavyzdžiai - pažangūs modeliai (4-8 skyriai)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Daugiaservisinės architektūros
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Foninių užduočių apdorojimas  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Gamybai paruošti ML modelių darbo eigos

### Išorinės šablonų kolekcijos
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Atrinkta oficialių ir bendruomenės šablonų kolekcija
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn šablonų dokumentacija
- [**Examples Directory**](examples/README.md) - Vietiniai mokymosi pavyzdžiai su išsamiais paaiškinimais

---

## 📚 Mokymosi ištekliai ir nuorodos

### Greitos nuorodos
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Esminiai azd komandų santraukos pagal skyrių
- [**Glossary**](resources/glossary.md) - Azure ir azd terminų žodynas  
- [**FAQ**](resources/faq.md) - Dažniausi klausimai pagal mokymosi skyrių
- [**Study Guide**](resources/study-guide.md) - Išsamios praktinės užduotys

### Praktiniai seminarai
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Paruoškite savo AI sprendimus diegimui per AZD (2–3 val.)
- [**Interactive Workshop**](workshop/README.md) - 8 modulių vedamos užduotys su MkDocs ir GitHub Codespaces
  - Sekos: Įvadas → Pasirinkimas → Validacija → Dekonstrukcija → Konfigūravimas → Personalizavimas → Išmontavimas → Apibendrinimas

### Išoriniai mokymosi ištekliai
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure kainų skaičiuoklė](https://azure.microsoft.com/pricing/calculator/)
- [Azure būklė](https://status.azure.com/)

### AI agentų įgūdžiai jūsų redaktoriui
- [**Microsoft Azure įgūdžiai (skills.sh)**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 atviri agentų įgūdžiai Azure DI, Foundry, diegimui, diagnostikai, kaštų optimizavimui ir kt. Įdiekite juos į GitHub Copilot, Cursor, Claude Code ar bet kurį palaikomą agentą:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Greita trikčių šalinimo vadovas

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
# Išvardinti prieinamas prenumeratas
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

# Arba naudokite mažesnius SKU vystymo metu
# Redaguokite infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Parinktis 1: Išvalyti ir bandyti dar kartą
azd down --force --purge
azd up

# Parinktis 2: Tiesiog sutvarkyti infrastruktūrą
azd provision

# Parinktis 3: Patikrinti išsamų statusą
azd show

# Parinktis 4: Patikrinti žurnalus Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD generuoja unikalius pavadinimus, bet jei kyla konfliktas:
azd down --force --purge

# Tada bandykite iš naujo su švaria aplinka
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Šablono diegimas užtrunka per ilgai</strong></summary>

**Įprasti laukimo laikai:**
- Paprasta žiniatinklio programa: 5-10 minučių
- Programa su duomenų baze: 10-15 minučių
- DI programos: 15-25 minučių (OpenAI resursų paruošimas lėtas)

```bash
# Patikrinkite pažangą
azd show

# Jei užstrigote ilgiau nei 30 minučių, patikrinkite Azure portalą:
azd monitor
# Ieškokite nepavykusių diegimų
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Patikrinkite savo Azure vaidmenį
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Jums reikia bent "Contributor" vaidmens
# Paprašykite savo Azure administratoriaus suteikti:
# - Contributor (resursams)
# - User Access Administrator (vaidmenų priskyrimams)
```
</details>

<details>
<summary><strong>❌ Nepavyksta rasti diegtos programos URL</strong></summary>

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
- **DI specifinės problemos:** [DI trikčių šalinimas](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Derinimo vadovas:** [Žingsnis po žingsnio derinimas](docs/chapter-07-troubleshooting/debugging.md)
- **Gaukite pagalbą:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurso baigimas ir sertifikacija

### Pažangos sekimas
Sekite mokymosi pažangą per kiekvieną skyrių:

- [ ] **1 skyrius**: Pagrindai ir greitas pradėjimas ✅
- [ ] **2 skyrius**: DI pirmumo kūrimas ✅  
- [ ] **3 skyrius**: Konfigūracija ir autentifikavimas ✅
- [ ] **4 skyrius**: Infrastruktūra kaip kodas (IaC) ir diegimas ✅
- [ ] **5 skyrius**: Daugiagentės DI sprendimai ✅
- [ ] **6 skyrius**: Išankstinė patikra ir planavimas prieš diegimą ✅
- [ ] **7 skyrius**: Trikčių šalinimas ir derinimas ✅
- [ ] **8 skyrius**: Produkcija ir įmonės modeliai ✅

### Mokymosi patvirtinimas
Baigę kiekvieną skyrių, patvirtinkite savo žinias šiais būdais:
1. **Praktinė užduotis**: Atlikite skyriaus praktinį diegimą
2. **Žinių patikrinimas**: Peržiūrėkite DUK, skirtą jūsų skyriui
3. **Bendruomenės diskusija**: Pasidalinkite savo patirtimi Azure Discord
4. **Kitas skyrius**: Pereikite prie kito sudėtingumo lygio

### Kurso baigimo privalumai
Baigę visus skyrius, turėsite:
- **Patirtis gamyboje**: Išdiegėte realias DI programas Azure
- **Profesionalūs įgūdžiai**: Įmonėms paruošti diegimo gebėjimai  
- **Bendruomenės pripažinimas**: Aktyvus Azure kūrėjų bendruomenės narys
- **Karjeros augimas**: Paklausi AZD ir DI diegimo ekspertizė

---

## 🤝 Bendruomenė ir palaikymas

### Gaukite pagalbą ir palaikymą
- **Techninės problemos**: [Praneškite apie klaidas ir prašykite funkcijų](https://github.com/microsoft/azd-for-beginners/issues)
- **Mokymosi klausimai**: [Microsoft Azure Discord bendruomenė](https://discord.gg/microsoft-azure) ir [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **DI specifinė pagalba**: Prisijunkite prie [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Oficiali Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Bendruomenės įžvalgos iš Microsoft Foundry Discord

**Naujausi apklausos rezultatai iš #Azure kanalo:**
- **45%** kūrėjų nori naudoti AZD DI apkrovoms
- **Pagrindiniai iššūkiai**: daugelio paslaugų diegimai, kredencialų valdymas, pasirengimas gamybai  
- **Dažniausiai prašoma**: DI specifiniai šablonai, trikčių šalinimo vadovai, geriausios praktikos

**Prisijunkite prie mūsų bendruomenės, kad:**
- Pasidalinkite savo AZD + DI patirtimi ir gaukite pagalbą
- Gaukite ankstyvas naujų DI šablonų peržiūras
- Prisidėkite prie DI diegimo geriausių praktikų
- Įtakokite būsimą DI + AZD funkcijų vystymą

### Kaip prisidėti prie kurso
Kviečiame prisidėti! Prašome perskaityti mūsų [Prisidėjimo vadovą](CONTRIBUTING.md) dėl išsamesnės informacijos apie:
- **Turinio patobulinimai**: Patobulinkite esamus skyrius ir pavyzdžius
- **Nauji pavyzdžiai**: Pridėkite realaus pasaulio scenarijus ir šablonus  
- **Vertimas**: Padėkite palaikyti kelių kalbų versijas
- **Klaidų pranešimai**: Pagerinkite tikslumą ir aiškumą
- **Bendruomenės standartai**: Laikykitės mūsų įtraukiančių bendruomenės gairių

---

## 📄 Kurso informacija

### Licencija
Šis projektas licencijuotas pagal MIT licenciją - žr. [LICENSE](../../LICENSE) failą dėl išsamesnės informacijos.

### Susiję Microsoft mokymosi ištekliai

Mūsų komanda rengia kitus išsamius mokymosi kursus:

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
 
### Pagrindiniai mokymai
[![Mašininis mokymasis pradedantiesiems](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Duomenų mokslas pradedantiesiems](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![DI pradedantiesiems](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kibernetinis saugumas pradedantiesiems](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Tinklapių kūrimas pradedantiesiems](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![Daiktų internetas pradedantiesiems](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR kūrimas pradedantiesiems](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot serija
[![Copilot skirtas AI poriniam programavimui](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot skirtas C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot nuotykiai](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurso navigacija

**🚀 Pasiruošę pradėti mokytis?**

**Pradedantieji**: Pradėkite nuo [1 skyrius: Pagrindai ir greitas pradžiamokslis](#-chapter-1-foundation--quick-start)  
**AI kūrėjai**: Pereikite prie [2 skyrius: AI-pirmasis vystymas](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Patyrę kūrėjai**: Pradėkite nuo [3 skyrius: Konfigūracija ir autentifikavimas](#️-chapter-3-configuration--authentication)

**Kiti žingsniai**: [Pradėti 1 skyrių - AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus žmogaus atliktas vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->