<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "aace36eff845763a5b041a4ed9a33e02",
  "translation_date": "2025-09-25T01:01:07+00:00",
  "source_file": "course-outline.md",
  "language_code": "sk"
}
-->
# AZD pre začiatočníkov: Osnova kurzu a rámec učenia

## Prehľad kurzu

Ovládnite Azure Developer CLI (azd) prostredníctvom štruktúrovaných kapitol navrhnutých pre postupné učenie. **Špeciálny dôraz na nasadenie AI aplikácií s integráciou Azure AI Foundry.**

### Prečo je tento kurz nevyhnutný pre moderných vývojárov

Na základe poznatkov z komunity Azure AI Foundry Discord **45 % vývojárov chce používať AZD pre AI pracovné zaťaženie**, ale čelí výzvam ako:
- Komplexné AI architektúry s viacerými službami
- Najlepšie postupy pre nasadenie AI do produkcie  
- Integrácia a konfigurácia služieb Azure AI
- Optimalizácia nákladov na AI pracovné zaťaženie
- Riešenie problémov špecifických pre nasadenie AI

### Hlavné ciele učenia

Po absolvovaní tohto štruktúrovaného kurzu budete:
- **Ovládať základy AZD**: Základné koncepty, inštalácia a konfigurácia
- **Nasadzovať AI aplikácie**: Používať AZD so službami Azure AI Foundry
- **Implementovať infraštruktúru ako kód**: Spravovať Azure zdroje pomocou Bicep šablón
- **Riešiť problémy pri nasadení**: Riešiť bežné problémy a odstraňovať chyby
- **Optimalizovať pre produkciu**: Bezpečnosť, škálovanie, monitorovanie a správu nákladov
- **Budovať riešenia s viacerými agentmi**: Nasadzovať komplexné AI architektúry

## 🎓 Workshopový zážitok z učenia

### Flexibilné možnosti doručenia učenia
Tento kurz je navrhnutý tak, aby podporoval **samostatné učenie vlastným tempom** aj **facilitované workshopové sedenia**, čo umožňuje účastníkom získať praktické skúsenosti s AZD prostredníctvom interaktívnych cvičení.

#### 🚀 Režim samostatného učenia
**Ideálne pre individuálnych vývojárov a kontinuálne učenie**

**Funkcie:**
- **Rozhranie založené na prehliadači**: Workshop poháňaný MkDocs dostupný cez akýkoľvek webový prehliadač
- **Integrácia GitHub Codespaces**: Jedno kliknutie na vývojové prostredie s predkonfigurovanými nástrojmi
- **Interaktívne DevContainer prostredie**: Nie je potrebné lokálne nastavenie - začnite kódovať okamžite
- **Sledovanie pokroku**: Zabudované kontrolné body a validačné cvičenia
- **Podpora komunity**: Prístup k Azure Discord kanálom na otázky a spoluprácu

**Štruktúra učenia:**
- **Flexibilný časový plán**: Dokončite kapitoly vlastným tempom počas dní alebo týždňov
- **Systém kontrolných bodov**: Validujte učenie pred prechodom na zložitejšie témy
- **Knižnica zdrojov**: Komplexná dokumentácia, príklady a návody na riešenie problémov
- **Rozvoj portfólia**: Vytvárajte nasaditeľné projekty pre profesionálne portfóliá

**Začiatok (samostatné učenie):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Facilitované workshopové sedenia
**Ideálne pre firemné školenia, bootcampy a vzdelávacie inštitúcie**

**Formáty workshopov:**

**📚 Integrácia do akademického kurzu (8-12 týždňov)**
- **Univerzitné programy**: Semestrálny kurz s týždennými 2-hodinovými sedeniami
- **Bootcamp formát**: Intenzívny 3-5 dňový program s dennými 6-8 hodinovými sedeniami
- **Firemné školenie**: Mesačné tímové sedenia s praktickou implementáciou projektov
- **Rámec hodnotenia**: Hodnotené úlohy, recenzie od kolegov a záverečné projekty

**🚀 Intenzívny workshop (1-3 dni)**
- **Deň 1**: Základy + AI vývoj (kapitoly 1-2) - 6 hodín
- **Deň 2**: Konfigurácia + infraštruktúra (kapitoly 3-4) - 6 hodín  
- **Deň 3**: Pokročilé vzory + produkcia (kapitoly 5-8) - 8 hodín
- **Následné kroky**: Voliteľné 2-týždňové mentorstvo na dokončenie projektu

**⚡ Výkonný briefing (4-6 hodín)**
- **Strategický prehľad**: Hodnota AZD a jeho dopad na podnikanie (1 hodina)
- **Praktická ukážka**: Nasadenie AI aplikácie od začiatku do konca (2 hodiny)
- **Prehľad architektúry**: Podnikové vzory a správa (1 hodina)
- **Plánovanie implementácie**: Stratégia adopcie v organizácii (1-2 hodiny)

#### 🛠️ Metodológia učenia na workshopoch
**Prístup Discovery → Deployment → Customization pre rozvoj praktických zručností**

**Fáza 1: Discovery (45 minút)**
- **Preskúmanie šablón**: Hodnotenie šablón a služieb Azure AI Foundry
- **Analýza architektúry**: Pochopenie vzorov s viacerými agentmi a stratégií nasadenia
- **Hodnotenie požiadaviek**: Identifikácia potrieb a obmedzení organizácie
- **Nastavenie prostredia**: Konfigurácia vývojového prostredia a Azure zdrojov

**Fáza 2: Deployment (2 hodiny)**
- **Riadená implementácia**: Krok za krokom nasadenie AI aplikácií pomocou AZD
- **Konfigurácia služieb**: Nastavenie služieb Azure AI, koncových bodov a autentifikácie
- **Implementácia bezpečnosti**: Použitie podnikových bezpečnostných vzorov a kontrol prístupu
- **Testovanie validácie**: Overenie nasadení a riešenie bežných problémov

**Fáza 3: Customization (45 minút)**
- **Úprava aplikácie**: Prispôsobenie šablón pre konkrétne prípady použitia a požiadavky
- **Optimalizácia pre produkciu**: Implementácia monitorovania, správy nákladov a stratégií škálovania
- **Pokročilé vzory**: Preskúmanie koordinácie viacerých agentov a komplexných architektúr
- **Plánovanie ďalších krokov**: Definovanie učebnej cesty pre pokračovanie rozvoja zručností

#### 🎯 Výsledky učenia na workshopoch
**Merateľné zručnosti získané prostredníctvom praktického cvičenia**

**Technické kompetencie:**
- **Nasadenie produkčných AI aplikácií**: Úspešné nasadenie a konfigurácia AI riešení
- **Ovládanie infraštruktúry ako kódu**: Vytváranie a správa vlastných Bicep šablón
- **Architektúra s viacerými agentmi**: Implementácia koordinovaných AI agentov
- **Pripravenosť na produkciu**: Použitie bezpečnostných, monitorovacích a správcovských vzorov
- **Expertíza v riešení problémov**: Samostatné riešenie problémov pri nasadení a konfigurácii

**Profesionálne zručnosti:**
- **Vedenie projektov**: Vedenie technických tímov pri cloudových iniciatívach
- **Návrh architektúry**: Návrh škálovateľných a nákladovo efektívnych Azure riešení
- **Prenos znalostí**: Školenie a mentorovanie kolegov v najlepších postupoch AZD
- **Strategické plánovanie**: Ovplyvňovanie stratégií adopcie cloudu v organizácii

#### 📋 Workshopové zdroje a materiály
**Komplexná sada nástrojov pre facilitátorov a účastníkov**

**Pre facilitátorov:**
- **Príručka pre inštruktorov**: [Workshop Facilitation Guide](workshop/docs/instructor-guide.md) - Tipy na plánovanie a vedenie sedení
- **Prezentačné materiály**: Slide decky, diagramy architektúry a skripty pre ukážky
- **Nástroje hodnotenia**: Praktické cvičenia, kontrolné otázky a hodnotiace rubriky
- **Technické nastavenie**: Konfigurácia prostredia, návody na riešenie problémov a záložné plány

**Pre účastníkov:**
- **Interaktívne workshopové prostredie**: [Workshop Materials](workshop/README.md) - Platforma na učenie založená na prehliadači
- **Krok za krokom inštrukcie**: [Guided Exercises](../../workshop/docs/instructions) - Podrobné návody na implementáciu  
- **Referenčná dokumentácia**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Hĺbkové zameranie na AI
- **Komunitné zdroje**: Kanály Azure Discord, diskusie na GitHub a odborná podpora

#### 🏢 Implementácia workshopov pre podniky
**Stratégie nasadenia a školenia v organizáciách**

**Programy firemného školenia:**
- **Onboarding vývojárov**: Orientácia nových zamestnancov so základmi AZD (2-4 týždne)
- **Zvyšovanie kvalifikácie tímov**: Štvrťročné workshopy pre existujúce vývojové tímy (1-2 dni)
- **Prehľad architektúry**: Mesačné sedenia pre senior inžinierov a architektov (4 hodiny)
- **Briefing pre vedenie**: Workshop pre technických rozhodovateľov (pol dňa)

**Podpora implementácie:**
- **Návrh na mieru**: Obsah prispôsobený špecifickým potrebám organizácie
- **Riadenie pilotného programu**: Štruktúrované zavedenie s metrikami úspechu a spätnou väzbou  
- **Pokračujúce mentorstvo**: Podpora po workshope na implementáciu projektov
- **Budovanie komunity**: Interné komunity vývojárov Azure AI a zdieľanie znalostí

**Metriky úspechu:**
- **Získanie zručností**: Pred/po hodnotenia merajúce rast technických kompetencií
- **Úspešnosť nasadenia**: Percento účastníkov úspešne nasadzujúcich produkčné aplikácie
- **Čas do produktivity**: Skrátenie času onboardingu pre nové projekty Azure AI
- **Udržanie znalostí**: Následné hodnotenia 3-6 mesiacov po workshope

## Štruktúra učenia v 8 kapitolách

### Kapitola 1: Základy a rýchly štart (30-45 minút) 🌱
**Predpoklady**: Azure predplatné, základné znalosti príkazového riadku  
**Komplexnosť**: ⭐

#### Čo sa naučíte
- Pochopenie základov Azure Developer CLI
- Inštalácia AZD na vašej platforme  
- Vaše prvé úspešné nasadenie
- Základné koncepty a terminológia

#### Zdroje učenia
- [AZD Basics](docs/getting-started/azd-basics.md) - Základné koncepty
- [Installation & Setup](docs/getting-started/installation.md) - Platformovo špecifické návody
- [Your First Project](docs/getting-started/first-project.md) - Praktický tutoriál
- [Command Cheat Sheet](resources/cheat-sheet.md) - Rýchly referenčný materiál

#### Praktický výsledok
Úspešne nasadiť jednoduchú webovú aplikáciu na Azure pomocou AZD

---

### Kapitola 2: Vývoj orientovaný na AI (1-2 hodiny) 🤖
**Predpoklady**: Dokončená kapitola 1  
**Komplexnosť**: ⭐⭐

#### Čo sa naučíte
- Integrácia Azure AI Foundry s AZD
- Nasadenie AI aplikácií
- Pochopenie konfigurácie AI služieb
- Vzory RAG (Retrieval-Augmented Generation)

#### Zdroje učenia
- [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
- [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - **NOVÉ**: Komplexný 2-3 hodinový praktický lab
- [Interactive Workshop Guide](workshop/README.md) - **NOVÉ**: Workshop s náhľadom MkDocs
- [Azure AI Foundry Templates](README.md#featured-azure-ai-foundry-templates)
- [Workshop Instructions](../../workshop/docs/instructions) - **NOVÉ**: Krok za krokom vedené cvičenia

#### Praktický výsledok
Nasadiť a nakonfigurovať AI chat aplikáciu s RAG schopnosťami

#### Workshopová cesta učenia (voliteľné rozšírenie)
**NOVÁ interaktívna skúsenosť**: [Kompletný workshopový sprievodca](workshop/README.md)
1. **Discovery** (30 min): Výber a hodnotenie šablón
2. **Deployment** (45 min): Nasadenie a validácia funkčnosti AI šablóny  
3. **Deconstruction** (30 min): Pochopenie architektúry a komponentov šablóny
4. **Configuration** (30 min): Prispôsobenie nastavení a parametrov
5. **Customization** (45 min): Úprava a iterácia na vlastné potreby
6. **Teardown** (15 min): Vyčistenie zdrojov a pochopenie životného cyklu
7. **Wrap-up** (15 min): Ďalšie kroky a pokročilé cesty učenia

---

### Kapitola 3: Konfigurácia a autentifikácia (45-60 minút) ⚙️
**Predpoklady**: Dokončená kapitola 1  
**Komplexnosť**: ⭐⭐

#### Čo sa naučíte
- Konfigurácia a správa prostredia
- Najlepšie postupy pre autentifikáciu a bezpečnosť
- Názvoslovie a organizácia zdrojov
- Nasadenia vo viacerých prostrediach

#### Zdroje učenia
- [Configuration Guide](docs/getting-started/configuration.md) - Nastavenie prostredia
- Bezpečnostné vzory a spravovaná identita
- Príklady nasadení vo viacerých prostrediach

#### Praktický výsledok
Spravovať viaceré prostredia s riadnou autentifikáciou a bezpečnosťou

---

### Kapitola 4: Infraštruktúra ako kód a nasadenie (1-1.5 hodiny) 🏗️
**Predpoklady**: Dokončené kapitoly 1-3  
**Komplexnosť**: ⭐⭐⭐

#### Čo sa naučíte
- Pokročilé vzory nasadenia
- Infraštruktúra ako kód s Bicep
- Stratégie poskytovania zdrojov
- Vytváranie vlastných šablón

#### Zdroje učenia
- [Deployment Guide](docs/deployment/deployment-guide.md) - Kompletné pracovné postupy
- [Provisioning Resources](docs/deployment/provisioning.md) - Správa zdrojov
- Príklady kontajnerov a mikroslužieb

#### Praktický výsledok
Nasadiť komplexné aplikácie s viacerými službami pomocou vlastných infraštruktúrnych šablón

---

### Kapitola 5: Riešenia s viacerými AI agentmi (2-3 hodiny) 🤖🤖
**Predpoklady**: Dokončené kapitoly 1-2  
**Komplexnosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Vzory architektúry s viacerými agentmi
- Orchestrácia a koordinácia agentov
- Produkčné nasadenia AI
- Implementácie agentov pre zákazníkov a inventár

#### Zdroje učenia
- [Retail Multi-Agent Solution](examples/retail-scenario.md) - Kompletná implementácia
- [ARM Template Package](../../examples/retail-multiagent-arm-template) - Jedno kliknutie na nasadenie
- Vzory koordinácie viacerých agentov

#### Praktický výsledok
Nasadiť a spravovať produkčné riešenie s viacerými AI agentmi

---

### Kapitola 6: Validácia pred nasadením a plánovanie (1 hodina) 🔍
**Predpoklady**: Dokončená kapitola 4  
**Kom
- [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Problémy s AI službami

#### Praktický výsledok
Samostatne diagnostikovať a riešiť bežné problémy s nasadením

---

### Kapitola 8: Produkčné a podnikové vzory (2-3 hodiny) 🏢
**Predpoklady**: Dokončené kapitoly 1-4  
**Náročnosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Stratégie nasadenia do produkcie
- Podnikové bezpečnostné vzory
- Monitorovanie a optimalizácia nákladov
- Škálovateľnosť a správa

#### Študijné materiály
- [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - Podnikové vzory
- Príklady mikroservisov a podnikových riešení
- Rámce monitorovania a správy

#### Praktický výsledok
Nasadiť aplikácie pripravené na podnikové prostredie s plnými produkčnými schopnosťami

---

## Postup učenia a náročnosť

### Postupné budovanie zručností

- **🌱 Začiatočníci**: Začnite kapitolou 1 (Základy) → Kapitola 2 (Vývoj AI)
- **🔧 Stredne pokročilí**: Kapitoly 3-4 (Konfigurácia a infraštruktúra) → Kapitola 6 (Validácia)
- **🚀 Pokročilí**: Kapitola 5 (Riešenia s viacerými agentmi) → Kapitola 7 (Riešenie problémov)
- **🏢 Podnikové prostredie**: Dokončite všetky kapitoly, zamerajte sa na kapitolu 8 (Produkčné vzory)

### Indikátory náročnosti

- **⭐ Základné**: Jednoduché koncepty, vedené tutoriály, 30-60 minút
- **⭐⭐ Stredne pokročilé**: Viacero konceptov, praktické cvičenia, 1-2 hodiny  
- **⭐⭐⭐ Pokročilé**: Komplexné architektúry, vlastné riešenia, 1-3 hodiny
- **⭐⭐⭐⭐ Expertné**: Produkčné systémy, podnikové vzory, 2-4 hodiny

### Flexibilné študijné cesty

#### 🎯 Rýchla cesta pre AI vývojárov (4-6 hodín)
1. **Kapitola 1**: Základy a rýchly štart (45 minút)
2. **Kapitola 2**: Vývoj orientovaný na AI (2 hodiny)  
3. **Kapitola 5**: Riešenia s viacerými agentmi (3 hodiny)
4. **Kapitola 8**: Najlepšie praktiky pre produkčné AI (1 hodina)

#### 🛠️ Cesta pre špecialistov na infraštruktúru (5-7 hodín)
1. **Kapitola 1**: Základy a rýchly štart (45 minút)
2. **Kapitola 3**: Konfigurácia a autentifikácia (1 hodina)
3. **Kapitola 4**: Infraštruktúra ako kód a nasadenie (1,5 hodiny)
4. **Kapitola 6**: Validácia a plánovanie pred nasadením (1 hodina)
5. **Kapitola 7**: Riešenie problémov a ladenie (1,5 hodiny)
6. **Kapitola 8**: Produkčné a podnikové vzory (2 hodiny)

#### 🎓 Kompletná študijná cesta (8-12 hodín)
Postupné dokončenie všetkých 8 kapitol s praktickými cvičeniami a validáciou

## Rámec dokončenia kurzu

### Validácia znalostí
- **Kontrolné body kapitol**: Praktické cvičenia s merateľnými výsledkami
- **Praktická verifikácia**: Nasadenie funkčných riešení pre každú kapitolu
- **Sledovanie pokroku**: Vizualizácia pokroku a odznaky za dokončenie
- **Validácia komunity**: Zdieľanie skúseností na Azure Discord kanáloch

### Hodnotenie výsledkov učenia

#### Dokončenie kapitol 1-2 (Základy + AI)
- ✅ Nasadiť základnú webovú aplikáciu pomocou AZD
- ✅ Nasadiť AI-poháňanú chatovaciu aplikáciu s RAG
- ✅ Porozumieť základným konceptom AZD a integrácii AI

#### Dokončenie kapitol 3-4 (Konfigurácia + infraštruktúra)  
- ✅ Spravovať nasadenia vo viacerých prostrediach
- ✅ Vytvoriť vlastné Bicep šablóny infraštruktúry
- ✅ Implementovať bezpečné autentifikačné vzory

#### Dokončenie kapitol 5-6 (Viac agentov + validácia)
- ✅ Nasadiť komplexné riešenie s viacerými AI agentmi
- ✅ Vykonať plánovanie kapacity a optimalizáciu nákladov
- ✅ Implementovať automatizovanú validáciu pred nasadením

#### Dokončenie kapitol 7-8 (Riešenie problémov + produkcia)
- ✅ Samostatne riešiť problémy s nasadením  
- ✅ Implementovať podnikové monitorovanie a bezpečnosť
- ✅ Nasadiť aplikácie pripravené na produkciu so správou

### Certifikácia a uznanie
- **Odznak za dokončenie kurzu**: Dokončiť všetkých 8 kapitol s praktickou validáciou
- **Uznanie komunity**: Aktívna účasť na Azure AI Foundry Discord
- **Profesionálny rozvoj**: Relevantné zručnosti v oblasti AZD a nasadenia AI
- **Kariérny postup**: Schopnosti na nasadenie AI v podnikových prostrediach

## 🎓 Komplexné výsledky učenia

### Úroveň základov (Kapitoly 1-2)
Po dokončení základných kapitol budú účastníci schopní:

**Technické schopnosti:**
- Nasadiť jednoduché webové aplikácie na Azure pomocou AZD príkazov
- Konfigurovať a nasadiť AI-poháňané chatovacie aplikácie s RAG funkciami
- Porozumieť základným konceptom AZD: šablóny, prostredia, pracovné postupy
- Integrovať služby Azure AI Foundry s nasadeniami AZD
- Navigovať konfigurácie služieb Azure AI a API endpointy

**Profesionálne zručnosti:**
- Dodržiavať štruktúrované pracovné postupy nasadenia pre konzistentné výsledky
- Riešiť základné problémy s nasadením pomocou logov a dokumentácie
- Efektívne komunikovať o procesoch nasadenia do cloudu
- Aplikovať najlepšie praktiky pre bezpečnú integráciu AI služieb

**Validácia učenia:**
- ✅ Úspešne nasadiť šablónu `todo-nodejs-mongo`
- ✅ Nasadiť a konfigurovať `azure-search-openai-demo` s RAG
- ✅ Dokončiť interaktívne cvičenia workshopu (Fáza objavovania)
- ✅ Zúčastniť sa diskusií komunity Azure Discord

### Úroveň stredne pokročilých (Kapitoly 3-4)
Po dokončení stredne pokročilých kapitol budú účastníci schopní:

**Technické schopnosti:**
- Spravovať nasadenia vo viacerých prostrediach (dev, staging, produkcia)
- Vytvoriť vlastné Bicep šablóny pre infraštruktúru ako kód
- Implementovať bezpečné autentifikačné vzory s riadenou identitou
- Nasadiť komplexné aplikácie s viacerými službami a vlastnými konfiguráciami
- Optimalizovať stratégie poskytovania zdrojov pre náklady a výkon

**Profesionálne zručnosti:**
- Navrhovať škálovateľné architektúry infraštruktúry
- Implementovať bezpečnostné najlepšie praktiky pre nasadenia do cloudu
- Dokumentovať vzory infraštruktúry pre tímovú spoluprácu
- Hodnotiť a vyberať vhodné služby Azure pre požiadavky

**Validácia učenia:**
- ✅ Konfigurovať oddelené prostredia s nastaveniami špecifickými pre prostredie
- ✅ Vytvoriť a nasadiť vlastnú Bicep šablónu pre aplikáciu s viacerými službami
- ✅ Implementovať autentifikáciu riadenou identitou pre bezpečný prístup
- ✅ Dokončiť cvičenia správy konfigurácie s reálnymi scenármi

### Úroveň pokročilých (Kapitoly 5-6)
Po dokončení pokročilých kapitol budú účastníci schopní:

**Technické schopnosti:**
- Nasadiť a koordinovať riešenia s viacerými AI agentmi s koordinovanými pracovnými postupmi
- Implementovať architektúry agentov pre zákazníkov a inventár pre maloobchodné scenáre
- Vykonať komplexné plánovanie kapacity a validáciu zdrojov
- Realizovať automatizovanú validáciu pred nasadením a optimalizáciu
- Navrhnúť nákladovo efektívne výbery SKU na základe požiadaviek pracovného zaťaženia

**Profesionálne zručnosti:**
- Navrhovať komplexné AI riešenia pre produkčné prostredia
- Viesť technické diskusie o stratégiách nasadenia AI
- Mentorovať junior vývojárov v najlepších praktikách AZD a nasadenia AI
- Hodnotiť a odporúčať vzory AI architektúry pre obchodné požiadavky

**Validácia učenia:**
- ✅ Nasadiť kompletné maloobchodné riešenie s viacerými agentmi pomocou ARM šablón
- ✅ Demonštrovať koordináciu agentov a orchestráciu pracovných postupov
- ✅ Dokončiť cvičenia plánovania kapacity s reálnymi obmedzeniami zdrojov
- ✅ Validovať pripravenosť nasadenia prostredníctvom automatizovaných kontrol

### Úroveň expertov (Kapitoly 7-8)
Po dokončení expertných kapitol budú účastníci schopní:

**Technické schopnosti:**
- Diagnostikovať a riešiť komplexné problémy s nasadením samostatne
- Implementovať podnikové bezpečnostné vzory a rámce správy
- Navrhnúť komplexné stratégie monitorovania a upozornení
- Optimalizovať produkčné nasadenia pre škálovateľnosť, náklady a výkon
- Zriadiť CI/CD pipeline s riadnym testovaním a validáciou

**Profesionálne zručnosti:**
- Viesť iniciatívy transformácie cloudu v podnikoch
- Navrhovať a implementovať organizačné štandardy nasadenia
- Školiť a mentorovať vývojové tímy v pokročilých praktikách AZD
- Ovplyvňovať technické rozhodovanie pre podnikové nasadenia AI

**Validácia učenia:**
- ✅ Riešiť komplexné zlyhania nasadenia viacerých služieb
- ✅ Implementovať podnikové bezpečnostné vzory s požiadavkami na súlad
- ✅ Navrhnúť a nasadiť produkčné monitorovanie pomocou Application Insights
- ✅ Dokončiť implementáciu rámca správy pre podnikové prostredie

## 🎯 Certifikácia dokončenia kurzu

### Rámec sledovania pokroku
Sledujte svoj pokrok v učení prostredníctvom štruktúrovaných kontrolných bodov:

- [ ] **Kapitola 1**: Základy a rýchly štart ✅
- [ ] **Kapitola 2**: Vývoj orientovaný na AI ✅  
- [ ] **Kapitola 3**: Konfigurácia a autentifikácia ✅
- [ ] **Kapitola 4**: Infraštruktúra ako kód a nasadenie ✅
- [ ] **Kapitola 5**: Riešenia s viacerými agentmi ✅
- [ ] **Kapitola 6**: Validácia a plánovanie pred nasadením ✅
- [ ] **Kapitola 7**: Riešenie problémov a ladenie ✅
- [ ] **Kapitola 8**: Produkčné a podnikové vzory ✅

### Proces verifikácie
Po dokončení každej kapitoly overte svoje znalosti prostredníctvom:

1. **Dokončenie praktických cvičení**: Nasadenie funkčných riešení pre každú kapitolu
2. **Hodnotenie znalostí**: Preštudovanie sekcií FAQ a dokončenie sebahodnotení
3. **Zapojenie komunity**: Zdieľanie skúseností a získanie spätnej väzby na Azure Discord
4. **Rozvoj portfólia**: Dokumentácia vašich nasadení a získaných poznatkov
5. **Recenzia od kolegov**: Spolupráca s ostatnými účastníkmi na komplexných scenároch

### Výhody dokončenia kurzu
Po dokončení všetkých kapitol s verifikáciou budú absolventi mať:

**Technickú odbornosť:**
- **Produkčné skúsenosti**: Nasadené reálne AI aplikácie do prostredí Azure
- **Profesionálne zručnosti**: Schopnosti na nasadenie a riešenie problémov v podnikových prostrediach  
- **Architektonické znalosti**: Riešenia s viacerými agentmi a komplexné infraštruktúrne vzory
- **Majstrovstvo v riešení problémov**: Samostatné riešenie problémov s nasadením a konfiguráciou

**Profesionálny rozvoj:**
- **Uznanie v odvetví**: Overiteľné zručnosti v oblasti AZD a nasadenia AI
- **Kariérny postup**: Kvalifikácia na role cloud architekta a špecialistu na nasadenie AI
- **Líderstvo v komunite**: Aktívne členstvo v komunitách vývojárov Azure a AI
- **Neustále učenie**: Základy pre pokročilú špecializáciu Azure AI Foundry

**Portfóliové aktíva:**
- **Nasadené riešenia**: Funkčné príklady AI aplikácií a infraštruktúrnych vzorov
- **Dokumentácia**: Komplexné návody na nasadenie a postupy riešenia problémov  
- **Príspevky do komunity**: Diskusie, príklady a vylepšenia zdieľané s komunitou Azure
- **Profesionálna sieť**: Spojenia s odborníkmi na Azure a praktiky nasadenia AI

### Cesta učenia po kurze
Absolventi sú pripravení na pokročilú špecializáciu v:
- **Azure AI Foundry Expert**: Hlboká špecializácia na nasadenie a orchestráciu AI modelov
- **Líderstvo v cloudovej architektúre**: Návrh a správa nasadení v podnikových prostrediach
- **Líderstvo v komunite vývojárov**: Príspevky do vzoriek Azure a komunitných zdrojov
- **Firemné školenia**: Výučba zručností AZD a nasadenia AI v organizáciách

---

