<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T16:18:22+00:00",
  "source_file": "README.md",
  "language_code": "lt"
}
-->
# AZD Pradedantiesiems: Struktūruotas Mokymosi Kelias

![AZD-for-beginners](../../../../translated_images/lt/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Pradžia Su Šiuo Kursu

Sekite šiuos žingsnius, kad pradėtumėte savo AZD mokymosi kelionę:

1. **Padarykite Repozitorijos Fork'ą**: Spauskite [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonuokite Repozitoriją**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Prisijunkite prie Bendruomenės**: [Azure Discord Bendruomenės](https://discord.com/invite/ByRwuEEgH4) ekspertų palaikymui
4. **Pasirinkite Mokymosi Kelią**: Žemiau pasirinkite skyrių, atitinkantį jūsų patirties lygį

### Daugiakalbė Palaikymas

#### Automatiniai Vertimai (Visada Atviri Naujinimams)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](./README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Ar Norite Klonuoti Vietoje?**

> Šiame repozitorijuje yra daugiau nei 50 kalbų vertimų, kurie žymiai padidina atsisiuntimo dydį. Norėdami klonuoti be vertimų, naudokite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Tai suteikia jums viską, ko reikia kursui baigti, gerokai greičiau atsisiunčiant.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kurso Apžvalga

Išmokite Azure Developer CLI (azd) per struktūruotus skyrius, sudarytus progresyviam mokymuisi. **Specialus dėmesys skiriamas AI taikomųjų programų diegimui su Microsoft Foundry integracija.**

### Kodėl Šis Kursas Yra Būtinas Šiuolaikiniams Kūrėjams

Remiantis Microsoft Foundry Discord bendruomenės įžvalgomis, **45 % kūrėjų nori naudoti AZD AI darbo krūviams**, bet susiduria su iššūkiais:
- Sudėtinga daugiapaslaugių AI architektūra
- Geriausios praktikos AI gamybos diegimui  
- Azure AI paslaugų integracija ir konfigūracija
- Išlaidų optimizavimas AI darbo krūviams
- AI diegimo klaidų šalinimas

### Mokymosi Tikslai

Baigę šį struktūrizuotą kursą, jūs:
- **Išmoksite AZD pagrindus**: Pagrindinės sąvokos, įdiegimas ir konfigūracija
- **Diegsite AI taikomąsias programas**: Naudojant AZD su Microsoft Foundry paslaugomis
- **Įgyvendinsite infrastruktūrą kaip kodą**: Valdykite Azure išteklius su Bicep šablonais
- **Spręsite diegimo problemas**: Išspręsite dažnas problemas ir klaidas
- **Optimizuosite gamybai**: Saugumas, mastelio keitimas, stebėjimas ir išlaidų valdymas
- **Kursite daugiapakopes AI sprendimus**: Diegsite sudėtingas AI architektūras

## 📚 Mokymosi Skyriai

*Pasirinkite savo mokymosi kelią pagal patirties lygį ir tikslus*

### 🚀 1 skyrius: Pagrindai & Greitas Pradėjimas
**Reikalavimai**: Azure prenumerata, pagrindinės komandų eilutės žinios  
**Trukmė**: 30-45 minučių  
**Sudėtingumas**: ⭐

#### Ko Išmoksit
- Suprasti Azure Developer CLI pagrindus
- Įdiegti AZD savo platformoje
- Atlikti pirmą sėkmingą diegimą

#### Mokymosi Šaltiniai
- **🎯 Pradėkite Čia**: [Kas yra Azure Developer CLI?](../..)
- **📖 Teorija**: [AZD Pagrindai](docs/getting-started/azd-basics.md) – Pagrindinės sąvokos ir terminai
- **⚙️ Paruošimas**: [Įdiegimas & Paruošimas](docs/getting-started/installation.md) – Platformos gidas
- **🛠️ Praktika**: [Jūsų Pirmas Projektas](docs/getting-started/first-project.md) – Žingsnis po žingsnio pamoka
- **📋 Trumpa Atmintinė**: [Komandų Lakštas](resources/cheat-sheet.md)

#### Praktiniai Užsiėmimai
```bash
# Greitas diegimo patikrinimas
azd version

# Diegkite savo pirmąją programą
azd init --template todo-nodejs-mongo
azd up
```

**💡 Skyriaus Rezultatas**: Sėkmingai įdiegti paprastą interneto programėlę Azure naudojant AZD

**✅ Sėkmės Patvirtinimas:**
```bash
# Baigę 1 skyrių, turėtumėte mokėti:
azd version              # Rodo įdiegtą versiją
azd init --template todo-nodejs-mongo  # Inicializuoja projektą
azd up                  # Diegia į Azure
azd show                # Rodo paleistos programos URL
# Programa atsidaro naršyklėje ir veikia
azd down --force --purge  # Išvalo resursus
```

**📊 Laiko Sąnaudos:** 30-45 minutės  
**📈 Įgūdžių Lygis Po:** Geba savarankiškai diegti pagrindines programas

**✅ Sėkmės Patvirtinimas:**
```bash
# Baigus 1 skyrių, turėtumėte sugebėti:
azd version              # Rodo įdiegtą versiją
azd init --template todo-nodejs-mongo  # Inicializuoja projektą
azd up                  # Diegia į Azure
azd show                # Rodo veikiančios programos URL
# Programa atsidaro naršyklėje ir veikia
azd down --force --purge  # Išvalo išteklius
```

**📊 Laiko Sąnaudos:** 30-45 minutės  
**📈 Įgūdžių Lygis Po:** Geba savarankiškai diegti pagrindines programas

---

### 🤖 2 skyrius: AI-Pirmasis Kūrimas (Rekomenduojama AI Kūrėjams)
**Reikalavimai**: Baigtas 1 skyrius  
**Trukmė**: 1-2 valandos  
**Sudėtingumas**: ⭐⭐

#### Ko Išmoksit
- Microsoft Foundry integracija su AZD
- AI pagrindu veikiančių programų diegimas
- AI paslaugų konfigūracijų supratimas

#### Mokymosi Šaltiniai
- **🎯 Pradėkite Čia**: [Microsoft Foundry Integracija](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Šablonai**: [AI Modelių Diegimas](docs/microsoft-foundry/ai-model-deployment.md) – Diegti ir valdyti AI modelius
- **🛠️ Darbo Dirbtuvės**: [AI Darbo Dirbtuvių Laboratorija](docs/microsoft-foundry/ai-workshop-lab.md) – Paruoškite AI sprendimus AZD naudojimui
- **🎥 Interaktyvi Vadovė**: [Dirbtuvių Medžiaga](workshop/README.md) – Naršyklės pagrindu su MkDocs * DevContainer Aplinka
- **📋 Šablonai**: [Microsoft Foundry Šablonai](../..)
- **📝 Pavyzdžiai**: [AZD Diegimo Pavyzdžiai](examples/README.md)

#### Praktiniai Užsiėmimai
```bash
# Paleiskite savo pirmąją DI programą
azd init --template azure-search-openai-demo
azd up

# Išbandykite papildomas DI šablonus
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Skyriaus Rezultatas**: Diegti ir konfigūruoti AI pagrindu veikiančią pokalbių aplikaciją su RAG funkcijomis

**✅ Sėkmės Patvirtinimas:**
```bash
# Po 2 skyriaus turėtumėte sugebėti:
azd init --template azure-search-openai-demo
azd up
# Išbandyti AI pokalbių sąsają
# Užduoti klausimus ir gauti AI palaikomus atsakymus su šaltiniais
# Patikrinti, ar veikia paieškos integracija
azd monitor  # Patikrinti, ar Application Insights rodo telemetriją
azd down --force --purge
```

**📊 Laiko Sąnaudos:** 1-2 valandos  
**📈 Įgūdžių Lygis Po:** Geba diegti ir konfigūruoti gamybai paruoštas AI programas  
**💰 Išlaidų Sąmoningumas:** Supranta apie 80-150 $/mėn kūrimo, 300-3500 $/mėn gamybos sąnaudas

#### 💰 AI Diegimo Išlaidų Apsvarstymai

**Kūrimo Aplinka (Apskaičiuota 80-150 $/mėn):**
- Azure OpenAI (mokestis už naudojimą): 0-50 $/mėn (priklausomai nuo tokenų sunaudojimo)
- AI Paieška (Pagrindinis lygis): 75 $/mėn
- Container Apps (Vartojimo modelis): 0-20 $/mėn
- Saugykla (Standartinė): 1-5 $/mėn

**Gamybos Aplinka (Apskaičiuota 300-3500+ $/mėn):**
- Azure OpenAI (PTU už pastovų našumą): 3000+ $/mėn ARBA mokestis už naudojimą didelėms apimtimis
- AI Paieška (Standartinis lygis): 250 $/mėn
- Container Apps (Skirtas): 50-100 $/mėn
- Application Insights: 5-50 $/mėn
- Saugykla (Premium): 10-50 $/mėn

**💡 Išlaidų Optimizavimo Patarimai:**
- Naudokite **Nemokamą Lygį** Azure OpenAI mokymuisi (50,000 tokenų per mėnesį įskaičiuota)
- Naudokite `azd down`, kad atlaisvintumėte išteklius, kai nenaudojate aktyviai kūrimo metu
- Pradėkite nuo vartojimo modelio, PTU naudokite tik gamybai
- Naudokite `azd provision --preview`, kad įvertintumėte išlaidas prieš diegimą
- Įjunkite automatinį skalavimą: mokėkite tik už tikrą naudojimą

**Išlaidų Stebėjimas:**
```bash
# Patikrinkite numatomas mėnesines išlaidas
azd provision --preview

# Stebėkite faktines išlaidas Azure portale
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3 skyrius: Konfigūracija ir Autentifikacija
**Reikalavimai**: Baigtas 1 skyrius  
**Trukmė**: 45-60 minučių  
**Sudėtingumas**: ⭐⭐

#### Ko Išmoksit
- Aplinkos konfigūracija ir valdymas
- Autentifikavimo ir saugumo geriausios praktikos
- Išteklių vardų kūrimas ir organizavimas

#### Mokymosi Šaltiniai
- **📖 Konfigūracija**: [Konfigūracijos Vadovas](docs/getting-started/configuration.md) – Aplinkos paruošimas
- **🔐 Saugumas**: [Autentifikavimo Šablonai ir Valdomos Tapatybės](docs/getting-started/authsecurity.md) – Autentifikavimo pavyzdžiai
- **📝 Pavyzdžiai**: [Duomenų Bazės Programėlės Pavyzdys](examples/database-app/README.md) – AZD Duomenų Bazės Pavyzdžiai

#### Praktiniai Užsiėmimai
- Konfigūruoti kelias aplinkas (kūrimas, testavimas, gamyba)
- Įdiegti valdomos tapatybės autentifikavimą
- Įgyvendinti aplinkai specifines konfigūracijas

**💡 Skyriaus Rezultatas**: Valdyti kelias aplinkas su tinkamu autentifikavimu ir saugumu

---

### 🏗️ 4 skyrius: Infrastruktūra kaip Kodas ir Diegimas
**Reikalavimai**: Baigti 1–3 skyrius  
**Trukmė**: 1–1.5 valandos  
**Sudėtingumas**: ⭐⭐⭐

#### Ko Išmoksit
- Išplėstiniai diegimo modeliai
- Infrastruktūra kaip Kodas su Bicep
- Išteklių teikimo strategijos

#### Mokymosi Šaltiniai
- **📖 Diegimas**: [Diegimo Vadovas](docs/deployment/deployment-guide.md) – Pilni darbo srautai
- **🏗️ Teikimas**: [Išteklių Teikimas](docs/deployment/provisioning.md) – Azure išteklių valdymas
- **📝 Pavyzdžiai**: [Container App Pavyzdys](../../examples/container-app) – Konteinerių diegimai

#### Praktiniai Užsiėmimai
- Kurti vartotojų Bicep šablonus
- Diegti daugiaservisių programų architektūras
- Įgyvendinti blue-green diegimo strategijas

**💡 Skyriaus Rezultatas**: Diegti sudėtingas daugiaservisines programas naudojant pasirinktinius infrastruktūros šablonus

---

### 🎯 5 skyrius: Daugiapakopės AI Sistemos (Pažengusiems)
**Reikalavimai**: Baigti 1–2 skyrius  
**Trukmė**: 2–3 valandos  
**Sudėtingumas**: ⭐⭐⭐⭐

#### Ko Išmoksit
- Daugiapakopių agentų architektūros modeliai
- Agentų organizavimas ir koordinavimas  
- Paruoštos gamybai AI diegimai  

#### Mokymosi ištekliai  
- **🤖 Rekomenduojamas projektas**: [Mažmeninės prekybos kelių agentų sprendimas](examples/retail-scenario.md) - Pilnas įgyvendinimas  
- **🛠️ ARM šablonai**: [ARM šablonų paketas](../../examples/retail-multiagent-arm-template) - Diegimas vienu spustelėjimu  
- **📖 Architektūra**: [Kelių agentų koordinavimo modeliai](/docs/pre-deployment/coordination-patterns.md) - Modeliai  

#### Praktinės užduotys  
```bash
# Įdiekite visą mažmeninės prekybos daugiaprogramį sprendimą
cd examples/retail-multiagent-arm-template
./deploy.sh

# Išnagrinėkite agentų konfigūracijas
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Skyriaus rezultatas**: Įdiegti ir valdyti gamybai paruoštą kelių agentų AI sprendimą su Kliento ir Inventoriaus agentais  

---

### 🔍 6 skyrius: Išankstinis tikrinimas ir planavimas  
**Priešistorė**: Baigtas 4 skyrius  
**Trukmė**: 1 valanda  
**Sunkumas**: ⭐⭐  

#### Ko išmoksite  
- Talpos planavimas ir išteklių patikra  
- SKU pasirinkimo strategijos  
- Išankstiniai patikrinimai ir automatizavimas  

#### Mokymosi ištekliai  
- **📊 Planavimas**: [Talpos planavimas](docs/pre-deployment/capacity-planning.md) - Išteklių patikra  
- **💰 Pasirinkimas**: [SKU pasirinkimas](docs/pre-deployment/sku-selection.md) - Ekonomiški sprendimai  
- **✅ Patikra**: [Išankstiniai patikrinimai](docs/pre-deployment/preflight-checks.md) - Automatizuoti scenarijai  

#### Praktinės užduotys  
- Vykdyti talpos patikros scenarijus  
- Optimizuoti SKU pasirinkimus pagal kainą  
- Įgyvendinti automatinius išankstinius patikrinimus  

**💡 Skyriaus rezultatas**: Patikrinti ir optimizuoti diegimus prieš vykdymą  

---

### 🚨 7 skyrius: Problemų sprendimas ir klaidų taisymas  
**Priešistorė**: Baigtas bet kuris diegimo skyrius  
**Trukmė**: 1–1,5 valandos  
**Sunkumas**: ⭐⭐  

#### Ko išmoksite  
- Sistemingas klaidų taisymo metodas  
- Dažnos problemos ir sprendimai  
- AI specifinės problemos  

#### Mokymosi ištekliai  
- **🔧 Dažnos problemos**: [Dažnos problemos](docs/troubleshooting/common-issues.md) - DUK ir sprendimai  
- **🕵️ Klaidos taisymas**: [Klaidų taisymo vadovas](docs/troubleshooting/debugging.md) - Žingsnis po žingsnio strategijos  
- **🤖 AI problemos**: [AI specifinis problemų sprendimas](docs/troubleshooting/ai-troubleshooting.md) - AI paslaugų problemos  

#### Praktinės užduotys  
- Diagnostikuoti diegimo klaidas  
- Išspręsti autentifikavimo problemas  
- Taisyti AI paslaugų ryšio klaidas  

**💡 Skyriaus rezultatas**: Savarankiškai diagnozuoti ir spręsti dažnias diegimo problemas  

---

### 🏢 8 skyrius: Gamybos ir įmonių modeliai  
**Priešistorė**: Baigti 1–4 skyriai  
**Trukmė**: 2–3 valandos  
**Sunkumas**: ⭐⭐⭐⭐  

#### Ko išmoksite  
- Gamybinio diegimo strategijos  
- Įmonių saugumo modeliai  
- Stebėjimas ir kaštų optimizavimas  

#### Mokymosi ištekliai  
- **🏭 Gamyba**: [Gamybinio AI geriausios praktikos](docs/microsoft-foundry/production-ai-practices.md) - Įmonių modeliai  
- **📝 Pavyzdžiai**: [Mikropaslaugų pavyzdys](../../examples/microservices) - Sudėtinga architektūra  
- **📊 Stebėjimas**: [Application Insights integracija](docs/pre-deployment/application-insights.md) - Stebėjimas  

#### Praktinės užduotys  
- Įgyvendinti įmonių saugumo modelius  
- Sukonfigūruoti pilną stebėjimą  
- Diegti gamybai su tinkamu valdymu  

**💡 Skyriaus rezultatas**: Diegti įmonių lygio programas su pilna gamybine funkcionalumo palaikymu  

---

## 🎓 Workshop apžvalga: Praktinės mokymosi patirtys  

> **⚠️ WORKSHOP BŪKLĖ: Vykdoma plėtra**  
> Workshop medžiaga šiuo metu yra kuriama ir tobulinama. Pagrindiniai moduliai veikia, tačiau kai kurios pažengusios dalys dar neišbaigtos. Nuolat dirbame, kad visas turinys būtų baigtas. [Stebėti pažangą →](workshop/README.md)  

### Interaktyvios workshop medžiagos  
**Išsamus praktinis mokymasis su naršyklės pagrindu veikiančiais įrankiais ir nurodymais**  

 mūsų workshop medžiagos suteikia struktūruotą, interaktyvią mokymosi patirtį, papildančią aukščiau pateiktą skyrių programą. Workshop tinka tiek savarankiškam mokymuisi, tiek instruktoriaus vedamoms sesijoms.  

#### 🛠️ Workshop ypatybės  
- **Naršyklėje veikianti sąsaja**: Pilnas MkDocs pagrįstas workshop su paieška, kopijavimo ir temų funkcijomis  
- **GitHub Codespaces integracija**: Vienu spustelėjimu sukuriama vystymo aplinka  
- **Struktūruota mokymosi eiga**: 7 žingsnių nurodytos užduotys (iš viso 3,5 val.)  
- **Atradimas → Diegimas → Priderinimas**: Progresyvi metodika  
- **Interaktyvi DevContainer aplinka**: Iš anksto sukonfigūruoti įrankiai ir priklausomybės  

#### 📚 Workshop struktūra  
Workshop seka **Atradimas → Diegimas → Priderinimas** metodiką:  

1. **Atradimo etapas** (45 min.)  
   - Tyrinėti Microsoft Foundry šablonus ir paslaugas  
   - Suprasti kelių agentų architektūros modelius  
   - Peržiūrėti diegimo reikalavimus ir priešsąlygas  

2. **Diegimo etapas** (2 val.)  
   - Praktinis AI programų diegimas naudojant AZD  
   - Konfigūruoti Azure AI paslaugas ir taškus  
   - Taikyti saugumo ir autentifikavimo modelius  

3. **Priderinimo etapas** (45 min.)  
   - Modifikuoti programas konkretiems naudojimo atvejams  
   - Optimizuoti gamybiniam diegimui  
   - Įgyvendinti stebėjimą ir kaštų valdymą  

#### 🚀 Pradžia su workshop  
```bash
# Parinktis 1: GitHub Codespaces (Rekomenduojama)
# Spustelėkite "Code" → "Create codespace on main" saugykloje

# Parinktis 2: Vietinė plėtra
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Vykdykite diegimo instrukcijas workshop/README.md faile
```
  
#### 🎯 Workshop mokymosi rezultatai  
Baigę workshop dalyviai:  
- **Įdiegia gamybines AI programas**: Naudoja AZD su Microsoft Foundry paslaugomis  
- **Išmano kelių agentų architektūras**: Įgyvendina koordinuotus AI agentų sprendimus  
- **Taiko saugumo geriausias praktikas**: Konfigūruoja autentifikavimą ir prieigos kontrolę  
- **Optimizuoja mastelį**: Projektuoja ekonomiškus ir našius diegimus  
- **Sprendžia diegimo problemas**: Savarankiškai sprendžia plačias diegimo problemas  

#### 📖 Workshop ištekliai  
- **🎥 Interaktyvus vadovas**: [Workshop medžiagos](workshop/README.md) - Naršyklėje veikianti mokymosi aplinka  
- **📋 Žingsnis po žingsnio instrukcijos**: [Nurodymai](../../workshop/docs/instructions) - Detalios mokymosi instrukcijos  
- **🛠️ AI workshop laboratorija**: [AI Workshop laboratorija](docs/microsoft-foundry/ai-workshop-lab.md) - AI sutelktos užduotys  
- **💡 Greitas pradėjimas**: [Workshop diegimo vadovas](workshop/README.md#quick-start) - Aplinkos konfigūracija  

**Puiku:** Įmonių mokymams, universitetų kursams, savarankiškam mokymuisi ir programuotojų stovykloms.  

---

## 📖 Kas yra Azure Developer CLI?  

Azure Developer CLI (azd) yra kūrėjams pritaikyta komandų eilutės sąsaja, leidžianti pagreitinti programų kūrimo ir diegimo procesą Azure aplinkoje. Ji suteikia:  

- **Šablonų pagrindu diegimus** – Naudokite iš anksto paruoštus šablonus įprastoms programų struktūroms  
- **Infrastruktūra kaip kodas** – Valdykite Azure išteklius naudodami Bicep arba Terraform  
- **Integruotas darbo procesas** – Sklandžiai rezervuokite, diegkite ir stebėkite programas  
- **Kūrėjui draugiška** – Optimizuota kūrėjo produktyvumui ir patirčiai  

### **AZD + Microsoft Foundry: Idealu AI diegimams**  

**Kodėl naudoti AZD AI sprendimams?** AZD sprendžia pagrindinius AI kūrėjų iššūkius:  

- **AI paruošti šablonai** – Iš anksto sukonfigūruoti Azure OpenAI, Cognitive Services ir ML darbo krūvių šablonai  
- **Saugūs AI diegimai** – Integruotos saugumo praktikos AI paslaugoms, API raktams ir modelių taškams  
- **Gamybiniai AI modeliai** – Geriausios praktikos skalabiliai ir ekonomiškai naudingai AI programų plėtrai  
- **Pilni AI darbo procesai** – Nuo modelio kūrimo iki gamybinio diegimo su tinkamu stebėjimu  
- **Kaštų optimizavimas** – Protingas išteklių paskirstymas ir skalavimo strategijos AI darbo krūviams  
- **Microsoft Foundry integracija** – Sklandi jungtis prie Microsoft Foundry modelių katalogo ir taškų  

---

## 🎯 Šablonų ir pavyzdžių biblioteka  

### Rekomenduojama: Microsoft Foundry šablonai  
**Pradėkite čia, jei diegiate AI programas!**  

> **Pastaba:** Šie šablonai demonstruoja įvairius AI modelius. Kai kurie yra Azure Samples išoriniai pavyzdžiai, kiti – vietiniai įgyvendinimai.  

| Šablonas | Skyrius | Sunkumas | Paslaugos | Tipas |  
|----------|---------|----------|-----------|-------|  
| [**Pradėkite su AI pokalbiu**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2 skyrius | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Išorinis |  
| [**Pradėkite su AI agentais**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2 skyrius | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Išorinis |  
| [**Azure Search + OpenAI demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2 skyrius | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Išorinis |  
| [**OpenAI pokalbių programėlės greitas startas**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2 skyrius | ⭐ | AzureOpenAI + Container Apps + Application Insights | Išorinis |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5 skyrius | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Išorinis |  
| [**Contoso pokalbis RAG**](https://github.com/Azure-Samples/contoso-chat) | 8 skyrius | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Išorinis |  
| [**Mažmeninės prekybos kelių agentų sprendimas**](examples/retail-scenario.md) | 5 skyrius | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Vietinis** |  

### Rekomenduojama: Pilni mokymosi scenarijai  
**Gamybai paruošti programų šablonai, susieti su mokymosi skyriais**  

| Šablonas | Mokymosi skyrius | Sunkumas | Pagrindinis mokymasis |  
|----------|------------------|----------|-----------------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2 skyrius | ⭐ | Pagrindinės AI diegimo praktikos |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2 skyrius | ⭐⭐ | RAG įgyvendinimas su Azure AI Search |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4 skyrius | ⭐⭐ | Dokumentų intelekto integracija |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5 skyrius | ⭐⭐⭐ | Agentų karkasas ir funkcijų iškvietimas |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8 skyrius | ⭐⭐⭐ | Įmonių AI koordinavimas |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5 skyrius | ⭐⭐⭐⭐ | Kelių agentų architektūra su Kliento ir Inventoriaus agentais |  

### Mokymasis pagal pavyzdžio tipą  

> **📌 Vietiniai prieš išorinius pavyzdžius:**  
> **Vietiniai pavyzdžiai** (šioje saugykloje) = Paruošti naudoti iš karto  
> **Išoriniai pavyzdžiai** (Azure Samples) = Reikia kopijuoti iš susietų saugyklų  

#### Vietiniai pavyzdžiai (paruošti naudoti)  
- [**Mažmeninės prekybos kelių agentų sprendimas**](examples/retail-scenario.md) - Pilnas gamybai paruoštas įgyvendinimas su ARM šablonais  
  - Kelių agentų architektūra (Klientas + Inventorius)  
  - Išsamus stebėjimas ir vertinimas  
  - Vienu spustelėjimu diegimas per ARM šabloną  

#### Vietiniai pavyzdžiai - konteinerių programėlės (2–5 skyriai)  
**Išsamūs konteinerių diegimo pavyzdžiai šiame repo:**  
- [**Konteinerių programėlių pavyzdžiai**](examples/container-app/README.md) - Pilnas konteinerizuotų diegimų vadovas  
  - [Paprasta Flask API](../../examples/container-app/simple-flask-api) - Pagrindinis REST API su skalavimu iki nulio  
  - [Mikropaslaugų architektūra](../../examples/container-app/microservices) - Gamybai paruoštas kelių paslaugų diegimas  
  - Greitas startas, gamybiniai ir pažangūs diegimo modeliai  
  - Stebėjimo, saugumo ir kaštų optimizavimo gairės  

#### Išoriniai pavyzdžiai - paprastos programėlės (1–2 skyriai)  
**Kopijuokite šias Azure Samples saugyklas, kad pradėtumėte:**  
- [Paprasta internetinė programa - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pagrindiniai diegimo modeliai  
- [Statinis tinklalapis - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statinio turinio diegimas  
- [Konteinerių programa - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API diegimas  

#### Išoriniai pavyzdžiai - duomenų bazės integracija (3–4 skyriai)  
- [Duomenų bazės programa - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Duomenų bazės ryšio modeliai  
- [Funkcijos + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless duomenų darbo eiga  

#### Išoriniai pavyzdžiai - pažangūs modeliai (4–8 skyriai)  
- [Java mikropaslaugos](https://github.com/Azure-Samples/java-microservices-aca-lab) - Kelių paslaugų architektūros  
- [Konteinerių programėlių užduotys](https://github.com/Azure-Samples/container-apps-jobs) - Foninė apdorojimo sistema  
- [Įmonių ML kanalas](https://github.com/Azure-Samples/mlops-v2) - Gamybiniai ML modeliai  

### Išorinės šablonų kolekcijos  
- [**Oficiali AZD šablonų galerija**](https://azure.github.io/awesome-azd/) - Atrinkta oficialių ir bendruomenės šablonų kolekcija  
- [**Azure Developer CLI šablonai**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn šablonų dokumentacija  
- [**Pavyzdžių katalogas**](examples/README.md) - Vietiniai mokymosi pavyzdžiai su išsamiais paaiškinimais

---

## 📚 Mokymosi ištekliai ir nuorodos

### Greitos nuorodos
- [**Komandų klystkelių lapas**](resources/cheat-sheet.md) - Svarbiausios azd komandos suskirstytos pagal skyrius
- [**Žodynas**](resources/glossary.md) - Azure ir azd terminologija  
- [**DUK**](resources/faq.md) - Dažnai užduodami klausimai pagal mokymosi skyrių
- [**Studijų vadovas**](resources/study-guide.md) - Išsamios praktikos užduotys

### Praktiniai seminarai
- [**DI seminaro laboratorija**](docs/microsoft-foundry/ai-workshop-lab.md) - Padaryti jūsų DI sprendimus diegiamus naudojant AZD (2-3 valandos)
- [**Interaktyvus seminaro vadovas**](workshop/README.md) - Seminaras naršyklėje su MkDocs ir DevContainer aplinka
- [**Struktūruotas mokymosi kelias**](../../workshop/docs/instructions) - 7 žingsnių vadovaujamos užduotys (Atranka → Diegimas → Tinkdinimas)
- [**AZD pradedantiesiems seminaras**](workshop/README.md) - Visas praktinis seminaras su GitHub Codespaces integracija

### Išoriniai mokymosi ištekliai
- Azure Developer CLI dokumentacija: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure architektūros centras: https://learn.microsoft.com/en-us/azure/architecture/
- Azure kainų skaičiuoklė: https://azure.microsoft.com/pricing/calculator/
- Azure būklės puslapis: https://status.azure.com/

---

## 🔧 Greita trikčių diagnostikos apžvalga

**Dažniausios problemos, su kuriomis susiduria pradedantieji, ir greiti sprendimai:**

### ❌ „azd: komanda nerasta“

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

### ❌ „Prenumerata nerasta“ arba „Prenumerata nenustatyta“

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

### ❌ „Nepakanka kvotos“ arba „Kvota viršyta“

```bash
# Išbandykite kitą Azure regioną
azd env set AZURE_LOCATION "westus2"
azd up

# Arba naudokite mažesnius SKU kūrime
# Redaguokite infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ „azd up“ nepavyksta pusiau procese

```bash
# Parinktis 1: Išvalyti ir bandyti iš naujo
azd down --force --purge
azd up

# Parinktis 2: Tiesiog pataisyti infrastruktūrą
azd provision

# Parinktis 3: Patikrinti išsamius žurnalus
azd show
azd logs
```

### ❌ „Autentifikavimas nepavyko“ arba „Tokenas pasibaigė“

```bash
# Pakartotinai autentifikuoti
az logout
az login

azd auth logout
azd auth login

# Patvirtinti autentifikavimą
az account show
```

### ❌ „Ištekliai jau egzistuoja“ arba vardų konfliktai

```bash
# AZD generuoja unikalius pavadinimus, tačiau jei kyla konfliktas:
azd down --force --purge

# Tada bandykite dar kartą su nauja aplinka
azd env new dev-v2
azd up
```

### ❌ Šablono diegimas užtrunka per ilgai

**Įprasti laukimo laikai:**
- Paprasta internetinė programa: 5–10 minučių
- Programa su duomenų baze: 10–15 minučių
- DI programos: 15–25 minutės (OpenAI teikimas vyksta lėtai)

```bash
# Patikrinti pažangą
azd show

# Jei įstringa >30 minučių, patikrinkite Azure portalą:
azd monitor
# Ieškokite nepavykusių diegimų
```

### ❌ „Leidimas atmestas“ arba „Draudžiama“

```bash
# Patikrinkite savo Azure vaidmenį
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Jums reikia bent „Contributor“ vaidmens
# Paprašykite savo Azure administratoriaus suteikti:
# - Contributor (resursams)
# - User Access Administrator (vaidmenų priskyrimams)
```

### ❌ Nepavyksta rasti įdiegto programos URL

```bash
# Rodyti visus paslaugų galinius taškus
azd show

# Arba atidaryti Azure portalą
azd monitor

# Patikrinti konkrečią paslaugą
azd env get-values
# Ieškoti *_URL kintamųjų
```

### 📚 Visa trikčių diagnostikos informacija

- **Dažniausių problemų vadovas:** [Išsamūs sprendimai](docs/troubleshooting/common-issues.md)
- **DI specifinės problemos:** [DI trikčių diagnostika](docs/troubleshooting/ai-troubleshooting.md)
- **Derinimo vadovas:** [Žingsnis po žingsnio derinimas](docs/troubleshooting/debugging.md)
- **Pagalba:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Greita trikčių diagnostikos apžvalga

**Dažniausios problemos, su kuriomis susiduria pradedantieji, ir greiti sprendimai:**

<details>
<summary><strong>❌ „azd: komanda nerasta“</strong></summary>

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
<summary><strong>❌ „Prenumerata nerasta“ arba „Prenumerata nenustatyta“</strong></summary>

```bash
# Išvardinti galimus prenumeratas
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
<summary><strong>❌ „Nepakanka kvotos“ arba „Kvota viršyta“</strong></summary>

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
<summary><strong>❌ „azd up“ nepavyksta pusiau procese</strong></summary>

```bash
# 1 variantas: Išvalyti ir bandyti iš naujo
azd down --force --purge
azd up

# 2 variantas: Tiesiog pataisyti infrastruktūrą
azd provision

# 3 variantas: Patikrinti detalius žurnalus
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ „Autentifikavimas nepavyko“ arba „Tokenas pasibaigė“</strong></summary>

```bash
# Pakartotinai autentifikuoti
az logout
az login

azd auth logout
azd auth login

# Patikrinti autentifikaciją
az account show
```
</details>

<details>
<summary><strong>❌ „Ištekliai jau egzistuoja“ arba vardų konfliktai</strong></summary>

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
- Paprasta internetinė programa: 5–10 minučių
- Programa su duomenų baze: 10–15 minučių
- DI programos: 15–25 minutės (OpenAI teikimas vyksta lėtai)

```bash
# Patikrinti pažangą
azd show

# Jei užstringate daugiau nei 30 minučių, patikrinkite Azure portalą:
azd monitor
# Ieškokite nepavykusių diegimų
```
</details>

<details>
<summary><strong>❌ „Leidimas atmestas“ arba „Draudžiama“</strong></summary>

```bash
# Patikrinkite savo Azure vaidmenį
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Jums reikalingas bent "Vadovas" vaidmuo
# Paprašykite savo Azure administratoriaus suteikti:
# - Vadovas (resursams)
# - Naudotojo prieigos administratorius (vaidmenų priskyrimams)
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

### 📚 Visa trikčių diagnostikos informacija

- **Dažniausių problemų vadovas:** [Išsamūs sprendimai](docs/troubleshooting/common-issues.md)
- **DI specifinės problemos:** [DI trikčių diagnostika](docs/troubleshooting/ai-troubleshooting.md)
- **Derinimo vadovas:** [Žingsnis po žingsnio derinimas](docs/troubleshooting/debugging.md)
- **Pagalba:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurso užbaigimas ir sertifikavimas

### Progreso sekimas
Sekite savo mokymosi pažangą per kiekvieną skyrių:

- [ ] **1 skyrius**: Pagrindai ir greitas startas ✅
- [ ] **2 skyrius**: DI pirmasis vystymas ✅  
- [ ] **3 skyrius**: Konfigūracija ir autentifikavimas ✅
- [ ] **4 skyrius**: Infrastruktūra kaip kodas ir diegimas ✅
- [ ] **5 skyrius**: Daugiaagentės DI sistemos ✅
- [ ] **6 skyrius**: Priešdiegimo patikra ir planavimas ✅
- [ ] **7 skyrius**: Trikčių diagnostika ir derinimas ✅
- [ ] **8 skyrius**: Produkcijos ir verslo modeliai ✅

### Mokymosi patvirtinimas
Baigus kiekvieną skyrių, patikrinkite savo žinias:
1. **Praktinė užduotis**: Atlikite skyriaus praktinį diegimą
2. **Žinių patikrinimas**: Peržiūrėkite DUK savo skyriui
3. **Bendruomenės diskusija**: Pasidalinkite patirtimi Azure Discord
4. **Kitas skyrius**: Pereikite prie sekančio sudėtingumo lygio

### Kurso užbaigimo privalumai
Baigus visus skyrius, įgysite:
- **Produkcinę patirtį**: Tikrų DI programų diegimą Azure
- **Profesinius įgūdžius**: Verslo diegimui pasiruošusius gebėjimus  
- **Bendruomenės pripažinimą**: Aktyvų narystę Azure kūrėjų bendruomenėje
- **Karjeros galimybes**: Paklausią AZD ir DI diegimo patirtį

---

## 🤝 Bendruomenė ir pagalba

### Gaukite pagalbą ir palaikymą
- **Techninės problemos**: [Praneškite apie klaidas ir prašykite funkcijų](https://github.com/microsoft/azd-for-beginners/issues)
- **Mokymosi klausimai**: [Microsoft Azure Discord bendruomenė](https://discord.gg/microsoft-azure) ir [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **DI specifinė pagalba**: Prisijunkite prie [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Oficiali Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Bendruomenės įžvalgos iš Microsoft Foundry Discord

**Naujausios apklausos #Azure kanale:**
- **45 %** kūrėjų nori naudoti AZD DI užduotims
- **Pagrindiniai iššūkiai**: Daugiaservisiniai diegimai, kredencialų valdymas, produkcijos paruošimas  
- **Dažniausiai prašoma:** DI specifiniai šablonai, trikčių diagnostikos vadovai, geriausios praktikos

**Prisijunkite prie mūsų bendruomenės ir:**
- Dalinkitės savo AZD + DI patirtimi ir gaukite pagalbą
- Gaukite ankstyvas naujų DI šablonų peržiūras
- Prisidėkite prie DI diegimo gerųjų praktikų kūrimo
- Darykite įtaką būsimoms DI + AZD funkcijų plėtrai

### Prisidėjimas prie kurso
Kviečiame prisidėti! Prašome perskaityti mūsų [Prisidėjimo vadovą](CONTRIBUTING.md) apie:
- **Turinio gerinimą**: Tobulinkite esamus skyrius ir pavyzdžius
- **Nauji pavyzdžiai**: Pridėkite realias situacijas ir šablonus  
- **Vertimai**: Padėkite palaikyti daugiakalbį palaikymą
- **Klaidų ataskaitos**: Tobulinkite tikslumą ir aiškumą
- **Bendruomenės normos**: Laikykitės mūsų įtraukių bendruomenės taisyklių

---

## 📄 Kurso informacija

### Licencija
Šis projektas licencijuotas pagal MIT licenciją - išsamiai žr. [LICENSE](../../LICENSE) failą.

### Susiję Microsoft mokymosi ištekliai

Mūsų komanda kuria ir kitus išsamius mokymo kursus:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j pradedantiesiems](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js pradedantiesiems](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agentai
[![AZD pradedantiesiems](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge DI pradedantiesiems](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP pradedantiesiems](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![DI agentai pradedantiesiems](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatyvinis DI serija
[![Generatyvinis DI pradedantiesiems](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatyvinis DI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatyvinis DI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatyvinis DI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Pagrindinis mokymasis
[![ML pradedantiesiems](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Duomenų mokslas pradedantiesiems](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI pradedantiesiems](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kibernetinis saugumas pradedantiesiems](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Tinklalapių kūrimas pradedantiesiems](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pradedantiesiems](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR vystymas pradedantiesiems](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot serija
[![Copilot dirbant kartu su AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot nuotykis](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurso navigacija

**🚀 Pasiruošę pradėti mokytis?**

**Pradedantieji**: Pradėkite nuo [1 skyrius: Pagrindai ir greitas startas](../..)  
**AI kūrėjai**: Skubėkite į [2 skyrių: AI-pirmiausia vystymas](../..)  
**Patyrę kūrėjai**: Pradėkite nuo [3 skyrius: Konfigūracijos ir autentifikacijos](../..)

**Tolimesni žingsniai**: [Pradėti 1 skyrių - AZD pagrindai](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Pirminis dokumentas jo gimtąja kalba turi būti laikomas oficialiu šaltiniu. Esant svarbiai informacijai, rekomenduojama naudotis profesionalia žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už bet kokius nesusipratimus ar neteisingus aiškinimus, atsiradusius naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->