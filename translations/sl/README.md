# AZD za začetnike: Strukturirana učna pot

![AZD-for-beginners](../../translated_images/sl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Samodejni prevodi (vedno ažurno)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](./README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Raje klonirate lokalno?**
>
> Ta repozitorij vsebuje prevode v več kot 50 jezikov, kar znatno poveča velikost prenosa. Za kloniranje brez prevodov uporabite sparse checkout:
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
> S tem dobite vse, kar potrebujete za dokončanje tečaja z veliko hitrejšim prenosom.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Kaj je danes novega v azd

> 📌 Ta tečaj je preverjen z **`azd 1.27.1`** (julij 2026). Za preverjanje verzije zaženite `azd version`, za nadgradnjo pa `azd upgrade`.

Azure Developer CLI je prerasel klasične spletne aplikacije in API-je. Danes je azd edino orodje za nameščanje **katerekoli** aplikacije v Azure – vključno z AI-aplikacijami in inteligentnimi agenti.

Tukaj je, kaj to pomeni za vas:

- **AI agenti so zdaj prvorazredne obremenitve azd.** Lahko inicializirate, nameščate in upravljate projekte AI agentov z istim delovnim tokom `azd init` → `azd up`, ki ga že poznate.
- **Popoln življenjski cikel agenta iz ukazne vrstice.** Razširitev `azure.ai.agents` zdaj pokriva celotno pot—`azd ai agent init` za ustvarjanje ogrodja, `azd ai agent invoke` za testiranje (z izpisom odzivnih časov), `azd ai agent eval generate` in `azd ai agent optimize` za merjenje in izboljšanje kakovosti ter `azd ai agent delete` za čiščenje.
- **Več gradnikov za AI.** Nove predogledne razširitve—`azure.ai.skills` in `azure.ai.connections`—vam omogočajo upravljanje ponovno uporabnih veščin agentov in integracij Foundry neposredno z azd.
- **Integracija Microsoft Foundry** prinaša nameščanje modelov, gostovanje agentov in konfiguracijo AI storitev neposredno v ekosistem azd predlog.
- **Boljša osnovna uporaba vsak dan.** Nedavne izdaje so naredile `azd init` idempotenten (varen za ponovno izvajanje), `azd auth login` zdaj samodejno očisti zastarele žetone in dodal se je prijazen poziv za prvo uporabo `azd tool`.
- **Osnovni delovni tok ni spremenjen.** Ne glede na to, ali nameščate aplikacijo za opravila, mikrostoritev ali večagentno AI rešitev, so ukazi enaki.

> **Opomba za uporabnike Aspire:** Microsoft zdaj produkt imenuje preprosto **Aspire** (prej ".NET Aspire"). Podpora azd za Aspire ostaja nespremenjena – spremenilo se je samo ime.

Če ste azd že uporabljali, je podpora za AI naravna razširitev, ne ločeno orodje ali napredna pot. Če začenjate od začetka, boste spoznali en sam delovni tok, ki deluje za vse.

---

## 🚀 Kaj je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je prijazen ukazni pripomoček za razvijalce, ki poenostavi nameščanje aplikacij v Azure. Namesto ročnega ustvarjanja in povezovanja številnih Azure virov lahko z enim ukazom namestite celotne aplikacije.

### Čarobnost `azd up`

```bash
# Ta enojni ukaz naredi vse:
# ✅ Ustvari vse vire Azure
# ✅ Konfigurira omrežje in varnost
# ✅ Sestavi vašo aplikacijsko kodo
# ✅ Namesti v Azure
# ✅ Dodeli delujoči URL
azd up
```

**To je to!** Brez klikanja po Azure portalu, brez zapletenih ARM predlog, brez ročne konfiguracije – samo delujoče aplikacije v Azure.

---

## ❓ Azure Developer CLI proti Azure CLI: Kakšna je razlika?

To je najpogostejše vprašanje začetnikov. Tukaj je preprost odgovor:

| Značilnost | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Namen** | Upravljanje posameznih Azure virov | Namestitev celotnih aplikacij |
| **Miselnost** | Osredotočeno na infrastrukturo | Osredotočeno na aplikacije |
| **Primer** | `az webapp create --name myapp...` | `azd up` |
| **Učna krivulja** | Potrebno poznati Azure storitve | Samo poznajte svojo aplikacijo |
| **Najbolj primerno za** | DevOps, infrastruktura | Razvijalce, prototipiranje |

### Preprosta primerjava

- **Azure CLI** je kot imati vsa orodja za gradnjo hiše – kladiva, žage, žeblje. Lahko zgradite karkoli, vendar morate poznati gradbeništvo.
- **Azure Developer CLI** je kot da najamete izvajalca – opišete, kaj želite, oni pa poskrbijo za gradnjo.

### Kdaj uporabiti katero

| Scenarij | Uporabite to |
|----------|----------|
| "Želim hitro namestiti spletno aplikacijo" | `azd up` |
| "Potrebujem ustvariti samo skladiščni račun" | `az storage account create` |
| "Gradim celotno AI aplikacijo" | `azd init --template azure-search-openai-demo` |
| "Moram odpraviti napako na določenem Azure viru" | `az resource show` |
| "Želim v nekaj minutah namestiti proizvodno aplikacijo" | `azd up --environment production` |

### Delujejo skupaj!

AZD v ozadju uporablja Azure CLI. Uporabljate lahko oba:
```bash
# Namestite svojo aplikacijo z AZD
azd up

# Nato natančno prilagodite določene vire z Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Poiščite predloge v Awesome AZD

Ne začnite od začetka! **Awesome AZD** je skupnostna zbirka predlog za hitro namestitev:

| Vir | Opis |
|----------|-------------|
| 🔗 [**Awesome AZD Galerija**](https://azure.github.io/awesome-azd/) | Brskajte po več kot 200 predlogah z namestitvijo z enim klikom |
| 🔗 [**Oddajte predlogo**](https://github.com/Azure/awesome-azd/issues) | Prispevajte svojo predlogo skupnosti |
| 🔗 [**GitHub Repozitorij**](https://github.com/Azure/awesome-azd) | Ocenite in raziščite izvorno kodo |

### Priljubljene AI predloge iz Awesome AZD

```bash
# RAG klepet z Microsoft Foundry modeli + AI iskanjem
azd init --template azure-search-openai-demo

# Hitra aplikacija za AI klepet
azd init --template openai-chat-app-quickstart

# AI agenti z Foundry agenti
azd init --template get-started-with-ai-agents
```

---

## 🎯 Začnite v 3 korakih

Pred začetkom preverite, da je vaša naprava pripravljena za predlogo, ki jo želite namestiti:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Če katera od potrebnih preveritev ne uspe, jo najprej odpravite, nato nadaljujte s hitrim začetkom.

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

### Korak 2: Avtorizirajte se za AZD

```bash
# Izbirno, če nameravate v tem tečaju neposredno uporabljati ukaze Azure CLI
az login

# Zahtevano za delovne procese AZD
azd auth login
```

Če niste prepričani, katero vrsto potrebujete, sledite celotnemu postopku v [Nameščanje in nastavitev](docs/chapter-01-foundation/installation.md#authentication-setup).

### Korak 3: Namestite svojo prvo aplikacijo

```bash
# Inicializiraj iz predloge
azd init --template todo-nodejs-mongo

# Namesti na Azure (ustvari vse!)
azd up
```

**🎉 To je to!** Vaša aplikacija je sedaj živa na Azure.

### Čiščenje (Ne pozabite!)

```bash
# Odstranite vse vire, ko končate z eksperimentiranjem
azd down --force --purge
```

---

## 📚 Kako uporabljati ta tečaj

Ta tečaj je zasnovan za **postopno učenje** - začnite tam, kjer ste udobni, in nadaljujte naprej:

| Vaše izkušnje | Začnite tukaj |
|-----------------|------------|
| **Popoln novinec za Azure** | [1. poglavje: Osnove](#-chapter-1-foundation--quick-start) |
| **Poznam Azure, novi uporabnik AZD** | [1. poglavje: Osnove](#-chapter-1-foundation--quick-start) |
| **Želim nameščati AI aplikacije** | [2. poglavje: AI-prvo razvijanje](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Želim praktično vadbo** | [🎓 Interaktivna delavnica](workshop/README.md) - 3-4 ure vodene laboratorijske vaje |
| **Potrebujem proizvodne vzorce** | [8. poglavje: Proizvodnja in podjetja](#-chapter-8-production--enterprise-patterns) |

### Hitra nastavitev

1. **Razvejite ta repozitorij**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonirajte ga**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Poiščite pomoč**: [Skupnost Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Raje klonirate lokalno?**

> Ta repozitorij vključuje prevode v več kot 50 jezikov, kar znatno poveča velikost prenosa. Za kloniranje brez prevodov uporabite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> S tem dobite vse, kar potrebujete za dokončanje tečaja z veliko hitrejšim prenosom.


## Pregled tečaja

Obvladajte Azure Developer CLI (azd) skozi strukturirana poglavja, zasnovana za postopno učenje. **Posebna pozornost nameščanju AI aplikacij z integracijo Microsoft Foundry.**


### Zakaj je ta tečaj ključnega pomena za sodobne razvijalce

Na podlagi vpogledov skupnosti Microsoft Foundry Discord, **45 % razvijalcev želi uporabljati AZD za AI delovne obremenitve**, a naletijo na izzive s:
- Kompleksnimi večstorilnimi AI arhitekturami
- Najboljšimi praksami za uvedbo AI v produkcijo  
- Integracijo in konfiguracijo Azure AI storitev
- Optimizacijo stroškov za AI delovne obremenitve
- Odpravljanjem specifičnih težav pri uvedbi AI

### Cilji učenja

Z dokončanjem tega strukturiranega tečaja boste:
- **Obvladali osnove AZD**: Temeljni koncepti, namestitev in konfiguracija
- **Uvedli AI aplikacije**: Uporaba AZD s storitvami Microsoft Foundry
- **Uvedli infrastrukturo kot kodo**: Upravljanje Azure virov z Bicep predlogami
- **Odpravljali težave pri uvedbah**: Reševanje pogostih problemov in odpravljanje napak
- **Optimizirali za produkcijo**: Varnost, skaliranje, nadzor in upravljanje stroškov
- **Zgradili večagentne rešitve**: Uvedba kompleksnih AI arhitektur

## Pred pričetkom: računi, dostopi in predpostavke

Pred začetkom 1. poglavja poskrbite, da imate naslednje urejeno. Koraki namestitve kasneje v tem vodniku predpostavljajo, da so te osnovne stvari že urejene.

- **Azure naročnino**: Uporabite lahko obstoječo naročnino iz službe ali svojo, ali ustvarite [brezplačno preizkusno obdobje](https://aka.ms/azurefreetrial) za začetek.
- **Dovoljenje za ustvarjanje Azure virov**: Za večino vaj bi morali imeti vsaj **Contributor** dostop do ciljne naročnine ali skupine virov. Nekatera poglavja lahko predpostavljajo, da lahko ustvarite skupine virov, upravljane identitete in RBAC dodelitve.
- [**GitHub račun**](https://github.com): Koristen je za forkanje repozitorija, spremljanje lastnih sprememb in uporabo GitHub Codespaces za delavnico.
- **Predpogoji za zagon predlog**: Nekatere predloge zahtevajo lokalna orodja, kot so Node.js, Python, Java ali Docker. Pred začetkom zaženite validator namestitve, da zgodaj odkrijete manjkajoča orodja.
- **Osnovno znanje terminala**: Ni vam potrebno biti strokovnjak, a morate biti sposobni zagnati ukaze, kot so `git clone`, `azd auth login` in `azd up`.

> **Delate v podjetniški naročnini?**
> Če je vaše Azure okolje upravljano s strani skrbnika, vnaprej preverite, ali lahko uvajate vire v naročnino ali skupino virov, ki jo nameravate uporabiti. Če ne, zaprosite za sandbox naročnino ali Contributor dostop pred začetkom.

> **Novi ste v Azure?**
> Začnite z lastno brezplačno preizkusno naročnino ali naročnino po porabi na https://aka.ms/azurefreetrial, da lahko vaje izvedete od začetka do konca brez čakanja na odobritve na ravni najemnika.

## 🗺️ Zemljevid tečaja: Hitro krmarjenje po poglavjih

Vsako poglavje ima namenski README z učnimi cilji, hitrimi začetki in vajami:

| Poglavje | Tema | Lekcije | Trajanje | Kompleksnost |
|---------|-------|---------|----------|------------|
| **[1. poglavje: Osnove](docs/chapter-01-foundation/README.md)** | Začetek | [AZD Osnove](docs/chapter-01-foundation/azd-basics.md) &#124; [Namestitev](docs/chapter-01-foundation/installation.md) &#124; [Prvi projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[2. poglavje: AI razvoj](docs/chapter-02-ai-development/README.md)** | AI-prve aplikacije | [Integracija Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agenti](docs/chapter-02-ai-development/agents.md) &#124; [Uvedba modela](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Delavnica](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ur | ⭐⭐ |
| **[3. poglavje: Konfiguracija](docs/chapter-03-configuration/README.md)** | Avtentikacija in varnost | [Konfiguracija](docs/chapter-03-configuration/configuration.md) &#124; [Avtentikacija in varnost](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[4. poglavje: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC & uvedba | [Vodnik za uvedbo](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisoniranje](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ur | ⭐⭐⭐ |
| **[5. poglavje: Večagentno](docs/chapter-05-multi-agent/README.md)** | AI agentne rešitve | [Prodajni scenarij](examples/retail-scenario.md) &#124; [Koordinacijski vzorci](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ur | ⭐⭐⭐⭐ |
| **[6. poglavje: Pred uvedbo](docs/chapter-06-pre-deployment/README.md)** | Načrtovanje & preverjanje | [Preverjanje pred zagonom](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Načrtovanje zmogljivosti](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Izbira SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ura | ⭐⭐ |
| **[7. poglavje: Odpravljanje težav](docs/chapter-07-troubleshooting/README.md)** | Odpravljanje napak & popravki | [Pogoste težave](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Razhroščevanje](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI težave](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ur | ⭐⭐ |
| **[8. poglavje: Produkcija](docs/chapter-08-production/README.md)** | Podjetniški vzorci | [Produkcijske prakse](docs/chapter-08-production/production-ai-practices.md) | 2-3 ur | ⭐⭐⭐⭐ |
| **[🎓 Delavnica](workshop/README.md)** | Praktična delavnica | [Uvod](workshop/docs/instructions/0-Introduction.md) &#124; [Izbor](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Preverjanje](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Razčlenitev](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prilagoditev](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Razstavitev](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zaključek](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ure | ⭐⭐ |

**Skupna dolžina tečaja:** ~10-14 ur | **Napredovanje veščin:** Začetnik → Pripravljen za produkcijo

---

## 📚 Učna poglavja

*Izberite svojo učno pot glede na stopnjo izkušenj in cilje*

### 🚀 1. poglavje: Osnove in hiter začetek
**Predpogoji**: Azure naročnina, osnovno znanje ukazne vrstice  
**Trajanje**: 30-45 minut  
**Kompleksnost**: ⭐

#### Kaj se boste naučili
- Razumevanje osnov Azure Developer CLI
- Namestitev AZD na vaši platformi
- Vašo prvo uspešno uvedbo

#### Učni viri
- **🎯 Začnite tukaj**: [Kaj je Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorija**: [AZD Osnove](docs/chapter-01-foundation/azd-basics.md) - Osnovni koncepti in terminologija
- **⚙️ Namestitev**: [Namestitev in nastavitev](docs/chapter-01-foundation/installation.md) - Vodniki za specifične platforme
- **🛠️ Praksa**: [Vaš prvi projekt](docs/chapter-01-foundation/first-project.md) - Korak za korakom vodič
- **📋 Kratek pregled**: [Ukazni priročnik](resources/cheat-sheet.md)

#### Praktične vaje
```bash
# Hitra preveritev namestitve
azd version

# Namestite svojo prvo aplikacijo
azd init --template todo-nodejs-mongo
azd up
```

**💡 Rezultat poglavja**: Uspešno uvesti preprosto spletno aplikacijo na Azure z uporabo AZD

**✅ Potrditev uspešnosti:**
```bash
# Po zaključku 1. poglavja bi morali znati:
azd version              # Prikaže nameščeno različico
azd init --template todo-nodejs-mongo  # Inicializira projekt
azd up                  # Razporedi v Azure
azd show                # Prikaže URL delujoče aplikacije
# Aplikacija se odpre v brskalniku in deluje
azd down --force --purge  # Počisti vire
```

**📊 Časovna investicija:** 30-45 minut  
**📈 Stopnja spretnosti po:** Samostojno uvajanje osnovnih aplikacij
**📈 Stopnja spretnosti po:** Samostojno uvajanje osnovnih aplikacij

---

### 🤖 2. poglavje: AI-prvi razvoj (priporočeno za AI razvijalce)
**Predpogoji**: Dokončano 1. poglavje  
**Trajanje**: 1-2 uri  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Integracija Microsoft Foundry z AZD
- Uvedba AI-podprtih aplikacij
- Razumevanje konfiguracij AI storitev

#### Učni viri
- **🎯 Začnite tukaj**: [Integracija Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agenti**: [Vodnik za AI agente](docs/chapter-02-ai-development/agents.md) - Uvedba inteligentnih agentov z AZD
- **📖 Vzorci**: [Uvedba AI modelov](docs/chapter-02-ai-development/ai-model-deployment.md) - Uvedba in upravljanje AI modelov
- **🛠️ Delavnica**: [AI delavnica](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pripravite vaše AI rešitve za AZD
- **🎥 Interaktivni vodič**: [Materiali delavnice](workshop/README.md) - Učenje v brskalniku z MkDocs * DevContainer okolje
- **📋 Predloge**: [Predloge Microsoft Foundry](#viri-delavnice)
- **📝 Primeri**: [Primeri AZD uvedb](examples/README.md)

#### Praktične vaje
```bash
# Namestite svojo prvo AI aplikacijo
azd init --template azure-search-openai-demo
azd up

# Preizkusite dodatne AI predloge
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Rezultat poglavja**: Uvesti in konfigurirati AI-podprto klepetalno aplikacijo z RAG zmožnostmi

**✅ Potrditev uspešnosti:**
```bash
# Po drugem poglavju bi morali biti sposobni:
azd init --template azure-search-openai-demo
azd up
# Preizkusiti AI klepetalni vmesnik
# Postavljati vprašanja in dobiti odgovore, podprte z AI, z viri
# Preveriti, ali integracija iskanja deluje
azd monitor  # Preveriti, ali Application Insights prikazuje telemetrijo
azd down --force --purge
```

**📊 Časovna investicija:** 1-2 uri  
**📈 Stopnja spretnosti po:** Samostojno uvajanje in konfiguriranje produkcijsko pripravljenih AI aplikacij  
**💰 Ozaveščenost o stroških:** Razumevanje stroškov razvoja $80-150/mesec, produkcija $300-3500/mesec

#### 💰 Premisleki o stroških pri uvedbi AI

**Razvojno okolje (ocenjeno $80-150/mesec):**
- Microsoft Foundry modeli (plačilo po porabi): $0-50/mesec (odvisno od uporabe žetonov)
- AI Search (osnovni sloj): $75/mesec
- Container Apps (porabniški način): $0-20/mesec
- Shranjevanje (standard): $1-5/mesec

**Produkcijsko okolje (ocenjeno $300-3,500+/mesec):**
- Microsoft Foundry modeli (PTU za konsistentno uspešnost): $3,000+/mesec ALI plačilo po porabi z visokim volumnom
- AI Search (standardni sloj): $250/mesec
- Container Apps (dedikirana): $50-100/mesec
- Application Insights: $5-50/mesec
- Shranjevanje (premium): $10-50/mesec

**💡 Nasveti za optimizacijo stroškov:**
- Uporabite **Brezplačni sloj** Microsoft Foundry modelov za učenje (Azure OpenAI vključuje 50,000 žetonov/mesec)
- Zaustavite vire z `azd down`, ko se ne razvijate aktivno
- Začnite z obračunavanjem po porabi, PTU uporabite samo za produkcijo
- Uporabite `azd provision --preview` za oceno stroškov pred uvedbo
- Omogočite samodejno skaliranje: plačajte le za dejansko uporabo

**Nadzor stroškov:**
```bash
# Preveri ocenjene mesečne stroške
azd provision --preview

# Spremljaj dejanske stroške v Azure portalu
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3. poglavje: Konfiguracija in avtentikacija
**Predpogoji**: Dokončano 1. poglavje  
**Trajanje**: 45-60 minut  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Konfiguracija in upravljanje okolij
- Najboljše prakse avtentikacije in varnosti
- Poimenovanje virov in organizacija

#### Učni viri
- **📖 Konfiguracija**: [Vodnik za konfiguracijo](docs/chapter-03-configuration/configuration.md) - Nastavitev okolja
- **🔐 Varnost**: [Vzorci avtentikacije in upravljane identitete](docs/chapter-03-configuration/authsecurity.md) - Vzorci avtentikacije
- **📝 Primeri**: [Primer aplikacije z bazo podatkov](examples/database-app/README.md) - Primeri baze podatkov AZD

#### Praktične vaje
- Konfigurirajte več okolij (razvojno, testno, produkcijsko)
- Nastavite avtentikacijo z upravljano identiteto
- Izvedite konfiguracije specifične za okolje

**💡 Rezultat poglavja**: Upravljajte več okolij z ustrezno avtentikacijo in varnostjo

---

### 🏗️ 4. poglavje: Infrastruktura kot koda in uvedba
**Predpogoji**: Dokončano 1.-3. poglavje  
**Trajanje**: 1-1.5 ure  
**Kompleksnost**: ⭐⭐⭐

#### Kaj se boste naučili
- Napredni vzorci uvedbe
- Infrastruktura kot koda z Bicep
- Strategije za zagotavljanje virov

#### Učni viri
- **📖 Uvedba**: [Vodnik za uvedbo](docs/chapter-04-infrastructure/deployment-guide.md) - Celotni delovni tokovi
- **🏗️ Provisoniranje**: [Upravljanje virov](docs/chapter-04-infrastructure/provisioning.md) - Upravljanje Azure virov
- **📝 Primeri**: [Primer Container App](../../examples/container-app) - Uvedbe v vsebnikih

#### Praktične vaje
- Ustvarite prilagojene Bicep predloge
- Uvedite večstorilne aplikacije
- Izvedite strategiije modro-zelene uvedbe

**💡 Rezultat poglavja**: Uspešno uvesti kompleksne večstorilne aplikacije z uporabo prilagojenih infrastrukturnih predlog

---


### 🎯 Poglavje 5: Rešitve AI z več agenti (Napredno)
**Predpogoji**: Poglavji 1-2 zaključeni  
**Trajanje**: 2-3 ure  
**Zapletenost**: ⭐⭐⭐⭐

#### Kaj se boste naučili
- Vzorce arhitekture z več agenti
- Orkestracija in usklajevanje agentov
- Produkcijsko pripravljene AI implementacije

#### Učni viri
- **🤖 Izpostavljen projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Popolna implementacija
- **🛠️ ARM Predloge**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Namestitev z enim klikom
- **📖 Arhitektura**: [Vzorce koordinacije več agentov](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzorce

#### Praktične naloge
```bash
# Namestite celovito večagentno rešitev za maloprodajo
cd examples/retail-multiagent-arm-template
./deploy.sh

# Raziskujte konfiguracije agentov
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Rezultat poglavja**: Namestite in upravljajte produkcijsko pripravljeno AI rešitev z več agenti s strankami in zalogami

---

### 🔍 Poglavje 6: Validacija in načrtovanje pred namestitvijo
**Predpogoji**: Poglavje 4 zaključeno  
**Trajanje**: 1 ura  
**Zapletenost**: ⭐⭐

#### Kaj se boste naučili
- Načrtovanje kapacitet in validacija virov
- Strategije izbire SKU
- Pre-flight kontrole in avtomatizacija

#### Učni viri
- **📊 Načrtovanje**: [Kapaciteto načrtovanje](docs/chapter-06-pre-deployment/capacity-planning.md) - Validacija virov
- **💰 Izbira**: [Izbira SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Stroškovno učinkovite izbire
- **✅ Validacija**: [Pre-flight kontrole](docs/chapter-06-pre-deployment/preflight-checks.md) - Avtomatizirani skripti

#### Praktične naloge
- Zaženite skripte za validacijo kapacitete
- Optimizirajte izbiro SKU za stroške
- Izvedite avtomatizirane pre-flight kontrole

**💡 Rezultat poglavja**: Validirajte in optimizirajte namestitve pred izvedbo

---

### 🚨 Poglavje 7: Odpravljanje težav in razhroščevanje
**Predpogoji**: Katero koli poglavje o namestitvah zaključeno  
**Trajanje**: 1-1,5 ure  
**Zapletenost**: ⭐⭐

#### Kaj se boste naučili
- Sistematični pristopi k razhroščevanju
- Pogoste težave in rešitve
- Specifično odpravljanje težav z AI

#### Učni viri
- **🔧 Pogoste težave**: [Pogoste težave](docs/chapter-07-troubleshooting/common-issues.md) - Pogosta vprašanja in rešitve
- **🕵️ Razhroščevanje**: [Vodnik za razhroščevanje](docs/chapter-07-troubleshooting/debugging.md) - Strategije korak za korakom
- **🤖 AI težave**: [Specifično odpravljanje težav AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Težave AI storitev

#### Praktične naloge
- Diagnosticirajte napake pri namestitvi
- Rešite težave z avtorizacijo
- Razhroščujte povezljivost AI storitev

**💡 Rezultat poglavja**: Neodvisno diagnosticirajte in rešujte pogoste težave pri namestitvah

---

### 🏢 Poglavje 8: Produkcijski in podjetniški vzorci
**Predpogoji**: Poglavja 1-4 zaključena  
**Trajanje**: 2-3 ure  
**Zapletenost**: ⭐⭐⭐⭐

#### Kaj se boste naučili
- Strategije produkcijske namestitve
- Vzorci varnosti v podjetju
- Nadzor in optimizacija stroškov

#### Učni viri
- **🏭 Produkcija**: [Prodajne AI prakse](docs/chapter-08-production/production-ai-practices.md) - Podjetniški vzorci
- **📝 Primeri**: [Primer mikro storitev](../../examples/microservices) - Kompleksne arhitekture
- **📊 Nadzor**: [Integracija Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Nadzor

#### Praktične naloge
- Izvedite varnostne vzorce za podjetja
- Nastavite celovit nadzor
- Namestite v produkcijo z ustreznim upravljanjem

**💡 Rezultat poglavja**: Namestite aplikacije, pripravljene za podjetja, s popolno produkcijsko funkcionalnostjo

---

## 🎓 Pregled delavnice: Praktična učna izkušnja

> **⚠️ STATUS DELAVNICE: Aktivni razvoj**  
> Materiali delavnice so trenutno v razvoju in izpopolnjevanju. Osnovni moduli delujejo, nekateri napredni deli niso kompletni. Aktivno delamo na končanju vsebine. [Spremljajte napredek →](workshop/README.md)

### Interaktivni materiali delavnice
**Obširno praktično učenje z orodji v brskalniku in vodenimi vajami**

Naši materiali delavnice nudijo strukturirano, interaktivno učno izkušnjo, ki dopolnjuje zgoraj opisani učni načrt. Delavnica je zasnovana tako za samostojno učenje kot za seje z inštruktorjem.

#### 🛠️ Funkcije delavnice
- **Vmesnik v brskalniku**: Popolna delavnica z gnanjem MkDocs z iskanjem, kopiranjem in temami
- **Integracija GitHub Codespaces**: Nastavitev razvojnega okolja z enim klikom
- **Strukturirana učna pot**: 8-modulne vodene vaje (skupaj 3-4 ure)
- **Postopna metodologija**: Uvod → Izbira → Validacija → Razbijanje → Konfiguracija → Prilagoditev → Odstranitev → Zaključek
- **Interaktivno okolje DevContainer**: Vnaprej konfigurirana orodja in odvisnosti

#### 📚 Struktura modulov delavnice
Delavnica sledi **8-modulni postopni metodologiji**, ki vas popelje od odkrivanja do mojstrstva pri implementaciji:

| Modul | Tema | Kaj boste počeli | Trajanje |
|--------|-------|----------------|----------|
| **0. Uvod** | Pregled delavnice | Razumevanje učnih ciljev, predpogojev in strukture delavnice | 15 min |
| **1. Izbira** | Odkritje predlog | Raziskovanje AZD predlog in izbira prave AI predloge za vaš scenarij | 20 min |
| **2. Validacija** | Namestitev in preverjanje | Namestitev predloge z `azd up` in validacija infrastrukture | 30 min |
| **3. Razbijanje** | Razumevanje strukture | Uporaba GitHub Copilot za raziskovanje arhitekture predlog, Bicep datotek in organizacije kode | 30 min |
| **4. Konfiguracija** | Poglobljeno azure.yaml | Obvladovanje `azure.yaml` konfiguracije, življenjskih krogov in okolijskih spremenljivk | 30 min |
| **5. Prilagoditev** | Naredite svoje | Omogočite AI iskanje, slednje, ocenjevanje in prilagodite za svoj scenarij | 45 min |
| **6. Odstranitev** | Čiščenje | Varnostno odstranjevanje virov z `azd down --purge` | 15 min |
| **7. Zaključek** | Naslednji koraki | Pregled dosežkov, ključnih konceptov in nadaljevanje učenja | 15 min |

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
# Kliknite "Code" → "Create codespace on main" v repozitoriju

# Možnost 2: Lokalni razvoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Sledite navodilom za nastavitev v workshop/README.md
```

#### 🎯 Učni rezultati delavnice
S končanjem delavnice bodo udeleženci:
- **Namestili produkcijske AI aplikacije**: Uporaba AZD z Microsoft Foundry storitvami
- **Obvladali arhitekture z več agenti**: Implementirali koordinirane AI agentske rešitve
- **Izvedli varnostne prakse**: Konfigurirali avtentikacijo in nadzor dostopa
- **Optimizirali za obseg**: Oblikovali stroškovno učinkovite in zmogljive namestitve
- **Odpravljali težave z namestitvami**: Neodvisno reševali pogoste težave

#### 📖 Viri delavnice
- **🎥 Interaktivni vodič**: [Materiali delavnice](workshop/README.md) - Učno okolje v brskalniku
- **📋 Navodila po modulih**:
  - [0. Uvod](workshop/docs/instructions/0-Introduction.md) - Pregled delavnice in cilji
  - [1. Izbira](workshop/docs/instructions/1-Select-AI-Template.md) - Iskanje in izbira AI predlog
  - [2. Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) - Namestitev in preverjanje predlog
  - [3. Razbijanje](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Raziskovanje arhitekture predlog
  - [4. Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) - Obvladovanje azure.yaml
  - [5. Prilagoditev](workshop/docs/instructions/5-Customize-AI-Template.md) - Prilagoditev za vaš scenarij
  - [6. Odstranitev](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Čiščenje virov
  - [7. Zaključek](workshop/docs/instructions/7-Wrap-up.md) - Pregled in naslednji koraki
- **🛠️ AI laboratorij delavnice**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI usmerjene vaje
- **💡 Hitri začetek**: [Vodnik za nastavitev delavnice](workshop/README.md#quick-start) - Konfiguracija okolja

**Idealno za**: Podjetna usposabljanja, univerzitetne tečaje, samostojno učenje in razvijalske bootcampe.

---

## 📖 Poglobljeno: Zmožnosti AZD

Poleg osnov ponuja AZD zmogljive funkcije za produkcijske namestitve:

- **Namestitve na podlagi predlog** - Uporaba vnaprej pripravljenih predlog za običajne aplikacijske vzorce
- **Infrastruktura kot koda** - Upravljanje Azure virov z Bicep ali Terraform  
- **Integrirane delovne tokove** - Gladko zagotavljanje, namestitev in nadzor aplikacij
- **Prijazno razvijalcem** - Optimizirano za produktivnost in izkušnjo razvijalcev

### **AZD + Microsoft Foundry: Popolno za AI namestitve**

**Zakaj AZD za AI rešitve?** AZD naslavlja ključne izzive razvijalcev AI:

- **Pripravljene AI predloge** - Vnaprej konfigurirane predloge za Microsoft Foundry modele, Azure AI storitve in ML naloge
- **Varnostne AI namestitve** - Vgrajeni varnostni vzorci za AI storitve, API ključe in končne točke modelov  
- **Produkcijski AI vzorci** - Najboljše prakse za skalabilne, stroškovno učinkovite AI aplikacije
- **Celoviti AI delovni procesi** - Od razvoja modela do produkcijske namestitve s pravim nadzorom
- **Optimizacija stroškov** - Pametne strategije dodeljevanja in skaliranja virov za AI naloge
- **Integracija Microsoft Foundry** - Gladka povezava s katalogom Microsoft Foundry modelov in končnimi točkami

---

## 🎯 Knjižnica predlog in primerov

### Izpostavljeno: Microsoft Foundry predloge
**Začnite tukaj, če uvajate AI aplikacije!**

> **Opomba:** Te predloge prikazujejo različne AI vzorce. Nekatere so zunanje Azure vzorci, druge lokalne implementacije.

| Predloga | Poglavje | Zapletenost | Storitve | Tip |
|----------|---------|------------|----------|------|
| [**Začetek z AI klepetom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavje 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Zunanja |
| [**Začetek z AI agenty**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavje 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Zunanja |
| [**Azure Search + OpenAI demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavje 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Zunanja |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavje 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Zunanja |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavje 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Zunanja |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Poglavje 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Zunanja |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Poglavje 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokalna** |

### Izpostavljeno: Popolni učni scenariji
**Produkcijsko pripravljene aplikacijske predloge, povezane z učnimi poglavji**

| Predloga | Učno poglavje | Zapletenost | Ključna vsebina učenja |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavje 2 | ⭐ | Osnovni vzorci namestitve AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavje 2 | ⭐⭐ | RAG implementacija z Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Poglavje 4 | ⭐⭐ | Integracija inteligence dokumentov |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavje 5 | ⭐⭐⭐ | Okvir za agente in pozivanje funkcij |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Poglavje 8 | ⭐⭐⭐ | Podjetniška orkestracija AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Poglavje 5 | ⭐⭐⭐⭐ | Arhitektura z več agenti s strankami in zalogami |

### Učenje po vrsti primera

> **📌 Lokalni proti zunanjim primerom:**  
> **Lokalni primeri** (v tem repozitoriju) = Takoj pripravljeni za uporabo  
> **Zunanji primeri** (Azure vzorci) = Kloniranje iz povezanih repozitorijev

#### Lokalni primeri (Takoj pripravljeni za uporabo)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Popolna produkcijsko pripravljena implementacija z ARM predlogami
  - Arhitektura z več agenti (Stranke + Zaloga)
  - Celovit nadzor in ocenjevanje
  - Namestitev z enim klikom preko ARM predloge

#### Lokalni primeri - Aplikacije v zabojnikih (Poglavja 2-5)
**Celoviti primeri namestitve zabojnikov v tem repozitoriju:**

- [**Primeri Container App**](examples/container-app/README.md) - Celovit vodič za uvajanje v vsebnikih
  - [Preprosto Flask API](../../examples/container-app/simple-flask-api) - Osnovni REST API s prilagajanjem na ničlo
  - [Mikrostoritvena arhitektura](../../examples/container-app/microservices) - Proizvodnja pripravljena večstoritev
  - Hitri začetek, proizvodnja in napredni vzorci uvajanja
  - Nasveti za spremljanje, varnost in optimizacijo stroškov

#### Zunanji primeri - preproste aplikacije (poglavji 1-2)
**Klonirajte te repozitorije Azure Samples za začetek:**
- [Preprosta spletna aplikacija - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Osnovni vzorci uvajanja
- [Statična spletna stran - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Uvajanje statične vsebine
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Uvajanje REST API

#### Zunanji primeri - Integracija podatkovnih baz (poglavji 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzorci povezljivosti podatkovne baze
- [Funkcije + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless podatkovni potek

#### Zunanji primeri - Napredni vzorci (poglavja 4-8)
- [Java mikrostoritve](https://github.com/Azure-Samples/java-microservices-aca-lab) - Večstoritevne arhitekture
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Ozadinsko procesiranje  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Proizvodnja pripravljeni ML vzorci

### Zbirke zunanjih predlog
- [**Uradna galerija AZD predlog**](https://azure.github.io/awesome-azd/) - Kurirana zbirka uradnih in skupnostnih predlog
- [**Azure Developer CLI predloge**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentacija predlog Microsoft Learn
- [**Mapa primerov**](examples/README.md) - Lokalni učni primeri z podrobnimi pojasnili

---

## 📚 Učne vsebine in reference

### Hitri pogoji
- [**Povzetek ukazov**](resources/cheat-sheet.md) - Ključni ukazi azd organizirani po poglavjih
- [**Slovarček**](resources/glossary.md) - Azure in azd terminologija  
- [**Pogosta vprašanja**](resources/faq.md) - Pogosta vprašanja organizirana po učnih poglavjih
- [**Vodnik za študij**](resources/study-guide.md) - Celovite praktične vaje

### Praktične delavnice
- [**Delavnica AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Naredite svoje AI rešitve pripravljene za uvajanje z AZD (2-3 ure)
- [**Interaktivna delavnica**](workshop/README.md) - 8 modulov vodenih vaj z MkDocs in GitHub Codespaces
  - Potek: Uvod → Izbira → Validacija → Razčlenitev → Konfiguracija → Prilagoditev → Zaključek → Povzetek

### Zunanji učni viri
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulator cen Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status Azure](https://status.azure.com/)

### Znanja AI agentov za vaš urejevalnik
- [**Veščine Microsoft Azure na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 odprtih veščin agentov za Azure AI, Foundry, uvajanje, diagnostiko, optimizacijo stroškov in več. Namestite jih v GitHub Copilot, Cursor, Claude Code ali v katerega koli podprtega agenta:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Hitri vodič za odpravljanje težav

**Pogoste težave začetnikov in takojšnje rešitve:**

<details>
<summary><strong>❌ "azd: ukaz ni najden"</strong></summary>

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
<summary><strong>❌ "Naročnina ni najdena" ali "Naročnina ni nastavljena"</strong></summary>

```bash
# Naštej razpoložljive naročnine
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
<summary><strong>❌ "InsufficientQuota" ali "Kvota presežena"</strong></summary>

```bash
# Poskusi druga regija Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ali uporabi manjše SKU-je med razvojem
# Uredi infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" se ne uspe dokončati</strong></summary>

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
<summary><strong>❌ "Avtentikacija ni uspela" ali "Žeton je potekel"</strong></summary>

```bash
# Ponovno avtorizirajte za AZD
azd auth logout
azd auth login

# Neobvezno: osvežite tudi Azure CLI, če izvajate ukaze az
az logout
az login

# Preverite avtentikacijo
az account show
```
</details>

<details>
<summary><strong>❌ "Vir že obstaja" ali konflikti imen</strong></summary>

```bash
# AZD ustvari edinstvena imena, vendar če pride do konflikta:
azd down --force --purge

# Nato poskusi znova z novim okoljem
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Uvajanje predloge traja predolgo</strong></summary>

**Normalni časi čakanja:**
- Preprosta spletna aplikacija: 5–10 minut
- Aplikacija z bazo podatkov: 10–15 minut
- AI aplikacije: 15–25 minut (OpenAI zaganjanje je počasno)

```bash
# Preveri napredek
azd show

# Če si zataknjen več kot 30 minut, preveri Azure Portal:
azd monitor --overview
# Poišči neuspešne namestitve
```
</details>

<details>
<summary><strong>❌ "Dovoljenje zavrnjeno" ali "Prepovedano"</strong></summary>

```bash
# Preverite svojo Azure vlogo
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebujete vsaj vlogo "Sodelavec"
# Prosite svojega Azure skrbnika, naj podeli:
# - Sodelavec (za vire)
# - Administrator dostopa uporabnikov (za dodelitve vlog)
```
</details>

<details>
<summary><strong>❌ Ni mogoče najti URL-ja uvajane aplikacije</strong></summary>

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

### 📚 Celoviti viri za odpravljanje težav

- **Vodnik po pogostih težavah:** [Podrobne rešitve](docs/chapter-07-troubleshooting/common-issues.md)
- **Težave specifične za AI:** [Odpravljanje težav AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Vodnik za odpravljanje napak:** [Korak za korakom odpravljanje](docs/chapter-07-troubleshooting/debugging.md)
- **Pridobite pomoč:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Zaključek tečaja in certifikat

### Spremljanje napredka
Spremljajte svoj napredek skozi posamezna poglavja:

- [ ] **Poglavje 1**: Osnove in hiter začetek ✅
- [ ] **Poglavje 2**: AI-prvi razvoj ✅  
- [ ] **Poglavje 3**: Konfiguracija in avtentikacija ✅
- [ ] **Poglavje 4**: Infrastruktura kot koda in uvajanje ✅
- [ ] **Poglavje 5**: Večagentne AI rešitve ✅
- [ ] **Poglavje 6**: Preduvajanje, validacija in načrtovanje ✅
- [ ] **Poglavje 7**: Odpravljanje težav in razhroščevanje ✅
- [ ] **Poglavje 8**: Produkcijski in podjetniški vzorci ✅

### Preverjanje znanja
Po zaključku posameznega poglavja preverite svoje znanje z:
1. **Praktična vaja**: Dokončajte poglavje z ročnim uvajanjem
2. **Preverjanje znanja**: Preglejte razdelek Pogosta vprašanja za vaše poglavje
3. **Skupnostna razprava**: Delite svoje izkušnje v skupnosti Azure Discord
4. **Naslednje poglavje**: Nadaljujte na naslednjo stopnjo zahtevnosti

### Prednosti zaključka tečaja
Po zaključku vseh poglavij boste imeli:
- **Produkcijske izkušnje**: Uvedene resnične AI aplikacije v Azure
- **Poklicne veščine**: Sposobnost uvajanja pripravljenih rešitev za podjetja  
- **Priznanje skupnosti**: Aktivni član razvijalske skupnosti Azure
- **Napredovanje v karieri**: Iskane veščine uvajanja AZD in AI

---

## 🤝 Skupnost in podpora

### Pridobite pomoč in podporo
- **Tehnične težave**: [Prijavite hrošče in zahtevajte funkcije](https://github.com/microsoft/azd-for-beginners/issues)
- **Vprašanja o učenju**: [Microsoft Azure Discord skupnost](https://discord.gg/microsoft-azure) in [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifična pomoč**: Pridružite se [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Uradna dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Pogledi skupnosti iz Microsoft Foundry Discord

**Nedavni rezultati ankete iz kanala #Azure:**
- **45 %** razvijalcev želi uporabljati AZD za AI delovne obremenitve
- **Glavni izzivi**: Večservisne uvedbe, upravljanje poverilnic, pripravljenost na produkcijo  
- **Najbolj zahtevano**: AI-specifične predloge, vodiče za odpravljanje težav, najboljše prakse

**Pridružite se naši skupnosti, da:**
- Delite svoje izkušnje z AZD + AI in prejmite pomoč
- Dostopate do zgodnjih predogledov novih AI predlog
- Prispevate k najboljšim praksam uvajanja AI
- Vplivate na prihodnji razvoj funkcij AI + AZD

### Prispevanje k tečaju
Prispevke z veseljem sprejemamo! Prosimo, preberite naš [Vodnik za prispevke](CONTRIBUTING.md) za podrobnosti o:
- **Izboljšave vsebin**: Izboljšajte obstoječa poglavja in primere
- **Novi primeri**: Dodajte realne scenarije in predloge  
- **Prevodi**: Pomagajte vzdrževati večjezično podporo
- **Prijave hroščev**: Izboljšajte natančnost in jasnost
- **Standardi skupnosti**: Upoštevajte naše vključujoče smernice skupnosti

---

## 📄 Informacije o tečaju

### Licenca
Ta projekt je licenciran pod licenco MIT - glejte datoteko [LICENSE](../../LICENSE) za podrobnosti.

### Sorodni Microsoft Learning viri

Naša ekipa pripravlja tudi druge celovite učne tečaje:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j za začetnike](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js za začetnike](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain za začetnike](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agent
[![AZD za začetnike](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI za začetnike](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP za začetnike](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI agenti za začetnike](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serija Generativni AI
[![Generativni AI za začetnike](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generativna AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Osnovno učenje
[![ML za začetnike](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Podatkovna znanost za začetnike](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI za začetnike](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kibernetska varnost za začetnike](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Razvoj spletnih strani za začetnike](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT za začetnike](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR razvoj za začetnike](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serija Copilot
[![Copilot za AI parno programiranje](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot za C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot avantura](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigacija po tečaju

**🚀 Pripravljeni na začetek učenja?**

**Začetniki**: Začnite z [Poglavje 1: Osnove & Hiter začetek](#-chapter-1-foundation--quick-start)  
**AI razvijalci**: Preskočite na [Poglavje 2: AI-prvi razvoj](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Izkušeni razvijalci**: Začnite z [Poglavje 3: Konfiguracija & Avtentikacija](#️-chapter-3-configuration--authentication)

**Naslednji koraki**: [Začetek Poglavja 1 - Osnove AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->