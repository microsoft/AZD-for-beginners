# AZD pre začiatočníkov: Štruktúrovaná vzdelávacia cesta

![AZD-pre-začiatočníkov](../../translated_images/sk/azdbeginners.5527441dd9f74068.webp) 

[![GitHub sledovatelia](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub fork-y](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub hviezdy](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatizované preklady (vždy aktuálne)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabčina](../ar/README.md) | [Bengálčina](../bn/README.md) | [Bulharčina](../bg/README.md) | [Barmčina (Myanmar)](../my/README.md) | [Čínština (zjednodušená)](../zh-CN/README.md) | [Čínština (tradičná, Hong Kong)](../zh-HK/README.md) | [Čínština (tradičná, Macau)](../zh-MO/README.md) | [Čínština (tradičná, Taiwan)](../zh-TW/README.md) | [Chorvátčina](../hr/README.md) | [Čeština](../cs/README.md) | [Dánčina](../da/README.md) | [Holandčina](../nl/README.md) | [Estónčina](../et/README.md) | [Fínčina](../fi/README.md) | [Francúzština](../fr/README.md) | [Nemčina](../de/README.md) | [Gréčtina](../el/README.md) | [Hebrejčina](../he/README.md) | [Hindčina](../hi/README.md) | [Maďarčina](../hu/README.md) | [Indonézčina](../id/README.md) | [Taliančina](../it/README.md) | [Japončina](../ja/README.md) | [Kannadčina](../kn/README.md) | [Kórejčina](../ko/README.md) | [Litovčina](../lt/README.md) | [Malajčina](../ms/README.md) | [Malajálamčina](../ml/README.md) | [Maráthčina](../mr/README.md) | [Nepálčina](../ne/README.md) | [Nigérijský pidžin](../pcm/README.md) | [Nórčina](../no/README.md) | [Perzština (Farsi)](../fa/README.md) | [Poľština](../pl/README.md) | [Portugalčina (Brazília)](../pt-BR/README.md) | [Portugalčina (Portugalsko)](../pt-PT/README.md) | [Pandžábčina (Gurmukhi)](../pa/README.md) | [Rumunčina](../ro/README.md) | [Ruština](../ru/README.md) | [Srbčina (cyrilika)](../sr/README.md) | [Slovenčina](./README.md) | [Slovinčina](../sl/README.md) | [Španielčina](../es/README.md) | [Swahilčina](../sw/README.md) | [Švédčina](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamilčina](../ta/README.md) | [Telugčina](../te/README.md) | [Thajčina](../th/README.md) | [Turečtina](../tr/README.md) | [Ukrajinčina](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamčina](../vi/README.md)

> **Preferujete klonovanie lokálne?**
>
> Tento repozitár obsahuje viac ako 50 jazykových prekladov, čo výrazne zväčšuje veľkosť na stiahnutie. Ak chcete klonovať bez prekladov, použite sparse checkout:
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
> Toto vám umožní získať všetko potrebné pre dokončenie kurzu oveľa rýchlejšie.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Čo je dnes nové v azd

Azure Developer CLI rástla za hranice tradičných webových aplikácií a API. Dnes je azd jediný nástroj na nasadenie **koľvek** aplikácie do Azure — vrátane aplikácií s umelou inteligenciou a inteligentných agentov.

Čo to znamená pre vás:

- **Agentov AI sú teraz plnohodnotnými pracovnými záťažami azd.** Môžete inicializovať, nasadzovať a spravovať projekty AI agentov pomocou rovnakého workflow `azd init` → `azd up`, ktoré už poznáte.
- **Integrácia Microsoft Foundry** prináša nasadenie modelov, hosťovanie agentov a konfiguráciu AI služieb priamo do ekosystému šablón azd.
- **Základný workflow sa nezmenil.** Či už nasadzujete úlohu, mikroslužbu alebo viacagentové AI riešenie, príkazy sú rovnaké.

Ak ste už používali azd, podpora AI je prirodzené rozšírenie — nie samostatný nástroj alebo pokročilá linka. Ak začínate odznova, naučíte sa jediný workflow, ktorý funguje pre všetko.

---

## 🚀 Čo je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je vývojársky priateľský nástroj príkazového riadku, ktorý uľahčuje nasadenie aplikácií do Azure. Namiesto manuálneho vytvárania a prepájania desiatok Azure zdrojov môžete nasadiť celé aplikácie jedným príkazom.

### Čaro `azd up`

```bash
# Tento jediný príkaz urobí všetko:
# ✅ Vytvorí všetky Azure zdroje
# ✅ Konfiguruje sieť a zabezpečenie
# ✅ Zostaví váš aplikačný kód
# ✅ Nasadí na Azure
# ✅ Poskytne vám funkčnú URL
azd up
```

**Hotovo!** Žiadne klikanie v Azure Portáli, žiadne komplikované ARM šablóny na naučenie, žiadna manuálna konfigurácia — len fungujúce aplikácie na Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Aký je rozdiel?

To je najčastejšia otázka začiatočníkov. Tu je jednoduchá odpoveď:

| Funkcia | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Účel** | Správa jednotlivých Azure zdrojov | Nasadenie kompletných aplikácií |
| **Myslenie** | Zamerané na infraštruktúru | Zamerané na aplikácie |
| **Príklad** | `az webapp create --name myapp...` | `azd up` |
| **Krivka učenia** | Treba poznať Azure služby | Stačí poznať aplikáciu |
| **Najlepšie pre** | DevOps, infraštruktúra | Vývojári, prototypovanie |

### Jednoduchá analógia

- **Azure CLI** je ako mať všetky náradia na stavbu domu – kladivá, píly, klince. Môžete postaviť čokoľvek, ale musíte vedieť stavať.
- **Azure Developer CLI** je ako najať si stavebnú firmu – opíšete, čo chcete, a oni postavia.

### Kedy použiť ktorý

| Scenár | Použite |
|----------|----------|
| „Chcem rýchlo nasadiť svoju webovú aplikáciu“ | `azd up` |
| „Potrebujem vytvoriť len úložný účet“ | `az storage account create` |
| „Staviam plnú AI aplikáciu“ | `azd init --template azure-search-openai-demo` |
| „Potrebujem debugovať konkrétny Azure zdroj“ | `az resource show` |
| „Chcem produkčné nasadenie za pár minút“ | `azd up --environment production` |

### Fungujú spolu!

AZD používa Azure CLI pod kapotou. Môžete použiť oba:
```bash
# Nasadiť svoju aplikáciu pomocou AZD
azd up

# Potom dolaďte konkrétne zdroje pomocou Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Nájdite šablóny v Awesome AZD

Nespúšťajte sa od nuly! **Awesome AZD** je komunitná zbierka pripravených šablón na nasadenie:

| Zdroj | Popis |
|----------|-------------|
| 🔗 [**Awesome AZD Galéria**](https://azure.github.io/awesome-azd/) | Prezrite si 200+ šablón s jedným kliknutím nasadenia |
| 🔗 [**Odošlite šablónu**](https://github.com/Azure/awesome-azd/issues) | Prispievajte vlastnou šablónou do komunity |
| 🔗 [**GitHub Repozitár**](https://github.com/Azure/awesome-azd) | Označte hviezdičkou a preskúmajte zdroj |

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

## 🎯 Začíname v 3 krokoch

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

### Krok 3: Nasadte svoju prvú aplikáciu

```bash
# Inicializovať z šablóny
azd init --template todo-nodejs-mongo

# Nasadiť do Azure (vytvorí všetko!)
azd up
```

**🎉 Hotovo!** Vaša aplikácia je teraz živá na Azure.

### Upratovanie (nezabudnite!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Ako používať tento kurz

Tento kurz je navrhnutý pre **postupné učenie** – začnite tam, kde vám to najviac vyhovuje, a postupne sa zdokonaľujte:

| Vaše skúsenosti | Začnite tu |
|-----------------|------------|
| **Nováčik v Azure** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Poznáte Azure, ale nie AZD** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Chcete nasadiť AI aplikácie** | [Kapitola 2: Vývoj s AI na prvom mieste](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Chcete praktické cvičenia** | [🎓 Interaktívny workshop](workshop/README.md) - 3-4 hodinový sprievodca |
| **Potrebujete produkčné vzory** | [Kapitola 8: Produkcia a podnikovosť](#-chapter-8-production--enterprise-patterns) |

### Rýchle nastavenie

1. **Vytvorte fork tohto repozitára**: [![GitHub fork-y](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Naklonujte ho**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Získajte pomoc**: [Azure Discord komunita](https://discord.com/invite/ByRwuEEgH4)

> **Preferujete klonovanie lokálne?**

> Tento repozitár obsahuje viac ako 50 jazykových prekladov, čo výrazne zväčšuje veľkosť na stiahnutie. Ak chcete klonovať bez prekladov, použite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Toto vám umožní získať všetko potrebné pre dokončenie kurzu oveľa rýchlejšie.


## Prehľad kurzu

Ovládnite Azure Developer CLI (azd) prostredníctvom štruktúrovaných kapitol navrhnutých pre postupné učenie. **Špeciálny dôraz na nasadenie AI aplikácií s integráciou Microsoft Foundry.**

### Prečo je tento kurz nevyhnutný pre moderných vývojárov

Na základe poznatkov z komunity Microsoft Foundry Discord, **45 % vývojárov chce používať AZD pre AI pracovné záťaže**, no stretávajú sa s problémami:
- Komplikované viacslužbové AI architektúry
- Najlepšie postupy pre produkčné nasadenie AI  
- Integrácia a konfigurácia Azure AI služieb
- Optimalizácia nákladov pri AI záťažiach
- Riešenie problémov špecifických pre AI nasadenie

### Ciele učenia

Dokončením tohto štruktúrovaného kurzu budete:
- **Ovládať základy AZD**: základné koncepty, inštalácia a konfigurácia
- **Nasadzovať AI aplikácie**: používať AZD so službami Microsoft Foundry
- **Implementovať infraštruktúru ako kód**: spravovať Azure zdroje pomocou Bicep šablón
- **Riešiť problémy nasadenia**: diagnostikovať bežné chyby a ladit problémy
- **Optimalizovať pre produkciu**: bezpečnosť, škálovanie, monitorovanie a správa nákladov
- **Vytvárať multiagentové riešenia**: nasadzovať komplexné AI architektúry

## 🗺️ Mapa kurzu: Rýchla navigácia podľa kapitoly

Každá kapitola má samostatný README so vzdelávacími cieľmi, rýchlym štartom a cvičeniami:

| Kapitola | Téma | Lekcie | Dĺžka | Náročnosť |
|---------|-------|---------|----------|------------|
| **[Kap 1: Základy](docs/chapter-01-foundation/README.md)** | Začínáme | [Základy AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Inštalácia](docs/chapter-01-foundation/installation.md) &#124; [Prvý projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kapitola 2: Vývoj AI](docs/chapter-02-ai-development/README.md)** | AI-First aplikácie | [Integrácia Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agenti](docs/chapter-02-ai-development/agents.md) &#124; [Nasadenie modelu](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hodiny | ⭐⭐ |
| **[Kapitola 3: Konfigurácia](docs/chapter-03-configuration/README.md)** | Overovanie a bezpečnosť | [Konfigurácia](docs/chapter-03-configuration/configuration.md) &#124; [Overenie a bezpečnosť](docs/chapter-03-configuration/authsecurity.md) | 45-60 minút | ⭐⭐ |
| **[Kapitola 4: Infraštruktúra](docs/chapter-04-infrastructure/README.md)** | IaC a nasadenie | [Sprievodca nasadením](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 hodiny | ⭐⭐⭐ |
| **[Kapitola 5: Multi-agent](docs/chapter-05-multi-agent/README.md)** | Riešenia AI agentov | [Scenár predaja](examples/retail-scenario.md) &#124; [Koordinačné vzory](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hodiny | ⭐⭐⭐⭐ |
| **[Kapitola 6: Pred nasadením](docs/chapter-06-pre-deployment/README.md)** | Plánovanie a validácia | [Predletové kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Plánovanie kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Výber SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hodina | ⭐⭐ |
| **[Kapitola 7: Riešenie problémov](docs/chapter-07-troubleshooting/README.md)** | Ladenie a opravy | [Bežné problémy](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Ladenie](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problémy](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 hodiny | ⭐⭐ |
| **[Kapitola 8: Produkcia](docs/chapter-08-production/README.md)** | Enterprise vzory | [Produkčné postupy](docs/chapter-08-production/production-ai-practices.md) | 2-3 hodiny | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktický lab | [Úvod](workshop/docs/instructions/0-Introduction.md) &#124; [Výber](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validácia](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deštrukcia](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurácia](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prispôsobenie](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Likvidácia](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zhrnutie](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hodiny | ⭐⭐ |

**Celková doba kurzu:** ~10-14 hodín | **Pokrok v zručnostiach:** Začiatočník → Pripravený na produkciu

---

## 📚 Naučné kapitoly

*Vyberte si svoju učebnú cestu podľa úrovne skúseností a cieľov*

### 🚀 Kapitola 1: Základy a rýchly štart
**Predpoklady**: Predplatné Azure, základné znalosti príkazového riadku  
**Dĺžka trvania**: 30-45 minút  
**Zložitosť**: ⭐

#### Čo sa naučíte
- Základy Azure Developer CLI
- Inštalácia AZD na vašej platforme
- Prvé úspešné nasadenie

#### Zdrojové materiály
- **🎯 Začnite tu**: [Čo je Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teória**: [Základy AZD](docs/chapter-01-foundation/azd-basics.md) - Základné koncepty a terminológia
- **⚙️ Nastavenie**: [Inštalácia a nastavenie](docs/chapter-01-foundation/installation.md) - Príručky podľa platformy
- **🛠️ Prakticky**: [Váš prvý projekt](docs/chapter-01-foundation/first-project.md) - Návod krok za krokom
- **📋 Rýchla referencia**: [Prehľad príkazov](resources/cheat-sheet.md)

#### Praktické cvičenia
```bash
# Rýchla kontrola inštalácie
azd version

# Nasadiť vašu prvú aplikáciu
azd init --template todo-nodejs-mongo
azd up
```

**💡 Výsledok kapitoly**: Úspešne nasadiť jednoduchú webovú aplikáciu do Azure pomocou AZD

**✅ Overenie úspechu:**
```bash
# Po dokončení kapitoly 1 by ste mali byť schopní:
azd version              # Zobrazuje nainštalovanú verziu
azd init --template todo-nodejs-mongo  # Inicializuje projekt
azd up                  # Nasadzuje do Azure
azd show                # Zobrazuje URL spustená aplikácie
# Aplikácia sa otvorí v prehliadači a funguje
azd down --force --purge  # Odstraňuje prostriedky
```

**📊 Časová investícia:** 30-45 minút  
**📈 Úroveň zručností po absolvovaní:** Dokáže samostatne nasadzovať základné aplikácie

---

### 🤖 Kapitola 2: AI-First vývoj (Odporúčané pre AI vývojárov)
**Predpoklady**: Dokončená Kapitola 1  
**Dĺžka trvania**: 1-2 hodiny  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Integrácia Microsoft Foundry s AZD
- Nasadzovanie AI-poháňaných aplikácií
- Pochopenie konfigurácií AI služieb

#### Zdrojové materiály
- **🎯 Začnite tu**: [Integrácia Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agenti**: [Sprievodca AI agentmi](docs/chapter-02-ai-development/agents.md) - Nasadenie inteligentných agentov s AZD
- **📖 Vzory**: [Nasadenie AI modelov](docs/chapter-02-ai-development/ai-model-deployment.md) - Nasadzovanie a správa AI modelov
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pripravte svoje AI riešenia na AZD
- **🎥 Interaktívny sprievodca**: [Materiály workshopu](workshop/README.md) - Učenie v prehliadači s MkDocs * DevContainer prostredie
- **📋 Šablóny**: [Šablóny Microsoft Foundry](#zdroje-workshopu)
- **📝 Príklady**: [Príklady nasadenia AZD](examples/README.md)

#### Praktické cvičenia
```bash
# Nasadzujte svoju prvú AI aplikáciu
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
# Otestovať rozhranie chat s AI
# Klásť otázky a dostávať odpovede s umelou inteligenciou a zdrojmi
# Overiť, či integrácia vyhľadávania funguje
azd monitor  # Skontrolovať, či Application Insights zobrazuje telemetriu
azd down --force --purge
```

**📊 Časová investícia:** 1-2 hodiny  
**📈 Úroveň zručností po absolvovaní:** Dokáže nasadiť a konfigurovať produkčne pripravené AI aplikácie  
**💰 Povedomie o nákladoch:** Chápe vývojové náklady $80-150/mesiac, produkčné náklady $300-3500/mesiac

#### 💰 Nákladové úvahy pre AI nasadenia

**Vývojové prostredie (odhad $80-150/mesiac):**
- Microsoft Foundry modely (platba podľa použitia): $0-50/mesiac (založené na tokenoch)
- AI Search (základná úroveň): $75/mesiac
- Container Apps (spotrebné): $0-20/mesiac
- Úložisko (štandardné): $1-5/mesiac

**Produkčné prostredie (odhad $300-3 500+/mesiac):**
- Microsoft Foundry modely (PTU pre konzistentný výkon): $3 000+/mesiac ALEBO platba podľa použitia s vysokým objemom
- AI Search (štandardná úroveň): $250/mesiac
- Container Apps (dedikované): $50-100/mesiac
- Application Insights: $5-50/mesiac
- Úložisko (prémiové): $10-50/mesiac

**💡 Tipy na optimalizáciu nákladov:**
- Používajte **bezplatnú úroveň** Microsoft Foundry modelov na učenie sa (Azure OpenAI 50 000 tokenov/mesiac v cene)
- Spustite `azd down` na uvoľnenie zdrojov, keď aktívne nevyvíjate
- Začnite so spotrebnou fakturáciou, na PTU prejdite iba pre produkciu
- Použite `azd provision --preview` na odhad nákladov pred nasadením
- Povoliť automatické škálovanie: platíte len za reálne použitie

**Sledovanie nákladov:**
```bash
# Skontrolujte odhadované mesačné náklady
azd provision --preview

# Sledujte skutočné náklady v Azure Portáli
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitola 3: Konfigurácia a overovanie
**Predpoklady**: Dokončená Kapitola 1  
**Dĺžka trvania**: 45-60 minút  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Konfigurácia a riadenie prostredia
- Najlepšie postupy overovania a bezpečnosti
- Názvoslovie a organizácia zdrojov

#### Zdrojové materiály
- **📖 Konfigurácia**: [Sprievodca konfiguráciou](docs/chapter-03-configuration/configuration.md) - Nastavenie prostredia
- **🔐 Bezpečnosť**: [Vzory overovania a spravované identity](docs/chapter-03-configuration/authsecurity.md) - Vzory overovania
- **📝 Príklady**: [Príklad databázovej aplikácie](examples/database-app/README.md) - Príklady databáz AZD

#### Praktické cvičenia
- Konfigurácia viacerých prostredí (dev, staging, prod)
- Nastavenie overovania spravovanej identity
- Implementácia konfigurácií špecifických pre prostredie

**💡 Výsledok kapitoly**: Spravovať viaceré prostredia s riadnym overovaním a bezpečnosťou

---

### 🏗️ Kapitola 4: Infraštruktúra ako kód a nasadenie
**Predpoklady**: Dokončené kapitoly 1-3  
**Dĺžka trvania**: 1-1,5 hodiny  
**Zložitosť**: ⭐⭐⭐

#### Čo sa naučíte
- Pokročilé vzory nasadenia
- Infraštruktúra ako kód s použitím Bicep
- Stratégie provisioning zdrojov

#### Zdrojové materiály
- **📖 Nasadenie**: [Sprievodca nasadením](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletné pracovné postupy
- **🏗️ Provisioning**: [Provisioning zdrojov](docs/chapter-04-infrastructure/provisioning.md) - Správa Azure zdrojov
- **📝 Príklady**: [Príklad Container App](../../examples/container-app) - Containerizované nasadenia

#### Praktické cvičenia
- Vytvoriť vlastné Bicep šablóny
- Nasadiť viac-službové aplikácie
- Implementovať stratégie blue-green nasadenia

**💡 Výsledok kapitoly**: Nasadiť komplexné viac-službové aplikácie pomocou vlastných infraštruktúrnych šablón

---

### 🎯 Kapitola 5: Multi-agentné AI riešenia (pokročilé)
**Predpoklady**: Dokončené kapitoly 1-2  
**Dĺžka trvania**: 2-3 hodiny  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Vzory architektúry multi-agentov
- Orchestrácia a koordinácia agentov
- Produkčne pripravené AI nasadenia

#### Zdrojové materiály
- **🤖 Vyznačený projekt**: [Multi-agentné riešenie pre retail](examples/retail-scenario.md) - Kompletná implementácia
- **🛠️ ARM šablóny**: [ARM template package](../../examples/retail-multiagent-arm-template) - Jedno-klikové nasadenie
- **📖 Architektúra**: [Vzory koordinácie multi-agentov](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzory

#### Praktické cvičenia
```bash
# Nasadiť kompletné maloobchodné riešenie s viacerými agentmi
cd examples/retail-multiagent-arm-template
./deploy.sh

# Preskúmať konfigurácie agentov
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Výsledok kapitoly**: Nasadiť a spravovať produkčne pripravené multi-agentné AI riešenie s agentmi zákazníka a inventára

---

### 🔍 Kapitola 6: Validácia a plánovanie pred nasadením
**Predpoklady**: Dokončená Kapitola 4  
**Dĺžka trvania**: 1 hodina  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Plánovanie kapacity a validácia zdrojov
- Stratégie výberu SKU
- Kontroly pred nasadením a automatizácia

#### Zdrojové materiály
- **📊 Plánovanie**: [Plánovanie kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) - Validácia zdrojov
- **💰 Výber**: [Výber SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Nákladovo efektívne možnosti
- **✅ Validácia**: [Predletové kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktické cvičenia
- Spustiť skripty na validáciu kapacity
- Optimalizovať výber SKU podľa nákladov
- Implementovať automatizované prednasadenie kontroly

**💡 Výsledok kapitoly**: Validovať a optimalizovať nasadenia pred vykonaním

---

### 🚨 Kapitola 7: Riešenie problémov a ladenie
**Predpoklady**: Dokončená akákoľvek kapitola nasadenia  
**Dĺžka trvania**: 1-1,5 hodiny  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Systematické prístupy k ladeniu
- Bežné problémy a ich riešenia
- Špecifické riešenie problémov AI služieb

#### Zdrojové materiály
- **🔧 Bežné problémy**: [Časté problémy](docs/chapter-07-troubleshooting/common-issues.md) - FAQ a riešenia
- **🕵️ Ladenie**: [Sprievodca ladením](docs/chapter-07-troubleshooting/debugging.md) - Stratégiu krok za krokom
- **🤖 AI problémy**: [Riešenie problémov AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problémy AI služieb

#### Praktické cvičenia
- Diagnostikovať zlyhania nasadenia
- Riešiť problémy s overením
- Ladiť konektivitu AI služieb

**💡 Výsledok kapitoly**: Dokázať samostatne diagnostikovať a riešiť bežné problémy s nasadením

---

### 🏢 Kapitola 8: Produkčné a enterprise vzory
**Predpoklady**: Dokončené kapitoly 1-4  
**Dĺžka trvania**: 2-3 hodiny  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Produkčné stratégie nasadenia
- Enterprise bezpečnostné vzory
- Monitorovanie a optimalizácia nákladov

#### Zdrojové materiály
- **🏭 Produkcia**: [Najlepšie postupy pre produkčné AI](docs/chapter-08-production/production-ai-practices.md) - Vzory pre podniky  
- **📝 Príklady**: [Príklad mikroslužieb](../../examples/microservices) - Komplexné architektúry  
- **📊 Monitorovanie**: [Integrácia Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorovanie  

#### Praktické cvičenia  
- Implementovať bezpečnostné vzory pre podniky  
- Nastaviť komplexné monitorovanie  
- Nasadiť do produkcie s riadnym riadením  

**💡 Výsledok kapitoly**: Nasadiť pripravené aplikácie pre produkciu s plnou prevádzkovou kapacitou  

---

## 🎓 Prehľad workshopu: Praktické výučbové skúsenosti  

> **⚠️ STAV WORKSHOPU: Aktívny vývoj**  
> Materiály workshopu sa momentálne vyvíjajú a dolaďujú. Základné moduly sú funkčné, avšak niektoré pokročilé časti ešte nie sú dokončené. Aktívne pracujeme na dokončení celého obsahu. [Sledujte priebeh →](workshop/README.md)  

### Interaktívne materiály workshopu  
**Komplexné praktické učenie s nástrojmi v prehliadači a vedenými cvičeniami**  

Naše materiály workshopu poskytujú štruktúrovaný, interaktívny zážitok z učenia, ktorý dopĺňa vyššie uvedenú kapitolu učebného plánu. Workshop je určený na samostatné štúdium aj vedené vyučovanie.  

#### 🛠️ Funkcie workshopu  
- **Rozhranie v prehliadači**: Kompletný workshop poháňaný MkDocs s vyhľadávaním, kopírovaním a možnosťami motívu  
- **Integrácia GitHub Codespaces**: Jednoklikové nastavenie vývojového prostredia  
- **Štruktúrovaná učebná cesta**: 8-modulové vedené cvičenia (3-4 hodiny celkom)  
- **Postupná metodika**: Úvod → Výber → Overenie → Rozloženie → Konfigurácia → Prispôsobenie → Ukončenie → Zhrnutie  
- **Interaktívne prostredie DevContainer**: Prednastavené nástroje a závislosti  

#### 📚 Štruktúra modulov workshopu  
Workshop sleduje **8-modulovú postupnú metodiku**, ktorá vás prevedie od objavovania až po majstrovstvo v nasadení:  

| Modul | Téma | Čo budete robiť | Trvanie |  
|-------|-------|----------------|---------|  
| **0. Úvod** | Prehľad workshopu | Pochopiť učebné ciele, predpoklady a štruktúru workshopu | 15 min |  
| **1. Výber** | Objevovanie šablón | Preskúmať šablóny AZD a vybrať správnu AI šablónu pre váš scenár | 20 min |  
| **2. Overenie** | Nasadenie a kontrola | Nasadiť šablónu pomocou `azd up` a overiť funkčnosť infraštruktúry | 30 min |  
| **3. Rozloženie** | Pochopenie štruktúry | Použiť GitHub Copilot na preskúmanie architektúry šablóny, súborov Bicep a organizácie kódu | 30 min |  
| **4. Konfigurácia** | Hlboký ponor do azure.yaml | Osvojiť si konfiguráciu `azure.yaml`, životný cyklus hookov a premenné prostredia | 30 min |  
| **5. Prispôsobenie** | Prispôsobte podľa potreby | Zapnúť AI vyhľadávanie, trasovanie, vyhodnocovanie a prispôsobiť scenáru | 45 min |  
| **6. Ukončenie** | Upratovanie | Bezpečne odstrániť zdroje príkazom `azd down --purge` | 15 min |  
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
# Možnosť 1: GitHub Codespaces (Odporúčané)
# Kliknite na "Code" → "Create codespace on main" v repozitári

# Možnosť 2: Lokálny vývoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postupujte podľa inštrukcií na nastavenie v workshop/README.md
```
  

#### 🎯 Výsledky učenia workshopu  
Po dokončení workshopu účastníci:  
- **Nasadia produkčné AI aplikácie**: Použijú AZD so službami Microsoft Foundry  
- **Osvoja si architektúry s viacerými agentmi**: Implementujú koordinované AI agentné riešenia  
- **Implementujú bezpečnostné najlepšie postupy**: Konfigurujú autentifikáciu a kontrolu prístupu  
- **Optimalizujú pre škálovanie**: Navrhnú nákladovo efektívne a výkonné nasadenia  
- **Riešia problémy s nasadením**: Samostatne vyriešia bežné problémy  

#### 📖 Zdroje workshopu  
- **🎥 Interaktívny sprievodca**: [Materiály workshopu](workshop/README.md) - Prostredie učenia v prehliadači  
- **📋 Inštrukcie po moduloch**:  
  - [0. Úvod](workshop/docs/instructions/0-Introduction.md) - Prehľad workshopu a ciele  
  - [1. Výber](workshop/docs/instructions/1-Select-AI-Template.md) - Nájsť a vybrať AI šablóny  
  - [2. Overenie](workshop/docs/instructions/2-Validate-AI-Template.md) - Nasadiť a overiť šablóny  
  - [3. Rozloženie](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Preskúmať architektúru šablóny  
  - [4. Konfigurácia](workshop/docs/instructions/4-Configure-AI-Template.md) - Osvojiť si azure.yaml  
  - [5. Prispôsobenie](workshop/docs/instructions/5-Customize-AI-Template.md) - Prispôsobiť scenáru  
  - [6. Ukončenie](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Upratať zdroje  
  - [7. Zhrnutie](workshop/docs/instructions/7-Wrap-up.md) - Prehľad a ďalšie kroky  
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Cvičenia zamerané na AI  
- **💡 Rýchly štart**: [Sprievodca nastavením workshopu](workshop/README.md#quick-start) - Konfigurácia prostredia  

**Perfektné pre**: Firemné školenia, univerzitné kurzy, samostatné učenie a bootcampy pre vývojárov.  

---

## 📖 Hlbší pohľad: Možnosti AZD  

Okrem základov poskytuje AZD silné funkcie pre produkčné nasadenia:  

- **Nasadenia založené na šablónach** - Použitie predpripravených šablón pre bežné vzory aplikácií  
- **Infraštruktúra ako kód** - Správa Azure zdrojov pomocou Bicep alebo Terraform  
- **Integrované pracovné toky** - Plynulé spravovanie, nasadzovanie a monitorovanie aplikácií  
- **Priaznivé pre vývojárov** - Optimalizované pre produktivitu a zážitok vývojára  

### **AZD + Microsoft Foundry: Ideálne pre AI nasadenia**  

**Prečo AZD pre AI riešenia?** AZD rieši najväčšie výzvy AI vývojárov:  

- **Šablóny pripravené na AI** - Predkonfigurované šablóny pre Microsoft Foundry modely, Kognitívne služby a ML záťaže  
- **Bezpečné AI nasadenia** - Vstavané bezpečnostné vzory pre AI služby, API kľúče a modelové koncové body  
- **Produkčné AI vzory** - Najlepšie postupy pre škálovateľné a nákladovo efektívne AI aplikácie  
- **End-to-End AI pracovné toky** - Od vývoja modelu po produkčné nasadenie s riadnym monitorovaním  
- **Optimalizácia nákladov** - Inteligentné prideľovanie zdrojov a škálovacie stratégie pre AI záťaže  
- **Integrácia Microsoft Foundry** - Plynulé prepojenie s katalógom modelov a koncovými bodmi Microsoft Foundry  

---

## 🎯 Knižnica šablón a príkladov  

### Vybrané: Šablóny Microsoft Foundry  
**Začnite tu, ak nasadzujete AI aplikácie!**  

> **Poznámka:** Tieto šablóny demonštrujú rôzne AI vzory. Niektoré sú externé vzorky Azure, iné sú lokálne implementácie.  

| Šablóna | Kapitola | Náročnosť | Služby | Typ |  
|---------|----------|-----------|---------|-----|  
| [**Začnite s AI chatom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externé |  
| [**Začnite s AI agentmi**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitola 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Externé |  
| [**Azure Search + OpenAI demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externé |  
| [**OpenAI chatová aplikácia rýchly štart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externé |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externé |  
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externé |  
| [**Retail Multi-Agent riešenie**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokálne** |  

### Vybrané: Kompletné učebné scenáre  
**Šablóny aplikácií pripravené pre produkciu mapované na učebné kapitoly**  

| Šablóna | Učebná kapitola | Náročnosť | Kľúčové učenie |  
|---------|-----------------|-----------|----------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | Základné vzory nasadenia AI |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | Implementácia RAG s Azure AI Search |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitola 4 | ⭐⭐ | Integrácia inteligencie dokumentov |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | Rámec agentov a volanie funkcií |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐ | Podniková AI orchestrácia |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | Architektúra viacerých agentov s agentmi zákazníkov a inventára |  

### Učenie podľa typu príkladu  

> **📌 Lokálne verzus externé príklady:**  
> **Lokálne príklady** (v tomto repozitári) = Ihneď pripravené na použitie  
> **Externé príklady** (Azure Samples) = Klonovanie z odkazovaných repozitárov  

#### Lokálne príklady (pripravené na použitie)  
- [**Retail Multi-Agent riešenie**](examples/retail-scenario.md) - Kompletná produkčná implementácia s ARM šablónami  
  - Architektúra viacerých agentov (Zákaznícky + Inventárny agent)  
  - Komplexné monitorovanie a vyhodnocovanie  
  - Jednoklikové nasadenie cez ARM šablónu  

#### Lokálne príklady - Aplikácie kontajnerov (kapitoly 2-5)  
**Komplexné príklady nasadenia kontajnerov v tomto repozitári:**  
- [**Príklady Container Apps**](examples/container-app/README.md) - Kompletný sprievodca kontajnerovými nasadeniami  
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api) - Základné REST API so škálovaním na nulu  
  - [Mikroslužby architektúra](../../examples/container-app/microservices) - Produkčne pripravené multi-službové nasadenie  
  - Rýchly štart, produkčné a pokročilé vzory nasadenia  
  - Monitorovanie, bezpečnosť a optimalizácia nákladov  

#### Externé príklady - Jednoduché aplikácie (kapitoly 1-2)  
**Klonujte tieto Azure Samples repozitáre pre začiatok:**  
- [Jednoduchá webová aplikácia - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Základné vzory nasadenia  
- [Statická webstránka - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Nasadenie statického obsahu  
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Nasadenie REST API  

#### Externé príklady - Integrácia databázy (kapitoly 3-4)  
- [Databázová aplikácia - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzory pre pripojenie k databáze  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless dátové pracovné toky  

#### Externé príklady - Pokročilé vzory (kapitoly 4-8)  
- [Java Mikroslužby](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architektúry viacerých služieb  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Spracovanie na pozadí  
- [Podniková ML pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkčné ML vzory  

### Externé kolekcie šablón  
- [**Oficiálna galéria šablón AZD**](https://azure.github.io/awesome-azd/) - Kurátorská kolekcia oficiálnych a komunitných šablón  
- [**Šablóny Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentácia šablón Microsoft Learn  
- [**Adresár príkladov**](examples/README.md) - Lokálne učebné príklady s podrobnými vysvetleniami  

---

## 📚 Učebné zdroje a odkazy  

### Rýchle odkazy  
- [**Príkazový rýchlokurz**](resources/cheat-sheet.md) - Základné príkazy azd usporiadané podľa kapitol  
- [**Slovníček pojmov**](resources/glossary.md) - Terminológia Azure a azd  
- [**Často kladené otázky**](resources/faq.md) - Bežné otázky usporiadané podľa učebných kapitol  
- [**Študijný sprievodca**](resources/study-guide.md) - Komplexné praktické cvičenia  

### Praktické workshopy  
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Urobte svoje AI riešenia pripravené pre AZD nasadenie (2-3 hodiny)  
- [**Interaktívny workshop**](workshop/README.md) - 8 modulov vedených cvičení s MkDocs a GitHub Codespaces  
  - Postup: Úvod → Výber → Overenie → Rozloženie → Konfigurácia → Prispôsobenie → Ukončenie → Zhrnutie  

### Externé učebné zdroje
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrum architektúry Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulačka cien Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stav Azure](https://status.azure.com/)

### Zručnosti AI agenta pre váš editor
- [**Microsoft Azure Skills na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otvorených zručností agentov pre Azure AI, Foundry, nasadenie, diagnostiku, optimalizáciu nákladov a ďalšie. Nainštalujte ich do GitHub Copilot, Cursor, Claude Code alebo akéhokoľvek podporovaného agenta:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Rýchly sprievodca riešením problémov

**Bežné problémy, s ktorými sa začiatočníci stretávajú, a okamžité riešenia:**

<details>
<summary><strong>❌ "azd: príkaz nebol nájdený"</strong></summary>

```bash
# Najskôr nainštalujte AZD
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
<summary><strong>❌ "Nebola nájdená žiadna predplatné" alebo "Predplatné nie je nastavené"</strong></summary>

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
<summary><strong>❌ "Nedostatočná kvóta" alebo "Kvóta bola prekročená"</strong></summary>

```bash
# Vyskúšajte inú oblasť Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Alebo použite menšie SKU počas vývoja
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
<summary><strong>❌ "Overenie zlyhalo" alebo "Token vypršal"</strong></summary>

```bash
# Znovu overiť
az logout
az login

azd auth logout
azd auth login

# Overiť autentifikáciu
az account show
```
</details>

<details>
<summary><strong>❌ "Zdroj už existuje" alebo konflikty názvov</strong></summary>

```bash
# AZD generuje jedinečné názvy, ale ak dôjde ku konfliktu:
azd down --force --purge

# Potom skús znovu s novým prostredím
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
# Skontrolujte priebeh
azd show

# Ak ste zaseknutí viac ako 30 minút, skontrolujte Azure portál:
azd monitor
# Hľadajte zlyhané nasadenia
```
</details>

<details>
<summary><strong>❌ "Prístup zamietnutý" alebo "Zakázané"</strong></summary>

```bash
# Skontrolujte svoju rolu v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebujete aspoň rolu "Prispievateľ"
# Požiadajte svojho Azure administrátora o udelenie:
# - Prispievateľ (pre zdroje)
# - Správca prístupu používateľov (pre priradenia rolí)
```
</details>

<details>
<summary><strong>❌ Nemožno nájsť URL nasadenej aplikácie</strong></summary>

```bash
# Zobraziť všetky koncové body služieb
azd show

# Alebo otvoriť Azure portál
azd monitor

# Skontrolovať konkrétnu službu
azd env get-values
# Hľadať premenné *_URL
```
</details>

### 📚 Kompletné zdroje na riešenie problémov

- **Sprievodca bežnými problémami:** [Podrobné riešenia](docs/chapter-07-troubleshooting/common-issues.md)
- **Problémy špecifické pre AI:** [Riešenie problémov s AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Sprievodca ladením:** [Postupné ladenie](docs/chapter-07-troubleshooting/debugging.md)
- **Získajte pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Ukončenie kurzu a certifikácia

### Sledovanie pokroku
Sledujte svoj pokrok v učení cez jednotlivé kapitoly:

- [ ] **Kapitola 1**: Základy a rýchle spustenie ✅
- [ ] **Kapitola 2**: Vývoj orientovaný na AI ✅  
- [ ] **Kapitola 3**: Konfigurácia a overenie ✅
- [ ] **Kapitola 4**: Infraštruktúra ako kód a nasadenie ✅
- [ ] **Kapitola 5**: Viacagentové AI riešenia ✅
- [ ] **Kapitola 6**: Overenie a plánovanie pred nasadením ✅
- [ ] **Kapitola 7**: Riešenie problémov a ladenie ✅
- [ ] **Kapitola 8**: Produkčné a podnikové vzory ✅

### Overenie učenia
Po dokončení každej kapitoly overte svoje znalosti pomocou:
1. **Praktického cvičenia**: Dokončite praktické nasadenie z kapitoly
2. **Kontroly znalostí**: Prezrite si sekciu FAQ pre vašu kapitolu
3. **Diskusie v komunite**: Podeľte sa o svoje skúsenosti v Azure Discord
4. **Ďalšej kapitoly**: Pokračujte na ďalšiu úroveň zložitosti

### Výhody ukončenia kurzu
Po dokončení všetkých kapitol získate:
- **Produkčné skúsenosti**: Nasadené reálne AI aplikácie do Azure
- **Odborné zručnosti**: Schopnosť nasadenia pripraveného na podnikové použitie  
- **Uznanie v komunite**: Aktívny člen Azure vývojárskej komunity
- **Kariérny rast**: Žiadané znalosti AZD a AI nasadenia

---

## 🤝 Komunita a podpora

### Získajte pomoc a podporu
- **Technické problémy**: [Nahláste chyby a žiadajte o funkcie](https://github.com/microsoft/azd-for-beginners/issues)
- **Otázky k učeniu**: [Microsoft Azure Discord komunita](https://discord.gg/microsoft-azure) a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc špecifická pre AI**: Pridajte sa k [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentácia**: [Oficiálna dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Postrehy komunity z Microsoft Foundry Discord

**Nedávne výsledky ankety v kanáli #Azure:**
- **45%** vývojárov chce používať AZD pre AI pracovné záťaže
- **Hlavné výzvy**: Viacslužbové nasadenia, správa poverení, pripravenosť na produkciu  
- **Najžiadanejšie**: Šablóny špecifické pre AI, sprievodcovia riešením problémov, najlepšie praktiky

**Pridajte sa k našej komunite, aby ste:**
- Zdieľali svoje skúsenosti s AZD + AI a získali pomoc
- Získali prístup k skorým ukážkam nových AI šablón
- Prispeli k najlepším praktikám nasadenia AI
- Ovplyvnili budúci vývoj AI + AZD funkcií

### Príspevky do kurzu
Vítame príspevky! Prečítajte si náš [Sprievodca prispievaním](CONTRIBUTING.md) pre podrobnosti o:
- **Vylepšenie obsahu**: Vylepšenie existujúcich kapitol a príkladov
- **Nové príklady**: Pridávanie reálnych scenárov a šablón  
- **Preklady**: Pomoc pri udržiavaní podpory viacerých jazykov
- **Nahlasovanie chýb**: Zlepšenie presnosti a zrozumiteľnosti
- **Štandardy komunity**: Dodržiavanie našich inkluzívnych smerníc komunity

---

## 📄 Informácie o kurze

### Licencia
Tento projekt je licencovaný pod licenciou MIT - pozrite si súbor [LICENSE](../../LICENSE) pre podrobnosti.

### Súvisiace vzdelávacie zdroje Microsoftu

Náš tím vytvára ďalšie komplexné vzdelávacie kurzy:

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
 
### Séria generatívnej AI
[![Generatívna AI pre začiatočníkov](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatívna AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatívna AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatívna AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Základné učenie
[![Strojové učenie pre začiatočníkov](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Dátová veda pre začiatočníkov](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI pre začiatočníkov](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kybernetická bezpečnosť pre začiatočníkov](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webový vývoj pre začiatočníkov](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pre začiatočníkov](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Vývoj XR pre začiatočníkov](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Séria Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigácia kurzu

**🚀 Pripravení začať sa učiť?**

**Začiatočníci**: Začnite s [Kapitola 1: Základy a Rýchly štart](#-chapter-1-foundation--quick-start)  
**AI vývojári**: Preskočte na [Kapitola 2: AI-prvý vývoj](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Skúsení vývojári**: Začnite s [Kapitola 3: Konfigurácia a Autentifikácia](#️-chapter-3-configuration--authentication)

**Ďalšie kroky**: [Začať Kapitolu 1 - Základy AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:  
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, vezmite na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne výklady vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->