# AZD Za začetnike: Strukturirana učna pot

![AZD-za-začetnike](../../translated_images/sl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub opazovalci](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forki](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub zvezde](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Samodejni prevodi (vedno posodobljeno)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabščina](../ar/README.md) | [Bengalski](../bn/README.md) | [Bolgarščina](../bg/README.md) | [Burmanski (Mjanmar)](../my/README.md) | [Kitajščina (poenostavljena)](../zh-CN/README.md) | [Kitajščina (tradicionalna, Hongkong)](../zh-HK/README.md) | [Kitajščina (tradicionalna, Makao)](../zh-MO/README.md) | [Kitajščina (tradicionalna, Tajvan)](../zh-TW/README.md) | [Hrvaščina](../hr/README.md) | [Češčina](../cs/README.md) | [Danščina](../da/README.md) | [Nizozemščina](../nl/README.md) | [Estonščina](../et/README.md) | [Finščina](../fi/README.md) | [Francoščina](../fr/README.md) | [Nemščina](../de/README.md) | [Grščina](../el/README.md) | [Hebrejščina](../he/README.md) | [hindijščina](../hi/README.md) | [Madžarščina](../hu/README.md) | [Indonezijščina](../id/README.md) | [Italijanščina](../it/README.md) | [Japonščina](../ja/README.md) | [Kanadaščina](../kn/README.md) | [Kmerski](../km/README.md) | [Korejščina](../ko/README.md) | [Litovščina](../lt/README.md) | [Malajščina](../ms/README.md) | [Malajalščina](../ml/README.md) | [Maratščina](../mr/README.md) | [Nepalščina](../ne/README.md) | [Nigerijski pidžin](../pcm/README.md) | [Norveščina](../no/README.md) | [Perzijščina (Farsi)](../fa/README.md) | [Poljščina](../pl/README.md) | [Portugalščina (Brazilija)](../pt-BR/README.md) | [Portugalščina (Portugalska)](../pt-PT/README.md) | [Pandžabi (Gurmukhi)](../pa/README.md) | [Romunščina](../ro/README.md) | [Ruščina](../ru/README.md) | [Srbščina (cirilica)](../sr/README.md) | [Slovaščina](../sk/README.md) | [Slovenščina](./README.md) | [Španščina](../es/README.md) | [Svahili](../sw/README.md) | [Švedščina](../sv/README.md) | [Tagalog (filipinski)](../tl/README.md) | [Tamilščina](../ta/README.md) | [Telugščina](../te/README.md) | [Tajščina](../th/README.md) | [Turščina](../tr/README.md) | [Ukrajinščina](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamščina](../vi/README.md)

> **Raje klonirate lokalno?**
>
> Ta repozitorij vključuje več kot 50 prevodov, kar znatno poveča velikost prenosa. Če želite klonirati brez prevodov, uporabite sparse checkout:
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
> To vam zagotovi vse, kar potrebujete za dokončanje tečaja z veliko hitrejšim prenosom.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Kaj je novega v azd danes

> 📌 Ta tečaj je preverjen za različico **`azd 1.25.6`** (junij 2026). Za preverjanje vaše različice zaženite `azd version`, in `azd upgrade`, če želite posodobiti na najnovejšo.

Azure Developer CLI se je razvil onkraj tradicionalnih spletnih aplikacij in API-jev. Danes je azd enotno orodje za nameščanje **katerekoli** aplikacije v Azure — vključno z aplikacijami, podprtimi z AI, in inteligentnimi agenti.

Kaj to pomeni za vas:

- **AI agenti so zdaj prvovrstne delovne obremenitve azd.** Projekt AI agenta lahko inicializirate, namestite in upravljate z istim delovnim tokom `azd init` → `azd up`, ki ga že poznate.
- **Popoln življenjski cikel agenta iz CLI.** Razširitev `azure.ai.agents` sedaj pokriva celotno pot — `azd ai agent init` za ustvarjanje osnove, `azd ai agent invoke` za testiranje (z izpisom časa odziva), `azd ai agent eval generate` in `azd ai agent optimize` za merjenje in izboljšanje kakovosti, ter `azd ai agent delete` za čiščenje.
- **Več gradnikov za AI.** Nove predogledne razširitve — `azure.ai.skills` in `azure.ai.connections` — omogočajo upravljanje ponovno uporabnih veščin agentov in Foundry povezav neposredno z azd.
- **Integracija z Microsoft Foundry** prinaša nameščanje modelov, gostovanje agentov in konfiguracijo AI storitev neposredno v ekosistem azd predlog.
- **Bolj gladke osnovne dnevne naloge.** Nedavne izdaje so naredile `azd init` idempotenten (varen za ponovno zagon), `azd auth login` pa zdaj samodejno počisti zastarele žetone in dodana je prijazna pozornost za prvo uporabo `azd tool`.
- **Osnovni delovni tok se ni spremenil.** Ne glede na to, ali nameščate aplikacijo za opravila, mikroservis ali več-agentno AI rešitev, so ukazi enaki.

> **Opomba za uporabnike Aspire:** Microsoft zdaj izdelek imenuje preprosto **Aspire** (prej ".NET Aspire"). Podpora azd za Aspire je nespremenjena — spremenilo se je le ime.

Če ste azd že uporabljali, je podpora za AI naravna razširitev — ne ločeno orodje ali napredna sled. Če začenjate na novo, se boste naučili en sam delovni tok, ki deluje za vse.

---

## 🚀 Kaj je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je za razvijalce prijazno orodno vrstično orodje, ki poenostavi nameščanje aplikacij v Azure. Namesto ročnega ustvarjanja in povezovanja ducatov Azure virov lahko z enim ukazom namestite celotne aplikacije.

### Čar `azd up`

```bash
# Ta ena ukaz naredi vse:
# ✅ Ustvari vse Azure vire
# ✅ Konfigurira omrežje in varnost
# ✅ Zgradi vašo aplikacijsko kodo
# ✅ Namesti v Azure
# ✅ Dobi delujoč URL
azd up
```

**To je vse!** Brez klikov v Azure Portal, brez zapletenih ARM predlog, brez ročne konfiguracije — samo delujoče aplikacije v Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Kakšna je razlika?

To je najpogostejše vprašanje začetnikov. Tukaj je preprost odgovor:

| Funkcija | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Namen** | Upravljanje posameznih Azure virov | Namestitev celotnih aplikacij |
| **Pristop** | Osredotočen na infrastrukturo | Osredotočen na aplikacijo |
| **Primer** | `az webapp create --name myapp...` | `azd up` |
| **Učna krivulja** | Potrebno poznavanje Azure storitev | Potrebno je samo poznavanje vaše aplikacije |
| **Najbolj primerno za** | DevOps, infrastruktura | Razvijalci, prototipiranje |

### Preprosta prispodoba

- **Azure CLI** je kot imeti vse orodje za gradnjo hiše - kladiva, žage, žeblje. Lahko zgradite karkoli, vendar morate vedeti gradbeništvo.
- **Azure Developer CLI** je kot najeti izvajalca - opišete, kaj želite, in on poskrbi za gradnjo.

### Kdaj uporabiti katerega

| Scenarij | Uporabi |
|----------|----------|
| "Želim hitro namestiti svojo spletno aplikacijo" | `azd up` |
| "Potrebujem ustvariti samo storage account" | `az storage account create` |
| "Gradim celotno AI aplikacijo" | `azd init --template azure-search-openai-demo` |
| "Moram razhroščiti določen Azure vir" | `az resource show` |
| "Želim proizvodno pripravljeno namestitev v nekaj minutah" | `azd up --environment production` |

### Delujejo skupaj!

AZD uporablja Azure CLI v ozadju. Uporabljate lahko oboje:
```bash
# Namestite svojo aplikacijo z AZD
azd up

# Nato natančno nastavite določene vire z Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Najdite predloge v Awesome AZD

Ne začnite iz nič! **Awesome AZD** je skupnostna zbirka predlog, pripravljenih za namestitev:

| Vir | Opis |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Prebrskajte več kot 200 predlog z eno samo namestitvijo |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Prispevajte svojo predlogo skupnosti |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Ocenite z zvezdico in raziščite izvorno kodo |

### Priljubljene AI predloge iz Awesome AZD

```bash
# RAG pogovor z Microsoft Foundry modeli + AI iskanje
azd init --template azure-search-openai-demo

# Hitro AI klepetalno aplikacijo
azd init --template openai-chat-app-quickstart

# AI agenti z Foundry agenti
azd init --template get-started-with-ai-agents
```

---

## 🎯 Začetek v 3 korakih

Preden začnete, poskrbite, da je vaš računalnik pripravljen za predlogo, ki jo želite namestiti:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Če katera od potrebnih preveritev ne uspe, najprej odpravite težavo in nato nadaljujte s hitrim zagonom.

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
# Izbirno, če nameravate v tem tečaju neposredno uporabljati ukaze Azure CLI
az login

# Obvezno za AZD poteke dela
azd auth login
```

Če niste prepričani, katerega potrebujete, sledite celotnemu postopku nastavitve v [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Korak 3: Namestite svojo prvo aplikacijo

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

Ta tečaj je zasnovan za **postopen način učenja** - začnite tam, kjer se počutite udobno, in napredujte proti večjemu znanju:

| Vaše izkušnje | Začni tukaj |
|-----------------|------------|
| **Popolnoma nov v Azure** | [Poglavje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Pozna Azure, nov v AZD** | [Poglavje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Želite nameščati AI aplikacije** | [Poglavje 2: AI-prvi razvoj](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Želite praktično vadbo** | [🎓 Interaktiv delavnica](workshop/README.md) - 3-4 urna vodena vaja |
| **Potrebujete proizvodne vzorce** | [Poglavje 8: Proizvodnja in podjetniški vzorci](#-chapter-8-production--enterprise-patterns) |

### Hitra nastavitev

1. **Razveji ta repozitorij**: [![GitHub forki](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonirajte ga**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Poiščite pomoč**: [Azure Discord skupnost](https://discord.com/invite/ByRwuEEgH4)

> **Raje klonirate lokalno?**

> Ta repozitorij vključuje več kot 50 prevodov, kar znatno poveča velikost prenosa. Če želite klonirati brez prevodov, uporabite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> To vam zagotovi vse, kar potrebujete za dokončanje tečaja z veliko hitrejšim prenosom.


## Pregled tečaja

Obvladujte Azure Developer CLI (azd) preko strukturiranih poglavij, zasnovanih za postopno učenje. **Poseben poudarek na nameščanju AI aplikacij z integracijo Microsoft Foundry.**
### Zakaj je ta tečaj bistven za sodobne razvijalce

Glede na vpoglede skupnosti Microsoft Foundry na Discordu, **45% razvijalcev želi uporabljati AZD za AI delovne obremenitve**, vendar naletijo na izzive pri:
- Kompleksne večstoritvene AI arhitekture
- Najboljše prakse za uvajanje AI v produkcijo  
- Integracija in konfiguracija Azure AI storitev
- Optimizacija stroškov za AI delovne obremenitve
- Odpravljanje napak pri uvajanju, specifičnih za AI

### Cilji učenja

Z dokončanjem tega strukturiranega tečaja boste:
- **Obvladali osnovne koncepte AZD**: Osnovni koncepti, namestitev in konfiguracija
- **Uvajali AI aplikacije**: Uporaba AZD z Microsoft Foundry storitvami
- **Izvedli infrastrukturo kot kodo**: Upravljanje Azure virov z Bicep predlogami
- **Odpravljali težave pri uvajanju**: Reševanje pogostih težav in odpravljanje napak
- **Optimirali za produkcijo**: Varnost, skaliranje, spremljanje in upravljanje stroškov
- **Gradili rešitve z več agenti**: Uvajanje kompleksnih AI arhitektur

## Preden začnete: računi, dostop in predpostavke

Preden začnete s 1. poglavjem, poskrbite, da imate naslednje. Koraki namestitve v nadaljevanju tega vodiča predvidevajo, da so te osnove že urejene.

- **An Azure subscription**: Uporabite obstoječo naročnino iz službe ali svoj račun ali ustvarite [free trial](https://aka.ms/azurefreetrial), da začnete.
- **Permission to create Azure resources**: Za večino vaj bi morali imeti vsaj **Contributor** dostop na ciljni naročnini ali skupini virov. Nekatera poglavja lahko tudi predpostavljajo, da lahko ustvarjate skupine virov, upravljane identitete in RBAC dodelitve.
- [**A GitHub account**](https://github.com): To je koristno za forkanje repozitorija, sledenje vašim spremembam in uporabo GitHub Codespaces za delavnico.
- **Template runtime prerequisites**: Nekatere predloge zahtevajo lokalna orodja, kot so Node.js, Python, Java ali Docker. Zaženite validator namestitve, preden začnete, da zgodaj odkrijete manjkajoča orodja.
- **Basic terminal familiarity**: Ni vam treba biti strokovnjak, vendar bi morali biti udobni pri izvajanju ukazov, kot so `git clone`, `azd auth login` in `azd up`.

> **Delate v naročnini podjetja?**
> Če vaše Azure okolje upravlja skrbnik, vnaprej preverite, ali lahko uvajate vire v naročnino ali skupino virov, ki jo nameravate uporabiti. Če ne, prosite za sandbox naročnino ali Contributor dostop, preden začnete.

> **Novo pri Azure?**
> Začnite z lastno Azure trial ali pay-as-you-go naročnino na https://aka.ms/azurefreetrial, tako da lahko dokončate vaje od začetka do konca brez čakanja na odobritve na ravni najemnika.

## 🗺️ Zemljevid tečaja: hitra navigacija po poglavjih

Vsako poglavje ima namenski README z učnimi cilji, hitrimi začetki in vajami:

| Poglavje | Tema | Lekcije | Trajanje | Kompleksnost |
|---------|-------|---------|----------|------------|
| **[Poglavje 1: Osnove](docs/chapter-01-foundation/README.md)** | Začetek | [Osnove AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Namestitev](docs/chapter-01-foundation/installation.md) &#124; [Prvi projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Poglavje 2: AI razvoj](docs/chapter-02-ai-development/README.md)** | Aplikacije, usmerjene na AI | [Integracija Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agenti](docs/chapter-02-ai-development/agents.md) &#124; [Uvajanje modelov AI](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Delavnica](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Poglavje 3: Konfiguracija](docs/chapter-03-configuration/README.md)** | Avtentikacija in varnost | [Konfiguracija](docs/chapter-03-configuration/configuration.md) &#124; [Avtentikacija in varnost](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Poglavje 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC in uvajanje | [Vodnik za uvajanje](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Zagotavljanje virov](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Poglavje 5: Več agentov](docs/chapter-05-multi-agent/README.md)** | Rešitve z AI agenti | [Scenarij za maloprodajo](examples/retail-scenario.md) &#124; [Vzorce koordinacije](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Poglavje 6: Pred uvajanjem](docs/chapter-06-pre-deployment/README.md)** | Načrtovanje in validacija | [Preverjanje pred zagonom](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Načrtovanje kapacitet](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Izbira SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Poglavje 7: Odpravljanje napak](docs/chapter-07-troubleshooting/README.md)** | Razhroščevanje in popravki | [Pogoste težave](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Razhroščevanje](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI težave](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Poglavje 8: Produkcija](docs/chapter-08-production/README.md)** | Podjetniški vzorci | [Prakse za produkcijsko AI](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktična delavnica | [Uvod](workshop/docs/instructions/0-Introduction.md) &#124; [Izbor](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Razstavljanje](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prilagoditev](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Razgradnja infrastrukture](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zaključek](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Skupna dolžina tečaja:** ~10-14 ur | **Napredek znanja:** Začetnik → Pripravljen za produkcijo

---

## 📚 Učna poglavja

*Izberite svojo učno pot glede na stopnjo izkušenj in cilje*

### 🚀 Poglavje 1: Osnove in hiter začetek
**Predpogoji**: Azure naročnina, osnovno znanje ukazne vrstice  
**Trajanje**: 30-45 minut  
**Kompleksnost**: ⭐

#### Kaj se boste naučili
- Razumevanje osnov Azure Developer CLI
- Namestitev AZD na vašo platformo
- Vaše prvo uspešno uvajanje

#### Viri za učenje
- **🎯 Začnite tukaj**: [Kaj je Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorija**: [Osnove AZD](docs/chapter-01-foundation/azd-basics.md) - Osnovni koncepti in terminologija
- **⚙️ Namestitev**: [Namestitev in nastavitev](docs/chapter-01-foundation/installation.md) - Vodniki za posamezne platforme
- **🛠️ Praktično**: [Prvi projekt](docs/chapter-01-foundation/first-project.md) - Korak za korakom vadnica
- **📋 Hiter referenčni vodnik**: [Hitri seznam ukazov](resources/cheat-sheet.md)

#### Praktične vaje
```bash
# Hitri pregled namestitve
azd version

# Razmestite svojo prvo aplikacijo
azd init --template todo-nodejs-mongo
azd up
```

**💡 Izhod iz poglavja**: Uspešno uvesti preprosto spletno aplikacijo v Azure z uporabo AZD

**✅ Preverjanje uspeha:**
```bash
# Po končanem 1. poglavju boste sposobni:
azd version              # Prikaže nameščeno različico
azd init --template todo-nodejs-mongo  # Inicializira projekt
azd up                  # Razporedi v Azure
azd show                # Prikaže URL zagnane aplikacije
# Aplikacija se odpre v brskalniku in deluje
azd down --force --purge  # Počisti vire
```

**📊 Časovna naložba:** 30-45 minut  
**📈 Stopnja znanja po:** Lahko samostojno uvajate osnovne aplikacije
**📈 Stopnja znanja po:** Lahko samostojno uvajate osnovne aplikacije

---

### 🤖 Poglavje 2: Razvoj, usmerjen na AI (Priporočeno za AI razvijalce)
**Predpogoji**: Zaključeno 1. poglavje  
**Trajanje**: 1-2 uri  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Integracija Microsoft Foundry z AZD
- Uvajanje aplikacij, ki jih poganja AI
- Razumevanje konfiguracij AI storitev

#### Viri za učenje
- **🎯 Začnite tukaj**: [Integracija Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agenti**: [Vodnik za AI agente](docs/chapter-02-ai-development/agents.md) - Uvajanje inteligentnih agentov z AZD
- **📖 Vzorci**: [Uvajanje AI modelov](docs/chapter-02-ai-development/ai-model-deployment.md) - Uvajanje in upravljanje AI modelov
- **🛠️ Delavnica**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pripravite svoje AI rešitve za AZD
- **🎥 Interaktivni vodnik**: [Materiali delavnice](workshop/README.md) - Učenje v brskalniku z MkDocs * DevContainer okolje
- **📋 Predloge**: [#featured-microsoft-foundry-templates](#viri-delavnice)
- **📝 Primeri**: [Primeri uvajanja z AZD](examples/README.md)

#### Praktične vaje
```bash
# Razmestite svojo prvo AI aplikacijo
azd init --template azure-search-openai-demo
azd up

# Preizkusite dodatne AI predloge
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Izhod iz poglavja**: Uvesti in konfigurirati pogovorno aplikacijo, pogonjeno z AI, z RAG zmožnostmi

**✅ Preverjanje uspeha:**
```bash
# Po 2. poglavju boste lahko:
azd init --template azure-search-openai-demo
azd up
# Preizkusiti vmesnik za klepet z AI
# Postavljati vprašanja in dobiti odgovore, ki jih poganja AI, z viri
# Preveriti, ali integracija iskanja deluje
azd monitor  # Preveriti, ali Application Insights prikazuje telemetrijo
azd down --force --purge
```

**📊 Časovna naložba:** 1-2 uri  
**📈 Stopnja znanja po:** Lahko uvajate in konfigurirate aplikacije AI, pripravljene za produkcijo  
**💰 Ozaveščenost o stroških:** Razumeti stroške razvoja približno $80-150/mesec, produkcijski stroški $300-3500/mesec

#### 💰 Premisleki o stroških za AI uvajanja

**Razvojno okolje (ocenjeno $80-150/mesec):**
- Microsoft Foundry Models (Po porabi): $0-50/mesec (na podlagi uporabe tokenov)
- AI Search (osnovni nivo): $75/mesec
- Container Apps (Poraba): $0-20/mesec
- Shramba (Standardno): $1-5/mesec

**Produkcijsko okolje (ocenjeno $300-3,500+/mesec):**
- Microsoft Foundry Models (PTU za dosledno zmogljivost): $3,000+/mesec ALI plačilo po porabi pri velikem obsegu
- AI Search (standardni nivo): $250/mesec
- Container Apps (dedicirano): $50-100/mesec
- Application Insights: $5-50/mesec
- Shramba (Premijsko): $10-50/mesec

**💡 Nasveti za optimizacijo stroškov:**
- Uporabite **Free Tier** Microsoft Foundry Models za učenje (Azure OpenAI vključuje 50.000 tokenov/mesec)
- Za sprostitev virov, ko ne razvijate, zaženite `azd down`
- Začnite z obračunavanjem po porabi, na PTU preidite le za produkcijo
- Uporabite `azd provision --preview` za oceno stroškov pred uvajanjem
- Omogočite samodejno skaliranje: plačajte le za dejansko uporabo

**Spremljanje stroškov:**
```bash
# Preverite ocenjene mesečne stroške
azd provision --preview

# Spremljajte dejanske stroške v Azure portalu
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Poglavje 3: Konfiguracija in avtentikacija
**Predpogoji**: Zaključeno 1. poglavje  
**Trajanje**: 45-60 minut  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Upravljanje in konfiguracija okolij
- Najboljše prakse za avtentikacijo in varnost
- Imenovanje in organizacija virov

#### Viri za učenje
- **📖 Konfiguracija**: [Vodnik za konfiguracijo](docs/chapter-03-configuration/configuration.md) - Nastavitev okolja
- **🔐 Varnost**: [Vzorce avtentiﬁkacije in upravljane identitete](docs/chapter-03-configuration/authsecurity.md) - Vzorci avtentikacije
- **📝 Primeri**: [Primer baze podatkov](examples/database-app/README.md) - AZD primeri z bazo podatkov

#### Praktične vaje
- Konfigurirajte več okolij (dev, staging, prod)
- Nastavite avtentikacijo z upravljano identiteto
- Uvedite konfiguracije specifične za okolje

**💡 Izhod iz poglavja**: Upravljajte več okolij z ustrezno avtentikacijo in varnostjo

---

### 🏗️ Poglavje 4: Infrastruktura kot koda in uvajanje
**Predpogoji**: Zaključena poglavja 1-3  
**Trajanje**: 1-1.5 ur  
**Kompleksnost**: ⭐⭐⭐

#### Kaj se boste naučili
- Napredni vzorci uvajanja
- Infrastruktura kot koda z Bicep
- Strategije zagotavljanja virov

#### Viri za učenje
- **📖 Uvajanje**: [Vodnik za uvajanje](docs/chapter-04-infrastructure/deployment-guide.md) - Celotni delovni tokovi
- **🏗️ Zagotavljanje**: [Zagotavljanje virov](docs/chapter-04-infrastructure/provisioning.md) - Upravljanje Azure virov
- **📝 Primeri**: [Primer Container App](../../examples/container-app) - Uvajanja vsebnikov

#### Praktične vaje
- Ustvarite lastne Bicep predloge
- Uvajajte večstoritvene aplikacije
- Uvedite blue-green strategije uvajanja

**💡 Izhod iz poglavja**: Uvajajte kompleksne večstoritvene aplikacije z uporabo lastnih infrastrukturnih predlog

---
### 🎯 Poglavje 5: Več-agentne AI rešitve (napredno)
**Pogoji**: Zaključena poglavja 1-2  
**Trajanje**: 2-3 ure  
**Kompleksnost**: ⭐⭐⭐⭐

#### Kaj se boste naučili
- Vzorec arhitekture z več agenti
- Orkestracija in koordinacija agentov
- Priprava AI za produkcijsko nameščanje

#### Viri za učenje
- **🤖 Izpostavljen projekt**: [Maloprodajna več-agentna rešitev](examples/retail-scenario.md) - Celotna implementacija
- **🛠️ ARM predloge**: [Paket ARM predlog](../../examples/retail-multiagent-arm-template) - Namestitev z enim klikom
- **📖 Arhitektura**: [Vzorce koordinacije več agentov](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzorce

#### Praktične vaje
```bash
# Razporedi celotno maloprodajno večagentno rešitev
cd examples/retail-multiagent-arm-template
./deploy.sh

# Razišči konfiguracije agentov
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Rezultat poglavja**: Nameščanje in upravljanje produkcijsko pripravljenih več-agentnih AI rešitev z agenti za stranke in zalogo

---

### 🔍 Poglavje 6: Preverjanje in načrtovanje pred nameščanjem
**Pogoji**: Zaključeno poglavje 4  
**Trajanje**: 1 ura  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Načrtovanje kapacitet in preverjanje virov
- Strategije izbire SKU
- Pre-flight preverjanja in avtomatizacija

#### Viri za učenje
- **📊 Načrtovanje**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Preverjanje virov
- **💰 Izbira**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Ugodne izbire
- **✅ Preverjanje**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Avtomatizirani skripti

#### Praktične vaje
- Zaženite skripte za preverjanje kapacitet
- Optimizirajte izbiro SKU za stroške
- Implementirajte avtomatizirana preverjanja pred nameščanjem

**💡 Rezultat poglavja**: Preverite in optimizirajte nameščanja pred izvedbo

---

### 🚨 Poglavje 7: Odpravljanje težav in razhroščevanje
**Pogoji**: Zaključeno katerokoli poglavje o nameščanju  
**Trajanje**: 1-1.5 ure  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Sistematični pristopi k razhroščevanju
- Pogoste težave in rešitve
- Odpravljanje težav specifičnih za AI

#### Viri za učenje
- **🔧 Pogoste težave**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - Pogosta vprašanja in rešitve
- **🕵️ Razhroščevanje**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Korak-po-korak strategije
- **🤖 Težave pri AI**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Težave AI storitev

#### Praktične vaje
- Diagnostika napak pri nameščanju
- Reševanje težav z avtentikacijo
- Razhroščevanje povezljivosti AI storitev

**💡 Rezultat poglavja**: Samostojno diagnosticirajte in odpravite pogoste težave pri nameščanju

---

### 🏢 Poglavje 8: Produkcijski in podjetniški vzorci
**Pogoji**: Zaključena poglavja 1-4  
**Trajanje**: 2-3 ure  
**Kompleksnost**: ⭐⭐⭐⭐

#### Kaj se boste naučili
- Strategije produkcijskega nameščanja
- Podjetniški varnostni vzorci
- Spremljanje in optimizacija stroškov

#### Viri za učenje
- **🏭 Produkcija**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Podjetniški vzorci
- **📝 Primeri**: [Microservices Example](../../examples/microservices) - Kompleksne arhitekture
- **📊 Spremljanje**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Spremljanje

#### Praktične vaje
- Implementirajte podjetniške varnostne vzorce
- Nastavite celovito spremljanje
- Nameščajte v produkcijo z ustreznim upravljanjem

**💡 Rezultat poglavja**: Nameščanje aplikacij pripravljenih za podjetje s polnimi produkcijskimi zmožnostmi

---

## 🎓 Pregled delavnice: Praktična učna izkušnja

> **⚠️ STANJE DELAVNICE: V aktivnem razvoju**  
> Materiali delavnice so trenutno v razvoju in izpopolnjevanju. Jedrni moduli delujejo, vendar so nekateri napredni odseki še nepopolni. Aktivno delamo na zaključku vsebine. [Spremljaj napredek →](workshop/README.md)

### Interaktivni materiali delavnice
**Celovito praktično učno doživetje z orodji v brskalniku in vodjenimi vajami**

Naši materiali delavnice zagotavljajo strukturirano, interaktivno učno izkušnjo, ki dopolnjuje zgoraj opisano poglavjsko gradivo. Delavnica je zasnovana za samostojno učenje in vodenje z inštruktorjem.

#### 🛠️ Značilnosti delavnice
- **Vmesnik v brskalniku**: Celovita delavnica na MkDocs z iskanjem, kopiranjem in temami
- **Integracija GitHub Codespaces**: Nastavitev razvojnega okolja z enim klikom
- **Strukturirana učna pot**: 8-modulne vodene vaje (skupaj 3-4 ure)
- **Postopna metodologija**: Uvod → Izbira → Preverjanje → Dekonstrukcija → Konfiguracija → Prilagoditev → Čiščenje → Zaključek
- **Interaktivno DevContainer okolje**: Prednastavljena orodja in odvisnosti

#### 📚 Struktura modulov delavnice
Delavnica sledi 8-modulni postopni metodologiji, ki vas popelje od odkrivanja do obvladovanja nameščanja:

| Modul | Tema | Kaj boste počeli | Trajanje |
|--------|-------|----------------|----------|
| **0. Uvod** | Pregled delavnice | Razumeti cilje učenja, pogoje in strukturo delavnice | 15 min |
| **1. Izbira** | Odkritje predlog | Raziščite AZD predloge in izberite pravo AI predlogo za vaš scenarij | 20 min |
| **2. Preverjanje** | Namešči in preveri | Namestite predlogo z `azd up` in preverite delovanje infrastrukture | 30 min |
| **3. Dekonstrukcija** | Razumeti strukturo | Uporabite GitHub Copilot za raziskovanje arhitekture predloge, Bicep datotek in organizacije kode | 30 min |
| **4. Konfiguracija** | Azure.yaml poglobljeno | Obvladujte `azure.yaml` konfiguracijo, življenjske klice in spremenljivke okolja | 30 min |
| **5. Prilagoditev** | Prilagodite jo sebi | Omogočite AI Search, sledenje, evalvacijo in prilagodite za vaš scenarij | 45 min |
| **6. Čiščenje** | Odstranitev | Varen odmor virov z `azd down --purge` | 15 min |
| **7. Zaključek** | Naslednji koraki | Preglejte dosežke, ključne koncepte in nadaljujte z učenjem | 15 min |

**Potek delavnice:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Za začetek z delavnico
```bash
# Možnost 1: GitHub Codespaces (Priporočeno)
# Kliknite "Code" → "Create codespace on main" v repozitoriju

# Možnost 2: Lokalni razvoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Sledite navodilom za nastavitev v workshop/README.md
```

#### 🎯 Učni rezultati delavnice
Z dokončanjem delavnice bodo udeleženci:
- **Nameščali produkcijske AI aplikacije**: Uporabljali AZD z Microsoft Foundry storitvami
- **Obvladali več-agentne arhitekture**: Implementirali koordinirane rešitve z AI agenti
- **Implementirali varnostne prakse**: Konfigurirali avtentikacijo in nadzor dostopa
- **Optimizirali za obseg**: Načrtovali stroškovno učinkovite in zmogljive namestitve
- **Odpravljali težave pri nameščanju**: Samostojno reševali pogoste težave

#### 📖 Viri delavnice
- **🎥 Interaktivni vodič**: [Workshop Materials](workshop/README.md) - Učno okolje v brskalniku
- **📋 Navodila po modulih**:
  - [0. Uvod](workshop/docs/instructions/0-Introduction.md) - Pregled delavnice in cilji
  - [1. Izbira](workshop/docs/instructions/1-Select-AI-Template.md) - Najdite in izberite AI predloge
  - [2. Preverjanje](workshop/docs/instructions/2-Validate-AI-Template.md) - Namestite in preverite predloge
  - [3. Dekonstrukcija](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Raziščite arhitekturo predloge
  - [4. Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) - Obvladajte azure.yaml
  - [5. Prilagoditev](workshop/docs/instructions/5-Customize-AI-Template.md) - Prilagodite za vaš scenarij
  - [6. Čiščenje](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Počistite vire
  - [7. Zaključek](workshop/docs/instructions/7-Wrap-up.md) - Pregled in naslednji koraki
- **🛠️ AI laboratorij delavnice**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Vaje osredotočene na AI
- **💡 Hitri začetek**: [Workshop Setup Guide](workshop/README.md#quick-start) - Konfiguracija okolja

**Primerno za**: Strokovno usposabljanje v podjetjih, univerzitetne tečaje, samostojno učenje in bootcampe za razvijalce.

---

## 📖 Poglobljeno: Zmožnosti AZD

Onkraj osnov ponuja AZD močne funkcije za produkcijska nameščanja:

- **Nameščanja na osnovi predlog** - Uporabite vnaprej pripravljene predloge za pogoste vzorce aplikacij
- **Infrastruktura kot koda** - Upravljajte Azure vire z Bicep ali Terraform  
- **Integrirani poteki dela** - Brezhibno zagotavljanje, nameščanje in spremljanje aplikacij
- **Prijazno razvijalcem** - Optimizirano za produktivnost in izkušnjo razvijalcev

### **AZD + Microsoft Foundry: Idealno za AI nameščanja**

**Zakaj AZD za AI rešitve?** AZD reši glavne izzive, s katerimi se srečujejo razvijalci AI:

- **Predloge pripravljene za AI** - Predkonfigurirane predloge za Microsoft Foundry modele, Azure AI storitve in ML obremenitve
- **Varnostno zavarovana AI nameščanja** - Vgrajeni varnostni vzorci za AI storitve, API ključe in končne točke modelov  
- **Produkcijski AI vzorci** - Dobri pristopi za skalabilne, stroškovno učinkovite AI aplikacije
- **Celoviti AI poteki dela** - Od razvoja modela do produkcijske namestitve z ustreznim spremljanjem
- **Optimizacija stroškov** - Pametna dodelitev virov in strategije skaliranja za AI obremenitve
- **Integracija z Microsoft Foundry** - Brezhibna povezava s katalogom modelov in končnimi točkami Microsoft Foundry

---

## 🎯 Knjižnica predlog in primerov

### Izpostavljeno: Microsoft Foundry predloge
**Začnite tukaj, če nameščate AI aplikacije!**

> **Opomba:** Te predloge prikazujejo različne AI vzorce. Nekatere so zunanje Azure Samples, druge so lokalne implementacije.

| Predloga | Poglavje | Kompleksnost | Storitve | Tip |
|----------|---------|------------|----------|------|
| [**Začni z AI klepetom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavje 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Zunanji |
| [**Začni z AI agenti**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavje 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Zunanji |
| [**Azure Search + OpenAI demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavje 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Zunanji |
| [**Hitri začetek OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavje 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Zunanji |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavje 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Zunanji |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Poglavje 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Zunanji |
| [**Maloprodajna več-agentna rešitev**](examples/retail-scenario.md) | Poglavje 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokalno** |

### Izpostavljeno: Celoviti učni scenariji
**Predloge aplikacij pripravljenih za produkcijo, preslikane na učna poglavja**

| Predloga | Učno poglavje | Kompleksnost | Ključna spoznanja |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavje 2 | ⭐ | Osnovni vzorci za nameščanje AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavje 2 | ⭐⭐ | RAG implementacija z Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Poglavje 4 | ⭐⭐ | Integracija dokumentne inteligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavje 5 | ⭐⭐⭐ | Okvir agentov in klicanje funkcij |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Poglavje 8 | ⭐⭐⭐ | Podjetniška orkestracija AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Poglavje 5 | ⭐⭐⭐⭐ | Več-agentna arhitektura z agenti za stranke in zalogo |

### Učenje s primeri po tipu

> **📌 Lokalni in zunanji primeri:**  
> **Lokalni primeri** (v tem repozitoriju) = Takoj pripravljeni za uporabo  
> **Zunanji primeri** (Azure Samples) = Klonirajte iz povezanih repozitorijev

#### Lokalni primeri (pripravljeni za uporabo)
- [**Maloprodajna več-agentna rešitev**](examples/retail-scenario.md) - Celovita produkcijsko pripravljena implementacija z ARM predlogami
  - Več-agentna arhitektura (agent za stranke + agent za zalogo)
  - Celovito spremljanje in evalvacija
  - Namestitev z enim klikom preko ARM predloge

#### Lokalni primeri - kontejnerske aplikacije (Poglavja 2-5)
**Celoviti primeri nameščanja kontejnerjev v tem repozitoriju:**
- [**Container App Examples**](examples/container-app/README.md) - Popoln vodič za kontejnerizirane namestitve
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Osnovni REST API z možnostjo scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Produkcijsko pripravljena večstoritvena namestitev
  - Hiter začetek, produkcijski in napredni vzorci nameščanja
  - Smernice za spremljanje, varnost in optimizacijo stroškov

#### External Examples - Simple Applications (Chapters 1-2)
**Klonirajte te repozitorije Azure Samples za začetek:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Osnovni vzorci nameščanja
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Nameščanje statične vsebine
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Nameščanje REST API

#### External Examples - Database Integration (Chapter 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzorci povezljivosti z bazo podatkov
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Brezstrežni podatkovni potek

#### External Examples - Advanced Patterns (Chapters 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arhitekture z več storitvami
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Ozadinsko procesiranje  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkcijsko pripravljeni vzorci za ML

### External Template Collections
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kuriran izbor uradnih in skupnostnih predlog
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentacija predlog na Microsoft Learn
- [**Examples Directory**](examples/README.md) - Lokalni učni primeri z podrobnimi razlagami

---

## 📚 Learning Resources & References

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Ključni azd ukazi, razvrščeni po poglavjih
- [**Glossary**](resources/glossary.md) - Terminologija Azure in azd  
- [**FAQ**](resources/faq.md) - Pogosta vprašanja, razvrščena po učnih poglavjih
- [**Study Guide**](resources/study-guide.md) - Celovite praktične vaje

### Hands-On Workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Prilagodite svoje AI rešitve za nameščanje z AZD (2-3 ure)
- [**Interactive Workshop**](workshop/README.md) - 8-modulne vodene vaje z MkDocs in GitHub Codespaces
  - Follows: Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up

### External Learning Resources
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI Agent Skills for Your Editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 odprtih agentnih spretnosti za Azure AI, Foundry, nameščanje, diagnostiko, optimizacijo stroškov in več. Namestite jih v GitHub Copilot, Cursor, Claude Code, ali kateri koli podprt agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Quick Troubleshooting Guide

**Pogoste težave, s katerimi se srečajo začetniki, in takojšnje rešitve:**

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

# Ali uporabite manjše SKU-je med razvojem
# Uredite infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Možnost 1: Počisti in poskusi znova
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
# AZD ustvarja edinstvena imena, vendar če pride do konflikta:
azd down --force --purge

# Nato ponovno poskusi s svežim okoljem
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Namestitev predloge traja predolgo</strong></summary>

**Normalni časi čakanja:**
- Preprosta spletna aplikacija: 5-10 minut
- Aplikacija z bazo podatkov: 10-15 minut
- AI aplikacije: 15-25 minut (provisioniranje OpenAI je počasno)

```bash
# Preveri napredek
azd show

# Če se zatakne več kot 30 minut, preveri Azure Portal:
azd monitor --overview
# Poišči neuspele implementacije
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Preverite svojo vlogo v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebujete vsaj vlogo "Contributor"
# Prosite svojega skrbnika za Azure, naj podeli:
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

### 📚 Full Troubleshooting Resources

- **Vodnik za pogoste težave:** [Podrobne rešitve](docs/chapter-07-troubleshooting/common-issues.md)
- **Težave specifične za AI:** [Odpravljanje težav z AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Vodnik za odpravljanje napak:** [Postopno razhroščevanje](docs/chapter-07-troubleshooting/debugging.md)
- **Poiščite pomoč:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Course Completion & Certification

### Progress Tracking
Spremljajte svoj napredek skozi vsako poglavje:

- [ ] **Poglavje 1**: Osnove in hiter začetek ✅
- [ ] **Poglavje 2**: Razvoj, usmerjen na AI ✅  
- [ ] **Poglavje 3**: Konfiguracija in avtentikacija ✅
- [ ] **Poglavje 4**: Infrastruktura kot koda in uvajanje ✅
- [ ] **Poglavje 5**: Večagentne AI rešitve ✅
- [ ] **Poglavje 6**: Validacija in načrtovanje pred uvajanjem ✅
- [ ] **Poglavje 7**: Odpravljanje težav in razhroščevanje ✅
- [ ] **Poglavje 8**: Produkcijski in podjetniški vzorci ✅

### Learning Verification
Po zaključku vsakega poglavja preverite svoje znanje z:
1. **Praktična vaja**: Dokončajte praktično uvajanje iz poglavja
2. **Preverjanje znanja**: Preberite razdelek Pogosta vprašanja za svoje poglavje
3. **Skupnostna razprava**: Delite svoje izkušnje v Azure Discord
4. **Naslednje poglavje**: Preidite na naslednjo raven zahtevnosti

### Course Completion Benefits
Po zaključku vseh poglavij boste imeli:
- **Izkušnje s produkcijo**: Namestili boste resnične AI aplikacije v Azure
- **Profesionalne veščine**: Sposobnosti uvajanja, primerne za podjetja  
- **Priznanje v skupnosti**: Aktiven član skupnosti Azure razvijalcev
- **Napredovanje v karieri**: Iskane AZD in AI veščine za uvajanje

---

## 🤝 Community & Support

### Get Help & Support
- **Tehnične težave**: [Prijavite napake in zahtevajte funkcije](https://github.com/microsoft/azd-for-beginners/issues)
- **Vprašanja glede učenja**: [Skupnost Microsoft Azure na Discordu](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoč specifična za AI**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Uradna dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community Insights from Microsoft Foundry Discord

**Nedavni rezultati ankete iz kanala #Azure:**
- **45%** razvijalcev želi uporabljati AZD za AI delovne obremenitve
- **Glavne težave**: Namestitve z več storitvami, upravljanje poverilnic, pripravljenost za produkcijo  
- **Najbolj zahtevano**: Predloge specifične za AI, vodniki za odpravljanje težav, najboljše prakse

**Pridružite se naši skupnosti za:**
- Delite svoje izkušnje z AZD + AI in dobite pomoč
- Dostopajte do zgodnjih pregledov novih AI predlog
- Prispevajte k najboljšim praksam za uvajanje AI
- Vplivajte na prihodnji razvoj funkcij AI + AZD

### Contributing to the Course
Prispevke dobrodošli! Prosimo preberite naš [Vodnik za prispevanje](CONTRIBUTING.md) za podrobnosti o:
- **Izboljšave vsebine**: Izboljšajte obstoječa poglavja in primere
- **Novi primeri**: Dodajte primere iz resničnega sveta in predloge  
- **Prevajanje**: Pomagajte vzdrževati večjezično podporo
- **Poročila o napakah**: Izboljšajte natančnost in jasnost
- **Smernice skupnosti**: Upoštevajte naše smernice za vključujočo skupnost

---

## 📄 Course Information

### License
Ta projekt je licenciran pod licenco MIT - za podrobnosti si oglejte datoteko [LICENSE](../../LICENSE).

### Related Microsoft Learning Resources

Our team produces other comprehensive learning courses:

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
 
### Generative AI Series
[![Generativna AI za začetnike](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativna AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Osnovno učenje
[![Strojno učenje za začetnike](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Podatkovna znanost za začetnike](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Umetna inteligenca za začetnike](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kibernetska varnost za začetnike](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Spletni razvoj za začetnike](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT za začetnike](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Razvoj XR za začetnike](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serija Copilot
[![Copilot za AI parno programiranje](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot za C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Avantura](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigacija tečaja

**🚀 Pripravljeni začeti z učenjem?**

**Začetniki**: Začnite s [Poglavje 1: Osnove in hiter začetek](#-chapter-1-foundation--quick-start)  
**Razvijalci AI**: Preskočite na [Poglavje 2: AI-prvi razvoj](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Izkušeni razvijalci**: Začnite s [Poglavje 3: Konfiguracija in avtentikacija](#️-chapter-3-configuration--authentication)

**Naslednji koraki**: [Začni poglavje 1 - AZD osnove](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->