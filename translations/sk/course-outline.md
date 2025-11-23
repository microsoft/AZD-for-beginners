<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2a0861541126250c3558d667e9b13c50",
  "translation_date": "2025-11-23T11:28:45+00:00",
  "source_file": "course-outline.md",
  "language_code": "sk"
}
-->
# AZD pre začiatočníkov: Osnova kurzu a rámec učenia

## Prehľad kurzu

Ovládnite Azure Developer CLI (azd) prostredníctvom štruktúrovaných kapitol navrhnutých pre postupné učenie. **Špeciálny dôraz na nasadzovanie AI aplikácií s integráciou Microsoft Foundry.**

### Prečo je tento kurz nevyhnutný pre moderných vývojárov

Na základe poznatkov z komunity Microsoft Foundry Discord **45 % vývojárov chce používať AZD pre AI úlohy**, ale čelí výzvam s:
- Komplexnými AI architektúrami s viacerými službami
- Najlepšími postupmi pre nasadzovanie AI do produkcie  
- Integráciou a konfiguráciou Azure AI služieb
- Optimalizáciou nákladov na AI úlohy
- Riešením problémov špecifických pre nasadzovanie AI

### Hlavné ciele učenia

Po absolvovaní tohto štruktúrovaného kurzu budete:
- **Ovládať základy AZD**: Kľúčové koncepty, inštalácia a konfigurácia
- **Nasadzovať AI aplikácie**: Používať AZD s Microsoft Foundry službami
- **Implementovať infraštruktúru ako kód**: Spravovať Azure zdroje pomocou Bicep šablón
- **Riešiť problémy s nasadzovaním**: Odstraňovať bežné problémy a ladiť chyby
- **Optimalizovať pre produkciu**: Bezpečnosť, škálovanie, monitorovanie a riadenie nákladov
- **Budovať riešenia s viacerými agentmi**: Nasadzovať komplexné AI architektúry

## 🎓 Zážitok z workshopu

### Flexibilné možnosti učenia
Tento kurz je navrhnutý tak, aby podporoval **samostatné učenie vlastným tempom** aj **facilitované workshopy**, čo umožňuje účastníkom získať praktické skúsenosti s AZD prostredníctvom interaktívnych cvičení.

#### 🚀 Samostatné učenie
**Ideálne pre individuálnych vývojárov a kontinuálne vzdelávanie**

**Funkcie:**
- **Rozhranie v prehliadači**: Workshop poháňaný MkDocs dostupný cez akýkoľvek webový prehliadač
- **Integrácia s GitHub Codespaces**: Jedno kliknutie na vývojové prostredie s predkonfigurovanými nástrojmi
- **Interaktívne DevContainer prostredie**: Žiadna lokálna inštalácia - začnite kódovať okamžite
- **Sledovanie pokroku**: Zabudované kontrolné body a validačné cvičenia
- **Podpora komunity**: Prístup k Azure Discord kanálom na otázky a spoluprácu

**Štruktúra učenia:**
- **Flexibilný časový plán**: Dokončite kapitoly vlastným tempom počas dní alebo týždňov
- **Systém kontrolných bodov**: Overte si učenie pred prechodom na zložitejšie témy
- **Knižnica zdrojov**: Komplexná dokumentácia, príklady a návody na riešenie problémov
- **Rozvoj portfólia**: Vytvorte nasaditeľné projekty pre profesionálne portfólio

**Začiatok (samostatné učenie):**
```bash
# Možnosť 1: GitHub Codespaces (Odporúčané)
# Prejdite do repozitára a kliknite na "Code" → "Create codespace on main"

# Možnosť 2: Lokálny vývoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postupujte podľa pokynov na nastavenie v workshop/README.md
```

#### 🏛️ Facilitované workshopy
**Ideálne pre firemné školenia, bootcampy a vzdelávacie inštitúcie**

**Formáty workshopov:**

**📚 Integrácia do akademických kurzov (8-12 týždňov)**
- **Univerzitné programy**: Semestrálny kurz s týždennými 2-hodinovými stretnutiami
- **Bootcamp formát**: Intenzívny 3-5 dňový program s dennými 6-8 hodinovými stretnutiami
- **Firemné školenia**: Mesačné tímové stretnutia s praktickou implementáciou projektov
- **Rámec hodnotenia**: Hodnotené úlohy, recenzie od kolegov a záverečné projekty

**🚀 Intenzívny workshop (1-3 dni)**
- **1. deň**: Základy + AI vývoj (kapitoly 1-2) - 6 hodín
- **2. deň**: Konfigurácia + infraštruktúra (kapitoly 3-4) - 6 hodín  
- **3. deň**: Pokročilé vzory + produkcia (kapitoly 5-8) - 8 hodín
- **Následne**: Voliteľné 2-týždňové mentorstvo na dokončenie projektu

**⚡ Exekutívny brífing (4-6 hodín)**
- **Strategický prehľad**: Hodnota AZD a jeho dopad na podnikanie (1 hodina)
- **Praktická ukážka**: Nasadenie AI aplikácie od začiatku do konca (2 hodiny)
- **Prehľad architektúry**: Podnikové vzory a správa (1 hodina)
- **Plánovanie implementácie**: Stratégia prijatia v organizácii (1-2 hodiny)

#### 🛠️ Metodológia učenia na workshope
**Objavovanie → Nasadzovanie → Prispôsobenie pre rozvoj praktických zručností**

**Fáza 1: Objavovanie (45 minút)**
- **Preskúmanie šablón**: Hodnotenie šablón a služieb Azure AI Foundry
- **Analýza architektúry**: Pochopenie vzorov s viacerými agentmi a stratégií nasadzovania
- **Hodnotenie požiadaviek**: Identifikácia potrieb a obmedzení organizácie
- **Nastavenie prostredia**: Konfigurácia vývojového prostredia a Azure zdrojov

**Fáza 2: Nasadzovanie (2 hodiny)**
- **Riadená implementácia**: Krok za krokom nasadenie AI aplikácií s AZD
- **Konfigurácia služieb**: Nastavenie Azure AI služieb, koncových bodov a autentifikácie
- **Implementácia bezpečnosti**: Aplikácia podnikových bezpečnostných vzorov a kontrol prístupu
- **Testovanie a validácia**: Overenie nasadení a riešenie bežných problémov

**Fáza 3: Prispôsobenie (45 minút)**
- **Úprava aplikácie**: Prispôsobenie šablón pre špecifické prípady použitia a požiadavky
- **Optimalizácia pre produkciu**: Implementácia monitorovania, riadenia nákladov a stratégií škálovania
- **Pokročilé vzory**: Preskúmanie koordinácie viacerých agentov a komplexných architektúr
- **Plánovanie ďalších krokov**: Definovanie cesty učenia pre ďalší rozvoj zručností

#### 🎯 Výstupy z workshopu
**Merateľné zručnosti získané prostredníctvom praktického cvičenia**

**Technické kompetencie:**
- **Nasadzovanie produkčných AI aplikácií**: Úspešné nasadenie a konfigurácia AI riešení
- **Ovládanie infraštruktúry ako kódu**: Tvorba a správa vlastných Bicep šablón
- **Architektúra s viacerými agentmi**: Implementácia koordinovaných AI agentov
- **Pripravenosť na produkciu**: Aplikácia bezpečnostných, monitorovacích a riadiacich vzorov
- **Expertíza v riešení problémov**: Samostatné riešenie problémov s nasadzovaním a konfiguráciou

**Profesionálne zručnosti:**
- **Vedenie projektov**: Vedenie technických tímov pri cloudových iniciatívach
- **Návrh architektúry**: Návrh škálovateľných a nákladovo efektívnych Azure riešení
- **Prenos znalostí**: Školenie a mentorovanie kolegov v najlepších praktikách AZD
- **Strategické plánovanie**: Ovplyvňovanie stratégií prijatia cloudu v organizácii

#### 📋 Zdroje a materiály pre workshop
**Komplexná sada nástrojov pre facilitátorov a účastníkov**

**Pre facilitátorov:**
- **Príručka inštruktora**: [Príručka pre vedenie workshopu](workshop/docs/instructor-guide.md) - Tipy na plánovanie a vedenie stretnutí
- **Prezentácie**: Prezentácie, diagramy architektúry a skripty pre ukážky
- **Nástroje hodnotenia**: Praktické cvičenia, kontrolné otázky a hodnotiace rubriky
- **Technické nastavenie**: Konfigurácia prostredia, návody na riešenie problémov a záložné plány

**Pre účastníkov:**
- **Interaktívne prostredie workshopu**: [Materiály workshopu](workshop/README.md) - Platforma na učenie v prehliadači
- **Podrobné inštrukcie**: [Riadené cvičenia](../../workshop/docs/instructions) - Podrobné návody na implementáciu  
- **Referenčná dokumentácia**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Hĺbkové zameranie na AI
- **Komunitné zdroje**: Azure Discord kanály, GitHub diskusie a odborná podpora

#### 🏢 Implementácia workshopu pre podniky
**Stratégie nasadzovania a školenia v organizáciách**

**Firemné školiace programy:**
- **Onboarding vývojárov**: Orientácia nových zamestnancov so základmi AZD (2-4 týždne)
- **Zvyšovanie kvalifikácie tímov**: Štvrťročné workshopy pre existujúce vývojové tímy (1-2 dni)
- **Prehľad architektúry**: Mesačné stretnutia pre senior inžinierov a architektov (4 hodiny)
- **Brífingy pre vedenie**: Workshopy pre technických rozhodovateľov (pol dňa)

**Podpora implementácie:**
- **Dizajn prispôsobených workshopov**: Obsah prispôsobený špecifickým potrebám organizácie
- **Riadenie pilotného programu**: Štruktúrované zavedenie s metrikami úspechu a spätnou väzbou  
- **Pokračujúce mentorstvo**: Podpora po workshope pre implementáciu projektov
- **Budovanie komunity**: Interné komunity vývojárov Azure AI a zdieľanie znalostí

**Metriky úspechu:**
- **Získanie zručností**: Pred/po hodnotenia merajúce rast technických kompetencií
- **Úspešnosť nasadenia**: Percento účastníkov úspešne nasadzujúcich produkčné aplikácie
- **Čas do produktivity**: Skrátenie času na onboarding pre nové Azure AI projekty
- **Udržanie znalostí**: Následné hodnotenia 3-6 mesiacov po workshope

## Štruktúra učenia v 8 kapitolách

### Kapitola 1: Základy a rýchly štart (30-45 minút) 🌱
**Predpoklady**: Azure predplatné, základné znalosti príkazového riadku  
**Náročnosť**: ⭐

#### Čo sa naučíte
- Pochopenie základov Azure Developer CLI
- Inštalácia AZD na vašej platforme  
- Vaše prvé úspešné nasadenie
- Kľúčové koncepty a terminológia

#### Zdroje učenia
- [Základy AZD](docs/getting-started/azd-basics.md) - Kľúčové koncepty
- [Inštalácia a nastavenie](docs/getting-started/installation.md) - Platformovo špecifické návody
- [Váš prvý projekt](docs/getting-started/first-project.md) - Praktický tutoriál
- [Cheat Sheet príkazov](resources/cheat-sheet.md) - Rýchly odkaz

#### Praktický výsledok
Úspešne nasadíte jednoduchú webovú aplikáciu na Azure pomocou AZD

---

### Kapitola 2: Vývoj orientovaný na AI (1-2 hodiny) 🤖
**Predpoklady**: Dokončená kapitola 1  
**Náročnosť**: ⭐⭐

#### Čo sa naučíte
- Integrácia Microsoft Foundry s AZD
- Nasadzovanie AI aplikácií
- Pochopenie konfigurácií AI služieb
- Vzory RAG (Retrieval-Augmented Generation)

#### Zdroje učenia
- [Integrácia Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [Nasadzovanie AI modelov](docs/microsoft-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - **NOVÉ**: Komplexný 2-3 hodinový praktický lab
- [Interaktívny sprievodca workshopom](workshop/README.md) - **NOVÉ**: Workshop v prehliadači s náhľadom MkDocs
- [Šablóny Microsoft Foundry](README.md#featured-microsoft-foundry-templates)
- [Inštrukcie workshopu](../../workshop/docs/instructions) - **NOVÉ**: Podrobné riadené cvičenia

#### Praktický výsledok
Nasadíte a nakonfigurujete AI aplikáciu na chatovanie s funkciami RAG

#### Učebná cesta workshopu (voliteľné rozšírenie)
**NOVÝ interaktívny zážitok**: [Kompletný sprievodca workshopom](workshop/README.md)
1. **Objavovanie** (30 min): Výber a hodnotenie šablón
2. **Nasadzovanie** (45 min): Nasadenie a overenie funkčnosti AI šablóny  
3. **Rozbor** (30 min): Pochopenie architektúry a komponentov šablóny
4. **Konfigurácia** (30 min): Prispôsobenie nastavení a parametrov
5. **Prispôsobenie** (45 min): Úprava a iterácia podľa vašich potrieb
6. **Odstránenie** (15 min): Vyčistenie zdrojov a pochopenie životného cyklu
7. **Záver** (15 min): Ďalšie kroky a pokročilé učebné cesty

---

### Kapitola 3: Konfigurácia a autentifikácia (45-60 minút) ⚙️
**Predpoklady**: Dokončená kapitola 1  
**Náročnosť**: ⭐⭐

#### Čo sa naučíte
- Konfigurácia a správa prostredia
- Najlepšie postupy pre autentifikáciu a bezpečnosť
- Názvoslovie a organizácia zdrojov
- Nasadzovanie do viacerých prostredí

#### Zdroje učenia
- [Sprievodca konfiguráciou](docs/getting-started/configuration.md) - Nastavenie prostredia
- [Vzory autentifikácie a bezpečnosti](docs/getting-started/authsecurity.md) - Integrácia Managed Identity a Key Vault
- Príklady pre viaceré prostredia

#### Praktický výsledok
Spravujete viaceré prostredia s riadnou autentifikáciou a bezpečnosťou

---

### Kapitola 4: Infraštruktúra ako kód a nasadzovanie (1-1,5 hodiny) 🏗️
**Predpoklady**: Dokončené kapitoly 1-3  
**Náročnosť**: ⭐⭐⭐

#### Čo sa naučíte
- Pokročilé vzory nasadzovania
- Infraštruktúra ako kód s Bicep
- Stratégie pre provisionovanie zdrojov
- Tvorba vlastných šablón

- Nasadzovanie kontajnerových aplikácií s Azure Container Apps a AZD

#### Zdroje učenia
- [Sprievodca nasadzovaním](docs/deployment/deployment-guide.md) - Kompletné pracovné postupy
- [Provisionovanie zdrojov](docs/deployment/provisioning.md) - Správa zdrojov
- Príklady kontajnerov a mikroslužieb
- [Príklady kontajnerových aplikácií](examples/container-app/README.md) - Rýchly štart, produkcia a pokročilé vzory nasadzovania

#### Praktický výsledok
Nasadíte komplexné aplikácie s viacerými službami pomocou vlastných infraštruktúrnych šablón

---

### Kapitola 5: Riešenia s viacerými AI agentmi (2-3 hodiny) 🤖🤖
**Predpoklady**: Dokončené kapitoly 1-2  
**Náročnosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Vzory architektúry s viacerými agentmi
- Orchestrácia a koordinácia agentov
- Produkčne pripravené AI nasadenia
- Implementácie agentov pre zákazníkov a inventár

-
Overte a optimalizujte nasadenia pred ich vykonaním

---

### Kapitola 7: Riešenie problémov a ladenie (1-1,5 hodiny) 🔧
**Predpoklady**: Dokončená akákoľvek kapitola o nasadení  
**Náročnosť**: ⭐⭐

#### Čo sa naučíte
- Systematické prístupy k ladeniu
- Bežné problémy a ich riešenia
- Riešenie problémov špecifických pre AI
- Optimalizácia výkonu

#### Zdroje na učenie
- [Bežné problémy](docs/troubleshooting/common-issues.md) - FAQ a riešenia
- [Príručka na ladenie](docs/troubleshooting/debugging.md) - Krok za krokom stratégie
- [Riešenie problémov špecifických pre AI](docs/troubleshooting/ai-troubleshooting.md) - Problémy s AI službami

#### Praktický výsledok
Samostatne diagnostikovať a riešiť bežné problémy s nasadením

---

### Kapitola 8: Produkčné a podnikové vzory (2-3 hodiny) 🏢
**Predpoklady**: Dokončené kapitoly 1-4  
**Náročnosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Stratégie produkčného nasadenia
- Bezpečnostné vzory pre podniky
- Monitorovanie a optimalizácia nákladov
- Škálovateľnosť a správa

- Najlepšie postupy pre produkčné nasadenie aplikácií v kontajneroch (bezpečnosť, monitorovanie, náklady, CI/CD)

#### Zdroje na učenie
- [Najlepšie postupy pre produkčné AI](docs/microsoft-foundry/production-ai-practices.md) - Podnikové vzory
- Príklady mikroservisov a podnikových aplikácií
- Rámce monitorovania a správy
- [Príklad architektúry mikroservisov](../../examples/container-app/microservices) - Blue-green/canary nasadenie, distribuované sledovanie a optimalizácia nákladov

#### Praktický výsledok
Nasadiť aplikácie pripravené na podnikové prostredie s plnými produkčnými schopnosťami

---

## Postup učenia a náročnosť

### Postupné budovanie zručností

- **🌱 Začiatočníci**: Začnite s kapitolou 1 (Základy) → Kapitola 2 (Vývoj AI)
- **🔧 Stredne pokročilí**: Kapitoly 3-4 (Konfigurácia a infraštruktúra) → Kapitola 6 (Validácia)
- **🚀 Pokročilí**: Kapitola 5 (Riešenia s viacerými agentmi) → Kapitola 7 (Riešenie problémov)
- **🏢 Podnikové prostredie**: Dokončite všetky kapitoly, zamerajte sa na kapitolu 8 (Produkčné vzory)

- **Cesta aplikácií v kontajneroch**: Kapitoly 4 (Nasadenie v kontajneroch), 5 (Integrácia mikroservisov), 8 (Najlepšie postupy pre produkciu)

### Indikátory náročnosti

- **⭐ Základné**: Jednoduché koncepty, vedené tutoriály, 30-60 minút
- **⭐⭐ Stredne pokročilé**: Viacero konceptov, praktické cvičenia, 1-2 hodiny  
- **⭐⭐⭐ Pokročilé**: Komplexné architektúry, vlastné riešenia, 1-3 hodiny
- **⭐⭐⭐⭐ Expertné**: Produkčné systémy, podnikové vzory, 2-4 hodiny

### Flexibilné cesty učenia

#### 🎯 Rýchla cesta pre vývojárov AI (4-6 hodín)
1. **Kapitola 1**: Základy a rýchly štart (45 minút)
2. **Kapitola 2**: Vývoj zameraný na AI (2 hodiny)  
3. **Kapitola 5**: Riešenia s viacerými agentmi AI (3 hodiny)
4. **Kapitola 8**: Najlepšie postupy pre produkčné AI (1 hodina)

#### 🛠️ Cesta špecialistu na infraštruktúru (5-7 hodín)
1. **Kapitola 1**: Základy a rýchly štart (45 minút)
2. **Kapitola 3**: Konfigurácia a autentifikácia (1 hodina)
3. **Kapitola 4**: Infraštruktúra ako kód a nasadenie (1,5 hodiny)
4. **Kapitola 6**: Validácia a plánovanie pred nasadením (1 hodina)
5. **Kapitola 7**: Riešenie problémov a ladenie (1,5 hodiny)
6. **Kapitola 8**: Produkčné a podnikové vzory (2 hodiny)

#### 🎓 Kompletná cesta učenia (8-12 hodín)
Postupné dokončenie všetkých 8 kapitol s praktickými cvičeniami a validáciou

## Rámec dokončenia kurzu

### Validácia vedomostí
- **Kontrolné body kapitol**: Praktické cvičenia s merateľnými výsledkami
- **Praktická verifikácia**: Nasadenie funkčných riešení pre každú kapitolu
- **Sledovanie pokroku**: Vizualizácia pokroku a odznaky za dokončenie
- **Validácia komunity**: Zdieľanie skúseností na Discord kanáloch Azure

### Hodnotenie výsledkov učenia

#### Dokončenie kapitol 1-2 (Základy + AI)
- ✅ Nasadiť základnú webovú aplikáciu pomocou AZD
- ✅ Nasadiť AI aplikáciu na chat s RAG
- ✅ Pochopiť základné koncepty AZD a integráciu AI

#### Dokončenie kapitol 3-4 (Konfigurácia + infraštruktúra)  
- ✅ Spravovať nasadenia vo viacerých prostrediach
- ✅ Vytvoriť vlastné šablóny infraštruktúry pomocou Bicep
- ✅ Implementovať bezpečné autentifikačné vzory

#### Dokončenie kapitol 5-6 (Viac agentov + validácia)
- ✅ Nasadiť komplexné riešenie s viacerými agentmi AI
- ✅ Vykonať plánovanie kapacity a optimalizáciu nákladov
- ✅ Implementovať automatizovanú validáciu pred nasadením

#### Dokončenie kapitol 7-8 (Riešenie problémov + produkcia)
- ✅ Samostatne riešiť problémy s nasadením  
- ✅ Implementovať monitorovanie a bezpečnosť na podnikovej úrovni
- ✅ Nasadiť aplikácie pripravené na produkciu s riadením

### Certifikácia a uznanie
- **Odznak za dokončenie kurzu**: Dokončite všetkých 8 kapitol s praktickou validáciou
- **Uznanie komunity**: Aktívna účasť na Discorde Microsoft Foundry
- **Profesionálny rozvoj**: Relevantné zručnosti v oblasti AZD a nasadenia AI
- **Kariérny postup**: Schopnosti na nasadenie cloudových riešení na podnikovej úrovni

## 🎓 Komplexné výsledky učenia

### Úroveň základov (Kapitoly 1-2)
Po dokončení základných kapitol budú študenti schopní:

**Technické schopnosti:**
- Nasadiť jednoduché webové aplikácie na Azure pomocou príkazov AZD
- Konfigurovať a nasadiť AI aplikácie na chat s RAG funkciami
- Pochopiť základné koncepty AZD: šablóny, prostredia, pracovné postupy
- Integrovať služby Microsoft Foundry s nasadeniami AZD
- Navigovať konfigurácie služieb Azure AI a API endpointy

**Profesionálne zručnosti:**
- Dodržiavať štruktúrované pracovné postupy nasadenia pre konzistentné výsledky
- Riešiť základné problémy s nasadením pomocou logov a dokumentácie
- Efektívne komunikovať o procesoch nasadenia do cloudu
- Aplikovať najlepšie postupy pre bezpečnú integráciu AI služieb

**Validácia učenia:**
- ✅ Úspešne nasadiť šablónu `todo-nodejs-mongo`
- ✅ Nasadiť a konfigurovať `azure-search-openai-demo` s RAG
- ✅ Dokončiť interaktívne cvičenia workshopu (Fáza objavovania)
- ✅ Zúčastniť sa diskusií komunity na Azure Discord

### Úroveň stredne pokročilých (Kapitoly 3-4)
Po dokončení stredne pokročilých kapitol budú študenti schopní:

**Technické schopnosti:**
- Spravovať nasadenia vo viacerých prostrediach (dev, staging, produkcia)
- Vytvoriť vlastné šablóny Bicep pre infraštruktúru ako kód
- Implementovať bezpečné autentifikačné vzory s riadenou identitou
- Nasadiť komplexné aplikácie s viacerými službami a vlastnými konfiguráciami
- Optimalizovať stratégie poskytovania zdrojov pre náklady a výkon

**Profesionálne zručnosti:**
- Navrhovať škálovateľné architektúry infraštruktúry
- Implementovať bezpečnostné najlepšie postupy pre nasadenia do cloudu
- Dokumentovať vzory infraštruktúry pre tímovú spoluprácu
- Hodnotiť a vyberať vhodné služby Azure pre požiadavky

**Validácia učenia:**
- ✅ Konfigurovať samostatné prostredia s nastaveniami špecifickými pre prostredie
- ✅ Vytvoriť a nasadiť vlastnú šablónu Bicep pre aplikáciu s viacerými službami
- ✅ Implementovať autentifikáciu riadenou identitou pre bezpečný prístup
- ✅ Dokončiť cvičenia na správu konfigurácie s reálnymi scenármi

### Úroveň pokročilých (Kapitoly 5-6)
Po dokončení pokročilých kapitol budú študenti schopní:

**Technické schopnosti:**
- Nasadiť a koordinovať riešenia s viacerými agentmi AI s koordinovanými pracovnými postupmi
- Implementovať architektúry agentov pre zákazníkov a inventár pre maloobchodné scenáre
- Vykonať komplexné plánovanie kapacity a validáciu zdrojov
- Vykonať automatizovanú validáciu pred nasadením a optimalizáciu
- Navrhnúť nákladovo efektívne výbery SKU na základe požiadaviek pracovného zaťaženia

**Profesionálne zručnosti:**
- Navrhovať komplexné AI riešenia pre produkčné prostredia
- Viesť technické diskusie o stratégiách nasadenia AI
- Mentorovať junior vývojárov v najlepších postupoch AZD a nasadenia AI
- Hodnotiť a odporúčať architektonické vzory AI pre obchodné požiadavky

**Validácia učenia:**
- ✅ Nasadiť kompletné maloobchodné riešenie s viacerými agentmi pomocou ARM šablón
- ✅ Demonštrovať koordináciu agentov a orchestráciu pracovných postupov
- ✅ Dokončiť cvičenia na plánovanie kapacity s reálnymi obmedzeniami zdrojov
- ✅ Validovať pripravenosť nasadenia prostredníctvom automatizovaných kontrol

### Úroveň expertov (Kapitoly 7-8)
Po dokončení expertných kapitol budú študenti schopní:

**Technické schopnosti:**
- Diagnostikovať a riešiť komplexné problémy s nasadením samostatne
- Implementovať bezpečnostné vzory na podnikovej úrovni a rámce správy
- Navrhnúť komplexné stratégie monitorovania a upozornení
- Optimalizovať produkčné nasadenia pre škálovateľnosť, náklady a výkon
- Zriadiť CI/CD pipeline s riadnym testovaním a validáciou

**Profesionálne zručnosti:**
- Viesť iniciatívy transformácie cloudu na podnikovej úrovni
- Navrhovať a implementovať organizačné štandardy nasadenia
- Školiť a mentorovať vývojové tímy v pokročilých postupoch AZD
- Ovplyvňovať technické rozhodnutia pre podnikové nasadenia AI

**Validácia učenia:**
- ✅ Riešiť komplexné zlyhania nasadenia aplikácií s viacerými službami
- ✅ Implementovať bezpečnostné vzory na podnikovej úrovni s požiadavkami na súlad
- ✅ Navrhnúť a nasadiť monitorovanie produkcie pomocou Application Insights
- ✅ Dokončiť implementáciu rámca správy na podnikovej úrovni

## 🎯 Certifikácia dokončenia kurzu

### Rámec sledovania pokroku
Sledujte svoj pokrok v učení prostredníctvom štruktúrovaných kontrolných bodov:

- [ ] **Kapitola 1**: Základy a rýchly štart ✅
- [ ] **Kapitola 2**: Vývoj zameraný na AI ✅  
- [ ] **Kapitola 3**: Konfigurácia a autentifikácia ✅
- [ ] **Kapitola 4**: Infraštruktúra ako kód a nasadenie ✅
- [ ] **Kapitola 5**: Riešenia s viacerými agentmi AI ✅
- [ ] **Kapitola 6**: Validácia a plánovanie pred nasadením ✅
- [ ] **Kapitola 7**: Riešenie problémov a ladenie ✅
- [ ] **Kapitola 8**: Produkčné a podnikové vzory ✅

### Proces verifikácie
Po dokončení každej kapitoly overte svoje vedomosti prostredníctvom:

1. **Dokončenie praktických cvičení**: Nasadenie funkčných riešení pre každú kapitolu
2. **Hodnotenie vedomostí**: Preštudovanie sekcií FAQ a dokončenie sebahodnotení
3. **Zapojenie komunity**: Zdieľanie skúseností a získanie spätnej väzby na Discorde Azure
4. **Rozvoj portfólia**: Dokumentovanie vašich nasadení a naučených lekcií
5. **Recenzia od kolegov**: Spolupráca s ostatnými študentmi na komplexných scenároch

### Výhody dokončenia kurzu
Po dokončení všetkých kapitol s verifikáciou budú absolventi mať:

**Technickú odbornosť:**
- **Produkčné skúsenosti**: Nasadené reálne AI aplikácie do prostredí Azure
- **Profesionálne zručnosti**: Schopnosti na nasadenie a riešenie problémov na podnikovej úrovni  
- **Architektonické znalosti**: Riešenia s viacerými agentmi AI a komplexné infraštruktúrne vzory
- **Majstrovstvo v riešení problémov**: Samostatné riešenie problémov s nasadením a konfiguráciou

**Profesionálny rozvoj:**
- **Uznanie v odvetví**: Overiteľné zručnosti v oblastiach AZD a nasadenia AI s vysokým dopytom
- **Kariérny postup**: Kvalifikácia na role cloudového architekta a špecialistu na nasadenie AI
- **Líderstvo v komunite**: Aktívne členstvo v komunitách vývojárov Azure a AI
- **Neustále učenie**: Základy pre pokročilú špecializáciu Microsoft Foundry

**Portfóliové aktíva:**
- **Nasadené riešenia**: Funkčné príklady AI aplikácií a infraštruktúrnych vzorov
- **Dokumentácia**: Komplexné príručky na nasadenie a postupy riešenia problémov  
- **Príspevky komunity**: Diskusie, príklady a vylepšenia zdieľané s komunitou Azure
- **Profesionálna sieť**: Spojenia s odborníkmi na Azure a praktizujúcimi v oblasti nasadenia AI

### Cesta učenia po kurze
Absolventi sú pripravení na pokročilú špecializáciu v:
- **Expert Microsoft Foundry**: Hlboká špecializácia na nasadenie a orchestráciu AI modelov
- **Líderstvo v architektúre cloudu**: Návrh a správa nasadení na podnikovej úrovni
- **Líderstvo v komunite vývojárov**: Príspevky do vzoriek Azure a komunitných zdrojov
- **Firemné školenia**: Výučba zručností AZD a nasadenia AI v organizáciách

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->