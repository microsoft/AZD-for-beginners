# AZD Algajatele: Struktureeritud Õppeteekond

![AZD-for-beginners](../../translated_images/et/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automaatübersetzused (Alati Uuendatud)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](./README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Manipuri (Meitei Mayek)](../mni/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Eelistad lokaalselt kloonimist?**
>
> See repositoorium sisaldab 50+ keele tõlget, mis suurendab allalaadimise mahtu märkimisväärselt. Tõlgeteta kloonimiseks kasuta sparse checkout’i:
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
> See annab sulle kõik vajaliku kursuse läbimiseks palju kiirema allalaadimisega.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Mis on täna azd'st uut

> 📌 See kursus on valideeritud vastu **`azd 1.27.1`** (juuli 2026). Kontrolli oma buildi käsuga `azd version` ja saa uuem versioon käsuga `azd upgrade`.

Azure Developer CLI on kasvanud traditsiooniliste veebirakenduste ja API'de kõrvale. Täna on azd ainus tööriist **ükskõik millise** rakenduse Azure'i juurutamiseks — sealhulgas AI-põhised rakendused ja intelligentsed agendid.

See tähendab sulle järgmist:

- **AI agendid on nüüd azd täieõiguslikud töökoormused.** Sa saad alustada, juurutada ja hallata AI agentide projekte kasutades sama `azd init` → `azd up` töövoogu, mida juba tead.
- **Täielik agendi elutsükkel käsurealt.** Laiend `azure.ai.agents` hõlmab nüüd kogu protsessi—`azd ai agent init` skaffoldimiseks, `azd ai agent invoke` testimiseks (vastuse aja väljundiga), `azd ai agent eval generate` ja `azd ai agent optimize` kvaliteedi mõõtmiseks ja parandamiseks ning `azd ai agent delete` koristamiseks.
- **Rohkem AI ehituskive.** Uued eelvaatele suunatud laiendused—`azure.ai.skills` ja `azure.ai.connections`—võimaldavad hallata taaskasutatavaid agendi oskusi ja Foundry ühendusi otse azd-ga.
- **Microsoft Foundry integratsioon** toob mudelite juurutamise, agendi majutamise ja AI teenuste konfiguratsiooni otse azd mallide ökosüsteemi.
- **Sujuvam igapäevane tavapärasus.** Viimased versioonid muutsid `azd init` idempotentseks (ohutuks uuesti käivitamiseks), puhastasid automaatselt aegunud tokenid `azd auth login` kaudu ning lisasid sõbraliku `azd tool` esmakordse seadistuse viiba.
- **Põhi töövoog pole muutunud.** Olenemata kas kasutad todo rakendust, mikroteenust või mitmeagendilist AI lahendust, käsud on samad.

> **Märkus Aspire kasutajatele:** Microsoft nimetab toodet nüüd lihtsalt **Aspire** (varem ".NET Aspire"). azd Aspire tugi jääb muutumatuks—muutust on vaid nime osas.

Kui oled varem azd kasutanud, on AI tugi loomulik laiendus—mitte eraldi tööriist ega edasijõudnud rada. Kui alustad nullist, õpid ühe töövoo, mis sobib kõigeks.

---

## 🚀 Mis on Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** on arendajasõbralik käsurea tööriist, mis teeb rakenduste juurutamise Azure'i lihtsaks. Selle asemel, et käsitsi luua ja ühendada kümneid Azure ressursse, saad ühe käsuga juurutada kogu rakenduse.

### `azd up` võlu

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

**See ongi kõik!** Puudub Azure portaali klikkimine, keerulisi ARM malle pole tarvis omandada, käsitsi seadistamine puudub—ainult toimivad rakendused Azure'is.

---

## ❓ Azure Developer CLI vs Azure CLI: Mis vahe on?

Kõige tavalisem küsimus algajate seas. Siin on lihtne vastus:

| Funktsioon | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Eesmärk** | Üksikute Azure ressursside haldamine | Täielike rakenduste juurutamine |
| **Mõtteviis** | Taristu-kesksus | Rakendus-kesksus |
| **Näide** | `az webapp create --name myapp...` | `azd up` |
| **Õppimiskõver** | Tuleb teada Azure teenuseid | Piisab oma rakendusest teadmisest |
| **Parim kasutus** | DevOps, taristu | Arendajad, prototüüpimine |

### Lihtne võrdlus

- **Azure CLI** on nagu kõik tööriistad maja ehitamiseks - haamrid, saed, naelad. Saad kõike ehitada, kuid pead konstruktsioonist aru saama.
- **Azure Developer CLI** on nagu alltöövõtja palkamine - sa kirjeldad soovitud tulemuse ja nemad ehitavad selle.

### Millal kumbagi kasutada

| Stsenaarium | Kasuta seda |
|----------|----------|
| "Soovin kiiresti oma veebirakendust juurutada" | `azd up` |
| "Vajan vaid ühte salvestuskontot" | `az storage account create` |
| "Arendan täielikku AI rakendust" | `azd init --template azure-search-openai-demo` |
| "Vajan konkreetse Azure ressursi silumist" | `az resource show` |
| "Soovin tootmiskõlblikku juurutust minutitega" | `azd up --environment production` |

### Nad töötavad koos!

AZD kasutab Azure CLI-d tuumas. Võid kasutada mõlemat:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Leia mallitest Awesome AZD-st

Ära alusta nullist! **Awesome AZD** on kogukonna kogumik valmismallidest, mida saab ühe klikiga juurutada:

| Ressurss | Kirjeldus |
|----------|-------------|
| 🔗 [**Awesome AZD galerii**](https://azure.github.io/awesome-azd/) | Sirvi 200+ malli ja juuruta ühe klikiga |
| 🔗 [**Esita mall**](https://github.com/Azure/awesome-azd/issues) | Panusta oma mall kogukonda |
| 🔗 [**GitHub hoidla**](https://github.com/Azure/awesome-azd) | Staari ja avasta lähtekoodi |

### Populaarsed AI mallid Awesome AZD-st

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Alustamine 3 sammuga

Enne alustamist veendu, et sinu masin on valmis juurutama seda malli:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Kui mõni nõue ei ole täidetud, paranda see esmalt ja jätka siis kiirega.

### Samm 1: Paigalda AZD (2 minutit)

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

### Samm 2: Autentimine AZD jaoks

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Kui pole kindel, kumba vajad, järgi kogu seadistuse juhendit [Paigaldamine & Seadistus](docs/chapter-01-foundation/installation.md#authentication-setup).

### Samm 3: Juuruta oma esimene rakendus

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Valmis!** Sinu rakendus töötab nüüd Azure'is.

### Puhastamine (ära unusta!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kuidas kasutada seda kursust

See kursus on mõeldud **järkjärguliseks õppeks** - alusta seal, kus end mugavalt tunned, ja liigu edasi:

| Sinu kogemus | Alusta siit |
|-----------------|------------|
| **Täiesti uus Azure'is** | [1. peatükk: Alused](#-chapter-1-foundation--quick-start) |
| **Tunned Azure'i, aga uus AZD-s** | [1. peatükk: Alused](#-chapter-1-foundation--quick-start) |
| **Soovid AI rakendusi juurutada** | [2. peatükk: AI esmane arendus](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Soovid praktilist kogemust** | [🎓 Interaktiivne töötuba](workshop/README.md) - 3-4 tundi juhendatud labor |
| **Vajalik tootmismustrid** | [8. peatükk: Tootmine & Ettevõte](#-chapter-8-production--enterprise-patterns) |

### Kiire seadistamine

1. **Forki see hoidla**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klooni see**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Küsi abi**: [Azure Discordi kogukond](https://discord.com/invite/ByRwuEEgH4)

> **Eelistad lokaalselt kloonimist?**

> See hoidla sisaldab 50+ keele tõlget, mis suurendab oluliselt allalaadimismahu. Tõlgete ilma kloonimiseks kasuta sparse checkout'i:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> See annab sulle kõik vajaliku kursuse läbimiseks palju kiirema allalaadimisega.


## Kursuse ülevaade

Masterda Azure Developer CLI (azd) struktureeritud peatükkide kaudu, mis on loodud järkjärguliseks õppimiseks. **Eri rõhk AI rakenduste juurutamisel Microsoft Foundry integratsiooniga.**

### Miks see kursus on tänapäeva arendajatele oluline

Microsoft Foundry Discord kogukonna teadmiste põhjal soovib **45% arendajatest kasutada AZD-d AI töökoormuste jaoks**, kuid seisab silmitsi raskustega:
- Komplekssed mitme teenusega AI arhitektuurid
- Tootmisvalmis AI juurutamise parimad tavad
- Azure AI teenuste integreerimine ja seadistamine
- AI töökoormuste kulude optimeerimine
- AI-spetsiifiliste juurutamisprobleemide lahendamine

### Õppe eesmärgid

Selle struktureeritud kursuse lõpetamisel:
- **Valdad AZD aluseid**: Põhimõisted, paigaldus ja konfiguratsioon
- **Juurutad AI rakendusi**: Kasutades AZD-d koos Microsoft Foundry teenustega
- **Rakenda infrastruktuur kui kood**: Halda Azure ressursse Bicep mallide abil
- **Lahenda juurutamise tõrkeid**: Lahenda levinud probleeme ja veaotsing
- **Optimeeri tootmiseks**: Turvalisus, skaleerimine, jälgimine ja kulude juhtimine
- **Loo mitmeagendilisi lahendusi**: Juuruta keerukaid tehisintellekti arhitektuure

## Enne alustamist: kontod, ligipääs ja eeldused

Enne peatüki 1 alustamist veendu, et sul on järgnevad tingimused täidetud. Selle juhendi hilisemad installatsiooni sammud eeldavad, et need põhiedu on juba olemas.

- **Azure tellimus**: Sa võid kasutada olemasolevat töö või oma konto tellimust või luua [tasuta prooviperioodi](https://aka.ms/azurefreetrial), et alustada.
- **Õigused Azure ressursside loomiseks**: Enamiku harjutuste jaoks peaks sul olema vähemalt **Kaastöötaja** juurdepääs sihttellimusele või ressurdirühmale. Mõned peatükid võivad eeldada ka ressurdirühmade, hallatud identiteetide ja RBAC määramiste loomist.
- [**GitHubi konto**](https://github.com): See on kasulik hoidla forkimiseks, oma muudatuste jälgimiseks ja GitHub Codespaces kasutamiseks töötoas.
- **Mallide jooksutuse eeldused**: Mõned mallid vajavad kohalikke tööriistu nagu Node.js, Python, Java või Docker. Käivita seadistuse valideerija enne alustamist, et leida puuduvad tööriistad varakult.
- **Põhiline terminali tundmine**: Sa ei pea olema ekspert, kuid peaksid olema mugav käske nagu `git clone`, `azd auth login` ja `azd up` jooksutama.

> **Töö ettevõtte tellimuses?**
> Kui sinu Azure keskkonda haldab administraator, kinnita ette, et saad juurutada ressursse selles tellimuses või ressurdirühmas, mida plaanid kasutada. Kui ei, siis palu enne alustamist liivakasti tellimus või Kaastöötaja õigused.

> **Oled uus Azure's?**
> Alusta oma tasuta prooviperioodi või tasulise tellimusega aadressil https://aka.ms/azurefreetrial, et saaksid harjutused lõpuni teha ilma ootamata üürniku tasandi kinnitusi.

## 🗺️ Kursuse kaart: kiire navigeerimine peatükkide järgi

Igal peatükil on eraldi README koos õpieesmärkide, kiire alguse ja harjutustega:

| Peatükk | Teema | Õppetunnid | Kestus | keerukus |
|---------|-------|---------|----------|------------|
| **[1. peatükk: alus](docs/chapter-01-foundation/README.md)** | Alustamine | [AZD põhialused](docs/chapter-01-foundation/azd-basics.md) &#124; [Installeerimine](docs/chapter-01-foundation/installation.md) &#124; [Esimene projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[2. peatükk: tehisintellekti arendus](docs/chapter-02-ai-development/README.md)** | AI-esimesed rakendused | [Foundry integratsioon](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agendid](docs/chapter-02-ai-development/agents.md) &#124; [Mudeli juurutamine](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Töötuba](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 tundi | ⭐⭐ |
| **[3. peatükk: konfiguratsioon](docs/chapter-03-configuration/README.md)** | Autentimine & turvalisus | [Konfiguratsioon](docs/chapter-03-configuration/configuration.md) &#124; [Autentimine & turvalisus](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[4. peatükk: infrastruktuur](docs/chapter-04-infrastructure/README.md)** | IaC & juurutamine | [Juurutamise juhend](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 tundi | ⭐⭐⭐ |
| **[5. peatükk: mitmeagendilised lahendused](docs/chapter-05-multi-agent/README.md)** | AI agentide lahendused | [Jaemüügi stsenaarium](examples/retail-scenario.md) &#124; [Koordineerimise mustrid](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 tundi | ⭐⭐⭐⭐ |
| **[6. peatükk: eeljuurutuse kontroll](docs/chapter-06-pre-deployment/README.md)** | Planeerimine & valideerimine | [Preflight kontrollid](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Mahukavandamine](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU valik](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 tund | ⭐⭐ |
| **[7. peatükk: tõrkeotsing](docs/chapter-07-troubleshooting/README.md)** | Veaotsing & parandamine | [Tavalised probleemid](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Veaotsing](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI probleemid](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 tundi | ⭐⭐ |
| **[8. peatükk: tootmine](docs/chapter-08-production/README.md)** | Ettevõtte mustrid | [Tootmise praktikad](docs/chapter-08-production/production-ai-practices.md) | 2-3 tundi | ⭐⭐⭐⭐ |
| **[🎓 Töötuba](workshop/README.md)** | Praktiline labor | [Sissejuhatus](workshop/docs/instructions/0-Introduction.md) &#124; [Valik](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Valideerimine](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Lammutamine](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguratsioon](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Kohandamine](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Võtmed kätte](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Kokkuvõte](workshop/docs/instructions/7-Wrap-up.md) | 3-4 tundi | ⭐⭐ |

**Kogu kursuse kestus:** ~10-14 tundi | **Oskuste tase:** Algaja → Tootmiseks valmis

---

## 📚 Õppepeatükid

*Vali oma õpitee kogemuse ja eesmärkide põhjal*

### 🚀 Peatükk 1: Alused & kiire alustamine
**Eeldused**: Azure tellimus, põhilised käsurea teadmised  
**Kestus**: 30-45 minutit  
**Keerukus**: ⭐

#### Mida õpid
- Azure Developer CLI põhitõdede mõistmine
- AZD installeerimine oma platvormil
- Oma esimene edukas juurutus

#### Õppematerjalid
- **🎯 Alusta siit**: [Mis on Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teooria**: [AZD põhialused](docs/chapter-01-foundation/azd-basics.md) - Tuumkontseptsioonid ja terminoloogia
- **⚙️ Seadistus**: [Installeerimine & seadistamine](docs/chapter-01-foundation/installation.md) - Platvormispetsiifilised juhised
- **🛠️ Praktiline töö**: [Sinu esimene projekt](docs/chapter-01-foundation/first-project.md) - Samm-sammult juhend
- **📋 Kiire viide**: [Käsu kiirkäepärane juhend](resources/cheat-sheet.md)

#### Praktilised harjutused
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Peatüki tulemus**: Juuruta edukalt lihtne veebirakendus Azure'i kasutades AZD-d

**✅ Tulemuslikkuse kinnitamine:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Ajainvesteering:** 30-45 minutit  
**📈 Oskuste tase pärast:** Võimalik iseseisvalt põhirakendusi juurutada
**📈 Oskuste tase pärast:** Võimalik iseseisvalt põhirakendusi juurutada

---

### 🤖 Peatükk 2: AI-esimene arendus (Soovitatav AI arendajatele)
**Eeldused**: Peatükk 1 lõpetatud  
**Kestus**: 1-2 tundi  
**Keerukus**: ⭐⭐

#### Mida õpid
- Microsoft Foundry integratsioon AZD-ga
- AI-toega rakenduste juurutamine
- AI teenuste konfiguratsioonide mõistmine

#### Õppematerjalid
- **🎯 Alusta siit**: [Microsoft Foundry integratsioon](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agendid**: [AI agentide juhend](docs/chapter-02-ai-development/agents.md) - Juuruta targad agendid AZD abil
- **📖 Mustrid**: [AI mudeli juurutamine](docs/chapter-02-ai-development/ai-model-deployment.md) - Juuruta ja halda AI-mudeleid
- **🛠️ Töötuba**: [AI töötuba labor](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee oma AI lahendused AZD jaoks valmis
- **🎥 Interaktiivne juhend**: [Töötubade materjalid](workshop/README.md) - Brauseripõhine õpe MkDocs * DevContainer keskkonnas
- **📋 Mallid**: [Microsoft Foundry mallid](#featured-microsoft-foundry-templates)
- **📝 Näited**: [AZD juurutamise näited](examples/README.md)

#### Praktilised harjutused
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Peatüki tulemus**: Juuruta ja konfiguratsiooni AI-toega vestlusrakendus RAG võimekusega

**✅ Tulemuslikkuse kinnitamine:**
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

**📊 Ajainvesteering:** 1-2 tundi  
**📈 Oskuste tase pärast:** Võimalik juurutada ja konfigureerida tootmiseks valmis AI rakendusi  
**💰 Kulu teadlikkus:** Mõista $80-150/kuus arendus- ja $300-3500/kuus tootmiskulusid

#### 💰 AI juurutamise kulutegurid

**Arenduskeskkond (Hinnanguline $80-150/kuus):**
- Microsoft Foundry mudelid (kasuta-pay-as-you-go): $0-50/kuus (sõltub tokeni kasutusest)
- AI otsing (põhind), $75/kuus
- Container Apps (tarbimine): $0-20/kuus
- Salvestus (standard): $1-5/kuus

**Tootmiskeskkond (Hinnanguline $300-3,500+/kuus):**
- Microsoft Foundry mudelid (PTU järjepideva jõudluse jaoks): $3,000+/kuus VÕI tasu kui kasutad suure mahuga
- AI otsing (standard), $250/kuus
- Container Apps (pühendatud), $50-100/kuus
- Application Insights, $5-50/kuus
- Salvestus (premium), $10-50/kuus

**💡 Kulu optimeerimise näpunäited:**
- Kasuta **Tasuta taseme** Microsoft Foundry mudeleid õppimiseks (Azure OpenAI 50 000 tokenit kuus kaasa arvatud)
- Käivita `azd down` ressursside vabastamiseks, kui ei arenda aktiivselt
- Alusta tarbimisarveldusega, üle minna PTU-le ainult tootmises
- Kasuta `azd provision --preview` kulude hindamiseks enne juurutamist
- Luba automaatne skaleerimine: maksa ainult tegeliku kasutuse eest

**Kulu jälgimine:**
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Peatükk 3: Konfiguratsioon & autentimine
**Eeldused**: Peatükk 1 lõpetatud  
**Kestus**: 45-60 minutit  
**Keerukus**: ⭐⭐

#### Mida õpid
- Keskkonna konfiguratsioon ja haldus
- Autentimise ja turvalisuse parimad tavad
- Ressursside nimetamine ja organiseerimine

#### Õppematerjalid
- **📖 Konfiguratsioon**: [Konfiguratsiooni juhend](docs/chapter-03-configuration/configuration.md) - Keskkonna seadistamine
- **🔐 Turvalisus**: [Autentimise mustrid ja hallatud identiteet](docs/chapter-03-configuration/authsecurity.md) - Autentimise mustrid
- **📝 Näited**: [Andmebaasi rakenduse näide](examples/database-app/README.md) - AZD andmebaasi näited

#### Praktilised harjutused
- Konfigureeri mitut keskkonda (arendus, test, tootmine)
- Seadista hallatud identiteediga autentimine
- Rakenda keskkonnapõhised konfiguratsioonid

**💡 Peatüki tulemus**: Halda mitut keskkonda nõuetekohase autentimise ja turvalisusega

---

### 🏗️ Peatükk 4: Infrastruktuur kui kood & juurutamine
**Eeldused**: Peatükid 1-3 lõpetatud  
**Kestus**: 1-1.5 tundi  
**Keerukus**: ⭐⭐⭐

#### Mida õpid
- Täiustatud juurutamismustrid
- Infrastruktuur kui kood Bicepiga
- Ressursside varustamise strateegiad

#### Õppematerjalid
- **📖 Juurutamine**: [Juurutamise juhend](docs/chapter-04-infrastructure/deployment-guide.md) - Täielikud töövood
- **🏗️ Varustamine**: [Ressursside provisionimine](docs/chapter-04-infrastructure/provisioning.md) - Azure ressursside haldus
- **📝 Näited**: [Container App näide](../../examples/container-app) - Konteineripõhised juurutused

#### Praktilised harjutused
- Loo kohandatud Bicep mallid
- Juuruta mitme teenuse rakendused
- Rakenda sinistrohelist juurutamisstrateegiat

**💡 Peatüki tulemus**: Juuruta keerukad mitme teenusega rakendused kasutades kohandatud infrastruktuuri malle

---

### 🎯 Peatükk 5: Mitmeagendilised AI lahendused (edasijõudnutele)
**Eeldused**: Peatükid 1-2 lõpetatud  
**Kestus**: 2-3 tundi  
**Keerukus**: ⭐⭐⭐⭐

#### Mida õpid
- Mitmeagendi arhitektuuri mustrid
- Agentide orkestreerimine ja koordineerimine
- Tootmiseks valmis AI juurutused

#### Õppematerjalid
- **🤖 Esiletõstetud projekt**: [Jaemüügi mitmeagendi lahendus](examples/retail-scenario.md) - Täielik implementeerimine
- **🛠️ ARM mallid**: [ARM malli pakett](../../examples/retail-multiagent-arm-template) - Ühe klõpsuga juurutus
- **📖 Arhitektuur**: [Mitmeagendi koordineerimise mustrid](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mustrid

#### Praktilised harjutused
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Peatüki tulemus**: Juuruta ja halda tootmiseks valmis mitmeagendilist AI lahendust kliendi- ja inventari agentidega

---

### 🔍 Peatükk 6: Eeljuurutuse valideerimine & planeerimine
**Eeldused**: Peatükk 4 lõpetatud  
**Kestus**: 1 tund  
**Keerukus**: ⭐⭐

#### Mida õpid
- Mahukavandamine ja ressursside valideerimine
- SKU valiku strateegiad
- Eelkontrollid ja automatiseerimine

#### Õppematerjalid
- **📊 Planeerimine**: [Võimsuse planeerimine](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressursside valideerimine
- **💰 Valik**: [SKU valik](docs/chapter-06-pre-deployment/sku-selection.md) - Kuluefektiivsed valikud
- **✅ Valideerimine**: [Eelkontrollid](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiseeritud skriptid

#### Praktilised harjutused
- Käivita võimsuse valideerimise skriptid
- Optimeeri SKU-de valikut kulude jaoks
- Rakenda automatiseeritud eelpaigalduskontrolle

**💡 Peatüki tulemus**: Valideeri ja optimeeri paigaldused enne teostamist

---

### 🚨 Peatükk 7: Tõrkeotsing ja silumine
**Eeltingimused**: Mõni paigalduspeatükk on lõpetatud  
**Kestus**: 1-1,5 tundi  
**Keerukus**: ⭐⭐

#### Mida sa õpid
- Süstemaatilised silumise meetodid
- Levinud probleemid ja lahendused
- AI-spetsiifiline tõrkeotsing

#### Õppematerjalid
- **🔧 Levinud probleemid**: [Levinud probleemid](docs/chapter-07-troubleshooting/common-issues.md) - KKK ja lahendused
- **🕵️ Silumine**: [Silumise juhend](docs/chapter-07-troubleshooting/debugging.md) - Samm-sammult strateegiad
- **🤖 AI probleemid**: [AI-spetsiifiline tõrkeotsing](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI teenuse probleemid

#### Praktilised harjutused
- Diagnoosi paigalduse rikkeid
- Lahenda autentimisprobleeme
- Silu AI teenuse ühenduvust

**💡 Peatüki tulemus**: Iseseisvalt diagnoosi ja lahenda tavapärased paigaldusprobleemid

---

### 🏢 Peatükk 8: Tootmine ja ettevõtte mustrid
**Eeltingimused**: Peatükid 1-4 on lõpetatud  
**Kestus**: 2-3 tundi  
**Keerukus**: ⭐⭐⭐⭐

#### Mida sa õpid
- Tootmispaigalduse strateegiad
- Ettevõtte turvalisuse mustrid
- Jälgimine ja kulude optimeerimine

#### Õppematerjalid
- **🏭 Tootmine**: [Parimad AI tootmiskogemused](docs/chapter-08-production/production-ai-practices.md) - Ettevõtte mustrid
- **📝 Näited**: [Mikroteenuste näide](../../examples/microservices) - Komplekssed arhitektuurid
- **📊 Jälgimine**: [Application Insights integratsioon](docs/chapter-06-pre-deployment/application-insights.md) - Jälgimine

#### Praktilised harjutused
- Rakenda ettevõtte turvamustrid
- Seadista põhjalik jälgimine
- Paigalda tootmiskeskkonda nõuetekohase valitsemisega

**💡 Peatüki tulemus**: Paigalda ettevõttevalmis rakendused täielike tootmisvõimekustega

---

## 🎓 Töötuba ülevaade: Praktiline õppimiskogemus

> **⚠️ TÖÖTOA OLEK: Aktiivne arendus**  
> Töötuba materjalid on hetkel arendamisel ja täiendamisel. Põhimoodulid töötavad, kuid mõned edasijõudnud osad on veel lõpetamata. Töötame aktiivselt kogu sisu valmimiseks. [Jälgi edenemist →](workshop/README.md)

### Interaktiivsed töötuba materjalid
**Kattuv praktiline õpetus brauseripõhiste tööriistade ja juhendatud harjutustega**

Meie töötoa materjalid pakuvad struktuuritud, interaktiivset õppimiskogemust, mis täiendab eespool peatükkidepõhist õppekava. Töötuba sobib nii iseseisvaks õppimiseks kui ka juhendatud sessioonideks.

#### 🛠️ Töötuba omadused
- **Brauseripõhine liides**: Täielik MkDocs-põhine töötuba koos otsingu, kopeerimise ja teema funktsioonidega
- **GitHub Codespaces integratsioon**: Ühe klõpsuga arenduskeskkonna seadistamine
- **Struktureeritud õpitee**: 8-mooduline juhendatud harjutused (kokku 3-4 tundi)
- **Järk-järguline metoodika**: Sissejuhatus → Valik → Valideerimine → Lagundamine → Konfigureerimine → Kohandamine → Lammutamine → Kokkuvõte
- **Interaktiivne DevContainer keskkond**: Eelseadistatud tööriistad ja sõltuvused

#### 📚 Töötuba mooduli struktuur
Töötuba järgib **8-moodulilist järkjärgulist metoodikat**, mis viib sind avastamisest paigaldusvalmiduseni:

| Moodul | Teema | Mida teed | Kestus |
|--------|-------|-----------|---------|
| **0. Sissejuhatus** | Töötuba ülevaade | Mõista õppimise eesmärke, eelteadmisi ja töötoa struktuuri | 15 min |
| **1. Valik** | Mallide avastamine | Uuri AZD malle ja vali sobiv AI mall oma stsenaariumi jaoks | 20 min |
| **2. Valideerimine** | Paigalda ja kontrolli | Paigalda mall `azd up` abil ja valideeri infrastruktuuri toimimine | 30 min |
| **3. Lagundamine** | Mõista struktuuri | Kasuta GitHub Copilot'i mallide arhitektuuri, Bicep-failide ja koodi korralduse uurimiseks | 30 min |
| **4. Konfigureerimine** | azure.yaml detailvaade | Valda `azure.yaml` konfigureerimist, elutsükli haake ja keskkonnamuutujaid | 30 min |
| **5. Kohandamine** | Tee oma omaks | Luba AI otsing, jälgimine, hindamine ja kohanda oma stsenaariumi jaoks | 45 min |
| **6. Demonteerimine** | Puhastamine | Turvaline ressursside demonteerimine koos `azd down --purge` | 15 min |
| **7. Kokkuvõte** | Järgmised Sammud | Vaatle saavutusi, põhikontseptsioone ja jätka oma õpiteekonda | 15 min |

**Töötoa kulg:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Töötoaga alustamine
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Töötoa õpitulemused
Töötubade läbimisel osalejad:
- **Tootmiskeskkonna AI rakenduste juurutamine**: Kasuta AZD-d Microsoft Foundry teenustega
- **Mitme agendi arhitektuuride valdamine**: Rakenda koordineeritud AI agentide lahendusi
- **Turvalisuse parimate tavade rakendamine**: Konfigureeri autentimist ja juurdepääsukontrolli
- **Skaalautuvuse optimeerimine**: Kujunda kuluefektiivseid ja jõudlusele optimeeritud juurutusi
- **Juurutuste veaotsing**: Lahenda levinud probleemid iseseisvalt

#### 📖 Töötoa ressursid
- **🎥 Interaktiivne juhend**: [Töötoa materjalid](workshop/README.md) - Sirvijas põhinev õppimiskeskkond
- **📋 Moodulipõhised juhised**:
  - [0. Sissejuhatus](workshop/docs/instructions/0-Introduction.md) - Töötoa ülevaade ja eesmärgid
  - [1. Valik](workshop/docs/instructions/1-Select-AI-Template.md) - Leia ja vali AI mallid
  - [2. Kinnitamine](workshop/docs/instructions/2-Validate-AI-Template.md) - Juuruta ja valideeri mallid
  - [3. Lammutamine](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Uuri malli arhitektuuri
  - [4. Konfigureerimine](workshop/docs/instructions/4-Configure-AI-Template.md) - Valda azure.yaml
  - [5. Kohandamine](workshop/docs/instructions/5-Customize-AI-Template.md) - Kohanda oma stsenaariumi jaoks
  - [6. Demonteerimine](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Puhasta ressursid
  - [7. Kokkuvõte](workshop/docs/instructions/7-Wrap-up.md) - Korda üle ja järgmised sammud
- **🛠️ AI Töötoa labor**: [AI Töötoa labor](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI keskseharjutused
- **💡 Kiire algus**: [Töötoa seadistamise juhend](workshop/README.md#quick-start) - Keskkonna konfigureerimine

**Sobib ideaalselt**: Ettevõtte koolitustele, ülikoolikursustele, iseseisvaks õppeks ja arendajate bootcampidele.

---

## 📖 Süvitsi: AZD võimalused

Lisaks põhitõdedele pakub AZD võimsaid võimalusi tootmiskeskkonna juurutusteks:

- **Mallipõhised juurutused** - Kasuta eelvalmivatud malle levinud rakenduse mustrite jaoks
- **Taru kui kood** - Halda Azure ressursse Bicep või Terraform abil  
- **Integreeritud töövood** - Vaevatu rakenduste proviisorimine, juurutamine ja jälgimine
- **Arendajasõbralik** - Optimeeritud arendajate tootlikkuse ja kogemuse parandamiseks

### **AZD + Microsoft Foundry: Täiuslik AI juurutusteks**

**Miks AZD AI lahendustele?** AZD lahendab peamised probleemid, millega AI arendajad kokku puutuvad:

- **AI-valmis mallid** - Eelkohandatud mallid Microsoft Foundry mudelite, Azure AI teenuste ja ML töökoormuste jaoks
- **Turvalised AI juurutused** - Sisseehitatud turbemustrid AI teenustele, API võtmetele ja mudelipunktidele  
- **Tootmiskeskkonna AI mustrid** - Parimad praktikad skaleeritavate ja kulutõhusate AI rakenduste juurutamiseks
- **Täielikud AI töövood** - Mudeli arendusest kuni tootmiseni koos nõuetekohase jälgimisega
- **Kuluoptimeerimine** - Nutikad ressursside jaotamise ja skaleerimise strateegiad AI töökoormustele
- **Microsoft Foundry integratsioon** - Vahetu ühendus Microsoft Foundry mudelikataloogi ja punkti lõppudega

---

## 🎯 Mallide ja näidiste kogu

### Esile toodud: Microsoft Foundry mallid
**Alusta siit, kui juurutad AI rakendusi!**

> **Märkus:** Need mallid demonstreerivad erinevaid AI mustreid. Mõned on välised Azure näited, teised kohalikud implementeeringud.

| Mall | Peatükk | Keerukus | Teenused | Tüüp |
|----------|---------|------------|----------|------|
| [**Alusta AI vestlusega**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Peatükk 2 | ⭐⭐ | AzureOpenAI + Azure AI Mudeli Tuvastamise API + Azure AI Otsing + Azure Container Apps + Application Insights | Välismaa |
| [**Alusta AI agentidega**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Peatükk 2 | ⭐⭐ | Foundry agentid + AzureOpenAI + Azure AI Otsing + Azure Container Apps + Application Insights| Välismaa |
| [**Azure Otsing + OpenAI demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Peatükk 2 | ⭐⭐ | AzureOpenAI + Azure AI Otsing + App Service + Storage | Välismaa |
| [**OpenAI vestlusrakendus kiirseaded**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Peatükk 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Välismaa |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Peatükk 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Välismaa |
| [**Contoso vestlus RAG**](https://github.com/Azure-Samples/contoso-chat) | Peatükk 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Otsing + Cosmos DB + Container Apps | Välismaa |
| [**Jaemüügi mitmeagendi lahendus**](examples/retail-scenario.md) | Peatükk 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Otsing + Storage + Container Apps + Cosmos DB | **Kohalik** |

### Esile toodud: Täielikud õppesstsenaariumid
**Tootmisküpsed rakenduse mallid õppe peatükkidega kaardistatud**

| Mall | Õppe peatükk | Keerukus | Põhiline õpe |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Peatükk 2 | ⭐ | Põhilised AI juurutuse mustrid |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Peatükk 2 | ⭐⭐ | RAG rakendus Azure AI Otsinguga |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Peatükk 4 | ⭐⭐ | Dokumentide intelligentsuse integratsioon |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Peatükk 5 | ⭐⭐⭐ | Agendi raamistik ja funktsioonikõned |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Peatükk 8 | ⭐⭐⭐ | Ettevõtte AI orkestreerimine |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Peatükk 5 | ⭐⭐⭐⭐ | Mitme agendi arhitektuur kliendi ja inventuuri agentidega |

### Õppimine näidistüübi järgi

> **📌 Kohalikud vs. välised näited:**  
> **Kohalikud näited** (selles repositooriumis) = Valmis kohe kasutamiseks  
> **Välised näited** (Azure näited) = Kloneeri seotud hoidlatest

#### Kohalikud näited (valmis kasutamiseks)
- [**Jaemüügi mitme agendi lahendus**](examples/retail-scenario.md) - Täielik tootmisküps implementeering koos ARM mallidega
  - Mitme agendi arhitektuur (Kliendi + Inventuuri agendid)
  - Kõike haarav jälgimine ja hindamine
  - Ühe klikiga juurutus ARM mallide abil

#### Kohalikud näited - konteinerirakendused (peatükid 2-5)
**Täielikud konteinerjuurutuse näited selles hoidlas:**
- [**Konteinerirakenduse näited**](examples/container-app/README.md) - Täielik juhend konteineripõhiste juurutuste kohta
  - [Lihtne Flask API](../../examples/container-app/simple-flask-api) - Põhiline REST API koos nullist skaleerimisega
  - [Mikroteenuste arhitektuur](../../examples/container-app/microservices) - Tootmisküps mitme teenuse juurutus
  - Kiire algus, tootmine ja täiustatud juurutuse mustrid
  - Jälgimise, turvalisuse ja kulu optimeerimise juhised

#### Välised näited - lihtsad rakendused (peatükid 1-2)
**Kloneeri need Azure näidete hoidlad alustamiseks:**
- [Lihtne veebirakendus - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Põhilised juurutuse mustrid
- [Staatiline veebisait - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staatilise sisu juurutus
- [Konteinerirakendus - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API juurutus

#### Välised näited - andmebaasi integratsioon (peatükid 3-4)  
- [Andmebaasirakendus - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Andmebaasi ühenduvuse mustrid
- [Funktsioonid + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverivaba andmetöötlus

#### Välised näited - täiustatud mustrid (peatükid 4-8)
- [Java mikroteenused](https://github.com/Azure-Samples/java-microservices-aca-lab) - Mitmeteenuste arhitektuurid
- [Container Apps tööd](https://github.com/Azure-Samples/container-apps-jobs) - Taustaprotsessid  
- [Ettevõtte ML torujuhe](https://github.com/Azure-Samples/mlops-v2) - Tootmisküpsed ML mustrid

### Välised mallikogumikud
- [**Ametlik AZD malli galerii**](https://azure.github.io/awesome-azd/) - Hoolikalt valitud ametlikud ja kogukonna mallid
- [**Azure Developer CLI mallid**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn mallide dokumentatsioon
- [**Näidiste kataloog**](examples/README.md) - Kohalikud õppenäited koos detailsete selgitustega

---

## 📚 Õpperessursid ja viited

### Kiired viited
- [**Käsurea spikker**](resources/cheat-sheet.md) - Olulised azd käsud jaotatuna peatükkide kaupa
- [**Terminid**](resources/glossary.md) - Azure ja azd terminoloogia  
- [**KKK**](resources/faq.md) - Levinumad küsimused jaotatuna õppepeatükkide kaupa
- [**Õpi juhend**](resources/study-guide.md) - Üldised praktilised harjutused

### Praktilised töötoad
- [**AI töötoa labor**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Muuda oma AI lahendused AZD-ga paigaldatavaks (2-3 tundi)
- [**Interaktiivne töötuba**](workshop/README.md) - 8 mooduliga juhendatud harjutused MkDocs ja GitHub Codespaces abil
  - Järgmine: Sissejuhatus → Valik → Kontroll → Lammutamine → Konfiguratsioon → Kohandamine → Lahendus → Kokkuvõte

### Välised õppeallikad
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure arhitektuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure hinnakalkulaator](https://azure.microsoft.com/pricing/calculator/)
- [Azure oleku leht](https://status.azure.com/)

### AI agendi oskused sinu redaktorisse
- [**Microsoft Azure oskused skills.sh lehel**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 avatud agendi oskust Azure AI, Foundry, paigalduse, diagnostika, kulude optimeerimise ja muu kohta. Paigalda need GitHub Copilot, Cursor, Claude Code või mõnda toetatud agenti:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Kiire tõrkeotsingu juhend

**Algajatel sagedased probleemid ja kohesed lahendused:**

<details>
<summary><strong>❌ "azd: käsku ei leitud"</strong></summary>

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
<summary><strong>❌ "Tellijat ei leitud" või "Tellijat ei ole määratud"</strong></summary>

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
<summary><strong>❌ "EbapiisavKvoot" või "Kvoot on ületatud"</strong></summary>

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
<summary><strong>❌ "azd up” ebaõnnestub poole peal</strong></summary>

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
<summary><strong>❌ "Autentimine ebaõnnestus" või "Token on aegunud"</strong></summary>

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
<summary><strong>❌ "Resurss on juba olemas" või nimetuste kokkupõrked</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Mallide juurutus võtab liiga kaua aega</strong></summary>

**Tavalised ooteajad:**
- Lihtne veebiäpp: 5-10 minutit
- Äpp andmebaasiga: 10-15 minutit
- AI rakendused: 15-25 minutit (OpenAI ettevalmistus on aeglane)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Luba keelatud" või "Keelatud"</strong></summary>

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
<summary><strong>❌ Paigaldatud rakenduse URL-i ei leitud</strong></summary>

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

### 📚 Täielikud tõrkeotsingu ressursid

- **Levinud probleemide juhend:** [Üksikasjalikud lahendused](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-spetsiifilised probleemid:** [AI tõrkeotsingu juhend](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Silumine:** [Samm-sammult silumine](docs/chapter-07-troubleshooting/debugging.md)
- **Abi leidmine:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursuse lõpetamine ja sertifitseerimine

### Edusammude jälgimine
Jälgi oma õppe edenemist iga peatüki kaupa:

- [ ] **Peatükk 1**: Alused ja kiire stardipakett ✅
- [ ] **Peatükk 2**: AI-esmane arendus ✅  
- [ ] **Peatükk 3**: Konfigureerimine ja autentimine ✅
- [ ] **Peatükk 4**: Infrastruktuur koodina ja juurutamine ✅
- [ ] **Peatükk 5**: Mitme-agentide AI lahendused ✅
- [ ] **Peatükk 6**: Enne juurutamist valideerimine ja planeerimine ✅
- [ ] **Peatükk 7**: Tõrkeotsing ja silumine ✅
- [ ] **Peatükk 8**: Tootmine ja ettevõtte mustrid ✅

### Õppe kontroll
Pärast iga peatüki lõpetamist kontrolli oma teadmisi:
1. **Praktiline harjutus**: Lõpeta peatüki praktiline juurutus
2. **Teadmiste kontroll**: Vaata oma peatüki KKK jaotist
3. **Kogukonna arutelu**: Jaga oma kogemusi Azure Discordis
4. **Järgmine peatükk**: Liigu järgmisele keerukuse tasemele

### Kursuse lõpetamise eelised
Kõigi peatükkide lõpetamisel oled saavutanud:
- **Tootmiskogemus**: Reaalse AI rakenduse juurutamine Azure keskkonda
- **Professionaalsed oskused**: Ettevõtte-taseme juurutusvõimekus  
- **Kogukonna tunnustus**: Aktiivne liige Azure arendajate kogukonnas
- **Karjääri areng**: Nõutud AZD ja AI juurutuse pädevused

---

## 🤝 Kogukond ja tugi

### Abi ja tugi
- **Tehnilised probleemid**: [Teata vigadest ja esita funktsioonisoove](https://github.com/microsoft/azd-for-beginners/issues)
- **Õppega seotud küsimused**: [Microsoft Azure Discordi kogukond](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-spetsiifiline abi**: Liitu [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentatsioon**: [Ametlik Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Kogukonna vaated Microsoft Foundry Discordist

**Hiljutised küsitluse tulemused #Azure kanalist:**
- **45%** arendajatest soovib kasutada AZD-d AI töökoormuste jaoks
- **Peamised takistused**: Mitme teenuse juurutus, volituste haldamine, tootmiseks valmisolek  
- **Kõige rohkem soovitud**: AI-spetsiifilised mallid, tõrkeotsingu juhendid, parimad tavad

**Liitu meie kogukonnaga, et:**
- Jagada oma AZD + AI kogemusi ja saada abi
- Saada varajast ligipääsu uutele AI mallidele
- Panustada AI juurutuse parimatesse tavadesse
- Mõjutada tulevasi AI + AZD funktsioonide arendusi

### Panusta kursusesse
Ootame panuseid! Palun loe meie [Panustamise juhendit](CONTRIBUTING.md) detaile kohta:
- **Sisu täiustused**: Paranda olemasolevaid peatükke ja näiteid
- **Uued näited**: Lisa reaalse elu stsenaariume ja malle  
- **Tõlge**: Aita mitmekeelse toe säilitamisel
- **Vigade raportid**: Paranda täpsust ja selgust
- **Kogukonna reeglid**: Jälgi meie kaasava kogukonna juhiseid

---

## 📄 Kursuse info

### Litsents
See projekt on litsentsitud MIT litsentsi alusel - vaata [LICENSE](../../LICENSE) faili üksikasjade jaoks.

### Seotud Microsofti õppeallikad

Meie meeskond toodab ka teisi ulatuslikke õppekurse:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j algajatele](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js algajatele](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain algajatele](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agendid
[![AZD algajatele](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI algajatele](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP algajatele](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agendid algajatele](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatiivse AI sari
[![Generatiivne AI algajatele](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatiivne AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatiivne AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatiivne AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Põhiõpe
[![ML algajatele](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Andmeteadus algajatele](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI algajatele](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kyberturvalisus algajatele](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Veebiarendus algajatele](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT algajatele](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR arendus algajatele](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copiloti sari
[![Copilot AI paari programmeerimiseks](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET jaoks](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copiloti seiklus](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursuse navigeerimine

**🚀 Valmis õppima?**

**Algajad**: Alusta [Peatükk 1: Alused ja kiire stardipakett](#-chapter-1-foundation--quick-start)  
**AI arendajad**: Liigu kohe [Peatükk 2: AI-esmane arendus](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Kogenud arendajad**: Alusta [Peatükk 3: Konfigureerimine ja autentimine](#️-chapter-3-configuration--authentication)

**Järgmised sammud**: [Alusta peatükist 1 - AZD alused](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->