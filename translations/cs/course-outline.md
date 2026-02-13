# AZD pro začátečníky: Osnova kurzu & rámec učení

## Přehled kurzu

Ovládněte Azure Developer CLI (azd) prostřednictvím strukturovaných kapitol navržených pro postupné učení. **Zvláštní důraz na nasazení AI aplikací s integrací Microsoft Foundry.**

### Proč je tento kurz nezbytný pro moderní vývojáře

Na základě postřehů z komunity Microsoft Foundry na Discordu, **45 % vývojářů chce používat AZD pro AI pracovní zátěže**, ale naráží na problémy s:
- Složitými více-služebními AI architekturami
- Doporučenými postupy pro produkční nasazení AI  
- Integrací a konfigurací Azure AI služeb
- Optimalizací nákladů pro AI pracovní zátěže
- Řešením problémů specifických pro nasazení AI

### Hlavní vzdělávací cíle

Dokončením tohoto strukturovaného kurzu budete:
- **Mistrovsky ovládat základy AZD**: Klíčové koncepty, instalace a konfigurace
- **Nasadit AI aplikace**: Používat AZD se službami Microsoft Foundry
- **Implementovat infrastrukturu jako kód**: Spravovat Azure zdroje přes šablony Bicep
- **Řešit problémy s nasazením**: Vyřešit běžné problémy a ladit chyby
- **Optimalizovat pro produkci**: Bezpečnost, škálování, monitorování a řízení nákladů
- **Vytvářet multi-agentní řešení**: Nasadit složité AI architektury

## 🎓 Zkušební učební workshop

### Flexibilní možnosti studia
Tento kurz je navržen tak, aby podporoval jak **samostatné individuální učení**, tak **řízené workshopové sezení**, což umožňuje studentům získat praktické zkušenosti s AZD při rozvoji dovedností skrze interaktivní cvičení.

#### 🚀 Režim samostudia
**Ideální pro samostatné vývojáře a kontinuální vzdělávání**

**Vlastnosti:**
- **Webové rozhraní**: Kompletní workshop poháněný MkDocs přístupný přes libovolný webový prohlížeč
- **Integrace GitHub Codespaces**: Jedno-klikové vývojové prostředí s předkonfigurovanými nástroji
- **Interaktivní prostředí DevContainer**: Nepotřebujete žádné lokální nastavení - začněte okamžitě kódovat
- **Sledování pokroku**: Vestavěné kontrolní body a validační cvičení
- **Podpora komunity**: Přístup do Azure Discord kanálů pro dotazy a spolupráci

**Struktura učení:**
- **Flexibilní časování**: Dokončujte kapitoly vlastním tempem během dnů či týdnů
- **Systém kontrolních bodů**: Ověřte znalosti před pokročilejšími tématy
- **Knihovna zdrojů**: Obsáhlá dokumentace, příklady a návody pro řešení problémů
- **Budování portfolia**: Vytvořte projekty vhodné pro profesní portfolio

**Začínáme (samostudium):**
```bash
# Možnost 1: GitHub Codespaces (doporučeno)
# Přejděte do repozitáře a klikněte na "Code" → "Create codespace on main"

# Možnost 2: Lokální vývoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postupujte podle pokynů pro nastavení v workshop/README.md
```

#### 🏛️ Řízené workshopové sezení
**Ideální pro firemní školení, bootcampy a vzdělávací instituce**

**Formáty workshopu:**

**📚 Akademická integrace kurzu (8-12 týdnů)**
- **Univerzitní programy**: Semestrální kurz s týdenními 2hodinovými lekcemi
- **Bootcamp formát**: Intenzivní 3-5 denní program s denními 6-8 hodinovými lekcemi
- **Firemní školení**: Měsíční týmová sezení s praktickou realizací projektů
- **Evaluační rámec**: Hodnocené úkoly, hodnocení vrstevníky a závěrečné projekty

**🚀 Intenzivní workshop (1-3 dny)**
- **Den 1**: Základy + AI vývoj (kapitoly 1-2) - 6 hodin
- **Den 2**: Konfigurace + infrastruktura (kapitoly 3-4) - 6 hodin  
- **Den 3**: Pokročilé vzory + produkce (kapitoly 5-8) - 8 hodin
- **Následná podpora**: Volitelná 2týdenní mentoring pro dokončení projektu

**⚡ Exekutivní briefing (4-6 hodin)**
- **Strategický přehled**: Hodnota AZD a obchodní dopad (1 hodina)
- **Demo naživo**: Kompletní nasazení AI aplikace (2 hodiny)
- **Revize architektury**: Podnikové vzory a řízení (1 hodina)
- **Plánování implementace**: Strategie zavádění v organizaci (1-2 hodiny)

#### 🛠️ Metodika workshopu
**Přístup Objevování → Nasazení → Přizpůsobení pro rozvoj praktických dovedností**

**Fáze 1: Objevování (45 minut)**
- **Prozkoumání šablon**: Hodnocení Microsoft Foundry šablon a služeb
- **Analýza architektury**: Porozumění multi-agentním vzorům a strategiím nasazení
- **Vyhodnocení požadavků**: Identifikace potřeb a omezení organizace
- **Nastavení prostředí**: Konfigurace vývojového prostředí a Azure zdrojů

**Fáze 2: Nasazení (2 hodiny)**
- **Řízená implementace**: Krok za krokem nasazení AI aplikací s AZD
- **Konfigurace služeb**: Nastavení Azure AI služeb, koncových bodů a autentizace
- **Implementace bezpečnosti**: Aplikace podnikových bezpečnostních vzorů a přístupových kontrol
- **Testování validace**: Ověření nasazení a řešení běžných problémů

**Fáze 3: Přizpůsobení (45 minut)**
- **Úprava aplikace**: Přizpůsobení šablon specifickým případům použití a požadavkům
- **Optimalizace do produkce**: Implementace monitorování, řízení nákladů a škálovacích strategií
- **Pokročilé vzory**: Prozkoumání koordinace multi-agentů a složitých architektur
- **Plánování dalších kroků**: Definice učební cesty pro pokračující rozvoj dovedností

#### 🎯 Výsledky učení workshopu
**Měřitelné dovednosti rozvinuté praktickým cvičením**

**Technické kompetence:**
- **Nasadit produkční AI aplikace**: Úspěšné nasazení a konfigurace AI řešení
- **Ovládnutí infrastruktury jako kódu**: Vytváření a správa vlastních Bicep šablon
- **Architektura multi-agentů**: Implementace koordinovaných AI agentních řešení
- **Připravenost na produkci**: Aplikace bezpečnostních, monitorovacích a řídicích vzorů
- **Expertíza v řešení problémů**: Samostatné řešení potíží s nasazením a konfigurací

**Profesní dovednosti:**
- **Vedení projektů**: Řízení technických týmů v cloudových iniciativách
- **Návrh architektury**: Navrhování škálovatelných a nákladově efektivních Azure řešení
- **Přenos znalostí**: Školení a mentoring kolegů v nejlepších praktikách AZD
- **Strategické plánování**: Ovlivňování strategií cloudového přijetí v organizaci

#### 📋 Zdroje a materiály workshopu
**Komplexní nástroje pro lektory a studenty**

**Pro lektory:**
- **Průvodce instruktorem**: [Přehled workshopu](workshop/README.md) - Plánování a vedení lekcí
- **Prezentace**: Sady snímků, diagramy architektury a demo skripty
- **Hodnotící nástroje**: Praktická cvičení, kontroly znalostí a hodnotící kritéria
- **Technické nastavení**: Konfigurace prostředí, návody k řešení problémů a záložní plány

**Pro studenty:**
- **Interaktivní workshopové prostředí**: [Materiály workshopu](workshop/README.md) - Učební platforma v prohlížeči
- **Krok-za-krokem instrukce**: [Řízená cvičení](../../workshop/docs/instructions) - Podrobné návody k implementaci  
- **Referenční dokumentace**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Hloubkové zaměření na AI
- **Komunitní zdroje**: Azure Discord kanály, GitHub diskuze a expertní podpora

#### 🏢 Implementace workshopu ve firmách
**Strategie pro nasazení a školení v organizacích**

**Firemní školící programy:**
- **Zaškolení vývojářů**: Onboarding nových zaměstnanců se základy AZD (2-4 týdny)
- **Zvyšování kvalifikace týmů**: Čtvrtletní workshopy pro stávající vývojové týmy (1-2 dny)
- **Revize architektury**: Měsíční sezení pro senior inženýry a architekty (4 hodiny)
- **Briefing pro vedení**: Workshopy pro technické manažery (půldenní)

**Podpora implementace:**
- **Vlastní design workshopů**: Přizpůsobený obsah dle potřeb organizace
- **Řízení pilotních programů**: Strukturované zavedení s metrikami úspěchu a zpětnou vazbou  
- **Nepřetržitý mentoring**: Podpora po workshopu při realizaci projektů
- **Budování komunity**: Interní Azure AI vývojářské komunity a sdílení znalostí

**Měření úspěchu:**
- **Získávání dovedností**: Před- a dopočáteční hodnocení růstu technických znalostí
- **Úspěšnost nasazení**: Procento účastníků, kteří úspěšně nasadili produkční aplikace
- **Doba do produktivity**: Zkrácený čas onboardingu nových Azure AI projektů
- **Udržení znalostí**: Následná hodnocení 3-6 měsíců po workshopu

## Struktura učení v 8 kapitolách

### Kapitola 1: Základy & Rychlý start (30-45 minut) 🌱
**Požadavky**: Azure předplatné, základní znalost příkazové řádky  
**Složitost**: ⭐

#### Co se Naučíte
- Porozumění základům Azure Developer CLI
- Instalace AZD na vaši platformu  
- Vaše první úspěšné nasazení
- Základní koncepty a terminologie

#### Zdroje ke studiu
- [AZD Základy](docs/getting-started/azd-basics.md) - Klíčové koncepty
- [Instalace a nastavení](docs/getting-started/installation.md) - Průvodce pro jednotlivé platformy
- [Váš první projekt](docs/getting-started/first-project.md) - Praktický tutoriál
- [Přehled příkazů](resources/cheat-sheet.md) - Rychlá reference

#### Praktický výsledek
Úspěšné nasazení jednoduché webové aplikace do Azure pomocí AZD

---

### Kapitola 2: Vývoj orientovaný na AI (1-2 hodiny) 🤖
**Požadavky**: Dokončená Kapitola 1  
**Složitost**: ⭐⭐

#### Co se Naučíte
- Integrace Microsoft Foundry s AZD
- Nasazování AI aplikací
- Porozumění konfiguracím AI služeb
- Vzory RAG (Retrieval-Augmented Generation)

#### Zdroje ke studiu
- [Integrace Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [Nasazování AI modelů](docs/microsoft-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - **NOVINKA**: Komplexní 2-3 hodinová praktická laboratoř
- [Interaktivní průvodce workshopem](workshop/README.md) - **NOVINKA**: Webový workshop s náhledem MkDocs
- [Microsoft Foundry šablony](README.md#featured-microsoft-foundry-templates)
- [Instrukce workshopu](../../workshop/docs/instructions) - **NOVINKA**: Krok za krokem řízená cvičení

#### Praktický výsledek
Nasadit a konfigurovat AI chatovací aplikaci s RAG funkcionalitou

#### Studijní cesta workshopu (volitelné rozšíření)
**NOVINKA Interaktivní zážitek**: [Kompletní průvodce workshopem](workshop/README.md)  
1. **Objevování** (30 minut): Výběr a hodnocení šablon  
2. **Nasazení** (45 minut): Nasazení a ověření funkcionality AI šablony  
3. **Rozbor** (30 minut): Porozumění architektuře a komponentám šablony  
4. **Konfigurace** (30 minut): Přizpůsobení nastavení a parametrů  
5. **Přizpůsobení** (45 minut): Úpravy a iterace pro vlastní použití  
6. **Ukončení** (15 minut): Úklid zdrojů a pochopení životního cyklu  
7. **Závěr** (15 minut): Další kroky a pokročilé učební cesty

---

### Kapitola 3: Konfigurace & Autentizace (45-60 minut) ⚙️
**Požadavky**: Dokončená Kapitola 1  
**Složitost**: ⭐⭐

#### Co se Naučíte
- Konfigurace a správa prostředí
- Nejlepší postupy autentizace a bezpečnosti
- Pojmenování a organizace zdrojů
- Nasazení do více prostředí

#### Zdroje ke studiu
- [Průvodce konfigurací](docs/getting-started/configuration.md) - Nastavení prostředí
- [Autentizace a bezpečnostní vzory](docs/getting-started/authsecurity.md) - Spravovaná identita a integrace Key Vault
- Příklady více prostředí

#### Praktický výsledek
Spravovat více prostředí s odpovídající autentizací a bezpečností

---

### Kapitola 4: Infrastruktura jako kód & Nasazení (1-1,5 hodiny) 🏗️
**Požadavky**: Dokončené kapitoly 1-3  
**Složitost**: ⭐⭐⭐

#### Co se Naučíte
- Pokročilé vzory nasazení
- Infrastruktura jako kód s Bicep
- Strategie provizování zdrojů
- Tvorba vlastních šablon

- Nasazení kontejnerizovaných aplikací s Azure Container Apps a AZD

#### Zdroje ke studiu
- [Průvodce nasazením](docs/deployment/deployment-guide.md) - Kompletní pracovní postupy
- [Provizování zdrojů](docs/deployment/provisioning.md) - Správa zdrojů
- Příklady kontejnerů a mikroslužeb
- [Příklady Container App](examples/container-app/README.md) - Rychlý start, produkce a pokročilé vzory nasazení

#### Praktický výsledek
Nasadit složité multi-služby aplikace pomocí vlastních infrastrukturových šablon

---

### Kapitola 5: Multi-agentní AI řešení (2-3 hodiny) 🤖🤖
**Požadavky**: Dokončené kapitoly 1-2  
**Složitost**: ⭐⭐⭐⭐

#### Co se Naučíte
- Vzory multi-agentní architektury
- Orchestrace a koordinace agentů
- Produkčně připravené AI nasazení
- Implementace zákaznického a inventárního agenta

- Integrace kontejnerizovaných mikroslužeb jako součást agentních řešení

#### Zdroje ke studiu
- [Retail Multi-Agent řešení](examples/retail-scenario.md) - Kompletní implementace
- [ARM balíček šablon](../../examples/retail-multiagent-arm-template) - Jedno-klikové nasazení
- Vzory koordinace multi-agentů
- [Příklad mikroslužební architektury](../../examples/container-app/microservices) - Komunikace služba-ke-službě, asynchronní zprávy a produkční nasazení

#### Praktický výsledek
Nasadit a spravovat produkčně připravené multi-agentní AI řešení

---

### Kapitola 6: Validace & plánování před nasazením (1 hodina) 🔍
**Požadavky**: Dokončená Kapitola 4  
**Složitost**: ⭐⭐

#### Co se Naučíte
- Plánování kapacity a validace zdrojů
- Strategie výběru SKU
- Předběžné kontroly a automatizace
- Plánování optimalizace nákladů

#### Zdroje ke studiu
- [Plánování kapacity](docs/pre-deployment/capacity-planning.md) - Validace zdrojů
- [Výběr SKU](docs/pre-deployment/sku-selection.md) - Nákladově efektivní volby
- [Předběžné kontroly](docs/pre-deployment/preflight-checks.md) - Automatizované skripty
- [Integrace Application Insights](docs/pre-deployment/application-insights.md) - Monitorování a observabilita
- [Vzory koordinace multi-agentů](docs/pre-deployment/coordination-patterns.md) - Strategie orchestrace agentů

#### Praktický výsledek
Ověřit a optimalizovat nasazení před samotnou realizací

---

### Kapitola 7: Řešení problémů a ladění (1–1,5 hodiny) 🔧
**Předpoklady**: Dokončená jakákoli kapitola o nasazení  
**Složitost**: ⭐⭐

#### Co se naučíte
- Systematické přístupy k ladění
- Běžné problémy a řešení
- Řešení problémů specifických pro AI
- Optimalizace výkonu

#### Výukové zdroje
- [Běžné problémy](docs/troubleshooting/common-issues.md) – FAQ a řešení
- [Průvodce laděním](docs/troubleshooting/debugging.md) – Strategie krok za krokem
- [Řešení problémů AI](docs/troubleshooting/ai-troubleshooting.md) – Problémy AI služeb

#### Praktický výsledek
Samostatně diagnostikovat a vyřešit běžné problémy s nasazením

---

### Kapitola 8: Produkční a podnikové vzory (2–3 hodiny) 🏢
**Předpoklady**: Dokončené kapitoly 1–4  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Strategie produkčního nasazení
- Podnikové bezpečnostní vzory
- Monitorování a optimalizace nákladů
- Škálovatelnost a řízení

- Nejlepší praktiky pro nasazení produkčních kontejnerových aplikací (bezpečnost, monitorování, náklady, CI/CD)

#### Výukové zdroje
- [Produkční AI nejlepší praktiky](docs/microsoft-foundry/production-ai-practices.md) – Podnikové vzory
- Příklady mikroservis a podnikových scénářů
- Rámce pro monitorování a řízení
- [Příklad architektury mikroservis](../../examples/container-app/microservices) – Blue-green/canary nasazení, distribuované sledování a optimalizace nákladů

#### Praktický výsledek
Nasadit aplikace připravené na podnikové produkční prostředí s plnou funkcionalitou

---

## Vývoj učení a složitost

### Postupné budování dovedností

- **🌱 Začátečníci**: Začněte kapitolou 1 (Základy) → kapitolou 2 (Vývoj AI)
- **🔧 Středně pokročilí**: Kapitoly 3–4 (Konfigurace & infrastruktura) → kapitola 6 (Validace)
- **🚀 Pokročilí**: Kapitola 5 (Multi-agentní řešení) → kapitola 7 (Řešení problémů)
- **🏢 Podnikové**: Dokončení všech kapitol, zaměření na kapitolu 8 (Produkční vzory)

- **Cesta kontejnerových aplikací**: Kapitoly 4 (Nasazení kontejnerů), 5 (Integrace mikroservis), 8 (Produkční nejlepší praktiky)

### Indikátory složitosti

- **⭐ Základní**: Jednotlivé koncepty, vedené tutoriály, 30–60 minut
- **⭐⭐ Středně pokročilé**: Více konceptů, praktická cvičení, 1–2 hodiny  
- **⭐⭐⭐ Pokročilé**: Složitá architektura, vlastní řešení, 1–3 hodiny
- **⭐⭐⭐⭐ Expert**: Produkční systémy, podnikové vzory, 2–4 hodiny

### Flexibilní výukové cesty

#### 🎯 Rychlá cesta vývojáře AI (4–6 hodin)
1. **Kapitola 1**: Základy & rychlý start (45 minut)
2. **Kapitola 2**: AI-first vývoj (2 hodiny)  
3. **Kapitola 5**: Multi-agentní AI řešení (3 hodiny)
4. **Kapitola 8**: Produkční AI nejlepší praktiky (1 hodina)

#### 🛠️ Cesta specialisty infrastruktury (5–7 hodin)
1. **Kapitola 1**: Základy & rychlý start (45 minut)
2. **Kapitola 3**: Konfigurace & autentizace (1 hodina)
3. **Kapitola 4**: Infrastruktura jako kód & nasazení (1,5 hodiny)
4. **Kapitola 6**: Validace & plánování před nasazením (1 hodina)
5. **Kapitola 7**: Řešení problémů a ladění (1,5 hodiny)
6. **Kapitola 8**: Produkční a podnikové vzory (2 hodiny)

#### 🎓 Kompletní vzdělávací cesta (8–12 hodin)
Postupné dokončení všech 8 kapitol s praktickým cvičením a validací

## Rámec dokončení kurzu

### Validace znalostí
- **Kontrolní body kapitol**: Praktická cvičení s měřitelnými výsledky
- **Ověření praxí**: Nasazení funkčních řešení pro každou kapitolu
- **Sledování postupu**: Vizualizované ukazatele a odznaky dokončení
- **Validace komunitou**: Sdílení zkušeností na kanálech Azure Discord

### Hodnocení učebních výsledků

#### Dokončení kapitol 1–2 (Základy + AI)
- ✅ Nasadit základní webovou aplikaci pomocí AZD
- ✅ Nasadit AI chatovací aplikaci s RAG
- ✅ Porozumět základním konceptům AZD a integraci AI

#### Dokončení kapitol 3–4 (Konfigurace + infrastruktura)  
- ✅ Spravovat nasazení do více prostředí
- ✅ Vytvořit vlastní šablony infrastruktury Bicep
- ✅ Implementovat bezpečné autentizační vzory

#### Dokončení kapitol 5–6 (Multi-agent + validace)
- ✅ Nasadit komplexní multi-agentní AI řešení
- ✅ Provést plánování kapacit a optimalizaci nákladů
- ✅ Implementovat automatizovanou předběžnou validaci nasazení

#### Dokončení kapitol 7–8 (Řešení problémů + produkce)
- ✅ Samostatně ladit a řešit problémy s nasazením  
- ✅ Implementovat podnikové monitorování a bezpečnost
- ✅ Nasadit aplikace připravené na produkci s řízením

### Certifikace a uznání
- **Odznak dokončení kurzu**: Dokončit všech 8 kapitol s praktickou validací
- **Komunitní uznání**: Aktivní účast v Microsoft Foundry Discord
- **Profesionální rozvoj**: Odborné dovednosti v AZD a AI nasazení
- **Kariérní růst**: Schopnost podnikového cloudového nasazení

## 🎓 Komplexní výukové výsledky

### Úroveň Základy (kapitoly 1–2)
Po dokončení základních kapitol účastníci prokážou:

**Technické schopnosti:**
- Nasadit jednoduché webové aplikace do Azure pomocí AZD příkazů
- Konfigurovat a nasadit AI chatovací aplikace s možnostmi RAG
- Porozumět základním AZD konceptům: šablony, prostředí, workflow pro provisioning
- Integrovat služby Microsoft Foundry s AZD nasazeními
- Navigovat konfigurace AI služeb Azure a API endpointy

**Profesní dovednosti:**
- Dodržovat strukturované workflow nasazení pro konzistentní výsledky
- Řešit základní problémy nasazení pomocí logů a dokumentace
- Efektivně komunikovat o procesech cloudového nasazení
- Aplikovat nejlepší praktiky pro bezpečnou AI integraci

**Ověření učebního výsledku:**
- ✅ Úspěšně nasadit šablonu `todo-nodejs-mongo`
- ✅ Nasadit a nastavit `azure-search-openai-demo` s RAG
- ✅ Dokončit interaktivní cvičení workshopu (fáze objevování)
- ✅ Aktivně se zapojit do diskuzí v komunitě Azure Discord

### Úroveň Středně pokročilí (kapitoly 3–4)
Po dokončení středně pokročilých kapitol účastníci prokážou:

**Technické schopnosti:**
- Spravovat nasazení do více prostředí (dev, staging, produkce)
- Vytvářet vlastní Bicep šablony pro infrastrukturu jako kód
- Implementovat autentizaci s řízenými identitami
- Nasazovat komplexní multi-servisní aplikace s vlastní konfigurací
- Optimalizovat provisioning zdrojů pro výkon a náklady

**Profesní dovednosti:**
- Navrhovat škálovatelné infrastruktury
- Implementovat bezpečnostní standardy pro cloudová nasazení
- Dokumentovat vzory infrastruktury pro týmovou spolupráci
- Hodnotit a vybírat vhodné Azure služby podle požadavků

**Ověření učebního výsledku:**
- ✅ Nastavit oddělená prostředí s konkrétními konfiguracemi
- ✅ Vytvořit a nasadit vlastní Bicep šablonu pro multi-servisní aplikaci
- ✅ Implementovat autentizaci pomocí řízených identit
- ✅ Dokončit cvičení v konfiguraci reálných scénářů

### Úroveň Pokročilí (kapitoly 5–6)
Po dokončení pokročilých kapitol účastníci prokážou:

**Technické schopnosti:**
- Nasadit a orchestraci multi-agentních AI řešení s koordinovanými workflow
- Implementovat architektury Customer a Inventory agenta pro maloobchodní scénáře
- Provádět komplexní plánování kapacit a validaci zdrojů
- Spustit automatizovanou předběžnou validaci a optimalizaci nasazení
- Navrhovat nákladově efektivní výběr SKU podle požadavků zátěže

**Profesní dovednosti:**
- Navrhovat komplexní AI řešení pro produkční prostředí
- Vést technické diskuze o strategii AI nasazení
- Mentorovat juniory v AZD a AI nejlepších praktikách
- Hodnotit a doporučovat AI architektonické vzory podle obchodních požadavků

**Ověření učebního výsledku:**
- ✅ Nasadit kompletní maloobchodní multi-agentní řešení s ARM šablonami
- ✅ Prokázat koordinaci agentů a orchestraci workflow
- ✅ Dokončit plánování kapacit s reálnými omezeními zdrojů
- ✅ Validovat připravenost nasazení pomocí automatických předběžných kontrol

### Úroveň Expert (kapitoly 7–8)
Po dokončení expertních kapitol účastníci prokážou:

**Technické schopnosti:**
- Diagnostikovat a samostatně řešit složité problémy s nasazením
- Implementovat podnikové bezpečnostní vzory a rámce řízení
- Navrhovat komplexní monitorovací a alarmovací strategie
- Optimalizovat produkční nasazení pro škálovatelnost, náklady a výkon
- Zavést CI/CD pipeline s adekvátním testováním a validací

**Profesní dovednosti:**
- Vést iniciativy podnikového cloudového přechodu
- Navrhovat a implementovat organizační standardy nasazení
- Školit a mentorovat vývojové týmy v pokročilých praktikách AZD
- Ovlivňovat technická rozhodnutí v podnikových AI nasazeních

**Ověření učebního výsledku:**
- ✅ Vyřešit složité chyby nasazení multi-servisních aplikací
- ✅ Implementovat podnikové bezpečnostní vzory s požadavky na dodržování norem
- ✅ Navrhnout a nasadit produkční monitorování pomocí Application Insights
- ✅ Dokončit implementaci rámce podnikové správy

## 🎯 Certifikace dokončení kurzu

### Rámec sledování postupu
Sledujte svůj pokrok pomocí strukturovaných kontrolních bodů:

- [ ] **Kapitola 1**: Základy & rychlý start ✅
- [ ] **Kapitola 2**: AI-first vývoj ✅  
- [ ] **Kapitola 3**: Konfigurace & autentizace ✅
- [ ] **Kapitola 4**: Infrastruktura jako kód & nasazení ✅
- [ ] **Kapitola 5**: Multi-agentní AI řešení ✅
- [ ] **Kapitola 6**: Validace & plánování před nasazením ✅
- [ ] **Kapitola 7**: Řešení problémů & ladění ✅
- [ ] **Kapitola 8**: Produkční & podnikové vzory ✅

### Verifikační proces
Po dokončení každé kapitoly ověřte své znalosti:

1. **Dokončení praktického cvičení**: Nasadit funkční řešení pro každou kapitolu
2. **Hodnocení znalostí**: Projít FAQ sekce a dokončit samo-hodnocení
3. **Zapojení komunity**: Sdílet zkušenosti a získat zpětnou vazbu v Azure Discord
4. **Rozvoj portfolia**: Dokumentovat své nasazení a získané zkušenosti
5. **Kontrola vrstevníky**: Spolupracovat s ostatními studenty na složitých scénářích

### Výhody dokončení kurzu
Po dokončení všech kapitol s ověřením budou absolventi mít:

**Technická odbornost:**
- **Produkční zkušenosti**: Nasazení reálných AI aplikací do Azure prostředí
- **Profesní dovednosti**: Podnikové nasazení a schopnost řešit problémy  
- **Architektonické znalosti**: Multi-agentní AI řešení a složité vzory infrastruktury
- **Mistrovství ladění**: Samostatné řešení problémů s nasazením a konfigurací

**Profesní rozvoj:**
- **Uznání v oboru**: Ověřitelné dovednosti v žádaných oblastech AZD a AI nasazení
- **Kariérní posun**: Kvalifikace pro role cloud architektů a specialistů nasazení AI
- **Vedoucí postavení v komunitě**: Aktivní členství v Azure a AI komunitách
- **Nepřetržité vzdělávání**: Základ pro pokročilé specializace Microsoft Foundry

**Portfolio aktiv:**
- **Nasazená řešení**: Fungující příklady AI aplikací a infrastrukturních vzorů
- **Dokumentace**: Komplexní návody a postupy řešení problémů  
- **Příspěvky komunitě**: Diskuze, příklady a vylepšení sdílené v Azure komunitě
- **Profesní síť**: Kontakty s experty Azure a praktikujícími nasazení AI

### Postkurzová výuková cesta
Absolventi jsou připraveni na pokročilé specializace v oblastech:
- **Microsoft Foundry Expert**: Hluboká specializace v nasazení a orchestraci AI modelů
- **Vedení cloudové architektury**: Design a řízení nasazení na podnikové úrovni
- **Vedoucí vývojářské komunity**: Příspěvky do Azure vzorů a komunitních zdrojů
- **Firemní školení**: Výuka dovedností AZD a AI nasazení uvnitř organizací

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:  
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za žádná nedorozumění či chybné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->