# AZD pre Začiatočníkov: Štruktúrovaná Výučbová Cesta

![AZD-for-beginners](../../translated_images/sk/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatizované Preklady (Vždy aktuálne)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](./README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Radšej klonovať lokálne?**
>
> Tento repozitár obsahuje viac ako 50 jazykových prekladov, čo výrazne zväčšuje veľkosť sťahovania. Ak chcete klonovať bez prekladov, použite sparse checkout:
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
> Toto vám dá všetko potrebné pre dokončenie kurzu s oveľa rýchlejším sťahovaním.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Čo je dnes nové v azd

> 📌 Tento kurz je overený s **`azd 1.27.1`** (júl 2026). Spustite `azd version` na kontrolu verzie a `azd upgrade` pre najnovšiu.

Azure Developer CLI sa rozrástla za hranice tradičných webových aplikácií a API. Dnes je azd jediným nástrojom na nasadenie **ľubovoľnej** aplikácie na Azure—vrátane aplikácií poháňaných AI a inteligentných agentov.

Tu je, čo to pre vás znamená:

- **AI agenti sú teraz plnohodnotné pracovné záťaže v azd.** Môžete inicializovať, nasadzovať a spravovať projekty AI agentov pomocou rovnakého workflow `azd init` → `azd up`, ktoré už poznáte.
- **Úplný životný cyklus agenta z CLI.** Rozšírenie `azure.ai.agents` teraz pokrýva celú cestu—`azd ai agent init` na scaffolding, `azd ai agent invoke` na testovanie (s výstupom doby odozvy), `azd ai agent eval generate` a `azd ai agent optimize` na meranie a zlepšenie kvality, a `azd ai agent delete` na vyčistenie.
- **Viac stavebných blokov AI.** Nové náhľadové rozšírenia—`azure.ai.skills` a `azure.ai.connections`—umožňujú spravovať opakovane použiteľné schopnosti agentov a Foundry konektory priamo cez azd.
- **Integrácia Microsoft Foundry** prináša modelové nasadenie, hosting agentov a konfiguráciu AI služieb priamo do ekosystému šablón azd.
- **Plynulejšie každodenné základy.** Nedávne vydania spravili `azd init` idempotentným (bezpečné opätovné spustenie), `azd auth login` automaticky čistí zastarané tokeny a pridali priateľský úvodný setup prompt pre `azd tool`.
- **Hlavný workflow sa nezmenil.** Či už nasadzujete todo aplikáciu, mikroslužbu alebo multi-agentné AI riešenie, príkazy sú rovnaké.

> **Poznámka pre používateľov Aspire:** Microsoft teraz produkt jednoducho nazýva **Aspire** (predtým „.NET Aspire“). Podpora Aspire v azd zostáva rovnaká—zmenil sa len názov.

Ak ste azd už používali, podpora AI je prirodzené rozšírenie—nie samostatný nástroj alebo pokročilá vetva. Ak začínate odznova, naučíte sa jeden workflow, ktorý funguje pre všetko.

---

## 🚀 Čo je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je používateľsky prívetivý príkazový nástroj, ktorý uľahčuje nasadzovanie aplikácií do Azure. Namiesto manuálneho vytvárania a prepájania desiatok Azure zdrojov môžete nasadiť kompletné aplikácie jediným príkazom.

### Kúzlo príkazu `azd up`

```bash
# Tento jediný príkaz robí všetko:
# ✅ Vytvára všetky Azure zdroje
# ✅ Konfiguruje sieť a zabezpečenie
# ✅ Stavia kód vašej aplikácie
# ✅ Deployuje do Azure
# ✅ Poskytuje vám funkčnú URL adresu
azd up
```

**To je všetko!** Žiadne klikanie v Azure Portáli, žiadne zložité ARM šablóny na učenie, žiadna manuálna konfigurácia - len fungujúce aplikácie na Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Aký je rozdiel?

Toto je najčastejšia otázka začiatočníkov. Tu je jednoduchá odpoveď:

| Funkcia | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Účel** | Manažovať jednotlivé Azure zdroje | Nasadzovať kompletné aplikácie |
| **Postoj** | Zamerané na infraštruktúru | Zamerané na aplikácie |
| **Príklad** | `az webapp create --name myapp...` | `azd up` |
| **Krivka učenia** | Musíte poznať Azure služby | Stačí poznať vašu appku |
| **Najvhodnejšie pre** | DevOps, infraštruktúru | Vývojárov, prototypovanie |

### Jednoduchá analógia

- **Azure CLI** je ako mať všetky nástroje na stavbu domu - kladivá, píly, klince. Môžete postaviť čokoľvek, ale musíte vedieť stavať.
- **Azure Developer CLI** je ako najať si dodávateľa - popíšete, čo chcete, a on sa postará o stavbu.

### Kedy použiť čo

| Scenár | Použite toto |
|----------|----------|
| "Chcem rýchlo nasadiť moju webovú aplikáciu" | `azd up` |
| "Potrebujem vytvoriť len storage account" | `az storage account create` |
| "Budujem plnohodnotnú AI aplikáciu" | `azd init --template azure-search-openai-demo` |
| "Potrebujem debugovať konkrétny Azure zdroj" | `az resource show` |
| "Chcem produkčné nasadenie za pár minút" | `azd up --environment production` |

### Spolupracujú!

AZD používa Azure CLI na pozadí. Môžete používať oboje:
```bash
# Nasadte svoju aplikáciu pomocou AZD
azd up

# Potom dolaďte konkrétne zdroje pomocou Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Nájdite šablóny v Awesome AZD

Nezačínajte od nuly! **Awesome AZD** je komunitná zbierka pripravených šablón na nasadenie:

| Zdroj | Popis |
|----------|-------------|
| 🔗 [**Awesome AZD Galéria**](https://azure.github.io/awesome-azd/) | Prezrite si viac ako 200 šablón s nasadením jedným klikom |
| 🔗 [**Podajte šablónu**](https://github.com/Azure/awesome-azd/issues) | Prispievajte vlastnou šablónou komunitě |
| 🔗 [**GitHub Repozitár**](https://github.com/Azure/awesome-azd) | Dajte hviezdu a preskúmajte zdrojový kód |

### Populárne AI šablóny z Awesome AZD

```bash
# RAG chat s modelmi Microsoft Foundry + AI vyhľadávanie
azd init --template azure-search-openai-demo

# Rýchla AI chatová aplikácia
azd init --template openai-chat-app-quickstart

# AI agenti s agentmi Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Začnite v 3 krokoch

Pred začiatkom sa uistite, že váš stroj je pripravený na šablónu, ktorú chcete nasadiť:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ak niektorá kontrola zlyhá, opravte ju najprv a potom pokračujte v rýchlom začatí.

### Krok 1: Nainštalujte AZD (2 minúty)

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

### Krok 2: Overte sa pre AZD

```bash
# Voliteľné, ak plánujete priamo používať príkazy Azure CLI v tomto kurze
az login

# Povinné pre pracovné postupy AZD
azd auth login
```

Ak si nie ste istí, ktorý typ overenia potrebujete, postupujte podľa kompletného nastavenia v [Inštalácia a nastavenie](docs/chapter-01-foundation/installation.md#authentication-setup).

### Krok 3: Nasadenie vašej prvej appky

```bash
# Inicializovať z šablóny
azd init --template todo-nodejs-mongo

# Nasadiť do Azure (vytvorí všetko!)
azd up
```

**🎉 To je všetko!** Vaša aplikácia je teraz online na Azure.

### Vyčistenie (nezabudnite!)

```bash
# Po ukončení experimentovania odstráňte všetky zdroje
azd down --force --purge
```

---

## 📚 Ako používať tento kurz

Tento kurz je navrhnutý pre **postupné učenie** - začnite tam, kde sa cítite pohodlne, a pokračujte:

| Vaše skúsenosti | Začať tu |
|-----------------|------------|
| **Nováčik v Azure** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Známy Azure, nový v AZD** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Chcem nasadiť AI aplikácie** | [Kapitola 2: AI-First Vývoj](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Chcem praktické cvičenie** | [🎓 Interaktívny workshop](workshop/README.md) - 3-4 hodinové vedené laboratórium |
| **Potrebujem produkčné vzory** | [Kapitola 8: Produkcia a podnikové vzory](#-chapter-8-production--enterprise-patterns) |

### Rýchle nastavenie

1. **Forknite tento repozitár**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonujte ho**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Požiadajte o pomoc**: [Azure Discord Comunity](https://discord.com/invite/ByRwuEEgH4)

> **Radšej klonovať lokálne?**

> Tento repozitár obsahuje viac ako 50 jazykových prekladov, čo výrazne zväčšuje veľkosť sťahovania. Ak chcete klonovať bez prekladov, použite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Toto vám dá všetko potrebné pre dokončenie kurzu s oveľa rýchlejším sťahovaním.


## Prehľad kurzu

Ovládnite Azure Developer CLI (azd) prostredníctvom štruktúrovaných kapitol navrhnutých pre postupné učenie. **Špeciálny dôraz na nasadzovanie AI aplikácií s integráciou Microsoft Foundry.**


### Prečo je tento kurz nevyhnutný pre moderných vývojárov

Na základe postrehov komunity Microsoft Foundry Discord chce **45 % vývojárov používať AZD pre AI pracovné zaťaženia**, ale stretávajú sa s výzvami pri:
- Zložitých viacslužbových AI architektúrach
- Najlepších postupoch nasadenia AI do produkcie  
- Integrácii a konfigurácii služieb Azure AI
- Optimalizácii nákladov pre AI pracovné zaťaženia
- Riešení špecifických problémov nasadenia AI

### Výukové ciele

Dokončením tohto štruktúrovaného kurzu dosiahnete:
- **Ovládanie základov AZD**: Kľúčové koncepty, inštalácia a konfigurácia
- **Nasadenie AI aplikácií**: Použitie AZD so službami Microsoft Foundry
- **Implementácia infraštruktúry ako kódu**: Správa Azure zdrojov pomocou Bicep šablón
- **Riešenie problémov pri nasadzovaní**: Odhaľovanie a odstraňovanie bežných problémov
- **Optimalizácia pre produkciu**: Bezpečnosť, škálovanie, monitoring a riadenie nákladov
- **Budovanie viacagentových riešení**: Nasadenie zložitých AI architektúr

## Pred začiatkom: Účty, prístupy a predpoklady

Pred začatím kapitoly 1 sa uistite, že máte nasledujúce základné veci zaistené. Kroky inštalácie uvedené neskôr v tejto príručke vychádzajú z predpokladu, že tieto základy máte už pripravené.

- **Azure predplatné**: Môžete použiť existujúce predplatné z práce alebo vlastný účet, alebo si vytvoriť [bezplatnú skúšobnú verziu](https://aka.ms/azurefreetrial) na začiatok.
- **Oprávnenie na vytváranie Azure zdrojov**: Pre väčšinu cvičení by ste mali mať aspoň prístup **Contributor** v cieľovom predplatnom alebo skupine zdrojov. Niektoré kapitoly tiež predpokladajú možnosť vytvárať skupiny zdrojov, spravované identity a RBAC priradenia.
- [**GitHub účet**](https://github.com): Je užitočný na fork repozitára, sledovanie vlastných zmien a používanie GitHub Codespaces pre workshop.
- **Predpoklady behu šablón**: Niektoré šablóny vyžadujú lokálne nástroje ako Node.js, Python, Java alebo Docker. Spustite overenie nastavenia pred začatím, aby ste včas zachytili chýbajúce nástroje.
- **Základná znalosť terminálu**: Nemusíte byť expert, ale mali by ste byť pohodlní pri spúšťaní príkazov ako `git clone`, `azd auth login` a `azd up`.

> **Pracujete v podnikových predplatných?**
> Ak je vaše Azure prostredie spravované administrátorom, vopred si overte, či môžete nasadzovať zdroje v predplatnom alebo skupine zdrojov, ktorú plánujete použiť. Ak nie, žiadajte o sandbox predplatné alebo prístup Contributor pred začiatkom.

> **Ste noví v Azure?**
> Začnite svojim vlastným Azure trial alebo pay-as-you-go predplatným na https://aka.ms/azurefreetrial, aby ste mohli dokončiť cvičenia naplno bez čakania na schválenia na úrovni tenanta.

## 🗺️ Mapa kurzu: Rýchla navigácia podľa kapitoly

Každá kapitola má samostatný README s výukovými cieľmi, rýchlymi začiatkami a cvičeniami:

| Kapitola | Téma | Lekcie | Dĺžka | Zložitosť |
|---------|-------|---------|----------|------------|
| **[Kap 1: Základy](docs/chapter-01-foundation/README.md)** | Začíname | [Základy AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Inštalácia](docs/chapter-01-foundation/installation.md) &#124; [Prvý projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap 2: AI vývoj](docs/chapter-02-ai-development/README.md)** | AI-First aplikácie | [Foundry integrácia](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agenti](docs/chapter-02-ai-development/agents.md) &#124; [Nasadenie modelu](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hod | ⭐⭐ |
| **[Kap 3: Konfigurácia](docs/chapter-03-configuration/README.md)** | Autentifikácia & bezpečnosť | [Konfigurácia](docs/chapter-03-configuration/configuration.md) &#124; [Autentifikácia & bezpečnosť](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap 4: Infraštruktúra](docs/chapter-04-infrastructure/README.md)** | IaC & nasadenie | [Sprievodca nasadením](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hod | ⭐⭐⭐ |
| **[Kap 5: Viacagentové](docs/chapter-05-multi-agent/README.md)** | AI agentové riešenia | [Scenár maloobchodu](examples/retail-scenario.md) &#124; [Vzory koordinácie](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hod | ⭐⭐⭐⭐ |
| **[Kap 6: Pred nasadením](docs/chapter-06-pre-deployment/README.md)** | Plánovanie & overovanie | [Predletové kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Plánovanie kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Výber SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hod | ⭐⭐ |
| **[Kap 7: Riešenie problémov](docs/chapter-07-troubleshooting/README.md)** | Debug & opravy | [Bežné problémy](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problémy s AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hod | ⭐⭐ |
| **[Kap 8: Produkcia](docs/chapter-08-production/README.md)** | Podnikové vzory | [Produktioné praktiky](docs/chapter-08-production/production-ai-practices.md) | 2-3 hod | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktický laboratórium | [Úvod](workshop/docs/instructions/0-Introduction.md) &#124; [Výber](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Overenie](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deštrukcia](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurácia](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prispôsobenie](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Rozobranie infraštruktúry](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zhrnutie](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hod | ⭐⭐ |

**Celková dĺžka kurzu:** ~10-14 hodín | **Pokrok v zručnostiach:** Začiatočník → Produkčne pripravený

---

## 📚 Výukové kapitoly

*Vyberte si výučbovú cestu podľa úrovne skúseností a cieľov*

### 🚀 Kapitola 1: Základy & Rýchly štart
**Predpoklady**: Azure predplatné, základná znalosť príkazového riadku  
**Trvanie**: 30-45 minút  
**Zložitosť**: ⭐

#### Čo sa naučíte
- Porozumenie základom Azure Developer CLI
- Inštalácia AZD na vašej platforme
- Vaše prvé úspešné nasadenie

#### Výučbové zdroje
- **🎯 Začnite tu**: [Čo je Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teória**: [Základy AZD](docs/chapter-01-foundation/azd-basics.md) - Kľúčové koncepty a terminológia
- **⚙️ Nastavenie**: [Inštalácia a nastavenie](docs/chapter-01-foundation/installation.md) - Platformovo špecifické návody
- **🛠️ Prakticky**: [Váš prvý projekt](docs/chapter-01-foundation/first-project.md) - Krok za krokom
- **📋 Rýchla referencia**: [Pomôcka s príkazmi](resources/cheat-sheet.md)

#### Praktické cvičenia
```bash
# Rýchla kontrola inštalácie
azd version

# Nasadiť vašu prvú aplikáciu
azd init --template todo-nodejs-mongo
azd up
```

**💡 Výsledok kapitoly**: Úspešne nasadiť jednoduchú webovú aplikáciu na Azure pomocou AZD

**✅ Overenie úspechu:**
```bash
# Po dokončení kapitoly 1 by ste mali byť schopní:
azd version              # Zobrazuje nainštalovanú verziu
azd init --template todo-nodejs-mongo  # Inicializuje projekt
azd up                  # Nasadzuje na Azure
azd show                # Zobrazuje URL spustené aplikácie
# Aplikácia sa otvorí v prehliadači a funguje
azd down --force --purge  # Vyčistí zdroje
```

**📊 Časová investícia:** 30-45 minút  
**📈 Úroveň zručností po:** Samostatné nasadenie základných aplikácií
**📈 Úroveň zručností po:** Samostatné nasadenie základných aplikácií

---

### 🤖 Kapitola 2: AI-First vývoj (Odporúčané pre AI vývojárov)
**Predpoklady**: Dokončená Kapitola 1  
**Trvanie**: 1-2 hodiny  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Integrácia Microsoft Foundry s AZD
- Nasadzovanie AI-poháňaných aplikácií
- Pochopenie konfigurácií AI služieb

#### Výučbové zdroje
- **🎯 Začnite tu**: [Integrácia Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agenti**: [Sprievodca AI agentmi](docs/chapter-02-ai-development/agents.md) - Nasadzovanie inteligentných agentov s AZD
- **📖 Vzory**: [Nasadenie AI modelu](docs/chapter-02-ai-development/ai-model-deployment.md) - Nasadenie a správa AI modelov
- **🛠️ Workshop**: [AI Workshop laboratórium](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pripravte svoje AI riešenia na AZD
- **🎥 Interaktívny sprievodca**: [Workshop materiály](workshop/README.md) - Vzdelávanie v prehliadači s MkDocs * DevContainer prostredím
- **📋 Šablóny**: [Microsoft Foundry šablóny](#materiály-workshopu)
- **📝 Príklady**: [Príklady nasadenia AZD](examples/README.md)

#### Praktické cvičenia
```bash
# Nasadte vašu prvú AI aplikáciu
azd init --template azure-search-openai-demo
azd up

# Vyskúšajte ďalšie AI šablóny
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Výsledok kapitoly**: Nasadiť a nakonfigurovať AI-poháňanú chatovaciu aplikáciu s RAG funkciami

**✅ Overenie úspechu:**
```bash
# Po kapitole 2 by ste mali byť schopní:
azd init --template azure-search-openai-demo
azd up
# Otestovať rozhranie AI chatu
# Klásť otázky a získať odpovede poháňané AI s uvedenými zdrojmi
# Overiť, či integrácia vyhľadávania funguje
azd monitor  # Skontrolovať, či Application Insights zobrazuje telemetriu
azd down --force --purge
```

**📊 Časová investícia:** 1-2 hodiny  
**📈 Úroveň zručností po:** Schopnosť nasadiť a konfigurovať produkčne pripravené AI aplikácie  
**💰 Povedomie o nákladoch:** Pochopiť náklady $80-150/mesiac pre vývoj, $300-3500/mesiac pre produkciu

#### 💰 Úvahy o nákladoch pri AI nasadeniach

**Vývojové prostredie (odhad $80-150/mesiac):**
- Modely Microsoft Foundry (Pay-as-you-go): $0-50/mesiac (na základe používania tokenov)
- AI vyhľadávanie (základná úroveň): $75/mesiac
- Container Apps (Spotreba): $0-20/mesiac
- Úložisko (štandard): $1-5/mesiac

**Produkčné prostredie (odhad $300-3,500+/mesiac):**
- Modely Microsoft Foundry (PTU pre konzistentný výkon): $3,000+/mesiac ALEBO Pay-as-you-go s veľkým objemom
- AI vyhľadávanie (štandardná úroveň): $250/mesiac
- Container Apps (dedikované): $50-100/mesiac
- Application Insights: $5-50/mesiac
- Úložisko (prémiové): $10-50/mesiac

**💡 Tipy na optimalizáciu nákladov:**
- Používajte **slobodný stupeň** modelov Microsoft Foundry na učenie (Azure OpenAI 50 000 tokenov/mesiac v cene)
- Spúšťajte `azd down` pre uvoľnenie zdrojov, keď aktívne nevyvíjate
- Začnite s fakturáciou na základe spotreby, PTU používajte iba v produkcii
- Použite `azd provision --preview` na odhad nákladov pred nasadením
- Povoliť automatické škálovanie: platíte len za aktuálne použitie

**Monitorovanie nákladov:**
```bash
# Skontrolujte odhadované mesačné náklady
azd provision --preview

# Sledujte aktuálne náklady v Azure Portáli
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitola 3: Konfigurácia & autentifikácia
**Predpoklady**: Dokončená Kapitola 1  
**Trvanie**: 45-60 minút  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Konfigurácia a správa prostredia
- Najlepšie postupy autentifikácie a bezpečnosti
- Pomenovanie a organizácia zdrojov

#### Výučbové zdroje
- **📖 Konfigurácia**: [Sprievodca konfiguráciou](docs/chapter-03-configuration/configuration.md) - Nastavenie prostredia
- **🔐 Bezpečnosť**: [Vzory autentifikácie a spravované identity](docs/chapter-03-configuration/authsecurity.md) - Vzory autentifikácie
- **📝 Príklady**: [Príklad databázovej aplikácie](examples/database-app/README.md) - AZD databázové príklady

#### Praktické cvičenia
- Konfigurácia viacerých prostredí (dev, staging, prod)
- Nastavenie autentifikácie spravovaných identít
- Implementácia konfigurácií špecifických pre prostredie

**💡 Výsledok kapitoly**: Spravovať viacero prostredí s riadnou autentifikáciou a bezpečnosťou

---

### 🏗️ Kapitola 4: Infraštruktúra ako kód & nasadenie
**Predpoklady**: Dokončené kapitoly 1-3  
**Trvanie**: 1-1.5 hodiny  
**Zložitosť**: ⭐⭐⭐

#### Čo sa naučíte
- Pokročilé vzory nasadenia
- Infraštruktúra ako kód s Bicep
- Stratégie poskytovania zdrojov

#### Výučbové zdroje
- **📖 Nasadenie**: [Sprievodca nasadením](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletné pracovné postupy
- **🏗️ Provisioning**: [Provisioning zdrojov](docs/chapter-04-infrastructure/provisioning.md) - Správa Azure zdrojov
- **📝 Príklady**: [Príklad Container App](../../examples/container-app) - Kontajnerové nasadenia

#### Praktické cvičenia
- Vytvárať vlastné Bicep šablóny
- Nasadzovať viacslužbové aplikácie
- Implementovať modro-zelené stratégie nasadenia

**💡 Výsledok kapitoly**: Nasadiť zložité viacslužbové aplikácie pomocou vlastných infraštruktúrnych šablón

---


### 🎯 Kapitola 5: Riešenia AI s viacerými agentmi (Pokročilé)
**Predpoklady**: Kapitoly 1-2 dokončené  
**Trvanie**: 2-3 hodiny  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Vzory architektúry s viacerými agentmi
- Orchestrácia a koordinácia agentov
- Nasadenie AI pripravené na produkciu

#### Vzdelávacie zdroje
- **🤖 Odporúčaný projekt**: [Riešenie s viacerými agentmi v maloobchode](examples/retail-scenario.md) - Kompletná implementácia
- **🛠️ ARM šablóny**: [Balík ARM šablón](../../examples/retail-multiagent-arm-template) - Nasadenie na jedno kliknutie
- **📖 Architektúra**: [Vzory koordinácie viacerých agentov](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzory

#### Praktické cvičenia
```bash
# Nasadiť kompletné maloobchodné riešenie s viacerými agentmi
cd examples/retail-multiagent-arm-template
./deploy.sh

# Preskúmať konfigurácie agentov
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Výsledok kapitoly**: Nasadiť a spravovať produkčne pripravené riešenie AI s viacerými agentmi vrátane agentov zákazníka a inventára

---

### 🔍 Kapitola 6: Overovanie a plánovanie pred nasadením
**Predpoklady**: Kapitola 4 dokončená  
**Trvanie**: 1 hodina  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Plánovanie kapacity a overovanie zdrojov
- Stratégie výberu SKU
- Predbežné kontroly a automatizácia

#### Vzdelávacie zdroje
- **📊 Plánovanie**: [Plánovanie kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) - Overovanie zdrojov
- **💰 Výber**: [Výber SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Nákladovo efektívne možnosti
- **✅ Overovanie**: [Predbežné kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktické cvičenia
- Spustiť skripty na overenie kapacity
- Optimalizovať výber SKU z hľadiska nákladov
- Implementovať automatizované kontroly pred nasadením

**💡 Výsledok kapitoly**: Overiť a optimalizovať nasadenia pred vykonaním

---

### 🚨 Kapitola 7: Riešenie problémov a ladenie
**Predpoklady**: Dokončená ktorákolvek kapitola o nasadení  
**Trvanie**: 1-1,5 hodiny  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Systematické prístupy k ladeniu
- Bežné problémy a riešenia
- Riešenie problémov špecifických pre AI

#### Vzdelávacie zdroje
- **🔧 Bežné problémy**: [Bežné problémy](docs/chapter-07-troubleshooting/common-issues.md) - FAQ a riešenia
- **🕵️ Ladenie**: [Príručka ladenia](docs/chapter-07-troubleshooting/debugging.md) - Stratégiá krok za krokom
- **🤖 Problémy AI**: [Riešenie problémov špecifických pre AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problémy AI služieb

#### Praktické cvičenia
- Diagnostikovať zlyhania nasadenia
- Riešiť problémy s autentifikáciou
- Ladit pripojenie AI služieb

**💡 Výsledok kapitoly**: Samostatne diagnostikovať a riešiť bežné problémy pri nasadení

---

### 🏢 Kapitola 8: Produkčné a podnikové vzory
**Predpoklady**: Kapitoly 1-4 dokončené  
**Trvanie**: 2-3 hodiny  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Stratégie nasadenia do produkcie
- Podnikové bezpečnostné vzory
- Monitorovanie a optimalizácia nákladov

#### Vzdelávacie zdroje
- **🏭 Produkcia**: [Najlepšie praktiky pre produkčné AI](docs/chapter-08-production/production-ai-practices.md) - Podnikové vzory
- **📝 Príklady**: [Príklad mikroservisov](../../examples/microservices) - Komplexné architektúry
- **📊 Monitorovanie**: [Integrácia Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorovanie

#### Praktické cvičenia
- Implementovať podnikové bezpečnostné vzory
- Nastaviť komplexné monitorovanie
- Nasadiť do produkcie s riadnou správou

**💡 Výsledok kapitoly**: Nasadiť podnikové aplikácie pripravené na produkciu s kompletnou funkcionalitou

---

## 🎓 Prehľad workshopu: Praktický učený zážitok

> **⚠️ STATUS WORKSHOPU: Aktívny vývoj**  
> Materiály workshopu sa momentálne vyvíjajú a dolaďujú. Základné moduly sú funkčné, ale niektoré pokročilé časti ešte chýbajú. Aktívne pracujeme na dokončení celého obsahu. [Sledovať pokrok →](workshop/README.md)

### Interaktívne materiály workshopu
**Komplexné praktické učenie s nástrojmi v prehliadači a vedenými cvičeniami**

Naše materiály workshopu poskytujú štruktúrovaný, interaktívny zážitok učenia, ktorý dopĺňa kapitolný vzdelávací plán uvedený vyššie. Workshop je určený pre samostatné učenie aj pre vedené kurzy pod lektorom.

#### 🛠️ Funkcie workshopu
- **Rozhranie v prehliadači**: Kompletný workshop s MkDocs, vyhľadávaním, kopírovaním a možnosťami tém
- **Integrácia GitHub Codespaces**: Nastavenie vývojového prostredia na jedno kliknutie
- **Štruktúrovaná vzdelávacia cesta**: 8 modulov vedených cvičení (3-4 hodiny celkom)
- **Postupná metodika**: Úvod → Výber → Overovanie → Demontáž → Konfigurácia → Prispôsobenie → Ukončenie → Zhrnutie
- **Interaktívne prostredie DevContainer**: Predkonfigurované nástroje a závislosti

#### 📚 Štruktúra modulov workshopu
Workshop vychádza z **postupnej metodiky 8 modulov**, ktorá vás prevedie od objavovania až po majstrovstvo v nasadení:

| Modul | Téma | Čo budete robiť | Trvanie |
|--------|-------|----------------|----------|
| **0. Úvod** | Prehľad workshopu | Pochopiť ciele učenia, predpoklady a štruktúru workshopu | 15 min |
| **1. Výber** | Objavovanie šablón | Preskúmať AZD šablóny a vybrať správnu AI šablónu pre váš scenár | 20 min |
| **2. Overovanie** | Nasadenie a overenie | Nasadiť šablónu pomocou `azd up` a overiť funkčnosť infraštruktúry | 30 min |
| **3. Demontáž** | Pochopenie štruktúry | Použiť GitHub Copilot na preskúmanie architektúry šablóny, Bicep súborov a organizácie kódu | 30 min |
| **4. Konfigurácia** | Hlboký ponor do azure.yaml | Ovládnuť konfiguráciu `azure.yaml`, životný cyklus hookov a premenné prostredia | 30 min |
| **5. Prispôsobenie** | Urobte si to svoje | Aktivovať AI Search, sledovanie, hodnotenie a prispôsobiť pre váš scenár | 45 min |
| **6. Ukončenie** | Upratanie | Bezpečne odstrániť zdroje pomocou `azd down --purge` | 15 min |
| **7. Zhrnutie** | Ďalšie kroky | Prejsť dosiahnuté výsledky, kľúčové koncepty a pokračovať v učení | 15 min |

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
# Možnosť 1: GitHub Codespaces (odporúčané)
# Kliknite na "Kód" → "Vytvoriť codespace na main" v repozitári

# Možnosť 2: Lokálny vývoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postupujte podľa inštrukcií na nastavenie v workshop/README.md
```

#### 🎯 Výsledky učenia workshopu
Po dokončení workshopu účastníci:
- **Nasadia produkčné AI aplikácie**: Použiť AZD s Microsoft Foundry službami
- **Ovládnu architektúry s viacerými agentmi**: Implementovať koordinované riešenia AI agentov
- **Aplikujú bezpečnostné najlepšie praktiky**: Konfigurovať autentifikáciu a riadenie prístupu
- **Optimalizujú pre škálovanie**: Navrhovať nákladovo efektívne a výkonné nasadenia
- **Riešia problémy nasadení**: Samostatne vyriešia bežné problémy

#### 📖 Materiály workshopu
- **🎥 Interaktívny sprievodca**: [Materiály workshopu](workshop/README.md) - Prostredie učenia v prehliadači
- **📋 Návody po moduloch**:
  - [0. Úvod](workshop/docs/instructions/0-Introduction.md) - Prehľad a ciele workshopu
  - [1. Výber](workshop/docs/instructions/1-Select-AI-Template.md) - Nájsť a vybrať AI šablóny
  - [2. Overovanie](workshop/docs/instructions/2-Validate-AI-Template.md) - Nasadiť a overiť šablóny
  - [3. Demontáž](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Preskúmať architektúru šablóny
  - [4. Konfigurácia](workshop/docs/instructions/4-Configure-AI-Template.md) - Ovládnuť azure.yaml
  - [5. Prispôsobenie](workshop/docs/instructions/5-Customize-AI-Template.md) - Prispôsobiť pre váš scenár
  - [6. Ukončenie](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Upratať zdroje
  - [7. Zhrnutie](workshop/docs/instructions/7-Wrap-up.md) - Prehľad a ďalšie kroky
- **🛠️ AI workshop laboratórium**: [AI workshop laboratórium](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-zamerané cvičenia
- **💡 Rýchly štart**: [Návod na nastavenie workshopu](workshop/README.md#quick-start) - Konfigurácia prostredia

**Ideálne pre**: Firemné školenia, univerzitné kurzy, samostatné učenie a bootcampy pre vývojárov.

---

## 📖 Hlboký ponor: Možnosti AZD

Mimo základov AZD ponúka silné funkcie pre produkčné nasadenia:

- **Nasadenia založené na šablónach** - Používanie predpripravených šablón pre bežné aplikačné vzory
- **Infraštruktúra ako kód** - Správa Azure zdrojov pomocou Bicep alebo Terraform  
- **Integrované pracovné postupy** - Plynulé zriaďovanie, nasadenie a monitorovanie aplikácií
- **Priateľský k vývojárom** - Optimalizované pre produktivitu a skúsenosť vývojárov

### **AZD + Microsoft Foundry: Perfektné pre nasadenia AI**

**Prečo používať AZD pre AI riešenia?** AZD rieši hlavné výzvy, ktorým čelia AI vývojári:

- **Šablóny pripravené na AI** - Predkonfigurované šablóny pre Microsoft Foundry modely, Azure AI služby a ML pracovné zaťaženia
- **Bezpečné nasadenie AI** - Zabudované bezpečnostné vzory pre AI služby, API kľúče a modelové endpointy  
- **Produkčné AI vzory** - Najlepšie praktiky pre škálovateľné, nákladovo efektívne nasadenia AI aplikácií
- **End-to-End AI pracovné postupy** - Od vývoja modelu po produkčné nasadenie s riadnym monitorovaním
- **Optimalizácia nákladov** - Inteligentné prideľovanie zdrojov a stratégie škálovania pre AI pracovné zaťaženia
- **Integrácia Microsoft Foundry** - Plynulé prepojenie s katalógom modelov a endpointmi Microsoft Foundry

---

## 🎯 Knižnica šablón a príkladov

### Odporúčané: Šablóny Microsoft Foundry
**Začnite tu, ak nasadzujete AI aplikácie!**

> **Poznámka:** Tieto šablóny demonštrujú rôzne AI vzory. Niektoré sú externé Azure Samples, iné sú lokálne implementácie.

| Šablóna | Kapitola | Zložitosť | Služby | Typ |
|----------|---------|------------|----------|------|
| [**Začať s AI chatom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externé |
| [**Začať s AI agentmi**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitola 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externé |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externé |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externé |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externé |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externé |
| [**Maloobchodné riešenie s viacerými agentmi**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokálne** |

### Odporúčané: Kompletné študijné scenáre
**Produkčné aplikačné šablóny priradené ku kapitolám učenia**

| Šablóna | Kapitola učenia | Zložitosť | Kľúčové učenie |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | Základné vzory nasadenia AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | Implementácia RAG s Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitola 4 | ⭐⭐ | Integrácia document intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | Agentný rámec a volanie funkcií |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐ | Podniková AI orchestrácia |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | Architektúra s viacerými agentmi so zákazníckymi a inventárnymi agentmi |

### Učenie podľa typu príkladu

> **📌 Lokálne vs. Externé príklady:**  
> **Lokálne príklady** (v tomto repozitári) = Ihneď pripravené na použitie  
> **Externé príklady** (Azure Samples) = Klonovať z prepojených repozytárov

#### Lokálne príklady (Ihneď použiteľné)
- [**Riešenie pre maloobchod s viacerými agentmi**](examples/retail-scenario.md) - Kompletná implementácia pripravená na produkciu s ARM šablónami
  - Architektúra s viacerými agentmi (zákaznícky a inventárny agent)
  - Komplexné monitorovanie a hodnotenie
  - Jedno-klikové nasadenie cez ARM šablónu

#### Lokálne príklady - Kontajnerové aplikácie (Kapitoly 2-5)
**Komplexné príklady nasadenia kontajnerov v tomto repozitári:**

- [**Príklady Container App**](examples/container-app/README.md) - Kompletný sprievodca kontajnerovými nasadeniami  
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api) - Základné REST API s možnosťou škálovania na nulu  
  - [Architektúra mikroservisov](../../examples/container-app/microservices) - Produkčne pripravené viacslužbové nasadenie  
  - Rýchly štart, produkčné a pokročilé vzory nasadenia  
  - Pokyny na monitorovanie, zabezpečenie a optimalizáciu nákladov  

#### Externé príklady - Jednoduché aplikácie (kapitoly 1-2)  
**Naklonujte si tieto úložiská Azure Samples na začiatok:**  
- [Jednoduchá webová aplikácia - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Základné vzory nasadenia  
- [Statická webstránka - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Nasadenie statického obsahu  
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Nasadenie REST API  

#### Externé príklady - Integrácia databázy (kapitoly 3-4)  
- [Databázová aplikácia - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzory pripojenia k databáze  
- [Funkcie + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless dátový pracovný tok  

#### Externé príklady - Pokročilé vzory (kapitoly 4-8)  
- [Java mikroservisy](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architektúry viacerých služieb  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Spracovanie na pozadí  
- [Enterprise ML pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkčne pripravené vzory ML  

### Externé kolekcie šablón  
- [**Oficiálna galéria šablón AZD**](https://azure.github.io/awesome-azd/) - Kurátorská kolekcia oficiálnych a komunitných šablón  
- [**Azure Developer CLI Šablóny**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentácia šablón Microsoft Learn  
- [**Adresár príkladov**](examples/README.md) - Lokálne vzdelávacie príklady s podrobnými vysvetleniami  

---

## 📚 Vzdelávacie zdroje a referencie  

### Rýchle odkazy  
- [**Príkazová príručka**](resources/cheat-sheet.md) - Základné príkazy azd organizované podľa kapitol  
- [**Glosár**](resources/glossary.md) - Terminológia Azure a azd  
- [**Často kladené otázky**](resources/faq.md) - Bežné otázky podľa vzdelávacích kapitol  
- [**Študijný sprievodca**](resources/study-guide.md) - Komplexné cvičenia na precvičovanie  

### Praktické workshopy  
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Urobte svoje AI riešenia nasaditeľné cez AZD (2-3 hodiny)  
- [**Interaktívny Workshop**](workshop/README.md) - 8-modulové vedené cvičenie s MkDocs a GitHub Codespaces  
  - Nasleduje: Úvod → Výber → Validácia → Demontáž → Konfigurácia → Prispôsobenie → Ukončenie → Zhrnutie  

### Externé vzdelávacie zdroje  
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Centrum architektúry Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Kalkulačka cien Azure](https://azure.microsoft.com/pricing/calculator/)  
- [Stav Azure](https://status.azure.com/)  

### Zručnosti AI agenta pre váš editor  
- [**Microsoft Azure zručnosti na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otvorených zručností agenta pre Azure AI, Foundry, nasadenie, diagnostiku, optimalizáciu nákladov a ďalšie. Nainštalujte ich v GitHub Copilot, Cursor, Claude Code alebo inom podporovanom agente:  
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Rýchly sprievodca riešením problémov  

**Bežné problémy, s ktorými sa začiatočníci stretávajú, a okamžité riešenia:**  

<details>
<summary><strong>❌ "azd: príkaz nebol nájdený"</strong></summary>

```bash
# Najprv nainštalujte AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Overiť inštaláciu
azd version
```
</details>

<details>
<summary><strong>❌ "Nenašla sa žiadna predplatná" alebo "Predplatné nie je nastavené"</strong></summary>

```bash
# Zoznam dostupných predplatných
az account list --output table

# Nastaviť predvolené predplatné
az account set --subscription "<subscription-id-or-name>"

# Nastaviť pre prostredie AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Overiť
az account show
```
</details>

<details>
<summary><strong>❌ "Nedostatok kvóty" alebo "Kvóta prekročená"</strong></summary>

```bash
# Vyskúšajte inú oblasť Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Alebo použite menšie SKU v vývoji
# Upraviť infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" zlyhá v polovici</strong></summary>

```bash
# Možnosť 1: Vyčistiť a skúsiť znova
azd down --force --purge
azd up

# Možnosť 2: Iba opraviť infraštruktúru
azd provision

# Možnosť 3: Skontrolovať podrobný stav
azd show

# Možnosť 4: Skontrolovať denníky v Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Overenie zlyhalo" alebo "Token expiroval"</strong></summary>

```bash
# Opätovne sa autentifikujte pre AZD
azd auth logout
azd auth login

# Voliteľné: obnovte aj Azure CLI, ak spúšťate príkazy az
az logout
az login

# Overte autentifikáciu
az account show
```
</details>

<details>
<summary><strong>❌ "Zdroje už existujú" alebo konflikty v názvoch</strong></summary>

```bash
# AZD generuje jedinečné názvy, ale ak nastane konflikt:
azd down --force --purge

# Potom skúste znova s novým prostredím
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Nasadenie šablóny trvá príliš dlho</strong></summary>

**Bežné časy čakania:**  
- Jednoduchá webová aplikácia: 5-10 minút  
- Aplikácia s databázou: 10-15 minút  
- AI aplikácie: 15-25 minút (provízia OpenAI je pomalá)  

```bash
# Skontrolovať priebeh
azd show

# Ak je pozastavené >30 minút, skontrolujte Azure portál:
azd monitor --overview
# Vyhľadať zlyhané nasadenia
```
</details>

<details>
<summary><strong>❌ "Prístup odmietnutý" alebo "Zakázané"</strong></summary>

```bash
# Skontrolujte svoju rolu v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebujete aspoň rolu "Prispievateľ"
# Požiadajte svojho administrátora Azure, aby vám udelil:
# - Prispievateľ (pre zdroje)
# - Správca prístupu používateľov (pre priradenia rolí)
```
</details>

<details>
<summary><strong>❌ Nemožno nájsť URL nasadenej aplikácie</strong></summary>

```bash
# Zobraziť všetky koncové body služby
azd show

# Alebo otvorte Azure portál
azd monitor

# Skontrolujte konkrétnu službu
azd env get-values
# Vyhľadajte premenné *_URL
```
</details>

### 📚 Plné zdroje na riešenie problémov  

- **Sprievodca bežnými problémami:** [Podrobné riešenia](docs/chapter-07-troubleshooting/common-issues.md)  
- **Problémy špecifické pre AI:** [AI Riešenie problémov](docs/chapter-07-troubleshooting/ai-troubleshooting.md)  
- **Sprievodca ladením:** [Krok za krokom ladenie](docs/chapter-07-troubleshooting/debugging.md)  
- **Získajte pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli  

---

## 🎓 Dokončenie kurzu a certifikácia  

### Sledovanie pokroku  
Sledujte svoj pokrok v učení pre každú kapitolu:  

- [ ] **Kapitola 1**: Základy a Rýchly štart ✅  
- [ ] **Kapitola 2**: Vývoj zameraný na AI ✅  
- [ ] **Kapitola 3**: Konfigurácia a overovanie ✅  
- [ ] **Kapitola 4**: Infraštruktúra ako kód a nasadenie ✅  
- [ ] **Kapitola 5**: Viacagentové AI riešenia ✅  
- [ ] **Kapitola 6**: Prednasadenie validácie a plánovania ✅  
- [ ] **Kapitola 7**: Riešenie problémov a ladenie ✅  
- [ ] **Kapitola 8**: Produkčné a podnikové vzory ✅  

### Overenie znalostí  
Po dokončení každej kapitoly overte svoje znalosti:  
1. **Praktické cvičenie**: Dokončite praktické nasadenie kapitoly  
2. **Kontrola znalostí**: Prezrite si sekciu FAQ pre vašu kapitolu  
3. **Diskusia v komunite**: Podeľte sa o skúsenosti na Azure Discord  
4. **Ďalšia kapitola**: Pokračujte na ďalšiu úroveň zložitosti  

### Výhody dokončenia kurzu  
Po dokončení všetkých kapitol získate:  
- **Produkčné skúsenosti**: Nasadené skutočné AI aplikácie do Azure  
- **Profesionálne zručnosti**: Schopnosti nasadenia pripravené na podnikové prostredie  
- **Uznanie komunity**: Aktívny člen Azure developer komunity  
- **Kariérny postup**: Žiadané znalosti nasadenia AZD a AI  

---

## 🤝 Komunita & Podpora  

### Získajte pomoc a podporu  
- **Technické problémy**: [Nahláste chyby a žiadajte o funkcie](https://github.com/microsoft/azd-for-beginners/issues)  
- **Otázky k učeniu**: [Microsoft Azure Discord komunita](https://discord.gg/microsoft-azure) a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **Pomoc špecifická pre AI**: Pridajte sa k [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **Dokumentácia**: [Oficiálna dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Prehľady komunity z Microsoft Foundry Discord  

**Aktuálne výsledky hlasovania z kanála #Azure:**  
- **45%** vývojárov chce používať AZD pre AI pracovné záťaže  
- **Hlavné výzvy**: Nasadenia viacerých služieb, správa poverení, pripravenosť na produkciu  
- **Najčastejšie požadované**: AI-špecifické šablóny, návody na riešenie problémov, najlepšie praktiky  

**Pridajte sa ku komunite, aby ste:**  
- Zdieľali svoje AZD + AI skúsenosti a získali pomoc  
- Mali prístup k skorým ukážkam nových AI šablón  
- Prispievali k najlepším praktikám nasadenia AI  
- Ovplyvňovali budúci vývoj AI + AZD funkcií  

### Príspevky do kurzu  
Vitáme príspevky! Prečítajte si náš [Sprievodca príspevkami](CONTRIBUTING.md) pre podrobnosti o:  
- **Vylepšenie obsahu**: Vylepšite existujúce kapitoly a príklady  
- **Nové príklady**: Pridajte reálne scenáre a šablóny  
- **Preklad**: Pomôžte udržiavať podporu viacerých jazykov  
- **Hlásenia chýb**: Zlepšite presnosť a jasnosť  
- **Komunitné štandardy**: Dodržujte naše inkluzívne komunitné pravidlá  

---

## 📄 Informácie o kurze  

### Licencia  
Tento projekt je licencovaný pod MIT licenciou - pozrite si súbor [LICENSE](../../LICENSE) pre viac informácií.  

### Súvisiace vzdelávacie zdroje Microsoftu  

Náš tím vytvára ďalšie komplexné vzdelávacie kurzy:  

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain  
[![LangChain4j pre začiatočníkov](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)  
[![LangChain.js pre začiatočníkov](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)  
[![LangChain pre začiatočníkov](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)  
---

### Azure / Edge / MCP / Agent  
[![AZD pre začiatočníkov](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![Edge AI pre začiatočníkov](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![MCP pre začiatočníkov](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![AI Agent pre začiatočníkov](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  

---
 
### Séria Generatívnej AI  
[![Generatívna AI pre začiatočníkov](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![Generatívna AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
[![Generatívna AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  

[![Generatívna AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Základné učenie
[![ML pre Začiatočníkov](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Dáta Science pre Začiatočníkov](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI pre Začiatočníkov](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kyberbezpečnosť pre Začiatočníkov](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev pre Začiatočníkov](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pre Začiatočníkov](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Vývoj pre Začiatočníkov](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Séria Copilot
[![Copilot pre AI Párované Programovanie](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pre C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Dobrodružstvo](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigácia v kurze

**🚀 Pripravení začať sa učiť?**

**Začiatočníci**: Začnite s [Kapitola 1: Základy a Rýchly štart](#-chapter-1-foundation--quick-start)  
**Vývojári AI**: Preskočte na [Kapitola 2: AI-prvý vývoj](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Skúsení vývojári**: Začnite s [Kapitola 3: Konfigurácia a autentifikácia](#️-chapter-3-configuration--authentication)

**Ďalšie kroky**: [Začať Kapitolu 1 - Základy AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->