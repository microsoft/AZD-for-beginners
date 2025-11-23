<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "02c0d6833f050997d358015c9d6b71d9",
  "translation_date": "2025-11-23T11:38:30+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "sk"
}
-->
# Študijný sprievodca - Komplexné vzdelávacie ciele

**Navigácia v študijnom pláne**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../README.md)
- **📖 Začnite študovať**: [Kapitola 1: Základy a rýchly štart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Sledovanie pokroku**: [Dokončenie kurzu](../README.md#-course-completion--certification)

## Úvod

Tento komplexný študijný sprievodca poskytuje štruktúrované vzdelávacie ciele, kľúčové koncepty, praktické cvičenia a hodnotiace materiály, ktoré vám pomôžu zvládnuť Azure Developer CLI (azd). Použite tento sprievodca na sledovanie svojho pokroku a uistite sa, že ste pokryli všetky základné témy.

## Ciele vzdelávania

Po dokončení tohto študijného sprievodcu budete:
- Ovládať všetky základné a pokročilé koncepty Azure Developer CLI
- Rozvíjať praktické zručnosti v nasadzovaní a správe aplikácií na Azure
- Získať istotu v riešení problémov a optimalizácii nasadení
- Porozumieť postupom pripraveným na produkčné nasadenie a bezpečnostným aspektom

## Výsledky vzdelávania

Po dokončení všetkých sekcií tohto študijného sprievodcu budete schopní:
- Navrhovať, nasadzovať a spravovať kompletné architektúry aplikácií pomocou azd
- Implementovať komplexné stratégie monitorovania, bezpečnosti a optimalizácie nákladov
- Riešiť zložité problémy s nasadením samostatne
- Vytvárať vlastné šablóny a prispievať do komunity azd

## Štruktúra učenia v 8 kapitolách

### Kapitola 1: Základy a rýchly štart (1. týždeň)
**Trvanie**: 30-45 minút | **Náročnosť**: ⭐

#### Ciele vzdelávania
- Porozumieť základným konceptom a terminológii Azure Developer CLI
- Úspešne nainštalovať a nakonfigurovať AZD na vašej vývojovej platforme
- Nasadiť svoju prvú aplikáciu pomocou existujúcej šablóny
- Efektívne sa orientovať v príkazovom rozhraní AZD

#### Kľúčové koncepty na zvládnutie
- Štruktúra projektu AZD a jeho komponenty (azure.yaml, infra/, src/)
- Pracovné postupy nasadenia založené na šablónach
- Základy konfigurácie prostredia
- Správa skupín zdrojov a predplatného

#### Praktické cvičenia
1. **Overenie inštalácie**: Nainštalujte AZD a overte pomocou `azd version`
2. **Prvé nasadenie**: Úspešne nasadiť šablónu todo-nodejs-mongo
3. **Nastavenie prostredia**: Nakonfigurovať svoje prvé premenné prostredia
4. **Preskúmanie zdrojov**: Navigovať nasadené zdroje v Azure Portáli

#### Hodnotiace otázky
- Aké sú hlavné komponenty projektu AZD?
- Ako inicializujete nový projekt zo šablóny?
- Aký je rozdiel medzi `azd up` a `azd deploy`?
- Ako spravujete viacero prostredí pomocou AZD?

---

### Kapitola 2: Vývoj orientovaný na AI (2. týždeň)
**Trvanie**: 1-2 hodiny | **Náročnosť**: ⭐⭐

#### Ciele vzdelávania
- Integrovať služby Microsoft Foundry do pracovných postupov AZD
- Nasadiť a nakonfigurovať aplikácie poháňané AI
- Porozumieť implementačným vzorcom RAG (Retrieval-Augmented Generation)
- Spravovať nasadenia AI modelov a ich škálovanie

#### Kľúčové koncepty na zvládnutie
- Integrácia služby Azure OpenAI a správa API
- Konfigurácia AI vyhľadávania a vektorového indexovania
- Stratégie nasadenia modelov a plánovanie kapacity
- Monitorovanie AI aplikácií a optimalizácia výkonu

#### Praktické cvičenia
1. **Nasadenie AI chatu**: Nasadiť šablónu azure-search-openai-demo
2. **Implementácia RAG**: Nakonfigurovať indexovanie a vyhľadávanie dokumentov
3. **Konfigurácia modelov**: Nastaviť viacero AI modelov s rôznymi účelmi
4. **Monitorovanie AI**: Implementovať Application Insights pre AI pracovné zaťaženia

#### Hodnotiace otázky
- Ako nakonfigurujete služby Azure OpenAI v šablóne AZD?
- Aké sú hlavné komponenty architektúry RAG?
- Ako spravujete kapacitu a škálovanie AI modelov?
- Aké monitorovacie metriky sú dôležité pre AI aplikácie?

---

### Kapitola 3: Konfigurácia a autentifikácia (3. týždeň)
**Trvanie**: 45-60 minút | **Náročnosť**: ⭐⭐

#### Ciele vzdelávania
- Ovládnuť stratégie konfigurácie a správy prostredí
- Implementovať bezpečné autentifikačné vzory a spravovanú identitu
- Organizovať zdroje pomocou správnych konvencií pomenovania
- Nakonfigurovať nasadenia pre viacero prostredí (dev, staging, prod)

#### Kľúčové koncepty na zvládnutie
- Hierarchia prostredí a prednosť konfigurácie
- Spravovaná identita a autentifikácia pomocou service principal
- Integrácia Key Vault pre správu tajomstiev
- Správa parametrov špecifických pre prostredie

#### Praktické cvičenia
1. **Nastavenie viacerých prostredí**: Nakonfigurovať dev, staging a prod prostredia
2. **Bezpečnostná konfigurácia**: Implementovať autentifikáciu spravovanou identitou
3. **Správa tajomstiev**: Integrovať Azure Key Vault pre citlivé údaje
4. **Správa parametrov**: Vytvoriť konfigurácie špecifické pre prostredie

#### Hodnotiace otázky
- Ako nakonfigurujete rôzne prostredia pomocou AZD?
- Aké sú výhody používania spravovanej identity oproti service principal?
- Ako bezpečne spravujete tajomstvá aplikácie?
- Aká je hierarchia konfigurácie v AZD?

---

### Kapitola 4: Infrastruktúra ako kód a nasadenie (4.-5. týždeň)
**Trvanie**: 1-1,5 hodiny | **Náročnosť**: ⭐⭐⭐

#### Ciele vzdelávania
- Vytvárať a prispôsobovať Bicep šablóny infraštruktúry
- Implementovať pokročilé vzory nasadenia a pracovné postupy
- Porozumieť stratégiám poskytovania zdrojov
- Navrhovať škálovateľné architektúry pre viacero služieb

- Nasadzovať kontajnerové aplikácie pomocou Azure Container Apps a AZD

#### Kľúčové koncepty na zvládnutie
- Štruktúra Bicep šablón a osvedčené postupy
- Závislosti zdrojov a poradie nasadenia
- Súbory parametrov a modularita šablón
- Vlastné hooky a automatizácia nasadenia
- Vzory nasadenia kontajnerových aplikácií (rýchly štart, produkcia, mikroslužby)

#### Praktické cvičenia
1. **Vytvorenie vlastnej šablóny**: Vytvoriť šablónu aplikácie pre viacero služieb
2. **Ovládnutie Bicep**: Vytvoriť modulárne, opakovane použiteľné komponenty infraštruktúry
3. **Automatizácia nasadenia**: Implementovať pre/post hooky nasadenia
4. **Návrh architektúry**: Nasadiť komplexnú architektúru mikroslužieb
5. **Nasadenie kontajnerových aplikácií**: Nasadiť [Simple Flask API](../../../examples/container-app/simple-flask-api) a [Microservices Architecture](../../../examples/container-app/microservices) príklady pomocou AZD

#### Hodnotiace otázky
- Ako vytvoríte vlastné Bicep šablóny pre AZD?
- Aké sú osvedčené postupy pri organizovaní kódu infraštruktúry?
- Ako riešite závislosti zdrojov v šablónach?
- Aké vzory nasadenia podporujú aktualizácie bez výpadkov?

---

### Kapitola 5: AI riešenia s viacerými agentmi (6.-7. týždeň)
**Trvanie**: 2-3 hodiny | **Náročnosť**: ⭐⭐⭐⭐

#### Ciele vzdelávania
- Navrhovať a implementovať architektúry AI s viacerými agentmi
- Orchestrácia koordinácie a komunikácie agentov
- Nasadzovať produkčne pripravené AI riešenia s monitorovaním
- Porozumieť špecializácii agentov a pracovným vzorom
- Integrovať kontajnerové mikroslužby ako súčasť riešení s viacerými agentmi

#### Kľúčové koncepty na zvládnutie
- Vzory architektúry s viacerými agentmi a princípy návrhu
- Protokoly komunikácie agentov a tok dát
- Stratégie vyvažovania záťaže a škálovania pre AI agentov
- Monitorovanie produkcie pre systémy s viacerými agentmi
- Komunikácia medzi službami v kontajnerových prostrediach

#### Praktické cvičenia
1. **Nasadenie maloobchodného riešenia**: Nasadiť kompletný scenár maloobchodu s viacerými agentmi
2. **Prispôsobenie agentov**: Upraviť správanie agentov zákazníka a inventára
3. **Škálovanie architektúry**: Implementovať vyvažovanie záťaže a automatické škálovanie
4. **Monitorovanie produkcie**: Nastaviť komplexné monitorovanie a upozornenia
5. **Integrácia mikroslužieb**: Rozšíriť [Microservices Architecture](../../../examples/container-app/microservices) príklad na podporu pracovných postupov založených na agentoch

#### Hodnotiace otázky
- Ako navrhujete efektívne vzory komunikácie medzi agentmi?
- Aké sú kľúčové úvahy pri škálovaní pracovných záťaží AI agentov?
- Ako monitorujete a odstraňujete problémy v systémoch AI s viacerými agentmi?
- Aké produkčné vzory zabezpečujú spoľahlivosť pre AI agentov?

---

### Kapitola 6: Validácia pred nasadením a plánovanie (8. týždeň)
**Trvanie**: 1 hodina | **Náročnosť**: ⭐⭐

#### Ciele vzdelávania
- Vykonávať komplexné plánovanie kapacity a validáciu zdrojov
- Vybrať optimálne Azure SKU pre nákladovú efektívnosť
- Implementovať automatizované kontroly pred nasadením a validáciu
- Plánovať nasadenia so stratégiami optimalizácie nákladov

#### Kľúčové koncepty na zvládnutie
- Kvóty zdrojov Azure a obmedzenia kapacity
- Kritériá výberu SKU a optimalizácia nákladov
- Automatizované validačné skripty a testovanie
- Plánovanie nasadenia a hodnotenie rizík

#### Praktické cvičenia
1. **Analýza kapacity**: Analyzovať požiadavky na zdroje pre vaše aplikácie
2. **Optimalizácia SKU**: Porovnať a vybrať nákladovo efektívne úrovne služieb
3. **Automatizácia validácie**: Implementovať skripty na kontrolu pred nasadením
4. **Plánovanie nákladov**: Vytvoriť odhady nákladov na nasadenie a rozpočty

#### Hodnotiace otázky
- Ako validujete kapacitu Azure pred nasadením?
- Aké faktory ovplyvňujú rozhodnutia o výbere SKU?
- Ako automatizujete validáciu pred nasadením?
- Aké stratégie pomáhajú optimalizovať náklady na nasadenie?

---

### Kapitola 7: Riešenie problémov a ladenie (9. týždeň)
**Trvanie**: 1-1,5 hodiny | **Náročnosť**: ⭐⭐

#### Ciele vzdelávania
- Rozvíjať systematické prístupy k ladeniu nasadení AZD
- Riešiť bežné problémy s nasadením a konfiguráciou
- Ladiť problémy špecifické pre AI a problémy s výkonom
- Implementovať monitorovanie a upozornenia na proaktívnu detekciu problémov

#### Kľúčové koncepty na zvládnutie
- Diagnostické techniky a stratégie logovania
- Bežné vzory zlyhaní a ich riešenia
- Monitorovanie výkonu a optimalizácia
- Postupy reakcie na incidenty a obnovy

#### Praktické cvičenia
1. **Diagnostické zručnosti**: Precvičiť si na úmyselne chybných nasadeniach
2. **Analýza logov**: Efektívne používať Azure Monitor a Application Insights
3. **Ladenie výkonu**: Optimalizovať aplikácie s pomalým výkonom
4. **Postupy obnovy**: Implementovať zálohovanie a obnovu po havárii

#### Hodnotiace otázky
- Aké sú najbežnejšie zlyhania nasadení AZD?
- Ako ladíte problémy s autentifikáciou a povoleniami?
- Aké monitorovacie stratégie pomáhajú predchádzať problémom v produkcii?
- Ako optimalizujete výkon aplikácií na Azure?

---

### Kapitola 8: Produkčné a podnikové vzory (10.-11. týždeň)
**Trvanie**: 2-3 hodiny | **Náročnosť**: ⭐⭐⭐⭐

#### Ciele vzdelávania
- Implementovať stratégie nasadenia na podnikovej úrovni
- Navrhovať bezpečnostné vzory a rámce súladu
- Zriadiť monitorovanie, správu a kontrolu nákladov
- Vytvoriť škálovateľné CI/CD pipeline s integráciou AZD
- Aplikovať osvedčené postupy pre produkčné nasadenia kontajnerových aplikácií (bezpečnosť, monitorovanie, náklady, CI/CD)

#### Kľúčové koncepty na zvládnutie
- Požiadavky na bezpečnosť a súlad na podnikovej úrovni
- Rámce správy a implementácia politík
- Pokročilé monitorovanie a správa nákladov
- Integrácia CI/CD a automatizované pipeline nasadenia
- Stratégie nasadenia blue-green a canary pre kontajnerové pracovné zaťaženia

#### Praktické cvičenia
1. **Bezpečnosť na podnikovej úrovni**: Implementovať komplexné bezpečnostné vzory
2. **Rámec správy**: Nastaviť Azure Policy a správu zdrojov
3. **Pokročilé monitorovanie**: Vytvoriť dashboardy a automatizované upozornenia
4. **Integrácia CI/CD**: Vytvoriť automatizované pipeline nasadenia
5. **Produkčné kontajnerové aplikácie**: Aplikovať bezpečnosť, monitorovanie a optimalizáciu nákladov na [Microservices Architecture](../../../examples/container-app/microservices) príklad

#### Hodnotiace otázky
- Ako implementujete bezpečnosť na podnikovej úrovni v nasadeniach AZD?
- Aké vzory správy zabezpečujú súlad a kontrolu nákladov?
- Ako navrhujete škálovateľné monitorovanie pre produkčné systémy?
- Aké vzory CI/CD najlepšie fungujú s pracovnými postupmi AZD?

#### Ciele vzdelávania
- Porozumieť základom a hlavným konceptom Azure Developer CLI
- Úspešne nainštalovať a nakonfigurovať azd vo vašom vývojovom prostredí
- Dokončiť prvé nasadenie pomocou existujúcej šablóny
- Orientovať sa v štruktúre projektu azd a porozumieť kľúčovým komponentom

#### Kľúčové koncepty na zvládnutie
- Šablóny, prostredia a služby
- Štruktúra konfigurácie azure.yaml
- Základné príkazy azd (init, up, down, deploy)
- Princípy infraštruktúry ako kódu
- Autentifikácia a autorizácia Azure

#### Praktické cvičenia

**C
5. Aké faktory treba zvážiť pri nasadení do viacerých regiónov?

### Modul 4: Validácia pred nasadením (5. týždeň)

#### Ciele učenia
- Implementovať komplexné kontroly pred nasadením
- Ovládnuť plánovanie kapacity a validáciu zdrojov
- Pochopiť výber SKU a optimalizáciu nákladov
- Vytvoriť automatizované validačné pipeline

#### Kľúčové koncepty na zvládnutie
- Kvóty a limity zdrojov Azure
- Kritériá výberu SKU a dopady na náklady
- Automatizované validačné skripty a nástroje
- Metodiky plánovania kapacity
- Testovanie výkonu a optimalizácia

#### Praktické cvičenia

**Cvičenie 4.1: Plánovanie kapacity**  
```bash
# Implementovať overenie kapacity:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**Cvičenie 4.2: Validácia pred nasadením**  
```powershell
# Vytvorte komplexný validačný proces:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```
  
**Cvičenie 4.3: Optimalizácia SKU**  
```bash
# Optimalizovať konfigurácie služieb:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```
  

#### Otázky na sebahodnotenie
1. Aké faktory by mali ovplyvniť rozhodnutia o výbere SKU?
2. Ako validujete dostupnosť zdrojov Azure pred nasadením?
3. Aké sú kľúčové komponenty systému kontroly pred nasadením?
4. Ako odhadujete a kontrolujete náklady na nasadenie?
5. Aké monitorovanie je nevyhnutné pre plánovanie kapacity?

### Modul 5: Riešenie problémov a ladenie (6. týždeň)

#### Ciele učenia
- Ovládnuť systematické metodiky riešenia problémov
- Získať odborné znalosti v ladení zložitých problémov pri nasadení
- Implementovať komplexné monitorovanie a upozornenia
- Vytvoriť postupy reakcie na incidenty a obnovy

#### Kľúčové koncepty na zvládnutie
- Bežné vzory zlyhania pri nasadení
- Analýza logov a techniky korelácie
- Monitorovanie výkonu a optimalizácia
- Detekcia bezpečnostných incidentov a reakcia
- Obnova po havárii a kontinuita podnikania

#### Praktické cvičenia

**Cvičenie 5.1: Scenáre riešenia problémov**  
```bash
# Precvičovanie riešenia bežných problémov:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```
  
**Cvičenie 5.2: Implementácia monitorovania**  
```bash
# Nastavte komplexné monitorovanie:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```
  
**Cvičenie 5.3: Reakcia na incidenty**  
```bash
# Vytvorte postupy reakcie na incidenty:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  

#### Otázky na sebahodnotenie
1. Aký je systematický prístup k riešeniu problémov pri nasadení azd?
2. Ako korelujete logy medzi viacerými službami a zdrojmi?
3. Aké monitorovacie metriky sú najkritickejšie pre včasnú detekciu problémov?
4. Ako implementujete efektívne postupy obnovy po havárii?
5. Aké sú kľúčové komponenty plánu reakcie na incidenty?

### Modul 6: Pokročilé témy a osvedčené postupy (7.-8. týždeň)

#### Ciele učenia
- Implementovať nasadzovacie vzory na úrovni podniku
- Ovládnuť integráciu a automatizáciu CI/CD
- Vyvíjať vlastné šablóny a prispievať do komunity
- Pochopiť pokročilé požiadavky na bezpečnosť a súlad

#### Kľúčové koncepty na zvládnutie
- Vzory integrácie CI/CD pipeline
- Vývoj a distribúcia vlastných šablón
- Riadenie podniku a súlad
- Pokročilé konfigurácie sietí a bezpečnosti
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
# Vytvárajte a publikujte vlastné šablóny:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**Cvičenie 6.3: Implementácia na úrovni podniku**  
```bash
# Implementovať funkcie na úrovni podniku:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  

#### Otázky na sebahodnotenie
1. Ako integrujete azd do existujúcich CI/CD workflowov?
2. Aké sú kľúčové faktory pri vývoji vlastných šablón?
3. Ako implementujete riadenie a súlad v nasadeniach azd?
4. Aké sú osvedčené postupy pre nasadenia na úrovni podniku?
5. Ako efektívne prispievate do komunity azd?

## Praktické projekty

### Projekt 1: Osobná webová stránka portfólia  
**Náročnosť**: Začiatočník  
**Trvanie**: 1-2 týždne  

Vytvorte a nasaďte osobnú webovú stránku portfólia pomocou:  
- Hosting statickej webovej stránky na Azure Storage  
- Konfigurácia vlastnej domény  
- Integrácia CDN pre globálny výkon  
- Automatizovaná pipeline nasadenia  

**Výstupy**:  
- Funkčná webová stránka nasadená na Azure  
- Vlastná šablóna azd pre nasadenia portfólia  
- Dokumentácia procesu nasadenia  
- Odporúčania na analýzu a optimalizáciu nákladov  

### Projekt 2: Aplikácia na správu úloh  
**Náročnosť**: Stredne pokročilý  
**Trvanie**: 2-3 týždne  

Vytvorte full-stack aplikáciu na správu úloh s:  
- Frontend React nasadený na App Service  
- Backend API Node.js s autentifikáciou  
- PostgreSQL databáza s migráciami  
- Monitorovanie pomocou Application Insights  

**Výstupy**:  
- Kompletná aplikácia s autentifikáciou používateľov  
- Schéma databázy a migračné skripty  
- Dashboardy monitorovania a pravidlá upozornení  
- Konfigurácia nasadenia pre viac prostredí  

### Projekt 3: E-commerce platforma založená na mikroservisoch  
**Náročnosť**: Pokročilý  
**Trvanie**: 4-6 týždňov  

Navrhnite a implementujte e-commerce platformu založenú na mikroservisoch:  
- Viaceré API služby (katalóg, objednávky, platby, používatelia)  
- Integrácia fronty správ pomocou Service Bus  
- Redis cache pre optimalizáciu výkonu  
- Komplexné logovanie a monitorovanie  

**Referenčný príklad**: Pozrite si [Microservices Architecture](../../../examples/container-app/microservices) pre šablónu pripravenú na produkciu a sprievodcu nasadením  

**Výstupy**:  
- Kompletná architektúra mikroservisov  
- Vzory komunikácie medzi službami  
- Testovanie výkonu a optimalizácia  
- Implementácia bezpečnosti pripravená na produkciu  

## Hodnotenie a certifikácia

### Kontroly vedomostí

Dokončite tieto hodnotenia po každom module:

**Hodnotenie modulu 1**: Základné koncepty a inštalácia  
- Otázky s výberom odpovede na základné koncepty  
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
- Cvičenia diagnostiky problémov  
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
- Optimalizácia nákladov a ladenie výkonu  
- Kompletná dokumentácia a runbooky  

**Kritériá hodnotenia**:  
- Kvalita technickej implementácie  
- Kompletnosť dokumentácie  
- Dodržiavanie bezpečnosti a osvedčených postupov  
- Optimalizácia výkonu a nákladov  
- Účinnosť riešenia problémov a monitorovania  

## Študijné zdroje a referencie

### Oficiálna dokumentácia
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Dokumentácia Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centrum architektúry Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Zdroje komunity
- [Galéria šablón AZD](https://azure.github.io/awesome-azd/)  
- [Organizácia Azure-Samples na GitHub](https://github.com/Azure-Samples)  
- [GitHub repozitár Azure Developer CLI](https://github.com/Azure/azure-dev)  

### Praktické prostredia
- [Bezplatný účet Azure](https://azure.microsoft.com/free/)  
- [Bezplatná úroveň Azure DevOps](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Ďalšie nástroje
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Balík rozšírení Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Odporúčania pre študijný plán

### Denné štúdium (8 týždňov)
- **1.-2. týždeň**: Moduly 1-2 (Začíname, Konfigurácia)  
- **3.-4. týždeň**: Moduly 3-4 (Nasadenie, Validácia pred nasadením)  
- **5.-6. týždeň**: Moduly 5-6 (Riešenie problémov, Pokročilé témy)  
- **7.-8. týždeň**: Praktické projekty a záverečné hodnotenie  

### Čiastočné štúdium (16 týždňov)
- **1.-4. týždeň**: Modul 1 (Začíname)  
- **5.-7. týždeň**: Modul 2 (Konfigurácia a prostredia)  
- **8.-10. týždeň**: Modul 3 (Nasadenie a provisioning)  
- **11.-12. týždeň**: Modul 4 (Validácia pred nasadením)  
- **13.-14. týždeň**: Modul 5 (Riešenie problémov a ladenie)  
- **15.-16. týždeň**: Modul 6 (Pokročilé témy a hodnotenie)  

---

## Sledovanie pokroku a rámec hodnotenia

### Kontrolný zoznam dokončenia kapitol

Sledujte svoj pokrok v každej kapitole pomocou týchto merateľných výsledkov:

#### 📚 Kapitola 1: Základy a rýchly štart
- [ ] **Dokončená inštalácia**: AZD nainštalovaný a overený na vašej platforme  
- [ ] **Prvé nasadenie**: Úspešne nasadená šablóna todo-nodejs-mongo  
- [ ] **Nastavenie prostredia**: Konfigurované prvé premenné prostredia  
- [ ] **Navigácia zdrojov**: Preskúmané nasadené zdroje v Azure Portal  
- [ ] **Ovládanie príkazov**: Pohodlné používanie základných príkazov AZD  

#### 🤖 Kapitola 2: AI-First vývoj  
- [ ] **Nasadenie AI šablóny**: Úspešne nasadená azure-search-openai-demo  
- [ ] **Implementácia RAG**: Konfigurované indexovanie a vyhľadávanie dokumentov  
- [ ] **Konfigurácia modelu**: Nastavené viaceré AI modely s rôznymi účelmi  
- [ ] **Monitorovanie AI**: Implementované Application Insights pre AI úlohy  
- [ ] **Optimalizácia výkonu**: Vyladený výkon AI aplikácie  

#### ⚙️ Kapitola 3: Konfigurácia a autentifikácia
- [ ] **Nastavenie viacerých prostredí**: Konfigurované dev, staging a prod prostredia  
- [ ] **Implementácia bezpečnosti**: Nastavená autentifikácia spravovanej identity  
- [ ] **Správa tajomstiev**: Integrovaný Azure Key Vault pre citlivé údaje  
- [ ] **Správa parametrov**: Vytvorené konfigurácie špecifické pre prostredie  
- [ ] **Ovládanie autentifikácie**: Implementované bezpečné vzory prístupu  

#### 🏗️ Kapitola 4: Infraštruktúra ako kód a nasadenie
- [ ] **Vytvorenie vlastnej šablóny**: Vytvorená šablóna aplikácie s viacerými službami  
- [ ] **Ovládanie Bicep**: Vytvorené modulárne, opakovane použiteľné komponenty infraštruktúry  
- [ ] **Automatizácia nasadenia**: Implementované pre/post nasadenie hooky  
- [ ] **Návrh architektúry**: Nasadená komplexná architektúra mikroservisov  
- [ ] **Optimalizácia šablóny**: Optimalizované šablóny pre výkon a náklady  

#### 🎯 Kapitola 5: AI riešenia s viacerými agentmi
- [ ] **Nasadenie retailového riešenia**: Nasadený kompletný scenár retailu s viacerými agentmi  
- [ ] **Prispôsobenie agenta**: Upravené správanie agenta zákazníka a inventára  
- [ ] **Škálovanie architektúry**: Implementované vyvažovanie záťaže a auto-škálovanie  
- [ ] **Monitorovanie produkcie**: Nastavené komplexné monitorovanie a upozornenia  
- [ ] **Ladenie výkonu**: Optimalizovaný výkon systému s viacerými agentmi  

#### 🔍 Kapitola 6: Validácia pred nasadením a plánovanie
- [ ] **Analýza kapacity**: Analyzované požiadavky na zdroje pre aplikácie  
- [ ] **Optimalizácia SKU**: Vybrané nákladovo efektívne úrovne služieb  
- [ ] **Automatizácia validácie**: Implementované skripty kontroly pred nasadením  
- [ ] **Plánovanie nákladov**: Vytvorené odhady nákladov na nasadenie a rozpočty  
- [ ] **Hodnotenie rizík**: Identifikované a zmiernené riziká nasadenia  

#### 🚨 Kapitola 7: Riešenie problémov a ladenie
- [ ] **Diagnostické zručnosti**: Úspešne vyriešené úmyselne pokazené nasadenia  
- [ ] **Analýza logov**: Efektívne použité Azure Monitor a Application Insights  
- [ ] **Ladenie výkonu**: Optimalizované aplikácie s pomalým výkonom  
- [ ] **Postupy obnovy**: Implementované zálohovanie a obnova po havárii  
- [ ] **Nastavenie monitorovania**: Vytvorené proaktívne monitorovanie a upozornenia  

#### 🏢 Kapitola 8: Produkcia a vzory na úrovni podniku
- [ ] **Bezpečnosť na úrovni podniku**: Implementované komplexné bezpečnostné vzory  
- [ ] **Rámec riadenia**: Nastavené Azure Policy a správa zdrojov  
- [ ] **Pokročilé monitorovanie**: Vytvorené dashboardy a automatizované upozornenia  
- [ ] **Integrácia CI/CD**: Vytvorené automatizované pipeline nasadenia  
- [ ] **Implementácia súladu**: Splnené požiadavky na súlad na úrovni podniku  

### Časová os učenia a míľniky

#### 1.-2. týždeň: Budovanie základov  
- **Míľnik**: Nasadenie
5. **Príspevok komunity**: Zdieľajte šablóny alebo vylepšenia

#### Výsledky profesionálneho rozvoja
- **Projekty do portfólia**: 8 nasadení pripravených na produkciu
- **Technické zručnosti**: Odbornosť v nasadení AZD a AI na priemyselnej úrovni
- **Schopnosti riešiť problémy**: Samostatné riešenie problémov a optimalizácia
- **Uznanie komunity**: Aktívna účasť v komunite vývojárov Azure
- **Kariérny postup**: Zručnosti priamo aplikovateľné na pozície v oblasti cloudu a AI

#### Metodiky úspechu
- **Miera úspešnosti nasadení**: >95% úspešných nasadení
- **Čas riešenia problémov**: <30 minút na bežné problémy
- **Optimalizácia výkonu**: Preukázateľné zlepšenia nákladov a výkonu
- **Súlad s bezpečnostnými normami**: Všetky nasadenia spĺňajú podnikové bezpečnostné štandardy
- **Prenos vedomostí**: Schopnosť mentorovať ostatných vývojárov

### Neustále vzdelávanie a zapojenie do komunity

#### Udržiavajte si prehľad
- **Aktualizácie Azure**: Sledujte poznámky k vydaniam Azure Developer CLI
- **Podujatia komunity**: Zúčastňujte sa podujatí pre vývojárov Azure a AI
- **Dokumentácia**: Prispievajte do komunitnej dokumentácie a príkladov
- **Spätná väzba**: Poskytujte spätnú väzbu k obsahu kurzu a službám Azure

#### Kariérny rozvoj
- **Profesionálna sieť**: Spojte sa s odborníkmi na Azure a AI
- **Príležitosti na prezentovanie**: Prezentujte svoje poznatky na konferenciách alebo stretnutiach
- **Príspevky do open source**: Prispievajte do šablón a nástrojov AZD
- **Mentorstvo**: Venujte sa vedeniu ostatných vývojárov na ich ceste učenia AZD

---

**Navigácia kapitolami:**
- **📚 Domov kurzu**: [AZD Pre začiatočníkov](../README.md)
- **📖 Začnite sa učiť**: [Kapitola 1: Základy a rýchly štart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Sledovanie pokroku**: Sledujte svoj pokrok prostredníctvom komplexného 8-kapitolového vzdelávacieho systému
- **🤝 Komunita**: [Azure Discord](https://discord.gg/microsoft-azure) pre podporu a diskusiu

**Sledovanie pokroku v štúdiu**: Použite tento štruktúrovaný sprievodca na zvládnutie Azure Developer CLI prostredníctvom postupného, praktického učenia s merateľnými výsledkami a výhodami pre profesionálny rozvoj.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->