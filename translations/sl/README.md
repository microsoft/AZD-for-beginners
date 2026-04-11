# AZD za začetnike: Strukturirano učno pot

![AZD-za-začetnike](../../translated_images/sl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub opazovalci](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forki](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub zvezde](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Samodejni prevodi (vedno posodobljeni)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](./README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Raje klonirate lokalno?**
>
> Ta repozitorij vsebuje več kot 50 prevodov, kar znatno poveča velikost prenosa. Če želite klonirati brez prevodov, uporabite sparse checkout:
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
> To vam daje vse, kar potrebujete za dokončanje tečaja z veliko hitrejšim prenosom.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Kaj je novega v azd danes

Azure Developer CLI je prerasel tradicionalne spletne aplikacije in API-je. Danes je azd enotno orodje za razmestitev katerekoli aplikacije v Azure — vključno z aplikacijami, podprtimi z AI, in inteligentnimi agenti.

To za vas pomeni:

- **AI agenti so sedaj primarni azd delovni naložbi.** Lahko inicializirate, razmestite in upravljate projekte AI agentov z istim potekom dela `azd init` → `azd up`, ki ga že poznate.
- **Integracija Microsoft Foundry** prinaša razmestitev modelov, gostovanje agentov in konfiguracijo AI storitev neposredno v ekosistem azd predlog.
- **Osnovni potek dela se ni spremenil.** Ne glede na to, ali razmestite todo aplikacijo, mikrostoritev ali več-agentno AI rešitev, so ukazi enaki.

Če ste že uporabljali azd prej, je podpora za AI naravna razširitev — ne ločeno orodje ali napredno sledišče. Če začnete iz nič, se boste naučili en potek dela, ki deluje za vse.

---

## 🚀 Kaj je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je prijazno orodje ukazne vrstice za razvijalce, ki poenostavi razmestitev aplikacij v Azure. Namesto ročnega ustvarjanja in povezovanja desetine Azure virov lahko z enim ukazom razmestite celotne aplikacije.

### Čarobnost `azd up`

```bash
# Ta enojni ukaz naredi vse:
# ✅ Ustvari vse Azure vire
# ✅ Konfigurira omrežje in varnost
# ✅ Zgradi vašo aplikacijsko kodo
# ✅ Izvede nameščanje v Azure
# ✅ Daje vam delujoč URL
azd up
```

**To je to!** Brez klikanja v Azure Portal, brez učenja zapletenih ARM predlogov, brez ročne konfiguracije — samo delujoče aplikacije v Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Kakšna je razlika?

To je najpogostejše vprašanje začetnikov. Tukaj je enostaven odgovor:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Manage individual Azure resources | Deploy complete applications |
| **Mindset** | Infrastructure-focused | Application-focused |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Must know Azure services | Just know your app |
| **Best For** | DevOps, Infrastructure | Developers, Prototyping |

### Preprosta primerjava

- **Azure CLI** je kot da imate vsa orodja za gradnjo hiše — kladiva, žage, žeblje. Lahko zgradite karkoli, vendar morate poznati gradbeništvo.
- **Azure Developer CLI** je kot da najamete izvajalca — opišete, kar želite, in on poskrbi za gradnjo.

### Kdaj uporabiti katerega

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Delujeta skupaj!

AZD uporablja Azure CLI v ozadju. Uporabljate lahko oboje:
```bash
# Namestite svojo aplikacijo z AZD
azd up

# Nato prilagodite določene vire z Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Najdite predloge v Awesome AZD

Ne začnite iz nič! **Awesome AZD** je skupnostna zbirka predlog, pripravljenih za enostavno razmestitev:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Brskajte po 200+ predlogah z enostavno razmestitvijo z enim klikom |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Prispevajte svojo predlogo skupnosti |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Všečkajte in raziščite izvorno kodo |

### Priljubljene AI predloge iz Awesome AZD

```bash
# RAG klepet z Microsoft Foundry modeli + AI iskanje
azd init --template azure-search-openai-demo

# Hitro AI klepetalno aplikacijo
azd init --template openai-chat-app-quickstart

# AI agenti z Foundry agenti
azd init --template get-started-with-ai-agents
```

---

## 🎯 Začnite v 3 korakih

Preden začnete, preverite, ali je vaš računalnik pripravljen za predlogo, ki jo želite razmestiti:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Če kateri izmed zahtevanih preverjanj ne uspe, to najprej odpravite in nato nadaljujte s hitrim začetkom.

### Korak 1: Namestite AZD (2 minuti)

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

### Korak 2: Avtentikacija za AZD

```bash
# Opcijsko, če nameravate uporabljati ukaze Azure CLI neposredno v tem tečaju
az login

# Potrebno za AZD poteke dela
azd auth login
```

Če niste prepričani, katerega potrebujete, sledite celotnemu postopku namestitve v [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Korak 3: Razmestite svojo prvo aplikacijo

```bash
# Inicializiraj iz predloge
azd init --template todo-nodejs-mongo

# Namesti na Azure (ustvari vse!)
azd up
```

**🎉 To je to!** Vaša aplikacija je zdaj objavljena v Azure.

### Čiščenje (ne pozabite!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kako uporabljati ta tečaj

Ta tečaj je zasnovan za **postopno učenje** - začnite tam, kjer se počutite udobno, in postopoma nadgrajujte znanje:

| Your Experience | Start Here |
|-----------------|------------|
| **Brand new to Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Know Azure, new to AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Want to deploy AI apps** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Want hands-on practice** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 hour guided lab |
| **Need production patterns** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Hitra nastavitev

1. **Ustvarite fork tega repozitorija**: [![GitHub forki](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonirajte ga**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Poiščite pomoč**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Raje klonirate lokalno?**
>
> Ta repozitorij vsebuje več kot 50 prevodov, kar znatno poveča velikost prenosa. Če želite klonirati brez prevodov, uporabite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> To vam daje vse, kar potrebujete za dokončanje tečaja z veliko hitrejšim prenosom.


## Pregled tečaja

Obvladujte Azure Developer CLI (azd) skozi strukturirana poglavja, zasnovana za postopno učenje. **Poseben poudarek na razmestitvi AI aplikacij z integracijo Microsoft Foundry.**

### Zakaj je ta tečaj ključnega pomena za sodobne razvijalce

Na podlagi vpogledov skupnosti Microsoft Foundry Discord, **45% razvijalcev želi uporabiti AZD za AI delovne obremenitve**, vendar se srečujejo z izzivi pri:
- Zapletenih večstoritevnih AI arhitekturah
- Produkcijskih praksah razmestitve AI  
- Integraciji in konfiguraciji Azure AI storitev
- Optimizaciji stroškov za AI delovne obremenitve
- Odpravljanju težav pri specifikah razmestitve AI

### Cilji učenja

S končanjem tega strukturiranega tečaja boste:
- **Obvladali osnove AZD**: Osnovni koncepti, namestitev in konfiguracija
- **Razmestili AI aplikacije**: Uporaba AZD z Microsoft Foundry storitvami
- **Uvedli Infrastructure as Code**: Upravljanje Azure virov z Bicep predlogami
- **Odpravili težave pri razmestitvah**: Reševanje pogostih težav in razhroščevanje
- **Optimizirali za produkcijo**: Varnost, skaliranje, spremljanje in upravljanje stroškov
- **Zgradili več-agentne rešitve**: Razmestitev zapletenih AI arhitektur

## Preden začnete: Računi, dostop in predpostavke

Preden začnete s Poglavjem 1, poskrbite, da imate naslednje. Namestitveni koraki kasneje v tem vodiču predvidevajo, da so te osnovne zahteve že urejene.
- **Naročnina Azure**: Uporabite lahko obstoječo naročnino iz službenega računa ali svojo, ali pa ustvarite [brezplačni preizkus](https://aka.ms/azurefreetrial) za začetek.
- **Dovoljenje za ustvarjanje virov v Azure**: Za večino vaj bi morali imeti vsaj **Contributor** dostop do ciljnega naročniškega računa ali skupine virov. Nekatera poglavja lahko predvidevajo tudi, da lahko ustvarjate skupine virov, upravljane identitete in RBAC dodelitve.
- [**GitHub račun**](https://github.com): To je koristno za forkanje repozitorija, sledenje lastnim spremembam in uporabo GitHub Codespaces za delavnico.
- **Predpogoji za izvajanje predloge**: Nekatere predloge potrebujejo lokalna orodja, kot so Node.js, Python, Java ali Docker. Pred začetkom zaženite validator za nastavitev, da zgodaj odkrijete manjkajoča orodja.
- **Osnovno poznavanje terminala**: Ni vam treba biti strokovnjak, vendar bi morali biti udobni pri izvajanju ukazov, kot so `git clone`, `azd auth login` in `azd up`.

> **Delate v naročnini podjetja?**
> Če vaše Azure okolje upravlja skrbnik, vnaprej potrdite, da lahko razmestite vire v naročnini ali skupini virov, ki jo nameravate uporabiti. Če ne, prosite za peskovnik (sandbox) ali dostop Contributor, preden začnete.

> **Ste novi v Azure?**
> Začnite z lastno preizkusno ali pay-as-you-go naročnino Azure na https://aka.ms/azurefreetrial, tako da lahko vaje dokončate od začetka do konca brez čakanja na odobritve na ravni najemnika.

## 🗺️ Načrt tečaja: Hitro navigiranje po poglavjih

Vsako poglavje ima ločen README z učnimi cilji, hitrimi začetki in vajami:

| Poglavje | Tema | Lekcije | Trajanje | Kompleksnost |
|---------|-------|---------|----------|------------|
| **[Poglavje 1: Osnove](docs/chapter-01-foundation/README.md)** | Začetek | [Osnove AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Namestitev](docs/chapter-01-foundation/installation.md) &#124; [Prvi projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Poglavje 2: AI razvoj](docs/chapter-02-ai-development/README.md)** | AI-first aplikacije | [Integracija Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agenti](docs/chapter-02-ai-development/agents.md) &#124; [Razmestitev modelov](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Delavnica](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Poglavje 3: Konfiguracija](docs/chapter-03-configuration/README.md)** | Avtentikacija in varnost | [Konfiguracija](docs/chapter-03-configuration/configuration.md) &#124; [Avtentikacija & varnost](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Poglavje 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC & razmestitev | [Priročnik za razmestitev](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Poglavje 5: Več-agentno](docs/chapter-05-multi-agent/README.md)** | Rešitve z AI agenti | [Maloprodajni scenarij](examples/retail-scenario.md) &#124; [Vzorce koordinacije](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Poglavje 6: Pred-razmestitev](docs/chapter-06-pre-deployment/README.md)** | Načrtovanje & validacija | [Preflight checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Načrtovanje kapacitet](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Izbira SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Poglavje 7: Odpravljanje napak](docs/chapter-07-troubleshooting/README.md)** | Razhroščevanje & popravki | [Pogoste težave](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Razhroščevanje](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI težave](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Poglavje 8: Produkcija](docs/chapter-08-production/README.md)** | Enterprise vzorci | [Prakse za produkcijo](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Delavnica](workshop/README.md)** | Praktični laboratorij | [Uvod](workshop/docs/instructions/0-Introduction.md) &#124; [Izbira](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstrukcija](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prilagoditev](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Demontaža](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zaključek](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Skupno trajanje tečaja:** ~10-14 ur | **Napredovanje znanja:** Začetnik → Pripravljen za produkcijo

---

## 📚 Učna poglavja

*Izberite svojo učno pot glede na raven izkušenj in cilje*

### 🚀 Poglavje 1: Osnove in hiter začetek
**Predpogoji**: Naročnina Azure, osnovno znanje ukazne vrstice  
**Trajanje**: 30-45 minut  
**Kompleksnost**: ⭐

#### Kaj se boste naučili
- Razumevanje osnov Azure Developer CLI
- Namestitev AZD na vašo platformo
- Vaša prva uspešna razmestitev

#### Viri za učenje
- **🎯 Začnite tukaj**: [Kaj je Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorija**: [Osnove AZD](docs/chapter-01-foundation/azd-basics.md) - Temeljni koncepti in terminologija
- **⚙️ Namestitev**: [Namestitev & Nastavitev](docs/chapter-01-foundation/installation.md) - Vodniki po platformah
- **🛠️ Praktično**: [Vaš prvi projekt](docs/chapter-01-foundation/first-project.md) - Navodila po korakih
- **📋 Hiter pregled**: [Kratki priročnik ukazov](resources/cheat-sheet.md)

#### Praktične vaje
```bash
# Hitro preverjanje namestitve
azd version

# Namestite svojo prvo aplikacijo
azd init --template todo-nodejs-mongo
azd up
```

**💡 Izid poglavja**: Uspešno razmestite preprosto spletno aplikacijo v Azure z uporabo AZD

**✅ Validacija uspeha:**
```bash
# Po končanem 1. poglavju boste znali:
azd version              # Prikaže nameščeno različico
azd init --template todo-nodejs-mongo  # Inicializira projekt
azd up                  # Razporedi v Azure
azd show                # Prikaže URL zagnane aplikacije
# Aplikacija se odpre v brskalniku in deluje
azd down --force --purge  # Počisti vire
```

**📊 Časovna naložba:** 30-45 minut  
**📈 Raven spretnosti po:** Lahko samostojno razmestite osnovne aplikacije
**📈 Raven spretnosti po:** Lahko samostojno razmestite osnovne aplikacije

---

### 🤖 Poglavje 2: AI-prvi razvoj (priporočeno za razvijalce AI)
**Predpogoji**: Poglavje 1 dokončano  
**Trajanje**: 1-2 ure  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Integracija Microsoft Foundry z AZD
- Razmestitev AI-podprtih aplikacij
- Razumevanje konfiguracij AI storitev

#### Viri za učenje
- **🎯 Začnite tukaj**: [Integracija Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agenti**: [Vodnik za AI agente](docs/chapter-02-ai-development/agents.md) - Razmestitev inteligentnih agentov z AZD
- **📖 Vzorci**: [Razmestitev AI modelov](docs/chapter-02-ai-development/ai-model-deployment.md) - Razmestitev in upravljanje AI modelov
- **🛠️ Delavnica**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pripravite svoje AI rešitve za AZD
- **🎥 Interaktivni vodič**: [Materiali delavnice](workshop/README.md) - Učenje v brskalniku z MkDocs * DevContainer okoljem
- **📋 Predloge**: [Microsoft Foundry predloge](#viri-delavnice)
- **📝 Primeri**: [Primeri razmestitev AZD](examples/README.md)

#### Praktične vaje
```bash
# Namestite svojo prvo AI aplikacijo
azd init --template azure-search-openai-demo
azd up

# Preizkusite dodatne AI predloge
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Izid poglavja**: Razmestite in konfigurirajte AI-podprto klepetalno aplikacijo z RAG zmogljivostmi

**✅ Validacija uspeha:**
```bash
# Po 2. poglavju boste lahko:
azd init --template azure-search-openai-demo
azd up
# Preizkusiti vmesnik za klepet z AI
# Postavljati vprašanja in prejemati odgovore, ki jih poganja AI, z navedbami virov
# Preveriti, ali integracija iskanja deluje
azd monitor  # Preveriti, ali Application Insights prikazuje telemetrijo
azd down --force --purge
```

**📊 Časovna naložba:** 1-2 ure  
**📈 Raven spretnosti po:** Lahko razmestite in konfigurirate AI aplikacije pripravljene za produkcijo  
**💰 Zavedanje stroškov:** Razumeti stroške razvoja $80-150/mesec, stroške produkcije $300-3500/mesec

#### 💰 Razmisleki o stroških za AI razmestitve

**Razvojno okolje (ocenjeno $80-150/mesec):**
- Microsoft Foundry modeli (plačilo po uporabi): $0-50/mesec (odvisno od porabe tokenov)
- AI Search (osnovni nivo): $75/mesec
- Container Apps (poraba): $0-20/mesec
- Shramba (Standard): $1-5/mesec

**Produkcijsko okolje (ocenjeno $300-3,500+/mesec):**
- Microsoft Foundry modeli (PTU za konsistentno zmogljivost): $3,000+/mesec ALI plačilo po porabi pri velikem obsegu
- AI Search (standardni nivo): $250/mesec
- Container Apps (namenski): $50-100/mesec
- Application Insights: $5-50/mesec
- Shramba (Premium): $10-50/mesec

**💡 Nasveti za optimizacijo stroškov:**
- Uporabite **brezplačni nivo** Microsoft Foundry modelov za učenje (Azure OpenAI vključuje 50.000 tokenov/mesec)
- Zaustavite vire z `azd down`, ko aktivno ne razvijate
- Začnite z obračunavanjem po porabi, PTU nadgradite le za produkcijo
- Uporabite `azd provision --preview` za oceno stroškov pred razmestitvijo
- Omogočite avtomatsko skaliranje: plačajte samo za dejansko porabo

**Spremljanje stroškov:**
```bash
# Preverite ocenjene mesečne stroške
azd provision --preview

# Spremljajte dejanske stroške v portalu Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Poglavje 3: Konfiguracija & Avtentikacija
**Predpogoji**: Poglavje 1 dokončano  
**Trajanje**: 45-60 minut  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Upravljanje in konfiguracija okolij
- Najboljše prakse za avtentikacijo in varnost
- Poimenovanje in organizacija virov

#### Viri za učenje
- **📖 Konfiguracija**: [Priročnik za konfiguracijo](docs/chapter-03-configuration/configuration.md) - Nastavitev okolja
- **🔐 Varnost**: [Vzorce avtentikacije in upravljane identitete](docs/chapter-03-configuration/authsecurity.md) - Vzorci avtentikacije
- **📝 Primeri**: [Primer baze podatkov](examples/database-app/README.md) - AZD primeri za baze podatkov

#### Praktične vaje
- Konfigurirajte več okolij (dev, staging, prod)
- Nastavite avtentikacijo z upravljano identiteto
- Implementirajte konfiguracije, specifične za okolje

**💡 Izid poglavja**: Upravljajte več okolij z ustrezno avtentikacijo in varnostjo

---

### 🏗️ Poglavje 4: Infrastruktura kot koda & Razmestitev
**Predpogoji**: Poglavja 1-3 dokončana  
**Trajanje**: 1-1.5 ure  
**Kompleksnost**: ⭐⭐⭐

#### Kaj se boste naučili
- Napredni vzorci razmestitve
- Infrastruktura kot koda z Bicep
- Strategije za provisioning virov

#### Viri za učenje
- **📖 Razmestitev**: [Priročnik za razmestitev](docs/chapter-04-infrastructure/deployment-guide.md) - Celotni poteki dela
- **🏗️ Provisioning**: [Provisioning virov](docs/chapter-04-infrastructure/provisioning.md) - Upravljanje Azure virov
- **📝 Primeri**: [Primer Container App](../../examples/container-app) - Razmestitve z vsebniki

#### Praktične vaje
- Ustvarite lastne Bicep predloge
- Razmestite večstoritevne aplikacije
- Implementirajte blue-green strategije razmestitve

**💡 Izid poglavja**: Razmestite kompleksne večstoritevne aplikacije z uporabo lastnih infrastrukturnih predlog

---

### 🎯 Poglavje 5: Več-agentne AI rešitve (Napredno)
**Predpogoji**: Poglavja 1-2 dokončana  
**Trajanje**: 2-3 ure  
**Kompleksnost**: ⭐⭐⭐⭐

#### Kaj se boste naučili
- Vzorci več-agentne arhitekture
- Orkestracija in koordinacija agentov
- Produkcijsko pripravljene AI razmestitve

#### Viri za učenje
- **🤖 Predstavljen projekt**: [Maloprodajna več-agentna rešitev](examples/retail-scenario.md) - Celotna implementacija
- **🛠️ Paket ARM predloge**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Namestitev z enim klikom
- **📖 Arhitektura**: [Vzorce koordinacije več agentov](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzorci

#### Praktične vaje
```bash
# Razmestite celotno maloprodajno večagentno rešitev
cd examples/retail-multiagent-arm-template
./deploy.sh

# Raziščite konfiguracije agentov
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Izid poglavja**: Razmestite in upravljajte produkcijsko pripravljeno več-agentno AI rešitev z agenti za stranke in inventar

---

### 🔍 Poglavje 6: Pred-razmestitvena validacija & Načrtovanje
**Predpogoji**: Poglavje 4 dokončano  
**Trajanje**: 1 ura  
**Kompleksnost**: ⭐⭐
#### Kaj se boste naučili
- Načrtovanje zmogljivosti in preverjanje virov
- Strategije izbire SKU-jev
- Predhodne kontrole in avtomatizacija

#### Učni viri
- **📊 Načrtovanje**: [Načrtovanje zmogljivosti](docs/chapter-06-pre-deployment/capacity-planning.md) - Preverjanje virov
- **💰 Izbira**: [Izbira SKU-jev](docs/chapter-06-pre-deployment/sku-selection.md) - Stroškovno učinkovite izbire
- **✅ Preverjanje**: [Predhodne kontrole](docs/chapter-06-pre-deployment/preflight-checks.md) - Avtomatizirani skripti

#### Praktične vaje
- Zaženite skripte za preverjanje zmogljivosti
- Optimizirajte izbiro SKU-jev glede stroškov
- Implementirajte avtomatizirane prednamestitvene kontrole

**💡 Rezultat poglavja**: Preverite in optimizirajte namestitve pred izvedbo

---

### 🚨 Poglavje 7: Odpravljanje težav in razhroščevanje
**Predpogoji**: Katero koli poglavje o nameščanju zaključeno  
**Trajanje**: 1–1,5 ure  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Sistemski pristopi k razhroščevanju
- Pogoste težave in rešitve
- Odpravljanje težav specifičnih za AI

#### Učni viri
- **🔧 Pogoste težave**: [Pogoste težave](docs/chapter-07-troubleshooting/common-issues.md) - Pogosta vprašanja in rešitve
- **🕵️ Razhroščevanje**: [Vodnik za razhroščevanje](docs/chapter-07-troubleshooting/debugging.md) - Korak-po-korak strategije
- **🤖 Težave z AI**: [Odpravljanje težav za AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Težave s storitvami AI

#### Praktične vaje
- Diagnozirajte neuspehe namestitve
- Razrešite težave z avtentikacijo
- Razhroščevanje povezljivosti storitev AI

**💡 Rezultat poglavja**: Neodvisno diagnosticirajte in rešujte pogoste težave z namestitvijo

---

### 🏢 Poglavje 8: Produkcija in podjetniški vzorci
**Predpogoji**: Poglavja 1–4 zaključena  
**Trajanje**: 2–3 ure  
**Kompleksnost**: ⭐⭐⭐⭐

#### Kaj se boste naučili
- Strategije nameščanja v produkcijo
- Vzorci varnosti za podjetja
- Nadzor in optimizacija stroškov

#### Učni viri
- **🏭 Produkcija**: [Najboljše prakse za produkcijski AI](docs/chapter-08-production/production-ai-practices.md) - Podjetniški vzorci
- **📝 Primeri**: [Primer mikrostoritev](../../examples/microservices) - Kompleksne arhitekture
- **📊 Nadzor**: [Integracija Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Nadzor

#### Praktične vaje
- Implementirajte varnostne vzorce za podjetja
- Vzpostavite celovit nadzor
- Namestite v produkcijo z ustreznim upravljanjem

**💡 Rezultat poglavja**: Namestite aplikacije pripravljene za podjetja z vsemi produkcijskimi zmogljivostmi

---

## 🎓 Pregled delavnice: Praktična učna izkušnja

> **⚠️ STATUS DELAVNICE: V aktivnem razvoju**  
> Gradiva delavnice se trenutno razvijajo in izboljšujejo. Osnovni moduli so funkcionalni, vendar so nekateri naprednejši deli nepopolni. Aktivno delamo na dokončanju vsebine. [Spremljajte napredek →](workshop/README.md)

### Interaktivni materiali delavnice
**Celovito praktično učenje z orodji v brskalniku in vodenimi vajami**

Naša gradiva delavnice nudijo strukturirano, interaktivno učno izkušnjo, ki dopolnjuje zgoraj navedeno poglavjsko gradivo. Delavnica je zasnovana tako za samostojno učenje kot za seje pod vodstvom inštruktorja.

#### 🛠️ Značilnosti delavnice
- **Vmesnik v brskalniku**: Celovita delavnica na osnovi MkDocs z iskanjem, kopiranjem in možnostmi teme
- **Integracija z GitHub Codespaces**: Vzpostavitev razvojnega okolja z enim klikom
- **Strukturirana učna pot**: 8-modulne vodene vaje (skupaj 3–4 ure)
- **Postopna metodologija**: Uvod → Izbira → Preverjanje → Dekonstrukcija → Konfiguracija → Prilagoditev → Odstranitev → Zaključek
- **Interaktivno DevContainer okolje**: Predkonfigurirana orodja in odvisnosti

#### 📚 Struktura modulov delavnice
Delavnica sledi **8-modulni postopni metodologiji**, ki vas popelje od odkrivanja do obvladovanja nameščanja:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Uvod** | Pregled delavnice | Razumite cilje učenja, predpogoje in strukturo delavnice | 15 min |
| **1. Izbira** | Odkrijte predloge | Raziščite AZD predloge in izberite pravo AI predlogo za vaš scenarij | 20 min |
| **2. Validation** | Deploy & Verify | Namestite predlogo z `azd up` in preverite delovanje infrastrukture | 30 min |
| **3. Dekonstrukcija** | Razumite strukturo | Uporabite GitHub Copilot za raziskovanje arhitekture predloge, Bicep datotek in organizacije kode | 30 min |
| **4. Konfiguracija** | azure.yaml Deep Dive | Obvladajte konfiguracijo `azure.yaml`, življenjske kuke in spremenljivke okolja | 30 min |
| **5. Prilagoditev** | Make It Yours | Omogočite AI Search, sledenje, evalvacijo in prilagodite za vaš scenarij | 45 min |
| **6. Odstranitev** | Clean Up | Varno odstranite vire z `azd down --purge` | 15 min |
| **7. Zaključek** | Next Steps | Preglejte dosežke, ključne koncepte in nadaljujte z učenjem | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Začetek z delavnico
```bash
# Možnost 1: GitHub Codespaces (Priporočeno)
# Kliknite "Code" → "Create codespace on main" v repozitoriju

# Možnost 2: Lokalni razvoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Sledite navodilom za nastavitev v workshop/README.md
```

#### 🎯 Učni izidi delavnice
Z zaključkom delavnice bodo udeleženci:
- **Namestiti produkcijske AI aplikacije**: Uporabite AZD z Microsoft Foundry storitvami
- **Obvladati večagentne arhitekture**: Implementirajte usklajene rešitve AI agentov
- **Uveljaviti varnostne najboljše prakse**: Konfigurirajte avtentikacijo in nadzor dostopa
- **Optimizirati za skaliranje**: Oblikujte stroškovno učinkovite, zmogljive namestitve
- **Odpraviti težave z namestitvami**: Samostojno rešujte pogoste težave

#### 📖 Viri delavnice
- **🎥 Interaktivni vodnik**: [Gradiva delavnice](workshop/README.md) - Učno okolje v brskalniku
- **📋 Navodila po modulih**:
  - [0. Uvod](workshop/docs/instructions/0-Introduction.md) - Pregled delavnice in cilji
  - [1. Izbira](workshop/docs/instructions/1-Select-AI-Template.md) - Poiščite in izberite AI predloge
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Namestite in preverite predloge
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Raziščite arhitekturo predloge
  - [4. Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) - Obvladujte azure.yaml
  - [5. Prilagoditev](workshop/docs/instructions/5-Customize-AI-Template.md) - Prilagodite za vaš scenarij
  - [6. Odstranitev](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Počistite vire
  - [7. Zaključek](workshop/docs/instructions/7-Wrap-up.md) - Pregled in nadaljnji koraki
- **🛠️ AI delavnica laboratorij**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Vaje osredotočene na AI
- **💡 Hitri začetek**: [Vodnik za nastavitev delavnice](workshop/README.md#quick-start) - Konfiguracija okolja

**Idealno za**: Korporativno usposabljanje, univerzitetne tečaje, samostojno učenje in programerske bootcampe.

---

## 📖 Poglobljen pogled: Zmožnosti AZD

Poleg osnov ponuja AZD močne funkcije za produkcijska nameščanja:

- **Nameščanja na osnovi predlog** - Uporabite vnaprej pripravljene predloge za pogoste vzorce aplikacij
- **Infrastruktura kot koda** - Upravljajte Azure vire z uporabo Bicep ali Terraform  
- **Integrirane delovne tokove** - Nemoteno zagotavljanje, nameščanje in nadzorovanje aplikacij
- **Prijazno do razvijalcev** - Optimizirano za produktivnost in izkušnjo razvijalcev

### **AZD + Microsoft Foundry: Idealno za AI nameščanja**

**Zakaj AZD za AI rešitve?** AZD naslavlja glavne izzive, s katerimi se soočajo AI razvijalci:

- **Predloge pripravljene za AI** - Predkonfigurirane predloge za Microsoft Foundry modele, Cognitive Services in ML delovne obremenitve
- **Varna AI nameščanja** - Vgrajeni varnostni vzorci za AI storitve, API ključe in modelne končne točke  
- **Produkcijski AI vzorci** - Najboljše prakse za skalabilna, stroškovno učinkovita nameščanja AI aplikacij
- **End-to-End AI delovni tokovi** - Od razvoja modela do produkcijske namestitve z ustreznim nadzorom
- **Optimizacija stroškov** - Pametna razporeditev virov in strategije skaliranja za AI delovne obremenitve
- **Integracija z Microsoft Foundry** - Gladka povezava s katalogom modelov Microsoft Foundry in končnimi točkami

---

## 🎯 Knjižnica predlog in primerov

### Izpostavljeno: Microsoft Foundry predloge
**Začnite tukaj, če nameščate AI aplikacije!**

> **Opomba:** Te predloge prikazujejo različne AI vzorce. Nekatere so zunanje Azure vzorce, druge so lokalne implementacije.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavje 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Zunanje |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavje 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Zunanje |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavje 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Zunanje |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavje 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Zunanje |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavje 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Zunanje |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Poglavje 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Zunanje |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Poglavje 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokalno** |

### Izpostavljeno: Celoviti učni scenariji
**Predloge aplikacij pripravljenih za produkcijo, mapirane na učna poglavja**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavje 2 | ⭐ | Osnovni vzorci nameščanja AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavje 2 | ⭐⭐ | Implementacija RAG z Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Poglavje 4 | ⭐⭐ | Integracija Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavje 5 | ⭐⭐⭐ | Okvir agentov in klicanje funkcij |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Poglavje 8 | ⭐⭐⭐ | Orkestracija podjetniškega AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Poglavje 5 | ⭐⭐⭐⭐ | Večagentna arhitektura s Customer in Inventory agenti |

### Učenje po tipu primerov

> **📌 Lokalni proti zunanjim primerom:**  
> **Lokalni primeri** (v tem repozitoriju) = Na voljo za takojšnjo uporabo  
> **Zunanji primeri** (Azure Samples) = Klonirajte iz povezanih repozitorijev

#### Lokalni primeri (pripravljeni za uporabo)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Celovita implementacija pripravljena za produkcijo z ARM predlogami
  - Arhitektura z več agenti (Customer + Inventory agenti)
  - Celovit nadzor in ocenjevanje
  - Namestitev z enim klikom preko ARM predloge

#### Lokalni primeri - Kontejnerske aplikacije (Poglavja 2-5)
**Celoviti primeri nameščanja kontejnerjev v tem repozitoriju:**
- [**Container App Examples**](examples/container-app/README.md) - Celovit vodnik za nameščanje kontejnerjev
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Osnovni REST API s scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Produkcijsko pripravljen večstoritveni prikaz
  - Hitri začetek, produkcija in napredni vzorci nameščanja
  - Nadzor, varnost in smernice za optimizacijo stroškov

#### Zunanji primeri - Preproste aplikacije (Poglavja 1-2)
**Klonirajte te Azure Samples repozitorije za začetek:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Osnovni vzorci nameščanja
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Nameščanje statične vsebine
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Nameščanje REST API

#### Zunanji primeri - Integracija baz podatkov (Poglavja 3-4)
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzorci povezovanja z bazo podatkov
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Brezstrežni podatkovni potek

#### Zunanji primeri - Napredni vzorci (poglavja 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arhitekture z več storitvami
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Ozadinsko procesiranje  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Vzorci za strojno učenje pripravljeni za produkcijo

### Zbirke zunanjih predlog
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kurirana zbirka uradnih in skupnostnih predlog
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentacija predlog Microsoft Learn
- [**Examples Directory**](examples/README.md) - Lokalni učni primeri s podrobnimi razlagami

---

## 📚 Viri za učenje in reference

### Hitre reference
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Ključni azd ukazi organizirani po poglavjih
- [**Glossary**](resources/glossary.md) - Terminologija Azure in azd  
- [**FAQ**](resources/faq.md) - Pogosta vprašanja organizirana po poglavjih učenja
- [**Study Guide**](resources/study-guide.md) - Celovite praktične vaje

### Delavnice s praktičnimi vajami
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Naredite vaše AI rešitve primerne za uvajanje z AZD (2–3 ure)
- [**Interactive Workshop**](workshop/README.md) - 8-modulne vodene vaje z MkDocs in GitHub Codespaces
  - Sledi: Uvod → Izbira → Preverjanje → Razčlenitev → Konfiguracija → Prilagoditev → Odstranitev → Zaključek

### Zunanji viri za učenje
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### Spretnosti AI agentov za vaš urejevalnik
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 odprtih veščin agentov za Azure AI, Foundry, uvajanje, diagnostiko, optimizacijo stroškov in več. Namestite jih v GitHub Copilot, Cursor, Claude Code ali kateri koli podprt agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Hiter vodnik za odpravljanje težav

**Pogoste težave, s katerimi se srečujejo začetniki, in takojšnje rešitve:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Najprej namestite AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Preverite namestitev
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Seznam razpoložljivih naročnin
az account list --output table

# Nastavi privzeto naročnino
az account set --subscription "<subscription-id-or-name>"

# Nastavi za AZD okolje
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Preveri
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Poskusite drugo regijo Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ali uporabite manjše SKU-je pri razvoju
# Uredite infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Možnost 1: Očisti in poskusi znova
azd down --force --purge
azd up

# Možnost 2: Samo popravi infrastrukturo
azd provision

# Možnost 3: Preveri podrobno stanje
azd show

# Možnost 4: Preveri dnevnike v Azure Monitorju
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Ponovno se prijavite za AZD
azd auth logout
azd auth login

# Neobvezno: osvežite tudi Azure CLI, če izvajate ukaze az
az logout
az login

# Preverite prijavo
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD ustvarja enolična imena, vendar če pride do konflikta:
azd down --force --purge

# Nato poskusi znova z novim okoljem
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normal wait times:**
- Preprosta spletna aplikacija: 5–10 minut
- Aplikacija z bazo podatkov: 10–15 minut
- AI aplikacije: 15–25 minut (provisioniranje OpenAI je počasno)

```bash
# Preverite napredek
azd show

# Če se zatakne več kot 30 minut, preverite Azure Portal:
azd monitor --overview
# Poiščite neuspele razmestitve
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Preverite svojo vlogo v Azureu
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebujete vsaj vlogo "Contributor"
# Prosite svojega Azure skrbnika, naj dodeli:
# - Contributor (za vire)
# - User Access Administrator (za dodelitve vlog)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Prikaži vse končne točke storitev
azd show

# Ali odpri Azure Portal
azd monitor

# Preveri določeno storitev
azd env get-values
# Poišči spremenljivke *_URL
```
</details>

### 📚 Celotni viri za odpravljanje težav

- **Vodnik za pogoste težave:** [Podrobne rešitve](docs/chapter-07-troubleshooting/common-issues.md)
- **Težave specifične za AI:** [Odpravljanje težav z AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Vodnik za razhroščevanje:** [Korak-po-korak razhroščevanje](docs/chapter-07-troubleshooting/debugging.md)
- **Poiščite pomoč:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Zaključek tečaja in potrdila

### Sledenje napredku
Spremljajte svoj napredek skozi posamezna poglavja:

- [ ] **Chapter 1**: Osnove in hiter začetek ✅
- [ ] **Chapter 2**: Razvoj, usmerjen na AI ✅  
- [ ] **Chapter 3**: Konfiguracija in avtentikacija ✅
- [ ] **Chapter 4**: Infrastruktura kot koda in uvajanje ✅
- [ ] **Chapter 5**: Rešitve AI z več agenti ✅
- [ ] **Chapter 6**: Preverjanje in načrtovanje pred uvajanjem ✅
- [ ] **Chapter 7**: Odpravljanje težav in razhroščevanje ✅
- [ ] **Chapter 8**: Vzorci za produkcijo in podjetja ✅

### Preverjanje znanja
Po zaključenem poglavju preverite svoje znanje z:
1. **Praktična vaja**: Dokončajte praktično uvajanje poglavja
2. **Preverjanje znanja**: Preglejte razdelek FAQ za svoje poglavje
3. **Skupnostna razprava**: Delite svoje izkušnje v Azure Discord
4. **Naslednje poglavje**: Preidite na naslednjo raven zapletenosti

### Prednosti po zaključku tečaja
Po zaključku vseh poglavij boste imeli:
- **Izkušnje s produkcijo**: Uvedene resnične AI aplikacije v Azure
- **Poklicne veščine**: Sposobnosti uvajanja primerne za podjetja  
- **Priznanje v skupnosti**: Aktivni član Azure razvijalne skupnosti
- **Napredek v karieri**: Priljubljene spretnosti za AZD in uvajanje AI

---

## 🤝 Skupnost in podpora

### Poiščite pomoč in podporo
- **Tehnične težave**: [Prijavite napake in zahtevajte funkcije](https://github.com/microsoft/azd-for-beginners/issues)
- **Vprašanja o učenju**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoč specifična za AI**: Pridružite se [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Uradna dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Vpogledi skupnosti iz Microsoft Foundry Discorda

**Nedavni rezultati ankete iz kanala #Azure:**
- **45%** razvijalcev želi uporabljati AZD za AI delovne obremenitve
- **Glavne izzive** predstavljajo: večstorivne razmestitve, upravljanje poverilnic, pripravljenost za produkcijo  
- **Najbolj zahtevano**: AI-specifične predloge, vodniki za odpravljanje težav, priporočene prakse

**Pridružite se naši skupnosti, da:**
- Delite svoje izkušnje z AZD + AI in prejmete pomoč
- Dostopate do zgodnjih predogledov novih AI predlog
- Prispevate k najboljšim praksam za uvajanje AI
- Vplivate na prihodnji razvoj funkcij AI + AZD

### Prispevanje k tečaju
Prispevki so dobrodošli! Prosimo, preberite naš [Contributing Guide](CONTRIBUTING.md) za podrobnosti o:
- **Izboljšave vsebine**: Nadgradite obstoječa poglavja in primere
- **Novi primeri**: Dodajte resnične scenarije in predloge  
- **Prevodi**: Pomagajte vzdrževati večjezično podporo
- **Poročila o napakah**: Izboljšajte natančnost in jasnost
- **Standardi skupnosti**: Upoštevajte naša vključujoča pravila skupnosti

---

## 📄 Informacije o tečaju

### Licenca
Ta projekt je licenciran pod licenco MIT - za podrobnosti glejte datoteko [LICENSE](../../LICENSE).

### Povezani Microsoftovi učni viri

Our team produces other comprehensive learning courses:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j za začetnike](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js za začetnike](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain za začetnike](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD za začetnike](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI za začetnike](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP za začetnike](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI agenti za začetnike](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serija o generativnem AI
[![Generativni AI za začetnike](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Osnovno učenje
[![ML za začetnike](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Podatkovna znanost za začetnike](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Umetna inteligenca za začetnike](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kibernetska varnost za začetnike](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Spletni razvoj za začetnike](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT za začetnike](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Razvoj XR za začetnike](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serija Copilot
[![Copilot za programiranje v paru z AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot za C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Pustolovščina](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigacija tečaja

**🚀 Pripravljeni začeti z učenjem?**

**Začetniki**: Začnite s [Poglavje 1: Temelji in hiter začetek](#-chapter-1-foundation--quick-start)  
**Razvijalci AI**: Pojdite na [Poglavje 2: Razvoj z AI v ospredju](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Izkušeni razvijalci**: Začnite z [Poglavje 3: Konfiguracija in overjanje](#️-chapter-3-configuration--authentication)

**Naslednji koraki**: [Začni poglavje 1 - Osnove AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, prosimo, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku velja za avtoritativni vir. Za kritične informacije priporočamo strokovni prevod, opravljen s strani človeka. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->