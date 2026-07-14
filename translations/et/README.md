# AZD algajatele: Struktureeritud õppeprogramm

![AZD-for-beginners](../../translated_images/et/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automaatne tõlkimine (alati ajakohane)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](./README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Eelistad kloonimist lokaalselt?**
>
> See hoidla sisaldab 50+ keele tõlget, mis suurendab oluliselt allalaadimise suurust. Tõlgeteta kloonimiseks kasuta spetsiifilist valikut:
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
> See annab sulle kõik vajaliku kursuse lõpetamiseks palju kiiremalt alla laadides.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Mis on täna uue azd-s

> 📌 See kursus on valideeritud **`azd 1.27.1`** (juuli 2026) versiooniga. Kontrolli oma versiooni käsuga `azd version` ja uuenda käsuga `azd upgrade`.

Azure Developer CLI on kasvanud kaugemale traditsioonilistest veebirakendustest ja API-dest. Täna on azd ainus tööriist ükskõik millise rakenduse Azure'i juurutamiseks — sealhulgas AI-põhiste rakenduste ja intelligentsete agentide jaoks.

Mida see tähendab sulle:

- **AI-agentid on nüüd esmaklassilised azd töökoormused.** Saad AI-agentide projekte algatada, juurutada ja hallata samade `azd init` → `azd up` käskudega nagu ennegi.
- **Täielik agendi elutsükkel CLI kaudu.** `azure.ai.agents` laiendus katab nüüd kogu protsessi — `azd ai agent init` skeleti loomiseks, `azd ai agent invoke` testimiseks (vastuseaja väljundiga), `azd ai agent eval generate` ja `azd ai agent optimize` kvaliteedi mõõtmiseks ja parandamiseks ning `azd ai agent delete` puhastamiseks.
- **Rohkem AI ehituskive.** Uued eelvaate laiendused — `azure.ai.skills` ja `azure.ai.connections` — võimaldavad hallata taaskasutatavaid agendi oskusi ja Foundry ühendusi otse azd-ga.
- **Microsoft Foundry integratsioon** toob mudelite juurutamise, agendi majutamise ja AI teenuse konfiguratsiooni otse azd mallide ökosüsteemi.
- **Sujuvam igapäevane kasutamine.** Viimased versioonid tegid `azd init` korduvturvaliseks, `azd auth login` puhastab aegunud tokenid automaatselt ja lisasid sõbraliku `azd tool` esmakordse seadistamise nõustaja.
- **Tuumprotsess pole muutunud.** Olgu juurutamiseks todo-rakendus, mikroteenus või mitme-agentiga AI lahendus — käsud on samad.

> **Märkus Aspire kasutajatele:** Microsoft nimetab toodet nüüd lihtsalt Aspire'iks (endise nimega ".NET Aspire"). azd Aspire tugi on muutumatult samasugune — nime muutmine on ainus erinevus.

Kui oled varem azd kasutanud, on AI tugi loomulik laiendus, mitte eraldi tööriist või keeruline rada. Kui alustad nullist, õpid ühe töövoo, mis sobib kõigeks.

---

## 🚀 Mis on Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** on arendajasõbralik käsurea tööriist, mis lihtsustab rakenduste juurutamist Azure'is. Selle asemel, et käsitsi luua ja ühendada kümneid Azure ressursse, saad kogu rakenduse ühe käsuga juurutada.

### `azd up` võlu

```bash
# See üks käsk teeb kõik:
# ✅ Loob kõik Azure ressursid
# ✅ Konfigureerib võrgu ja turvalisuse
# ✅ Koostab teie rakenduse koodi
# ✅ Paigaldab Azuresse
# ✅ Annab teile töökorras URL-i
azd up
```

**See ongi kõik!** Puudub vajadus klikkida Azure portaalis, õppida keerukaid ARM malle või teha käsitsi konfigureerimist — lihtsalt töökorrad Azure'is.

---

## ❓ Azure Developer CLI vs Azure CLI: mis vahe on?

See on kõige sagedasem küsimus algajate seas. Lihtne vastus:

| Funktsioon | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Eesmärk** | Haldab üksikuid Azure ressursse | Juurutab terviklikke rakendusi |
| **Mõtteviis** | Infrastruktuuri keskmes | Rakenduse keskmes |
| **Näide** | `az webapp create --name myapp...` | `azd up` |
| **Õppimiskõver** | Tuleb teada Azure teenuseid | Piisab oma rakendusest |
| **Parim kasutus** | DevOps, infrastruktuur | Arendajad, prototüüpimine |

### Lihtne võrdlus

- **Azure CLI** on nagu kõik tööriistad maja ehitamiseks - haamrid, saed, naelad. Võid ehitada kõike, aga pead ehitamise ära oskama.
- **Azure Developer CLI** on nagu tellid ehitusfirma — sa kirjeldad, mida tahad, nemad ehitavad selle ära.

### Millal kumbagi kasutada

| Stsenaarium | Kasuta seda |
|----------|----------|
| "Tahan oma veebirakendust kiiresti juurutada" | `azd up` |
| "Vajan ainult salvestusruumi kontot" | `az storage account create` |
| "Ehitan täisväärtuslikku AI rakendust" | `azd init --template azure-search-openai-demo` |
| "Vajan konkreetse Azure ressursi silumist" | `az resource show` |
| "Tahan tootmisvalmis juurutust minutitega" | `azd up --environment production` |

### Need töötavad koos!

AZD kasutab azuri CLI-t taga. Saad kasutada mõlemat:
```bash
# Rakenda oma rakendus AZD-ga
azd up

# Seejärel häälesta konkreetseid ressursse Azure CLI-ga
az webapp config set --name myapp --always-on true
```

---

## 🌟 Leia mallid Awesome AZD-st

Ära alusta nullist! **Awesome AZD** on kogukonna kollektsioon juurutamiseks valmis mallidest:

| Ressurss | Kirjeldus |
|----------|-------------|
| 🔗 [**Awesome AZD galerii**](https://azure.github.io/awesome-azd/) | Sirvi üle 200 malliga ühe klõpsuga juurutust |
| 🔗 [**Esita mall**](https://github.com/Azure/awesome-azd/issues) | Panusta oma mall kogukonna jaoks |
| 🔗 [**GitHub Hoidla**](https://github.com/Azure/awesome-azd) | Anna täht ja uuri lähtekoodi |

### Populaarsed AI mallid Awesome AZD-st

```bash
# RAG vestlus Microsoft Foundry mudelite ja AI otsinguga
azd init --template azure-search-openai-demo

# Kiire AI vestlusrakendus
azd init --template openai-chat-app-quickstart

# AI agendid koos Foundry agentidega
azd init --template get-started-with-ai-agents
```

---

## 🎯 Algus 3 sammuga

Enne alustamist veendu, et su masin sobib soovitud malli juurutamiseks:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Kui mõni vajalik kontroll ebaõnnestub, paranda see esmalt ja siis jätka kiire algusega.

### 1. samm: paigalda AZD (2 minutit)

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

### 2. samm: autentimine AZD jaoks

```bash
# Valikuline, kui plaanite selles kursuses kasutada otse Azure CLI käske
az login

# Nõutav AZD töövoogude jaoks
azd auth login
```

Kui sa pole kindel, millist autentimist vaja on, järgi kogu seadistuse juhiseid lehel [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### 3. samm: juuruta esimene rakendus

```bash
# Algatamine mallist
azd init --template todo-nodejs-mongo

# Paigalda Azure'i (loo kõik!)
azd up
```

**🎉 See ongi kõik!** Sinu rakendus on nüüd Azure'is otse saadaval.

### Puhastus (ära unusta!)

```bash
# Eemalda kõik ressursid, kui eksperimenteerimine on lõpetatud
azd down --force --purge
```

---

## 📚 Kuidas seda kursust kasutada

See kursus on loodud **järkjärguliseks õppimiseks** — alusta seal, kus end mugavalt tunned, ja edene järk-järgult:

| Sinu kogemus | Alusta siit |
|-----------------|------------|
| **Täitsa uus Azure'is** | [1. peatükk: Alus](#-chapter-1-foundation--quick-start) |
| **Tunned Azure'i, uus azd-s** | [1. peatükk: Alus](#-chapter-1-foundation--quick-start) |
| **Soovid juurutada AI rakendusi** | [2. peatükk: AI-esmane arendus](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Soovid praktilist harjutust** | [🎓 Interaktiivne töötuba](workshop/README.md) — 3-4 tunni juhendatud labor |
| **Vajan tootmis mustreid** | [8. peatükk: Tootmine ja ettevõtte mustrid](#-chapter-8-production--enterprise-patterns) |

### Kiire seadistus

1. **Forki see hoidla**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klooni see**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Küsi abi**: [Azure Discord kogukond](https://discord.com/invite/ByRwuEEgH4)

> **Eelistad kloonimist lokaalselt?**

> See hoidla sisaldab 50+ keele tõlget, mis suurendab oluliselt allalaadimise suurust. Tõlgeteta kloonimiseks kasuta spetsiifilist valikut:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> See annab sulle kõik vajaliku kursuse lõpetamiseks palju kiiremalt alla laadides.


## Kursuse ülevaade

Saa Azure Developer CLI (azd) meister läbi struktureeritud peatükkide, mis on loodud järkjärguliseks õppimiseks. **Eriti keskendudes AI-rakenduste juurutamisele Microsoft Foundry integratsiooniga.**


### Miks see kursus on kaasaegsete arendajate jaoks oluline

Tuginedes Microsoft Foundry Discord kogukonna teadmistele, soovib **45% arendajatest kasutada AZD-d tehisintellekti töökoormuste jaoks**, kuid nad puutuvad kokku järgmiste väljakutsetega:
- Keerukad mitme teenusega tehisintellekti arhitektuurid
- Tootmise tehisintellekti juurutamise parimad praktikad  
- Azure AI teenuste integreerimine ja konfigureerimine
- Tehisintellekti töökoormuste kulude optimeerimine
- Tehisintellektile spetsiifiliste juurutamisprobleemide tõrkeotsing

### Õpieesmärgid

Selle struktureeritud kursuse läbimisel:
- **Valdad AZD põhialuseid**: põhimõisted, installimine ja konfiguratsioon
- **Juuruta tehisintellekti rakendusi**: kasuta AZD-d koos Microsoft Foundry teenustega
- **Rakenda infrastruktuur koodina**: halda Azure’i ressursse Bicep mallide abil
- **Tõrkeotsing juurutamisel**: lahenda tavalisi probleeme ja debugi
- **Optimeeri tootmiseks**: turvalisus, skaleerimine, jälgimine ja kulude juhtimine
- **Ehita mitmeagendilisi lahendusi**: juuruta keerukaid tehisintellekti arhitektuure

## Enne alustamist: kontod, ligipääs ja eeldused

Enne 1. peatüki alustamist veendu, et sul on alljärgnevad asjad olemas. Selle juhendi paigaldusprotseduurid eeldavad, et need baasteadmised on juba korraldatud.

- **Azure’i tellimus**: võid kasutada olemasolevat töökeskkonna või isikliku konto tellimust või luua [tasuta prooviperioodi](https://aka.ms/azurefreetrial) alustamiseks.
- **Õigus Azure’i ressursside loomiseks**: enamus harjutuste puhul peaks sul olema vähemalt **Contributor** juurdepääs sihttellimusele või ressursigrupile. Mõnes peatükis eeldatakse ka ressursigruppide, hallatavate identiteetide ja RBAC rollide loomise õigust.
- [**GitHubi konto**](https://github.com): kasulik hoidla forkimiseks, oma muudatuste jälgimiseks ja GitHub Codespaces kasutamiseks töötoas.
- **Mallide käituse eeltingimused**: mõned mallid nõuavad kohalikke tööriistu nagu Node.js, Python, Java või Docker. Käivita installi valideerija enne alustamist, et puuduvaid tööriistu varakult märgata.
- **Põhilised terminali teadmised**: pole vaja olla ekspert, kuid peaksid olema mugav seadistama käske nagu `git clone`, `azd auth login` ja `azd up`.

> **Tööandja tellimus?**
> Kui su Azure’i keskkonda haldab administraator, kinnita eelnevalt, et saad juurutada ressursse tellimuses või ressursigrupis, mida plaanid kasutada. Kui mitte, siis palu enne alustamist proovikeskkonna tellimust või Contributor ligipääsu.

> **Azure’i kasutajana uus?**
> Alusta oma tasuta Azure’i prooviperioodist või pay-as-you-go tellimusest aadressil https://aka.ms/azurefreetrial, et saaksid harjutusi lõpuni teha ilma ooteaegadeta kogu organisatsiooni tasemel kinnitusteks.

## 🗺️ Kursuse kaart: kiire navigeerimine peatükkide kaupa

Igal peatükil on oma README, kus on õpieesmärgid, kiire algus ja harjutused:

| Peatükk | Teema | Õppetunnid | Kestus | Keerukus |
|---------|-------|---------|----------|------------|
| **[1. peatükk: Alused](docs/chapter-01-foundation/README.md)** | Algus | [AZD põhialused](docs/chapter-01-foundation/azd-basics.md) &#124; [Paigaldus](docs/chapter-01-foundation/installation.md) &#124; [Esimene projekt](docs/chapter-01-foundation/first-project.md) | 30-45 minutit | ⭐ |
| **[2. peatükk: AI arendus](docs/chapter-02-ai-development/README.md)** | AI-esimesed rakendused | [Foundry integratsioon](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agendid](docs/chapter-02-ai-development/agents.md) &#124; [Mudelite juurutus](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Töötuba](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 tundi | ⭐⭐ |
| **[3. peatükk: Konfiguratsioon](docs/chapter-03-configuration/README.md)** | Autentimine ja turvalisus | [Konfiguratsioon](docs/chapter-03-configuration/configuration.md) &#124; [Autentimine ja turvalisus](docs/chapter-03-configuration/authsecurity.md) | 45-60 minutit | ⭐⭐ |
| **[4. peatükk: Infrastruktuur](docs/chapter-04-infrastructure/README.md)** | IaC ja juurutus | [Juurutusjuhend](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Ressursside provisjonimine](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 tundi | ⭐⭐⭐ |
| **[5. peatükk: Mitmeagent](docs/chapter-05-multi-agent/README.md)** | AI agentide lahendused | [Jaemüügistsenaarium](examples/retail-scenario.md) &#124; [Koordineerimismustrid](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 tundi | ⭐⭐⭐⭐ |
| **[6. peatükk: Eeljuurutus](docs/chapter-06-pre-deployment/README.md)** | Planeerimine ja valideerimine | [Eelvalmiduse kontrollid](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasiteedi planeerimine](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU valik](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 tund | ⭐⭐ |
| **[7. peatükk: Tõrkeotsing](docs/chapter-07-troubleshooting/README.md)** | Debugimine ja parandamine | [Tavalised probleemid](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugimine](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI probleemid](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 tundi | ⭐⭐ |
| **[8. peatükk: Tootmine](docs/chapter-08-production/README.md)** | Ettevõtte mustrid | [Tootmise praktikad](docs/chapter-08-production/production-ai-practices.md) | 2-3 tundi | ⭐⭐⭐⭐ |
| **[🎓 Töötuba](workshop/README.md)** | Praktiline töötoa osa | [Sissejuhatus](workshop/docs/instructions/0-Introduction.md) &#124; [Mallide valik](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Mallide valideerimine](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Mallide dekonstruerimine](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Mallide konfigureerimine](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Kohandamine](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Infrastruktuuri lammutamine](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Kokkuvõte](workshop/docs/instructions/7-Wrap-up.md) | 3-4 tundi | ⭐⭐ |

**Kogu kursuse kestus:** ~10-14 tundi | **Oskuste tase:** Algaja → tootmiseks valmis

---

## 📚 Õppepeatükid

*Vali õppekava vastavalt kogemustasemele ja eesmärkidele*

### 🚀 Peatükk 1: Alused ja kiire algus
**Eeltingimused**: Azure’i tellimus, põhilised käsurea teadmised  
**Kestus**: 30-45 minutit  
**Keerukus**: ⭐

#### Mida õpid
- Azure Developer CLI (AZD) põhialused
- AZD paigaldamine sinu platvormile
- Sinu esimene edukas juurutus

#### Õppematerjalid
- **🎯 Alusta siit**: [Mis on Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teooria**: [AZD põhialused](docs/chapter-01-foundation/azd-basics.md) - põhimõisted ja terminoloogia
- **⚙️ Paigaldus**: [Paigaldus ja seadistus](docs/chapter-01-foundation/installation.md) - platvormispetsiifilised juhised
- **🛠️ Praktiline**: [Sinu esimene projekt](docs/chapter-01-foundation/first-project.md) - samm-sammult õpetus
- **📋 Kiirviide**: [Käsu kiirsõnastik](resources/cheat-sheet.md)

#### Praktilised harjutused
```bash
# Kiire paigalduse kontroll
azd version

# Paigaldage oma esimene rakendus
azd init --template todo-nodejs-mongo
azd up
```

**💡 Peatüki tulemus**: Juurutada edukalt lihtne veebirakendus Azure’i kasutades AZD-d

**✅ Edu kinnitamine:**
```bash
# Pärast 1. peatüki lõpetamist peaksid saama:
azd version              # Kuvab paigaldatud versiooni
azd init --template todo-nodejs-mongo  # Inicialiseerib projekti
azd up                  # Paigaldab Azure'i
azd show                # Kuvab töötava rakenduse URL-i
# Rakendus avaneb brauseris ja töötab
azd down --force --purge  # Ressursid koristatakse
```

**📊 Ajainvesteering:** 30-45 minutit  
**📈 Oskustase pärast:** Suudab iseseisvalt juurutada lihtsaid rakendusi
**📈 Oskustase pärast:** Suudab iseseisvalt juurutada lihtsaid rakendusi

---

### 🤖 Peatükk 2: AI-esimesed lahendused (Soovitatav tehisintellekti arendajatele)
**Eeltingimused**: Peatükk 1 lõpetatud  
**Kestus**: 1-2 tundi  
**Keerukus**: ⭐⭐

#### Mida õpid
- Microsoft Foundry integratsioon AZD-ga
- Tehisintellekti-põhiste rakenduste juurutamine
- Tehisintellekti teenuste konfiguratsioonide mõistmine

#### Õppematerjalid
- **🎯 Alusta siit**: [Microsoft Foundry integratsioon](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agendid**: [AI agentide juhend](docs/chapter-02-ai-development/agents.md) - intelligentsete agentide juurutamine AZD-ga
- **📖 Mustrid**: [AI mudelite juurutus](docs/chapter-02-ai-development/ai-model-deployment.md) - AI mudelite juurutamine ja haldamine
- **🛠️ Töötuba**: [AI töötuba](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee oma AI lahendused AZD-valmis
- **🎥 Interaktiivne juhend**: [Töötoa materjalid](workshop/README.md) - sirvijasõbralik õppimine MkDocs’iga * DevContainer keskkond
- **📋 Mallid**: [Microsoft Foundry mallid](#töötuba-ressursid)
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

**💡 Peatüki tulemus**: Juurutada ja konfigureerida AI-põhist vestlusrakendust RAG võimekusega

**✅ Edu kinnitamine:**
```bash
# Pärast 2. peatükki peaksid sa suutma:
azd init --template azure-search-openai-demo
azd up
# Testida AI vestlusliidest
# Esitada küsimusi ja saada AI-toega vastuseid koos allikatega
# Kontrollida, et otsingu integreerimine töötab
azd monitor  # Kontrollida, et Application Insights kuvab telemeetriat
azd down --force --purge
```

**📊 Ajainvesteering:** 1-2 tundi  
**📈 Oskustase pärast:** Suudab juurutada ja konfigureerida tootmiseks valmis AI rakendusi  
**💰 Kulu teadlikkus:** Mõistab $80-150/kuus arenduskulusid, $300-3500/kuus tootmiskulusid

#### 💰 Kulude kaalutlused AI juurutamisel

**Arenduskeskkond (hinnanguliselt $80-150/kuus):**
- Microsoft Foundry mudelid (tasu kasutuse põhjal): $0-50/kuus (sõltuvalt tokenite kasutusest)
- AI Search (algtase): $75/kuus
- Container Apps (tarbimisepõhine): $0-20/kuus
- Salvestusruum (standard): $1-5/kuus

**Tootmiskeskkond (hinnanguliselt $300-3500+/kuus):**
- Microsoft Foundry mudelid (PTU pideva jõudluse tarbeks): $3000+/kuus VÕI tasu kasutuse järgi suure mahuga
- AI Search (standard): $250/kuus
- Container Apps (pühendatud): $50-100/kuus
- Application Insights: $5-50/kuus
- Salvestusruum (premium): $10-50/kuus

**💡 Kulude optimeerimise näpunäited:**
- Kasuta **tasuta kihti** Microsoft Foundry mudelite õppimiseks (Azure OpenAI 50 000 tokenit kuus kaasas)
- Käivita `azd down`, et vabastada ressursid, kui sa aktiivselt ei arenda
- Alusta tarbimise alusel arveldamisest, uuenda PTU-le vaid tootmiseks
- Kasuta `azd provision --preview` kulude hindamiseks enne juurutamist
- Luba automaatne skaleerimine: maksa ainult tegeliku kasutuse eest

**Kulude jälgimine:**
```bash
# Kontrolli hinnangulisi igakuiste kulutuste summasid
azd provision --preview

# Jälgi tegelikke kulutusi Azure portaali kaudu
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Peatükk 3: Konfiguratsioon ja autentimine
**Eeltingimused**: Peatükk 1 lõpetatud  
**Kestus**: 45-60 minutit  
**Keerukus**: ⭐⭐

#### Mida õpid
- Keskkonna konfiguratsioon ja haldus
- Autentimise ja turvalisuse parimad praktikad
- Ressursside nimetamine ja organiseerimine

#### Õppematerjalid
- **📖 Konfiguratsioon**: [Konfiguratsioonijuhend](docs/chapter-03-configuration/configuration.md) - keskkonna seadistamine
- **🔐 Turvalisus**: [Autentimise mustrid ja hallatud identiteet](docs/chapter-03-configuration/authsecurity.md) - autentimise mustrid
- **📝 Näited**: [Andmebaasi rakenduse näide](examples/database-app/README.md) - AZD andmebaasi näited

#### Praktilised harjutused
- Konfigureeri mitut keskkonda (arendus, etapp, tootmine)
- Loo hallatud identiteedi autentimine
- Rakenda keskkonnapõhiseid konfiguratsioone

**💡 Peatüki tulemus**: Haldada mitut keskkonda õige autentimise ja turvalisusega

---

### 🏗️ Peatükk 4: Infrastruktuur koodina & juurutus
**Eeltingimused**: Peatükid 1-3 lõpetatud  
**Kestus**: 1-1.5 tundi  
**Keerukus**: ⭐⭐⭐

#### Mida õpid
- Täiustatud juurutusmustrid
- Infrastruktuur koodina Bicep abil
- Ressursside provisjonimise strateegiad

#### Õppematerjalid
- **📖 Juurutus**: [Juurutusjuhend](docs/chapter-04-infrastructure/deployment-guide.md) - täielikud töövood
- **🏗️ Provisjonimine**: [Ressursside provisjonimine](docs/chapter-04-infrastructure/provisioning.md) - Azure’i ressursihaldus
- **📝 Näited**: [Container App näide](../../examples/container-app) - konteineripõhised juurutused

#### Praktilised harjutused
- Loo kohandatud Bicep mallid
- Juuruta mitme teenusega rakendusi
- Rakenda sinine-roheline juurutamisstrateegiaid

**💡 Peatüki tulemus**: Juurutada keerukaid mitme teenusega rakendusi kasutades kohandatud infrastruktuurimallide

---


### 🎯 5. peatükk: Mitme agenti AI lahendused (edasijõudnutele)
**Eeldused**: Peatükid 1-2 lõpetatud  
**Kestus**: 2-3 tundi  
**Keerukus**: ⭐⭐⭐⭐

#### Mida sa õpid
- Mitme agenti arhitektuuri mustrid
- Agendi orkestreerimine ja koordineerimine
- Tootmisvalmis AI rakendused

#### Õppematerjalid
- **🤖 Esile toodud projekt**: [Jaemüügi mitme agenti lahendus](examples/retail-scenario.md) - Täielik rakendus
- **🛠️ ARM mallid**: [ARM malli pakett](../../examples/retail-multiagent-arm-template) - Ühe klõpsuga juurutus
- **📖 Arhitektuur**: [Mitme agenti koordineerimise mustrid](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mustrid

#### Praktilised harjutused
```bash
# Paigalda täielik jaemüügi mitmeagendi lahendus
cd examples/retail-multiagent-arm-template
./deploy.sh

# Uuri agentide konfiguratsioone
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Peatüki tulemus**: Juuruta ja halda tootmisvalmis mitme agenti AI lahendust koos Kliendi- ja Laoseis agentidega

---

### 🔍 6. peatükk: Eeljuurutuse valideerimine ja planeerimine
**Eeldused**: 4. peatükk lõpetatud  
**Kestus**: 1 tund  
**Keerukus**: ⭐⭐

#### Mida sa õpid
- Kapatsiteedi planeerimine ja ressursside valideerimine
- SKU valiku strateegiad
- Eelkontrollid ja automatiseerimine

#### Õppematerjalid
- **📊 Planeerimine**: [Kapatsiteedi planeerimine](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressursside valideerimine
- **💰 Valik**: [SKU valik](docs/chapter-06-pre-deployment/sku-selection.md) - Kuluefektiivsed valikud
- **✅ Valideerimine**: [Eelkontrollid](docs/chapter-06-pre-deployment/preflight-checks.md) - Automaatsete skriptidega

#### Praktilised harjutused
- Käivita kapatsiteedi valideerimise skripte
- Optimeeri SKU valikuid kulude alusel
- Rakenda automatiseeritud eeljuurutuse kontrolle

**💡 Peatüki tulemus**: Valideeri ja optimeeri juurutusi enne täitmist

---

### 🚨 7. peatükk: Tõrkeotsing ja silumine
**Eeldused**: Igast juurutuse peatükist lõpetatud  
**Kestus**: 1-1.5 tundi  
**Keerukus**: ⭐⭐

#### Mida sa õpid
- Süstemaatilised silumisvõtted
- Levinud probleemid ja lahendused
- AI-spetsiifiline tõrkeotsing

#### Õppematerjalid
- **🔧 Levinud probleemid**: [Levinud probleemid](docs/chapter-07-troubleshooting/common-issues.md) - KKK ja lahendused
- **🕵️ Silumine**: [Silumise juhend](docs/chapter-07-troubleshooting/debugging.md) - Samm-sammuline strateegia
- **🤖 AI probleemid**: [AI-spetsiifiline tõrkeotsing](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI teenuse probleemid

#### Praktilised harjutused
- Diagnostik a juurutuse tõrkeid
- Lahenda autentimise probleemid
- Silu AI teenuse ühenduvust

**💡 Peatüki tulemus**: Iseseisvalt diagnoosi ja lahenda levinud juurutuse probleemid

---

### 🏢 8. peatükk: Tootmis- ja ettevõtete mustrid
**Eeldused**: Peatükid 1-4 lõpetatud  
**Kestus**: 2-3 tundi  
**Keerukus**: ⭐⭐⭐⭐

#### Mida sa õpid
- Tootmise juurutusstrateegiad
- Ettevõtte turvamustrid
- Jälgimine ja kulude optimeerimine

#### Õppematerjalid
- **🏭 Tootmine**: [Tootmise AI parimad tavad](docs/chapter-08-production/production-ai-practices.md) - Ettevõtte mustrid
- **📝 Näited**: [Mikroteenuste näide](../../examples/microservices) - Keerulised arhitektuurid
- **📊 Jälgimine**: [Application Insights integratsioon](docs/chapter-06-pre-deployment/application-insights.md) - Jälgimine

#### Praktilised harjutused
- Rakenda ettevõtte turvamustrid
- Loo põhjalik jälgimine
- Juuruta tootmisse korrektsel haldamisel

**💡 Peatüki tulemus**: Juuruta ettevõttele valmis rakendused täielike tootmiskapatsiteetidega

---

## 🎓 Töötuba: Käed-külge õppekogemus

> **⚠️ TÖÖTUBA OLEK: Aktiivne areng**  
> Töötubade materjalid on hetkel arendamisel ja täiustamisel. Põhimoodulid on toimivad, kuid mõned edasijõudnud osad on lõpetamata. Töötame aktiivselt kogu sisu lõpuleviimiseks. [Jälgi edenemist →](workshop/README.md)

### Interaktiivsed töötubade materjalid
**Põhjalik käed-külge õpe brauseripõhiste tööriistade ja juhendatud harjutustega**

Meie töötubade materjalid pakuvad struktureeritud, interaktiivset õpikogemust, mis täiendab ülalmainitud peatükkide põhist õppekava. Töötuba on mõeldud nii iseseisvaks õppeks kui ka juhendatud sessioonideks.

#### 🛠️ Töötuba omadused
- **Brauseripõhine liides**: Täielik MkDocs-põhine töötuba koos otsingu, kopeerimise ja teema funktsioonidega
- **GitHub Codespaces integratsioon**: Ühe klõpsuga arenduskeskkonna seadistamine
- **Struktureeritud õpperada**: 8 mooduliga juhendatud harjutused (kokku 3-4 tundi)
- **Järkjärguline metoodika**: Sissejuhatus → Valik → Valideerimine → Lammutamine → Konfigureerimine → Kohandamine → Kokkuvõte → Lõpetamine
- **Interaktiivne DevContainer keskkond**: Eelseadistatud tööriistad ja sõltuvused

#### 📚 Töötuba moodulite struktuur
Töötuba järgib **8 mooduliga järkjärgulist metoodikat**, mis viib sind avastamisest juurutamiseni:

| Moodul | Teema | Mida sa teed | Kestus |
|--------|-------|--------------|---------|
| **0. Sissejuhatus** | Töötuba ülevaade | Mõista õppimise eesmärke, eeldusi ja töötuba struktuuri | 15 min |
| **1. Valik** | Malli leidmine | Uuri AZD malle ja vali sobiv AI mall oma stsenaariumi jaoks | 20 min |
| **2. Valideerimine** | Juuruta & kontrolli | Juuruta mall `azd up` käsuga ja valideeri infrastruktuuri toimimine | 30 min |
| **3. Lammutamine** | Arhitektuuri mõistmine | Kasuta GitHub Copilotit, et uurida malli arhitektuuri, Bicep-faile ja koodi korraldust | 30 min |
| **4. Konfigureerimine** | azure.yaml põhjalik ülevaade | Omandage `azure.yaml` konfigureerimine, elutsükli konksud ja keskkonnamuutujad | 30 min |
| **5. Kohandamine** | Tee see enda omaks | Luba AI otsing, jälgimine, hindamine ja kohanda oma stsenaariumi jaoks | 45 min |
| **6. Lõpetamine** | Korista | Turvaliselt vabasta ressursid käsuga `azd down --purge` | 15 min |
| **7. Kokkuvõte** | Edasised sammud | Vaata üle saavutused, põhikontseptsioonid ja jätka oma õpiteed | 15 min |

**Töötuba kulg:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Töötuba alustamine
```bash
# Variant 1: GitHub Codespaces (Soovitatav)
# Klõpsake hoidlas "Code" → "Create codespace on main"

# Variant 2: Kohalik arendus
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Järgige juhendi juhiseid failis workshop/README.md
```

#### 🎯 Töötuba õpitulemused
Töötuba lõpetades osalejad:
- **Juurutavad tootmise AI rakendusi**: Kasutades AZD-d Microsoft Foundry teenustega
- **Omandavad mitme agenti arhitektuurid**: Rakendavad koordineeritud AI agentide lahendusi
- **Rakendavad turvapäraseid parimaid tavasid**: Seadistavad autentimise ja juurdepääsu kontrolli
- **Optimeerivad skaleerimiseks**: Disainivad kuluefektiivseid ja jõudlusalaseid juurutusi
- **Tõrkeotsing juurutustel**: Lahendavad iseseisvalt levinud probleeme

#### 📖 Töötuba ressursid
- **🎥 Interaktiivne juhend**: [Töötuba materjalid](workshop/README.md) - Brauseripõhine õpikeskkond
- **📋 Moodulitepõhised juhised**:
  - [0. Sissejuhatus](workshop/docs/instructions/0-Introduction.md) - Töötuba ülevaade ja eesmärgid
  - [1. Valik](workshop/docs/instructions/1-Select-AI-Template.md) - AI mallide otsing ja valik
  - [2. Valideerimine](workshop/docs/instructions/2-Validate-AI-Template.md) - Mallide juurutus ja kontroll
  - [3. Lammutamine](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Malli arhitektuuri uurimine
  - [4. Konfigureerimine](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml omandamine
  - [5. Kohandamine](workshop/docs/instructions/5-Customize-AI-Template.md) - Kohanda oma stsenaariumi järgi
  - [6. Lõpetamine](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ressursside koristamine
  - [7. Kokkuvõte](workshop/docs/instructions/7-Wrap-up.md) - Ülevaade ja edasised sammud
- **🛠️ AI töötuba labor**: [AI töötuba labor](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-spetsiifilised harjutused
- **💡 Kiire algus**: [Töötoa seadistamise juhend](workshop/README.md#quick-start) - Keskkonna konfigureerimine

**Sobib ideaalselt**: Ettevõtluse koolitustele, ülikoolikursustele, iseseisvaks õppeks ja arendajate bootcampidele.

---

## 📖 Põhjalik ülevaade: AZD võimalused

Lisaks põhifunktsioonidele pakub AZD võimsaid omadusi tootmisjuurutuseks:

- **Mallipõhised juurutused** - Kasuta eelnevalt ehitatud malle tavapäraste rakenduste musterite jaoks
- **Infrastruktuur koodina** - Halda Azure ressursse Bicep või Terraformiga  
- **Integreeritud töövood** - Proovi sujuvalt rakendusi provisioneerida, juurutada ja jälgida
- **Arendajasõbralik** - Optimeeritud arendajate tootlikkuse ja kasutuskogemuse jaoks

### **AZD + Microsoft Foundry: Täiuslik AI juurutustele**

**Miks valida AZD AI lahendusteks?** AZD lahendab AI arendajate suurimad väljakutsed:

- **AI-valmis mallid** - Eelseadistatud mallid Microsoft Foundry mudelite, Azure AI teenuste ja ML koormuste jaoks
- **Turvalised AI juurutused** - Sisseehitatud turvamustrid AI teenuste, API võtmete ja mudeli lõpp-punktide jaoks  
- **Tootmise AI mustrid** - Parimad tavad skaleeritavate, kuluefektiivsete AI rakenduste juurutuseks
- **Täielikud AI töövood** - Mudeli arendusest tootmise jälgimiseni
- **Kulu optimeerimine** - Nutikad ressursijaotuse ja skaleerimise strateegiad AI koormustele
- **Microsoft Foundry integratsioon** - Sujuv ühendus Microsoft Foundry mudelite kataloogi ja punktiirajaga

---

## 🎯 Mallid ja näidiste kogu

### Esiletõstetud: Microsoft Foundry mallid
**Alusta siit, kui juurutad AI rakendusi!**

> **Märkus:** Need mallid demonstreerivad erinevaid AI mustreid. Mõned on välised Azure näited, teised kohalikud rakendused.

| Mall | Peatükk | Keerukus | Teenused | Tüüp |
|----------|---------|------------|----------|------|
| [**Alusta AI jutuga**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Peatükk 2 | ⭐⭐ | AzureOpenAI + Azure AI Mudeli inference API + Azure AI otsing + Azure konteiner rakendused + Application Insights | Välised |
| [**Alusta AI agentidega**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Peatükk 2 | ⭐⭐ | Foundry agentid + AzureOpenAI + Azure AI otsing + Azure konteiner rakendused + Application Insights| Välised |
| [**Azure Search + OpenAI demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Peatükk 2 | ⭐⭐ | AzureOpenAI + Azure AI otsing + App Service + Storage | Välised |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Peatükk 2 | ⭐ | AzureOpenAI + konteiner rakendused + Application Insights | Välised |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Peatükk 5 | ⭐⭐⭐ | AzureOpenAI + Azure funktsioonid + Prompty | Välised |
| [**Contoso chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Peatükk 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI otsing + Cosmos DB + konteiner rakendused | Välised |
| [**Jaemüügi mitme agenti lahendus**](examples/retail-scenario.md) | Peatükk 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI otsing + Storage + konteiner rakendused + Cosmos DB | **Kohalik** |

### Esiletõstetud: Täielikud õppimisstsenaariumid
**Tootmise valmis rakenduse mallid õppe peatükkidega seotud**

| Mall | Õppe peatükk | Keerukus | Peamine õpitulemus |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Peatükk 2 | ⭐ | Põhilised AI juurutuse mustrid |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Peatükk 2 | ⭐⭐ | RAG rakendus Azure AI otsinguga |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Peatükk 4 | ⭐⭐ | Dokumentide intelligentsuse integratsioon |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Peatükk 5 | ⭐⭐⭐ | Agendi raamistik ja funktsioonikõned |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Peatükk 8 | ⭐⭐⭐ | Ettevõtte AI orkestreerimine |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Peatükk 5 | ⭐⭐⭐⭐ | Mitme agenti arhitektuur Kliendi- ja Laoseis agentidega |

### Õppimine näidise tüübi järgi

> **📌 Kohalikud vs välised näited:**  
> **Kohalikud näited** (selles repoz) = Vahetult kasutusvalmis  
> **Välised näited** (Azure näited) = klooni lingitud repos

#### Kohalikud näited (kasutamisvalmis)
- [**Jaemüügi mitme agenti lahendus**](examples/retail-scenario.md) - Täielik tootmisvalmis rakendus ARM mallidega
  - Mitme agenti arhitektuur (Kliendi + Laoseis agentid)
  - Põhjalik jälgimine ja hindamine
  - Ühe klõpsu juurutus ARM malli kaudu

#### Kohalikud näited - konteiner rakendused (peatükid 2-5)
**Selles hoidlas põhjalikud konteinerite juurutuse näited:**

- [**Context Container App näited**](examples/container-app/README.md) - Täielik juhend konteineripõhiseks juurutamiseks
  - [Lihtne Flask API](../../examples/container-app/simple-flask-api) - Põhiline REST API koos skaala-nii-väikeseks võimalusega
  - [Mikroteenuste arhitektuur](../../examples/container-app/microservices) - Tootmisküpseks valmis mitmeteenuseline juurutus
  - Kiire algus, tootmine ja keerukamad juurutusmustrid
  - Jälgimine, turvalisus ja kulude optimeerimise soovitused

#### Välised näited - lihtsad rakendused (peatükid 1-2)
**Klooni need Azure'i näidiste hoidlad alustamiseks:**
- [Lihtne veebirakendus - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Põhilised juurutusmustrid
- [Staatiline veebisait - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staatilise sisu juurutus
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API juurutus

#### Välised näited - andmebaasi integratsioon (peatükid 3-4)  
- [Andmebaasirakendus - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Andmebaasi ühenduvusmustrid
- [Funktsioonid + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverita andmetöötlus

#### Välised näited - keerukamad mustrid (peatükid 4-8)
- [Java mikroteenused](https://github.com/Azure-Samples/java-microservices-aca-lab) - Mitmeteenuseline arhitektuur
- [Container Apps tööülesanded](https://github.com/Azure-Samples/container-apps-jobs) - Tausttöötlus  
- [Ettevõtte ML torujuhe](https://github.com/Azure-Samples/mlops-v2) - Tootmisküpse masinõppe mustrid

### Välised mallikogumikud
- [**Ametlik AZD mallitese galerii**](https://azure.github.io/awesome-azd/) - Hoolikalt valitud ametlikud ja kogukonna mallid
- [**Azure Developer CLI mallid**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn mallide dokumentatsioon
- [**Näidiste kataloog**](examples/README.md) - Kohalikud õppematerjalid üksikasjalike seletustega

---

## 📚 Õppematerjalid ja viited

### Kiired viited
- [**Käsurea spikker**](resources/cheat-sheet.md) - Olulised azd käsud peatükkide kaupa organiseeritud
- [**Terminitikogu**](resources/glossary.md) - Azure ja azd terminoloogia  
- [**KKK**](resources/faq.md) - Levinumad küsimused peatükkide kaupa organiseeritud
- [**Õppekava**](resources/study-guide.md) - Üksikasjalikud harjutused

### Praktilised töötubytoad
- [**Tehisintellekti töötuba**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Loo oma AI lahendused AZD juurutatavaks (2-3 tundi)
- [**Interaktiivne töötuba**](workshop/README.md) - 8 mooduliga juhendatud harjutused MkDocs ja GitHub Codespaces abil
  - Järgmine järjestus: Sissejuhatus → Valik → Kinnitus → Lammutamine → Konfiguratsioon → Kohandamine → Lõpetamine → Kokkuvõte

### Välised õppematerjalid
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure arhitektuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure hinnakalkulaator](https://azure.microsoft.com/pricing/calculator/)
- [Azure seisund](https://status.azure.com/)

### AI agendi oskused sinu redaktorile
- [**Microsoft Azure oskused aadressil skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 tasuta agendi oskust Azure AI, Foundry, juurutuse, diagnostika, kulude optimeerimise ja muu jaoks. Paigalda need GitHub Copiloti, Cursor, Claude Code või mõnda toetatud agendi programmi:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Kiire probleemide lahendamise juhend

**Algajate sagedasemad probleemid ja kiire lahendus:**

<details>
<summary><strong>❌ "azd: käsku ei leitud"</strong></summary>

```bash
# Paigalda kõigepealt AZD
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
<summary><strong>❌ "Tellimus puudub" või "Tellimust pole määratud"</strong></summary>

```bash
# Loetle olemasolevad tellimused
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
<summary><strong>❌ "Ebapiisav kvota" või "Kvota ületatud"</strong></summary>

```bash
# Proovi erinevat Azure piirkonda
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

# Valik 4: Kontrolli logisid Azure Monitoris
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentimine ebaõnnestus" või "Tokeni kehtivus aegunud"</strong></summary>

```bash
# Tõesta AZD jaoks uuesti
azd auth logout
azd auth login

# Valikuline: uuenda ka Azure CLI-d, kui kasutad az käske
az logout
az login

# Kontrolli autentimist
az account show
```
</details>

<details>
<summary><strong>❌ "Resurss on juba olemas" või nimetuste konfliktid</strong></summary>

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

**Tavapärased ooteajad:**
- Lihtne veebirakendus: 5-10 minutit
- Rakendus andmebaasiga: 10-15 minutit
- AI rakendused: 15-25 minutit (OpenAI provisjonimine on aeglane)

```bash
# Kontrolli edenemist
azd show

# Kui kinni >30 minutit, kontrolli Azure Portaalis:
azd monitor --overview
# Otsi ebaõnnestunud juurutusi
```
</details>

<details>
<summary><strong>❌ "Luba keelatud" või "Keeldunud"</strong></summary>

```bash
# Kontrolli oma Azure'i rolli
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Sul peab olema vähemalt "Kaastööline" roll
# Palu oma Azure'i administraatoril anda:
# - Kaastööline (ressursside jaoks)
# - Kasutaja juurdepääsu administraator (rollide määramiseks)
```
</details>

<details>
<summary><strong>❌ Ei leia juurutatud rakenduse URL-i</strong></summary>

```bash
# Näita kõiki teenuse lõpp-punkte
azd show

# Või ava Azure portaal
azd monitor

# Kontrolli konkreetset teenust
azd env get-values
# Otsi *_URL muutujaid
```
</details>

### 📚 Täielikud probleemide lahendamise materjalid

- **Tavalised probleemid:** [Üksikasjalikud lahendused](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-spetsiifilised probleemid:** [AI probleemilahendus](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Silumine:** [Järjestikused silumisjuhised](docs/chapter-07-troubleshooting/debugging.md)
- **Abi saamine:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursuse lõpetamine ja sertifitseerimine

### Edusammude jälgimine
Jälgi oma õpioskuste edenemist iga peatüki lõikes:

- [ ] **Peatükk 1**: Alused ja kiire algus ✅
- [ ] **Peatükk 2**: AI esmane arendus ✅  
- [ ] **Peatükk 3**: Konfiguratsioon ja autentimine ✅
- [ ] **Peatükk 4**: Infrastruktur koodina ja juurutus ✅
- [ ] **Peatükk 5**: Mitme agendi AI lahendused ✅
- [ ] **Peatükk 6**: Eeljuurutuse kinnitus ja planeerimine ✅
- [ ] **Peatükk 7**: Probleemide lahendus ja silumine ✅
- [ ] **Peatükk 8**: Tootmismustrid ja ettevõtte lahendused ✅

### Õppimise kinnitamine
Pärast iga peatüki lõpetamist kinnita oma teadmised:
1. **Praktiline ülesanne**: Viimistlege peatüki praktiline juurutamine
2. **Teadmiste kontroll**: Vaata oma peatüki KKK osa
3. **Kogukonna arutelu**: Jaga kogemust Azure Discordis
4. **Järgmine peatükk**: Liigu järgmisele keerukuse tasemele

### Kursuse lõpetamise eelised
Pärast kõigi peatükkide lõpetamist omandad:
- **Tootmiskogemuse**: Tootmisse juurutatud AI rakendused Azure'is
- **Professionaalsed oskused**: Ettevõttevalmidusega juurutusvõime
- **Kogukonna tunnustuse**: Aktiivne Azure arendajate kogukonna liige
- **Karjääriedu**: Nõutavad AZD ja AI juurutuse teadmised

---

## 🤝 Kogukond ja tugi

### Abi ja tugi
- **Tehnilised probleemid**: [Aruanda vead ja soovita funktsioone](https://github.com/microsoft/azd-for-beginners/issues)
- **Õppimise küsimused**: [Microsoft Azure Discord kogukond](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-spetsiifiline abi**: Liitu [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentatsioon**: [Ametlik Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Kogukonna arusaamad Microsoft Foundry Discordist

**Viimased küsitluse tulemused #Azure kanalist:**
- **45%** arendajatest soovib kasutada AZD-d AI töökoormuste jaoks
- **Peamised väljakutsed**: Mitmeteenuseline juurutus, mandaatide haldamine, tootmisküpse oleku saavutamine  
- **Kõige rohkem nõutud**: AI-spetsiifilised mallid, probleemide lahendamise juhendid, parimad praktikad

**Liitu meie kogukonnaga, et:**
- Jaga oma AZD + AI kogemusi ja saa abi
- Saada varajasi ülevaateid uutest AI mallidest
- Panusta AI juurutuse parimatesse tavadesse
- Mõjuta tulevasi AI + AZD funktsiooniarendusi

### Panustamine kursusesse
Me ootame panuseid! Palun loe meie [Panustamise juhendit](CONTRIBUTING.md) täpsemalt:
- **Sisu täiustamine**: Täienda olemasolevaid peatükke ja näiteid
- **Uued näited**: Lisa reaalmaailma stsenaariume ja malle  
- **Tõlkimine**: Aita hoida mitmekeelset tuge
- **Vead ja parandused**: Paranda täpsust ja selgust
- **Kogukonna standardid**: Järgi meie kaasava kogukonna juhiseid

---

## 📄 Kursuse info

### Litsents
See projekt on litsentseeritud MIT litsentsi alusel - vaata üksikasju failist [LICENSE](../../LICENSE).

### Seotud Microsofti õppematerjalid

Meie meeskond toodab veel teisi põhjalikke õppematerjale:

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

[![Generatiivne tehisintellekt (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Põhiline õppimine
[![Alustajate masinõpe](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Andmeteadus algajatele](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Tehisintellekt algajatele](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Küberturvalisus algajatele](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Veebiarendus algajatele](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT algajatele](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR arendus algajatele](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copiloti sari
[![Copilot AI-ga paarisprogrammeerimiseks](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET jaoks](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copiloti seiklused](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursuse navigeerimine

**🚀 Valmis õppima hakkama?**

**Algajad**: Alusta [1. peatükk: Alused ja kiire algus](#-chapter-1-foundation--quick-start)  
**Tehisintellekti arendajad**: Hüpata [2. peatükk: AI-eeline arendus](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Kogenud arendajad**: Alusta [3. peatükk: Konfiguratsioon ja autentimine](#️-chapter-3-configuration--authentication)

**Järgmised sammud**: [Alusta 1. peatükki - AZD põhialused](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->