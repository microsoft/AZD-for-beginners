# AZD Algajatele: Struktureeritud Õppeprogramm

![AZD-for-beginners](../../translated_images/et/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automaatne Tõlge (Alati Uuendatud)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](./README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Eelistad kloonimist lokaalselt?**
>
> See hoidla sisaldab üle 50 keele tõlkeid, mis suurendab allalaadimise mahtu. Tõlgeteta kloonimiseks kasuta sparse checkouti:
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

## 🚀 Mis on Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** on arendajasõbralik käsureatööriist, mis teeb rakenduste juurutamise Azure’i lihtsaks. Selle asemel, et käsitsi luua ja ühendada kümneid Azure’i ressursse, saad terviklikud rakendused käivitada ühe käsuga.

### `azd up` maagia

```bash
# See üks käsk teeb kõike:
# ✅ Loob kõik Azure'i ressursid
# ✅ Seadistab võrgu ja turvalisuse
# ✅ Koostab teie rakenduse koodi
# ✅ Paigaldab Azure'i keskkonda
# ✅ Annab teile toimiva URL-i
azd up
```

**Nii lihtne see ongi!** Pole vaja Azure Portaali klikkida, keerukaid ARM-malle õppida ega käsitsi seadistada – lihtsalt töötavad rakendused Azure’is.

---

## ❓ Azure Developer CLI vs Azure CLI: Mis vahe on?

See on kõige sagedamini esitatav küsimus algajate poolt. Siin on lihtne vastus:

| Omadus | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Eesmärk** | Individuaalsete Azure’i ressursside haldamine | Täielike rakenduste juurutamine |
| **Mõtteviis** | Infrastruktuurikeskne | Rakendusekeskne |
| **Näide** | `az webapp create --name myapp...` | `azd up` |
| **Õppimiskõver** | Tuleb tunda Azure’i teenuseid | Piisab rakendusest teada |
| **Parim** | DevOps, infrastruktuur | Arendajad, prototüüpimine |

### Lihtne Võrdlus

- **Azure CLI** on nagu kõik tööriistad maja ehitamiseks – haamrid, saed, naelad. Võid kõike ehitada, aga pead ehitust tundma.
- **Azure Developer CLI** on nagu ehitusmees palkamine – kirjeldad, mida tahad, ja nemad ehitavad.

### Millal mida kasutada

| Situatsioon | Kasuta seda |
|----------|----------|
| "Tahan kiiresti veebirakendust juurutada" | `azd up` |
| "Vajan ainult salvestuskonto loomist" | `az storage account create` |
| "Loon täismahus AI-rakendust" | `azd init --template azure-search-openai-demo` |
| "Vajan konkreetse Azure’i ressursi silumist" | `az resource show` |
| "Tahan tootmiseks valmis juurutust minutitega" | `azd up --environment production` |

### Nad Töötavad Koos!

AZD kasutab taustal Azure CLI-d. Võid kasutada mõlemaid:
```bash
# Juuruta oma rakendus AZD-iga
azd up

# Seejärel häälesta konkreetseid ressursse Azure CLI abil
az webapp config set --name myapp --always-on true
```

---

## 🌟 Leia Malleid Awesome AZD-st

Ära alusta nullist! **Awesome AZD** on kogukonna kogu valmis juurutatavaid malle:

| Ressurss | Kirjeldus |
|----------|-------------|
| 🔗 [**Awesome AZD galerii**](https://azure.github.io/awesome-azd/) | Sirvi 200+ malli ühe klõpsuga juurutamiseks |
| 🔗 [**Esita mall**](https://github.com/Azure/awesome-azd/issues) | Panusta oma mall kogukonda |
| 🔗 [**GitHub Hoidla**](https://github.com/Azure/awesome-azd) | Hinda ja avasta lähtekoodi |

### Populaarsed AI mallid Awesome AZD-st

```bash
# RAG-vestlus Azure OpenAI + AI Searchiga
azd init --template azure-search-openai-demo

# Kiire tehisintellekti vestlusrakendus
azd init --template openai-chat-app-quickstart

# Tehisintellekti agendid koos Foundry Agentsiga
azd init --template get-started-with-ai-agents
```

---

## 🎯 Alusta 3 Sammuga

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

### Samm 2: Logi Azure’i sisse

```bash
azd auth login
```

### Samm 3: Juuruta esimene rakendus

```bash
# Algata mallist
azd init --template todo-nodejs-mongo

# Paigalda Azure'i (loob kõik!)
azd up
```

**🎉 Valmis!** Sinu rakendus töötab nüüd Azure’is.

### Puhastamine (Ära unusta!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kuidas seda Kursust Kasutada

See kursus on mõeldud **järkjärguliseks õppimiseks** - alusta seal, kus tunned end mugavalt, ja liigu edasi:

| Sinu kogemus | Alusta siit |
|-----------------|------------|
| **Täiesti uus Azure’is** | [1. peatükk: Alused](../..) |
| **Tundsid Azure’i, uus azd-s** | [1. peatükk: Alused](../..) |
| **Tahad juurutada AI-rakendusi** | [2. peatükk: AI-esmane arendus](../..) |
| **Tahad praktilist kogemust** | [🎓 Interaktiivne Töötuba](workshop/README.md) - 3-4-tunnine juhendatud labor |
| **Vajan tootmismustreid** | [8. peatükk: Tootmine ja ettevõtte mustrid](../..) |

### Kiire Seadistus

1. **Forki see hoidla**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klooni see**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Küsi abi**: [Azure Discordi kogukond](https://discord.com/invite/ByRwuEEgH4)

> **Eelistad kloonimist lokaalselt?**

> See hoidla sisaldab üle 50 keele tõlkeid, mis suurendab allalaadimise mahtu. Tõlgeteta kloonimiseks kasuta sparse checkouti:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> See annab sulle kõik vajaliku kursuse läbimiseks palju kiirema allalaadimisega.


## Kursuse Ülevaade

Valda Azure Developer CLI (azd) läbi struktureeritud peatükkide, mis on mõeldud järkjärguliseks õppimiseks. **Eriline rõhuasetus AI-rakenduste juurutamisele Microsoft Foundry integratsiooniga.**

### Miks see kursus on kaasaegsetele arendajatele oluline

Põhinedes Microsoft Foundry Discordi kogukonna sisendil, **45% arendajatest soovib AZD-d kasutada AI töökoormuste jaoks**, kuid kogeb keerukusi:
- Mitme teenuse AI arhitektuuride keerukus
- Tootmisvalmiduse AI juurutuse parimad tavad  
- Azure AI teenuste integratsioon ja konfiguratsioon
- AI töölaste maksumuse optimeerimine
- AI-spetsiifiliste juurutusvigade tõrkeotsing

### Õpieesmärgid

Selle struktureeritud kursuse lõpetamisel oskad:
- **Valda AZD Põhitõdesid**: Tuumikontseptsioonid, paigaldus ja seadistamine
- **Juuruta AI-rakendusi**: Kasuta AZD-d Microsoft Foundry teenustega
- **Rakenda infrastruktuuri koodina**: Halda Azure’i ressursse Bicep mallidega
- **Tee veaparandus**: Lahenda levinumaid probleeme ja silu tõrkeid
- **Optimeeri tootmiseks**: Turvalisus, skaleerimine, monitooring ja kulude juhtimine
- **Ehita mitmeagendi lahendusi**: Juuruta keerukaid AI arhitektuure

## 🗺️ Kursuse Kaart: Kiire Navigeerimine Peatükkide Kaupa

Igal peatükil on pühendatud README koos õpieesmärkide, kiirete alguste ja harjutustega:

| Peatükk | Teema | Õppetunnid | Kestus | Keerukus |
|---------|-------|---------|----------|------------|
| **[1. peatükk: Alused](docs/chapter-01-foundation/README.md)** | Alustamine | [AZD Põhisõnad](docs/chapter-01-foundation/azd-basics.md) &#124; [Paigaldus](docs/chapter-01-foundation/installation.md) &#124; [Esimene projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[2. peatükk: AI arendus](docs/chapter-02-ai-development/README.md)** | AI-esimesed rakendused | [Foundry integratsioon](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agendid](docs/chapter-02-ai-development/agents.md) &#124; [Mudeli juurutus](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Töötuba](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 tundi | ⭐⭐ |
| **[3. peatükk: Seadistamine](docs/chapter-03-configuration/README.md)** | Autentimine ja turvalisus | [Seadistamine](docs/chapter-03-configuration/configuration.md) &#124; [Autentimine ja turvalisus](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[4. peatükk: Infrastruktuur](docs/chapter-04-infrastructure/README.md)** | IaC & Deployimine | [Deployimise juhend](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 tundi | ⭐⭐⭐ |
| **[5. peatükk: Mitme agente lahendus](docs/chapter-05-multi-agent/README.md)** | AI agentide lahendused | [Jaemüügi stsenaarium](examples/retail-scenario.md) &#124; [Koordineerimise mustrid](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 tundi | ⭐⭐⭐⭐ |
| **[6. peatükk: Eelkõige deployimiseks](docs/chapter-06-pre-deployment/README.md)** | Planeerimine & valideerimine | [Eelkõige kontrollid](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Mahutavuse planeerimine](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU valik](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 tund | ⭐⭐ |
| **[7. peatükk: Tõrkeotsing](docs/chapter-07-troubleshooting/README.md)** | Silumise & parandamise juhised | [Tavalised probleemid](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Silumine](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI probleemid](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 tundi | ⭐⭐ |
| **[8. peatükk: Tootmiskeskkond](docs/chapter-08-production/README.md)** | Ettevõtte mustrid | [Tootmise tavad](docs/chapter-08-production/production-ai-practices.md) | 2-3 tundi | ⭐⭐⭐⭐ |
| **[🎓 Töötuba](workshop/README.md)** | Praktiline labor | [Sissejuhatus](workshop/docs/instructions/0-Introduction.md) &#124; [Valik](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Valideerimine](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Lahtipakkimine](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigureerimine](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Kohandamine](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Lammutamine](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Kokkuvõte](workshop/docs/instructions/7-Wrap-up.md) | 3-4 tundi | ⭐⭐ |

**Kogu kursuse kestus:** ~10-14 tundi | **Oskuste areng:** Algaja → Tootmiseks valmis

---

## 📚 Õppe peatükid

*Vali oma õppimise tee vastavalt kogemustele ja eesmärkidele*

### 🚀 1. peatükk: Põhialused ja kiire algus
**Eeldused**: Azure tellimus, põhitõed käsureal  
**Kestus**: 30-45 minutit  
** keerukus**: ⭐

#### Mida õpid
- Azure Developer CLI põhialuste mõistmine
- AZD installimine oma platvormile
- Esimese edukalt deployitud rakenduse loomine

#### Õppematerjalid
- **🎯 Alusta siit**: [Mis on Azure Developer CLI?](../..)
- **📖 Teooria**: [AZD põhialused](docs/chapter-01-foundation/azd-basics.md) - Põhimõisted ja terminid
- **⚙️ Seadistus**: [Installatsioon ja seadistamine](docs/chapter-01-foundation/installation.md) - Platvormispetsiifilised juhised
- **🛠️ Praktiline juhend**: [Sinu esimene projekt](docs/chapter-01-foundation/first-project.md) - Samm-sammult juhend
- **📋 Kiirviide**: [Käsu spikker](resources/cheat-sheet.md)

#### Praktilised harjutused
```bash
# Kiire installeerimise kontroll
azd version

# Paigaldage oma esimene rakendus
azd init --template todo-nodejs-mongo
azd up
```

**💡 Peatüki tulemus**: Edukas lihtsa veebirakenduse deploymine Azure'i AZD abil

**✅ Edu kinnitamine:**
```bash
# Pärast esimese peatüki lõpetamist peaksid saama:
azd version              # Kuvab installitud versiooni
azd init --template todo-nodejs-mongo  # Algatab projekti
azd up                  # Paigaldab Azure'i
azd show                # Kuvab käitava rakenduse URL-i
# Rakendus avaneb brauseris ja töötab
azd down --force --purge  # Puhastab ressursid
```

**📊 Ajakulu:** 30-45 minutit  
**📈 Oskustase pärast:** Suudab iseseisvalt põhirakendusi deploydada

**✅ Edu kinnitamine:**
```bash
# Pärast 1. peatüki läbimist peaksid olema võimeline:
azd version              # Kuvab paigaldatud versiooni
azd init --template todo-nodejs-mongo  # Algatab projekti
azd up                  # Paigaldab Azure'i
azd show                # Kuvab töötava rakenduse URL-i
# Rakendus avaneb brauseris ja töötab
azd down --force --purge  # Puhastab ressursid
```

**📊 Ajakulu:** 30-45 minutit  
**📈 Oskustase pärast:** Suudab iseseisvalt põhirakendusi deploydada

---

### 🤖 2. peatükk: AI-esimene arendus (Soovitatav AI arendajatele)
**Eeldused**: Peatükk 1 läbitud  
**Kestus**: 1-2 tundi  
** keerukus**: ⭐⭐

#### Mida õpid
- Microsoft Foundry integratsioon AZD-ga
- AI-d toetavate rakenduste deploymine
- AI teenuste konfiguratsioonide mõistmine

#### Õppematerjalid
- **🎯 Alusta siit**: [Microsoft Foundry integratsioon](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agendid**: [AI agentide juhend](docs/chapter-02-ai-development/agents.md) - Nutikate agentide deploymine AZD-ga
- **📖 Mustrid**: [AI mudelite deploymine](docs/chapter-02-ai-development/ai-model-deployment.md) - AI mudelite haldamine ja deploymine
- **🛠️ Töötuba**: [AI töötuba](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee oma AI lahendused AZD-valmis
- **🎥 Interaktiivne juhend**: [Töötuba materjalid](workshop/README.md) - Brauseripõhine õppimine koos MkDocs * DevContainer keskkonnaga
- **📋 Mallid**: [Microsoft Foundry mallid](../..)
- **📝 Näited**: [AZD deployimise näited](examples/README.md)

#### Praktilised harjutused
```bash
# Käivitage oma esimene tehisintellekti rakendus
azd init --template azure-search-openai-demo
azd up

# Proovige täiendavaid tehisintellekti malle
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Peatüki tulemus**: Deploy ja konfigureeri AI-põhine vestlusrakendus, millel on RAG võimed

**✅ Edu kinnitamine:**
```bash
# Pärast 2. peatükki peaksite suutma:
azd init --template azure-search-openai-demo
azd up
# Testida tehisintellekti jutuliidest
# Esitada küsimusi ja saada tehisintellekti toetatud vastuseid viidetega
# Kontrollida, et otsingute integratsioon töötab
azd monitor  # Kontrollida, et Application Insights kuvab telemeetriat
azd down --force --purge
```

**📊 Ajakulu:** 1-2 tundi  
**📈 Oskustase pärast:** Suudab deploydada ja konfigureerida tootmiskõlblikke AI rakendusi  
**💰 Kulu teadlikkus:** Mõista $80-150/kuus arendusõigusi, $300-3500/kuus tootmiskulusid

#### 💰 Kulude kaalumine AI deploymiste jaoks

**Arenduskeskkond (Hinnanguliselt $80-150/kuus):**
- Azure OpenAI (makse kasutuse järgi): $0-50/kuus (sõltuvalt tokeni kasutusest)
- AI otsing (Basic tasand): $75/kuus
- Container Apps (tarbimise põhine): $0-20/kuus
- Salvestus (Standard): $1-5/kuus

**Tootmiskeskkond (Hinnanguliselt $300-3,500+/kuus):**
- Azure OpenAI (PTU stabiilseks jõudluseks): $3,000+/kuus VÕI makse kasutuse järgi suure mahu korral
- AI otsing (Standard tasand): $250/kuus
- Container Apps (pühendatud): $50-100/kuus
- Application Insights: $5-50/kuus
- Salvestus (Premium): $10-50/kuus

**💡 Kulu optimeerimise näpunäited:**
- Kasuta **tasuta Azure OpenAI taset** õppimiseks (sh 50,000 tokenit kuus)
- Käivita `azd down` ressursside vabastamiseks, kui ei arenda aktiivselt
- Alusta tarbimisepõhisest arvestusest, uuenda PTU-le ainult tootmiseks
- Kasuta `azd provision --preview`, et enne deployd hinnangut saada
- Luba automaatne skaaleerimine: maksa ainult tegeliku kasutuse eest

**Kulu jälgimine:**
```bash
# Kontrolli hinnangulisi kuukulusid
azd provision --preview

# Jälgi tegelikke kulusid Azure’i portaalis
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3. peatükk: Konfiguratsioon ja autentimine
**Eeldused**: Peatükk 1 läbitud  
**Kestus**: 45-60 minutit  
** keerukus**: ⭐⭐

#### Mida õpid
- Keskkondade konfiguratsioon ja haldamine
- Autentimise ja turvalisuse parimad tavad
- Ressursside nimetamistavade ja organiseerimise põhimõtted

#### Õppematerjalid
- **📖 Konfiguratsioon**: [Konfiguratsiooni juhend](docs/chapter-03-configuration/configuration.md) - Keskkonna seadistamine
- **🔐 Turvalisus**: [Autentimise mustrid ja hallatav identiteet](docs/chapter-03-configuration/authsecurity.md) - Autentimismustrid
- **📝 Näited**: [Andmebaasi rakenduse näide](examples/database-app/README.md) - AZD andmebaasi näited

#### Praktilised harjutused
- Mitu keskkonda konfigureerimine (arendus, staging, tootmine)
- Hallatava identiteedi autentimise seadistamine
- Keskkonnapõhiste konfiguratsioonide rakendamine

**💡 Peatüki tulemus**: Halda mitut keskkonda koos nõuetekohase autentimise ja turvalisusega

---

### 🏗️ 4. peatükk: Infrastruktuur koodina & deployimine
**Eeldused**: Peatükid 1-3 läbitud  
**Kestus**: 1-1.5 tundi  
** keerukus**: ⭐⭐⭐

#### Mida õpid
- Täiustatud deployimise mustrid
- Infrastruktuur koodina Bicep abil
- Ressursside provisjonimise strateegiad

#### Õppematerjalid
- **📖 Deployimine**: [Deployimise juhend](docs/chapter-04-infrastructure/deployment-guide.md) - Täielikud töövood
- **🏗️ Provisioning**: [Resursside provisjonimine](docs/chapter-04-infrastructure/provisioning.md) - Azure ressursihaldus
- **📝 Näited**: [Container App näide](../../examples/container-app) - konteineripõhised deployd

#### Praktilised harjutused
- Kohandatud Bicep mallide loomine
- Mitme teenuse rakenduste deploymine
- Sinine-roheline deployimise strateegiate rakendamine

**💡 Peatüki tulemus**: Deploy keerukaid mitme teenusega rakendusi kasutades kohandatud infrastruktuurimalle

---

### 🎯 5. peatükk: Mitme agendiga AI lahendused (edasijõudnutele)
**Eeldused**: Peatükid 1-2 läbitud  
**Kestus**: 2-3 tundi  
** keerukus**: ⭐⭐⭐⭐

#### Mida õpid
- Mitme agendi arhitektuuri mustrid
- Agentide orkestreerimine ja koordineerimine
- Tootmiskõlblike AI deploymiste tegemine

#### Õppematerjalid
- **🤖 Esiletõstetud projekt**: [Jaemüügi mitme agenti lahendus](examples/retail-scenario.md) - Täielik teostus
- **🛠️ ARM mallid**: [ARM malli pakett](../../examples/retail-multiagent-arm-template) - Ühe klikiga deploy
- **📖 Arhitektuur**: [Mitme agendi koordineerimise mustrid](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mustrid

#### Praktilised harjutused
```bash
# Paigaldage täielik jaemüügi mitmeagendi lahendus
cd examples/retail-multiagent-arm-template
./deploy.sh

# Uurige agendi konfiguratsioone
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Peatüki tulemus**: Deploy ja halda tootmiskõlblikku mitme agendi AI lahendust koos kliendi ja inventuuri agentidega

---

### 🔍 6. peatükk: Eelkõige deployimiseks valideerimine & planeerimine
**Eeldused**: Peatükk 4 läbitud  
**Kestus**: 1 tund  
** keerukus**: ⭐⭐

#### Mida õpid
- Mahutavuse planeerimine ja ressursside valideerimine
- SKU valiku strateegiad
- Pre-flight kontrollid ja automatiseerimine

#### Õppematerjalid
- **📊 Planeerimine**: [Mahutavuse planeerimine](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressursside valideerimine
- **💰 Valik**: [SKU valik](docs/chapter-06-pre-deployment/sku-selection.md) - Kulutõhusad valikud
- **✅ Kinnitamine**: [Pre-flight kontrollid](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiseeritud skriptid

#### Praktilised harjutused
- Käivita mahutavuse valideerimise skripte
- Optimeeri SKU valikuid kulude jaoks
- Rakenda automatiseeritud eelkõike deployimise kontrollid

**💡 Peatüki tulemus**: Valideeri ja optimeeri deploymisi enne nende käivitamist

---

### 🚨 7. peatükk: Tõrkeotsing ja silumine
**Eeldused**: Igasugune deployimise peatükk läbitud  
**Kestus**: 1-1.5 tundi  
** keerukus**: ⭐⭐

#### Mida õpid
- Süsteemsed silumise lähenemised
- Levinud probleemid ja lahendused
- AI-spetsiifiline tõrkeotsing

#### Õppematerjalid
- **🔧 Levinud probleemid**: [Tavalised probleemid](docs/chapter-07-troubleshooting/common-issues.md) - KKK ja lahendused
- **🕵️ Silumine**: [Silumise juhend](docs/chapter-07-troubleshooting/debugging.md) - Samm-sammult strateegiad
- **🤖 AI probleemid**: [AI-spetsiifiline tõrkeotsing](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI teenuste probleemid

#### Praktilised harjutused
- Diagnostika deploy ebaõnnestumiste korral
- Autentimisküsimuste lahendamine
- AI teenuste ühenduvuse silumine

**💡 Peatüki tulemus**: Iseseisvalt diagnoosi ja lahenda tavalisi deploymiste probleeme

---

### 🏢 8. peatükk: Tootmine ja ettevõtte mustrid
**Eeldused**: Peatükid 1-4 läbitud  
**Kestus**: 2-3 tundi  
** keerukus**: ⭐⭐⭐⭐

#### Mida õpid
- Tootmise deployimise strateegiad
- Ettevõtte turvalisuse mustrid
- Jälgimine ja kulude optimeerimine

#### Õppematerjalid
- **🏭 Tootmine**: [Tootmise AI parimad praktikad](docs/chapter-08-production/production-ai-practices.md) - Ettevõtte mustrid
- **📝 Näited**: [Mikroteenuste näide](../../examples/microservices) - Keerukad arhitektuurid
- **📊 Jälgimine**: [Application Insights integratsioon](docs/chapter-06-pre-deployment/application-insights.md) - Jälgimine

#### Praktilised harjutused
- Rakenda ettevõtte turvalisuse mustreid
- Sea üles terviklik jälgimine
- Deploy tootele vastavalt heale haldamisele

**💡 Peatüki tulemus**: Deploy ettevõttevalmis rakendusi täielike tootmisvõimalustega

---

## 🎓 Töötuba: Praktiline õppimiskogemus

> **⚠️ TÖÖTOA STAATUS: Aktiivses arenduses**  

> Töötubade materjalid on praegu arendamisel ja täiustamisel. Põhimoodulid töötavad, kuid mõned arenenumad osad on pooleli. Töötame aktiivselt kogu sisu lõpetamiseks. [Jälgi edenemist →](workshop/README.md)

### Interaktiivsed töötubade materjalid
**Kõikehõlmav praktiline õppimine brauseripõhiste tööriistade ja juhendatud harjutustega**

Meie töötubade materjalid pakuvad struktureeritud ja interaktiivset õpikogemust, mis täiendab ülalkirjeldatud peatükipõhist õppekava. Töötuba on mõeldud nii iseseisvaks õppeks kui ka juhendaja juhtimisel toimuvateks sessioonideks.

#### 🛠️ Töötubade omadused
- **Brauseripõhine liides**: Täielik MkDocs-põhine töötuba koos otsingu, kopeerimise ja temaatika funktsioonidega
- **GitHub Codespaces integratsioon**: Arenduskeskkonna seadistamine ühe klõpsuga
- **Struktureeritud õppeplaan**: 8-mooduline juhendatud harjutuste seeria (kokku 3–4 tundi)
- **Järkjärguline metoodika**: Sissejuhatus → Valik → Kinnitamine → Lühenemine → Konfigureerimine → Kohandamine → Lakkevõtt → Kokkuvõte
- **Interaktiivne DevContainer keskkond**: Eelkonfigureeritud tööriistad ja sõltuvused

#### 📚 Töötubade mooduli struktuur
Töötuba järgib **8-moodulilist järkjärgulist metoodikat**, mis viib teid avastamisest juurutamise meistrini:

| Moodul | Teema | Mida teete | Kestus |
|--------|-------|------------|---------|
| **0. Sissejuhatus** | Töötuba ülevaade | Mõistke õpieesmärke, eeldusi ja töötuba struktuuri | 15 min |
| **1. Valik** | Malli avastamine | Avastage AZD malli ja valige õige AI mall teie stsenaariumi jaoks | 20 min |
| **2. Kinnitamine** | Juurutamine ja kontrollimine | Juurutage mall käsuga `azd up` ja kinnitage infrastruktuuri töökindlus | 30 min |
| **3. Lühenemine** | Struktuuri mõistmine | Kasutage GitHub Copilot'i, et uurida malli arhitektuuri, Bicep faile ja koodi korraldust | 30 min |
| **4. Konfigureerimine** | azure.yaml süvaõpe | Valdage `azure.yaml` konfiguratsiooni, elutsükli konksusid ja keskkonnamuutujaid | 30 min |
| **5. Kohandamine** | Tee see enda omaks | Lülitage sisse AI otsing, jälgimine, hindamine ja kohandage oma stsenaariumi jaoks | 45 min |
| **6. Lakkevõtt** | Puhastamine | Turvaliselt vabastage ressursid käsuga `azd down --purge` | 15 min |
| **7. Kokkuvõte** | Järgmised sammud | Vaadake üle saavutused, peamised mõisted ja jätkake õppeteekonda | 15 min |

**Töötuba voog:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Töötuba alustamine
```bash
# Variant 1: GitHub Codespaces (Soovituslik)
# Klõpsa "Code" → "Create codespace on main" hoidlas

# Variant 2: Kohalik arendus
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Järgi seadistamise juhiseid failis workshop/README.md
```

#### 🎯 Töötuba õpitulemused
Töötuba lõpetades osalejad:
- **Juurutavad tootmisvalmis AI-rakendusi**: Kasutades AZD-d koos Microsoft Foundry teenustega
- **Valdavad mitmeagendi arhitektuurid**: Rakendades koordineeritud AI agentide lahendusi
- **Rakendavad turvalisuse parimaid tavasid**: Konfigureerivad autentimist ja juurdepääsukontrolli
- **Optimeerivad skaleerimist**: Kujundavad kuluefektiivseid ning efektiivseid juurutusi
- **Lahendavad juurutusprobleeme**: Iseseisvalt tavapäraseid probleeme lahendavad

#### 📖 Töötuba ressursid
- **🎥 Interaktiivne juhend**: [Töötuba materjalid](workshop/README.md) - Brauseripõhine õppekeskkond
- **📋 Moodulipõhised juhised**:
  - [0. Sissejuhatus](workshop/docs/instructions/0-Introduction.md) - Töötuba ülevaade ja eesmärgid
  - [1. Valik](workshop/docs/instructions/1-Select-AI-Template.md) - AI mallide leidmine ja valimine
  - [2. Kinnitamine](workshop/docs/instructions/2-Validate-AI-Template.md) - Mallide juurutamine ja kontrollimine
  - [3. Lühenemine](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Malli arhitektuuri uurimine
  - [4. Konfigureerimine](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml valdamine
  - [5. Kohandamine](workshop/docs/instructions/5-Customize-AI-Template.md) - Kohandamine oma stsenaariumi jaoks
  - [6. Lakkevõtt](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ressursside vabastamine
  - [7. Kokkuvõte](workshop/docs/instructions/7-Wrap-up.md) - Ülevaade ja järgmised sammud
- **🛠️ AI töötuba labor**: [AI töötuba labor](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-kesksetele harjutustele
- **💡 Kiirkäivitamise juhend**: [Töötuba seadistusjuhend](workshop/README.md#quick-start) - Keskkonna konfigureerimine

**Ideaalselt sobib**: Ettevõtte koolitustele, ülikooli kursustele, iseseisvaks õppeks ja arendajate laagrisse.

---

## 📖 Süvaõpe: AZD võimalused

Põhitõdede kõrval pakub AZD võimsaid funktsioone tootmisjuurutusteks:

- **Mallipõhised juurutused** - Kasuta eelvalmis malle levinud rakenduse mustrite jaoks
- **Infrastruktuur kui kood** - Halda Azure ressursse Bicepi või Terraformiga  
- **Integreeritud töövood** - Rakenduste sujuv ettevalmistamine, juurutamine ja jälgimine
- **Arendajasõbralik** - Optimeeritud arendaja tootlikkuseks ja kogemuseks

### **AZD + Microsoft Foundry: Täiuslik AI juurutuste jaoks**

**Miks valida AZD AI lahenduste jaoks?** AZD lahendab AI arendajate peamised väljakutsed:

- **AI-valmis mallid** - Eelkonfigureeritud mallid Azure OpenAI, Cognitive Services ja ML töökoormuste jaoks
- **Turvalised AI juurutused** - Sisseehitatud turvapõhimõtted AI teenustele, API võtmetele ja mudeli lõpp-punktidele  
- **Tootmisvalmis AI mustrid** - Parimad tavad skaleeritavate, kuluefektiivsete AI-rakenduste juurutamiseks
- **Täielikud AI töövood** - Mudelite arendusest tootmiseni koos nõuetekohase monitooringuga
- **Kulu optimeerimine** - Tark ressursside jaotus ja skaleerimisstrateegiad AI töökoormustele
- **Microsoft Foundry integratsioon** - Sujuv ühendus Microsoft Foundry mudelikataloogi ja lõpp-punktidega

---

## 🎯 Mallid ja näidiskogu

### Esile tõstetud: Microsoft Foundry mallid
**Alusta siit, kui juurutad AI-rakendusi!**

> **Märkus:** Need mallid demonstreerivad erinevaid AI mustreid. Mõned on Azure näited välisteegidena, teised kohalikud rakendused.

| Mall | Peatükk | Keerukus | Teenused | Tüüp |
|----------|---------|------------|----------|------|
| [**Alusta AI-vestlusega**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Peatükk 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Välis |
| [**Alusta AI agentidega**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Peatükk 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Välis |
| [**Azure Search + OpenAI demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Peatükk 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Välis |
| [**OpenAI Chat App kiirkäivitus**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Peatükk 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Välis |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Peatükk 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Välis |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Peatükk 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Välis |
| [**Jaemüügimituagendi lahendus**](examples/retail-scenario.md) | Peatükk 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Kohalik** |

### Esiletõstetud: Täielikud õppestseenid
**Tootmisvalmis rakenduse mallid seotud õppepeatükkidega**

| Mall | Õppepeatükk | Keerukus | Peamine õppetulemus |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Peatükk 2 | ⭐ | Põhilised AI juurutuse mustrid |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Peatükk 2 | ⭐⭐ | RAG rakendus Azure AI Search'iga |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Peatükk 4 | ⭐⭐ | Dokumendi intelligentsuse integratsioon |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Peatükk 5 | ⭐⭐⭐ | Agendi raamistik ja funktsioonikutsed |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Peatükk 8 | ⭐⭐⭐ | Ettevõtte AI orkestreerimine |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Peatükk 5 | ⭐⭐⭐⭐ | Mitu-agendi arhitektuur koos kliendi ja laoseisagentidega |

### Õppimine näidiste kaudu

> **📌 Kohalikud vs välised näited:**  
> **Kohalikud näited** (selles repos) = Otse kasutamiseks valmis  
> **Välised näited** (Azure näited) = Kloonige lingitud repodest

#### Kohalikud näited (valmis kasutamiseks)
- [**Jaemüügimituagendi lahendus**](examples/retail-scenario.md) - Täielik tootmisvalmis rakendus ARM mallidega
  - Mitu agendi arhitektuur (klient + laoseisud)
  - Kõikehõlmav monitooring ja hindamine
  - Ühe klõpsu juurutus ARM malliga

#### Kohalikud näited - konteinerirakendused (peatükid 2–5)
**Kõikehõlmavad konteinerjuurutuse näited selles repositooriumis:**
- [**Konteinerirakenduste näited**](examples/container-app/README.md) - Täielik juhend konteineripõhiste juurutuste kohta
  - [Lihtne Flask API](../../examples/container-app/simple-flask-api) - Põhiline REST API koos nullini skaleerimisega
  - [Mikroteenuste arhitektuur](../../examples/container-app/microservices) - Tootmisvalmis mitme teenuse juurutus
  - Kiirkäivitus, tootmine ja arenenud juurutuse mustrid
  - Jälgimine, turvalisus ja kuluoptimeerimise juhend

#### Välised näited - lihtsad rakendused (peatükid 1–2)
**Neid Azure näidete repoid kloonige, et alustada:**
- [Lihtne veebirakendus - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Põhilised juurutuse mustrid
- [Staatiline veebisait - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staatilise sisu juurutus
- [Konteinerirakendus - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API juurutus

#### Välised näited - andmebaasi integratsioon (peatükid 3–4)  
- [Andmebaasirakendus - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Andmebaasi ühenduvuse mustrid
- [Funktsioonid + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless andmetöötlusvoog

#### Välised näited - arenenud mustrid (peatükid 4–8)
- [Java mikroteenused](https://github.com/Azure-Samples/java-microservices-aca-lab) - Mitme teenuse arhitektuurid
- [Konteinerirakenduste ülesanded](https://github.com/Azure-Samples/container-apps-jobs) - Tagaplaanipõhine töötlemine  
- [Ettevõtte ML torustik](https://github.com/Azure-Samples/mlops-v2) - Tootmisvalmis ML mustrid

### Väliste mallide kogud
- [**Ametlik AZD malligalerii**](https://azure.github.io/awesome-azd/) - Kuraator koostöö kogumik ametlikest ja kogukonna mallidest
- [**Azure Developer CLI mallid**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn mallide dokumentatsioon
- [**Näidiste kaust**](examples/README.md) - Kohalikud õppematerjalid koos põhjalike selgitustega

---

## 📚 Õppematerjalid ja viited

### Kiirada viited
- [**Käsurea tegumiku leht**](resources/cheat-sheet.md) - Vajalikud azd käsud peatükkide kaupa
- [**Sõnastik**](resources/glossary.md) - Azure ja azd terminoloogia  
- [**KKK**](resources/faq.md) - Levinud küsimused peatükkide kaupa
- [**Õppematerjalide juhend**](resources/study-guide.md) - Kõikehõlmavad praktikaülesanded

### Praktilised töötuba
- [**AI töötuba labor**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Muutke oma AI lahendused AZD juurutatavaks (2–3 tundi)
- [**Interaktiivne töötuba**](workshop/README.md) - 8-mooduline juhendatud harjutuste seeria MkDocs ja GitHub Codespaces'iga
  - Järjepidevus: Sissejuhatus → Valik → Kinnitamine → Lühenemine → Konfigureerimine → Kohandamine → Lakkevõtt → Kokkuvõte

### Välised õppematerjalid
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure arhitektuuri keskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure hinnakalkulaator](https://azure.microsoft.com/pricing/calculator/)
- [Azure seisund](https://status.azure.com/)

---

## 🔧 Kiire lahendusjuhend

**Levinumad probleemid, millega algajad kokku puutuvad, ja kohesed lahendused:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

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
<summary><strong>❌ "No subscription found" või "Subscription not set"</strong></summary>

```bash
# Loetle saadaolevad tellimused
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
<summary><strong>❌ "Piirang ei ole piisav" või "Piirang ületatud"</strong></summary>

```bash
# Proovi erinevat Azure'i regiooni
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
# Variant 1: Puhasta ja proovi uuesti
azd down --force --purge
azd up

# Variant 2: Paranda ainult infrastruktuuri
azd provision

# Variant 3: Kontrolli üksikasjalikku olekut
azd show

# Variant 4: Kontrolli logisid Azure Monitoris
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentimine ebaõnnestus" või "Märgis aegunud"</strong></summary>

```bash
# Autentige uuesti
az logout
az login

azd auth logout
azd auth login

# Autentimise kontrollimine
az account show
```
</details>

<details>
<summary><strong>❌ "Resurss juba eksisteerib" või nimekonfliktid</strong></summary>

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
- Lihtne veebirakendus: 5–10 minutit
- Rakendus koos andmebaasiga: 10–15 minutit
- AI rakendused: 15–25 minutit (OpenAI provisioneerimine on aeglane)

```bash
# Kontrolli edenemist
azd show

# Kui kinni rohkem kui 30 minutit, kontrolli Azure portaali:
azd monitor
# Otsi ebaõnnestunud juurutusi
```
</details>

<details>
<summary><strong>❌ "Luba keelatud" või "Keelatud"</strong></summary>

```bash
# Kontrolli oma Azure rolli
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Sul peab olema vähemalt "Kaastöötaja" roll
# Palu oma Azure administraatoril anda:
# - Kaastöötaja (ressursside jaoks)
# - Kasutaja juurdepääsu administraator (rolli määrangute jaoks)
```
</details>

<details>
<summary><strong>❌ Ei leia juurutatud rakenduse URL-i</strong></summary>

```bash
# Näita kõiki teenuse lõpp-punkte
azd show

# Või ava Azure portaali
azd monitor

# Kontrolli kindlat teenust
azd env get-values
# Otsi *_URL muutujaid
```
</details>

### 📚 Täielik tõrkeotsingu teabeallikas

- **Tavaliste probleemide juhend:** [Põhjalikud lahendused](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-spetsiifilised probleemid:** [AI tõrkeotsing](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Silumine:** [Samm-sammult silumine](docs/chapter-07-troubleshooting/debugging.md)
- **Abi saamine:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursuse lõpetamine & sertifitseerimine

### Edukusastme jälgimine
Jälgi oma õppimise edenemist iga peatüki kaupa:

- [ ] **1. peatükk**: Alused & Kiire algus ✅
- [ ] **2. peatükk**: AI-esmane arendus ✅  
- [ ] **3. peatükk**: Konfiguratsioon & Autentimine ✅
- [ ] **4. peatükk**: Infrastruktur koodina & Juurutamine ✅
- [ ] **5. peatükk**: Mitmeagendi AI lahendused ✅
- [ ] **6. peatükk**: Eeljuurutamise valideerimine & planeerimine ✅
- [ ] **7. peatükk**: Tõrkeotsing & silumine ✅
- [ ] **8. peatükk**: Tootmis- & ettevõttemustrid ✅

### Õppimise kontrollimine
Pärast iga peatüki lõpetamist testi oma teadmisi:
1. **Praktiline ülesanne**: Täida peatüki praktiline juurutus
2. **Teadmiste kontroll**: Vaata peatüki KKK-jaotist
3. **Kogukonna arutelu**: Jaga oma kogemusi Azure Discordis
4. **Järgmine peatükk**: Liigu järgmise keerukustaseme juurde

### Kursuse lõpetamise eelised
Kõigi peatükkide lõpetamisel on sul:
- **Tootmiskogemus**: Juurutanud tõelisi AI rakendusi Azuresse
- **Professionaalsed oskused**: Ettevõtte-tasemel juurutusvõimekus  
- **Kogukonna tunnustus**: Aktiivne Azure arendajate kogukonna liige
- **Karjääriedu**: Nõutud AZD ja AI juurutusspetsialisti oskused

---

## 🤝 Kogukond & tugi

### Abi & Toetus
- **Tehnilised probleemid**: [Teata vigadest ja palu funktsioone](https://github.com/microsoft/azd-for-beginners/issues)
- **Õppimise küsimused**: [Microsoft Azure Discordi kogukond](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-spetsiifiline abi**: Liitu [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentatsioon**: [Ametlik Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Kogukonna teadmised Microsoft Foundry Discordilt

**Viimased küsitluse tulemused #Azure kanalist:**
- **45%** arendajatest soovib kasutada AZD-d AI töökoormustele
- **Peamised väljakutsed**: Mitme teenuse juurutamine, mandaadi haldamine, tootmiskõlblikkus  
- **Kõige nõutavamad**: AI-spetsiifilised mallid, tõrkeotsingu juhised, parimad tavad

**Liitu meie kogukonnaga, et:**
- Jagada oma AZD + AI kogemusi ja saada abi
- Juurdepääs varajastele AI mallide eelvaadetele
- Panustada AI juurutamise parimatesse tavadesse
- Määratleda tulevikus AI + AZD funktsioonide arengut

### Kursusele panustamine
Ootame panuseid! Palun loe meie [Panustamise juhendit](CONTRIBUTING.md), et teada saada:
- **Sisu parandamine**: Paranda olemasolevaid peatükke ja näiteid
- **Uued näited**: Lisa reaalse elu stsenaariume ja malle  
- **Tõlkimine**: Aita hoida mitmekeelsust
- **Veaaruanded**: Paranda täpsust ja selgust
- **Kogukonna standardid**: Jälgi meie kaasavat kogukonnastandardeid

---

## 📄 Kursuse info

### Litsents
See projekt on litsentseeritud MIT litsentsi alusel - vt üksikasju failist [LICENSE](../../LICENSE).

### Seotud Microsofti õppeallikad

Meie meeskond toodab ka teisi põhjalikke õppekurse:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---
## 🗺️ Kursuse navigeerimine

**🚀 Valmis õppima hakkama?**

**Algajad**: Alusta [1. peatükk: Alus ja kiire algus](../..)  
**AI arendajad**: Hüpata [2. peatükk: AI-esimene arendus](../..)  
**Kogenud arendajad**: Alusta [3. peatükk: Konfiguratsioon ja autentimine](../..)

**Järgmised sammud**: [Alusta 1. peatükki - AZD põhialused](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kirjandusvastutus**:
See dokument on tõlgitud kasutades tehisintellekti tõlke teenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi püüame tagada täpsust, palun võtke arvesse, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument oma emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta käesoleva tõlke kasutamisest tulenevate arusaamatuste ega väärtõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->