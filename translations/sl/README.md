# AZD za začetnike: strukturirana učna pot

![AZD-za-začetnike](../../translated_images/sl/azdbeginners.5527441dd9f74068.webp) 

[![Opazovalci GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forki GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub zvezde](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Samodejni prevodi (vedno posodobljeni)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabščina](../ar/README.md) | [Bengalščina](../bn/README.md) | [Bolgarščina](../bg/README.md) | [Burmanski (Mjanmar)](../my/README.md) | [Kitajščina (poenostavljena)](../zh-CN/README.md) | [Kitajščina (tradicionalna, Hong Kong)](../zh-HK/README.md) | [Kitajščina (tradicionalna, Macau)](../zh-MO/README.md) | [Kitajščina (tradicionalna, Taiwan)](../zh-TW/README.md) | [Hrvaščina](../hr/README.md) | [Češčina](../cs/README.md) | [Danščina](../da/README.md) | [Nizozemščina](../nl/README.md) | [Estonščina](../et/README.md) | [Finščina](../fi/README.md) | [Francoščina](../fr/README.md) | [Nemščina](../de/README.md) | [Grščina](../el/README.md) | [Hebrejščina](../he/README.md) | [Hindijščina](../hi/README.md) | [Madžarščina](../hu/README.md) | [Indonezijščina](../id/README.md) | [Italijanščina](../it/README.md) | [Japonščina](../ja/README.md) | [Kanadščina](../kn/README.md) | [Korejščina](../ko/README.md) | [Litovščina](../lt/README.md) | [Malajščina](../ms/README.md) | [Malajalščina](../ml/README.md) | [Maratščina](../mr/README.md) | [Nepalščina](../ne/README.md) | [Nigerijski pidgin](../pcm/README.md) | [Norveščina](../no/README.md) | [Perzijski (Farsi)](../fa/README.md) | [Poljščina](../pl/README.md) | [Portugalščina (Brazilija)](../pt-BR/README.md) | [Portugalščina (Portugalska)](../pt-PT/README.md) | [Pandžabščina (Gurmukhi)](../pa/README.md) | [Romunščina](../ro/README.md) | [Ruščina](../ru/README.md) | [Srbščina (cirilica)](../sr/README.md) | [Slovaščina](../sk/README.md) | [Slovenščina](./README.md) | [Španščina](../es/README.md) | [Svahilščina](../sw/README.md) | [Švedščina](../sv/README.md) | [Tagalog (Filipini)](../tl/README.md) | [Tamilščina](../ta/README.md) | [Telugščina](../te/README.md) | [Tajsščina](../th/README.md) | [Turščina](../tr/README.md) | [Ukrajinščina](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamščina](../vi/README.md)

> **Raje klonirate lokalno?**
>
> Ta repozitorij vključuje več kot 50 prevodov, kar bistveno poveča velikost prenosa. Če želite klonirati brez prevodov, uporabite sparse checkout:
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
> To vam da vse, kar potrebujete za dokončanje tečaja, in znatno hitrejši prenos.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Kaj je danes novega v azd

Azure Developer CLI se je razširil onkraj tradicionalnih spletnih aplikacij in API-jev. Danes je azd enotno orodje za razmestitev katerekoli aplikacije v Azure — vključno z AI-podprtimi aplikacijami in inteligentnimi agenti.

To pomeni za vas:

- **AI agenti so sedaj enakovredne azd obremenitve.** Lahko inicializirate, razmestite in upravljate projekte AI agentov z enakim potekom dela `azd init` → `azd up`, ki ga že poznate.
- **Integracija z Microsoft Foundry** prinaša razmestitev modelov, gostovanje agentov in konfiguracijo AI storitev neposredno v ekosistem azd predlog.
- **Jedrni potek dela se ni spremenil.** Ne glede na to, ali razmestite aplikacijo za opravila, mikroservis ali večagentno AI rešitev, so ukazi enaki.

Če ste predhodno uporabljali azd, je podpora za AI naravna razširitev — ne ločeno orodje ali napreden program. Če začnete iz nič, se boste naučili enega poteka dela, ki deluje za vse.

---

## 🚀 Kaj je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je prijazno orodno vrstično orodje za razvijalce, ki poenostavi razmestitev aplikacij v Azure. Namesto ročnega ustvarjanja in povezovanja ducatov Azure virov lahko z enim ukazom razmestite celotne aplikacije.

### Čarovnija ukaza `azd up`

```bash
# Ta en ukaz naredi vse:
# ✅ Ustvari vse Azure vire
# ✅ Konfigurira omrežje in varnost
# ✅ Sestavi vašo aplikacijsko kodo
# ✅ Namesti na Azure
# ✅ Dobi delujoč URL
azd up
```

**To je vse!** Brez klikanja po Azure portalu, brez učenja zapletenih ARM predlogov vnaprej, brez ročne konfiguracije — le delujoče aplikacije v Azure.

---

## ❓ Azure Developer CLI proti Azure CLI: Kakšna je razlika?

To je najpogosteje zastavljeno vprašanje pri začetnikih. Tukaj je preprost odgovor:

| Funkcija | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Namen** | Upravljanje posameznih Azure virov | Razmestitev celotnih aplikacij |
| **Pristop** | Osredotočen na infrastrukturo | Osredotočen na aplikacijo |
| **Primer** | `az webapp create --name myapp...` | `azd up` |
| **Krivulja učenja** | Zahteva poznavanje Azure storitev | Dovolj je, da poznate svojo aplikacijo |
| **Najbolj primerno za** | DevOps, Infrastruktura | Razvijalci, Prototipiranje |

### Preprosta analogija

- **Azure CLI** je kot imeti vsa orodja za gradnjo hiše - kladiva, žage, žeblje. Lahko zgradite karkoli, vendar morate poznati gradbeništvo.
- **Azure Developer CLI** je kot najeti izvajalca - opišete, kaj želite, in on poskrbi za gradnjo.

### Kdaj uporabiti katerega

| Scenarij | Uporabi |
|----------|----------|
| "Želim hitro razmestiti svojo spletno aplikacijo" | `azd up` |
| "Potrebujem le ustvariti račun za shranjevanje" | `az storage account create` |
| "Gradim celotno AI aplikacijo" | `azd init --template azure-search-openai-demo` |
| "Moram odpravljati napake pri določenem Azure viru" | `az resource show` |
| "Želim razmestitev pripravljeno za produkcijo v nekaj minutah" | `azd up --environment production` |

### Delujeta skupaj!

AZD uporablja Azure CLI v ozadju. Uporabljate lahko oba:
```bash
# Namestite vašo aplikacijo z AZD
azd up

# Nato natančno prilagodite določene vire z Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Poiščite predloge v Awesome AZD

Ne začnite iz nič! **Awesome AZD** je skupnostna zbirka predlog, pripravljenih za razmestitev:

| Viri | Opis |
|----------|-------------|
| 🔗 [**Galerija Awesome AZD**](https://azure.github.io/awesome-azd/) | Brskajte po več kot 200 predlogah z enojnim klikom za razmestitev |
| 🔗 [**Predložite predlogo**](https://github.com/Azure/awesome-azd/issues) | Prispevajte svojo predlogo skupnosti |
| 🔗 [**GitHub repozitorij**](https://github.com/Azure/awesome-azd) | Všečkajte in raziščite izvorno kodo |

### Priljubljene AI predloge iz Awesome AZD

```bash
# RAG klepet z Microsoft Foundry modeli + iskanje z AI
azd init --template azure-search-openai-demo

# Hitro AI klepetalno aplikacijo
azd init --template openai-chat-app-quickstart

# AI agenti s Foundry agenti
azd init --template get-started-with-ai-agents
```

---

## 🎯 Začetek v 3 korakih

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

### Korak 2: Prijava v Azure

```bash
azd auth login
```

### Korak 3: Razmestite svojo prvo aplikacijo

```bash
# Inicializiraj iz predloge
azd init --template todo-nodejs-mongo

# Namesti na Azure (ustvari vse!)
azd up
```

**🎉 To je vse!** Vaša aplikacija je zdaj v živo v Azure.

### Čiščenje (ne pozabite!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kako uporabljati ta tečaj

Ta tečaj je zasnovan za **postopno učenje** - začnite tam, kjer se počutite udobno, in se postopoma premikajte naprej:

| Vaše izkušnje | Začnite tukaj |
|-----------------|------------|
| **Povsem nov v Azure** | [Pogl. 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Poznate Azure, nov v AZD** | [Pogl. 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Želite razmestiti AI aplikacije** | [Pogl. 2: AI-prvi razvoj](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Želite praktično vajo** | [🎓 Interaktiv delavnica](workshop/README.md) - 3-4 urni vodeni laboratorij |
| **Potrebujete produkcijske vzorce** | [Pogl. 8: Produkcija & enterprise](#-chapter-8-production--enterprise-patterns) |

### Hitra nastavitev

1. **Naredite fork tega repozitorija**: [![Forki GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonirajte ga**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Dobite pomoč**: [Skupnost Azure na Discordu](https://discord.com/invite/ByRwuEEgH4)

> **Raje klonirate lokalno?**
>
> Ta repozitorij vključuje več kot 50 prevodov, kar bistveno poveča velikost prenosa. Če želite klonirati brez prevodov, uporabite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> To vam da vse, kar potrebujete za dokončanje tečaja, in znatno hitrejši prenos.


## Pregled tečaja

Obvladujte Azure Developer CLI (azd) prek strukturiranih poglavij, zasnovanih za postopno učenje. **Posebna osredotočenost na razmestitev AI aplikacij z integracijo Microsoft Foundry.**

### Zakaj je ta tečaj bistven za sodobne razvijalce

Glede na vpoglede skupnosti Microsoft Foundry Discord, **45 % razvijalcev želi uporabiti AZD za AI obremenitve**, vendar se srečujejo z izzivi pri:
- Zapletenih večstorljivih AI arhitekturah
- Najboljših praksah razmestitve AI v produkciji  
- Integraciji in konfiguraciji Azure AI storitev
- Optimizaciji stroškov za AI obremenitve
- Odpravljanju težav pri razmestitvah specifičnih za AI

### Učni cilji

S končanjem tega strukturiranega tečaja boste:
- **Obvladali osnove AZD**: Jedrne koncepte, namestitev in konfiguracijo
- **Razmestili AI aplikacije**: Uporabili AZD s storitvami Microsoft Foundry
- **Uvedli infrastrukturo kot kodo**: Upravljali Azure vire z Bicep predlogami
- **Odpravljali težave pri razmestitvah**: Rešili pogoste težave in razhroščevanje
- **Optimizirali za produkcijo**: Varnost, skaliranje, nadzor in upravljanje stroškov
- **Zgradili večagentne rešitve**: Razmestili kompleksne AI arhitekture

## 🗺️ Zemljevid tečaja: hitra navigacija po poglavjih

Vsako poglavje ima namenski README z učnimi cilji, hitrimi začetki in vajami:

| Poglavje | Tema | Lekcije | Trajanje | Kompleksnost |
|---------|-------|---------|----------|------------|
| **[Pogl. 1: Osnove](docs/chapter-01-foundation/README.md)** | Začetek | [Osnove AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Namestitev](docs/chapter-01-foundation/installation.md) &#124; [Prvi projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Poglavje 2: Razvoj AI](docs/chapter-02-ai-development/README.md)** | AI-prve aplikacije | [Integracija Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agenti](docs/chapter-02-ai-development/agents.md) &#124; [Razmestitev modelov](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Delavnica](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ur | ⭐⭐ |
| **[Poglavje 3: Konfiguracija](docs/chapter-03-configuration/README.md)** | Avtentikacija in varnost | [Konfiguracija](docs/chapter-03-configuration/configuration.md) &#124; [Avtentikacija in varnost](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Poglavje 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC in nameščanje | [Vodnik za nameščanje](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioniranje](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 ur | ⭐⭐⭐ |
| **[Poglavje 5: Več-agentno](docs/chapter-05-multi-agent/README.md)** | Rešitve z AI agenti | [Prodajni scenarij](examples/retail-scenario.md) &#124; [Vzorce koordinacije](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ur | ⭐⭐⭐⭐ |
| **[Poglavje 6: Pred-nameščanje](docs/chapter-06-pre-deployment/README.md)** | Načrtovanje in preverjanje | [Preflight preverjanja](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Načrtovanje zmogljivosti](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Izbira SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ura | ⭐⭐ |
| **[Poglavje 7: Odpravljanje težav](docs/chapter-07-troubleshooting/README.md)** | Razhroščevanje in odprava | [Pogoste težave](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Razhroščevanje](docs/chapter-07-troubleshooting/debugging.md) &#124; [Težave z AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 ur | ⭐⭐ |
| **[Poglavje 8: Produkcija](docs/chapter-08-production/README.md)** | Vzorci za podjetja | [Prakse za proizvodnjo](docs/chapter-08-production/production-ai-practices.md) | 2-3 ur | ⭐⭐⭐⭐ |
| **[🎓 Delavnica](workshop/README.md)** | Praktična delavnica | [Uvod](workshop/docs/instructions/0-Introduction.md) &#124; [Izbor](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Razčlenitev](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prilagoditev](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Razgradnja infrastrukture](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zaključek](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ur | ⭐⭐ |

**Skupna dolžina tečaja:** ~10-14 ur | **Napredek veščin:** Začetnik → Pripravljen za proizvodnjo

---

## 📚 Učna poglavja

*Izberite svojo učno pot glede na raven izkušenj in cilje*

### 🚀 Poglavje 1: Osnove in hiter začetek
**Predpogoji**: naročnina na Azure, osnovno znanje ukazne vrstice  
**Trajanje**: 30-45 minut  
**Kompleksnost**: ⭐

#### Česa se boste naučili
- Razumevanje osnov Azure Developer CLI
- Namestitev AZD na vaši platformi
- Vaša prva uspešna namestitev

#### Viri za učenje
- **🎯 Začnite tukaj**: [Kaj je Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorija**: [Osnove AZD](docs/chapter-01-foundation/azd-basics.md) - Osnovni pojmi in terminologija
- **⚙️ Namestitev**: [Namestitev in nastavitev](docs/chapter-01-foundation/installation.md) - Vodniki za posamezne platforme
- **🛠️ Praktično**: [Vaš prvi projekt](docs/chapter-01-foundation/first-project.md) - Priročnik po korakih
- **📋 Hiter pregled**: [Hitri priročnik ukazov](resources/cheat-sheet.md)

#### Praktične vaje
```bash
# Hitro preverjanje namestitve
azd version

# Namestite svojo prvo aplikacijo
azd init --template todo-nodejs-mongo
azd up
```

**💡 Rezultat poglavja**: Uspešno razmestite preprosto spletno aplikacijo v Azure s pomočjo AZD

**✅ Preverjanje uspeha:**
```bash
# Po zaključku 1. poglavja bi morali biti sposobni:
azd version              # Prikaže nameščeno različico
azd init --template todo-nodejs-mongo  # Inicializira projekt
azd up                  # Razporedi v Azure
azd show                # Prikaže URL delujoče aplikacije
# Aplikacija se odpre v brskalniku in deluje
azd down --force --purge  # Počisti vire
```

**📊 Časovna naložba:** 30-45 minut  
**📈 Raven znanja po:** Lahko samostojno razmestite osnovne aplikacije
**📈 Raven znanja po:** Lahko samostojno razmestite osnovne aplikacije

---

### 🤖 Poglavje 2: Razvoj, osredotočen na AI (Priporočeno za AI razvijalce)
**Predpogoji**: Dokončano poglavje 1  
**Trajanje**: 1-2 ure  
**Kompleksnost**: ⭐⭐

#### Česa se boste naučili
- Integracija Microsoft Foundry z AZD
- Razmestitev aplikacij, poganjanih z AI
- Razumevanje konfiguracij AI storitev

#### Viri za učenje
- **🎯 Začnite tukaj**: [Integracija Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agenti**: [Vodnik po AI agentih](docs/chapter-02-ai-development/agents.md) - Razmestite inteligentne agente z AZD
- **📖 Vzorci**: [Razmestitev AI modelov](docs/chapter-02-ai-development/ai-model-deployment.md) - Razmestite in upravljajte AI modele
- **🛠️ Delavnica**: [AI delavnica](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pripravite svoje AI rešitve za AZD
- **🎥 Interaktivni vodnik**: [Gradiva delavnice](workshop/README.md) - Učenje preko brskalnika z MkDocs * DevContainer okoljem
- **📋 Predloge**: [Predloge Microsoft Foundry](#viri-delavnice)
- **📝 Primeri**: [Primeri razmestitev z AZD](examples/README.md)

#### Praktične vaje
```bash
# Razmestite svojo prvo AI aplikacijo
azd init --template azure-search-openai-demo
azd up

# Preizkusite dodatne AI predloge
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Rezultat poglavja**: Razmestite in konfigurirajte klepetalno aplikacijo, poganjano z AI, z zmožnostmi RAG

**✅ Preverjanje uspeha:**
```bash
# Po poglavju 2 bi morali biti sposobni:
azd init --template azure-search-openai-demo
azd up
# Preizkusiti vmesnik za klepet z AI
# Postaviti vprašanja in prejeti odgovore, ki jih poganja AI, z viri
# Preveriti, ali iskalna integracija deluje
azd monitor  # Preveriti, ali Application Insights prikazuje telemetrijo
azd down --force --purge
```

**📊 Časovna naložba:** 1-2 ure  
**📈 Raven znanja po:** Lahko razmestite in konfigurirate AI aplikacije, pripravljene za produkcijo  
**💰 Zavedanje stroškov:** Razumeti stroške razvoja $80-150/mesec, stroške produkcije $300-3500/mesec

#### 💰 Razmisleki o stroških za AI razmestitve

**Razvojno okolje (ocenjeno $80-150/mesec):**
- Microsoft Foundry modeli (plačilo po porabi): $0-50/mesec (odvisno od uporabe tokenov)
- AI Search (osnovni nivo): $75/mesec
- Container Apps (poraba): $0-20/mesec
- Shramba (standardna): $1-5/mesec

**Produkcijsko okolje (ocenjeno $300-3,500+/mesec):**
- Microsoft Foundry modeli (PTU za dosledno zmogljivost): $3,000+/mesec ALI plačilo po porabi pri večjih količinah
- AI Search (standardni nivo): $250/mesec
- Container Apps (dodeljeno): $50-100/mesec
- Application Insights: $5-50/mesec
- Shramba (premium): $10-50/mesec

**💡 Nasveti za optimizacijo stroškov:**
- Uporabljajte **brezplačen nivo** Microsoft Foundry modelov za učenje (Azure OpenAI vključuje 50.000 tokenov/mesec)
- Za sprostitev virov, kadar ne razvijate aktivno, zaženite `azd down`
- Začnite z obračunavanjem po porabi, PTU nadgradite le za produkcijo
- Uporabite `azd provision --preview` za oceno stroškov pred razmestitvijo
- Omogočite samodejno skaliranje: plačajte le za dejansko porabo

**Nadzor stroškov:**
```bash
# Preverite ocenjene mesečne stroške
azd provision --preview

# Spremljajte dejanske stroške v Azure Portalu
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Poglavje 3: Konfiguracija in avtentikacija
**Predpogoji**: Dokončano poglavje 1  
**Trajanje**: 45-60 minut  
**Kompleksnost**: ⭐⭐

#### Česa se boste naučili
- Konfiguracija in upravljanje okolij
- Najboljše prakse avtentikacije in varnosti
- Poimenovanje in organizacija virov

#### Viri za učenje
- **📖 Konfiguracija**: [Vodnik za konfiguracijo](docs/chapter-03-configuration/configuration.md) - Nastavitev okolja
- **🔐 Varnost**: [Vzorce avtentikacije in upravljena identiteta](docs/chapter-03-configuration/authsecurity.md) - Vzorci avtentikacije
- **📝 Primeri**: [Primer aplikacije z bazo podatkov](examples/database-app/README.md) - Primeri baz podatkov z AZD

#### Praktične vaje
- Konfigurirajte več okolij (dev, staging, prod)
- Nastavite avtentikacijo z upravljano identiteto
- Uvedite konfiguracije, specifične za okolje

**💡 Rezultat poglavja**: Upravljajte več okolij z ustrezno avtentikacijo in varnostjo

---

### 🏗️ Poglavje 4: Infrastruktura kot koda in nameščanje
**Predpogoji**: Dokončana poglavja 1-3  
**Trajanje**: 1-1,5 ure  
**Kompleksnost**: ⭐⭐⭐

#### Česa se boste naučili
- Napredni vzorci nameščanja
- Infrastruktura kot koda z Bicep
- Strategije priprave virov

#### Viri za učenje
- **📖 Nameščanje**: [Vodnik za nameščanje](docs/chapter-04-infrastructure/deployment-guide.md) - Celotni poteki dela
- **🏗️ Provisioniranje**: [Provisioniranje virov](docs/chapter-04-infrastructure/provisioning.md) - Upravljanje Azure virov
- **📝 Primeri**: [Primer aplikacije v kontejnerju](../../examples/container-app) - Razmestitve v kontejnerjih

#### Praktične vaje
- Ustvarite prilagojene predloge Bicep
- Razmestite aplikacije z več storitvami
- Uvedite strategije blue-green nameščanja

**💡 Rezultat poglavja**: Razmestite kompleksne aplikacije z več storitvami z uporabo prilagojenih infrastrukturnih predlog

---

### 🎯 Poglavje 5: Večagentne AI rešitve (napredno)
**Predpogoji**: Dokončana poglavja 1-2  
**Trajanje**: 2-3 ure  
**Kompleksnost**: ⭐⭐⭐⭐

#### Česa se boste naučili
- Vzorci arhitekture več agentov
- Orkestracija in koordinacija agentov
- AI razmestitve pripravljene za produkcijo

#### Viri za učenje
- **🤖 Predstavljeni projekt**: [Večagentna rešitev za trgovino](examples/retail-scenario.md) - Popolna implementacija
- **🛠️ ARM predloge**: [Paket ARM predlog](../../examples/retail-multiagent-arm-template) - Namestitev z enim klikom
- **📖 Arhitektura**: [Vzorci koordinacije več agentov](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzorci

#### Praktične vaje
```bash
# Razporedi celotno maloprodajno rešitev z več agenti
cd examples/retail-multiagent-arm-template
./deploy.sh

# Razišči konfiguracije agentov
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Rezultat poglavja**: Razmestite in upravljajte večagentno AI rešitev, pripravljeno za produkcijo, z agenti za stranke in zalogo

---

### 🔍 Poglavje 6: Preverjanje in načrtovanje pred nameščanjem
**Predpogoji**: Dokončano poglavje 4  
**Trajanje**: 1 ura  
**Kompleksnost**: ⭐⭐

#### Česa se boste naučili
- Načrtovanje zmogljivosti in preverjanje virov
- Strategije izbire SKU
- Preflight preverjanja in avtomatizacija

#### Viri za učenje
- **📊 Načrtovanje**: [Načrtovanje zmogljivosti](docs/chapter-06-pre-deployment/capacity-planning.md) - Preverjanje virov
- **💰 Izbira**: [Izbira SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Stroškovno učinkovite možnosti
- **✅ Preverjanje**: [Preflight preverjanja](docs/chapter-06-pre-deployment/preflight-checks.md) - Avtomatizirani skripti

#### Praktične vaje
- Zaženite skripte za preverjanje zmogljivosti
- Optimirajte izbiro SKU glede na stroške
- Uvedite avtomatizirana preverjanja pred nameščanjem

**💡 Rezultat poglavja**: Preverite in optimizirajte razmestitve pred izvedbo

---

### 🚨 Poglavje 7: Odpravljanje težav in razhroščevanje
**Predpogoji**: Dokončano katerokoli poglavje o nameščanju  
**Trajanje**: 1-1,5 ure  
**Kompleksnost**: ⭐⭐

#### Česa se boste naučili
- Sistemski pristopi k razhroščevanju
- Pogoste težave in rešitve
- Odpravljanje težav specifičnih za AI

#### Viri za učenje
- **🔧 Pogoste težave**: [Pogoste težave](docs/chapter-07-troubleshooting/common-issues.md) - Pogosta vprašanja in rešitve
- **🕵️ Razhroščevanje**: [Vodnik za razhroščevanje](docs/chapter-07-troubleshooting/debugging.md) - Strategije po korakih
- **🤖 Težave z AI**: [Odpravljanje težav specifičnih za AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Težave storitev AI

#### Praktične vaje
- Diagnozirajte napake pri nameščanju
- Odpravite težave z avtentikacijo
- Razhroščevanje povezljivosti AI storitev

**💡 Rezultat poglavja**: Samostojno diagnosticirajte in odpravite pogoste težave pri nameščanju

---

### 🏢 Poglavje 8: Produkcija in vzorci za podjetja
**Predpogoji**: Dokončana poglavja 1-4  
**Trajanje**: 2-3 ure  
**Kompleksnost**: ⭐⭐⭐⭐

#### Česa se boste naučili
- Strategije za produkcijsko nameščanje
- Vzorci varnosti za podjetja
- Nadzor in optimizacija stroškov

#### Viri za učenje
- **🏭 Produkcija**: [Najboljše prakse za produkcijski AI](docs/chapter-08-production/production-ai-practices.md) - Vzorci za podjetja
- **📝 Primeri**: [Primer mikrostoritev](../../examples/microservices) - Kompleksne arhitekture
- **📊 Spremljanje**: [Integracija Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Spremljanje

#### Praktične vaje
- Implementirajte varnostne vzorce za podjetja
- Vzpostavite celovito spremljanje
- Razmestite v produkcijo z ustreznim upravljanjem

**💡 Rezultat poglavja**: Razmestite aplikacije, pripravljene za podjetja, s popolnimi produkcijskimi zmogljivostmi

---

## 🎓 Pregled delavnice: praktična izkušnja učenja

> **⚠️ STATUS DELAVNICE: V aktivnem razvoju**  
> Gradiva delavnice so trenutno v razvoju in dopolnjevanju. Osnovni moduli delujejo, vendar so nekateri napredni oddelki nepopolni. Aktivno delamo na dokončanju vsebine. [Spremljajte napredek →](workshop/README.md)

### Interaktivna gradiva delavnice
**Celovito praktično učenje z orodji v brskalniku in vodenimi vajami**

Naša gradiva delavnice nudijo strukturirano, interaktivno učno izkušnjo, ki dopolnjuje zgoraj omenjeno učno snov po poglavjih. Delavnica je zasnovana za samostojno učenje in za vodenje s strani inštruktorja.

#### 🛠️ Značilnosti delavnice
- **Vmesnik v brskalniku**: Celovita delavnica na MkDocs s funkcijami iskanja, kopiranja in tem
- **Integracija z GitHub Codespaces**: Nastavitev razvojnega okolja z enim klikom
- **Strukturirana učna pot**: 8-modulne vodene vaje (3–4 ure skupaj)
- **Napredna metodologija**: Uvod → Izbor → Validacija → Dekonstrukcija → Konfiguracija → Prilagoditev → Odstranitev → Zaključek
- **Interaktivno DevContainer okolje**: Predkonfigurirana orodja in odvisnosti

#### 📚 Struktura modulov delavnice
Delavnica sledi **8-modulni progresivni metodologiji**, ki vas popelje od odkrivanja do mojstrstva razmestitve:

| Modul | Tema | Kaj boste naredili | Trajanje |
|--------|-------|----------------|----------|
| **0. Uvod** | Pregled delavnice | Spoznajte učne cilje, predpogoje in strukturo delavnice | 15 min |
| **1. Izbor** | Iskanje predloge | Raziskujte AZD predloge in izberite pravo AI predlogo za vaš scenarij | 20 min |
| **2. Validacija** | Razmestitev in preverjanje | Razmestite predlogo z `azd up` in preverite, da infrastruktura deluje | 30 min |
| **3. Dekonstrukcija** | Raziščite strukturo | Uporabite GitHub Copilot za raziskovanje arhitekture predloge, datotek Bicep in organizacije kode | 30 min |
| **4. Konfiguracija** | Poglobljen vpogled v azure.yaml | Obvladajte konfiguracijo `azure.yaml`, sprožilce življenjskega cikla in spremenljivke okolja | 30 min |
| **5. Prilagoditev** | Prilagodite po svoje | Omogočite AI Search, sledenje, ocenjevanje in prilagodite za vaš scenarij | 45 min |
| **6. Odstranitev** | Čiščenje | Varno odstranite vire z `azd down --purge` | 15 min |
| **7. Zaključek** | Naslednji koraki | Preglejte dosežke, ključne koncepte in nadaljujte svojo učno pot | 15 min |

**Potek delavnice:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Začetek z delavnico
```bash
# Možnost 1: GitHub Codespaces (priporočeno)
# Kliknite "Koda" → "Ustvari codespace na veji main" v repozitoriju

# Možnost 2: Lokalni razvoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Sledite navodilom za nastavitev v workshop/README.md
```

#### 🎯 Cilji učenja delavnice
S končanjem delavnice bodo udeleženci:
- **Razmestiti produkcijske AI aplikacije**: Uporabite AZD z Microsoft Foundry storitvami
- **Obvladati večagentne arhitekture**: Implementirajte usklajene rešitve z AI agenti
- **Uvesti najboljše varnostne prakse**: Konfigurirajte avtentikacijo in nadzor dostopa
- **Optimizirati za razširljivost**: Načrtujte stroškovno učinkovite in zmogljive razmestitve
- **Odpravljati napake pri razmestitvah**: Samostojno rešujte pogoste težave

#### 📖 Viri delavnice
- **🎥 Interaktivni vodnik**: [Workshop Materials](workshop/README.md) - Učno okolje v brskalniku
- **📋 Navodila po posameznih modulih**:
  - [0. Uvod](workshop/docs/instructions/0-Introduction.md) - Pregled delavnice in cilji
  - [1. Izbor](workshop/docs/instructions/1-Select-AI-Template.md) - Poiščite in izberite AI predloge
  - [2. Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) - Razmestite in preverite predloge
  - [3. Dekonstrukcija](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Raziščite arhitekturo predloge
  - [4. Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) - Obvladajte azure.yaml
  - [5. Prilagoditev](workshop/docs/instructions/5-Customize-AI-Template.md) - Prilagodite za vaš scenarij
  - [6. Odstranitev](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Počistite vire
  - [7. Zaključek](workshop/docs/instructions/7-Wrap-up.md) - Pregled in naslednji koraki
- **🛠️ AI laboratorij delavnice**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Vaje osredotočene na AI
- **💡 Hiter začetek**: [Workshop Setup Guide](workshop/README.md#quick-start) - Konfiguracija okolja

**Popolno za**: Usposabljanje v podjetjih, univerzitetne tečaje, samostojno učenje in bootcampe za razvijalce.

---

## 📖 Poglobljeno: Zmožnosti AZD

Poleg osnov AZD ponuja zmogljive funkcije za produkcijske razmestitve:

- **Razmestitve na osnovi predlog** - Uporabite vnaprej pripravljene predloge za običajne vzorce aplikacij
- **Infrastruktura kot koda** - Upravljajte Azure vire z uporabo Bicep ali Terraform  
- **Integrirani delovni tokovi** - Brezhibno zagotovite, razmestite in spremljajte aplikacije
- **Prijazno razvijalcem** - Optimizirano za produktivnost in izkušnjo razvijalcev

### **AZD + Microsoft Foundry: Idealno za AI razmestitve**

**Zakaj AZD za AI rešitve?** AZD se spopada z glavnimi izzivi, s katerimi se srečujejo razvijalci AI:

- **Predloge pripravljene za AI** - Vnaprej konfigurirane predloge za Microsoft Foundry modele, Cognitive Services in ML obremenitve
- **Varne AI razmestitve** - Vgrajeni varnostni vzorci za AI storitve, API ključe in končne točke  
- **Produkcijski AI vzorci** - Najboljše prakse za skalabilne, stroškovno učinkovite razmestitve AI aplikacij
- **End-to-End AI delovni tokovi** - Od razvoja modela do produkcijske razmestitve z ustreznim spremljanjem
- **Optimizacija stroškov** - Pametna dodelitev virov in strategije skaliranja za AI obremenitve
- **Integracija z Microsoft Foundry** - Brezhibna povezava s katalogom modelov Microsoft Foundry in končnimi točkami

---

## 🎯 Knjižnica predlog in primerov

### Izpostavljeno: Microsoft Foundry predloge
**Začnite tukaj, če razmestite AI aplikacije!**

> **Opomba:** Ti predlogi prikazujejo različne AI vzorce. Nekateri so zunanji Azure primeri, drugi pa lokalne izvedbe.

| Predloga | Poglavje | Kompleksnost | Storitve | Tip |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavje 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Zunanji |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavje 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Zunanji |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavje 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Zunanji |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavje 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Zunanji |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavje 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Zunanji |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Poglavje 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Zunanji |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Poglavje 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokalno** |

### Izpostavljeno: Celoviti učni scenariji
**Predloge aplikacij pripravljenih za produkcijo, povezane z učnimi poglavji**

| Predloga | Učno poglavje | Kompleksnost | Ključna spoznanja |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavje 2 | ⭐ | Osnovni vzorci razmestitve AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavje 2 | ⭐⭐ | Implementacija RAG z Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Poglavje 4 | ⭐⭐ | Integracija Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavje 5 | ⭐⭐⭐ | Okvir agentov in klicanje funkcij |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Poglavje 8 | ⭐⭐⭐ | Orkestracija AI za podjetja |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Poglavje 5 | ⭐⭐⭐⭐ | Arhitektura z več agenti s strankami in agenti za zalogo |

### Učenje po vrsti primera

> **📌 Lokalni proti zunanjim primerom:**  
> **Lokalni primeri** (v tem repozitoriju) = Takoj pripravljeni za uporabo  
> **Zunanji primeri** (Azure Samples) = Klonirajte iz povezanih repozitorijev

#### Lokalni primeri (pripravljeni za uporabo)
- [**Rešitev maloprodaje z več agenti**](examples/retail-scenario.md) - Celovita implementacija, pripravljena za produkcijo, z ARM predlogami
  - Arhitektura z več agenti (agent za stranke + agent za zalogo)
  - Celovito spremljanje in ocenjevanje
  - Enoklik razmestitev preko ARM predloge

#### Lokalni primeri - aplikacije v vsebnikih (Poglavja 2-5)
**Celoviti primeri razmestitve kontejnerjev v tem repozitoriju:**
- [**Primeri Container App**](examples/container-app/README.md) - Celovit vodič za razmestitve v kontejnerjih
  - [Preprost Flask API](../../examples/container-app/simple-flask-api) - Osnovni REST API s podporo scale-to-zero
  - [Arhitektura mikroservisov](../../examples/container-app/microservices) - Produkcijsko pripravljena razmestitev z več storitvami
  - Hitri začetek, Produkcija in Napredni vzorci razmestitve
  - Smernice za spremljanje, varnost in optimizacijo stroškov

#### Zunanji primeri - enostavne aplikacije (Poglavja 1-2)
**Klonirajte te Azure Samples repozitorije za začetek:**
- [Preprosta spletna aplikacija - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Osnovni vzorci razmestitve
- [Statična spletna stran - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Razmestitev statične vsebine
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Razmestitev REST API

#### Zunanji primeri - integracija z bazo podatkov (Poglavja 3-4)  
- [Aplikacija z bazo - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzorci povezljivosti z bazo
- [Funkcije + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Brezstrežni podatkovni potek dela

#### Zunanji primeri - napredni vzorci (Poglavja 4-8)
- [Java mikroservisi](https://github.com/Azure-Samples/java-microservices-aca-lab) - Večstoritvene arhitekture
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Obdelava v ozadju  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkcijsko pripravljeni vzorci ML

### Zbirke zunanjih predlog
- [**Uradna galerija AZD predlog**](https://azure.github.io/awesome-azd/) - Kurirana zbirka uradnih in skupnostnih predlog
- [**Predloge Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentacija predlog Microsoft Learn
- [**Mapa primerov**](examples/README.md) - Lokalni učni primeri z podrobnimi pojasnili

---

## 📚 Viri za učenje in reference

### Hitre reference
- [**Hiter povzetek ukazov**](resources/cheat-sheet.md) - Ključni azd ukazi, razvrščeni po poglavjih
- [**Slovarček**](resources/glossary.md) - Terminologija Azure in azd  
- [**Pogosta vprašanja**](resources/faq.md) - Pogosta vprašanja razvrščena po učnih poglavjih
- [**Vodnik za študij**](resources/study-guide.md) - Celovite prakse za vaje

### Praktične delavnice
- [**AI laboratorij delavnice**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Naredite svoje AI rešitve primerne za razmestitev z AZD (2–3 ure)
- [**Interaktivna delavnica**](workshop/README.md) - 8-modulne vodene vaje z MkDocs in GitHub Codespaces
  - Sledi: Uvod → Izbor → Validacija → Dekonstrukcija → Konfiguracija → Prilagoditev → Odstranitev → Zaključek

### Zunanji viri za učenje
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Središče arhitekture Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulator cen Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status storitev Azure](https://status.azure.com/)

### Sposobnosti AI agentov za vaš urejevalnik
- [**Microsoftove Azure veščine na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 odprtih veščin agentov za Azure AI, Foundry, nameščanje, diagnostiko, optimizacijo stroškov in še več. Namestite jih v GitHub Copilot, Cursor, Claude Code ali katerikoli podprt agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Hiter vodnik za odpravljanje težav

**Pogoste težave, s katerimi se soočajo začetniki, in takojšnje rešitve:**

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
# Prikaži razpoložljive naročnine
az account list --output table

# Nastavi privzeto naročnino
az account set --subscription "<subscription-id-or-name>"

# Nastavi za okolje AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Preveri
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Preizkusite drugo regijo Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ali uporabite manjše SKU-je v razvoju
# Uredi infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Možnost 1: Počistite in poskusite znova
azd down --force --purge
azd up

# Možnost 2: Samo popravite infrastrukturo
azd provision

# Možnost 3: Preverite podrobno stanje
azd show

# Možnost 4: Preverite dnevnike v Azure Monitorju
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Ponovna avtentikacija
az logout
az login

azd auth logout
azd auth login

# Preveri avtentikacijo
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD ustvari edinstvena imena, vendar če pride do konflikta:
azd down --force --purge

# Nato ponovno poskusi z novim okoljem
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Dolgo trajanje uvajanja predloge</strong></summary>

**Običajni časi čakanja:**
- Enostavna spletna aplikacija: 5-10 minut
- Aplikacija z bazo podatkov: 10-15 minut
- AI aplikacije: 15-25 minut (pridobitev OpenAI je počasna)

```bash
# Preveri napredek
azd show

# Če se zatakne več kot 30 minut, preverite Azure Portal:
azd monitor
# Poiščite neuspele razmestitve
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Preverite svojo vlogo v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebujete vsaj vlogo "Contributor"
# Prosite svojega Azure skrbnika, naj dodeli:
# - Contributor (za vire)
# - User Access Administrator (za dodeljevanje vlog)
```
</details>

<details>
<summary><strong>❌ Ne najde URL-ja nameščene aplikacije</strong></summary>

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
- **Težave, specifične za AI:** [Odpravljanje težav z AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Vodnik za odpravljanje napak:** [Razhroščevanje korak za korakom](docs/chapter-07-troubleshooting/debugging.md)
- **Poiščite pomoč:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Dokončanje tečaja in potrdilo

### Spremljanje napredka
Spremljajte svoj napredek učenja skozi vsak razdelek:

- [ ] **Poglavje 1**: Osnove in hiter začetek ✅
- [ ] **Poglavje 2**: Razvoj, usmerjen v AI ✅  
- [ ] **Poglavje 3**: Konfiguracija in preverjanje pristnosti ✅
- [ ] **Poglavje 4**: Infrastruktura kot koda in uvajanje ✅
- [ ] **Poglavje 5**: Rešitve AI z več agenti ✅
- [ ] **Poglavje 6**: Preverjanje in načrtovanje pred uvajanjem ✅
- [ ] **Poglavje 7**: Odpravljanje težav in razhroščevanje ✅
- [ ] **Poglavje 8**: Produkcija in vzorci za podjetja ✅

### Preverjanje znanja
Po zaključku vsakega poglavja preverite svoje znanje z:
1. **Praktična vaja**: Zaključite praktično uvajanje iz poglavja
2. **Preverjanje znanja**: Preglejte razdelek FAQ za vaše poglavje
3. **Skupnostna razprava**: Delite svoje izkušnje v Azure Discord
4. **Naslednje poglavje**: Preidite na naslednjo stopnjo zahtevnosti

### Prednosti zaključka tečaja
Ko zaključite vsa poglavja, boste pridobili:
- **Izkušnja v produkciji**: Uvajali resnične AI aplikacije v Azure
- **Poklicne veščine**: Sposobnosti uvajanja, primerne za podjetja  
- **Priznanje v skupnosti**: Aktiven član Azure skupnosti razvijalcev
- **Napredovanje v karieri**: Zaželene strokovne sposobnosti za AZD in uvajanje AI

---

## 🤝 Skupnost in podpora

### Poiščite pomoč in podporo
- **Tehnične težave**: [Prijavite napake in zahtevajte funkcije](https://github.com/microsoft/azd-for-beginners/issues)
- **Vprašanja o učenju**: [Skupnost Microsoft Azure Discord](https://discord.gg/microsoft-azure) in [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoč specifična za AI**: Pridružite se [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Uradna dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Vpogledi skupnosti iz Microsoft Foundry Discord

**Nedavni rezultati ankete iz kanala #Azure:**
- **45%** razvijalcev želi uporabljati AZD za AI delovne obremenitve
- **Glavne težave**: uvajanja z več storitvami, upravljanje poverilnic, pripravljenost za produkcijo  
- **Najbolj zahtevano**: predloge specifične za AI, vodniki za odpravljanje težav, dobre prakse

**Pridružite se naši skupnosti, da:**
- Delite svoje izkušnje z AZD + AI in pridobite pomoč
- Dostopate do predogledov novih AI predlog
- Prispevate k najboljšim praksam za uvajanje AI
- Vplivate na razvoj prihodnjih funkcij AI + AZD

### Prispevanje k tečaju
Prispevke z veseljem sprejemamo! Prosimo, preberite naš [Vodnik za prispevanje](CONTRIBUTING.md) za podrobnosti o:
- **Izboljšave vsebine**: Izboljšajte obstoječa poglavja in primere
- **Novi primeri**: Dodajte realne scenarije in predloge  
- **Prevajanje**: Pomagajte vzdrževati večjezično podporo
- **Poročila o napakah**: Izboljšajte natančnost in jasnost
- **Standardi skupnosti**: Upoštevajte naša vključujoča pravila skupnosti

---

## 📄 Informacije o tečaju

### Licenca
Ta projekt je licenciran pod licenco MIT - za podrobnosti si oglejte datoteko [LICENSE](../../LICENSE).

### Sorodni Microsoftovi učni viri

Naša ekipa pripravlja tudi druge obsežne učne tečaje:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j za začetnike](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js za začetnike](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain za začetnike](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenti
[![AZD za začetnike](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI za začetnike](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP za začetnike](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI agenti za začetnike](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serija generativne AI
[![Generativni AI za začetnike](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Osnovno učenje
[![ML za začetnike](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Podatkovna znanost za začetnike](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI za začetnike](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kibernetska varnost za začetnike](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Spletni razvoj za začetnike](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT za začetnike](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR razvoj za začetnike](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serija Copilot
[![Copilot za so-programiranje z AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot za C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Pustolovščina](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigacija tečaja

**🚀 Pripravljeni začeti z učenjem?**

**Začetniki**: Začnite z [Poglavje 1: Osnove in hiter začetek](#-chapter-1-foundation--quick-start)  
**Razvijalci AI**: Pojdite na [Poglavje 2: Razvoj, osredotočen na AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Izkušeni razvijalci**: Začnite z [Poglavje 3: Konfiguracija in overjanje](#️-chapter-3-configuration--authentication)

**Naslednji koraki**: [Začni poglavje 1 - Osnove AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ta dokument je bil preveden s pomočjo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku velja za avtoritativni vir. Za kritične informacije priporočamo strokovni človeški prevod. Ne prevzemamo odgovornosti za morebitne nesporazume ali napačne interpretacije, ki bi izhajale iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->