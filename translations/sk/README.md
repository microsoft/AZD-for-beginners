<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-18T09:53:50+00:00",
  "source_file": "README.md",
  "language_code": "sk"
}
-->
# AZD pre začiatočníkov: Štruktúrovaná cesta učenia

![AZD-pre-začiatočníkov](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.sk.png) 

## Začíname s týmto kurzom

Postupujte podľa týchto krokov, aby ste začali svoju cestu učenia AZD:

1. **Forknite repozitár**: Kliknite [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonujte repozitár**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Pripojte sa ku komunite**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) pre odbornú podporu
4. **Vyberte si svoju cestu učenia**: Vyberte kapitolu nižšie, ktorá zodpovedá vašej úrovni skúseností

### Podpora viacerých jazykov

#### Automatické preklady (vždy aktuálne)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](./README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## Prehľad kurzu

Ovládnite Azure Developer CLI (azd) prostredníctvom štruktúrovaných kapitol navrhnutých pre postupné učenie. **Špeciálny dôraz na nasadenie AI aplikácií s integráciou Azure AI Foundry.**

### Prečo je tento kurz nevyhnutný pre moderných vývojárov

Na základe poznatkov z komunity Azure AI Foundry Discord, **45 % vývojárov chce používať AZD pre AI pracovné zaťaženie**, ale stretávajú sa s výzvami ako:
- Zložité AI architektúry s viacerými službami
- Najlepšie postupy pre nasadenie AI do produkcie  
- Integrácia a konfigurácia služieb Azure AI
- Optimalizácia nákladov na AI pracovné zaťaženie
- Riešenie problémov špecifických pre nasadenie AI

### Ciele učenia

Po absolvovaní tohto štruktúrovaného kurzu budete:
- **Ovládať základy AZD**: Základné koncepty, inštalácia a konfigurácia
- **Nasadzovať AI aplikácie**: Používať AZD so službami Azure AI Foundry
- **Implementovať infraštruktúru ako kód**: Spravovať Azure zdroje pomocou Bicep šablón
- **Riešiť problémy pri nasadení**: Odstraňovať bežné problémy a ladiť chyby
- **Optimalizovať pre produkciu**: Bezpečnosť, škálovanie, monitorovanie a správu nákladov
- **Budovať riešenia s viacerými agentmi**: Nasadzovať komplexné AI architektúry

## 📚 Kapitoly učenia

*Vyberte si svoju cestu učenia na základe úrovne skúseností a cieľov*

### 🚀 Kapitola 1: Základy & Rýchly štart
**Predpoklady**: Azure predplatné, základné znalosti príkazového riadku  
**Trvanie**: 30-45 minút  
**Náročnosť**: ⭐

#### Čo sa naučíte
- Porozumenie základom Azure Developer CLI
- Inštalácia AZD na vašej platforme
- Vaše prvé úspešné nasadenie

#### Zdroje učenia
- **🎯 Začnite tu**: [Čo je Azure Developer CLI?](../..)
- **📖 Teória**: [Základy AZD](docs/getting-started/azd-basics.md) - Základné koncepty a terminológia
- **⚙️ Nastavenie**: [Inštalácia & Nastavenie](docs/getting-started/installation.md) - Platformovo špecifické návody
- **🛠️ Praktické cvičenie**: [Váš prvý projekt](docs/getting-started/first-project.md) - Krok za krokom
- **📋 Rýchly odkaz**: [Cheat Sheet príkazov](resources/cheat-sheet.md)

#### Praktické cvičenia
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Výsledok kapitoly**: Úspešne nasadiť jednoduchú webovú aplikáciu na Azure pomocou AZD

---

### 🤖 Kapitola 2: Vývoj zameraný na AI (Odporúčané pre AI vývojárov)
**Predpoklady**: Kapitola 1 dokončená  
**Trvanie**: 1-2 hodiny  
**Náročnosť**: ⭐⭐

#### Čo sa naučíte
- Integrácia Azure AI Foundry s AZD
- Nasadzovanie aplikácií poháňaných AI
- Porozumenie konfiguráciám AI služieb

#### Zdroje učenia
- **🎯 Začnite tu**: [Integrácia Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Vzory**: [Nasadenie AI modelov](docs/ai-foundry/ai-model-deployment.md) - Správa AI modelov
- **🛠️ Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Príprava AI riešení na AZD
- **📋 Šablóny**: [Šablóny Azure AI Foundry](../..)

#### Praktické cvičenia
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Výsledok kapitoly**: Nasadiť a nakonfigurovať AI aplikáciu s RAG schopnosťami

---

### ⚙️ Kapitola 3: Konfigurácia & Autentifikácia
**Predpoklady**: Kapitola 1 dokončená  
**Trvanie**: 45-60 minút  
**Náročnosť**: ⭐⭐

#### Čo sa naučíte
- Správa konfigurácie prostredí
- Najlepšie postupy pre autentifikáciu a bezpečnosť
- Názvoslovie a organizácia zdrojov

#### Zdroje učenia
- **📖 Konfigurácia**: [Príručka konfigurácie](docs/getting-started/configuration.md) - Nastavenie prostredí
- **🔐 Bezpečnosť**: Vzory autentifikácie a spravovanej identity
- **📝 Príklady**: [Príklad aplikácie s databázou](../../examples/database-app) - Vzory konfigurácie

#### Praktické cvičenia
- Konfigurácia viacerých prostredí (dev, staging, prod)
- Nastavenie autentifikácie spravovanej identity
- Implementácia konfigurácií špecifických pre prostredie

**💡 Výsledok kapitoly**: Správa viacerých prostredí s vhodnou autentifikáciou a bezpečnosťou

---

### 🏗️ Kapitola 4: Infraštruktúra ako kód & Nasadenie
**Predpoklady**: Kapitoly 1-3 dokončené  
**Trvanie**: 1-1.5 hodiny  
**Náročnosť**: ⭐⭐⭐

#### Čo sa naučíte
- Pokročilé vzory nasadenia
- Infraštruktúra ako kód s Bicep
- Stratégie správy zdrojov

#### Zdroje učenia
- **📖 Nasadenie**: [Príručka nasadenia](docs/deployment/deployment-guide.md) - Kompletné pracovné postupy
- **🏗️ Správa zdrojov**: [Správa zdrojov](docs/deployment/provisioning.md) - Správa Azure zdrojov
- **📝 Príklady**: [Príklad aplikácie s kontajnerom](../../examples/container-app) - Nasadenie kontajnerov

#### Praktické cvičenia
- Vytvorenie vlastných Bicep šablón
- Nasadenie aplikácií s viacerými službami
- Implementácia stratégií nasadenia blue-green

**💡 Výsledok kapitoly**: Nasadiť komplexné aplikácie s viacerými službami pomocou vlastných šablón infraštruktúry

---

### 🎯 Kapitola 5: Riešenia s viacerými agentmi AI (Pokročilé)
**Predpoklady**: Kapitoly 1-2 dokončené  
**Trvanie**: 2-3 hodiny  
**Náročnosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Vzory architektúry s viacerými agentmi
- Orchestrácia a koordinácia agentov
- Nasadenie AI pripravené na produkciu

#### Zdroje učenia
- **🤖 Odporúčaný projekt**: [Riešenie pre maloobchod s viacerými agentmi](examples/retail-scenario.md) - Kompletná implementácia
- **🛠️ ARM šablóny**: [Balík ARM šablón](../../examples/retail-multiagent-arm-template) - Jednoduché nasadenie
- **📖 Architektúra**: Vzory koordinácie viacerých agentov

#### Praktické cvičenia
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Výsledok kapitoly**: Nasadiť a spravovať produkčné riešenie AI s viacerými agentmi, vrátane zákazníckych a inventárnych agentov

---

### 🔍 Kapitola 6: Validácia & Plánovanie pred nasadením
**Predpoklady**: Kapitola 4 dokončená  
**Trvanie**: 1 hodina  
**Náročnosť**: ⭐⭐

#### Čo sa naučíte
- Plánovanie kapacity a validácia zdrojov
- Stratégie výberu SKU
- Predletové kontroly a automatizácia

#### Zdroje učenia
- **📊 Plánovanie**: [Plánovanie kapacity](docs/pre-deployment/capacity-planning.md) - Validácia zdrojov
- **💰 Výber**: [Výber SKU](docs/pre-deployment/sku-selection.md) - Nákladovo efektívne voľby
- **✅ Validácia**: [Predletové kontroly](docs/pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktické cvičenia
- Spustenie skriptov na validáciu kapacity
- Optimalizácia výberu SKU pre náklady
- Implementácia automatizovaných predletových kontrol

**💡 Výsledok kapitoly**: Validovať a optimalizovať nasadenia pred ich vykonaním

---

### 🚨 Kapitola 7: Riešenie problémov & Ladenie
**Predpoklady**: Akákoľvek kapitola o nasadení dokončená  
**Trvanie**: 1-1.5 hodiny  
**Náročnosť**: ⭐⭐

#### Čo sa naučíte
- Systematické prístupy k ladeniu
- Bežné problémy a ich riešenia
- Riešenie problémov špecifických pre AI

#### Zdroje učenia
- **🔧 Bežné problémy**: [Bežné problémy](docs/troubleshooting/common-issues.md) - FAQ a riešenia
- **🕵️ Ladenie**: [Príručka ladenia](docs/troubleshooting/debugging.md) - Krok za krokom
- **🤖 AI problémy**: [Riešenie problémov špecifických pre AI](docs/troubleshooting/ai-troubleshooting.md) - Problémy so službami AI

#### Praktické cvičenia
- Diagnostika zlyhaní nasadenia
- Riešenie problémov s autentifikáciou
- Ladenie konektivity AI služieb

**💡 Výsledok kapitoly**: Samostatne diagnostikovať a riešiť bežné problémy pri nasadení

---

### 🏢 Kapitola 8: Produkčné & Podnikové vzory
**Predpoklady**: Kapitoly 1-4 dokončené  
**Trvanie**: 2-3 hodiny  
**Náročnosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Stratégie nasadenia do produkcie
- Podnikové bezpečnostné vzory
- Monitorovanie a optimalizácia nákladov

#### Zdroje učenia
- **🏭 Produkcia**: [Najlepšie postupy pre produkčné AI](docs/ai-foundry/production-ai-practices.md) - Podnikové vzory
- **📝 Príklady**: [Príklad mikroservisov](../../examples/microservices) - Komplexné architektúry
- **📊 Monitorovanie**: Integrácia s Application Insights

#### Praktické cvičenia
- Implementujte bezpečnostné vzory pre podniky
- Nastavte komplexné monitorovanie
- Nasadzujte do produkcie s riadnou správou

**💡 Výsledok kapitoly**: Nasadzujte aplikácie pripravené pre podnikové prostredie s plnou produkčnou schopnosťou

---

## 📖 Čo je Azure Developer CLI?

Azure Developer CLI (azd) je príkazový riadok zameraný na vývojárov, ktorý urýchľuje proces vytvárania a nasadzovania aplikácií do Azure. Poskytuje:

- **Nasadzovanie na základe šablón** - Používajte predpripravené šablóny pre bežné aplikačné vzory
- **Infraštruktúra ako kód** - Spravujte zdroje Azure pomocou Bicep alebo Terraform  
- **Integrované pracovné postupy** - Plynulé zriaďovanie, nasadzovanie a monitorovanie aplikácií
- **Prívetivé pre vývojárov** - Optimalizované pre produktivitu a skúsenosti vývojárov

### **AZD + Azure AI Foundry: Ideálne pre nasadzovanie AI**

**Prečo AZD pre AI riešenia?** AZD rieši hlavné výzvy, ktorým čelia vývojári AI:

- **Šablóny pripravené na AI** - Predkonfigurované šablóny pre Azure OpenAI, Cognitive Services a ML pracovné záťaže
- **Bezpečné nasadzovanie AI** - Zabudované bezpečnostné vzory pre AI služby, API kľúče a modelové endpointy  
- **Produkčné vzory AI** - Najlepšie postupy pre škálovateľné a nákladovo efektívne nasadzovanie AI aplikácií
- **Kompletné pracovné postupy AI** - Od vývoja modelu po produkčné nasadenie s riadnym monitorovaním
- **Optimalizácia nákladov** - Inteligentné stratégie alokácie a škálovania zdrojov pre AI pracovné záťaže
- **Integrácia s Azure AI Foundry** - Plynulé prepojenie s katalógom modelov a endpointmi AI Foundry

---

## 🎯 Knižnica šablón a príkladov

### Odporúčané: Šablóny Azure AI Foundry
**Začnite tu, ak nasadzujete AI aplikácie!**

| Šablóna | Kapitola | Náročnosť | Služby |
|----------|---------|------------|----------|
| [**Začnite s AI chatom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Začnite s AI agentmi**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitola 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Automatizácia pracovných postupov s viacerými agentmi**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Generovanie dokumentov z vašich dát**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Zlepšite klientské stretnutia s agentmi**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Modernizujte svoj kód s agentmi**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Vytvorte svoj konverzačný agent**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Odomknite poznatky z konverzačných dát**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Spracovanie multimodálneho obsahu**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Odporúčané: Kompletné scenáre učenia
**Šablóny aplikácií pripravené na produkciu mapované na kapitoly učenia**

| Šablóna | Kapitola učenia | Náročnosť | Kľúčové učenie |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | Základné vzory nasadzovania AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | Implementácia RAG s Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitola 4 | ⭐⭐ | Integrácia inteligencie dokumentov |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | Rámec agentov a volanie funkcií |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐ | Orchestrácia AI pre podniky |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | Architektúra s viacerými agentmi pre zákazníkov a inventár |

### Učenie podľa typu príkladu

#### Jednoduché aplikácie (Kapitoly 1-2)
- [Jednoduchá webová aplikácia](../../examples/simple-web-app) - Základné vzory nasadzovania
- [Statická webová stránka](../../examples/static-site) - Nasadzovanie statického obsahu
- [Základné API](../../examples/basic-api) - Nasadzovanie REST API

#### Integrácia databázy (Kapitola 3-4)  
- [Aplikácia s databázou](../../examples/database-app) - Vzory pripojenia k databáze
- [Spracovanie dát](../../examples/data-processing) - Nasadzovanie ETL pracovných postupov

#### Pokročilé vzory (Kapitoly 4-8)
- [Aplikácie v kontajneroch](../../examples/container-app) - Nasadzovanie kontajnerizovaných aplikácií
- [Mikroslužby](../../examples/microservices) - Architektúry s viacerými službami  
- [Riešenia pre podniky](../../examples/enterprise) - Vzory pripravené na produkciu

### Externé kolekcie šablón
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - Oficiálne vzorky od Microsoftu
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Šablóny od komunity
- [**Adresár príkladov**](examples/README.md) - Lokálne príklady učenia s podrobnými vysvetleniami

---

## 📚 Zdroje učenia a referencie

### Rýchle referencie
- [**Prehľad príkazov**](resources/cheat-sheet.md) - Základné príkazy azd usporiadané podľa kapitol
- [**Slovník pojmov**](resources/glossary.md) - Terminológia Azure a azd  
- [**FAQ**](resources/faq.md) - Časté otázky usporiadané podľa kapitol učenia
- [**Študijný sprievodca**](resources/study-guide.md) - Komplexné praktické cvičenia

### Praktické workshopy
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Urobte svoje AI riešenia nasaditeľné pomocou AZD
- [**Workshop AZD pre začiatočníkov**](workshop/README.md) - Kompletné materiály pre praktický workshop

### Externé zdroje učenia
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrum architektúry Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulačka cien Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stav Azure](https://status.azure.com/)

---

## 🎓 Dokončenie kurzu a certifikácia

### Sledovanie pokroku
Sledujte svoj pokrok učenia cez jednotlivé kapitoly:

- [ ] **Kapitola 1**: Základy a rýchly štart ✅
- [ ] **Kapitola 2**: Vývoj zameraný na AI ✅  
- [ ] **Kapitola 3**: Konfigurácia a autentifikácia ✅
- [ ] **Kapitola 4**: Infraštruktúra ako kód a nasadzovanie ✅
- [ ] **Kapitola 5**: Riešenia AI s viacerými agentmi ✅
- [ ] **Kapitola 6**: Validácia a plánovanie pred nasadením ✅
- [ ] **Kapitola 7**: Riešenie problémov a ladenie ✅
- [ ] **Kapitola 8**: Produkčné a podnikové vzory ✅

### Overenie učenia
Po dokončení každej kapitoly overte svoje znalosti:
1. **Praktické cvičenie**: Dokončite praktické nasadenie kapitoly
2. **Kontrola znalostí**: Prejdite si sekciu FAQ pre svoju kapitolu
3. **Diskusia v komunite**: Podeľte sa o svoje skúsenosti na Azure Discord
4. **Ďalšia kapitola**: Prejdite na ďalšiu úroveň náročnosti

### Výhody dokončenia kurzu
Po dokončení všetkých kapitol získate:
- **Produkčné skúsenosti**: Nasadili ste reálne AI aplikácie do Azure
- **Profesionálne zručnosti**: Schopnosti nasadzovania pripravené pre podnikové prostredie  
- **Uznanie v komunite**: Aktívny člen komunity vývojárov Azure
- **Kariérny posun**: Požadované odborné znalosti v oblasti AZD a nasadzovania AI

---

## 🤝 Komunita a podpora

### Získajte pomoc a podporu
- **Technické problémy**: [Nahláste chyby a požiadajte o funkcie](https://github.com/microsoft/azd-for-beginners/issues)
- **Otázky učenia**: [Komunita Microsoft Azure Discord](https://discord.gg/microsoft-azure)
- **Pomoc špecifická pre AI**: Pripojte sa k [#Azure kanálu](https://discord.gg/microsoft-azure) pre diskusie o AZD + AI Foundry
- **Dokumentácia**: [Oficiálna dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Postrehy z komunity Azure AI Foundry Discord

**Nedávne výsledky ankety z kanála #Azure:**
- **45%** vývojárov chce používať AZD pre AI pracovné záťaže
- **Hlavné výzvy**: Nasadzovanie viacerých služieb, správa poverení, pripravenosť na produkciu  
- **Najviac požadované**: Šablóny špecifické pre AI, návody na riešenie problémov, najlepšie postupy

**Pripojte sa k našej komunite, aby ste:**
- Zdieľali svoje skúsenosti s AZD + AI a získali pomoc
- Mali prístup k skorým náhľadom nových AI šablón
- Prispievali k najlepším postupom nasadzovania AI
- Ovplyvňovali budúci vývoj funkcií AI + AZD

### Prispievanie do kurzu
Uvítame príspevky! Prečítajte si náš [Príručku prispievania](CONTRIBUTING.md) pre podrobnosti o:
- **Zlepšenie obsahu**: Vylepšite existujúce kapitoly a príklady
- **Nové príklady**: Pridajte scenáre z reálneho sveta a šablóny  
- **Preklad**: Pomôžte udržiavať podporu viacerých jazykov
- **Nahlásenie chýb**: Zlepšite presnosť a jasnosť
- **Štandardy komunity**: Dodržiavajte naše inkluzívne pokyny pre komunitu

---

## 📄 Informácie o kurze

### Licencia
Tento projekt je licencovaný pod licenciou MIT - podrobnosti nájdete v súbore [LICENSE](../../LICENSE).

### Súvisiace zdroje učenia od Microsoftu

Náš tím vytvára ďalšie komplexné kurzy učenia:

- [**NOVÉ** Model Context Protocol (MCP) pre začiatočníkov](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agents pre začiatočníkov](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generatívna AI pre začiatočníkov pomocou .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generatívna AI pre začiatočníkov](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generatívna AI pre začiatočníkov pomocou Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML pre začiatočníkov](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science pre začiatočníkov](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI pre začiatočníkov](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Kybernetická bezpečnosť pre začiatočníkov](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Webový vývoj pre začiatočníkov](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT pre začiatočníkov](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR vývoj pre začiatočníkov](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Ovládnutie GitHub Copilot pre AI párové programovanie](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Ovládnutie GitHub Copilot pre C#/.NET vývojárov](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Vyberte si vlastné dobrodružstvo s Copilotom](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ Navigácia kurzom

**🚀 Pripravení začať učiť sa?**

**Začiatočníci**: Začnite s [Kapitola 1: Základy a rýchly štart](../..)  
**AI vývojári**: Preskočte na [Kapitola 2: Vývoj zameraný na AI](../..)
**Skúsení vývojári**: Začnite s [Kapitola 3: Konfigurácia a autentifikácia](../..)

**Ďalšie kroky**: [Začnite Kapitolu 1 - Základy AZD](docs/getting-started/azd-basics.md) →

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.