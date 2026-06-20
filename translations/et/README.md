# AZD algajatele: struktureeritud õppeprogramm

![AZD-for-beginners](../../translated_images/et/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automaatne tõlge (alati ajakohane)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Araabia](../ar/README.md) | [Bengali keel](../bn/README.md) | [Bulgaaria](../bg/README.md) | [Birma (Myanmar)](../my/README.md) | [Hiina (lihtsustatud)](../zh-CN/README.md) | [Hiina (traditsiooniline, Hongkong)](../zh-HK/README.md) | [Hiina (traditsiooniline, Macau)](../zh-MO/README.md) | [Hiina (traditsiooniline, Taiwan)](../zh-TW/README.md) | [Horvaadi](../hr/README.md) | [Tšehhi](../cs/README.md) | [Taani](../da/README.md) | [Hollandi](../nl/README.md) | [Eesti](./README.md) | [Soome](../fi/README.md) | [Prantsuse](../fr/README.md) | [Saksa](../de/README.md) | [Kreeka](../el/README.md) | [Heebrea](../he/README.md) | [Hindi](../hi/README.md) | [Ungari](../hu/README.md) | [Indoneesia](../id/README.md) | [Itaalia](../it/README.md) | [Jaapani](../ja/README.md) | [Kannada](../kn/README.md) | [Khmeeri](../km/README.md) | [Korea](../ko/README.md) | [Leedu](../lt/README.md) | [Malai](../ms/README.md) | [Malajalami](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigeeria pidžin](../pcm/README.md) | [Norra](../no/README.md) | [Pärsia (Farsi)](../fa/README.md) | [Poola](../pl/README.md) | [Portugali (Brasiilia)](../pt-BR/README.md) | [Portugali (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumeenia](../ro/README.md) | [Vene](../ru/README.md) | [Serbia (kyrillitsa)](../sr/README.md) | [Sloveeni](../sl/README.md) | [Slovaki](../sk/README.md) | [Hispaania](../es/README.md) | [Suahiili](../sw/README.md) | [Rootsi](../sv/README.md) | [Tagaloogi (Filipiinid)](../tl/README.md) | [Tamili](../ta/README.md) | [Telugu](../te/README.md) | [Tai](../th/README.md) | [Türgi](../tr/README.md) | [Ukraaini](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnami](../vi/README.md)

> **Eelistad kloonida lokaalselt?**
>
> See hoidla sisaldab üle 50 keele tõlget, mis suurendab allalaadimissuurust märkimisväärselt. Selleks, et kloonida ilma tõlgeteta, kasuta haruldast väljavõtet (sparse checkout):
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
> See annab sulle kõik, mida kursuse läbimiseks vajad palju kiirema allalaadimisega.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Mis on täna uues azd-s

> 📌 See kursus on valideeritud versiooni **`azd 1.25.6`** (juuni 2026) vastu. Käivita `azd version`, et kontrollida oma versiooni, ja `azd upgrade`, et saada uusim versioon.

Azure Developer CLI on kasvanud kaugemale traditsioonilistest veebirakendustest ja API-dest. Täna on azd ainus tööriist mis tahes rakenduse Azure'i juurutamiseks — sealhulgas ka AI-põhiste rakenduste ja intelligentsete agentide jaoks.

Mis see sulle tähendab:

- **AI agendid on nüüd esmaklassilised azd töökoormused.** Sa saad AI agendi projekte algatada, juurutada ja hallata sama `azd init` → `azd up` töövooga, mida juba tead.
- **Täielik agendi elutsükkel CLI-st.** `azure.ai.agents` laiendus katab kogu protsessi — `azd ai agent init` skafoldimiseks, `azd ai agent invoke` testimiseks (vastuse aja väljundiga), `azd ai agent eval generate` ja `azd ai agent optimize` kvaliteedi mõõtmiseks ja parandamiseks ning `azd ai agent delete` koristamiseks.
- **Rohkem AI ehituskive.** Uued eelvaates olevad laiendused — `azure.ai.skills` ja `azure.ai.connections` — võimaldavad hallata korduvkasutatavaid agendi oskusi ja Foundry ühendusi otse azd-ga.
- **Microsoft Foundry integratsioon** toob mudelite juurutamise, agendi hostimise ja AI teenuste seadistamise otse azd malliökosüsteemi.
- **Sujuvamad igapäevased toimingud.** Hiljutised versioonid tegid `azd init` idempotentseks (ohutu mitu korda käivitada), `azd auth login` tühjendab aegunud tokenid automaatselt ja lisasid sõbraliku `azd tool` esmakordse seadistusviiba.
- **Põhitöövoog pole muutunud.** Olgu see todo-rakendus, mikroteenus või mitme agendi AI lahendus, käsud on samad.

> **Märkuseks Aspire kasutajatele:** Microsoft nimetab toodet nüüd lihtsalt **Aspire** (endine ".NET Aspire"). azd Aspire tugi on muutumatult olemas – muudetud on ainult nimi.

Kui oled azd-d varem kasutanud, on AI tugi loomulik laiendus, mitte eraldi tööriist või täiustatud rada. Kui alustad nullist, õpid ühe töövoo, mis töötab kõigile.

---

## 🚀 Mis on Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** on arendajasõbralik käsurea tööriist, mis teeb Azure'i rakenduste juurutamise lihtsaks. Selle asemel, et käsitsi luua ja ühendada kümneid Azure ressursse, saad terve rakenduse juurutada ühe käsuga.

### `azd up` võlu

```bash
# See üks käsk teeb kõik ära:
# ✅ Loob kõik Azure'i ressursid
# ✅ Seadistab võrguühenduse ja turvalisuse
# ✅ Koostab teie rakenduse koodi
# ✅ Juurutab Azuresse
# ✅ Annab teile toimiva URL-i
azd up
```

**See ongi kõik!** Pole vaja klõpsida Azure portaalis, õppida keerulisi ARM malle ega teha käsitsi konfiguratsiooni – lihtsalt töötavad rakendused Azure'is.

---

## ❓ Azure Developer CLI vs Azure CLI: mis vahe on?

See on algajate populaarseim küsimus. Siin on lihtne vastus:

| Funktsioon | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|------------|---------------------|--------------------------------|
| **Eesmärk** | Üksikute Azure ressursside haldamine | Täielike rakenduste juurutamine |
| **Mõtteviis** | Infrastruktuurile keskenduv | Rakendustele keskenduv |
| **Näide** | `az webapp create --name myapp...` | `azd up` |
| **Õppekiirus** | Pead tundma Azure teenuseid | Pead teadma oma rakendust |
| **Sobib kõige paremini** | DevOps, infrastruktuur | Arendajad, prototüüpimine |

### Lihtne analoogia

- **Azure CLI** on nagu kõik vajalikud tööriistad maja ehitamiseks - haamrid, saed, naelad. Sa võid midagi ehitada, aga pead ehitust teadma.
- **Azure Developer CLI** on nagu töövõtja palkamine - sa kirjeldad, mida soovid, ja nemad ehitavad selle valmis.

### Millal mida kasutada

| Situatsioon | Kasuta seda |
|-------------|-------------|
| "Tahan kiiresti veebirakendust juurutada" | `azd up` |
| "Pean lihtsalt salvestuskonto looma" | `az storage account create` |
| "Ehitan tervet AI rakendust" | `azd init --template azure-search-openai-demo` |
| "Pean siluma konkreetset Azure ressurssi" | `az resource show` |
| "Tahan tootmiskõlbliku juurutuse mõne minutiga" | `azd up --environment production` |

### Nad töötavad koos!

AZD kasutab Azure CLI-d tagaplaanil. Sa võid kasutada mõlemat:
```bash
# Juurutage oma rakendus AZD-ga
azd up

# Seejärel peenhäälestage konkreetseid ressursse Azure CLI abil
az webapp config set --name myapp --always-on true
```

---

## 🌟 Leia malle Awesome AZD-st

Ära alusta tühjalt kohalt! **Awesome AZD** on kogukonna kogumik valmisjuurutusega mallidest:

| Ressurss | Kirjeldus |
|----------|-----------|
| 🔗 [**Awesome AZD galerii**](https://azure.github.io/awesome-azd/) | Sirvi 200+ malli ja käivita ühe klõpsuga |
| 🔗 [**Esita mall**](https://github.com/Azure/awesome-azd/issues) | Pane oma mall kogukonnale kättesaadavaks |
| 🔗 [**GitHub hoidlasse**](https://github.com/Azure/awesome-azd) | Tähista ja uuri lähtekoodi |

### Populaarsed AI mallid Awesome AZD-st

```bash
# RAG-vestlus Microsoft Foundry mudelitega + AI-otsing
azd init --template azure-search-openai-demo

# Kiire tehisintellekti vestlusrakendus
azd init --template openai-chat-app-quickstart

# Tehisintellekti agendid koos Foundry-agentidega
azd init --template get-started-with-ai-agents
```

---

## 🎯 Alusta 3 sammuga

Enne alustamist veendu, et sinu masin on valmis mallist tulenevate nõuetega:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Kui mõni vajalik kontroll ebaõnnestub, paranda see kõigepealt ja siis jätka kiire algusega.

### Samm 1: Installi AZD (2 minutit)

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

Kui pole kindel, kumba vajad, järgi täisjuhendit [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Samm 3: Juuruta oma esimene rakendus

```bash
# Alusta mallist
azd init --template todo-nodejs-mongo

# Juuruta Azure'i (loob kõik!)
azd up
```

**🎉 See ongi kõik!** Sinu rakendus töötab nüüd Azure'is.

### Korista ära (Ära unusta!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kuidas seda kursust kasutada

See kursus on mõeldud **järkjärguliseks õppimiseks** — alusta seal, kus kõige mugavam, ja edene astmelt järgmisele:

| Sinu kogemus | Alusta siit |
|--------------|-------------|
| **Täiesti uus Azure’is** | [1. peatükk: Alus](#-chapter-1-foundation--quick-start) |
| **Tunned Azure’i, aga oled uus AZD-ga** | [1. peatükk: Alus](#-chapter-1-foundation--quick-start) |
| **Soovid AI rakendusi juurutada** | [2. peatükk: AI-tel põhinev arendus](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Soovid praktilist kogemust** | [🎓 Interaktiivne töötuba](workshop/README.md) – 3-4-tunnine juhendatud labor |
| **Vajad tootmismustrid** | [8. peatükk: Tootmine ja ettevõte](#-chapter-8-production--enterprise-patterns) |

### Kiire seadistus

1. **Tee hoidlale fork:** [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klooni see:** `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Küsi abi:** [Azure Discord kogukond](https://discord.com/invite/ByRwuEEgH4)

> **Eelistad kloonida lokaalselt?**

> See hoidla sisaldab üle 50 keele tõlkeid, mis suurendab allalaadimissuurust märkimisväärselt. Kloonimiseks ilma tõlgeteta kasuta haruldast väljavõtet:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> See annab sulle kõik vajaliku kursuse läbimiseks oluliselt kiirema allalaadimisega.


## Kursuse ülevaade

Meistrista Azure Developer CLI (azd) struktureeritud peatükkide kaudu, disainitud järkjärguliseks õppimiseks. **Eriline rõhk Microsoft Foundry integratsiooniga AI rakenduste juurutamisel.**
### Miks see kursus on tänapäevastele arendajatele oluline

Microsoft Foundry Discordi kogukonna teadlikkuse põhjal soovib **45% arendajatest kasutada AZD-d AI töökoormuste jaoks**, kuid nad puutuvad kokku järgmiste väljakutsetega:
- keerulised mitme-teenuse AI arhitektuurid
- parimad tavad tootmises AI juurutamiseks  
- Azure AI teenuste integratsioon ja konfiguratsioon
- AI töökoormuste kulude optimeerimine
- AI-spetsiifiliste juurutusprobleemide tõrkeotsing

### Õpieesmärgid

Selle struktureeritud kursuse läbimisel:
- **Valdad AZD põhialused**: Põhimõisted, paigaldus ja konfiguratsioon
- **Juurutad AI rakendusi**: Kasutad AZD-d Microsoft Foundry teenustega
- **Rakendad infrastruktuuri koodina**: Azure ressursside haldamine Bicep mallidega
- **Tõrkeotsing juurutamisel**: Lahendad sagedased probleemid ja silud tõrkeid
- **Optimeerid tootmiseks**: Turvalisus, skaleerimine, monitooring ja kulujuhtimine
- **Ehidad mitmeagendi lahendusi**: Juurutad keerukaid AI arhitektuure

## Enne alustamist: kontod, ligipääs ja eeldused

Enne 1. peatüki alustamist veendu, et sul on järgnevad asjad olemas. Selle juhendi paigaldusmängud eeldavad, et need baastasemed on juba lahendatud.

- **Azure tellimus**: Sa võid kasutada olemasolevat töötellimust või isiklikku kontot või luua [tasuta prooviversiooni](https://aka.ms/azurefreetrial) alustamiseks.
- **Õigus luua Azure ressursse**: Enamiku harjutuste jaoks peaks sul olema vähemalt **panustaja** (Contributor) ligipääs sihttellimusele või ressursside rühmale. Mõned peatükid eeldavad ka ressursside rühmade, hallatud identiteetide ja RBAC määrangute loomise õigust.
- [**GitHub konto**](https://github.com): Kasulik hoidla forkimiseks, oma muudatuste jälgimiseks ja GitHub Codespaces kasutamiseks töötoas.
- **Mallide käituskeskkonna eeltingimused**: Mõned mallid vajavad kohalikke tööriistu nagu Node.js, Python, Java või Docker. Käivita seadistuse valideerija enne alustamist, et puuduvad tööriistad õigel ajal välja selgitada.
- **Põhilised terminali oskused**: Ei pea olema ekspert, kuid peaksid olema mugav käske nagu `git clone`, `azd auth login` ja `azd up` jooksutada.

> **Kas töötad ettevõtte tellimuses?**  
> Kui su Azure keskkonda haldab administraator, kinnita eelnevalt, et saad kasutada ressursside juurutamist selles tellimuses või ressursside rühmas, mida kavatsed kasutada. Kui mitte, küsi liivakasti tellimust või Panustaja õigust enne alustamist.

> **Uus Azure kasutaja?**  
> Alusta oma tasuta Azure prooviversiooni või tasulise tellimusega aadressil https://aka.ms/azurefreetrial, et saaksid ülesanded lõpuni teha ilma oma tenant-tasandi heakskiideta ootamata.

## 🗺️ Kursuse kaart: kiire navigeerimine peatükkide kaupa

Iga peatüki juures on pühendatud README koos õpieesmärkide, kiire alguse ja harjutustega:

| Peatükk | Teema | Õppetunnid | Kestus | Raskeusaste |
|---------|-------|------------|--------|-------------|
| **[1. peatükk: Alus](docs/chapter-01-foundation/README.md)** | Alustamine | [AZD põhialused](docs/chapter-01-foundation/azd-basics.md) &#124; [Paigaldus](docs/chapter-01-foundation/installation.md) &#124; [Esimene projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[2. peatükk: AI arendus](docs/chapter-02-ai-development/README.md)** | AI esimene rakendus | [Foundry integratsioon](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agendid](docs/chapter-02-ai-development/agents.md) &#124; [Mudeli juurutus](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Töötuba](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 tundi | ⭐⭐ |
| **[3. peatükk: Konfiguratsioon](docs/chapter-03-configuration/README.md)** | Autentimine & turvalisus | [Konfiguratsioon](docs/chapter-03-configuration/configuration.md) &#124; [Autentimine & turvalisus](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[4. peatükk: Infrastruktuur](docs/chapter-04-infrastructure/README.md)** | IaC ja juurutus | [Juurutusjuhend](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 tundi | ⭐⭐⭐ |
| **[5. peatükk: Mitmeagendi lahendused](docs/chapter-05-multi-agent/README.md)** | AI agentide lahendused | [Jaekaubanduse stsenaarium](examples/retail-scenario.md) &#124; [Koordineerimismustrid](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 tundi | ⭐⭐⭐⭐ |
| **[6. peatükk: Eeljuurutus](docs/chapter-06-pre-deployment/README.md)** | Planeerimine & valideerimine | [Eeltõendid](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapatsi planeerimine](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU valik](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Rakenduse Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 tund | ⭐⭐ |
| **[7. peatükk: Tõrkeotsing](docs/chapter-07-troubleshooting/README.md)** | Silumine ja parandamine | [Tavalised probleemid](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Silumine](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI probleemid](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 tundi | ⭐⭐ |
| **[8. peatükk: Tootmine](docs/chapter-08-production/README.md)** | Ettevõtte mustrid | [Tootmise tavad](docs/chapter-08-production/production-ai-practices.md) | 2-3 tundi | ⭐⭐⭐⭐ |
| **[🎓 Töötuba](workshop/README.md)** | Kasutuselabor | [Sissejuhatus](workshop/docs/instructions/0-Introduction.md) &#124; [Valik](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Valideerimine](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Lammutamine](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigureerimine](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Kohandamine](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Demontaaž](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Lõpetamine](workshop/docs/instructions/7-Wrap-up.md) | 3-4 tundi | ⭐⭐ |

**Kogu kursuse kestus:** ~10-14 tundi | **Oskuste areng:** Algaja → Tootmisvalmis

---

## 📚 Õppepeatükid

*Vali oma õpperada vastavalt kogemustele ja eesmärkidele*

### 🚀 1. peatükk: Alus ja kiire alustamine  
**Eeltingimused**: Azure tellimus, põhiteadmised käsureast  
**Kestus**: 30-45 minutit  
**Raskeusaste**: ⭐

#### Mida õpid
- Azure Developer CLI põhialusete mõistmine
- AZD paigaldamine oma platvormile
- Esimene edukas juurutus

#### Õppematerjalid
- **🎯 Alusta siit**: [Mis on Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teooria**: [AZD põhialused](docs/chapter-01-foundation/azd-basics.md) - põhimõisted ja terminoloogia
- **⚙️ Seadistamine**: [Paigaldus ja häälestus](docs/chapter-01-foundation/installation.md) - platvormisõbralik juhend
- **🛠️ Praktiline**: [Sinu esimene projekt](docs/chapter-01-foundation/first-project.md) - samm-sammult juhis
- **📋 Kiire ülevaade**: [Käskude kokkuvõte](resources/cheat-sheet.md)

#### Praktilised harjutused
```bash
# Kiire paigaldamise kontroll
azd version

# Paigalda oma esimene rakendus
azd init --template todo-nodejs-mongo
azd up
```

**💡 Peatüki tulemus:** Juuruta edukalt lihtne veebirakendus Azure’i kasutades AZD-d

**✅ Õnnestumise kriteeriumid:**  
```bash
# Pärast 1. peatüki lõpetamist peaksid olema võimeline:
azd version              # Kuvab paigaldatud versiooni
azd init --template todo-nodejs-mongo  # Initsialiseerib projekti
azd up                  # Juurutab Azure'i
azd show                # Kuvab töötava rakenduse URL-i
# Rakendus avaneb brauseris ja töötab
azd down --force --purge  # Puhastab ressursid
```
  
**📊 Ajakulu:** 30-45 minutit  
**📈 Oskustase pärast:** Suudad iseseisvalt juurutada põhilisi rakendusi

---

### 🤖 2. peatükk: AI-esimene arendus (Soovitatav AI arendajatele)  
**Eeltingimused**: 1. peatükk tehtud  
**Kestus**: 1-2 tundi  
**Raskeusaste**: ⭐⭐

#### Mida õpid
- Microsoft Foundry integratsioon AZD-ga
- AI-põhiste rakenduste juurutamine
- AI teenuste konfiguratsioonide mõistmine

#### Õppematerjalid
- **🎯 Alusta siit**: [Microsoft Foundry integratsioon](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agendid**: [AI agentide juhend](docs/chapter-02-ai-development/agents.md) - juuruta nutikaid agente AZD-ga
- **📖 Mustrid**: [AI mudeli juurutamine](docs/chapter-02-ai-development/ai-model-deployment.md) - juuruta ja halda AI mudeleid
- **🛠️ Töötuba**: [AI töötuba](docs/chapter-02-ai-development/ai-workshop-lab.md) - saa oma AI lahendused AZD-valmis
- **🎥 Interaktiivne juhend**: [Töötuba materjalid](workshop/README.md) - brauseripõhine õpe MkDocs * DevContainer keskkonnas
- **📋 Mallid**: [Microsoft Foundry mallid](#töötuba-ressursid)
- **📝 Näited**: [AZD juurutuse näited](examples/README.md)

#### Praktilised harjutused
```bash
# Käivitage oma esimene tehisintellekti rakendus
azd init --template azure-search-openai-demo
azd up

# Proovige täiendavaid tehisintellekti malle
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Peatüki tulemus:** Juuruta ja konfigureeri AI-toega vestlusrakendus RAG võimalustega

**✅ Õnnestumise kriteeriumid:**  
```bash
# Pärast 2. peatükki peaksid sa suutma:
azd init --template azure-search-openai-demo
azd up
# Testida tehisintellekti vestlusliidest
# Esitada küsimusi ja saada tehisintellekti toel vastuseid koos allikatega
# Kontrollida, et otsingu integreerimine töötab
azd monitor  # Kontrollida, et Application Insights näitab telemeetriaid
azd down --force --purge
```
  
**📊 Ajakulu:** 1-2 tundi  
**📈 Oskustase pärast:** Suudab juurutada ja konfigureerida tootmisvalmis AI rakendusi  
**💰 Kulutuste teadlikkus:** Mõistab 80–150 $/kuu arengukulusid, 300–3500 $/kuu tootmiskulusid

#### 💰 Kulude kaalutlused AI juurutuste jaoks

**Arenduskeskkond (hinnanguliselt 80–150 $/kuus):**  
- Microsoft Foundry mudelid (maksa kasutuse järgi): 0–50 $/kuu (põhineb tokenite kasutusel)  
- AI otsing (algeline tasand): 75 $/kuu  
- Container Apps (tarbimine): 0–20 $/kuu  
- Salvestusruum (standard): 1–5 $/kuu  

**Tootmiskeskkond (hinnanguliselt 300–3500+ $/kuus):**  
- Microsoft Foundry mudelid (PTU tagab stabiilse töö): 3000+ $/kuu VÕI maksa kasutuse järgi suure mahuga  
- AI otsing (standardne tasand): 250 $/kuu  
- Container Apps (pühendatud): 50–100 $/kuu  
- Rakenduse Insights: 5–50 $/kuu  
- Salvestusruum (premium): 10–50 $/kuu  

**💡 Kuluoptimeerimise näpunäited:**  
- Kasuta **tasuta tasandit** Microsoft Foundry mudelite õppimiseks (Azure OpenAI sisaldab 50 000 tokenit kuus)  
- Käivita `azd down`, kui ei arenda aktiivselt, et ressursid vabastada  
- Alusta tarbimispõhisest arvestusest, uuenda PTU-le ainult tootmises  
- Kasuta `azd provision --preview`, et kulusid enne juurutust hinnata  
- Luba automaatne skaleerimine: maksa ainult tegeliku kasutuse eest  

**Kulude jälgimine:**  
```bash
# Kontrolli hinnangulisi igakuiseid kulusid
azd provision --preview

# Jälgi tegelikke kulusid Azure Portaalis
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3. peatükk: Konfiguratsioon ja autentimine  
**Eeltingimused**: 1. peatükk tehtud  
**Kestus**: 45-60 minutit  
**Raskeusaste**: ⭐⭐

#### Mida õpid
- Keskkonna seadistamine ja haldus  
- Autentimise ja turvalisuse parimad praktikad  
- Ressursside nimetamine ja organiseerimine  

#### Õppematerjalid
- **📖 Konfiguratsioon**: [Konfiguratsiooni juhend](docs/chapter-03-configuration/configuration.md) - keskkonna seadistamine  
- **🔐 Turvalisus**: [Autentimismustrid ja hallatud identiteet](docs/chapter-03-configuration/authsecurity.md) - autentimismustrid  
- **📝 Näited**: [Andmebaasi rakenduse näide](examples/database-app/README.md) - AZD andmebaasi näited  

#### Praktilised harjutused  
- Konfigureeri mitmeid keskkondi (arendus, katsetus, tootmine)  
- Loo hallatud identiteediga autentimine  
- Rakenda keskkonnapõhised konfiguratsioonid  

**💡 Peatüki tulemus:** Sina suudad hallata mitut keskkonda korrektselt autentides ja turvalisust rakendades

---

### 🏗️ 4. peatükk: Infrastruktuur kui kood ja juurutus  
**Eeltingimused**: 1-3 peatükk tehtud  
**Kestus**: 1-1.5 tundi  
**Raskeusaste**: ⭐⭐⭐

#### Mida õpid
- Täiustatud juurutusmustrite mõistmine  
- Infrastruktuuri haldamine koodiga, kasutades Bicep-i  
- Ressursside loomise strateegiad  

#### Õppematerjalid
- **📖 Juurutus**: [Juurutusjuhend](docs/chapter-04-infrastructure/deployment-guide.md) - terviklikud töövood  
- **🏗️ Provisioning**: [Ressursside loomine](docs/chapter-04-infrastructure/provisioning.md) - Azure ressursside haldus  
- **📝 Näited**: [Container App näide](../../examples/container-app) - konteineripõhised juurutused  

#### Praktilised harjutused  
- Loo kohandatud Bicep mallid  
- Juuruta mitme-teenusega rakendusi  
- Rakenda sinise-rohelise juurutuse strateegiaid  

**💡 Peatüki tulemus:** Juuruta keerulisi mitme-teenusega rakendusi kasutades kohandatud infrastruktuuri malle

---
### 🎯 5. peatükk: Mitme agendiga AI lahendused (edasijõudnuile)  
**Eeltingimused**: Peatükid 1-2 lõpetatud  
**Kestus**: 2-3 tundi  
**Kompleksus**: ⭐⭐⭐⭐  

#### Mida õpid  
- Mitme agendi arhitektuuri mustrid  
- Agendi orkestreerimine ja koordineerimine  
- Tootmiskõlblikud AI juurutused  

#### Õppematerjalid  
- **🤖 Esiletõstetud projekt**: [Jaemüügi mitme agendiga lahendus](examples/retail-scenario.md) – Täielik rakendus  
- **🛠️ ARM-mallid**: [ARM-malli pakk](../../examples/retail-multiagent-arm-template) – Ühekordne juurutus  
- **📖 Arhitektuur**: [Mitme agendi koordineerimise mustrid](docs/chapter-06-pre-deployment/coordination-patterns.md) – Mustrid  

#### Praktilised harjutused  
```bash
# Käivitage täielik jaemüügi mitmeagendi lahendus
cd examples/retail-multiagent-arm-template
./deploy.sh

# Uurige agendi konfiguratsioone
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Peatüki tulemus**: Juuruta ja halda tootmiskõlblikku mitme agendiga AI lahendust koos kliendi- ja laoseisualgendiga  

---

### 🔍 6. peatükk: Eeljooksu valideerimine ja planeerimine  
**Eeltingimused**: Peatükk 4 lõpetatud  
**Kestus**: 1 tund  
**Kompleksus**: ⭐⭐  

#### Mida õpid  
- Mahuplaanimine ja ressursside valideerimine  
- SKU valiku strateegiad  
- Eellennuvihjed ja automatiseerimine  

#### Õppematerjalid  
- **📊 Planeerimine**: [Mahuplaanimine](docs/chapter-06-pre-deployment/capacity-planning.md) – Ressursside valideerimine  
- **💰 Valik**: [SKU valik](docs/chapter-06-pre-deployment/sku-selection.md) – Kuluefektiivsed valikud  
- **✅ Valideerimine**: [Eeljooksu kontrollid](docs/chapter-06-pre-deployment/preflight-checks.md) – Automatiseeritud skriptid  

#### Praktilised harjutused  
- Käivita mahu valideerimise skripte  
- Optimeeri SKU valikuid kulude vähendamiseks  
- Rakenda automatiseeritud eeljooksu kontrolle  

**💡 Peatüki tulemus**: Valideeri ja optimeeri juurutusi enne täitmist  

---

### 🚨 7. peatükk: Tõrkeotsing ja silumine  
**Eeltingimused**: Igas juurutuspeatükis osalemine  
**Kestus**: 1-1.5 tundi  
**Kompleksus**: ⭐⭐  

#### Mida õpid  
- Süsteemsed silumise lähenemisviisid  
- Levinud probleemid ja lahendused  
- AI-spetsiifiline tõrkeotsing  

#### Õppematerjalid  
- **🔧 Levinud probleemid**: [Levinud probleemid](docs/chapter-07-troubleshooting/common-issues.md) – KKK ja lahendused  
- **🕵️ Silumine**: [Silumise juhend](docs/chapter-07-troubleshooting/debugging.md) – Samm-sammuline strateegia  
- **🤖 AI probleemid**: [AI-spetsiifiline tõrkeotsing](docs/chapter-07-troubleshooting/ai-troubleshooting.md) – AI teenuste probleemid  

#### Praktilised harjutused  
- Diagnostika juurutusvigadele  
- Lahenda autentimisprobleeme  
- Silu AI teenuse ühenduvust  

**💡 Peatüki tulemus**: Ise diagnoosi ja lahenda levinud juurutusprobleeme  

---

### 🏢 8. peatükk: Tootmise ja ettevõtte mustrid  
**Eeltingimused**: Peatükid 1-4 lõpetatud  
**Kestus**: 2-3 tundi  
**Kompleksus**: ⭐⭐⭐⭐  

#### Mida õpid  
- Tootmises juurutamise strateegiad  
- Ettevõtte turvamustrid  
- Järelevalve ja kulude optimeerimine  

#### Õppematerjalid  
- **🏭 Tootmine**: [Tootmise AI parimad tavad](docs/chapter-08-production/production-ai-practices.md) – Ettevõtte mustrid  
- **📝 Näited**: [Mikroteenuste näide](../../examples/microservices) – Keerukad arhitektuurid  
- **📊 Järelevalve**: [Application Insights integratsioon](docs/chapter-06-pre-deployment/application-insights.md) – Järelevalve  

#### Praktilised harjutused  
- Rakenda ettevõtte turvamustreid  
- Loo põhjalik järelevalve  
- Juuruta tootmisse koos korraliku haldusega  

**💡 Peatüki tulemus**: Juuruta ettevõttesiseseid rakendusi täielike tootmisvõimalustega  

---

## 🎓 Töötuba ülevaade: Käed-külge õppe kogemus  

> **⚠️ TÖÖTOA STAATUS: Arendamisel**  
> Töötuba on hetkel arendus- ja täiendamisjärgus. Põhimoodulid toimivad, kuid mõned edasijõudnud osad on lõpetamata. Töötame aktiivselt kogu sisu valmimise nimel. [Jälgi edenemist →](workshop/README.md)  

### Interaktiivsed töötuba materjalid  
**Kattuv ning juhendatud õppe kogemus brauseripõhiste tööriistadega**  

Meie töötuba pakub struktureeritud, interaktiivset õppesessiooni, mis täiendab ülalkirjeldatud peatükipõhist õppekava. Töötuba on mõeldud nii iseseisvaks õppimiseks kui ka juhendajate juhtimisel.  

#### 🛠️ Töötuba funktsioonid  
- **Brauseripõhine liides**: Täielik MkDocs-põhine töötuba otsingu, kopeerimise ja teemadega  
- **GitHub Codespaces integratsioon**: Ühe klikiga arenduskeskkonna seadistus  
- **Struktureeritud õppekava**: 8 moodulit juhendatud harjutustega (kokku 3-4 tundi)  
- **Astmeline metoodika**: Sissejuhatus → Valik → Valideerimine → Lahtivõtmine → Konfigureerimine → Kohandamine → Lammutamine → Kokkuvõte  
- **Interaktiivne DevContainer keskkond**: Eelseadistatud tööriistad ja sõltuvused  

#### 📚 Töötuba moodulite struktuur  
Töötuba järgib **8-moodulilist astmelist metoodikat**, mis viib sind avastusest juurutamise meistrini:  

| Moodul | Teema | Mida teed | Kestus |  
|--------|-------|-----------|--------|  
| **0. Sissejuhatus** | Töötuba ülevaade | Mõista õpieesmärke, eeltingimusi ja struktuuri | 15 min |  
| **1. Valik** | Mallide avastamine | Uuri AZD malle ja vali sobiv AI mall oma stsenaariumi jaoks | 20 min |  
| **2. Valideerimine** | Juurutamine ja kontroll | Juuruta mall käsklusega `azd up` ja kontrolli infrastruktuuri toimimist | 30 min |  
| **3. Lahtivõtmine** | Struktuuri mõistmine | Kasuta GitHub Copilotit, et uurida malli arhitektuuri, Bicep-faile ja koodi korraldust | 30 min |  
| **4. Konfigureerimine** | azure.yaml süvaanalüüs | Õpi `azure.yaml` konfiguratsiooni, elutsükli silmuseid ja keskkonnamuutujaid | 30 min |  
| **5. Kohandamine** | Tee see omaks | Luba AI otsing, jälgimine, hindamine ja kohanda oma stsenaariumi jaoks | 45 min |  
| **6. Lammutamine** | Puhasta | Eemalda ressursid ohutult käsuga `azd down --purge` | 15 min |  
| **7. Kokkuvõte** | Järgmised sammud | Korda saadud teadmisi, põhimõisteid ja jätka õppeteekonda | 15 min |  

**Töötuba voog:**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 Töötuba käivitamine  
```bash
# Valik 1: GitHub Codespaces (Soovitatav)
# Klõpsake "Code" → "Create codespace on main" hoidlas

# Valik 2: Kohalik arendus
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Järgige juhiseid failis workshop/README.md
```
  
#### 🎯 Töötuba õpitulemused  
Töötuba lõpetades osalejad:  
- **Juurutavad tootmiskõlblikke AI rakendusi**: Kasutades AZD-d Microsoft Foundry teenustega  
- **Valdavad mitme agendi arhitektuure**: Rakendavad koordineeritud AI agendi lahendusi  
- **Rakendavad turvaparimaid tavasid**: Seadistavad autentimist ja juurdepääsu kontrolli  
- **Optimeerivad skaleeritavust**: Loovad kulutõhusaid ja jõudluskõlblikke juurutusi  
- **Tõrkeotsing juurutustel**: Lahendavad ise levinud probleemid  

#### 📖 Töötuba ressursid  
- **🎥 Interaktiivne juhend**: [Töötuba materjalid](workshop/README.md) – Brauseripõhine õpikeskkond  
- **📋 Moodulipõhised juhised**:  
  - [0. Sissejuhatus](workshop/docs/instructions/0-Introduction.md) – Töötuba ülevaade ja eesmärgid  
  - [1. Valik](workshop/docs/instructions/1-Select-AI-Template.md) – AI mallide leidmine ja valik  
  - [2. Valideerimine](workshop/docs/instructions/2-Validate-AI-Template.md) – Mallide juurutamine ja kontroll  
  - [3. Lahtivõtmine](workshop/docs/instructions/3-Deconstruct-AI-Template.md) – Malli arhitektuuri uurimine  
  - [4. Konfigureerimine](workshop/docs/instructions/4-Configure-AI-Template.md) – azure.yaml valdamine  
  - [5. Kohandamine](workshop/docs/instructions/5-Customize-AI-Template.md) – Kohandamine oma stsenaariumiks  
  - [6. Lammutamine](workshop/docs/instructions/6-Teardown-Infrastructure.md) – Ressursside puhastamine  
  - [7. Kokkuvõte](workshop/docs/instructions/7-Wrap-up.md) – Kordamine ja järgmised sammud  
- **🛠️ AI töötuba labor**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) – AI-keskse harjutused  
- **💡 Kiire algus**: [Töötuba seadistamise juhend](workshop/README.md#quick-start) – Keskkonna häälestus  

**Sobib ideaalselt**: Ettevõtete koolitustele, ülikoolikursustele, iseseisvaks õppimiseks ja arendajate bootcamp’idele.  

---

## 📖 Süvitsi: AZD võimalused  

Põhiteadmiste kõrval pakub AZD võimsaid võimalusi tootmiskõlblikuks juurutuseks:  

- **Mallipõhised juurutused** – Kasuta eelvalmistatud malle tavaliste rakendusmustrite jaoks  
- **Infrastruktuur koodina** – Halda Azure ressursse Bicep’i või Terraformi abil  
- **Integreeritud töövood** – Provisiisoni, juuruta ja järelevalve sujuvalt koos  
- **Arendajasõbralik** – Optimeeritud arendaja tootlikkuse ja kogemuse jaoks  

### **AZD + Microsoft Foundry: Täiuslik AI juurutusteks**  

**Miks valida AZD AI lahendustele?** AZD aitab lahendada AI arendajate suurimaid väljakutseid:  

- **AI-valmis mallid** – Eelseadistatud mallid Microsoft Foundry mudelitele, Azure AI teenustele ja ML töökoormustele  
- **Turvalised AI juurutused** – Sisseehitatud turvamustrid AI teenustele, API võtmetele ja mudeli otspunktidele  
- **Tootmise AI mustrid** – Parimad tavad skaleeritavate ja kulutõhusate AI rakenduste jaoks  
- **Lõpp-lõpuni AI töövood** – Mudeli arendusest tootmisse koos nõuetekohase järelevalvega  
- **Kulude optimeerimine** – Tark ressursside jaotamine ja skaleerimisstrateegiad AI töökoormustele  
- **Microsoft Foundry integratsioon** – Sujuv ühendus Microsoft Foundry mudeliraamatukogu ja otspunktidega  

---

## 🎯 Mallide ja näidiste kogu  

### Esiletõstetud: Microsoft Foundry mallid  
**Alusta siit, kui juurutad AI rakendusi!**  

> **Märkus:** Need mallid demonstreerivad erinevaid AI mustreid. Mõned on Azure näited, teised lokaalsed rakendused.  

| Mall | Peatükk | Kompleksus | Teenused | Tüüp |  
|----------|---------|------------|----------|------|  
| [**Alusta AI vestlusega**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Peatükk 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Välise |  
| [**Alusta AI agentidega**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Peatükk 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Välise |  
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Peatükk 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Välise |  
| [**OpenAI Chat App Kiire algus**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Peatükk 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Välise |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Peatükk 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Välise |  
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Peatükk 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Välise |  
| [**Jaemüügi mitme agendiga lahendus**](examples/retail-scenario.md) | Peatükk 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokaalne** |  

### Esiletõstetud: Täielikud õppestseenarid  
**Tootmiskõlblikud rakenduse mallid, mis vastavad õppepeatükkidele**  

| Mall | Õppepeatükk | Kompleksus | Peamine õppetulemus |  
|----------|------------------|------------|--------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Peatükk 2 | ⭐ | Põhilised AI juurutusmustrid |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Peatükk 2 | ⭐⭐ | RAG rakendus Azure AI Search’iga |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Peatükk 4 | ⭐⭐ | Dokumentide intelligentsi integratsioon |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Peatükk 5 | ⭐⭐⭐ | Agendi raamistik ja funktsiooni kutsumine |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Peatükk 8 | ⭐⭐⭐ | Ettevõtte AI orkestreerimine |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Peatükk 5 | ⭐⭐⭐⭐ | Mitme agendiga arhitektuur koos Kliendi ja Laoseisuga |  

### Õppimine näidete kaudu  

> **📌 Lokaalsed vs välised näited:**  
> **Lokaalsed näited** (selles repos) = Valmis kohe kasutamiseks  
> **Välised näited** (Azure näited) = Kloneeri seotud repodest  

#### Lokaalsed näited (valmis kasutamiseks)  
- [**Jaemüügi mitme agendiga lahendus**](examples/retail-scenario.md) – Täielik tootmiskõlblik rakendus ARM mallidega  
  - Mitme agendi arhitektuur (Kliendi + Laoseisu agendid)  
  - Ulatuslik järelevalve ja hindamine  
  - Ühe klikiga juurutamine ARM malliga  

#### Lokaalsed näited - konteinerirakendused (peatükid 2-5)  
**Üksikasjalikud konteinerite juurutamise näited selles hoidlas:**
- [**Container-rakenduste näited**](examples/container-app/README.md) - Täielik juhend konteineripõhiste juurutuste jaoks
  - [Lihtne Flaski API](../../examples/container-app/simple-flask-api) - Põhiline REST API koos skalaarvuks nullini
  - [Mikroteenuste arhitektuur](../../examples/container-app/microservices) - Tootmiskõlblik mitme teenuse juurutus
  - Kiire algus, tootmine ja arenenud juurutusmustrid
  - Jälgimise, turvalisuse ja kulude optimeerimise juhised

#### Välised näited - lihtsad rakendused (peatükid 1-2)
**Klooni need Azure prooviprojektide hoidlad, et alustada:**
- [Lihtne veebirakendus - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Põhilised juurutusmustrid
- [Staatiline veebisait - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staatilise sisu juurutus
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API juurutus

#### Välised näited - andmebaasi integreerimine (peatükid 3-4)  
- [Andmebaasirakendus - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Andmebaasi ühenduse mustrid
- [Funktsioonid + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverivaba andmetöövoog

#### Välised näited - arenenud mustrid (peatükid 4-8)
- [Java mikroteenused](https://github.com/Azure-Samples/java-microservices-aca-lab) - Mitme teenuse arhitektuurid
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Taustaprotsesside töötlemine  
- [Ettevõtte masinõppe torujuhe](https://github.com/Azure-Samples/mlops-v2) - Tootmiskõlblikud ML-mustrid

### Välised mallide kogumikud
- [**Ametlik AZD malligalerii**](https://azure.github.io/awesome-azd/) - Hoolikalt valitud ametlikud ja kogukonna mallid
- [**Azure Developer CLI mallid**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn mallide dokumentatsioon
- [**Näidiste kataloog**](examples/README.md) - Kohalikud õppenäited üksikasjalike selgitustega

---

## 📚 Õppematerjalid ja viited

### Kiired viited
- [**Käsu abileht**](resources/cheat-sheet.md) - Olulised azd käsud peatükkide kaupa
- [**Sõnastik**](resources/glossary.md) - Azure ja azd terminoloogia  
- [**KKK**](resources/faq.md) - Levinumad küsimused peatükkide kaupa
- [**Õppejuhend**](resources/study-guide.md) - Põhjalikud harjutused

### Praktilised töötoad
- [**AI töötuba labor**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee oma AI lahendused AZD-ga juurutatavaks (2-3 tundi)
- [**Interaktiivne töötuba**](workshop/README.md) - 8 moodulist koosnev juhendatud harjutuste sari MkDocs ja GitHub Codespacesiga
  - Järjepidev järgmises järjekorras: Sissejuhatus → Valik → Kinnitus → De- konstruktsioon → Konfiguratsioon → Kohandamine → Lõpetamine → Kokkuvõte

### Välised õppematerjalid
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure arhitektuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure hinnakalkulaator](https://azure.microsoft.com/pricing/calculator/)
- [Azure olek](https://status.azure.com/)

### AI agentide oskused sinu redaktori jaoks
- [**Microsoft Azure oskused aadressil skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 avatud agentide oskust Azure AI, Foundry, juurutuse, diagnostika, kulude optimeerimise ja muu jaoks. Paigalda need GitHub Copilot, Cursor, Claude Code või mõnda toetatud agenti:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Kiire tõrkeotsingu juhend

**Levinumad probleemid, millega algajad kokku puutuvad, ja kiire lahendus:**

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
# Loetle saadaolevad tellimused
az account list --output table

# Sea vaikimisi tellimus
az account set --subscription "<subscription-id-or-name>"

# Sea AZD keskkonnale
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Kontrolli
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" või "Kvood ületatud"</strong></summary>

```bash
# Proovi erinevat Azure'i regioon
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
<summary><strong>❌ "azd up" ebaõnnestub protsessi keskel</strong></summary>

```bash
# Variant 1: Puhasta ja proovi uuesti
azd down --force --purge
azd up

# Variant 2: Paranda ainult infrastruktuur
azd provision

# Variant 3: Kontrolli üksikasjalikku staatust
azd show

# Variant 4: Kontrolli logisid Azure Monitoris
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentimine ebaõnnestus" või "Token on aegunud"</strong></summary>

```bash
# Autendi uuesti AZD jaoks
azd auth logout
azd auth login

# Valikuline: värskenda ka Azure CLI, kui kasutad az käsklusi
az logout
az login

# Kontrolli autentimist
az account show
```
</details>

<details>
<summary><strong>❌ "Resurss on juba olemas" või nimekonfliktid</strong></summary>

```bash
# AZD genereerib unikaalseid nimesid, kuid kui tekib konflikt:
azd down --force --purge

# Siis proovige uuesti uue keskkonnaga
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Malli juurutamine võtab liiga kaua aega</strong></summary>

**Tavalised ooteajad:**
- Lihtne veebirakendus: 5–10 minutit
- Rakendus andmebaasiga: 10–15 minutit
- AI rakendused: 15–25 minutit (OpenAI juurutus on aeglane)

```bash
# Kontrolli edenemist
azd show

# Kui takerdud >30 minutit, vaata Azure Portaalis:
azd monitor --overview
# Otsi ebaõnnestunud juurutusi
```
</details>

<details>
<summary><strong>❌ "Luba keelatud" või "Keelatud"</strong></summary>

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
<summary><strong>❌ Ei leia juurutatud rakenduse URL-i</strong></summary>

```bash
# Kuvada kõik teenuse lõpp-punktid
azd show

# Või ava Azure portaal
azd monitor

# Kontrolli kindlat teenust
azd env get-values
# Otsi *_URL muutujaid
```
</details>

### 📚 Täielikud tõrkeotsingu ressursid

- **Levinud probleemide juhend:** [Üksikasjalikud lahendused](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-spetsiifilised probleemid:** [AI tõrkeotsing](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Silumise juhend:** [Järkjärguline silumine](docs/chapter-07-troubleshooting/debugging.md)
- **Abi saamine:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursuse lõpetamine ja sertifitseerimine

### Edusammude jälgimine
Jälgi oma õppe edenemist iga peatüki järgi:

- [ ] **Peatükk 1**: Alused ja kiire algus ✅
- [ ] **Peatükk 2**: AI-esimene arendus ✅  
- [ ] **Peatükk 3**: Konfiguratsioon ja autentimine ✅
- [ ] **Peatükk 4**: Infrastruktuur koodina ja juurutamine ✅
- [ ] **Peatükk 5**: Mitme-agent AI lahendused ✅
- [ ] **Peatükk 6**: Eeljärjestuse kinnitamine ja planeerimine ✅
- [ ] **Peatükk 7**: Tõrkeotsing ja silumine ✅
- [ ] **Peatükk 8**: Tootmine ja ettevõtte mustrid ✅

### Õppimise kontroll
Pärast iga peatüki lõpetamist testi oma teadmisi:
1. **Praktiline harjutus**: Lõpeta peatüki praktiline juurutus
2. **Teadmiste kontroll**: Vaata üle KKK osa oma peatüki kohta
3. **Kogukonna arutelu**: Jaga oma kogemust Azure Discordis
4. **Järgmine peatükk**: Liigu järgmise keerukustaseme juurde

### Kursuse lõpetamise eelised
Kõigi peatükkide läbimise järel saad:
- **Tootmiskogemuse**: Juurutasid reaalseid AI rakendusi Azure’i
- **Professionaalsed oskused**: Ettevõtte valmidusega juurutusvõimekus  
- **Kogukonna tunnustuse**: Azure arendajate aktiivne liige
- **Kariääri areng**: Nõutud AZD ja AI juurutusspetsialist

---

## 🤝 Kogukond ja tugi

### Abi ja tugi
- **Tehnilised küsimused**: [Teata vigadest ja esita funktsioonisoove](https://github.com/microsoft/azd-for-beginners/issues)
- **Õppeküsimused**: [Microsoft Azure Discordi kogukond](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-spetsiifiline abi**: Liitu [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentatsioon**: [Ametlik Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Kogukonna tagasiside Microsoft Foundry Discordist

**Hiljutised küsitluste tulemused #Azure kanalist:**
- **45%** arendajatest soovib kasutada AZD-d AI töökoormuste jaoks
- **Peamised väljakutsed**: mitme teenuse juurutamine, volituste haldamine, tootmisvalmidus  
- **Kõige nõutumad**: AI-spetsiifilised mallid, tõrkeotsingu juhendid, parimad tavad

**Liitu meie kogukonnaga, et:**
- Jagada oma AZD + AI kogemusi ja saada abi
- Saabuda AI uute mallide varajast ettevaadet
- Panustada AI juurutamise parimatesse tavadesse
- Mõjutada tulevikue AI + AZD funktsioonide arendust

### Kursuste panustamine
Tervitame panuseid! Palun loe meie [Panustamise juhendit](CONTRIBUTING.md), mis sisaldab juhiseid:
- **Sisu täiustamine**: täiusta olemasolevaid peatükke ja näiteid
- **Uued näited**: lisa reaalseid stsenaariumeid ja malle  
- **Tõlkimine**: aita hoida mitmekeelse tuge
- **Vigade raportid**: paranda täpsust ja selgust
- **Kogukonna standardid**: järgi kaasava kogukonna juhiseid

---

## 📄 Kursuse info

### Litsents
See projekt on litsentseeritud MIT litsentsi alusel - vaata [LICENSE](../../LICENSE) faili üksikasju.

### Seotud Microsofti õppematerjalid

Meie meeskond toodab teisi põhjalikke õppematerjale:

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
[![Generatiivne tehisintellekt (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Põhjalik õpe
[![Masinõpe algajatele](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Andmeteadus algajatele](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Tehisintellekt algajatele](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Küberjulgeolek algajatele](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Veebiarendus algajatele](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT algajatele](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR arendus algajatele](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot seeria
[![Copilot AI paarisprogrammeerimiseks](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET jaoks](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot seiklus](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kooli navigeerimine

**🚀 Valmis õppima hakkama?**

**Algajatele**: Alusta [1. peatükk: vundament ja kiire algus](#-chapter-1-foundation--quick-start)  
**Tehisintellekti arendajatele**: Liigu otse [2. peatükk: AI-esimene arendus](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Kogenud arendajatele**: Alusta [3. peatükk: Konfiguratsioon ja autentimine](#️-chapter-3-configuration--authentication)

**Järgmised sammud**: [Alusta 1. peatükist - AZD põhitõed](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->