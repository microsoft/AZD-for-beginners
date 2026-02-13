# AZD pre začiatočníkov: Osnova kurzu a rámec učenia

## Prehľad kurzu

Ovládnite Azure Developer CLI (azd) prostredníctvom štruktúrovaných kapitol navrhnutých pre postupné učenie. **Špeciálny dôraz na nasadenie AI aplikácií s integráciou Microsoft Foundry.**

### Prečo je tento kurz nevyhnutný pre moderných vývojárov

Na základe poznatkov komunity Microsoft Foundry Discord, **45 % vývojárov chce používať AZD pre AI pracovné zaťaženia**, ale stretávajú sa s problémami:
- Zložité AI architektúry so službami viacerých úrovní
- Najlepšie postupy pre produkčné nasadenie AI  
- Integrácia a konfigurácia Azure AI služieb
- Optimalizácia nákladov na AI pracovné zaťaženia
- Riešenie problémov špecifických pre nasadenie AI

### Hlavné vzdelávacie ciele

Dokončením tohto štruktúrovaného kurzu dosiahnete:
- **Ovládnutie základov AZD**: Kľúčové koncepty, inštalácia a konfigurácia
- **Nasadenie AI aplikácií**: Použitie AZD so službami Microsoft Foundry
- **Implementáciu infraštruktúry ako kódu**: Správa Azure zdrojov pomocou Bicep šablón
- **Riešenie problémov nasadenia**: Odstránenie bežných problémov a ladenie
- **Optimalizáciu pre produkciu**: Bezpečnosť, škálovanie, monitoring a riadenie nákladov
- **Budovanie riešení s viac-agentmi**: Nasadenie zložitých AI architektúr

## 🎓 Workshop: Skúsenosti s učením

### Flexibilné možnosti poskytovania vzdelávania
Tento kurz je navrhnutý tak, aby podporoval **individuálne samoštúdium** aj **riadené workshopy**, ktoré umožňujú študentom získať praktické skúsenosti s AZD prostredníctvom interaktívnych cvičení.

#### 🚀 Režim samoštúdia
**Ideálny pre individuálnych vývojárov a kontinuálne učenie**

**Funkcie:**
- **Prehliadačové rozhranie**: Kompletný workshop poháňaný MkDocs prístupný z každého webového prehliadača
- **Integrácia GitHub Codespaces**: Vývojové prostredie na jedno kliknutie s predkonfigurovanými nástrojmi
- **Interaktívne prostredie DevContainer**: Nepotrebujete lokálnu inštaláciu — ihneď začnite programovať
- **Sledovanie pokroku**: Vstavané kontrolné body a validačné cvičenia
- **Podpora komunity**: Prístup do Azure Discord kanálov na otázky a spoluprácu

**Štruktúra učenia:**
- **Flexibilný čas**: Dokončite kapitoly vlastným tempom v priebehu dní alebo týždňov
- **Systém kontrolných bodov**: Overte si učenie pred postupom na zložitejšie témy
- **Knižnica zdrojov**: Komplexná dokumentácia, príklady a príručky na riešenie problémov
- **Tvorba portfólia**: Vytvorte nasaditeľné projekty pre profesionálne portfólio

**Začnite (samoštúdium):**
```bash
# Možnosť 1: GitHub Codespaces (odporúčané)
# Prejdite do repozitára a kliknite na "Code" → "Create codespace on main"

# Možnosť 2: Lokálny vývoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postupujte podľa inštrukcií na nastavenie v workshop/README.md
```

#### 🏛️ Riadené workshopy
**Ideálne pre firemné školenia, bootcampy a vzdelávacie inštitúcie**

**Formáty workshopov:**

**📚 Integrácia do akademického kurzu (8-12 týždňov)**
- **Univerzitné programy**: Semester trvajúci kurz s týždennými 2-hodinovými stretnutiami
- **Bootcamp formát**: Intenzívny 3-5 denný program s dennými 6-8 hodinovými sedením
- **Firemné školenia**: Mesačné tímové stretnutia s praktickou implementáciou projektov
- **Hodnotiaci rámec**: Ohodnotené úlohy, recenzie od rovesníkov a záverečné projekty

**🚀 Intenzívny workshop (1-3 dni)**
- **Deň 1**: Základy + vývoj AI (Kapitoly 1-2) - 6 hodín
- **Deň 2**: Konfigurácia + infraštruktúra (Kapitoly 3-4) - 6 hodín  
- **Deň 3**: Pokročilé vzory + produkcia (Kapitoly 5-8) - 8 hodín
- **Dohľad**: Voliteľné 2-týždňové mentoriálne obdobie na dokončenie projektu

**⚡ Výkonný briefing (4-6 hodín)**
- **Strategický prehľad**: Hodnota AZD a obchodný dopad (1 hodina)
- **Praktická ukážka**: Kompletné nasadenie AI aplikácie (2 hodiny)
- **Prehľad architektúry**: Podnikové vzory a riadenie (1 hodina)
- **Plánovanie implementácie**: Stratégia organizačného zavedenia (1-2 hodiny)

#### 🛠️ Metodika workshopového učenia
**Prístup Objevovanie → Nasadenie → Prispôsobenie pre praktický rozvoj zručností**

**Fáza 1: Objevovanie (45 minút)**
- **Preskúmanie šablón**: Vyhodnotenie Microsoft Foundry šablón a služieb
- **Analýza architektúry**: Pochopenie vzorov viacerých agentov a stratégií nasadenia
- **Vyhodnotenie požiadaviek**: Identifikácia potrieb a obmedzení organizácie
- **Nastavenie prostredia**: Konfigurácia vývojového prostredia a Azure zdrojov

**Fáza 2: Nasadenie (2 hodiny)**
- **Riadená implementácia**: Krok za krokom nasadenie AI aplikácií pomocou AZD
- **Konfigurácia služieb**: Nastavenie Azure AI služieb, koncových bodov a autentifikácie
- **Implementácia bezpečnosti**: Aplikácia podnikových bezpečnostných vzorov a kontrol prístupu
- **Validácia testovania**: Overenie nasadení a riešenie bežných problémov

**Fáza 3: Prispôsobenie (45 minút)**
- **Úprava aplikácie**: Prispôsobenie šablón pre špecifické prípady a požiadavky
- **Optimalizácia pre produkciu**: Implementácia monitoringu, riadenia nákladov a škálovania
- **Pokročilé vzory**: Preskúmanie koordinácie viacerých agentov a komplexných architektúr
- **Plánovanie ďalších krokov**: Definovanie cesty učenia pre pokračujúci rozvoj zručností

#### 🎯 Výsledky učenia workshopu
**Merateľné zručnosti získané prostredníctvom praktického cvičenia**

**Technické kompetencie:**
- **Nasadenie produkčných AI aplikácií**: Úspešné nasadenie a konfigurácia AI riešení
- **Ovládnutie infraštruktúry ako kódu**: Vytváranie a správa vlastných Bicep šablón
- **Architektúra viacerých agentov**: Implementácia koordinovaných AI agentov
- **Pripravenosť na produkciu**: Aplikácia bezpečnostných, monitorovacích a riadiacich vzorov
- **Expertíza v riešení problémov**: Samostatné odstraňovanie problémov nasadenia a konfigurácie

**Profesijné zručnosti:**
- **Vedenie projektov**: Vedenie technických tímov pri nasadzovaní v cloude
- **Návrh architektúry**: Navrhovanie škálovateľných, nákladovo efektívnych Azure riešení
- **Prenos znalostí**: Školenie a mentoring kolegov v najlepších praktikách AZD
- **Strategické plánovanie**: Vplyv na organizačné stratégie adopcie cloudu

#### 📋 Zdroje a materiály workshopu
**Komplexný nástrojový balík pre facilitátorov a účastníkov**

**Pre facilitátorov:**
- **Príručka inštruktora**: [Prehľad workshopu](workshop/README.md) – Plánovanie a vedenie sedení
- **Prezentačné materiály**: Slide decky, diagramy architektúry a demo skripty
- **Hodnotiace nástroje**: Praktické cvičenia, znalostné kontroly a hodnotiace rubriky
- **Technické nastavenie**: Konfigurácia prostredia, príručky na riešenie problémov a záložné plány

**Pre účastníkov:**
- **Interaktívne prostredie workshopu**: [Materiály workshopu](workshop/README.md) – Prehliadačová vzdelávacia platforma
- **Podrobné návody**: [Riadene cvičenia](../../workshop/docs/instructions) – Detailné krok-za-krokom návody  
- **Referenčná dokumentácia**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) – Hĺbkové štúdium AI
- **Komunitné zdroje**: Azure Discord kanály, GitHub diskusie a podpora expertov

#### 🏢 Implementácia podnikového workshopu
**Strategické nasadenie a školiace stratégie pre organizácie**

**Firemné školenia:**
- **Onboarding vývojárov**: Orientácia nových zamestnancov s AZD základmi (2-4 týždne)
- **Zvyšovanie kvalifikácie tímov**: Štvrťročné workshopy pre existujúce vývojárske tímy (1-2 dni)
- **Prehľad architektúry**: Mesačné sedenia pre senior inžinierov a architektov (4 hodiny)
- **Briefingy pre vedenie**: Workshopy pre technických lídrov (poldeň)

**Podpora implementácie:**
- **Vlastný dizajn workshopu**: Prispôsobený obsah pre špecifické potreby organizácie
- **Správa pilotných programov**: Štruktúrované zavedenie s metrikami úspechu a spätnou väzbou  
- **Pokračujúce mentoringy**: Podpora po workshope pri realizácii projektov
- **Budovanie komunity**: Interné komunity Azure AI vývojárov a zdieľanie znalostí

**Metriky úspechu:**
- **Získanie zručností**: Pred- a po-testy merajúce rast technickej kompetencie
- **Úspešnosť nasadení**: Percento účastníkov úspešne nasadzujúcich produkčné aplikácie
- **Čas do produktivity**: Skrátenie času onboarding nových Azure AI projektov
- **Udržanie znalostí**: Kontrolné testy 3-6 mesiacov po workshope

## Štruktúra učenia v 8 kapitolách

### Kapitola 1: Základy a rýchly štart (30-45 minút) 🌱
**Predpoklady**: Azure predplatné, základné znalosti príkazového riadku  
**Zložitosť**: ⭐

#### Čo sa naučíte
- Pochopenie základov Azure Developer CLI
- Inštalácia AZD na váš systém  
- Váš prvý úspešný deployment
- Kľúčové koncepty a terminológia

#### Zdroje na učenie
- [Základy AZD](docs/getting-started/azd-basics.md) – Kľúčové koncepty
- [Inštalácia a nastavenie](docs/getting-started/installation.md) – Platformovo špecifické príručky
- [Váš prvý projekt](docs/getting-started/first-project.md) – Praktický návod
- [Prehľad príkazov](resources/cheat-sheet.md) – Rýchla referencia

#### Praktický výsledok
Úspešne nasadiť jednoduchú webovú aplikáciu na Azure pomocou AZD

---

### Kapitola 2: AI-First vývoj (1-2 hodiny) 🤖
**Predpoklady**: Dokončená kapitola 1  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Integrácia Microsoft Foundry s AZD
- Nasadzovanie AI-poháňaných aplikácií
- Pochopenie konfigurácie AI služieb
- Vzory RAG (Retrieval-Augmented Generation)

#### Zdroje na učenie
- [Integrácia Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [Nasadenie AI modelu](docs/microsoft-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) – **NOVINKA**: Komplexný 2-3 hodinový praktický lab
- [Interaktívny workshopový sprievodca](workshop/README.md) – **NOVINKA**: Prehliadačový workshop s MkDocs náhľadom
- [Microsoft Foundry šablóny](README.md#featured-microsoft-foundry-templates)
- [Workshop návody](../../workshop/docs/instructions) – **NOVINKA**: Krok-za-krokom riadené cvičenia

#### Praktický výsledok
Nasadenie a konfigurácia AI-poháňanej chatovej aplikácie s RAG funkciami

#### Workshopová cesta učenia (voliteľné rozšírenie)
**NOVINKA Interaktívna skúsenosť**: [Kompletný sprievodca workshopom](workshop/README.md)
1. **Objavovanie** (30 min): Výber a vyhodnotenie šablóny
2. **Nasadenie** (45 min): Nasadenie a validácia funkčnosti AI šablóny  
3. **Deštrukcia** (30 min): Pochopenie architektúry a komponentov šablóny
4. **Konfigurácia** (30 min): Prispôsobenie nastavení a parametrov
5. **Prispôsobenie** (45 min): Úprava a iterácia pre vlastné použitie
6. **Ukončenie** (15 min): Vyčistenie zdrojov a pochopenie životného cyklu
7. **Záver** (15 min): Ďalšie kroky a pokročilé vzdelávacie cesty

---

### Kapitola 3: Konfigurácia a autentifikácia (45-60 minút) ⚙️
**Predpoklady**: Dokončená kapitola 1  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Konfigurácia a správa prostredia
- Najlepšie postupy autentifikácie a bezpečnosti
- Pomenovanie a organizácia zdrojov
- Nasadenia v multi-prostrediach

#### Zdroje na učenie
- [Príručka konfigurácie](docs/getting-started/configuration.md) – Nastavenie prostredia
- [Vzory autentifikácie a bezpečnosti](docs/getting-started/authsecurity.md) – Managed Identity a integrácia Key Vault
- Príklady pre viac prostredí

#### Praktický výsledok
Správa viacerých prostredí s náležitou autentifikáciou a bezpečnosťou

---

### Kapitola 4: Infraštuktúra ako kód a nasadenie (1-1,5 hodiny) 🏗️
**Predpoklady**: Dokončené kapitoly 1-3  
**Zložitosť**: ⭐⭐⭐

#### Čo sa naučíte
- Pokročilé vzory nasadenia
- Infraštuktúra ako kód s Bicep
- Stratégie poskytovania zdrojov
- Tvorba vlastných šablón

- Nasadenie kontajnerizovaných aplikácií pomocou Azure Container Apps a AZD

#### Zdroje na učenie
- [Príručka nasadenia](docs/deployment/deployment-guide.md) – Kompletné pracovné postupy
- [Poskytovanie zdrojov](docs/deployment/provisioning.md) – Správa zdrojov
- Príklady kontajnerov a mikroservisov
- [Príklady Container App](examples/container-app/README.md) – Rýchly štart, produkcia a pokročilé vzory nasadenia

#### Praktický výsledok
Nasadiť komplexné aplikácie viacerých služieb pomocou vlastných infraštruktúrnych šablón

---

### Kapitola 5: Riešenia AI s viacerými agentmi (2-3 hodiny) 🤖🤖
**Predpoklady**: Dokončené kapitoly 1-2  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Vzory architektúry viacerých agentov
- Orchestrácia a koordinácia agentov
- Produkčne pripravené AI nasadenia
- Implementácie agentov zákazníka a inventára

- Integrácia kontajnerizovaných mikroservisov ako súčasť riešení na báze agentov

#### Zdroje na učenie
- [Retail riešenie viacerých agentov](examples/retail-scenario.md) – Kompletná implementácia
- [ARM šablóna balíka](../../examples/retail-multiagent-arm-template) – Nasadenie jedným klikom
- Vzory koordinácie viacerých agentov
- [Príklad mikroservisnej architektúry](../../examples/container-app/microservices) – Komunikácia služba-ku-službe, asynchrónne správy a produkčné nasadenie

#### Praktický výsledok
Nasadiť a spravovať produkčne pripravené riešenie AI s viacerými agentmi

---

### Kapitola 6: Validácia a plánovanie pred nasadením (1 hodina) 🔍
**Predpoklady**: Dokončená kapitola 4  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Plánovanie kapacity a validácia zdrojov
- Stratégie výberu SKU
- Prelietavacie kontroly a automatizácia
- Plánovanie optimalizácie nákladov

#### Zdroje na učenie
- [Plánovanie kapacity](docs/pre-deployment/capacity-planning.md) – Validácia zdrojov
- [Výber SKU](docs/pre-deployment/sku-selection.md) – Nákladovo efektívne voľby
- [Prelietavacie kontroly](docs/pre-deployment/preflight-checks.md) – Automatizované skripty
- [Integrácia Application Insights](docs/pre-deployment/application-insights.md) – Monitoring a pozorovateľnosť
- [Vzory koordinácie viacerých agentov](docs/pre-deployment/coordination-patterns.md) – Stratégie orchestrácie agentov

#### Praktický výsledok
Overenie a optimalizácia nasadení pred ich vykonaním
---

### Kapitola 7: Riešenie problémov a ladenie (1-1,5 hodiny) 🔧
**Predpoklady**: Dokončená akákoľvek kapitola o nasadení  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Systematické prístupy k ladeniu
- Bežné problémy a riešenia
- Špecifické riešenie problémov pre AI
- Optimalizácia výkonu

#### Vzdelávacie zdroje
- [Bežné problémy](docs/troubleshooting/common-issues.md) - FAQ a riešenia
- [Sprievodca ladením](docs/troubleshooting/debugging.md) - Krok za krokom stratégie
- [AI-špecifické riešenie problémov](docs/troubleshooting/ai-troubleshooting.md) - Problémy s AI službami

#### Praktický výsledok
Samostatná diagnostika a riešenie bežných problémov s nasadením

---

### Kapitola 8: Produkčné a podnikové vzory (2-3 hodiny) 🏢
**Predpoklady**: Dokončené kapitoly 1-4  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Stratégie produkčného nasadenia
- Podnikové bezpečnostné vzory
- Monitorovanie a optimalizácia nákladov
- Škálovateľnosť a správa

- Najlepšie praktiky pre produkčné nasadenia kontajnerových aplikácií (bezpečnosť, monitorovanie, náklady, CI/CD)

#### Vzdelávacie zdroje
- [Najlepšie praktiky produkčného AI](docs/microsoft-foundry/production-ai-practices.md) - Podnikové vzory
- Príklady mikroservisov a podnikov
- Rámce pre monitorovanie a správu
- [Príklad architektúry mikroservisov](../../examples/container-app/microservices) - Blue-green/canary nasadenie, distribuované trasovanie a optimalizácia nákladov

#### Praktický výsledok
Nasadiť aplikácie pripravené na podnikový produkčný chod

---

## Postup učenia a zložitosť

### Postupné budovanie zručností

- **🌱 Začiatočníci**: Začnite Kapitolou 1 (Základy) → Kapitola 2 (Vývoj AI)
- **🔧 Stredne pokročilí**: Kapitoly 3-4 (Konfigurácia & infraštruktúra) → Kapitola 6 (Validácia)
- **🚀 Pokročilí**: Kapitola 5 (Viacagentové riešenia) → Kapitola 7 (Riešenie problémov)
- **🏢 Podnikový**: Dokončenie všetkých kapitol, zameranie na Kapitolu 8 (Produkčné vzory)

- **Cesta kontajnerových aplikácií**: Kapitoly 4 (Nasadenie kontajnerov), 5 (Integrácia mikroservisov), 8 (Produkčné najlepšie praktiky)

### Indikátory zložitosti

- **⭐ Základná**: Jednoduché koncepty, vedené tutoriály, 30-60 minút
- **⭐⭐ Stredne pokročilá**: Viac konceptov, praktické cvičenia, 1-2 hodiny  
- **⭐⭐⭐ Pokročilá**: Zložité architektúry, vlastné riešenia, 1-3 hodiny
- **⭐⭐⭐⭐ Expert**: Produkčné systémy, podnikové vzory, 2-4 hodiny

### Flexibilné vzdelávacie cesty

#### 🎯 Rýchly kurz pre AI vývojárov (4-6 hodín)
1. **Kapitola 1**: Základy a rýchly štart (45 min)
2. **Kapitola 2**: AI-prvový vývoj (2 hodiny)  
3. **Kapitola 5**: Viacagentové AI riešenia (3 hodiny)
4. **Kapitola 8**: Produkčné AI najlepšie praktiky (1 hodina)

#### 🛠️ Cesta špecialistu infraštruktúry (5-7 hodín)
1. **Kapitola 1**: Základy a rýchly štart (45 min)
2. **Kapitola 3**: Konfigurácia a autentifikácia (1 hodina)
3. **Kapitola 4**: Infraštruktúra ako kód a nasadenie (1,5 hodiny)
4. **Kapitola 6**: Prednasadenie validácia a plánovanie (1 hodina)
5. **Kapitola 7**: Riešenie problémov a ladenie (1,5 hodiny)
6. **Kapitola 8**: Produkčné a podnikové vzory (2 hodiny)

#### 🎓 Kompletná vzdelávacia cesta (8-12 hodín)
Postupné dokončenie všetkých 8 kapitol s praktickými cvičeniami a validáciou

## Rámec ukončenia kurzu

### Validácia znalostí
- **Kontrolné body kapitol**: Praktické cvičenia s merateľnými výsledkami
- **Overovanie skúseností**: Nasadenie funkčných riešení pre každú kapitolu
- **Sledovanie pokroku**: Vizualizované ukazovatele a odznaky
- **Validácia komunity**: Zdieľanie skúseností v Azure Discord kanáloch

### Hodnotenie výsledkov učenia

#### Dokončenie kapitol 1-2 (Základy + AI)
- ✅ Nasadiť základnú webovú aplikáciu pomocou AZD
- ✅ Nasadiť AI chat aplikáciu s RAG
- ✅ Pochopiť základné AZD koncepty a AI integráciu

#### Dokončenie kapitol 3-4 (Konfigurácia + infraštruktúra)  
- ✅ Spravovať viac prostredí nasadenia
- ✅ Vytvoriť vlastné Bicep šablóny infraštruktúry
- ✅ Implementovať bezpečné vzory autentifikácie

#### Dokončenie kapitol 5-6 (Viacagentové + validácia)
- ✅ Nasadiť komplexné viacagentové AI riešenie
- ✅ Vykonať plánovanie kapacity a optimalizáciu nákladov
- ✅ Implementovať automatizovanú prednasadenie validáciu

#### Dokončenie kapitol 7-8 (Riešenie problémov + produkcia)
- ✅ Samostatne riešiť a debugovať problémy s nasadením  
- ✅ Implementovať podnikové monitorovanie a bezpečnosť
- ✅ Nasadiť produkčne pripravené aplikácie so správou

### Certifikácia a uznanie
- **Odznak dokončenia kurzu**: Dokončiť všetky 8 kapitol s praktickou validáciou
- **Uznanie komunity**: Aktívna účasť v Microsoft Foundry Discord
- **Profesionálny rozvoj**: Relevantné AZD a AI zručnosti nasadenia
- **Kariérny postup**: Podnikové schopnosti nasadenia v cloude

## 🎓 Komplexné výsledky učenia

### Základná úroveň (Kapitoly 1-2)
Po dokončení základných kapitol budú študenti vedieť:

**Technické schopnosti:**
- Nasadiť jednoduché webové aplikácie do Azure cez AZD príkazy
- Konfigurovať a nasadiť AI chat aplikácie s RAG schopnosťami
- Pochopiť základné AZD koncepty: šablóny, prostredia, procesy provisioning
- Integrovať Microsoft Foundry služby s AZD nasadeniami
- Navigovať konfigurácie Azure AI služieb a API endpointov

**Profesionálne zručnosti:**
- Dodržiavať štruktúrované workflow pre nasadenie pre konzistentné výsledky
- Riešiť základné problémy s nasadením pomocou logov a dokumentácie
- Efektívne komunikovať o procesoch cloud nasadenia
- Aplikovať najlepšie praktiky pre bezpečnú integráciu AI služieb

**Overenie učenia:**
- ✅ Úspešne nasadiť `todo-nodejs-mongo` šablónu
- ✅ Nasadiť a konfigurovať `azure-search-openai-demo` s RAG
- ✅ Dokončiť interaktívne cvičenia workshopu (fáza Discovery)
- ✅ Aktívna účasť v diskusiách Azure Discord komunity

### Stredne pokročilá úroveň (Kapitoly 3-4)
Po dokončení stredne pokročilých kapitol budú študenti vedieť:

**Technické schopnosti:**
- Spravovať viac prostredí nasadenia (dev, staging, produkcia)
- Vytvoriť vlastné Bicep šablóny pre infraštruktúru ako kód
- Implementovať bezpečné autentifikačné vzory s managed identity
- Nasadiť komplexné viacslužbové aplikácie s vlastnou konfiguráciou
- Optimalizovať stratégie provisioning zdrojov pre náklady a výkon

**Profesionálne zručnosti:**
- Navrhovať škálovateľné infraštruktúrne architektúry
- Implementovať bezpečnostné najlepšie praktiky pre cloud nasadenia
- Dokumentovať infraštruktúrne vzory pre tímovú spoluprácu
- Vyhodnocovať a vyberať vhodné Azure služby pre požiadavky

**Overenie učenia:**
- ✅ Konfigurovať oddelené prostredia s nastaveniami špecifickými pre prostredie
- ✅ Vytvoriť a nasadiť vlastnú Bicep šablónu pre viacslužbovú aplikáciu
- ✅ Implementovať autentifikáciu pomocou managed identity pre bezpečný prístup
- ✅ Dokončiť cvičenia správy konfigurácie so skutočnými scenármi

### Pokročilá úroveň (Kapitoly 5-6)
Po dokončení pokročilých kapitol budú študenti vedieť:

**Technické schopnosti:**
- Nasadiť a orchestracovať viacagentové AI riešenia s koordinovanými workflow
- Implementovať architektúry agentov zákazníka a inventára pre maloobchodné scenáre
- Vykonať komplexné plánovanie kapacity a validáciu zdrojov
- Realizovať automatizovanú prednasadenie validáciu a optimalizáciu
- Navrhovať nákladovo efektívny výber SKU podľa požiadaviek záťaže

**Profesionálne zručnosti:**
- Navrhovať zložité AI riešenia pre produkčné prostredia
- Viesť technické diskusie o AI nasadení a stratégiách
- Mentorovať junior vývojárov v AZD a AI nasadení
- Hodnotiť a odporúčať AI architektonické vzory podľa biznis požiadaviek

**Overenie učenia:**
- ✅ Nasadiť kompletné maloobchodné viacagentové riešenie s ARM šablónami
- ✅ Ukázať koordináciu agentov a orchestráciu workflow
- ✅ Dokončiť plánovanie kapacity s reálnymi limitmi zdrojov
- ✅ Validovať pripravenosť nasadenia cez automatické predletové kontroly

### Expertná úroveň (Kapitoly 7-8)
Po dokončení expertných kapitol budú študenti vedieť:

**Technické schopnosti:**
- Diagnostikovať a riešiť komplexné problémy nasadenia samostatne
- Implementovať podnikové bezpečnostné vzory a rámce správy
- Navrhovať komplexné monitorovanie a stratégie alertovania
- Optimalizovať produkčné nasadenia pre škálovateľnosť, náklady a výkon
- Vytvoriť CI/CD pipeline s vhodným testovaním a validáciou

**Profesionálne zručnosti:**
- Viesť podnikové iniciatívy transformácie cloudu
- Navrhovať a implementovať organizačné štandardy nasadenia
- Trénovať a mentorovať vývojové tímy v pokročilých AZD praktikách
- Ovplyvňovať technické rozhodovanie pri podnikových AI nasadeniach

**Overenie učenia:**
- ✅ Riešiť zložité chyby nasadenia viacslužbových riešení
- ✅ Implementovať podnikové bezpečnostné vzory s požiadavkami na súlad
- ✅ Navrhnúť a nasadiť produkčné monitorovanie s Application Insights
- ✅ Dokončiť implementáciu podnikového rámca správy

## 🎯 Certifikácia dokončenia kurzu

### Rámec sledovania pokroku
Sledujte svoj pokrok cez štruktúrované kontrolné body:

- [ ] **Kapitola 1**: Základy a rýchly štart ✅
- [ ] **Kapitola 2**: AI-prvový vývoj ✅  
- [ ] **Kapitola 3**: Konfigurácia a autentifikácia ✅
- [ ] **Kapitola 4**: Infraštruktúra ako kód a nasadenie ✅
- [ ] **Kapitola 5**: Viacagentové AI riešenia ✅
- [ ] **Kapitola 6**: Prednasadenie validácia a plánovanie ✅
- [ ] **Kapitola 7**: Riešenie problémov a ladenie ✅
- [ ] **Kapitola 8**: Produkčné a podnikové vzory ✅

### Overovací proces
Po dokončení každej kapitoly overte svoje znalosti cez:

1. **Dokončenie praktického cvičenia**: Nasadenie funkčných riešení pre každú kapitolu
2. **Hodnotenie vedomostí**: Preštudovanie FAQ sekcií a dokončenie samo-hodnotení
3. **Zapojenie komunity**: Zdieľanie skúseností a získavanie spätnej väzby v Azure Discord
4. **Vývoj portfólia**: Dokumentácia nasadení a získaných poznatkov
5. **Recenzia rovesníkmi**: Spolupráca s ostatnými študentmi na zložitých scénach

### Výhody dokončenia kurzu
Po dokončení všetkých kapitol s overením budú absolventi disponovať:

**Technickými expertízami:**
- **Produkčné skúsenosti**: Nasadené reálne AI aplikácie do Azure prostredí
- **Profesionálne zručnosti**: Podniková pripravenosť nasadení a riešenie problémov  
- **Architektonické znalosti**: Viacagentové AI riešenia a komplexné infraštruktúrne vzory
- **Majstrovstvo v riešení problémov**: Samostatné riešenie problémov s nasadením a konfiguráciou

**Profesionálny rozvoj:**
- **Uznanie v odvetví**: Overiteľné zručnosti v žiadaných oblastiach AZD a AI nasadenia
- **Kariérny postup**: Kvalifikácie pre role cloud architektov a špecialistov AI nasadenia
- **Vodcovstvo v komunite**: Aktívne členstvo v Azure a AI vývojárskych komunitách
- **Neustále vzdelávanie**: Základy pre pokročilé špecializácie Microsoft Foundry

**Portfólio aktíva:**
- **Nasadené riešenia**: Funkčné príklady AI aplikácií a infraštruktúrnych vzorov
- **Dokumentácia**: Komplexné sprievodcovia nasadením a postupy riešenia problémov  
- **Príspevky pre komunitu**: Diskusie, príklady a zlepšenia zdieľané s Azure komunitou
- **Profesionálna sieť**: Kontakty s Azure expertmi a AI praktickými špecialistami

### Po kurze vzdelávacia cesta
Absolventi sú pripravení na pokročilú špecializáciu v oblastiach:
- **Microsoft Foundry Expert**: Hlboká špecializácia v nasadení a orchestrácii AI modelov
- **Vedúca úloha v cloud architektúre**: Návrh a správa produkčných podnikov
- **Vodcovstvo vývojárskej komunity**: Príspevky do Azure príkladov a komunít
- **Firemné školenie**: Výuka AZD a AI nasadení v organizáciách

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:  
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, uvedomte si, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne interpretácie, ktoré môžu vyplývať z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->