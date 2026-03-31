# AZD Za Začetnike: Strukturirano Učno Potovanje

![AZD-za-začetnike](../../translated_images/sl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub opazovalci](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forki](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub zvezde](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Avtomatizirani prevodi (vedno posodobljeno)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabščina](../ar/README.md) | [Bengalščina](../bn/README.md) | [Bolgarščina](../bg/README.md) | [Burmansko (Myanmar)](../my/README.md) | [Kitajščina (poenostavljeno)](../zh-CN/README.md) | [Kitajščina (tradicionalno, Hong Kong)](../zh-HK/README.md) | [Kitajščina (tradicionalno, Macau)](../zh-MO/README.md) | [Kitajščina (tradicionalno, Taiwan)](../zh-TW/README.md) | [Hrvaščina](../hr/README.md) | [Češčina](../cs/README.md) | [Danščina](../da/README.md) | [Nizozemščina](../nl/README.md) | [Estonščina](../et/README.md) | [Finščina](../fi/README.md) | [Francoščina](../fr/README.md) | [Nemščina](../de/README.md) | [Grščina](../el/README.md) | [Hebrejščina](../he/README.md) | [Hindijščina](../hi/README.md) | [Madžarščina](../hu/README.md) | [Indonezijščina](../id/README.md) | [Italijanščina](../it/README.md) | [Japonščina](../ja/README.md) | [Kannada](../kn/README.md) | [Korejščina](../ko/README.md) | [Litovščina](../lt/README.md) | [Malajščina](../ms/README.md) | [Malayalam](../ml/README.md) | [Maratščina](../mr/README.md) | [Nepalščina](../ne/README.md) | [Nigerijski pidžin](../pcm/README.md) | [Norveščina](../no/README.md) | [Perzijščina (Farsi)](../fa/README.md) | [Poljščina](../pl/README.md) | [Portugalščina (Brazilija)](../pt-BR/README.md) | [Portugalščina (Portugal)](../pt-PT/README.md) | [Pandžabski (Gurmukhi)](../pa/README.md) | [Romunščina](../ro/README.md) | [Ruščina](../ru/README.md) | [Srbščina (cirilica)](../sr/README.md) | [Slovaščina](../sk/README.md) | [Slovenščina](./README.md) | [Španščina](../es/README.md) | [Svahelščina](../sw/README.md) | [Švedščina](../sv/README.md) | [Tagalog (Filipini)](../tl/README.md) | [Tamilščina](../ta/README.md) | [Teluguščina](../te/README.md) | [Tajščina](../th/README.md) | [Turščina](../tr/README.md) | [Ukrajinščina](../uk/README.md) | [Urdščina](../ur/README.md) | [Vietnamščina](../vi/README.md)

> **Raje klonirate lokalno?**
>
> To skladišče vključuje več kot 50 prevodov, kar znatno poveča velikost prenosa. Če želite klonirati brez prevodov, uporabite sparse checkout:
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
> To vam da vse, kar potrebujete za dokončanje tečaja z veliko hitrejšim prenosom.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Kaj je novega v azd danes

Azure Developer CLI je prerasel tradicionalne spletne aplikacije in API-je. Danes je azd enotno orodje za nameščanje katere koli aplikacije v Azure — vključno z aplikacijami na osnovi AI in inteligentnimi agenti.

Kaj to pomeni za vas:

- **AI agenti so zdaj prvorazredne azd delovne obremenitve.** Lahko inicializirate, namestite in upravljate projekte AI agentov z enakim `azd init` → `azd up` potekom dela, ki ga že poznate.
- **Integracija Microsoft Foundry** prinaša nameščanje modelov, gostovanje agentov in konfiguracijo AI storitev neposredno v azd ekosistem predlog.
- **Osnovni potek dela se ni spremenil.** Ne glede na to, ali nameščate todo aplikacijo, mikrostoritve ali večagentno AI rešitev, so ukazi enaki.

Če ste azd že uporabljali, je podpora za AI naravna razširitev — ne ločeno orodje ali napredna smer. Če začenjate na novo, se boste naučili en potek dela, ki deluje za vse.

---

## 🚀 Kaj je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je prijazno ukazno-orodno orodje za razvijalce, ki poenostavi nameščanje aplikacij v Azure. Namesto ročnega ustvarjanja in povezovanja ducatov Azure virov, lahko z enim ukazom namestite celotne aplikacije.

### Čarovnija `azd up`

```bash
# Ta enojni ukaz naredi vse:
# ✅ Ustvari vse Azure vire
# ✅ Konfigurira omrežje in varnost
# ✅ Izgradi vašo aplikacijsko kodo
# ✅ Izvede namestitev v Azure
# ✅ Dodeli vam delujoč URL
azd up
```

**To je vse!** Brez klikanja v Azure Portal, brez zapletenih ARM predlog za učenje, brez ročne konfiguracije — samo delujoče aplikacije v Azure.

---

## ❓ Azure Developer CLI v primerjavi z Azure CLI: Kakšna je razlika?

To je najpogostejše vprašanje začetnikov. Tukaj je preprost odgovor:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Namen** | Upravljanje posameznih Azure virov | Namestitev celotnih aplikacij |
| **Miseln pristop** | Osredotočeno na infrastrukturo | Osredotočeno na aplikacijo |
| **Primer** | `az webapp create --name myapp...` | `azd up` |
| **Krivulja učenja** | Treba poznati Azure storitve | Poznati morate le svojo aplikacijo |
| **Najbolj primerno za** | DevOps, infrastruktura | Razvijalci, prototipiranje |

### Preprosta primerjava

- **Azure CLI** je kot imeti vsa orodja za gradnjo hiše - kladiva, žage, nohte. Z njimi lahko zgradite karkoli, vendar morate poznati gradbeništvo.
- **Azure Developer CLI** je kot najeti izvajalca - opišete, kaj želite, in on poskrbi za gradnjo.

### Kdaj uporabiti katero

| Scenarij | Uporabite to |
|----------|----------|
| "Želim hitro namestiti svojo spletno aplikacijo" | `azd up` |
| "Potrebujem ustvariti samo račun za shranjevanje" | `az storage account create` |
| "Gradim celotno AI aplikacijo" | `azd init --template azure-search-openai-demo` |
| "Moram odpraviti napako na določenem Azure viru" | `az resource show` |
| "Želim produkcijsko pripravljen deployment v nekaj minutah" | `azd up --environment production` |

### Delujeta skupaj!

AZD uporablja Azure CLI "pod pokrovom". Uporabljate lahko oba:
```bash
# Namestite svojo aplikacijo z AZD
azd up

# Nato natančno nastavite posebne vire z Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Najdite predloge v Awesome AZD

Ne začnite iz nič! **Awesome AZD** je skupnostna zbirka predlog, pripravljenih za namestitev:

| Vir | Opis |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Brskajte po več kot 200 predlogah z enoklikno namestitvijo |
| 🔗 [**Pošljite predlogo**](https://github.com/Azure/awesome-azd/issues) | Prispevajte svojo predlogo skupnosti |
| 🔗 [**GitHub repozitorij**](https://github.com/Azure/awesome-azd) | Ozvezdite in raziščite izvorno kodo |

### Priljubljene predloge AI iz Awesome AZD

```bash
# RAG klepet z modeli Microsoft Foundry + AI iskanje
azd init --template azure-search-openai-demo

# Hitra aplikacija za AI klepet
azd init --template openai-chat-app-quickstart

# AI agenti z Foundry agenti
azd init --template get-started-with-ai-agents
```

---

## 🎯 Začnite v 3 korakih

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

### Korak 3: Namestite svojo prvo aplikacijo

```bash
# Inicializiraj iz predloge
azd init --template todo-nodejs-mongo

# Razporedi na Azure (ustvari vse!)
azd up
```

**🎉 To je vse!** Vaša aplikacija je zdaj v živo na Azure.

### Počistite (ne pozabite!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kako uporabljati ta tečaj

Ta tečaj je zasnovan za **postopno učenje** - začnite tam, kjer se počutite udobno, in napredujte:

| Vaše izkušnje | Začnite tukaj |
|-----------------|------------|
| **Popoln začetnik v Azure** | [Poglavje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Poznate Azure, novi pri AZD** | [Poglavje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Želite nameščati AI aplikacije** | [Poglavje 2: Razvoj, osredotočen na AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Želite praktično vadbo** | [🎓 Interaktivna delavnica](workshop/README.md) - vodena vaja (3–4 ure) |
| **Potrebujete produkcijske vzorce** | [Poglavje 8: Produkcija in enterprise vzorci](#-chapter-8-production--enterprise-patterns) |

### Hiter začetek

1. **Forkajte to repozitorij**: [![GitHub forki](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonirajte ga**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Poiščite pomoč**: [Azure Discord skupnost](https://discord.com/invite/ByRwuEEgH4)

> **Raje klonirate lokalno?**

> To skladišče vključuje več kot 50 prevodov, kar znatno poveča velikost prenosa. Če želite klonirati brez prevodov, uporabite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> To vam da vse, kar potrebujete za dokončanje tečaja z veliko hitrejšim prenosom.


## Pregled tečaja

Obvladujte Azure Developer CLI (azd) skozi strukturirana poglavja, zasnovana za postopno učenje. **Poseben poudarek na nameščanju AI aplikacij z integracijo Microsoft Foundry.**

### Zakaj je ta tečaj pomemben za sodobne razvijalce

Na podlagi vpogledov iz Microsoft Foundry Discord skupnosti, **45 % razvijalcev želi uporabljati AZD za AI delovne obremenitve**, vendar se srečujejo z izzivi pri:
- Kompleksnih AI arhitekturah z več storitvami
- Najboljših praksah za produkcijsko nameščanje AI  
- Integraciji in konfiguraciji Azure AI storitev
- Optimizaciji stroškov za AI delovne obremenitve
- Odpravljanju napak pri AI-specifičnih nameščanjih

### Cilji učenja

Z dokončanjem tega strukturiranega tečaja boste:
- **Obvladali osnove AZD**: osnovni koncepti, namestitev in konfiguracija
- **Namestili AI aplikacije**: uporaba AZD z Microsoft Foundry storitvami
- **Uvedli infrastrukturo kot kodo**: upravljanje Azure virov z Bicep predlogami
- **Odpravljali napake pri nameščanju**: reševanje pogostih težav in razhroščevanje
- **Optimizirali za produkcijo**: varnost, skaliranje, nadzor in upravljanje stroškov
- **Gradili večagentne rešitve**: nameščanje kompleksnih AI arhitektur

## 🗺️ Zemljevid tečaja: Hitro krmarjenje po poglavjih

Vsako poglavje ima svoj README z učnimi cilji, hitrim začetkom in vajami:

| Poglavje | Tema | Lekcije | Trajanje | Zahtevnost |
|---------|-------|---------|----------|------------|
| **[Poglavje 1: Osnove](docs/chapter-01-foundation/README.md)** | Uvod | [Osnove AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Namestitev](docs/chapter-01-foundation/installation.md) &#124; [Prvi projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Poglavje 2: Razvoj AI](docs/chapter-02-ai-development/README.md)** | Aplikacije, osredotočene na AI | [Integracija Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agenti](docs/chapter-02-ai-development/agents.md) &#124; [Razmestitev modela](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Delavnica](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ur | ⭐⭐ |
| **[Poglavje 3: Konfiguracija](docs/chapter-03-configuration/README.md)** | Avtentikacija in varnost | [Vodnik za konfiguracijo](docs/chapter-03-configuration/configuration.md) &#124; [Avtentikacija in varnost](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Poglavje 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | Infrastruktura kot koda & Razmestitev | [Vodnik za razmestitev](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Priprava virov](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ur | ⭐⭐⭐ |
| **[Poglavje 5: Večagentno](docs/chapter-05-multi-agent/README.md)** | Rešitve z AI agenti | [Scenarij maloprodaje](examples/retail-scenario.md) &#124; [Vzorci koordinacije](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ur | ⭐⭐⭐⭐ |
| **[Poglavje 6: Pred razmestitvijo](docs/chapter-06-pre-deployment/README.md)** | Načrtovanje in preverjanje | [Preflight preverjanja](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Načrtovanje kapacitet](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Izbira SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ura | ⭐⭐ |
| **[Poglavje 7: Odpravljanje težav](docs/chapter-07-troubleshooting/README.md)** | Razhroščevanje & Popravki | [Pogoste težave](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Razhroščevanje](docs/chapter-07-troubleshooting/debugging.md) &#124; [Težave z AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ur | ⭐⭐ |
| **[Poglavje 8: Produkcija](docs/chapter-08-production/README.md)** | Vzorci za podjetja | [Prakse za produkcijo](docs/chapter-08-production/production-ai-practices.md) | 2-3 ur | ⭐⭐⭐⭐ |
| **[🎓 Delavnica](workshop/README.md)** | Praktična delavnica | [Uvod](workshop/docs/instructions/0-Introduction.md) &#124; [Izbira](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Razgradnja](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prilagoditev](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Odstranitev](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zaključek](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ure | ⭐⭐ |

**Skupna dolžina tečaja:** ~10-14 ur | **Napredovanje znanja:** Začetnik → Pripravljen za produkcijo

---

## 📚 Učna poglavja

*Izberite svojo učno pot glede na raven izkušenj in cilje*

### 🚀 Poglavje 1: Temelji in hiter začetek
**Predpogoji**: Azure naročnina, osnovno znanje ukazne vrstice  
**Trajanje**: 30-45 minut  
**Kompleksnost**: ⭐

#### Kaj se boste naučili
- Razumevanje osnov Azure Developer CLI
- Namestitev AZD na vaši platformi
- Vaša prva uspešna razmestitev

#### Viri za učenje
- **🎯 Začni tukaj**: [Kaj je Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorija**: [Osnove AZD](docs/chapter-01-foundation/azd-basics.md) - Temeljni koncepti in terminologija
- **⚙️ Namestitev**: [Namestitev in nastavitev](docs/chapter-01-foundation/installation.md) - Vodniki za posamezne platforme
- **🛠️ Praktično**: [Vaš prvi projekt](docs/chapter-01-foundation/first-project.md) - Korak za korakom vadnica
- **📋 Hiter pregled**: [Seznam ukazov](resources/cheat-sheet.md)

#### Praktične vaje
```bash
# Hitro preverjanje namestitve
azd version

# Namestite svojo prvo aplikacijo
azd init --template todo-nodejs-mongo
azd up
```

**💡 Cilj poglavja**: Uspešno razmestiti preprosto spletno aplikacijo v Azure z uporabo AZD

**✅ Validacija uspeha:**
```bash
# Po zaključku poglavja 1 boste lahko:
azd version              # Prikaže nameščeno različico
azd init --template todo-nodejs-mongo  # Inicializira projekt
azd up                  # Razporedi v Azure
azd show                # Prikaže URL zagnane aplikacije
# Aplikacija se odpre v brskalniku in deluje
azd down --force --purge  # Počisti vire
```

**📊 Časovni vložek:** 30-45 minut  
**📈 Raven znanja po:** Lahko samostojno razmestite osnovne aplikacije
**📈 Raven znanja po:** Lahko samostojno razmestite osnovne aplikacije

---

### 🤖 Poglavje 2: Razvoj, osredotočen na AI (Priporočeno za AI razvijalce)
**Predpogoji**: Poglavje 1 zaključeno  
**Trajanje**: 1-2 ur  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Integracija Microsoft Foundry z AZD
- Razmestitev aplikacij, podprtih z AI
- Razumevanje konfiguracij AI storitev

#### Viri za učenje
- **🎯 Začni tukaj**: [Integracija Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agenti**: [Vodnik za AI agente](docs/chapter-02-ai-development/agents.md) - Razmestitev inteligentnih agentov z AZD
- **📖 Vzorci**: [Razmestitev AI modelov](docs/chapter-02-ai-development/ai-model-deployment.md) - Razmestitev in upravljanje AI modelov
- **🛠️ Delavnica**: [AI delavnica](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pripravite svoje AI rešitve za AZD
- **🎥 Interaktivni vodnik**: [Materiali delavnice](workshop/README.md) - Učenje v brskalniku z MkDocs * DevContainer okoljem
- **📋 Predloge**: [Microsoft Foundry predloge](#poglobljeno-zmožnosti-azd)
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

**💡 Cilj poglavja**: Razmestiti in konfigurirati klepetalno aplikacijo, podprto z AI, z zmogljivostmi RAG

**✅ Validacija uspeha:**
```bash
# Po drugem poglavju bi morali biti sposobni:
azd init --template azure-search-openai-demo
azd up
# Preizkusiti vmesnik za klepet z AI
# Postavljati vprašanja in prejemati AI-podprte odgovore z viri
# Preveriti, ali integracija iskanja deluje
azd monitor  # Preveriti, ali Application Insights prikazuje telemetrijo
azd down --force --purge
```

**📊 Časovni vložek:** 1-2 ur  
**📈 Raven znanja po:** Lahko razmestite in konfigurirate AI aplikacije, pripravljene za produkcijo  
**💰 Ozaveščenost o stroških:** Razumeti stroške razvoja približno $80-150/mesec, stroške produkcije $300-3500/mesec

#### 💰 Premisleki o stroških za razmestitve AI

**Razvojno okolje (ocenjeno $80-150/mesec):**
- Microsoft Foundry modeli (plačilo po porabi): $0-50/mesec (odvisno od porabe tokenov)
- AI Search (osnovna raven): $75/mesec
- Container Apps (poraba): $0-20/mesec
- Shramba (Standard): $1-5/mesec

**Produkcijsko okolje (ocenjeno $300-3,500+/mesec):**
- Microsoft Foundry modeli (PTU za konzistentno zmogljivost): $3,000+/mesec ALI plačilo po porabi pri velikem obsegu
- AI Search (standardna raven): $250/mesec
- Container Apps (namensko): $50-100/mesec
- Application Insights: $5-50/mesec
- Shramba (Premium): $10-50/mesec

**💡 Nasveti za optimizacijo stroškov:**
- Uporabite **brezplačni nivo** Microsoft Foundry modelov za učenje (Azure OpenAI 50.000 tokenov/mesec vključeno)
- Zaženite `azd down`, da sprostite vire, ko aktivno ne razvijate
- Začnite z obračunavanjem po porabi, PTU nadgradite le za produkcijo
- Uporabite `azd provision --preview`, da ocenite stroške pred razmestitvijo
- Omogočite samodejno skaliranje: plačujte le za dejansko uporabo

**Spremljanje stroškov:**
```bash
# Preverite ocenjene mesečne stroške
azd provision --preview

# Spremljajte dejanske stroške v Azure portalu
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Poglavje 3: Konfiguracija in avtentikacija
**Predpogoji**: Poglavje 1 zaključeno  
**Trajanje**: 45-60 minut  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Konfiguracija in upravljanje okolij
- Najboljše prakse za avtentikacijo in varnost
- Poimenovanje in organizacija virov

#### Viri za učenje
- **📖 Konfiguracija**: [Vodnik za konfiguracijo](docs/chapter-03-configuration/configuration.md) - Nastavitev okolja
- **🔐 Varnost**: [Vzorce avtentikacije in upravljene identitete](docs/chapter-03-configuration/authsecurity.md) - Vzorci avtentikacije
- **📝 Primeri**: [Primer aplikacije z bazo podatkov](examples/database-app/README.md) - Primeri AZD baze podatkov

#### Praktične vaje
- Konfigurirajte več okolij (dev, staging, prod)
- Nastavite avtentikacijo z upravljano identiteto
- Uvedite konfiguracije, specifične za okolje

**💡 Cilj poglavja**: Upravljati več okolij z ustrezno avtentikacijo in varnostjo

---

### 🏗️ Poglavje 4: Infrastruktura kot koda in razmestitev
**Predpogoji**: Poglavja 1-3 zaključena  
**Trajanje**: 1-1.5 ure  
**Kompleksnost**: ⭐⭐⭐

#### Kaj se boste naučili
- Napredni vzorci razmestitve
- Infrastruktura kot koda z Bicep
- Strategije priprave virov

#### Viri za učenje
- **📖 Razmestitev**: [Vodnik za razmestitev](docs/chapter-04-infrastructure/deployment-guide.md) - Celotni delovni tokovi
- **🏗️ Priprava virov**: [Priprava virov](docs/chapter-04-infrastructure/provisioning.md) - Upravljanje Azure virov
- **📝 Primeri**: [Primer Container App](../../examples/container-app) - Razmestitve v vsebnikih

#### Praktične vaje
- Ustvarite lastne predloge Bicep
- Razmestite aplikacije z več storitvami
- Uvedite strategije blue-green razmestitve

**💡 Cilj poglavja**: Razmestiti kompleksne aplikacije z več storitvami z uporabo lastnih infrastrukturnih predlog

---

### 🎯 Poglavje 5: Večagentne AI rešitve (napredno)
**Predpogoji**: Poglavja 1-2 zaključena  
**Trajanje**: 2-3 ure  
**Kompleksnost**: ⭐⭐⭐⭐

#### Kaj se boste naučili
- Arhitekturni vzorci z več agenti
- Orkestracija in koordinacija agentov
- Razmestitve AI, pripravljene za produkcijo

#### Viri za učenje
- **🤖 Izpostavljeni projekt**: [Večagentna rešitev za maloprodajo](examples/retail-scenario.md) - Celotna implementacija
- **🛠️ ARM predloge**: [Paket ARM predlog](../../examples/retail-multiagent-arm-template) - Namestitev z enim klikom
- **📖 Arhitektura**: [Vzorci koordinacije za več agentov](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzorci

#### Praktične vaje
```bash
# Razmestite celovito maloprodajno rešitev z več agenti
cd examples/retail-multiagent-arm-template
./deploy.sh

# Raziščite konfiguracije agentov
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Cilj poglavja**: Razmestiti in upravljati večagentno AI rešitev, pripravljeno za produkcijo, z agenti za stranke in zalogo

---

### 🔍 Poglavje 6: Pre-razmestitvena validacija in načrtovanje
**Predpogoji**: Poglavje 4 zaključeno  
**Trajanje**: 1 ura  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Načrtovanje kapacitete in preverjanje virov
- Strategije izbire SKU
- Preflight preverjanja in avtomatizacija

#### Viri za učenje
- **📊 Načrtovanje**: [Načrtovanje kapacitet](docs/chapter-06-pre-deployment/capacity-planning.md) - Preverjanje virov
- **💰 Izbira**: [Izbira SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Stroškovno učinkovite izbire
- **✅ Validacija**: [Preflight preverjanja](docs/chapter-06-pre-deployment/preflight-checks.md) - Avtomatizirani skripti

#### Praktične vaje
- Zaženite skripte za preverjanje kapacitet
- Optimizirajte izbiro SKU glede na stroške
- Uvedite avtomatizirana pre-razmestitvena preverjanja

**💡 Cilj poglavja**: Preveriti in optimizirati razmestitve pred izvedbo

---

### 🚨 Poglavje 7: Odpravljanje težav in razhroščevanje
**Predpogoji**: Katero koli poglavje o razmestitvi je zaključeno  
**Trajanje**: 1-1.5 ure  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Sistemski pristopi k razhroščevanju
- Pogoste težave in rešitve
- Odpravljanje težav specifičnih za AI

#### Viri za učenje
- **🔧 Pogoste težave**: [Pogoste težave](docs/chapter-07-troubleshooting/common-issues.md) - Pogosta vprašanja in rešitve
- **🕵️ Razhroščevanje**: [Vodnik za razhroščevanje](docs/chapter-07-troubleshooting/debugging.md) - Strategije korak za korakom
- **🤖 Težave z AI**: [Odpravljanje težav specifičnih za AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Težave s storitvami AI

#### Praktične vaje
- Diagnozirajte napake pri razmestitvi
- Rešite težave z avtentikacijo
- Razhroščite povezljivost AI storitev

**💡 Cilj poglavja**: Neodvisno diagnosticirajte in odpravite pogoste težave pri razmestitvi

---

### 🏢 Poglavje 8: Produkcija in vzorci za podjetja
**Predpogoji**: Poglavja 1-4 zaključena  
**Trajanje**: 2-3 ure  
**Kompleksnost**: ⭐⭐⭐⭐

#### Kaj se boste naučili
- Strategije razmestitve v produkciji
- Vzorci varnosti za podjetja
- Spremljanje in optimizacija stroškov
- **🏭 Proizvodnja**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Vzori za podjetja
- **📝 Primeri**: [Microservices Example](../../examples/microservices) - Kompleksne arhitekture
- **📊 Spremljanje**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Spremljanje

#### Praktične vaje
- Implementirajte varnostne vzorce za podjetja
- Vzpostavite celovito spremljanje
- Razmestite v proizvodnjo z ustreznim upravljanjem

**💡 Cilj poglavja**: Razmestite aplikacije pripravljene za podjetja s polnimi proizvodnimi zmogljivostmi

---

## 🎓 Pregled delavnice: Praktična izkušnja učenja

> **⚠️ STATUS DELAVNICE: V aktivnem razvoju**  
> Gradiva delavnice so trenutno v razvoju in izboljševanju. Temeljni moduli delujejo, vendar so nekateri naprednejši oddelki nedokončani. Aktivno delamo na dokončanju vse vsebine. [Spremljajte napredek →](workshop/README.md)

### Interaktivni materiali delavnice
**Celovito praktično učenje z orodji v brskalniku in vodljivimi vajami**

Naši materiali delavnice nudijo strukturirano, interaktivno učno izkušnjo, ki dopolnjuje zgoraj omenjeno poglavjno učno snov. Delavnica je zasnovana tako za samostojno učenje kot za seje, ki jih vodi inštruktor.

#### 🛠️ Značilnosti delavnice
- **Vmesnik v brskalniku**: Celotna delavnica poganjana z MkDocs z iskanjem, kopiranjem in funkcijami teme
- **Integracija z GitHub Codespaces**: Nastavitev razvojnega okolja z enim klikom
- **Strukturirana učna pot**: 8-modulne vodene vaje (skupaj 3-4 ure)
- **Progresivna metodologija**: Uvod → Izbira → Validacija → Dekonstrukcija → Konfiguracija → Prilagoditev → Odstranitev → Zaključek
- **Interaktivno DevContainer okolje**: Predkonfigurirana orodja in odvisnosti

#### 📚 Struktura modulov delavnice
Delavnica sledi **8-modulni progresivni metodologiji**, ki vas popelje od odkrivanja do obvladovanja razmestitve:

| Modul | Tema | Kaj boste storili | Trajanje |
|--------|-------|----------------|----------|
| **0. Uvod** | Pregled delavnice | Razumeti cilje učenja, predpogoje in strukturo delavnice | 15 min |
| **1. Izbira** | Iskanje predlog | Raziskujte AZD predloge in izberite pravo AI predlogo za vaš primer uporabe | 20 min |
| **2. Validacija** | Razmestitev in preverjanje | Razmestite predlogo z `azd up` in preverite delovanje infrastrukture | 30 min |
| **3. Dekonstrukcija** | Razumeti strukturo | Uporabite GitHub Copilot za raziskovanje arhitekture predloge, Bicep datotek in organizacije kode | 30 min |
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
# Možnost 1: GitHub Codespaces (Priporočeno)
# Kliknite "Code" → "Create codespace on main" v repozitoriju

# Možnost 2: Lokalni razvoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Sledite navodilom za nastavitev v datoteki workshop/README.md
```

#### 🎯 Cilji učenja delavnice
Z dokončanjem delavnice bodo udeleženci:
- **Razmestitev proizvodnih AI aplikacij**: Uporabite AZD s storitvami Microsoft Foundry
- **Obvladajte večagentne arhitekture**: Implementirajte usklajene AI rešitve z agenti
- **Uvedite najboljše varnostne prakse**: Konfigurirajte avtentikacijo in nadzor dostopa
- **Optimirajte za razširljivost**: Načrtujte stroškovno učinkovite in zmogljive razmestitve
- **Odpravljanje težav pri razmestitvah**: Samostojno rešujte pogoste težave

#### 📖 Viri delavnice
- **🎥 Interaktivni vodič**: [Workshop Materials](workshop/README.md) - Učno okolje v brskalniku
- **📋 Navodila po modulih**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Pregled delavnice in cilji
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Poiščite in izberite AI predloge
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Razmestite in preverite predloge
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Raziskujte arhitekturo predloge
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Obvladajte azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Prilagodite za vaš scenarij
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Počistite vire
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Pregled in naslednji koraki
- **🛠️ AI laboratorij delavnice**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Vaje osredotočene na AI
- **💡 Hitri začetek**: [Workshop Setup Guide](workshop/README.md#quick-start) - Konfiguracija okolja

**Popolno za**: Usposabljanje v podjetjih, univerzitetne tečaje, samostojno učenje in bootcampe za razvijalce.

---

## 📖 Poglobljeno: Zmožnosti AZD

Poleg osnov AZD nudi zmogljive funkcije za proizvodne razmestitve:

- **Razmestitve na osnovi predlog** - Uporabite vnaprej izdelane predloge za pogoste vzorce aplikacij
- **Infrastruktura kot koda** - Upravljajte Azure vire z uporabo Bicep ali Terraform  
- **Integrirani delovni tokovi** - Brezhibno zagotovite, razmestite in spremljajte aplikacije
- **Prijazno do razvijalcev** - Optimizirano za produktivnost in izkušnjo razvijalcev

### **AZD + Microsoft Foundry: Idealno za AI razmestitve**

**Zakaj AZD za AI rešitve?** AZD rešuje glavne izzive, s katerimi se srečujejo razvijalci AI:

- **AI-pripravljene predloge** - Predkonfigurirane predloge za Microsoft Foundry Models, Cognitive Services in obremenitve ML
- **Varnostne AI razmestitve** - Vgrajeni varnostni vzorci za AI storitve, API ključe in modelne končne točke  
- **Proizvodni AI vzorci** - Najboljše prakse za razširljive, stroškovno učinkovite razmestitve AI aplikacij
- **Celovit AI delovni tok** - Od razvoja modela do proizvodne razmestitve z ustreznim spremljanjem
- **Optimizacija stroškov** - Pametna dodelitev virov in strategije skaliranja za AI obremenitve
- **Integracija z Microsoft Foundry** - Brezhibna povezava s katalogom modelov Microsoft Foundry in končnimi točkami

---

## 🎯 Knjižnica predlog in primerov

### Izpostavljeno: Microsoft Foundry predloge
**Začnite tukaj, če razmestite AI aplikacije!**

> **Opomba:** Te predloge prikazujejo različne AI vzorce. Nekatere so zunanje Azure Samples, druge so lokalne implementacije.

| Predloga | Poglavje | Zahtevnost | Storitve | Tip |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavje 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Zunanji |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavje 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Zunanji |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavje 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Zunanji |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavje 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Zunanji |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavje 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Zunanji |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Poglavje 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Zunanji |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Poglavje 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokalno** |

### Izpostavljeno: Celoviti učni scenariji
**Predloge aplikacij pripravljenih za proizvodnjo, povezane z učnimi poglavji**

| Predloga | Učno poglavje | Zahtevnost | Ključno učenje |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavje 2 | ⭐ | Osnovni vzorci razmestitve AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavje 2 | ⭐⭐ | RAG implementacija z Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Poglavje 4 | ⭐⭐ | Integracija Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavje 5 | ⭐⭐⭐ | Okvir agentov in klicanje funkcij |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Poglavje 8 | ⭐⭐⭐ | Orkestracija AI za podjetja |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Poglavje 5 | ⭐⭐⭐⭐ | Večagentna arhitektura z agenti za stranke in zaloge |

### Učenje po tipu primerov

> **📌 Lokalni proti zunanjim primerom:**  
> **Lokalni primeri** (v tem repozitoriju) = Pripravljen za takojšnjo uporabo  
> **Zunanji primeri** (Azure Samples) = Klonirajte iz povezanih repozitorijev

#### Lokalni primeri (pripravljeni za uporabo)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Celovita implementacija pripravljena za proizvodnjo z ARM predlogami
  - Večagentna arhitektura (agent za stranke + agent za zaloge)
  - Celovito spremljanje in ocenjevanje
  - Razmestitev z enim klikom preko ARM predloge

#### Lokalni primeri - Container aplikacije (poglavja 2-5)
**Celoviti primeri razmestitve kontejnerjev v tem repozitoriju:**
- [**Container App Examples**](examples/container-app/README.md) - Celovit vodič za razmestitve v kontejnerjih
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Enostaven REST API s skaliranjem na nič
  - [Microservices Architecture](../../examples/container-app/microservices) - Proizvodno pripravna večstoritevna razmestitev
  - Hitri začetek, Proizvodnja in Napredni vzorci razmestitve
  - Smernice za spremljanje, varnost in optimizacijo stroškov

#### Zunanji primeri - Preproste aplikacije (poglavja 1-2)
**Klonirajte te Azure Samples repozitorije, da začnete:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Osnovni vzorci razmestitve
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Razmestitev statične vsebine
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Razmestitev REST API

#### Zunanji primeri - Integracija podatkovnih baz (poglavja 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzorci povezovanja z bazo podatkov
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Brezstrežni podatkovni delovni tok

#### Zunanji primeri - Napredni vzorci (poglavja 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Večstoritetne arhitekture
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Ozadinsko procesiranje  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Proizvodno pripravljeni ML vzorci

### Zbirke zunanjih predlog
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kurirana zbirka uradnih in skupnostnih predlog
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentacija predlog Microsoft Learn
- [**Examples Directory**](examples/README.md) - Lokalni učni primeri z podrobnimi razlagami

---

## 📚 Viri za učenje in reference

### Hiter pregled referenc
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Ključni azd ukazi, organizirani po poglavjih
- [**Glossary**](resources/glossary.md) - Azure in azd terminologija  
- [**FAQ**](resources/faq.md) - Pogosta vprašanja, organizirana po učnih poglavjih
- [**Study Guide**](resources/study-guide.md) - Celovite vaje za prakso

### Praktične delavnice
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Naredite svoje AI rešitve pripravljene za AZD (2-3 ure)
- [**Interactive Workshop**](workshop/README.md) - 8-modulne vodene vaje z MkDocs in GitHub Codespaces
  - Sledi: Uvod → Izbira → Validacija → Dekonstrukcija → Konfiguracija → Prilagoditev → Odstranitev → Zaključek

### Zunanji viri za učenje
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Center arhitekture Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulator cen Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stanje Azure](https://status.azure.com/)

### Spretnosti AI agentov za vaš urejevalnik
- [**Microsoft Azure spretnosti na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 odprtih veščin agentov za Azure AI, Foundry, nameščanje, diagnostiko, optimizacijo stroškov in več. Namestite jih v GitHub Copilot, Cursor, Claude Code ali katerem koli podprtem agentu:
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
# Prikaži razpoložljive naročnine
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

# Ali uporabite manjše SKU-je v razvoju
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

# Možnost 3: Preveri podroben status
azd show

# Možnost 4: Preveri dnevnike v Azure Monitorju
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
# AZD ustvarja edinstvena imena, vendar če pride do konflikta:
azd down --force --purge

# Nato poskusi znova z novim okoljem
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Implementacija predloge traja predolgo</strong></summary>

**Običajni časi čakanja:**
- Preprosta spletna aplikacija: 5-10 minut
- Aplikacija z bazo podatkov: 10-15 minut
- AI aplikacije: 15-25 minut (provisioniranje OpenAI je počasno)

```bash
# Preverite napredek
azd show

# Če se zatakne več kot 30 minut, preverite Azure Portal:
azd monitor
# Poiščite neuspešne razmestitve
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Preverite svojo vlogo v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebujete vsaj vlogo "Contributor"
# Prosite svojega Azure skrbnika, da podeli:
# - Contributor (za vire)
# - User Access Administrator (za dodeljevanje vlog)
```
</details>

<details>
<summary><strong>❌ Ne najdem URL-ja nameščene aplikacije</strong></summary>

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
- **Vodnik za razhroščevanje:** [Razhroščevanje korak za korakom](docs/chapter-07-troubleshooting/debugging.md)
- **Poiščite pomoč:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Dokončanje tečaja in potrdilo

### Sledenje napredku
Spremljajte svoj napredek učenja skozi vsako poglavje:

- [ ] **Poglavje 1**: Temelji in hiter začetek ✅
- [ ] **Poglavje 2**: Razvoj, usmerjen v AI ✅  
- [ ] **Poglavje 3**: Konfiguracija in overjanje ✅
- [ ] **Poglavje 4**: Infrastruktura kot koda in nameščanje ✅
- [ ] **Poglavje 5**: Rešitve AI z več agenti ✅
- [ ] **Poglavje 6**: Validacija in načrtovanje pred nameščanjem ✅
- [ ] **Poglavje 7**: Odpravljanje težav in razhroščevanje ✅
- [ ] **Poglavje 8**: Proizvodnja in podjetniški vzorci ✅

### Preverjanje znanja
Po zaključku vsakega poglavja preverite svoje znanje z:
1. **Praktična vaja**: Dokončajte praktično nameščanje iz poglavja
2. **Preverjanje znanja**: Preglejte razdelek s pogostimi vprašanji za vaše poglavje
3. **Skupnostna razprava**: Delite svoje izkušnje na Azure Discord
4. **Naslednje poglavje**: Preidite na naslednjo stopnjo zahtevnosti

### Prednosti ob zaključku tečaja
Po zaključku vseh poglavij boste imeli:
- **Izkušnje v produkciji**: Nameščene resnične AI aplikacije v Azure
- **Poklicne spretnosti**: Sposobnosti nameščanja, primerne za podjetja  
- **Prepoznavnost v skupnosti**: Aktivni član Azure skupnosti razvijalcev
- **Napredovanje v karieri**: Iskano strokovno znanje o AZD in nameščanju AI

---

## 🤝 Skupnost in podpora

### Pridobite pomoč in podporo
- **Tehnične težave:** [Prijavite napake in zahtevajte funkcije](https://github.com/microsoft/azd-for-beginners/issues)
- **Vprašanja glede učenja:** [Microsoft Azure Discord skupnost](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoč specifična za AI:** Pridružite se [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija:** [Uradna dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Vpogledi skupnosti iz Microsoft Foundry Discord

**Nedavni rezultati ankete iz kanala #Azure:**
- **45%** razvijalcev želi uporabljati AZD za AI obremenitve
- **Glavni izzivi**: nameščanja več storitev, upravljanje poverilnic, pripravljenost za produkcijo  
- **Najbolj zahtevano**: Predloge specifične za AI, vodniki za odpravljanje težav, najboljše prakse

**Pridružite se naši skupnosti, da:**
- Delite svoje izkušnje z AZD + AI in dobite pomoč
- Dostopajte do zgodnjih predogledov novih predlog za AI
- Prispevajte k najboljšim praksam za nameščanje AI
- Vplivajte na prihodnji razvoj funkcij AI + AZD

### Prispevanje k tečaju
Prispevke sprejemamo! Prosimo, preberite naš [Vodnik za prispevke](CONTRIBUTING.md) za podrobnosti o:
- **Izboljšave vsebine**: Izboljšajte obstoječa poglavja in primere
- **Novi primeri**: Dodajte scenarije iz resničnega sveta in predloge  
- **Prevajanje**: Pomagajte vzdrževati večjezično podporo
- **Poročila o napakah**: Izboljšajte natančnost in jasnost
- **Standardi skupnosti**: Upoštevajte naše vključujoče smernice skupnosti

---

## 📄 Informacije o tečaju

### Licenca
Ta projekt je licenciran pod licenco MIT - za podrobnosti glejte datoteko [LICENSE](../../LICENSE).

### Povezani učni viri Microsofta

Naša ekipa ustvarja tudi druge obsežne učne tečaje:

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
[![Generativna AI za začetnike](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativna AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativna AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativna AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Osnovno učenje
[![Strojno učenje za začetnike](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
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
[![Copilot Avantura](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigacija tečaja

**🚀 Pripravljeni za začetek učenja?**

**Za začetnike**: Začnite z [Poglavje 1: Osnove in hiter začetek](#-chapter-1-foundation--quick-start)  
**Razvijalci AI**: Pojdite na [Poglavje 2: Razvoj, usmerjen v AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Izkušeni razvijalci**: Začnite z [Poglavje 3: Konfiguracija in avtentikacija](#️-chapter-3-configuration--authentication)

**Naslednji koraki**: [Začnite Poglavje 1 - Osnove AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko samodejni prevodi vsebujejo napake ali netočnosti. Originalni dokument v izvirnem jeziku naj velja za avtoritativni vir. Za kritične informacije priporočamo profesionalen človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->