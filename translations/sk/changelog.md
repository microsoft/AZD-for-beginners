# Zmeny - AZD pre začiatočníkov

## Úvod

Tento zoznam zmien dokumentuje všetky významné zmeny, aktualizácie a vylepšenia v repozitári AZD pre začiatočníkov. Dodržiavame princípy semantického verzovania a udržiavame tento log, aby sme používateľom pomohli pochopiť, čo sa zmenilo medzi jednotlivými verziami.

## Ciele učenia

Preskúmaním tohto zoznamu zmien:
- Získate informácie o nových funkciách a pridanom obsahu
- Pochopíte vylepšenia existujúcej dokumentácie
- Sledujete opravy chýb a zabezpečujete presnosť
- Sledujete vývoj vzdelávacích materiálov v priebehu času

## Výsledky učenia

Po preskúmaní záznamov zmien budete schopní:
- Identifikovať nový obsah a zdroje dostupné na učenie
- Pochopiť, ktoré sekcie boli aktualizované alebo vylepšené
- Naplánovať si svoju vzdelávaciu cestu na základe najaktuálnejších materiálov
- Poskytnúť spätnú väzbu a návrhy na budúce vylepšenia

## História verzií

### [v3.8.0] - 2025-11-19

#### Pokročilá dokumentácia: Monitorovanie, bezpečnosť a vzory pre koordináciu viacerých agentov
**Táto verzia pridáva komplexné lekcie na integráciu Application Insights, autentifikačné vzory a koordináciu viacerých agentov pre produkčné nasadenia.**

#### Pridané
- **📊 Lekcia o integrácii Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Nasadenie zamerané na AZD s automatickým zriadením
  - Kompletné Bicep šablóny pre Application Insights + Log Analytics
  - Funkčné Python aplikácie s vlastnou telemetriou (1 200+ riadkov)
  - Vzory monitorovania AI/LLM (sledovanie tokenov/nákladov Azure OpenAI)
  - 6 diagramov Mermaid (architektúra, distribuované sledovanie, tok telemetrie)
  - 3 praktické cvičenia (výstrahy, dashboardy, monitorovanie AI)
  - Príklady Kusto dotazov a stratégie optimalizácie nákladov
  - Streamovanie živých metrík a ladenie v reálnom čase
  - Čas učenia 40-50 minút s produkčne pripravenými vzormi

- **🔐 Lekcia o autentifikačných a bezpečnostných vzoroch**: v `docs/getting-started/authsecurity.md`:
  - 3 autentifikačné vzory (connection strings, Key Vault, managed identity)
  - Kompletné Bicep šablóny infraštruktúry pre bezpečné nasadenia
  - Node.js kód aplikácie s integráciou Azure SDK
  - 3 kompletné cvičenia (aktivácia managed identity, user-assigned identity, rotácia Key Vault)
  - Najlepšie bezpečnostné postupy a konfigurácie RBAC
  - Príručka na riešenie problémov a analýza nákladov
  - Produkčne pripravené vzory autentifikácie bez hesiel

- **🤖 Lekcia o vzoroch koordinácie viacerých agentov**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorov koordinácie (sekvenčné, paralelné, hierarchické, event-driven, konsenzus)
  - Kompletná implementácia orchestrátora služby (Python/Flask, 1 500+ riadkov)
  - 3 špecializované implementácie agentov (Výskum, Písanie, Editovanie)
  - Integrácia Service Bus pre frontovanie správ
  - Cosmos DB na správu stavu distribuovaných systémov
  - 6 diagramov Mermaid zobrazujúcich interakcie agentov
  - 3 pokročilé cvičenia (spracovanie timeoutov, retry logika, circuit breaker)
  - Rozpis nákladov ($240-565/mesiac) so stratégiami optimalizácie
  - Integrácia Application Insights pre monitorovanie

#### Vylepšené
- **Kapitola pred nasadením**: Teraz zahŕňa komplexné vzory monitorovania a koordinácie
- **Kapitola Začíname**: Vylepšená o profesionálne autentifikačné vzory
- **Pripravenosť na produkciu**: Kompletné pokrytie od bezpečnosti po observabilitu
- **Osnova kurzu**: Aktualizovaná na odkazovanie na nové lekcie v kapitolách 3 a 6

#### Zmenené
- **Progresia učenia**: Lepšia integrácia bezpečnosti a monitorovania v celom kurze
- **Kvalita dokumentácie**: Konzistentné štandardy A-grade (95-97%) v nových lekciách
- **Produkčné vzory**: Kompletné pokrytie od začiatku do konca pre podnikové nasadenia

#### Zlepšené
- **Skúsenosť vývojára**: Jasná cesta od vývoja po monitorovanie produkcie
- **Bezpečnostné štandardy**: Profesionálne vzory pre autentifikáciu a správu tajomstiev
- **Observabilita**: Kompletná integrácia Application Insights s AZD
- **AI pracovné zaťaženia**: Špecializované monitorovanie pre Azure OpenAI a systémy viacerých agentov

#### Validované
- ✅ Všetky lekcie obsahujú kompletný funkčný kód (nie útržky)
- ✅ Diagramy Mermaid pre vizuálne učenie (celkovo 19 v 3 lekciách)
- ✅ Praktické cvičenia s overovacími krokmi (celkovo 9)
- ✅ Produkčne pripravené Bicep šablóny nasaditeľné cez `azd up`
- ✅ Analýza nákladov a stratégie optimalizácie
- ✅ Príručky na riešenie problémov a najlepšie postupy
- ✅ Kontrolné body znalostí s overovacími príkazmi

#### Výsledky hodnotenia dokumentácie
- **docs/pre-deployment/application-insights.md**: - Komplexný sprievodca monitorovaním
- **docs/getting-started/authsecurity.md**: - Profesionálne bezpečnostné vzory
- **docs/pre-deployment/coordination-patterns.md**: - Pokročilé architektúry viacerých agentov
- **Celkový nový obsah**: - Konzistentné vysokokvalitné štandardy

#### Technická implementácia
- **Application Insights**: Log Analytics + vlastná telemetria + distribuované sledovanie
- **Autentifikácia**: Managed Identity + Key Vault + RBAC vzory
- **Viac agentov**: Service Bus + Cosmos DB + Container Apps + orchestrácia
- **Monitorovanie**: Živé metriky + Kusto dotazy + výstrahy + dashboardy
- **Správa nákladov**: Stratégie vzorkovania, politiky uchovávania, kontrola rozpočtu

### [v3.7.0] - 2025-11-19

#### Vylepšenia kvality dokumentácie a nový príklad Azure OpenAI
**Táto verzia zlepšuje kvalitu dokumentácie v celom repozitári a pridáva kompletný príklad nasadenia Azure OpenAI s rozhraním GPT-4 chat.**

#### Pridané
- **🤖 Príklad Azure OpenAI Chat**: Kompletné nasadenie GPT-4 s funkčnou implementáciou v `examples/azure-openai-chat/`:
  - Kompletná infraštruktúra Azure OpenAI (nasadenie modelu GPT-4)
  - Python príkazové rozhranie chatu s históriou konverzácií
  - Integrácia Key Vault pre bezpečné ukladanie API kľúčov
  - Sledovanie používania tokenov a odhad nákladov
  - Obmedzovanie rýchlosti a spracovanie chýb
  - Komplexný README s 35-45 minútovým sprievodcom nasadením
  - 11 produkčne pripravených súborov (Bicep šablóny, Python aplikácia, konfigurácia)
- **📚 Cvičenia dokumentácie**: Pridané praktické cvičenia do sprievodcu konfiguráciou:
  - Cvičenie 1: Konfigurácia pre viac prostredí (15 minút)
  - Cvičenie 2: Prax v správe tajomstiev (10 minút)
  - Jasné kritériá úspechu a overovacie kroky
- **✅ Overenie nasadenia**: Pridaná sekcia overenia do sprievodcu nasadením:
  - Postupy kontroly stavu
  - Kontrolný zoznam kritérií úspechu
  - Očakávané výstupy pre všetky príkazy nasadenia
  - Rýchla referenčná príručka na riešenie problémov

#### Vylepšené
- **examples/README.md**: Aktualizované na kvalitu A-grade (93%):
  - Pridaný azure-openai-chat do všetkých relevantných sekcií
  - Aktualizovaný počet lokálnych príkladov z 3 na 4
  - Pridané do tabuľky príkladov AI aplikácií
  - Integrované do rýchleho štartu pre stredne pokročilých používateľov
  - Pridané do sekcie šablón Azure AI Foundry
  - Aktualizovaná porovnávacia matica a sekcie technologických nálezov
- **Kvalita dokumentácie**: Zlepšená z B+ (87%) → A- (92%) v priečinku docs:
  - Pridané očakávané výstupy k dôležitým príkazovým príkladom
  - Zahrnuté overovacie kroky pre zmeny konfigurácie
  - Vylepšené praktické učenie s praktickými cvičeniami

#### Zmenené
- **Progresia učenia**: Lepšia integrácia AI príkladov pre stredne pokročilých študentov
- **Štruktúra dokumentácie**: Viac akčných cvičení s jasnými výsledkami
- **Proces overenia**: Explicitné kritériá úspechu pridané k hlavným pracovným postupom

#### Zlepšené
- **Skúsenosť vývojára**: Nasadenie Azure OpenAI teraz trvá 35-45 minút (oproti 60-90 pri zložitých alternatívach)
- **Transparentnosť nákladov**: Jasné odhady nákladov ($50-200/mesiac) pre príklad Azure OpenAI
- **Cesta učenia**: AI vývojári majú jasný vstupný bod s azure-openai-chat
- **Štandardy dokumentácie**: Konzistentné očakávané výstupy a overovacie kroky

#### Validované
- ✅ Príklad Azure OpenAI plne funkčný s `azd up`
- ✅ Všetkých 11 implementačných súborov syntakticky správnych
- ✅ Pokyny README zodpovedajú skutočnej skúsenosti s nasadením
- ✅ Odkazy na dokumentáciu aktualizované na 8+ miestach
- ✅ Index príkladov presne odráža 4 lokálne príklady
- ✅ Žiadne duplicitné externé odkazy v tabuľkách
- ✅ Všetky navigačné odkazy správne

#### Technická implementácia
- **Architektúra Azure OpenAI**: GPT-4 + Key Vault + Container Apps vzor
- **Bezpečnosť**: Pripravené na Managed Identity, tajomstvá v Key Vault
- **Monitorovanie**: Integrácia Application Insights
- **Správa nákladov**: Sledovanie tokenov a optimalizácia používania
- **Nasadenie**: Jediný príkaz `azd up` pre kompletné nastavenie

### [v3.6.0] - 2025-11-19

#### Veľká aktualizácia: Príklady nasadenia aplikácií v kontajneroch
**Táto verzia predstavuje komplexné, produkčne pripravené príklady nasadenia aplikácií v kontajneroch pomocou Azure Developer CLI (AZD), s kompletnou dokumentáciou a integráciou do vzdelávacej cesty.**

#### Pridané
- **🚀 Príklady aplikácií v kontajneroch**: Nové lokálne príklady v `examples/container-app/`:
  - [Hlavný sprievodca](examples/container-app/README.md): Kompletný prehľad kontajnerizovaných nasadení, rýchly štart, produkcia a pokročilé vzory
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api): REST API priateľské pre začiatočníkov s scale-to-zero, sondami zdravia, monitorovaním a riešením problémov
  - [Architektúra mikroservisov](../../examples/container-app/microservices): Produkčne pripravené nasadenie viacerých služieb (API Gateway, Product, Order, User, Notification), asynchrónne správy, Service Bus, Cosmos DB, Azure SQL, distribuované sledovanie, blue-green/canary nasadenie
- **Najlepšie postupy**: Bezpečnosť, monitorovanie, optimalizácia nákladov a pokyny pre CI/CD pre kontajnerizované pracovné zaťaženia
- **Ukážky kódu**: Kompletné `azure.yaml`, Bicep šablóny a implementácie služieb v rôznych jazykoch (Python, Node.js, C#, Go)
- **Testovanie a riešenie problémov**: Scenáre end-to-end testov, monitorovacie príkazy, pokyny na riešenie problémov

#### Zmenené
- **README.md**: Aktualizované na zobrazenie a odkazovanie na nové príklady aplikácií v kontajneroch pod "Lokálne príklady - Aplikácie v kontajneroch"
- **examples/README.md**: Aktualizované na zvýraznenie príkladov aplikácií v kontajneroch, pridanie položiek do porovnávacej matice a aktualizáciu technologických/architektonických odkazov
- **Osnova kurzu a študijný sprievodca**: Aktualizované na odkazovanie na nové príklady aplikácií v kontajneroch a vzory nasadenia v relevantných kapitolách

#### Validované
- ✅ Všetky nové príklady nasaditeľné s `azd up` a dodržiavajú najlepšie postupy
- ✅ Dokumentačné krížové odkazy a navigácia aktualizované
- ✅ Príklady pokrývajú scenáre od začiatočníkov po pokročilých, vrátane produkčných mikroservisov

#### Poznámky
- **Rozsah**: Dokumentácia a príklady len v angličtine
- **Ďalšie kroky**: Rozšírenie o ďalšie pokročilé vzory kontajnerov a automatizáciu CI/CD v budúcich verziách

### [v3.5.0] - 2025-11-19

#### Rebranding produktu: Microsoft Foundry
**Táto verzia implementuje komplexnú zmenu názvu produktu z "Azure AI Foundry" na "Microsoft Foundry" v celej anglickej dokumentácii, odrážajúc oficiálny rebranding Microsoftu.**

#### Zmenené
- **🔄 Aktualizácia názvu produktu**: Kompletný rebranding z "Azure AI Foundry" na "Microsoft Foundry"
  - Aktualizované všetky odkazy v anglickej dokumentácii v priečinku `docs/`
  - Premenovaný priečinok: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Premenovaný súbor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Celkovo: 23 obsahových odkazov aktualizovaných v 7 dokumentačných súboroch

- **📁 Zmeny štruktúry priečinkov**:
  - `docs/ai-foundry/` premenované na `docs/microsoft-foundry/`
  - Všetky krížové odkazy aktualizované na odrážanie novej štruktúry priečinkov
  - Navigačné odkazy validované v celej dokumentácii

- **📄 Premenovanie súborov**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Všetky interné odkazy aktualizované na odkazovanie na nový názov súboru

#### Aktualizované súbory
- **Dokumentácia kapitol** (7 súborov):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizácie navigačných odkazov
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 aktualizácie odkazov na názov produktu
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Už používa Microsoft Foundry (z predchádzajúcich aktualizácií)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 aktualizácie odkazov (prehľad, spätná väzba komunity, dokumentácia)
  - `docs/getting-started/azd-basics.md` - 4 aktualizácie kríž
- **Workshop**: Materiály workshopu (`workshop/`) neboli v tejto verzii aktualizované
- **Príklady**: Súborové príklady môžu stále odkazovať na staré názvy (bude riešené v budúcej aktualizácii)
- **Externé odkazy**: Externé URL adresy a odkazy na GitHub repository zostávajú nezmenené

#### Príručka pre migráciu pre prispievateľov
Ak máte lokálne vetvy alebo dokumentáciu odkazujúcu na starú štruktúru:
1. Aktualizujte odkazy na priečinky: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aktualizujte odkazy na súbory: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Nahraďte názov produktu: "Azure AI Foundry" → "Microsoft Foundry"
4. Overte, že všetky interné odkazy v dokumentácii stále fungujú

---

### [v3.4.0] - 2025-10-24

#### Náhľad infraštruktúry a vylepšenia validácie
**Táto verzia prináša komplexnú podporu pre novú funkciu náhľadu Azure Developer CLI a zlepšuje používateľskú skúsenosť workshopov.**

#### Pridané
- **🧪 Dokumentácia funkcie azd provision --preview**: Komplexné pokrytie novej schopnosti náhľadu infraštruktúry
  - Referencia príkazov a príklady použitia v cheat sheet
  - Detailná integrácia v príručke pre provisioning s prípadmi použitia a výhodami
  - Integrácia kontroly pred nasadením pre bezpečnejšiu validáciu
  - Aktualizácie príručky pre začiatok s bezpečnými postupmi nasadenia
- **🚧 Banner stavu workshopu**: Profesionálny HTML banner indikujúci stav vývoja workshopu
  - Dizajn s gradientom a indikátormi výstavby pre jasnú komunikáciu s používateľmi
  - Časová pečiatka poslednej aktualizácie pre transparentnosť
  - Responzívny dizajn pre všetky typy zariadení

#### Vylepšené
- **Bezpečnosť infraštruktúry**: Funkcia náhľadu integrovaná do celej dokumentácie nasadenia
- **Validácia pred nasadením**: Automatizované skripty teraz zahŕňajú testovanie náhľadu infraštruktúry
- **Workflow vývojára**: Aktualizované sekvencie príkazov zahŕňajú náhľad ako najlepší postup
- **Skúsenosť workshopu**: Jasne stanovené očakávania pre používateľov o stave vývoja obsahu

#### Zmenené
- **Najlepšie postupy nasadenia**: Workflow s náhľadom je teraz odporúčaný prístup
- **Tok dokumentácie**: Validácia infraštruktúry presunutá na začiatok procesu učenia
- **Prezentácia workshopu**: Profesionálna komunikácia stavu s jasnou časovou osou vývoja

#### Zlepšené
- **Prístup bezpečnosti na prvom mieste**: Zmeny infraštruktúry je teraz možné validovať pred nasadením
- **Tímová spolupráca**: Výsledky náhľadu je možné zdieľať na preskúmanie a schválenie
- **Povedomie o nákladoch**: Lepšie pochopenie nákladov na zdroje pred provisioningom
- **Zníženie rizika**: Znížené zlyhania nasadenia vďaka predbežnej validácii

#### Technická implementácia
- **Integrácia viacerých dokumentov**: Funkcia náhľadu zdokumentovaná v 4 kľúčových súboroch
- **Vzory príkazov**: Konzistentná syntax a príklady v celej dokumentácii
- **Integrácia najlepších postupov**: Náhľad zahrnutý vo validáciách workflowov a skriptov
- **Vizualizácia**: Jasné označenie NOVÝCH funkcií pre lepšiu objaviteľnosť

#### Infraštruktúra workshopu
- **Komunikácia stavu**: Profesionálny HTML banner s gradientovým štýlom
- **Používateľská skúsenosť**: Jasný stav vývoja zabraňuje zmätku
- **Profesionálna prezentácia**: Udržiava dôveryhodnosť repository a stanovuje očakávania
- **Transparentnosť časovej osi**: Časová pečiatka poslednej aktualizácie z októbra 2025 pre zodpovednosť

### [v3.3.0] - 2025-09-24

#### Vylepšené materiály workshopu a interaktívna skúsenosť učenia
**Táto verzia prináša komplexné materiály workshopu s interaktívnymi prehliadačovými príručkami a štruktúrovanými cestami učenia.**

#### Pridané
- **🎥 Interaktívna príručka workshopu**: Prehliadačová skúsenosť workshopu s funkciou náhľadu MkDocs
- **📝 Štruktúrované pokyny workshopu**: 7-kroková cesta učenia od objavenia po prispôsobenie
  - 0-Úvod: Prehľad workshopu a nastavenie
  - 1-Výber-AI-Šablóny: Proces objavenia a výberu šablóny
  - 2-Validácia-AI-Šablóny: Postupy nasadenia a validácie
  - 3-Deštrukcia-AI-Šablóny: Pochopenie architektúry šablóny
  - 4-Konfigurácia-AI-Šablóny: Konfigurácia a prispôsobenie
  - 5-Prispôsobenie-AI-Šablóny: Pokročilé úpravy a iterácie
  - 6-Odstránenie-Infraštruktúry: Čistenie a správa zdrojov
  - 7-Zhrnutie: Zhrnutie a ďalšie kroky
- **🛠️ Nástroje workshopu**: Konfigurácia MkDocs s Material témou pre vylepšenú skúsenosť učenia
- **🎯 Praktická cesta učenia**: 3-kroková metodológia (Objavenie → Nasadenie → Prispôsobenie)
- **📱 Integrácia GitHub Codespaces**: Bezproblémové nastavenie vývojového prostredia

#### Vylepšené
- **AI Workshop Lab**: Rozšírený o komplexnú 2-3 hodinovú štruktúrovanú skúsenosť učenia
- **Dokumentácia workshopu**: Profesionálna prezentácia s navigáciou a vizuálnymi pomôckami
- **Postup učenia**: Jasné krok za krokom pokyny od výberu šablóny po nasadenie do produkcie
- **Skúsenosť vývojára**: Integrované nástroje pre zjednodušené workflowy vývoja

#### Zlepšené
- **Prístupnosť**: Prehliadačové rozhranie s vyhľadávaním, funkciou kopírovania a prepínačom témy
- **Samostatné učenie**: Flexibilná štruktúra workshopu prispôsobená rôznym rýchlostiam učenia
- **Praktická aplikácia**: Scenáre nasadenia AI šablón v reálnom svete
- **Integrácia komunity**: Integrácia Discordu pre podporu workshopu a spoluprácu

#### Funkcie workshopu
- **Vstavané vyhľadávanie**: Rýchle objavenie kľúčových slov a lekcií
- **Kopírovanie blokov kódu**: Funkcia kopírovania na všetky príklady kódu
- **Prepínač témy**: Podpora tmavého/svetlého režimu pre rôzne preferencie
- **Vizuálne prvky**: Screenshoty a diagramy pre lepšie pochopenie
- **Integrácia pomoci**: Priamy prístup na Discord pre podporu komunity

### [v3.2.0] - 2025-09-17

#### Hlavná reštrukturalizácia navigácie a systém učenia založený na kapitolách
**Táto verzia prináša komplexnú štruktúru učenia založenú na kapitolách s vylepšenou navigáciou v celom repository.**

#### Pridané
- **📚 Systém učenia založený na kapitolách**: Reštrukturalizácia celého kurzu do 8 progresívnych kapitol učenia
  - Kapitola 1: Základy & Rýchly štart (⭐ - 30-45 minút)
  - Kapitola 2: AI-Prvé vývojové prostredie (⭐⭐ - 1-2 hodiny)
  - Kapitola 3: Konfigurácia & Autentifikácia (⭐⭐ - 45-60 minút)
  - Kapitola 4: Infraštruktúra ako kód & Nasadenie (⭐⭐⭐ - 1-1.5 hodiny)
  - Kapitola 5: Multi-agentné AI riešenia (⭐⭐⭐⭐ - 2-3 hodiny)
  - Kapitola 6: Validácia pred nasadením & Plánovanie (⭐⭐ - 1 hodina)
  - Kapitola 7: Riešenie problémov & Ladenie (⭐⭐ - 1-1.5 hodiny)
  - Kapitola 8: Produkcia & Podnikové vzory (⭐⭐⭐⭐ - 2-3 hodiny)
- **📚 Komplexný navigačný systém**: Konzistentné navigačné hlavičky a päty vo všetkej dokumentácii
- **🎯 Sledovanie pokroku**: Kontrolný zoznam dokončenia kurzu a systém overovania učenia
- **🗺️ Usmernenie cesty učenia**: Jasné vstupné body pre rôzne úrovne skúseností a ciele
- **🔗 Navigácia medzi kapitolami**: Jasne prepojené súvisiace kapitoly a predpoklady

#### Vylepšené
- **Štruktúra README**: Transformovaná na štruktúrovanú platformu učenia s organizáciou založenou na kapitolách
- **Navigácia dokumentácie**: Každá stránka teraz obsahuje kontext kapitoly a usmernenie pre postup
- **Organizácia šablón**: Príklady a šablóny mapované na príslušné kapitoly učenia
- **Integrácia zdrojov**: Cheat sheet, FAQ a študijné príručky prepojené s relevantnými kapitolami
- **Integrácia workshopu**: Praktické laboratóriá mapované na viacero cieľov učenia kapitol

#### Zmenené
- **Postup učenia**: Presunuté z lineárnej dokumentácie na flexibilné učenie založené na kapitolách
- **Umiestnenie konfigurácie**: Presunutá príručka konfigurácie ako Kapitola 3 pre lepší tok učenia
- **Integrácia AI obsahu**: Lepšia integrácia AI špecifického obsahu v celej ceste učenia
- **Obsah produkcie**: Pokročilé vzory konsolidované v Kapitole 8 pre podnikových študentov

#### Zlepšené
- **Používateľská skúsenosť**: Jasné navigačné stopy a indikátory postupu kapitol
- **Prístupnosť**: Konzistentné navigačné vzory pre jednoduchšie prechádzanie kurzom
- **Profesionálna prezentácia**: Univerzitný štýl štruktúry kurzu vhodný pre akademické a firemné školenia
- **Efektivita učenia**: Znížený čas na nájdenie relevantného obsahu vďaka vylepšenej organizácii

#### Technická implementácia
- **Navigačné hlavičky**: Štandardizovaná navigácia kapitol vo viac ako 40 dokumentačných súboroch
- **Navigácia v päte**: Konzistentné usmernenie pre postup a indikátory dokončenia kapitol
- **Prepojenie medzi kapitolami**: Komplexný interný systém prepojenia spájajúci súvisiace koncepty
- **Mapovanie kapitol**: Šablóny a príklady jasne spojené s cieľmi učenia

#### Vylepšenie študijných príručiek
- **📚 Komplexné ciele učenia**: Reštrukturalizovaná študijná príručka v súlade so systémom 8 kapitol
- **🎯 Hodnotenie založené na kapitolách**: Každá kapitola obsahuje špecifické ciele učenia a praktické cvičenia
- **📋 Sledovanie pokroku**: Týždenný plán učenia s merateľnými výsledkami a kontrolnými zoznamami dokončenia
- **❓ Otázky na hodnotenie**: Validácia znalostí pre každú kapitolu s profesionálnymi výsledkami
- **🛠️ Praktické cvičenia**: Praktické aktivity s reálnymi scenármi nasadenia a riešenia problémov
- **📊 Postup zručností**: Jasný pokrok od základných konceptov po podnikové vzory s dôrazom na kariérny rozvoj
- **🎓 Rámec certifikácie**: Profesionálne výsledky rozvoja a systém uznania komunity
- **⏱️ Riadenie časovej osi**: Štruktúrovaný 10-týždňový plán učenia s validáciou míľnikov

### [v3.1.0] - 2025-09-17

#### Vylepšené multi-agentné AI riešenia
**Táto verzia zlepšuje multi-agentné riešenie pre maloobchod s lepším pomenovaním agentov a vylepšenou dokumentáciou.**

#### Zmenené
- **Terminológia multi-agentov**: Nahradený "Cora agent" za "Customer agent" v celom riešení pre maloobchod pre jasnejšie pochopenie
- **Architektúra agentov**: Aktualizovaná dokumentácia, ARM šablóny a príklady kódu na používanie konzistentného pomenovania "Customer agent"
- **Príklady konfigurácie**: Modernizované vzory konfigurácie agentov s aktualizovanými názvami
- **Konzistencia dokumentácie**: Zabezpečené, že všetky odkazy používajú profesionálne, popisné názvy agentov

#### Vylepšené
- **Balík ARM šablón**: Aktualizovaná retail-multiagent-arm-template s odkazmi na Customer agent
- **Diagramy architektúry**: Obnovené diagramy Mermaid s aktualizovaným pomenovaním agentov
- **Príklady kódu**: Triedy Pythonu a implementačné príklady teraz používajú pomenovanie CustomerAgent
- **Premenné prostredia**: Aktualizované všetky skripty nasadenia na používanie konvencií CUSTOMER_AGENT_NAME

#### Zlepšené
- **Skúsenosť vývojára**: Jasnejšie úlohy a zodpovednosti agentov v dokumentácii
- **Pripravenosť na produkciu**: Lepšie zosúladenie s podnikovými konvenciami pomenovania
- **Materiály učenia**: Intuitívnejšie pomenovanie agentov pre vzdelávacie účely
- **Použiteľnosť šablón**: Zjednodušené pochopenie funkcií agentov a vzorov nasadenia

#### Technické detaily
- Aktualizované diagramy architektúry Mermaid s odkazmi na CustomerAgent
- Nahradené názvy tried CoraAgent za CustomerAgent v príkladoch Pythonu
- Upravené konfigurácie ARM šablón JSON na používanie typu agenta "customer"
- Aktualizované premenné prostredia z CORA_AGENT_* na CUSTOMER_AGENT_* vzory
- Obnovené všetky príkazy nasadenia a konfigurácie kontajnerov

### [v3.0.0] - 2025-09-12

#### Hlavné zmeny - Zameranie na AI vývojárov a integrácia Azure AI Foundry
**Táto verzia transformuje repository na komplexný zdroj učenia zameraný na AI vývojárov s integráciou Azure AI Foundry.**

#### Pridané
- **🤖 AI-Prvá cesta učenia**: Kompletná reštrukturalizácia prioritizujúca AI vývojárov a inžinierov
- **Príručka integrácie Azure AI Foundry**: Komplexná dokumentácia pre pripojenie AZD k službám Azure AI Foundry
- **Vzory nasadenia AI modelov**: Detailná príručka pokrývajúca výber modelov, konfiguráciu a stratégie nasadenia do produkcie
- **AI Workshop Lab**: 2-3 hodinový praktický workshop na konverziu AI aplikácií na AZD-nasaditeľné riešenia
- **Najlepšie praktiky pre produkčné AI**: Vzory pripravené pre podniky na škálovanie, monitorovanie a zabezpečenie AI pracovných záťaží
-
- **Prezentácia obsahu**: Odstránené dekoratívne prvky v prospech jasného, profesionálneho formátovania
- **Štruktúra odkazov**: Aktualizované všetky interné odkazy na podporu nového navigačného systému

#### Vylepšené
- **Prístupnosť**: Odstránené závislosti na emoji pre lepšiu kompatibilitu so čítačkami obrazovky
- **Profesionálny vzhľad**: Čistá prezentácia v akademickom štýle vhodná pre podnikové vzdelávanie
- **Vzdelávacia skúsenosť**: Štruktúrovaný prístup s jasnými cieľmi a výsledkami pre každú lekciu
- **Organizácia obsahu**: Lepší logický tok a prepojenie medzi súvisiacimi témami

### [v1.0.0] - 2025-09-09

#### Počiatočné vydanie - Komplexný AZD vzdelávací repozitár

#### Pridané
- **Základná štruktúra dokumentácie**
  - Kompletná séria sprievodcov pre začínajúcich používateľov
  - Komplexná dokumentácia nasadenia a zriaďovania
  - Podrobné zdroje na riešenie problémov a návody na ladenie
  - Nástroje a postupy na validáciu pred nasadením

- **Modul pre začínajúcich používateľov**
  - Základy AZD: Kľúčové koncepty a terminológia
  - Sprievodca inštaláciou: Pokyny na nastavenie pre konkrétne platformy
  - Sprievodca konfiguráciou: Nastavenie prostredia a autentifikácia
  - Prvý projekt: Praktická výučba krok za krokom

- **Modul nasadenia a zriaďovania**
  - Sprievodca nasadením: Kompletná dokumentácia pracovného postupu
  - Sprievodca zriaďovaním: Infrastruktúra ako kód s Bicep
  - Najlepšie postupy pre produkčné nasadenia
  - Vzory architektúry pre viac služieb

- **Modul validácie pred nasadením**
  - Plánovanie kapacity: Validácia dostupnosti zdrojov Azure
  - Výber SKU: Komplexné pokyny pre výber úrovne služieb
  - Predletové kontroly: Automatizované validačné skripty (PowerShell a Bash)
  - Nástroje na odhad nákladov a plánovanie rozpočtu

- **Modul riešenia problémov**
  - Bežné problémy: Často sa vyskytujúce problémy a ich riešenia
  - Sprievodca ladením: Systematické metodológie riešenia problémov
  - Pokročilé diagnostické techniky a nástroje
  - Monitorovanie výkonu a optimalizácia

- **Zdroje a odkazy**
  - Cheat Sheet príkazov: Rýchly odkaz na základné príkazy
  - Slovník: Komplexné definície terminológie a skratiek
  - FAQ: Podrobné odpovede na bežné otázky
  - Odkazy na externé zdroje a spojenia s komunitou

- **Príklady a šablóny**
  - Príklad jednoduchej webovej aplikácie
  - Šablóna nasadenia statickej webovej stránky
  - Konfigurácia aplikácie v kontajneri
  - Vzory integrácie databáz
  - Príklady architektúry mikroslužieb
  - Implementácie serverless funkcií

#### Funkcie
- **Podpora viacerých platforiem**: Sprievodcovia inštaláciou a konfiguráciou pre Windows, macOS a Linux
- **Rôzne úrovne zručností**: Obsah určený pre študentov aj profesionálnych vývojárov
- **Praktické zameranie**: Praktické príklady a scenáre z reálneho sveta
- **Komplexné pokrytie**: Od základných konceptov po pokročilé podnikové vzory
- **Prístup orientovaný na bezpečnosť**: Najlepšie postupy v oblasti bezpečnosti integrované do celého obsahu
- **Optimalizácia nákladov**: Pokyny pre nákladovo efektívne nasadenia a správu zdrojov

#### Kvalita dokumentácie
- **Podrobné príklady kódu**: Praktické, testované ukážky kódu
- **Pokyny krok za krokom**: Jasné, akčné pokyny
- **Komplexné riešenie chýb**: Riešenie bežných problémov
- **Integrácia najlepších postupov**: Priemyselné štandardy a odporúčania
- **Kompatibilita verzií**: Aktualizované podľa najnovších služieb Azure a funkcií azd

## Plánované budúce vylepšenia

### Verzia 3.1.0 (Plánovaná)
#### Rozšírenie AI platformy
- **Podpora viacerých modelov**: Vzory integrácie pre Hugging Face, Azure Machine Learning a vlastné modely
- **Rámce AI agentov**: Šablóny pre nasadenia LangChain, Semantic Kernel a AutoGen
- **Pokročilé vzory RAG**: Možnosti databáz vektorov mimo Azure AI Search (Pinecone, Weaviate, atď.)
- **Pozorovateľnosť AI**: Vylepšené monitorovanie výkonu modelov, používania tokenov a kvality odpovedí

#### Skúsenosť vývojára
- **Rozšírenie VS Code**: Integrované prostredie AZD + AI Foundry
- **Integrácia GitHub Copilot**: Generovanie šablón AZD s pomocou AI
- **Interaktívne tutoriály**: Praktické cvičenia s automatizovanou validáciou pre AI scenáre
- **Video obsah**: Doplnkové video tutoriály pre vizuálnych študentov zamerané na nasadenia AI

### Verzia 4.0.0 (Plánovaná)
#### Podnikové vzory AI
- **Rámec správy**: Správa modelov AI, súlad a auditné stopy
- **AI pre viacerých nájomníkov**: Vzory pre poskytovanie služieb AI viacerým zákazníkom s izolovanými službami
- **Nasadenie AI na okraji**: Integrácia s Azure IoT Edge a kontajnerovými inštanciami
- **Hybridné cloudové AI**: Vzory nasadenia AI pracovných záťaží v multi-cloud a hybridnom prostredí

#### Pokročilé funkcie
- **Automatizácia AI pipeline**: Integrácia MLOps s pipeline Azure Machine Learning
- **Pokročilá bezpečnosť**: Vzory nulovej dôvery, privátne koncové body a pokročilá ochrana pred hrozbami
- **Optimalizácia výkonu**: Pokročilé stratégie ladenia a škálovania pre aplikácie AI s vysokou priepustnosťou
- **Globálna distribúcia**: Vzory doručovania obsahu a vyrovnávania záťaže pre aplikácie AI

### Verzia 3.0.0 (Plánovaná) - Nahradená aktuálnym vydaním
#### Navrhované doplnky - Teraz implementované vo verzii 3.0.0
- ✅ **Obsah zameraný na AI**: Komplexná integrácia Azure AI Foundry (Dokončené)
- ✅ **Interaktívne tutoriály**: Praktické laboratórium pre AI (Dokončené)
- ✅ **Pokročilý bezpečnostný modul**: Vzory bezpečnosti špecifické pre AI (Dokončené)
- ✅ **Optimalizácia výkonu**: Stratégie ladenia pracovných záťaží AI (Dokončené)

### Verzia 2.1.0 (Plánovaná) - Čiastočne implementovaná vo verzii 3.0.0
#### Menšie vylepšenia - Niektoré dokončené v aktuálnom vydaní
- ✅ **Ďalšie príklady**: Scenáre nasadenia zamerané na AI (Dokončené)
- ✅ **Rozšírené FAQ**: Otázky a riešenie problémov špecifické pre AI (Dokončené)
- **Integrácia nástrojov**: Rozšírené pokyny pre integráciu IDE a editorov
- ✅ **Rozšírené monitorovanie**: Vzory monitorovania a upozornení špecifické pre AI (Dokončené)

#### Stále plánované pre budúce vydanie
- **Dokumentácia prispôsobená mobilným zariadeniam**: Responzívny dizajn pre mobilné vzdelávanie
- **Offline prístup**: Balíčky dokumentácie na stiahnutie
- **Rozšírená integrácia IDE**: Rozšírenie VS Code pre pracovné postupy AZD + AI
- **Komunitný dashboard**: Metriky komunity v reálnom čase a sledovanie príspevkov

## Prispievanie do changelogu

### Hlásenie zmien
Pri prispievaní do tohto repozitára, prosím, zabezpečte, aby záznamy v changelogu obsahovali:

1. **Číslo verzie**: Podľa semantického verzovania (major.minor.patch)
2. **Dátum**: Dátum vydania alebo aktualizácie vo formáte YYYY-MM-DD
3. **Kategória**: Pridané, Zmenené, Zastaralé, Odstránené, Opravené, Bezpečnosť
4. **Jasný popis**: Stručný popis toho, čo sa zmenilo
5. **Hodnotenie dopadu**: Ako zmeny ovplyvňujú existujúcich používateľov

### Kategórie zmien

#### Pridané
- Nové funkcie, sekcie dokumentácie alebo schopnosti
- Nové príklady, šablóny alebo vzdelávacie zdroje
- Dodatočné nástroje, skripty alebo utility

#### Zmenené
- Úpravy existujúcej funkcionality alebo dokumentácie
- Aktualizácie na zlepšenie jasnosti alebo presnosti
- Preštruktúrovanie obsahu alebo organizácie

#### Zastaralé
- Funkcie alebo prístupy, ktoré sa postupne rušia
- Sekcie dokumentácie plánované na odstránenie
- Metódy, ktoré majú lepšie alternatívy

#### Odstránené
- Funkcie, dokumentácia alebo príklady, ktoré už nie sú relevantné
- Zastarané informácie alebo prístupy
- Redundantný alebo konsolidovaný obsah

#### Opravené
- Opravy chýb v dokumentácii alebo kóde
- Riešenie hlásených problémov alebo chýb
- Zlepšenia presnosti alebo funkčnosti

#### Bezpečnosť
- Vylepšenia alebo opravy súvisiace s bezpečnosťou
- Aktualizácie najlepších postupov v oblasti bezpečnosti
- Riešenie bezpečnostných zraniteľností

### Pokyny pre semantické verzovanie

#### Hlavná verzia (X.0.0)
- Zmeny, ktoré vyžadujú zásah používateľa
- Významné preštruktúrovanie obsahu alebo organizácie
- Zmeny, ktoré menia základný prístup alebo metodológiu

#### Menšia verzia (X.Y.0)
- Nové funkcie alebo doplnky obsahu
- Vylepšenia, ktoré zachovávajú spätnú kompatibilitu
- Dodatočné príklady, nástroje alebo zdroje

#### Oprava verzie (X.Y.Z)
- Opravy chýb a korekcie
- Menšie vylepšenia existujúceho obsahu
- Ujasnenia a malé vylepšenia

## Spätná väzba a návrhy komunity

Aktívne podporujeme spätnú väzbu od komunity na zlepšenie tohto vzdelávacieho zdroja:

### Ako poskytnúť spätnú väzbu
- **GitHub Issues**: Hlásenie problémov alebo návrhy na zlepšenie (AI-špecifické problémy vítané)
- **Diskusie na Discorde**: Zdieľanie nápadov a zapojenie sa do komunity Azure AI Foundry
- **Pull Requests**: Priame príspevky na zlepšenie obsahu, najmä šablón a sprievodcov AI
- **Discord Azure AI Foundry**: Účasť v kanáli #Azure pre diskusie o AZD + AI
- **Fóra komunity**: Účasť v širších diskusiách vývojárov Azure

### Kategórie spätnej väzby
- **Presnosť AI obsahu**: Opravy informácií o integrácii a nasadení služieb AI
- **Vzdelávacia skúsenosť**: Návrhy na zlepšenie vzdelávacieho toku pre vývojárov AI
- **Chýbajúci AI obsah**: Požiadavky na ďalšie šablóny, vzory alebo príklady AI
- **Prístupnosť**: Vylepšenia pre rôzne vzdelávacie potreby
- **Integrácia AI nástrojov**: Návrhy na lepšiu integráciu pracovného toku vývoja AI
- **Vzory produkčného AI**: Požiadavky na podnikové vzory nasadenia AI

### Záväzok odpovede
- **Odpoveď na problémy**: Do 48 hodín od nahlásenia problémov
- **Požiadavky na funkcie**: Hodnotenie do jedného týždňa
- **Príspevky komunity**: Preskúmanie do jedného týždňa
- **Bezpečnostné problémy**: Okamžitá priorita s urýchlenou odpoveďou

## Plán údržby

### Pravidelné aktualizácie
- **Mesačné kontroly**: Presnosť obsahu a validácia odkazov
- **Štvrťročné aktualizácie**: Hlavné doplnky a vylepšenia obsahu
- **Polročné kontroly**: Komplexné preštruktúrovanie a vylepšenia
- **Ročné vydania**: Hlavné aktualizácie verzií s významnými vylepšeniami

### Monitorovanie a zabezpečenie kvality
- **Automatizované testovanie**: Pravidelná validácia ukážok kódu a odkazov
- **Integrácia spätnej väzby komunity**: Pravidelné zapracovanie návrhov používateľov
- **Technologické aktualizácie**: Zarovnanie s najnovšími službami Azure a vydaniami azd
- **Audity prístupnosti**: Pravidelné kontroly princípov inkluzívneho dizajnu

## Politika podpory verzií

### Podpora aktuálnej verzie
- **Najnovšia hlavná verzia**: Plná podpora s pravidelnými aktualizáciami
- **Predchádzajúca hlavná verzia**: Aktualizácie bezpečnosti a kritické opravy počas 12 mesiacov
- **Staršie verzie**: Podpora komunity, bez oficiálnych aktualizácií

### Pokyny pre migráciu
Keď sú vydané hlavné verzie, poskytujeme:
- **Sprievodcov migráciou**: Pokyny krok za krokom pre prechod
- **Poznámky o kompatibilite**: Podrobnosti o zmenách, ktoré môžu narušiť kompatibilitu
- **Podpora nástrojov**: Skripty alebo utility na pomoc pri migrácii
- **Podpora komunity**: Vyhradené fóra pre otázky týkajúce sa migrácie

---

**Navigácia**
- **Predchádzajúca lekcia**: [Študijný sprievodca](resources/study-guide.md)
- **Nasledujúca lekcia**: Návrat na [Hlavný README](README.md)

**Zostaňte informovaní**: Sledujte tento repozitár pre upozornenia o nových vydaniach a dôležitých aktualizáciách vzdelávacích materiálov.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->