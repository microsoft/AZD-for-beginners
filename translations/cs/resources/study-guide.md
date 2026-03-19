# Studijní průvodce - Komplexní výukové cíle

**Navigace výukovou cestou**
- **📚 Domů kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Začněte se učit**: [Kapitola 1: Základy a rychlý start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Sledování pokroku**: [Dokončení kurzu](../README.md#-course-completion--certification)

## Úvod

Tento komplexní studijní průvodce poskytuje strukturované výukové cíle, klíčové koncepty, praktická cvičení a hodnotící materiály, které vám pomohou zvládnout Azure Developer CLI (azd). Používejte tento průvodce ke sledování svého pokroku a ověření, že jste pokryli všechna podstatná témata.

## Cíle učení

Po dokončení tohoto studijního průvodce budete:
- Ovládat všechny základní i pokročilé koncepty Azure Developer CLI
- Rozvíjet praktické dovednosti v nasazování a řízení aplikací v Azure
- Získat jistotu při řešení problémů a optimalizaci nasazení
- Rozumět postupům nasazení připravených pro provoz a bezpečnostním aspektům

## Výstupy učení

Po dokončení všech sekcí tohoto průvodce budete schopni:
- Navrhovat, nasazovat a spravovat kompletní architektury aplikací pomocí azd
- Implementovat komplexní monitorování, zabezpečení a strategie optimalizace nákladů
- Nezávisle řešit složité problémy při nasazení
- Vytvářet vlastní šablony a přispívat do komunity azd

## Struktura učení v 8 kapitolách

### Kapitola 1: Základy & Rychlý start (Týden 1)
**Doba trvání**: 30-45 minut | **Složitost**: ⭐

#### Výukové cíle
- Pochopit základní pojmy a terminologii Azure Developer CLI
- Úspěšně nainstalovat a nakonfigurovat AZD na vašem vývojovém prostředí
- Nasadit první aplikaci pomocí existující šablony
- Efektivně se orientovat v příkazovém rozhraní AZD

#### Klíčové koncepty k osvojení
- Struktura projektu AZD a jeho součásti (azure.yaml, infra/, src/)
- Pracovní postupy nasazení založené na šablonách
- Základy konfigurace prostředí
- Správa skupin prostředků a předplatného

#### Praktická cvičení
1. **Ověření instalace**: Nainstalujte AZD a ověřte pomocí `azd version`
2. **První nasazení**: Úspěšně nasaďte šablonu todo-nodejs-mongo
3. **Nastavení prostředí**: Nakonfigurujte své první proměnné prostředí
4. **Prozkoumání zdrojů**: Procházejte nasazené zdroje v Azure Portal

#### Kontrolní otázky
- Jaké jsou základní součásti projektu AZD?
- Jak inicializujete nový projekt ze šablony?
- V čem je rozdíl mezi `azd up` a `azd deploy`?
- Jak spravujete více prostředí pomocí AZD?

---

### Kapitola 2: Vývoj orientovaný na AI (Týden 2)
**Doba trvání**: 1-2 hodiny | **Složitost**: ⭐⭐

#### Výukové cíle
- Integrovat služby Microsoft Foundry do pracovních postupů AZD
- Nasazovat a konfigurovat aplikace poháněné AI
- Pochopit implementační vzory RAG (Retrieval-Augmented Generation)
- Spravovat nasazení AI modelů a škálování

#### Klíčové koncepty k osvojení
- Integrace služby Microsoft Foundry Models a správa API
- Konfigurace AI Search a vektorové indexování
- Strategie nasazení modelů a plánování kapacit
- Monitorování AI aplikací a optimalizace výkonu

#### Praktická cvičení
1. **Nasazení AI chatu**: Nasaďte šablonu azure-search-openai-demo
2. **Implementace RAG**: Nakonfigurujte indexování a vyhledávání dokumentů
3. **Konfigurace modelů**: Nastavte více AI modelů pro různé účely
4. **Monitorování AI**: Implementujte Application Insights pro AI pracovní zatížení

#### Kontrolní otázky
- Jak nakonfigurujete služby Microsoft Foundry Models v šabloně AZD?
- Jaké jsou klíčové komponenty architektury RAG?
- Jak spravujete kapacitu a škálování AI modelů?
- Jaké metriky monitorování jsou důležité pro AI aplikace?

---

### Kapitola 3: Konfigurace a autentizace (Týden 3)
**Doba trvání**: 45-60 minut | **Složitost**: ⭐⭐

#### Výukové cíle
- Ovládnout strategie konfigurace a správy prostředí
- Implementovat bezpečné vzory autentizace a spravované identity
- Organizovat zdroje pomocí vhodných pojmenovacích konvencí
- Nakonfigurovat nasazení pro více prostředí (dev, staging, prod)

#### Klíčové koncepty k osvojení
- Hierarchie prostředí a priorita konfigurace
- Spravovaná identita a autentizace pomocí service principal
- Integrace Key Vault pro správu tajemství
- Správa parametrů specifických pro prostředí

#### Praktická cvičení
1. **Nastavení více prostředí**: Nakonfigurujte prostředí dev, staging a prod
2. **Konfigurace bezpečnosti**: Implementujte autentizaci spravované identity
3. **Správa tajemství**: Integrujte Azure Key Vault pro citlivá data
4. **Správa parametrů**: Vytvořte konfigurace specifické pro prostředí

#### Kontrolní otázky
- Jak nakonfigurujete různá prostředí pomocí AZD?
- Jaké jsou výhody používání spravované identity oproti service principals?
- Jak bezpečně spravujete tajemství aplikací?
- Jaká je hierarchie konfigurace v AZD?

---

### Kapitola 4: Infrastruktura jako kód a nasazení (Týdny 4-5)
**Doba trvání**: 1-1.5 hodin | **Složitost**: ⭐⭐⭐

#### Výukové cíle
- Vytvářet a přizpůsobovat Bicep šablony infrastruktury
- Implementovat pokročilé vzory nasazení a pracovní postupy
- Pochopit strategie poskytování zdrojů
- Navrhovat škálovatelné více-službové architektury

- Nasazovat kontejnerizované aplikace pomocí Azure Container Apps a AZD


#### Klíčové koncepty k osvojení
- Struktura Bicep šablon a osvědčené postupy
- Závislosti zdrojů a pořadí nasazení
- Soubor parametrů a modularita šablon
- Vlastní hooky a automatizace nasazení
- Vzory nasazení container app (rychlý start, produkce, mikroservisy)

#### Praktická cvičení
1. **Vytvoření vlastní šablony**: Postavte šablonu aplikace s více službami
2. **Mistrovství v Bicep**: Vytvořte modulární, znovupoužitelné komponenty infrastruktury
3. **Automatizace nasazení**: Implementujte pre/post nasazovací hooky
4. **Návrh architektury**: Nasadťe složitou mikroservisní architekturu
5. **Nasazení Container App**: Nasaďte příklady [Simple Flask API](../../../examples/container-app/simple-flask-api) a [Microservices Architecture](../../../examples/container-app/microservices) pomocí AZD

#### Kontrolní otázky
- Jak vytvoříte vlastní Bicep šablony pro AZD?
- Jaké jsou osvědčené postupy pro organizaci infrastruktury jako kódu?
- Jak řešíte závislosti zdrojů v šablonách?
- Jaké vzory nasazení podporují aktualizace bez výpadku?

---

### Kapitola 5: Víceagentní AI řešení (Týdny 6-7)
**Doba trvání**: 2-3 hodiny | **Složitost**: ⭐⭐⭐⭐

#### Výukové cíle
- Navrhovat a implementovat víceagentní AI architektury
- Orchestrace koordinace a komunikace agentů
- Nasadit produkční AI řešení s monitorováním
- Pochopit specializaci agentů a vzory pracovních toků
- Integrovat kontejnerizované mikroservisy jako součást víceagentních řešení

#### Klíčové koncepty k osvojení
- Vzory víceagentní architektury a principy návrhu
- Komunikační protokoly agentů a tok dat
- Strategie load balancing a škálování pro AI agenty
- Produkční monitorování víceagentních systémů
- Komunikace služba-služba v kontejnerizovaném prostředí

#### Praktická cvičení
1. **Nasazení řešení pro retail**: Nasaďte kompletní víceagentní scénář pro retail
2. **Přizpůsobení agentů**: Upravte chování agentů Customer a Inventory
3. **Škálování architektury**: Implementujte load balancing a auto-škálování
4. **Produkční monitorování**: Nastavte komplexní monitorování a alertování
5. **Integrace mikroservis**: Rozšiřte příklad [Microservices Architecture](../../../examples/container-app/microservices) tak, aby podporoval workflow založené na agentech

#### Kontrolní otázky
- Jak navrhnete efektivní komunikační vzory pro víceagentní systém?
- Jaké jsou klíčové aspekty pro škálování AI agentních pracovních zátěží?
- Jak monitorujete a ladíte víceagentní AI systémy?
- Jaké produkční vzory zajišťují spolehlivost AI agentů?

---

### Kapitola 6: Validace a plánování před nasazením (Týden 8)
**Doba trvání**: 1 hodina | **Složitost**: ⭐⭐

#### Výukové cíle
- Provést komplexní plánování kapacit a validaci zdrojů
- Vybrat optimální SKU v Azure pro efektivitu nákladů
- Implementovat automatizované pre-flight kontroly a validace
- Naplánovat nasazení s ohledem na optimalizaci nákladů

#### Klíčové koncepty k osvojení
- Limity kvót a kapacitní omezení Azure zdrojů
- Kritéria výběru SKU a optimalizace nákladů
- Automatizované validační skripty a testování
- Plánování nasazení a hodnocení rizik

#### Praktická cvičení
1. **Analýza kapacit**: Analyzujte požadavky na zdroje pro vaše aplikace
2. **Optimalizace SKU**: Porovnejte a vyberte nákladově efektivní úrovně služeb
3. **Validace automatizace**: Implementujte skripty pro kontroly před nasazením
4. **Plánování nákladů**: Vytvořte odhady nákladů nasazení a rozpočty

#### Kontrolní otázky
- Jak validujete kapacitu Azure před nasazením?
- Jaké faktory ovlivňují rozhodnutí při výběru SKU?
- Jak automatizujete validaci před nasazením?
- Jaké strategie pomáhají optimalizovat náklady na nasazení?

---

### Kapitola 7: Řešení potíží a ladění (Týden 9)
**Doba trvání**: 1-1.5 hodin | **Složitost**: ⭐⭐

#### Výukové cíle
- Vyvinout systematické přístupy k ladění AZD nasazení
- Řešit běžné problémy s nasazením a konfigurací
- Ladit problémy specifické pro AI a výkonové potíže
- Implementovat monitorování a alertování pro proaktivní detekci problémů

#### Klíčové koncepty k osvojení
- Diagnostické techniky a strategie logování
- Běžné vzory selhání a jejich řešení
- Monitorování výkonu a optimalizace
- Postupy reakce na incidenty a obnovení

#### Praktická cvičení
1. **Diagnostické dovednosti**: Procvičujte na úmyslně rozbitých nasazeních
2. **Analýza logů**: Efektivně používejte Azure Monitor a Application Insights
3. **Ladění výkonu**: Optimalizujte pomalu běžící aplikace
4. **Obnovovací postupy**: Implementujte zálohování a obnovu po havárii

#### Kontrolní otázky
- Jaké jsou nejběžnější chyby při nasazení AZD?
- Jak ladíte problémy s autentizací a oprávněními?
- Jaké monitorovací strategie pomáhají předcházet produkčním problémům?
- Jak optimalizujete výkon aplikace v Azure?

---

### Kapitola 8: Produkční a podnikové vzory (Týdny 10-11)
**Doba trvání**: 2-3 hodiny | **Složitost**: ⭐⭐⭐⭐

#### Výukové cíle
- Implementovat nasazovací strategie vhodné pro podnikové použití
- Navrhovat bezpečnostní vzory a rámce pro soulady
- Zavést monitorování, governance a řízení nákladů
- Vytvořit škálovatelné CI/CD pipeline s integrací AZD
- Aplikovat osvědčené postupy pro produkční nasazení container app (bezpečnost, monitorování, náklady, CI/CD)

#### Klíčové koncepty k osvojení
- Požadavky na podnikové zabezpečení a soulady
- Rámce governance a implementace politik
- Pokročilé monitorování a řízení nákladů
- Integrace CI/CD a automatizované nasazovací pipeline
- Blue-green a canary strategie nasazení pro kontejnerizované zátěže

#### Praktická cvičení
1. **Podnikové zabezpečení**: Implementujte komplexní bezpečnostní vzory
2. **Rámec governance**: Nastavte Azure Policy a správu zdrojů
3. **Pokročilé monitorování**: Vytvořte dashboardy a automatizované alerty
4. **Integrace CI/CD**: Postavte automatizované nasazovací pipeline
5. **Produkční Container Apps**: Aplikujte zabezpečení, monitorování a optimalizaci nákladů na příkladu [Microservices Architecture](../../../examples/container-app/microservices)

#### Kontrolní otázky
- Jak implementujete podnikové zabezpečení v AZD nasazeních?
- Jaké vzory governance zajišťují soulady a kontrolu nákladů?
- Jak navrhujete škálovatelné monitorování pro produkční systémy?
- Jaké CI/CD vzory nejlépe fungují s pracovními postupy AZD?

#### Výukové cíle
- Pochopit základy a klíčové koncepty Azure Developer CLI
- Úspěšně nainstalovat a nakonfigurovat azd ve vašem vývojovém prostředí
- Dokončit první nasazení pomocí existující šablony
- Orientovat se ve struktuře projektu azd a rozumět klíčovým komponentám

#### Klíčové koncepty k osvojení
- Šablony, prostředí a služby
- Struktura konfigurace azure.yaml
- Základní příkazy azd (init, up, down, deploy)
- Principy Infrastructure as Code
- Autentizace a autorizace v Azure

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

#### Otázky k sebehodnocení
1. Jaké jsou tři základní koncepty architektury azd?
2. K čemu slouží soubor azure.yaml?
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

**Cvičení 2.3: Konfigurace zabezpečení**
```bash
# Implementujte osvědčené bezpečnostní postupy:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Otázky k sebehodnocení
1. Jak azd řeší prioritu proměnných prostředí?
2. Co jsou deployment hooky a kdy byste je měli použít?
3. Jak nakonfigurujete různé SKU pro různá prostředí?
4. Jaké jsou bezpečnostní dopady různých metod autentizace?
5. Jak spravujete tajemství a citlivá konfigurační data?

### Modul 3: Nasazení a Provisioning (Týden 4)

#### Výukové cíle
- Ovládnout pracovní postupy nasazení a osvědčené postupy
- Pochopit Infrastructure as Code pomocí Bicep šablon
- Implementovat složité více-službové architektury
- Optimalizovat výkon a spolehlivost nasazení

#### Klíčové koncepty k osvojení
- Struktura Bicep šablon a moduly
- Závislosti zdrojů a pořadí
- Strategie nasazení (blue-green, rolling updates)
- Nasazení do více regionů
- Migrace databází a správa dat

#### Praktická cvičení

**Cvičení 3.1: Vlastní infrastruktura**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Cvičení 3.2: Aplikace s více službami**
```bash
# Nasadit mikroservisní architekturu:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Cvičení 3.3: Integrace databáze**
```bash
# Implementovat vzory nasazení databází:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Otázky k sebehodnocení
1. Jaké jsou výhody použití Bicep oproti ARM šablonám?
2. Jak řešíte migrace databází v nasazeních azd?
3. Jaké strategie existují pro nasazení bez výpadku?
4. Jak spravujete závislosti mezi službami?
5. Jaká jsou úvahy při nasazení do více regionů?

### Modul 4: Validace před nasazením (Týden 5)

#### Výukové cíle
- Proveďte komplexní kontroly před nasazením
- Ovládněte plánování kapacit a ověřování zdrojů
- Pochopte výběr SKU a optimalizaci nákladů
- Vytvořte automatizované validační pipeline

#### Klíčové koncepty k osvojení
- Kvóty a limity zdrojů v Azure
- Kritéria výběru SKU a dopady na náklady
- Automatizované validační skripty a nástroje
- Metodiky plánování kapacit
- Testování výkonu a optimalizace

#### Procvičovací úlohy

**Cvičení 4.1: Plánování kapacit**
```bash
# Implementovat ověření kapacity:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Cvičení 4.2: Přednasazovací validace**
```powershell
# Vytvořte komplexní validační postup:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Cvičení 4.3: Optimalizace SKU**
```bash
# Optimalizujte konfigurace služeb:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Otázky pro sebehodnocení
1. Jaké faktory by měly ovlivňovat rozhodnutí při výběru SKU?
2. Jak ověříte dostupnost zdrojů v Azure před nasazením?
3. Jaké jsou klíčové komponenty systému předběžných kontrol?
4. Jak odhadujete a řídíte náklady na nasazení?
5. Jaké monitorování je nezbytné pro plánování kapacit?

### Modul 5: Řešení problémů a ladění (Týden 6)

#### Cíle učení
- Zvládněte systematické metodiky řešení problémů
- Rozvíjejte odborné znalosti v ladění složitých problémů s nasazením
- Zaveďte komplexní monitorování a upozornění
- Vytvořte postupy pro reakci na incidenty a obnovu

#### Klíčové koncepty k osvojení
- Běžné vzory selhání nasazení
- Techniky analýzy a korelace logů
- Monitorování výkonu a optimalizace
- Detekce bezpečnostních incidentů a reakce
- Obnova po havárii a kontinuita provozu

#### Procvičovací úlohy

**Cvičení 5.1: Scénáře řešení problémů**
```bash
# Procvičujte řešení běžných problémů:
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
1. Jaký je systematický postup řešení problémů u nasazení pomocí azd?
2. Jak korelujete logy napříč více službami a zdroji?
3. Které metriky monitoringu jsou nejkritičtější pro včasné odhalení problémů?
4. Jak implementujete efektivní postupy obnovy po havárii?
5. Jaké jsou klíčové součásti plánu reakce na incidenty?

### Modul 6: Pokročilá témata a osvědčené postupy (Týdny 7-8)

#### Cíle učení
- Implementujte podnikové vzory nasazení
- Ovládněte integraci CI/CD a automatizaci
- Vyvíjejte vlastní šablony a přispívejte komunitě
- Pochopte pokročilé požadavky na bezpečnost a shodu

#### Klíčové koncepty k osvojení
- Vzory integrace CI/CD pipeline
- Vývoj a distribuce vlastních šablon
- Podnikové řízení a shoda
- Pokročilé konfigurace sítí a zabezpečení
- Optimalizace výkonu a řízení nákladů

#### Procvičovací úlohy

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

**Cvičení 6.3: Podniková implementace**
```bash
# Implementujte funkce na podnikové úrovni:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Otázky pro sebehodnocení
1. Jak integrujete azd do existujících pracovních postupů CI/CD?
2. Jaká jsou klíčová hlediska při vývoji vlastních šablon?
3. Jak implementujete řízení a shodu při nasazeních pomocí azd?
4. Jaké jsou osvědčené postupy pro nasazení v podnikovém měřítku?
5. Jak efektivně přispívat do komunity azd?

## Praktické projekty

### Projekt 1: Osobní portfolio web
**Složitost**: Začátečník  
**Doba trvání**: 1-2 týdny

Vytvořte a nasaďte osobní portfolio web pomocí:
- Statické hostování webu v Azure Storage
- Konfigurace vlastního doménového jména
- Integrace CDN pro globální výkon
- Automatizovaný pipeline nasazení

**Výstupy**:
- Fungující web nasazený v Azure
- Vlastní šablona azd pro nasazení portfolia
- Dokumentace procesu nasazení
- Analýza nákladů a doporučení pro optimalizaci

### Projekt 2: Aplikace pro správu úkolů
**Složitost**: Středně pokročilá  
**Doba trvání**: 2-3 týdny

Vytvořte full-stack aplikaci pro správu úkolů s:
- React frontend nasazený do App Service
- Node.js API backend s autentizací
- Databáze PostgreSQL s migracemi
- Monitorování pomocí Application Insights

**Výstupy**:
- Kompletní aplikace s uživatelskou autentizací
- Databázové schéma a skripty migrací
- Monitoring dashboardy a pravidla upozornění
- Konfigurace nasazení pro více prostředí

### Projekt 3: Mikroservisní e‑commerce platforma
**Složitost**: Pokročilá  
**Doba trvání**: 4-6 týdnů

Navrhněte a implementujte e‑commerce platformu založenou na mikroservisách:
- Více API služeb (katalog, objednávky, platby, uživatelé)
- Integrace fronty zpráv pomocí Service Bus
- Redis cache pro optimalizaci výkonu
- Komplexní logování a monitorování

**Referenční příklad**: Viz [Architektura mikroservis](../../../examples/container-app/microservices) pro produkčně připravenou šablonu a průvodce nasazením

**Výstupy**:
- Kompletní mikroservisní architektura
- Vzory komunikace mezi službami
- Testování výkonu a optimalizace
- Bezpečnostní implementace připravená do produkce

## Hodnocení a certifikace

### Kontroly znalostí

Dokončete tato hodnocení po každém modulu:

**Hodnocení modulu 1**: Základní koncepty a instalace
- Otázky s výběrem odpovědí na základní koncepty
- Praktické úkoly instalace a konfigurace
- Jednoduché cvičení nasazení

**Hodnocení modulu 2**: Konfigurace a prostředí
- Scénáře správy prostředí
- Cvičení řešení problémů s konfigurací
- Implementace bezpečnostní konfigurace

**Hodnocení modulu 3**: Nasazení a zřizování
- Výzvy návrhu infrastruktury
- Scénáře nasazení více služeb
- Cvičení optimalizace výkonu

**Hodnocení modulu 4**: Přednasazovací validace
- Případové studie plánování kapacit
- Scénáře optimalizace nákladů
- Implementace validační pipeline

**Hodnocení modulu 5**: Řešení problémů a ladění
- Cvičení diagnostiky problémů
- Úlohy implementace monitorování
- Simulace reakce na incidenty

**Hodnocení modulu 6**: Pokročilá témata
- Návrh CI/CD pipeline
- Vývoj vlastních šablon
- Scénáře podnikové architektury

### Závěrečný projekt

Navrhněte a implementujte kompletní řešení, které demonstruje zvládnutí všech konceptů:

**Požadavky**:
- Vícevrstvá architektura aplikace
- Více nasazovacích prostředí
- Komplexní monitorování a upozornění
- Implementace bezpečnosti a shody
- Optimalizace nákladů a ladění výkonu
- Kompletní dokumentace a runbooky

**Kritéria hodnocení**:
- Kvalita technické implementace
- Úplnost dokumentace
- Dodržování bezpečnostních zásad a osvědčených postupů
- Optimalizace výkonu a nákladů
- Efektivita řešení problémů a monitorování

## Studijní zdroje a reference

### Oficiální dokumentace
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Dokumentace Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centrum architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Komunitní zdroje
- [Galerie šablon AZD](https://azure.github.io/awesome-azd/)
- [Organizace Azure-Samples na GitHubu](https://github.com/Azure-Samples)
- [Repozitář Azure Developer CLI na GitHubu](https://github.com/Azure/azure-dev)

### Procvičovací prostředí
- [Bezplatný účet Azure](https://azure.microsoft.com/free/)
- [Bezplatná úroveň Azure DevOps](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Další nástroje
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Balíček rozšíření Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Doporučený studijní plán

### Intenzivní studium (8 týdnů)
- **Týdny 1-2**: Moduly 1-2 (Začínáme, Konfigurace)
- **Týdny 3-4**: Moduly 3-4 (Nasazení, Přednasazení)
- **Týdny 5-6**: Moduly 5-6 (Řešení problémů, Pokročilá témata)
- **Týdny 7-8**: Praktické projekty a závěrečné hodnocení

### Částečné studium (16 týdnů)
- **Týdny 1-4**: Modul 1 (Začínáme)
- **Týdny 5-7**: Modul 2 (Konfigurace a prostředí)
- **Týdny 8-10**: Modul 3 (Nasazení a zřizování prostředků)
- **Týdny 11-12**: Modul 4 (Přednasazovací validace)
- **Týdny 13-14**: Modul 5 (Řešení problémů a ladění)
- **Týdny 15-16**: Modul 6 (Pokročilá témata a hodnocení)

---

## Rámec sledování pokroku a hodnocení

### Kontrolní seznam dokončení kapitol

Sledujte svůj pokrok v každé kapitole pomocí těchto měřitelných výsledků:

#### 📚 Kapitola 1: Základy a rychlý start
- [ ] **Instalace dokončena**: AZD nainstalován a ověřen na vašem systému
- [ ] **První nasazení**: Úspěšně nasazena šablona todo-nodejs-mongo
- [ ] **Nastavení prostředí**: Nakonfigurovány první proměnné prostředí
- [ ] **Procházení zdrojů**: Prozkoumány nasazené zdroje v Azure Portal
- [ ] **Ovládání příkazů**: Pohodlné používání základních příkazů AZD

#### 🤖 Kapitola 2: Vývoj orientovaný na AI  
- [ ] **Nasazení AI šablony**: Úspěšně nasazena ukázka azure-search-openai-demo
- [ ] **Implementace RAG**: Nakonfigurováno indexování a vyhledávání dokumentů
- [ ] **Konfigurace modelů**: Nastaveno několik AI modelů pro různé účely
- [ ] **Monitoring AI**: Implementován Application Insights pro AI zátěže
- [ ] **Optimalizace výkonu**: Ladění výkonu AI aplikace

#### ⚙️ Kapitola 3: Konfigurace a autentizace
- [ ] **Nastavení více prostředí**: Nakonfigurována prostředí dev, staging a prod
- [ ] **Implementace bezpečnosti**: Nastavena autentizace pomocí managed identity
- [ ] **Správa tajemství**: Integrovan Azure Key Vault pro citlivá data
- [ ] **Správa parametrů**: Vytvořeny konfigurace specifické pro prostředí
- [ ] **Ovládání autentizace**: Implementovány bezpečné vzory přístupu

#### 🏗️ Kapitola 4: Infrastruktura jako kód a nasazení
- [ ] **Tvorba vlastní šablony**: Vytvořena šablona více služeb
- [ ] **Ovládání Bicep**: Vytvořeny modulární, znovupoužitelné infrastrukturní komponenty
- [ ] **Automatizace nasazení**: Implementovány pre/post nasazovací hooky
- [ ] **Návrh architektury**: Nasazena složitá mikroservisní architektura
- [ ] **Optimalizace šablon**: Optimalizovány šablony pro výkon a náklady

#### 🎯 Kapitola 5: Řešení AI s více agenty
- [ ] **Nasazení maloobchodního řešení**: Nasazeno kompletní víceagentní maloobchodní scénář
- [ ] **Přizpůsobení agentů**: Upraveno chování agentů Customer a Inventory
- [ ] **Škálování architektury**: Implementováno vyrovnávání zátěže a automatické škálování
- [ ] **Produkční monitoring**: Nastaveno komplexní monitorování a upozornění
- [ ] **Ladění výkonu**: Optimalizován výkon víceagentního systému

#### 🔍 Kapitola 6: Přednasazovací validace a plánování
- [ ] **Analýza kapacit**: Analyzovány požadavky na zdroje pro aplikace
- [ ] **Optimalizace SKU**: Vybrány nákladově efektivní úrovně služeb
- [ ] **Automatizace validace**: Implementovány skripty přednasazovacích kontrol
- [ ] **Plánování nákladů**: Vytvořeny odhady nákladů nasazení a rozpočty
- [ ] **Hodnocení rizik**: Identifikována a zmírněna rizika nasazení

#### 🚨 Kapitola 7: Řešení problémů a ladění
- [ ] **Diagnostické dovednosti**: Úspěšně odladěna záměrně poškozená nasazení
- [ ] **Analýza logů**: Efektivně použito Azure Monitor a Application Insights
- [ ] **Ladění výkonu**: Optimalizovány pomalu fungující aplikace
- [ ] **Postupy obnovy**: Implementováno zálohování a obnova po havárii
- [ ] **Nastavení monitorování**: Vytvořeno proaktivní monitorování a upozornění

#### 🏢 Kapitola 8: Produkční a podnikové vzory
- [ ] **Podniková bezpečnost**: Implementovány komplexní bezpečnostní vzory
- [ ] **Rámec správy**: Nastaven Azure Policy a správa zdrojů
- [ ] **Pokročilé monitorování**: Vytvořeny dashboardy a automatizovaná upozornění
- [ ] **Integrace CI/CD**: Vytvořeny automatizované nasazovací pipeline
- [ ] **Implementace shody**: Splněny podnikové požadavky na shodu

### Časový plán učení a milníky

#### Týden 1-2: Budování základů
- **Milník**: Nasadit první AI aplikaci pomocí AZD
- **Validace**: Fungující aplikace přístupná přes veřejné URL
- **Dovednosti**: Základní workflowy AZD a integrace AI služeb

#### Týden 3-4: Ovládnutí konfigurace
- **Milník**: Nasazení do více prostředí s bezpečnou autentizací
- **Validace**: Ta samá aplikace nasazena do dev/staging/prod
- **Dovednosti**: Správa prostředí a implementace bezpečnosti

#### Týden 5-6: Odbornost v infrastruktuře
- **Milník**: Vlastní šablona pro složitou aplikaci více služeb
- **Validace**: Znovupoužitelná šablona nasazena jiným členem týmu
- **Dovednosti**: Ovládnutí Bicep a automatizace infrastruktury

#### Týden 7-8: Pokročilá implementace AI
- **Milník**: Produkčně připravené víceagentní AI řešení
- **Validace**: Systém zvládá reálnou zátěž s monitoringem
- **Dovednosti**: Orchestrace více agentů a optimalizace výkonu

#### Týden 9-10: Připravenost do produkce
- **Milník**: Podnikové nasazení s plnou shodou
- **Validace**: Prošlo bezpečnostní revizí a auditem optimalizace nákladů
- **Dovednosti**: Správa, monitorování a integrace CI/CD

### Hodnocení a certifikace

#### Metody ověření znalostí
1. **Praktická nasazení**: Funkční aplikace pro každou kapitolu
2. **Revize kódu**: Hodnocení kvality šablon a konfigurací
3. **Řešení problémů**: Scénáře řešení problémů a jejich řešení
4. **Výuka vrstevníků**: Vysvětlete koncepty dalším studentům
5. **Příspěvek komunitě**: Sdílejte šablony nebo vylepšení

#### Výstupy profesního rozvoje
- **Projekty v portfoliu**: 8 nasazení připravených pro produkci
- **Technické dovednosti**: Odbornost v nasazování AZD a AI podle průmyslových standardů
- **Schopnosti řešení problémů**: Samostatné odstraňování závad a optimalizace
- **Uznání v komunitě**: Aktivní účast v komunitě vývojářů Azure
- **Kariérní postup**: Dovednosti přímo použitelné v cloudových a AI rolích

#### Metriky úspěchu
- **Míra úspěšnosti nasazení**: >95% úspěšných nasazení
- **Doba řešení problémů**: <30 minut pro běžné problémy
- **Optimalizace výkonu**: Prokazatelné zlepšení nákladů a výkonu
- **Soulad s bezpečnostními předpisy**: Všechna nasazení splňují podnikové bezpečnostní standardy
- **Přenos znalostí**: Schopnost mentorovat ostatní vývojáře

### Nepřetržité učení a zapojení do komunity

#### Zůstat aktuální
- **Azure Updates**: Sledujte poznámky k vydání Azure Developer CLI
- **Community Events**: Účastněte se akcí pro vývojáře Azure a AI
- **Documentation**: Přispívejte do komunitní dokumentace a příkladů
- **Feedback Loop**: Poskytujte zpětnou vazbu k obsahu kurzu a službám Azure

#### Kariérní rozvoj
- **Professional Network**: Propojte se s odborníky na Azure a AI
- **Speaking Opportunities**: Prezentujte nabyté znalosti na konferencích nebo meetupech
- **Open Source Contribution**: Přispívejte do AZD šablon a nástrojů
- **Mentorship**: Vedení ostatních vývojářů na jejich cestě učením AZD

---

**Navigace kapitolami:**
- **📚 Domů kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Začněte se učit**: [Kapitola 1: Základy a rychlý start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Sledování pokroku**: Sledujte svůj pokrok v rámci komplexního osmikapitolového vzdělávacího systému
- **🤝 Komunita**: [Azure Discord](https://discord.gg/microsoft-azure) pro podporu a diskusi

**Sledování studijního pokroku**: Použijte tohoto strukturovaného průvodce k osvojení Azure Developer CLI prostřednictvím postupného, praktického učení s měřitelnými výsledky a přínosy pro profesní rozvoj.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoliv usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho mateřském jazyce by měl být považován za závazný zdroj. U zásadních informací se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakákoli nedorozumění nebo chybné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->