<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T14:43:12+00:00",
  "source_file": "README.md",
  "language_code": "sk"
}
-->
# AZD pre začiatočníkov: Štruktúrovaná učebná cesta

![AZD-pre-začiatočníkov](../../../../translated_images/sk/azdbeginners.5527441dd9f74068.webp) 

[![GitHub pozorovatelia](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forky](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub hviezdy](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Začíname s týmto kurzom

Nasledujte tieto kroky, aby ste začali svoju učebnú cestu s AZD:

1. **Forknite repozitár**: Kliknite na [![GitHub forky](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonujte repozitár**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Pridajte sa ku komunite**: [Azure Discord komunity](https://discord.com/invite/ByRwuEEgH4) pre odbornú podporu
4. **Vyberte si svoju učebnú cestu**: Zvoľte kapitolu nižšie podľa svojej úrovne skúseností

### Podpora viacerých jazykov

#### Automatizované preklady (vždy aktuálne)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabčina](../ar/README.md) | [Bengálčina](../bn/README.md) | [Bulharčina](../bg/README.md) | [Barmčina (Myanmar)](../my/README.md) | [Čínština (zjednodušená)](../zh/README.md) | [Čínština (tradičná, Hongkong)](../hk/README.md) | [Čínština (tradičná, Macau)](../mo/README.md) | [Čínština (tradičná, Taiwan)](../tw/README.md) | [Chorvátčina](../hr/README.md) | [Čeština](../cs/README.md) | [Dánčina](../da/README.md) | [Holandčina](../nl/README.md) | [Estónčina](../et/README.md) | [Fínčina](../fi/README.md) | [Francúzština](../fr/README.md) | [Nemčina](../de/README.md) | [Gréčtina](../el/README.md) | [Hebrejčina](../he/README.md) | [Hindčina](../hi/README.md) | [Maďarčina](../hu/README.md) | [Indonézština](../id/README.md) | [Taliančina](../it/README.md) | [Japončina](../ja/README.md) | [Kannadčina](../kn/README.md) | [Kórejčina](../ko/README.md) | [Litovčina](../lt/README.md) | [Malajčina](../ms/README.md) | [Malayalam](../ml/README.md) | [Maráthčina](../mr/README.md) | [Nepálčina](../ne/README.md) | [Nigérijský pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Perzština (Farsi)](../fa/README.md) | [Poľština](../pl/README.md) | [Portugalčina (Brazília)](../br/README.md) | [Portugalčina (Portugalsko)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumunčina](../ro/README.md) | [Ruština](../ru/README.md) | [Srbčina (cyrilika)](../sr/README.md) | [Slovenčina](./README.md) | [Slovinčina](../sl/README.md) | [Španielčina](../es/README.md) | [Svahilčina](../sw/README.md) | [Švédčina](../sv/README.md) | [Tagalog (Filipínska)](../tl/README.md) | [Tamilčina](../ta/README.md) | [Telugčina](../te/README.md) | [Thajčina](../th/README.md) | [Turečtina](../tr/README.md) | [Ukrajinčina](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamčina](../vi/README.md)

> **Radšej klonujete lokálne?**

> Tento repozitár obsahuje viac ako 50 prekladov jazykov, čo výrazne zvyšuje veľkosť sťahovania. Pre klonovanie bez prekladov použite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Toto vám poskytne všetko potrebné pre dokončenie kurzu s rýchlejším sťahovaním.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Prehľad kurzu

Ovládnite Azure Developer CLI (azd) cez štruktúrované kapitoly navrhnuté pre postupné učenie. **Špeciálny dôraz na nasadenie AI aplikácií s integráciou Microsoft Foundry.**

### Prečo je tento kurz nevyhnutný pre moderných vývojárov

Na základe poznatkov z komunity Microsoft Foundry Discord, **45 % vývojárov chce používať AZD pre AI pracovné zaťaženia**, ale čelia výzvam s:
- Zložitými viac-službovými AI architektúrami
- Najlepšími praktikami produkčného nasadenia AI  
- Integráciou a konfiguráciou Azure AI služieb
- Optimalizáciou nákladov pre AI pracovné zaťaženia
- Riešením problémov špecifických pre AI nasadenia

### Ciele učenia

Po dokončení tohto štruktúrovaného kurzu budete:
- **Ovládať základy AZD**: základné koncepty, inštaláciu a konfiguráciu
- **Nasadzovať AI aplikácie**: používaním AZD s Microsoft Foundry službami
- **Implementovať infraštruktúru ako kód**: spravovať Azure zdroje pomocou Bicep šablón
- **Riešiť problémy nasadení**: vyriešovať bežné chyby a debugovať problémy
- **Optimalizovať pre produkciu**: zabezpečenie, škálovanie, monitorovanie a riadenie nákladov
- **Budovať multi-agentné riešenia**: nasadzovať zložité AI architektúry

## 📚 Učebné kapitoly

*Vyberte si svoju učebnú cestu podľa úrovne skúseností a cieľov*

### 🚀 Kapitola 1: Základy & Rýchly štart
**Predpoklady**: Azure predplatné, základné znalosti príkazového riadku  
**Trvanie**: 30-45 minút  
**Zložitosť**: ⭐

#### Čo sa naučíte
- Pochopenie základov Azure Developer CLI
- Inštalácia AZD na vašu platformu
- Vaše prvé úspešné nasadenie

#### Učebné zdroje
- **🎯 Začnite tu**: [Čo je Azure Developer CLI?](../..)
- **📖 Teória**: [Základy AZD](docs/getting-started/azd-basics.md) - základné koncepty a terminológia
- **⚙️ Nastavenie**: [Inštalácia & nastavenie](docs/getting-started/installation.md) - platformovo špecifické návody
- **🛠️ Prakticky**: [Váš prvý projekt](docs/getting-started/first-project.md) - krok za krokom tutoriál
- **📋 Rýchly prehľad**: [Příkazový prehľad](resources/cheat-sheet.md)

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
azd show                # Zobrazuje URL bežiacej aplikácie
# Aplikácia sa otvorí v prehliadači a funguje
azd down --force --purge  # Čistí zdroje
```

**📊 Časová investícia:** 30-45 minút  
**📈 Úroveň zručností po:** Samostatné nasadenie základných aplikácií

**✅ Overenie úspechu:**
```bash
# Po dokončení kapitoly 1 by ste mali byť schopní:
azd version              # Zobrazuje nainštalovanú verziu
azd init --template todo-nodejs-mongo  # Inicializuje projekt
azd up                  # Nasadzuje na Azure
azd show                # Zobrazuje URL bežiacej aplikácie
# Aplikácia sa otvorí v prehliadači a funguje
azd down --force --purge  # Odstraňuje prostriedky
```

**📊 Časová investícia:** 30-45 minút  
**📈 Úroveň zručností po:** Samostatné nasadenie základných aplikácií

---

### 🤖 Kapitola 2: Vývoj orientovaný na AI (Odporúčané pre AI vývojárov)
**Predpoklady**: Kapitola 1 dokončená  
**Trvanie**: 1-2 hodiny  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Integrácia Microsoft Foundry s AZD
- Nasadzovanie AI aplikácií s podporou AI
- Pochopenie konfigurácií AI služieb

#### Učebné zdroje
- **🎯 Začnite tu**: [Integrácia Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Vzory**: [Nasadenie AI modelu](docs/microsoft-foundry/ai-model-deployment.md) - Nasadzujte a spravujte AI modely
- **🛠️ Workshop**: [AI workshop laboratórium](docs/microsoft-foundry/ai-workshop-lab.md) - Pripravte si AI riešenia na AZD
- **🎥 Interaktívny sprievodca**: [Materiály workshopu](workshop/README.md) - Učenie v prehliadači s MkDocs * DevContainer prostredie
- **📋 Šablóny**: [Microsoft Foundry šablóny](../..)
- **📝 Príklady**: [Príklady nasadení AZD](examples/README.md)

#### Praktické cvičenia
```bash
# Nasadzujte svoju prvú AI aplikáciu
azd init --template azure-search-openai-demo
azd up

# Vyskúšajte ďalšie AI šablóny
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Výsledok kapitoly**: Nasadiť a nakonfigurovať AI chatovaciu aplikáciu s RAG schopnosťami

**✅ Overenie úspechu:**
```bash
# Po kapitole 2 by ste mali byť schopní:
azd init --template azure-search-openai-demo
azd up
# Otestovať rozhranie AI chatu
# Pýtať sa otázky a získavať odpovede poháňané AI s uvedením zdrojov
# Overiť, že integrácia vyhľadávania funguje
azd monitor  # Skontrolovať, či Application Insights zobrazuje telemetriu
azd down --force --purge
```

**📊 Časová investícia:** 1-2 hodiny  
**📈 Úroveň zručností po:** Schopnosť nasadiť a konfigurovať AI aplikácie pripravené do produkcie  
**💰 Povedomie o nákladoch:** Pochopenie nákladov na vývoj $80-150/mesiac, produkčných nákladov $300-3500/mesiac

#### 💰 Nákladové úvahy pre AI nasadenia

**Vývojové prostredie (odhad $80-150/mesiac):**
- Azure OpenAI (platba podľa využitia): $0-50/mesiac (závisí na použití tokenov)
- AI Search (základná úroveň): $75/mesiac
- Container Apps (spotreba): $0-20/mesiac
- Ukladanie (štandardné): $1-5/mesiac

**Produkčné prostredie (odhad $300-3,500+/mesiac):**
- Azure OpenAI (PTU pre konzistentný výkon): $3,000+/mesiac ALEBO platba podľa spotreby s vysokým objemom
- AI Search (štandardná úroveň): $250/mesiac
- Container Apps (dedikované): $50-100/mesiac
- Application Insights: $5-50/mesiac
- Ukladanie (prémiové): $10-50/mesiac

**💡 Tipy na optimalizáciu nákladov:**
- Používajte **bezplatnú úroveň** Azure OpenAI pre učenie (v cene 50 000 tokenov/mesiac)
- Spúšťajte `azd down` na uvoľnenie zdrojov, keď aktívne nevyvíjate
- Začnite so spotrebou, PTU používajte len pre produkciu
- Použite `azd provision --preview` na odhad nákladov pred nasadením
- Povoliť auto-škálovanie: platíte len za reálne využitie

**Monitorovanie nákladov:**
```bash
# Skontrolujte odhadované mesačné náklady
azd provision --preview

# Sledujte skutočné náklady v Azure Portáli
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitola 3: Konfigurácia & overovanie identity
**Predpoklady**: Kapitola 1 dokončená  
**Trvanie**: 45-60 minút  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Konfigurácia a správa prostredí
- Overovanie a bezpečnostné najlepšie praktiky
- Názvoslovie a organizácia zdrojov

#### Učebné zdroje
- **📖 Konfigurácia**: [Príručka konfigurácie](docs/getting-started/configuration.md) - nastavenie prostredia
- **🔐 Bezpečnosť**: [Vzorce overovania a spravované identity](docs/getting-started/authsecurity.md) - vzorce overovania
- **📝 Príklady**: [Príklad databázovej aplikácie](examples/database-app/README.md) - AZD databázové príklady

#### Praktické cvičenia
- Konfigurácia viacerých prostredí (dev, staging, prod)
- Nastavenie overovania pomocou spravovaných identít
- Implementácia konfigurácií špecifických pre prostredie

**💡 Výsledok kapitoly**: Spravovať viacero prostredí s riadnym overovaním a zabezpečením

---

### 🏗️ Kapitola 4: Infra ako kód & nasadenie
**Predpoklady**: Kapitoly 1-3 dokončené  
**Trvanie**: 1-1,5 hodiny  
**Zložitosť**: ⭐⭐⭐

#### Čo sa naučíte
- Pokročilé vzory nasadenia
- Infra ako kód s Bicep
- Stratégie provisioningu zdrojov

#### Učebné zdroje
- **📖 Nasadenie**: [Príručka nasadenia](docs/deployment/deployment-guide.md) - kompletné workflowy
- **🏗️ Provisioning**: [Provisioning zdrojov](docs/deployment/provisioning.md) - správa Azure zdrojov
- **📝 Príklady**: [Príklad Container app](../../examples/container-app) - nasadenia kontajnerov

#### Praktické cvičenia
- Vytvoriť vlastné Bicep šablóny
- Nasadiť viac-službové aplikácie
- Implementovať stratégie blue-green nasadení

**💡 Výsledok kapitoly**: Nasadiť zložité viac-službové aplikácie pomocou vlastných infraštruktúrnych šablón

---

### 🎯 Kapitola 5: Multi-agentné AI riešenia (Pokročilé)
**Predpoklady**: Kapitoly 1-2 dokončené  
**Trvanie**: 2-3 hodiny  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Vzory multi-agentnej architektúry
- Orchestrace a koordinácia agentov
- Produkčné AI nasadenia pripravené k nasadeniu

#### Vzdelávacie zdroje
- **🤖 Odporúčaný projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Kompletná implementácia
- **🛠️ ARM Šablóny**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Nasadenie jedným kliknutím
- **📖 Architektúra**: [Vzory koordinácie viacerých agentov](/docs/pre-deployment/coordination-patterns.md) - Vzory

#### Praktické cvičenia
```bash
# Nasadiť kompletné maloobchodné riešenie viacerých agentov
cd examples/retail-multiagent-arm-template
./deploy.sh

# Preskúmať konfigurácie agentov
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Výsledok kapitoly**: Nasadiť a spravovať produkčné riešenie viacerých AI agentov s Customer a Inventory agentmi

---

### 🔍 Kapitola 6: Overenie a plánovanie pred nasadením
**Predpoklady**: Dokončená Kapitola 4  
**Trvanie**: 1 hodina  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Plánovanie kapacity a overovanie zdrojov
- Stratégie výberu SKU
- Predbežné kontroly a automatizácia

#### Vzdelávacie zdroje
- **📊 Plánovanie**: [Plánovanie kapacity](docs/pre-deployment/capacity-planning.md) - Overovanie zdrojov
- **💰 Výber**: [Výber SKU](docs/pre-deployment/sku-selection.md) - Nákladovo efektívne voľby
- **✅ Overovanie**: [Predbežné kontroly](docs/pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktické cvičenia
- Spustiť skripty overovania kapacity
- Optimalizovať výber SKU pre náklady
- Implementovať automatizované kontroly pred nasadením

**💡 Výsledok kapitoly**: Overiť a optimalizovať nasadenia pred ich spustením

---

### 🚨 Kapitola 7: Riešenie problémov a ladenie
**Predpoklady**: Dokončená ľubovoľná kapitola o nasadení  
**Trvanie**: 1-1,5 hodiny  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Systematické prístupy k ladení
- Bežné problémy a riešenia
- Riešenie problémov špecifických pre AI

#### Vzdelávacie zdroje
- **🔧 Bežné problémy**: [Bežné problémy](docs/troubleshooting/common-issues.md) - Často kladené otázky a riešenia
- **🕵️ Ladenie**: [Sprievodca ladením](docs/troubleshooting/debugging.md) - Postupné stratégie
- **🤖 AI problémy**: [Riešenie problémov pri AI](docs/troubleshooting/ai-troubleshooting.md) - Problémy AI služieb

#### Praktické cvičenia
- Diagnostikovať zlyhania nasadenia
- Riešiť problémy s autentifikáciou
- Ladiť pripojenie AI služieb

**💡 Výsledok kapitoly**: Samostatne diagnostikovať a riešiť bežné problémy pri nasadení

---

### 🏢 Kapitola 8: Produkčné a podnikové vzory
**Predpoklady**: Dokončené kapitoly 1-4  
**Trvanie**: 2-3 hodiny  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Produkčné stratégie nasadenia
- Podnikové bezpečnostné vzory
- Monitorovanie a optimalizácia nákladov

#### Vzdelávacie zdroje
- **🏭 Produkcia**: [Produkčné AI osvedčené postupy](docs/microsoft-foundry/production-ai-practices.md) - Podnikové vzory
- **📝 Príklady**: [Príklad mikroslužieb](../../examples/microservices) - Zložité architektúry
- **📊 Monitorovanie**: [Integrácia Application Insights](docs/pre-deployment/application-insights.md) - Monitorovanie

#### Praktické cvičenia
- Implementovať podnikové bezpečnostné vzory
- Nastaviť komplexné monitorovanie
- Nasadiť do produkcie s vhodnou správou

**💡 Výsledok kapitoly**: Nasadiť podnikové aplikácie pripravené do produkcie so všetkými funkciami

---

## 🎓 Prehľad workshopu: Praktická výučba

> **⚠️ STAV WORKSHOPU: Aktívny vývoj**  
> Materiály workshopu sú momentálne vyvíjané a zdokonaľované. Základné moduly fungujú, ale niektoré pokročilé časti ešte nie sú hotové. Aktívne pracujeme na dokončení všetkého obsahu. [Sledujte pokrok →](workshop/README.md)

### Interaktívne materiály workshopu
**Komplexná praktická výučba s nástrojmi v prehliadači a vedenými cvičeniami**

Naše materiály poskytujú štruktúrovaný a interaktívny vzdelávací zážitok, ktorý dopĺňa curriculum podľa kapitol. Workshop je navrhnutý pre samostatné štúdium aj pre vedené kurzy.

#### 🛠️ Funkcie workshopu
- **Rozhranie v prehliadači**: Kompletný workshop poháňaný MkDocs s vyhľadávaním, kopírovaním a témami
- **Integrácia GitHub Codespaces**: Nastavenie vývojového prostredia jedným kliknutím
- **Štruktúrovaná cesta učenia**: 7 krokov s vedenými cvičeniami (celkovo 3,5 hodiny)
- **Discovery → Deployment → Customization**: Postupná metodika
- **Interaktívne DevContainer prostredie**: Predkonfigurované nástroje a závislosti

#### 📚 Štruktúra workshopu
Workshop používa metodiku **Discovery → Deployment → Customization**:

1. **Fáza objavovania** (45 minút)
   - Preskúmať šablóny a služby Microsoft Foundry
   - Porozumieť vzorom architektúry viacerých agentov
   - Preskúmať požiadavky na nasadenie a predpoklady

2. **Fáza nasadenia** (2 hodiny)
   - Praktické nasadenie AI aplikácií pomocou AZD
   - Konfigurácia Azure AI služieb a endpointov
   - Implementácia bezpečnostných a autentifikačných vzorov

3. **Fáza úprav** (45 minút)
   - Úprava aplikácií pre špecifické použitia
   - Optimalizácia pre produkčné nasadenie
   - Implementácia monitorovania a správy nákladov

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
Po absolvovaní workshopu účastníci:
- **Nasadia produkčné AI aplikácie**: Použijú AZD so službami Microsoft Foundry
- **Ovládnu architektúry viacerých agentov**: Implementujú koordinované AI agent riešenia
- **Implementujú bezpečnostné postupy**: Nakonfigurujú autentifikáciu a kontrolu prístupu
- **Optimalizujú pre mierku**: Navrhnú nákladovo efektívne a výkonné nasadenia
- **Riešia problémy s nasadením**: Samostatne riešia bežné problémy

#### 📖 Zdroje workshopu
- **🎥 Interaktívny sprievodca**: [Workshop materiály](workshop/README.md) - Vzdelávacie prostredie v prehliadači
- **📋 Pokyny krok za krokom**: [Vedené cvičenia](../../workshop/docs/instructions) - Podrobné návody
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Cvičenia so zameraním na AI
- **💡 Rýchly štart**: [Návod na nastavenie workshopu](workshop/README.md#quick-start) - Konfigurácia prostredia

**Ideálne pre**: firemné školenia, univerzitné kurzy, samostatné štúdium a bootcampy pre vývojárov.

---

## 📖 Čo je to Azure Developer CLI?

Azure Developer CLI (azd) je príkazový riadok zameraný na vývojárov, ktorý zrýchľuje proces tvorby a nasadenia aplikácií do Azure. Poskytuje:

- **Nasadenia založené na šablónach** - Použitie predpripravených šablón pre bežné aplikácie
- **Infrastructure as Code** - Správa Azure zdrojov pomocou Bicep alebo Terraformu  
- **Integrované pracovné postupy** - Plynulé provisionovanie, nasadenie a monitorovanie aplikácií
- **Priateľské k vývojárom** - Optimalizované pre produktivitu a zážitok vývojára

### **AZD + Microsoft Foundry: Perfektné pre AI nasadenia**

**Prečo AZD pre AI riešenia?** AZD rieši hlavné výzvy, ktorým čelia AI vývojári:

- **AI pripravené šablóny** - Prednastavené šablóny pre Azure OpenAI, Cognitive Services a ML pracovné záťaže
- **Bezpečné AI nasadenia** - Vstavané bezpečnostné vzory pre AI služby, API kľúče a endpointy modelov  
- **Produkčné AI vzory** - Osvedčené postupy pre škálovateľné, nákladovo efektívne AI aplikácie
- **End-to-End AI pracovné postupy** - Od vývoja modelu po produkčné nasadenie s riadnym monitorovaním
- **Optimalizácia nákladov** - Inteligentná alokácia zdrojov a škálovanie pre AI pracovné záťaže
- **Integrácia Microsoft Foundry** - Plynulé prepojenie s katalógom modelov a endpointami Microsoft Foundry

---

## 🎯 Knižnica šablón a príkladov

### Odporúčané: Microsoft Foundry šablóny
**Začnite tu, ak nasadzujete AI aplikácie!**

> **Poznámka:** Tieto šablóny demonštrujú rôzne AI vzory. Niektoré sú externé Azure ukážky, iné sú lokálne implementácie.

| Šablóna | Kapitola | Zložitosť | Služby | Typ |
|----------|---------|------------|----------|------|
| [**Začnite s AI chatom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externé |
| [**Začnite s AI agentmi**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitola 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externé |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externé |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externé |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externé |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externé |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokálne** |

### Odporúčané: Kompletné učebné scenáre
**Produktové šablóny aplikácií mapované na učebné kapitoly**

| Šablóna | Učebná kapitola | Zložitosť | Kľúčové učenie |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | Základné AI nasadenie vzory |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | RAG implementácia s Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitola 4 | ⭐⭐ | Integrácia inteligencie dokumentov |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | Rámec agentov a volanie funkcií |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐ | Podniková AI orchestrácia |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | Architektúra viacerých agentov so Customer a Inventory agentmi |

### Učenie podľa typu príkladu

> **📌 Lokálne vs. Externé príklady:**  
> **Lokálne príklady** (v tomto repozitári) = Ihneď pripravené na použitie  
> **Externé príklady** (Azure Samples) = Klonovať z prepojených repozitárov

#### Lokálne príklady (Ihneď pripravené)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kompletná produkčná implementácia s ARM šablónami
  - Architektúra viacerých agentov (Customer + Inventory agenti)
  - Komplexné monitorovanie a hodnotenie
  - Nasadenie jedným kliknutím cez ARM šablónu

#### Lokálne príklady - kontajnerové aplikácie (kapitoly 2-5)
**Komplexné príklady nasadenia kontajnerov v tomto repozitári:**
- [**Príklady kontajnerových aplikácií**](examples/container-app/README.md) - Kompletný sprievodca kontajnerovými nasadeniami
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api) - Základné REST API so škálovaním na nulu
  - [Architektúra mikroslužieb](../../examples/container-app/microservices) - Produkčné nasadenie viacerých služieb
  - Rýchly štart, produkcia a pokročilé nasadenia
  - Monitorovanie, bezpečnosť a optimalizácia nákladov

#### Externé príklady - jednoduché aplikácie (kapitoly 1-2)
**Klonujte tieto Azure Samples repozitáre na začiatok:**
- [Jednoduchá webová aplikácia - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Základné vzory nasadenia
- [Statická stránka - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Nasadenie statického obsahu
- [Kontajnerová aplikácia - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Nasadenie REST API

#### Externé príklady - integrácia databázy (kapitoly 3-4)  
- [Databázová aplikácia - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzory pre pripojenie k databáze
- [Funkcie + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless dátové pracovné toky

#### Externé príklady - pokročilé vzory (kapitoly 4-8)
- [Java mikroslužby](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architektúry viacerých služieb
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Spracovanie na pozadí  
- [Podnikový ML pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkčné ML vzory

### Externé kolekcie šablón
- [**Oficiálna galéria AZD šablón**](https://azure.github.io/awesome-azd/) - Kurátorská zbierka oficiálnych a komunitných šablón
- [**Azure Developer CLI šablóny**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentácia Microsoft Learn šablón
- [**Adresár Príkladov**](examples/README.md) - Lokálne vzdelávacie príklady s podrobnými vysvetleniami

---

## 📚 Vzdelávacie zdroje a odkazy

### Rýchle odkazy
- [**Pomôcka pre príkazy**](resources/cheat-sheet.md) - Základné príkazy azd usporiadané podľa kapitol
- [**Glosár**](resources/glossary.md) - Terminológia Azure a azd  
- [**FAQ**](resources/faq.md) - Často kladené otázky usporiadané podľa kapitol učenia
- [**Študijný sprievodca**](resources/study-guide.md) - Komplexné cvičenia

### Praktické workshopy
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Spravte svoje AI riešenia nasaditeľné cez AZD (2-3 hodiny)
- [**Interaktívny sprievodca workshopom**](workshop/README.md) - Workshop na prehliadači s MkDocs a DevContainer prostredím
- [**Štruktúrovaná cesta učenia**](../../workshop/docs/instructions) - 7-krokové vedené cvičenia (Objavovanie → Nasadenie → Prispôsobenie)
- [**AZD pre začiatočníkov Workshop**](workshop/README.md) - Kompletné praktické materiály workshopu s integráciou GitHub Codespaces

### Externé vzdelávacie zdroje
- Dokumentácia Azure Developer CLI (https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Azure Architecture Center (https://learn.microsoft.com/en-us/azure/architecture/)
- Azure Kalkulačka cien (https://azure.microsoft.com/pricing/calculator/)
- Stav Azure (https://status.azure.com/)

---

## 🔧 Rýchly sprievodca riešením problémov

**Bežné problémy, s ktorými sa začiatočníci stretávajú, a okamžité riešenia:**

### ❌ "azd: príkaz nebol nájdený"

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

### ❌ "Nebola nájdená žiadna predplatné" alebo "Predplatné nie je nastavené"

```bash
# Zoznam dostupných odberov
az account list --output table

# Nastaviť predvolený odber
az account set --subscription "<subscription-id-or-name>"

# Nastaviť pre prostredie AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Overiť
az account show
```

### ❌ "Nedostatok kvóty" alebo "Kvóta prekročená"

```bash
# Vyskúšajte iný región Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Alebo použite menšie SKU počas vývoja
# Upravte infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" zlyháva v polovici

```bash
# Možnosť 1: Vyčistiť a skúsiť znova
azd down --force --purge
azd up

# Možnosť 2: Iba opraviť infraštruktúru
azd provision

# Možnosť 3: Skontrolovať podrobné denníky
azd show
azd logs
```

### ❌ "Overenie zlyhalo" alebo "Token vypršal"

```bash
# Znovu overiť
az logout
az login

azd auth logout
azd auth login

# Overiť autentifikáciu
az account show
```

### ❌ "Prostriedok už existuje" alebo kolízie názvov

```bash
# AZD generuje jedinečné mená, ale ak nastane konflikt:
azd down --force --purge

# Potom skúste znova s novým prostredím
azd env new dev-v2
azd up
```

### ❌ Nasadenie šablóny trvá príliš dlho

**Obvyklé časy čakania:**
- Jednoduchá webová aplikácia: 5-10 minút
- Aplikácia s databázou: 10-15 minút
- AI aplikácie: 15-25 minút (provízia OpenAI je pomalá)

```bash
# Skontrolujte priebeh
azd show

# Ak ste zaseknutí >30 minút, skontrolujte Azure portál:
azd monitor
# Vyhľadajte neúspešné nasadenia
```

### ❌ "Prístup zamietnutý" alebo "Zakázané"

```bash
# Skontrolujte svoju Azure rolu
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebujete aspoň rolu "Prispievateľ"
# Požiadajte svojho Azure správcu o udelenie:
# - Prispievateľ (pre zdroje)
# - Správca prístupu používateľov (pre priradenia rolí)
```

### ❌ Nemožno nájsť URL nasadenej aplikácie

```bash
# Zobraziť všetky koncové body služby
azd show

# Alebo otvorte Azure Portál
azd monitor

# Skontrolovať konkrétnu službu
azd env get-values
# Hľadať premenné *_URL
```

### 📚 Kompletné zdroje riešenia problémov

- **Sprievodca bežnými problémami:** [Podrobné riešenia](docs/troubleshooting/common-issues.md)
- **Problémy špecifické pre AI:** [Riešenie problémov AI](docs/troubleshooting/ai-troubleshooting.md)
- **Sprievodca ladením:** [Postupné ladenie](docs/troubleshooting/debugging.md)
- **Pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

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
<summary><strong>❌ "Nedostatok kvóty" alebo "Kvóta prekročená"</strong></summary>

```bash
# Vyskúšajte inú oblasť Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Alebo použite menšie SKU počas vývoja
# Upravte infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" zlyháva v polovici</strong></summary>

```bash
# Možnosť 1: Vyčistiť a skúsiť znova
azd down --force --purge
azd up

# Možnosť 2: Len opraviť infraštruktúru
azd provision

# Možnosť 3: Skontrolovať podrobné záznamy
azd show
azd logs
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
<summary><strong>❌ "Prostriedok už existuje" alebo kolízie názvov</strong></summary>

```bash
# AZD generuje jedinečné mená, ale ak nastane konflikt:
azd down --force --purge

# Potom skúste znova s novým prostredím
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Nasadenie šablóny trvá príliš dlho</strong></summary>

**Obvyklé časy čakania:**
- Jednoduchá webová aplikácia: 5-10 minút
- Aplikácia s databázou: 10-15 minút
- AI aplikácie: 15-25 minút (provízia OpenAI je pomalá)

```bash
# Skontrolujte priebeh
azd show

# Ak ste zaseknutí viac ako 30 minút, skontrolujte Azure Portal:
azd monitor
# Hľadajte neúspešné nasadenia
```
</details>

<details>
<summary><strong>❌ "Prístup zamietnutý" alebo "Zakázané"</strong></summary>

```bash
# Skontrolujte svoju rolu v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebujete aspoň rolu "Prispievateľ"
# Požiadajte správcu Azure, aby vám udelil:
# - Prispievateľ (pre zdroje)
# - Správca prístupu používateľa (pre priradenia rolí)
```
</details>

<details>
<summary><strong>❌ Nemožno nájsť URL nasadenej aplikácie</strong></summary>

```bash
# Zobraziť všetky koncové body služby
azd show

# Alebo otvorte Azure Portal
azd monitor

# Skontrolujte konkrétnu službu
azd env get-values
# Hľadajte premenné *_URL
```
</details>

### 📚 Kompletné zdroje riešenia problémov

- **Sprievodca bežnými problémami:** [Podrobné riešenia](docs/troubleshooting/common-issues.md)
- **Problémy špecifické pre AI:** [Riešenie problémov AI](docs/troubleshooting/ai-troubleshooting.md)
- **Sprievodca ladením:** [Postupné ladenie](docs/troubleshooting/debugging.md)
- **Pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Ukončenie kurzu a certifikácia

### Sledovanie pokroku
Sledujte svoj pokrok v učení v každej kapitole:

- [ ] **Kapitola 1**: Základy a rýchly štart ✅
- [ ] **Kapitola 2**: Vývoj s AI na prvom mieste ✅  
- [ ] **Kapitola 3**: Konfigurácia a overovanie ✅
- [ ] **Kapitola 4**: Infrastruktúra ako kód a nasadenie ✅
- [ ] **Kapitola 5**: Multi-agentné AI riešenia ✅
- [ ] **Kapitola 6**: Prednasadenová validácia a plánovanie ✅
- [ ] **Kapitola 7**: Riešenie problémov a ladenie ✅
- [ ] **Kapitola 8**: Produkčné a firemné vzory ✅

### Overenie vedomostí
Po dokončení každej kapitoly overte svoje znalosti tým, že:
1. **Praktické cvičenie**: Dokončíte praktické nasadenie kapitoly
2. **Kontrola vedomostí**: Prezriete si sekciu FAQ danej kapitoly
3. **Diskusia v komunite**: Podeľte sa o skúsenosti v Azure Discord
4. **Ďalšia kapitola**: Prejdete na ďalšiu úroveň náročnosti

### Výhody ukončenia kurzu
Po úspešnom dokončení všetkých kapitol získate:
- **Produkčné skúsenosti**: Nasadili ste reálne AI aplikácie do Azure
- **Profesionálne zručnosti**: Schopnosť nasadzovať riešenia pripravené pre podnikové prostredie  
- **Uznanie v komunite**: Aktívny člen Azure developerskej komunity
- **Kariérny posun**: Žiadané znalosti v AZD a AI nasadení

---

## 🤝 Komunita a podpora

### Získajte pomoc a podporu
- **Technické problémy**: [Hlásiť chyby a požadovať funkcie](https://github.com/microsoft/azd-for-beginners/issues)
- **Otázky k učeniu**: [Microsoft Azure Discord komunita](https://discord.gg/microsoft-azure) a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc špecifická pre AI**: Pridajte sa k [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentácia**: [Oficiálna dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Postrehy komunity z Microsoft Foundry Discord

**Posledné výsledky ankety z #Azure kanála:**
- **45%** vývojárov chce používať AZD pre AI pracovné záťaže
- **Hlavné výzvy**: Nasadenie viacerých služieb, správa prístupových údajov, pripravenosť na produkciu  
- **Najčastejšie požadované**: AI-špecifické šablóny, sprievodcovia riešením problémov, osvedčené postupy

**Pridajte sa k našej komunite, aby ste:**
- Zdieľali svoje skúsenosti s AZD + AI a získali pomoc
- Mali prístup k skorým ukážkam nových AI šablón
- Prispievali k osvedčeným postupom nasadenia AI
- Ovplyvňovali budúci vývoj funkcií AI + AZD

### Príspevky do kurzu
Vítame príspevky! Prečítajte si náš [Sprievodca príspevkami](CONTRIBUTING.md) s informáciami o:
- **Zlepšovaní obsahu**: Vylepšenie existujúcich kapitol a príkladov
- **Nových príkladoch**: Pridanie reálnych scenárov a šablón  
- **Preklade**: Pomoc pri udržiavaní viacerých jazykových verzií
- **Hlásení chýb**: Zlepšenie presnosti a jasnosti
- **Komunitných štandardoch**: Dodržiavanie našich inkluzívnych pravidiel

---

## 📄 Informácie o kurze

### Licencia
Tento projekt je licencovaný pod licenciou MIT - pozrite si [LICENSE](../../LICENSE) súbor pre podrobnosti.

### Súvisiace Microsoft vzdelávacie zdroje

Náš tím vytvára ďalšie komplexné vzdelávacie kurzy:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j pre začiatočníkov](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js pre začiatočníkov](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agenti
[![AZD pre začiatočníkov](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI pre začiatočníkov](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP pre začiatočníkov](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agenti pre začiatočníkov](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Séria Generatívnej AI
[![Generatívna AI pre začiatočníkov](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatívna AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatívna AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatívna AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Základné učenie
[![ML pre začiatočníkov](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science pre začiatočníkov](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---

### Séria Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigácia kurzom

**🚀 Pripravení začať sa učiť?**

**Začiatočníci**: Začnite s [Kapitola 1: Základy a rýchly štart](../..)  
**Vývojári AI**: Preskočte na [Kapitola 2: Vývoj orientovaný na AI](../..)  
**Skúsení vývojári**: Začnite s [Kapitola 3: Konfigurácia a autentifikácia](../..)

**Ďalšie kroky**: [Začať kapitolu 1 - Základy AZD](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:
Tento dokument bol preložený pomocou služby AI prekladateľa [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, uveďte, prosím, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nepochopenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->