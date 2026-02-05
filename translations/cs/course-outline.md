# AZD pro začátečníky: Osnova kurzu a vzdělávací rámec

## Přehled kurzu

Ovládněte Azure Developer CLI (azd) prostřednictvím strukturovaných kapitol navržených pro postupné učení. **Zvláštní důraz na nasazení AI aplikací s integrací Microsoft Foundry.**

### Proč je tento kurz nezbytný pro moderní vývojáře

Na základě poznatků z komunity Microsoft Foundry na Discordu **45 % vývojářů chce používat AZD pro AI pracovní zátěže**, ale čelí výzvám s:
- Komplexními AI architekturami zahrnujícími více služeb
- Nejlepšími postupy pro nasazení AI do produkce  
- Integrací a konfigurací Azure AI služeb
- Optimalizací nákladů na AI pracovní zátěže
- Řešením problémů specifických pro nasazení AI

### Hlavní cíle učení

Po absolvování tohoto strukturovaného kurzu budete:
- **Ovládat základy AZD**: Základní koncepty, instalace a konfigurace
- **Nasazovat AI aplikace**: Používat AZD s Microsoft Foundry službami
- **Implementovat infrastrukturu jako kód**: Spravovat Azure zdroje pomocí šablon Bicep
- **Řešit problémy s nasazením**: Řešit běžné problémy a ladit chyby
- **Optimalizovat pro produkci**: Bezpečnost, škálování, monitorování a řízení nákladů
- **Budovat multi-agentní řešení**: Nasazovat komplexní AI architektury

## 🎓 Zážitkové učení na workshopu

### Flexibilní možnosti výuky
Tento kurz je navržen tak, aby podporoval jak **samostatné individuální učení**, tak **řízené workshopy**, což umožňuje účastníkům získat praktické zkušenosti s AZD a rozvíjet dovednosti prostřednictvím interaktivních cvičení.

#### 🚀 Samostatný režim učení
**Ideální pro individuální vývojáře a kontinuální vzdělávání**

**Funkce:**
- **Rozhraní v prohlížeči**: Workshop poháněný MkDocs přístupný přes jakýkoli webový prohlížeč
- **Integrace GitHub Codespaces**: Jedním kliknutím vytvoříte vývojové prostředí s předkonfigurovanými nástroji
- **Interaktivní prostředí DevContainer**: Není potřeba lokální nastavení - začněte kódovat okamžitě
- **Sledování pokroku**: Vestavěné kontrolní body a validační cvičení
- **Podpora komunity**: Přístup k Azure Discord kanálům pro dotazy a spolupráci

**Struktura učení:**
- **Flexibilní načasování**: Dokončete kapitoly vlastním tempem během dnů nebo týdnů
- **Systém kontrolních bodů**: Ověřte si znalosti před přechodem na složitější témata
- **Knihovna zdrojů**: Komplexní dokumentace, příklady a návody na řešení problémů
- **Rozvoj portfolia**: Vytvářejte nasaditelné projekty pro profesionální portfolio

**Začínáme (samostatně):**
```bash
# Možnost 1: GitHub Codespaces (Doporučeno)
# Přejděte do repozitáře a klikněte na "Code" → "Create codespace on main"

# Možnost 2: Lokální vývoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postupujte podle pokynů k nastavení v workshop/README.md
```

#### 🏛️ Řízené workshopy
**Ideální pro firemní školení, bootcampy a vzdělávací instituce**

**Formáty workshopů:**

**📚 Integrace do akademických kurzů (8-12 týdnů)**
- **Univerzitní programy**: Semestrální kurz s týdenními 2hodinovými lekcemi
- **Bootcamp formát**: Intenzivní 3-5denní program s denními 6-8 hodinami
- **Firemní školení**: Měsíční týmové lekce s praktickou implementací projektů
- **Hodnotící rámec**: Hodnocené úkoly, recenze od kolegů a závěrečné projekty

**🚀 Intenzivní workshop (1-3 dny)**
- **Den 1**: Základy + AI vývoj (Kapitoly 1-2) - 6 hodin
- **Den 2**: Konfigurace + infrastruktura (Kapitoly 3-4) - 6 hodin  
- **Den 3**: Pokročilé vzory + produkce (Kapitoly 5-8) - 8 hodin
- **Následná podpora**: Volitelný 2týdenní mentoring pro dokončení projektu

**⚡ Exekutivní přehled (4-6 hodin)**
- **Strategický přehled**: Hodnota AZD a jeho dopad na podnikání (1 hodina)
- **Praktická ukázka**: Nasazení AI aplikace od začátku do konce (2 hodiny)
- **Přehled architektury**: Podnikové vzory a správa (1 hodina)
- **Plánování implementace**: Strategie přijetí v organizaci (1-2 hodiny)

#### 🛠️ Metodologie workshopu
**Přístup Objevování → Nasazení → Přizpůsobení pro rozvoj praktických dovedností**

**Fáze 1: Objevování (45 minut)**
- **Průzkum šablon**: Hodnocení šablon a služeb Azure AI Foundry
- **Analýza architektury**: Pochopení multi-agentních vzorů a strategií nasazení
- **Hodnocení požadavků**: Identifikace potřeb a omezení organizace
- **Nastavení prostředí**: Konfigurace vývojového prostředí a Azure zdrojů

**Fáze 2: Nasazení (2 hodiny)**
- **Řízená implementace**: Krok za krokem nasazení AI aplikací pomocí AZD
- **Konfigurace služeb**: Nastavení Azure AI služeb, endpointů a autentizace
- **Implementace bezpečnosti**: Aplikace podnikových bezpečnostních vzorů a řízení přístupu
- **Testování validace**: Ověření nasazení a řešení běžných problémů

**Fáze 3: Přizpůsobení (45 minut)**
- **Úprava aplikace**: Přizpůsobení šablon pro specifické případy použití a požadavky
- **Optimalizace pro produkci**: Implementace monitorování, řízení nákladů a škálovacích strategií
- **Pokročilé vzory**: Prozkoumání koordinace multi-agentů a složitých architektur
- **Plánování dalších kroků**: Definování vzdělávací cesty pro další rozvoj dovedností

#### 🎯 Výstupy z workshopu
**Měřitelné dovednosti získané prostřednictvím praktického cvičení**

**Technické kompetence:**
- **Nasazení produkčních AI aplikací**: Úspěšné nasazení a konfigurace AI řešení
- **Ovládnutí infrastruktury jako kódu**: Vytváření a správa vlastních šablon Bicep
- **Multi-agentní architektura**: Implementace koordinovaných AI agentních řešení
- **Připravenost na produkci**: Aplikace bezpečnostních, monitorovacích a správcovských vzorů
- **Expertiza v řešení problémů**: Samostatné řešení problémů s nasazením a konfigurací

**Profesní dovednosti:**
- **Vedení projektů**: Vedení technických týmů při cloudových implementacích
- **Návrh architektury**: Návrh škálovatelných a nákladově efektivních Azure řešení
- **Předávání znalostí**: Školení a mentorování kolegů v nejlepších postupech AZD
- **Strategické plánování**: Ovlivňování strategií přijetí cloudu v organizaci

#### 📋 Zdroje a materiály pro workshop
**Komplexní sada nástrojů pro facilitátory a účastníky**

**Pro facilitátory:**
- **Příručka instruktora**: [Průvodce workshopem](workshop/docs/instructor-guide.md) - Tipy pro plánování a vedení lekcí
- **Prezentace**: Prezentace, diagramy architektury a skripty pro ukázky
- **Hodnotící nástroje**: Praktická cvičení, kontrolní otázky a hodnotící kritéria
- **Technické nastavení**: Konfigurace prostředí, návody na řešení problémů a záložní plány

**Pro účastníky:**
- **Interaktivní prostředí workshopu**: [Materiály workshopu](workshop/README.md) - Platforma pro učení v prohlížeči
- **Krok za krokem**: [Řízená cvičení](../../workshop/docs/instructions) - Podrobné návody na implementaci  
- **Referenční dokumentace**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Hloubkové zaměření na AI
- **Komunitní zdroje**: Azure Discord kanály, GitHub diskuze a odborná podpora

#### 🏢 Implementace workshopu ve firmách
**Strategie nasazení a školení v organizacích**

**Firemní školicí programy:**
- **Onboarding vývojářů**: Orientace nových zaměstnanců na základy AZD (2-4 týdny)
- **Zvyšování kvalifikace týmů**: Čtvrtletní workshopy pro stávající vývojové týmy (1-2 dny)
- **Přezkum architektury**: Měsíční sezení pro seniorní inženýry a architekty (4 hodiny)
- **Briefing pro vedení**: Workshopy pro technické rozhodovatele (půldenní)

**Podpora implementace:**
- **Návrh na míru**: Obsah přizpůsobený specifickým potřebám organizace
- **Řízení pilotního programu**: Strukturované zavedení s metrikami úspěchu a zpětnou vazbou  
- **Průběžné mentorování**: Podpora po workshopu pro implementaci projektů
- **Budování komunity**: Interní komunity vývojářů Azure AI a sdílení znalostí

**Metriky úspěchu:**
- **Získání dovedností**: Před/po hodnocení měřící růst technických kompetencí
- **Úspěšnost nasazení**: Procento účastníků úspěšně nasazujících produkční aplikace
- **Čas do produktivity**: Zkrácení doby onboardingu pro nové Azure AI projekty
- **Udržení znalostí**: Následné hodnocení 3-6 měsíců po workshopu

## Struktura učení v 8 kapitolách

### Kapitola 1: Základy a rychlý start (30-45 minut) 🌱
**Předpoklady**: Azure předplatné, základní znalost příkazového řádku  
**Náročnost**: ⭐

#### Co se naučíte
- Pochopení základů Azure Developer CLI
- Instalace AZD na vaší platformě  
- Vaše první úspěšné nasazení
- Základní koncepty a terminologie

#### Výukové zdroje
- [Základy AZD](docs/getting-started/azd-basics.md) - Základní koncepty
- [Instalace a nastavení](docs/getting-started/installation.md) - Průvodce pro různé platformy
- [Váš první projekt](docs/getting-started/first-project.md) - Praktický tutoriál
- [Tahák příkazů](resources/cheat-sheet.md) - Rychlý přehled

#### Praktický výstup
Úspěšné nasazení jednoduché webové aplikace na Azure pomocí AZD

---

### Kapitola 2: Vývoj zaměřený na AI (1-2 hodiny) 🤖
**Předpoklady**: Dokončená kapitola 1  
**Náročnost**: ⭐⭐

#### Co se naučíte
- Integrace Microsoft Foundry s AZD
- Nasazení AI aplikací
- Pochopení konfigurace AI služeb
- Vzory RAG (Retrieval-Augmented Generation)

#### Výukové zdroje
- [Integrace Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [Nasazení AI modelu](docs/microsoft-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - **NOVINKA**: Komplexní 2-3hodinový praktický workshop
- [Interaktivní průvodce workshopem](workshop/README.md) - **NOVINKA**: Workshop v prohlížeči s náhledem MkDocs
- [Šablony Microsoft Foundry](README.md#featured-microsoft-foundry-templates)
- [Instrukce workshopu](../../workshop/docs/instructions) - **NOVINKA**: Krok za krokem vedená cvičení

#### Praktický výstup
Nasazení a konfigurace AI chatovací aplikace s funkcemi RAG

#### Cesta učení na workshopu (volitelné rozšíření)
**NOVÁ interaktivní zkušenost**: [Kompletní průvodce workshopem](workshop/README.md)
1. **Objevování** (30 min): Výběr a hodnocení šablon
2. **Nasazení** (45 min): Nasazení a ověření funkčnosti AI šablony  
3. **Rozebrání** (30 min): Pochopení architektury a komponent šablony
4. **Konfigurace** (30 min): Přizpůsobení nastavení a parametrů
5. **Přizpůsobení** (45 min): Úpravy a iterace pro vlastní potřeby
6. **Odstranění** (15 min): Vyčištění zdrojů a pochopení životního cyklu
7. **Závěr** (15 min): Další kroky a pokročilé vzdělávací cesty

---

### Kapitola 3: Konfigurace a autentizace (45-60 minut) ⚙️
**Předpoklady**: Dokončená kapitola 1  
**Náročnost**: ⭐⭐

#### Co se naučíte
- Konfigurace a správa prostředí
- Nejlepší postupy pro autentizaci a bezpečnost
- Pojmenování a organizace zdrojů
- Nasazení do více prostředí

#### Výukové zdroje
- [Průvodce konfigurací](docs/getting-started/configuration.md) - Nastavení prostředí
- [Vzory autentizace a bezpečnosti](docs/getting-started/authsecurity.md) - Integrace spravované identity a Key Vault
- Příklady pro více prostředí

#### Praktický výstup
Správa více prostředí s odpovídající autentizací a bezpečností

---

### Kapitola 4: Infrastruktura jako kód a nasazení (1-1,5 hodiny) 🏗️
**Předpoklady**: Dokončené kapitoly 1-3  
**Náročnost**: ⭐⭐⭐

#### Co se naučíte
- Pokročilé vzory nasazení
- Infrastruktura jako kód s Bicep
- Strategie pro zajištění zdrojů
- Vytváření vlastních šablon

- Nasazení kontejnerových aplikací pomocí Azure Container Apps a AZD

#### Výukové zdroje
- [Průvodce nasazením](docs/deployment/deployment-guide.md) - Kompletní pracovní postupy
- [Zajištění zdrojů](docs/deployment/provisioning.md) - Správa zdrojů
- Příklady kontejnerů a mikroslužeb
- [Příklady kontejnerových aplikací](examples/container-app/README.md) - Rychlý start, produkce a pokročilé vzory nasazení

#### Praktický výstup
Nasazení komplexních aplikací s více službami pomocí vlastních šablon infrastruktury

---

### Kapitola 5: Multi-agentní AI řešení (2-3 hodiny) 🤖🤖
**Předpoklady**: Dokončené kapitoly 1-2  
**Náročnost**: ⭐⭐⭐⭐

#### Co se naučíte
- Vzory multi-agentní architektury
- Orchestrace a koordinace agentů
- Produkční nasazení AI
- Implementace agentů pro zákazníky a inventář

- Integrace kontejnerových mikroslužeb jako součást agentních řešení

#### Výukové zdroje
- [Řešení pro maloobchod s multi-agenty](examples/retail-scenario.md) - Kompletní implementace
- [Balíček ARM šablon](../../examples/retail-multiagent-arm-template) - Nasazení jedním kliknutím
- Vzory koordinace multi-agentů
- [Příklad mikroslužební architektury](../../examples/container-app/microservices) - Komunikace mezi službami, asynchronní zprávy a produkční nasazení

#### Praktický výstup
Nasazení a správa produkčního multi-agentního AI řešení

---

### Kapitola 
Ověřte a optimalizujte nasazení před spuštěním

---

### Kapitola 7: Řešení problémů a ladění (1-1,5 hodiny) 🔧
**Předpoklady**: Dokončena jakákoliv kapitola o nasazení  
**Složitost**: ⭐⭐

#### Co se naučíte
- Systematické přístupy k ladění
- Běžné problémy a jejich řešení
- Řešení problémů specifických pro AI
- Optimalizace výkonu

#### Výukové materiály
- [Běžné problémy](docs/troubleshooting/common-issues.md) - FAQ a řešení
- [Průvodce laděním](docs/troubleshooting/debugging.md) - Krok za krokem
- [Řešení problémů specifických pro AI](docs/troubleshooting/ai-troubleshooting.md) - Problémy s AI službami

#### Praktický výsledek
Schopnost samostatně diagnostikovat a řešit běžné problémy s nasazením

---

### Kapitola 8: Produkční a podnikové vzory (2-3 hodiny) 🏢
**Předpoklady**: Dokončeny kapitoly 1-4  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Strategie nasazení do produkce
- Podnikové bezpečnostní vzory
- Monitorování a optimalizace nákladů
- Škálovatelnost a správa

- Osvědčené postupy pro nasazení kontejnerových aplikací do produkce (bezpečnost, monitorování, náklady, CI/CD)

#### Výukové materiály
- [Osvědčené postupy pro AI v produkci](docs/microsoft-foundry/production-ai-practices.md) - Podnikové vzory
- Příklady mikroslužeb a podnikových aplikací
- Rámce pro monitorování a správu
- [Příklad architektury mikroslužeb](../../examples/container-app/microservices) - Blue-green/canary nasazení, distribuované trasování a optimalizace nákladů

#### Praktický výsledek
Nasazení aplikací připravených pro podnikové prostředí s plnými produkčními schopnostmi

---

## Postup učení a složitost

### Postupné budování dovedností

- **🌱 Začátečníci**: Začněte kapitolou 1 (Základy) → Kapitola 2 (Vývoj AI)
- **🔧 Středně pokročilí**: Kapitoly 3-4 (Konfigurace a infrastruktura) → Kapitola 6 (Ověření)
- **🚀 Pokročilí**: Kapitola 5 (Řešení s více agenty) → Kapitola 7 (Řešení problémů)
- **🏢 Podniková úroveň**: Dokončete všechny kapitoly, zaměřte se na kapitolu 8 (Produkční vzory)

- **Cesta kontejnerových aplikací**: Kapitoly 4 (Nasazení kontejnerů), 5 (Integrace mikroslužeb), 8 (Osvědčené postupy pro produkci)

### Ukazatele složitosti

- **⭐ Základní**: Jednoduché koncepty, vedené tutoriály, 30-60 minut
- **⭐⭐ Středně pokročilé**: Více konceptů, praktická cvičení, 1-2 hodiny  
- **⭐⭐⭐ Pokročilé**: Složité architektury, vlastní řešení, 1-3 hodiny
- **⭐⭐⭐⭐ Expertní**: Produkční systémy, podnikové vzory, 2-4 hodiny

### Flexibilní vzdělávací cesty

#### 🎯 Rychlá cesta pro vývojáře AI (4-6 hodin)
1. **Kapitola 1**: Základy a rychlý start (45 minut)
2. **Kapitola 2**: Vývoj zaměřený na AI (2 hodiny)  
3. **Kapitola 5**: Řešení s více agenty (3 hodiny)
4. **Kapitola 8**: Osvědčené postupy pro AI v produkci (1 hodina)

#### 🛠️ Cesta specialisty na infrastrukturu (5-7 hodin)
1. **Kapitola 1**: Základy a rychlý start (45 minut)
2. **Kapitola 3**: Konfigurace a autentizace (1 hodina)
3. **Kapitola 4**: Infrastruktura jako kód a nasazení (1,5 hodiny)
4. **Kapitola 6**: Ověření a plánování před nasazením (1 hodina)
5. **Kapitola 7**: Řešení problémů a ladění (1,5 hodiny)
6. **Kapitola 8**: Produkční a podnikové vzory (2 hodiny)

#### 🎓 Kompletní vzdělávací cesta (8-12 hodin)
Postupné dokončení všech 8 kapitol s praktickými cvičeními a ověřením

## Rámec pro dokončení kurzu

### Ověření znalostí
- **Kontrolní body kapitol**: Praktická cvičení s měřitelnými výsledky
- **Praktické ověření**: Nasazení funkčních řešení pro každou kapitolu
- **Sledování pokroku**: Vizualizace pokroku a odznaky za dokončení
- **Ověření komunitou**: Sdílení zkušeností na Discord kanálech Azure

### Hodnocení výsledků učení

#### Dokončení kapitol 1-2 (Základy + AI)
- ✅ Nasazení základní webové aplikace pomocí AZD
- ✅ Nasazení AI aplikace pro chat s RAG
- ✅ Porozumění základním konceptům AZD a integraci AI

#### Dokončení kapitol 3-4 (Konfigurace + Infrastruktura)  
- ✅ Správa nasazení do více prostředí
- ✅ Vytvoření vlastních šablon infrastruktury pomocí Bicep
- ✅ Implementace bezpečných autentizačních vzorů

#### Dokončení kapitol 5-6 (Více agentů + Ověření)
- ✅ Nasazení komplexního řešení s více agenty AI
- ✅ Provádění plánování kapacity a optimalizace nákladů
- ✅ Implementace automatizovaného ověření před nasazením

#### Dokončení kapitol 7-8 (Řešení problémů + Produkce)
- ✅ Samostatné řešení problémů s nasazením  
- ✅ Implementace podnikových monitorovacích a bezpečnostních opatření
- ✅ Nasazení aplikací připravených pro produkci se správou

### Certifikace a uznání
- **Odznak za dokončení kurzu**: Dokončení všech 8 kapitol s praktickým ověřením
- **Uznání komunitou**: Aktivní účast v Microsoft Foundry Discord
- **Profesní rozvoj**: Relevantní dovednosti v oblasti AZD a nasazení AI
- **Kariérní růst**: Schopnosti pro nasazení cloudových řešení na podnikové úrovni

## 🎓 Komplexní výsledky učení

### Úroveň základů (Kapitoly 1-2)
Po dokončení základních kapitol budou studenti schopni:

**Technické dovednosti:**
- Nasadit jednoduché webové aplikace na Azure pomocí příkazů AZD
- Konfigurovat a nasazovat AI aplikace pro chat s RAG funkcionalitou
- Porozumět základním konceptům AZD: šablony, prostředí, pracovní postupy
- Integrovat služby Microsoft Foundry s nasazením AZD
- Orientovat se v konfiguracích Azure AI služeb a API endpointů

**Profesní dovednosti:**
- Dodržovat strukturované pracovní postupy nasazení pro konzistentní výsledky
- Řešit základní problémy s nasazením pomocí logů a dokumentace
- Efektivně komunikovat o procesech nasazení do cloudu
- Aplikovat osvědčené postupy pro bezpečnou integraci AI služeb

**Ověření učení:**
- ✅ Úspěšně nasadit šablonu `todo-nodejs-mongo`
- ✅ Nasadit a konfigurovat `azure-search-openai-demo` s RAG
- ✅ Dokončit interaktivní workshopy (fáze objevování)
- ✅ Účastnit se diskuzí v Azure Discord komunitě

### Středně pokročilá úroveň (Kapitoly 3-4)
Po dokončení středně pokročilých kapitol budou studenti schopni:

**Technické dovednosti:**
- Spravovat nasazení do více prostředí (dev, staging, produkce)
- Vytvářet vlastní šablony Bicep pro infrastrukturu jako kód
- Implementovat bezpečné autentizační vzory s řízenou identitou
- Nasazovat komplexní aplikace s více službami a vlastními konfiguracemi
- Optimalizovat strategie zajištění zdrojů pro náklady a výkon

**Profesní dovednosti:**
- Navrhovat škálovatelné infrastruktury
- Implementovat bezpečnostní osvědčené postupy pro nasazení do cloudu
- Dokumentovat vzory infrastruktury pro týmovou spolupráci
- Vyhodnocovat a vybírat vhodné Azure služby pro požadavky

**Ověření učení:**
- ✅ Konfigurovat oddělená prostředí s nastaveními specifickými pro prostředí
- ✅ Vytvořit a nasadit vlastní šablonu Bicep pro aplikaci s více službami
- ✅ Implementovat autentizaci řízenou identitou pro bezpečný přístup
- ✅ Dokončit cvičení správy konfigurace s reálnými scénáři

### Pokročilá úroveň (Kapitoly 5-6)
Po dokončení pokročilých kapitol budou studenti schopni:

**Technické dovednosti:**
- Nasazovat a koordinovat řešení s více agenty AI
- Implementovat architektury agentů pro zákazníky a inventář v maloobchodních scénářích
- Provádět komplexní plánování kapacity a ověřování zdrojů
- Provádět automatizované ověření před nasazením a optimalizaci
- Navrhovat nákladově efektivní výběr SKU na základě požadavků na pracovní zátěž

**Profesní dovednosti:**
- Navrhovat komplexní AI řešení pro produkční prostředí
- Vést technické diskuze o strategiích nasazení AI
- Mentorovat juniory v osvědčených postupech nasazení AZD a AI
- Vyhodnocovat a doporučovat vzory AI architektury pro obchodní požadavky

**Ověření učení:**
- ✅ Nasadit kompletní maloobchodní řešení s více agenty pomocí ARM šablon
- ✅ Demonstrovat koordinaci agentů a orchestraci pracovních postupů
- ✅ Dokončit cvičení plánování kapacity s reálnými omezeními zdrojů
- ✅ Ověřit připravenost nasazení prostřednictvím automatizovaných kontrol

### Expertní úroveň (Kapitoly 7-8)
Po dokončení expertních kapitol budou studenti schopni:

**Technické dovednosti:**
- Diagnostikovat a samostatně řešit složité problémy s nasazením
- Implementovat podnikové bezpečnostní vzory a rámce správy
- Navrhovat komplexní strategie monitorování a upozorňování
- Optimalizovat produkční nasazení pro škálování, náklady a výkon
- Zřídit CI/CD pipeline s odpovídajícím testováním a ověřením

**Profesní dovednosti:**
- Vést podnikové iniciativy pro transformaci cloudu
- Navrhovat a implementovat organizační standardy nasazení
- Školit a mentorovat vývojové týmy v pokročilých praktikách AZD
- Ovlivňovat technická rozhodnutí pro podniková nasazení AI

**Ověření učení:**
- ✅ Vyřešit složité chyby při nasazení více služeb
- ✅ Implementovat podnikové bezpečnostní vzory s požadavky na shodu
- ✅ Navrhnout a nasadit monitorování produkce pomocí Application Insights
- ✅ Dokončit implementaci rámce správy pro podniky

## 🎯 Certifikace za dokončení kurzu

### Rámec sledování pokroku
Sledujte svůj pokrok prostřednictvím strukturovaných kontrolních bodů:

- [ ] **Kapitola 1**: Základy a rychlý start ✅
- [ ] **Kapitola 2**: Vývoj zaměřený na AI ✅  
- [ ] **Kapitola 3**: Konfigurace a autentizace ✅
- [ ] **Kapitola 4**: Infrastruktura jako kód a nasazení ✅
- [ ] **Kapitola 5**: Řešení s více agenty AI ✅
- [ ] **Kapitola 6**: Ověření a plánování před nasazením ✅
- [ ] **Kapitola 7**: Řešení problémů a ladění ✅
- [ ] **Kapitola 8**: Produkční a podnikové vzory ✅

### Proces ověření
Po dokončení každé kapitoly ověřte své znalosti prostřednictvím:

1. **Dokončení praktických cvičení**: Nasazení funkčních řešení pro každou kapitolu
2. **Hodnocení znalostí**: Projděte si sekce FAQ a dokončete sebehodnocení
3. **Zapojení do komunity**: Sdílejte zkušenosti a získejte zpětnou vazbu na Discordu Azure
4. **Rozvoj portfolia**: Dokumentujte svá nasazení a získané poznatky
5. **Recenze od kolegů**: Spolupracujte s ostatními studenty na složitých scénářích

### Výhody dokončení kurzu
Po dokončení všech kapitol s ověřením budou absolventi mít:

**Technickou odbornost:**
- **Produkční zkušenosti**: Nasazení reálných AI aplikací do prostředí Azure
- **Profesní dovednosti**: Schopnosti pro nasazení a řešení problémů na podnikové úrovni  
- **Znalosti architektury**: Řešení s více agenty AI a složité vzory infrastruktury
- **Mistrovství v řešení problémů**: Samostatné řešení problémů s nasazením a konfigurací

**Profesní rozvoj:**
- **Uznání v oboru**: Ověřitelné dovednosti v oblastech AZD a nasazení AI
- **Kariérní růst**: Kvalifikace pro role cloudového architekta a specialisty na nasazení AI
- **Vedení komunity**: Aktivní členství v komunitách vývojářů Azure a AI
- **Nepřetržité učení**: Základy pro pokročilou specializaci Microsoft Foundry

**Portfolio aktiv:**
- **Nasazená řešení**: Funkční příklady AI aplikací a vzorů infrastruktury
- **Dokumentace**: Komplexní průvodce nasazením a postupy řešení problémů  
- **Příspěvky komunitě**: Diskuze, příklady a vylepšení sdílené s komunitou Azure
- **Profesní síť**: Spojení s experty na Azure a praktiky nasazení AI

### Cesta dalšího vzdělávání po kurzu
Absolventi jsou připraveni na pokročilou specializaci v:
- **Microsoft Foundry Expert**: Hluboká specializace na nasazení a orchestraci AI modelů
- **Vedení cloudové architektury**: Návrh a správa nasazení na podnikové úrovni
- **Vedení vývojářské komunity**: Přispívání do ukázek Azure a komunitních zdrojů
- **Firemní školení**: Výuka dovedností AZD a nasazení AI v organizacích

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->