# AZD algajatele: Struktureeritud õppeprogramm

![AZD-for-beginners](../../translated_images/et/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automaatne tõlge (Alati ajakohane)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](./README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Eelistad kloonimist lokaalselt?**
>
> See hoidla sisaldab üle 50 keele tõlkeid, mis suurendab allalaadimise mahtu märkimisväärselt. Kui soovid kloonida ilma tõlgeteta, kasuta sparsilise kontrolli meetodit:
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
> See annab sulle kõik, mida kursuse lõpetamiseks vaja, palju kiirema allalaadimisega.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Mis on täna AZD-s uut

Azure Developer CLI on kasvanud traditsioonilistest veebirakendustest ja API-dest kaugemale. Täna on azd ainus tööriist **enda kõigi** rakenduste Azure'i juurutamiseks – sealhulgas tehisintellektil põhinevad rakendused ja targad agendid.

See tähendab sulle järgmist:

- **AI agentid on nüüd esmaklassilised azd töökoormused.** Saad initsialiseerida, juurutada ja hallata AI agentide projekte samade `azd init` → `azd up` käskudega, mida sa juba tead.
- **Microsoft Foundry integratsioon** toob mudelite juurutamise, agendi hostimise ja AI teenuste seadistamise otse azd malli ökosüsteemi.
- **Põhikäsurid pole muutunud.** Kas juurutad todo-rakendust, mikroteenust või mitme agendiga AI lahendust, käsud on samad.

Kui oled azd-d varem kasutanud, siis AI tugi on loomulik laiendus – mitte eraldi tööriist ega keeruline rada. Kui alustad nullist, õpid ühte tüüpi töövoogu, mis töötab kõigi puhul.

---

## 🚀 Mis on Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** on arendajasõbralik käsurea tööriist, mis teeb rakenduste Azure'i juurutamise lihtsaks. Selle asemel, et käsitsi luua ja ühendada kümneid Azure ressursse, saad kogu rakenduse ühe käsuga juurutada.

### `azd up` võlu

```bash
# See üks käsk teeb kõik:
# ✅ Loob kõik Azure'i ressursid
# ✅ Seadistab võrgu ja turvalisuse
# ✅ Koostab teie rakenduse koodi
# ✅ Juurutab Azure'i
# ✅ Annab teile töötava URL-i
azd up
```

**See ongi kõik!** Pole vaja klikkida Azure portaali, õppida keerukaid ARM malle ega käsitsi seadistada - lihtsalt töötavad rakendused Azure'is.

---

## ❓ Azure Developer CLI vs Azure CLI: Mis vahe on?

Algajate kõige levinum küsimus. Lihtne vastus on:

| Funktsioon | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|------------|---------------------|--------------------------------|
| **Eesmärk** | Hallata üksikuid Azure ressursse | Juurutada täielikke rakendusi |
| **Mõtteviis** | Infrastruktuurikeskne | Rakenduskeskne |
| **Näide** | `az webapp create --name myapp...` | `azd up` |
| **Õppimiskõver** | Tuleb tunda Azure teenuseid | Tuleb tunda oma rakendust |
| **Sobib** | DevOps, infrastruktuur | Arendajad, prototüüpimine |

### Lihtne võrdlus

- **Azure CLI** on nagu kõigi tööriistade omaniku olemasolu maja ehitamiseks - haamrid, saed, naelad. Saad kõike ehitada, aga pead konstruktsioonist aru saama.
- **Azure Developer CLI** on nagu ehitusfirma palkamine - sa kirjeldu, mida tahad, nemad ehitavad.

### Millal mida kasutada

| Situatsioon | Kasuta seda |
|-------------|-------------|
| "Ma tahan kiiresti oma veebirakenduse juurutada" | `azd up` |
| "Vajan lihtsalt salvestuskontot luua" | `az storage account create` |
| "Ehitan täielikku AI rakendust" | `azd init --template azure-search-openai-demo` |
| "Vajan konkreetset Azure ressurssi siluda" | `az resource show` |
| "Tahan tootmiskõlblikku juurutust paar minutiga" | `azd up --environment production` |

### Nad töötavad koos!

AZD kasutab Azure CLI-d tagaplaanil. Sa võid kasutada mõlemat:
```bash
# Juuruta oma rakendus AZD-iga
azd up

# Seejärel peenhäälesta konkreetseid ressursse Azure CLI-ga
az webapp config set --name myapp --always-on true
```

---

## 🌟 Leia malle Awesome AZD-st

Ära alusta nullist! **Awesome AZD** on kogukonna kollektsioon juurutamiseks valmis mallidest:

| Ressurss | Kirjeldus |
|----------|-----------|
| 🔗 [**Awesome AZD galerii**](https://azure.github.io/awesome-azd/) | Käeulatuses 200+ malli ühe klõpsuga juurutamiseks |
| 🔗 [**Esita mall**](https://github.com/Azure/awesome-azd/issues) | Panusta oma mall kogukonda |
| 🔗 [**GitHub hoidla**](https://github.com/Azure/awesome-azd) | Staari ja avasta lähtekoodi |

### Populaarsed AI mallid Awesome AZD-st

```bash
# RAG-vestlus Microsoft Foundry mudelite ja tehisintellekti otsinguga
azd init --template azure-search-openai-demo

# Kiire tehisintellekti vestlusrakendus
azd init --template openai-chat-app-quickstart

# Tehisintellekti agendid koos Foundry-agentidega
azd init --template get-started-with-ai-agents
```

---

## 🎯 Alusta 3 sammuga

Enne alustamist veendu, et sinu masin on valmis selleks malliks, mida soovid juurutada:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Kui mõni vajalik kontroll ebaõnnestub, paranda see esmalt ja siis jätka kiire algusega.

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

### Samm 2: Autendi AZD jaoks

```bash
# Valikuline, kui plaanite selles kursuses Azure CLI käske otse kasutada
az login

# Nõutav AZD töövoogude jaoks
azd auth login
```

Kui sa pole kindel, kumb sul vaja on, järgi täismahus seadistusjuhendit [Installatsioon ja seadistus](docs/chapter-01-foundation/installation.md#authentication-setup).

### Samm 3: Juuruta oma esimene rakendus

```bash
# Alusta mallist
azd init --template todo-nodejs-mongo

# Juuruta Azure'i (loob kõik!)
azd up
```

**🎉 See ongi kõik!** Sinu rakendus töötab nüüd Azure'is.

### Tee koristus (ära unusta!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kuidas seda kursust kasutada

See kursus on loodud **järkjärgulise õppimise** jaoks - alusta sellest, kust end mugavalt tunned, ja liigu edasi:

| Sinu kogemus | Alusta siit |
|--------------|-------------|
| **Täiesti uus Azure'is** | [1. peatükk: Alus](#-chapter-1-foundation--quick-start) |
| **Tunned Azure'i, oled AZD uus** | [1. peatükk: Alus](#-chapter-1-foundation--quick-start) |
| **Tahad AI-rakendusi juurutada** | [2. peatükk: AI-eeline arendus](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Soovid praktilist kogemust** | [🎓 Interaktiivne töötuba](workshop/README.md) - 3-4 tundi juhendatud laborit |
| **Vajalik tootmisvalmiduse mustrid** | [8. peatükk: Tootmine & ettevõte](#-chapter-8-production--enterprise-patterns) |

### Kiire seadistus

1. **Forki see hoidla**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klooni see**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Leia abi**: [Azure Discord kogukond](https://discord.com/invite/ByRwuEEgH4)

> **Eelistad kloonimist lokaalselt?**

> See hoidla sisaldab üle 50 keele tõlkeid, mis suurendab allalaadimise mahtu märkimisväärselt. Kui soovid kloonida ilma tõlgeteta, kasuta sparsilise kontrolli meetodit:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> See annab sulle kõik, mida kursuse lõpetamiseks vaja, palju kiirema allalaadimisega.


## Kursuse ülevaade

Õpi meistriks Azure Developer CLI (azd) läbides struktureeritud peatükke, mis on mõeldud järkjärguliseks õppimiseks. **Eritähtsus Microsoft Foundry integratsiooniga AI rakenduste juurutamisel.**

### Miks see kursus on tänapäeva arendajatele oluline

Põhineb Microsoft Foundry Discord kogukonna sisendil, **45% arendajatest soovib kasutada AZD-d AI töökoormuste jaoks**, kuid seisab silmitsi järgmiste väljakutsetega:
- Keerulised mitme teenuse AI arhitektuurid
- AI tootmisjuurutamise parimad tavad  
- Azure AI teenuste integreerimine ja seadistamine
- AI töökoormuste kulude optimeerimine
- AI-spetsiifiliste juurutusprobleemide silumine

### Õpieesmärgid

Kursuse läbimisel saad:
- **Adukas AZD põhialuste valdamine**: tuumkontseptsioonid, paigaldus ja seadistus
- **AI rakenduste juurutamine**: kasuta AZD-d koos Microsoft Foundry teenustega
- **Infrastructure as Code rakendamine**: halda Azure ressursse Bicep mallidega
- **Juurutuste tõrkeotsing**: lahenda sagedasi probleeme ja silu tõrkeid
- **Tootmiseks optimeerimine**: turvalisus, skaleerimine, jälgimine ja kulude haldus
- **Mitmeagendiliste lahenduste ehitamine**: juuruta keerukaid AI arhitektuure

## Enne alustamist: kontod, ligipääs ja eeldused

Enne 1. peatüki alustamist veendu, et sul on järgnevad asjad korras. Käesoleva juhendi paigaldus- ja seadistusjuhised eeldavad neid põhialuseid juba olemas olevat.
- **Azure tellimus**: Saate kasutada olemasolevat tellimust töökohast või oma isiklikku kontot või luua [tasuta prooviperioodi](https://aka.ms/azurefreetrial) alustamiseks.
- **Õigus Azure'i ressursside loomisel**: Enamiku ülesannete jaoks peaks teil olema sihttellimusele või ressurmirühmale vähemalt **kaastöötaja** juurdepääs. Mõned peatükid võivad eeldada ka ressurmirühmade, hallatavate identiteetide ja RBAC määrangute loomise õigust.
- [**GitHubi konto**](https://github.com): Mõistlik on hoidla fork'ida, enda muudatusi jälgida ja kasutada töötoa jaoks GitHub Codespaces’i.
- **Mallide käitamise eeltingimused**: Mõned mallid vajavad kohalikke tööriistu nagu Node.js, Python, Java või Docker. Käivitage seadistuse valideerija enne alustamist, et puuduvad tööriistad varakult avastada.
- **Põhiline konsooli tundmine**: Te ei pea olema ekspert, kuid peaksite olema mugav käitama käske nagu `git clone`, `azd auth login` ja `azd up`.

> **Töötate ettevõtte tellimusega?**
> Kui teie Azure keskkonda haldab administraator, kinnitage eelnevalt, et saate sihttellimuses või -ressurmirühmas ressursse juurutada. Kui mitte, küsige enne alustamist liivakasti tellimust või kaastöötaja õigust.

> **Olete Azure’is uus?**
> Alustage oma isikliku Azure prooviperioodi või tasulise tellimusega aadressil https://aka.ms/azurefreetrial, et saaksite harjutused lõpuni teha ilma üürniku tasandi kinnitusi ootamata.

## 🗺️ Kursuse kaart: Kiire navigeerimine peatükkide kaupa

Igal peatükil on oma README koos õpieesmärkide, kiirete alustuste ja harjutustega:

| Peatükk | Teema | Õppetunnid | Kestus | Keerukus |
|---------|-------|-------------|----------|------------|
| **[1. peatükk: Vundament](docs/chapter-01-foundation/README.md)** | Alustamine | [AZD põhitõed](docs/chapter-01-foundation/azd-basics.md) &#124; [Paigaldus](docs/chapter-01-foundation/installation.md) &#124; [Esimene projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[2. peatükk: AI arendus](docs/chapter-02-ai-development/README.md)** | AI-eelistatud rakendused | [Foundry integratsioon](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agendid](docs/chapter-02-ai-development/agents.md) &#124; [Mudeli juurutamine](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Töötuba](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 tundi | ⭐⭐ |
| **[3. peatükk: Konfiguratsioon](docs/chapter-03-configuration/README.md)** | Autentimine ja turvalisus | [Konfiguratsioon](docs/chapter-03-configuration/configuration.md) &#124; [Autentimine ja turvalisus](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[4. peatükk: Infrastruktuur](docs/chapter-04-infrastructure/README.md)** | IaC ja juurutamine | [Juurutamise juhend](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionimine](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 tundi | ⭐⭐⭐ |
| **[5. peatükk: Mitmeagendi lahendused](docs/chapter-05-multi-agent/README.md)** | AI agendi lahendused | [Jaekauplemise stsenaarium](examples/retail-scenario.md) &#124; [Koordineerimise mustrid](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 tundi | ⭐⭐⭐⭐ |
| **[6. peatükk: Enne juurutamist](docs/chapter-06-pre-deployment/README.md)** | Planeerimine ja valideerimine | [Eelkontrollid](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Mahupõhine planeerimine](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU valik](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 tund | ⭐⭐ |
| **[7. peatükk: Veaotsing](docs/chapter-07-troubleshooting/README.md)** | Silumine ja parandamine | [Tavalised probleemid](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Silumine](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI probleemid](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 tundi | ⭐⭐ |
| **[8. peatükk: Tootmine](docs/chapter-08-production/README.md)** | Ettevõtte mustrid | [Tootmise praktikad](docs/chapter-08-production/production-ai-practices.md) | 2-3 tundi | ⭐⭐⭐⭐ |
| **[🎓 Töötuba](workshop/README.md)** | Praktiline labor | [Sissejuhatus](workshop/docs/instructions/0-Introduction.md) &#124; [Valik](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Valideerimine](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Lammutamine](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguratsioon](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Kohandamine](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Lammutamine](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Kokkuvõte](workshop/docs/instructions/7-Wrap-up.md) | 3-4 tundi | ⭐⭐ |

**Kogu kursuse kestus:** ~10-14 tundi | **Oskuste areng:** Algaja → Tootmisvalmis

---

## 📚 Õppepeatükid

*Valige oma õpivõimalus vastavalt kogemustasemele ja eesmärkidele*

### 🚀 1. peatükk: Vundament ja kiire algus
**Eeltingimused**: Azure tellimus, põhilised käsurea teadmised  
**Kestus**: 30-45 minutit  
**Keerukus**: ⭐

#### Mida õpite
- Azure Developer CLI põhialused
- AZD paigaldamine oma platvormile
- Teie esimene edukas juurutamine

#### Õppematerjalid
- **🎯 Alustage siit**: [Mis on Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teooria**: [AZD põhitõed](docs/chapter-01-foundation/azd-basics.md) – põhimõisted ja terminoloogia
- **⚙️ Seadistamine**: [Paigaldus ja seadistus](docs/chapter-01-foundation/installation.md) – platvormipõhised juhised
- **🛠️ Praktiline**: [Teie esimene projekt](docs/chapter-01-foundation/first-project.md) – samm-sammult juhend
- **📋 Kiire ülevaade**: [Käskude kiirjuhend](resources/cheat-sheet.md)

#### Praktilised harjutused
```bash
# Kiire paigalduskontroll
azd version

# Käivitage oma esimene rakendus
azd init --template todo-nodejs-mongo
azd up
```

**💡 Peatüki tulemus**: Lihtsa veebirakenduse edukas juurutamine Azure’i AZD abil

**✅ Edukuse kontroll:**
```bash
# Pärast 1. peatüki lõpetamist peaksite suutma:
azd version              # Kuvab installitud versiooni
azd init --template todo-nodejs-mongo  # Initsialiseerib projekti
azd up                  # Paigaldab Azure'i
azd show                # Kuvab töötava rakenduse URL-i
# Rakendus avaneb brauseris ja töötab
azd down --force --purge  # Puhastab ressursid
```

**📊 Ajainvesteering:** 30-45 minutit  
**📈 Oskustase pärast:** Suudab iseseisvalt juurutada põhilisi rakendusi  
**📈 Oskustase pärast:** Suudab iseseisvalt juurutada põhilisi rakendusi

---

### 🤖 2. peatükk: AI-eelistatud arendus (Soovitatav AI arendajatele)
**Eeltingimused**: 1. peatükk lõpetatud  
**Kestus**: 1-2 tundi  
**Keerukus**: ⭐⭐

#### Mida õpite
- Microsoft Foundry integreerimine AZD-ga
- AI-toega rakenduste juurutamine
- AI teenuste konfiguratsiooni mõistmine

#### Õppematerjalid
- **🎯 Alustage siit**: [Microsoft Foundry integratsioon](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agendid**: [AI agentide juhend](docs/chapter-02-ai-development/agents.md) – nutikate agentide juurutamine AZD-ga
- **📖 Mustrid**: [AI mudelite juurutamine](docs/chapter-02-ai-development/ai-model-deployment.md) – AI mudelite haldus ja juurutamine
- **🛠️ Töötuba**: [AI töötuba](docs/chapter-02-ai-development/ai-workshop-lab.md) – tehke oma AI lahendused AZD-le valmis
- **🎥 Interaktiivne juhend**: [Töötoa materjalid](workshop/README.md) – brauseripõhine õppimine MkDocsi * DevContainer keskkonnas
- **📋 Mallid**: [Microsoft Foundry mallid](#töötuba-materjalid)
- **📝 Näited**: [AZD juurutamise näited](examples/README.md)

#### Praktilised harjutused
```bash
# Käivitage oma esimene tehisintellekti rakendus
azd init --template azure-search-openai-demo
azd up

# Proovige täiendavaid tehisintellekti malli
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Peatüki tulemus**: AI-toega vestlusrakenduse juurutamine ja seadistamine RAG võimekusega

**✅ Edukuse kontroll:**
```bash
# Pärast 2. peatükki peaksid saama:
azd init --template azure-search-openai-demo
azd up
# Testida tehisintellekti vestlusliidest
# Esitada küsimusi ja saada tehisintellektil põhinevaid vastuseid allikatega
# Kontrollida, et otsingu integratsioon töötab
azd monitor  # Kontrollida, kas Application Insights kuvab telemeetriaandmeid
azd down --force --purge
```

**📊 Ajainvesteering:** 1-2 tundi  
**📈 Oskustase pärast:** Suudab juurutada ja seadistada tootmisvalmis AI rakendusi  
**💰 Kulu teadlikkus:** Tunneb $80-150/kuu arendus- ja $300-3500/kuu tootmiskulusid

#### 💰 AI juurutamise kulumõtted

**Arenduskeskkond (hinnanguliselt $80-150/kuu):**
- Microsoft Foundry mudelid (tasumine kasutuse järgi): $0-50/kuu (põhineb tokenite tarbimisel)
- AI otsing (algtasand): $75/kuu
- Container Apps (tarbimispõhine): $0-20/kuu
- Salvestus (standard): $1-5/kuu

**Tootmiskeskkond (hinnanguliselt $300-3500+/kuu):**
- Microsoft Foundry mudelid (PTU järjepidevuse jaoks): $3000+/kuu VÕI tasumine kasutuse järgi suurte mahu korral
- AI otsing (standardtase): $250/kuu
- Container Apps (pühendatud): $50-100/kuu
- Application Insights: $5-50/kuu
- Salvestus (premium): $10-50/kuu

**💡 Kulusäästunipid:**
- Kasutage õppimiseks **tasuta tasandi** Microsoft Foundry mudeleid (Azure OpenAI 50 000 tokenit/kuu kaasatud)
- Käivitage `azd down`, et mitteaktiivsetel aegadel ressursid vabastada
- Alustage tarbimispõhise arveldusega, minge PTU-le vaid tootmises
- Kasutage `azd provision --preview`, et enne juurutamist kulusid hinnata
- Lülitage sisse automaatne skaleerimine: makske vaid tegeliku kasutuse eest

**Kulukontroll:**
```bash
# Kontrolli hinnangulisi igakuiste kulude
azd provision --preview

# Jälgi tegelikke kulusid Azure'i portaalis
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3. peatükk: Konfiguratsioon ja autentimine
**Eeltingimused**: 1. peatükk lõpetatud  
**Kestus**: 45-60 minutit  
**Keerukus**: ⭐⭐

#### Mida õpite
- Keskkonna konfiguratsioon ja haldus
- Autentimise ja turvalisuse heade tavade järgimine
- Ressursside nimetamine ja organiseerimine

#### Õppematerjalid
- **📖 Konfiguratsioon**: [Konfiguratsioonijuhend](docs/chapter-03-configuration/configuration.md) – keskkonna seadistamine
- **🔐 Turvalisus**: [Autentimise mustrid ja hallatavad identiteedid](docs/chapter-03-configuration/authsecurity.md) – autentimise mustrid
- **📝 Näited**: [Andmebaasi rakenduse näide](examples/database-app/README.md) – AZD andmebaasi näited

#### Praktilised harjutused
- Konfigureerige mitu keskkonda (dev, staging, prod)
- Seadistage hallatava identiteedi autentimine
- Rakendage keskkonnapõhiseid konfiguratsioone

**💡 Peatüki tulemus**: Juhtida mitut keskkonda nõuetekohase autentimise ja turvalisusega

---

### 🏗️ 4. peatükk: Infrastruktuur koodina ja juurutamine
**Eeltingimused**: 1.-3. peatükk lõpetatud  
**Kestus**: 1-1,5 tundi  
**Keerukus**: ⭐⭐⭐

#### Mida õpite
- Täiustatud juurutamismustrid
- Infrastruktuur koodina Bicep abil
- Ressursside provisioning strateegiad

#### Õppematerjalid
- **📖 Juurutamine**: [Juurutamise juhend](docs/chapter-04-infrastructure/deployment-guide.md) – täielikud töövood
- **🏗️ Provisionimine**: [Ressursside provisionimine](docs/chapter-04-infrastructure/provisioning.md) – Azure ressursihaldus
- **📝 Näited**: [Container App näide](../../examples/container-app) – konteineripõhised juurutused

#### Praktilised harjutused
- Looge kohandatud Bicep mallid
- Juurutage mitme teenusega rakendusi
- Rakendage sinine-tüüri (blue-green) juurutamisstrateegiaid

**💡 Peatüki tulemus**: Juurutada keerukaid mitmete teenustega rakendusi kohandatud infrastruktuurimallidega

---

### 🎯 5. peatükk: Mitmeagendi AI lahendused (edasijõudnutele)
**Eeltingimused**: 1.-2. peatükk lõpetatud  
**Kestus**: 2-3 tundi  
**Keerukus**: ⭐⭐⭐⭐

#### Mida õpite
- Mitme agendi arhitektuurimustrid
- Agentide orkestreerimine ja koordineerimine
- Tootmisvalmis AI juurutused

#### Õppematerjalid
- **🤖 Esiletõstetud projekt**: [Jaekauplemise mitmeagendi lahendus](examples/retail-scenario.md) – täielik rakendus
- **🛠️ ARM mallid**: [ARM mallipakett](../../examples/retail-multiagent-arm-template) – üheklõpsu juurutus
- **📖 Arhitektuur**: [Mitme agendi koordineerimise mustrid](docs/chapter-06-pre-deployment/coordination-patterns.md) – mustrid

#### Praktilised harjutused
```bash
# Paigalda täielik jaemüügi mitmeagendi lahendus
cd examples/retail-multiagent-arm-template
./deploy.sh

# Uuri agendi konfiguratsioone
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Peatüki tulemus**: Tootmisvalmis mitmeagendi AI lahenduse juurutamine ja haldamine kliendi- ja laoseisuagentidega

---

### 🔍 6. peatükk: Eeljärgne valideerimine ja planeerimine
**Eeltingimused**: 4. peatükk lõpetatud  
**Kestus**: 1 tund  
**Keerukus**: ⭐⭐
#### Mida Sa Õpid
- Mahuplaani koostamine ja ressursside valideerimine
- SKU valiku strateegiad
- Eelkontrollid ja automatiseerimine

#### Õppematerjalid
- **📊 Planeerimine**: [Mahuplaani koostamine](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressursside valideerimine
- **💰 Valik**: [SKU valik](docs/chapter-06-pre-deployment/sku-selection.md) - Kuluefektiivsed valikud
- **✅ Valideerimine**: [Eelkontrollid](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiseeritud skriptid

#### Praktilised Harjutused
- Käivita mahulise valideerimise skriptid
- Optimeeri SKU valikuid kulude järgi
- Rakenda automatiseeritud eelkontrolle enne juurutamist

**💡 Peatüki tulemus**: Valideeri ja optimeeri juurutused enne täitmist

---

### 🚨 Peatükk 7: Tõrkeotsing ja Silumine
**Nõuded**: Igasugune juurutamise peatükk lõpetatud  
**Kestus**: 1-1,5 tundi  
**Kompleksus**: ⭐⭐

#### Mida Sa Õpid
- Süsteemsed silumise meetodid
- Levinud probleemid ja lahendused
- Tehisintellekti spetsiifiline tõrkeotsing

#### Õppematerjalid
- **🔧 Levinud probleemid**: [Levinud probleemid](docs/chapter-07-troubleshooting/common-issues.md) - KKK ja lahendused
- **🕵️ Silumine**: [Silumise juhend](docs/chapter-07-troubleshooting/debugging.md) - Samm-sammult strateegiad
- **🤖 AI probleemid**: [AI-spetsiifiline tõrkeotsing](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI teenuste probleemid

#### Praktilised Harjutused
- Diagnoosi juurutamise rikete põhjused
- Lahenda autentimisprobleemid
- Silu AI teenuste ühenduvust

**💡 Peatüki tulemus**: Diagnoosi ja lahenda iseseisvalt levinud juurutamise probleemid

---

### 🏢 Peatükk 8: Tootmiskeskkonna ja Ettevõtte Mustrid
**Nõuded**: Peatükid 1-4 lõpetatud  
**Kestus**: 2-3 tundi  
**Kompleksus**: ⭐⭐⭐⭐

#### Mida Sa Õpid
- Tootmisele juurutamise strateegiad
- Ettevõtte turvalisuse mustrid
- Jälgimine ja kulude optimeerimine

#### Õppematerjalid
- **🏭 Tootmine**: [Tootmisprotsessid AI-ga](docs/chapter-08-production/production-ai-practices.md) - Ettevõtte mustrid
- **📝 Näited**: [Mikroteenuste näide](../../examples/microservices) - Kompleksne arhitektuur
- **📊 Jälgimine**: [Application Insights integratsioon](docs/chapter-06-pre-deployment/application-insights.md) - Jälgimine

#### Praktilised Harjutused
- Rakenda ettevõtte turvalisuse mustrid
- Sea üles põhjalik jälgimine
- Juuruta tootmisse koos sobiva haldusega

**💡 Peatüki tulemus**: Juuruta ettevõttevalmis rakendusi täismahus tootmisvõimekusega

---

## 🎓 Töötuba Ülevaade: Praktikal põhinev Õppimiskogemus

> **⚠️ TÖÖTUBA STAATUS: Arendamisel**  
> Töötuba on hetkel arendamisel ja täiustamisel. Põhimoodulid toimivad, kuid mõned keerukamad osad on lõpetamata. Töötame aktiivselt kogu sisu lõpuleviimiseks. [Jälgi arengut →](workshop/README.md)

### Interaktiivsed töökoda materjalid  
**Kõikehõlmav praktiline õppimine brauseripõhiste tööriistade ja juhendatud harjutustega**

Meie töötuba pakub struktureeritud ja interaktiivset õppimiskogemust, mis täiendab ülaltoodud peatükkidel põhinevat õppekava. Töötuba on mõeldud nii iseseisvaks õppimiseks kui ka juhendatavateks sessioonideks.

#### 🛠️ Töötuba omadused
- **Brauseripõhine liides**: Täielik MkDocs-töötoa funktsionaalsus otsingu, kopeerimise ja teemadega
- **GitHub Codespaces integratsioon**: Ühe klõpsuga arenduskeskkonna seadistus
- **Struktureeritud õppetrass**: 8 moodulit juhendatud harjutustega (kokku 3-4 tundi)
- **Järkjärguline metodoloogia**: Sissejuhatus → Valik → Valideerimine → Lammutamine → Konfiguratsioon → Kohandamine → Lõpetamine → Kokkuvõte
- **Interaktiivne DevContainer keskkond**: Eelseadistatud tööriistad ja sõltuvused

#### 📚 Töötuba moodulite struktuur  
Töötuba järgib **8-moodulilist järkjärgulist metoodikat**, mis viib avastamisest juurutamisoskuste omandamiseni:

| Moodul | Teema | Mida Sa Teed | Kestus |
|--------|-------|--------------|--------|
| **0. Sissejuhatus** | Töötuba ülevaade | Mõista õppimise eesmärke, eeltingimusi ja töötuba ülesehitust | 15 min |
| **1. Valik** | Mallide avastamine | Uuri AZD malle ja vali sobiv AI mall oma stsenaariumi jaoks | 20 min |
| **2. Valideerimine** | Juuruta ja kontrolli | Juuruta mall käsuga `azd up` ja valideeri infrastruktuuri toimimine | 30 min |
| **3. Lammutamine** | Võta struktuur lahti | Kasuta GitHub Copilotit malliarhitektuuri, Bicep failide ja koodi uurimiseks | 30 min |
| **4. Konfiguratsioon** | Azure.yaml süvaõpe | Õpi hallama `azure.yaml` konfiguratsiooni, elutsükli haake ja keskkonnamuutujaid | 30 min |
| **5. Kohandamine** | Tee see enda omaks | Luba AI otsing, jälgimine, hindamine ja kohanda enda stsenaariumi jaoks | 45 min |
| **6. Lõpetamine** | Puhasta | Turvaline ressursside mahavõtmine käsuga `azd down --purge` | 15 min |
| **7. Kokkuvõte** | Edasised sammud | Vaata tehtut, võtmekontseptsioonid ja jätka õpiteekonda | 15 min |

**Töötuba voog:**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 Töötuba käima saamine  
```bash
# Valik 1: GitHub Codespaces (Soovitatav)
# Klõpsake hoidlas "Code" → "Create codespace on main"

# Valik 2: Kohalik arendus
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Järgige juhiseid failis workshop/README.md
```
  
#### 🎯 Töötuba õppe tulemused  
Töötuba lõpetades osalejad:  
- **Juurutavad tootmiskõlblikke AI rakendusi**: Kasutades AZD koos Microsoft Foundry teenustega  
- **Valdavad mitmeagendi arhitektuure**: Rakendades koordineeritud AI agendi lahendusi  
- **Rakendavad turvapõhimõtteid**: Konfigureerides autentimist ja ligipääsukontrolli  
- **Optimeerivad skaleerumist**: Kujundades kulutasukaid ja jõudlusrikkaid juurutusi  
- **Tõrkeotsing juurutustes**: Lahendades iseseisvalt levinud probleemid  

#### 📖 Töötuba materjalid  
- **🎥 Interaktiivne juhend**: [Töötuba materjalid](workshop/README.md) - Brauseripõhine õpikeskkond  
- **📋 Moodulite juhendid**:  
  - [0. Sissejuhatus](workshop/docs/instructions/0-Introduction.md) - Töötuba ülevaade ja eesmärgid  
  - [1. Valik](workshop/docs/instructions/1-Select-AI-Template.md) - Leia ja vali AI mallid  
  - [2. Valideerimine](workshop/docs/instructions/2-Validate-AI-Template.md) - Juuruta ja kontrolli malle  
  - [3. Lammutamine](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Uuri malliarhitektuuri  
  - [4. Konfiguratsioon](workshop/docs/instructions/4-Configure-AI-Template.md) - Valda azure.yaml  
  - [5. Kohandamine](workshop/docs/instructions/5-Customize-AI-Template.md) - Kohanda oma stsenaariumile  
  - [6. Lõpetamine](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Puhasta ressursid  
  - [7. Kokkuvõte](workshop/docs/instructions/7-Wrap-up.md) - Ülevaade ja edasised sammud  
- **🛠️ AI töötuba labor**: [AI töötuba labor](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI keskseid harjutusi  
- **💡 Kiire stardijuhend**: [Töötuba seadistusjuhend](workshop/README.md#quick-start) - Keskkonna seadistamine

**Sobib ideaalselt**: Ettevõttesisesteks koolitusteks, ülikoolikursusteks, iseseisvaks õppimiseks ja arendajate bootcampideks.

---

## 📖 Süvitsiminev: AZD Võimalused

Põhitõdedest kaugemale minnes pakub AZD võimsad tööriistad tootmiskeskkonna juurutusteks:

- **Mallipõhised juurutused** - Kasuta valmis malle levinud rakendusmustrite jaoks  
- **Infrastruktuur kui kood** - Halda Azure ressursse Bicepi või Terraformi abil  
- **Integreeritud töövood** - Planeeri, juuruta ja jälgi rakendusi sujuvalt  
- **Arendajasõbralik** - Optimeeritud arendaja tootlikkuse ja kogemuse jaoks

### **AZD + Microsoft Foundry: Täiuslik AI juurutustele**

**Miks valida AZD AI-lahenduste jaoks?** AZD lahendab peamised AI arendajate väljakutsed:

- **AI-valmis mallid** - Eelseadistatud mallid Microsoft Foundry mudelite, Cognitive Services ja ML töökoormuste jaoks  
- **Turvalised AI juurutused** - Sisseehitatud turvamustrid AI-teenustele, API võtmetele ja mudeli lõpp-punktidele  
- **Tootmisvalmis AI mustrid** - Parimad tavad skaleeritavate, kuluefektiivsete AI rakenduste juurutamiseks  
- **Täielikud AI töövood** - Mudeli arendusest kuni tootmiseni koos jälgimisega  
- **Kulude optimeerimine** - Tark ressursside jaotamine ja skaleerimisstrateegiad AI töökoormustele  
- **Microsoft Foundry integreerimine** - Sujuv ühendus Microsoft Foundry mudelite kataloogi ja lõpp-punktidega

---

## 🎯 Mallid ja Näideteleht

### Esiletõstetud: Microsoft Foundry Mallid  
**Alusta siit, kui juurutad AI rakendusi!**

> **Märkus:** Need mallid demonstreerivad erinevaid AI mustreid. Mõned on väline Azure Samples, teised kohalikud rakendused.

| Mall | Peatükk | Tase | Teenused | Tüüp |
|----------|---------|------------|----------|------|
| [**Alustamine AI vestlusega**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Peatükk 2 | ⭐⭐ | AzureOpenAI + Azure AI mudeli inferentsi API + Azure AI Search + Azure konteinerirakendused + Application Insights | Väline |
| [**Alustamine AI agentidega**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Peatükk 2 | ⭐⭐ | Foundry agendid + AzureOpenAI + Azure AI Search + Azure konteinerirakendused + Application Insights | Väline |
| [**Azure Search + OpenAI demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Peatükk 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Väline |
| [**OpenAI Chat rakenduse kiire algus**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Peatükk 2 | ⭐ | AzureOpenAI + konteinerirakendused + Application Insights | Väline |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Peatükk 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Väline |
| [**Contoso vestlus RAG**](https://github.com/Azure-Samples/contoso-chat) | Peatükk 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + konteinerirakendused | Väline |
| [**Jahutus Multi-Agent lahendus**](examples/retail-scenario.md) | Peatükk 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + konteinerirakendused + Cosmos DB | **Kohalik** |

### Esiletõstetud: Täielikud Õppestseenid  
**Tootmisvalmis rakenduse mallid õppepeatükkide kaupa**

| Mall | Õppepeatükk | Tase | Peamine õpitulemus |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Peatükk 2 | ⭐ | Põhilised AI juurutuste mustrid |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Peatükk 2 | ⭐⭐ | RAG rakendus Azure AI Search-ga |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Peatükk 4 | ⭐⭐ | Dokumentide intelligentsi integratsioon |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Peatükk 5 | ⭐⭐⭐ | Agendi raamistik ja funktsioonide kutsumine |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Peatükk 8 | ⭐⭐⭐ | Ettevõtte AI orkestreerimine |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Peatükk 5 | ⭐⭐⭐⭐ | Mitme agendi arhitektuur kliendi ja laovõtme agentidega |

### Õppimine Näidiste Põhjal

> **📌 Kohalikud vs. Väline Näited:**  
> **Kohalikud näited** (selles hoidlas) = Valmis kohe kasutamiseks  
> **Välised näited** (Azure näited) = Kloonitavad seotud hoidlatest

#### Kohalikud näited (valmis kasutamiseks)
- [**Jahutus Multi-Agent lahendus**](examples/retail-scenario.md) - Täielik tootmisvalmis rakendus ARM mallidega  
  - Mitmeagendi arhitektuur (klient + laovõtme agendid)  
  - Üksikasjalik jälgimine ja hindamine  
  - Ühe klõpsuga juurutamine ARM malliga  

#### Kohalikud näited - konteinerirakendused (peatükid 2-5)  
**Selles hoidlas on põhjalikud konteinerijuurutuste näited:**  
- [**Konteinerirakenduse näited**](examples/container-app/README.md) - Täielik juhend konteineripõhiste juurutuste kohta  
  - [Lihtne Flask API](../../examples/container-app/simple-flask-api) - Põhiline REST API koos scale-to-zero'ga  
  - [Mikroteenuste arhitektuur](../../examples/container-app/microservices) - Tootmisvalmis mitmeteenuste juurutus  
  - Kiire algus, tootmine ja arenenud juurutusmustrid  
  - Jälgimine, turvalisus ja kulude optimeerimise juhendid  

#### Välised näited - lihtsad rakendused (peatükid 1-2)  
**Klooni need Azure näidiste hoidlad ja alusta:**  
- [Lihtne veebirakendus - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Põhilised juurutusmustrid  
- [Staatiline veebisait - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staatilise sisu juurutamine  
- [Konteinerirakendus - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API juurutus  

#### Välised näited - andmebaasi integreerimine (peatükid 3-4)  
- [Andmebaasi rakendus - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Andmebaasi ühenduvusmustrid
- [Funktsioonid + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverivabad andmevood

#### Välimised näited - Täiendatud mustrid (peatükid 4-8)
- [Java mikroteenused](https://github.com/Azure-Samples/java-microservices-aca-lab) - Mitme teenuse arhitektuurid
- [Konteinerirakenduste tööd](https://github.com/Azure-Samples/container-apps-jobs) - Taustaprotsesside töötlemine  
- [Ettevõtte ML torujuhe](https://github.com/Azure-Samples/mlops-v2) - Tootmiskõlblikud masinõppemustrid

### Välimised mallikogud
- [**Ametlik AZD malliturg**](https://azure.github.io/awesome-azd/) - Hoolikalt valitud ametlikud ja kogukonna malli- kogu
- [**Azure Developer CLI mallid**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn mallide dokumentatsioon
- [**Näidiste kaust**](examples/README.md) - Kohalikud õppimise näited koos üksikasjalike selgitustega

---

## 📚 Õppematerjalid ja viited

### Kiired viited
- [**Käskude spikker**](resources/cheat-sheet.md) - Olulised azd käsud teemade kaupa
- [**Terminoloogia**](resources/glossary.md) - Azure ja azd terminid  
- [**KKK**](resources/faq.md) - Levinud küsimused õppepeatükkide kaupa
- [**Õppejuhend**](resources/study-guide.md) - Üldised harjutused

### Praktikatuuri töötoad
- [**AI töötuba**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Loo oma AI lahendused AZD-ga juurutatavaks (2-3 tundi)
- [**Interaktiivne töötuba**](workshop/README.md) - 8-mooduline juhendatud harjutuste sari MkDocs ja GitHub Codespaces abil
  - Järgmine järjekord: Sissejuhatus → Valimine → Kinnitamine → Lagundamine → Konfigureerimine → Kohandamine → Lammutamine → Kokkuvõte

### Välimised õppematerjalid
- Azure Developer CLI dokumentatsioon
- Azure arhitektuuri keskus
- Azure hinnakalkulaator
- Azure oleku info

### AI agendi oskused sinu redaktori jaoks
- [**Microsoft Azure oskused skills.sh lehel**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 avatud AI agendi oskust Azure AI, Foundry, juurutamise, diagnostika, kulu optimeerimise jm kohta. Paigalda GitHub Copilotisse, Cursorisse, Claude Code’i või mõnda toetatud agendisse:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Kiire tõrkeotsingu juhend

**Algajate sagedased probleemid ja kohesed lahendused:**

<details>
<summary><strong>❌ "azd: käsku ei leitud"</strong></summary>

```bash
# Paigalda esmalt AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Kontrolli paigaldust
azd version
```
</details>

<details>
<summary><strong>❌ "Tellimust ei leitud" või "Tellimus pole määratud"</strong></summary>

```bash
# Loetle saadaval olevad tellimused
az account list --output table

# Määra vaikimisi tellimus
az account set --subscription "<subscription-id-or-name>"

# Määra AZD keskkonnale
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Kontrolli
az account show
```
</details>

<details>
<summary><strong>❌ "Piirmäär ületatud" või "Piiranguid pole piisavalt"</strong></summary>

```bash
# Proovi erinevat Azure'i piirkonda
azd env set AZURE_LOCATION "westus2"
azd up

# Või kasuta arenduses väiksemaid SKU-sid
# Muuda faili infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" ebaõnnestub poole peal</strong></summary>

```bash
# Valik 1: Puhasta ja proovi uuesti
azd down --force --purge
azd up

# Valik 2: Paranda ainult infrastruktuuri
azd provision

# Valik 3: Kontrolli detailset olekut
azd show

# Valik 4: Kontrolli Azure Monitori logisid
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentimine ebaõnnestus" või "Token on aegunud"</strong></summary>

```bash
# Autendi uuesti AZD jaoks
azd auth logout
azd auth login

# Valikuline: uuenda ka Azure CLI, kui kasutad az käske
az logout
az login

# Kontrolli autentimist
az account show
```
</details>

<details>
<summary><strong>❌ "Resurss on juba olemas" või nimemajanduse konfliktid</strong></summary>

```bash
# AZD genereerib unikaalseid nimesid, kuid kui tekib konflikt:
azd down --force --purge

# Siis proovi uuesti uue keskkonnaga
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Malli juurutamine võtab liiga kaua aega</strong></summary>

**Tavalised ooteajad:**
- Lihtne veebirakendus: 5-10 minutit
- Rakendus andmebaasiga: 10-15 minutit
- AI rakendused: 15-25 minutit (OpenAI ettevalmistamine on aeglane)

```bash
# Kontrolli edenemist
azd show

# Kui kinni >30 minutit, kontrolli Azure Portaal:
azd monitor --overview
# Otsi ebaõnnestunud juurutusi
```
</details>

<details>
<summary><strong>❌ "Luba puudub" või "Keelatud"</strong></summary>

```bash
# Kontrolli oma Azure rolli
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Sul peab olema vähemalt "Contributor" roll
# Palu oma Azure administraatoril anda:
# - Contributor (ressursside jaoks)
# - User Access Administrator (rolli määramiste jaoks)
```
</details>

<details>
<summary><strong>❌ Juhtunud rakenduse URL-i ei leita</strong></summary>

```bash
# Näita kõiki teenuse otspunktid
azd show

# Või ava Azure portaal
azd monitor

# Kontrolli konkreetset teenust
azd env get-values
# Otsi *_URL muutujad
```
</details>

### 📚 Täielikud tõrkeotsingu ressursid

- **Levinud probleemide juhend:** [Põhjalikud lahendused](docs/chapter-07-troubleshooting/common-issues.md)
- **Spetsiifilised AI probleemid:** [AI tõrkeotsing](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Silumise juhend:** [Samm-sammuline silumine](docs/chapter-07-troubleshooting/debugging.md)
- **Saage abi:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursuse lõpetamine ja sertifitseerimine

### Edusammude jälgimine
Jälgi oma õppe edenemist peatükkide kaupa:

- [ ] **1. peatükk**: Alused ja kiire algus ✅
- [ ] **2. peatükk**: AI-esimene arendus ✅  
- [ ] **3. peatükk**: Konfigureerimine ja autentimine ✅
- [ ] **4. peatükk**: Infrastruktuur koodina ja juurutamine ✅
- [ ] **5. peatükk**: Mitmeagendi AI lahendused ✅
- [ ] **6. peatükk**: Eeljuurutuse valideerimine ja planeerimine ✅
- [ ] **7. peatükk**: Tõrkeotsing ja silumine ✅
- [ ] **8. peatükk**: Tootmine ja ettevõtete mustrid ✅

### Õppimise kontroll
Pärast iga peatüki lõpetamist testi oma teadmisi:
1. **Praktiline ülesanne**: Lõpeta peatüki käed-küljes juurutamine
2. **Teadmiste kontroll**: Vaata peatüki KKK sektsiooni
3. **Kogukonna arutelu**: Jaga kogemusi Azure Discordis
4. **Järgmine peatükk**: Liigu järgmisele keerukuse tasemele

### Kursuse lõpetamise eelised
Kõigi peatükkide lõpetamisel oled:
- **Tootmiskogemus**: Juurutanud päris AI rakendusi Azure’i
- **Professionaalsed oskused**: Ettevõttele sobivad juurutusvõimed  
- **Kogukonna tunnustus**: Aktiivne Azure arendajate kogukonna liige
- **Karjääri areng**: Nõutud AZD ja AI juurutamise pädevus

---

## 🤝 Kogukond ja tugi

### Abi ja tugi
- **Tehnilised probleemid**: [Teata vigadest ja esita funktsioonisoove](https://github.com/microsoft/azd-for-beginners/issues)
- **Õppe küsimused**: [Microsoft Azure discord kogukond](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-spetsiifiline abi**: Liitu [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentatsioon**: [Ametlik Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Kogukonna ülevaated Microsoft Foundry Discordist

**Hiljutised küsitluse tulemused #Azure kanalist:**
- **45%** arendajatest tahab kasutada AZD-d AI töökoormuste jaoks
- **Peamised väljakutsed**: Mitme teenuse juurutamine, volituste haldamine, tootmiskõlblikkus  
- **Sagedasemad soovid**: AI-spetsiifilised mallid, tõrkeotsingu juhendid, parimad praktikad

**Liitu meie kogukonnaga, et:**
- Jagada AZD + AI kogemusi ja saada abi
- Saada varajasi eelvaateid uutest AI mallidest
- Panustada AI juurutamise parimatesse praktikatesse
- Mõjutada tulevasi AI + AZD funktsioone

### Kursuse panustamine
Ootame panuseid! Palun loe meie [panustamise juhendit](CONTRIBUTING.md), kus on info:
- **Sisu täiustused**: olemasolevate peatükkide ja näidiste parandamine
- **Uued näited**: lisa reaalelulisi stsenaariume ja malle  
- **Tõlkimine**: aita hoida mitmekeelsust
- **Vigade teated**: täpsuse ja selguse parendamine
- **Kogukonna reeglid**: järgi kaasava kogukonna juhiseid

---

## 📄 Kursuse info

### Litsents
See projekt on litsentseeritud MIT litsentsi alusel - vaata [LICENSE](../../LICENSE) faili detailsuste jaoks.

### Seotud Microsoft Learning ressursid

Meie meeskond toodab veel põhjalikke õppematerjale:

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
[![AI agendid algajatele](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatiivse AI sari
[![Generatiivne AI algajatele](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatiivne AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatiivne AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatiivne AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Põhiõpe
[![Masinõpe algajatele](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Andmeteadus algajatele](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Tehisintellekt algajatele](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Küberkaitse algajatele](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Veebiarendus algajatele](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT algajatele](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR arendus algajatele](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot sari
[![Copilot tehisintellekti paarisprogrammeerimiseks](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET-i jaoks](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot seiklus](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursuse navigeerimine

**🚀 Valmis õppima hakkama?**

**Algajad**: Alusta [1. peatükk: Alused ja kiire algus](#-chapter-1-foundation--quick-start)  
**Tehisintellektil põhinevad arendajad**: Hüpake [2. peatükk: AI esmane arendus](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Kogenud arendajad**: Alusta [3. peatükk: Konfiguratsioon ja autentimine](#️-chapter-3-configuration--authentication)

**Järgmised sammud**: [Alusta peatükki 1 - AZD põhialused](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud tehisintellekti tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi me püüame tagada täpsust, olge palun teadlik, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument omakeeles tuleks pidada autoriteetseks allikaks. Kriitilise tähtsusega info puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud arusaamatuste ega valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->