<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "05c30c9e5ed7951c72855108c6788034",
  "translation_date": "2025-12-25T07:29:51+00:00",
  "source_file": "README.md",
  "language_code": "sk"
}
-->
# AZD pre začiatočníkov: Štruktúrovaná učebná cesta

![AZD pre začiatočníkov](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.sk.png) 

[![GitHub sledovatelia](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forky](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub hviezdy](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Začíname s týmto kurzom

Postupujte podľa týchto krokov, aby ste začali svoju AZD učebnú cestu:

1. **Vytvorte fork repozitára**: Kliknite [![GitHub forky](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonovať repozitár**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Pripojte sa ku komunite**: [Komunity Azure Discord](https://discord.com/invite/ByRwuEEgH4) pre odbornú podporu
4. **Vyberte svoju učebnú cestu**: Vyberte kapitolu nižšie, ktorá zodpovedá vašej úrovni skúseností

### Podpora viacerých jazykov

#### Automatizované preklady (vždy aktuálne)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabčina](../ar/README.md) | [Bengálčina](../bn/README.md) | [Bulharčina](../bg/README.md) | [Barmský (Myanmar)](../my/README.md) | [Čínština (zjednodušená)](../zh/README.md) | [Čínština (tradičná, Hongkong)](../hk/README.md) | [Čínština (tradičná, Macau)](../mo/README.md) | [Čínština (tradičná, Taiwan)](../tw/README.md) | [Chorvátčina](../hr/README.md) | [Čeština](../cs/README.md) | [Dánčina](../da/README.md) | [Holandčina](../nl/README.md) | [Estónčina](../et/README.md) | [Finština](../fi/README.md) | [Francúzština](../fr/README.md) | [Nemčina](../de/README.md) | [Gréčtina](../el/README.md) | [Hebrejčina](../he/README.md) | [Hindčina](../hi/README.md) | [Maďarčina](../hu/README.md) | [Indonézčina](../id/README.md) | [Taliančina](../it/README.md) | [Japončina](../ja/README.md) | [Kannadčina](../kn/README.md) | [Kórejčina](../ko/README.md) | [Litovčina](../lt/README.md) | [Malajčina](../ms/README.md) | [Malayalam](../ml/README.md) | [Maráthčina](../mr/README.md) | [Nepálčina](../ne/README.md) | [Nigerijský pidžin](../pcm/README.md) | [Nórština](../no/README.md) | [Perzština (fársí)](../fa/README.md) | [Poľština](../pl/README.md) | [Portugalčina (Brazília)](../br/README.md) | [Portugalčina (Portugalsko)](../pt/README.md) | [Pandžábčina (Gurmukhi)](../pa/README.md) | [Rumunčina](../ro/README.md) | [Ruština](../ru/README.md) | [Srbčina (cyrilika)](../sr/README.md) | [Slovenčina](./README.md) | [Slovinčina](../sl/README.md) | [Španielčina](../es/README.md) | [Svahilčina](../sw/README.md) | [Švédčina](../sv/README.md) | [Tagalog (filipínčina)](../tl/README.md) | [Tamilčina](../ta/README.md) | [Telugčina](../te/README.md) | [Thajčina](../th/README.md) | [Turečtina](../tr/README.md) | [Ukrajinčina](../uk/README.md) | [Urdčina](../ur/README.md) | [Vietnamčina](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Prehľad kurzu

Ovládnite Azure Developer CLI (azd) cez štruktúrované kapitoly navrhnuté pre postupné učenie. **Špeciálny dôraz na nasadenie AI aplikácií s integráciou Microsoft Foundry.**

### Prečo je tento kurz nevyhnutný pre moderných vývojárov

Na základe poznatkov z komunity Microsoft Foundry na Discourde, **45% vývojárov chce používať AZD pre AI pracovné zaťaženia**, ale stretáva sa s výzvami pri:
- Komplexných viac-službových AI architektúrach
- Najlepších postupoch pre produkčné nasadenie AI  
- Integrácii a konfigurácii Azure AI služieb
- Optimalizácii nákladov pre AI pracovné zaťaženia
- Riešení špecifických problémov pri nasadzovaní AI

### Ciele učenia

Dokončením tohto štruktúrovaného kurzu budete:
- **Ovládnite základy AZD**: Základné koncepty, inštalácia a konfigurácia
- **Nasadiť AI aplikácie**: Použiť AZD s Microsoft Foundry službami
- **Implementovať infraštruktúru ako kód**: Spravovať Azure zdroje pomocou Bicep šablón
- **Riešiť nasadenia**: Odstraňovať bežné problémy a debugovať chyby
- **Optimalizovať pre produkciu**: Bezpečnosť, škálovanie, monitorovanie a správa nákladov
- **Vytvárať riešenia s viacerými agentmi**: Nasadiť komplexné AI architektúry

## 📚 Učebné kapitoly

*Vyberte si svoju študijnú cestu podľa úrovne skúseností a cieľov*

### 🚀 Kapitola 1: Základy a rýchly štart
**Predpoklady**: predplatné Azure, základné znalosti príkazového riadka  
**Trvanie**: 30-45 minút  
**Zložitosť**: ⭐

#### Čo sa naučíte
- Porozumenie základom Azure Developer CLI
- Inštalácia AZD na vašej platforme
- Vaše prvé úspešné nasadenie

#### Učebné zdroje
- **🎯 Začnite tu**: [Čo je Azure Developer CLI?](../..)
- **📖 Teória**: [Základy AZD](docs/getting-started/azd-basics.md) - Základné koncepty a terminológia
- **⚙️ Nastavenie**: [Inštalácia a nastavenie](docs/getting-started/installation.md) - Návody špecifické pre platformu
- **🛠️ Prakticky**: [Váš prvý projekt](docs/getting-started/first-project.md) - Krok za krokom návod
- **📋 Rýchla referencia**: [Prehľad príkazov](resources/cheat-sheet.md)

#### Praktické cvičenia
```bash
# Rýchla kontrola inštalácie
azd version

# Nasadiť svoju prvú aplikáciu
azd init --template todo-nodejs-mongo
azd up
```

**💡 Výsledok kapitoly**: Úspešné nasadenie jednoduchej webovej aplikácie do Azure pomocou AZD

**✅ Overenie úspechu:**
```bash
# Po dokončení kapitoly 1 by ste mali byť schopní:
azd version              # Zobrazuje nainštalovanú verziu
azd init --template todo-nodejs-mongo  # Inicializuje projekt
azd up                  # Nasadzuje do Azure
azd show                # Zobrazuje URL bežiacej aplikácie
# Aplikácia sa otvorí v prehliadači a funguje
azd down --force --purge  # Vyčistí zdroje
```

**📊 Časová investícia:** 30-45 minút  
**📈 Úroveň zručností po:** Dokáže nezávisle nasadzovať základné aplikácie

**✅ Overenie úspechu:**
```bash
# Po dokončení kapitoly 1 by ste mali byť schopní:
azd version              # Zobrazuje nainštalovanú verziu
azd init --template todo-nodejs-mongo  # Inicializuje projekt
azd up                  # Nasadzuje do Azure
azd show                # Zobrazuje URL bežiacej aplikácie
# Aplikácia sa otvorí v prehliadači a funguje
azd down --force --purge  # Vyčistí zdroje
```

**📊 Časová investícia:** 30-45 minút  
**📈 Úroveň zručností po:** Dokáže nezávisle nasadzovať základné aplikácie

---

### 🤖 Kapitola 2: Vývoj orientovaný na AI (odporúčané pre AI vývojárov)
**Predpoklady**: Kapitola 1 dokončená  
**Trvanie**: 1-2 hodiny  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Integrácia Microsoft Foundry s AZD
- Nasadzovanie aplikácií poháňaných AI
- Porozumenie konfiguráciám AI služieb

#### Učebné zdroje
- **🎯 Začnite tu**: [Integrácia Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Vzory**: [Nasadenie AI modelu](docs/microsoft-foundry/ai-model-deployment.md) - Nasadiť a spravovať AI modely
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Pripravte svoje AI riešenia pre AZD
- **🎥 Interaktívny sprievodca**: [Materiály workshopu](workshop/README.md) - Výuka v prehliadači pomocou MkDocs * DevContainer Environment
- **📋 Šablóny**: [Microsoft Foundry Templates](../..)
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

**💡 Výsledok kapitoly**: Nasadiť a nakonfigurovať chatovaciu aplikáciu poháňanú AI s RAG schopnosťami

**✅ Overenie úspechu:**
```bash
# Po kapitole 2 by ste mali byť schopní:
azd init --template azure-search-openai-demo
azd up
# Otestovať chatovacie rozhranie AI
# Klásť otázky a získavať odpovede generované umelou inteligenciou vrátane zdrojov
# Overiť, že integrácia vyhľadávania funguje
azd monitor  # Skontrolovať, či Application Insights zobrazuje telemetriu
azd down --force --purge
```

**📊 Časová investícia:** 1-2 hodiny  
**📈 Úroveň zručností po:** Dokáže nasadiť a nakonfigurovať produkčné AI aplikácie  
**💰 Povedomie o nákladoch:** Pochopiť výdavky na vývoj $80-150/mesiac, produkčné náklady $300-3500/mesiac

#### 💰 Úvahy o nákladoch pre nasadenia AI

**Vývojové prostredie (odhad $80-150/mesiac):**
- Azure OpenAI (platené podľa použitia): $0-50/mesiac (na základe použitia tokenov)
- AI Search (základná úroveň): $75/mesiac
- Container Apps (Consumption): $0-20/mesiac
- Storage (Standard): $1-5/mesiac

**Produkčné prostredie (odhad $300-3,500+/mesiac):**
- Azure OpenAI (PTU pre konzistentný výkon): $3,000+/mesiac ALEBO platené podľa použitia pri vysokom objeme
- AI Search (štandardná úroveň): $250/mesiac
- Container Apps (dedikované): $50-100/mesiac
- Application Insights: $5-50/mesiac
- Storage (Premium): $10-50/mesiac

**💡 Tipy na optimalizáciu nákladov:**
- Použite **bezplatnú úroveň** Azure OpenAI na učenie (zahrnutých 50 000 tokenov/mesiac)
- Spustite `azd down` na deallokáciu zdrojov, keď práve aktívne nevyvíjate
- Začnite s fakturáciou založenou na spotrebe, na PTU prejdite len v produkcii
- Použite `azd provision --preview` na odhad nákladov pred nasadením
- Zapnite auto-scaling: plaťte len za skutočné používanie

**Monitorovanie nákladov:**
```bash
# Skontrolujte odhadované mesačné náklady
azd provision --preview

# Sledujte skutočné náklady v portáli Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitola 3: Konfigurácia a autentifikácia
**Predpoklady**: Kapitola 1 dokončená  
**Trvanie**: 45-60 minút  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Konfigurácia a správa prostredí
- Autentifikácia a najlepšie bezpečnostné postupy
- Názvoslovie a organizácia zdrojov

#### Učebné zdroje
- **📖 Konfigurácia**: [Sprievodca konfiguráciou](docs/getting-started/configuration.md) - Nastavenie prostredia
- **🔐 Bezpečnosť**: [Vzory autentifikácie a spravovaná identita](docs/getting-started/authsecurity.md) - Vzory autentifikácie
- **📝 Príklady**: [Príklad databázovej aplikácie](examples/database-app/README.md) - AZD databázové príklady

#### Praktické cvičenia
- Nakonfigurujte viacero prostredí (dev, staging, prod)
- Nastavte autentifikáciu pomocou spravovanej identity
- Implementujte konfigurácie špecifické pre prostredie

**💡 Výsledok kapitoly**: Spravovať viacero prostredí s riadnou autentifikáciou a zabezpečením

---

### 🏗️ Kapitola 4: Infraštruktúra ako kód a nasadenie
**Predpoklady**: Kapitoly 1-3 dokončené  
**Trvanie**: 1-1.5 hodiny  
**Zložitosť**: ⭐⭐⭐

#### Čo sa naučíte
- Pokročilé vzory nasadzovania
- Infraštruktúra ako kód s Bicep
- Stratégie provisioningu zdrojov

#### Učebné zdroje
- **📖 Nasadenie**: [Sprievodca nasadením](docs/deployment/deployment-guide.md) - Kompletné pracovné postupy
- **🏗️ Provisioning**: [Provisioning Resources](docs/deployment/provisioning.md) - Správa Azure zdrojov
- **📝 Príklady**: [Container App Example](../../examples/container-app) - Nasadenia kontajnerov

#### Praktické cvičenia
- Vytvorte vlastné Bicep šablóny
- Nasadte viac-službové aplikácie
- Implementujte blue-green deployment stratégie

**💡 Výsledok kapitoly**: Nasadiť komplexné viac-službové aplikácie pomocou vlastných infraštruktúrnych šablón

---

### 🎯 Kapitola 5: Riešenia AI s viacerými agentmi (pokročilé)
**Predpoklady**: Kapitoly 1-2 dokončené  
**Trvanie**: 2-3 hodiny  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Vzory architektúry s viacerými agentmi
- Orchestrace a koordinácia agentov
- Produkčné nasadenia AI pripravené do ostrého prevádzky

#### Učebné zdroje
- **🤖 Odporúčaný projekt**: [Viacagentové riešenie pre maloobchod](examples/retail-scenario.md) - Kompletná implementácia
- **🛠️ ARM šablóny**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Nasadenie jedným kliknutím
- **📖 Architektúra**: [Vzory koordinácie multi-agentov](/docs/pre-deployment/coordination-patterns.md) - Vzory

#### Praktické cvičenia
```bash
# Nasadiť kompletné maloobchodné viacagentné riešenie
cd examples/retail-multiagent-arm-template
./deploy.sh

# Preskúmať konfigurácie agentov
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Výsledok kapitoly**: Nasadiť a spravovať produkčné multi-agentné AI riešenie s agentmi zákazníka a inventára

---

### 🔍 Kapitola 6: Overenie a plánovanie pred nasadením
**Predpoklady**: Dokončená kapitola 4  
**Dĺžka**: 1 hodina  
**Komplexnosť**: ⭐⭐

#### Čo sa naučíte
- Plánovanie kapacity a overenie zdrojov
- Stratégie výberu SKU
- Prednasadzovacie kontroly a automatizácia

#### Výučbové zdroje
- **📊 Plánovanie**: [Plánovanie kapacity](docs/pre-deployment/capacity-planning.md) - Overenie zdrojov
- **💰 Výber**: [Výber SKU](docs/pre-deployment/sku-selection.md) - Nákladovo efektívne možnosti
- **✅ Overenie**: [Prednasadzovacie kontroly](docs/pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktické cvičenia
- Spustiť skripty na overenie kapacity
- Optimalizovať výbery SKU z hľadiska nákladov
- Implementovať automatizované prednasadzovacie kontroly

**💡 Výsledok kapitoly**: Overiť a optimalizovať nasadenia pred ich vykonaním

---

### 🚨 Kapitola 7: Riešenie problémov a ladenie
**Predpoklady**: Dokončená akákoľvek kapitola o nasadení  
**Dĺžka**: 1–1,5 hodiny  
**Komplexnosť**: ⭐⭐

#### Čo sa naučíte
- Systematické prístupy k ladeniu
- Bežné problémy a riešenia
- Riešenie problémov špecifických pre AI

#### Výučbové zdroje
- **🔧 Bežné problémy**: [Bežné problémy](docs/troubleshooting/common-issues.md) - FAQ a riešenia
- **🕵️ Ladenie**: [Príručka ladenia](docs/troubleshooting/debugging.md) - Postupy krok za krokom
- **🤖 Problémy AI**: [Riešenie problémov špecifických pre AI](docs/troubleshooting/ai-troubleshooting.md) - Problémy služieb AI

#### Praktické cvičenia
- Diagnostikovať zlyhania nasadenia
- Riešiť problémy s autentifikáciou
- Ladiť konektivitu služieb AI

**💡 Výsledok kapitoly**: Samostatne diagnostikovať a riešiť bežné problémy pri nasadení

---

### 🏢 Kapitola 8: Produkčné a podnikové vzory
**Predpoklady**: Dokončené kapitoly 1–4  
**Dĺžka**: 2–3 hodiny  
**Komplexnosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Stratégie produkčného nasadenia
- Podnikové bezpečnostné vzory
- Monitorovanie a optimalizácia nákladov

#### Výučbové zdroje
- **🏭 Produkcia**: [Najlepšie postupy pre produkčné AI](docs/microsoft-foundry/production-ai-practices.md) - Podnikové vzory
- **📝 Príklady**: [Príklad mikroslužieb](../../examples/microservices) - Zložité architektúry
- **📊 Monitorovanie**: [Integrácia Application Insights](docs/pre-deployment/application-insights.md) - Monitorovanie

#### Praktické cvičenia
- Implementovať podnikové bezpečnostné vzory
- Nastaviť komplexné monitorovanie
- Nasadiť do produkcie s náležitou správou

**💡 Výsledok kapitoly**: Nasadiť aplikácie pripravené pre podnikové prostredie s plnými produkčnými schopnosťami

---

## 🎓 Prehľad workshopu: Praktická skúsenosť s učením

> **⚠️ STAV WORKSHOPU: Prebieha vývoj**  
> Materiály workshopu sa momentálne vyvíjajú a dolaďujú. Základné moduly fungujú, ale niektoré pokročilé časti sú neúplné. Aktívne pracujeme na dokončení celého obsahu. [Sledovať priebeh →](workshop/README.md)

### Interaktívne materiály workshopu
**Komplexné praktické učenie s nástrojmi v prehliadači a vedenými cvičeniami**

Naše materiály workshopu poskytujú štruktúrovaný, interaktívny zážitok z učenia, ktorý dopĺňa vyššie uvedený kapitolový kurz. Workshop je navrhnutý pre samostatné tempo aj vedené relácie inštruktora.

#### 🛠️ Funkcie workshopu
- **Rozhranie v prehliadači**: Kompletný workshop poháňaný MkDocs s vyhľadávaním, kopírovaním a témami
- **Integrácia s GitHub Codespaces**: Nastavenie vývojového prostredia jedným kliknutím
- **Štruktúrovaná cesta učenia**: 7-krokové vedené cvičenia (celkovo 3,5 hodiny)
- **Objavovanie → Nasadenie → Prispôsobenie**: Progresívna metodika
- **Interaktívne DevContainer prostredie**: Predkonfigurované nástroje a závislosti

#### 📚 Štruktúra workshopu
Workshop nasleduje metodiku **Objavovanie → Nasadenie → Prispôsobenie**:

1. **Fáza objavovania** (45 min)
   - Preskúmať šablóny a služby Microsoft Foundry
   - Pochopiť vzory architektúry multi-agentov
   - Preskúmať požiadavky na nasadenie a predpoklady

2. **Fáza nasadenia** (2 hodiny)
   - Praktické nasadenie AI aplikácií s AZD
   - Nakonfigurovať služby Azure AI a koncové body
   - Implementovať bezpečnostné a autentifikačné vzory

3. **Fáza prispôsobenia** (45 min)
   - Upraviť aplikácie pre konkrétne prípady použitia
   - Optimalizovať pre produkčné nasadenie
   - Implementovať monitorovanie a riadenie nákladov

#### 🚀 Začíname s workshopom
```bash
# Možnosť 1: GitHub Codespaces (odporúčané)
# Kliknite na "Code" → "Create codespace on main" v repozitári

# Možnosť 2: Lokálny vývoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postupujte podľa pokynov na nastavenie v súbore workshop/README.md
```

#### 🎯 Ciele učenia workshopu
Po absolvovaní workshopu účastníci:
- **Nasadiť produkčné AI aplikácie**: Použiť AZD so službami Microsoft Foundry
- **Ovládnuť architektúry multi-agentov**: Implementovať koordinované riešenia AI agentov
- **Implementovať najlepšie bezpečnostné postupy**: Nakonfigurovať autentifikáciu a riadenie prístupu
- **Optimalizovať pre škálovanie**: Navrhnúť nákladovo efektívne, výkonné nasadenia
- **Riešiť problémy pri nasadení**: Samostatne riešiť bežné problémy

#### 📖 Zdroje workshopu
- **🎥 Interaktívny sprievodca**: [Materiály workshopu](workshop/README.md) - Prostredie učenia v prehliadači
- **📋 Pokyny krok za krokom**: [Vedené cvičenia](../../workshop/docs/instructions) - Podrobné návody
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Cvičenia zamerané na AI
- **💡 Rýchly štart**: [Sprievodca nastavením workshopu](workshop/README.md#quick-start) - Konfigurácia prostredia

**Ideálne pre**: Firemné školenia, univerzitné kurzy, samostatné štúdium, a bootcampy pre vývojárov.

---

## 📖 Čo je Azure Developer CLI?

Azure Developer CLI (azd) je príkazové rozhranie zamerané na vývojára, ktoré urýchľuje proces tvorby a nasadzovania aplikácií do Azure. Poskytuje:

- **Nasadenia založené na šablónach** - Použite predpripravené šablóny pre bežné vzory aplikácií
- **Infrastruktúra ako kód** - Spravovať zdroje Azure pomocou Bicep alebo Terraform  
- **Integrované pracovné postupy** - Bezproblémovo zriaďovať, nasadzovať a monitorovať aplikácie
- **Priateľské k vývojárom** - Optimalizované pre produktivitu a skúsenosť vývojára

### **AZD + Microsoft Foundry: Perfektné pre nasadenia AI**

**Prečo AZD pre AI riešenia?** AZD rieši hlavné výzvy, ktorým čelia vývojári AI:

- **Šablóny pripravené na AI** - Predkonfigurované šablóny pre Azure OpenAI, Cognitive Services a ML pracovné záťaže
- **Bezpečné nasadenia AI** - Vstavané bezpečnostné vzory pre služby AI, API kľúče a koncové body modelov  
- **Produkčné AI vzory** - Najlepšie postupy pre škálovateľné a nákladovo efektívne nasadenia AI aplikácií
- **End-to-End AI pracovné postupy** - Od vývoja modelu po produkčné nasadenie s riadnym monitorovaním
- **Optimalizácia nákladov** - Inteligentné prideľovanie zdrojov a stratégie škálovania pre AI záťaže
- **Integrácia s Microsoft Foundry** - Plynulé prepojenie na katalóg modelov a koncové body Microsoft Foundry

---

## 🎯 Knižnica šablón a príkladov

### Vybrané: Šablóny Microsoft Foundry
**Začnite tu, ak nasadzujete AI aplikácie!**

> **Poznámka:** Tieto šablóny ukazujú rôzne AI vzory. Niektoré sú externé Azure Samples, iné sú lokálne implementácie.

| Šablóna | Kapitola | Zložitosť | Služby | Typ |
|----------|---------|------------|----------|------|
| [**Začnite s AI chatom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externé |
| [**Začnite s AI agentmi**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitola 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externé |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externé |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externé |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externé |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externé |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokálne** |

### Vybrané: Kompletné učebné scenáre
**Šablóny aplikácií pripravené na produkciu mapované na učebné kapitoly**

| Šablóna | Učebná kapitola | Zložitosť | Kľúčové poznatky |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | Základné vzory nasadzovania AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | Implementácia RAG s Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitola 4 | ⭐⭐ | Integrácia Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | Framework agentov a volanie funkcií |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐ | Orchestrace AI v podnikovej sfére |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | Architektúra multi-agentov so zákazníckym a inventárnym agentom |

### Učenie podľa typu príkladu

> **📌 Lokálne vs. externé príklady:**  
> **Lokálne príklady** (v tomto repozitári) = Ihneď pripravené na použitie  
> **Externé príklady** (Azure Samples) = Klonovať z prepojených repozitárov

#### Lokálne príklady (pripravené na použitie)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kompletná implementácia pripravená na produkciu s ARM šablónami
  - Architektúra multi-agentov (agenti zákazníka + inventára)
  - Komplexné monitorovanie a hodnotenie
  - Jednoklikové nasadenie cez ARM šablónu

#### Lokálne príklady - Kontajnerové aplikácie (kapitoly 2–5)
**Komplexné príklady nasadenia kontajnerov v tomto repozitári:**
- [**Container App Examples**](examples/container-app/README.md) - Kompletný sprievodca nasadeniami kontajnerov
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Základné REST API s scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Produkčné nasadenie viacslužbovej architektúry
  - Rýchly štart, produkcia a pokročilé vzory nasadenia
  - Návody na monitorovanie, bezpečnosť a optimalizáciu nákladov

#### Externé príklady - Jednoduché aplikácie (kapitoly 1–2)
**Klonujte tieto repozitáre Azure Samples pre začiatok:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Základné vzory nasadenia
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Nasadenie statického obsahu
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Nasadenie REST API

#### Externé príklady - Integrácia databázy (kapitoly 3–4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzory pripojenia na databázu
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless dátový pracovný tok

#### Externé príklady - Pokročilé vzory (kapitoly 4–8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Viacslužbové architektúry
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Spracovanie na pozadí  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkčné ML vzory

### Externé zbierky šablón
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kurátorská zbierka oficiálnych a komunitných šablón
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentácia šablón Microsoft Learn
- [**Examples Directory**](examples/README.md) - Lokálne učebné príklady s podrobnými vysvetleniami

---

## 📚 Zdroje učenia a odkazy

### Rýchle odkazy
- [**Rýchla príručka príkazov**](resources/cheat-sheet.md) - Základné azd príkazy usporiadané podľa kapitol
- [**Slovník**](resources/glossary.md) - Terminológia Azure a azd  
- [**FAQ**](resources/faq.md) - Bežné otázky usporiadané podľa kapitol
- [**Study Guide**](resources/study-guide.md) - Komplexné praktické cvičenia

### Praktické workshopy
- [**Laboratórium AI Workshopu**](docs/microsoft-foundry/ai-workshop-lab.md) - Umožnite nasadenie vašich AI riešení pomocou AZD (2-3 hours)
- [**Interaktívny sprievodca workshopom**](workshop/README.md) - Workshop založený na prehliadači s MkDocs a prostredím DevContainer
- [**Štruktúrovaná učebná cesta**](../../workshop/docs/instructions) -7-step guided exercises (Discovery → Deployment → Customization)
- [**Workshop AZD pre začiatočníkov**](workshop/README.md) - Kompletné praktické materiály k workshopu s integráciou GitHub Codespaces

### Externé učebné zdroje
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Rýchly sprievodca riešením problémov

**Bežné problémy, s ktorými sa stretávajú začiatočníci, a okamžité riešenia:**

### ❌ "azd: command not found"

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

### ❌ "No subscription found" or "Subscription not set"

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

### ❌ "InsufficientQuota" or "Quota exceeded"

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

### ❌ "azd up" fails halfway through

```bash
# Možnosť 1: Vyčistiť a skúsiť znova
azd down --force --purge
azd up

# Možnosť 2: Len opraviť infraštruktúru
azd provision

# Možnosť 3: Skontrolovať podrobné protokoly
azd show
azd logs
```

### ❌ "Authentication failed" or "Token expired"

```bash
# Znovu overiť
az logout
az login

azd auth logout
azd auth login

# Overiť autentifikáciu
az account show
```

### ❌ "Resource already exists" or naming conflicts

```bash
# AZD generuje jedinečné názvy, ale ak dôjde ku konfliktu:
azd down --force --purge

# Potom opakujte s novým prostredím
azd env new dev-v2
azd up
```

### ❌ Template deployment taking too long

**Bežné časy čakania:**
- Jednoduchá webová aplikácia: 5-10 minutes
- Aplikácia s databázou: 10-15 minutes
- AI aplikácie: 15-25 minutes (OpenAI provisioning is slow)

```bash
# Skontrolujte priebeh
azd show

# Ak ste zaseknutí viac než 30 minút, skontrolujte portál Azure:
azd monitor
# Hľadajte zlyhané nasadenia
```

### ❌ "Permission denied" or "Forbidden"

```bash
# Skontrolujte svoju rolu v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebujete aspoň rolu "Contributor"
# Požiadajte svojho Azure administrátora, aby udelil:
# - Contributor (pre zdroje)
# - User Access Administrator (pre priradenia rolí)
```

### ❌ Can't find deployed application URL

```bash
# Zobraziť všetky koncové body služieb
azd show

# Alebo otvoriť Azure Portal
azd monitor

# Skontrolovať konkrétnu službu
azd env get-values
# Hľadať premenné *_URL
```

### 📚 Úplné zdroje na riešenie problémov

- **Príručka bežných problémov:** [Podrobné riešenia](docs/troubleshooting/common-issues.md)
- **Problémy špecifické pre AI:** [Riešenie problémov AI](docs/troubleshooting/ai-troubleshooting.md)
- **Príručka ladenia:** [Ladenie krok za krokom](docs/troubleshooting/debugging.md)
- **Získajte pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Rýchly sprievodca riešením problémov

**Bežné problémy, s ktorými sa stretávajú začiatočníci, a okamžité riešenia:**

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

# Možnosť 3: Skontrolovať podrobné záznamy
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Znovu autentifikovať
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
# AZD generuje unikátne názvy, ale ak nastane konflikt:
azd down --force --purge

# Potom to skúsi znova s novým prostredím
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Bežné časy čakania:**
- Jednoduchá webová aplikácia: 5–10 minút
- Aplikácia s databázou: 10–15 minút
- AI aplikácie: 15–25 minút (pridelenie OpenAI je pomalé)

```bash
# Skontrolujte priebeh
azd show

# Ak ste zaseknutí viac ako 30 minút, skontrolujte Azure portál:
azd monitor
# Skontrolujte neúspešné nasadenia
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Skontrolujte svoju rolu v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebujete aspoň "Contributor" rolu
# Požiadajte svojho Azure administrátora, aby udelil:
# - Contributor (pre zdroje)
# - User Access Administrator (pre priraďovanie rolí)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Zobraziť všetky koncové body služieb
azd show

# Alebo otvoriť Azure portál
azd monitor

# Skontrolovať konkrétnu službu
azd env get-values
# Vyhľadať premenné *_URL
```
</details>

### 📚 Úplné zdroje na riešenie problémov

- **Príručka bežných problémov:** [Podrobné riešenia](docs/troubleshooting/common-issues.md)
- **Problémy špecifické pre AI:** [Riešenie problémov AI](docs/troubleshooting/ai-troubleshooting.md)
- **Príručka ladenia:** [Ladenie krok za krokom](docs/troubleshooting/debugging.md)
- **Získajte pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Dokončenie kurzu a certifikácia

### Sledovanie pokroku
Sledujte svoj pokrok v každej kapitole:

- [ ] **Chapter 1**: Základy & Rýchly štart ✅
- [ ] **Chapter 2**: Vývoj orientovaný na AI ✅  
- [ ] **Chapter 3**: Konfigurácia & Overovanie ✅
- [ ] **Chapter 4**: Infrastruktúra ako kód & Nasadenie ✅
- [ ] **Chapter 5**: Viacagentové AI riešenia ✅
- [ ] **Chapter 6**: Prednasadzovacia validácia & Plánovanie ✅
- [ ] **Chapter 7**: Riešenie problémov & Ladenie ✅
- [ ] **Chapter 8**: Produkčné & Podnikové vzory ✅

### Overenie znalostí
Po dokončení každej kapitoly overte svoje znalosti pomocou:
1. **Praktické cvičenie**: Dokončite praktické nasadenie z kapitoly
2. **Kontrola znalostí**: Prejdite sekciu FAQ pre vašu kapitolu
3. **Diskusia v komunite**: Zdieľajte svoje skúsenosti na Azure Discord
4. **Ďalšia kapitola**: Prejdite na ďalšiu úroveň zložitosti

### Výhody dokončenia kurzu
Po dokončení všetkých kapitol získate:
- **Skúsenosti z produkcie**: Nasadené reálne AI aplikácie do Azure
- **Odborné zručnosti**: Schopnosti nasadzovania pripravené pre podnikové prostredie  
- **Uznanie v komunite**: Aktívny člen komunity Azure vývojárov
- **Kariérny postup**: Žiadané odborné znalosti v AZD a nasadzovaní AI

---

## 🤝 Komunita a podpora

### Získajte pomoc a podporu
- **Technické problémy**: [Nahláste chyby a požiadajte o funkcie](https://github.com/microsoft/azd-for-beginners/issues)
- **Otázky k učeniu**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc špecifická pre AI**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentácia**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Postrehy komunity z Microsoft Foundry Discord

**Nedávne výsledky ankety z kanála #Azure:**
- **45 %** vývojárov chce používať AZD pre AI pracovné zaťaženia
- **Hlavné výzvy**: nasadenia viacerých služieb, správa prihlasovacích údajov, pripravenosť do produkcie  
- **Najčastejšie žiadané**: šablóny špecifické pre AI, návody na riešenie problémov, osvedčené postupy

**Pridajte sa do našej komunity a:**
- Zdieľajte svoje AZD + AI skúsenosti a získajte pomoc
- Získajte prístup k skorým verziám nových AI šablón
- Prispievajte k osvedčeným postupom pri nasadzovaní AI
- Ovplyvnite budúci vývoj funkcií AI + AZD

### Prispievanie do kurzu
Vítame príspevky! Prečítajte si náš [Sprievodca prispievaním](CONTRIBUTING.md) pre podrobnosti o:
- **Zlepšenia obsahu**: Vylepšite existujúce kapitoly a príklady
- **Nové príklady**: Pridajte scenáre a šablóny z reálneho sveta  
- **Preklady**: Pomôžte udržiavať podporu viacerých jazykov
- **Hlásenia chýb**: Zlepšite presnosť a jasnosť
- **Pravidlá komunity**: Dodržiavajte naše inkluzívne komunitné smernice

---

## 📄 Informácie o kurze

### Licencia
Tento projekt je licencovaný pod licenciou MIT - pozrite si súbor [LICENSE](../../LICENSE) pre podrobnosti.

### Súvisiace vzdelávacie zdroje Microsoftu

Náš tím vytvára ďalšie komplexné učebné kurzy:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j pre začiatočníkov](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js pre začiatočníkov](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agents
[![AZD pre začiatočníkov](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI pre začiatočníkov](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP pre začiatočníkov](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agenti pre začiatočníkov](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Séria Generatívne AI
[![Generatívne AI pre začiatočníkov](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatívne AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatívne AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatívne AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Základné vzdelávanie
[![Strojové učenie pre začiatočníkov](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Dátová veda pre začiatočníkov](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI pre začiatočníkov](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kyberbezpečnosť pre začiatočníkov](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Vývoj webu pre začiatočníkov](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pre začiatočníkov](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Vývoj XR pre začiatočníkov](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Séria Copilot
[![Copilot pre párované programovanie s AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pre C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot dobrodružstvo](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigácia kurzu

**🚀 Ste pripravení začať sa učiť?**

**Začiatočníci**: Začnite s [Kapitola 1: Základy & Rýchly štart](../..)  
**AI vývojári**: Prejdite na [Kapitola 2: Vývoj orientovaný na AI](../..)  
**Skúsení vývojári**: Začnite s [Kapitola 3: Konfigurácia & Overovanie](../..)

**Ďalšie kroky**: [Začnite kapitolu 1 - Základy AZD](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vyhlásenie o vylúčení zodpovednosti:
Tento dokument bol preložený pomocou AI prekladovej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa usilujeme o presnosť, majte prosím na pamäti, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho originálnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie odporúčame profesionálny ľudský preklad. Za akékoľvek nedorozumenia alebo nesprávne výklady vyplývajúce z použitia tohto prekladu nepreberáme zodpovednosť.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->