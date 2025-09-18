<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-18T10:09:51+00:00",
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

Tento komplexný študijný sprievodca poskytuje štruktúrované vzdelávacie ciele, kľúčové koncepty, praktické cvičenia a hodnotiace materiály, ktoré vám pomôžu zvládnuť Azure Developer CLI (azd). Použite tento sprievodca na sledovanie svojho pokroku a uistite sa, že ste pokryli všetky dôležité témy.

## Ciele vzdelávania

Po absolvovaní tohto študijného sprievodcu budete:
- Ovládať všetky základné a pokročilé koncepty Azure Developer CLI
- Rozvíjať praktické zručnosti v nasadzovaní a správe aplikácií na Azure
- Získať istotu v riešení problémov a optimalizácii nasadení
- Rozumieť postupom nasadenia pripraveným na produkciu a bezpečnostným aspektom

## Výsledky vzdelávania

Po dokončení všetkých sekcií tohto študijného sprievodcu budete schopní:
- Navrhovať, nasadzovať a spravovať kompletné aplikačné architektúry pomocou azd
- Implementovať komplexné stratégie monitorovania, bezpečnosti a optimalizácie nákladov
- Samostatne riešiť zložité problémy s nasadením
- Vytvárať vlastné šablóny a prispievať do komunity azd

## Štruktúra učenia v 8 kapitolách

### Kapitola 1: Základy a rýchly štart (1. týždeň)
**Trvanie**: 30-45 minút | **Náročnosť**: ⭐

#### Ciele učenia
- Pochopiť základné koncepty a terminológiu Azure Developer CLI
- Úspešne nainštalovať a nakonfigurovať AZD na vašej vývojovej platforme
- Nasadiť svoju prvú aplikáciu pomocou existujúcej šablóny
- Efektívne sa orientovať v príkazovom rozhraní AZD

#### Kľúčové koncepty na zvládnutie
- Štruktúra a komponenty projektu AZD (azure.yaml, infra/, src/)
- Pracovné postupy nasadenia založené na šablónach
- Základy konfigurácie prostredia
- Správa skupín zdrojov a predplatného

#### Praktické cvičenia
1. **Overenie inštalácie**: Nainštalujte AZD a overte pomocou `azd version`
2. **Prvé nasadenie**: Úspešne nasadiť šablónu todo-nodejs-mongo
3. **Nastavenie prostredia**: Nakonfigurujte svoje prvé premenné prostredia
4. **Preskúmanie zdrojov**: Orientujte sa v nasadených zdrojoch v Azure Portáli

#### Hodnotiace otázky
- Aké sú hlavné komponenty projektu AZD?
- Ako inicializujete nový projekt zo šablóny?
- Aký je rozdiel medzi `azd up` a `azd deploy`?
- Ako spravujete viacero prostredí pomocou AZD?

---

### Kapitola 2: Vývoj orientovaný na AI (2. týždeň)
**Trvanie**: 1-2 hodiny | **Náročnosť**: ⭐⭐

#### Ciele učenia
- Integrovať služby Azure AI Foundry do pracovných postupov AZD
- Nasadiť a nakonfigurovať aplikácie poháňané AI
- Pochopiť implementačné vzory RAG (Retrieval-Augmented Generation)
- Spravovať nasadenia a škálovanie AI modelov

#### Kľúčové koncepty na zvládnutie
- Integrácia služby Azure OpenAI a správa API
- Konfigurácia AI vyhľadávania a indexovania vektorov
- Stratégie nasadenia modelov a plánovanie kapacity
- Monitorovanie AI aplikácií a optimalizácia výkonu

#### Praktické cvičenia
1. **Nasadenie AI chatu**: Nasadiť šablónu azure-search-openai-demo
2. **Implementácia RAG**: Nakonfigurovať indexovanie a vyhľadávanie dokumentov
3. **Konfigurácia modelov**: Nastaviť viacero AI modelov s rôznymi účelmi
4. **Monitorovanie AI**: Implementovať Application Insights pre AI pracovné zaťaženia

#### Hodnotiace otázky
- Ako nakonfigurujete služby Azure OpenAI v šablóne AZD?
- Aké sú kľúčové komponenty architektúry RAG?
- Ako spravujete kapacitu a škálovanie AI modelov?
- Aké monitorovacie metriky sú dôležité pre AI aplikácie?

---

### Kapitola 3: Konfigurácia a autentifikácia (3. týždeň)
**Trvanie**: 45-60 minút | **Náročnosť**: ⭐⭐

#### Ciele učenia
- Ovládnuť stratégie konfigurácie a správy prostredí
- Implementovať bezpečné vzory autentifikácie a spravovanej identity
- Organizovať zdroje s vhodnými názvovými konvenciami
- Nakonfigurovať nasadenia pre viacero prostredí (dev, staging, prod)

#### Kľúčové koncepty na zvládnutie
- Hierarchia prostredí a prednosť konfigurácie
- Autentifikácia pomocou spravovanej identity a servisných princípov
- Integrácia Key Vault pre správu tajomstiev
- Správa parametrov špecifických pre prostredie

#### Praktické cvičenia
1. **Nastavenie viacero prostredí**: Nakonfigurujte prostredia dev, staging a prod
2. **Bezpečnostná konfigurácia**: Implementujte autentifikáciu pomocou spravovanej identity
3. **Správa tajomstiev**: Integrujte Azure Key Vault pre citlivé údaje
4. **Správa parametrov**: Vytvorte konfigurácie špecifické pre prostredie

#### Hodnotiace otázky
- Ako nakonfigurujete rôzne prostredia pomocou AZD?
- Aké sú výhody použitia spravovanej identity oproti servisným princípom?
- Ako bezpečne spravujete tajomstvá aplikácie?
- Aká je hierarchia konfigurácie v AZD?

---

### Kapitola 4: Infrastruktúra ako kód a nasadenie (4.-5. týždeň)
**Trvanie**: 1-1,5 hodiny | **Náročnosť**: ⭐⭐⭐

#### Ciele učenia
- Vytvárať a prispôsobovať šablóny infraštruktúry Bicep
- Implementovať pokročilé vzory a pracovné postupy nasadenia
- Pochopiť stratégie poskytovania zdrojov
- Navrhovať škálovateľné architektúry pre viacero služieb

#### Kľúčové koncepty na zvládnutie
- Štruktúra šablón Bicep a osvedčené postupy
- Závislosti zdrojov a poradie nasadenia
- Súbory parametrov a modularita šablón
- Vlastné hooky a automatizácia nasadenia

#### Praktické cvičenia
1. **Vytvorenie vlastnej šablóny**: Vytvorte šablónu pre aplikáciu s viacerými službami
2. **Ovládnutie Bicep**: Vytvorte modulárne, opakovane použiteľné komponenty infraštruktúry
3. **Automatizácia nasadenia**: Implementujte hooky pred/po nasadení
4. **Návrh architektúry**: Nasadiť komplexnú architektúru mikroslužieb

#### Hodnotiace otázky
- Ako vytvoríte vlastné šablóny Bicep pre AZD?
- Aké sú osvedčené postupy pre organizáciu infraštruktúrneho kódu?
- Ako riešite závislosti medzi zdrojmi v šablónach?
- Aké vzory nasadenia podporujú aktualizácie bez výpadkov?

---

### Kapitola 5: Riešenia s viacerými AI agentmi (6.-7. týždeň)
**Trvanie**: 2-3 hodiny | **Náročnosť**: ⭐⭐⭐⭐

#### Ciele učenia
- Navrhovať a implementovať architektúry s viacerými AI agentmi
- Koordinovať komunikáciu a spoluprácu agentov
- Nasadiť riešenia AI pripravené na produkciu s monitorovaním
- Pochopiť špecializáciu agentov a vzory pracovných postupov

#### Kľúčové koncepty na zvládnutie
- Vzory architektúry s viacerými agentmi a princípy návrhu
- Protokoly komunikácie agentov a tok dát
- Stratégie vyvažovania záťaže a škálovania pre AI agentov
- Monitorovanie produkcie pre systémy s viacerými agentmi

#### Praktické cvičenia
1. **Nasadenie maloobchodného riešenia**: Nasadiť kompletný scenár maloobchodu s viacerými agentmi
2. **Prispôsobenie agentov**: Upraviť správanie agentov pre zákazníkov a inventár
3. **Škálovanie architektúry**: Implementovať vyvažovanie záťaže a automatické škálovanie
4. **Monitorovanie produkcie**: Nastaviť komplexné monitorovanie a upozornenia

#### Hodnotiace otázky
- Ako navrhujete efektívne vzory komunikácie medzi agentmi?
- Aké sú kľúčové úvahy pri škálovaní pracovných záťaží AI agentov?
- Ako monitorujete a ladíte systémy s viacerými AI agentmi?
- Aké vzory produkcie zabezpečujú spoľahlivosť pre AI agentov?
2. Ako overiť dostupnosť zdrojov Azure pred nasadením?  
3. Aké sú kľúčové komponenty systému predletovej kontroly?  
4. Ako odhadnúť a kontrolovať náklady na nasadenie?  
5. Aké monitorovanie je nevyhnutné pre plánovanie kapacity?

### Modul 5: Riešenie problémov a ladenie (Týždeň 6)

#### Ciele učenia
- Ovládnuť systematické metodológie riešenia problémov  
- Získať odborné znalosti v ladení zložitých problémov pri nasadení  
- Implementovať komplexné monitorovanie a upozornenia  
- Vytvoriť postupy reakcie na incidenty a obnovy  

#### Kľúčové koncepty na zvládnutie
- Bežné vzory zlyhania pri nasadení  
- Analýza logov a techniky korelácie  
- Monitorovanie výkonu a optimalizácia  
- Detekcia bezpečnostných incidentov a reakcia  
- Obnova po katastrofe a kontinuita podnikania  

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
1. Aký je systematický prístup k riešeniu problémov pri nasadení azd?  
2. Ako korelovať logy medzi viacerými službami a zdrojmi?  
3. Aké monitorovacie metriky sú najkritickejšie pre včasnú detekciu problémov?  
4. Ako implementovať efektívne postupy obnovy po katastrofe?  
5. Aké sú kľúčové komponenty plánu reakcie na incidenty?  

### Modul 6: Pokročilé témy a osvedčené postupy (Týždeň 7-8)

#### Ciele učenia
- Implementovať vzory nasadenia na úrovni podniku  
- Ovládnuť integráciu a automatizáciu CI/CD  
- Vyvíjať vlastné šablóny a prispievať do komunity  
- Pochopiť pokročilé požiadavky na bezpečnosť a súlad  

#### Kľúčové koncepty na zvládnutie
- Vzory integrácie CI/CD pipeline  
- Vývoj a distribúcia vlastných šablón  
- Riadenie a súlad na úrovni podniku  
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
3. Ako implementovať riadenie a súlad v nasadeniach azd?  
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
- Automatizovaný nasadzovací pipeline  

**Výstupy**:  
- Funkčná webová stránka nasadená na Azure  
- Vlastná šablóna azd pre nasadenia portfólia  
- Dokumentácia procesu nasadenia  
- Odporúčania na analýzu a optimalizáciu nákladov  

### Projekt 2: Aplikácia na správu úloh  
**Komplexnosť**: Stredne pokročilý  
**Trvanie**: 2-3 týždne  

Vytvorte full-stack aplikáciu na správu úloh s:  
- Frontend React nasadený na App Service  
- Backend API Node.js s autentifikáciou  
- PostgreSQL databáza s migráciami  
- Monitorovanie pomocou Application Insights  

**Výstupy**:  
- Kompletná aplikácia s autentifikáciou používateľov  
- Schéma databázy a skripty migrácie  
- Monitorovacie dashboardy a pravidlá upozornení  
- Konfigurácia nasadenia pre viac prostredí  

### Projekt 3: E-commerce platforma založená na mikroservisoch  
**Komplexnosť**: Pokročilý  
**Trvanie**: 4-6 týždňov  

Navrhnite a implementujte e-commerce platformu založenú na mikroservisoch:  
- Viaceré API služby (katalóg, objednávky, platby, používatelia)  
- Integrácia frontu správ pomocou Service Bus  
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
- Otázky s výberom odpovede na základné koncepty  
- Praktické úlohy inštalácie a konfigurácie  
- Jednoduché cvičenie nasadenia  

**Hodnotenie modulu 2**: Konfigurácia a prostredia  
- Scenáre správy prostredí  
- Cvičenia riešenia problémov s konfiguráciou  
- Implementácia bezpečnostnej konfigurácie  

**Hodnotenie modulu 3**: Nasadenie a provisioning  
- Výzvy návrhu infraštruktúry  
- Scenáre nasadenia viacerých služieb  
- Cvičenia optimalizácie výkonu  

**Hodnotenie modulu 4**: Validácia pred nasadením  
- Prípadové štúdie plánovania kapacity  
- Scenáre optimalizácie nákladov  
- Implementácia validačného pipeline  

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
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organizácia](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)  

### Praktické prostredia  
- [Azure Free Account](https://azure.microsoft.com/free/)  
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Ďalšie nástroje  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Odporúčania pre študijný plán

### Plný úväzok (8 týždňov)  
- **Týždne 1-2**: Moduly 1-2 (Začiatky, Konfigurácia)  
- **Týždne 3-4**: Moduly 3-4 (Nasadenie, Validácia pred nasadením)  
- **Týždne 5-6**: Moduly 5-6 (Riešenie problémov, Pokročilé témy)  
- **Týždne 7-8**: Praktické projekty a záverečné hodnotenie  

### Čiastočný úväzok (16 týždňov)  
- **Týždne 1-4**: Modul 1 (Začiatky)  
- **Týždne 5-7**: Modul 2 (Konfigurácia a prostredia)  
- **Týždne 8-10**: Modul 3 (Nasadenie a provisioning)  
- **Týždne 11-12**: Modul 4 (Validácia pred nasadením)  
- **Týždne 13-14**: Modul 5 (Riešenie problémov a ladenie)  
- **Týždne 15-16**: Modul 6 (Pokročilé témy a hodnotenie)  

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
- [ ] **Monitorovanie AI**: Implementované Application Insights pre AI pracovné zaťaženia  
- [ ] **Optimalizácia výkonu**: Vyladený výkon AI aplikácie  

#### ⚙️ Kapitola 3: Konfigurácia a autentifikácia  
- [ ] **Nastavenie viacerých prostredí**: Konfigurované dev, staging a prod prostredia  
- [ ] **Implementácia bezpečnosti**: Nastavená autentifikácia spravovanej identity  
- [ ] **Správa tajomstiev**: Integrovaný Azure Key Vault pre citlivé údaje  
- [ ] **Správa parametrov**: Vytvorené konfigurácie špecifické pre prostredie  
- [ ] **Ovládanie autentifikácie**: Implementované bezpečné vzory prístupu  

#### 🏗️ Kapitola 4: Infra ako kód & nasadenie  
- [ ] **Vytvorenie vlastnej šablóny**: Vytvorená šablóna aplikácie s viacerými službami  
- [ ] **Ovládanie Bicep**: Vytvorené modulárne, opakovane použiteľné komponenty infraštruktúry  
- [ ] **Automatizácia nasadenia**: Implementované pred/po nasadzovacie hooky  
- [ ] **Návrh architektúry**: Nasadená komplexná architektúra mikroservisov  
- [ ] **Optimalizácia šablóny**: Optimalizované šablóny pre výkon a náklady  

#### 🎯 Kapitola 5: Multi-agentové AI riešenia  
- [ ] **Nasadenie retailového riešenia**: Nasadený kompletný scenár multi-agentového retailu  
- [ ] **Prispôsobenie agenta**: Upravené správanie agenta zákazníka a inventára  
- [ ] **Škálovanie architektúry**: Implementované vyvažovanie záťaže a auto-škálovanie  
- [ ] **Monitorovanie produkcie**: Nastavené komplexné monitorovanie a upozornenia  
- [ ] **Ladenie výkonu**: Optimalizovaný výkon multi-agentového systému  

#### 🔍 Kapitola 6: Validácia pred nasadením & plánovanie  
- [ ] **Analýza kapacity**: Analyzované požiadavky na zdroje pre aplikácie  
- [ ] **Optimalizácia SKU**: Vybrané nákladovo efektívne úrovne služieb  
- [ ] **Automatizácia validácie**: Implementované skripty pred nasadením  
- [ ] **Plánovanie nákladov**: Vytvorené odhady nákladov na nasadenie a rozpočty  
- [ ] **Hodnotenie rizík**: Identifikované a zmiernené riziká nasadenia  

#### 🚨 Kapitola 7: Riešenie problémov & ladenie  
- [ ] **Diagnostické zručnosti**: Úspešne vyriešené úmyselne pokazené nasadenia  
- [ ] **Analýza logov**: Efektívne použité Azure Monitor a Application Insights  
- [ ] **Ladenie výkonu**: Optimalizované aplikácie s pomalým výkonom  
- [ ] **Postupy obnovy**: Implementované zálohovanie a obnova po katastrofe  
- [ ] **Nastavenie monitorovania**: Vytvorené proaktívne monitorovanie a upozornenia  

#### 🏢 Kapitola 8: Produkcia & podnikové vzory  
- [ ] **Podniková bezpečnosť**: Implementované komplexné bezpečnostné vzory  
- [ ] **Rámec riadenia**: Nastavené Azure Policy a správa zdrojov  
- [ ] **Pokročilé monitorovanie**: Vytvorené dashboardy a automatizované upozornenia  
- [ ] **Integrácia CI/CD**: Vytvorené automatizované nasadzovacie pipeline  
- [ ] **Implementácia súladu**: Splnené požiadavky na súlad na úrovni podniku  

### Časová os učenia a míľniky

#### Týždeň 1-2: Budovanie základov  
- **Míľnik**: Nasadenie prvej AI aplikácie pomocou AZD  
- **Validácia**: Funkčná aplikácia dostupná cez verejnú URL  
- **Zručnosti**: Základné workflowy AZD a integrácia AI služieb  

#### Týždeň 3-4: Ovládnutie konfigurácie  
- **Míľnik**: Nasadenie do viacerých prostredí s bezpečnou autentifikáciou  
- **Validácia**: Rovnaká aplikácia nasadená do dev/staging/prod  
- **Zručnosti**: Správa prostredí a implementácia bezpečnosti  

#### Týždeň 5-6: Odbornosť v infraštruktúre  
- **Míľnik**: Vlastná šablóna pre komplexnú aplikáciu s viacerými službami  
- **Validácia**: Opakovane použiteľná šablóna nasadená iným členom tímu  
- **Zručnosti**: Ovládnutie Bicep a automatizácia infraštruktúry  

#### Týždeň 7-8: Pokročilá implementácia AI  
- **Míľnik**: Produkčne pripravené multi-agentové AI riešenie  
- **Validácia**: Systém zvládajúci reálnu záťaž s monitorovaním  
- **Zručnosti**: Orchestrácia multi-agentov a optimalizácia výkonu  

#### Týždeň 9-10: Pripravenosť na produkciu  
- **Míľnik**: Nasadenie na úrovni
- **Dokumentácia**: Prispievajte do komunitnej dokumentácie a príkladov
- **Spätná väzba**: Poskytujte spätnú väzbu na obsah kurzu a služby Azure

#### Kariérny rozvoj
- **Profesionálna sieť**: Spojte sa s odborníkmi na Azure a AI
- **Príležitosti na vystúpenie**: Prezentujte svoje poznatky na konferenciách alebo stretnutiach
- **Príspevky do open source**: Prispievajte do šablón a nástrojov AZD
- **Mentorstvo**: Pomáhajte ostatným vývojárom na ich ceste učenia sa AZD

---

**Navigácia kapitolami:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../README.md)
- **📖 Začnite sa učiť**: [Kapitola 1: Základy a rýchly štart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Sledovanie pokroku**: Sledujte svoj postup prostredníctvom komplexného 8-kapitolového systému učenia
- **🤝 Komunita**: [Azure Discord](https://discord.gg/microsoft-azure) na podporu a diskusiu

**Sledovanie študijného pokroku**: Použite tento štruktúrovaný sprievodca na zvládnutie Azure Developer CLI prostredníctvom postupného, praktického učenia s merateľnými výsledkami a výhodami pre profesionálny rozvoj.

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.