# AZD algajatele: struktureeritud õppeteekond

![AZD-for-beginners](../../translated_images/et/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automaat tõlked (Alati ajakohased)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Araabia](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgaaria](../bg/README.md) | [Birma (Myanmar)](../my/README.md) | [Hiina (lihtsustatud)](../zh-CN/README.md) | [Hiina (traditsiooniline, Hongkong)](../zh-HK/README.md) | [Hiina (traditsiooniline, Macau)](../zh-MO/README.md) | [Hiina (traditsiooniline, Taiwan)](../zh-TW/README.md) | [Horvaadia](../hr/README.md) | [Tšehhi](../cs/README.md) | [Taani](../da/README.md) | [Hollandi](../nl/README.md) | [Eesti](./README.md) | [Soome](../fi/README.md) | [Prantsuse](../fr/README.md) | [Saksa](../de/README.md) | [Kreeka](../el/README.md) | [Heebrea](../he/README.md) | [Hindi](../hi/README.md) | [Ungari](../hu/README.md) | [Indoneesia](../id/README.md) | [Itaalia](../it/README.md) | [Jaapani](../ja/README.md) | [Kannada](../kn/README.md) | [Korea](../ko/README.md) | [Leedu](../lt/README.md) | [Malai](../ms/README.md) | [Malajalami](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigeeria pidgin](../pcm/README.md) | [Norra](../no/README.md) | [Pärsia (Farsi)](../fa/README.md) | [Poola](../pl/README.md) | [Portugali (Brasiilia)](../pt-BR/README.md) | [Portugali (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumeenia](../ro/README.md) | [Vene](../ru/README.md) | [Serbia (kirillitsa)](../sr/README.md) | [Slovaki](../sk/README.md) | [Sloveenia](../sl/README.md) | [Hispaania](../es/README.md) | [Suaheli](../sw/README.md) | [Rootsi](../sv/README.md) | [Tagalog (filipino)](../tl/README.md) | [Tamili](../ta/README.md) | [Telugu](../te/README.md) | [Tai](../th/README.md) | [Türgi](../tr/README.md) | [Ukraina](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnam](../vi/README.md)

> **Eelistad kloonimist lokaalselt?**
>
> See hoidla sisaldab 50+ keele tõlget, mis suurendab oluliselt allalaadimismõõtu. Tõlgeteta kloonimiseks kasuta sparse checkouti:
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

## 🆕 Mida uut on täna azd-s

Azure Developer CLI on kasvanud kaugemale traditsioonilistest veebirakendustest ja API-dest. Täna on azd ainus tööriist **kõikide** rakenduste juurutamiseks Azure'i – sealhulgas tehisintellektil põhinevad rakendused ja intelligentsetel agentidel.

See tähendab sulle järgmist:

- **Tehisintellekti agentidest on nüüd esmaklassilised azd töökoormused.** Saad käivitada, juurutada ja hallata tehisintellekti agentide projekte kasutades sama `azd init` → `azd up` töövoogu, mida juba tead.
- **Microsoft Foundry integratsioon** toob mudelite juurutamise, agentide majutamise ja AI teenuste seadistamise otse azd mallide ökosüsteemi.
- **Põhitöövoog pole muutunud.** Olgu see todo-rakenduse, mikroteenuse või mitme agentiga AI lahenduse juurutamine, käsud on samad.

Kui oled azd-d varem kasutanud, siis AI tugi on loomulik laiendus – mitte eraldi tööriist ega edasijõudnud rada. Kui alustad nullist, õpid ühe töövoo, mis toimib kõigile.

---

## 🚀 Mis on Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** on arendajasõbralik käsurea tööriist, mis lihtsustab rakenduste juurutamist Azure'is. Selle asemel, et käsitsi luua ja ühendada hulgaliselt Azure ressursse, saad terveid rakendusi juurutada ühe käsuga.

### „Azdi üles” võlu

```bash
# See üks käsk teeb kõik:
# ✅ Loodab kõik Azure'i ressursid
# ✅ Seadistab võrgustiku ja turvalisuse
# ✅ Koostab teie rakenduse koodi
# ✅ Deployib Azure'i
# ✅ Annab teile töötava URL-i
azd up
```
 
**Nii lihtne see ongi!** Pole vaja Azure portaalis klõpsida, keerukaid ARM malle õppida ega käsitsi seadistada – lihtsalt töövalmis rakendused Azure’is.

---

## ❓ Azure Developer CLI vs Azure CLI: Mis vahe on?

See on algajate kõige sagedasem küsimus. Siin on lihtne vastus:

| Funktsioon | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|------------|---------------------|---------------------------------|
| **Eesmärk** | Üksikute Azure ressursside haldamine | Täielike rakenduste juurutamine |
| **Mõtteviis** | Infrastruktuurikeskne | Rakendusekeskne |
| **Näide** | `az webapp create --name myapp...` | `azd up` |
| **Õppimiskõver** | Tuleb teada Azure teenuseid | Piisab oma rakendusest teadmisest |
| **Parim valik** | DevOps, infrastruktuur | Arendajad, prototüüpimine |

### Lihtne võrdlus

- **Azure CLI** on nagu kõik tööriistad maja ehitamiseks - haamrid, saed, naelad. Sa saad kõike ehitada, aga pead ehitust tundma.
- **Azure Developer CLI** on nagu tellid ehitusettevõtjat - sa kirjeldad, mida soovid, ja nemad teevad ehitust.

### Millal kasutada kumbagi

| Stsenaarium | Kasuta seda |
|-------------|-------------|
| "Tahaksin veebirakenduse kiiresti juurutada" | `azd up` |
| "Vajan ainult salvestuskontot luua" | `az storage account create` |
| "Ehitan täielikku AI rakendust" | `azd init --template azure-search-openai-demo` |
| "Pean siluma kindlat Azure ressurssi" | `az resource show` |
| "Tahaksin tootmiseks valmis juurutust mõne minutiga" | `azd up --environment production` |

### Nad töötavad koos!

AZD kasutab Azure CLI-d tagaplaanil. Sa võid mõlemat kasutada:
```bash
# Paigaldage oma rakendus AZD-iga
azd up

# Seejärel peenhäälestage konkreetseid ressursse Azure CLI abil
az webapp config set --name myapp --always-on true
```

---

## 🌟 Leia malle Awesome AZD-st

Ära alusta nullist! **Awesome AZD** on kogukonna kollektsioon valmisjuurutatavatest mallidest:

| Ressurss | Kirjeldus |
|----------|-----------|
| 🔗 [**Awesome AZD galerii**](https://azure.github.io/awesome-azd/) | Sirvi 200+ malli ühe klõpsuga juurutamiseks |
| 🔗 [**Esita mall**](https://github.com/Azure/awesome-azd/issues) | Panusta oma mall kogukonda |
| 🔗 [**GitHubi hoidla**](https://github.com/Azure/awesome-azd) | Tähista ja avasta lähtekoodi |

### Populaarsed AI mallid Awesome AZD-st

```bash
# RAG-vestlus Microsoft Foundry mudelite ja tehisintellekti otsinguga
azd init --template azure-search-openai-demo

# Kiire tehisintellekti vestlusrakendus
azd init --template openai-chat-app-quickstart

# Tehisintellekti agentid koos Foundry-agentidega
azd init --template get-started-with-ai-agents
```

---

## 🎯 Alusta kolme sammuga

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

### Samm 2: Logi sisse Azure’i

```bash
azd auth login
```

### Samm 3: Juuruta oma esimene rakendus

```bash
# Initsialiseeri mallist
azd init --template todo-nodejs-mongo

# Juuruta Azure'i (loob kõik!)
azd up
```

**🎉 Valmis!** Sinu rakendus on nüüd Azure’is elus.

### Puhastamine (Ära unusta!)

```bash
# Eemalda kõik ressursid pärast katsetamist
azd down --force --purge
```

---

## 📚 Kuidas seda kursust kasutada

See kursus on loodud **järkjärguliseks õppimiseks** - alusta, kus tunned end mugavalt ja liigu edasi:

| Sinu kogemus | Alusta siit |
|--------------|-------------|
| **Täiesti uus Azure’is** | [1. peatükk: Alus](#-chapter-1-foundation--quick-start) |
| **Tunned Azure’i, aga uus AZD-s** | [1. peatükk: Alus](#-chapter-1-foundation--quick-start) |
| **Soovid juurutada AI rakendusi** | [2. peatükk: AI-esimene arendus](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Soovid praktilist kogemust** | [🎓 Interaktiivne töötuba](workshop/README.md) - 3-4 tundi juhendatud labor |
| **Vajan tootmismustreid** | [8. peatükk: Tootmine ja ettevõttelahendused](#-chapter-8-production--enterprise-patterns) |

### Kiire seadistus

1. **Loo selle hoidla fork**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klooni see**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Otsi abi**: [Azure Discord kogukond](https://discord.com/invite/ByRwuEEgH4)

> **Eelistad kloonimist lokaalselt?**

> See hoidla sisaldab 50+ keele tõlget, mis suurendab oluliselt allalaadimismõõtu. Tõlgeteta kloonimiseks kasuta sparse checkouti:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> See annab sulle kõik vajaliku kursuse läbimiseks palju kiiremalt.


## Kursuse ülevaade

Omandage Azure Developer CLI (azd) põhjalikult läbi struktureeritud peatükkide, mis on loodud järkjärguliseks õppimiseks. **Eriti keskendub AI rakenduste juurutamisele Microsoft Foundry integratsiooniga.**

### Miks see kursus on kaasaegse arendaja jaoks oluline

Microsoft Foundry Discordi kogukonna tagasiside põhjal soovivad **45% arendajatest kasutada AZD-d AI töökoormuste jaoks**, kuid nad kohtuvad väljakutsetega:
- Keerulised mitme teenusega AI arhitektuurid
- Tootmise AI juurutamise parimad tavad  
- Azure AI teenuste integratsioon ja seadistus
- AI töökoormuste kulutõhususe optimeerimine
- AI-spetsiifiliste juurutamisprobleemide silumine

### Õpieesmärgid

Selle struktureeritud kursuse läbimisel saad:
- **Valda AZD aluseid**: Põhimõisted, paigaldus ja seadistus
- **Juuruta AI rakendusi**: Kasuta AZD-d koos Microsoft Foundry teenustega
- **Rakenda infrastruktuur koodina**: Halda Azure ressursse Bicep mallidega
- **Tõrkeotsing juurutamisel**: Lahenda sagedasi probleeme ja silu raskusi
- **Optimeeri tootmiseks**: Turvalisus, skaleerimine, jälgimine ja kulujuhtimine
- **Loo mitme agenti lahendusi**: Juuruta keerukaid AI arhitektuure

## 🗺️ Kursuse kaart: kiire navigeerimine peatükkide järgi

Igal peatükil on oma README koos õpieesmärkide, kiiralguste ja harjutustega:

| Peatükk | Teema | Õppetunnid | Kestus | Keerukus |
|---------|-------|------------|--------|----------|
| **[1. peatükk: Alus](docs/chapter-01-foundation/README.md)** | Esimene samm | [AZD põhialused](docs/chapter-01-foundation/azd-basics.md) &#124; [Paigaldus](docs/chapter-01-foundation/installation.md) &#124; [Esimene projekt](docs/chapter-01-foundation/first-project.md) | 30-45 minutit | ⭐ |
| **[2. peatükk: tehisintellekti arendamine](docs/chapter-02-ai-development/README.md)** | AI-esimesed rakendused | [Foundry integreerimine](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agendid](docs/chapter-02-ai-development/agents.md) &#124; [Mudelide juurutamine](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Töötoad](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 tundi | ⭐⭐ |
| **[3. peatükk: konfiguratsioon](docs/chapter-03-configuration/README.md)** | Autentimine ja turvalisus | [Konfiguratsioon](docs/chapter-03-configuration/configuration.md) &#124; [Autentimine ja turvalisus](docs/chapter-03-configuration/authsecurity.md) | 45-60 minutit | ⭐⭐ |
| **[4. peatükk: infrastruktuur](docs/chapter-04-infrastructure/README.md)** | IaC & juurutamine | [Juurutamise juhend](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 tundi | ⭐⭐⭐ |
| **[5. peatükk: mitme agendi lahendused](docs/chapter-05-multi-agent/README.md)** | AI agendi lahendused | [Jaemüügi stsenaarium](examples/retail-scenario.md) &#124; [Koordineerimisvõtted](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 tundi | ⭐⭐⭐⭐ |
| **[6. peatükk: eeljärelevalve](docs/chapter-06-pre-deployment/README.md)** | Planeerimine ja valideerimine | [Eellennul kontrollimine](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Mahuplaanimine](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU valik](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 tund | ⭐⭐ |
| **[7. peatükk: tõrkeotsing](docs/chapter-07-troubleshooting/README.md)** | Silumine ja parandamine | [Levinud probleemid](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Silumine](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI vead](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 tundi | ⭐⭐ |
| **[8. peatükk: tootmiskeskkond](docs/chapter-08-production/README.md)** | Ettevõtte mustrid | [Tootmistegevused](docs/chapter-08-production/production-ai-practices.md) | 2-3 tundi | ⭐⭐⭐⭐ |
| **[🎓 Töötoad](workshop/README.md)** | Praktikum | [Sissejuhatus](workshop/docs/instructions/0-Introduction.md) &#124; [Valik](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Valideerimine](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Struktureerimine](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigureerimine](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Kohandamine](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Lahendamine](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Kokkuvõte](workshop/docs/instructions/7-Wrap-up.md) | 3-4 tundi | ⭐⭐ |

**Kogu kursuse kestus:** ~10-14 tundi | **Oskuste areng:** Algaja → Tootmiskõlblik

---

## 📚 Õppe peatükid

*Valige oma õpitee vastavalt kogemustele ja eesmärkidele*

### 🚀 1. peatükk: alus ja kiire algus
**Eeldused**: Azure tellimus, põhilised käsurea oskused  
**Kestus**: 30-45 minutit  
**Keerukus**: ⭐

#### Mida õpid
- Azure Developer CLI põhialused
- AZD paigaldamine oma platvormile
- Esimene edukas juurutamine

#### Õppeallikad
- **🎯 Alusta siit**: [Mis on Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teooria**: [AZD alused](docs/chapter-01-foundation/azd-basics.md) - Põhimõisted ja terminoloogia
- **⚙️ Paigaldus**: [Paigaldamine ja seadistamine](docs/chapter-01-foundation/installation.md) - Platvormispetsiifilised juhised
- **🛠️ Praktika**: [Sinu esimene projekt](docs/chapter-01-foundation/first-project.md) - Samm-sammuline juhend
- **📋 Kiire viide**: [Käsukomplekt](resources/cheat-sheet.md)

#### Praktilised harjutused
```bash
# Kiire paigalduskontroll
azd version

# Paigalda oma esimene rakendus
azd init --template todo-nodejs-mongo
azd up
```

**💡 Peatüki tulemus**: Edukas lihtsa veebirakenduse juurutamine Azure'is AZD abil

**✅ Edu kinnitamine:**
```bash
# Pärast 1. peatüki lõpuleviimist peaksid saama:
azd version              # Kuvab installitud versiooni
azd init --template todo-nodejs-mongo  # Algatab projekti
azd up                  # Paigaldab Azure'i
azd show                # Kuvab töötava rakenduse URL-i
# Rakendus avaneb brauseris ja töötab
azd down --force --purge  # Puhastab ressursid
```

**📊 Ajainvesteering:** 30-45 minutit  
**📈 Oskustase pärast:** Suudab iseseisvalt juurutada lihtsaid rakendusi

---

### 🤖 2. peatükk: AI-esimene arendus (Soovitatav AI arendajatele)
**Eeldused**: 1. peatükk lõpetatud  
**Kestus**: 1-2 tundi  
**Keerukus**: ⭐⭐

#### Mida õpid
- Microsoft Foundry integreerimine AZD-ga
- AI-jõustatud rakenduste juurutamine
- AI teenuste konfiguratsioonide mõistmine

#### Õppeallikad
- **🎯 Alusta siit**: [Microsoft Foundry integreerimine](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agendid**: [AI agentide juhend](docs/chapter-02-ai-development/agents.md) - Intelligentsed agendid AZD-ga
- **📖 Mustrid**: [AI mudelite juurutamine](docs/chapter-02-ai-development/ai-model-deployment.md) - Mudelite haldamine ja juurutamine
- **🛠️ Töötoad**: [AI töölabor](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tehke oma AI lahendused AZD-valmis
- **🎥 Interaktiivne juhend**: [Töötoa materjalid](workshop/README.md) - Veebipõhine õpe MkDocs * DevContainer keskkonnas
- **📋 Mallid**: [Microsoft Foundry mallid](#süvitsi-azd-võimekused)
- **📝 Näited**: [AZD juurutamise näited](examples/README.md)

#### Praktilised harjutused
```bash
# Käivitage oma esimene tehisintellekti rakendus
azd init --template azure-search-openai-demo
azd up

# Proovige täiendavaid tehisintellekti malle
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Peatüki tulemus**: AI-jõustatud vestlusrakenduse juurutamine ja konfigureerimine RAG võimekusega

**✅ Edu kinnitamine:**
```bash
# Peale 2. peatükki peaksid oskama:
azd init --template azure-search-openai-demo
azd up
# Testida AI vestlusliidest
# Esitada küsimusi ja saada AI-põhiseid vastuseid koos allikatega
# Kontrollida otsingu integreerimise toimimist
azd monitor  # Kontrollida, et Application Insights kuvab telemeetriat
azd down --force --purge
```

**📊 Ajainvesteering:** 1-2 tundi  
**📈 Oskustase pärast:** Suudab juurutada ja konfigureerida tootmiskõlblikke AI rakendusi  
**💰 Kulu teadlikkus:** Mõista $80-150/kuu arenduskulusid, $300-3500/kuu tootmiskulusid

#### 💰 AI juurutamise kulutused

**Arenduskeskkond (Hinnanguliselt $80-150/kuu):**
- Microsoft Foundry mudelid (Pay-as-you-go): $0-50/kuu (sõnaste põhjal)
- AI Search (Basic tase): $75/kuu
- Container Apps (tarbimise alusel): $0-20/kuu
- Salvestus (Standard): $1-5/kuu

**Tootmiskeskkond (Hinnanguliselt $300-3,500+/kuu):**
- Microsoft Foundry mudelid (PTU stabiilse jõudluse jaoks): $3,000+/kuu VÕI pay-as-you-go suure mahuga
- AI Search (Standard tase): $250/kuu
- Container Apps (pühendatud): $50-100/kuu
- Application Insights: $5-50/kuu
- Salvestus (Premium): $10-50/kuu

**💡 Kuluoptimeerimise nõuanded:**
- Kasutage õppimiseks **Tasuta taseme** Microsoft Foundry mudeleid (Azure OpenAI 50,000 tokenit kuus kaasas)
- Kasutage `azd down` ressursside vabastamiseks, kui ei arenda aktiivselt
- Alustage tarbimise-põhisest arveldamisest, uuendage PTU-le ainult tootmises
- Kasutage `azd provision --preview` kulude hindamiseks enne juurutamist
- Lubage automaatne skaleerimine: maksate vaid tegeliku kasutuse eest

**Kulu jälgimine:**
```bash
# Kontrolli hinnangulisi igakuiseid kulusid
azd provision --preview

# Jälgi tegelikke kulusid Azure'i portaalis
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3. peatükk: konfiguratsioon ja autentimine
**Eeldused**: 1. peatükk lõpetatud  
**Kestus**: 45-60 minutit  
**Keerukus**: ⭐⭐

#### Mida õpid
- Keskkonna konfiguratsioon ja haldus
- Autentimine ja turvalisuse parimad tavad
- Ressursside nimetamine ja organiseerimine

#### Õppeallikad
- **📖 Konfiguratsioon**: [Konfiguratsiooni juhend](docs/chapter-03-configuration/configuration.md) - Keskkonna seadistamine
- **🔐 Turvalisus**: [Autentimise mustrid ja hallatud identiteet](docs/chapter-03-configuration/authsecurity.md) - Autentimise mustrid
- **📝 Näited**: [Andmebaasirakenduse näide](examples/database-app/README.md) - AZD andmebaasi näited

#### Praktilised harjutused
- Konfigureeri mitu keskkonda (dev, staging, prod)
- Määra hallatud identiteedi autentimine
- Rakenda keskkonnapõhised konfiguratsioonid

**💡 Peatüki tulemus**: Halda mitut keskkonda nõuetekohase autentimise ja turvalisusega

---

### 🏗️ 4. peatükk: infrastruktuur kui kood & juurutamine
**Eeldused**: 1.-3. peatükk lõpetatud  
**Kestus**: 1-1.5 tundi  
**Keerukus**: ⭐⭐⭐

#### Mida õpid
- Täiustatud juurutamismustrid
- Infrastruktuur kui kood Bicep abil
- Ressursside provisioning strateegiad

#### Õppeallikad
- **📖 Juurutamine**: [Juurutamise juhend](docs/chapter-04-infrastructure/deployment-guide.md) - Täielikud töövood
- **🏗️ Provisioning**: [Ressursside provisioning](docs/chapter-04-infrastructure/provisioning.md) - Azure ressursside haldus
- **📝 Näited**: [Container App näide](../../examples/container-app) - Konteineripõhised juurutused

#### Praktilised harjutused
- Loo kohandatud Bicep mallid
- Juuruta mitmes teenuses rakendusi
- Rakenda sinine-roheline juurutamisstrateegia

**💡 Peatüki tulemus**: Juuruta keerukaid mitut teenust hõlmavaid rakendusi kohandatud infrastruktuuri mallidega

---

### 🎯 5. peatükk: mitme agendi AI lahendused (edasijõudnutele)
**Eeldused**: 1.-2. peatükk lõpetatud  
**Kestus**: 2-3 tundi  
**Keerukus**: ⭐⭐⭐⭐

#### Mida õpid
- Mitme agendi arhitektuuri mustrid
- Agentide orkestreerimine ja koordineerimine
- Tootmiskõlblike AI juurutuste loomine

#### Õppeallikad
- **🤖 Esiletõstetud projekt**: [Jaemüügi mitme agendi lahendus](examples/retail-scenario.md) - Täielik rakendus
- **🛠️ ARM mallid**: [ARM malli pakett](../../examples/retail-multiagent-arm-template) - Ühe nupu juurutus
- **📖 Arhitektuur**: [Mitme agendi koordineerimise mustrid](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mustrid

#### Praktilised harjutused
```bash
# Käivitage täielik jaemüügipõhine mitme agendi lahendus
cd examples/retail-multiagent-arm-template
./deploy.sh

# Uurige agendi konfigureerimisi
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Peatüki tulemus**: Tootmiskõlbliku mitme agendi AI lahenduse juurutamine ja haldamine kliendi- ja inventaragentidega

---

### 🔍 6. peatükk: eeljärelevalve valideerimine ja planeerimine
**Eeldused**: 4. peatükk lõpetatud  
**Kestus**: 1 tund  
**Keerukus**: ⭐⭐

#### Mida õpid
- Mahuplaani koostamine ja ressursside valideerimine
- SKU valiku strateegiad
- Eellennu kontrollid ja automatiseerimine

#### Õppeallikad
- **📊 Planeerimine**: [Mahuplaani koostamine](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressursside valideerimine
- **💰 Valik**: [SKU valik](docs/chapter-06-pre-deployment/sku-selection.md) - Kuluefektiivsed valikud
- **✅ Valideerimine**: [Eellennu kontrollid](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiseeritud skriptid

#### Praktilised harjutused
- Käivita mahu valideerimise skripte
- Optimeeri SKU valikud kulude vähendamiseks
- Rakenda automatiseeritud eeljärelevalve kontrolle

**💡 Peatüki tulemus**: Valideeri ja optimeeri juurutusi enne nende läbiviimist

---

### 🚨 7. peatükk: tõrkeotsing ja silumine
**Eeldused**: Ükskõik milline juurutamise peatükk lõpetatud  
**Kestus**: 1-1.5 tundi  
**Keerukus**: ⭐⭐

#### Mida õpid
- Süsteemsed silumise meetodid
- Levinud probleemid ja lahendused
- AI spetsiifiline tõrkeotsing

#### Õppeallikad
- **🔧 Levinud probleemid**: [Levinud probleemid](docs/chapter-07-troubleshooting/common-issues.md) - Korduma kippuvad küsimused ja lahendused
- **🕵️ Silumine**: [Silumise juhend](docs/chapter-07-troubleshooting/debugging.md) - Samm-sammuline juhend
- **🤖 AI probleemid**: [AI spetsiifiline tõrkeotsing](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI teenuste vead

#### Praktilised harjutused
- Diagnoseeri juurutuse vead
- Lahenda autentimise probleemid
- Silu AI teenuse ühenduvust

**💡 Peatüki tulemus**: Sõltumatult diagnoosi ja lahenda levinud juurutuse probleemid

---

### 🏢 8. peatükk: tootmiskeskkond ja ettevõtte mustrid
**Eeldused**: 1.-4. peatükk lõpetatud  
**Kestus**: 2-3 tundi  
**Keerukus**: ⭐⭐⭐⭐

#### Mida õpid
- Tootmisjuurutamise strateegiad
- Ettevõtte turvalisuse mustrid
- Jälgimine ja kulude optimeerimine
- **🏭 Tootmine**: [Tootmise AI head tavad](docs/chapter-08-production/production-ai-practices.md) - Ettevõtte mustrid
- **📝 Näited**: [Mikroteenuste näide](../../examples/microservices) - Keerukad arhitektuurid
- **📊 Jälgimine**: [Rakenduse Insights integratsioon](docs/chapter-06-pre-deployment/application-insights.md) - Jälgimine

#### Praktilised harjutused
- Rakenda ettevõtte turvamustrid
- Sea üles põhjalik jälgimine
- Loo tootmiskeskkonda õige haldusega

**💡 Loo soovitud tulemus**: Loo tootmiseks valmis ettevõtte-tasemel rakendusi täisvõimalustega

---

## 🎓 Töötuba ülevaade: Käed-külge õppe kogemus

> **⚠️ TÖÖTOA STAATUS: Aktiivne arendus**  
> Töötuba materjalid on praegu arendamisel ja täiustamisel. Põhimoodulid töötavad, kuid mõned edasijõudnud osad on lõpetamata. Töötame aktiivselt kõigi sisude valmimise nimel. [Jälgi edenemist →](workshop/README.md)

### Interaktiivsed töötuba materjalid
**Põhjalik käed-külge õppimine brauseripõhiste tööriistade ja juhendatud harjutustega**

Meie töötuba materjalid pakuvad struktureeritud, interaktiivset õpikogemust, mis täiendab ülaltoodud peatükkide põhist õppekava. Töötuba on mõeldud nii iseseisvaks õppeks kui ka juhendajaga sessioonideks.

#### 🛠️ Töötuba funktsioonid
- **Brauseripõhine liides**: Täisfunktsionaalne MkDocs-põhine töötuba koos otsingu, kopeerimise ja teema valikutega
- **GitHub Codespaces integratsioon**: Ühe klõpsuga arenduskeskkonna seadistus
- **Struktureeritud õppe rada**: 8-mooduline juhendatud harjutused (kokku 3-4 tundi)
- **Järk-järguline metoodika**: Sissejuhatus → Valik → Kinnitamime → Lahkamine → Konfigureerimine → Kohandamine → Lammutamine → Kokkuvõte
- **Interaktiivne DevContainer keskkond**: Eelseadistatud tööriistad ja sõltuvused

#### 📚 Töötuba moodulite struktuur
Töötuba järgib **8-moodulilist järkjärgulist metoodikat**, mis viib sind avastamisest juurutamise meistrini:

| Moodul | Teema | Mida Sa teed | Kestus |
|--------|-------|--------------|--------|
| **0. Sissejuhatus** | Töötuba ülevaade | Mõista õpieesmärke, eeldusi ja töötuba ülesehitust | 15 min |
| **1. Valik** | Mallide avastamine | Uuri AZD malle ja vali sobiv AI mall oma stsenaariumi jaoks | 20 min |
| **2. Kinnitamine** | Juurutamine & valideerimine | Juuruta mall `azd up`-ga ja kinnita infrastruktuuri toimimine | 30 min |
| **3. Lahkamine** | Struktuuri mõistmine | Kasuta GitHub Copilot’i mallide arhitektuuri, Bicep failide ja koodi korralduse uurimiseks | 30 min |
| **4. Konfigureerimine** | azure.yaml süvitsi | Valda `azure.yaml` konfiguratsiooni, elutsükli konksud ja keskkonnamuutujad | 30 min |
| **5. Kohandamine** | Tee see enda omaks | Luba AI otsing, jälgimine, hindamine ja kohanda oma stsenaariumi jaoks | 45 min |
| **6. Lammutamine** | Korista üles | Turvaliselt eemalda ressursid `azd down --purge` käsklusega | 15 min |
| **7. Kokkuvõte** | Järgmised sammud | Vaata üle saavutused, võtmekontseptsioonid ja jätka õppimist | 15 min |

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
# Valik 1: GitHub Codespaces (soovitatav)
# Klõpsa "Code" → "Create codespace on main" hoidlas

# Valik 2: Kohalik arendus
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Järgi juhiseid failis workshop/README.md
```

#### 🎯 Töötuba õppimistulemused
Töötuba lõpetades õpivad osalejad:
- **Juurutama tootmisvalmis AI rakendusi**: Kasutada AZD koos Microsoft Foundry teenustega
- **Valdama multi-agent arhitektuure**: Rakendada koordineeritud AI agendi lahendusi
- **Rakendama turbe parimaid tavasid**: Konfigureerida autentimist ja ligipääsukontrolli
- **Optimeerima skaleerimist**: Disainida kuluefektiivseid ja jõudluslikke juurutusi
- **Lahendama juurutuste probleeme**: Iseseisvalt kõrvaldada levinud probleemid

#### 📖 Töötuba ressursid
- **🎥 Interaktiivne juhend**: [Töötuba materjalid](workshop/README.md) - Brauseripõhine õpikeskkond
- **📋 Moodulite juhised**:
  - [0. Sissejuhatus](workshop/docs/instructions/0-Introduction.md) - Töötuba ülevaade ja eesmärgid
  - [1. Valik](workshop/docs/instructions/1-Select-AI-Template.md) - Leia ja vali AI mallid
  - [2. Kinnitamine](workshop/docs/instructions/2-Validate-AI-Template.md) - Juuruta ja testi malle
  - [3. Lahkamine](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Uuri mallide arhitektuuri
  - [4. Konfigureerimine](workshop/docs/instructions/4-Configure-AI-Template.md) - Valda azure.yaml konfiguratsiooni
  - [5. Kohandamine](workshop/docs/instructions/5-Customize-AI-Template.md) - Kohanda oma stsenaariumi jaoks
  - [6. Lammutamine](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Korista ressursid üles
  - [7. Kokkuvõte](workshop/docs/instructions/7-Wrap-up.md) - Ülevaade ja järgmised sammud
- **🛠️ AI töötuba labor**: [AI töötuba labor](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI keskendatud harjutused
- **💡 Kiire algus**: [Töötuba seadistamise juhend](workshop/README.md#quick-start) - Keskkonna seadistamine

**Sobib ideaalselt**: Ettevõtte koolituseks, ülikooli kursusteks, iseseisvaks õppimiseks ja arendajate laagriteks.

---

## 📖 Süvitsi: AZD võimekused

Põhilisest kaugemale minnes võimaldab AZD võimsate funktsioonidega tootmisjuurutusi:

- **Mallipõhised juurutused** - Kasuta eelkonfigureeritud malle tavapäraste rakenduste mustrite jaoks
- **Infrastruktuur koodina** - Halda Azure ressursse Bicepi või Terraformi abil  
- **Integreeritud töövood** - Provisioneerimine, juurutamine ja rakenduste jälgimine sujuvalt
- **Arendajasõbralik** - Optimeeritud arendaja tootlikkuse ja kogemuse jaoks

### **AZD + Microsoft Foundry: Täiuslik AI juurutusteks**

**Miks valida AZD AI lahenduste jaoks?** AZD lahendab AI arendajate suurimad väljakutsed:

- **AI-valmis mallid** - Eelseadistatud mallid Microsoft Foundry mudelitele, kognitiivsetele teenustele ja ML töökoormustele
- **Turvalised AI juurutused** - Sisseehitatud turvamustrid AI teenustele, API võtmetele ja mudeli lõpp-punktidele  
- **Tootmise AI mustrid** - Parimad tavad skaleeritavate, kuluefektiivsete AI rakenduste juurutamiseks
- **Täielikud AI töövood** - Mudeli arendusest kuni tootmiseni koos põhjaliku jälgimisega
- **Kuluoptimeerimine** - Nutikad ressursi jaotuse ja skaleerimise strateegiad AI töökoormustele
- **Microsoft Foundry integratsioon** - Sujuv ühendus Microsoft Foundry mudelikataloogi ja lõpp-punktidega

---

## 🎯 Mallide ja näidiste kogu

### Esiletõstetud: Microsoft Foundry mallid
**Alusta siit, kui juurutad AI rakendusi!**

> **Märkus:** Need mallid demonstreerivad erinevaid AI mustreid. Mõned on välised Azure näited, teised lokaalsed teostused.

| Mall | Peatükk | Keerukus | Teenused | Tüüp |
|----------|---------|------------|----------|------|
| [**AI vestlusega alustamine**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Peatükk 2 | ⭐⭐ | AzureOpenAI + Azure AI mudeli päringute API + Azure AI otsing + Azure konteinerirakendused + Application Insights | Välislink |
| [**AI agentidega alustamine**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Peatükk 2 | ⭐⭐ | Foundry agendid + AzureOpenAI + Azure AI otsing + Azure konteinerirakendused + Application Insights| Välislink |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Peatükk 2 | ⭐⭐ | AzureOpenAI + Azure AI otsing + App Service + Salvestus | Välislink |
| [**OpenAI vestlusrakenduse kiirstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Peatükk 2 | ⭐ | AzureOpenAI + Konteinerirakendused + Application Insights | Välislink |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Peatükk 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Välislink |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Peatükk 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI otsing + Cosmos DB + Konteinerirakendused | Välislink |
| [**Jätkusuutlik multi-agent lahendus**](examples/retail-scenario.md) | Peatükk 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI otsing + Salvestus + Konteinerirakendused + Cosmos DB | **Lokaalne** |

### Esiletõstetud: Täielikud õppestsenaariumid
**Tootmiseks valmis rakenduse mallid vastavalt õppe peatükkidele**

| Mall | Õppe peatükk | Keerukus | Põhiõpe |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Peatükk 2 | ⭐ | Põhilised AI juurutuse mustrid |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Peatükk 2 | ⭐⭐ | RAG teostus Azure AI otsinguga |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Peatükk 4 | ⭐⭐ | Dokumendi intelligentsuse integratsioon |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Peatükk 5 | ⭐⭐⭐ | Agendi raamistik ja funktsoonikõnede teostus |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Peatükk 8 | ⭐⭐⭐ | Ettevõtte AI orkestreerimine |
| [**Retail multi-agent solution**](examples/retail-scenario.md) | Peatükk 5 | ⭐⭐⭐⭐ | Multi-agent arhitektuur kliendi ja laoseisu agentidega |

### Õppimine näidete kaudu

> **📌 Kohalikud vs välised näited:**  
> **Kohalikud näited** (selles repo’s) = Kasutamiseks kohe valmis  
> **Välised näited** (Azure näited) = Klooni lingitud hoidlatest

#### Kohalikud näited (Väljavõtmiseks valmis)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Täielik tootmisvalmis teostus ARM mallidega
  - Multi-agent arhitektuur (Kliendi + Lao agendid)
  - Põhjalik jälgimine ja hindamine
  - Ühe klõpsuga juurutamine ARM malliga

#### Kohalikud näited - Konteinerirakendused (Peatükid 2-5)
**Põhjalikud konteinerjuurutuse näited selles hoidlas:**
- [**Konteinerirakenduste näited**](examples/container-app/README.md) - Täielik konteinerjuurutuste juhend
  - [Lihtne Flask API](../../examples/container-app/simple-flask-api) - Põhiline REST API koos skaleerimisega nullini
  - [Mikroteenuste arhitektuur](../../examples/container-app/microservices) - Tootmisvalmis mitme teenuse juurutus
  - Kiire start, tootmine ja edasijõudnud juurutuse mustrid
  - Jälgimise, turbe ja kulude optimeerimise juhised

#### Välised näited - Lihtsad rakendused (Peatükid 1-2)
**Klooni need Azure näidiste reposid alustamiseks:**
- [Lihtne veebirakendus - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Põhilised juurutuse mustrid
- [Staatiline veebileht - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staatilise sisu juurutus
- [Konteinerirakendus - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API juurutus

#### Välised näited - Andmebaasi integratsioon (Peatükid 3-4)  
- [Andmebaasi rakendus - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Andmebaasi ühenduse mustrid
- [Funktsioonid + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverivaba andmevoog

#### Välised näited - Edasijõudnud mustrid (Peatükid 4-8)
- [Java mikroteenused](https://github.com/Azure-Samples/java-microservices-aca-lab) - Mitme teenuse arhitektuurid
- [Konteinerirakenduste töölised](https://github.com/Azure-Samples/container-apps-jobs) - Tausttöötlus  
- [Ettevõtte ML töövoog](https://github.com/Azure-Samples/mlops-v2) - Tootmisvalmis ML mustrid

### Välised mallide kogud
- [**Ametlik AZD malligalerii**](https://azure.github.io/awesome-azd/) - Hoolikalt kureeritud ametlikud ja kogukonna mallid
- [**Azure Developer CLI mallid**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn mallide dokumentatsioon
- [**Näidiste kataloog**](examples/README.md) - Kohalikud õppimise näited koos detailsete selgitustega

---

## 📚 Õppe ressursid ja viited

### Kiirviited
- [**Käskude spikker**](resources/cheat-sheet.md) - Põhilised azd käsud organiseeritud peatükkide järgi
- [**Terminite sõnastik**](resources/glossary.md) - Azure ja azd terminiõpetus  
- [**KKK**](resources/faq.md) - Levinumad küsimused ja vastused peatükkide kaupa
- [**Õpingujuhend**](resources/study-guide.md) - Põhjalikud harjutused

### Käed-külge töötubade materjalid
- [**AI töötuba labor**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Muuda oma AI lahendused AZD-ga juurutatavateks (2-3 tundi)
- [**Interaktiivne töötuba**](workshop/README.md) - 8-mooduline juhendatud harjutuste komplekt MkDocs ja GitHub Codespaces abil
  - Järgmine rada: Sissejuhatus → Valik → Kinnitamine → Lahkamine → Konfigureerimine → Kohandamine → Lammutamine → Kokkuvõte

### Välised õppematerjalid
- [Azure arendaja CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure arhitektuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure hinnakalkulaator](https://azure.microsoft.com/pricing/calculator/)
- [Azure olek](https://status.azure.com/)

### AI agendi oskused teie redaktori jaoks
- [**Microsoft Azure oskused aadressil skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 avatud agendi oskust Azure AI, Foundry, juurutuse, diagnostika, kulude optimeerimise ja muu jaoks. Paigaldage need GitHub Copilot, Cursor, Claude Code või mõnda toetatud agendisse:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Kiire tõrkeotsingu juhend

**Levinumad probleemid, millega algajad kokku puutuvad, ja kohesed lahendused:**

<details>
<summary><strong>❌ "azd: käsku ei leitud"</strong></summary>

```bash
# Installi esmalt AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Kinnita installatsioon
azd version
```
</details>

<details>
<summary><strong>❌ "Tellimust ei leitud" või "Tellimust ei ole seatud"</strong></summary>

```bash
# Loetle saadaolevad tellimused
az account list --output table

# Määra vaikimisi tellimus
az account set --subscription "<subscription-id-or-name>"

# Määra AZD keskkonna jaoks
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Kontrolli
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" või "Kvood ületatud"</strong></summary>

```bash
# Proovi erinevat Azure'i regioonit
azd env set AZURE_LOCATION "westus2"
azd up

# Või kasuta arenduses väiksemaid SKUsid
# Muuda infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" nurjub poole peal</strong></summary>

```bash
# Valik 1: Puhasta ja proovi uuesti
azd down --force --purge
azd up

# Valik 2: Paranda ainult infrastruktuuri
azd provision

# Valik 3: Kontrolli üksikasjalikku staatust
azd show

# Valik 4: Kontrolli logisid Azure Monitoris
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentimine ebaõnnestus" või "Token on aegunud"</strong></summary>

```bash
# Autentige uuesti
az logout
az login

azd auth logout
azd auth login

# Kontrollige autentimist
az account show
```
</details>

<details>
<summary><strong>❌ "Resurss juba olemas" või nimetuste konfliktid</strong></summary>

```bash
# AZD genereerib unikaalseid nimesid, kuid kui tekib konflikt:
azd down --force --purge

# Proovi siis uuesti uue keskkonnaga
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Malli juurutamine võtab liiga palju aega</strong></summary>

**Normaalsed ooteajad:**
- Lihtne veebirakendus: 5-10 minutit
- Rakendus andmebaasiga: 10-15 minutit
- AI rakendused: 15-25 minutit (OpenAI ülesseadmine on aeglane)

```bash
# Kontrolli edenemist
azd show

# Kui ummikus >30 minutit, kontrolli Azure portaali:
azd monitor
# Otsi ebaõnnestunud juurutusi
```
</details>

<details>
<summary><strong>❌ "Luba keelatud" või "Keelatud"</strong></summary>

```bash
# Kontrolli oma Azure rolli
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Sul on vaja vähemalt "Contributor" rolli
# Palu oma Azure administraatoril anda:
# - Contributor (ressursside jaoks)
# - User Access Administrator (rolli määramiste jaoks)
```
</details>

<details>
<summary><strong>❌ Ei leia juurutatud rakenduse URL-i</strong></summary>

```bash
# Kuvada kõik teenuse lõpp-punktid
azd show

# Või avada Azure portaali
azd monitor

# Kontrollida konkreetset teenust
azd env get-values
# Otsida *_URL muutujaid
```
</details>

### 📚 Täielikud tõrkeotsingu ressursid

- **Levinud probleemide juhend:** [Üksikasjalikud lahendused](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-spetsiifilised probleemid:** [AI tõrkeotsing](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Silumine:** [Samm-sammuline silumine](docs/chapter-07-troubleshooting/debugging.md)
- **Abi saamine:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursuse lõpetamine ja sertifitseerimine

### Edusamme jälgimine
Jälgige oma õppimise edenemist iga peatüki lõikes:

- [ ] **Peatükk 1**: Alused ja kiire stardipakk ✅
- [ ] **Peatükk 2**: AI-esmene arendus ✅  
- [ ] **Peatükk 3**: Konfiguratsioon ja autentimine ✅
- [ ] **Peatükk 4**: Infrastruktuur koodina ja juurutus ✅
- [ ] **Peatükk 5**: Mitme agendi AI lahendused ✅
- [ ] **Peatükk 6**: Eeljuurutuse valideerimine ja planeerimine ✅
- [ ] **Peatükk 7**: Tõrkeotsing ja silumine ✅
- [ ] **Peatükk 8**: Tootmise ja ettevõtte mudelid ✅

### Õppimise kinnitamine
Pärast iga peatüki lõpetamist kinnitage oma teadmised järgmiselt:
1. **Praktiline ülesanne**: Täitke peatüki käed-küljes juurutus
2. **Teadmiste kontroll**: Vaadake oma peatüki KKK sektsiooni läbi
3. **Kogukonna arutelu**: Jagage oma kogemusi Azure Discordis
4. **Järgmine peatükk**: Liikuge järgmisele keerukuse tasemele

### Kursuse lõpetamise eelised
Kõigi peatükkide lõpetamisel omate:
- **Tootmiskogemus**: Reaalsete AI rakenduste juurutus Azure'is
- **Professionaalsed oskused**: Ettevõtte tasemel juurutusvõimekus  
- **Kogukonna tunnustus**: Aktiivne Azure arendajate kogukonna liige
- **Karjääri areng**: Nõutud AZD ja AI juurutamise asjatundmine

---

## 🤝 Kogukond ja tugi

### Abi ja tugi
- **Tehnilised probleemid**: [Tõrgete teatamine ja funktsioonisoovid](https://github.com/microsoft/azd-for-beginners/issues)
- **Õppimise küsimused**: [Microsoft Azure Discord kogukond](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-spetsiifiline abi**: Liituge [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentatsioon**: [Ametlik Azure arendaja CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Kogukonna teave Microsoft Foundry Discordist

**Hiljutised küsitluse tulemused kanalist #Azure:**
- **45%** arendajatest soovib kasutada AZD-d AI töökoormuste jaoks
- **Põhilised väljakutsed**: Mitme teenuse juurutused, mandaadihaldus, tootmise valmisolek  
- **Kõige rohkem soovitud**: AI-spetsiifilised mustrid, tõrkeotsingu juhendid, parimad tavad

**Liituge meie kogukonnaga, et:**
- Jagada oma AZD + AI kogemusi ja saada abi
- Saada varaseid eelvaateid uutest AI mallidest
- Panustada AI juurutuse parimatesse tavadesse
- Mõjutada tulevasi AI + AZD funktsioone

### Kursusele panustamine
Tervitame panuseid! Palun lugege meie [Panustamise juhendit](CONTRIBUTING.md), et saada teada:
- **Sisu täiustused**: Parandage olemasolevaid peatükke ja näiteid
- **Uued näited**: Lisage reaalse elu stsenaariume ja malle  
- **Tõlkimine**: Aidake säilitada mitmekeelse tuge
- **Bugide raportid**: Parandage täpsust ja selgust
- **Kogukonna standardid**: Järgige meie kaasava kogukonna juhiseid

---

## 📄 Kursuse info

### Litsents
See projekt on litsentseeritud MIT litsentsi alusel - vaadake üksikasju [LICENSE](../../LICENSE) failist.

### Seotud Microsofti õpperessursid

Meie meeskond toodab ka teisi põhjalikke õppekursusi:

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
 
### Generatiivne AI sari
[![Generatiivne AI algajatele](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatiivne AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatiivne AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatiivne AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Põhiõpe
[![ML algajatele](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Andmeteadus algajatele](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI algajatele](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Küberjulgeolek algajatele](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Veebiarendus algajatele](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT algajatele](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR arendus algajatele](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot sari
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursuse navigeerimine

**🚀 Valmis õppima hakkama?**

**Algajatele**: Alusta [1. peatükist: Alus ja kiire algus](#-chapter-1-foundation--quick-start)  
**Tehisintellekti arendajatele**: Hüpata otse [2. peatükki: Tehisintellektil põhinev arendus](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Kogenud arendajatele**: Alusta [3. peatükist: Konfiguratsioon ja autentimine](#️-chapter-3-configuration--authentication)

**Järgmised sammud**: [Alusta 1. peatükki - AZD põhialused](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud tehisintellekti tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame saavutada täpsust, palun pidage silmas, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument oma emakeeles tuleks pidada ametlikuks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgendamise eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->