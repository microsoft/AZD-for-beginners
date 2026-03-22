# AZD pre začiatočníkov: Struktúrovaná vzdelávacia cesta

![AZD pre začiatočníkov](../../translated_images/sk/azdbeginners.5527441dd9f74068.webp) 

[![GitHub sledovatelia](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forky](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub hviezdy](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatické preklady (vždy aktuálne)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabčina](../ar/README.md) | [Bengálčina](../bn/README.md) | [Bulharčina](../bg/README.md) | [Barmský (Myanmar)](../my/README.md) | [Čínština (zjednodušená)](../zh-CN/README.md) | [Čínština (tradičná, Hong Kong)](../zh-HK/README.md) | [Čínština (tradičná, Macau)](../zh-MO/README.md) | [Čínština (tradičná, Taiwan)](../zh-TW/README.md) | [Chorvátčina](../hr/README.md) | [Čeština](../cs/README.md) | [Dánčina](../da/README.md) | [Nizozemčina](../nl/README.md) | [Estónčina](../et/README.md) | [Fínčina](../fi/README.md) | [Francúzština](../fr/README.md) | [Nemčina](../de/README.md) | [Gréčtina](../el/README.md) | [Hebrejčina](../he/README.md) | [Hindčina](../hi/README.md) | [Maďarčina](../hu/README.md) | [Indonézština](../id/README.md) | [Taliančina](../it/README.md) | [Japončina](../ja/README.md) | [Kannadčina](../kn/README.md) | [Kórejčina](../ko/README.md) | [Litovčina](../lt/README.md) | [Malajčina](../ms/README.md) | [Malayalam](../ml/README.md) | [Maráthčina](../mr/README.md) | [Nepálčina](../ne/README.md) | [Nigérijský pidžin](../pcm/README.md) | [Norština](../no/README.md) | [Perzština (Farsi)](../fa/README.md) | [Poľština](../pl/README.md) | [Portugalčina (Brazília)](../pt-BR/README.md) | [Portugalčina (Portugalsko)](../pt-PT/README.md) | [Pandžábčina (Gurmukhi)](../pa/README.md) | [Rumunčina](../ro/README.md) | [Ruština](../ru/README.md) | [Srbčina (cyrilika)](../sr/README.md) | [Slovenčina](./README.md) | [Slovinčina](../sl/README.md) | [Španielčina](../es/README.md) | [Svahilčina](../sw/README.md) | [Švédčina](../sv/README.md) | [Tagalog (Filipíny)](../tl/README.md) | [Tamilčina](../ta/README.md) | [Telugčina](../te/README.md) | [Thajčina](../th/README.md) | [Turečtina](../tr/README.md) | [Ukrajinčina](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamčina](../vi/README.md)

> **Preferujete klonovanie lokálne?**
>
> Tento repozitár obsahuje viac ako 50 prekladov do rôznych jazykov, čo výrazne zväčšuje veľkosť na stiahnutie. Ak chcete klonovať bez prekladov, použite sparse checkout:
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
> Toto vám poskytne všetko potrebné na dokončenie kurzu s omnoho rýchlejším stiahnutím.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Čo je dnes nové v azd

Azure Developer CLI sa rozšíril nad rámec tradičných webových aplikácií a API. Dnes je azd jediným nástrojom na nasadzovanie akýchkoľvek aplikácií do Azure — vrátane aplikácií s podporou AI a inteligentných agentov.

Čo to pre vás znamená:

- **AI agenti sú teraz prvotriednymi pracovnými záťažami azd.** Môžete inicializovať, nasadzovať a spravovať projekty AI agentov pomocou toho istého workflow `azd init` → `azd up`, ktoré už poznáte.
- **Integrácia Microsoft Foundry** prináša nasadzovanie modelov, hostovanie agentov a konfiguráciu AI služieb priamo do ekosystému azd šablón.
- **Základný workflow sa nezmenil.** Či už nasadzujete todo appku, mikroslužbu alebo multi-agentné AI riešenie, príkazy sú rovnaké.

Ak ste už azd používali, podpora AI je prirodzeným rozšírením — nie samostatným nástrojom ani pokročilou vetvou. Ak začínate, naučíte sa jeden workflow, ktorý funguje pre všetko.

---

## 🚀 Čo je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je pre vývojárov priateľský nástroj príkazového riadku, ktorý uľahčuje nasadzovanie aplikácií do Azure. Namiesto manuálneho vytvárania a prepájania desiatok Azure zdrojov môžete nasadiť celé aplikácie jedným príkazom.

### Kúzlo `azd up`

```bash
# Tento jediný príkaz robí všetko:
# ✅ Vytvorí všetky Azure zdroje
# ✅ Nakonfiguruje sieťovanie a zabezpečenie
# ✅ Zostaví váš aplikačný kód
# ✅ Nasadí do Azure
# ✅ Poskytne vám funkčný URL
azd up
```

**To je všetko!** Žiadne klikanie v Azure Portáli, žiadne zložité ARM šablóny, ktoré by ste si museli najskôr naštudovať, žiadna manuálna konfigurácia — len fungujúce aplikácie v Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Aký je rozdiel?

Toto je najčastejšia otázka, ktorú začínajúci kladú. Tu je jednoduchá odpoveď:

| Funkcia | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Účel** | Spravovať jednotlivé Azure zdroje | Nasadzovať kompletné aplikácie |
| **Pohľad** | Zameranie na infraštruktúru | Zameranie na aplikáciu |
| **Príklad** | `az webapp create --name myapp...` | `azd up` |
| **Krivka učenia** | Musíte poznať Azure služby | Stačí poznať svoju aplikáciu |
| **Najvhodnejšie pre** | DevOps, infraštruktúru | Vývojárov, prototypovanie |

### Jednoduchá analógia

- **Azure CLI** je ako mať všetky náradie na stavbu domu — kladivá, píly, klince. Môžete postaviť čokoľvek, ale musíte poznať stavebníctvo.
- **Azure Developer CLI** je ako najať si dodávateľa — opíšete, čo chcete, a on sa postará o výstavbu.

### Kedy použiť ktoré

| Scenár | Použiť toto |
|----------|----------|
| "Chcem rýchlo nasadiť moju web aplikáciu" | `azd up` |
| "Potrebujem vytvoriť len storage account" | `az storage account create` |
| "Staviam plnú AI aplikáciu" | `azd init --template azure-search-openai-demo` |
| "Potrebujem debugovať konkrétny Azure zdroj" | `az resource show` |
| "Chcem produkčné nasadenie za pár minút" | `azd up --environment production` |

### Spolupracujú!

AZD používa Azure CLI na pozadí. Môžete používať obidva:
```bash
# Nasadte svoju aplikáciu pomocou AZD
azd up

# Potom dolaďte konkrétne zdroje pomocou Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Nájdite šablóny v Awesome AZD

Nevychádzajte z nuly! **Awesome AZD** je komunitná zbierka šablón pripravených na nasadenie:

| Zdroj | Popis |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Prehľadávajte viac než 200 šablón s nasadením jedným kliknutím |
| 🔗 [**Odošlite šablónu**](https://github.com/Azure/awesome-azd/issues) | Prispievajte vlastnou šablónou komunite |
| 🔗 [**GitHub Repozitár**](https://github.com/Azure/awesome-azd) | Dajte hviezdičku a preskúmajte zdrojový kód |

### Populárne AI šablóny z Awesome AZD

```bash
# RAG chat s modelmi Microsoft Foundry + AI vyhľadávanie
azd init --template azure-search-openai-demo

# Rýchla AI chatová aplikácia
azd init --template openai-chat-app-quickstart

# AI agenti s Foundry agentmi
azd init --template get-started-with-ai-agents
```

---

## 🎯 Začnite v 3 krokoch

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

### Krok 2: Prihláste sa do Azure

```bash
azd auth login
```

### Krok 3: Nasadiť svoju prvú aplikáciu

```bash
# Inicializovať z šablóny
azd init --template todo-nodejs-mongo

# Nasadiť do Azure (vytvorí všetko!)
azd up
```

**🎉 Hotovo!** Vaša aplikácia je teraz online na Azure.

### Vyčistenie (nezabudnite!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Ako používať tento kurz

Tento kurz je navrhnutý pre **postupné učenie** — začnite tam, kde sa cítite pohodlne, a postupujte ďalej:

| Vaše skúsenosti | Začnite tu |
|-----------------|------------|
| **Úplný začiatočník v Azure** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Poznáte Azure, ste nový v AZD** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Chcete nasadzovať AI aplikácie** | [Kapitola 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Chcete praktické cvičenia** | [🎓 Interaktívny workshop](workshop/README.md) - 3-4 hodinové prevedené laboratórium |
| **Potrebujete produkčné vzory** | [Kapitola 8: Produkcia & enterprise](#-chapter-8-production--enterprise-patterns) |

### Rýchle nastavenie

1. **Vytvorte fork tohto repozitára**: [![GitHub forky](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Naklonujte ho**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Získajte pomoc**: [Komunita Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Preferujete klonovanie lokálne?**
>
> Tento repozitár obsahuje viac ako 50 prekladov do rôznych jazykov, čo výrazne zväčšuje veľkosť na stiahnutie. Ak chcete klonovať bez prekladov, použite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Toto vám poskytne všetko potrebné na dokončenie kurzu s omnoho rýchlejším stiahnutím.


## Prehľad kurzu

Osvojte si Azure Developer CLI (azd) prostredníctvom štruktúrovaných kapitol navrhnutých pre postupné učenie. **Osobitný dôraz na nasadzovanie AI aplikácií s integráciou Microsoft Foundry.**

### Prečo je tento kurz nevyhnutný pre moderných vývojárov

Na základe poznatkov z komunity Microsoft Foundry Discord, **45 % vývojárov chce používať AZD pre AI pracovné záťaže**, ale stretáva sa s problémami pri:
- Zložitých viac-službových AI architektúrach
- Najlepších postupoch pri produkčnom nasadzovaní AI  
- Integrácii a konfigurácii Azure AI služieb
- Optimalizácii nákladov pre AI pracovné záťaže
- Riešení problémov špecifických pre nasadzovanie AI

### Vzdelávacie ciele

Po dokončení tohto štruktúrovaného kurzu budete:
- **Ovládať základy AZD**: Kľúčové koncepty, inštalácia a konfigurácia
- **Nasadzovať AI aplikácie**: Používať AZD s Microsoft Foundry službami
- **Implementovať Infrastructure as Code**: Spravovať Azure zdroje pomocou Bicep šablón
- **Riešiť problémy s nasadením**: Odstraňovať bežné chyby a debugovať problémy
- **Optimalizovať pre produkciu**: Bezpečnosť, škálovanie, monitorovanie a riadenie nákladov
- **Stavať multi-agentné riešenia**: Nasadzovať zložité AI architektúry

## 🗺️ Mapa kurzu: Rýchla navigácia podľa kapitol

Každá kapitola má samostatný README s učebnými cieľmi, rýchlym štartom a cvičeniami:

| Kapitola | Téma | Lekcie | Trvanie | Komplexnosť |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Začíname | [Základy AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Inštalácia](docs/chapter-01-foundation/installation.md) &#124; [Prvý projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap. 2: Vývoj AI](docs/chapter-02-ai-development/README.md)** | Aplikácie orientované na AI | [Integrácia Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agenti](docs/chapter-02-ai-development/agents.md) &#124; [Nasadenie modelu](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hod. | ⭐⭐ |
| **[Kap. 3: Konfigurácia](docs/chapter-03-configuration/README.md)** | Overenie a bezpečnosť | [Konfigurácia](docs/chapter-03-configuration/configuration.md) &#124; [Autentifikácia a bezpečnosť](docs/chapter-03-configuration/authsecurity.md) | 45-60 min. | ⭐⭐ |
| **[Kap. 4: Infraštruktúra](docs/chapter-04-infrastructure/README.md)** | IaC & Nasadenie | [Príručka nasadenia](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hod. | ⭐⭐⭐ |
| **[Kap. 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Riešenia AI agentov | [Retail Scenario](examples/retail-scenario.md) &#124; [Koordinačné vzory](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hod. | ⭐⭐⭐⭐ |
| **[Kap. 6: Prednasadenie](docs/chapter-06-pre-deployment/README.md)** | Plánovanie & Overenie | [Prednasadzovacie kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Plánovanie kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Výber SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hod. | ⭐⭐ |
| **[Kap. 7: Riešenie problémov](docs/chapter-07-troubleshooting/README.md)** | Ladenie & Opravy | [Bežné problémy](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Ladenie](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problémy](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hod. | ⭐⭐ |
| **[Kap. 8: Produkcia](docs/chapter-08-production/README.md)** | Podnikové vzory | [Produkčné postupy](docs/chapter-08-production/production-ai-practices.md) | 2-3 hod. | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktický lab | [Úvod](workshop/docs/instructions/0-Introduction.md) &#124; [Výber](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Overenie](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstrukcia](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurácia](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prispôsobenie](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Uvoľnenie](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zhrnutie](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hod. | ⭐⭐ |

**Celková dĺžka kurzu:** ~10-14 hodín | **Pokrok v zručnostiach:** Začiatočník → Pripravený na produkciu

---

## 📚 Učebné kapitoly

*Vyberte si učebnú cestu na základe úrovne skúseností a cieľov*

### 🚀 Kapitola 1: Základy a rýchly štart
**Predpoklady**: Predplatné Azure, základné znalosti príkazového riadku  
**Dĺžka**: 30-45 minút  
**Zložitosť**: ⭐

#### Čo sa naučíte
- Pochopenie základov Azure Developer CLI
- Inštalácia AZD na vašej platforme
- Vaše prvé úspešné nasadenie

#### Vzdelávacie zdroje
- **🎯 Začnite tu**: [Čo je Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teória**: [Základy AZD](docs/chapter-01-foundation/azd-basics.md) - Základné koncepcie a terminológia
- **⚙️ Nastavenie**: [Inštalácia a nastavenie](docs/chapter-01-foundation/installation.md) - Návody pre konkrétne platformy
- **🛠️ Prakticky**: [Váš prvý projekt](docs/chapter-01-foundation/first-project.md) - Návod krok za krokom
- **📋 Rýchly prehľad**: [Zoznam príkazov](resources/cheat-sheet.md)

#### Praktické cvičenia
```bash
# Rýchla kontrola inštalácie
azd version

# Nasaďte svoju prvú aplikáciu
azd init --template todo-nodejs-mongo
azd up
```

**💡 Výsledok kapitoly**: Úspešne nasadiť jednoduchú webovú aplikáciu do Azure pomocou AZD

**✅ Overenie úspechu:**
```bash
# Po dokončení kapitoly 1 by ste mali byť schopní:
azd version              # Zobrazuje nainštalovanú verziu
azd init --template todo-nodejs-mongo  # Inicializuje projekt
azd up                  # Nasadí do Azure
azd show                # Zobrazuje URL bežiacej aplikácie
# Aplikácia sa otvorí v prehliadači a funguje
azd down --force --purge  # Uvoľní zdroje
```

**📊 Časová náročnosť:** 30-45 minút  
**📈 Úroveň zručností po:** Dokáže nezávisle nasadiť základné aplikácie
**📈 Úroveň zručností po:** Dokáže nezávisle nasadiť základné aplikácie

---

### 🤖 Kapitola 2: Vývoj orientovaný na AI (Odporúčané pre AI vývojárov)
**Predpoklady**: Kapitola 1 dokončená  
**Dĺžka**: 1-2 hodiny  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Integrácia Microsoft Foundry s AZD
- Nasadzovanie aplikácií založených na AI
- Pochopenie konfigurácií AI služieb

#### Vzdelávacie zdroje
- **🎯 Začnite tu**: [Integrácia Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agenti**: [Sprievodca AI agentmi](docs/chapter-02-ai-development/agents.md) - Nasadzujte inteligentných agentov s AZD
- **📖 Vzory**: [Nasadenie AI modelu](docs/chapter-02-ai-development/ai-model-deployment.md) - Nasadzujte a spravujte AI modely
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pripravte svoje AI riešenia na AZD
- **🎥 Interaktívny sprievodca**: [Materiály workshopu](workshop/README.md) - Vzdelávanie v prehliadači s MkDocs * DevContainer Environment
- **📋 Šablóny**: [Microsoft Foundry šablóny](#zdroje-workshopu)
- **📝 Príklady**: [Príklady nasadenia AZD](examples/README.md)

#### Praktické cvičenia
```bash
# Nasadiť svoju prvú AI aplikáciu
azd init --template azure-search-openai-demo
azd up

# Vyskúšajte ďalšie AI šablóny
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Výsledok kapitoly**: Nasadiť a nakonfigurovať chatovaciu aplikáciu založenú na AI s RAG schopnosťami

**✅ Overenie úspechu:**
```bash
# Po kapitole 2 by ste mali byť schopní:
azd init --template azure-search-openai-demo
azd up
# Otestovať rozhranie AI chatu
# Položiť otázky a získať odpovede generované umelou inteligenciou vrátane zdrojov
# Overiť, že integrácia vyhľadávania funguje
azd monitor  # Skontrolovať, či Application Insights zobrazuje telemetriu
azd down --force --purge
```

**📊 Časová náročnosť:** 1-2 hodiny  
**📈 Úroveň zručností po:** Dokáže nasadiť a nakonfigurovať produkčné AI aplikácie  
**💰 Povedomie o nákladoch:** Pochopiť náklady na vývoj $80-150/mesiac, produkčné náklady $300-3500/mesiac

#### 💰 Úvahy o nákladoch pri nasadení AI

**Vývojové prostredie (odhad $80-150/mesiac):**
- Modely Microsoft Foundry (platba podľa spotreby): $0-50/mesiac (na základe používania tokenov)
- AI Search (základná úroveň): $75/mesiac
- Container Apps (Spotreba): $0-20/mesiac
- Úložisko (štandardné): $1-5/mesiac

**Produktívne prostredie (odhad $300-3,500+/mesiac):**
- Modely Microsoft Foundry (PTU pre konzistentný výkon): $3,000+/mesiac OR platba podľa spotreby pri vysokom objeme
- AI Search (štandardná úroveň): $250/mesiac
- Container Apps (dedikované): $50-100/mesiac
- Application Insights: $5-50/mesiac
- Úložisko (prémiové): $10-50/mesiac

**💡 Tipy na optimalizáciu nákladov:**
- Používajte Microsoft Foundry modely v bezplatnej úrovni na učenie (Azure OpenAI 50,000 tokenov/mesiac zahrnuté)
- Spustite `azd down` na uvoľnenie zdrojov, keď práve nevyvíjate
- Začnite s účtovaním podľa spotreby, na PTU prejdite len v produkcii
- Použite `azd provision --preview` na odhad nákladov pred nasadením
- Povoliť automatické škálovanie: platíte len za skutočné využitie

**Sledovanie nákladov:**
```bash
# Skontrolujte odhadované mesačné náklady
azd provision --preview

# Sledujte skutočné náklady v Azure portáli
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitola 3: Konfigurácia a autentifikácia
**Predpoklady**: Kapitola 1 dokončená  
**Dĺžka**: 45-60 minút  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Konfigurácia a správa prostredí
- Autentifikácia a najlepšie bezpečnostné postupy
- Pomenovanie a organizácia zdrojov

#### Vzdelávacie zdroje
- **📖 Konfigurácia**: [Príručka konfigurácie](docs/chapter-03-configuration/configuration.md) - Nastavenie prostredia
- **🔐 Bezpečnosť**: [Autentifikačné vzory a spravovaná identita](docs/chapter-03-configuration/authsecurity.md) - Autentifikačné vzory
- **📝 Príklady**: [Príklad databázovej aplikácie](examples/database-app/README.md) - AZD príklady databázy

#### Praktické cvičenia
- Nakonfigurujte viacero prostredí (dev, staging, prod)
- Nastavte autentifikáciu pomocou spravovanej identity
- Implementujte konfigurácie špecifické pre prostredie

**💡 Výsledok kapitoly**: Spravovať viacero prostredí s primeranou autentifikáciou a bezpečnosťou

---

### 🏗️ Kapitola 4: Infraštruktúra ako kód a nasadenie
**Predpoklady**: Kapitoly 1-3 dokončené  
**Dĺžka**: 1-1.5 hodiny  
**Zložitosť**: ⭐⭐⭐

#### Čo sa naučíte
- Pokročilé vzory nasadzovania
- Infrastruktúra ako kód s Bicep
- Stratégie poskytovania zdrojov

#### Vzdelávacie zdroje
- **📖 Nasadenie**: [Príručka nasadenia](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletné pracovné postupy
- **🏗️ Provisioning**: [Poskytovanie zdrojov](docs/chapter-04-infrastructure/provisioning.md) - Správa Azure zdrojov
- **📝 Príklady**: [Príklad Container App](../../examples/container-app) - Nasadenia v kontajneroch

#### Praktické cvičenia
- Vytvorte vlastné Bicep šablóny
- Nasaďte viacslužbové aplikácie
- Implementujte stratégie blue-green nasadenia

**💡 Výsledok kapitoly**: Nasadiť zložité viacslužbové aplikácie pomocou vlastných infraštruktúrnych šablón

---

### 🎯 Kapitola 5: Riešenia s viacerými agentmi AI (Pokročilé)
**Predpoklady**: Kapitoly 1-2 dokončené  
**Dĺžka**: 2-3 hodiny  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Vzory architektúry viacerých agentov
- Orchestrace a koordinácia agentov
- Produkčné AI nasadenia

#### Vzdelávacie zdroje
- **🤖 Vybraný projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Kompletná implementácia
- **🛠️ ARM šablóny**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Nasadenie jedným klikom
- **📖 Architektúra**: [Vzory koordinácie viacerých agentov](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzory

#### Praktické cvičenia
```bash
# Nasadiť kompletné maloobchodné viacagentové riešenie
cd examples/retail-multiagent-arm-template
./deploy.sh

# Preskúmať konfigurácie agentov
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Výsledok kapitoly**: Nasadiť a spravovať produkčné riešenie AI s viacerými agentmi s agentmi zákazníka a inventára

---

### 🔍 Kapitola 6: Overenie a plánovanie pred nasadením
**Predpoklady**: Kapitola 4 dokončená  
**Dĺžka**: 1 hodina  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Plánovanie kapacity a overenie zdrojov
- Stratégie výberu SKU
- Prednasadzovacie kontroly a automatizácia

#### Vzdelávacie zdroje
- **📊 Plánovanie**: [Plánovanie kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) - Overenie zdrojov
- **💰 Výber**: [Výber SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Nákladovo efektívne možnosti
- **✅ Overenie**: [Prednasadzovacie kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktické cvičenia
- Spustite skripty na overenie kapacity
- Optimalizujte výber SKU z hľadiska nákladov
- Implementujte automatizované kontroly pred nasadením

**💡 Výsledok kapitoly**: Overiť a optimalizovať nasadenia pred vykonaním

---

### 🚨 Kapitola 7: Riešenie problémov a ladenie
**Predpoklady**: Akákoľvek kapitola o nasadení dokončená  
**Dĺžka**: 1-1.5 hodiny  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Systematické prístupy k ladeniu
- Bežné problémy a riešenia
- Riešenie problémov špecifických pre AI

#### Vzdelávacie zdroje
- **🔧 Bežné problémy**: [Bežné problémy](docs/chapter-07-troubleshooting/common-issues.md) - FAQ a riešenia
- **🕵️ Ladenie**: [Príručka ladenia](docs/chapter-07-troubleshooting/debugging.md) - Postupy krok za krokom
- **🤖 AI problémy**: [Riešenie problémov pre AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problémy AI služieb

#### Praktické cvičenia
- Diagnostikujte zlyhania nasadenia
- Riešte problémy s autentifikáciou
- Ladenie konektivity AI služieb

**💡 Výsledok kapitoly**: Nezávisle diagnostikovať a riešiť bežné problémy s nasadením

---

### 🏢 Kapitola 8: Produkčné a podnikové vzory
**Predpoklady**: Kapitoly 1-4 dokončené  
**Dĺžka**: 2-3 hodiny  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Stratégie produkčného nasadenia
- Podnikové bezpečnostné vzory
- Monitorovanie a optimalizácia nákladov

#### Vzdelávacie zdroje
- **🏭 Production**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Vzory pre podnikové nasadenia
- **📝 Examples**: [Microservices Example](../../examples/microservices) - Komplexné architektúry
- **📊 Monitoring**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitorovanie

#### Praktické cvičenia
- Implementujte bezpečnostné vzory pre podnikové prostredie
- Nastavte komplexné monitorovanie
- Nasadzujte do produkcie s riadnym riadením a guvernancom

**💡 Výsledok kapitoly**: Nasadiť aplikácie pripravené na podnikové prostredie s plnými produkčnými schopnosťami

---

## 🎓 Prehľad workshopu: Praktické skúsenosti

> **⚠️ STAV WORKSHOPU: Aktívny vývoj**  
> Materiály workshopu sú momentálne vo vývoji a dolaďovaní. Základné moduly sú funkčné, ale niektoré pokročilé časti sú neúplné. Aktívne pracujeme na dokončení celého obsahu. [Sledovať pokrok →](workshop/README.md)

### Interaktívne materiály workshopu
**Komplexné praktické učenie s nástrojmi v prehliadači a riadenými cvičeniami**

Naše materiály workshopu poskytujú štruktúrovaný, interaktívny zážitok, ktorý dopĺňa vyššie uvedené kapitoly. Workshop je navrhnutý pre samostatné tempo učenia aj pre vedené hodiny inštruktorom.

#### 🛠️ Funkcie workshopu
- **Rozhranie v prehliadači**: Kompletný workshop poháňaný MkDocs s vyhľadávaním, kopírovaním a témami
- **Integrácia GitHub Codespaces**: Jedno-klikové nastavenie vývojového prostredia
- **Štruktúrovaná učebná cesta**: 8-modulové riadené cvičenia (3–4 hodiny spolu)
- **Progresívna metodika**: Úvod → Výber → Overenie → Dekonštrukcia → Konfigurácia → Prispôsobenie → Vyčistenie → Zhrnutie
- **Interaktívne DevContainer prostredie**: Predkonfigurované nástroje a závislosti

#### 📚 Štruktúra modulov workshopu
Workshop nasleduje **8-modulovú progresívnu metodiku**, ktorá vás prevedie od objavovania po majstrovské nasadenie:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 min |
| **1. Selection** | Template Discovery | Explore AZD templates and select the right AI template for your scenario | 20 min |
| **2. Validation** | Deploy & Verify | Deploy the template with `azd up` and validate infrastructure works | 30 min |
| **3. Deconstruction** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 min |
| **5. Customization** | Make It Yours | Enable AI Search, tracing, evaluation, and customize for your scenario | 45 min |
| **6. Teardown** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 min |
| **7. Wrap-up** | Next Steps | Review accomplishments, key concepts, and continue your learning journey | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Začíname s workshopom
```bash
# Možnosť 1: GitHub Codespaces (Odporúčané)
# Kliknite na "Code" → "Create codespace on main" v repozitári

# Možnosť 2: Lokálny vývoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postupujte podľa pokynov na nastavenie v workshop/README.md
```

#### 🎯 Výstupy učenia z workshopu
Dokončením workshopu účastníci:
- **Nasadia produkčné AI aplikácie**: Použijú AZD s Microsoft Foundry službami
- **Ovládnu architektúry s viacerými agentmi**: Implementujú koordinované riešenia AI agentov
- **Implementujú bezpečnostné osvedčené postupy**: Nakonfigurujú autentifikáciu a riadenie prístupu
- **Optimalizujú pre škálovanie**: Navrhnú nákladovo efektívne a výkonné nasadenia
- **Riešia problémy s nasadením**: Nezávisle odstraňujú bežné problémy

#### 📖 Zdroje workshopu
- **🎥 Interaktívny sprievodca**: [Workshop Materials](workshop/README.md) - Prostredie učenia v prehliadači
- **📋 Pokyny modul po module**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Prehľad workshopu a ciele
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Nájdenie a výber AI šablón
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Nasadenie a overenie šablón
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Preskúmanie architektúry šablóny
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Ovládnutie azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Prispôsobenie pre váš scenár
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Vyčistenie zdrojov
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Zhrnutie a ďalšie kroky
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Cvičenia zamerané na AI
- **💡 Rýchly štart**: [Workshop Setup Guide](workshop/README.md#quick-start) - Konfigurácia prostredia

**Ideálne pre**: Firemné školenia, univerzitné kurzy, samostatné štúdium a bootcampy pre vývojárov.

---

## 📖 Hĺbkový ponor: Schopnosti AZD

Nad rámec základov poskytuje AZD silné funkcie pre produkčné nasadenia:

- **Nasadenia založené na šablónach** - Používajte predpripravené šablóny pre bežné aplikačné vzory
- **Infrastruktúra ako kód** - Spravujte Azure zdroje pomocou Bicep alebo Terraformu  
- **Integrované pracovné postupy** - Bezproblémovo provisionujte, nasadzujte a monitorujte aplikácie
- **Priateľské pre vývojárov** - Optimalizované pre produktivitu a skúsenosť vývojára

### **AZD + Microsoft Foundry: Perfektné pre AI nasadenia**

**Prečo AZD pre AI riešenia?** AZD rieši hlavné výzvy, ktorým čelia AI vývojári:

- **Šablóny pripravené na AI** - Predkonfigurované šablóny pre Microsoft Foundry modely, Cognitive Services a ML pracovné zaťaženia
- **Bezpečné AI nasadenia** - Vstavané bezpečnostné vzory pre AI služby, API kľúče a endpointy modelov  
- **Produkčné AI vzory** - Osvedčené postupy pre škálovateľné, nákladovo efektívne nasadenia AI aplikácií
- **End-to-End AI pracovné toky** - Od vývoja modelu po produkčné nasadenie s riadnym monitorovaním
- **Optimalizácia nákladov** - Inteligentné prideľovanie zdrojov a stratégie škálovania pre AI pracovné zaťaženia
- **Integrácia Microsoft Foundry** - Bezproblémové pripojenie ku katalógu modelov a endpointom Microsoft Foundry

---

## 🎯 Knižnica šablón a príkladov

### Odporúčané: Microsoft Foundry šablóny
**Začnite tu, ak nasadzujete AI aplikácie!**

> **Poznámka:** Tieto šablóny ilustrujú rôzne AI vzory. Niektoré sú externé Azure Samples, iné sú lokálne implementácie.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externé |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitola 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externé |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externé |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externé |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externé |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externé |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokálne** |

### Odporúčané: Kompletné učebné scenáre
**Aplikácie pripravené na produkciu mapované na učebné kapitoly**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | Základné vzory nasadenia AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | Implementácia RAG s Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitola 4 | ⭐⭐ | Integrácia Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | Rámec agentov a volanie funkcií |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐ | Orchestrace podnikových AI riešení |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | Architektúra s viacerými agentmi: zákazník a inventár |

### Učenie sa na príkladoch podľa typu

> **📌 Lokálne vs. externé príklady:**  
> **Lokálne príklady** (v tomto repozitári) = Ihneď pripravené na použitie  
> **Externé príklady** (Azure Samples) = Klonovať z prepojených repozitárov

#### Lokálne príklady (pripravené na použitie)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kompletná implementácia pripravená na produkciu s ARM šablónami
  - Architektúra s viacerými agentmi (zákazník + inventár)
  - Komplexné monitorovanie a hodnotenie
  - Jedno-klikové nasadenie cez ARM šablónu

#### Lokálne príklady - kontajnerové aplikácie (kapitoly 2-5)
**Komplexné príklady nasadenia kontajnerov v tomto repozitári:**
- [**Container App Examples**](examples/container-app/README.md) - Kompletný sprievodca kontajnerizovanými nasadeniami
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Základné REST API so scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Produkčné viacservisné nasadenie
  - Rýchly štart, Produkcia a Pokročilé vzory nasadenia
  - Pokyny k monitorovaniu, bezpečnosti a optimalizácii nákladov

#### Externé príklady - jednoduché aplikácie (kapitoly 1-2)
**Klonujte tieto Azure Samples repozitáre, aby ste začali:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Základné vzory nasadenia
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Nasadenie statického obsahu
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Nasadenie REST API

#### Externé príklady - integrácia databázy (kapitoly 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzory pripojenia na databázu
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless dátové pracovné toky

#### Externé príklady - pokročilé vzory (kapitoly 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Viacservisné architektúry
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Spracovanie na pozadí  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkčné ML vzory

### Externé zbierky šablón
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kurátorská zbierka oficiálnych a komunitných šablón
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentácia šablón Microsoft Learn
- [**Examples Directory**](examples/README.md) - Lokálne učebné príklady s podrobnými vysvetleniami

---

## 📚 Učebné zdroje a odkazy

### Rýchle odkazy
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Nevyhnutné azd príkazy zoradené podľa kapitol
- [**Glossary**](resources/glossary.md) - Terminológia Azure a azd  
- [**FAQ**](resources/faq.md) - Často kladené otázky zoradené podľa učebných kapitol
- [**Study Guide**](resources/study-guide.md) - Komplexné cvičenia na precvičenie

### Praktické workshopy
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Urobte svoje AI riešenia nasaditeľné cez AZD (2–3 hodiny)
- [**Interactive Workshop**](workshop/README.md) - 8-modulové riadené cvičenia s MkDocs a GitHub Codespaces
  - Nasleduje: Úvod → Výber → Overenie → Dekonštrukcia → Konfigurácia → Prispôsobenie → Vyčistenie → Zhrnutie

### Externé učebné zdroje
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrum architektúry Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulačka cien Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stav služby Azure](https://status.azure.com/)

### Schopnosti AI agentov pre váš editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otvorených zručností agentov pre Azure AI, Foundry, nasadzovanie, diagnostiku, optimalizáciu nákladov a ďalšie. Nainštalujte ich v GitHub Copilot, Cursor, Claude Code alebo v akomkoľvek podporovanom agentovi:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Rýchla príručka riešenia problémov

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

# Overte inštaláciu
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Vyskúšajte iný Azure región
azd env set AZURE_LOCATION "westus2"
azd up

# Alebo použite menšie SKU pri vývoji
# Upravte infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Možnosť 1: Vyčistiť a skúsiť znova
azd down --force --purge
azd up

# Možnosť 2: Iba opraviť infraštruktúru
azd provision

# Možnosť 3: Skontrolovať podrobný stav
azd show

# Možnosť 4: Skontrolovať protokoly v Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Znovu sa autentifikovať
az logout
az login

azd auth logout
azd auth login

# Overiť autentifikáciu
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD generuje jedinečné názvy, ale ak dôjde ku konfliktu:
azd down --force --purge

# Potom skúsiť znova s novým prostredím
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Bežné doby čakania:**
- Jednoduchá webová aplikácia: 5-10 minút
- Aplikácia s databázou: 10-15 minút
- AI aplikácie: 15-25 minút (príprava OpenAI je pomalá)

```bash
# Skontrolujte priebeh
azd show

# Ak ste zaseknutí viac ako 30 minút, skontrolujte Azure portál:
azd monitor
# Hľadajte neúspešné nasadenia
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Skontrolujte svoju rolu v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebujete aspoň rolu „Contributor“
# Požiadajte svojho správcu Azure, aby pridelil:
# - Contributor (pre zdroje)
# - User Access Administrator (pre prideľovanie rolí)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Zobraziť všetky koncové body služieb
azd show

# Alebo otvorte Azure portál
azd monitor

# Skontrolovať konkrétnu službu
azd env get-values
# Hľadať premenné *_URL
```
</details>

### 📚 Kompletné zdroje pre riešenie problémov

- **Príručka bežných problémov:** [Podrobné riešenia](docs/chapter-07-troubleshooting/common-issues.md)
- **Problémy špecifické pre AI:** [Riešenie problémov s AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Príručka ladenia:** [Ladenie krok za krokom](docs/chapter-07-troubleshooting/debugging.md)
- **Získajte pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Dokončenie kurzu a certifikácia

### Sledovanie pokroku
Sledujte svoj pokrok v učení cez každú kapitolu:

- [ ] **Kapitola 1**: Základy & Rýchly štart ✅
- [ ] **Kapitola 2**: Vývoj orientovaný na AI ✅  
- [ ] **Kapitola 3**: Konfigurácia & Overovanie ✅
- [ ] **Kapitola 4**: Infraštruktúra ako kód & Nasadzovanie ✅
- [ ] **Kapitola 5**: Riešenia AI s viacerými agentmi ✅
- [ ] **Kapitola 6**: Validácia a plánovanie pred nasadením ✅
- [ ] **Kapitola 7**: Riešenie problémov & Ladenie ✅
- [ ] **Kapitola 8**: Produkčné & Podnikové vzory ✅

### Overenie získaných vedomostí
Po dokončení každej kapitoly overte svoje vedomosti pomocou:
1. **Praktické cvičenie**: Dokončite praktické nasadenie z kapitoly
2. **Kontrola vedomostí**: Prezrite si sekciu FAQ pre vašu kapitolu
3. **Diskusia v komunite**: Podeľte sa o svoje skúsenosti v Azure Discord
4. **Ďalšia kapitola**: Prejdite na ďalšiu úroveň zložitosti

### Výhody po dokončení kurzu
Po dokončení všetkých kapitol budete mať:
- **Skúsenosti z produkcie**: Nasadené reálne AI aplikácie do Azure
- **Profesionálne zručnosti**: Schopnosti nasadzovania pripravené pre podniky  
- **Uznanie v komunite**: Aktívny člen Azure vývojárskej komunity
- **Kariérny postup**: Žiadané znalosti AZD a nasadzovania AI

---

## 🤝 Komunita a podpora

### Získajte pomoc a podporu
- **Technické problémy**: [Nahlásiť chyby a požiadať o funkcie](https://github.com/microsoft/azd-for-beginners/issues)
- **Otázky pri učení**: [Komunita Microsoft Azure na Discord](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc špecifická pre AI**: Pridajte sa do [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentácia**: [Oficiálna dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Postrehy komunity z Microsoft Foundry Discord

**Nedávne výsledky ankety z kanála #Azure:**
- **45%** vývojárov chce používať AZD pre AI pracovné záťaže
- **Hlavné výzvy**: Nasadzovanie viacerých služieb, správa prihlasovacích údajov, pripravenosť do produkcie  
- **Najžiadanejšie**: Šablóny špecifické pre AI, príručky riešenia problémov, najlepšie postupy

**Pridajte sa do našej komunity, aby ste:**
- Podeľte sa o svoje skúsenosti s AZD + AI a získajte pomoc
- Získajte prístup k predbežným náhľadom nových AI šablón
- Prispievajte k najlepším postupom pri nasadzovaní AI
- Ovlplyvnite vývoj budúcich funkcií AI + AZD

### Prispievanie do kurzu
Vítame príspevky! Pre podrobnosti si prečítajte náš [Sprievodca prispievaním](CONTRIBUTING.md) na:
- **Vylepšenia obsahu**: Vylepšite existujúce kapitoly a príklady
- **Nové príklady**: Pridajte scenáre a šablóny z reálneho sveta  
- **Preklad**: Pomôžte udržiavať viacjazyčnú podporu
- **Nahlásenia chýb**: Zlepšite presnosť a zrozumiteľnosť
- **Štandardy komunity**: Dodržiavajte naše inkluzívne pravidlá komunity

---

## 📄 Informácie o kurze

### Licencia
Tento projekt je licencovaný pod licenciou MIT - pre podrobnosti si pozrite súbor [LICENSE](../../LICENSE).

### Súvisiace vzdelávacie zdroje Microsoftu

Náš tím vytvára ďalšie komplexné vzdelávacie kurzy:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenti
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatívna AI séria
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Základné vzdelávanie
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Séria Copilot
[![Copilot pre párované programovanie s AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pre C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Dobrodružstvo Copilota](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigácia kurzu

**🚀 Pripravení začať sa učiť?**

**Začiatočníci**: Start with [Kapitola 1: Základy a rýchly štart](#-chapter-1-foundation--quick-start)  
**AI Developers**: Prejdite na [Kapitola 2: Vývoj orientovaný na AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Skúsení vývojári**: Začnite s [Kapitola 3: Konfigurácia a overovanie](#️-chapter-3-configuration--authentication)

**Ďalšie kroky**: [Začnite kapitolu 1 - Základy AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vylúčenie zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa usilujeme o presnosť, berte prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->