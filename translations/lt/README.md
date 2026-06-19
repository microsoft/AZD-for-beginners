# AZD Pradedantiesiems: Struktūrizuota mokymosi kelionė

![AZD-pradedantiesiems](../../translated_images/lt/azdbeginners.5527441dd9f74068.webp) 

[![GitHub stebėtojai](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forkai](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub žvaigždės](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiniai vertimai (visada atnaujinami)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](./README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Verčiau klonuoti lokaliai?**
>
> This repository includes 50+ language translations which significantly increases the download size. To clone without translations, use sparse checkout:
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

> 📌 This course is validated against **`azd 1.25.6`** (June 2026). Run `azd version` to check your build, and `azd upgrade` to get the latest.

Azure Developer CLI išaugo už tradicinių žiniatinklio programų ir API ribų. Šiandien azd yra vienintelis įrankis, skirtas diegti **bet kokią** programą į Azure — įskaitant AI pagrįstas programas ir intelektualius agentus.

Ką tai reiškia jums:

- **AI agentai dabar yra pirmos klasės azd darbai.** Galite inicijuoti, diegti ir valdyti AI agentų projektus naudojant tą patį `azd init` → `azd up` darbo eigą, kurią jau pažįstate.
- **Pilnas agento gyvavimo ciklas iš CLI.** `azure.ai.agents` plėtinys dabar apima visą kelionę — `azd ai agent init` karkasui sukurti, `azd ai agent invoke` testavimui (su atsakymo laiko išvestimi), `azd ai agent eval generate` ir `azd ai agent optimize` kokybei matuoti ir gerinti, bei `azd ai agent delete` išvalymui.
- **Daugiau AI statybinių blokų.** Naujieji peržiūros plėtiniai — `azure.ai.skills` ir `azure.ai.connections` — leidžia valdyti pakartotinai naudojamas agentų įgūdžių rinkinius ir Foundry jungtis tiesiogiai per azd.
- **Microsoft Foundry integracija** suteikia modelių diegimą, agentų talpinimą ir AI paslaugų konfigūravimą tiesiogiai azd šablonų ekosistemoje.
- **Sklandesnės kasdienės funkcijos.** Naujesni leidimai padarė `azd init` idempotentiniu (saugus kartoti), `azd auth login` automatiškai valyti pasenusius žetonus, ir pridėjo draugišką `azd tool` pirmo paleidimo sąrankos raginimą.
- **Pagrindinė darbo eiga nepasikeitė.** Nesvarbu, ar diegiate užduočių sąrašų (todo) programą, mikropaslaugą, ar daugialypį AI agentų sprendimą — komandos yra tos pačios.

> **Pastaba Aspire naudotojams:** Microsoft dabar produktą tiesiog vadina **Aspire** (anksčiau ".NET Aspire"). azd Aspire palaikymas nepasikeitė — tik atnaujintas pavadinimas.

Jei anksčiau naudojote azd, AI palaikymas yra natūrali plėtra — ne atskiras įrankis ar pažangus kursas. Jei pradedate nuo nulio, išmoksite vieną darbo eigą, kuri tinka viskam.

---

## 🚀 Kas yra Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** yra kūrėjui draugiškas komandų eilutės įrankis, kuris palengvina programų diegimą į Azure. Vietoje daugybės Azure išteklių rankinio kūrimo ir sujungimo, galite diegti visą programą vienu komanda.

### `azd up` magija

```bash
# Ši viena komanda atlieka viską:
# ✅ Sukuria visus Azure išteklius
# ✅ Konfigūruoja tinklus ir saugumą
# ✅ Kuria jūsų programos kodą
# ✅ Diegia į Azure
# ✅ Suteikia veikiančią URL nuorodą
azd up
```

**Viskas!** Jokio kliksėjimo Azure portale, jokių sudėtingų ARM šablonų, kuriuos reikia išmokti pirmiausia, jokių rankinių konfigūracijų — tik veikianti programa Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Kuo jie skiriasi?

Tai dažniausias klausimas, kurį užduoda pradedantieji. Štai paprastas atsakymas:

| Funkcija | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Paskirtis** | Valdyti atskirus Azure išteklius | Diegti pilnas programas |
| **Požiūris** | Infrastruktūros orientuotas | Programų orientuotas |
| **Pavyzdys** | `az webapp create --name myapp...` | `azd up` |
| **Mokymosi kreivė** | Reikia pažinti Azure paslaugas | Pakanka pažinti savo programą |
| **Tinka** | DevOps, infrastruktūra | Kūrėjams, prototipavimui |

### Paprastas palyginimas

- **Azure CLI** yra lyg turėti visus įrankius namui pastatyti — plaktukai, pjūklai, vinys. Galite pastatyti bet ką, bet reikia žinoti statybą.
- **Azure Developer CLI** yra lyg samdyti rangovą — apibūdinate, ko norite, o jis rūpinasi statyba.

### Kada naudoti kurį

| Scenarijus | Naudokite šį |
|----------|----------|
| "Noriu greitai išdiegti savo žiniatinklio programą" | `azd up` |
| "Man reikia sukurti tik saugyklos paskyrą" | `az storage account create` |
| "Kuriu pilną AI programą" | `azd init --template azure-search-openai-demo` |
| "Man reikia derinti konkretų Azure išteklių" | `az resource show` |
| "Noriu gamybai paruošto diegimo per kelias minutes" | `azd up --environment production` |

### Jie veikia kartu!

AZD naudoja Azure CLI viduje. Galite naudoti abu:
```bash
# Diegkite savo programą su AZD
azd up

# Tada tiksliai sureguliuokite konkrečius išteklius naudodami Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Raskite šablonus Awesome AZD

Nesikurkite nuo nulio! **Awesome AZD** yra bendruomenės rinkinys pasiruošusių diegti šablonų:

| Išteklius | Aprašymas |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Naršykite 200+ šablonų su vieno paspaudimo diegimu |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Prisidėkite savo šablonu bendruomenei |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Pažymėkite žvaigždute ir peržiūrėkite šaltinį |

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

Prieš pradėdami, įsitikinkite, kad jūsų kompiuteris pasiruošęs šablonui, kurį norite išdiegti:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jei bet kuris reikalavimas nepraeina patikros, pataisykite tai pirmiausia, tada tęskite greitą pradžią.

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
# Pasirinktinai, jei planuojate tiesiogiai naudoti Azure CLI komandas šiame kurse
az login

# Būtina AZD darbo eigoms
azd auth login
```

Jei nesate tikri, kurio jums reikia, vykdykite pilną sąrankos eigą skiltyje [Diegimas ir nustatymas](docs/chapter-01-foundation/installation.md#authentication-setup).

### 3 žingsnis: Išdiekite pirmąją programą

```bash
# Inicializuoti iš šablono
azd init --template todo-nodejs-mongo

# Diegti į Azure (sukuria viską!)
azd up
```

**🎉 Viskas!** Jūsų programa dabar veikia Azure.

### Išvalymas (nepamirkite!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kaip naudotis šiuo kursu

Šis kursas sukurtas **progresyvumui mokytis** - pradėkite ten, kur jaučiatės patogiai, ir ženkite aukštyn:

| Jūsų patirtis | Pradėkite čia |
|-----------------|------------|
| **Visai nauji Azure** | [1 skyrius: Pagrindai](#-chapter-1-foundation--quick-start) |
| **Pažįstate Azure, nauji azd** | [1 skyrius: Pagrindai](#-chapter-1-foundation--quick-start) |
| **Nori diegti AI programas** | [2 skyrius: AI-pirmasis vystymas (rekomenduojama AI kūrėjams)](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Nori praktikos** | [🎓 Interaktyvus seminaras](workshop/README.md) - 3–4 val. vedamas laboratorinis darbas |
| **Reikia gamybinių modelių** | [8 skyrius: Gamyba ir įmonės modeliai](#-chapter-8-production--enterprise-patterns) |

### Greita sąranka

1. **Šakinkite šią saugyklą**: [![GitHub forkai](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonuoti:** `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Gaukite pagalbą:** [Azure Discord bendruomenė](https://discord.com/invite/ByRwuEEgH4)

> **Verčiau klonuoti lokaliai?**

> This repository includes 50+ language translations which significantly increases the download size. To clone without translations, use sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Tai suteikia viską, ko reikia kurso užbaigimui, su daug greitesniu atsisiuntimu.


## Kurso apžvalga

Įvaldykite Azure Developer CLI (azd) per struktūrizuotus skyrius, skirtus palaipsniui mokytis. **Ypatingas dėmesys AI programų diegimui su Microsoft Foundry integracija.**
### Kodėl šis kursas yra būtinas šiuolaikiniams kūrėjams

Remiantis Microsoft Foundry Discord bendruomenės įžvalgomis, **45% kūrėjų nori naudoti AZD AI darbo krūviams**, tačiau susiduria su iššūkiais:
- Sudėtingos kelių paslaugų AI architektūros
- Geriausios praktikos AI diegimui gamyboje  
- Azure AI paslaugų integracija ir konfigūracija
- AI darbo krūvių kaštų optimizavimas
- AI diegimo problemų trikčių šalinimas

### Mokymosi tikslai

Baigę šį struktūrizuotą kursą, jūs:
- **Įvaldyti AZD pagrindus**: Pagrindinės sąvokos, diegimas ir konfigūracija
- **Diegti AI programas**: Naudoti AZD su Microsoft Foundry paslaugomis
- **Įgyvendinti infrastruktūrą kaip kodą**: Tvarkyti Azure išteklius su Bicep šablonais
- **Trikčių šalinimas diegimuose**: Spręsti dažnas problemas ir jas derinti
- **Optimizuoti gamybai**: Saugumas, skalavimas, stebėjimas ir kaštų valdymas
- **Kurti kelių agentų sprendimus**: Diegti sudėtingas AI architektūras

## Prieš pradėdami: paskyros, prieiga ir prielaidos

Prieš pradėdami 1 skyrių, įsitikinkite, kad turite šiuos dalykus. Vėlesnės šio vadovo diegimo instrukcijos daro prielaidą, kad šie pagrindai jau sutvarkyti.

- **Azure prenumerata**: Galite naudoti esamą prenumeratą iš darbo ar savo paskyros, arba susikurti a [nemokamą bandomąją versiją](https://aka.ms/azurefreetrial) kad pradėtumėte.
- **Leidimas kurti Azure išteklius**: Daugelyje užduočių turėtumėte turėti bent **Contributor** teises tikslinėje prenumeratoje arba išteklių grupėje. Kai kurie skyriai taip pat gali manyti, kad galite kurti išteklių grupes, valdomas tapatybes ir RBAC priskyrimus.
- [**GitHub paskyra**](https://github.com): Tai naudinga repozitorijos forkinimui, savo pakeitimų sekimui ir GitHub Codespaces naudojimui dirbtuvėse.
- **Šablonų vykdymo prielaidos**: Kai kuriems šablonams reikalingi vietiniai įrankiai tokie kaip Node.js, Python, Java ar Docker. Prieš pradedant paleiskite sąrankos tikrintuvą, kad anksti aptiktumėte trūkstamus įrankius.
- **Pagrindinis terminalo pažinimas**: Nereikia būti ekspertu, bet turėtumėte patogiai naudoti komandas, pvz., `git clone`, `azd auth login`, ir `azd up`.

> **Dirbate įmonės prenumeratoje?**
> Jei jūsų Azure aplinka yra valdoma administratorius, iš anksto patikrinkite, ar galite diegti išteklius prenumeratoje arba išteklių grupėje, kurią planuojate naudoti. Jei ne, paprašykite smėlio dėžės prenumeratos arba Contributor prieigos prieš pradėdami.

> **Naujas Azure?**
> Pradėkite su savo Azure bandomąja versija arba pay-as-you-go prenumerata adresu https://aka.ms/azurefreetrial, kad galėtumėte užbaigti užduotis nuo pradžios iki galo nelaukdami nuomininko lygio patvirtinimų.

## 🗺️ Kurso žemėlapis: greita navigacija pagal skyrių

Kiekvienas skyrius turi atskirą README su mokymosi tikslais, greitais startais ir užduotimis:

| Skyrius | Tema | Pamokos | Trukmė | Sudėtingumas |
|---------|-------|---------|----------|------------|
| **[Skyrius 1: Pagrindai](docs/chapter-01-foundation/README.md)** | Pradžia | [AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) &#124; [Diegimas ir sąranka](docs/chapter-01-foundation/installation.md) &#124; [Pirmasis projektas](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Skyrius 2: AI kūrimas](docs/chapter-02-ai-development/README.md)** | AI orientuotos programos | [Microsoft Foundry integracija](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agentai](docs/chapter-02-ai-development/agents.md) &#124; [Modelių diegimas](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Dirbtuvės](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Skyrius 3: Konfigūracija](docs/chapter-03-configuration/README.md)** | Autentifikacija ir saugumas | [Konfigūracijos vadovas](docs/chapter-03-configuration/configuration.md) &#124; [Autentifikacijos modeliai ir valdomos tapatybės](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Skyrius 4: Infrastruktūra](docs/chapter-04-infrastructure/README.md)** | IaC ir diegimas | [Diegimo vadovas](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Išteklių tiekimas](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Skyrius 5: Kelių agentų](docs/chapter-05-multi-agent/README.md)** | AI agentų sprendimai | [Mažmeninės prekybos scenarijus](examples/retail-scenario.md) &#124; [Koordinavimo šablonai](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Skyrius 6: Prieš diegimą](docs/chapter-06-pre-deployment/README.md)** | Planavimas ir patvirtinimas | [Prieš paleidimo patikrinimai](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Talpos planavimas](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU parinkimas](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Skyrius 7: Trikčių šalinimas](docs/chapter-07-troubleshooting/README.md)** | Derinimas ir taisymas | [Dažnos problemos](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Derinimas](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problemos](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Skyrius 8: Gamyba](docs/chapter-08-production/README.md)** | Įmonių modeliai | [Gamybinės praktikos](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Dirbtuvės](workshop/README.md)** | Praktinė laboratorija | [Įvadas](workshop/docs/instructions/0-Introduction.md) &#124; [Šablono pasirinkimas](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Patvirtinimas](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Išardymas](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigūravimas](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Pritaikymas](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Infrastruktūros išardymas](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Apibendrinimas](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Bendra kurso trukmė:** ~10-14 val. | **Įgūdžių progresija:** Nuo pradedančiojo iki gamybai pasirengusio

---

## 📚 Mokymosi skyreliai

*Pasirinkite mokymosi kelią pagal patirties lygį ir tikslus*

### 🚀 Skyrius 1: Pagrindai ir greitas startas
**Reikalavimai**: Azure prenumerata, pagrindinės komandinės eilutės žinios  
**Trukmė**: 30-45 minučių  
**Sudėtingumas**: ⭐

#### Ką išmoksite
- Suprasti Azure Developer CLI pagrindus
- Įdiegti AZD jūsų platformoje
- Jūsų pirmasis sėkmingas diegimas

#### Mokymosi ištekliai
- **🎯 Pradėkite čia**: [Kas yra Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorija**: [AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) - Pagrindinės sąvokos ir terminija
- **⚙️ Diegimas ir sąranka**: [Diegimas ir sąranka](docs/chapter-01-foundation/installation.md) - Platformai skirtos instrukcijos
- **🛠️ Praktika**: [Pirmasis projektas](docs/chapter-01-foundation/first-project.md) - Žingsnis po žingsnio pamoka
- **📋 Greita nuoroda**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Praktinės užduotys
```bash
# Greitas įdiegimo patikrinimas
azd version

# Įdiekite savo pirmąją programą
azd init --template todo-nodejs-mongo
azd up
```

**💡 Skyrių rezultatas**: Sėkmingai įdiegti paprastą žiniatinklio programą į Azure naudojant AZD

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

**📊 Laiko investicija:** 30-45 minučių  
**📈 Gebėjimų lygis po:** Gali savarankiškai diegti pagrindines programas
**📈 Gebėjimų lygis po:** Gali savarankiškai diegti pagrindines programas

---

### 🤖 Skyrius 2: AI-pirmumo kūrimas (Rekomenduojama AI kūrėjams)
**Reikalavimai**: Baigtas 1 skyrius  
**Trukmė**: 1-2 val.  
**Sudėtingumas**: ⭐⭐

#### Ką išmoksite
- Microsoft Foundry integracija su AZD
- AI varomų programų diegimas
- AI paslaugų konfigūracijų supratimas

#### Mokymosi ištekliai
- **🎯 Pradėkite čia**: [Microsoft Foundry integracija](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agentai**: [AI agentų vadovas](docs/chapter-02-ai-development/agents.md) - Diegti intelektualius agentus su AZD
- **📖 Šablonai**: [Modelių diegimas](docs/chapter-02-ai-development/ai-model-deployment.md) - Diegti ir valdyti AI modelius
- **🛠️ Dirbtuvės**: [AI dirbtuvių laboratorija](docs/chapter-02-ai-development/ai-workshop-lab.md) - Paruoškite savo AI sprendimus AZD
- **🎥 Interaktyvus vadovas**: [Dirbtuvių medžiaga](workshop/README.md) - Naršyklėje pagrįstas mokymasis su MkDocs * DevContainer aplinka
- **📋 Šablonai**: [Microsoft Foundry šablonai](#dirbtuvių-ištekliai)
- **📝 Pavyzdžiai**: [AZD diegimo pavyzdžiai](examples/README.md)

#### Praktinės užduotys
```bash
# Įdiekite savo pirmąją dirbtinio intelekto programą
azd init --template azure-search-openai-demo
azd up

# Išbandykite papildomus dirbtinio intelekto šablonus
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Skyrių rezultatas**: Įdiegti ir sukonfigūruoti AI varomą pokalbių programą su RAG galimybėmis

**✅ Sėkmės patvirtinimas:**
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

**📊 Laiko investicija:** 1-2 val.  
**📈 Gebėjimų lygis po:** Gali diegti ir konfigūruoti gamybai paruoštas AI programas  
**💰 Kaštų suvokimas:** Suprasti $80-150/mėn kūrimo kaštus, $300-3500/mėn gamybos kaštus

#### 💰 Kaštų aspektai AI diegimams

**Kūrimo aplinka (apytiksliai $80-150/mėn):**
- Microsoft Foundry modeliai (Pay-as-you-go): $0-50/mėn (priklausomai nuo tokenų naudojimo)
- AI Search (Basic lygis): $75/mėn
- Container Apps (Consumption): $0-20/mėn
- Saugykla (Standard): $1-5/mėn

**Gamybinė aplinka (apytiksliai $300-3,500+/mėn):**
- Microsoft Foundry modeliai (PTU for consistent performance): $3,000+/mėn OR Pay-as-go with high volume
- AI Search (Standard lygis): $250/mėn
- Container Apps (Dedicated): $50-100/mėn
- Application Insights: $5-50/mėn
- Saugykla (Premium): $10-50/mėn

**💡 Kaštų optimizavimo patarimai:**
- Naudokite **nemokamą lygį (Free Tier)** Microsoft Foundry modeliams mokymuisi (Azure OpenAI 50,000 tokenų/mėn įskaičiuota)
- Paleiskite `azd down`, kad atlaisvintumėte išteklius, kai aktyviai nekuriate
- Pradėkite nuo vartojimu grindžiamo apmokestinimo, PTU įjungkite tik gamybai
- Naudokite `azd provision --preview`, kad įvertintumėte kaštus prieš diegimą
- Įjunkite automatinį skalavimą: mokėkite tik už faktinį naudojimą

**Kaštų stebėjimas:**
```bash
# Patikrinkite numatomas mėnesines išlaidas
azd provision --preview

# Stebėkite faktines išlaidas Azure portale
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Skyrius 3: Konfigūracija ir autentifikacija
**Reikalavimai**: Baigtas 1 skyrius  
**Trukmė**: 45-60 minučių  
**Sudėtingumas**: ⭐⭐

#### Ką išmoksite
- Aplinkos konfigūracija ir valdymas
- Autentifikacijos ir saugumo geriausios praktikos
- Išteklių pavadinimų ir organizavimo principai

#### Mokymosi ištekliai
- **📖 Konfigūracija**: [Konfigūracijos vadovas](docs/chapter-03-configuration/configuration.md) - Aplinkos nustatymas
- **🔐 Saugumas**: [Autentifikacijos modeliai ir valdomos tapatybės](docs/chapter-03-configuration/authsecurity.md) - Autentifikacijos modeliai
- **📝 Pavyzdžiai**: [Duomenų bazės programos pavyzdys](examples/database-app/README.md) - AZD duomenų bazės pavyzdžiai

#### Praktinės užduotys
- Konfigūruokite kelias aplinkas (dev, staging, prod)
- Nustatykite valdomos tapatybės autentifikaciją
- Įgyvendinkite aplinkai būdingas konfigūracijas

**💡 Skyrių rezultatas**: Tvarkyti kelias aplinkas su tinkama autentifikacija ir saugumu

---

### 🏗️ Skyrius 4: Infrastruktūra kaip kodas ir diegimas
**Reikalavimai**: Užbaigti 1–3 skyrius  
**Trukmė**: 1–1.5 val.  
**Sudėtingumas**: ⭐⭐⭐

#### Ką išmoksite
- Pažangūs diegimo šablonai
- Infrastruktūra kaip kodas naudojant Bicep
- Išteklių tiekimo strategijos

#### Mokymosi ištekliai
- **📖 Diegimas**: [Diegimo vadovas](docs/chapter-04-infrastructure/deployment-guide.md) - Pilni darbo procesai
- **🏗️ Tiekimas**: [Išteklių tiekimas](docs/chapter-04-infrastructure/provisioning.md) - Azure išteklių valdymas
- **📝 Pavyzdžiai**: [Container App pavyzdys](../../examples/container-app) - Diegimai konteineriuose

#### Praktinės užduotys
- Kurkite pasirinktinius Bicep šablonus
- Diegti kelių paslaugų programas
- Įgyvendinti blue-green diegimo strategijas

**💡 Skyrių rezultatas**: Diegti sudėtingas kelių paslaugų programas naudojant pasirinktinius infrastruktūros šablonus
### 🎯 Skyrius 5: Daugiagentiniai AI sprendimai (Išplėstinė)
**Išankstiniai reikalavimai**: Baigti 1-2 skyrius  
**Trukmė**: 2-3 valandos  
**Sudėtingumas**: ⭐⭐⭐⭐

#### Ką sužinosite
- Daugiagentinės architektūros šablonai
- Agentų orkestracija ir koordinavimas
- Gamybai paruošti AI diegimai

#### Mokymosi ištekliai
- **🤖 Rekomenduojamas projektas**: [Mažmeninės prekybos daugiagentinis sprendimas](examples/retail-scenario.md) - Pilnas įgyvendinimas
- **🛠️ ARM šablonai**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Diegimas vienu spustelėjimu
- **📖 Architektūra**: [Daugiagentės koordinavimo šablonai](docs/chapter-06-pre-deployment/coordination-patterns.md) - Šablonai

#### Praktinės užduotys
```bash
# Įdiegti visą mažmeninės prekybos daugiaagentį sprendimą
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tyrinėti agentų konfigūracijas
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Skyriaus rezultatas**: Diegti ir valdyti gamybai paruoštą daugiagentinį AI sprendimą su Kliento ir Inventoriaus agentais

---

### 🔍 Skyrius 6: Išankstinis diegimo tikrinimas ir planavimas
**Išankstiniai reikalavimai**: Baigtas 4 skyrius  
**Trukmė**: 1 valanda  
**Sudėtingumas**: ⭐⭐

#### Ką sužinosite
- Talpos planavimas ir išteklių patikra
- SKU pasirinkimo strategijos
- Išankstiniai patikrinimai ir automatizacija

#### Mokymosi ištekliai
- **📊 Planavimas**: [Talpos planavimas](docs/chapter-06-pre-deployment/capacity-planning.md) - Išteklių patikra
- **💰 Pasirinkimas**: [SKU pasirinkimas](docs/chapter-06-pre-deployment/sku-selection.md) - Kaina efektyvūs pasirinkimai
- **✅ Patikra**: [Išankstiniai patikrinimai](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizuoti skriptai

#### Praktinės užduotys
- Paleiskite talpos patikros skriptus
- Optimizuokite SKU pasirinkimus siekiant sumažinti išlaidas
- Įgyvendinkite automatizuotus išankstinius diegimo patikrinimus

**💡 Skyriaus rezultatas**: Patikrinkite ir optimizuokite diegimus prieš vykdymą

---

### 🚨 Skyrius 7: Trikčių šalinimas ir derinimas
**Išankstiniai reikalavimai**: Baigtas bet kuris diegimo skyrius  
**Trukmė**: 1-1.5 valandos  
**Sudėtingumas**: ⭐⭐

#### Ką sužinosite
- Sisteminiai trikčių šalinimo metodai
- Dažnos problemos ir sprendimai
- DI specifinis trikčių šalinimas

#### Mokymosi ištekliai
- **🔧 Dažnos problemos**: [Dažnos problemos](docs/chapter-07-troubleshooting/common-issues.md) - DUK ir sprendimai
- **🕵️ Derinimas**: [Derinimo vadovas](docs/chapter-07-troubleshooting/debugging.md) - Žingsnis po žingsnio strategijos
- **🤖 DI problemos**: [Dirbtinio intelekto trikčių šalinimas](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - DI paslaugų problemos

#### Praktinės užduotys
- Diagnozuokite diegimo klaidas
- Išspręskite autentifikavimo problemas
- Derinkite DI paslaugų ryšį

**💡 Skyriaus rezultatas**: Savarankiškai diagnozuoti ir išspręsti dažnas diegimo problemas

---

### 🏢 Skyrius 8: Gamybiniai ir įmonių modeliai
**Išankstiniai reikalavimai**: Baigti 1-4 skyrius  
**Trukmė**: 2-3 valandos  
**Sudėtingumas**: ⭐⭐⭐⭐

#### Ką sužinosite
- Gamybinės diegimo strategijos
- Įmonių saugumo modeliai
- Stebėsena ir išlaidų optimizavimas

#### Mokymosi ištekliai
- **🏭 Gamyba**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Įmonių modeliai
- **📝 Pavyzdžiai**: [Microservices Example](../../examples/microservices) - Sudėtingos architektūros
- **📊 Stebėsena**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Stebėsena

#### Praktinės užduotys
- Įgyvendinkite įmonių saugumo modelius
- Sukonfigūruokite išsamią stebėseną
- Diegti į gamybą laikantis tinkamos valdymo praktikos

**💡 Skyriaus rezultatas**: Diegti įmonėms paruoštas programas su pilnomis gamybos galimybėmis

---

## 🎓 Dirbtuvių apžvalga: praktinė mokymosi patirtis

> **⚠️ DIRBTUVIŲ BŪKLĖ: Vykdomas kūrimas**  
> Dirbtuvių medžiaga šiuo metu yra rengta ir tobulinama. Pagrindiniai moduliai veikia, tačiau kai kurios pažangios dalys yra neužbaigtos. Mes aktyviai dirbame, kad užbaigtume visą turinį. [Stebėti pažangą →](workshop/README.md)

### Interaktyvios dirbtuvių medžiagos
**Išsamus praktinis mokymasis su naršyklėje veikiančiais įrankiais ir vedamomis užduotimis**

Mūsų dirbtuvių medžiaga suteikia struktūrizuotą, interaktyvią mokymosi patirtį, kuri papildo aukščiau pateiktą skyrių kursą. Dirbtuvės skirtos tiek savarankiškam mokymuisi, tiek lektoriaus vedamiems užsiėmimams.

#### 🛠️ Dirbtuvių ypatybės
- **Naršyklinė sąsaja**: Pilnos funkcijos MkDocs pagrindu sukurtos dirbtuvės su paieška, kopijavimo ir temų funkcijomis
- **Integracija su GitHub Codespaces**: Vieno paspaudimo vystymo aplinkos diegimas
- **Struktūruotas mokymosi kelias**: 8 modulių vedamos užduotys (3-4 val. iš viso)
- **Progresinė metodika**: Įvadas → Pasirinkimas → Patikra → Dekonstrukcija → Konfigūracija → Pritaikymas → Išardymas → Apibendrinimas
- **Interaktyvi DevContainer aplinka**: Iš anksto sukonfigūruoti įrankiai ir priklausomybės

#### 📚 Dirbtuvių modulio struktūra
Dirbtuvės laikosi **8 modulių progresinės metodikos**, kuri nukelia jus nuo atradimo iki diegimo meistriškumo:

| Modulis | Tema | Ką darysite | Trukmė |
|--------|-------|----------------|----------|
| **0. Įvadas** | Dirbtuvių apžvalga | Suprasti mokymosi tikslus, išankstinius reikalavimus ir dirbtuvių struktūrą | 15 min |
| **1. Pasirinkimas** | Šablonų atradimas | Išnagrinėkite AZD šablonus ir pasirinkite tinkamą AI šabloną jūsų scenarijui | 20 min |
| **2. Patikra** | Diegimas ir patvirtinimas | Įdiekite šabloną su `azd up` ir patikrinkite, kad infrastruktūra veikia | 30 min |
| **3. Dekonstrukcija** | Suprasti struktūrą | Naudokite GitHub Copilot, kad ištirtumėte šablono architektūrą, Bicep failus ir kodo organizavimą | 30 min |
| **4. Konfigūracija** | Detalus azure.yaml nagrinėjimas | Išmokite azure.yaml konfigūraciją, gyvenimo ciklo įvykius ir aplinkos kintamuosius | 30 min |
| **5. Pritaikymas** | Pritaikykite pagal poreikį | Įgalinkite AI Search, stebėjimą, vertinimą ir pritaikykite savo scenarijui | 45 min |
| **6. Išardymas** | Išvalymas | Saugiai pašalinkite išteklius naudodami `azd down --purge` | 15 min |
| **7. Apibendrinimas** | Tolimesni žingsniai | Peržvelkite pasiekimus, pagrindines sąvokas ir tęskite savo mokymosi kelią | 15 min |

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
# Parinktis 1: GitHub Codespaces (Rekomenduojama)
# Spustelėkite "Code" → "Create codespace on main" saugykloje

# Parinktis 2: Vietinis vystymas
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Vykdykite nustatymo instrukcijas faile workshop/README.md
```

#### 🎯 Dirbtuvių mokymosi rezultatai
Baigę dirbtuves dalyviai sugebės:
- **Diegti gamybines AI programas**: Naudoti AZD su Microsoft Foundry paslaugomis
- **Išmanyti daugiagentines architektūras**: Įgyvendinti koordinuotus AI agentų sprendimus
- **Įgyvendinti saugumo gerąsias praktikas**: Konfigūruoti autentifikaciją ir prieigos kontrolę
- **Optimizuoti mastelį**: Kurti ekonomiškus ir našius diegimus
- **Trikčių šalinimas diegimuose**: Savarankiškai išspręsti dažniausiai pasitaikančias problemas

#### 📖 Dirbtuvių ištekliai
- **🎥 Interaktyvus vadovas**: [Dirbtuvių medžiaga](workshop/README.md) - Naršyklėje veikianti mokymosi aplinka
- **📋 Instrukcijos po modulius**:
  - [0. Įvadas](workshop/docs/instructions/0-Introduction.md) - Dirbtuvių apžvalga ir tikslai
  - [1. Pasirinkimas](workshop/docs/instructions/1-Select-AI-Template.md) - Raskite ir pasirinkite AI šablonus
  - [2. Patikra](workshop/docs/instructions/2-Validate-AI-Template.md) - Diegti ir patikrinti šablonus
  - [3. Dekonstrukcija](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Tyrinėkite šablono architektūrą
  - [4. Konfigūracija](workshop/docs/instructions/4-Configure-AI-Template.md) - Išmokite valdyti azure.yaml
  - [5. Pritaikymas](workshop/docs/instructions/5-Customize-AI-Template.md) - Pritaikykite savo scenarijui
  - [6. Išardymas](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Išvalykite išteklius
  - [7. Apibendrinimas](workshop/docs/instructions/7-Wrap-up.md) - Peržiūra ir tolimesni žingsniai
- **🛠️ DI dirbtuvių laboratorija**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Užduotys, orientuotos į AI
- **💡 Greitas startas**: [Workshop Setup Guide](workshop/README.md#quick-start) - Aplinkos konfigūracija

Puikiai tinka: Įmonių mokymams, universitetų kursams, savarankiškam mokymuisi ir programuotojų stovykloms.

---

## 📖 Gilus apžvalga: AZD galimybės

Be pagrindų, AZD suteikia galingas funkcijas gamybiniams diegimams:

- **Diegimai pagal šablonus** - Naudokite iš anksto parengtus šablonus įprastiems programų modeliams
- **Infrastruktūra kaip kodas** - Valdykite Azure išteklius naudodami Bicep arba Terraform  
- **Integruoti darbo procesai** - Sklandžiai paruoškite, diekite ir stebėkite programas
- **Draugiška kūrėjams** - Optimizuota kūrėjų produktyvumui ir patirčiai

### **AZD + Microsoft Foundry: Idealu AI diegimams**

**Kodėl AZD AI sprendimams?** AZD sprendžia pagrindines problemas, su kuriomis susiduria AI kūrėjai:

- **AI paruošti šablonai** - Iš anksto sukonfigūruoti šablonai Microsoft Foundry modeliams, Azure AI paslaugoms ir mašininio mokymosi krūviams
- **Saugūs AI diegimai** - Integruoti saugumo modeliai AI paslaugoms, API raktams ir modelio galiniams taškams  
- **Gamybiniai AI modeliai** - Geriausios praktikos skalėms pritaikantiems, ekonomiškiems AI programų diegimams
- **End-to-End AI darbo procesai** - Nuo modelio kūrimo iki diegimo į gamybą su tinkama stebėsena
- **Išlaidų optimizavimas** - Išmanus išteklių paskirstymas ir mastelio keitimo strategijos AI krūviams
- **Integracija su Microsoft Foundry** - Sklandi jungtis prie Microsoft Foundry modelių katalogo ir galinių taškų

---

## 🎯 Šablonų ir pavyzdžių biblioteka

### Rekomenduojama: Microsoft Foundry šablonai
**Pradėkite čia, jei diegiate AI programas!**

> **Pastaba:** Šie šablonai demonstruoja įvairius AI modelius. Kai kurie yra išoriniai Azure pavyzdžiai, kiti — vietinės implementacijos.

| Šablonas | Skyrius | Sudėtingumas | Paslaugos | Tipas |
|----------|---------|------------|----------|------|
| [**Pradėkite su AI pokalbiu**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2 skyrius | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Išorinis |
| [**Pradėkite su AI agentais**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2 skyrius | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Išorinis |
| [**Azure Search + OpenAI demonstracija**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2 skyrius | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Išorinis |
| [**OpenAI pokalbių programos greitas startas**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2 skyrius | ⭐ | AzureOpenAI + Container Apps + Application Insights | Išorinis |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5 skyrius | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Išorinis |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 8 skyrius | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Išorinis |
| [**Mažmeninės prekybos daugiagentinis sprendimas**](examples/retail-scenario.md) | 5 skyrius | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Vietinis** |

### Rekomenduojama: Pilni mokymosi scenarijai
**Gamybai paruošti programų šablonai, susieti su mokymosi skyriais**

| Šablonas | Mokymosi skyrius | Sudėtingumas | Pagrindinės žinios |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2 skyrius | ⭐ | Pagrindiniai AI diegimo modeliai |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2 skyrius | ⭐⭐ | RAG įgyvendinimas naudojant Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4 skyrius | ⭐⭐ | Dokumentų intelekto integracija |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5 skyrius | ⭐⭐⭐ | Agentų sistema ir funkcijų kvietimas |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8 skyrius | ⭐⭐⭐ | Įmonių lygio AI orkestracija |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5 skyrius | ⭐⭐⭐⭐ | Daugiagentinė architektūra su Kliento ir Inventoriaus agentais |

### Mokymasis per pavyzdžius pagal tipą

> **📌 Vietiniai vs. Išoriniai pavyzdžiai:**  
> **Vietiniai pavyzdžiai** (šiame repozitoriume) = Paruošti naudoti iš karto  
> **Išoriniai pavyzdžiai** (Azure Samples) = Klonuokite iš susietų saugyklų

#### Vietiniai pavyzdžiai (paruošti naudoti)
- [**Mažmeninės prekybos daugiagentinis sprendimas**](examples/retail-scenario.md) - Pilnas gamybai paruoštas įgyvendinimas su ARM šablonais
  - Daugiagentinė architektūra (Kliento + Inventoriaus agentai)
  - Išsami stebėsena ir vertinimas
  - Vieno paspaudimo diegimas per ARM šabloną

#### Vietiniai pavyzdžiai - konteinerinės programos (2-5 skyriai)
**Išsamūs konteinerių diegimo pavyzdžiai šiame repozitoriume:**
- [**Konteinerių programų pavyzdžiai**](examples/container-app/README.md) - Išsamus vadovas konteinerizuotiems diegimams
  - [Paprastas Flask API](../../examples/container-app/simple-flask-api) - Pagrindinis REST API su mastelio sumažinimu iki nulio
  - [Mikropaslaugų architektūra](../../examples/container-app/microservices) - Gamybai paruoštas kelių paslaugų diegimas
  - Greitas pradėjimas, gamybiniai ir pažangūs diegimo modeliai
  - Stebėsena, saugumas ir išlaidų optimizavimo gairės

#### Išoriniai pavyzdžiai - Paprastos programos (1-2 skyriai)
**Klonuokite šias Azure Samples saugyklas, kad pradėtumėte:**
- [Paprasta žiniatinklio programa - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pagrindiniai diegimo modeliai
- [Statinis tinklalapis - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statinio turinio diegimas
- [Konteinerių programa - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API diegimas

#### Išoriniai pavyzdžiai - Duomenų bazės integracija (3-4 skyrius)  
- [Duomenų bazės programa - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Duomenų bazės prisijungimo modeliai
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Be serverio duomenų darbo eiga

#### Išoriniai pavyzdžiai - Pažangūs modeliai (4-8 skyriai)
- [Java mikropaslaugos](https://github.com/Azure-Samples/java-microservices-aca-lab) - Kelių paslaugų architektūros
- [Container Apps užduotys](https://github.com/Azure-Samples/container-apps-jobs) - Fono apdorojimas  
- [Įmonės ML procesų grandinė](https://github.com/Azure-Samples/mlops-v2) - Gamybai paruošti ML modeliai

### Išorinės šablonų kolekcijos
- [**Oficiali AZD šablonų galerija**](https://azure.github.io/awesome-azd/) - Atrinkta oficialių ir bendruomenės šablonų kolekcija
- [**Azure Developer CLI šablonai**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn šablonų dokumentacija
- [**Pavyzdžių katalogas**](examples/README.md) - Vietiniai mokomieji pavyzdžiai su išsamiais paaiškinimais

---

## 📚 Mokymosi ištekliai ir nuorodos

### Greitos nuorodos
- [**Komandų atmintinė**](resources/cheat-sheet.md) - Pagrindinės azd komandos, suskirstytos pagal skyrius
- [**Žodynėlis**](resources/glossary.md) - Azure ir azd terminija  
- [**DUK**](resources/faq.md) - Dažnai užduodami klausimai, suskirstyti pagal mokymosi skyrių
- [**Mokymosi vadovas**](resources/study-guide.md) - Visapusiškos praktikos užduotys

### Praktinės dirbtuvės
- [**AI praktikos laboratorija**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Padarykite savo AI sprendimus diegiamus su AZD (2-3 val.)
- [**Interaktyvios dirbtuvės**](workshop/README.md) - 8 modulių vedami pratimai su MkDocs ir GitHub Codespaces
  - Vyksta: Įvadas → Parinkimas → Patvirtinimas → Dekonstrukcija → Konfigūravimas → Pritaikymas → Išjungimas → Apibendrinimas

### Išoriniai mokymosi ištekliai
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure kainų skaičiuoklė](https://azure.microsoft.com/pricing/calculator/)
- [Azure statusas](https://status.azure.com/)

### AI agentų įgūdžiai jūsų redaktoriui
- [**Microsoft Azure įgūdžiai on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 atviri agentų įgūdžiai Azure AI, Foundry, diegimui, diagnostikai, išlaidų optimizavimui ir kt. Įdiekite juos į GitHub Copilot, Cursor, Claude Code arba bet kurį palaikomą agentą:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Greitas trikčių šalinimo vadovas

**Dažnos problemos, su kuriomis susiduria pradedantieji, ir greiti sprendimai:**

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

# Patikrinkite diegimą
azd version
```
</details>

<details>
<summary><strong>❌ "Prenumerata nerasta" arba "Prenumerata nenustatyta"</strong></summary>

```bash
# Išvardinti galimas prenumeratas
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
<summary><strong>❌ "InsufficientQuota" arba "Kvota viršyta"</strong></summary>

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
<summary><strong>❌ "azd up" nepavyksta proceso viduryje</strong></summary>

```bash
# Parinktis 1: Išvalyti ir bandyti iš naujo
azd down --force --purge
azd up

# Parinktis 2: Tiesiog sutvarkyti infrastruktūrą
azd provision

# Parinktis 3: Patikrinti išsamią būseną
azd show

# Parinktis 4: Patikrinti žurnalus Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentifikacija nepavyko" arba "Žetonas pasibaigė"</strong></summary>

```bash
# Pakartotinai autentifikuokitės AZD
azd auth logout
azd auth login

# Pasirinktinai: atnaujinkite ir Azure CLI, jei naudojate az komandas
az logout
az login

# Patikrinkite autentifikavimą
az account show
```
</details>

<details>
<summary><strong>❌ "Išteklius jau egzistuoja" arba pavadinimų konfliktas</strong></summary>

```bash
# AZD generuoja unikalius pavadinimus, tačiau jei konfliktas:
azd down --force --purge

# Tada pakartokite bandymą naujoje aplinkoje
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ "Šablono diegimas užtrunka per ilgai"</strong></summary>

**Įprasti laukimo laikai:**
- Paprasta žiniatinklio programa: 5-10 minutes
- Programa su duomenų baze: 10-15 minutes
- AI programos: 15-25 minutes (OpenAI teikimas yra lėtas)

```bash
# Patikrinkite pažangą
azd show

# Jei užstrigote ilgiau nei 30 minučių, patikrinkite Azure portalą:
azd monitor --overview
# Ieškokite nesėkmingų diegimų
```
</details>

<details>
<summary><strong>❌ "Prieiga atmesta" arba "Uždrausta"</strong></summary>

```bash
# Patikrinkite savo Azure vaidmenį
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Jums reikia bent „Contributor“ vaidmens
# Paprašykite savo Azure administratoriaus suteikti:
# - Contributor (resursams)
# - User Access Administrator (vaidmenų priskyrimams)
```
</details>

<details>
<summary><strong>❌ Negalite rasti išdiegto programos URL</strong></summary>

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

### 📚 Išsamūs trikčių šalinimo ištekliai

- **Dažnų problemų vadovas:** [Išsamūs sprendimai](docs/chapter-07-troubleshooting/common-issues.md)
- **AI specifinės problemos:** [AI trikčių šalinimas](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Derinimo vadovas:** [Žingsnis po žingsnio derinimas](docs/chapter-07-troubleshooting/debugging.md)
- **Gaukite pagalbą:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurso baigimas ir sertifikacija

### Pažangos sekimas
Sekite savo mokymosi pažangą per kiekvieną skyrių:

- [ ] **Skyrius 1**: Pagrindai ir greitas pradėjimas ✅
- [ ] **Skyrius 2**: AI orientuotas kūrimas ✅  
- [ ] **Skyrius 3**: Konfigūravimas ir autentifikavimas ✅
- [ ] **Skyrius 4**: Infrastruktūra kaip kodas ir diegimas ✅
- [ ] **Skyrius 5**: Daugiagentės AI sistemos ✅
- [ ] **Skyrius 6**: Išankstinė diegimo patikra ir planavimas ✅
- [ ] **Skyrius 7**: Trikčių šalinimas ir derinimas ✅
- [ ] **Skyrius 8**: Gamybiniai ir įmonių modeliai ✅

### Mokymosi patvirtinimas
Baigę kiekvieną skyrių, patvirtinkite savo žinias atlikdami:
1. **Praktinė užduotis**: Atlikite skyriaus praktinį diegimą
2. **Žinių patikra**: Peržiūrėkite DUK atitinkamam skyriui
3. **Bendruomenės diskusija**: Pasidalinkite savo patirtimi Azure Discord
4. **Kitas skyrius**: Pereikite prie kito sudėtingumo lygio

### Kurso baigimo privalumai
Baigę visus skyrius, turėsite:
- **Patirtis gamyboje**: Išdiegėte realias AI programas Azure
- **Profesionalūs įgūdžiai**: Gamybai paruoštos diegimo galimybės  
- **Bendruomenės pripažinimas**: Aktyvus Azure kūrėjų bendruomenės narys
- **Karjeros pažanga**: Paklausios AZD ir AI diegimo žinios

---

## 🤝 Bendruomenė ir palaikymas

### Gaukite pagalbą ir palaikymą
- **Techninės problemos**: [Praneškite apie klaidas ir prašykite funkcijų](https://github.com/microsoft/azd-for-beginners/issues)
- **Mokymosi klausimai**: [Microsoft Azure Discord bendruomenė](https://discord.gg/microsoft-azure) ir [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI specifinė pagalba**: Prisijunkite prie [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Oficiali Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Bendruomenės įžvalgos iš Microsoft Foundry Discord

**Naujausių apklausų rezultatai iš #Azure kanalo:**
- **45%** kūrėjų nori naudoti AZD AI apkrovoms
- **Pagrindiniai iššūkiai**: kelių paslaugų diegimai, kredencialų valdymas, paruošimas gamybai  
- **Dažniausiai prašoma**: AI specifiniai šablonai, trikčių šalinimo vadovai, geriausios praktikos

**Prisijunkite prie mūsų bendruomenės, kad:**
- Dalytumėtės savo AZD + AI patirtimi ir gautumėte pagalbos
- Gautumėte prieigą prie ankstyvų naujų AI šablonų peržiūrų
- Prisidėtumėte prie AI diegimo geriausių praktikų
- Paveiktumėte būsimą AI + AZD funkcijų vystymą

### Prisidėjimas prie kurso
Kviečiame prisidėti! Skaitykite mūsų [Prisidėjimo vadovą](CONTRIBUTING.md) dėl detalesnės informacijos apie:
- **Turinio patobulinimai**: Pagerinkite esamus skyrius ir pavyzdžius
- **Nauji pavyzdžiai**: Pridėkite realaus pasaulio scenarijus ir šablonus  
- **Vertimas**: Padėkite palaikyti kelių kalbų palaikymą
- **Klaidų ataskaitos**: Pagerinkite tikslumą ir aiškumą
- **Bendruomenės standartai**: Laikykitės mūsų įtraukių bendruomenės gairių

---

## 📄 Kurso informacija

### Licencija
Šis projektas licencijuotas pagal MIT licenciją - žr. [LICENSE](../../LICENSE) failą dėl detalesnės informacijos.

### Susiję Microsoft mokymosi ištekliai

Mūsų komanda rengia kitus išsamius mokymo kursus:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j pradedantiesiems](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js pradedantiesiems](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain pradedantiesiems](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD pradedantiesiems](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI pradedantiesiems](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP pradedantiesiems](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI agentai pradedantiesiems](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatyvinis AI serija
[![Generatyvinis AI pradedantiesiems](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatyvinis AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatyvinis AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatyvinė AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Pagrindai
[![Mašininis mokymasis pradedantiesiems](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Duomenų mokslas pradedantiesiems](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Dirbtinis intelektas pradedantiesiems](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kibernetinis saugumas pradedantiesiems](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Tinklapių kūrimas pradedantiesiems](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![Daiktų internetas pradedantiesiems](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR kūrimas pradedantiesiems](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot serija
[![Copilot AI poriniam programavimui](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot skirtas C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot nuotykiai](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurso navigacija

**🚀 Pasiruošę pradėti mokytis?**

**Pradedantieji**: Pradėkite nuo [1 skyrius: Pagrindai ir greitas startas](#-chapter-1-foundation--quick-start)  
**AI kūrėjai**: Eikite į [2 skyrius: AI-pirmasis kūrimas](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Patyrę kūrėjai**: Pradėkite nuo [3 skyrius: Konfigūracija ir autentifikacija](#️-chapter-3-configuration--authentication)

**Kiti žingsniai**: [Pradėti 1 skyrių - AZD pagrindai](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->