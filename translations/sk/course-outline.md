<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "babd9fee2001054ecde767c9b1c85394",
  "translation_date": "2025-09-18T09:57:30+00:00",
  "source_file": "course-outline.md",
  "language_code": "sk"
}
-->
## Štruktúra učenia v 8 kapitolách

### Kapitola 1: Základy a rýchly štart (30-45 minút) 🌱
**Predpoklady**: Azure predplatné, základné znalosti príkazového riadku  
**Náročnosť**: ⭐

#### Čo sa naučíte
- Pochopenie základov Azure Developer CLI
- Inštalácia AZD na vašej platforme  
- Váš prvý úspešný deployment
- Kľúčové koncepty a terminológia

#### Učebné zdroje
- [AZD Základy](docs/getting-started/azd-basics.md) - Hlavné koncepty
- [Inštalácia a nastavenie](docs/getting-started/installation.md) - Platformovo špecifické návody
- [Váš prvý projekt](docs/getting-started/first-project.md) - Praktický tutoriál
- [Rýchly prehľad príkazov](resources/cheat-sheet.md) - Rýchla referencia

#### Praktický výsledok
Úspešne nasadiť jednoduchú webovú aplikáciu na Azure pomocou AZD

---

### Kapitola 2: Vývoj orientovaný na AI (1-2 hodiny) 🤖
**Predpoklady**: Dokončená kapitola 1  
**Náročnosť**: ⭐⭐

#### Čo sa naučíte
- Integrácia Azure AI Foundry s AZD
- Nasadzovanie aplikácií poháňaných AI
- Pochopenie konfigurácií AI služieb
- Vzory RAG (Retrieval-Augmented Generation)

#### Učebné zdroje
- [Integrácia Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- [Nasadzovanie AI modelov](docs/ai-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Praktické cvičenie
- [Šablóny Azure AI Foundry](README.md#featured-azure-ai-foundry-templates)

#### Praktický výsledok
Nasadiť a nakonfigurovať AI aplikáciu na chat s RAG schopnosťami

---

### Kapitola 3: Konfigurácia a autentifikácia (45-60 minút) ⚙️
**Predpoklady**: Dokončená kapitola 1  
**Náročnosť**: ⭐⭐

#### Čo sa naučíte
- Konfigurácia a správa prostredí
- Najlepšie postupy pre autentifikáciu a bezpečnosť
- Názvoslovie a organizácia zdrojov
- Nasadzovanie vo viacerých prostrediach

#### Učebné zdroje
- [Príručka konfigurácie](docs/getting-started/configuration.md) - Nastavenie prostredia
- Bezpečnostné vzory a spravovaná identita
- Príklady pre viac prostredí

#### Praktický výsledok
Spravovať viacero prostredí s vhodnou autentifikáciou a bezpečnosťou

---

### Kapitola 4: Infrastruktúra ako kód a nasadzovanie (1-1,5 hodiny) 🏗️
**Predpoklady**: Dokončené kapitoly 1-3  
**Náročnosť**: ⭐⭐⭐

#### Čo sa naučíte
- Pokročilé vzory nasadzovania
- Infrastruktúra ako kód s Bicepom
- Stratégie na provisionovanie zdrojov
- Tvorba vlastných šablón

#### Učebné zdroje
- [Príručka nasadzovania](docs/deployment/deployment-guide.md) - Kompletné pracovné postupy
- [Provisionovanie zdrojov](docs/deployment/provisioning.md) - Správa zdrojov
- Príklady kontajnerov a mikroslužieb

#### Praktický výsledok
Nasadiť komplexné aplikácie s viacerými službami pomocou vlastných šablón infraštruktúry

---

### Kapitola 5: AI riešenia s viacerými agentmi (2-3 hodiny) 🤖🤖
**Predpoklady**: Dokončené kapitoly 1-2  
**Náročnosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Vzory architektúry s viacerými agentmi
- Orchestrácia a koordinácia agentov
- Nasadzovanie AI pripravené na produkciu
- Implementácia agentov pre zákazníkov a inventár

#### Učebné zdroje
- [Riešenie pre maloobchod s viacerými agentmi](examples/retail-scenario.md) - Kompletná implementácia
- [ARM balík šablón](../../examples/retail-multiagent-arm-template) - Nasadenie jedným kliknutím
- Vzory koordinácie agentov

#### Praktický výsledok
Nasadiť a spravovať produkčne pripravené AI riešenie s viacerými agentmi

---

### Kapitola 6: Validácia a plánovanie pred nasadením (1 hodina) 🔍
**Predpoklady**: Dokončená kapitola 4  
**Náročnosť**: ⭐⭐

#### Čo sa naučíte
- Plánovanie kapacity a validácia zdrojov
- Stratégie výberu SKU
- Automatizované kontroly pred nasadením
- Plánovanie optimalizácie nákladov

#### Učebné zdroje
- [Plánovanie kapacity](docs/pre-deployment/capacity-planning.md) - Validácia zdrojov
- [Výber SKU](docs/pre-deployment/sku-selection.md) - Nákladovo efektívne možnosti
- [Kontroly pred nasadením](docs/pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktický výsledok
Validovať a optimalizovať nasadenia pred ich vykonaním

---

### Kapitola 7: Riešenie problémov a ladenie (1-1,5 hodiny) 🔧
**Predpoklady**: Dokončená akákoľvek kapitola o nasadzovaní  
**Náročnosť**: ⭐⭐

#### Čo sa naučíte
- Systematické prístupy k ladeniu
- Bežné problémy a ich riešenia
- AI-špecifické riešenie problémov
- Optimalizácia výkonu

#### Učebné zdroje
- [Bežné problémy](docs/troubleshooting/common-issues.md) - FAQ a riešenia
- [Príručka ladenia](docs/troubleshooting/debugging.md) - Krok za krokom
- [AI-špecifické riešenie problémov](docs/troubleshooting/ai-troubleshooting.md) - Problémy s AI službami

#### Praktický výsledok
Samostatne diagnostikovať a riešiť bežné problémy s nasadzovaním

---

### Kapitola 8: Produkčné a podnikové vzory (2-3 hodiny) 🏢
**Predpoklady**: Dokončené kapitoly 1-4  
**Náročnosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Stratégie nasadzovania do produkcie
- Podnikové bezpečnostné vzory
- Monitorovanie a optimalizácia nákladov
- Škálovateľnosť a správa

#### Učebné zdroje
- [Najlepšie postupy pre produkčné AI](docs/ai-foundry/production-ai-practices.md) - Podnikové vzory
- Príklady mikroslužieb a podnikových riešení
- Rámce pre monitorovanie a správu

#### Praktický výsledok
Nasadiť podnikovo pripravené aplikácie s plnými produkčnými schopnosťami

---

## Postup učenia a náročnosť

### Postupné budovanie zručností

- **🌱 Začiatočníci**: Začnite s Kapitolou 1 (Základy) → Kapitola 2 (AI vývoj)
- **🔧 Stredne pokročilí**: Kapitoly 3-4 (Konfigurácia a infraštruktúra) → Kapitola 6 (Validácia)
- **🚀 Pokročilí**: Kapitola 5 (Riešenia s viacerými agentmi) → Kapitola 7 (Riešenie problémov)
- **🏢 Podniková úroveň**: Dokončite všetky kapitoly, zamerajte sa na Kapitolu 8 (Produkčné vzory)

### Indikátory náročnosti

- **⭐ Základné**: Jednoduché koncepty, vedené tutoriály, 30-60 minút
- **⭐⭐ Stredne pokročilé**: Viac konceptov, praktické cvičenia, 1-2 hodiny  
- **⭐⭐⭐ Pokročilé**: Komplexné architektúry, vlastné riešenia, 1-3 hodiny
- **⭐⭐⭐⭐ Expertné**: Produkčné systémy, podnikové vzory, 2-4 hodiny

### Flexibilné učebné cesty

#### 🎯 Rýchla cesta pre AI vývojárov (4-6 hodín)
1. **Kapitola 1**: Základy a rýchly štart (45 minút)
2. **Kapitola 2**: Vývoj orientovaný na AI (2 hodiny)  
3. **Kapitola 5**: AI riešenia s viacerými agentmi (3 hodiny)
4. **Kapitola 8**: Najlepšie postupy pre produkčné AI (1 hodina)

#### 🛠️ Cesta pre špecialistov na infraštruktúru (5-7 hodín)
1. **Kapitola 1**: Základy a rýchly štart (45 minút)
2. **Kapitola 3**: Konfigurácia a autentifikácia (1 hodina)
3. **Kapitola 4**: Infrastruktúra ako kód a nasadzovanie (1,5 hodiny)
4. **Kapitola 6**: Validácia a plánovanie pred nasadením (1 hodina)
5. **Kapitola 7**: Riešenie problémov a ladenie (1,5 hodiny)
6. **Kapitola 8**: Produkčné a podnikové vzory (2 hodiny)

#### 🎓 Kompletná učebná cesta (8-12 hodín)
Postupné dokončenie všetkých 8 kapitol s praktickými cvičeniami a validáciou

## Rámec na dokončenie kurzu

### Validácia vedomostí
- **Kontrolné body kapitol**: Praktické cvičenia s merateľnými výsledkami
- **Praktická verifikácia**: Nasadenie funkčných riešení pre každú kapitolu
- **Sledovanie pokroku**: Vizualizácia pokroku a odznaky za dokončenie
- **Validácia komunity**: Zdieľanie skúseností v Azure Discord kanáloch

### Hodnotenie výsledkov učenia

#### Dokončenie kapitol 1-2 (Základy + AI)
- ✅ Nasadiť základnú webovú aplikáciu pomocou AZD
- ✅ Nasadiť AI aplikáciu na chat s RAG
- ✅ Pochopiť základné koncepty AZD a integráciu AI

#### Dokončenie kapitol 3-4 (Konfigurácia + infraštruktúra)  
- ✅ Spravovať nasadzovanie vo viacerých prostrediach
- ✅ Vytvoriť vlastné šablóny infraštruktúry pomocou Bicepu
- ✅ Implementovať bezpečné autentifikačné vzory

#### Dokončenie kapitol 5-6 (Viac agentov + validácia)
- ✅ Nasadiť komplexné AI riešenie s viacerými agentmi
- ✅ Vykonať plánovanie kapacity a optimalizáciu nákladov
- ✅ Implementovať automatizovanú validáciu pred nasadením

#### Dokončenie kapitol 7-8 (Riešenie problémov + produkcia)
- ✅ Samostatne diagnostikovať a riešiť problémy s nasadzovaním  
- ✅ Implementovať podnikové monitorovanie a bezpečnosť
- ✅ Nasadiť produkčne pripravené aplikácie so správou

### Certifikácia a uznanie
- **Odznak za dokončenie kurzu**: Dokončenie všetkých 8 kapitol s praktickou validáciou
- **Uznanie komunity**: Aktívna účasť v Azure AI Foundry Discord
- **Profesionálny rozvoj**: Relevantné zručnosti pre nasadzovanie AZD a AI
- **Kariérny postup**: Schopnosti na nasadzovanie cloudových riešení pripravených na podnikové prostredie

## Vhodnosť obsahu pre moderných vývojárov

### Technická hĺbka a pokrytie
- **Integrácia Azure OpenAI**: Kompletné pokrytie GPT-4o, embeddings a nasadzovania viacerých modelov
- **Vzory AI architektúry**: Implementácie RAG, orchestrácia viacerých agentov a produkčné AI pracovné postupy
- **Infrastruktúra ako kód**: Šablóny Bicep, nasadzovanie ARM a automatizované provisionovanie
- **Produkčná pripravenosť**: Bezpečnosť, škálovanie, monitorovanie, optimalizácia nákladov a správa
- **Podnikové vzory**: Nasadzovanie vo viacerých prostrediach, integrácia CI/CD a rámce pre súlad

### Praktické zameranie učenia
- **Automatizácia nasadzovania**: Dôraz na praktické pracovné postupy AZD, nie teoretické koncepty
- **Reálne scenáre**: Kompletné riešenie pre maloobchod s viacerými agentmi pre zákazníkov a inventár
- **Produkčné príklady**: Balíky ARM šablón, nasadzovanie jedným kliknutím a podnikové vzory
- **Zručnosti riešenia problémov**: AI-špecifické ladenie, diagnostika viacerých služieb a optimalizácia výkonu
- **Relevancia pre priemysel**: Na základe spätnej väzby komunity Azure AI Foundry a podnikových požiadaviek

### Integrácia komunity a podpory
- **Integrácia Discordu**: Aktívna účasť v komunitách Azure AI Foundry a Microsoft Azure
- **Diskusie na GitHube**: Spoločné učenie a riešenie problémov s kolegami a odborníkmi
- **Prístup k odborníkom**: Priame spojenie s inžiniermi Microsoftu a špecialistami na nasadzovanie AI
- **Priebežné aktualizácie**: Obsah kurzu sa vyvíja s aktualizáciami platformy Azure a spätnou väzbou komunity
- **Kariérny rozvoj**: Zručnosti priamo aplikovateľné na moderné cloudové a AI vývojárske úlohy

### Validácia výsledkov učenia
- **Merateľné zručnosti**: Každá kapitola obsahuje praktické cvičenia s overiteľnými výsledkami
- **Rozvoj portfólia**: Kompletné projekty vhodné pre profesionálne portfóliá a pracovné pohovory
- **Uznanie v priemysle**: Zručnosti zodpovedajú aktuálnym požiadavkám trhu práce pre AZD a nasadzovanie AI
- **Profesionálna sieť**: Prístup do komunity vývojárov Azure pre kariérny postup a spoluprácu

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.