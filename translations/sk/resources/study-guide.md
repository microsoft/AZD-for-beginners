<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-10T07:10:11+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "sk"
}
-->
# Študijný sprievodca - AZD pre začiatočníkov

## Úvod

Tento komplexný študijný sprievodca poskytuje štruktúrované učebné ciele, kľúčové koncepty, praktické cvičenia a hodnotiace materiály, ktoré vám pomôžu zvládnuť Azure Developer CLI (azd). Použite tento sprievodca na sledovanie svojho pokroku a uistite sa, že ste pokryli všetky základné témy.

## Ciele učenia

Po dokončení tohto študijného sprievodcu budete:
- Ovládať všetky základné a pokročilé koncepty Azure Developer CLI
- Rozvíjať praktické zručnosti v nasadzovaní a správe aplikácií na Azure
- Získať istotu v riešení problémov a optimalizácii nasadení
- Porozumieť postupom pripraveným na produkčné nasadenie a bezpečnostným aspektom

## Výsledky učenia

Po dokončení všetkých sekcií tohto študijného sprievodcu budete schopní:
- Navrhovať, nasadzovať a spravovať kompletné architektúry aplikácií pomocou azd
- Implementovať komplexné stratégie monitorovania, bezpečnosti a optimalizácie nákladov
- Samostatne riešiť zložité problémy s nasadením
- Vytvárať vlastné šablóny a prispievať do komunity azd

## Štruktúra kurzu

### Modul 1: Začíname (1.-2. týždeň)

#### Ciele učenia
- Porozumieť základom a hlavným konceptom Azure Developer CLI
- Úspešne nainštalovať a nakonfigurovať azd vo vašom vývojovom prostredí
- Dokončiť prvé nasadenie pomocou existujúcej šablóny
- Orientovať sa v štruktúre projektu azd a porozumieť kľúčovým komponentom

#### Kľúčové koncepty na zvládnutie
- Šablóny, prostredia a služby
- Konfiguračná štruktúra azure.yaml
- Základné príkazy azd (init, up, down, deploy)
- Princípy Infrastructure as Code
- Autentifikácia a autorizácia na Azure

#### Praktické cvičenia

**Cvičenie 1.1: Inštalácia a nastavenie**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Cvičenie 1.2: Prvé nasadenie**
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Cvičenie 1.3: Analýza štruktúry projektu**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Otázky na sebahodnotenie
1. Aké sú tri hlavné koncepty architektúry azd?
2. Aký je účel súboru azure.yaml?
3. Ako prostredia pomáhajú spravovať rôzne ciele nasadenia?
4. Aké metódy autentifikácie je možné použiť s azd?
5. Čo sa stane, keď prvýkrát spustíte `azd up`?

### Modul 2: Konfigurácia a prostredia (3. týždeň)

#### Ciele učenia
- Ovládnuť správu prostredí a konfiguráciu
- Porozumieť pokročilým konfiguráciám azure.yaml
- Implementovať nastavenia a premenné špecifické pre prostredie
- Nakonfigurovať autentifikáciu pre rôzne scenáre

#### Kľúčové koncepty na zvládnutie
- Hierarchia prostredí a prednosť premenných
- Konfigurácia služieb a parametre
- Hooky a životné cykly udalostí
- Metódy autentifikácie (užívateľ, service principal, managed identity)
- Správa konfiguračných súborov

#### Praktické cvičenia

**Cvičenie 2.1: Nastavenie viacerých prostredí**
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Cvičenie 2.2: Pokročilá konfigurácia**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Cvičenie 2.3: Bezpečnostná konfigurácia**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Otázky na sebahodnotenie
1. Ako azd spracováva prednosť premenných prostredia?
2. Čo sú hooky nasadenia a kedy by ste ich mali použiť?
3. Ako nakonfigurovať rôzne SKUs pre rôzne prostredia?
4. Aké sú bezpečnostné dôsledky rôznych metód autentifikácie?
5. Ako spravovať tajomstvá a citlivé konfiguračné údaje?

### Modul 3: Nasadenie a provisioning (4. týždeň)

#### Ciele učenia
- Ovládnuť pracovné postupy nasadenia a osvedčené postupy
- Porozumieť Infrastructure as Code pomocou šablón Bicep
- Implementovať komplexné architektúry viacerých služieb
- Optimalizovať výkon a spoľahlivosť nasadenia

#### Kľúčové koncepty na zvládnutie
- Štruktúra šablón Bicep a moduly
- Závislosti zdrojov a ich poradie
- Stratégie nasadenia (blue-green, rolling updates)
- Nasadenia vo viacerých regiónoch
- Migrácie databáz a správa údajov

#### Praktické cvičenia

**Cvičenie 3.1: Vlastná infraštruktúra**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Cvičenie 3.2: Aplikácia viacerých služieb**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Cvičenie 3.3: Integrácia databázy**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Otázky na sebahodnotenie
1. Aké sú výhody používania Bicep oproti ARM šablónam?
2. Ako riešiť migrácie databáz pri nasadeniach azd?
3. Aké stratégie existujú pre nasadenia bez výpadkov?
4. Ako spravovať závislosti medzi službami?
5. Aké sú úvahy pri nasadeniach vo viacerých regiónoch?

### Modul 4: Validácia pred nasadením (5. týždeň)

#### Ciele učenia
- Implementovať komplexné kontroly pred nasadením
- Ovládnuť plánovanie kapacity a validáciu zdrojov
- Porozumieť výberu SKU a optimalizácii nákladov
- Vytvoriť automatizované validačné pipeline

#### Kľúčové koncepty na zvládnutie
- Kvóty a limity zdrojov Azure
- Kritériá výberu SKU a dôsledky nákladov
- Automatizované validačné skripty a nástroje
- Metodológie plánovania kapacity
- Testovanie výkonu a optimalizácia

#### Praktické cvičenia

**Cvičenie 4.1: Plánovanie kapacity**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Cvičenie 4.2: Validácia pred nasadením**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Cvičenie 4.3: Optimalizácia SKU**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Otázky na sebahodnotenie
1. Aké faktory by mali ovplyvniť rozhodnutia o výbere SKU?
2. Ako validovať dostupnosť zdrojov Azure pred nasadením?
3. Aké sú kľúčové komponenty systému kontroly pred nasadením?
4. Ako odhadnúť a kontrolovať náklady na nasadenie?
5. Aké monitorovanie je nevyhnutné pre plánovanie kapacity?

### Modul 5: Riešenie problémov a ladenie (6. týždeň)

#### Ciele učenia
- Ovládnuť systematické metodológie riešenia problémov
- Rozvíjať odborné znalosti v ladení zložitých problémov s nasadením
- Implementovať komplexné monitorovanie a upozornenia
- Vytvoriť postupy reakcie na incidenty a obnovy

#### Kľúčové koncepty na zvládnutie
- Bežné vzory zlyhania nasadenia
- Analýza logov a techniky korelácie
- Monitorovanie výkonu a optimalizácia
- Detekcia bezpečnostných incidentov a reakcia
- Obnova po havárii a kontinuita podnikania

#### Praktické cvičenia

**Cvičenie 5.1: Scenáre riešenia problémov**
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Cvičenie 5.2: Implementácia monitorovania**
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Cvičenie 5.3: Reakcia na incidenty**
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Otázky na sebahodnotenie
1. Aký je systematický prístup k riešeniu problémov s nasadeniami azd?
2. Ako korelovať logy medzi viacerými službami a zdrojmi?
3. Aké metriky monitorovania sú najdôležitejšie pre včasnú detekciu problémov?
4. Ako implementovať efektívne postupy obnovy po havárii?
5. Aké sú kľúčové komponenty plánu reakcie na incidenty?

### Modul 6: Pokročilé témy a osvedčené postupy (7.-8. týždeň)

#### Ciele učenia
- Implementovať vzory nasadenia na úrovni podniku
- Ovládnuť integráciu CI/CD a automatizáciu
- Vyvíjať vlastné šablóny a prispievať do komunity
- Porozumieť pokročilým bezpečnostným a súladovým požiadavkám

#### Kľúčové koncepty na zvládnutie
- Vzory integrácie CI/CD pipeline
- Vývoj a distribúcia vlastných šablón
- Správa a súlad na úrovni podniku
- Pokročilé konfigurácie siete a bezpečnosti
- Optimalizácia výkonu a správa nákladov

#### Praktické cvičenia

**Cvičenie 6.1: Integrácia CI/CD**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Cvičenie 6.2: Vývoj vlastných šablón**
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Cvičenie 6.3: Implementácia na úrovni podniku**
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Otázky na sebahodnotenie
1. Ako integrovať azd do existujúcich CI/CD workflowov?
2. Aké sú kľúčové úvahy pri vývoji vlastných šablón?
3. Ako implementovať správu a súlad v nasadeniach azd?
4. Aké sú osvedčené postupy pre nasadenia na úrovni podniku?
5. Ako efektívne prispievať do komunity azd?

## Praktické projekty

### Projekt 1: Osobná webová stránka portfólia
**Komplexnosť**: Začiatočník  
**Trvanie**: 1-2 týždne

Vytvorte a nasadte osobnú webovú stránku portfólia pomocou:
- Hosting statickej webovej stránky na Azure Storage
- Konfigurácia vlastnej domény
- Integrácia CDN pre globálny výkon
- Automatizovaná pipeline nasadenia

**Výstupy**:
- Funkčná webová stránka nasadená na Azure
- Vlastná šablóna azd pre nasadenia portfólia
- Dokumentácia procesu nasadenia
- Odporúčania na analýzu nákladov a optimalizáciu

### Projekt 2: Aplikácia na správu úloh
**Komplexnosť**: Stredne pokročilý  
**Trvanie**: 2-3 týždne

Vytvorte full-stack aplikáciu na správu úloh s:
- Frontend React nasadený na App Service
- Backend API Node.js s autentifikáciou
- Databáza PostgreSQL s migráciami
- Monitorovanie pomocou Application Insights

**Výstupy**:
- Kompletná aplikácia s autentifikáciou používateľov
- Schéma databázy a skripty migrácie
- Dashboardy monitorovania a pravidlá upozornení
- Konfigurácia nasadenia pre viaceré prostredia

### Projekt 3: E-commerce platforma založená na mikroservisoch
**Komplexnosť**: Pokročilý  
**Trvanie**: 4-6 týždňov

Navrhnite a implementujte e-commerce platformu založenú na mikroservisoch:
- Viaceré API služby (katalóg, objednávky, platby, používatelia)
- Integrácia fronty správ pomocou Service Bus
- Redis cache pre optimalizáciu výkonu
- Komplexné logovanie a monitorovanie

**Výstupy**:
- Kompletná architektúra mikroservisov
- Vzory komunikácie medzi službami
- Testovanie výkonu a optimalizácia
- Implementácia bezpečnosti pripravená na produkciu

## Hodnotenie a certifikácia

### Kontroly vedomostí

Dokončite tieto hodnotenia po každom module:

**Hodnotenie modulu 1**: Základné koncepty a inštalácia
- Otázky s výberom odpovede na hlavné koncepty
- Praktické úlohy inštalácie a konfigurácie
- Jednoduché cvičenie nasadenia

**Hodnotenie modulu 2**: Konfigurácia a prostredia
- Scenáre správy prostredí
- Cvičenia na riešenie problémov s konfiguráciou
- Implementácia bezpečnostnej konfigurácie

**Hodnotenie modulu 3**: Nasadenie a provisioning
- Výzvy návrhu infraštruktúry
- Scenáre nasadenia viacerých služieb
- Cvičenia na optimalizáciu výkonu

**Hodnotenie modulu 4**: Validácia pred nasadením
- Prípadové štúdie plánovania kapacity
- Scenáre optimalizácie nákladov
- Implementácia validačnej pipeline

**Hodnotenie modulu 5**: Riešenie problémov a ladenie
- Cvičenia na diagnostiku problémov
- Úlohy implementácie monitorovania
- Simulácie reakcie na incidenty

**Hodnotenie modulu 6**: Pokročilé témy
- Návrh CI/CD pipeline
- Vývoj vlastných šablón
- Scenáre architektúry na úrovni podniku

### Záverečný projekt

Navrhnite a implementujte kompletné riešenie, ktoré demonštruje zvládnutie všetkých konceptov:

**Požiadavky**:
- Architektúra aplikácie s viacerými vrstvami
- Viaceré prostredia nasadenia
- Komplexné monitorovanie a upozornenia
- Implementácia bezpečnosti a súladu
- Optimalizácia nákladov a výkonu
- Kompletná dokumentácia a runbooky

**Kritériá hodnotenia**:
- Kvalita technickej implementácie
- Kompletnosť dokumentácie
- Dodržiavanie bezpečnosti a osvedčených postupov
- Optimalizácia výkonu a nákladov
- Účinnosť riešenia problémov a monitorovania

## Študijné zdroje a referencie

### Oficiálna dokumentácia
- [Azure Developer CLI Dokumentácia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Dokumentácia](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Komunitné zdroje
- [AZD Galéria šablón](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organizácia](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Praktické prostredia
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Doplnkové nástroje
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Odporúčania pre študijný plán

### Plný úväzok (8 týždňov)
- **1.-2. týždeň**: Moduly 1-2 (Začíname, Konfigurácia)
- **3.-4. týždeň**: Moduly 3-4 (Nasadenie, Validácia pred nasadením)
- **5.-6. týždeň**: Moduly 5-6 (Riešenie problémov, Pokročilé témy)
- **7.-8. týždeň**: Praktické projekty a záverečné hodnotenie

### Čiastočný úväzok (16 týždňov)
- **1.-4. týždeň**: Modul 1 (Začíname)
- **5.-7. týždeň**: Modul 2 (Konfigurácia a prostredia)
- **8.-10. týždeň**: Modul 3 (Nasadenie a provisioning)
- **11.-12. týždeň**: Modul 4 (Validácia pred nasadením)
- **13.-14. týž
3. **Prispievajte do Open Source**: Zdieľajte svoje šablóny a riešenia s komunitou  
4. **Učte ostatných**: Vysvetľovanie konceptov iným posilňuje vaše vlastné pochopenie  
5. **Buďte zvedaví**: Neustále objavujte nové služby Azure a integračné vzory  

---

**Navigácia**  
- **Predchádzajúca lekcia**: [FAQ](faq.md)  
- **Nasledujúca lekcia**: [Changelog](../changelog.md)  

**Sledovanie pokroku v štúdiu**: Použite túto príručku na sledovanie svojej vzdelávacej cesty a zabezpečenie komplexného pokrytia všetkých konceptov a praktík Azure Developer CLI.  

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby na automatický preklad [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, upozorňujeme, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre dôležité informácie sa odporúča profesionálny ľudský preklad. Nezodpovedáme za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.