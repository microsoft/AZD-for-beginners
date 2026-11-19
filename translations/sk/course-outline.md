# AZD pre začiatočníkov: Osnova kurzu a učebný rámec

## Prehľad kurzu

Ovládnite Azure Developer CLI (azd) prostredníctvom štruktúrovaných kapitol navrhnutých pre postupné učenie. **Špeciálny dôraz na nasadenie AI aplikácií s integráciou Microsoft Foundry.**

### Prečo je tento kurz nevyhnutný pre moderných vývojárov

Vývojári nasadzujúci AI záťaže často potrebujú usmernenie v týchto oblastiach:
- Zložité architektúry AI pozostávajúce z viacerých služieb
- Najlepšie postupy nasadenia AI do produkcie  
- Integrácia a konfigurácia Azure AI služieb
- Optimalizácia nákladov pre AI záťaže
- Riešenie problémov špecifických pre AI nasadenie

### Hlavné ciele učenia

Dokončením tohto štruktúrovaného kurzu budete:
- **Ovládať základy AZD**: Kľúčové koncepty, inštalácia a konfigurácia
- **Nasadzovať AI aplikácie**: Používať AZD spolu s Microsoft Foundry službami
- **Zaviesť Infrastructure as Code**: Spravovať Azure zdroje pomocou Bicep šablón
- **Riešiť problémy nasadenia**: Odstraňovať bežné problémy a debuggovať
- **Optimalizovať pre produkciu**: Bezpečnosť, škálovanie, monitorovanie a riadenie nákladov
- **Stavať multi-agentové riešenia**: Nasadzovať zložité AI architektúry

## 🎓 Workshop: Učebná skúsenosť

### Flexibilné možnosti vzdelávania
Tento kurz je navrhnutý na podporu **individuálneho samostatného učenia** aj **moderovaných workshopov**, umožňujúc študentom získať praktické skúsenosti s AZD cez interaktívne cvičenia.

#### 🚀 Samostatné učenie
**Ideálne pre jednotlivých vývojárov a kontinuálne vzdelávanie**

**Funkcie:**
- **Browserové rozhranie**: Kompletný workshop poháňaný MkDocs, prístupný cez akýkoľvek webový prehliadač
- **Integrácia GitHub Codespaces**: Vývojové prostredie na jedno kliknutie s predkonfigurovanými nástrojmi
- **Interaktívne prostredie DevContainer**: Žiadna lokálna inštalácia - okamžité začatie kódovania
- **Sledovanie pokroku**: Zabudované kontrolné body a validačné cvičenia
- **Podpora komunity**: Prístup k Azure Discord kanálom pre otázky a spoluprácu

**Štruktúra učenia:**
- **Flexibilný časový rámec**: Dokončite kapitoly vlastným tempom počas dní alebo týždňov
- **Systém kontrolných bodov**: Validujte vedomosti pred pokračovaním k zložitejším témam
- **Knižnica zdrojov**: Komplexná dokumentácia, príklady a návody na riešenie problémov
- **Vývoj portfólia**: Budujte nasaditeľné projekty pre profesionálne portfólio

**Začínajúci (samostatné učenie):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Moderované workshopy
**Ideálne pre firemné školenia, bootcampy a vzdelávacie inštitúcie**

**Formáty workshopov:**

**📚 Integrácia do akademických kurzov (8-12 týždňov)**
- **Univerzitné programy**: Semestrálny kurz s 2-hodinovými týždennými sedením
- **Bootcamp formát**: Intenzívny 3-5 denný program s dennými 6-8 hodinovými sedením
- **Firemné školenia**: Mesačné tímové sedenia s praktickou implementáciou projektov
- **Hodnotiaci rámec**: Zadania s hodnotením, hodnotenia rovesníkov a záverečné projekty

**🚀 Intenzívny workshop (1-3 dni)**
- **Deň 1**: Základy + AI vývoj (kapitoly 1-2) - 6 hodín
- **Deň 2**: Konfigurácia + infraštruktúra (kapitoly 3-4) - 6 hodín  
- **Deň 3**: Pokročilé vzory + produkcia (kapitoly 5-8) - 8 hodín
- **Následná podpora**: Voliteľné 2-týždňové mentorstvo na dokončenie projektu

**⚡ Výkonný briefing (4-6 hodín)**
- **Strategický prehľad**: Hodnota AZD a biznis dopad (1 hodina)
- **Praktická demo ukážka**: Kompletné nasadenie AI aplikácie (2 hodiny)
- **Prehľad architektúry**: Podnikové vzory a správa (1 hodina)
- **Plánovanie implementácie**: Stratégia adopcie v organizácii (1-2 hodiny)

#### 🛠️ Metodológia učenia na workshope
**Prístup objavu → nasadenia → prispôsobenia pre praktický rozvoj zručností**

**Fáza 1: Objav (45 minút)**
- **Prieskum šablón**: Hodnotenie Microsoft Foundry šablón a služieb
- **Analýza architektúry**: Pochopenie multi-agentových vzorov a nasadzovacích stratégií
- **Vyhodnotenie požiadaviek**: Identifikácia potrieb a obmedzení organizácie
- **Nastavenie prostredia**: Konfigurácia vývojového prostredia a Azure zdrojov

**Fáza 2: Nasadenie (2 hodiny)**
- **Riadená implementácia**: Krok za krokom nasadenie AI aplikácií s AZD
- **Konfigurácia služieb**: Nastavenie Azure AI služieb, endpointov a autentifikácie
- **Implementácia bezpečnosti**: Použitie podnikových bezpečnostných vzorov a prístupových kontrol
- **Testovanie validácie**: Overenie nasadenia a riešenie bežných problémov

**Fáza 3: Prispôsobenie (45 minút)**
- **Úprava aplikácie**: Prispôsobenie šablón pre špecifické prípady použitia a požiadavky
- **Optimalizácia pre produkciu**: Implementácia monitorovania, riadenia nákladov a škálovania
- **Pokročilé vzory**: Preskúmanie koordinácie multi-agentov a zložitých architektúr
- **Plánovanie ďalších krokov**: Definovanie učebnej cesty pre ďalší rozvoj zručností

#### 🎯 Výsledky učenia workshopu
**Merateľné zručnosti rozvinuté prostredníctvom praktického cvičenia**

**Technické kompetencie:**
- **Nasadenie produkčných AI aplikácií**: Úspešne nasadiť a nakonfigurovať AI riešenia
- **Ovládnutie Infrastructure as Code**: Vytvárať a spravovať vlastné Bicep šablóny
- **Multi-agentová architektúra**: Implementovať koordinované AI agentové riešenia
- **Pripravenosť na produkciu**: Aplikovať bezpečnostné, monitorovacie a správcovské vzory
- **Odbornosť v riešení problémov**: Samostatne riešiť problémy s nasadením a konfiguráciou

**Profesionálne zručnosti:**
- **Vedenie projektov**: Riadiť technické tímy pri cloudových nasadeniach
- **Návrh architektúry**: Navrhovať škálovateľné a nákladovo efektívne riešenia Azure
- **Prenos znalostí**: Školenia a mentorstvo kolegov v AZD najlepších praktikách
- **Strategické plánovanie**: Ovplyvňovať organizačné stratégie adopcie cloudu

#### 📋 Workshopové zdroje a materiály
**Komplexný balík pre lektorov a študentov**

**Pre lektorov:**
- **Sprievodca pre inštruktorov**: [Prehľad workshopu](workshop/README.md) - Plánovanie a vedenie sedení
- **Prezentačné materiály**: Prezentácie, diagramy architektúry a skripty demo ukážok
- **Hodnotiace nástroje**: Praktické cvičenia, kontrolné otázky a hodnotiace rubriky
- **Technická príprava**: Konfigurácia prostredia, návody na riešenie problémov a záložné plány

**Pre študentov:**
- **Interaktívne workshopové prostredie**: [Materiály workshopu](workshop/README.md) - Platforma na učenie v prehliadači
- **Podrobné inštrukcie**: [Sprievodné cvičenia](../../workshop/docs/instructions) - Detailné návody na implementáciu  
- **Referenčná dokumentácia**: [AI workshop laboratórium](docs/chapter-02-ai-development/ai-workshop-lab.md) - Hlbšie štúdium AI
- **Komunitné zdroje**: Azure Discord kanály, GitHub diskusie a odborná podpora

#### 🏢 Firemná implementácia workshopu
**Strategie nasadenia a školení v organizáciách**

**Firemné tréningové programy:**
- **Onboarding vývojárov**: Orientácia nových zamestnancov so základmi AZD (2-4 týždne)
- **Zvyšovanie kvalifikácie tímov**: Štvťročné workshopy pre existujúce vývojové tímy (1-2 dni)
- **Prehľad architektúry**: Mesačné sedenia pre senior inžinierov a architektov (4 hodiny)
- **Briefingy pre vedenie**: Workshopy pre technických rozhodovateľov (poldeň)

**Podpora implementácie:**
- **Navrhovanie na mieru**: Obsah prispôsobený špecifickým organizačným potrebám
- **Riadenie pilotných programov**: Štruktúrované zavádzanie so sledovaním úspechu a spätnou väzbou  
- **Pokračujúce mentorstvo**: Podpora po workshope pre implementáciu projektov
- **Budovanie komunity**: Interné Azure AI vývojárske komunity a zdieľanie znalostí

**Metriky úspechu:**
- **Získavanie zručností**: Pred a po hodnotenia merajúce rast technických kompetencií
- **Úspešnosť nasadenia**: Percento účastníkov úspešne nasadzujúcich produkčné aplikácie
- **Čas do produktivity**: Skrátený čas adaptácie na nové Azure AI projekty
- **Zachovanie vedomostí**: Nasledovné hodnotenia 3-6 mesiacov po workshope

## Osnova učebnej štruktúry v 8 kapitolách

### Kapitola 1: Základy a rýchly štart (30-45 minút) 🌱
**Požiadavky**: Azure predplatné, základné znalosti príkazového riadku  
**Náročnosť**: ⭐

#### Čo sa naučíte
- Pochopenie základov Azure Developer CLI
- Inštalácia AZD na vašej platforme  
- Prvé úspešné nasadenie
- Kľúčové koncepty a terminológia

#### Učebné zdroje
- [Základy AZD](docs/chapter-01-foundation/azd-basics.md) - Kľúčové koncepty
- [Inštalácia a nastavenie](docs/chapter-01-foundation/installation.md) - Platformovo špecifické návody
- [Váš prvý projekt](docs/chapter-01-foundation/first-project.md) - Praktický návod
- [Cheat sheet príkazov](resources/cheat-sheet.md) - Rýchla referencia

#### Praktický výsledok
Úspešne nasadiť jednoduchú webovú aplikáciu na Azure pomocou AZD

---

### Kapitola 2: Vývoj orientovaný na AI (4-5 hodín vrátane workshopu) 🤖
**Požiadavky**: Dokončená Kapitola 1  
**Náročnosť**: ⭐⭐

#### Čo sa naučíte
- Integrácia Microsoft Foundry s AZD
- Inštalácia GA `microsoft.foundry` balíka a nasadenie kódu hosted-agenta
- Testovanie lokálneho Agent Inspectora a separátne hodnotiace dátové sady/rubriky
- Nasadzovanie AI-poháňaných aplikácií
- Pochopenie AI služobnej konfigurácie
- Vzory RAG (Retrieval-Augmented Generation)

#### Učebné zdroje
- [Integrácia Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [Prechod Hosted-Agent (GA)](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) - Inicializácia, revízia `azure.yaml`, provision, lokálne testovanie, nasadenie, vyhodnotenie a čistenie
- [Sprievodca AI agentmi](docs/chapter-02-ai-development/agents.md)
- [Nasadenie AI modelu](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI workshop laboratórium](docs/chapter-02-ai-development/ai-workshop-lab.md) - **NOVÉ**: Komplexný 2-3 hodinový praktický lab
- [Interaktívny sprievodca workshopom](workshop/README.md) - **NOVÉ**: Workshop v prehliadači s MkDocs náhľadom
- [Microsoft Foundry šablóny](README.md#featured-microsoft-foundry-templates)
- [Inštrukcie workshopu](../../workshop/docs/instructions) - **NOVÉ**: Krok za krokom vedené cvičenia

#### Praktický výsledok
Otestovať hosted-agent lokálne a vo Foundry pomocou GA balíka, skontrolovať hodnotiaci výsledok a zvládnuť čistenie nových a znovupoužitých projektov. Separátny RAG/workshopový režim zahrňuje konfiguráciu AI-poháňanej chat aplikácie.

#### Workshopová učebná cesta (voliteľné rozšírenie)
**NOVÁ interaktívna skúsenosť**: [Kompletný sprievodca workshopom](workshop/README.md)
1. **Objavovanie** (30 min): Výber a hodnotenie šablón
2. **Nasadenie** (45 min): Nasadenie a validácia funkčnosti AI šablóny  
3. **Dekonštrukcia** (30 min): Pochopenie architektúry a komponentov šablóny
4. **Konfigurácia** (30 min): Prispôsobenie nastavení a parametrov
5. **Prispôsobenie** (45 min): Úpravy a iterácie na spravenie vlastným
6. **Ukliatie** (15 min): Čistenie zdrojov a pochopenie životného cyklu
7. **Záver** (15 min): Ďalšie kroky a pokročilé učebné cesty

---

### Kapitola 3: Konfigurácia a autentifikácia (45-60 minút) ⚙️
**Požiadavky**: Dokončená Kapitola 1  
**Náročnosť**: ⭐⭐

#### Čo sa naučíte
- Konfigurácia a správa prostredí
- Najlepšie postupy pre autentifikáciu a bezpečnosť
- Menovanie zdrojov a organizácia
- Nasadenia do viacerých prostredí

#### Učebné zdroje
- [Sprievodca konfiguráciou](docs/chapter-03-configuration/configuration.md) - Nastavenie prostredia
- [Vzory autentifikácie a bezpečnosti](docs/chapter-03-configuration/authsecurity.md) - Managed identity a integrácia Key Vault
- Príklady pre viacero prostredí

#### Praktický výsledok
Spravovať viacero prostredí s vhodnou autentifikáciou a bezpečnosťou

---

### Kapitola 4: Infrastructure as Code a nasadenie (1-1.5 hodiny) 🏗️
**Požiadavky**: Dokončené kapitoly 1-3  
**Náročnosť**: ⭐⭐⭐

#### Čo sa naučíte
- Pokročilé vzory nasadenia
- Infrastructure as Code s Bicep
- Stratégie provisioningu zdrojov
- Vytváranie vlastných šablón

- Nasadenie kontajnerizovaných aplikácií cez Azure Container Apps a AZD

#### Učebné zdroje
- [Sprievodca nasadením](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletné pracovné postupy
- [Provisioning zdrojov](docs/chapter-04-infrastructure/provisioning.md) - Správa zdrojov
- Príklady kontajnerov a mikroslužieb
- [Príklady Container App](examples/container-app/README.md) - Rýchly štart, produkcia a pokročilé vzory nasadenia

#### Praktický výsledok
Nasadiť zložité multi-službové aplikácie pomocou vlastných infraštruktúrnych šablón

---

### Kapitola 5: Multi-agentové AI riešenia (2-3 hodiny) 🤖🤖
**Požiadavky**: Dokončené kapitoly 1-2  
**Náročnosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Vzory multi-agentovej architektúry
- Orchestrácia a koordinácia agentov
- Produkčné AI nasadenia
- Implementácie Customer a Inventory agentov

- Integrácia kontajnerizovaných mikroslužieb ako súčasti agentových riešení

#### Učebné zdroje
- [Retail Multi-Agent Solution](examples/retail-scenario.md) - Architektonický plán, nie kompletná aplikácia
- [BALÍK ARM Template](../../examples/retail-multiagent-arm-template) - Infrastruktúrna kostra s požiadavkami na implementáciu
- Vzory koordinácie multi-agentov
- [Príklad architektúry mikroslužieb](../../examples/container-app/microservices) - Komunikácia služba-služba, asynchrónne správy a produkčné nasadenie

#### Praktický výsledok
Navrhnúť multi-agentové AI riešenie a identifikovať implementačnú, validačnú a prevádzkovú prácu mimo provisioningu infraštruktúry

---

### Kapitola 6: Validácia a plánovanie pred nasadením (1 hodina) 🔍
**Požiadavky**: Dokončená Kapitola 4  
**Náročnosť**: ⭐⭐

#### Čo sa naučíte
- Plánovanie kapacity a validácia zdrojov
- Stratégie výberu SKU
- Pred-nasadzovacie kontroly a automatizácia
- Plánovanie optimalizácie nákladov

#### Učebné zdroje
- [Plánovanie kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) - Validácia zdrojov
- [Výber SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Nákladovo efektívne možnosti
- [Predletové kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizované skripty
- [Integrácia Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorovanie a pozorovateľnosť
- [Vzory koordinácie viacerých agentov](docs/chapter-06-pre-deployment/coordination-patterns.md) - Stratégie orchestrácie agentov

#### Praktický výsledok
Overiť a optimalizovať nasadenia pred vykonaním

---

### Kapitola 7: Riešenie problémov a ladenie (1-1,5 hodiny) 🔧
**Predpoklady**: Dokončená akákoľvek kapitola o nasadení  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Systematické prístupy k ladeniu
- Bežné problémy a riešenia
- Riešenie problémov špecifických pre AI
- Optimalizácia výkonu

#### Zdroj učenia
- [Bežné problémy](docs/chapter-07-troubleshooting/common-issues.md) - FAQ a riešenia
- [Sprievodca ladením](docs/chapter-07-troubleshooting/debugging.md) - Krok za krokom stratégie
- [AI-špecifické riešenie problémov](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problémy služieb AI

#### Praktický výsledok
Nezávisle diagnostikovať a vyriešiť bežné problémy s nasadením

---

### Kapitola 8: Produkčné a podnikové vzory (2-3 hodiny) 🏢
**Predpoklady**: Dokončené kapitoly 1-4  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Produkčné stratégie nasadenia
- Podnikové bezpečnostné vzory
- Monitorovanie a optimalizácia nákladov
- Škálovateľnosť a správa

- Najlepšie postupy pre nasadenia kontajnerových aplikácií do produkcie (bezpečnosť, monitorovanie, náklady, CI/CD)

#### Zdroj učenia
- [Najlepšie praktiky produkčného AI](docs/chapter-08-production/production-ai-practices.md) - Podnikové vzory
- Príklady mikroslužieb a podnikového prostredia
- Rámce monitorovania a správy
- [Príklad architektúry mikroslužieb](../../examples/container-app/microservices) - Blue-green/canary nasadenie, distribuované sledovanie a optimalizácia nákladov

#### Praktický výsledok
Nasadiť aplikácie pripravené pre podnikové produkčné prostredie

---

## Postup učenia a zložitosť

### Postupné budovanie zručností

- **🌱 Začiatočníci**: Začnite Kapitolou 1 (Základy) → Kapitola 2 (Vývoj AI)
- **🔧 Stredne pokročilí**: Kapitoly 3-4 (Konfigurácia a infraštruktúra) → Kapitola 6 (Validácia)
- **🚀 Pokročilí**: Kapitola 5 (Multi-agentné riešenia) → Kapitola 7 (Riešenie problémov)
- **🏢 Podnikové**: Dokončiť všetky kapitoly, sústrediť sa na Kapitolu 8 (Produkčné vzory)

- **Cesta kontajnerovej aplikácie**: Kapitoly 4 (Nasadenie v kontajneroch), 5 (Integrácia mikroslužieb), 8 (Najlepšie produkčné praktiky)

### Indikátory zložitosti

- **⭐ Základná**: Jednoduché koncepty, vedené tutoriály, 30-60 minút
- **⭐⭐ Stredne pokročilá**: Viacero konceptov, praktické cvičenia, 1-2 hodiny  
- **⭐⭐⭐ Pokročilá**: Komplexné architektúry, vlastné riešenia, 1-3 hodiny
- **⭐⭐⭐⭐ Expert**: Produkčné systémy, podnikové vzory, 2-4 hodiny

### Flexibilné cesty učenia

#### 🎯 Rýchla cesta pre AI vývojára (4-6 hodín)
1. **Kapitola 1**: Základy a rýchly štart (45 minút)
2. **Kapitola 2**: Vývoj so zameraním na AI (2 hodiny)  
3. **Kapitola 5**: Multi-agentné AI riešenia (3 hodiny)
4. **Kapitola 8**: Produkčné najlepšie praktiky AI (1 hodina)

#### 🛠️ Cesta špecialistu infraštruktúry (5-7 hodín)
1. **Kapitola 1**: Základy a rýchly štart (45 minút)
2. **Kapitola 3**: Konfigurácia a autentifikácia (1 hodina)
3. **Kapitola 4**: Infraštruktúra ako kód a nasadenie (1,5 hodiny)
4. **Kapitola 6**: Prednasadacia validácia a plánovanie (1 hodina)
5. **Kapitola 7**: Riešenie problémov a ladenie (1,5 hodiny)
6. **Kapitola 8**: Produkčné a podnikové vzory (2 hodiny)

#### 🎓 Kompletná učebná cesta (8-12 hodín)
Sekvenčné dokončenie všetkých 8 kapitol s praktickými cvičeniami a validáciou

## Rámec dokončenia kurzu

### Overovanie znalostí
- **Kontrolné body kapitol**: Praktické cvičenia s merateľnými výsledkami
- **Praktická verifikácia**: Nasadenie funkčných riešení pre každú kapitolu
- **Sledovanie pokroku**: Vizualizácia a odznaky za dokončenie
- **Overenie komunitou**: Zdieľanie skúseností v kanáloch Azure Discord

### Hodnotenie dosiahnutých vedomostí

#### Dokončenie kapitol 1-2 (Základy + AI)
- ✅ Nasadiť základnú webovú aplikáciu pomocou AZD
- ✅ Nasadiť AI chatovaciu aplikáciu s RAG
- ✅ Rozumieť základným konceptom AZD a AI integrácii

#### Dokončenie kapitol 3-4 (Konfigurácia + Infraštruktúra)  
- ✅ Spravovať nasadenia v rôznych prostrediach
- ✅ Vytvoriť vlastné Bicep šablóny infraštruktúry
- ✅ Implementovať bezpečné autentifikačné vzory

#### Dokončenie kapitol 5-6 (Multi-agent + Validácia)
- ✅ Nasadiť komplexné multi-agentné AI riešenie
- ✅ Vykonať plánovanie kapacity a optimalizáciu nákladov
- ✅ Implementovať automatizovanú prednasadaciu validáciu

#### Dokončenie kapitol 7-8 (Riešenie problémov + Produkcia)
- ✅ Nezávisle debugovať a riešiť problémy s nasadením  
- ✅ Implementovať podnikové monitorovanie a bezpečnosť
- ✅ Nasadiť aplikácie pripravené pre produkčné prostredie so správou

### Certifikácia a uznanie
- **Odznak dokončenia kurzu**: Dokončiť všetky 8 kapitol s praktickou validáciou
- **Uznanie v komunite**: Aktívna účasť v Microsoft Foundry Discord
- **Odborný rozvoj**: Priemyselne relevantné zručnosti AZD a AI nasadenia
- **Kariérny postup**: Schopnosti nasadenia enterprise cloudových riešení

## 🎓 Komplexné výsledky učenia

### Úroveň základov (kapitoly 1-2)
Po dokončení základných kapitol budú študenti schopní:

**Technické schopnosti:**
- Nasadiť jednoduché webové aplikácie do Azure pomocou príkazov AZD
- Konfigurovať a nasadiť AI chatovacie aplikácie s RAG funkciami
- Rozumieť základným konceptom AZD: šablóny, prostredia, pracovné toky provisioning
- Integrovať služby Microsoft Foundry s nasadeniami AZD
- Navigovať konfigurácie Azure AI služieb a API endpointy

**Profesionálne schopnosti:**
- Dodržiavať štruktúrované pracovné toky nasadenia pre konzistentné výsledky
- Riešiť základné problémy nasadenia pomocou logov a dokumentácie
- Efektívne komunikovať o procesoch nasadenia v cloude
- Aplikovať najlepšie bezpečnostné postupy integrácie AI služieb

**Overenie učenia:**
- ✅ Úspešne nasadiť šablónu `todo-nodejs-mongo`
- ✅ Nasadiť a nakonfigurovať `azure-search-openai-demo` s RAG
- ✅ Dokončiť interaktívne cvičenia workshopu (obdobie objavovania)
- ✅ Zúčastniť sa diskusií v Azure Discord komunite

### Stredne pokročilá úroveň (kapitoly 3-4)
Po dokončení stredne pokročilých kapitol budú študenti schopní:

**Technické schopnosti:**
- Spravovať nasadenia v viacerých prostrediach (vývoj, staging, produkcia)
- Vytvoriť vlastné Bicep šablóny pre infraštruktúru ako kód
- Implementovať bezpečné autentifikačné vzory pomocou spravovanej identity
- Nasadiť komplexné viacslužbové aplikácie s vlastnými konfiguráciami
- Optimalizovať stratégie provisioning zdrojov pre náklady a výkon

**Profesionálne schopnosti:**
- Navrhovať škálovateľné architektúry infraštruktúry
- Implementovať bezpečnostné najlepšie praktiky pre cloudové nasadenia
- Dokumentovať vzory infraštruktúry pre tímovú spoluprácu
- Vyhodnocovať a vyberať vhodné Azure služby podľa požiadaviek

**Overenie učenia:**
- ✅ Nakonfigurovať oddelené prostredia s nastaveniami špecifickými pre prostredie
- ✅ Vytvoriť a nasadiť vlastnú Bicep šablónu pre viacslužbovú aplikáciu
- ✅ Implementovať autentifikáciu pomocou spravovanej identity pre bezpečný prístup
- ✅ Dokončiť cvičenia správy konfigurácie s reálnymi scenármi

### Pokročilá úroveň (kapitoly 5-6)
Po dokončení pokročilých kapitol budú študenti schopní:

**Technické schopnosti:**
- Nasadiť a orchestrácie multi-agentné AI riešenia s koordinovanými pracovnými tokmi
- Implementovať architektúry agentov zákazníka a inventára pre maloobchodné scenáre
- Vykonať komplexné plánovanie kapacity a overovanie zdrojov
- Realizovať automatizovanú prednasadaciu validáciu a optimalizáciu
- Navrhnúť nákladovo efektívny výber SKU na základe požiadaviek pracovnej záťaže

**Profesionálne schopnosti:**
- Navrhovať komplexné AI riešenia pre produkčné prostredia
- Viesť technické diskusie o stratégiách nasadenia AI
- Mentorovať mladších vývojárov v najlepších postupoch AZD a AI nasadenia
- Hodnotiť a odporúčať vzory AI architektúry podľa obchodných požiadaviek

**Overenie učenia:**
- ✅ Preskúmať maloobchodný multi-agentný plán a rozlíšiť nasadenú infraštruktúru od chýbajúcej implementácie aplikácie
- ✅ Demonštrovať koordináciu agentov a orchestráciu pracovných tokov
- ✅ Dokončiť cvičenia plánovania kapacity pri reálnych zdrojových obmedzeniach
- ✅ Overiť pripravenosť nasadenia automatizovanými predletovými kontrolami

### Odborná úroveň (kapitoly 7-8)
Po dokončení odborných kapitol budú študenti schopní:

**Technické schopnosti:**
- Diagnostikovať a nezávisle vyriešiť komplexné problémy s nasadením
- Implementovať podnikové bezpečnostné vzory a rámce správy
- Navrhovať komplexné stratégie monitorovania a upozorňovania
- Optimalizovať produkčné nasadenia pre škálovanie, náklady a výkon
- Zriadiť CI/CD pipeline s riadnym testovaním a validáciou

**Profesionálne schopnosti:**
- Viesť iniciatívy na transformáciu podnikového cloudu
- Navrhovať a implementovať organizačné štandardy nasadenia
- Školiť a mentorovať vývojárske tímy v pokročilých praktikách AZD
- Ovplyvňovať technické rozhodnutia pre podnikové AI nasadenia

**Overenie učenia:**
- ✅ Riešiť zložité chyby pri viacslužbovom nasadení
- ✅ Implementovať podnikové bezpečnostné vzory s požiadavkami na súlad
- ✅ Navrhnúť a nasadiť produkčné monitorovanie pomocou Application Insights
- ✅ Dokončiť implementáciu podnikových rámcov správy

## 🎯 Certifikácia dokončenia kurzu

### Rámec sledovania pokroku
Sledujte svoj pokrok učenia prostredníctvom štruktúrovaných kontrolných bodov:

- [ ] **Kapitola 1**: Základy a rýchly štart ✅
- [ ] **Kapitola 2**: Vývoj so zameraním na AI ✅  
- [ ] **Kapitola 3**: Konfigurácia a autentifikácia ✅
- [ ] **Kapitola 4**: Infraštruktúra ako kód a nasadenie ✅
- [ ] **Kapitola 5**: Multi-agentné AI riešenia ✅
- [ ] **Kapitola 6**: Prednasadacia validácia a plánovanie ✅
- [ ] **Kapitola 7**: Riešenie problémov a ladenie ✅
- [ ] **Kapitola 8**: Produkčné a podnikové vzory ✅

### Overovací proces
Po dokončení každej kapitoly overte svoje vedomosti prostredníctvom:

1. **Dokončenie praktického cvičenia**: Nasadiť funkčné riešenia pre každú kapitolu
2. **Hodnotenie znalostí**: Prezrieť FAQ sekcie a dokončiť seba hodnotenia
3. **Zapojenie komunity**: Zdieľať skúsenosti a získavať spätnú väzbu v Azure Discord
4. **Vývoj portfólia**: Dokumentovať nasadenia a získané lekcie
5. **Recenzia rovesníkov**: Spolupracovať s inými študentmi na komplexných scenároch

### Výhody dokončenia kurzu
Po dokončení všetkých kapitol s verifikáciou budú absolventi mať:

**Technické znalosti:**
- **Produkčné skúsenosti**: Nasadené skutočné AI aplikácie do Azure prostredí
- **Profesionálne zručnosti**: Schopnosti nasadenia a riešenia problémov pripravené pre podnik
- **Architektonické znalosti**: Multi-agentné AI riešenia a komplexné infraštruktúrne vzory
- **Majstrovstvo riešenia problémov**: Nezávislé riešenie problémov nasadenia a konfigurácie

**Profesionálny rozvoj:**
- **Uznanie v priemysle**: Overiteľné zručnosti vo vysoko žiadaných oblastiach AZD a AI nasadenia
- **Kariérny postup**: Kvalifikácie pre pozície cloud architekta a špecialistu AI nasadenia
- **Vedenie komunity**: Aktívne členstvo v Azure vývojárskych a AI komunitách
- **Kontinuálne učenie**: Základ pre pokročilú špecializáciu Microsoft Foundry

**Portfólio aktív:**
- **Nasadené riešenia**: Funkčné príklady AI aplikácií a infraštruktúrnych vzorov
- **Dokumentácia**: Komplexné príručky nasadenia a postupy riešenia problémov  
- **Príspevky pre komunitu**: Diskusie, príklady a vylepšenia zdieľané s Azure komunitou
- **Profesijná sieť**: Spojenia s Azure odborníkmi a praktikmi AI nasadenia

### Cesta učenia po kurze
Absolventi sú pripravení na pokročilú špecializáciu v:
- **Microsoft Foundry Expert**: Hlboká špecializácia v nasadení a orchestrácii AI modelov
- **Vedúci cloud architektúry**: Návrh a správa nasadení v podnikovej mierke
- **Vedúci vývojárskej komunity**: Príspevky do Azure príkladov a komunitných zdrojov
- **Firemné školenia**: Výučba zručností AZD a AI nasadenia v organizáciách

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->