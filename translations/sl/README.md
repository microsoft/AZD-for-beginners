# AZD za začetnike: Strukturirana učna pot

![AZD-for-beginners](../../translated_images/sl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://github.com/microsoft/AZD-for-beginners)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://github.com/microsoft/AZD-for-beginners)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Avtomatski prevodi (vedno posodobljeno)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](./README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Raje klonirate lokalno?**
>
> Ta repozitorij vključuje prevode v več kot 50 jezikih, kar znatno poveča velikost prenosa. Za kloniranje brez prevodov uporabite sparse checkout:
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

> 📌 **Pregled izida AI CLI (2026-11-04):** Smernice so bile preverjene glede na objavljeno dokumentacijo/vir **`azd 1.37.2`**, **agents `1.0.0-beta.23`** in **evaluations `1.0.0-beta.2`**. Za kombinirano delo uporabite `azd >= 1.37.0`. Zaženite `azd version` in [posodobite glavni CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) pred razširitvami. Oglejte si [spremembe in popravke izdaje](docs/chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). To ni neposredna validacija življenja celotnega tečaja.

Azure Developer CLI podpira številne vrste aplikacij, vključno z spletnimi aplikacijami, API-ji in AI agenti, preko podprtih gostiteljev, predlog in razširitev.

Tukaj je, kaj to pomeni za vas:

- **AI agenti so zdaj prvo razredni azd delovni procesi.** Projekt AI agentov lahko inicializirate, namestite in upravljate z uporabo istega delovnega toka `azd init` → `azd up`, ki ga že poznate.
- **Življenjski cikel agenta prek dveh razširitev.** Uporabite `azure.ai.agents` za inicializacijo, klicanje, optimizacijo in upokojitev agentov. Namestite **`azure.ai.evaluations`** ločeno za `azd ai eval init`, `generate` in `run start`. Agent beta.22 je nadomestil star način ocenjevalnega delovnega toka in spremenil konfiguracijo optimizacije; sledite [vodniku za migracijo](docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks).
- **Več gradnikov AI.** Nove predogledne razširitve—`azure.ai.skills` in `azure.ai.connections`—vam omogočajo upravljanje ponovno uporabnih veščin agentov in povezav Foundry neposredno z azd.
- **Integracija Microsoft Foundry** prinaša uvajanje modelov, gostovanje agentov in konfiguracijo AI storitev neposredno v azd ekosistem predlog.
- **Bolj gladka vsakodnevna osnova.** Zadnje izdaje so naredile `azd init` idempotentno (varno za ponovni zagon), samodejno počistile zastarele žetone v `azd auth login` in dodale prijazen poziv za prvo nastavitveno izvedbo `azd tool`.
- **Glavni delovni tok se ni spremenil.** Ne glede na to, ali uvajate aplikacijo za opravila, mikrostoritev ali večagentno AI rešitev, so ukazi enaki.

> **Opomba za uporabnike Aspire:** Microsoft zdaj uporablja ime preprosto **Aspire** (prej ".NET Aspire"). Podpora za Aspire v azd je nespremenjena—posodobljeno je bilo samo ime.

Če ste že uporabljali azd, je podpora AI naravna razširitev—ne ločeno orodje ali napredna pot. Če začenjate na novo, se boste naučili enega delovnega toka, ki deluje za vse.

---

## 🚀 Kaj je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je prijazno orodje ukazne vrstice za razvijalce, ki omogoča enostavno uvajanje aplikacij v Azure. Namesto ročnega ustvarjanja in povezovanja na desetine Azure virov lahko uvajate cele aplikacije z enim ukazom.

### Čarovnija `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

Predloga zagotavlja konfiguracijo aplikacije in infrastrukture. Uspešno uvajanje kljub temu zahteva podprte storitve/modeli, zadostno kvoto in dovoljenja, pravilne vnose ter preverjanje uvožene aplikacije. `azd up` samodejno ne naredi predloge varne, skladne ali primerne za produkcijo.

---

## ❓ Azure Developer CLI proti Azure CLI: Kakšna je razlika?

To je najpogostejše vprašanje začetnikov. Tukaj je preprost odgovor:

| Funkcija | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Namen** | Upravljanje posameznih Azure virov | Uvajanje popolnih aplikacij |
| **Miselnost** | Osredotočeno na infrastrukturo | Osredotočeno na aplikacijo |
| **Primer** | `az webapp create --name myapp...` | `azd up` |
| **Učna krivulja** | Mora poznati Azure storitve | Pozna samo svojo aplikacijo |
| **Najbolj primerno za** | DevOps, infrastrukturo | Razvijalce, prototipiranje |

### Preprost primerjava

- **Azure CLI** je kot imeti vsa orodja za gradnjo hiše - kladiva, žage, žeblje. Lahko zgradiš karkoli, ampak moraš poznati gradbeništvo.
- **Azure Developer CLI** je kot da najameš izvajalca - opišeš, kaj želiš, oni pa poskrbijo za gradnjo.

### Kdaj uporabiti katerega

| Scenarij | Uporabi to |
|----------|----------|
| "Želim hitro uvesti svojo spletno aplikacijo" | `azd up` |
| "Moram ustvariti samo račun za shranjevanje" | `az storage account create` |
| "Gradim celotno AI aplikacijo" | `azd init --template azure-search-openai-demo` |
| "Moram odpraviti napako pri določenem Azure viru" | `az resource show` |
| "Želim uvesti v moj konfiguriran produkcijski okolje" | Pred pregledom konfiguracije, dostopa, stroškov in operativnih omejitev pred `azd up --environment production` |

### Delata skupaj!

AZD in Azure CLI imata ločeno preverjanje pristnosti in konfiguracijo. Za AZD uporabite `azd auth login`, in `az login`, kadar je namenska ali diagnostična ukazna potrebna Azure CLI. Lahko uporabljate oba:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Najdite predloge v Awesome AZD

Ne začnite na prazno! **Awesome AZD** je skupnostna zbirka predlog, pripravljenih za uvajanje:

| Vir | Opis |
|----------|-------------|
| 🔗 [**Awesome AZD galerija**](https://azure.github.io/awesome-azd/) | Prebrskajte več kot 200 predlog z enim klikom za uvajanje |
| 🔗 [**Oddajte predlogo**](https://github.com/Azure/awesome-azd/issues) | Prispevajte svojo predlogo skupnosti |
| 🔗 [**GitHub repozitorij**](https://github.com/Azure/awesome-azd) | Dodajte zvezdico in raziskujte izvorno kodo |

### Priljubljene AI predloge iz Awesome AZD

Izberite eno predlogo v svoji prazni mapi; spodnji ukazi so alternative. Zadnja `.` inicializira to mapo.

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo .

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart .

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents .
```

---

## 🎯 Začetek v 3 korakih

Pred začetkom se prepričajte, da je vaša naprava pripravljena za predlogo, ki jo želite uvesti:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Če kateri koli zahtevan pregled ne uspe, ga najprej popravite, potem nadaljujte s hitrim začetkom.

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
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Če niste prepričani, kateri potrebujete, sledite celotnemu postopku nastavitve v [Nameščanje in nastavitve](docs/chapter-01-foundation/installation.md#authentication-setup).

### Korak 3: Uvedite svojo prvo aplikacijo

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo .

# Deploy to Azure (creates everything!)
azd up
```

**🎉 To je to!** Vaša aplikacija je zdaj živa na Azure.

### Počistite (ne pozabite!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kako uporabljati ta tečaj

Ta tečaj je zasnovan za **postopno učenje** - začnite tam, kjer ste udobni, in napredujte:

| Vaše izkušnje | Začnite tukaj |
|-----------------|------------|
| **Povsem novi v Azure** | [Poglavje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Poznate Azure, novi v AZD** | [Poglavje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Želite uvajati AI aplikacije** | [Poglavje 2: AI prv razvoj](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Želite praktično izkušnjo** | [🎓 Interaktivna delavnica](workshop/README.md) - 3-4 urni vodeni laboratorij |
| **Potrebujete produkcijske vzorce** | [Poglavje 8: Produkcija & Podjetje](#-chapter-8-production--enterprise-patterns) |

### Hitra nastavitev

1. **Prejmite Fork tega repozitorija**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonirajte ga**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Poiščite pomoč**: [Azure Discord skupnost](https://discord.com/invite/ByRwuEEgH4)

> **Raje klonirate lokalno?**

> Ta repozitorij vključuje prevode v več kot 50 jezikih, kar znatno poveča velikost prenosa. Za kloniranje brez prevodov uporabite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> S tem dobite vse, kar potrebujete za dokončanje tečaja z veliko hitrejšim prenosom.


## Pregled Tečaja

Obvladujte Azure Developer CLI (azd) skozi strukturirane poglavja, zasnovana za postopno učenje. **Poseben poudarek na uvajanju AI aplikacij z integracijo Microsoft Foundry.**

### Zakaj je ta tečaj ključnega pomena za sodobne razvijalce

Razvijalci, ki uvajajo AI delovne obremenitve, pogosto potrebujejo usmeritve glede:
- Kompleksnih večstoritev AI arhitektur
- Najboljših praks za produkcijsko uvajanje AI  
- Integracije in konfiguracije Azure AI storitev
- Optimizacije stroškov za AI delovne obremenitve
- Reševanja težav specifičnih za uvajanje AI

### Cilji učenja

Z dokončanjem tega strukturiranega tečaja boste:
- **Obvladali osnove AZD**: Osnovni koncepti, namestitev in konfiguracija
- **Uvajali AI aplikacije**: Uporaba AZD z Microsoft Foundry storitvami
- **Implementirali infrastrukturo kot kodo**: Upravljanje Azure virov s predlogami Bicep
- **Reševali težave uvajanja**: Odpravljanje pogostih težav in odpravljanje napak
- **Optimizirali za produkcijo**: Varnost, skaliranje, spremljanje in upravljanje stroškov
- **Gradili večagentne rešitve**: Uvajanje kompleksnih AI arhitektur

## Preden začnete: Računi, dostop in predpostavke

Pred začetkom prvega poglavja poskrbite, da imate naslednje urejeno. Koraki za namestitev v nadaljevanju predvidevajo, da so ti osnovni pogoji že izpolnjeni.

- **Azure naročnino**: Uporabite lahko obstoječo naročnino iz službe ali svoj račun, ali ustvarite [brezplačni preizkus](https://aka.ms/azurefreetrial), da začnete.
- **Dovoljenje za ustvarjanje Azure virov**: Za večino vaj morate imeti vsaj dostop **Contributor** do ciljne naročnine ali skupine virov. Nekatera poglavja lahko zahtevajo ustvarjanje skupin virov, upravljanih identitet in RBAC dodelitev.
- [**GitHub račun**](https://github.com): Koristen za vilice repozitorija, sledenje spremembam in uporabo GitHub Codespaces za delavnico.
- **Predpogoji za izvajanje predlog**: Nekatere predloge zahtevajo lokalna orodja, kot so Node.js, Python, Java ali Docker. Pred začetkom zaženite preverjevalec namestitve, da oznanite morebitno manjkajočo programsko opremo.
- **Osnovno poznavanje terminala**: Ni vam treba biti strokovnjak, vendar morate biti udobni z izvajanjem ukazov kot so `git clone`, `azd auth login` in `azd up`.

> **Delate v poslovni naročnini?**
> Če vaš Azure okolje upravlja skrbnik, predhodno preverite, ali lahko uvajate vire v naročnino ali skupino virov, ki jo nameravate uporabiti. Če ne, prosite za sandbox naročnino ali dostop Contributor pred začetkom.

> **Nov v Azure?**
> Začnite z lastno brezplačno preskusno ali naročnino plačuj-po-porabi na https://aka.ms/azurefreetrial, da lahko zaključite vaje od začetka do konca brez čakanja na odobritve na ravni najemnika.

## 🗺️ Zemljevid tečaja: Hitra navigacija po poglavjih

Vsako poglavje ima namenski README z učnimi cilji, hitrim začetkom in vajami:

| Poglavje | Tema | Lekcije | Trajanje | Kompleksnost |
|---------|-------|---------|----------|------------|
| **[Poglavje 1: Osnova](docs/chapter-01-foundation/README.md)** | Začetek | [Osnove AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Namestitev](docs/chapter-01-foundation/installation.md) &#124; [Prvi projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Poglavje 2: AI razvoj](docs/chapter-02-ai-development/README.md)** | AI-First aplikacije | [Integracija Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agenti](docs/chapter-02-ai-development/agents.md) &#124; [Uvajanje modelov](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Delavnica](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ure | ⭐⭐ |
| **[Poglavje 3: Konfiguracija](docs/chapter-03-configuration/README.md)** | Avtentikacija & Varnost | [Konfiguracija](docs/chapter-03-configuration/configuration.md) &#124; [Avtentikacija & varnost](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Poglavje 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC & Uvajanje | [Vodnik za uvajanje](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ure | ⭐⭐⭐ |
| **[Poglavje 5: Večagentno](docs/chapter-05-multi-agent/README.md)** | AI agentne rešitve | [Trgovinski primer](examples/retail-scenario.md) &#124; [Vzorec koordinacije](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ure | ⭐⭐⭐⭐ |
| **[Poglavje 6: Pred uvajanjem](docs/chapter-06-pre-deployment/README.md)** | Načrtovanje & Validacija | [Preflight preverjanja](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Načrtovanje kapacitet](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Izbira SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ura | ⭐⭐ |
| **[Poglavje 7: Odpravljanje težav](docs/chapter-07-troubleshooting/README.md)** | Razhroščevanje & Popravki | [Pogoste težave](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Razhroščevanje](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI težave](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ure | ⭐⭐ |
| **[Poglavje 8: Produkcija](docs/chapter-08-production/README.md)** | Poslovni vzorci | [Produkcijske prakse](docs/chapter-08-production/production-ai-practices.md) | 2-3 ure | ⭐⭐⭐⭐ |
| **[🎓 Delavnica](workshop/README.md)** | Praktična delavnica | [Uvod](workshop/docs/instructions/0-Introduction.md) &#124; [Izbira](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Razgradnja](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prilagoditev](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Demontaža](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zaključek](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ure | ⭐⭐ |

**Skupni čas tečaja:** ~10-14 ur | **Napredovanje veščin:** Začetnik → Pripravljen za produkcijo

---

## 📚 Učna poglavja

*Izberite svojo učno pot glede na raven izkušenj in cilje*

### 🚀 Poglavje 1: Osnova & Hiter začetek
**Predpogoji**: Azure naročnina, osnovno znanje ukazne vrstice  
**Trajanje**: 30-45 minut  
**Kompleksnost**: ⭐

#### Kaj se boste naučili
- Razumevanje osnov Azure Developer CLI
- Namestitev AZD na vašo platformo
- Vaše prvo uspešno uvajanje

#### Učni viri
- **🎯 Začni tukaj**: [Kaj je Azure Developer CLI?](#-what-is-azure-developer-cli-azd)
- **📖 Teorija**: [Osnove AZD](docs/chapter-01-foundation/azd-basics.md) - Osnovni koncepti in terminologija
- **⚙️ Namestitev**: [Namestitev in nastavitev](docs/chapter-01-foundation/installation.md) - Vodniki specifični za platformo
- **🛠️ Praktično**: [Vaš prvi projekt](docs/chapter-01-foundation/first-project.md) - Korak za korakom vodič
- **📋 Hitri pregled**: [Prevara ukazov](resources/cheat-sheet.md)

#### Praktične vaje
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo .
azd up
```

**💡 Izhod poglavja**: Uspešno uvajanje preproste spletne aplikacije v Azure z uporabo AZD

**✅ Validacija uspeha:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Časovna naložba:** 30-45 minut  
**📈 Raven znanja po:** Lahko samostojno uvajate osnovne aplikacije

---

### 🤖 Poglavje 2: AI-prvi razvoj (priporočeno za AI razvijalce)
**Predpogoji**: Dokončano Poglavje 1  
**Trajanje**: 1-2 uri  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Integracija Microsoft Foundry z AZD
- Uvajanje AI-podprtih aplikacij
- Razumevanje konfiguracij AI storitev

#### Učni viri
- **🎯 Začni tukaj**: [Integracija Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agenti**: [Vodnik za AI agente](docs/chapter-02-ai-development/agents.md) - Uvajanje inteligentnih agentov z AZD
- **📖 Vzorci**: [Uvajanje AI modelov](docs/chapter-02-ai-development/ai-model-deployment.md) - Uvajanje in upravljanje AI modelov
- **🛠️ Delavnica**: [AI delavnica](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pripravite AI rešitve za AZD
- **🎥 Interaktivni vodič**: [Delavnica gradiva](workshop/README.md) - Učenje v brskalniku z MkDocs * DevContainer okolje
- **📋 Predloge**: [Microsoft Foundry predloge](#featured-microsoft-foundry-templates)
- **📝 Primeri**: [Primeri uvajanja AZD](examples/README.md)

#### Praktične vaje
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo .
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart .
azd init --template agent-openai-python-prompty .
```

**💡 Izhod poglavja**: Uvajanje in konfiguracija AI-podprte chat aplikacije z zmožnostmi RAG

**✅ Validacija uspeha:**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo .
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 Časovna naložba:** 1-2 uri  
**📈 Raven znanja po:** Lahko uvajate AI učeče aplikacije in prepoznate dodatne potrebe za produkcijsko pripravo
**💰 Poznavanje stroškov:** Razumete stroške razvoja 80-150 $/mesec, stroške produkcije 300-3500 $/mesec

#### 💰 Stroškovni premisleki za AI uvajanja

**Razvojno okolje (ocenjeno 80-150 $/mesec):**
- Microsoft Foundry modeli (Plačilo po uporabi): 0-50 $/mesec (glede na uporabo tokenov)
- AI Search (osnovni nivo): 75 $/mesec
- Container Apps (poraba): 0-20 $/mesec
- Shramba (standardna): 1-5 $/mesec

**Produkcijsko okolje (ocenjeno 300-3.500+ $/mesec):**
- Microsoft Foundry modeli (PTU za stalno zmogljivost): 3.000+ $/mesec ALI Plačilo po porabi z veliko količino
- AI Search (standardni nivo): 250 $/mesec
- Container Apps (dedicirano): 50-100 $/mesec
- Application Insights: 5-50 $/mesec
- Shramba (premium): 10-50 $/mesec

**💡 Nasveti za optimizacijo stroškov:**
- Preverite ceno poizvedbe modela in računske kredite; Azure OpenAI ne vključuje univerzalne brezplačne mesečne kvote 50.000 tokenov
- Zaženite `azd down` za brisanje virov, ko niso več potrebni, potem ko pregledate izbrano okolje
- Začnite z obračunom po porabi, PTU nadgradite le za produkcijo
- Uporabite `azd provision --preview` za pregled načrtovane infrastrukture in nato vrednotite stroške z Azure Pricing Calculator
- Omogočite avtomatsko skaliranje: plačajte le za dejansko uporabo

**Spremljanje stroškov:**
```bash
# Inspect planned resources (this does not calculate prices)
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Poglavje 3: Konfiguracija & Avtentikacija
**Predpogoji**: Dokončano Poglavje 1  
**Trajanje**: 45-60 minut  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Konfiguracija in upravljanje okolja
- Najboljše prakse avtentikacije in varnosti
- Imenovanje in organizacija virov

#### Učni viri
- **📖 Konfiguracija**: [Vodnik za konfiguracijo](docs/chapter-03-configuration/configuration.md) - Nastavitev okolja
- **🔐 Varnost**: [Vzorce avtentikacije in upravljane identitete](docs/chapter-03-configuration/authsecurity.md) - Avtentikacijski vzorci
- **📝 Primeri**: [Primer aplikacije z bazo podatkov](examples/database-app/README.md) - Primeri AZD baz podatkov

#### Praktične vaje
- Konfigurirajte več okolij (razvoj, testiranje, produkcija)
- Nastavite avtentikacijo z upravljano identiteto
- Implementirajte konfiguracije specifične za okolje

**💡 Izhod poglavja**: Upravljajte več okolij z ustrezno avtentikacijo in varnostjo

---

### 🏗️ Poglavje 4: Infrastruktura kot koda & Uvajanje
**Predpogoji**: Dokončana poglavja 1-3  
**Trajanje**: 1-1.5 ure  
**Kompleksnost**: ⭐⭐⭐

#### Kaj se boste naučili
- Napredni vzorci uvajanja
- Infrastruktura kot koda z Bicep
- Strategije za dodeljevanje virov

#### Učni viri
- **📖 Uvajanje**: [Vodnik za uvajanje](docs/chapter-04-infrastructure/deployment-guide.md) - Celotni delovni tok
- **🏗️ Provisioning**: [Upravljanje Azure virov](docs/chapter-04-infrastructure/provisioning.md) - Upravljanje virov Azure
- **📝 Primeri**: [Primer Container App](../../examples/container-app) - Uvajanja v zabojnikih

#### Praktične vaje
- Ustvarite lastne predloge Bicep
- Uvajajte večstoritevne aplikacije
- Izvedite strategije modro-zelene uvajanja

**💡 Izhod poglavja**: Uvajanje kompleksnih večstoritevnih aplikacij z uporabo prilagojenih predlog infrastrukturne kode

---

### 🎯 Poglavje 5: Večagentne AI rešitve (napredno)
**Predpogoji**: Dokončana poglavja 1-2  
**Trajanje**: 2-3 ure  
**Kompleksnost**: ⭐⭐⭐⭐

#### Kaj se boste naučili
- Vzorci večagentnih arhitektur
- Orkestracija in koordinacija agentov
- Produkcijsko pripravljena AI uvajanja

#### Učni viri
- **🤖 Predstavljena zasnova**: [Večagentna rešitev za trgovino](examples/retail-scenario.md) - Arhitekturni načrt, ne popolna aplikacija
- **🛠️ ARM predloge**: [Paket ARM predlog](../../examples/retail-multiagent-arm-template) - Okvir infrastrukture; pregled predpogojev in manjkajočih komponent aplikacije
- **📖 Arhitektura**: [Vzorce koordinacije več agentov](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzorce

#### Praktične vaje
```bash
# Inspect the retail infrastructure scaffold before choosing to deploy it
cd examples/retail-multiagent-arm-template
cat README.md

# After an intentional deployment, inspect infrastructure state
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Cilj poglavja**: Razumeti zasnovo večagentnega sistema in prepoznati implementacijska, validacijska in operativna opravila, potrebna poleg okvira infrastrukture

---

### 🔍 Poglavje 6: Predhodno preverjanje in načrtovanje
**Predpogoji**: Dokončano poglavje 4  
**Trajanje**: 1 ura  
**Zapletenost**: ⭐⭐

#### Kaj se boste naučili
- Načrtovanje kapacitet in preverjanje virov
- Strategije izbire SKU
- Predhodni pregledi in avtomatizacija

#### Učni viri
- **📊 Načrtovanje**: [Načrtovanje kapacitet](docs/chapter-06-pre-deployment/capacity-planning.md) - Validacija virov
- **💰 Izbira**: [Izbira SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Stroškovno učinkovite odločitve
- **✅ Validacija**: [Predhodni pregledi](docs/chapter-06-pre-deployment/preflight-checks.md) - Avtomatizirani skripti

#### Praktične vaje
- Zaženite skripte za validacijo kapacitet
- Optimizirajte izbiro SKU za stroške
- Izvedite avtomatizirane predhodne preglede nameščanja

**💡 Cilj poglavja**: Validirati in optimizirati nameščanja pred izvedbo

---

### 🚨 Poglavje 7: Odpravljanje težav in razhroščevanje
**Predpogoji**: Dokončano katerokoli poglavje o nameščanju  
**Trajanje**: 1-1,5 ure  
**Zapletenost**: ⭐⭐

#### Kaj se boste naučili
- Sistematični pristopi k razhroščevanju
- Pogoste težave in rešitve
- Odpravljanje težav specifičnih za AI

#### Učni viri
- **🔧 Pogoste težave**: [Pogoste težave](docs/chapter-07-troubleshooting/common-issues.md) - Pogosta vprašanja in rešitve
- **🕵️ Razhroščevanje**: [Vodnik za razhroščevanje](docs/chapter-07-troubleshooting/debugging.md) - Strategije korak za korakom
- **🤖 Težave AI**: [Odpravljanje težav pri AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Težave z AI storitvami

#### Praktične vaje
- Diagnozira poroke nameščanja
- Rešite težave z avtentikacijo
- Razhroščite povezljivost s storitvijo AI

**💡 Cilj poglavja**: Neodvisno diagnosticirati in rešiti pogoste težave pri nameščanju

---

### 🏢 Poglavje 8: Produkcijski in podjetniški vzorci
**Predpogoji**: Dokončana poglavja 1-4  
**Trajanje**: 2-3 ure  
**Zapletenost**: ⭐⭐⭐⭐

#### Kaj se boste naučili
- Strategije produkcijskega nameščanja
- Vzorci varnosti v podjetju
- Nadzor in optimizacija stroškov

#### Učni viri
- **🏭 Produkcija**: [Najboljše prakse za produkcijski AI](docs/chapter-08-production/production-ai-practices.md) - Podjetniški vzorci
- **📝 Primeri**: [Primer mikrostoritev](../../examples/microservices) - Kompleksne arhitekture
- **📊 Nadzor**: [Integracija Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Nadzor

#### Praktične vaje
- Izvedite podjetniške varnostne vzorce
- Nastavite celovit nadzor
- Nameščajte v produkcijo s primernim upravljanjem

**💡 Cilj poglavja**: Nameščati aplikacije, pripravljene za podjetje, s popolnimi produkcijskimi zmogljivostmi

---

## 🎓 Pregled delavnice: Praktična izkušnja učenja

> **⚠️ STATUS DELAVNICE: Aktivni razvoj**  
> Gradiva delavnice so trenutno v razvoju in izpopolnjevanju. Osnovni moduli delujejo, nekatere napredne odseke še izdelujemo. Aktivno delamo na dokončanju vsebine. [Spremljaj napredek →](workshop/README.md)

### Interaktivna gradiva za delavnico
**Celovito praktično učenje z orodji v brskalniku in vodene vaje**

Naša gradiva ponujajo strukturirano, interaktivno učne izkušnje, ki dopolnjujejo zgoraj navedeni program po poglavjih. Delavnica je zasnovana tako za samostojno kot za vodeno učenje.

#### 🛠️ Značilnosti delavnice
- **Vmesnik v brskalniku**: Popolna delavnica na platformi MkDocs z iskanjem, kopiranjem in temami
- **Integracija GitHub Codespaces**: Namestitev razvojnega okolja z enim klikom
- **Strukturirana učna pot**: 8 vodenih modulov (skupno 3-4 ure)
- **Postopna metodologija**: Uvod → Izbira → Validacija → Razstavljanje → Konfiguracija → Prilagoditev → Čiščenje → Zaključek
- **Interaktivno razvojno okolje DevContainer**: Vnaprej konfigurirana orodja in odvisnosti

#### 📚 Struktura modulov delavnice
Delavnica sledi **8-modulni postopni metodologiji**, ki vas vodi od odkrivanja do mojstrstva nameščanja:

| Modul | Tema | Kaj boste naredili | Trajanje |
|--------|-------|----------------|----------|
| **0. Uvod** | Pregled delavnice | Razumevanje učnih ciljev, predpogojev in strukture delavnice | 15 min |
| **1. Izbira** | Odkritje predlog | Raziskovanje AZD predlog in izbira primerne AI predloge za vaš scenarij | 20 min |
| **2. Validacija** | Nameščanje in preverjanje | Nameščanje predloge z `azd up` in validacija delovanja infrastrukture | 30 min |
| **3. Razstavljanje** | Razumevanje strukture | Uporaba GitHub Copilot za raziskovanje arhitekture predloge, Bicep datotek in organizacije kode | 30 min |
| **4. Konfiguracija** | Podroben pregled azure.yaml | Obvladovanje konfiguracije `azure.yaml`, življenjskih krogov in okoljskih spremenljivk | 30 min |
| **5. Prilagoditev** | Prilagodite sebi | Omogočite AI Search, sledenje, evalvacijo in prilagodite za svoj scenarij | 45 min |
| **6. Čiščenje** | Čiščenje | Varno odstranjevanje virov z uporabo `azd down --purge` | 15 min |
| **7. Zaključek** | Naslednji koraki | Pregled dosežkov, ključnih konceptov in nadaljevanje učenja | 15 min |

**Potek delavnice:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Začetek delavnice
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Učni cilji delavnice
Z dokončanjem delavnice bodo udeleženci:
- **Nameščali produkcijske AI aplikacije**: Uporaba AZD z Microsoft Foundry storitvami
- **Obvladali večagentne arhitekture**: Implementacija usklajenih rešitev z AI agenti
- **Izvedli najboljše prakse varnosti**: Konfiguracija avtentikacije in nadzora dostopa
- **Optimizirali za razširljivost**: Oblikovanje stroškovno učinkovitih in zmogljivih nameščanj
- **Odpravljali težave pri nameščanju**: Neodvisno reševanje pogostih težav

#### 📖 Gradiva delavnice
- **🎥 Interaktivni vodič**: [Gradiva delavnice](workshop/README.md) - Učno okolje v brskalniku
- **📋 Navodila po modulih**:
  - [0. Uvod](workshop/docs/instructions/0-Introduction.md) - Pregled in cilji delavnice
  - [1. Izbira](workshop/docs/instructions/1-Select-AI-Template.md) - Iskanje in izbira AI predlog
  - [2. Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) - Nameščanje in preverjanje predlog
  - [3. Razstavljanje](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Raziskovanje arhitekture predlog
  - [4. Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) - Obvladovanje azure.yaml
  - [5. Prilagoditev](workshop/docs/instructions/5-Customize-AI-Template.md) - Prilagoditev za vaš scenarij
  - [6. Čiščenje](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Čiščenje virov
  - [7. Zaključek](workshop/docs/instructions/7-Wrap-up.md) - Pregled in nadaljnji koraki
- **🛠️ AI laboratorij delavnice**: [AI laboratorij delavnice](docs/chapter-02-ai-development/ai-workshop-lab.md) - Vaje osredotočene na AI
- **💡 Hitri začetek**: [Vodnik za nastavitev delavnice](workshop/README.md#browser-based-guide) - Konfiguracija okolja

**Popolno za**: Korporativno usposabljanje, univerzitetne tečaje, samostojno učenje in razvijalske bootcampe.

---

## 📖 Podroben vpogled: Zmožnosti AZD

Poleg osnov AZD ponuja zmogljive funkcije za produkcijska nameščanja:

- **Nameščanja na podlagi predlog** - Uporaba vnaprej pripravljenih predlog za pogoste vzorce aplikacij
- **Infrastruktura kot koda** - Upravljanje Azure virov z Bicep ali Terraform  
- **Integrirani delovni procesi** - Brezhibno zagotavljanje, nameščanje in nadzor aplikacij
- **Prijazno razvijalcem** - Optimizirano za produktivnost in izkušnjo razvijalca

### **AZD + Microsoft Foundry: Popolno za AI nameščanja**

**Zakaj AZD za AI rešitve?** AZD naslavlja glavne izzive, s katerimi se soočajo razvijalci AI:

- **Predloge pripravljene za AI** - Vnaprej konfigurirane predloge za Microsoft Foundry modele, Azure AI storitve in ML obremenitve
- **Varen AI deployment** - Vgrajeni varnostni vzorci za AI storitve, API ključe in končne točke modelov  
- **Produkčijski AI vzorci** - Najboljše prakse za skalabilna, stroškovno učinkovita AI nameščanja
- **Celoviti AI delovni procesi** - Od razvoja modela do produkcijskega nameščanja z ustreznim nadzorom
- **Optimizacija stroškov** - Pametno razporejanje virov in strategije skaliranja za AI obremenitve
- **Integracija Microsoft Foundry** - Brezhibna povezava do kataloga modelov in končnih točk Microsoft Foundry

---

## 🎯 Knjižnica predlog in primerov

### Izpostavljeno: Microsoft Foundry predloge
**Začnite tukaj, če nameščate AI aplikacije!**

> **Opomba:** Te predloge prikazujejo različne AI vzorce. Nekatere so zunanje Azure vzorci, druge lokalne implementacije.

| Predloga | Poglavje | Zapletenost | Storitve | Tip |
|----------|---------|------------|----------|------|
| [**Začnite pogovor z AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavje 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Zunanja |
| [**Začnite z AI agenti**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavje 2 | ⭐⭐ | Foundry agenti + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Zunanja |
| [**Demonstracija Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavje 2 | ⭐⭐ | Azure OpenAI + Azure AI Search + Container Apps (privzeto) + Storage | Zunanja |
| [**OpenAI Chat App Hitri začetek**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavje 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Zunanja |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavje 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Zunanja |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Poglavje 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Zunanja |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Poglavje 5 | ⭐⭐⭐⭐ | Predlagana arhitektura in infrastruktura; zahteva implementacijo aplikacije | **Lokalni načrt** |

### Izpostavljeno: Popolni učni scenariji
**Aplikacijske predloge pripravljene za produkcijo, povezane z učnimi poglavji**

| Predloga | Učno poglavje | Zapletenost | Ključna učenja |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavje 2 | ⭐ | Osnovni vzorci AI nameščanja |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavje 2 | ⭐⭐ | Implementacija RAG z Azure AI Search |
| [**get-started-with-ai-agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavje 2 | ⭐⭐ | Pogovor z agenti in preizkusi specifičnih primerov |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavje 5 | ⭐⭐⭐ | Ogrodje agentov in klic funkcij |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Poglavje 8 | ⭐⭐⭐ | Podjetniška AI orkestracija |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Poglavje 5 | ⭐⭐⭐⭐ | Večagentna arhitektura s strankami in agenti inventarja |

### Učenje po vrsti primera

> **📌 Lokalni vs. Zunanji primeri:**  
> **Lokalni primeri** (v tem repozitoriju) = Preverite README datoteko primera za status implementacije in predpogoje
> **Zunanji primeri** (Azure Samples) = Klonirajte iz povezanih repozitorijev

#### Lokalni primeri (pripravljeni za uporabo)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Načrt arhitekture z ARM infrastrukturo
  - Predlagane vloge za agente stranke in inventarja
  - Potreben je nadzor, evalvacija in koda aplikacije
  - Samo zagotavljanje virov ne ustvari delujoče maloprodajne aplikacije

#### Lokalni primeri - aplikacije z vsebniki (poglavja 2-5)
**Celoviti primeri nameščanja vsebnikov v tem repozitoriju:**
- [**Primeri aplikacij z vsebniki**](examples/container-app/README.md) - Popoln vodič za nameščanje vsebnikov
  - [Preprost Flask API](../../examples/container-app/simple-flask-api) - Osnovni REST API s skaliranjem na nič
  - [Arhitektura mikrostoritev](../../examples/container-app/microservices) - Dva-storitveni učni primer; produkcijska utrditev je dodatno delo
  - Hitri začetek, produkcijski in napredni vzorci nameščanja
  - Nasveti za nadzor, varnost in optimizacijo stroškov

#### Zunanji primeri - preproste aplikacije (poglavja 1-2)
**Klonirajte te Azure vzorčne repozitorije za začetek:**
- [Preprosta spletna aplikacija - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Osnovni vzorci nameščanja
- [Statična spletna stran - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Nameščanje statične vsebine
- [Aplikacija z vsebnikom - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Nameščanje REST API

#### Zunanji primeri - integracija podatkovnih baz (poglavja 3-4)  
- [Aplikacija za bazo podatkov - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzori povezljivosti z bazo podatkov
- [Funkcije + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Brezstrežni potek podatkov

#### Zunanji primeri - Napredni vzorci (poglavja 4-8)
- [Java mikroservisi](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arhitekture z več storitvami
- [Naloge Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Ozadinsko procesiranje  
- [Poslovni MLOps potek](https://github.com/Azure/mlops-v2) - Referenčni vzorci MLOps; ni predloga, ki bi ga lahko takoj uporabili v AZD

### Zbirke zunanjih predlog
- [**Uradna galerija predlog AZD**](https://azure.github.io/awesome-azd/) - Izbrana zbirka uradnih in skupnostnih predlog
- [**Predloge Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentacija predlog Microsoft Learn
- [**Mapa primerov**](examples/README.md) - Lokalne učne primere z podrobnimi razlagami

---

## 📚 Učni viri in reference

### Hitre reference
- [**Kratka lista ukazov**](resources/cheat-sheet.md) - Osnovni azd ukazi, urejeni po poglavjih
- [**Slišnik**](resources/glossary.md) - Terminologija Azure in azd  
- [**Pogosta vprašanja**](resources/faq.md) - Pogosta vprašanja, urejena po učnih poglavjih
- [**Učni vodič**](resources/study-guide.md) - Celovite praktične vaje

### Delavnice z vajo
- [**Delavnica AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Naredite svoje AI rešitve, primerne za uvajanje v AZD (2-3 ure)
- [**Interaktivna delavnica**](workshop/README.md) - 8 modulov vodenih vaj z MkDocs in GitHub Codespaces
  - Sledi: Uvod → Izbira → Preverjanje → Razgradnja → Konfiguracija → Prilagoditev → Odstranitev → Povzetek

### Zunanji učni viri
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Center za arhitekturo Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulator cen Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stanje storitev Azure](https://status.azure.com/)

### Veščine AI agentov za vaš urejevalnik
- [**Microsoft Azure veščine na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 odprtih veščin agentov za Azure AI, Foundry, uvajanje, diagnostiko, optimizacijo stroškov in več. Namestite jih v GitHub Copilot, Cursor, Claude Code ali katerikoli podprti agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Hiter vodič za odpravljanje težav

**Pogoste težave, s katerimi se srečujejo začetniki, in takojšnje rešitve:**

<details>
<summary><strong>❌ "azd: ukaz ni najden"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "Naročnina ni najdena" ali "Naročnina ni nastavljena"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" ali "Presežena kvota"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" ne uspe polovico poti</strong></summary>

```bash
# Option 1: Inspect the error and retry after correcting its cause
azd show
azd up --debug

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Avtentikacija ni uspela" ali "Žeton je potekel"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "Vir že obstaja" ali konflikti imen</strong></summary>

```bash
# Inspect the conflicting resource before changing or deleting anything.
# For an isolated new deployment, create a separate environment:
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Uvajanje predloge traja predolgo</strong></summary>

**Normalni časi čakanja:**
- Preprosta spletna aplikacija: 5-10 minut
- Aplikacija z bazo podatkov: 10-15 minut
- AI aplikacije: 15-25 minut (probavljanje OpenAI je počasno)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Dovoljenje zavrnjeno" ali "Prepovedano"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ Ne najdem URL-ja nameščene aplikacije</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Celoviti viri za odpravljanje težav

- **Vodič za pogoste težave:** [Podrobne rešitve](docs/chapter-07-troubleshooting/common-issues.md)
- **Težave, specifične za AI:** [Odpravljanje težav AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Vodič za odpravljanje napak:** [Korak za korakom odpravljanje napak](docs/chapter-07-troubleshooting/debugging.md)
- **Poišči pomoč:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Zaključek tečaja in certifikacija

### Sledenje napredku
Spremljajte svoj učni napredek po posameznih poglavjih:

- [ ] **Poglavje 1**: Osnove in hitri začetek ✅
- [ ] **Poglavje 2**: AI-prvi razvoj ✅  
- [ ] **Poglavje 3**: Konfiguracija in avtentikacija ✅
- [ ] **Poglavje 4**: Infrastruktura kot koda in uvajanje ✅
- [ ] **Poglavje 5**: Večagentne AI rešitve ✅
- [ ] **Poglavje 6**: Preduvajanje in načrtovanje ✅
- [ ] **Poglavje 7**: Odpravljanje težav in razhroščevanje ✅
- [ ] **Poglavje 8**: Produkcijski in poslovni vzorci ✅

### Preverjanje učenja
Po zaključku vsakega poglavja preverite svoje znanje z:
1. **Praktična vaja**: Izvedite praktično uvajanje poglavja
2. **Preverjanje znanja**: Preglejte FAQ za vaše poglavje
3. **Skupnostna razprava**: Delite svoje izkušnje v Azure Discord
4. **Naslednje poglavje**: Nadaljujte na naslednjo stopnjo zahtevnosti

### Prednosti zaključka tečaja
Po zaključku vseh poglavij boste imeli:
- **Izkušnje iz prakse**: Uvajali ste prave AI aplikacije v Azure
- **Poklicne veščine**: Kompetence za uvajanje v proizvodno okolje  
- **Prepoznavnost v skupnosti**: Aktivni član Azure razvijalske skupnosti
- **Napredovanje v karieri**: Zaželeno znanje AZD in uvajanja AI

---

## 🤝 Skupnost in podpora

### Poišči pomoč in podporo
- **Tehnične težave**: [Prijavite napake in zahtevajte funkcije](https://github.com/microsoft/azd-for-beginners/issues)
- **Vprašanja o učenju**: [Microsoft Azure Discord skupnost](https://discord.gg/microsoft-azure) in [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoč pri AI**: Pridružite se [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Uradna dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Vpogledi iz skupnosti Microsoft Foundry Discord

**Teme, o katerih razpravlja skupnost:**
- Uvajanje z več storitvami, upravljanje poverilnic in priprava na produkcijo
- AI-specifični predlogi, vodiči za odpravljanje težav in dobre prakse

**Pridruži se naši skupnosti, da:**
- Delite svoje izkušnje z AZD + AI in dobite pomoč
- Dostopate do zgodnjih predogledov novih AI predlog
- Prispevate k najboljšim praksam uvajanja AI
- Vplivate na prihodnji razvoj AI + AZD funkcij

### Prispevanje k tečaju
Veselimo se vaših prispevkov! Prosimo, preberite naš [Vodič za prispevke](CONTRIBUTING.md) za podrobnosti o:
- **Izboljšave vsebin**: Izboljšajte obstoječa poglavja in primere
- **Novi primeri**: Dodajte resnične scenarije in predloge  
- **Prevajanje**: Pomagajte ohranjati večjezično podporo
- **Poročila o napakah**: Izboljšajte natančnost in jasnost
- **Skupnostni standardi**: Upoštevajte naše vključujoče smernice skupnosti

---

## 📄 Informacije o tečaju

### Licenca
Ta projekt je licenciran pod licenco MIT - podrobnosti si oglejte v datoteki [LICENSE](../../LICENSE).

### Sorodni učni viri Microsoft Learn

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
 
### Serija Generativni AI
[![Generativni AI za začetnike](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Osnovno učenje
[![ML za začetnike](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science za začetnike](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI za začetnike](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kibernetska varnost za začetnike](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Spletni razvoj za začetnike](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT za začetnike](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR razvoj za začetnike](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serija Copilot
[![Copilot za AI sočasen razvoj](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot za C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot pustolovščina](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigacija po tečaju

**🚀 Pripravljeni za začetek učenja?**

**Začetniki**: Začnite z [Poglavjem 1: Osnove in hiter začetek](#-chapter-1-foundation--quick-start)  
**Razvijalci AI**: Preskočite na [Poglavje 2: AI-prvi razvoj](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Izkušeni razvijalci**: Začnite z [Poglavjem 3: Konfiguracija in avtentikacija](#️-chapter-3-configuration--authentication)

**Naslednji koraki**: [Začni poglavje 1 - Osnove AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->