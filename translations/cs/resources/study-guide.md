<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-18T09:49:21+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "cs"
}
-->
# Průvodce studiem - Komplexní vzdělávací cíle

**Navigace vzdělávací cestou**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Začněte se učit**: [Kapitola 1: Základy a rychlý start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Sledování pokroku**: [Dokončení kurzu](../README.md#-course-completion--certification)

## Úvod

Tento komplexní průvodce studiem poskytuje strukturované vzdělávací cíle, klíčové koncepty, praktická cvičení a materiály pro hodnocení, které vám pomohou zvládnout Azure Developer CLI (azd). Použijte tento průvodce ke sledování svého pokroku a ujistěte se, že jste pokryli všechny zásadní témata.

## Cíle vzdělávání

Po dokončení tohoto průvodce budete:
- Mít zvládnuté všechny základní i pokročilé koncepty Azure Developer CLI
- Rozvíjet praktické dovednosti v nasazování a správě aplikací na Azure
- Získat jistotu v řešení problémů a optimalizaci nasazení
- Porozumět postupům pro nasazení připravené na produkci a bezpečnostním aspektům

## Výsledky vzdělávání

Po dokončení všech sekcí tohoto průvodce budete schopni:
- Navrhovat, nasazovat a spravovat kompletní architektury aplikací pomocí azd
- Implementovat komplexní strategie monitorování, zabezpečení a optimalizace nákladů
- Samostatně řešit složité problémy s nasazením
- Vytvářet vlastní šablony a přispívat do komunity azd

## Struktura učení v 8 kapitolách

### Kapitola 1: Základy a rychlý start (1. týden)
**Doba trvání**: 30-45 minut | **Složitost**: ⭐

#### Cíle vzdělávání
- Porozumět základním konceptům a terminologii Azure Developer CLI
- Úspěšně nainstalovat a nakonfigurovat AZD na vaší vývojové platformě
- Nasadit svou první aplikaci pomocí existující šablony
- Efektivně se orientovat v příkazovém rozhraní AZD

#### Klíčové koncepty k zvládnutí
- Struktura projektu AZD a jeho komponenty (azure.yaml, infra/, src/)
- Pracovní postupy nasazení založené na šablonách
- Základy konfigurace prostředí
- Správa skupin prostředků a předplatných

#### Praktická cvičení
1. **Ověření instalace**: Nainstalujte AZD a ověřte pomocí `azd version`
2. **První nasazení**: Úspěšně nasadit šablonu todo-nodejs-mongo
3. **Nastavení prostředí**: Nakonfigurovat první proměnné prostředí
4. **Průzkum prostředků**: Procházet nasazené prostředky v Azure Portal

#### Otázky k hodnocení
- Jaké jsou hlavní komponenty projektu AZD?
- Jak inicializujete nový projekt ze šablony?
- Jaký je rozdíl mezi `azd up` a `azd deploy`?
- Jak spravujete více prostředí pomocí AZD?

---

### Kapitola 2: Vývoj zaměřený na AI (2. týden)
**Doba trvání**: 1-2 hodiny | **Složitost**: ⭐⭐

#### Cíle vzdělávání
- Integrovat služby Azure AI Foundry do pracovních postupů AZD
- Nasadit a nakonfigurovat aplikace využívající AI
- Porozumět implementačním vzorcům RAG (Retrieval-Augmented Generation)
- Spravovat nasazení modelů AI a jejich škálování

#### Klíčové koncepty k zvládnutí
- Integrace služby Azure OpenAI a správa API
- Konfigurace AI Search a vektorové indexování
- Strategie nasazení modelů a plánování kapacity
- Monitorování aplikací využívajících AI a optimalizace výkonu

#### Praktická cvičení
1. **Nasazení AI chatu**: Nasadit šablonu azure-search-openai-demo
2. **Implementace RAG**: Nakonfigurovat indexování dokumentů a vyhledávání
3. **Konfigurace modelů**: Nastavit více modelů AI s různými účely
4. **Monitorování AI**: Implementovat Application Insights pro pracovní zátěže AI

#### Otázky k hodnocení
- Jak nakonfigurujete služby Azure OpenAI v šabloně AZD?
- Jaké jsou klíčové komponenty architektury RAG?
- Jak spravujete kapacitu a škálování modelů AI?
- Jaké metriky monitorování jsou důležité pro aplikace využívající AI?

---

### Kapitola 3: Konfigurace a autentizace (3. týden)
**Doba trvání**: 45-60 minut | **Složitost**: ⭐⭐

#### Cíle vzdělávání
- Zvládnout strategie konfigurace a správy prostředí
- Implementovat bezpečné vzory autentizace a spravovanou identitu
- Organizovat prostředky pomocí správných konvencí pojmenování
- Nakonfigurovat nasazení pro více prostředí (dev, staging, prod)

#### Klíčové koncepty k zvládnutí
- Hierarchie prostředí a precedence konfigurace
- Autentizace pomocí spravované identity a servisních principálů
- Integrace Key Vault pro správu tajných údajů
- Správa parametrů specifických pro prostředí

#### Praktická cvičení
1. **Nastavení více prostředí**: Nakonfigurovat prostředí dev, staging a prod
2. **Konfigurace zabezpečení**: Implementovat autentizaci pomocí spravované identity
3. **Správa tajných údajů**: Integrovat Azure Key Vault pro citlivá data
4. **Správa parametrů**: Vytvořit konfigurace specifické pro prostředí

#### Otázky k hodnocení
- Jak nakonfigurujete různá prostředí pomocí AZD?
- Jaké jsou výhody použití spravované identity oproti servisním principálům?
- Jak bezpečně spravujete tajné údaje aplikace?
- Jaká je hierarchie konfigurace v AZD?

---

### Kapitola 4: Infrastruktura jako kód a nasazení (4.-5. týden)
**Doba trvání**: 1-1,5 hodiny | **Složitost**: ⭐⭐⭐

#### Cíle vzdělávání
- Vytvářet a přizpůsobovat šablony infrastruktury Bicep
- Implementovat pokročilé vzory nasazení a pracovní postupy
- Porozumět strategiím zajišťování prostředků
- Navrhovat škálovatelné architektury pro více služeb

#### Klíčové koncepty k zvládnutí
- Struktura šablon Bicep a osvědčené postupy
- Závislosti prostředků a pořadí nasazení
- Parametrické soubory a modularita šablon
- Vlastní hooky a automatizace nasazení

#### Praktická cvičení
1. **Vytvoření vlastní šablony**: Vytvořit šablonu aplikace pro více služeb
2. **Zvládnutí Bicep**: Vytvořit modulární, znovupoužitelné komponenty infrastruktury
3. **Automatizace nasazení**: Implementovat hooky před/po nasazení
4. **Návrh architektury**: Nasadit komplexní architekturu mikroslužeb

#### Otázky k hodnocení
- Jak vytvoříte vlastní šablony Bicep pro AZD?
- Jaké jsou osvědčené postupy pro organizaci kódu infrastruktury?
- Jak řešíte závislosti prostředků v šablonách?
- Jaké vzory nasazení podporují aktualizace bez výpadků?

---

### Kapitola 5: Řešení AI s více agenty (6.-7. týden)
**Doba trvání**: 2-3 hodiny | **Složitost**: ⭐⭐⭐⭐

#### Cíle vzdělávání
- Navrhovat a implementovat architektury AI s více agenty
- Orchestraci koordinace a komunikace agentů
- Nasazovat řešení AI připravená na produkci s monitorováním
- Porozumět specializaci agentů a pracovním vzorcům

#### Klíčové koncepty k zvládnutí
- Vzory architektury s více agenty a principy návrhu
- Protokoly komunikace agentů a tok dat
- Strategie vyvažování zátěže a škálování pro agenty AI
- Monitorování produkce pro systémy s více agenty

#### Praktická cvičení
1. **Nasazení maloobchodního řešení**: Nasadit kompletní scénář maloobchodu s více agenty
2. **Přizpůsobení agentů**: Upravit chování agentů zákazníků a inventáře
3. **Škálování architektury**: Implementovat vyvažování zátěže a automatické škálování
4. **Monitorování produkce**: Nastavit komplexní monitorování a upozornění

#### Otázky k hodnocení
- Jak navrhujete efektivní vzory komunikace mezi agenty?
- Jaké jsou klíčové úvahy pro škálování pracovních zátěží agentů AI?
- Jak monitorujete a ladíte systémy AI s více agenty?
- Jaké produkční vzory zajišťují spolehlivost pro agenty AI?

---

### Kapitola 6: Validace před nasazením a plánování (8. týden)
**Doba trvání**: 1 hodina | **Složitost**: ⭐⭐

#### Cíle vzdělávání
- Provádět komplexní plánování kapacity a validaci prostředků
- Vybrat optimální SKU Azure pro nákladovou efektivitu
- Implementovat automatizované kontroly před nasazením a validaci
- Plánovat nasazení s optimalizačními strategiemi nákladů

#### Klíčové koncepty k zvládnutí
- Kvóty prostředků Azure a omezení kapacity
- Kritéria výběru SKU a optimalizace nákladů
- Automatizované validační skripty a testování
- Plánování nasazení a hodnocení rizik

#### Praktická cvičení
1. **Analýza kapacity**: Analyzovat požadavky na prostředky pro vaše aplikace
2. **Optimalizace SKU**: Porovnat a vybrat nákladově efektivní úrovně služeb
3. **Automatizace validace**: Implementovat skripty pro kontrolu před nasazením
4. **Plánování nákladů**: Vytvořit odhady nákladů na nasazení a rozpočty

#### Otázky k hodnocení
- Jak validujete kapacitu Azure před nasazením?
- Jaké faktory ovlivňují rozhodnutí o výběru SKU?
- Jak automatizujete validaci před nasazením?
- Jaké strategie pomáhají optimalizovat náklady na nasazení?

---

### Kapitola 7: Řešení problémů a ladění (9. týden)
**Doba trvání**: 1-1,5 hodiny | **Složitost**: ⭐⭐

#### Cíle vzdělávání
- Rozvíjet systematické přístupy k ladění nasazení AZD
- Řešit běžné problémy s nasazením a konfigurací
- Ladit specifické problémy AI a problémy s výkonem
- Implementovat monitorování a upozornění pro proaktivní detekci problémů

#### Klíčové koncepty k zvládnutí
- Diagnostické techniky a strategie logování
- Běžné vzory selhání a jejich řešení
- Monitorování výkonu a optimalizace
- Postupy reakce na incidenty a obnovy

#### Praktická cvičení
1. **Diagnostické dovednosti**: Procvičit se na záměrně rozbitých nasazeních
2. **Analýza logů**: Efektivně používat Azure Monitor a Application Insights
3. **Ladění výkonu**: Optimalizovat aplikace s pomalým výkonem
4. **Postupy obnovy**: Implementovat zálohování a obnovu po havárii

#### Otázky k hodnocení
- Jaké jsou nejčastější selhání nasazení AZD?
- Jak ladíte problémy s autentizací a oprávněními?
- Jaké strategie monitorování pomáhají předcházet problémům v produkci?
- Jak optimalizujete výkon aplikací na Azure?

---

### Kapitola 8: Produkční a podnikové vzory (10.-11. týden)
**Doba trvání**: 2-3 hodiny | **Složitost**: ⭐⭐⭐⭐

#### Cíle vzdělávání
- Implementovat strategie nasazení na podnikové úrovni
- Navrhovat bezpečnostní vzory a rámce pro dodržování předpisů
- Zřídit monitorování, správu a řízení nákladů
- Vytvořit škálovatelné CI/CD pipeline s integrací AZD

#### Klíčové koncepty k zvládnutí
- Požadavky na bezpečnost a dodržování předpisů na podnikové úrovni
- Rámce řízení a implementace politik
- Pokročilé monitorování a správa nákladů
- Integrace CI/CD a automatizované pipeline nasazení

#### Praktická cvičení
1. **Podniková bezpečnost**: Implementovat komplexní bezpečnostní vzory
2. **Rámec řízení**: Nastavit Azure Policy a správu prostředků
3. **Pokročilé monitorování**: Vytvořit dashboardy a automatizované upozornění
4. **Integrace CI/CD**: Vytvořit automatizované pipeline nasazení

#### Otázky k hodnocení
- Jak implementujete podnikovou bezpečnost v nasazeních AZD?
- Jaké vzory řízení zajišťují dodržování předpisů a kontrolu nákladů?
- Jak navrhujete škálovatelné monitorování pro produkční systémy?
- Jaké vzory CI/CD nejlépe fungují s pracovními postupy AZD?
2. Jak ověřit dostupnost zdrojů Azure před nasazením?  
3. Jaké jsou klíčové komponenty systému předběžné kontroly?  
4. Jak odhadnout a kontrolovat náklady na nasazení?  
5. Jaké monitorování je nezbytné pro plánování kapacity?

### Modul 5: Řešení problémů a ladění (6. týden)

#### Cíle učení
- Osvojit si systematické metodiky řešení problémů  
- Získat odborné znalosti v ladění složitých problémů při nasazení  
- Implementovat komplexní monitorování a upozornění  
- Vytvořit postupy pro reakci na incidenty a obnovu  

#### Klíčové koncepty k osvojení
- Běžné vzory selhání při nasazení  
- Analýza logů a techniky korelace  
- Monitorování výkonu a optimalizace  
- Detekce bezpečnostních incidentů a reakce  
- Obnova po havárii a kontinuita podnikání  

#### Praktická cvičení

**Cvičení 5.1: Scénáře řešení problémů**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```  

**Cvičení 5.2: Implementace monitorování**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```  

**Cvičení 5.3: Reakce na incidenty**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```  

#### Otázky pro sebehodnocení
1. Jaký je systematický přístup k řešení problémů při nasazení azd?  
2. Jak korelovat logy napříč více službami a zdroji?  
3. Jaké monitorovací metriky jsou nejdůležitější pro včasnou detekci problémů?  
4. Jak implementovat efektivní postupy obnovy po havárii?  
5. Jaké jsou klíčové komponenty plánu reakce na incidenty?  

### Modul 6: Pokročilá témata a osvědčené postupy (7.–8. týden)

#### Cíle učení
- Implementovat vzory nasazení na úrovni podniků  
- Osvojit si integraci a automatizaci CI/CD  
- Vyvíjet vlastní šablony a přispívat do komunity  
- Porozumět pokročilým požadavkům na bezpečnost a shodu  

#### Klíčové koncepty k osvojení
- Vzory integrace CI/CD pipeline  
- Vývoj a distribuce vlastních šablon  
- Podniková správa a shoda  
- Pokročilé konfigurace sítí a bezpečnosti  
- Optimalizace výkonu a řízení nákladů  

#### Praktická cvičení

**Cvičení 6.1: Integrace CI/CD**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```  

**Cvičení 6.2: Vývoj vlastních šablon**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```  

**Cvičení 6.3: Implementace na úrovni podniků**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```  

#### Otázky pro sebehodnocení
1. Jak integrovat azd do existujících CI/CD workflow?  
2. Jaké jsou klíčové aspekty vývoje vlastních šablon?  
3. Jak implementovat správu a shodu v nasazeních azd?  
4. Jaké jsou osvědčené postupy pro nasazení na úrovni podniků?  
5. Jak efektivně přispívat do komunity azd?  

## Praktické projekty

### Projekt 1: Osobní portfolio web  
**Složitost**: Začátečník  
**Doba trvání**: 1–2 týdny  

Vytvořte a nasaďte osobní portfolio web pomocí:  
- Hostování statického webu na Azure Storage  
- Konfigurace vlastního doménového jména  
- Integrace CDN pro globální výkon  
- Automatizované nasazení pipeline  

**Výstupy**:  
- Funkční web nasazený na Azure  
- Vlastní šablona azd pro nasazení portfolia  
- Dokumentace procesu nasazení  
- Doporučení pro analýzu nákladů a optimalizaci  

### Projekt 2: Aplikace pro správu úkolů  
**Složitost**: Středně pokročilý  
**Doba trvání**: 2–3 týdny  

Vytvořte full-stack aplikaci pro správu úkolů s:  
- Frontendem React nasazeným na App Service  
- Backendem Node.js API s autentizací  
- Databází PostgreSQL s migracemi  
- Monitorováním pomocí Application Insights  

**Výstupy**:  
- Kompletní aplikace s autentizací uživatelů  
- Schéma databáze a migrační skripty  
- Monitorovací dashboardy a pravidla upozornění  
- Konfigurace nasazení pro více prostředí  

### Projekt 3: E-commerce platforma založená na mikroservisách  
**Složitost**: Pokročilý  
**Doba trvání**: 4–6 týdnů  

Navrhněte a implementujte e-commerce platformu založenou na mikroservisách:  
- Více API služeb (katalog, objednávky, platby, uživatelé)  
- Integrace fronty zpráv pomocí Service Bus  
- Redis cache pro optimalizaci výkonu  
- Komplexní logování a monitorování  

**Výstupy**:  
- Kompletní architektura mikroservis  
- Vzory komunikace mezi službami  
- Testování výkonu a optimalizace  
- Implementace bezpečnosti připravené pro produkci  

## Hodnocení a certifikace

### Kontroly znalostí

Dokončete tyto hodnocení po každém modulu:

**Hodnocení modulu 1**: Základní koncepty a instalace  
- Otázky s výběrem odpovědí na základní koncepty  
- Praktické úkoly instalace a konfigurace  
- Jednoduché cvičení nasazení  

**Hodnocení modulu 2**: Konfigurace a prostředí  
- Scénáře správy prostředí  
- Cvičení řešení problémů s konfigurací  
- Implementace bezpečnostní konfigurace  

**Hodnocení modulu 3**: Nasazení a zajištění  
- Výzvy návrhu infrastruktury  
- Scénáře nasazení více služeb  
- Cvičení optimalizace výkonu  

**Hodnocení modulu 4**: Validace před nasazením  
- Případové studie plánování kapacity  
- Scénáře optimalizace nákladů  
- Implementace validační pipeline  

**Hodnocení modulu 5**: Řešení problémů a ladění  
- Cvičení diagnostiky problémů  
- Úkoly implementace monitorování  
- Simulace reakce na incidenty  

**Hodnocení modulu 6**: Pokročilá témata  
- Návrh CI/CD pipeline  
- Vývoj vlastních šablon  
- Scénáře architektury na úrovni podniků  

### Závěrečný projekt

Navrhněte a implementujte kompletní řešení, které demonstruje zvládnutí všech konceptů:

**Požadavky**:  
- Architektura aplikace s více vrstvami  
- Více prostředí pro nasazení  
- Komplexní monitorování a upozornění  
- Implementace bezpečnosti a shody  
- Optimalizace nákladů a výkonu  
- Kompletní dokumentace a provozní příručky  

**Kritéria hodnocení**:  
- Kvalita technické implementace  
- Úplnost dokumentace  
- Dodržení bezpečnostních a osvědčených postupů  
- Optimalizace výkonu a nákladů  
- Účinnost řešení problémů a monitorování  

## Studijní zdroje a reference

### Oficiální dokumentace
- [Azure Developer CLI Dokumentace](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Dokumentace](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Komunitní zdroje
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)  

### Praktická prostředí
- [Azure Free Account](https://azure.microsoft.com/free/)  
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Další nástroje
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Doporučení studijního plánu

### Plné studium (8 týdnů)
- **1.–2. týden**: Moduly 1–2 (Začínáme, Konfigurace)  
- **3.–4. týden**: Moduly 3–4 (Nasazení, Validace před nasazením)  
- **5.–6. týden**: Moduly 5–6 (Řešení problémů, Pokročilá témata)  
- **7.–8. týden**: Praktické projekty a závěrečné hodnocení  

### Částečné studium (16 týdnů)
- **1.–4. týden**: Modul 1 (Začínáme)  
- **5.–7. týden**: Modul 2 (Konfigurace a prostředí)  
- **8.–10. týden**: Modul 3 (Nasazení a zajištění)  
- **11.–12. týden**: Modul 4 (Validace před nasazením)  
- **13.–14. týden**: Modul 5 (Řešení problémů a ladění)  
- **15.–16. týden**: Modul 6 (Pokročilá témata a hodnocení)  

---

## Sledování pokroku a rámec hodnocení

### Kontrolní seznam dokončení kapitol

Sledujte svůj pokrok v každé kapitole pomocí těchto měřitelných výsledků:

#### 📚 Kapitola 1: Základy a rychlý start  
- [ ] **Dokončená instalace**: AZD nainstalováno a ověřeno na vaší platformě  
- [ ] **První nasazení**: Úspěšně nasazená šablona todo-nodejs-mongo  
- [ ] **Nastavení prostředí**: Konfigurovány první proměnné prostředí  
- [ ] **Navigace zdrojů**: Prozkoumány nasazené zdroje v Azure Portal  
- [ ] **Ovládání příkazů**: Zvládnutí základních příkazů AZD  

#### 🤖 Kapitola 2: Vývoj zaměřený na AI  
- [ ] **Nasazení AI šablony**: Úspěšně nasazená azure-search-openai-demo  
- [ ] **Implementace RAG**: Konfigurováno indexování a vyhledávání dokumentů  
- [ ] **Konfigurace modelu**: Nastaveny různé AI modely pro různé účely  
- [ ] **Monitorování AI**: Implementováno Application Insights pro AI pracovní zátěže  
- [ ] **Optimalizace výkonu**: Vyladěn výkon AI aplikace  

#### ⚙️ Kapitola 3: Konfigurace a autentizace  
- [ ] **Nastavení více prostředí**: Konfigurována prostředí dev, staging a prod  
- [ ] **Implementace bezpečnosti**: Nastavena autentizace pomocí spravované identity  
- [ ] **Správa tajemství**: Integrovaný Azure Key Vault pro citlivá data  
- [ ] **Správa parametrů**: Vytvořeny konfigurace specifické pro prostředí  
- [ ] **Zvládnutí autentizace**: Implementovány bezpečné přístupové vzory  

#### 🏗️ Kapitola 4: Infrastruktura jako kód a nasazení  
- [ ] **Vytvoření vlastní šablony**: Postavena šablona aplikace s více službami  
- [ ] **Zvládnutí Bicep**: Vytvořeny modulární, znovupoužitelné komponenty infrastruktury  
- [ ] **Automatizace nasazení**: Implementovány před/následné kroky nasazení  
- [ ] **Návrh architektury**: Nasazena komplexní architektura mikroservis  
- [ ] **Optimalizace šablony**: Optimalizovány šablony pro výkon a náklady  

#### 🎯 Kapitola 5: Řešení AI s více agenty  
- [ ] **Nasazení maloobchodního řešení**: Nasazeno kompletní maloobchodní scénář s více agenty  
- [ ] **Přizpůsobení agenta**: Upraveno chování agenta zákazníka a inventáře  
- [ ] **Škálování architektury**: Implementováno vyvažování zátěže a automatické škálování  
- [ ] **Monitorování produkce**: Nastaveno komplexní monitorování a upozornění  
- [ ] **Ladění výkonu**: Optimalizován výkon systému s více agenty  

#### 🔍 Kapitola 6: Validace před nasazením a plánování  
- [ ] **Analýza kapacity**: Analyzovány požadavky na zdroje pro aplikace  
- [ ] **Optimalizace SKU**: Vybrány nákladově efektivní úrovně služeb  
- [ ] **Automatizace validace**: Implementovány skripty pro kontrolu před nasazením  
- [ ] **Plánování nákladů**: Vytvořeny odhady nákladů na nasazení a rozpočty  
- [ ] **Hodnocení rizik**: Identifikovány a zmírněny rizika nasazení  

#### 🚨 Kapitola 7: Řešení problémů a ladění  
- [ ] **Diagnostické dovednosti**: Úspěšně vyřešeny záměrně rozbité nasazení  
- [ ] **Analýza logů**: Efektivně použity Azure Monitor a Application Insights  
- [ ] **Ladění výkonu**: Optimalizovány pomalu fungující aplikace  
- [ ] **Postupy obnovy**: Implementovány zálohy a obnova po havárii  
- [ ] **Nastavení monitorování**: Vytvořeno proaktivní monitorování a upozornění  

#### 🏢 Kapitola 8: Produkční a podnikové vzory  
- [ ] **Podniková bezpečnost**: Implementovány komplexní bezpečnostní vzory  
- [ ] **Rámec správy**: Nastaveny Azure Policy a správa zdrojů  
- [ ] **Pokročilé monitorování**: Vytvořeny dashboardy a automatizované upozornění  
- [ ] **Integrace CI/CD**: Postaveny automatizované pipeline nasazení  
- [ ] **Implementace shody**: Splněny požadavky na podnikovou shodu  

### Časová osa učení a milníky

#### 1.–2. týden: Základy  
- **Milník**: Nasazení první AI aplikace pomocí AZD  
- **Validace**: Funkční aplikace dostupná přes veřejnou URL  
- **Dovednosti**: Základní workflow AZD a integrace AI služeb  

#### 3.–4. týden: Zvládnutí konfigurace  
- **Milník**: Nasazení do více prostředí s bezpečnou autentizací  
- **Validace**: Stejná aplikace nasazena do dev/staging/prod  
- **Dovednosti**: Správa prostředí a implementace bezpečnosti  

#### 5.–6. týden: Odbornost v infrastruktuře  
- **Milník**: Vlastní šablona pro komplexní aplikaci s více službami  
- **Validace**: Znovupoužitelná šablona nasazena jiným členem týmu  
- **Dovednosti**: Zvládnutí Bicep a automatizace infrastruktury  

#### 7.–8. týden: Pokročilá implementace AI  
- **Milník**: Produkčně připravené řešení AI s více agenty  
- **Validace**: Systém zvládající reálnou zátěž s monitorováním  
- **Dovednosti**: Orchestrace více agentů a optimalizace výkonu  

#### 9.–10. týden: Produkční připravenost  
- **Milník**: Nasazení na úrovni podniků s plnou shodou  
- **Validace**: Splnění bezpečnostní kontroly a auditu optimalizace nákladů  
- **Dovednosti**: Správa, monitorování a integrace CI/CD  

### Hodnocení a certifikace

#### Metody validace znalostí  
1. **Praktická nasazení**: Funkční aplikace pro každou kapitolu  
2. **Kontroly kódu**: Hodnocení kvality šablon a konfigurací  
3. **Řešení problémů**: Scénáře řešení problémů a jejich řešení  
4. **Výuka vrstevníkům**: Vysvětlení konceptů ostatním studentům  
5. **Příspěvky komunitě**: Sdílení šablon
- **Dokumentace**: Přispívejte do komunitní dokumentace a příkladů  
- **Zpětná vazba**: Poskytujte zpětnou vazbu k obsahu kurzu a službám Azure  

#### Kariérní rozvoj  
- **Profesionální síť**: Spojte se s odborníky na Azure a AI  
- **Příležitosti k vystupování**: Prezentujte své poznatky na konferencích nebo meetupech  
- **Příspěvky do open source**: Přispívejte do šablon a nástrojů AZD  
- **Mentorství**: Veďte ostatní vývojáře na jejich cestě za poznáním AZD  

---

**Navigace kapitolami:**  
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../README.md)  
- **📖 Začněte se učit**: [Kapitola 1: Základy a rychlý start](../README.md#-chapter-1-foundation--quick-start)  
- **🎯 Sledování pokroku**: Sledujte svůj postup prostřednictvím komplexního systému učení o 8 kapitolách  
- **🤝 Komunita**: [Azure Discord](https://discord.gg/microsoft-azure) pro podporu a diskuzi  

**Sledování studijního pokroku**: Použijte tuto strukturovanou příručku k osvojení Azure Developer CLI prostřednictvím postupného, praktického učení s měřitelnými výsledky a přínosy pro profesní rozvoj.  

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádné nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.