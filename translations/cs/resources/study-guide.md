<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-10T07:09:00+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "cs"
}
-->
# Průvodce studiem - AZD pro začátečníky

## Úvod

Tento komplexní průvodce studiem poskytuje strukturované vzdělávací cíle, klíčové koncepty, praktická cvičení a materiály pro hodnocení, které vám pomohou zvládnout Azure Developer CLI (azd). Použijte tento průvodce k sledování svého pokroku a ujistěte se, že jste pokryli všechny důležité tématy.

## Cíle učení

Po dokončení tohoto průvodce budete:
- Mít zvládnuté základní i pokročilé koncepty Azure Developer CLI
- Rozvíjet praktické dovednosti v nasazování a správě aplikací na Azure
- Získat jistotu v řešení problémů a optimalizaci nasazení
- Porozumět postupům pro nasazení připravené na produkci a bezpečnostním aspektům

## Výsledky učení

Po dokončení všech sekcí tohoto průvodce budete schopni:
- Navrhovat, nasazovat a spravovat kompletní architektury aplikací pomocí azd
- Implementovat komplexní strategie monitorování, zabezpečení a optimalizace nákladů
- Samostatně řešit složité problémy s nasazením
- Vytvářet vlastní šablony a přispívat do komunity azd

## Struktura kurzu

### Modul 1: Začínáme (1.–2. týden)

#### Cíle učení
- Porozumět základům a klíčovým konceptům Azure Developer CLI
- Úspěšně nainstalovat a nakonfigurovat azd ve vašem vývojovém prostředí
- Dokončit první nasazení pomocí existující šablony
- Orientovat se ve struktuře projektu azd a pochopit klíčové komponenty

#### Klíčové koncepty k zvládnutí
- Šablony, prostředí a služby
- Struktura konfigurace azure.yaml
- Základní příkazy azd (init, up, down, deploy)
- Principy Infrastructure as Code
- Autentizace a autorizace na Azure

#### Praktická cvičení

**Cvičení 1.1: Instalace a nastavení**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Cvičení 1.2: První nasazení**  
```bash
# Deploy a simple web application:
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

#### Otázky pro sebehodnocení
1. Jaké jsou tři klíčové koncepty architektury azd?
2. Jaký je účel souboru azure.yaml?
3. Jak prostředí pomáhají spravovat různé cíle nasazení?
4. Jaké metody autentizace lze použít s azd?
5. Co se stane, když poprvé spustíte `azd up`?

### Modul 2: Konfigurace a prostředí (3. týden)

#### Cíle učení
- Zvládnout správu prostředí a konfiguraci
- Porozumět pokročilým konfiguracím azure.yaml
- Implementovat nastavení a proměnné specifické pro prostředí
- Nakonfigurovat autentizaci pro různé scénáře

#### Klíčové koncepty k zvládnutí
- Hierarchie prostředí a precedence proměnných
- Konfigurace služeb a parametry
- Události životního cyklu a hooky
- Metody autentizace (uživatel, service principal, managed identity)
- Správa konfiguračních souborů

#### Praktická cvičení

**Cvičení 2.1: Nastavení více prostředí**  
```bash
# Create and configure multiple environments:
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

**Cvičení 2.3: Bezpečnostní konfigurace**  
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Otázky pro sebehodnocení
1. Jak azd zpracovává precedence proměnných prostředí?
2. Co jsou deployment hooky a kdy byste je měli použít?
3. Jak nakonfigurujete různé SKU pro různá prostředí?
4. Jaké jsou bezpečnostní důsledky různých metod autentizace?
5. Jak spravujete tajné informace a citlivá konfigurační data?

### Modul 3: Nasazení a zajištění infrastruktury (4. týden)

#### Cíle učení
- Zvládnout pracovní postupy nasazení a osvědčené postupy
- Porozumět Infrastructure as Code pomocí šablon Bicep
- Implementovat komplexní architektury s více službami
- Optimalizovat výkon a spolehlivost nasazení

#### Klíčové koncepty k zvládnutí
- Struktura šablon Bicep a moduly
- Závislosti zdrojů a jejich pořadí
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
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Cvičení 3.3: Integrace databáze**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Otázky pro sebehodnocení
1. Jaké jsou výhody používání Bicep oproti ARM šablonám?
2. Jak řešíte migrace databází při nasazení azd?
3. Jaké strategie existují pro nasazení bez výpadků?
4. Jak spravujete závislosti mezi službami?
5. Jaké jsou úvahy při nasazení do více regionů?

### Modul 4: Validace před nasazením (5. týden)

#### Cíle učení
- Implementovat komplexní kontroly před nasazením
- Zvládnout plánování kapacity a validaci zdrojů
- Porozumět výběru SKU a optimalizaci nákladů
- Vytvořit automatizované validační pipeline

#### Klíčové koncepty k zvládnutí
- Kvóty a limity zdrojů Azure
- Kritéria výběru SKU a dopady na náklady
- Automatizované validační skripty a nástroje
- Metodologie plánování kapacity
- Testování výkonu a optimalizace

#### Praktická cvičení

**Cvičení 4.1: Plánování kapacity**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Cvičení 4.2: Validace před nasazením**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Cvičení 4.3: Optimalizace SKU**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Otázky pro sebehodnocení
1. Jaké faktory by měly ovlivnit rozhodnutí o výběru SKU?
2. Jak validujete dostupnost zdrojů Azure před nasazením?
3. Jaké jsou klíčové komponenty systému kontroly před nasazením?
4. Jak odhadujete a kontrolujete náklady na nasazení?
5. Jaké monitorování je nezbytné pro plánování kapacity?

### Modul 5: Řešení problémů a ladění (6. týden)

#### Cíle učení
- Zvládnout systematické metodiky řešení problémů
- Rozvíjet odborné znalosti v ladění složitých problémů s nasazením
- Implementovat komplexní monitorování a upozornění
- Vytvořit postupy pro reakci na incidenty a obnovu

#### Klíčové koncepty k zvládnutí
- Běžné vzory selhání nasazení
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
1. Jaký je systematický přístup k řešení problémů s nasazením azd?
2. Jak korelujete logy mezi více službami a zdroji?
3. Jaké metriky monitorování jsou nejdůležitější pro včasnou detekci problémů?
4. Jak implementujete efektivní postupy obnovy po havárii?
5. Jaké jsou klíčové komponenty plánu reakce na incidenty?

### Modul 6: Pokročilá témata a osvědčené postupy (7.–8. týden)

#### Cíle učení
- Implementovat vzory nasazení na úrovni podniku
- Zvládnout integraci a automatizaci CI/CD
- Vyvíjet vlastní šablony a přispívat do komunity
- Porozumět pokročilým požadavkům na zabezpečení a shodu

#### Klíčové koncepty k zvládnutí
- Vzory integrace CI/CD pipeline
- Vývoj a distribuce vlastních šablon
- Správa a shoda na úrovni podniku
- Pokročilé konfigurace sítí a zabezpečení
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
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Cvičení 6.3: Implementace na úrovni podniku**  
```bash
# Implement enterprise-grade features:
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
4. Jaké jsou osvědčené postupy pro nasazení na úrovni podniku?
5. Jak efektivně přispíváte do komunity azd?

## Praktické projekty

### Projekt 1: Osobní portfolio web
**Složitost**: Začátečník  
**Doba trvání**: 1–2 týdny

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
**Doba trvání**: 2–3 týdny

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
- Implementace zabezpečení připravená na produkci

## Hodnocení a certifikace

### Kontroly znalostí

Dokončete tyto hodnocení po každém modulu:

**Hodnocení modulu 1**: Základní koncepty a instalace  
- Otázky s výběrem odpovědí na klíčové koncepty  
- Praktické úkoly instalace a konfigurace  
- Jednoduché cvičení nasazení  

**Hodnocení modulu 2**: Konfigurace a prostředí  
- Scénáře správy prostředí  
- Cvičení řešení problémů s konfigurací  
- Implementace bezpečnostní konfigurace  

**Hodnocení modulu 3**: Nasazení a zajištění infrastruktury  
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
- Scénáře architektury na úrovni podniku  

### Závěrečný projekt

Navrhněte a implementujte kompletní řešení, které demonstruje zvládnutí všech konceptů:

**Požadavky**:
- Architektura aplikace s více vrstvami  
- Více prostředí pro nasazení  
- Komplexní monitorování a upozornění  
- Implementace zabezpečení a shody  
- Optimalizace nákladů a ladění výkonu  
- Kompletní dokumentace a runbooky  

**Kritéria hodnocení**:
- Kvalita technické implementace  
- Úplnost dokumentace  
- Dodržování bezpečnostních a osvědčených postupů  
- Optimalizace výkonu a nákladů  
- Účinnost řešení problémů a monitorování  

## Studijní zdroje a odkazy

### Oficiální dokumentace
- [Azure Developer CLI Dokumentace](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Dokumentace](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Zdroje komunity
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

## Doporučení pro studijní plán

### Studium na plný úvazek (8 týdnů)
- **1.–2. týden**: Moduly 1–2 (Začínáme, Konfigurace)  
- **3.–4. týden**: Moduly 3–4 (Nasazení, Validace před nasazením)  
- **5.–6. týden**: Moduly 5–6 (Řešení problémů, Pokročilá témata)  
- **7.–8. týden**: Praktické projekty a závěrečné hodnocení  

### Studium na částečný úvazek (16 týdnů)
- **1.–4. týden**: Modul 1 (Začínáme)  
- **5.–7. týden**: Modul 2 (Konfigurace a prostředí)  
- **8.–10. týden**: Modul 3 (Nasazení a zajištění infrastruktury)  
- **11.–12. týden**: Modul 4 (Validace před nasazením)  
- **13.–14. týden**: Modul 5 (Řešení problémů a ladění)  
- **15.–16. týden**: Modul 6 (Pokročilá témata a hodnocení)  

### Studium vlastním tempem
- Dokončete každý modul podle svého tempa  
- Věnujte více času náročným konceptům  
- Opakujte cvičení, dokud nezískáte jistotu  
- Připojte se k diskuzím v komunitě a klidně se ptejte  

## Tipy pro úspěch

### Efektivní strategie učení
1. **Pravidelně procvičujte**: Často nasazujte aplikace, abyste si vytvořili návyky  
2. **Nebojte se experimentovat**: Zkoušejte nové konfigurace ve vývojových prostředích  
3. **Dok
3. **Přispívejte do open source**: Sdílejte své šablony a řešení s komunitou  
4. **Učte ostatní**: Vysvětlování konceptů ostatním posiluje vaše vlastní porozumění  
5. **Buďte zvědaví**: Neustále objevujte nové služby Azure a integrační vzory  

---

**Navigace**  
- **Předchozí lekce**: [FAQ](faq.md)  
- **Další lekce**: [Changelog](../changelog.md)  

**Sledování studijního pokroku**: Použijte tento průvodce k sledování své vzdělávací cesty a zajištění komplexního pokrytí všech konceptů a postupů Azure Developer CLI.  

---

**Upozornění**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o co největší přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za závazný zdroj. Pro důležité informace doporučujeme profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné výklady vyplývající z použití tohoto překladu.