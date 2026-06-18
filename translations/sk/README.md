# AZD pre začiatočníkov: štruktúrovaná učebná cesta

![AZD-pre-začiatočníkov](../../translated_images/sk/azdbeginners.5527441dd9f74068.webp) 

[![GitHub sledovatelia](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forky](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub hviezdy](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatické preklady (vždy aktuálne)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabčina](../ar/README.md) | [Bengálčina](../bn/README.md) | [Bulharčina](../bg/README.md) | [Barmčina (Mjanmar)](../my/README.md) | [Čínština (zjednodušená)](../zh-CN/README.md) | [Čínština (tradičná, Hongkong)](../zh-HK/README.md) | [Čínština (tradičná, Macau)](../zh-MO/README.md) | [Čínština (tradičná, Taiwan)](../zh-TW/README.md) | [Chorvátčina](../hr/README.md) | [Čeština](../cs/README.md) | [Dánčina](../da/README.md) | [Nizozemčina](../nl/README.md) | [Estónčina](../et/README.md) | [Fínčina](../fi/README.md) | [Francúzština](../fr/README.md) | [Nemčina](../de/README.md) | [Gréčtina](../el/README.md) | [Hebrejčina](../he/README.md) | [Hindčina](../hi/README.md) | [Maďarčina](../hu/README.md) | [Indonézčina](../id/README.md) | [Taliančina](../it/README.md) | [Japončina](../ja/README.md) | [Kannadčina](../kn/README.md) | [Khmerčina](../km/README.md) | [Kórejčina](../ko/README.md) | [Litovčina](../lt/README.md) | [Malajčina](../ms/README.md) | [Malayálčina](../ml/README.md) | [Maráthčina](../mr/README.md) | [Nepálčina](../ne/README.md) | [Nigérijský pidžin](../pcm/README.md) | [Nórčina](../no/README.md) | [Perzština (fársí)](../fa/README.md) | [Poľština](../pl/README.md) | [Portugalčina (Brazília)](../pt-BR/README.md) | [Portugalčina (Portugalsko)](../pt-PT/README.md) | [Pandžábčina (Gurmukhí)](../pa/README.md) | [Rumunčina](../ro/README.md) | [Ruština](../ru/README.md) | [Srbčina (cyrilika)](../sr/README.md) | [Slovenčina](./README.md) | [Slovinčina](../sl/README.md) | [Španielčina](../es/README.md) | [Svahilčina](../sw/README.md) | [Švédčina](../sv/README.md) | [Tagalog (Filipíny)](../tl/README.md) | [Tamilčina](../ta/README.md) | [Telugčina](../te/README.md) | [Thajčina](../th/README.md) | [Turečtina](../tr/README.md) | [Ukrajinčina](../uk/README.md) | [Urdčina](../ur/README.md) | [Vietnamčina](../vi/README.md)

> **Preferujete klonovať lokálne?**
>
> Tento repozitár obsahuje 50+ jazykových prekladov, čo značne zvyšuje veľkosť sťahovania. Ak chcete klonovať bez prekladov, použite sparse checkout:
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
> Tento spôsob vám poskytne všetko potrebné na dokončenie kurzu s omnoho rýchlejším stiahnutím.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Čo je dnes nové v azd

> 📌 Tento kurz je overený proti verzii **`azd 1.25.6`** (jún 2026). Spustite `azd version` pre kontrolu svojej verzie a `azd upgrade`, ak chcete získať najnovšiu.

Azure Developer CLI sa rozšíril nad rámec tradičných webových aplikácií a API. Dnes je azd jediný nástroj na nasadzovanie **ľubovoľnej** aplikácie do Azure — vrátane aplikácií s AI a inteligentných agentov.

Čo to pre vás znamená:

- **AI agenti sú teraz plnohodnotné pracovné zaťaženia azd.** Môžete inicializovať, nasadzovať a spravovať projekty AI agentov pomocou toho istého workflow `azd init` → `azd up`, ktoré už poznáte.
- **Kompletný životný cyklus agenta z CLI.** Rozšírenie `azure.ai.agents` teraz pokrýva celú cestu — `azd ai agent init` na scaffoldovanie, `azd ai agent invoke` na testovanie (s výstupom časovania odpovede), `azd ai agent eval generate` a `azd ai agent optimize` na meranie a zlepšenie kvality, a `azd ai agent delete` na úklid.
- **Viac stavebných blokov pre AI.** Nové preview rozšírenia — `azure.ai.skills` a `azure.ai.connections` — vám umožnia spravovať znovupoužiteľné agentové skills a Foundry connections priamo cez azd.
- **Integrácia Microsoft Foundry** prináša nasadzovanie modelov, hosting agentov a konfiguráciu AI služieb priamo do ekosystému azd šablón.
- **Hladnejšie každodenné základy.** Nedávne vydania urobili `azd init` idempotentným (bezpečné opakovať), spravili `azd auth login`, aby automaticky vyčistil zastarané tokeny, a pridali priateľské nastavenie pri prvom spustení `azd tool`.
- **Základný workflow sa nezmenil.** Či už nasadzujete todo aplikáciu, mikroslužbu alebo multi-agent AI riešenie, príkazy sú rovnaké.

> **Poznámka pre používateľov Aspire:** Microsoft teraz produkt jednoducho nazýva **Aspire** (predtým ".NET Aspire"). Podpora Aspire v azd je nezmenená — iba názov bol aktualizovaný.

Ak ste azd už používali, podpora AI je prirodzené rozšírenie — nie samostatný nástroj alebo pokročilá vetva. Ak začínate odznova, naučíte sa jeden workflow, ktorý funguje pre všetko.

---

## 🚀 Čo je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je priateľský príkazový nástroj pre vývojárov, ktorý zjednodušuje nasadzovanie aplikácií do Azure. Namiesto manuálneho vytvárania a prepájania desiatok Azure prostriedkov môžete nasadiť celé aplikácie jediným príkazom.

### Mágia príkazu `azd up`

```bash
# Tento jediný príkaz robí všetko:
# ✅ Vytvorí všetky prostriedky Azure
# ✅ Konfiguruje sieť a bezpečnosť
# ✅ Skladá váš aplikačný kód
# ✅ Nasadí do Azure
# ✅ Poskytne vám funkčnú URL adresu
azd up
```

**To je všetko!** Žiadne klikanie v Azure Portáli, žiadne zložité ARM šablóny na naučenie, žiadna manuálna konfigurácia — len fungujúce aplikácie v Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: V čom je rozdiel?

Toto je najbežnejšia otázka, ktorú kladú začiatočníci. Tu je jednoduchá odpoveď:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Spravovať jednotlivé Azure prostriedky | Nasadzovať kompletné aplikácie |
| **Mindset** | Zamerané na infraštruktúru | Zamerané na aplikácie |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Je potrebné poznať služby Azure | Stačí poznať svoju aplikáciu |
| **Best For** | DevOps, infraštruktúra | Vývojári, prototypovanie |

### Jednoduchá analógia

- **Azure CLI** je ako mať všetky nástroje na stavbu domu — kladivá, píly, klince. Môžete postaviť čokoľvek, ale musíte poznať stavebníctvo.
- **Azure Developer CLI** je ako najať dodávateľa — opíšete, čo chcete, a on sa postará o výstavbu.

### Kedy použiť ktoré

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Spoločne fungujú!

AZD používa Azure CLI "pod kapotou". Oba môžete používať:
```bash
# Nasadte svoju aplikáciu pomocou AZD
azd up

# Potom doladte konkrétne zdroje pomocou Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Nájdite šablóny v Awesome AZD

Nestartujte od nuly! **Awesome AZD** je komunitná zbierka hotových šablón pripravených na nasadenie:

| Resource | Description |
|----------|-------------|
| 🔗 [**Galéria Awesome AZD**](https://azure.github.io/awesome-azd/) | Prezrite si 200+ šablón s nasadením jedným kliknutím |
| 🔗 [**Odošlite šablónu**](https://github.com/Azure/awesome-azd/issues) | Prispievajte vlastnou šablónou komunite |
| 🔗 [**GitHub repozitár**](https://github.com/Azure/awesome-azd) | Dajte hviezdu a preskúmajte zdrojový kód |

### Populárne AI šablóny z Awesome AZD

```bash
# RAG chat s modelmi Microsoft Foundry + AI vyhľadávanie
azd init --template azure-search-openai-demo

# Rýchla AI chat aplikácia
azd init --template openai-chat-app-quickstart

# AI agenti s Foundry agentmi
azd init --template get-started-with-ai-agents
```

---

## 🎯 Začíname v 3 krokoch

Pred začatím sa uistite, že váš počítač je pripravený pre šablónu, ktorú chcete nasadiť:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ak niektorá z požadovaných kontrol zlyhá, opravte ju najprv a potom pokračujte s rýchlym štartom.

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

### Krok 2: Autentifikácia pre AZD

```bash
# Nepovinné, ak plánujete priamo používať príkazy Azure CLI v tomto kurze
az login

# Povinné pre AZD pracovné postupy
azd auth login
```

Ak si nie ste istí, ktorú možnosť potrebujete, postupujte podľa úplného nastavenia v [Inštalácia a nastavenie](docs/chapter-01-foundation/installation.md#authentication-setup).

### Krok 3: Nasadiť svoju prvú aplikáciu

```bash
# Inicializovať z šablóny
azd init --template todo-nodejs-mongo

# Nasadiť do Azure (vytvorí všetko!)
azd up
```

**🎉 Hotovo!** Vaša aplikácia je teraz nasadená na Azure.

### Vyčistenie (nezabudnite!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Ako používať tento kurz

Tento kurz je navrhnutý pre **postupné učenie** — začnite tam, kde sa cítite pohodlne, a postupne sa posúvajte vyššie:

| Your Experience | Start Here |
|-----------------|------------|
| **Úplne nový v Azure** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Poznáte Azure, nový v AZD** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Chcete nasadzovať AI aplikácie** | [Kapitola 2: Vývoj orientovaný na AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Chcete praktickú skúsenosť** | [🎓 Interaktívny workshop](workshop/README.md) - 3-4 hodinový vedený lab |
| **Potrebujete produkčné vzory** | [Kapitola 8: Produkcia a podnikové vzory](#-chapter-8-production--enterprise-patterns) |

### Rýchle nastavenie

1. **Vytvorte fork tohto repozitára**: [![GitHub forky](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Naklonujte ho**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Získajte pomoc**: [Komunita Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Preferujete klonovať lokálne?**

> Tento repozitár obsahuje 50+ jazykových prekladov, čo značne zvyšuje veľkosť sťahovania. Ak chcete klonovať bez prekladov, použite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Tento spôsob vám poskytne všetko potrebné na dokončenie kurzu s omnoho rýchlejším stiahnutím.


## Prehľad kurzu

Osvojte si Azure Developer CLI (azd) prostredníctvom štruktúrovaných kapitol navrhnutých pre postupné učenie. **Špeciálny dôraz na nasadzovanie AI aplikácií s integráciou Microsoft Foundry.**
### Prečo je tento kurz nevyhnutný pre moderných vývojárov

Na základe poznatkov zo spoločenstva Microsoft Foundry na Discorde chce **45% vývojárov použiť AZD pre AI pracovné zaťaženia**, ale naráža na problémy s:
- Komplexné viacslužbové AI architektúry
- Najlepšie praktiky nasadenia AI do produkcie  
- Integrácia a konfigurácia Azure AI služieb
- Optimalizácia nákladov pre AI pracovné zaťaženia
- Riešenie problémov špecifických pre nasadenie AI

### Ciele učenia

Po dokončení tohto štruktúrovaného kurzu budete:
- **Ovládnuť základy AZD**: Kľúčové koncepty, inštalácia a konfigurácia
- **Nasadiť AI aplikácie**: Použiť AZD so službami Microsoft Foundry
- **Implementovať infraštruktúru ako kód**: Spravovať Azure zdroje pomocou Bicep šablón
- **Riešiť problémy pri nasadení**: Riešiť bežné problémy a debugovať chyby
- **Optimalizovať pre produkciu**: Bezpečnosť, škálovanie, monitorovanie a manažment nákladov
- **Stavať multi-agentné riešenia**: Nasadiť komplexné AI architektúry

## Pred začiatkom: účty, prístup a predpoklady

Pred začatím kapitoly 1 sa uistite, že máte nasledovné. Kroky inštalácie neskôr v tomto návode predpokladajú, že tieto základy sú už vyriešené.

- **Azure predplatné**: Môžete použiť existujúce predplatné z práce alebo svoj účet, alebo si vytvoriť a [bezplatnú skúšobnú verziu](https://aka.ms/azurefreetrial) na začiatok.
- **Povolenie na vytváranie Azure zdrojov**: Pre väčšinu cvičení by ste mali mať aspoň prístup **Contributor** na cieľovom predplatnom alebo skupine prostriedkov. Niektoré kapitoly môžu tiež predpokladať, že môžete vytvárať skupiny prostriedkov, spravované identity a RBAC priradenia.
- [**GitHub účet**](https://github.com): Toto je užitočné na forkovanie repozitára, sledovanie vlastných zmien a používanie GitHub Codespaces pre workshop.
- **Požiadavky runtime pre šablóny**: Niektoré šablóny potrebujú lokálne nástroje ako Node.js, Python, Java alebo Docker. Spustite validačný skript nastavenia pred začatím, aby ste včas odhalili chýbajúce nástroje.
- **Základná znalosť terminálu**: Nemusíte byť expert, ale mali by ste byť pohodlní pri spúšťaní príkazov ako `git clone`, `azd auth login` a `azd up`.

> **Pracujete v enterprise predplatnom?**
> Ak je vaše Azure prostredie spravované administrátorom, potvrďte vopred, že môžete nasadzovať zdroje v predplatnom alebo skupine prostriedkov, ktorú plánujete použiť. Ak nie, pred začiatkom požiadajte o sandbox predplatné alebo prístup Contributor.

> **Nový v Azure?**
> Začnite so svojím vlastným Azure trial alebo pay-as-you-go predplatným na https://aka.ms/azurefreetrial, aby ste mohli dokončiť cvičenia od začiatku do konca bez čakania na schválenia na úrovni tenanta.

## 🗺️ Mapa kurzu: Rýchla navigácia podľa kapitol

Každá kapitola má vyhradené README s cieľmi učenia, rýchlym štartom a cvičeniami:

| Kapitola | Téma | Lekcie | Trvanie | Komplexnosť |
|---------|-------|---------|----------|------------|
| **[Kap. 1: Základy](docs/chapter-01-foundation/README.md)** | Začíname | [Základy AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Inštalácia](docs/chapter-01-foundation/installation.md) &#124; [Prvý projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap. 2: AI vývoj](docs/chapter-02-ai-development/README.md)** | Aplikácie zamerané na AI | [Integrácia Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agenti](docs/chapter-02-ai-development/agents.md) &#124; [Nasadenie modelu](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Kap. 3: Konfigurácia](docs/chapter-03-configuration/README.md)** | Autentifikácia a bezpečnosť | [Konfigurácia](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap. 4: Infrastruktúra](docs/chapter-04-infrastructure/README.md)** | IaC & Nasadenie | [Sprievodca nasadením](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Kap. 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Riešenia AI agentov | [Retail scenár](examples/retail-scenario.md) &#124; [Koordinačné vzory](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Kap. 6: Pred nasadením](docs/chapter-06-pre-deployment/README.md)** | Plánovanie & Validácia | [Preflight kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Plánovanie kapacít](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Výber SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Kap. 7: Riešenie problémov](docs/chapter-07-troubleshooting/README.md)** | Debug & Oprava | [Bežné problémy](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Ladenie](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problémy](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Kap. 8: Produkcia](docs/chapter-08-production/README.md)** | Vzory pre podnikové nasadenie | [Praktiky pre produkciu](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktický lab | [Úvod](workshop/docs/instructions/0-Introduction.md) &#124; [Výber](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validácia](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deštrukcia](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurácia](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prispôsobenie](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Uvoľnenie infraštruktúry](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zhrnutie](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Celkové trvanie kurzu:** ~10-14 hodín | **Progres zručností:** Začiatočník → Pripravený do produkcie

---

## 📚 Výukové kapitoly

*Vyberte si učebnú cestu podľa úrovne skúseností a cieľov*

### 🚀 Kapitola 1: Základy a rýchly štart
**Predpoklady**: Azure predplatné, základné znalosti príkazového riadku  
**Trvanie**: 30-45 minút  
**Komplexnosť**: ⭐

#### Čo sa naučíte
- Pochopenie základov Azure Developer CLI
- Inštalácia AZD na vašej platforme
- Vaše prvé úspešné nasadenie

#### Učebné zdroje
- **🎯 Začnite tu**: [Čo je Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teória**: [Základy AZD](docs/chapter-01-foundation/azd-basics.md) - Základné koncepty a terminológia
- **⚙️ Nastavenie**: [Inštalácia a nastavenie](docs/chapter-01-foundation/installation.md) - Návody pre konkrétnu platformu
- **🛠️ Prakticky**: [Váš prvý projekt](docs/chapter-01-foundation/first-project.md) - Návod krok za krokom
- **📋 Rýchla referencia**: [Rýchla príručka príkazov](resources/cheat-sheet.md)

#### Praktické cvičenia
```bash
# Rýchla kontrola inštalácie
azd version

# Nasadiť svoju prvú aplikáciu
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
azd show                # Zobrazuje URL bežiacej aplikácie
# Aplikácia sa otvorí v prehliadači a funguje
azd down --force --purge  # Uvoľňuje zdroje
```

**📊 Časová investícia:** 30-45 minút  
**📈 Úroveň zručností po:** Dokážete nasadiť základné aplikácie samostatne
**📈 Úroveň zručností po:** Dokážete nasadiť základné aplikácie samostatne

---

### 🤖 Kapitola 2: AI-prvotný vývoj (odporúčané pre AI vývojárov)
**Predpoklady**: Kapitola 1 dokončená  
**Trvanie**: 1-2 hodiny  
**Komplexnosť**: ⭐⭐

#### Čo sa naučíte
- Integrácia Microsoft Foundry s AZD
- Nasadzovanie aplikácií poháňaných AI
- Pochopenie konfigurácií AI služieb

#### Učebné zdroje
- **🎯 Začnite tu**: [Integrácia Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agenti**: [Sprievodca AI agentmi](docs/chapter-02-ai-development/agents.md) - Nasadzujte inteligentných agentov s AZD
- **📖 Vzory**: [Nasadenie AI modelu](docs/chapter-02-ai-development/ai-model-deployment.md) - Nasadiť a spravovať AI modely
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pripravte svoje AI riešenia pre AZD
- **🎥 Interaktívny sprievodca**: [Materiály workshopu](workshop/README.md) - Učenie v prehliadači s MkDocs * DevContainer Environment
- **📋 Šablóny**: [Šablóny Microsoft Foundry](#zdroje-workshopu)
- **📝 Príklady**: [Príklady nasadenia AZD](examples/README.md)

#### Praktické cvičenia
```bash
# Nasadiť svoju prvú AI aplikáciu
azd init --template azure-search-openai-demo
azd up

# Vyskúšať ďalšie AI šablóny
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Výsledok kapitoly**: Nasadiť a nakonfigurovať chatovaciu aplikáciu poháňanú AI s RAG schopnosťami

**✅ Overenie úspechu:**
```bash
# Po kapitole 2 by ste mali byť schopní:
azd init --template azure-search-openai-demo
azd up
# Otestovať rozhranie AI chatu
# Klásť otázky a získavať odpovede generované AI so zdrojmi
# Overiť, či integrácia vyhľadávania funguje
azd monitor  # Skontrolovať, či Application Insights zobrazuje telemetriu
azd down --force --purge
```

**📊 Časová investícia:** 1-2 hodiny  
**📈 Úroveň zručností po:** Dokážete nasadiť a nakonfigurovať produkčné AI aplikácie  
**💰 Povedomie o nákladoch:** Pochopte náklady vývoja $80-150/mesiac, náklady produkcie $300-3500/mesiac

#### 💰 Úvahy o nákladoch pri nasadení AI

**Vývojové prostredie (odhad $80-150/mesiac):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/mesiac (na základe využitia tokenov)
- AI Search (Basic tier): $75/mesiac
- Container Apps (Consumption): $0-20/mesiac
- Úložisko (Standard): $1-5/mesiac

**Produkčné prostredie (odhad $300-3,500+/mesiac):**
- Microsoft Foundry Models (PTU pre konzistentný výkon): $3,000+/mesiac ALEBO Pay-as-go pri vysokom objeme
- AI Search (Standard tier): $250/mesiac
- Container Apps (Dedicated): $50-100/mesiac
- Application Insights: $5-50/mesiac
- Úložisko (Premium): $10-50/mesiac

**💡 Tipy na optimalizáciu nákladov:**
- Použite **Free Tier** Microsoft Foundry Models na učenie (Azure OpenAI 50,000 tokens/month included)
- Spúšťajte `azd down` na de-alokáciu zdrojov, keď aktívne nevyvíjate
- Začnite s platbou podľa spotreby, na PTU prejdite len pre produkciu
- Použite `azd provision --preview` na odhad nákladov pred nasadením
- Povoliť auto-scaling: platíte iba za skutočné využitie

**Sledovanie nákladov:**
```bash
# Skontrolujte odhadované mesačné náklady
azd provision --preview

# Sledujte skutočné náklady v Azure Portáli
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitola 3: Konfigurácia & Autentifikácia
**Predpoklady**: Kapitola 1 dokončená  
**Trvanie**: 45-60 minút  
**Komplexnosť**: ⭐⭐

#### Čo sa naučíte
- Konfigurácia a správa prostredí
- Najlepšie praktiky autentifikácie a bezpečnosti
- Názvoslovie a organizácia zdrojov

#### Učebné zdroje
- **📖 Konfigurácia**: [Sprievodca konfiguráciou](docs/chapter-03-configuration/configuration.md) - Nastavenie prostredia
- **🔐 Bezpečnosť**: [Vzor autentifikácie a spravovaná identita](docs/chapter-03-configuration/authsecurity.md) - Vzory autentifikácie
- **📝 Príklady**: [Príklad databázovej aplikácie](examples/database-app/README.md) - Príklady databáz AZD

#### Praktické cvičenia
- Nakonfigurujte viacero prostredí (dev, staging, prod)
- Nastavte autentifikáciu so spravovanou identitou
- Implementujte konfigurácie špecifické pre prostredie

**💡 Výsledok kapitoly**: Spravovať viaceré prostredia s náležitou autentifikáciou a bezpečnosťou

---

### 🏗️ Kapitola 4: Infrastruktúra ako kód a nasadenie
**Predpoklady**: Kapitoly 1-3 dokončené  
**Trvanie**: 1-1.5 hodiny  
**Komplexnosť**: ⭐⭐⭐

#### Čo sa naučíte
- Pokročilé vzory nasadenia
- Infrastruktúra ako kód s Bicep
- Strategie provisioningu zdrojov

#### Učebné zdroje
- **📖 Nasadenie**: [Sprievodca nasadením](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletné workflowy
- **🏗️ Provisioning**: [Provisioning zdrojov](docs/chapter-04-infrastructure/provisioning.md) - Správa Azure zdrojov
- **📝 Príklady**: [Príklad Container App](../../examples/container-app) - Nasadenia v kontajneroch

#### Praktické cvičenia
- Vytvorte vlastné Bicep šablóny
- Nasadiť viacslužbové aplikácie
- Implementovať blue-green deployment stratégie

**💡 Výsledok kapitoly**: Nasadiť zložité viacslužbové aplikácie pomocou vlastných infraštruktúrnych šablón
### 🎯 Kapitola 5: Riešenia AI s viacerými agentmi (Pokročilé)
**Predpoklady**: Kapitoly 1-2 dokončené  
**Trvanie**: 2-3 hodiny  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Vzory architektúry viacerých agentov
- Orkestrácia a koordinácia agentov
- Produkčné nasadenia AI

#### Vzdelávacie zdroje
- **🤖 Hlavný projekt**: [Maloobchodné riešenie s viacerými agentmi](examples/retail-scenario.md) - Kompletná implementácia
- **🛠️ ARM šablóny**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Nasadenie jedným kliknutím
- **📖 Architektúra**: [Vzory koordinácie viacerých agentov](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzory

#### Praktické cvičenia
```bash
# Nasadiť kompletné maloobchodné riešenie s viacerými agentmi
cd examples/retail-multiagent-arm-template
./deploy.sh

# Preskúmať konfigurácie agentov
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Výsledok kapitoly**: Nasadiť a spravovať produkčné riešenie AI s agentmi Zákazník a Inventár

---

### 🔍 Kapitola 6: Validácia a plánovanie pred nasadením
**Predpoklady**: Kapitola 4 dokončená  
**Trvanie**: 1 hodina  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Plánovanie kapacity a overenie zdrojov
- Stratégie výberu SKU
- Predbežné kontroly a automatizácia

#### Vzdelávacie zdroje
- **📊 Plánovanie**: [Plánovanie kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) - Overenie zdrojov
- **💰 Výber**: [Výber SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Nákladovo efektívne možnosti
- **✅ Validácia**: [Predbežné kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktické cvičenia
- Spustiť skripty na overenie kapacity
- Optimalizovať výber SKU z hľadiska nákladov
- Implementovať automatizované predbežné kontroly

**💡 Výsledok kapitoly**: Overiť a optimalizovať nasadenia pred spustením

---

### 🚨 Kapitola 7: Riešenie problémov a ladenie
**Predpoklady**: Dokončená ktorákoľvek kapitola o nasadení  
**Trvanie**: 1-1,5 hodiny  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Systematické prístupy k ladeniu
- Bežné problémy a riešenia
- Riešenie problémov špecifických pre AI

#### Vzdelávacie zdroje
- **🔧 Bežné problémy**: [Bežné problémy](docs/chapter-07-troubleshooting/common-issues.md) - FAQ a riešenia
- **🕵️ Ladenie**: [Príručka ladenia](docs/chapter-07-troubleshooting/debugging.md) - Stratégie krok za krokom
- **🤖 Problémy s AI**: [Riešenie problémov špecifických pre AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problémy so službami AI

#### Praktické cvičenia
- Diagnostikovať zlyhania nasadenia
- Riešiť problémy s overovaním
- Ladiť konektivitu služieb AI

**💡 Výsledok kapitoly**: Nezávisle diagnostikovať a riešiť bežné problémy s nasadením

---

### 🏢 Kapitola 8: Produkčné a podnikové vzory
**Predpoklady**: Kapitoly 1-4 dokončené  
**Trvanie**: 2-3 hodiny  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Stratégie produkčného nasadenia
- Podnikové bezpečnostné vzory
- Monitorovanie a optimalizácia nákladov

#### Vzdelávacie zdroje
- **🏭 Produkcia**: [Najlepšie postupy pre AI v produkcii](docs/chapter-08-production/production-ai-practices.md) - Podnikové vzory
- **📝 Príklady**: [Príklad mikroslužieb](../../examples/microservices) - Zložité architektúry
- **📊 Monitorovanie**: [Integrácia Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorovanie

#### Praktické cvičenia
- Implementovať podnikové bezpečnostné vzory
- Nastaviť komplexné monitorovanie
- Nasadiť do produkcie s riadnou správou

**💡 Výsledok kapitoly**: Nasadiť aplikácie pripravené pre podnikové prostredie s plnými produkčnými schopnosťami

---

## 🎓 Prehľad workshopu: Praktické učenie

> **⚠️ STAV WORKSHOPU: Prebieha vývoj**  
> Materiály workshopu sú momentálne vyvíjané a dolaďované. Základné moduly fungujú, ale niektoré pokročilé sekcie sú neúplné. Aktívne pracujeme na dokončení celého obsahu. [Sledovať pokrok →](workshop/README.md)

### Interaktívne materiály workshopu
**Komplexné praktické učenie s nástrojmi v prehliadači a vedenými cvičeniami**

Materiály workshopu poskytujú štruktúrovaný, interaktívny zážitok z učenia, ktorý dopĺňa vyššie uvedený osnovový obsah. Workshop je navrhnutý pre samostatné tempo učenia aj pre vedené relácie inštruktormi.

#### 🛠️ Funkcie workshopu
- **Rozhranie v prehliadači**: Kompletný workshop poháňaný MkDocs s funkciami vyhľadávania, kopírovania a tém
- **Integrácia GitHub Codespaces**: Nastavenie vývojového prostredia jedným kliknutím
- **Štruktúrovaná cesta učenia**: 8-modulové vedené cvičenia (spolu 3-4 hodiny)
- **Progresívna metodológia**: Úvod → Výber → Validácia → Dekonštrukcia → Konfigurácia → Prispôsobenie → Ukončenie → Zhrnutie
- **Interaktívne DevContainer prostredie**: Predkonfigurované nástroje a závislosti

#### 📚 Štruktúra modulov workshopu
Workshop nasleduje **8-modulovú progresívnu metodológiu**, ktorá vás prevedie od objavovania k majstrovstvu nasadzovania:

| Modul | Téma | Čo budete robiť | Trvanie |
|--------|-------|----------------|----------|
| **0. Úvod** | Prehľad workshopu | Pochopiť ciele učenia, predpoklady a štruktúru workshopu | 15 min |
| **1. Výber** | Objavovanie šablón | Preskúmať AZD šablóny a vybrať správnu AI šablónu pre váš scenár | 20 min |
| **2. Validácia** | Nasadiť a overiť | Nasadiť šablónu pomocou `azd up` a overiť, že infraštruktúra funguje | 30 min |
| **3. Dekonštrukcia** | Pochopiť štruktúru | Použiť GitHub Copilot na preskúmanie architektúry šablóny, Bicep súborov a organizácie kódu | 30 min |
| **4. Konfigurácia** | Hlboký pohľad na azure.yaml | Ovládnuť konfiguráciu `azure.yaml`, lifecycle hooky a premenné prostredia | 30 min |
| **5. Prispôsobenie** | Prispôsobte si to | Povoliť AI Search, sledovanie, vyhodnocovanie a prispôsobiť to vášmu scenáru | 45 min |
| **6. Ukončenie** | Vyčistiť | Bezpečne odstrániť zdroje pomocou `azd down --purge` | 15 min |
| **7. Zhrnutie** | Ďalšie kroky | Preveriť dosiahnuté výsledky, kľúčové koncepty a pokračovať vo vašom učení | 15 min |

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
# Postupujte podľa pokynov na nastavenie v workshop/README.md
```

#### 🎯 Výsledky učenia z workshopu
Účasťou na workshope získajú účastníci:
- **Nasadiť produkčné AI aplikácie**: Použiť AZD so službami Microsoft Foundry
- **Ovládnuť architektúry s viacerými agentmi**: Implementovať koordinované riešenia AI agentov
- **Implementovať najlepšie bezpečnostné postupy**: Konfigurovať autentifikáciu a riadenie prístupu
- **Optimalizovať pre škálovanie**: Navrhnúť nákladovo efektívne a výkonné nasadenia
- **Riešiť problémy nasadení**: Nezávisle riešiť bežné problémy

#### 📖 Zdroje workshopu
- **🎥 Interaktívny sprievodca**: [Workshop Materials](workshop/README.md) - Prostredie učenia v prehliadači
- **📋 Inštrukcie po moduloch**:
  - [0. Úvod](workshop/docs/instructions/0-Introduction.md) - Prehľad workshopu a ciele
  - [1. Výber](workshop/docs/instructions/1-Select-AI-Template.md) - Nájsť a vybrať AI šablóny
  - [2. Validácia](workshop/docs/instructions/2-Validate-AI-Template.md) - Nasadiť a overiť šablóny
  - [3. Dekonštrukcia](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Preskúmať architektúru šablóny
  - [4. Konfigurácia](workshop/docs/instructions/4-Configure-AI-Template.md) - Ovládnuť `azure.yaml`
  - [5. Prispôsobenie](workshop/docs/instructions/5-Customize-AI-Template.md) - Prispôsobiť pre váš scenár
  - [6. Ukončenie](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Vyčistiť zdroje
  - [7. Zhrnutie](workshop/docs/instructions/7-Wrap-up.md) - Prehľad a ďalšie kroky
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Cvičenia zamerané na AI
- **💡 Rýchly štart**: [Workshop Setup Guide](workshop/README.md#quick-start) - Konfigurácia prostredia

**Ideálne pre**: Firemné školenia, univerzitné kurzy, samostatné učenie a bootcampy pre vývojárov.

---

## 📖 Hlboký vhľad: Schopnosti AZD

Nad rámec základov poskytuje AZD silné funkcie pre produkčné nasadenia:

- **Nasadenia založené na šablónach** - Použiť predpripravené šablóny pre bežné vzory aplikácií
- **Infrastruktúra ako kód** - Spravovať zdroje Azure pomocou Bicep alebo Terraform  
- **Integrované pracovné postupy** - Bezproblémovo zabezpečiť, nasadiť a monitorovať aplikácie
- **Priateľské k vývojárom** - Optimalizované pre produktivitu a skúsenosť vývojárov

### **AZD + Microsoft Foundry: Ideálne pre AI nasadenia**

**Prečo AZD pre AI riešenia?** AZD rieši hlavné výzvy, ktorým čelia vývojári AI:

- **Šablóny pripravené na AI** - Predkonfigurované šablóny pre Microsoft Foundry Models, Azure AI Services a ML pracovné zaťaženia
- **Bezpečné AI nasadenia** - Vstavané bezpečnostné vzory pre služby AI, API kľúče a koncové body modelov  
- **Produkčné AI vzory** - Najlepšie postupy pre škálovateľné a nákladovo efektívne nasadenia AI aplikácií
- **End-to-End AI pracovné postupy** - Od vývoja modelu po produkčné nasadenie s primeraným monitorovaním
- **Optimalizácia nákladov** - Inteligentné prideľovanie zdrojov a stratégie škálovania pre AI pracovné zaťaženia
- **Integrácia s Microsoft Foundry** - Plynulé prepojenie s katalógom modelov Microsoft Foundry a koncovými bodmi

---

## 🎯 Knižnica šablón a príkladov

### Odporúčané: Microsoft Foundry šablóny
**Začnite tu, ak nasadzujete AI aplikácie!**

> **Poznámka:** Tieto šablóny ukazujú rôzne AI vzory. Niektoré sú externé Azure Samples, iné sú lokálne implementácie.

| Šablóna | Kapitola | Zložitosť | Služby | Typ |
|----------|---------|------------|----------|------|
| [**Začnite s AI chatom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externé |
| [**Začnite s AI agentmi**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitola 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externé |
| [**Ukážka Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externé |
| [**Rýchly štart OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externé |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externé |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externé |
| [**Maloobchodné riešenie s viacerými agentmi**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokálne** |

### Odporúčané: Kompletné vzdelávacie scenáre
**Šablóny aplikácií pripravené do produkcie mapované na vzdelávacie kapitoly**

| Šablóna | Vzdelávacia kapitola | Zložitosť | Hlavné poznatky |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | Základné vzory nasadenia AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | RAG implementácia s Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitola 4 | ⭐⭐ | Integrácia Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | Rámec agentov a volanie funkcií |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐ | Podniková orchestrácia AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | Architektúra viacerých agentov s agentmi Zákazník a Inventár |

### Učenie podľa typu príkladu

> **📌 Lokálne vs. externé príklady:**  
> **Lokálne príklady** (v tomto repozitári) = Ihneď pripravené na použitie  
> **Externé príklady** (Azure Samples) = Klonovať z prepojených repozitárov

#### Lokálne príklady (Ihneď pripravené na použitie)
- [**Maloobchodné riešenie s viacerými agentmi**](examples/retail-scenario.md) - Kompletná implementácia pripravená do produkcie s ARM šablónami
  - Architektúra viacerých agentov (agenti Zákazník + Inventár)
  - Komplexné monitorovanie a vyhodnocovanie
  - Nasadenie jedným kliknutím cez ARM šablónu

#### Lokálne príklady - Kontajnerové aplikácie (Kapitoly 2-5)
**Komplexné príklady nasadenia kontajnerov v tomto repozitári:**
- [**Príklady Container App**](examples/container-app/README.md) - Kompletný sprievodca nasadením kontajnerov
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api) - Základné REST API so škálovaním na nulu
  - [Architektúra mikroslužieb](../../examples/container-app/microservices) - Produkčné nasadenie viacerých služieb
  - Rýchly štart, produkčné a pokročilé vzory nasadenia
  - Pokyny na monitorovanie, zabezpečenie a optimalizáciu nákladov

#### Externé príklady - jednoduché aplikácie (kapitoly 1-2)
**Klonujte tieto ukážkové repozitáre Azure, aby ste začali:**
- [Jednoduchá webová aplikácia - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Základné vzory nasadenia
- [Statická webová stránka - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Nasadenie statického obsahu
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Nasadenie REST API

#### Externé príklady - integrácia databázy (kapitoly 3-4)  
- [Aplikácia s databázou - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzory pripojenia k databáze
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless dátový pracovný tok

#### Externé príklady - pokročilé vzory (kapitoly 4-8)
- [Java mikroslužby](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architektúry viacerých služieb
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Spracovanie na pozadí  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkčné vzory pre ML

### Externé zbierky šablón
- [**Oficiálna galéria šablón AZD**](https://azure.github.io/awesome-azd/) - Kurátorsky vybraná kolekcia oficiálnych a komunitných šablón
- [**Šablóny Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentácia šablón na Microsoft Learn
- [**Adresár príkladov**](examples/README.md) - Lokálne príklady na učenie s podrobnými vysvetleniami

---

## 📚 Vzdelávacie zdroje a odkazy

### Rýchle referencie
- [**Prehľad príkazov**](resources/cheat-sheet.md) - Základné príkazy azd zoradené podľa kapitoly
- [**Glosár**](resources/glossary.md) - Terminológia Azure a azd  
- [**FAQ**](resources/faq.md) - Bežné otázky zoradené podľa kapitoly
- [**Študijný sprievodca**](resources/study-guide.md) - Komplexné cvičenia na precvičenie

### Praktické workshopy
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Urobte svoje AI riešenia nasaditeľné pomocou AZD (2-3 hodiny)
- [**Interaktívny workshop**](workshop/README.md) - 8-modulové riadené cvičenia s MkDocs a GitHub Codespaces
  - Nasleduje: Úvod → Výber → Validácia → Dekonštrukcia → Konfigurácia → Prispôsobenie → Vyčistenie → Zhrnutie

### Externé vzdelávacie zdroje
- Azure Developer CLI Documentation: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure Architecture Center: https://learn.microsoft.com/en-us/azure/architecture/
- Azure Pricing Calculator: https://azure.microsoft.com/pricing/calculator/
- Azure Status: https://status.azure.com/

### Zručnosti AI agentov pre váš editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otvorených zručností agentov pre Azure AI, Foundry, nasadenie, diagnostiku, optimalizáciu nákladov a ďalšie. Inštalujte ich v GitHub Copilot, Cursor, Claude Code alebo v akomkoľvek podporovanom agente:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Rýchly sprievodca riešením problémov

**Bežné problémy, s ktorými sa začiatočníci stretávajú, a okamžité riešenia:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

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
# Zobraziť dostupné predplatné
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
# Vyskúšajte inú oblasť Azure
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

# Možnosť 4: Skontrolovať denníky v Azure Monitori
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Znovu sa autentifikujte pre AZD
azd auth logout
azd auth login

# Voliteľné: obnovte aj Azure CLI, ak používate príkazy az
az logout
az login

# Overte autentifikáciu
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD generuje jedinečné mená, ale ak dôjde ku konfliktu:
azd down --force --purge

# Potom skúsi znova s novým prostredím
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Nasadenie šablóny trvá príliš dlho</strong></summary>

**Bežné časy čakania:**
- Jednoduchá webová aplikácia: 5-10 minút
- Aplikácia s databázou: 10-15 minút
- AI aplikácie: 15-25 minút (provisionovanie OpenAI je pomalé)

```bash
# Skontrolujte priebeh
azd show

# Ak ste zaseknutí viac ako 30 minút, skontrolujte Azure Portal:
azd monitor --overview
# Vyhľadajte zlyhané nasadenia
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Skontrolujte svoju rolu v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebujete aspoň rolu "Contributor"
# Požiadajte svojho administrátora Azure, aby udelil:
# - Contributor (pre zdroje)
# - User Access Administrator (pre prideľovanie rolí)
```
</details>

<details>
<summary><strong>❌ Nemožno nájsť URL nasadenej aplikácie</strong></summary>

```bash
# Zobraziť všetky koncové body služieb
azd show

# Alebo otvorte Azure portál
azd monitor

# Skontrolovať konkrétnu službu
azd env get-values
# Hľadajte premenné *_URL
```
</details>

### 📚 Komplexné zdroje riešenia problémov

- **Sprievodca bežnými problémami:** [Podrobné riešenia](docs/chapter-07-troubleshooting/common-issues.md)
- **Problémy špecifické pre AI:** [Riešenie problémov s AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Sprievodca ladením:** [Ladovanie krok za krokom](docs/chapter-07-troubleshooting/debugging.md)
- **Získajte pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Ukončenie kurzu a certifikácia

### Sledovanie pokroku
Sledujte svoj pokrok v učení v každej kapitole:

- [ ] **Kapitola 1**: Základy a rýchly štart ✅
- [ ] **Kapitola 2**: Vývoj orientovaný na AI ✅  
- [ ] **Kapitola 3**: Konfigurácia a overovanie ✅
- [ ] **Kapitola 4**: Infrastruktúra ako kód a nasadenie ✅
- [ ] **Kapitola 5**: Riešenia AI s viacerými agentmi ✅
- [ ] **Kapitola 6**: Prednasadenové overenie a plánovanie ✅
- [ ] **Kapitola 7**: Riešenie problémov a ladenie ✅
- [ ] **Kapitola 8**: Produkčné a podnikové vzory ✅

### Overenie vedomostí
Po dokončení každej kapitoly overte svoje vedomosti takto:
1. **Praktické cvičenie**: Dokončite praktické nasadenie z kapitoly
2. **Kontrola vedomostí**: Prezrite si sekciu FAQ pre vašu kapitolu
3. **Diskusia v komunite**: Zdieľajte svoje skúsenosti v Azure Discord
4. **Ďalšia kapitola**: Prejdite na ďalšiu úroveň zložitosti

### Výhody dokončenia kurzu
Po dokončení všetkých kapitol získate:
- **Produkčné skúsenosti**: Nasadili ste skutočné AI aplikácie do Azure
- **Profesionálne zručnosti**: Schopnosti nasadenia pripravené pre podnikové prostredie  
- **Uznanie v komunite**: Aktívny člen Azure developerskej komunity
- **Kariérny rozvoj**: Požadované znalosti v oblasti nasadzovania AZD a AI

---

## 🤝 Komunita a podpora

### Získajte pomoc a podporu
- **Technické problémy**: [Nahláste chyby a požiadajte o funkcie](https://github.com/microsoft/azd-for-beginners/issues)
- **Otázky k učeniu**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-špecifická pomoc**: Pripojte sa k [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentácia**: [Oficiálna dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Postrehy komunity z Microsoft Foundry Discord

**Nedávne výsledky ankety z kanála #Azure:**
- **45%** vývojárov chce používať AZD pre AI záťaže
- **Hlavné výzvy**: nasadenia viacerých služieb, správa poverení, pripravenosť na produkciu  
- **Najviac požadované**: šablóny špecifické pre AI, príručky na riešenie problémov, osvedčené postupy

**Pripojte sa k našej komunite a:**
- Zdieľajte svoje skúsenosti s AZD + AI a získajte pomoc
- Získajte prístup k predbežným ukážkam nových AI šablón
- Prispievajte k osvedčeným postupom nasadzovania AI
- Ovplyvnite budúci vývoj funkcií AI + AZD

### Prispievanie do kurzu
Vítame príspevky! Prečítajte si náš [Contributing Guide](CONTRIBUTING.md) pre podrobnosti o:
- **Vylepšenie obsahu**: Vylepšite existujúce kapitoly a príklady
- **Nové príklady**: Pridajte scenáre z reálneho sveta a šablóny  
- **Preklad**: Pomôžte udržiavať viacjazyčnú podporu
- **Nahlásenia chýb**: Zlepšite presnosť a zrozumiteľnosť
- **Štandardy komunity**: Dodržiavajte naše inkluzívne pravidlá komunity

---

## 📄 Informácie o kurze

### Licencia
Tento projekt je licencovaný pod MIT licenciou - pozrite si súbor [LICENSE](../../LICENSE) pre podrobnosti.

### Súvisiace vzdelávacie zdroje Microsoftu

Náš tím vytvára ďalšie komplexné vzdelávacie kurzy:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatívna AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Základné učenie
[![ML pre začiatočníkov](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Dátová veda pre začiatočníkov](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI pre začiatočníkov](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kybernetická bezpečnosť pre začiatočníkov](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webový vývoj pre začiatočníkov](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pre začiatočníkov](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR vývoj pre začiatočníkov](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Séria Copilot
[![Copilot pre párované AI programovanie](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pre C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot dobrodružstvo](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigácia kurzu

**🚀 Pripravení začať sa učiť?**

**Začiatočníci**: Začnite s [Kapitola 1: Základy a Rýchly štart](#-chapter-1-foundation--quick-start)  
**Vývojári AI**: Prejdite na [Kapitola 2: Vývoj orientovaný na AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Skúsení vývojári**: Začnite s [Kapitola 3: Konfigurácia a autentifikácia](#️-chapter-3-configuration--authentication)

**Ďalšie kroky**: [Začať kapitolu 1 - Základy AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->