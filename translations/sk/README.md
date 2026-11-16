# AZD pre začiatočníkov: Štruktúrovaná cesta učenia

![AZD-pre-začiatočníkov](../../translated_images/sk/azdbeginners.5527441dd9f74068.webp) 

[![GitHub sledovatelia](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://github.com/microsoft/AZD-for-beginners)
[![GitHub fork](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub hviezdy](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://github.com/microsoft/AZD-for-beginners)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatizované preklady (vždy aktuálne)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabčina](../ar/README.md) | [Bengálčina](../bn/README.md) | [Bulharčina](../bg/README.md) | [Barmčina (Myanmar)](../my/README.md) | [Čínština (zjednodušená)](../zh-CN/README.md) | [Čínština (tradičná, Hong Kong)](../zh-HK/README.md) | [Čínština (tradičná, Macau)](../zh-MO/README.md) | [Čínština (tradičná, Taiwan)](../zh-TW/README.md) | [Chorvátčina](../hr/README.md) | [Čeština](../cs/README.md) | [Dánčina](../da/README.md) | [Holandčina](../nl/README.md) | [Estónčina](../et/README.md) | [Fínčina](../fi/README.md) | [Francúzština](../fr/README.md) | [Nemčina](../de/README.md) | [Gréčtina](../el/README.md) | [Hebrejčina](../he/README.md) | [Hindčina](../hi/README.md) | [Maďarčina](../hu/README.md) | [Indonézština](../id/README.md) | [Taliančina](../it/README.md) | [Japončina](../ja/README.md) | [Kannadčina](../kn/README.md) | [Khmerčina](../km/README.md) | [Kórejčina](../ko/README.md) | [Litovčina](../lt/README.md) | [Malajčina](../ms/README.md) | [Malajálamčina](../ml/README.md) | [Maráthčina](../mr/README.md) | [Nepálčina](../ne/README.md) | [Nigérijská pidgin angličtina](../pcm/README.md) | [Nórčina](../no/README.md) | [Perzština (Farsi)](../fa/README.md) | [Poľština](../pl/README.md) | [Portugalčina (Brazília)](../pt-BR/README.md) | [Portugalčina (Portugalsko)](../pt-PT/README.md) | [Pandžábčina (Gurmukhi)](../pa/README.md) | [Rumunčina](../ro/README.md) | [Ruština](../ru/README.md) | [Srbčina (cyrilika)](../sr/README.md) | [Slovenčina](./README.md) | [Slovinčina](../sl/README.md) | [Španielčina](../es/README.md) | [Svahilčina](../sw/README.md) | [Švédčina](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamilčina](../ta/README.md) | [Telugčina](../te/README.md) | [Thajčina](../th/README.md) | [Turečtina](../tr/README.md) | [Ukrajinčina](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamčina](../vi/README.md)

> **Radšej klonovať lokálne?**
>
> Tento repozitár obsahuje preklady do viac ako 50 jazykov, čo výrazne zväčšuje veľkosť sťahovania. Ak chcete klonovať bez prekladov, použite sparse checkout:
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
> Toto vám poskytne všetko potrebné na dokončenie kurzu s oveľa rýchlejším sťahovaním.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Čo je dnes nové v azd

> 📌 **Recenzia vydania AI CLI (2026-11-04):** Usmernenie bolo overené podľa vydanej dokumentácie/zdrojov **`azd 1.37.2`**, **agents `1.0.0-beta.23`** a **evaluations `1.0.0-beta.2`**. Použite `azd >= 1.37.0` pre kombinovaný pracovný tok. Spustite `azd version` a [aktualizujte základný CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) pred inštaláciou rozšírení. Pozrite si [zmeny a opravy vo vydaní](docs/chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Toto nie je živá validácia nasadenia celého kurzu.

Azure Developer CLI podporuje mnoho typov aplikácií, vrátane webových aplikácií, API a AI agentov, prostredníctvom podporovaných hostiteľov, šablón a rozšírení.

Toto to znamená pre vás:

- **AI agenti sú teraz prvotriedne zaťaženia azd.** Môžete inicializovať, nasadzovať a spravovať projekty AI agentov pomocou toho istého pracovného toku `azd init` → `azd up`, ktorý už poznáte.
- **Životný cyklus agenta cez dve rozšírenia.** Použite `azure.ai.agents` na inicializáciu, vyvolanie, optimalizáciu a vyradenie agentov. Inštalujte **`azure.ai.evaluations`** samostatne pre `azd ai eval init`, `generate` a `run start`. Agent beta.22 nahradil starý pracovný tok hodnotenia a zmenil konfiguráciu optimalizácie; postupujte podľa [sprievodcu migráciou](docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks).
- **Viac AI stavebných blokov.** Nové preview rozšírenia—`azure.ai.skills` a `azure.ai.connections`—umožňujú spravovať znovupoužiteľné agentné zručnosti a Foundry pripojenia priamo v azd.
- **Integrácia Microsoft Foundry** prináša nasadenie modelov, hosting agentov a konfiguráciu AI služieb priamo do ekosystému azd šablón.
- **Plynulejšie každodenné základy.** Nedávne vydania spravili `azd init` idempotentným (bezpečné opakované spustenie), automaticky vyprázdňujú neplatné tokeny pomocou `azd auth login` a pridali priateľský `azd tool` prvý sprievodca spustením.
- **Základný pracovný tok sa nezmenil.** Či už nasadzujete aplikáciu todo, mikroslužbu alebo multi-agentné AI riešenie, príkazy sú rovnaké.

> **Poznámka pre používateľov Aspire:** Microsoft teraz produkt jednoducho nazýva **Aspire** (predtým ".NET Aspire"). Podpora azd pre Aspire je nezmenená—zmenil sa len názov.

Ak ste azd už používali, podpora AI je prirodzené rozšírenie—nie samostatný nástroj alebo pokročilý kurz. Ak začínate odznova, naučíte sa jeden pracovný tok, ktorý funguje pre všetko.

---

## 🚀 Čo je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je priateľský príkazový nástroj pre vývojárov, ktorý uľahčuje nasadzovanie aplikácií do Azure. Namiesto manuálneho vytvárania a pripájania desiatok Azure zdrojov môžete nasadiť celé aplikácie jedným príkazom.

### Tajomstvo `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

Šablóna poskytuje konfiguráciu aplikácie a infraštruktúry. Úspešné nasadenie stále vyžaduje podporované služby/modely, dostatočnú kvótu a povolenia, správne vstupy a overenie nasadenej aplikácie. `azd up` automaticky neurobí šablónu bezpečnou, v súlade s normami alebo pripravenou na produkciu.

---

## ❓ Azure Developer CLI vs Azure CLI: Aký je rozdiel?

Toto je najčastejšia otázka začiatočníkov. Tu je jednoduchá odpoveď:

| Funkcia | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Účel** | Spravovať jednotlivé Azure zdroje | Nasadzovať kompletné aplikácie |
| **Prístup** | Zameraný na infraštruktúru | Zameraný na aplikácie |
| **Príklad** | `az webapp create --name myapp...` | `azd up` |
| **Náročnosť učenia** | Musíte poznať Azure služby | Stačí poznať svoju aplikáciu |
| **Najlepšie pre** | DevOps, infraštruktúru | Vývojárov, prototypovanie |

### Jednoduchá analógia

- **Azure CLI** je ako mať všetky nástroje na stavbu domu – kladivá, píly, klince. Môžete postaviť čokoľvek, ale musíte poznať stavebníctvo.
- **Azure Developer CLI** je ako najať stavebného dodávateľa – popíšete, čo chcete, a oni postavia.

### Kedy použiť ktorý

| Scenár | Použite tento |
|----------|----------|
| "Chcem rýchlo nasadiť svoju webovú aplikáciu" | `azd up` |
| "Potrebujem vytvoriť iba účet úložiska" | `az storage account create` |
| "Staviam plnú AI aplikáciu" | `azd init --template azure-search-openai-demo` |
| "Potrebujem debugovať konkrétny Azure zdroj" | `az resource show` |
| "Chcem nasadiť do môjho nakonfigurovaného produkčného prostredia" | Preskúmajte konfiguráciu, prístup, náklady a prevádzkové kontroly pred `azd up --environment production` |

### Spolu spolupracujú!

AZD a Azure CLI majú samostatné overovanie a konfiguráciu. Použite `azd auth login` pre AZD, a `az login` keď háčik alebo diagnostický príkaz explicitne vyžaduje Azure CLI. Môžete použiť obidva:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Nájdite šablóny v Awesome AZD

Nezačínajte od nuly! **Awesome AZD** je komunitná kolekcia pripravených na nasadenie šablón:

| Zdroj | Popis |
|----------|-------------|
| 🔗 [**Awesome AZD galéria**](https://azure.github.io/awesome-azd/) | Prezerajte 200+ šablón s nasadením jedným kliknutím |
| 🔗 [**Odošlite šablónu**](https://github.com/Azure/awesome-azd/issues) | Prispievajte svojou vlastnou šablónou komunitám |
| 🔗 [**GitHub repozitár**](https://github.com/Azure/awesome-azd) | Oceňte hviezdu a preskúmajte zdrojový kód |

### Populárne AI šablóny z Awesome AZD

Vyberte jednu šablónu v jej vlastnom prázdnom adresári; nižšie uvedené príkazy sú alternatívy. Trailing `.` inicializuje tento adresár.

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo .

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart .

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents .
```

---

## 🎯 Začíname v 3 krokoch

Pred začiatkom sa uistite, že váš stroj je pripravený na šablónu, ktorú chcete nasadiť:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ak akákoľvek požadovaná kontrola zlyhá, najprv ju opravte a potom pokračujte v rýchlom začiatku.

### Krok 1: Inštalácia AZD (2 minúty)

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

### Krok 2: Overenie pre AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Ak si nie ste istí, ktorý potrebujete, postupujte podľa úplného nastavenia v [Inštalácia & nastavenie](docs/chapter-01-foundation/installation.md#authentication-setup).

### Krok 3: Nasadte svoju prvú aplikáciu

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo .

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Hotovo!** Vaša aplikácia je teraz spustená na Azure.

### Úklid (nezabudnite!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Ako používať tento kurz

Tento kurz je navrhnutý pre **postupné učenie** - začnite tam, kde vám je príjemne a postupujte ďalej:

| Vaše skúsenosti | Začnite tu |
|-----------------|------------|
| **Nováčik v Azure** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Poznáte Azure, nováčik v AZD** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Chcete nasadiť AI aplikácie** | [Kapitola 2: Vývoj orientovaný na AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Chcete praktickú skúsenosť** | [🎓 Interaktívny workshop](workshop/README.md) - 3-4 hodinový riadený laboratórium |
| **Potrebujete produkčné vzory** | [Kapitola 8: Produkcia & podnikanie](#-chapter-8-production--enterprise-patterns) |

### Rýchle nastavenie

1. **Za fork tohto repozitára**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonujte**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Získajte pomoc**: [Azure Discord komunita](https://discord.com/invite/ByRwuEEgH4)

> **Radšej klonovať lokálne?**

> Tento repozitár obsahuje preklady do viac ako 50 jazykov, čo výrazne zväčšuje veľkosť sťahovania. Ak chcete klonovať bez prekladov, použite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Toto vám poskytne všetko potrebné na dokončenie kurzu s oveľa rýchlejším sťahovaním.


## Prehľad kurzu

Ovládnite Azure Developer CLI (azd) prostredníctvom štruktúrovaných kapitol určených na postupné učenie. **Špeciálny dôraz na nasadzovanie AI aplikácií s integráciou Microsoft Foundry.**

### Prečo je tento kurz nevyhnutný pre moderných vývojárov

Vývojári nasadzujúci AI záťaže bežne potrebujú usmernenie v:
- Komplexných viacservisných AI architektúrach
- Najlepších postupoch pre produkčné nasadzovanie AI  
- Integrácii a konfigurácii Azure AI služieb
- Optimalizácii nákladov na AI záťaže
- Riešení problémov špecifických pre nasadzovanie AI

### Výukové ciele

Úspešným absolvovaním tohto štruktúrovaného kurzu budete:
- **Ovládať základy AZD**: Základné koncepty, inštalácia a konfigurácia
- **Nasadzovať AI aplikácie**: Používať AZD s Microsoft Foundry službami
- **Implementovať infrastruktúru ako kód**: Spravovať Azure zdroje pomocou Bicep šablón
- **Riešiť problémy nasadení**: Odstraňovať bežné chyby a ladit problémy
- **Optimalizovať pre produkciu**: Bezpečnosť, škálovanie, monitorovanie a manažment nákladov
- **Stavať viacagentové riešenia**: Nasadzovať komplexné AI architektúry

## Pred začatím: Účty, prístup a predpoklady

Pred začatím prvej kapitoly sa uistite, že máte nasledovné. Inštalačné kroky v tejto príručke predpokladajú, že tieto základy sú už vyriešené.

- **Azure predplatné**: Môžete použiť existujúce predplatné z práce alebo vlastný účet, alebo vytvoriť si [bezplatný skúšobný účet](https://aka.ms/azurefreetrial) na začatie.
- **Povolenie na vytváranie Azure zdrojov**: Pre väčšinu cvičení by ste mali mať minimálne prístup **Prispievateľa** na cieľovom predplatnom alebo skupine zdrojov. Niektoré kapitoly môžu tiež predpokladať, že môžete vytvárať skupiny zdrojov, spravované identity a RBAC priradenia.
- [**GitHub účet**](https://github.com): Tento je užitočný pre forkovanie repozitára, sledovanie vlastných zmien a použitie GitHub Codespaces pre workshop.
- **Požiadavky na runtime šablón**: Niektoré šablóny vyžadujú lokálne nástroje ako Node.js, Python, Java alebo Docker. Pred začatím spustite validátor nastavenia, aby ste čoskoro odhalili chýbajúce nástroje.
- **Základná znalosť terminálu**: Nemusíte byť expert, ale mali by ste byť pohodlní s príkazmi ako `git clone`, `azd auth login` a `azd up`.

> **Pracujete v podnikateľskom predplatnom?**
> Ak vaše Azure prostredie spravuje administrátor, vopred si overte, či môžete nasadzovať zdroje v predplatnom alebo skupine zdrojov, ktoré plánujete používať. Ak nie, požiadajte o sandbox predplatné alebo prístup prispievateľa pred začatím.

> **Ste nový v Azure?**
> Začnite s vlastným Azure skúšobným alebo platbou podľa použitia na https://aka.ms/azurefreetrial, aby ste mohli cvičenia dokončiť od začiatku do konca bez čakania na schválenia na úrovni tenanta.

## 🗺️ Mapa kurzu: Rýchla navigácia podľa kapitol

Každá kapitola má vyhradený README s výučbovými cieľmi, rýchlym štartom a cvičeniami:

| Kapitola | Téma | Lekcie | Dĺžka | Zložitosť |
|---------|-------|---------|----------|------------|
| **[Kap 1: Základy](docs/chapter-01-foundation/README.md)** | Začíname | [Základy AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Inštalácia](docs/chapter-01-foundation/installation.md) &#124; [Prvý projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap 2: AI Vývoj](docs/chapter-02-ai-development/README.md)** | AI-prvé aplikácie | [Integrácia Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agentí](docs/chapter-02-ai-development/agents.md) &#124; [Nasadenie modelu](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hod | ⭐⭐ |
| **[Kap 3: Konfigurácia](docs/chapter-03-configuration/README.md)** | Autentifikácia & Bezpečnosť | [Konfigurácia](docs/chapter-03-configuration/configuration.md) &#124; [Autentifikácia & Bezpečnosť](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap 4: Infrastrukturá](docs/chapter-04-infrastructure/README.md)** | IaC & Nasadenie | [Sprievodca nasadením](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hod | ⭐⭐⭐ |
| **[Kap 5: Multiagent](docs/chapter-05-multi-agent/README.md)** | AI Agent Riešenia | [Scenár Retail](examples/retail-scenario.md) &#124; [Koordinačné vzory](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hod | ⭐⭐⭐⭐ |
| **[Kap 6: Pred nasadením](docs/chapter-06-pre-deployment/README.md)** | Plánovanie & Validácia | [Preflight kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Plánovanie kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Výber SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hod | ⭐⭐ |
| **[Kap 7: Riešenie problémov](docs/chapter-07-troubleshooting/README.md)** | Ladovanie & Oprava | [Bežné problémy](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Ladovanie](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problémy](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hod | ⭐⭐ |
| **[Kap 8: Produkcia](docs/chapter-08-production/README.md)** | Podnikové vzory | [Produkčné postupy](docs/chapter-08-production/production-ai-practices.md) | 2-3 hod | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktická laboratórium | [Úvod](workshop/docs/instructions/0-Introduction.md) &#124; [Výber](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validácia](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deštrukcia](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurácia](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prispôsobenie](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Demontáž](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zhrnutie](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hod | ⭐⭐ |

**Celková dĺžka kurzu:** ~10-14 hodín | **Postup zručností:** Začiatočník → Pripravený na produkciu

---

## 📚 Výukové kapitoly

*Vyberte si svoju cestu učenia podľa úrovne skúseností a cieľov*

### 🚀 Kapitola 1: Základy a rýchly štart
**Predpoklady**: Azure predplatné, základné znalosti príkazového riadku  
**Dĺžka**: 30-45 minút  
**Zložitosť**: ⭐

#### Čo sa naučíte
- Pochopenie základov Azure Developer CLI
- Inštalácia AZD na vašej platforme
- Prvé úspešné nasadenie

#### Výukové zdroje
- **🎯 Začnite tu**: [Čo je Azure Developer CLI?](#-what-is-azure-developer-cli-azd)
- **📖 Teória**: [Základy AZD](docs/chapter-01-foundation/azd-basics.md) - Základné koncepty a terminológia
- **⚙️ Nastavenie**: [Inštalácia & Nastavenie](docs/chapter-01-foundation/installation.md) - Platformovo špecifické návody
- **🛠️ Prakticky**: [Váš prvý projekt](docs/chapter-01-foundation/first-project.md) - Návod krok za krokom
- **📋 Rýchly prehľad**: [Abeceda príkazov](resources/cheat-sheet.md)

#### Praktické cvičenia
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo .
azd up
```

**💡 Výsledok kapitoly**: Úspešne nasadiť jednoduchú webovú aplikáciu do Azure pomocou AZD

**✅ Overenie úspechu:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Časová investícia:** 30-45 minút  
**📈 Úroveň zručností po:** Samostatné nasadzovanie základných aplikácií

---

### 🤖 Kapitola 2: Vývoj AI-prvých aplikácií (Odporúčané pre AI vývojárov)
**Predpoklady**: Dokončená Kapitola 1  
**Dĺžka**: 1-2 hodiny  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Integrácia Microsoft Foundry s AZD
- Nasadzovanie AI poháňaných aplikácií
- Pochopenie konfigurácií AI služieb

#### Výukové zdroje
- **🎯 Začnite tu**: [Integrácia Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agenti**: [Sprievodca AI agentmi](docs/chapter-02-ai-development/agents.md) - Nasadzovanie inteligentných agentov s AZD
- **📖 Vzory**: [Nasadenie AI modelu](docs/chapter-02-ai-development/ai-model-deployment.md) - Nasadzovanie a správa AI modelov
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pripravte svoje AI riešenia na AZD
- **🎥 Interaktívny sprievodca**: [Materialy Workshopu](workshop/README.md) - Prehliadačovo založené učenie s MkDocs * DevContainer prostredie
- **📋 Šablóny**: [Microsoft Foundry šablóny](#featured-microsoft-foundry-templates)
- **📝 Príklady**: [Príklady nasadenia AZD](examples/README.md)

#### Praktické cvičenia
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo .
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart .
azd init --template agent-openai-python-prompty .
```

**💡 Výsledok kapitoly**: Nasadiť a nakonfigurovať AI poháňanú chat aplikáciu s RAG schopnosťami

**✅ Overenie úspechu:**
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

**📊 Časová investícia:** 1-2 hodiny  
**📈 Úroveň zručností po:** Viete nasadzovať AI učenie aplikácií a identifikovať ďalšie požiadavky na pripravenosť do produkcie
**💰 Povedomie o nákladoch:** Rozumiete 80-150 $/mesiac nákladom na vývoj, 300-3500 $/mesiac produkčným nákladom

#### 💰 Úvahy o nákladoch na AI nasadenia

**Vývojové prostredie (odhad 80-150 $/mesiac):**
- Microsoft Foundry modely (Platba podľa použitia): 0-50 $/mesiac (podľa použitia tokenov)
- AI Search (základná úroveň): 75 $/mesiac
- Container Apps (Spotreba): 0-20 $/mesiac
- Úložisko (štandardné): 1-5 $/mesiac

**Produkčné prostredie (odhad 300-3 500+ $/mesiac):**
- Microsoft Foundry modely (PTU pre konzistentný výkon): 3 000+ $/mesiac ALEBO platba podľa použitia pri vysokom objeme
- AI Search (štandardná úroveň): 250 $/mesiac
- Container Apps (vyhradené): 50-100 $/mesiac
- Application Insights: 5-50 $/mesiac
- Úložisko (prémiové): 10-50 $/mesiac

**💡 Tipy na optimalizáciu nákladov:**
- Skontrolujte ceny modelových inferencií a kredity na účte; Azure OpenAI neobsahuje univerzálny mesačný bezplatný limit 50 000 tokenov
- Spustite `azd down` na odstránenie zdrojov, keď už nie sú potrebné, po prekontrolovaní vybraného prostredia
- Začnite s účtovaním podľa spotreby, PTU použite len pre produkciu
- Použite `azd provision --preview` na kontrolu plánovanej infraštruktúry, potom ohodnoťte zdroje pomocou Azure Pricing Calculator
- Aktivujte automatické škálovanie: platíte len za skutočné využitie

**Monitorovanie nákladov:**
```bash
# Inspect planned resources (this does not calculate prices)
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitola 3: Konfigurácia a autentifikácia
**Predpoklady**: Dokončená Kapitola 1  
**Dĺžka**: 45-60 minút  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Konfiguráciu a správu prostredia
- Najlepšie postupy autentifikácie a bezpečnosti
- Pomenovanie a organizáciu zdrojov

#### Výukové zdroje
- **📖 Konfigurácia**: [Sprievodca konfiguráciou](docs/chapter-03-configuration/configuration.md) - Nastavenie prostredia
- **🔐 Bezpečnosť**: [Vzory autentifikácie a spravovanej identity](docs/chapter-03-configuration/authsecurity.md) - Vzory autentifikácie
- **📝 Príklady**: [Príklad databázovej aplikácie](examples/database-app/README.md) - AZD databázové príklady

#### Praktické cvičenia
- Konfigurujte viacero prostredí (vývoj, staging, produkcia)
- Nastavte autentifikáciu spravovanej identity
- Implementujte konfigurácie špecifické pre prostredie

**💡 Výsledok kapitoly**: Spravovať viaceré prostredia s riadnou autentifikáciou a bezpečnosťou

---

### 🏗️ Kapitola 4: Infrastruktúra ako kód a nasadenie
**Predpoklady**: Dokončené kapitoly 1-3  
**Dĺžka**: 1-1.5 hod  
**Zložitosť**: ⭐⭐⭐

#### Čo sa naučíte
- Pokročilé vzory nasadzovania
- Infrastrukturálny kód s Bicep
- Stratégie provisioning zdrojov

#### Výukové zdroje
- **📖 Nasadenie**: [Sprievodca nasadením](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletné pracovné postupy
- **🏗️ Provisioning**: [Provisioning zdrojov](docs/chapter-04-infrastructure/provisioning.md) - Správa Azure zdrojov
- **📝 Príklady**: [Príklad Container App](../../examples/container-app) - Containerizované nasadenia

#### Praktické cvičenia
- Vytvorte vlastné Bicep šablóny
- Nasadte viacservisné aplikácie
- Implementujte blue-green stratégie nasadenia

**💡 Výsledok kapitoly**: Nasadiť komplexné viacservisné aplikácie pomocou vlastných infraštruktúrnych šablón

---

### 🎯 Kapitola 5: Multiagentové AI riešenia (Pokročilé)
**Predpoklady**: Dokončené kapitoly 1-2  
**Dĺžka**: 2-3 hodiny  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Vzory viacagentovej architektúry
- Orchestrácia a koordinácia agentov
- Produkčne pripravené AI nasadenia

#### Výukové zdroje
- **🤖 Predstavený dizajn**: [Multiagentové riešenie pre retail](examples/retail-scenario.md) - Architektonický plán, nie kompletná aplikácia
- **🛠️ ARM šablóny**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Infrastruktúrny základ; prehľad požiadaviek a chýbajúcich komponentov aplikácie
- **📖 Architektúra**: [Vzory koordinácie viacagentových systémov](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzory

#### Praktické cvičenia
```bash
# Inspect the retail infrastructure scaffold before choosing to deploy it
cd examples/retail-multiagent-arm-template
cat README.md

# After an intentional deployment, inspect infrastructure state
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Výstup kapitoly**: Pochopiť architektúru viacagentových systémov a identifikovať implementačné, validačné a prevádzkové úlohy nad rámec infrastrukturného základu

---

### 🔍 Kapitola 6: Validácia a plánovanie pred nasadením
**Predpoklady**: Dokončená kapitola 4  
**Dĺžka trvania**: 1 hodina  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Plánovanie kapacity a overovanie zdrojov
- Stratégie výberu SKU
- Predbežné kontroly a automatizácia

#### Zdroje na učenie
- **📊 Plánovanie**: [Plánovanie kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) - Overovanie zdrojov
- **💰 Výber**: [Výber SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Nákladovo efektívne voľby
- **✅ Validácia**: [Predbežné kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktické cvičenia
- Spustiť skripty na overenie kapacity
- Optimalizovať výber SKU z hľadiska nákladov
- Implementovať automatizované kontroly pred nasadením

**💡 Výstup kapitoly**: Overiť a optimalizovať nasadenia pred ich spustením

---

### 🚨 Kapitola 7: Riešenie problémov a ladenie
**Predpoklady**: Dokončená ľubovoľná kapitola o nasadení  
**Dĺžka trvania**: 1-1,5 hodiny  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Systematické prístupy k ladenie
- Bežné problémy a riešenia
- Riešenie problémov špecifických pre AI

#### Zdroje na učenie
- **🔧 Bežné problémy**: [Bežné problémy](docs/chapter-07-troubleshooting/common-issues.md) - FAQ a riešenia
- **🕵️ Ladenie**: [Príručka ladenia](docs/chapter-07-troubleshooting/debugging.md) - Stratégie krok za krokom
- **🤖 AI problémy**: [Riešenie problémov AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problémy s AI službami

#### Praktické cvičenia
- Diagnostikovať zlyhania nasadenia
- Riešiť problémy s autentifikáciou
- Ladiť konektivitu AI služieb

**💡 Výstup kapitoly**: Samostatne diagnostikovať a riešiť bežné problémy s nasadením

---

### 🏢 Kapitola 8: Produkčné a podnikové vzory
**Predpoklady**: Dokončené kapitoly 1-4  
**Dĺžka trvania**: 2-3 hodiny  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Stratégie produkčného nasadenia
- Podnikové bezpečnostné vzory
- Monitorovanie a optimalizácia nákladov

#### Zdroje na učenie
- **🏭 Produkcia**: [Najlepšie praktiky AI v produkcii](docs/chapter-08-production/production-ai-practices.md) - Podnikové vzory
- **📝 Príklady**: [Príklad mikroservisov](../../examples/microservices) - Zložité architektúry
- **📊 Monitorovanie**: [Integrácia Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorovanie

#### Praktické cvičenia
- Implementovať podnikové bezpečnostné vzory
- Nastaviť komplexné monitorovanie
- Nasadiť do produkcie s riadením

**💡 Výstup kapitoly**: Nasadiť podnikové aplikácie pripravené na produkciu s plnou funkčnosťou

---

## 🎓 Prehľad workshopu: Praktická skúsenosť s učením

> **⚠️ STATUS WORKSHOPU: Aktívny vývoj**  
> Materiály workshopu sú momentálne vyvíjané a vylepšované. Hlavné moduly sú funkčné, niektoré pokročilé časti sú nedokončené. Aktívne pracujeme na kompletizácii obsahu. [Sledovať pokrok →](workshop/README.md)

### Interaktívne materiály workshopu
**Komplexné praktické učenie so založenými nástrojmi v prehliadači a riadenými cvičeniami**

Naše materiály poskytujú štruktúrovaný, interaktívny zážitok z učenia, ktorý dopĺňa vyššie uvedený kurz založený na kapitolách. Workshop je navrhnutý pre samostatné štúdium aj pre vedené inštruktorské sedenia.

#### 🛠️ Vlastnosti workshopu
- **Rozhranie v prehliadači**: Kompletný workshop poháňaný MkDocs s vyhľadávaním, kopírovaním a témami
- **Integrácia GitHub Codespaces**: Nastavenie vývojového prostredia jedným kliknutím
- **Štruktúrovaná učebná cesta**: 8 modulov s riadenými cvičeniami (celkom 3-4 hodiny)
- **Progresívna metodika**: Úvod → Výber → Validácia → Dekonštrukcia → Konfigurácia → Prispôsobenie → Ukončenie → Zhrnutie
- **Interaktívne DevContainer prostredie**: Predkonfigurované nástroje a závislosti

#### 📚 Štruktúra modulov workshopu
Workshop nasleduje **8-modulovú progresívnu metodiku**, ktorá vás prevedie od objavovania ku majstrovstvu nasadenia:

| Modul | Téma | Čo urobíte | Trvanie |
|--------|-------|----------------|----------|
| **0. Úvod** | Prehľad workshopu | Pochopenie cieľov učenia, predpokladov a štruktúry workshopu | 15 min |
| **1. Výber** | Objavovanie šablón | Preskúmať AZD šablóny a vybrať správnu AI šablónu pre váš scenár | 20 min |
| **2. Validácia** | Nasadiť a overiť | Nasadiť šablónu pomocou `azd up` a overiť funkčnosť infraštruktúry | 30 min |
| **3. Dekonštrukcia** | Pochopenie štruktúry | Použiť GitHub Copilot na preskúmanie architektúry šablón, Bicep súborov a organizácie kódu | 30 min |
| **4. Konfigurácia** | Hlboké štúdium azure.yaml | Ovládnuť konfiguráciu `azure.yaml`, životný cyklus a premenné prostredia | 30 min |
| **5. Prispôsobenie** | Urobiť to svojim | Povoliť AI Search, trasovanie, hodnotenie a prispôsobiť podľa vášho scenára | 45 min |
| **6. Ukončenie** | Upratanie | Bezpečne vyčistiť zdroje s pomocou `azd down --purge` | 15 min |
| **7. Zhrnutie** | Ďalšie kroky | Prehľad úspechov, kľúčových konceptov a pokračovanie v učení | 15 min |

**Priebeh workshopu:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Začíname s workshopom
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Výstupy učenia workshopu
Dokončením workshopu účastníci dosiahnu:
- **Nasadiť produkčné AI aplikácie**: Použiť AZD s Microsoft Foundry službami
- **Ovládnuť viacagentovú architektúru**: Implementovať koordinované AI agentné riešenia
- **Implementovať bezpečnostné najlepšie praktiky**: Nastaviť autentifikáciu a kontrolu prístupu
- **Optimalizovať pre škálovanie**: Navrhnúť nákladovo efektívne, výkonné nasadenia
- **Riešiť problémy s nasadením**: Riešiť bežné problémy samostatne

#### 📖 Zdroje workshopu
- **🎥 Interaktívny sprievodca**: [Materiály workshopu](workshop/README.md) - Vzdelávacie prostredie v prehliadači
- **📋 Inštrukcie modul po module**:
  - [0. Úvod](workshop/docs/instructions/0-Introduction.md) - Prehľad a ciele workshopu
  - [1. Výber](workshop/docs/instructions/1-Select-AI-Template.md) - Nájsť a vybrať AI šablóny
  - [2. Validácia](workshop/docs/instructions/2-Validate-AI-Template.md) - Nasadiť a overiť šablóny
  - [3. Dekonštrukcia](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Preskúmať architektúru šablón
  - [4. Konfigurácia](workshop/docs/instructions/4-Configure-AI-Template.md) - Ovládnuť azure.yaml
  - [5. Prispôsobenie](workshop/docs/instructions/5-Customize-AI-Template.md) - Prispôsobiť podľa vášho scenára
  - [6. Ukončenie](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Upratať zdroje
  - [7. Zhrnutie](workshop/docs/instructions/7-Wrap-up.md) - Prehľad a ďalšie kroky
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI zamerané cvičenia
- **💡 Rýchly štart**: [Sprievodca nastavením workshopu](workshop/README.md#browser-based-guide) - Konfigurácia prostredia

**Ideálne pre**: Firemné školenia, univerzitné kurzy, samostatné štúdium a bootcampy pre vývojárov.

---

## 📖 Hlboký pohľad: Možnosti AZD

Nad rámec základov AZD ponúka výkonné funkcie pre produkčné nasadenia:

- **Nasadenia založené na šablónach** - Použitie predpripravených šablón pre bežné aplikačné vzory
- **Infrastruktúra ako kód** - Správa Azure zdrojov pomocou Bicep alebo Terraform  
- **Integrované pracovné postupy** - Bezproblémové nasadenie, provisionovanie a monitorovanie aplikácií
- **Priateľské pre vývojárov** - Optimalizované pre produktivitu a skúsenosť vývojárov

### **AZD + Microsoft Foundry: Ideálne pre AI nasadenia**

**Prečo AZD pre AI riešenia?** AZD rieši hlavné výzvy, ktorým vývojári AI čelia:

- **AI pripravené šablóny** - Predkonfigurované šablóny pre Microsoft Foundry modely, Azure AI služby a ML záťaže
- **Bezpečné AI nasadenia** - Vstavané bezpečnostné vzory pre AI služby, API kľúče a modelové endpointy  
- **Produkčné AI vzory** - Najlepšie praktiky pre škálovateľné, nákladovo efektívne AI nasadenia
- **End-to-End AI pracovné postupy** - Od vývoja modelu až po produkčné nasadenie s riadením monitoringu
- **Optimalizácia nákladov** - Inteligentné prideľovanie zdrojov a škálovacie stratégie pre AI záťaže
- **Integrácia Microsoft Foundry** - Bezproblémové prepojenie s katalógom a endpointmi Microsoft Foundry modelov

---

## 🎯 Knižnica šablón a príkladov

### Vybrané: Microsoft Foundry šablóny
**Začnite tu, ak nasadzujete AI aplikácie!**

> **Poznámka:** Tieto šablóny ukazujú rôzne AI vzory. Niektoré sú externé Azure Samples, iné sú lokálne implementácie.

| Šablóna | Kapitola | Zložitosť | Služby | Typ |
|----------|---------|------------|----------|------|
| [**Začíname s AI chatom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externá |
| [**Začíname s AI agentmi**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitola 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externá |
| [**Azure Search + OpenAI demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | Azure OpenAI + Azure AI Search + Container Apps (predvolené) + Storage | Externá |
| [**OpenAI Chat App Rýchly štart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externá |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externá |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externá |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | Navrhnutá architektúra a infrastrukturný základ; je potrebná implementácia aplikácie | **Lokálny plán** |

### Vybrané: Kompletné učebné scenáre
**Produkčné šablóny aplikácií mapované na učebné kapitoly**

| Šablóna | Učebná kapitola | Zložitosť | Kľúčové učenie |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | Základné vzory AI nasadenia |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | Implementácia RAG s Azure AI Search |
| [**get-started-with-ai-agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitola 2 | ⭐⭐ | Chat s agentmi a testy špecifické pre príklady |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | Agentný rámec a volanie funkcií |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐ | Podniková AI orchestrácia |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | Viacagentová architektúra s agentmi pre zákazníkov a inventár |

### Učenie sa podľa typu príkladu

> **📌 Lokálne vs. externé príklady:**  
> **Lokálne príklady** (v tomto repozitári) = Skontrolujte README príkladu pre stav implementácie a predpoklady
> **Externé príklady** (Azure Samples) = Klonovať z prepojených repozitárov

#### Lokálne príklady (pripravené na použitie)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Architektonický plán so základom infraštruktúry ARM
  - Navrhnuté role agentov pre zákazníka a inventár
  - Monitorovanie, hodnotenie a aplikačný kód musia byť implementované a overené
  - Provisionovanie zdrojov samých o sebe neposkytuje funkčnú retailovú aplikáciu

#### Lokálne príklady - kontajnerové aplikácie (kapitoly 2-5)
**Komplexné príklady nasadenia kontajnerov v tomto repozitári:**
- [**Príklady kontajnerových aplikácií**](examples/container-app/README.md) - Kompletný sprievodca nasadeniami kontajnerov
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api) - Základné REST API so škálovaním na nulu
  - [Architektúra mikroservisov](../../examples/container-app/microservices) - Dva servisné vzory na učenie; produkčná príprava je ďalšia práca
  - Rýchly štart, produkcia a pokročilé vzory nasadenia
  - Návod na monitorovanie, bezpečnosť a optimalizáciu nákladov

#### Externé príklady - jednoduché aplikácie (kapitoly 1-2)
**Klonujte tieto Azure Samples repozitáre pre začiatok:**
- [Jednoduchá webová aplikácia - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Základné vzory nasadenia
- [Statická webová stránka - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Nasadenie statického obsahu
- [Kontajnerová aplikácia - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Nasadenie REST API

#### Externé príklady - integrácia databázy (kapitoly 3-4)  
- [Databázová aplikácia - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzory pripojenia k databáze
- [Funkcie + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless dátové workflow

#### Externé príklady - Pokročilé vzory (kapitoly 4-8)
- [Java mikroslužby](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architektúry viacerých služieb
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Spracovanie na pozadí
- [Enterprise ML Pipeline](https://github.com/Azure/mlops-v2) - Referenčné vzory MLOps; nie je možné použiť ako AZD šablónu z krabice

### Externé kolekcie šablón
- [**Oficiálna galéria AZD šablón**](https://azure.github.io/awesome-azd/) - Vybraná kolekcia oficiálnych a komunitných šablón
- [**Šablóny Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentácia šablón Microsoft Learn
- [**Adresár príkladov**](examples/README.md) - Miestne príklady na učenie s podrobnými vysvetleniami

---

## 📚 Vzdelávacie zdroje a odkazy

### Rýchle odkazy
- [**Cheat Sheet príkazov**](resources/cheat-sheet.md) - Základné príkazy azd usporiadané podľa kapitol
- [**Glosár**](resources/glossary.md) - Terminológia Azure a azd
- [**FAQ**](resources/faq.md) - Bežné otázky zoradené podľa učebnej kapitoly
- [**Študijný sprievodca**](resources/study-guide.md) - Komplexné cvičenia na precvičenie

### Praktické workshopy
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Urobte svoje AI riešenia nasaditeľné cez AZD (2-3 hodiny)
- [**Interaktívny Workshop**](workshop/README.md) - 8-modulové riadené cvičenia s MkDocs a GitHub Codespaces
  - Nasleduje: Úvod → Výber → Validácia → Dekonštrukcia → Konfigurácia → Prispôsobenie → Ukončenie → Zhrnutie

### Externé výukové zdroje
- [Azure Developer CLI Dokumentácia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Kalkulačka cien](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### Zručnosti AI agenta pre váš editor
- [**Microsoft Azure Skills na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otvorených zručností agenta pre Azure AI, Foundry, nasadenie, diagnostiku, optimalizáciu nákladov a ďalšie. Nainštalujte ich do GitHub Copilot, Cursor, Claude Code alebo akéhokoľvek podporovaného agenta:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Rýchly sprievodca riešením problémov

**Bežné problémy začiatočníkov a okamžité riešenia:**

<details>
<summary><strong>❌ „azd: príkaz nenájdený“</strong></summary>

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
<summary><strong>❌ „Nenašiel sa žiadny odber“ alebo „Odber nie je nastavený“</strong></summary>

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
<summary><strong>❌ „Nedostatok kvóty“ alebo „Kvóta prekročená“</strong></summary>

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
<summary><strong>❌ „azd up“ zlyhá v polovici procesu</strong></summary>

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
<summary><strong>❌ „Overenie zlyhalo“ alebo „Token expiroval“</strong></summary>

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
<summary><strong>❌ „Zdroj už existuje“ alebo konflikty názvov</strong></summary>

```bash
# Inspect the conflicting resource before changing or deleting anything.
# For an isolated new deployment, create a separate environment:
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Nasadenie šablóny trvá príliš dlho</strong></summary>

**Bežné doby čakania:**
- Jednoduchá webová aplikácia: 5-10 minút
- Aplikácia s databázou: 10-15 minút
- AI aplikácie: 15-25 minút (poskytovanie OpenAI je pomalé)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ „Prístup zamietnutý“ alebo „Zakázané“</strong></summary>

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
<summary><strong>❌ Nemožno nájsť URL nasadenej aplikácie</strong></summary>

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

### 📚 Kompletné zdroje riešenia problémov

- **Sprievodca bežnými problémami:** [Podrobné riešenia](docs/chapter-07-troubleshooting/common-issues.md)
- **Problémy špecifické pre AI:** [Riešenie problémov AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Sprievodca ladením:** [Ladenie krok za krokom](docs/chapter-07-troubleshooting/debugging.md)
- **Získajte pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Dokončenie kurzu a certifikácia

### Sledovanie pokroku
Sledujte svoj učebný pokrok v jednotlivých kapitolách:

- [ ] **Kapitola 1**: Základy a rýchly štart ✅
- [ ] **Kapitola 2**: Vývoj s prioritou AI ✅  
- [ ] **Kapitola 3**: Konfigurácia a overovanie ✅
- [ ] **Kapitola 4**: Infrastruktúra ako kód a nasadenie ✅
- [ ] **Kapitola 5**: Viacagentové AI riešenia ✅
- [ ] **Kapitola 6**: Validácia a plánovanie pred nasadením ✅
- [ ] **Kapitola 7**: Riešenie problémov a ladenie ✅
- [ ] **Kapitola 8**: Produkčné a podnikové vzory ✅

### Overenie učenia
Po dokončení každej kapitoly overte svoje vedomosti takto:
1. **Praktické cvičenie**: Dokončite praktické nasadenie daného modulu
2. **Kontrola vedomostí**: Prezrite si FAQ sekciu pre vašu kapitolu
3. **Diskusia v komunite**: Podeľte sa o svoje skúsenosti na Azure Discord
4. **Ďalšia kapitola**: Pokračujte na ďalšiu úroveň zložitosti

### Výhody dokončenia kurzu
Po absolvovaní všetkých kapitol získate:
- **Produkčné skúsenosti**: Nasadené reálne AI aplikácie do Azure
- **Profesionálne zručnosti**: Schopnosti nasadenia pripravené pre podnikové prostredie  
- **Uznanie v komunite**: Aktívne členstvo v Azure developer komunite
- **Kariérny postup**: Žiadaná expertíza v AZD a AI nasadení

---

## 🤝 Komunita a podpora

### Získajte pomoc a podporu
- **Technické problémy**: [Nahlásiť chyby a žiadať funkcie](https://github.com/microsoft/azd-for-beginners/issues)
- **Otázky k učeniu**: [Microsoft Azure Discord komunita](https://discord.gg/microsoft-azure) a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc špecifická pre AI**: Pridajte sa k [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentácia**: [Oficiálna dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Postrehy komunity z Microsoft Foundry Discord

**Témy diskutované komunitou:**
- Nasadenia viacerých služieb, správa poverení a pripravenosť do produkcie
- Šablóny špecifické pre AI, sprievodcovia riešením problémov a osvedčené postupy

**Pridajte sa ku komunite, aby ste:**
- Zdieľali svoje skúsenosti s AZD + AI a získali pomoc
- Mali prístup k skorým ukážkam nových AI šablón
- Prispeli k osvedčeným postupom AI nasadenia
- Ovplyvnili budúci vývoj funkcií AI + AZD

### Príspevky do kurzu
Radi prijímame príspevky! Prečítajte si prosím náš [Sprievodca príspevkami](CONTRIBUTING.md) pre podrobnosti o:
- **Zlepšenie obsahu**: Vylepšujte existujúce kapitoly a príklady
- **Nové príklady**: Pridajte scenáre a šablóny z reálneho sveta  
- **Preklad**: Pomáhajte udržiavať viacjazyčnú podporu
- **Hlásenia chýb**: Zlepšujte presnosť a jasnosť
- **Komunitné štandardy**: Dodržiavajte naše inkluzívne komunitné pravidlá

---

## 📄 Informácie o kurze

### Licencia
Tento projekt je licencovaný pod licenciou MIT - pozrite si súbor [LICENSE](../../LICENSE) pre podrobnosti.

### Súvisiace vzdelávacie zdroje Microsoftu

Náš tím pripravuje aj ďalšie rozsiahle vzdelávacie kurzy:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j pre začiatočníkov](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js pre začiatočníkov](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain pre začiatočníkov](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenti
[![AZD pre začiatočníkov](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI pre začiatočníkov](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP pre začiatočníkov](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI agenti pre začiatočníkov](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Séria generatívneho AI
[![Generatívne AI pre začiatočníkov](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatívne AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatívne AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatívne AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![Strojové učenie pre začiatočníkov](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Dátová veda pre začiatočníkov](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI pre začiatočníkov](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kybernetická bezpečnosť pre začiatočníkov](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webový vývoj pre začiatočníkov](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pre začiatočníkov](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR vývoj pre začiatočníkov](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Séria Copilot
[![Copilot pre AI párované programovanie](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pre C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Dobrodružstvo](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigácia v kurze

**🚀 Pripravení začať s učením?**

**Začiatočníci**: Začnite s [Kapitola 1: Základy a rýchly štart](#-chapter-1-foundation--quick-start)  
**AI vývojári**: Preskočte na [Kapitola 2: Vývoj s prioritou AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Skúsení vývojári**: Začnite s [Kapitola 3: Konfigurácia a overovanie](#️-chapter-3-configuration--authentication)

**Ďalšie kroky**: [Začať Kapitolu 1 - Základy AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->