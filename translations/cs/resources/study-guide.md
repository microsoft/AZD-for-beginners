# Studijní příručka - Komplexní vzdělávací cíle

**Navigace vzdělávací cestou**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Začněte se učit**: [Kapitola 1: Základy a rychlý start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Sledování pokroku**: [Dokončení kurzu](../README.md#-course-completion--certification)

## Úvod

Tato komplexní studijní příručka poskytuje strukturované vzdělávací cíle, klíčové koncepty, praktická cvičení a hodnotící materiály, které vám pomohou zvládnout Azure Developer CLI (azd). Použijte tuto příručku ke sledování svého pokroku a ujistěte se, že jste pokryli všechna důležitá témata.

## Cíle vzdělávání

Po dokončení této studijní příručky budete:
- Ovládat všechny základní i pokročilé koncepty Azure Developer CLI
- Rozvíjet praktické dovednosti v nasazování a správě aplikací na Azure
- Získat jistotu v řešení problémů a optimalizaci nasazení
- Rozumět postupům pro nasazení připravené na produkci a bezpečnostním aspektům

## Výsledky vzdělávání

Po dokončení všech částí této studijní příručky budete schopni:
- Navrhovat, nasazovat a spravovat kompletní aplikační architektury pomocí azd
- Implementovat komplexní strategie monitorování, zabezpečení a optimalizace nákladů
- Samostatně řešit složité problémy s nasazením
- Vytvářet vlastní šablony a přispívat do komunity azd

## Struktura vzdělávání v 8 kapitolách

### Kapitola 1: Základy a rychlý start (1. týden)
**Doba trvání**: 30-45 minut | **Složitost**: ⭐

#### Cíle vzdělávání
- Porozumět základním konceptům a terminologii Azure Developer CLI
- Úspěšně nainstalovat a nakonfigurovat AZD na vaší vývojové platformě
- Nasadit svou první aplikaci pomocí existující šablony
- Efektivně se orientovat v příkazovém rozhraní AZD

#### Klíčové koncepty k osvojení
- Struktura a komponenty projektu AZD (azure.yaml, infra/, src/)
- Pracovní postupy nasazení založené na šablonách
- Základy konfigurace prostředí
- Správa skupin prostředků a předplatných

#### Praktická cvičení
1. **Ověření instalace**: Nainstalujte AZD a ověřte pomocí `azd version`
2. **První nasazení**: Úspěšně nasadit šablonu todo-nodejs-mongo
3. **Nastavení prostředí**: Nakonfigurujte své první proměnné prostředí
4. **Prozkoumání prostředků**: Projděte nasazené prostředky v Azure Portálu

#### Hodnotící otázky
- Jaké jsou hlavní komponenty projektu AZD?
- Jak inicializujete nový projekt ze šablony?
- Jaký je rozdíl mezi `azd up` a `azd deploy`?
- Jak spravujete více prostředí pomocí AZD?

---

### Kapitola 2: Vývoj zaměřený na AI (2. týden)
**Doba trvání**: 1-2 hodiny | **Složitost**: ⭐⭐

#### Cíle vzdělávání
- Integrovat služby Microsoft Foundry do pracovních postupů AZD
- Nasazovat a konfigurovat aplikace poháněné AI
- Porozumět implementačním vzorům RAG (Retrieval-Augmented Generation)
- Spravovat nasazení a škálování AI modelů

#### Klíčové koncepty k osvojení
- Integrace služby Azure OpenAI a správa API
- Konfigurace AI vyhledávání a vektorového indexování
- Strategie nasazení modelů a plánování kapacity
- Monitorování a optimalizace výkonu AI aplikací

#### Praktická cvičení
1. **Nasazení AI chatu**: Nasadit šablonu azure-search-openai-demo
2. **Implementace RAG**: Nakonfigurovat indexování a vyhledávání dokumentů
3. **Konfigurace modelu**: Nastavit více AI modelů s různými účely
4. **Monitorování AI**: Implementovat Application Insights pro AI pracovní zátěže

#### Hodnotící otázky
- Jak nakonfigurujete služby Azure OpenAI v šabloně AZD?
- Jaké jsou klíčové komponenty architektury RAG?
- Jak spravujete kapacitu a škálování AI modelů?
- Jaké metriky monitorování jsou důležité pro AI aplikace?

---

### Kapitola 3: Konfigurace a autentizace (3. týden)
**Doba trvání**: 45-60 minut | **Složitost**: ⭐⭐

#### Cíle vzdělávání
- Ovládnout strategie konfigurace a správy prostředí
- Implementovat bezpečné autentizační vzory a spravovanou identitu
- Organizovat prostředky pomocí správných pojmenovacích konvencí
- Konfigurovat nasazení pro více prostředí (vývoj, testování, produkce)

#### Klíčové koncepty k osvojení
- Hierarchie prostředí a precedence konfigurace
- Spravovaná identita a autentizace pomocí service principal
- Integrace Key Vault pro správu tajných klíčů
- Správa parametrů specifických pro prostředí

#### Praktická cvičení
1. **Nastavení více prostředí**: Nakonfigurujte vývojové, testovací a produkční prostředí
2. **Bezpečnostní konfigurace**: Implementujte autentizaci pomocí spravované identity
3. **Správa tajemství**: Integrujte Azure Key Vault pro citlivá data
4. **Správa parametrů**: Vytvořte konfigurace specifické pro prostředí

#### Hodnotící otázky
- Jak nakonfigurujete různá prostředí pomocí AZD?
- Jaké jsou výhody použití spravované identity oproti service principal?
- Jak bezpečně spravujete tajemství aplikace?
- Jaká je hierarchie konfigurace v AZD?

---

### Kapitola 4: Infrastruktura jako kód a nasazení (4.-5. týden)
**Doba trvání**: 1-1,5 hodiny | **Složitost**: ⭐⭐⭐

#### Cíle vzdělávání
- Vytvářet a přizpůsobovat šablony infrastruktury Bicep
- Implementovat pokročilé vzory a pracovní postupy nasazení
- Porozumět strategiím zajišťování prostředků
- Navrhovat škálovatelné architektury s více službami

- Nasazovat kontejnerizované aplikace pomocí Azure Container Apps a AZD

#### Klíčové koncepty k osvojení
- Struktura šablon Bicep a osvědčené postupy
- Závislosti prostředků a pořadí nasazení
- Parametrické soubory a modularita šablon
- Vlastní hooky a automatizace nasazení
- Vzory nasazení kontejnerových aplikací (rychlý start, produkce, mikroslužby)

#### Praktická cvičení
1. **Vytvoření vlastní šablony**: Vytvořte šablonu aplikace s více službami
2. **Ovládnutí Bicep**: Vytvořte modulární, znovupoužitelné komponenty infrastruktury
3. **Automatizace nasazení**: Implementujte hooky před/po nasazení
4. **Návrh architektury**: Nasadit komplexní architekturu mikroslužeb
5. **Nasazení kontejnerové aplikace**: Nasadit příklady [Simple Flask API](../../../examples/container-app/simple-flask-api) a [Microservices Architecture](../../../examples/container-app/microservices) pomocí AZD

#### Hodnotící otázky
- Jak vytvoříte vlastní šablony Bicep pro AZD?
- Jaké jsou osvědčené postupy pro organizaci kódu infrastruktury?
- Jak řešíte závislosti prostředků v šablonách?
- Jaké vzory nasazení podporují aktualizace bez výpadků?

---

### Kapitola 5: Řešení s více AI agenty (6.-7. týden)
**Doba trvání**: 2-3 hodiny | **Složitost**: ⭐⭐⭐⭐

#### Cíle vzdělávání
- Navrhovat a implementovat architektury s více AI agenty
- Koordinovat komunikaci a spolupráci agentů
- Nasazovat produkčně připravená AI řešení s monitorováním
- Porozumět specializaci agentů a vzorům pracovních postupů
- Integrovat kontejnerizované mikroslužby jako součást řešení s více agenty

#### Klíčové koncepty k osvojení
- Vzory architektury s více agenty a principy návrhu
- Protokoly komunikace agentů a tok dat
- Strategie vyvažování zátěže a škálování pro AI agenty
- Produkční monitorování systémů s více agenty
- Komunikace mezi službami v kontejnerizovaných prostředích

#### Praktická cvičení
1. **Nasazení maloobchodního řešení**: Nasadit kompletní scénář s více agenty pro maloobchod
2. **Přizpůsobení agentů**: Upravit chování agentů pro zákazníky a inventář
3. **Škálování architektury**: Implementovat vyvažování zátěže a automatické škálování
4. **Produkční monitorování**: Nastavit komplexní monitorování a upozornění
5. **Integrace mikroslužeb**: Rozšířit příklad [Microservices Architecture](../../../examples/container-app/microservices) o pracovní postupy založené na agentech

#### Hodnotící otázky
- Jak navrhujete efektivní vzory komunikace mezi agenty?
- Jaké jsou klíčové úvahy při škálování pracovních zátěží AI agentů?
- Jak monitorujete a ladíte systémy s více AI agenty?
- Jaké produkční vzory zajišťují spolehlivost pro AI agenty?

---

### Kapitola 6: Validace a plánování před nasazením (8. týden)
**Doba trvání**: 1 hodina | **Složitost**: ⭐⭐

#### Cíle vzdělávání
- Provádět komplexní plánování kapacity a validaci prostředků
- Vybrat optimální Azure SKU pro efektivitu nákladů
- Implementovat automatizované kontroly a validace před nasazením
- Plánovat nasazení s ohledem na optimalizaci nákladů

#### Klíčové koncepty k osvojení
- Kvóty prostředků Azure a omezení kapacity
- Kritéria výběru SKU a optimalizace nákladů
- Automatizované validační skripty a testování
- Plánování nasazení a hodnocení rizik

#### Praktická cvičení
1. **Analýza kapacity**: Analyzujte požadavky na prostředky pro vaše aplikace
2. **Optimalizace SKU**: Porovnejte a vyberte nákladově efektivní úrovně služeb
3. **Automatizace validace**: Implementujte skripty pro kontrolu před nasazením
4. **Plánování nákladů**: Vytvořte odhady nákladů na nasazení a rozpočty

#### Hodnotící otázky
- Jak validujete kapacitu Azure před nasazením?
- Jaké faktory ovlivňují rozhodování o výběru SKU?
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

#### Klíčové koncepty k osvojení
- Diagnostické techniky a strategie logování
- Běžné vzory selhání a jejich řešení
- Monitorování výkonu a optimalizace
- Postupy reakce na incidenty a obnovy

#### Praktická cvičení
1. **Diagnostické dovednosti**: Procvičte si práci s úmyslně rozbitými nasazeními
2. **Analýza logů**: Efektivně používejte Azure Monitor a Application Insights
3. **Ladění výkonu**: Optimalizujte pomalu fungující aplikace
4. **Postupy obnovy**: Implementujte zálohování a obnovu po havárii

#### Hodnotící otázky
- Jaké jsou nejčastější chyby při nasazení AZD?
- Jak ladíte problémy s autentizací a oprávněními?
- Jaké strategie monitorování pomáhají předcházet problémům v produkci?
- Jak optimalizujete výkon aplikací na Azure?

---

### Kapitola 8: Produkční a podnikové vzory (10.-11. týden)
**Doba trvání**: 2-3 hodiny | **Složitost**: ⭐⭐⭐⭐

#### Cíle vzdělávání
- Implementovat strategie nasazení na podnikové úrovni
- Navrhovat bezpečnostní vzory a rámce pro dodržování předpisů
- Zavést monitorování, správu a řízení nákladů
- Vytvořit škálovatelné CI/CD pipeline s integrací AZD
- Aplikovat osvědčené postupy pro produkční nasazení kontejnerových aplikací (zabezpečení, monitorování, náklady, CI/CD)

#### Klíčové koncepty k osvojení
- Požadavky na bezpečnost a dodržování předpisů na podnikové úrovni
- Rámce řízení a implementace politik
- Pokročilé monitorování a správa nákladů
- Integrace CI/CD a automatizované pipeline nasazení
- Strategie nasazení blue-green a canary pro kontejnerové pracovní zátěže

#### Praktická cvičení
1. **Podniková bezpečnost**: Implementujte komplexní bezpečnostní vzory
2. **Rámec řízení**: Nastavte Azure Policy a správu prostředků
3. **Pokročilé monitorování**: Vytvořte dashboardy a automatizovaná upozornění
4. **Integrace CI/CD**: Vytvořte automatizované pipeline nasazení
5. **Produkční kontejnerové aplikace**: Aplikujte zabezpečení, monitorování a optimalizaci nákladů na příklad [Microservices Architecture](../../../examples/container-app/microservices)

#### Hodnotící otázky
- Jak implementujete podnikové zabezpečení v nasazeních AZD?
- Jaké vzory řízení zajišťují dodržování předpisů a kontrolu nákladů?
- Jak navrhujete škálovatelné monitorování pro produkční systémy?
- Jaké vzory CI/CD nejlépe fungují s pracovními postupy AZD?

#### Cíle vzdělávání
- Porozumět základům a klíčovým konceptům Azure Developer CLI
- Úspěšně nainstalovat a nakonfigurovat azd ve vašem vývojovém prostředí
- Dokončit první nasazení pomocí existující šablony
- Orientovat se ve struktuře projektu azd a pochopit klíčové komponenty

#### Klíčové koncepty k osvojení
- Šablony, prostředí a služby
- Struktura konfigurace azure.yaml
- Základní příkazy azd (init, up, down, deploy)
- Principy infrastruktury jako kódu
- Autentizace a autorizace Azure

#### Praktická cvičení

**Cvičení 1.1: Instalace a nastavení**
```bash
# Dokončete tyto úkoly:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Cvičení 1.2: První nasazení**
```bash
# Nasadit jednoduchou webovou aplikaci:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Cvičení 1.3: Analýza struktury projektu**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Hodnotící otázky
1. Jaké jsou tři základní koncepty architektury azd?
2. Jaký je účel souboru azure.yaml?
3. Jak prostředí pomáhají spravovat různé cíle nasazení?
4. Jaké metody autentizace lze použít s azd?
5. Co se stane, když poprvé spustíte `azd up`?

---

## Sledování pokroku a hodnotící rámec
```bash
# Vytvořte a nakonfigurujte více prostředí:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Cvičení 2.2: Pokročilá konfigurace**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Cvičení 2.3: Bez
5. Jaké jsou úvahy při nasazení do více regionů?

### Modul 4: Validace před nasazením (5. týden)

#### Cíle učení
- Provádět komplexní kontroly před nasazením
- Ovládnout plánování kapacity a validaci zdrojů
- Porozumět výběru SKU a optimalizaci nákladů
- Vytvořit automatizované validační pipeline

#### Klíčové koncepty k zvládnutí
- Kvóty a limity zdrojů Azure
- Kritéria výběru SKU a dopady na náklady
- Automatizované validační skripty a nástroje
- Metodiky plánování kapacity
- Testování výkonu a optimalizace

#### Praktická cvičení

**Cvičení 4.1: Plánování kapacity**  
```bash
# Implementovat ověření kapacity:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**Cvičení 4.2: Validace před nasazením**  
```powershell
# Vytvořte komplexní validační proces:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```
  
**Cvičení 4.3: Optimalizace SKU**  
```bash
# Optimalizovat konfigurace služeb:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```
  

#### Otázky pro sebehodnocení
1. Jaké faktory by měly ovlivnit rozhodnutí o výběru SKU?
2. Jak ověříte dostupnost zdrojů Azure před nasazením?
3. Jaké jsou klíčové komponenty systému kontroly před nasazením?
4. Jak odhadujete a kontrolujete náklady na nasazení?
5. Jaké monitorování je nezbytné pro plánování kapacity?

### Modul 5: Řešení problémů a ladění (6. týden)

#### Cíle učení
- Ovládnout systematické metodiky řešení problémů
- Získat odborné znalosti v ladění složitých problémů při nasazení
- Implementovat komplexní monitorování a upozornění
- Vytvořit postupy pro reakci na incidenty a obnovu

#### Klíčové koncepty k zvládnutí
- Běžné vzory selhání při nasazení
- Analýza logů a techniky korelace
- Monitorování výkonu a optimalizace
- Detekce bezpečnostních incidentů a reakce na ně
- Obnova po havárii a kontinuita podnikání

#### Praktická cvičení

**Cvičení 5.1: Scénáře řešení problémů**  
```bash
# Procvičte řešení běžných problémů:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```
  
**Cvičení 5.2: Implementace monitorování**  
```bash
# Nastavte komplexní monitorování:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```
  
**Cvičení 5.3: Reakce na incidenty**  
```bash
# Vytvořte postupy pro reakci na incidenty:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  

#### Otázky pro sebehodnocení
1. Jaký je systematický přístup k řešení problémů při nasazeních azd?
2. Jak korelujete logy napříč více službami a zdroji?
3. Jaké metriky monitorování jsou nejdůležitější pro včasnou detekci problémů?
4. Jak implementujete efektivní postupy obnovy po havárii?
5. Jaké jsou klíčové komponenty plánu reakce na incidenty?

### Modul 6: Pokročilá témata a osvědčené postupy (7.–8. týden)

#### Cíle učení
- Implementovat vzory nasazení na podnikové úrovni
- Ovládnout integraci CI/CD a automatizaci
- Vyvíjet vlastní šablony a přispívat do komunity
- Porozumět pokročilým požadavkům na bezpečnost a shodu

#### Klíčové koncepty k zvládnutí
- Vzory integrace CI/CD pipeline
- Vývoj a distribuce vlastních šablon
- Podniková správa a shoda
- Pokročilé konfigurace sítí a bezpečnosti
- Optimalizace výkonu a správa nákladů

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
# Vytvořte a publikujte vlastní šablony:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**Cvičení 6.3: Implementace na podnikové úrovni**  
```bash
# Implementujte funkce na úrovni podniku:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  

#### Otázky pro sebehodnocení
1. Jak integrujete azd do existujících CI/CD workflow?
2. Jaké jsou klíčové úvahy při vývoji vlastních šablon?
3. Jak implementujete správu a shodu v nasazeních azd?
4. Jaké jsou osvědčené postupy pro nasazení na podnikové úrovni?
5. Jak efektivně přispíváte do komunity azd?

## Praktické projekty

### Projekt 1: Osobní portfolio web
**Složitost**: Začátečník  
**Délka trvání**: 1–2 týdny  

Vytvořte a nasaďte osobní portfolio web pomocí:
- Hostování statického webu na Azure Storage
- Konfigurace vlastního doménového jména
- Integrace CDN pro globální výkon
- Automatizované pipeline pro nasazení

**Výstupy**:
- Funkční web nasazený na Azure
- Vlastní šablona azd pro nasazení portfolia
- Dokumentace procesu nasazení
- Doporučení pro analýzu nákladů a optimalizaci

### Projekt 2: Aplikace pro správu úkolů
**Složitost**: Středně pokročilý  
**Délka trvání**: 2–3 týdny  

Vytvořte full-stack aplikaci pro správu úkolů s:
- Frontendem React nasazeným na App Service
- Backendem Node.js s autentizací
- Databází PostgreSQL s migracemi
- Monitorováním pomocí Application Insights

**Výstupy**:
- Kompletní aplikace s autentizací uživatelů
- Schéma databáze a migrační skripty
- Dashboardy monitorování a pravidla upozornění
- Konfigurace nasazení pro více prostředí

### Projekt 3: E-commerce platforma založená na mikroservisech
**Složitost**: Pokročilý  
**Délka trvání**: 4–6 týdnů  

Navrhněte a implementujte e-commerce platformu založenou na mikroservisech:
- Více API služeb (katalog, objednávky, platby, uživatelé)
- Integrace fronty zpráv pomocí Service Bus
- Redis cache pro optimalizaci výkonu
- Komplexní logování a monitorování

**Referenční příklad**: Viz [Microservices Architecture](../../../examples/container-app/microservices) pro šablonu připravenou k produkci a průvodce nasazením

**Výstupy**:
- Kompletní architektura mikroservisů
- Vzory komunikace mezi službami
- Testování výkonu a optimalizace
- Implementace bezpečnosti připravené na produkci

## Hodnocení a certifikace

### Kontroly znalostí

Dokončete tyto testy po každém modulu:

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
- Simulace reakcí na incidenty  

**Hodnocení modulu 6**: Pokročilá témata  
- Návrh CI/CD pipeline  
- Vývoj vlastních šablon  
- Scénáře podnikové architektury  

### Závěrečný projekt

Navrhněte a implementujte kompletní řešení, které demonstruje zvládnutí všech konceptů:

**Požadavky**:
- Architektura aplikace s více vrstvami  
- Více prostředí pro nasazení  
- Komplexní monitorování a upozornění  
- Implementace bezpečnosti a shody  
- Optimalizace nákladů a ladění výkonu  
- Kompletní dokumentace a provozní manuály  

**Kritéria hodnocení**:
- Kvalita technické implementace  
- Úplnost dokumentace  
- Dodržování bezpečnostních zásad a osvědčených postupů  
- Optimalizace výkonu a nákladů  
- Účinnost řešení problémů a monitorování  

## Studijní zdroje a reference

### Oficiální dokumentace
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Dokumentace Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Zdroje komunity
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)  
- [GitHub organizace Azure-Samples](https://github.com/Azure-Samples)  
- [GitHub repozitář Azure Developer CLI](https://github.com/Azure/azure-dev)  

### Praktická prostředí
- [Azure Free Account](https://azure.microsoft.com/free/)  
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Další nástroje
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Doporučení pro studijní plán

### Studium na plný úvazek (8 týdnů)
- **1.–2. týden**: Moduly 1–2 (Začínáme, Konfigurace)  
- **3.–4. týden**: Moduly 3–4 (Nasazení, Validace před nasazením)  
- **5.–6. týden**: Moduly 5–6 (Řešení problémů, Pokročilá témata)  
- **7.–8. týden**: Praktické projekty a závěrečné hodnocení  

### Studium na částečný úvazek (16 týdnů)
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
- [ ] **První nasazení**: Úspěšně nasazena šablona todo-nodejs-mongo  
- [ ] **Nastavení prostředí**: Konfigurovány první proměnné prostředí  
- [ ] **Navigace zdrojů**: Prozkoumány nasazené zdroje v Azure Portal  
- [ ] **Ovládání příkazů**: Zvládnutí základních příkazů AZD  

#### 🤖 Kapitola 2: Vývoj zaměřený na AI  
- [ ] **Nasazení šablony AI**: Úspěšně nasazena azure-search-openai-demo  
- [ ] **Implementace RAG**: Konfigurováno indexování a vyhledávání dokumentů  
- [ ] **Konfigurace modelu**: Nastaveno více AI modelů s různými účely  
- [ ] **Monitorování AI**: Implementovány Application Insights pro AI úlohy  
- [ ] **Optimalizace výkonu**: Vyladěn výkon AI aplikace  

#### ⚙️ Kapitola 3: Konfigurace a autentizace
- [ ] **Nastavení více prostředí**: Konfigurována prostředí dev, staging a prod  
- [ ] **Implementace bezpečnosti**: Nastavena autentizace spravované identity  
- [ ] **Správa tajemství**: Integrovaný Azure Key Vault pro citlivá data  
- [ ] **Správa parametrů**: Vytvořeny konfigurace specifické pro prostředí  
- [ ] **Ovládnutí autentizace**: Implementovány bezpečné přístupové vzory  

#### 🏗️ Kapitola 4: Infrastruktura jako kód a nasazení
- [ ] **Vytvoření vlastní šablony**: Postavena šablona aplikace s více službami  
- [ ] **Ovládnutí Bicep**: Vytvořeny modulární, znovupoužitelné komponenty infrastruktury  
- [ ] **Automatizace nasazení**: Implementovány pre/post nasazovací hooky  
- [ ] **Návrh architektury**: Nasazena komplexní architektura mikroservisů  
- [ ] **Optimalizace šablon**: Optimalizovány šablony pro výkon a náklady  

#### 🎯 Kapitola 5: AI řešení s více agenty
- [ ] **Nasazení maloobchodního řešení**: Nasazení kompletního maloobchodního scénáře s více agenty  
- [ ] **Přizpůsobení agentů**: Upraveno chování agentů pro zákazníky a inventář  
- [ ] **Škálování architektury**: Implementováno vyvažování zátěže a automatické škálování  
- [ ] **Monitorování produkce**: Nastaveno komplexní monitorování a upozornění  
- [ ] **Ladění výkonu**: Optimalizován výkon systému s více agenty  

#### 🔍 Kapitola 6: Validace před nasazením a plánování
- [ ] **Analýza kapacity**: Analyzovány požadavky na zdroje pro aplikace  
- [ ] **Optimalizace SKU**: Vybrány nákladově efektivní úrovně služeb  
- [ ] **Automatizace validace**: Implementovány skripty pro kontrolu před nasazením  
- [ ] **Plánování nákladů**: Vytvořeny odhady nákladů na nasazení a rozpočty  
- [ ] **Hodnocení rizik**: Identifikována a zmírněna rizika nasazení  

#### 🚨 Kapitola 7: Řešení problémů a ladění
- [ ] **Diagnostické dovednosti**: Úspěšně odladěna záměrně rozbitá nasazení  
- [ ] **Analýza logů**: Efektivně použity Azure Monitor a Application Insights  
- [ ] **Ladění výkonu**: Optimalizovány pomalu fungující aplikace  
- [ ] **Postupy obnovy**: Implementovány zálohy a obnova po havárii  
- [ ] **Nastavení monitorování**: Vytvořeno proaktivní monitorování a upozornění  

#### 🏢 Kapitola 8: Produkční a podnikové vzory
- [ ] **Podniková bezpečnost**: Implementovány komplexní bezpečnostní vzory  
- [ ] **Rámec správy**: Nastaveny Azure Policy a správa zdrojů  
- [ ] **Pokročilé monitorování**: Vytvořeny dashboardy a automatizované upozornění  
- [ ] **Integrace CI/CD**: Postaveny automatizované pipeline pro nasazení  
- [ ] **Implementace shody**: Splněny požadavky na podnikovou shodu  

### Časová osa učení a milníky

#### 1.–2. týden: Základy
- **Milník**: Nasazení první AI aplikace pomocí AZD  
- **Validace**: Funkční aplikace dostupná přes veřejnou URL  
- **Dovednosti**: Základní workflow AZD a integrace AI služeb  

#### 3.–4. týden: Ovládnutí konfigurace
- **Milník**: Nasazení do více prostředí s bezpečnou autentizací  
- **Validace**: Stejná aplikace nasazena do dev/staging/prod  
- **Dovednosti**: Správa prostředí a implementace bezpečnosti  

#### 5.–6. týden: Odbornost v infrastruktuře
- **Milník**: Vlastní šablona pro komplexní aplikaci s více službami  
- **Validace**: Znovupoužitelná šablona nasazena jiným členem týmu
5. **Přínos pro komunitu**: Sdílejte šablony nebo vylepšení

#### Výsledky profesního rozvoje
- **Projekty do portfolia**: 8 nasazení připravených pro produkci
- **Technické dovednosti**: Odborné znalosti nasazení AZD a AI na úrovni průmyslového standardu
- **Schopnosti řešení problémů**: Samostatné odstraňování problémů a optimalizace
- **Uznání v komunitě**: Aktivní účast v komunitě vývojářů Azure
- **Kariérní růst**: Dovednosti přímo použitelné pro role v oblasti cloudu a AI

#### Metriky úspěchu
- **Úspěšnost nasazení**: >95 % úspěšných nasazení
- **Čas na řešení problémů**: <30 minut pro běžné problémy
- **Optimalizace výkonu**: Prokazatelné zlepšení nákladů a výkonu
- **Soulad s bezpečností**: Všechna nasazení splňují podnikové bezpečnostní standardy
- **Předávání znalostí**: Schopnost mentorovat ostatní vývojáře

### Neustálé učení a zapojení do komunity

#### Udržujte si přehled
- **Aktualizace Azure**: Sledujte poznámky k vydání Azure Developer CLI
- **Komunitní akce**: Účastněte se akcí pro vývojáře Azure a AI
- **Dokumentace**: Přispívejte do komunitní dokumentace a příkladů
- **Zpětná vazba**: Poskytujte zpětnou vazbu k obsahu kurzu a službám Azure

#### Kariérní rozvoj
- **Profesionální síť**: Spojte se s odborníky na Azure a AI
- **Příležitosti k prezentaci**: Prezentujte své poznatky na konferencích nebo setkáních
- **Příspěvky do open source**: Přispívejte do šablon a nástrojů AZD
- **Mentorství**: Veďte ostatní vývojáře na jejich cestě k učení AZD

---

**Navigace kapitolami:**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Začněte se učit**: [Kapitola 1: Základy a rychlý start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Sledování pokroku**: Sledujte svůj postup prostřednictvím komplexního osmikapitolového vzdělávacího systému
- **🤝 Komunita**: [Azure Discord](https://discord.gg/microsoft-azure) pro podporu a diskusi

**Sledování studijního pokroku**: Použijte tuto strukturovanou příručku k osvojení Azure Developer CLI prostřednictvím postupného, praktického učení s měřitelnými výsledky a přínosy pro profesní rozvoj.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->