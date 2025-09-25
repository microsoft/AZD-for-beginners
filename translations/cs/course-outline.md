<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "aace36eff845763a5b041a4ed9a33e02",
  "translation_date": "2025-09-25T00:54:18+00:00",
  "source_file": "course-outline.md",
  "language_code": "cs"
}
-->
# AZD pro začátečníky: Osnova kurzu a vzdělávací rámec

## Přehled kurzu

Ovládněte Azure Developer CLI (azd) prostřednictvím strukturovaných kapitol navržených pro postupné učení. **Zvláštní důraz na nasazení AI aplikací s integrací Azure AI Foundry.**

### Proč je tento kurz nezbytný pro moderní vývojáře

Na základě poznatků z komunity Azure AI Foundry na Discordu **45 % vývojářů chce používat AZD pro AI pracovní zátěže**, ale naráží na problémy s:
- Složitými AI architekturami zahrnujícími více služeb
- Nejlepšími postupy pro nasazení AI do produkce  
- Integrací a konfigurací služeb Azure AI
- Optimalizací nákladů na AI pracovní zátěže
- Řešením problémů specifických pro nasazení AI

### Hlavní vzdělávací cíle

Po absolvování tohoto strukturovaného kurzu budete:
- **Ovládat základy AZD**: Základní koncepty, instalace a konfigurace
- **Nasazovat AI aplikace**: Používat AZD se službami Azure AI Foundry
- **Implementovat infrastrukturu jako kód**: Spravovat Azure zdroje pomocí Bicep šablon
- **Řešit problémy při nasazení**: Odstraňovat běžné problémy a ladit chyby
- **Optimalizovat pro produkci**: Zabezpečení, škálování, monitoring a řízení nákladů
- **Vytvářet řešení s více agenty**: Nasazovat komplexní AI architektury

## 🎓 Workshopová vzdělávací zkušenost

### Flexibilní možnosti doručení výuky
Tento kurz je navržen tak, aby podporoval jak **samostatné individuální učení**, tak **facilitované workshopové sezení**, což umožňuje účastníkům získat praktické zkušenosti s AZD a rozvíjet dovednosti prostřednictvím interaktivních cvičení.

#### 🚀 Samostatný režim učení
**Ideální pro individuální vývojáře a kontinuální vzdělávání**

**Vlastnosti:**
- **Rozhraní v prohlížeči**: Workshop poháněný MkDocs dostupný přes jakýkoliv webový prohlížeč
- **Integrace GitHub Codespaces**: Jedním kliknutím vytvoříte vývojové prostředí s předkonfigurovanými nástroji
- **Interaktivní DevContainer prostředí**: Není potřeba lokální nastavení - začněte kódovat okamžitě
- **Sledování pokroku**: Vestavěné kontrolní body a validační cvičení
- **Podpora komunity**: Přístup k Azure Discord kanálům pro dotazy a spolupráci

**Struktura učení:**
- **Flexibilní časový plán**: Dokončete kapitoly vlastním tempem během dní nebo týdnů
- **Systém kontrolních bodů**: Ověřte si znalosti před přechodem na složitější témata
- **Knihovna zdrojů**: Komplexní dokumentace, příklady a průvodci řešením problémů
- **Rozvoj portfolia**: Vytvářejte nasaditelné projekty pro profesionální portfolia

**Začínáme (samostatné učení):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Facilitované workshopové sezení
**Ideální pro firemní školení, bootcampy a vzdělávací instituce**

**Formáty workshopu:**

**📚 Integrace do akademického kurzu (8-12 týdnů)**
- **Univerzitní programy**: Semestrální kurz s týdenními 2hodinovými sezeními
- **Bootcampový formát**: Intenzivní 3-5denní program s denními 6-8hodinovými sezeními
- **Firemní školení**: Měsíční týmová sezení s praktickou implementací projektů
- **Rámec hodnocení**: Hodnocené úkoly, peer review a závěrečné projekty

**🚀 Intenzivní workshop (1-3 dny)**
- **Den 1**: Základy + AI vývoj (kapitoly 1-2) - 6 hodin
- **Den 2**: Konfigurace + infrastruktura (kapitoly 3-4) - 6 hodin  
- **Den 3**: Pokročilé vzory + produkce (kapitoly 5-8) - 8 hodin
- **Následná podpora**: Volitelný 2týdenní mentoring pro dokončení projektu

**⚡ Exekutivní briefing (4-6 hodin)**
- **Strategický přehled**: Hodnota AZD a dopad na podnikání (1 hodina)
- **Praktická ukázka**: Nasazení AI aplikace od začátku do konce (2 hodiny)
- **Přehled architektury**: Podnikové vzory a správa (1 hodina)
- **Plán implementace**: Strategie adopce v organizaci (1-2 hodiny)

#### 🛠️ Metodologie workshopového učení
**Objevování → Nasazení → Přizpůsobení pro rozvoj praktických dovedností**

**Fáze 1: Objevování (45 minut)**
- **Průzkum šablon**: Hodnocení šablon a služeb Azure AI Foundry
- **Analýza architektury**: Porozumění vzorům s více agenty a strategiím nasazení
- **Hodnocení požadavků**: Identifikace potřeb a omezení organizace
- **Nastavení prostředí**: Konfigurace vývojového prostředí a Azure zdrojů

**Fáze 2: Nasazení (2 hodiny)**
- **Řízená implementace**: Krok za krokem nasazení AI aplikací pomocí AZD
- **Konfigurace služeb**: Nastavení služeb Azure AI, endpointů a autentizace
- **Implementace zabezpečení**: Použití podnikových vzorů zabezpečení a řízení přístupu
- **Testování validace**: Ověření nasazení a řešení běžných problémů

**Fáze 3: Přizpůsobení (45 minut)**
- **Úprava aplikace**: Přizpůsobení šablon pro specifické případy použití a požadavky
- **Optimalizace pro produkci**: Implementace monitoringu, řízení nákladů a škálování
- **Pokročilé vzory**: Zkoumání koordinace více agentů a komplexních architektur
- **Plánování dalších kroků**: Definování vzdělávací cesty pro další rozvoj dovedností

#### 🎯 Výstupy workshopového učení
**Měřitelné dovednosti získané prostřednictvím praktického cvičení**

**Technické kompetence:**
- **Nasazení produkčních AI aplikací**: Úspěšné nasazení a konfigurace AI řešení
- **Ovládnutí infrastruktury jako kódu**: Vytváření a správa vlastních Bicep šablon
- **Architektura s více agenty**: Implementace koordinovaných AI řešení s více agenty
- **Připravenost na produkci**: Použití vzorů zabezpečení, monitoringu a správy
- **Expertíza v řešení problémů**: Samostatné řešení problémů při nasazení a konfiguraci

**Profesní dovednosti:**
- **Vedení projektů**: Vedení technických týmů při cloudových iniciativách
- **Návrh architektury**: Návrh škálovatelných a nákladově efektivních řešení Azure
- **Předávání znalostí**: Školení a mentoring kolegů v nejlepších postupech AZD
- **Strategické plánování**: Ovlivňování strategií adopce cloudu v organizaci

#### 📋 Workshopové zdroje a materiály
**Komplexní sada nástrojů pro facilitátory a účastníky**

**Pro facilitátory:**
- **Průvodce instruktora**: [Workshop Facilitation Guide](workshop/docs/instructor-guide.md) - Tipy pro plánování a vedení sezení
- **Prezentace**: Prezentace, diagramy architektury a skripty pro ukázky
- **Nástroje hodnocení**: Praktická cvičení, kontrolní otázky a hodnotící rubriky
- **Technické nastavení**: Konfigurace prostředí, průvodci řešením problémů a záložní plány

**Pro účastníky:**
- **Interaktivní workshopové prostředí**: [Workshop Materials](workshop/README.md) - Platforma pro učení v prohlížeči
- **Krok za krokem instrukce**: [Guided Exercises](../../workshop/docs/instructions) - Podrobné návody k implementaci  
- **Referenční dokumentace**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Hloubkové zaměření na AI
- **Komunitní zdroje**: Azure Discord kanály, GitHub diskuse a odborná podpora

#### 🏢 Implementace workshopu v podniku
**Strategie nasazení a školení v organizaci**

**Firemní školicí programy:**
- **Onboarding vývojářů**: Orientace nových zaměstnanců na základy AZD (2-4 týdny)
- **Zvyšování kvalifikace týmů**: Čtvrtletní workshopy pro stávající vývojové týmy (1-2 dny)
- **Přezkum architektury**: Měsíční sezení pro seniorní inženýry a architekty (4 hodiny)
- **Briefing pro vedení**: Exekutivní workshopy pro technické rozhodovatele (půldenní)

**Podpora implementace:**
- **Návrh workshopu na míru**: Obsah přizpůsobený specifickým potřebám organizace
- **Řízení pilotního programu**: Strukturované zavedení s metrikami úspěchu a zpětnou vazbou  
- **Dlouhodobý mentoring**: Podpora po workshopu pro implementaci projektů
- **Budování komunity**: Interní komunity vývojářů Azure AI a sdílení znalostí

**Metriky úspěchu:**
- **Získání dovedností**: Před/po hodnocení měřící růst technických kompetencí
- **Úspěšnost nasazení**: Procento účastníků úspěšně nasazujících produkční aplikace
- **Čas do produktivity**: Zkrácení doby onboardingu pro nové projekty Azure AI
- **Udržení znalostí**: Následné hodnocení 3-6 měsíců po workshopu

## Struktura učení v 8 kapitolách

### Kapitola 1: Základy a rychlý start (30-45 minut) 🌱
**Předpoklady**: Azure předplatné, základní znalost příkazového řádku  
**Složitost**: ⭐

#### Co se naučíte
- Porozumění základům Azure Developer CLI
- Instalace AZD na vaší platformě  
- Vaše první úspěšné nasazení
- Základní koncepty a terminologie

#### Zdroje k učení
- [AZD Základy](docs/getting-started/azd-basics.md) - Základní koncepty
- [Instalace a nastavení](docs/getting-started/installation.md) - Průvodce specifický pro platformu
- [Váš první projekt](docs/getting-started/first-project.md) - Praktický tutoriál
- [Tahák příkazů](resources/cheat-sheet.md) - Rychlý přehled

#### Praktický výsledek
Úspěšně nasadíte jednoduchou webovou aplikaci na Azure pomocí AZD

---

### Kapitola 2: Vývoj zaměřený na AI (1-2 hodiny) 🤖
**Předpoklady**: Dokončená kapitola 1  
**Složitost**: ⭐⭐

#### Co se naučíte
- Integrace Azure AI Foundry s AZD
- Nasazení aplikací poháněných AI
- Porozumění konfiguracím AI služeb
- Vzory RAG (Retrieval-Augmented Generation)

#### Zdroje k učení
- [Integrace Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- [Nasazení AI modelů](docs/ai-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - **NOVÉ**: Komplexní 2-3hodinový praktický lab
- [Interaktivní průvodce workshopem](workshop/README.md) - **NOVÉ**: Workshop s náhledem MkDocs
- [Šablony Azure AI Foundry](README.md#featured-azure-ai-foundry-templates)
- [Instrukce workshopu](../../workshop/docs/instructions) - **NOVÉ**: Krok za krokem vedené cvičení

#### Praktický výsledek
Nasadíte a nakonfigurujete AI aplikaci pro chat s funkcemi RAG

#### Workshopová vzdělávací cesta (volitelné rozšíření)
**NOVÁ interaktivní zkušenost**: [Kompletní průvodce workshopem](workshop/README.md)
1. **Objevování** (30 minut): Výběr a hodnocení šablon
2. **Nasazení** (45 minut): Nasazení a ověření funkčnosti AI šablony  
3. **Rozbor** (30 minut): Porozumění architektuře a komponentám šablony
4. **Konfigurace** (30 minut): Přizpůsobení nastavení a parametrů
5. **Přizpůsobení** (45 minut): Úpravy a iterace podle vašich potřeb
6. **Odstranění** (15 minut): Vyčištění zdrojů a porozumění životnímu cyklu
7. **Závěr** (15 minut): Další kroky a pokročilé vzdělávací cesty

---

### Kapitola 3: Konfigurace a autentizace (45-60 minut) ⚙️
**Předpoklady**: Dokončená kapitola 1  
**Složitost**: ⭐⭐

#### Co se naučíte
- Konfigurace a správa prostředí
- Nejlepší postupy pro autentizaci a zabezpečení
- Pojmenování a organizace zdrojů
- Nasazení do více prostředí

#### Zdroje k učení
- [Průvodce konfigurací](docs/getting-started/configuration.md) - Nastavení prostředí
- Vzory zabezpečení a spravovaná identita
- Příklady pro více prostředí

#### Praktický výsledek
Spravujete více prostředí s odpovídající autentizací a zabezpečením

---

### Kapitola 4: Infrastruktura jako kód a nasazení (1-1,5 hodiny) 🏗️
**Předpoklady**: Dokončené kapitoly 1-3  
**Složitost**: ⭐⭐⭐

#### Co se naučíte
- Pokročilé vzory nasazení
- Infrastruktura jako kód pomocí Bicep
- Strategie pro zajištění zdrojů
- Vytváření vlastních šablon

#### Zdroje k učení
- [Průvodce nasazením](docs/deployment/deployment-guide.md) - Kompletní pracovní postupy
- [Zajištění zdrojů](docs/deployment/provisioning.md) - Správa zdrojů
- Příklady kontejnerů a mikroslužeb

#### Praktický výsledek
Nasadíte komplexní aplikace zahrnující více služeb pomocí vlastních šablon infrastruktury

---

### Kapitola 5: Řešení s více agenty AI (2-3 hodiny) 🤖🤖
**Předpoklady**: Dokončené kapitoly 1-2  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Vzory architektury s více agenty
- Orchestrace a koordinace agentů
- Produkční nasazení AI
- Implementace agentů pro zákazníky a inventář

#### Zdroje k učení
- [Řešení s více agenty pro maloobchod](examples/retail-scenario.md) - Kompletní implementace
- [Balíček ARM šablon](../../examples/retail-multiagent-arm-template) - Nasazení jedním kliknutím
- Vzory koordinace více agentů

#### Praktický výsledek
Nasadíte a spravujete produkční řešení AI s více agenty

---

### Kapitola 6: Validace před nasazením a plánování (1 hodina) 🔍
**Předpoklady**: Dokončená kapitola 4  
**Složitost**: ⭐⭐

#### Co se naučíte
- Plánování kapacity a validace zdrojů
- Strategie výběru SKU
- Automatizované kontroly před nasazením
- Plánování optimalizace nákladů

#### Zdroje k učení
- [Plánování kapacity](docs/pre-deployment/c
- [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Problémy s AI službami

#### Praktický výsledek
Samostatně diagnostikovat a řešit běžné problémy s nasazením

---

### Kapitola 8: Produkční a podnikové vzory (2-3 hodiny) 🏢
**Předpoklady**: Dokončené kapitoly 1-4  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Strategie nasazení do produkce
- Bezpečnostní vzory pro podnikové prostředí
- Monitoring a optimalizace nákladů
- Škálovatelnost a správa

#### Výukové materiály
- [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - Podnikové vzory
- Příklady mikroslužeb a podnikových aplikací
- Rámce pro monitoring a správu

#### Praktický výsledek
Nasadit aplikace připravené pro podnikové prostředí s plnými produkčními schopnostmi

---

## Postup učení a složitost

### Postupné budování dovedností

- **🌱 Začátečníci**: Začněte kapitolou 1 (Základy) → Kapitola 2 (Vývoj AI)
- **🔧 Středně pokročilí**: Kapitoly 3-4 (Konfigurace & infrastruktura) → Kapitola 6 (Validace)
- **🚀 Pokročilí**: Kapitola 5 (Řešení s více agenty) → Kapitola 7 (Řešení problémů)
- **🏢 Podnikové prostředí**: Dokončete všechny kapitoly, zaměřte se na kapitolu 8 (Produkční vzory)

### Indikátory složitosti

- **⭐ Základní**: Jednoduché koncepty, vedené tutoriály, 30-60 minut
- **⭐⭐ Střední**: Více konceptů, praktická cvičení, 1-2 hodiny  
- **⭐⭐⭐ Pokročilé**: Složité architektury, vlastní řešení, 1-3 hodiny
- **⭐⭐⭐⭐ Expertní**: Produkční systémy, podnikové vzory, 2-4 hodiny

### Flexibilní učební cesty

#### 🎯 Rychlá cesta pro vývojáře AI (4-6 hodin)
1. **Kapitola 1**: Základy & rychlý start (45 minut)
2. **Kapitola 2**: Vývoj zaměřený na AI (2 hodiny)  
3. **Kapitola 5**: Řešení s více agenty (3 hodiny)
4. **Kapitola 8**: Nejlepší praktiky pro produkční AI (1 hodina)

#### 🛠️ Cesta pro specialisty na infrastrukturu (5-7 hodin)
1. **Kapitola 1**: Základy & rychlý start (45 minut)
2. **Kapitola 3**: Konfigurace & autentizace (1 hodina)
3. **Kapitola 4**: Infrastruktura jako kód & nasazení (1,5 hodiny)
4. **Kapitola 6**: Validace & plánování před nasazením (1 hodina)
5. **Kapitola 7**: Řešení problémů & ladění (1,5 hodiny)
6. **Kapitola 8**: Produkční & podnikové vzory (2 hodiny)

#### 🎓 Kompletní učební cesta (8-12 hodin)
Postupné dokončení všech 8 kapitol s praktickými cvičeními a validací

## Rámec pro dokončení kurzu

### Validace znalostí
- **Kontrolní body kapitol**: Praktická cvičení s měřitelnými výsledky
- **Ověření v praxi**: Nasazení funkčních řešení pro každou kapitolu
- **Sledování pokroku**: Vizualizace pokroku a odznaky za dokončení
- **Validace komunitou**: Sdílení zkušeností na Azure Discord kanálech

### Hodnocení výsledků učení

#### Dokončení kapitol 1-2 (Základy + AI)
- ✅ Nasadit základní webovou aplikaci pomocí AZD
- ✅ Nasadit AI aplikaci pro chat s RAG
- ✅ Porozumět základním konceptům AZD a integraci AI

#### Dokončení kapitol 3-4 (Konfigurace + infrastruktura)  
- ✅ Spravovat nasazení do více prostředí
- ✅ Vytvořit vlastní šablony infrastruktury pomocí Bicep
- ✅ Implementovat bezpečné vzory autentizace

#### Dokončení kapitol 5-6 (Více agentů + validace)
- ✅ Nasadit komplexní řešení s více agenty
- ✅ Provést plánování kapacity a optimalizaci nákladů
- ✅ Implementovat automatizovanou validaci před nasazením

#### Dokončení kapitol 7-8 (Řešení problémů + produkce)
- ✅ Samostatně ladit a řešit problémy s nasazením  
- ✅ Implementovat monitoring a bezpečnost na podnikové úrovni
- ✅ Nasadit aplikace připravené pro produkční prostředí se správou

### Certifikace a uznání
- **Odznak za dokončení kurzu**: Dokončení všech 8 kapitol s praktickou validací
- **Uznání komunitou**: Aktivní účast na Azure AI Foundry Discord
- **Profesní rozvoj**: Relevantní dovednosti v oblasti AZD a nasazení AI
- **Kariérní růst**: Schopnosti pro nasazení cloudových řešení na podnikové úrovni

## 🎓 Komplexní výsledky učení

### Úroveň základů (Kapitoly 1-2)
Po dokončení základních kapitol budou studenti schopni:

**Technické dovednosti:**
- Nasadit jednoduché webové aplikace na Azure pomocí příkazů AZD
- Konfigurovat a nasadit AI aplikace pro chat s RAG funkcemi
- Porozumět základním konceptům AZD: šablony, prostředí, pracovní postupy
- Integrovat služby Azure AI Foundry s nasazením AZD
- Navigovat konfigurace služeb Azure AI a API koncové body

**Profesní dovednosti:**
- Dodržovat strukturované pracovní postupy nasazení pro konzistentní výsledky
- Řešit základní problémy s nasazením pomocí logů a dokumentace
- Efektivně komunikovat o procesech nasazení do cloudu
- Aplikovat nejlepší praktiky pro bezpečnou integraci AI služeb

**Ověření učení:**
- ✅ Úspěšně nasadit šablonu `todo-nodejs-mongo`
- ✅ Nasadit a konfigurovat `azure-search-openai-demo` s RAG
- ✅ Dokončit interaktivní cvičení workshopu (Fáze objevování)
- ✅ Účastnit se diskuzí v komunitě Azure Discord

### Úroveň středně pokročilých (Kapitoly 3-4)
Po dokončení kapitol pro středně pokročilé budou studenti schopni:

**Technické dovednosti:**
- Spravovat nasazení do více prostředí (dev, staging, produkce)
- Vytvořit vlastní šablony Bicep pro infrastrukturu jako kód
- Implementovat bezpečné vzory autentizace s řízenou identitou
- Nasadit komplexní aplikace s více službami a vlastními konfiguracemi
- Optimalizovat strategie zajištění zdrojů pro náklady a výkon

**Profesní dovednosti:**
- Navrhovat škálovatelné architektury infrastruktury
- Implementovat bezpečnostní nejlepší praktiky pro nasazení do cloudu
- Dokumentovat vzory infrastruktury pro týmovou spolupráci
- Hodnotit a vybírat vhodné služby Azure podle požadavků

**Ověření učení:**
- ✅ Konfigurovat oddělená prostředí s nastaveními specifickými pro prostředí
- ✅ Vytvořit a nasadit vlastní šablonu Bicep pro aplikaci s více službami
- ✅ Implementovat autentizaci řízenou identitou pro bezpečný přístup
- ✅ Dokončit cvičení správy konfigurace s reálnými scénáři

### Úroveň pokročilých (Kapitoly 5-6)
Po dokončení kapitol pro pokročilé budou studenti schopni:

**Technické dovednosti:**
- Nasadit a koordinovat řešení s více agenty s koordinovanými pracovními postupy
- Implementovat architektury agentů pro zákazníky a inventář pro maloobchodní scénáře
- Provést komplexní plánování kapacity a validaci zdrojů
- Provést automatizovanou validaci před nasazením a optimalizaci
- Navrhnout nákladově efektivní výběr SKU na základě požadavků na pracovní zátěž

**Profesní dovednosti:**
- Navrhovat komplexní AI řešení pro produkční prostředí
- Vést technické diskuze o strategiích nasazení AI
- Mentorovat juniorní vývojáře v nejlepších praktikách AZD a nasazení AI
- Hodnotit a doporučovat vzory AI architektury podle obchodních požadavků

**Ověření učení:**
- ✅ Nasadit kompletní maloobchodní řešení s více agenty pomocí ARM šablon
- ✅ Demonstrovat koordinaci agentů a orchestraci pracovních postupů
- ✅ Dokončit cvičení plánování kapacity s reálnými omezeními zdrojů
- ✅ Validovat připravenost nasazení prostřednictvím automatizovaných kontrol

### Úroveň expertů (Kapitoly 7-8)
Po dokončení kapitol pro experty budou studenti schopni:

**Technické dovednosti:**
- Diagnostikovat a samostatně řešit složité problémy s nasazením
- Implementovat bezpečnostní vzory na podnikové úrovni a rámce správy
- Navrhnout komplexní strategie monitorování a upozornění
- Optimalizovat produkční nasazení pro škálování, náklady a výkon
- Zřídit CI/CD pipeline s odpovídajícím testováním a validací

**Profesní dovednosti:**
- Vést iniciativy pro transformaci cloudu na podnikové úrovni
- Navrhovat a implementovat organizační standardy nasazení
- Školit a mentorovat vývojové týmy v pokročilých praktikách AZD
- Ovlivňovat technická rozhodnutí pro podnikové nasazení AI

**Ověření učení:**
- ✅ Řešit složité problémy s nasazením více služeb
- ✅ Implementovat bezpečnostní vzory na podnikové úrovni s požadavky na shodu
- ✅ Navrhnout a nasadit produkční monitoring pomocí Application Insights
- ✅ Dokončit implementaci rámce správy na podnikové úrovni

## 🎯 Certifikace za dokončení kurzu

### Rámec sledování pokroku
Sledujte svůj pokrok v učení prostřednictvím strukturovaných kontrolních bodů:

- [ ] **Kapitola 1**: Základy & rychlý start ✅
- [ ] **Kapitola 2**: Vývoj zaměřený na AI ✅  
- [ ] **Kapitola 3**: Konfigurace & autentizace ✅
- [ ] **Kapitola 4**: Infrastruktura jako kód & nasazení ✅
- [ ] **Kapitola 5**: Řešení s více agenty ✅
- [ ] **Kapitola 6**: Validace & plánování před nasazením ✅
- [ ] **Kapitola 7**: Řešení problémů & ladění ✅
- [ ] **Kapitola 8**: Produkční & podnikové vzory ✅

### Proces ověření
Po dokončení každé kapitoly ověřte své znalosti prostřednictvím:

1. **Dokončení praktických cvičení**: Nasazení funkčních řešení pro každou kapitolu
2. **Hodnocení znalostí**: Projít sekce FAQ a dokončit sebehodnocení
3. **Zapojení do komunity**: Sdílet zkušenosti a získat zpětnou vazbu na Azure Discord
4. **Rozvoj portfolia**: Dokumentovat své nasazení a získané poznatky
5. **Recenze od kolegů**: Spolupracovat s ostatními studenty na složitých scénářích

### Výhody dokončení kurzu
Po dokončení všech kapitol s ověřením budou absolventi mít:

**Technickou odbornost:**
- **Produkční zkušenosti**: Nasazení reálných AI aplikací do prostředí Azure
- **Profesní dovednosti**: Schopnosti pro nasazení a řešení problémů na podnikové úrovni  
- **Znalosti architektury**: Řešení s více agenty a složité vzory infrastruktury
- **Mistrovství v řešení problémů**: Samostatné řešení problémů s nasazením a konfigurací

**Profesní rozvoj:**
- **Uznání v oboru**: Ověřitelné dovednosti v oblastech AZD a nasazení AI s vysokou poptávkou
- **Kariérní růst**: Kvalifikace pro role cloudového architekta a specialisty na nasazení AI
- **Vedení komunity**: Aktivní členství v komunitách vývojářů Azure a AI
- **Nepřetržité učení**: Základy pro pokročilou specializaci Azure AI Foundry

**Portfolio aktiv:**
- **Nasazená řešení**: Funkční příklady AI aplikací a vzorů infrastruktury
- **Dokumentace**: Komplexní průvodce nasazením a postupy řešení problémů  
- **Příspěvky komunitě**: Diskuze, příklady a vylepšení sdílené s komunitou Azure
- **Profesní síť**: Spojení s experty na Azure a praktiky nasazení AI

### Cesta učení po kurzu
Absolventi jsou připraveni na pokročilou specializaci v:
- **Azure AI Foundry Expert**: Hluboká specializace na nasazení a orchestraci AI modelů
- **Vedení cloudové architektury**: Návrh a správa nasazení na podnikové úrovni
- **Vedení vývojářské komunity**: Přispívání do vzorů Azure a komunitních zdrojů
- **Firemní školení**: Výuka dovedností AZD a nasazení AI v organizacích

---

