# AZD pro začátečníky: Osnova kurzu a rámec učení

## Přehled kurzu

Ovládněte Azure Developer CLI (azd) prostřednictvím strukturovaných kapitol navržených pro postupné učení. **Zvláštní důraz na nasazení aplikací AI s integrací Microsoft Foundry.**

### Proč je tento kurz nezbytný pro moderní vývojáře

Vývojáři nasazující AI pracovní zátěže často potřebují vedení v oblastech:
- Složitých víceslužbových AI architekturách
- Nejlepších praktikách produkčního nasazení AI
- Integrace a konfigurace Azure AI služeb
- Optimalizace nákladů pro AI pracovní zátěže
- Řešení problémů specifických pro nasazení AI

### Hlavní cíle učení

Dokončením tohoto strukturovaného kurzu budete schopni:
- **Ovládnout základy AZD**: Základní koncepty, instalace a konfigurace
- **Nasadit AI aplikace**: Použít AZD se službami Microsoft Foundry
- **Implementovat infrastrukturu jako kód**: Spravovat Azure zdroje s Bicep šablonami
- **Řešit problémy s nasazením**: Vyřešit běžné problémy a ladit chyby
- **Optimalizovat pro produkci**: Bezpečnost, škálování, monitorování a správa nákladů
- **Vytvářet multi-agentní řešení**: Nasazovat složité AI architektury

## 🎓 Zkušenost s učením v rámci workshopu

### Flexibilní možnosti výuky
Tento kurz je navržen pro podporu jak **individuálního samostatného učení**, tak **workshopových sezení s lektorem**, které umožňují získat praktické zkušenosti s AZD prostřednictvím interaktivních cvičení.

#### 🚀 Režim samostatného učení
**Ideální pro individuální vývojáře a průběžné vzdělávání**

**Funkce:**
- **Prohlížečové rozhraní**: Kompletní workshop poháněný MkDocs přístupný přes libovolný webový prohlížeč
- **Integrace GitHub Codespaces**: Vývojové prostředí na jedno kliknutí s přednastavenými nástroji
- **Interaktivní DevContainer prostředí**: Není potřeba místní nastavení – začněte kódovat okamžitě
- **Sledování pokroku**: Vestavěné kontrolní body a validační cvičení
- **Podpora komunity**: Přístup do Azure Discord kanálů pro dotazy a spolupráci

**Struktura učení:**
- **Flexibilní časování**: Dokončete kapitoly vlastním tempem během dní či týdnů
- **Systém kontrolních bodů**: Ověřte si znalosti před postupem ke složitějším tématům
- **Knihovna zdrojů**: Komplexní dokumentace, příklady a návody pro řešení problémů
- **Vývoj portfolia**: Vytvářejte projekty nasaditelné do produkce pro profesionální portfolio

**Začínáme (samostatně):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Workshopová sezení s lektorem
**Ideální pro firemní školení, bootcampy a vzdělávací instituce**

**Možnosti formátu workshopu:**

**📚 Začlenění do akademického kurzu (8-12 týdnů)**
- **Univerzitní programy**: Semestrální kurz s týdenními dvouhodinovými sezeními
- **Bootcamp formát**: Intenzivní 3-5 denní program s každodenními 6-8 hodinovými sezeními
- **Firemní školení**: Měsíční týmová sezení s praktickou implementací projektů
- **Hodnotící rámec**: Hodnocené úkoly, recenze od vrstevníků a závěrečné projekty

**🚀 Intenzivní workshop (1-3 dny)**
- **Den 1**: Základy + AI vývoj (kapitoly 1-2) - 6 hodin
- **Den 2**: Konfigurace + infrastruktura (kapitoly 3-4) - 6 hodin  
- **Den 3**: Pokročilé vzory + produkce (kapitoly 5-8) - 8 hodin
- **Následná podpora**: Volitelné 2týdenní mentorství pro dokončení projektů

**⚡ Exekutivní briefing (4-6 hodin)**
- **Strategický přehled**: Hodnota AZD a dopad na byznys (1 hodina)
- **Praktická ukázka**: Kompletní nasazení AI aplikace (2 hodiny)
- **Revize architektury**: Podnikové vzory a správa (1 hodina)
- **Plán implementace**: Strategie organizační adaptace (1-2 hodiny)

#### 🛠️ Metodologie workshopového učení
**Postup Objevování → Nasazování → Přizpůsobování pro rozvoj praktických dovedností**

**Fáze 1: Objevování (45 minut)**
- **Průzkum šablon**: Vyhodnocení Microsoft Foundry šablon a služeb
- **Analýza architektury**: Porozumění multi-agentním vzorům a strategiím nasazení
- **Hodnocení požadavků**: Identifikace organizačních potřeb a omezení
- **Nastavení prostředí**: Konfigurace vývojového prostředí a Azure zdrojů

**Fáze 2: Nasazení (2 hodiny)**
- **Řízená implementace**: Krok za krokem nasazení AI aplikací s AZD
- **Konfigurace služeb**: Nastavení Azure AI služeb, koncových bodů a autentizace
- **Implementace bezpečnosti**: Aplikace podnikových bezpečnostních vzorů a řízení přístupu
- **Testování validace**: Ověření nasazení a řešení běžných problémů

**Fáze 3: Přizpůsobení (45 minut)**
- **Modifikace aplikace**: Přizpůsobení šablon pro specifické případy a požadavky
- **Optimalizace pro produkci**: Implementace monitorování, správy nákladů a škálování
- **Pokročilé vzory**: Prozkoumání koordinace multi-agentů a složitých architektur
- **Plánování dalších kroků**: Definice učební cesty pro další rozvoj dovedností

#### 🎯 Výstupy učení z workshopu
**Měřitelné dovednosti získané praktickým nácvikem**

**Technické kompetence:**
- **Nasazení produkčních AI aplikací**: Úspěšné nasazení a konfigurace AI řešení
- **Mistrovství infrastruktury jako kódu**: Vytváření a správa vlastních Bicep šablon
- **Multi-agentní architektura**: Implementace koordinovaných AI agentních řešení
- **Připravenost na produkci**: Aplikace bezpečnostních, monitorovacích a řídicích vzorů
- **Odbornost v řešení problémů**: Samostatné řešení nasazovacích a konfiguračních problémů

**Profesní dovednosti:**
- **Vedení projektů**: Vedení technických týmů při cloudových nasazeních
- **Návrh architektury**: Navrhování škálovatelných a nákladově efektivních Azure řešení
- **Předávání znalostí**: Školení a mentorování kolegů v AZD nejlepších praktikách
- **Strategické plánování**: Ovlivňování organizačních strategií cloudové adopce

#### 📋 Zdroje a materiály k workshopu
**Komplexní sada nástrojů pro lektory a studenty**

**Pro lektory:**
- **Příručka instruktora**: [Přehled workshopu](workshop/README.md) - Plánování a vedení sezení
- **Prezentační materiály**: Prezentace, diagramy architektury a demo scénáře
- **Hodnotící nástroje**: Praktická cvičení, testy znalostí a hodnotící kritéria
- **Technické nastavení**: Konfigurace prostředí, návody pro řešení problémů a záložní plány

**Pro studenty:**
- **Interaktivní workshopové prostředí**: [Materiály workshopu](workshop/README.md) - Prohlížečová výuková platforma
- **Podrobné instrukce**: [Řízená cvičení](../../workshop/docs/instructions) - Podrobný průvodce implementací  
- **Referenční dokumentace**: [AI workshop laboratoř](docs/chapter-02-ai-development/ai-workshop-lab.md) - Hloubkové zaměření na AI
- **Komunitní zdroje**: Azure Discord kanály, GitHub diskuze a podpora expertů

#### 🏢 Implementace workshopu v podnicích
**Strategie nasazení a školení organizací**

**Firemní školící programy:**
- **Zaškolování vývojářů**: Orientace nových zaměstnanců se základy AZD (2-4 týdny)
- **Zvyšování kvalifikace týmů**: Čtvrtletní workshopy pro stávající vývojové týmy (1-2 dny)
- **Revize architektury**: Měsíční sezení pro senior inženýry a architekty (4 hodiny)
- **Briefingy vedení**: Workshop pro technické rozhodovatele (půlden)

**Podpora implementace:**
- **Vlastní návrh workshopu**: Přizpůsobený obsah pro specifické potřeby organizace
- **Řízení pilotních programů**: Strukturované zavádění s metrikami úspěchu a zpětnou vazbou  
- **Průběžné mentorství**: Podpora po workshopu pro implementaci projektů
- **Budování komunity**: Interní Azure AI vývojářské komunity a sdílení znalostí

**Metriky úspěchu:**
- **Získávání dovedností**: Hodnocení před a po kurzu měřící růst technických kompetencí
- **Úspěšné nasazení**: Procento účastníků úspěšně nasazujících produkční aplikace
- **Doba do produktivity**: Zkrácení času na zaškolení pro nové Azure AI projekty
- **Udržení znalostí**: Následná hodnocení 3-6 měsíců po workshopu

## Struktura učení ve 8 kapitolách

### Kapitola 1: Základy a rychlý start (30-45 minut) 🌱
**Předpoklady**: Azure subscription, základní znalost příkazové řádky  
**Složitost**: ⭐

#### Co se naučíte
- Porozumění základům Azure Developer CLI
- Instalace AZD na vaší platformě  
- Vaše první úspěšné nasazení
- Základní koncepty a terminologie

#### Výukové zdroje
- [Základy AZD](docs/chapter-01-foundation/azd-basics.md) - Základní koncepty
- [Instalace a nastavení](docs/chapter-01-foundation/installation.md) - Průvodce pro konkrétní platformy
- [Váš první projekt](docs/chapter-01-foundation/first-project.md) - Praktický tutoriál
- [Přehled příkazů](resources/cheat-sheet.md) - Rychlá reference

#### Praktický výsledek
Úspěšné nasazení jednoduché webové aplikace na Azure pomocí AZD

---

### Kapitola 2: Vývoj zaměřený na AI (1-2 hodiny) 🤖
**Předpoklady**: Dokončená kapitola 1  
**Složitost**: ⭐⭐

#### Co se naučíte
- Integrace Microsoft Foundry s AZD
- Nasazení AI aplikací
- Porozumění konfiguracím AI služeb
- Vzory RAG (Retrieval-Augmented Generation)

#### Výukové zdroje
- [Integrace Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [Nasazení AI modelů](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI workshop laboratoř](docs/chapter-02-ai-development/ai-workshop-lab.md) - **NOVÉ**: Komplexní 2-3 hodinové praktické cvičení
- [Interaktivní průvodce workshopem](workshop/README.md) - **NOVÉ**: Prohlížečový workshop s MkDocs náhledem
- [Microsoft Foundry šablony](README.md#featured-microsoft-foundry-templates)
- [Instrukce pro workshop](../../workshop/docs/instructions) - **NOVÉ**: Řízená cvičení krok za krokem

#### Praktický výsledek
Nasadit a nakonfigurovat AI chatovací aplikaci s RAG funkcionalitou

#### Učební cesta workshopu (volitelné rozšíření)
**NOVÁ interaktivní zkušenost**: [Kompletní průvodce workshopem](workshop/README.md)
1. **Objevování** (30 min): Výběr a vyhodnocení šablony
2. **Nasazení** (45 min): Nasadit a ověřit funkčnost AI šablony  
3. **De-konstrukce** (30 min): Porozumět architektuře a komponentám šablony
4. **Konfigurace** (30 min): Přizpůsobit nastavení a parametry
5. **Přizpůsobení** (45 min): Upravit a iterovat pro šitý na míru výsledek
6. **Ukončení** (15 min): Úklid zdrojů a porozumění životnímu cyklu
7. **Závěr** (15 min): Další kroky a pokročilé učební cesty

---

### Kapitola 3: Konfigurace a autentizace (45-60 minut) ⚙️
**Předpoklady**: Dokončená kapitola 1  
**Složitost**: ⭐⭐

#### Co se naučíte
- Konfigurace a správa prostředí
- Nejlepší praktiky autentizace a bezpečnosti
- Pojmenování a organizace zdrojů
- Nasazení ve více prostředích

#### Výukové zdroje
- [Průvodce konfigurací](docs/chapter-03-configuration/configuration.md) - Nastavení prostředí
- [Vzorové zabezpečení a autentizace](docs/chapter-03-configuration/authsecurity.md) - Spravovaná identita a integrace Key Vaultu
- Příklady pro více prostředí

#### Praktický výsledek
Spravovat více prostředí s správnou autentizací a zabezpečením

---

### Kapitola 4: Infrastruktura jako kód a nasazení (1-1,5 hodiny) 🏗️
**Předpoklady**: Dokončené kapitoly 1-3  
**Složitost**: ⭐⭐⭐

#### Co se naučíte
- Pokročilé vzory nasazení
- Infrastruktura jako kód pomocí Bicep
- Strategie poskytování zdrojů
- Vytváření vlastních šablon

- Nasazení kontejnerových aplikací s Azure Container Apps a AZD

#### Výukové zdroje
- [Průvodce nasazením](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletní pracovní postupy
- [Provisioning zdrojů](docs/chapter-04-infrastructure/provisioning.md) - Správa zdrojů
- Příklady kontejnerů a mikroslužeb
- [Příklady Container Apps](examples/container-app/README.md) - Rychlý start, produkční a pokročilé vzory nasazení

#### Praktický výsledek
Nasadit složité víceslužbové aplikace pomocí vlastních infrastrukturních šablon

---

### Kapitola 5: Multi-agentní AI řešení (2-3 hodiny) 🤖🤖
**Předpoklady**: Dokončené kapitoly 1-2  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Vzory multi-agentní architektury
- Orchestrace a koordinace agentů
- AI nasazení připravená pro produkci
- Implementace zákaznických a inventárních agentů

- Integrace kontejnerizovaných mikroslužeb jako součást agentních řešení

#### Výukové zdroje
- [Retail multi-agentní řešení](examples/retail-scenario.md) - Architektonický plán, nikoli kompletní aplikace
- [ARM šablona balíček](../../examples/retail-multiagent-arm-template) - Infrastrukturní kostra s předpoklady implementace
- Vzory koordinace multi-agentů
- [Příklad architektury mikroslužeb](../../examples/container-app/microservices) - Komunikace služba-služba, asynchronní zprávy a produkční nasazení

#### Praktický výsledek
Navrhnete multi-agentní AI řešení a identifikujete požadovanou implementaci aplikace, validaci a provozní práci přesahující samotný provisioning infrastruktury

---

### Kapitola 6: Validace a plánování před nasazením (1 hodina) 🔍
**Předpoklady**: Dokončená kapitola 4  
**Složitost**: ⭐⭐

#### Co se naučíte
- Plánování kapacity a validace zdrojů
- Strategie výběru SKU
- Kontroly před nasazením a automatizace
- Plánování optimalizace nákladů

#### Výukové zdroje
- [Plánování kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) - Validace zdrojů
- [Výběr SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Nákladově efektivní volby
- [Kontroly před nasazením](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizované skripty
- [Integrace Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorování a observabilita
- [Vzory koordinace multi-agentů](docs/chapter-06-pre-deployment/coordination-patterns.md) - Strategie orchestrace agentů

#### Praktický výsledek
Validovat a optimalizovat nasazení před spuštěním

---

### Kapitola 7: Řešení problémů a ladění (1-1,5 hodiny) 🔧
**Předpoklady**: Dokončená jakákoliv kapitola o nasazení  
**Složitost**: ⭐⭐

#### Co se Naučíte
- Systematické přístupy k ladění
- Běžné problémy a řešení
- Řešení problémů specifických pro AI
- Optimalizace výkonu

#### Vzdělávací Zdroje
- [Běžné Problémy](docs/chapter-07-troubleshooting/common-issues.md) - FAQ a řešení
- [Průvodce Laděním](docs/chapter-07-troubleshooting/debugging.md) - Strategie krok za krokem
- [Řešení Problémů v AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problémy s AI službami

#### Praktický Výsledek
Samostatná diagnostika a řešení běžných problémů nasazení

---

### Kapitola 8: Produkční & Podnikové Vzory (2-3 hodiny) 🏢
**Předpoklady**: Kapitoly 1-4 dokončeny  
**Složitost**: ⭐⭐⭐⭐

#### Co se Naučíte
- Strategie produkčního nasazení
- Podnikové bezpečnostní vzory
- Monitorování a optimalizace nákladů
- Škálovatelnost a řízení

- Nejlepší postupy pro produkční nasazení kontejnerových aplikací (bezpečnost, monitorování, náklady, CI/CD)

#### Vzdělávací Zdroje
- [Nejlepší Průmyslové Praktiky AI v Produkci](docs/chapter-08-production/production-ai-practices.md) - Podnikové vzory
- Příklady mikroslužeb a podnikové příklady
- Rámce pro monitorování a řízení
- [Příklad Architektury Mikroslužeb](../../examples/container-app/microservices) - Blue-green/canary nasazení, distribuované trasování a optimalizace nákladů

#### Praktický Výsledek
Nasazení aplikací připravených pro podnik s plnými produkčními schopnostmi

---

## Postup Učení a Složitost

### Postupné Budování Dovedností

- **🌱 Začátečníci**: Začněte Kapitolou 1 (Základy) → Kapitola 2 (Vývoj AI)
- **🔧 Středně pokročilí**: Kapitoly 3-4 (Konfigurace & Infrastruktura) → Kapitola 6 (Validace)
- **🚀 Pokročilí**: Kapitola 5 (Řešení s Více Agenty) → Kapitola 7 (Řešení Problémů)
- **🏢 Podnikové**: Dokončit všechny kapitoly, zaměřit se na Kapitolu 8 (Produkční Vzory)

- **Cesta Kontejnerových Aplikací**: Kapitoly 4 (Kontejnerizované nasazení), 5 (Integrace mikroslužeb), 8 (Produkční nejlepší praxe)

### Indikátory Složitosti

- **⭐ Základní**: Jednotlivé koncepty, řízené tutoriály, 30-60 minut
- **⭐⭐ Střední**: Více konceptů, praktický nácvik, 1-2 hodiny  
- **⭐⭐⭐ Pokročilý**: Složité architektury, vlastní řešení, 1-3 hodiny
- **⭐⭐⭐⭐ Expert**: Produkční systémy, podnikové vzory, 2-4 hodiny

### Flexibilní Cesty Učení

#### 🎯 Rychlá Cesta Vývojáře AI (4-6 hodin)
1. **Kapitola 1**: Základy & Rychlý Start (45 min)
2. **Kapitola 2**: Vývoj orientovaný na AI (2 hodiny)  
3. **Kapitola 5**: Řešení Multi-Agent AI (3 hodiny)
4. **Kapitola 8**: Produkční nejlepší praktiky AI (1 hodina)

#### 🛠️ Cesta Specialisty na Infrastrukturu (5-7 hodin)
1. **Kapitola 1**: Základy & Rychlý Start (45 min)
2. **Kapitola 3**: Konfigurace & Autentizace (1 hodina)
3. **Kapitola 4**: Infrastruktura jako Kód & Nasazení (1,5 hodiny)
4. **Kapitola 6**: Validace a Plánování před Nasazením (1 hodina)
5. **Kapitola 7**: Řešení Problémů & Ladění (1,5 hodiny)
6. **Kapitola 8**: Produkční & Podnikové Vzory (2 hodiny)

#### 🎓 Kompletní Učební Plán (8-12 hodin)
Postupné dokončení všech 8 kapitol s praktickým nácvikem a ověřováním

## Rámec Dokončení Kurzu

### Ověření Znalostí
- **Kontrolní body kapitol**: Praktická cvičení s měřitelnými výsledky
- **Ověření praxí**: Nasazení funkčních řešení pro každou kapitolu
- **Sledování pokroku**: Vizualizace a odznaky dokončení
- **Ověření komunitou**: Sdílení zkušeností v kanálech Azure Discord

### Hodnocení Výsledků Učení

#### Dokončení Kapitol 1-2 (Základy + AI)
- ✅ Nasadit základní webovou aplikaci pomocí AZD
- ✅ Nasadit AI-poháněnou chatovací aplikaci s RAG
- ✅ Pochopit základní koncepty AZD a integraci AI

#### Dokončení Kapitol 3-4 (Konfigurace + Infrastruktura)  
- ✅ Řídit nasazení v několika prostředích
- ✅ Vytvořit vlastní šablony infrastruktury v Bicepu
- ✅ Implementovat bezpečné autentizační vzory

#### Dokončení Kapitol 5-6 (Multi-Agent + Validace)
- ✅ Nasadit složité multi-agent AI řešení
- ✅ Provést plánování kapacity a optimalizaci nákladů
- ✅ Implementovat automatizovanou validaci před nasazením

#### Dokončení Kapitol 7-8 (Řešení problémů + Produkce)
- ✅ Samostatně ladit a řešit problémy s nasazením  
- ✅ Implementovat monitorování a zabezpečení na podnikové úrovni
- ✅ Nasadit aplikace připravené pro produkci s řízením

### Certifikace a Uznavání
- **Odznak dokončení kurzu**: Dokončit všech 8 kapitol s praktickou validací
- **Uznání v komunitě**: Aktivní účast v Microsoft Foundry Discordu
- **Profesní rozvoj**: Průmyslově relevantní dovednosti v AZD a AI nasazení
- **Kariérní postup**: Schopnosti produkčního cloudového nasazení v podnikové úrovni

## 🎓 Komplexní Výsledky Učení

### Úroveň Základů (Kapitoly 1-2)
Po dokončení základních kapitol budou studenti schopni:

**Technické Schopnosti:**
- Nasadit jednoduché webové aplikace do Azure pomocí příkazů AZD
- Konfigurovat a nasazovat AI chatovací aplikace s podporou RAG
- Pochopit základní koncepty AZD: šablony, prostředí, workflow provisioning
- Integrovat Microsoft Foundry služby s AZD nasazením
- Navigovat konfigurace Azure AI služeb a API endpointy

**Profesní Dovednosti:**
- Dodržovat strukturované workflow nasazení pro konzistentní výsledky
- Řešit základní problémy nasazení pomocí logů a dokumentace
- Efektivně komunikovat o procesech cloudového nasazení
- Používat osvědčené postupy pro bezpečnou integraci AI služeb

**Ověření Učení:**
- ✅ Úspěšně nasadit `todo-nodejs-mongo` šablonu
- ✅ Nasadit a konfigurovat `azure-search-openai-demo` s RAG
- ✅ Dokončit interaktivní cvičení na workshopu (fáze Discovery)
- ✅ Účastnit se diskuzí v komunitě Azure Discord

### Středně Pokročilá Úroveň (Kapitoly 3-4)
Po dokončení středně pokročilých kapitol budou studenti schopni:

**Technické Schopnosti:**
- Řídit nasazení ve více prostředích (vývoj, test, produkce)
- Vytvořit vlastní Bicep šablony pro infrastrukturu jako kód
- Implementovat bezpečné autentizační vzory pomocí spravované identity
- Nasadit složité aplikace s vícero službami a vlastní konfigurací
- Optimalizovat strategie provisioning zdrojů pro náklady a výkon

**Profesní Dovednosti:**
- Navrhovat škálovatelné infrastruktury
- Uplatňovat bezpečnostní nejlepší postupy pro cloudová nasazení
- Dokumentovat vzory infrastruktury pro týmovou spolupráci
- Hodnotit a vybírat vhodné Azure služby dle požadavků

**Ověření Učení:**
- ✅ Konfigurovat samostatná prostředí se specifickým nastavením
- ✅ Vytvořit a nasadit vlastní Bicep šablonu pro víceslužbovou aplikaci
- ✅ Implementovat autentizaci spravovanou identitou pro bezpečný přístup
- ✅ Dokončit cvičení správy konfigurace s reálnými scénáři

### Pokročilá Úroveň (Kapitoly 5-6)
Po dokončení pokročilých kapitol budou studenti schopni:

**Technické Schopnosti:**
- Nasadit a koordinovat multi-agent AI řešení s řízenými workflow
- Implementovat architektury zákaznických a inventárních agentů pro maloobchodní scénáře
- Provádět komplexní plánování kapacity a validaci zdrojů
- Provést automatizovanou validaci a optimalizaci před nasazením
- Navrhnout nákladově efektivní výběr SKU dle požadavků na zátěž

**Profesní Dovednosti:**
- Navrhovat komplexní AI řešení pro produkční prostředí
- Vést technické diskuze o strategiích nasazení AI
- Mentorovat juniorní vývojáře v AZD a AI nejlepších postupech
- Hodnotit a doporučovat AI architektonické vzory dle obchodních požadavků

**Ověření Učení:**
- ✅ Prozkoumat maloobchodní multi-agent blueprint a rozlišit nasazenou infrastrukturu od chybějící implementace aplikace
- ✅ Demonstrovat koordinaci agentů a řízení workflow
- ✅ Dokončit cvičení plánování kapacity s reálnými omezeními zdrojů
- ✅ Ověřit připravenost nasazení prostřednictvím automatizovaných kontrol před startem

### Expertní Úroveň (Kapitoly 7-8)
Po dokončení expertních kapitol budou studenti schopni:

**Technické Schopnosti:**
- Diagnostikovat a samostatně řešit složité problémy nasazení
- Implementovat podnikové bezpečnostní vzory a rámce řízení
- Navrhovat komplexní strategie monitorování a upozornění
- Optimalizovat produkční nasazení pro škálovatelnost, náklady a výkon
- Zavést CI/CD pipeline s řádným testováním a validací

**Profesní Dovednosti:**
- Vést podnikové iniciativy pro cloudovou transformaci
- Navrhovat a implementovat organizační standardy nasazení
- Školit a mentorovat vývojové týmy v pokročilých praktikách AZD
- Ovlivňovat technická rozhodnutí pro podniková AI nasazení

**Ověření Učení:**
- ✅ Vyřešit složité selhání nasazení víceslužbových aplikací
- ✅ Implementovat podnikové bezpečnostní vzory v souladu s požadavky na shodu
- ✅ Navrhnout a nasadit produkční monitorování pomocí Application Insights
- ✅ Dokončit implementaci rámce podnikové správy

## 🎯 Certifikace Dokončení Kurzu

### Rámec sledování postupu
Sledujte svůj pokrok prostřednictvím strukturovaných kontrolních bodů:

- [ ] **Kapitola 1**: Základy & Rychlý Start ✅
- [ ] **Kapitola 2**: Vývoj orientovaný na AI ✅  
- [ ] **Kapitola 3**: Konfigurace & Autentizace ✅
- [ ] **Kapitola 4**: Infrastruktura jako Kód & Nasazení ✅
- [ ] **Kapitola 5**: Řešení Multi-Agent AI ✅
- [ ] **Kapitola 6**: Validace a Plánování před Nasazením ✅
- [ ] **Kapitola 7**: Řešení Problémů & Ladění ✅
- [ ] **Kapitola 8**: Produkční & Podnikové Vzory ✅

### Proces Ověření
Po dokončení každé kapitoly ověřte své znalosti prostřednictvím:

1. **Dokončení praktického cvičení**: Nasazení funkčních řešení pro každou kapitolu
2. **Hodnocení znalostí**: Projít FAQ sekce a dokončit sebehodnocení
3. **Zapojení do komunity**: Sdílení zkušeností a zpětné vazby v Azure Discord
4. **Vývoj portfolia**: Dokumentovat nasazení a poznatky
5. **Přezkum od vrstevníků**: Spolupracovat s ostatními studenty na složitých scénářích

### Výhody Dokončení Kurzu
Po dokončení všech kapitol s ověřením získají absolventi:

**Technická Odbornost:**
- **Produkční Zkušenosti**: Nasazení reálných AI aplikací do Azure prostředí
- **Profesní Dovednosti**: Schopnosti podnikového nasazení a řešení problémů  
- **Ználost Architektury**: Multi-agent AI řešení a složité infrastrukturní vzory
- **Mistři Řešení Problémů**: Samostatné řešení problémů nasazení a konfigurace

**Profesní Rozvoj:**
- **Uznání v Odvětví**: Ověřitelné dovednosti v AZD a AI nasazení s vysokou poptávkou
- **Postup v Kariéře**: Kvalifikace pro role cloud architekta a specialisty AI nasazení
- **Vůdcovství v Komunitě**: Aktivní členství v Azure vývojářských a AI komunitách
- **Nepřetržité Učení**: Základ pro pokročilou specializaci Microsoft Foundry

**Aktiva Portfolia:**
- **Nasazená Řešení**: Fungující příklady AI aplikací a infrastruktury
- **Dokumentace**: Komplexní návody na nasazení a postupy řešení problémů  
- **Příspěvky Komunitě**: Diskuze, příklady a zlepšení sdílená s Azure komunitou
- **Profesní Síť**: Kontakty na Azure experty a praktiky AI nasazení

### Cesta Učení po Kurzu
Absolventi jsou připraveni pro pokročilou specializaci v:
- **Microsoft Foundry Expert**: Hluboká specializace v nasazování a orchestraci AI modelů
- **Vedoucí Cloudové Architektury**: Návrh a řízení nasazení v podnikovém měřítku
- **Vůdcovství Vývojářské Komunity**: Přispívání do Azure ukázek a komunitních zdrojů
- **Firemní Školení**: Výuka dovedností AZD a AI nasazení v organizacích

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->