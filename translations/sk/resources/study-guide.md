# Študijný sprievodca - Komplexné učebné ciele

**Navigácia vzdelávacej cesty**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../README.md)
- **📖 Začnite s učením**: [Kapitola 1: Základy a Rýchly štart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Sledovanie pokroku**: [Ukončenie kurzu](../README.md#-course-completion--certification)

## Úvod

Tento komplexný študijný sprievodca poskytuje štruktúrované učebné ciele, kľúčové koncepty, praktické cvičenia a hodnotiace materiály, ktoré vám pomôžu ovládnuť Azure Developer CLI (azd). Použite tento sprievodca na sledovanie svojho pokroku a zabezpečenie, že ste pokryli všetky podstatné témy.

## Ciele učenia

Po dokončení tohto študijného sprievodcu budete:
- Ovládnete všetky základné a pokročilé koncepty Azure Developer CLI
- Rozviniete praktické zručnosti v nasadzovaní a správe aplikácií v Azure
- Získate sebavedomie pri riešení problémov a optimalizácii nasadení
- Porozumiete postupom nasadenia pripraveným na produkciu a bezpečnostným aspektom

## Výsledky učenia

Po dokončení všetkých častí tohto študijného sprievodcu budete schopní:
- Navrhovať, nasadzovať a spravovať kompletné architektúry aplikácií pomocou azd
- Implementovať komplexné stratégie monitorovania, zabezpečenia a optimalizácie nákladov
- Samostatne riešiť zložité problémy s nasadením
- Vytvárať vlastné šablóny a prispievať do komunity azd

## Štruktúra učenia v 8 kapitolách

### Kapitola 1: Základy a rýchly štart (Týždeň 1)
**Trvanie**: 30-45 minút | **Zložitosť**: ⭐

#### Učebné ciele
- Pochopiť základné koncepty a terminológiu Azure Developer CLI
- Úspešne nainštalovať a nakonfigurovať AZD na vašej vývojovej platforme
- Nasadiť svoju prvú aplikáciu pomocou existujúcej šablóny
- Efektívne pracovať s príkazovým rozhraním AZD

#### Kľúčové koncepty na osvojenie
- Štruktúra projektu AZD a komponenty (azure.yaml, infra/, src/)
- Pracovné postupy nasadenia založené na šablónach
- Základy konfigurácie prostredia
- Správa skupín prostriedkov a predplatného

#### Praktické cvičenia
1. **Overenie inštalácie**: Nainštalujte AZD a overte pomocou `azd version`
2. **Prvé nasadenie**: Úspešne nasadiť šablónu todo-nodejs-mongo
3. **Nastavenie prostredia**: Nakonfigurujte svoje prvé premenné prostredia
4. **Preskúmanie prostriedkov**: Prezrite si nasadené prostriedky v Azure Portal

#### Hodnotiace otázky
- Aké sú základné komponenty projektu AZD?
- Ako inicializujete nový projekt zo šablóny?
- Aký je rozdiel medzi `azd up` a `azd deploy`?
- Ako spravujete viaceré prostredia s AZD?

---

### Kapitola 2: Vývoj orientovaný na AI (Týždeň 2)
**Trvanie**: 1-2 hodiny | **Zložitosť**: ⭐⭐

#### Učebné ciele
- Integrovať služby Microsoft Foundry do pracovných postupov AZD
- Nasadzovať a konfigurovať aplikácie s pohonom AI
- Pochopiť implementačné vzory RAG (Retrieval-Augmented Generation)
- Spravovať nasadenia AI modelov a škálovanie

#### Kľúčové koncepty na osvojenie
- Integrácia služby Microsoft Foundry Models a správa API
- Konfigurácia AI Search a vektorové indexovanie
- Stratégie nasadenia modelov a plánovanie kapacity
- Monitorovanie AI aplikácií a optimalizácia výkonu

#### Praktické cvičenia
1. **Nasadenie AI chatu**: Nasadiť šablónu azure-search-openai-demo
2. **Implementácia RAG**: Nakonfigurujte indexovanie dokumentov a vyhľadávanie
3. **Konfigurácia modelov**: Nastaviť viacero AI modelov s rôznymi účelmi
4. **Monitorovanie AI**: Implementovať Application Insights pre AI pracovné zaťaženia

#### Hodnotiace otázky
- Ako nakonfigurujete služby Microsoft Foundry Models v AZD šablóne?
- Aké sú kľúčové komponenty architektúry RAG?
- Ako spravujete kapacitu a škálovanie AI modelov?
- Aké metriky monitorovania sú dôležité pre AI aplikácie?

---

### Kapitola 3: Konfigurácia a autentifikácia (Týždeň 3)
**Trvanie**: 45-60 minút | **Zložitosť**: ⭐⭐

#### Učebné ciele
- Osvojiť si stratégie konfigurácie a správy prostredí
- Implementovať bezpečné autentifikačné vzory a spravovanú identitu
- Organizovať prostriedky s vhodnými konvenciami pomenovania
- Konfigurovať viacprostredové nasadenia (dev, staging, prod)

#### Kľúčové koncepty na osvojenie
- Hierarchia prostredí a precedence konfigurácie
- Spravovaná identita a autentifikácia pomocou service principal
- Integrácia Key Vault pre správu tajomstiev
- Správa parametrov špecifických pre prostredie

#### Praktické cvičenia
1. **Nastavenie viacerých prostredí**: Nakonfigurujte prostredia dev, staging a prod
2. **Konfigurácia zabezpečenia**: Implementujte autentifikáciu pomocou spravovanej identity
3. **Správa tajomstiev**: Integrujte Azure Key Vault pre citlivé údaje
4. **Správa parametrov**: Vytvorte konfigurácie špecifické pre prostredie

#### Hodnotiace otázky
- Ako nakonfigurujete rôzne prostredia s AZD?
- Aké sú výhody používania spravovanej identity oproti service principals?
- Ako bezpečne spravujete tajomstvá aplikácie?
- Aká je hierarchia konfigurácie v AZD?

---

### Kapitola 4: Infrastruktúra ako kód a nasadenie (Týždeň 4-5)
**Trvanie**: 1-1.5 hodiny | **Zložitosť**: ⭐⭐⭐

#### Učebné ciele
- Vytvárať a prispôsobovať šablóny infraštruktúry Bicep
- Implementovať pokročilé vzory nasadenia a pracovné postupy
- Pochopiť stratégie poskytovania prostriedkov
- Navrhovať škálovateľné viacslužbové architektúry

- Nasadiť kontajnerizované aplikácie pomocou Azure Container Apps a AZD


#### Kľúčové koncepty na osvojenie
- Štruktúra Bicep šablón a osvedčené postupy
- Závislosti prostriedkov a poradie nasadzovania
- Súbory parametrov a modularita šablón
- Vlastné hooky a automatizácia nasadenia
- Vzory nasadenia Container App (rýchly štart, produkcia, mikroslužby)

#### Praktické cvičenia
1. **Vytvorenie vlastnej šablóny**: Vytvorte šablónu viacslužbovej aplikácie
2. **Ovládnutie Bicep**: Vytvorte modulárne, znovu použiteľné komponenty infraštruktúry
3. **Automatizácia nasadenia**: Implementujte pred/po nasadení hooky
4. **Návrh architektúry**: Nasadiť zložitú architektúru mikroslužieb
5. **Nasadenie Container App**: Nasadiť príklady [Jednoduché Flask API](../../../examples/container-app/simple-flask-api) a [Architektúra mikroslužieb](../../../examples/container-app/microservices) pomocou AZD

#### Hodnotiace otázky
- Ako vytvoríte vlastné Bicep šablóny pre AZD?
- Aké sú osvedčené praktiky pre organizovanie infraštruktúrneho kódu?
- Ako riešite závislosti prostriedkov v šablónach?
- Aké vzory nasadenia podporujú aktualizácie bez prestojov?

---

### Kapitola 5: Riešenia AI s viacerými agentmi (Týždeň 6-7)
**Trvanie**: 2-3 hodiny | **Zložitosť**: ⭐⭐⭐⭐

#### Učebné ciele
- Navrhovať a implementovať architektúry AI s viacerými agentmi
- Orchestruvať koordináciu a komunikáciu agentov
- Nasadzovať produkčné AI riešenia so sledovaním
- Pochopiť špecializáciu agentov a vzory pracovných postupov
- Integrovať kontajnerizované mikroslužby ako súčasť riešení s viacerými agentmi

#### Kľúčové koncepty na osvojenie
- Vzorce architektúry s viacerými agentmi a princípy návrhu
- Komunikačné protokoly agentov a tok dát
- Stratégie vyvažovania zaťaženia a škálovania pre AI agentov
- Monitorovanie v produkcii pre systémy s viacerými agentmi
- Komunikácia služba-služba v kontajnerizovaných prostrediach

#### Praktické cvičenia
1. **Nasadenie maloobchodného riešenia**: Nasadiť kompletný scenár s viacerými agentmi pre maloobchod
2. **Prispôsobenie agentov**: Upraviť správanie agentov Customer a Inventory
3. **Škálovanie architektúry**: Implementovať vyvažovanie zaťaženia a automatické škálovanie
4. **Monitorovanie v produkcii**: Nastaviť komplexné monitorovanie a upozorňovanie
5. **Integrácia mikroslužieb**: Rozšíriť príklad [Architektúra mikroslužieb](../../../examples/container-app/microservices) tak, aby podporoval pracovné postupy založené na agentoch

#### Hodnotiace otázky
- Ako navrhnete efektívne vzory komunikácie pre viac-agentové systémy?
- Aké sú kľúčové úvahy pri škálovaní pracovných zaťažení AI agentov?
- Ako monitorujete a ladíte systémy AI s viacerými agentmi?
- Aké produkčné vzory zabezpečujú spoľahlivosť AI agentov?

---

### Kapitola 6: Overenie a plánovanie pred nasadením (Týždeň 8)
**Trvanie**: 1 hodina | **Zložitosť**: ⭐⭐

#### Učebné ciele
- Vykonať komplexné plánovanie kapacity a validáciu prostriedkov
- Vybrať optimálne Azure SKU pre efektívnosť nákladov
- Implementovať automatizované pre-flight kontroly a validáciu
- Plánovať nasadenia so stratégiami optimalizácie nákladov

#### Kľúčové koncepty na osvojenie
- Kvóty prostriedkov Azure a obmedzenia kapacity
- Kritériá výberu SKU a optimalizácia nákladov
- Automatizované validačné skripty a testovanie
- Plánovanie nasadenia a posúdenie rizík

#### Praktické cvičenia
1. **Analýza kapacity**: Analyzujte požiadavky na prostriedky pre vaše aplikácie
2. **Optimalizácia SKU**: Porovnajte a vyberte nákladovo efektívne úrovne služieb
3. **Automatizácia validácie**: Implementujte skripty kontroly pred nasadením
4. **Plánovanie nákladov**: Vytvorte odhady nákladov na nasadenie a rozpočty

#### Hodnotiace otázky
- Ako validujete kapacitu Azure pred nasadením?
- Aké faktory ovplyvňujú rozhodnutia pri výbere SKU?
- Ako automatizujete validáciu pred nasadením?
- Aké stratégie pomáhajú optimalizovať náklady na nasadenie?

---

### Kapitola 7: Riešenie problémov a ladenie (Týždeň 9)
**Trvanie**: 1-1.5 hodiny | **Zložitosť**: ⭐⭐

#### Učebné ciele
- Vyvinúť systematické prístupy k ladeniu AZD nasadení
- Riešiť bežné problémy s nasadením a konfiguráciou
- Ladiť problémy špecifické pre AI a výkonové problémy
- Implementovať monitorovanie a upozorňovanie na proaktívne zisťovanie problémov

#### Kľúčové koncepty na osvojenie
- Diagnostické techniky a stratégie logovania
- Bežné vzory zlyhaní a ich riešenia
- Monitorovanie výkonu a optimalizácia
- Postupy reakcie na incidenty a obnovy

#### Praktické cvičenia
1. **Diagnostické zručnosti**: Cvičiť na úmyselne zlomených nasadeniach
2. **Analýza logov**: Efektívne používať Azure Monitor a Application Insights
3. **Ladenie výkonu**: Optimalizovať pomaly bežiace aplikácie
4. **Postupy obnovy**: Implementovať zálohovanie a obnovu po havárii

#### Hodnotiace otázky
- Aké sú najbežnejšie zlyhania nasadení AZD?
- Ako ladíte problémy s autentifikáciou a oprávneniami?
- Ktoré stratégie monitorovania pomáhajú predchádzať problémom v produkcii?
- Ako optimalizujete výkon aplikácií v Azure?

---

### Kapitola 8: Produkčné a podnikové vzory (Týždeň 10-11)
**Trvanie**: 2-3 hodiny | **Zložitosť**: ⭐⭐⭐⭐

#### Učebné ciele
- Implementovať nasadenia podnikovej úrovne
- Navrhovať bezpečnostné vzory a rámce pre súlad
- Zaviesť monitorovanie, riadenie a správu nákladov
- Vytvoriť škálovateľné CI/CD pipeline s integráciou AZD
- Uplatniť osvedčené postupy pre produkčné nasadenia Container App (zabezpečenie, monitorovanie, náklady, CI/CD)

#### Kľúčové koncepty na osvojenie
- Požiadavky na podnikové zabezpečenie a súlad
- Rámce riadenia a implementácia politík
- Pokročilé monitorovanie a správa nákladov
- Integrácia CI/CD a automatizované pipeline na nasadenie
- Blue-green a canary stratégie nasadenia pre kontajnerizované pracovné zaťaženia

#### Praktické cvičenia
1. **Podnikové zabezpečenie**: Implementovať komplexné bezpečnostné vzory
2. **Rámec riadenia**: Nastaviť Azure Policy a správu prostriedkov
3. **Pokročilé monitorovanie**: Vytvoriť dashboardy a automatizované upozorňovanie
4. **Integrácia CI/CD**: Vytvoriť automatizované pipeline nasadenia
5. **Produkčné Container Apps**: Uplatniť zabezpečenie, monitorovanie a optimalizáciu nákladov na príklade [Architektúra mikroslužieb](../../../examples/container-app/microservices)

#### Hodnotiace otázky
- Ako implementujete podnikové zabezpečenie v AZD nasadeniach?
- Aké vzory riadenia zabezpečujú súlad a kontrolu nákladov?
- Ako navrhnete škálovateľné monitorovanie pre produkčné systémy?
- Aké CI/CD vzory najlepšie fungujú s pracovnými tokmi AZD?

#### Učebné ciele
- Pochopiť základy Azure Developer CLI a základné koncepty
- Úspešne nainštalovať a nakonfigurovať azd vo vašom vývojovom prostredí
- Dokončiť svoje prvé nasadenie pomocou existujúcej šablóny
- Orientovať sa v štruktúre projektu azd a pochopiť kľúčové komponenty

#### Kľúčové koncepty na osvojenie
- Šablóny, prostredia a služby
- Štruktúra konfigurácie azure.yaml
- Základné príkazy azd (init, up, down, deploy)
- Princípy Infrastructure as Code
- Autentifikácia a autorizácia v Azure

#### Praktické cvičenia

**Cvičenie 1.1: Inštalácia a nastavenie**
```bash
# Dokončite tieto úlohy:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Cvičenie 1.2: Prvé nasadenie**
```bash
# Nasadiť jednoduchú webovú aplikáciu:
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
1. Aké sú tri základné koncepty architektúry azd?
2. Aký je účel súboru azure.yaml?
3. Ako prostredia pomáhajú spravovať rôzne ciele nasadenia?
4. Aké metódy autentifikácie je možné použiť s azd?
5. Čo sa stane, keď spustíte `azd up` prvýkrát?

---

## Sledovanie pokroku a hodnotiaci rámec
```bash
# Vytvorte a nakonfigurujte viacero prostredí:
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

**Cvičenie 2.3: Konfigurácia zabezpečenia**
```bash
# Implementujte najlepšie bezpečnostné postupy:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Otázky na sebahodnotenie
1. Ako azd rieši precedenciu premenných prostredia?
2. Čo sú deployment hooky a kedy by ste ich mali používať?
3. Ako nakonfigurujete rôzne SKU pre rôzne prostredia?
4. Aké sú bezpečnostné dôsledky rôznych metód autentifikácie?
5. Ako spravujete tajomstvá a citlivé konfiguračné dáta?

### Modul 3: Nasadzovanie a provisionovanie (Týždeň 4)

#### Učebné ciele
- Ovládnuť pracovné postupy nasadzovania a osvedčené postupy
- Pochopiť Infrastructure as Code s Bicep šablónami
- Implementovať zložité viacslužbové architektúry
- Optimalizovať výkon a spoľahlivosť nasadenia

#### Kľúčové koncepty na osvojenie
- Štruktúra Bicep šablóny a moduly
- Závislosti prostriedkov a poradie
- Stratégie nasadenia (blue-green, rolling updates)
- Nasadenia v viacerých regiónoch
- Migrácie databáz a správa dát

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

**Cvičenie 3.2: Viacslužbová aplikácia**
```bash
# Nasadiť architektúru mikroslužieb:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Cvičenie 3.3: Integrácia databázy**
```bash
# Implementovať vzory nasadenia databázy:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Otázky na sebahodnotenie
1. Aké sú výhody používania Bicep oproti ARM šablónam?
2. Ako riešite migrácie databázy v azd nasadeniach?
3. Aké stratégie existujú pre nasadenia bez prestojov?
4. Ako spravujete závislosti medzi službami?
5. Aké sú úvahy pri nasadeniach vo viacerých regiónoch?

### Modul 4: Validácia pred nasadením (Týždeň 5)

#### Učebné ciele
- Implementovať komplexné kontroly pred nasadením
- Ovládnuť plánovanie kapacít a overovanie zdrojov
- Pochopiť výber SKU a optimalizáciu nákladov
- Vytvoriť automatizované validačné pipeline

#### Kľúčové koncepty, ktoré treba zvládnuť
- Kvóty a limity zdrojov Azure
- Kritériá výberu SKU a dopad na náklady
- Automatizované validačné skripty a nástroje
- Metodiky plánovania kapacít
- Testovanie výkonu a optimalizácia

#### Cvičenia

**Exercise 4.1: Capacity Planning**
```bash
# Implementovať overenie kapacity:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercise 4.2: Pre-flight Validation**
```powershell
# Vytvorte komplexný validačný proces:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercise 4.3: SKU Optimization**
```bash
# Optimalizovať konfigurácie služieb:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Otázky na sebahodnotenie
1. Aké faktory by mali ovplyvniť rozhodovanie pri výbere SKU?
2. Ako overíte dostupnosť Azure zdrojov pred nasadením?
3. Aké sú kľúčové komponenty systému pre pre-flight kontroly?
4. Ako odhadnete a riadite náklady na nasadenie?
5. Aké monitorovanie je nevyhnutné pre plánovanie kapacít?

### Modul 5: Riešenie problémov a ladenie (týždeň 6)

#### Ciele učenia
- Ovládnuť systematické metodiky riešenia problémov
- Rozvinúť odborné zručnosti v ladení zložitých problémov nasadenia
- Implementovať komplexné monitorovanie a alertovanie
- Vytvoriť postupy reakcie na incidenty a obnovy

#### Kľúčové koncepty, ktoré treba zvládnuť
- Bežné vzory zlyhania nasadení
- Techniky analýzy a korelácie logov
- Monitorovanie výkonu a optimalizácia
- Detekcia bezpečnostných incidentov a reakcia
- Obnova po havárii a kontinuita podnikania

#### Cvičenia

**Exercise 5.1: Troubleshooting Scenarios**
```bash
# Nácvik riešenia bežných problémov:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercise 5.2: Monitoring Implementation**
```bash
# Nastavte komplexné monitorovanie:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercise 5.3: Incident Response**
```bash
# Vytvorte postupy reakcie na incidenty:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Otázky na sebahodnotenie
1. Aký je systematický prístup k riešeniu problémov pri nasadeniach azd?
2. Ako korelujete logy naprieč viacerými službami a zdrojmi?
3. Ktoré metriky monitorovania sú najkritickejšie pre včasnú detekciu problémov?
4. Ako implementujete efektívne postupy obnovy po havárii?
5. Aké sú kľúčové komponenty plánu reakcie na incidenty?

### Modul 6: Pokročilé témy a osvedčené postupy (týždne 7-8)

#### Ciele učenia
- Implementovať podnikové vzory nasadení
- Ovládnuť integráciu CI/CD a automatizáciu
- Vyvíjať vlastné šablóny a prispievať komunite
- Pochopiť pokročilé bezpečnostné a súladové požiadavky

#### Kľúčové koncepty, ktoré treba zvládnuť
- Vzory integrácie CI/CD pipeline
- Vývoj a distribúcia vlastných šablón
- Podnikové riadenie a súlad
- Pokročilé sieťové a bezpečnostné konfigurácie
- Optimalizácia výkonu a riadenie nákladov

#### Cvičenia

**Exercise 6.1: CI/CD Integration**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Exercise 6.2: Custom Template Development**
```bash
# Vytvorte a publikujte vlastné šablóny:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercise 6.3: Enterprise Implementation**
```bash
# Implementujte funkcie podnikovej úrovne:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Otázky na sebahodnotenie
1. Ako integrujete azd do existujúcich CI/CD workflowov?
2. Aké sú kľúčové úvahy pri vývoji vlastných šablón?
3. Ako implementujete riadenie a súlad pri azd nasadeniach?
4. Aké sú osvedčené postupy pre nasadenia v podnikovom merítku?
5. Ako efektívne prispievate do komunity azd?

## Praktické projekty

### Projekt 1: Osobné portfólio (webová stránka)
**Zložitosť**: Začiatočník  
**Trvanie**: 1-2 týždne

Vytvorte a nasadte osobnú portfólio webovú stránku pomocou:
- Hostovanie statickej webstránky na Azure Storage
- Konfigurácia vlastnej domény
- Integrácia CDN pre globálny výkon
- Automatizovaný pipeline nasadenia

**Výstupy**:
- Funkčná webstránka nasadená v Azure
- Vlastná azd šablóna pre nasadenia portfólia
- Dokumentácia procesu nasadenia
- Analýza nákladov a odporúčania na optimalizáciu

### Projekt 2: Aplikácia na správu úloh
**Zložitosť**: Stredne pokročilé  
**Trvanie**: 2-3 týždne

Vytvorte full-stack aplikáciu na správu úloh s:
- React frontend nasadený do App Service
- Node.js API backend s autentifikáciou
- PostgreSQL databáza s migráciami
- Monitoring pomocou Application Insights

**Výstupy**:
- Kompletná aplikácia s používateľskou autentifikáciou
- Databázové schéma a skripty migrácií
- Monitorovacie dashboardy a pravidlá alertovania
- Konfigurácia nasadenia pre viaceré prostredia

### Projekt 3: Mikroslužbová e-commerce platforma
**Zložitosť**: Pokročilé  
**Trvanie**: 4-6 týždňov

Navrhnite a implementujte mikroslužbovú e-commerce platformu:
- Viaceré API služby (catalog, orders, payments, users)
- Integrácia fronty správ so Service Bus
- Redis cache pre optimalizáciu výkonu
- Komplexné logovanie a monitoring

**Referenčný príklad**: Pozri [Architektúra mikroslužieb](../../../examples/container-app/microservices) pre produkčne pripravenú šablónu a sprievodcu nasadením

**Výstupy**:
- Kompletná mikroslužbová architektúra
- Vzory komunikácie medzi službami
- Testovanie výkonu a optimalizácia
- Produkčne pripravená implementácia bezpečnosti

## Hodnotenie a certifikácia

### Kontroly vedomostí

Dokončite tieto hodnotenia po každom module:

**Hodnotenie modulu 1**: Základné koncepty a inštalácia
- Viacnásobné otázky výberu o základných konceptoch
- Praktické úlohy inštalácie a konfigurácie
- Jednoduché cvičenie nasadenia

**Hodnotenie modulu 2**: Konfigurácia a prostredia
- Scenáre manažmentu prostredí
- Cvičenia riešenia problémov konfigurácie
- Implementácia bezpečnostnej konfigurácie

**Hodnotenie modulu 3**: Nasadenie a provisioning
- Výzvy návrhu infraštruktúry
- Scenáre nasadenia viacerých služieb
- Cvičenia optimalizácie výkonu

**Hodnotenie modulu 4**: Validácia pred nasadením
- Štúdie prípadov plánovania kapacít
- Scenáre optimalizácie nákladov
- Implementácia validačného pipeline

**Hodnotenie modulu 5**: Riešenie problémov a ladenie
- Cvičenia diagnostiky problémov
- Úlohy implementácie monitorovania
- Simulácie reakcie na incidenty

**Hodnotenie modulu 6**: Pokročilé témy
- Návrh CI/CD pipeline
- Vývoj vlastných šablón
- Scenáre podnikovej architektúry

### Záverečný capstone projekt

Navrhnite a implementujte kompletné riešenie, ktoré preukáže zvládnutie všetkých konceptov:

**Požiadavky**:
- Viacvrstvová aplikačná architektúra
- Viaceré nasadzovacie prostredia
- Komplexné monitorovanie a alertovanie
- Implementácia bezpečnosti a súladu
- Optimalizácia nákladov a ladenie výkonu
- Kompletná dokumentácia a runbooky

**Kritériá hodnotenia**:
- Kvalita technickej implementácie
- Kompletnosť dokumentácie
- Dodržiavanie bezpečnostných postupov a osvedčených praktík
- Optimalizácia výkonu a nákladov
- Efektivita riešenia problémov a monitorovania

## Študijné zdroje a odkazy

### Oficiálna dokumentácia
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Komunitné zdroje
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Prostredia na cvičenie
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Ďalšie nástroje
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Odporúčania študijného plánu

### Plné štúdium (8 týždňov)
- **Týždne 1-2**: Moduly 1-2 (Začíname, Konfigurácia)
- **Týždne 3-4**: Moduly 3-4 (Nasadenie, Prednasadenie)
- **Týždne 5-6**: Moduly 5-6 (Riešenie problémov, Pokročilé témy)
- **Týždne 7-8**: Praktické projekty a záverečné hodnotenie

### Čiastočné štúdium (16 týždňov)
- **Týždne 1-4**: Modul 1 (Začíname)
- **Týždne 5-7**: Modul 2 (Konfigurácia a prostredia)
- **Týždne 8-10**: Modul 3 (Nasadenie a provisioning)
- **Týždne 11-12**: Modul 4 (Validácia pred nasadením)
- **Týždne 13-14**: Modul 5 (Riešenie problémov a ladenie)
- **Týždne 15-16**: Modul 6 (Pokročilé témy a hodnotenie)

---

## Rámec sledovania pokroku a hodnotenia

### Zoznam úloh na dokončenie kapitol

Sledujte svoj pokrok v každej kapitole pomocou týchto merateľných výsledkov:

#### 📚 Kapitola 1: Základy & Rýchly štart
- [ ] **Inštalácia dokončená**: AZD nainštalované a overené na vašej platforme
- [ ] **Prvé nasadenie**: Úspešne nasadená šablóna todo-nodejs-mongo
- [ ] **Nastavenie prostredia**: Nakonfigurované prvé premenné prostredia
- [ ] **Prehliadanie zdrojov**: Preskúmané nasadené zdroje v Azure Portal
- [ ] **Ovládanie príkazov**: Pohodlne sa orientujete v základných príkazoch AZD

#### 🤖 Kapitola 2: AI-First Development  
- [ ] **Nasadenie AI šablóny**: Úspešne nasadený azure-search-openai-demo
- [ ] **RAG implementácia**: Nakonfigurované indexovanie a vyhľadávanie dokumentov
- [ ] **Konfigurácia modelu**: Nastavené viaceré AI modely s rôznymi účelmi
- [ ] **AI monitoring**: Implementované Application Insights pre AI workloads
- [ ] **Optimalizácia výkonu**: Vyladený výkon AI aplikácie

#### ⚙️ Kapitola 3: Konfigurácia & Overovanie identity
- [ ] **Nastavenie viacerých prostredí**: Nakonfigurované dev, staging a prod prostredia
- [ ] **Implementácia bezpečnosti**: Nastavené managed identity autentifikácie
- [ ] **Správa tajomstiev**: Integrovaný Azure Key Vault pre citlivé údaje
- [ ] **Správa parametrov**: Vytvorené konfigurácie špecifické pre prostredia
- [ ] **Ovládanie autentifikácie**: Implementované bezpečné prístupové vzory

#### 🏗️ Kapitola 4: Infrastructure as Code & Nasadenie
- [ ] **Vytvorenie vlastnej šablóny**: Postavená multi-službová aplikačná šablóna
- [ ] **Mastering Bicep**: Vytvorené modulárne, znovupoužiteľné infraštruktúrne komponenty
- [ ] **Automatizácia nasadenia**: Implementované pre/post nasadzovacie hooky
- [ ] **Návrh architektúry**: Nasadená zložitá mikroslužbová architektúra
- [ ] **Optimalizácia šablón**: Optimalizované šablóny pre výkon a náklady

#### 🎯 Kapitola 5: Multi-Agent AI riešenia
- [ ] **Nasadenie retail riešenia**: Nasadený kompletný multi-agent retail scenár
- [ ] **Prispôsobenie agentov**: Upravené správanie Customer a Inventory agentov
- [ ] **Škálovanie architektúry**: Implementované load balancing a auto-scaling
- [ ] **Produkčné monitorovanie**: Nastavené komplexné monitorovanie a alertovanie
- [ ] **Ladenie výkonu**: Optimalizovaný výkon multi-agent systému

#### 🔍 Kapitola 6: Validácia pred nasadením & Plánovanie
- [ ] **Analýza kapacít**: Analyzované požiadavky na zdroje pre aplikácie
- [ ] **Optimalizácia SKU**: Vybrané nákladovo efektívne servisné úrovne
- [ ] **Automatizácia validácie**: Implementované skripty pre pre-deployment kontroly
- [ ] **Plánovanie nákladov**: Vytvorené odhady nákladov nasadenia a rozpočty
- [ ] **Hodnotenie rizík**: Identifikované a zmiernené riziká nasadenia

#### 🚨 Kapitola 7: Riešenie problémov & Ladenie
- [ ] **Diagnostické zručnosti**: Úspešne odladené úmyselne chybné nasadenia
- [ ] **Analýza logov**: Efektívne použitie Azure Monitor a Application Insights
- [ ] **Ladenie výkonu**: Optimalizované pomaly bežiace aplikácie
- [ ] **Postupy obnovy**: Implementované zálohovanie a obnova po havárii
- [ ] **Nastavenie monitorovania**: Vytvorené proaktívne monitorovanie a alertovanie

#### 🏢 Kapitola 8: Produkčné & Podnikové vzory
- [ ] **Podniková bezpečnosť**: Implementované komplexné bezpečnostné vzory
- [ ] **Rámec riadenia**: Nastavené Azure Policy a správa zdrojov
- [ ] **Pokročilé monitorovanie**: Vytvorené dashboardy a automatizované alertovanie
- [ ] **Integrácia CI/CD**: Postavené automatizované pipeline nasadenia
- [ ] **Implementácia súladu**: Splnené podnikové požiadavky na súlad

### Časový plán učenia a medzníky

#### Týždeň 1-2: Budovanie základov
- **Medzník**: Nasadiť prvú AI aplikáciu pomocou AZD
- **Overenie**: Funkčná aplikácia prístupná cez verejnú URL
- **Zručnosti**: Základné AZD workflowy a integrácia AI služieb

#### Týždeň 3-4: Ovládnutie konfigurácie
- **Medzník**: Nasadenie do viacerých prostredí s bezpečnou autentifikáciou
- **Overenie**: Rovnaká aplikácia nasadená do dev/staging/prod
- **Zručnosti**: Manažment prostredí a implementácia bezpečnosti

#### Týždeň 5-6: Odbornosť v infraštruktúre
- **Medzník**: Vlastná šablóna pre zložitú multi-službovú aplikáciu
- **Overenie**: Znovupoužiteľná šablóna nasadená iným členom tímu
- **Zručnosti**: Ovládnutie Bicep a automatizácia infraštruktúry

#### Týždeň 7-8: Pokročilá AI implementácia
- **Medzník**: Produkčne pripravené multi-agent AI riešenie
- **Overenie**: Systém zvláda reálne zaťaženie s monitorovaním
- **Zručnosti**: Orchestrace multi-agentov a optimalizácia výkonu

#### Týždeň 9-10: Pripravenosť na produkciu
- **Medzník**: Podnikové nasadenie s plným súladom
- **Overenie**: Prejde bezpečnostnou kontrolou a auditom optimalizácie nákladov
- **Zručnosti**: Riadenie, monitorovanie a integrácia CI/CD

### Hodnotenie a certifikácia

#### Metódy overenia vedomostí
1. **Praktické nasadenia**: Funkčné aplikácie pre každú kapitolu
2. **Code Reviews**: Hodnotenie kvality šablón a konfigurácií
3. **Riešenie problémov**: Scenáre riešenia problémov a ich riešenia
4. **Výučba kolegov**: Vysvetlenie konceptov ostatným študentom
5. **Príspevok komunite**: Zdieľanie šablón alebo vylepšení

#### Výsledky profesionálneho rozvoja
- **Portfólio projektov**: 8 produkčne pripravených nasadení
- **Technické zručnosti**: Odbornosť v nasadzovaní AZD a AI podľa priemyselných štandardov
- **Schopnosti riešenia problémov**: Samostatné odstraňovanie problémov a optimalizácia
- **Uznanie v komunite**: Aktívna účasť v komunite vývojárov Azure
- **Kariérny postup**: Zručnosti priamo použiteľné na pozície v oblasti cloudu a AI

#### Metriky úspechu
- **Miera úspešnosti nasadení**: >95% úspešných nasadení
- **Čas na riešenie problémov**: <30 minút pri bežných problémoch
- **Optimalizácia výkonu**: Preukázateľné zlepšenia v nákladoch a výkone
- **Súlad s bezpečnosťou**: Všetky nasadenia spĺňajú podnikové bezpečnostné štandardy
- **Prenos znalostí**: Schopnosť mentorovať ostatných vývojárov

### Kontinuálne vzdelávanie a zapojenie do komunity

#### Zostaňte v obraze
- **Azure Updates**: Sledujte poznámky k vydaniu Azure Developer CLI
- **Komunitné podujatia**: Zúčastňujte sa podujatí pre vývojárov Azure a AI
- **Dokumentácia**: Prispievajte do komunitnej dokumentácie a príkladov
- **Spätná väzba**: Poskytujte spätnú väzbu k obsahu kurzu a službám Azure

#### Kariérny rozvoj
- **Odborná sieť**: Nadviažte kontakty s expertmi na Azure a AI
- **Príležitosti na prednášanie**: Predstavte svoje poznatky na konferenciách alebo meetupoch
- **Príspevky do open source**: Prispievajte do AZD šablón a nástrojov
- **Mentorstvo**: Viesť ostatných vývojárov na ich ceste učenia sa AZD

---

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../README.md)
- **📖 Začať učenie**: [Kapitola 1: Základy a rýchly štart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Sledovanie pokroku**: Sledujte svoj postup cez komplexný 8-kapitolový vzdelávací systém
- **🤝 Komunita**: [Azure Discord](https://discord.gg/microsoft-azure) pre podporu a diskusiu

**Sledovanie štúdia**: Použite tohto štruktúrovaného sprievodcu na osvojenie si Azure Developer CLI prostredníctvom postupného, praktického učenia s merateľnými výsledkami a prínosmi pre profesionálny rozvoj.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Upozornenie**:
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho originálnom jazyku by sa mal považovať za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nepreberáme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne výklady vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->