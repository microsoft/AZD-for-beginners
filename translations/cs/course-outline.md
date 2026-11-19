# AZD pro začátečníky: Osnova kurzu a rámec učení

## Přehled kurzu

Ovládněte Azure Developer CLI (azd) prostřednictvím strukturovaných kapitol navržených pro postupné učení. **Zvláštní zaměření na nasazování AI aplikací s integrací Microsoft Foundry.**

### Proč je tento kurz nezbytný pro moderní vývojáře

Vývojáři nasazující AI pracovní zátěže často potřebují vedení v oblastech:
- Komplexní více-službové AI architektury
- Nejlepší praktiky nasazení AI do produkce  
- Integrace a konfigurace Azure AI služeb
- Optimalizace nákladů pro AI pracovní zátěže
- Řešení problémů specifických pro nasazení AI

### Základní cíle učení

Dokončením tohoto strukturovaného kurzu budete:
- **Ovládat základy AZD**: Základní koncepty, instalace a konfigurace
- **Nasazovat AI aplikace**: Používat AZD s Microsoft Foundry službami
- **Implementovat Infrastructure as Code**: Spravovat Azure zdroje pomocí Bicep šablon
- **Řešit problémy s nasazením**: Odstraňovat běžné problémy a ladit chyby
- **Optimalizovat pro produkci**: Zabezpečení, škálování, monitorování a správa nákladů
- **Vytvářet multi-agentní řešení**: Nasazovat komplexní AI architektury

## 🎓 Workshop - zážitková výuka

### Flexibilní možnosti výuky
Tento kurz je navržen tak, aby podporoval jak **samostudium vlastním tempem**, tak **řízené workshopy**, které umožňují praktické zkušenosti s AZD a rozvoj dovedností prostřednictvím interaktivních cvičení.

#### 🚀 Samostudium vlastním tempem
**Ideální pro jednotlivé vývojáře a kontinuální vzdělávání**

**Vlastnosti:**
- **Rozhraní přes webový prohlížeč**: Kompletní workshop poháněný MkDocs přístupný přes libovolný webový prohlížeč
- **Integrace GitHub Codespaces**: Vývojové prostředí na jedno kliknutí s předkonfigurovanými nástroji
- **Interaktivní DevContainer prostředí**: Není potřeba lokální konfigurace – začněte okamžitě programovat
- **Sledování pokroku**: Vestavěné kontrolní body a validační cvičení
- **Podpora komunity**: Přístup k Azure Discord kanálům pro dotazy a spolupráci

**Struktura učení:**
- **Flexibilní časování**: Dokončujte kapitoly vlastním tempem během dnů či týdnů
- **Systém kontrolních bodů**: Ověřujte znalosti před postupem k složitějším tématům
- **Knihovna zdrojů**: Kompletní dokumentace, příklady a návody na řešení problémů
- **Budování portfolia**: Tvořte projekty vhodné k předvedení ve profesním portfoliu

**Začínáme (samostudium):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Řízené workshopy
**Ideální pro firemní školení, bootcampy a vzdělávací instituce**

**Možnosti formátu workshopů:**

**📚 Začlenění do akademického kurzu (8-12 týdnů)**
- **Vysokoškolské programy**: Semestrální kurz s týdenními 2 hodinovými lekcemi
- **Bootcamp formát**: Intenzivní 3-5 denní program s denními 6-8 hodinovými lekcemi
- **Firemní školení**: Měsíční týmové lekce s praktickou realizací projektů
- **Hodnotící rámec**: Hodnocené úkoly, recenze od kolegů a závěrečné projekty

**🚀 Intenzivní workshop (1-3 dny)**
- **Den 1**: Základy + AI vývoj (kapitoly 1-2) - 6 hodin
- **Den 2**: Konfigurace + infrastruktura (kapitoly 3-4) - 6 hodin  
- **Den 3**: Pokročilé vzory + produkce (kapitoly 5-8) - 8 hodin
- **Následná podpora**: Volitelné 2týdenní mentorství pro dokončení projektu

**⚡ Exekutivní briefing (4-6 hodin)**
- **Strategický přehled**: Hodnota AZD a obchodní dopad (1 hodina)
- **Praktická ukázka**: End-to-end nasazení AI aplikace (2 hodiny)
- **Revize architektury**: Podnikové vzory a řízení (1 hodina)
- **Plán implementace**: Strategie adopce v organizaci (1-2 hodiny)

#### 🛠️ Metodika výuky workshopu
**Postup Objevování → Nasazení → Přizpůsobení pro rozvoj praktických dovedností**

**Fáze 1: Objevování (45 minut)**
- **Prozkoumání šablon**: Hodnocení šablon a služeb Microsoft Foundry
- **Analýza architektury**: Porozumění multi-agentním vzorům a strategiím nasazení
- **Hodnocení požadavků**: Identifikace potřeb a omezení organizace
- **Nastavení prostředí**: Konfigurace vývojového prostředí a Azure zdrojů

**Fáze 2: Nasazení (2 hodiny)**
- **Řízená implementace**: Krok za krokem nasazení AI aplikací pomocí AZD
- **Konfigurace služeb**: Nastavení Azure AI služeb, koncových bodů a autentizace
- **Zabezpečení**: Aplikace podnikových bezpečnostních vzorů a řízení přístupu
- **Testování validace**: Ověření nasazení a řešení běžných problémů

**Fáze 3: Přizpůsobení (45 minut)**
- **Modifikace aplikace**: Přizpůsobení šablon specifickým případům a požadavkům
- **Optimalizace pro produkci**: Implementace monitorování, správy nákladů a škálování
- **Pokročilé vzory**: Prozkoumání koordinace multi-agentů a komplexních architektur
- **Plánování dalších kroků**: Definice cesty dalšího rozvoje dovedností

#### 🎯 Výsledky učení workshopu
**Měřitelné dovednosti získané praktickým tréninkem**

**Technické kompetence:**
- **Nasadit produkční AI aplikace**: Úspěšně nasadit a nakonfigurovat AI řešení
- **Ovládání Infrastructure as Code**: Vytvářet a spravovat vlastní Bicep šablony
- **Multi-agentní architektura**: Implementovat koordinovaná AI agentní řešení
- **Produkční připravenost**: Aplikovat bezpečnostní, monitorovací a řídící vzory
- **Expertíza v řešení problémů**: Samostatně vyřešit problémy s nasazením a konfigurací

**Profesní dovednosti:**
- **Vedení projektů**: Vést technické týmy v iniciativách cloudového nasazení
- **Návrh architektury**: Navrhovat škálovatelná a nákladově efektivní Azure řešení
- **Přenos znalostí**: Školit a mentorovat kolegy v nejlepších praktikách AZD
- **Strategické plánování**: Ovlivňovat organizační strategie adopce cloudu

#### 📋 Materiály a zdroje workshopu
**Komplexní nástroje pro facilitátory i účastníky**

**Pro facilitátory:**
- **Průvodce instruktora**: [Přehled workshopu](workshop/README.md) - Plánování a vedení lekcí
- **Prezentační materiály**: Prezentační sady slidů, diagramy architektury a skripty demo ukázek
- **Nástroje pro hodnocení**: Praktická cvičení, testy znalostí a hodnotící škály
- **Technické nastavení**: Konfigurace prostředí, návody na řešení potíží a záložní plány

**Pro účastníky:**
- **Interaktivní workshopy**: [Materiály workshopu](workshop/README.md) - Webová vzdělávací platforma
- **Podrobné instrukce**: [Průvodce cvičeními](../../workshop/docs/instructions) - Detailní implementační postupy  
- **Referenční dokumentace**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Hloubkové materiály zaměřené na AI
- **Zdroje komunity**: Azure Discord kanály, GitHub diskuze a expertní podpora

#### 🏢 Implementace workshopů ve firmách
**Strategie nasazení a školení v organizacích**

**Firemní školicí programy:**
- **Zaškolení vývojářů**: Orientace nových zaměstnanců na AZD základy (2-4 týdny)
- **Zvyšování kvalifikace týmů**: Čtvrtletní workshopy pro stávající vývojové týmy (1-2 dny)
- **Revize architektury**: Měsíční sezení pro senior inženýry a architekty (4 hodiny)
- **Briefingy pro vedení**: Exekutivní workshopy pro technické rozhodující (půldenní)

**Podpora implementace:**
- **Navržení workshopu na míru**: Přizpůsobený obsah pro konkrétní potřeby organizace
- **Řízení pilotního programu**: Strukturované zavedení s metrikami úspěšnosti a zpětnou vazbou  
- **Průběžné mentorování**: Podpora po workshopu při realizaci projektů
- **Budování komunity**: Interní Azure AI vývojářské komunity a sdílení znalostí

**Metriky úspěšnosti:**
- **Získávání dovedností**: Testy před a po měřící růst technických kompetencí
- **Úspěšnost nasazení**: Procento účastníků úspěšně nasazujících produkční aplikace
- **Doba do produktivity**: Zkrácení doby zaškolení pro nové Azure AI projekty
- **Zachování znalostí**: Následná hodnocení 3-6 měsíců po workshopu

## Struktura učení ve 8 kapitolách

### Kapitola 1: Základy & Rychlý start (30-45 minut) 🌱
**Předpoklady**: Azure předplatné, základní znalost příkazové řádky  
**Složitost**: ⭐

#### Co se naučíte
- Porozumět základům Azure Developer CLI
- Instalace AZD na vaši platformu  
- Úspěšné první nasazení
- Základní koncepty a terminologie

#### Zdroje pro učení
- [AZD základy](docs/chapter-01-foundation/azd-basics.md) - Základní koncepty
- [Instalace a nastavení](docs/chapter-01-foundation/installation.md) - Platformově specifické návody
- [Váš první projekt](docs/chapter-01-foundation/first-project.md) - Praktický tutoriál
- [Příkazový rychlokurz](resources/cheat-sheet.md) - Rychlá reference

#### Praktický výsledek
Úspěšné nasazení jednoduché webové aplikace do Azure pomocí AZD

---

### Kapitola 2: Vývoj orientovaný na AI (4-5 hodin včetně workshopu) 🤖
**Předpoklady**: Dokončená kapitola 1  
**Složitost**: ⭐⭐

#### Co se naučíte
- Integrace Microsoft Foundry s AZD
- Instalace GA `microsoft.foundry` balíčku a nasazení hostovaného agenta
- Testování lokálního agenta Inspector a samostatná hodnotící data/schémata
- Nasazení AI aplikací
- Porozumění konfiguracím AI služeb
- RAG (Retrieval-Augmented Generation) vzory

#### Zdroje pro učení
- [Integrace Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [Procházení hostovaného agenta (GA)](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) - Inicializace, recenze `azure.yaml`, provisioning, lokální test, nasazení, hodnocení a vyčištění
- [Průvodce AI agenty](docs/chapter-02-ai-development/agents.md)
- [Nasazení AI modelů](docs/chapter-02-ai-development/ai-model-deployment.md)
- [Laboratoř AI workshopu](docs/chapter-02-ai-development/ai-workshop-lab.md) - **NOVINKA**: Komplexní 2-3 hodinová praktická laboratoř
- [Interaktivní průvodce workshopem](workshop/README.md) - **NOVINKA**: Workshop založený na webovém rozhraní s náhledem MkDocs
- [Microsoft Foundry šablony](README.md#featured-microsoft-foundry-templates)
- [Instrukce k workshopu](../../workshop/docs/instructions) - **NOVINKA**: Krok za krokem vedená cvičení

#### Praktický výsledek
Otestovat hostovaného agenta lokálně i v Foundry s využitím GA balíčku, zkontrolovat vyhodnocení a rozlišit čištění nových a opakovaně použitých projektů. Samostatná RAG/workshopová cesta pokrývá konfiguraci AI chat aplikace.

#### Workshopová učební cesta (volitelné rozšíření)
**NOVÝ interaktivní zážitek**: [Kompletní průvodce workshopem](workshop/README.md)
1. **Objevování** (30 min): Výběr a hodnocení šablon
2. **Nasazení** (45 min): Nasazení a ověření funkčnosti AI šablony  
3. **De-konstruování** (30 min): Porozumění architektuře a komponentám šablony
4. **Konfigurace** (30 min): Přizpůsobení nastavení a parametrů
5. **Přizpůsobení** (45 min): Úpravy a iterace pro vlastní řešení
6. **Ukliďte** (15 min): Vyčištění zdrojů a porozumění životnímu cyklu
7. **Závěr** (15 min): Další kroky a pokročilé učební cesty

---

### Kapitola 3: Konfigurace a autentizace (45-60 minut) ⚙️
**Předpoklady**: Dokončená kapitola 1  
**Složitost**: ⭐⭐

#### Co se naučíte
- Konfigurace a správa prostředí
- Nejlepší praxe autentizace a zabezpečení
- Pojmenování a organizace zdrojů
- Nasazení v několika prostředích

#### Zdroje pro učení
- [Průvodce konfigurací](docs/chapter-03-configuration/configuration.md) - Nastavení prostředí
- [Vzory autentizace a zabezpečení](docs/chapter-03-configuration/authsecurity.md) - Spravovaná identita a integrace Key Vaultu
- Příklady s více prostředími

#### Praktický výsledek
Spravovat více prostředí s řádnou autentizací a zabezpečením

---

### Kapitola 4: Infrastructure as Code a nasazení (1-1,5 hodiny) 🏗️
**Předpoklady**: Dokončené kapitoly 1-3  
**Složitost**: ⭐⭐⭐

#### Co se naučíte
- Pokročilé vzory nasazení
- Infrastructure as Code s Bicep
- Strategie poskytování zdrojů
- Vytváření vlastních šablon

- Nasazení kontejnerizovaných aplikací pomocí Azure Container Apps a AZD

#### Zdroje pro učení
- [Průvodce nasazením](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletní pracovní postupy
- [Poskytování zdrojů](docs/chapter-04-infrastructure/provisioning.md) - Správa zdrojů
- Příklady kontejnerů a mikroservis
- [Příklady Container Apps](examples/container-app/README.md) - Rychlý start, produkce a pokročilé vzory nasazení

#### Praktický výsledek
Nasadit komplexní více-službové aplikace pomocí vlastních šablon infrastruktury

---

### Kapitola 5: Multi-agentní AI řešení (2-3 hodiny) 🤖🤖
**Předpoklady**: Dokončené kapitoly 1-2  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Vzory multi-agentní architektury
- Orchestrace a koordinace agentů
- Produkčně připravená AI nasazení
- Implementace agentů pro zákazníky a inventář

- Integrace kontejnerizovaných mikroservis jako součást agentních řešení

#### Zdroje pro učení
- [Řešení pro retail multi-agent](examples/retail-scenario.md) - Architektonický plán, nikoliv kompletní aplikace
- [Balíček ARM šablon](../../examples/retail-multiagent-arm-template) - Infrastrukturální kostra s předpoklady implementace
- Vzory koordinace multi-agentů
- [Příklad mikroservisní architektury](../../examples/container-app/microservices) - Komunikace služba ke službě, asynchronní zprávy a produkční nasazení

#### Praktický výsledek
Navrhnout multi-agentní AI řešení a identifikovat implementační, validační a provozní činnosti aplikace nad rámec poskytování infrastruktury

---

### Kapitola 6: Validace a plánování před nasazením (1 hodina) 🔍
**Předpoklady**: Dokončená kapitola 4  
**Složitost**: ⭐⭐

#### Co se naučíte
- Plánování kapacity a ověření zdrojů
- Strategie výběru SKU
- Kontroly před nasazením a automatizace
- Plánování optimalizace nákladů

#### Zdroje pro učení
- [Plánování kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) - Ověření zdrojů
- [Výběr SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Nákladově efektivní volby
- [Kontroly před letem](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizované skripty
- [Integrace Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorování a dohledatelnost
- [Vzorce koordinace více agentů](docs/chapter-06-pre-deployment/coordination-patterns.md) - Strategie orchestraci agentů

#### Praktický výsledek
Ověření a optimalizace nasazení před spuštěním

---

### Kapitola 7: Řešení problémů a ladění (1-1,5 hodiny) 🔧
**Požadavky**: Dokončena jakákoli kapitola o nasazení  
**Náročnost**: ⭐⭐

#### Co se naučíte
- Systematické přístupy k ladění
- Běžné problémy a řešení
- Řešení problémů specifických pro AI
- Optimalizace výkonu

#### Výukové zdroje
- [Běžné problémy](docs/chapter-07-troubleshooting/common-issues.md) - Často kladené otázky a řešení
- [Průvodce laděním](docs/chapter-07-troubleshooting/debugging.md) - Krok za krokem strategie
- [Řešení problémů AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problémy AI služeb

#### Praktický výsledek
Samostatná diagnostika a řešení běžných problémů s nasazením

---

### Kapitola 8: Produkční a podnikové vzorce (2-3 hodiny) 🏢
**Požadavky**: Dokončeny kapitoly 1-4  
**Náročnost**: ⭐⭐⭐⭐

#### Co se naučíte
- Produkční strategie nasazení
- Podnikové bezpečnostní vzorce
- Monitorování a optimalizace nákladů
- Škálovatelnost a správa

- Nejlepší postupy pro produkční nasazení kontejnerových aplikací (bezpečnost, monitorování, náklady, CI/CD)

#### Výukové zdroje
- [Produkční AI nejlepší postupy](docs/chapter-08-production/production-ai-practices.md) - Podnikové vzorce
- Příklady mikroservis a podnikových aplikací
- Rámce pro monitorování a správu
- [Příklad architektury mikroservis](../../examples/container-app/microservices) - Blue-green/canary nasazení, distribuované trasování a optimalizace nákladů

#### Praktický výsledek
Nasazení podnikových aplikací s plnými produkčními schopnostmi

---

## Postup učení a náročnost

### Postupné budování dovedností

- **🌱 Začátečníci**: Začněte kapitolou 1 (Základy) → kapitola 2 (Vývoj AI)
- **🔧 Středně pokročilí**: Kapitoly 3-4 (Konfigurace & infrastruktura) → kapitola 6 (Ověření)
- **🚀 Pokročilí**: Kapitola 5 (Víceagentní řešení) → kapitola 7 (Řešení problémů)
- **🏢 Podnikové prostředí**: Dokončit všechny kapitoly, zaměřit se na kapitolu 8 (Produkční vzorce)

- **Cesta kontejnerových aplikací**: Kapitoly 4 (Nasazení kontejnerů), 5 (Integrace mikroservis), 8 (Produkční nejlepší postupy)

### Ukazatele náročnosti

- **⭐ Základní**: Jednoduché koncepty, vedené tutoriály, 30-60 minut
- **⭐⭐ Středně pokročilí**: Několik konceptů, praktická cvičení, 1-2 hodiny  
- **⭐⭐⭐ Pokročilí**: Složité architektury, vlastní řešení, 1-3 hodiny
- **⭐⭐⭐⭐ Expert**: Produkční systémy, podnikové vzorce, 2-4 hodiny

### Flexibilní učební cesty

#### 🎯 Rychlý kurz pro AI vývojáře (4-6 hodin)
1. **Kapitola 1**: Základy & Rychlý start (45 minut)
2. **Kapitola 2**: Vývoj AI jako první (2 hodiny)  
3. **Kapitola 5**: Víceagentní AI řešení (3 hodiny)
4. **Kapitola 8**: Nejlepší produkční postupy AI (1 hodina)

#### 🛠️ Cesta specialisty na infrastrukturu (5-7 hodin)
1. **Kapitola 1**: Základy & Rychlý start (45 minut)
2. **Kapitola 3**: Konfigurace & Autentizace (1 hodina)
3. **Kapitola 4**: Infrastruktura jako kód & nasazení (1,5 hodiny)
4. **Kapitola 6**: Ověření a plánování před nasazením (1 hodina)
5. **Kapitola 7**: Řešení problémů a ladění (1,5 hodiny)
6. **Kapitola 8**: Produkční a podnikové vzorce (2 hodiny)

#### 🎓 Kompletní učební cesta (8-12 hodin)
Sekvenční dokončení všech 8 kapitol s praktickými cvičeními a ověřením

## Rámec dokončení kurzu

### Ověření znalostí
- **Kontrolní body kapitol**: Praktická cvičení s měřitelnými výsledky
- **Praktická verifikace**: Nasadit funkční řešení pro každou kapitolu
- **Sledování pokroku**: Vizualizace indikátorů a odznaků dokončení
- **Ověření komunitou**: Sdílet zkušenosti v kanálech Azure Discord

### Hodnocení výsledků učení

#### Dokončení kapitol 1-2 (Základy + AI)
- ✅ Nasadit základní webovou aplikaci pomocí AZD
- ✅ Nasadit chatovací aplikaci s AI funkcemi s RAG
- ✅ Rozumět základním konceptům AZD a integraci AI

#### Dokončení kapitol 3-4 (Konfigurace + Infrastruktura)  
- ✅ Spravovat nasazení v různých prostředích
- ✅ Vytvořit vlastní šablony Bicep infrastruktury
- ✅ Implementovat bezpečné autentizační vzorce

#### Dokončení kapitol 5-6 (Více agentů + Ověření)
- ✅ Nasadit složité víceagentní AI řešení
- ✅ Provést plánování kapacity a optimalizaci nákladů
- ✅ Implementovat automatizované ověření před nasazením

#### Dokončení kapitol 7-8 (Řešení problémů + Produkce)
- ✅ Ladit a samostatně řešit problémy s nasazením  
- ✅ Implementovat monitorování a bezpečnost na podnikové úrovni
- ✅ Nasadit produkční aplikace s řízením

### Certifikace a uznání
- **Odznak dokončení kurzu**: Kompletní všechny 8 kapitoly s praktickým ověřením
- **Uznání komunity**: Aktivní účast v Microsoft Foundry Discord
- **Profesní rozvoj**: Dovednosti relevantní pro AZD a AI nasazení
- **Postup v kariéře**: Schopnosti nasazení cloudových řešení pro podniky

## 🎓 Celkově dosažené výsledky učení

### Základní úroveň (kapitoly 1-2)
Po dokončení základních kapitol studenti ukážou:

**Technické schopnosti:**
- Nasadit jednoduché webové aplikace do Azure pomocí příkazů AZD
- Konfigurovat a nasadit AI chatovací aplikace s RAG funkcemi
- Rozumět hlavním konceptům AZD: šablony, prostředí, pracovní postupy provisioning
- Integrovat služby Microsoft Foundry s nasazením AZD
- Orientovat se v konfiguracích Azure AI služeb a API endpointech

**Profesní dovednosti:**
- Dodržovat strukturované pracovní postupy nasazení pro konzistentní výsledky
- Řešit základní problémy nasazení pomocí logů a dokumentace
- Efektivně komunikovat o procesech nasazení v cloudu
- Aplikovat nejlepší postupy pro bezpečnou integraci AI služeb

**Ověření učení:**
- ✅ Úspěšně nasadit šablonu `todo-nodejs-mongo`
- ✅ Nasadit a konfigurovat `azure-search-openai-demo` s RAG
- ✅ Dokončit interaktivní cvičení workshopu (fáze objevování)
- ✅ Účastnit se diskuzí v komunitě Azure Discord

### Středně pokročilá úroveň (kapitoly 3-4)
Po dokončení středně pokročilých kapitol studenti ukážou:

**Technické schopnosti:**
- Spravovat nasazení ve více prostředích (vývoj, test, produkce)
- Vytvářet vlastní Bicep šablony pro infrastrukturu jako kód
- Implementovat bezpečné autentizační vzorce s řízenou identitou
- Nasazovat složité multi-servisní aplikace s vlastní konfigurací
- Optimalizovat strategie provisioning zdrojů pro náklady a výkon

**Profesní dovednosti:**
- Navrhovat škálovatelnou infrastrukturu
- Implementovat nejlepší bezpečnostní postupy pro cloudová nasazení
- Dokumentovat vzorce infrastruktury pro týmovou spolupráci
- Hodnotit a vybírat vhodné Azure služby pro požadavky

**Ověření učení:**
- ✅ Konfigurovat oddělená prostředí s nastavením specifickým pro prostředí
- ✅ Vytvořit a nasadit vlastní Bicep šablonu pro multi-servisní aplikaci
- ✅ Implementovat autentizaci řízenou identitou pro bezpečný přístup
- ✅ Dokončit cvičení správy konfigurace s reálnými scénáři

### Pokročilá úroveň (kapitoly 5-6)
Po dokončení pokročilých kapitol studenti ukážou:

**Technické schopnosti:**
- Nasadit a orchestraci víceagentních AI řešení s koordinovanými pracovními postupy
- Implementovat architektury agentů pro zákazníky a inventář v maloobchodních scénářích
- Provést komplexní plánování kapacity a ověření zdrojů
- Provádět automatizované ověření a optimalizaci před nasazením
- Navrhnout nákladově efektivní výběry SKU podle požadavků zatížení

**Profesní dovednosti:**
- Navrhovat složitá AI řešení pro produkční prostředí
- Vést technické diskuse o strategiích nasazení AI
- Mentorovat juniory ve vývoji AZD a AI nasazení
- Hodnotit a doporučovat AI architektonické vzorce podle podnikových požadavků

**Ověření učení:**
- ✅ Projít si maloobchodní vícagentní plán a rozlišit nasazenou infrastrukturu od chybějící implementace aplikace
- ✅ Demonstrovat koordinaci agentů a orchestraci pracovních postupů
- ✅ Dokončit kapacitní plánování s reálnými omezeními zdrojů
- ✅ Ověřit připravenost nasazení prostřednictvím automatizovaných kontrol před letem

### Expertní úroveň (kapitoly 7-8)
Po dokončení expertních kapitol studenti ukážou:

**Technické schopnosti:**
- Diagnostikovat a samostatně řešit složité problémy nasazení
- Implementovat bezpečnostní vzorce a rámce řízení na podnikové úrovni
- Navrhnout komplexní strategie monitorování a hlášení
- Optimalizovat produkční nasazení pro škálovatelnost, náklady a výkon
- Zavést CI/CD pipeline s patřičným testováním a ověřováním

**Profesní dovednosti:**
- Vést iniciativy podnikové cloudové transformace
- Navrhnout a implementovat standardy organizace pro nasazení
- Trénovat a mentorovat týmy ve vyspělých praktikách AZD
- Ovlivňovat technická rozhodnutí v oblasti podnikových AI nasazení

**Ověření učení:**
- ✅ Řešit složité selhání nasazení více služeb
- ✅ Implementovat podnikové bezpečnostní vzorce s požadavky na shodu
- ✅ Navrhnout a nasadit produkční monitorování s Application Insights
- ✅ Dokončit implementaci rámce podnikové správy

## 🎯 Certifikace dokončení kurzu

### Rámec sledování pokroku
Sledujte svůj pokrok ve studiu pomocí strukturovaných kontrolních bodů:

- [ ] **Kapitola 1**: Základy & Rychlý start ✅
- [ ] **Kapitola 2**: Vývoj AI jako první ✅  
- [ ] **Kapitola 3**: Konfigurace & Autentizace ✅
- [ ] **Kapitola 4**: Infrastruktura jako kód & nasazení ✅
- [ ] **Kapitola 5**: Víceagentní AI řešení ✅
- [ ] **Kapitola 6**: Ověření a plánování před nasazením ✅
- [ ] **Kapitola 7**: Řešení problémů a ladění ✅
- [ ] **Kapitola 8**: Produkční & podnikové vzorce ✅

### Proces ověření
Po dokončení každé kapitoly ověřte své znalosti prostřednictvím:

1. **Splnění praktického cvičení**: Nasadit funkční řešení pro každou kapitolu
2. **Hodnocení znalostí**: Projít sekce FAQ a dokončit sebehodnocení
3. **Zapojení komunity**: Sdílet zkušenosti a získávat zpětnou vazbu v Azure Discord
4. **Rozvoj portfolia**: Dokumentovat svá nasazení a získané lekce
5. **Kontrola vrstevníky**: Spolupracovat s ostatními studenty na složitých scénářích

### Výhody dokončení kurzu
Po dokončení všech kapitol a ověření budou absolventi mít:

**Technická odbornost:**
- **Produkční zkušenosti**: Nasazené reálné AI aplikace v Azure prostředí
- **Profesní dovednosti**: Schopnosti nasazení a řešení problémů na podnikové úrovni  
- **Znalosti architektury**: Víceagentní AI řešení a složité infrastrukturní vzorce
- **Mistrovství v řešení problémů**: Samostatné řešení potíží s nasazením a konfigurací

**Profesní rozvoj:**
- **Uznání v oboru**: Ověřené dovednosti v žádaných oblastech AZD a AI nasazení
- **Postup v kariéře**: Kvalifikace pro roli cloudového architekta a specialisty nasazení AI
- **Vedení v komunitě**: Aktivní členství v Azure vývojářských a AI komunitách
- **Nepřetržité učení**: Základy pro pokročilou specializaci Microsoft Foundry

**Portfoliové aktiva:**
- **Nasazená řešení**: Fungující příklady AI aplikací a infrastrukturních vzorců
- **Dokumentace**: Komplexní příručky nasazení a postupy řešení problémů  
- **Příspěvky do komunity**: Diskuze, příklady a vylepšení sdílená s Azure komunitou
- **Profesní síť**: Spojení s Azure experty a praktikanty AI nasazení

### Cesta učení po kurzu
Absolventi jsou připraveni pro pokročilou specializaci v:
- **Microsoft Foundry Expert**: Hluboká specializace v nasazení a orchestraci AI modelů
- **Vedení cloudové architektury**: Návrh a správa podnikových nasazení
- **Vedení developerské komunity**: Příspěvky do Azure vzorků a komunitních zdrojů
- **Firemní školení**: Výuka dovedností AZD a AI nasazení ve firmách

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->