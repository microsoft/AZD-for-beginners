<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7651a7fb2b5e367812bf01aa209a3612",
  "translation_date": "2025-09-25T00:58:41+00:00",
  "source_file": "changelog.md",
  "language_code": "sk"
}
-->
# Zmeny - AZD Pre Začiatočníkov

## Úvod

Tento zoznam zmien dokumentuje všetky významné zmeny, aktualizácie a vylepšenia v repozitári AZD Pre Začiatočníkov. Dodržiavame princípy semantického verzovania a udržiavame tento log, aby sme používateľom pomohli pochopiť, čo sa zmenilo medzi verziami.

## Ciele učenia

Preskúmaním tohto zoznamu zmien budete:
- Informovaní o nových funkciách a pridanom obsahu
- Rozumieť vylepšeniam existujúcej dokumentácie
- Sledovať opravy chýb a zabezpečiť presnosť
- Sledovať vývoj vzdelávacích materiálov v priebehu času

## Výsledky učenia

Po preskúmaní záznamov v zozname zmien budete schopní:
- Identifikovať nový obsah a dostupné zdroje na učenie
- Rozumieť, ktoré sekcie boli aktualizované alebo vylepšené
- Plánovať svoju vzdelávaciu cestu na základe najaktuálnejších materiálov
- Poskytovať spätnú väzbu a návrhy na budúce vylepšenia

## História verzií

### [v3.3.0] - 2025-09-24

#### Vylepšené materiály workshopu a interaktívne vzdelávacie skúsenosti
**Táto verzia prináša komplexné materiály workshopu s interaktívnymi sprievodcami v prehliadači a štruktúrovanými vzdelávacími cestami.**

#### Pridané
- **🎥 Interaktívny sprievodca workshopom**: Workshop v prehliadači s možnosťou náhľadu cez MkDocs
- **📝 Štruktúrované pokyny workshopu**: 7-kroková vzdelávacia cesta od objavenia po prispôsobenie
  - 0-Úvod: Prehľad workshopu a nastavenie
  - 1-Výber-AI-Šablóny: Proces objavenia a výberu šablóny
  - 2-Validácia-AI-Šablóny: Postupy nasadenia a validácie
  - 3-Rozbor-AI-Šablóny: Porozumenie architektúre šablóny
  - 4-Konfigurácia-AI-Šablóny: Konfigurácia a prispôsobenie
  - 5-Prispôsobenie-AI-Šablóny: Pokročilé úpravy a iterácie
  - 6-Odstránenie-Infrastruktúry: Vyčistenie a správa zdrojov
  - 7-Zhrnutie: Zhrnutie a ďalšie kroky
- **🛠️ Nástroje workshopu**: Konfigurácia MkDocs s Material témou pre lepšiu vzdelávaciu skúsenosť
- **🎯 Praktická vzdelávacia cesta**: 3-kroková metodológia (Objavenie → Nasadenie → Prispôsobenie)
- **📱 Integrácia GitHub Codespaces**: Bezproblémové nastavenie vývojového prostredia

#### Vylepšené
- **AI Workshop Lab**: Rozšírené o komplexnú 2-3 hodinovú štruktúrovanú vzdelávaciu skúsenosť
- **Dokumentácia workshopu**: Profesionálna prezentácia s navigáciou a vizuálnymi pomôckami
- **Postup učenia**: Jasné krokové pokyny od výberu šablóny po nasadenie do produkcie
- **Skúsenosť vývojára**: Integrované nástroje pre efektívne pracovné postupy

#### Zlepšené
- **Prístupnosť**: Rozhranie v prehliadači s vyhľadávaním, funkciou kopírovania a prepínačom témy
- **Samostatné učenie**: Flexibilná štruktúra workshopu prispôsobená rôznym tempám učenia
- **Praktická aplikácia**: Scenáre nasadenia AI šablón v reálnom svete
- **Integrácia komunity**: Integrácia Discordu pre podporu workshopu a spoluprácu

#### Funkcie workshopu
- **Vstavané vyhľadávanie**: Rýchle vyhľadávanie kľúčových slov a lekcií
- **Kopírovanie blokov kódu**: Funkcia kopírovania na všetkých príkladoch kódu
- **Prepínač témy**: Podpora tmavého/svetlého režimu podľa preferencií
- **Vizuálne prvky**: Snímky obrazovky a diagramy pre lepšie pochopenie
- **Integrácia pomoci**: Priamy prístup na Discord pre podporu komunity

### [v3.2.0] - 2025-09-17

#### Hlavná reštrukturalizácia navigácie a systém učenia založený na kapitolách
**Táto verzia prináša komplexnú štruktúru učenia založenú na kapitolách s vylepšenou navigáciou v celom repozitári.**

#### Pridané
- **📚 Systém učenia založený na kapitolách**: Reštrukturalizácia celého kurzu do 8 progresívnych kapitol učenia
  - Kapitola 1: Základy & Rýchly štart (⭐ - 30-45 minút)
  - Kapitola 2: Vývoj orientovaný na AI (⭐⭐ - 1-2 hodiny)
  - Kapitola 3: Konfigurácia & Autentifikácia (⭐⭐ - 45-60 minút)
  - Kapitola 4: Infrastruktúra ako kód & Nasadenie (⭐⭐⭐ - 1-1.5 hodiny)
  - Kapitola 5: Riešenia AI s viacerými agentmi (⭐⭐⭐⭐ - 2-3 hodiny)
  - Kapitola 6: Validácia pred nasadením & Plánovanie (⭐⭐ - 1 hodina)
  - Kapitola 7: Riešenie problémov & Ladenie (⭐⭐ - 1-1.5 hodiny)
  - Kapitola 8: Produkcia & Vzory pre podniky (⭐⭐⭐⭐ - 2-3 hodiny)
- **📚 Komplexný navigačný systém**: Konzistentné navigačné hlavičky a päty vo všetkej dokumentácii
- **🎯 Sledovanie pokroku**: Kontrolný zoznam dokončenia kurzu a systém overovania učenia
- **🗺️ Usmernenie vzdelávacej cesty**: Jasné vstupné body pre rôzne úrovne skúseností a ciele
- **🔗 Navigácia medzi kapitolami**: Jasne prepojené súvisiace kapitoly a predpoklady

#### Vylepšené
- **Štruktúra README**: Transformované na štruktúrovanú vzdelávaciu platformu s organizáciou založenou na kapitolách
- **Navigácia dokumentácie**: Každá stránka teraz obsahuje kontext kapitoly a usmernenie postupu
- **Organizácia šablón**: Príklady a šablóny priradené k relevantným kapitolám učenia
- **Integrácia zdrojov**: Pomôcky, FAQ a študijné príručky prepojené s relevantnými kapitolami
- **Integrácia workshopu**: Praktické laboratóriá priradené k viacerým cieľom učenia kapitol

#### Zmenené
- **Postup učenia**: Presun od lineárnej dokumentácie k flexibilnému učeniu založenému na kapitolách
- **Umiestnenie konfigurácie**: Presunutie sprievodcu konfiguráciou na Kapitolu 3 pre lepší tok učenia
- **Integrácia AI obsahu**: Lepšia integrácia AI špecifického obsahu v celej vzdelávacej ceste
- **Obsah produkcie**: Pokročilé vzory konsolidované v Kapitole 8 pre podnikových študentov

#### Zlepšené
- **Skúsenosť používateľa**: Jasné navigačné stopy a indikátory postupu kapitol
- **Prístupnosť**: Konzistentné navigačné vzory pre jednoduchší prechod kurzom
- **Profesionálna prezentácia**: Štruktúra kurzu v štýle univerzity vhodná pre akademické a firemné školenia
- **Efektivita učenia**: Znížený čas na nájdenie relevantného obsahu vďaka lepšej organizácii

#### Technická implementácia
- **Navigačné hlavičky**: Štandardizovaná navigácia kapitol vo viac ako 40 dokumentačných súboroch
- **Navigácia v päte**: Konzistentné usmernenie postupu a indikátory dokončenia kapitol
- **Prepojenie**: Komplexný interný systém prepojenia spájajúci súvisiace koncepty
- **Mapovanie kapitol**: Šablóny a príklady jasne priradené k cieľom učenia

#### Vylepšenie študijného sprievodcu
- **📚 Komplexné ciele učenia**: Reštrukturalizovaný študijný sprievodca v súlade so systémom 8 kapitol
- **🎯 Hodnotenie založené na kapitolách**: Každá kapitola obsahuje špecifické ciele učenia a praktické cvičenia
- **📋 Sledovanie pokroku**: Týždenný plán učenia s merateľnými výsledkami a kontrolnými zoznamami dokončenia
- **❓ Otázky na hodnotenie**: Otázky na overenie znalostí pre každú kapitolu s profesionálnymi výsledkami
- **🛠️ Praktické cvičenia**: Praktické aktivity s reálnymi scenármi nasadenia a riešenia problémov
- **📊 Postup zručností**: Jasný pokrok od základných konceptov po podnikové vzory s dôrazom na kariérny rozvoj
- **🎓 Rámec certifikácie**: Profesionálne výsledky rozvoja a systém uznania komunity
- **⏱️ Riadenie časovej osi**: Štruktúrovaný 10-týždňový plán učenia s validáciou míľnikov

### [v3.1.0] - 2025-09-17

#### Vylepšené riešenia AI s viacerými agentmi
**Táto verzia zlepšuje riešenie pre maloobchod s viacerými agentmi lepším pomenovaním agentov a vylepšenou dokumentáciou.**

#### Zmenené
- **Terminológia viacerých agentov**: Nahradenie "Cora agent" za "Customer agent" v celom riešení pre maloobchod s viacerými agentmi pre jasnejšie pochopenie
- **Architektúra agentov**: Aktualizácia všetkej dokumentácie, ARM šablón a príkladov kódu na konzistentné pomenovanie "Customer agent"
- **Príklady konfigurácie**: Modernizované vzory konfigurácie agentov s aktualizovanými konvenciami pomenovania
- **Konzistencia dokumentácie**: Zabezpečenie, že všetky odkazy používajú profesionálne, popisné názvy agentov

#### Vylepšené
- **Balík ARM šablón**: Aktualizované retail-multiagent-arm-template s odkazmi na Customer agent
- **Diagramy architektúry**: Obnovené diagramy Mermaid s aktualizovaným pomenovaním agentov
- **Príklady kódu**: Triedy Pythonu a implementačné príklady teraz používajú pomenovanie CustomerAgent
- **Premenné prostredia**: Aktualizované všetky skripty nasadenia na používanie konvencií CUSTOMER_AGENT_NAME

#### Zlepšené
- **Skúsenosť vývojára**: Jasnejšie úlohy a zodpovednosti agentov v dokumentácii
- **Pripravenosť na produkciu**: Lepšie zosúladenie s podnikovými konvenciami pomenovania
- **Vzdelávacie materiály**: Intuitívnejšie pomenovanie agentov pre vzdelávacie účely
- **Použiteľnosť šablón**: Zjednodušené pochopenie funkcií agentov a vzorov nasadenia

#### Technické detaily
- Aktualizované diagramy architektúry Mermaid s odkazmi na CustomerAgent
- Nahradené názvy tried CoraAgent za CustomerAgent v príkladoch Pythonu
- Upravené konfigurácie ARM šablón JSON na používanie typu agenta "customer"
- Aktualizované premenné prostredia z CORA_AGENT_* na CUSTOMER_AGENT_* vzory
- Obnovené všetky príkazy nasadenia a konfigurácie kontajnerov

### [v3.0.0] - 2025-09-12

#### Hlavné zmeny - Zameranie na AI vývojárov a integrácia Azure AI Foundry
**Táto verzia transformuje repozitár na komplexný vzdelávací zdroj zameraný na AI s integráciou Azure AI Foundry.**

#### Pridané
- **🤖 Vzdelávacia cesta orientovaná na AI**: Kompletná reštrukturalizácia prioritizujúca AI vývojárov a inžinierov
- **Sprievodca integráciou Azure AI Foundry**: Komplexná dokumentácia pre pripojenie AZD k službám Azure AI Foundry
- **Vzory nasadenia AI modelov**: Podrobný sprievodca pokrývajúci výber modelu, konfiguráciu a stratégie nasadenia do produkcie
- **AI Workshop Lab**: 2-3 hodinový praktický workshop na konverziu AI aplikácií na riešenia nasaditeľné cez AZD
- **Najlepšie praktiky pre produkciu AI**: Vzory pripravené pre podniky na škálovanie, monitorovanie a zabezpečenie AI pracovných záťaží
- **Sprievodca riešením problémov špecifických pre AI**: Komplexné riešenie problémov pre Azure OpenAI, Cognitive Services a problémy s nasadením AI
- **Galéria AI šablón**: Vybraná kolekcia šablón Azure AI Foundry s hodnotením zložitosti
- **Materiály workshopu**: Kompletná štruktúra workshopu s praktickými laboratóriami a referenčnými materiálmi

#### Vylepšené
- **Štruktúra README**: Zameraná na AI vývojárov s 45% údajmi o záujme komunity z Discordu Azure AI Foundry
- **Vzdelávacie cesty**: Dedikovaná cesta pre AI vývojárov vedľa tradičných ciest pre študentov a DevOps inžinierov
- **Odporúčania šablón**: Vybrané AI šablóny vrátane azure-search-openai-demo, contoso-chat a openai-chat-app-quickstart
- **Integrácia komunity**: Rozšírená podpora komunity Discord s AI špecifickými kanálmi a diskusiami

#### Zameranie na bezpečnosť a produkciu
- **Vzory spravovanej identity**: Konfigurácie autentifikácie a zabezpečenia špecifické pre AI
- **Optimalizácia nákladov**: Sledovanie používania tokenov a kontrola rozpočtu pre AI pracovné záťaže
- **Nasadenie vo viacerých regiónoch**: Stratégie pre globálne nasadenie AI aplikácií
- **Monitorovanie výkonu**: AI špecifické metriky a integrácia Application Insights

#### Kvalita dokumentácie
- **Lineárna štruktúra kurzu**: Logický postup od začiatočníka po pokročilé vzory nasadenia AI
- **Validované URL**: Všetky externé odkazy na repozitár overené a prístupné
- **Kompletný referenčný materiál**: Všetky interné odkazy na dokumentáciu overené a funkčné
- **Pripravené na produkciu**: Vzory nasadenia pre podniky s príkladmi z reálneho sveta

### [v2.0.0] - 2025-09-09

#### Hlavné zmeny - Reštrukturalizácia repozitára a profesionálne vylepšenie
**Táto verzia predstavuje významnú prestavbu štruktúry repozitára a prezentácie obsahu.**

#### Pridané
- **Štruktúrovaný vzdelávací rámec**: Všetky stránky dokumentácie teraz obsahujú sekcie Úvod, Ciele učenia a Výsledky učenia
- **Navigačný systém**: Pridané odkazy na predchádzajúce/nasledujúce lekcie vo všetkej dokumentácii pre vedený postup učenia
- **Študijný sprievodca**: Komplexný study-guide.md s cieľmi učenia, praktickými cvičeniami a hodnotiacimi materiálmi
- **Profesionálna prezentácia**: Odstránené všetky emoji ikony pre lepšiu prístupnosť a profesionálny vzhľad
-
- Príklady architektúry mikroslužieb  
- Implementácie serverless funkcií  

#### Funkcie  
- **Podpora viacerých platforiem**: Návody na inštaláciu a konfiguráciu pre Windows, macOS a Linux  
- **Rôzne úrovne zručností**: Obsah určený pre študentov aj profesionálnych vývojárov  
- **Praktické zameranie**: Praktické príklady a scenáre z reálneho sveta  
- **Komplexné pokrytie**: Od základných konceptov po pokročilé podnikové vzory  
- **Bezpečnostný prístup**: Najlepšie bezpečnostné postupy integrované do celého obsahu  
- **Optimalizácia nákladov**: Rady pre nákladovo efektívne nasadenia a správu zdrojov  

#### Kvalita dokumentácie  
- **Podrobné príklady kódu**: Praktické, otestované ukážky kódu  
- **Krok za krokom**: Jasné a použiteľné návody  
- **Komplexné riešenie chýb**: Riešenie bežných problémov  
- **Integrácia najlepších postupov**: Priemyselné štandardy a odporúčania  
- **Kompatibilita verzií**: Aktualizované podľa najnovších služieb Azure a funkcií azd  

## Plánované budúce vylepšenia  

### Verzia 3.1.0 (Plánovaná)  
#### Rozšírenie AI platformy  
- **Podpora viacerých modelov**: Vzory integrácie pre Hugging Face, Azure Machine Learning a vlastné modely  
- **Rámce pre AI agentov**: Šablóny pre nasadenia LangChain, Semantic Kernel a AutoGen  
- **Pokročilé RAG vzory**: Možnosti vektorových databáz mimo Azure AI Search (Pinecone, Weaviate atď.)  
- **Pozorovateľnosť AI**: Vylepšené monitorovanie výkonu modelov, používania tokenov a kvality odpovedí  

#### Skúsenosť vývojára  
- **Rozšírenie pre VS Code**: Integrované prostredie pre vývoj AZD + AI Foundry  
- **Integrácia GitHub Copilot**: AI-asistované generovanie šablón AZD  
- **Interaktívne tutoriály**: Praktické cvičenia s automatizovanou validáciou pre AI scenáre  
- **Video obsah**: Doplnkové video tutoriály pre vizuálnych študentov zamerané na nasadenia AI  

### Verzia 4.0.0 (Plánovaná)  
#### Podnikové AI vzory  
- **Rámec správy**: Správa modelov AI, súlad a auditné stopy  
- **AI pre viacerých nájomcov**: Vzory pre poskytovanie služieb AI viacerým zákazníkom s izolovanými službami  
- **Nasadenie AI na okraji siete**: Integrácia s Azure IoT Edge a kontajnerovými inštanciami  
- **Hybridné cloudové AI**: Vzory nasadenia pre multi-cloud a hybridné pracovné zaťaženia AI  

#### Pokročilé funkcie  
- **Automatizácia AI pipeline**: Integrácia MLOps s pipeline Azure Machine Learning  
- **Pokročilá bezpečnosť**: Vzory zero-trust, privátne koncové body a pokročilá ochrana pred hrozbami  
- **Optimalizácia výkonu**: Pokročilé stratégie ladenia a škálovania pre vysokovýkonné AI aplikácie  
- **Globálna distribúcia**: Vzory doručovania obsahu a vyrovnávania záťaže na okraji siete pre AI aplikácie  

### Verzia 3.0.0 (Plánovaná) - Nahradená aktuálnym vydaním  
#### Navrhované doplnky - Teraz implementované vo verzii 3.0.0  
- ✅ **Obsah zameraný na AI**: Komplexná integrácia Azure AI Foundry (Dokončené)  
- ✅ **Interaktívne tutoriály**: Praktické laboratórium pre AI (Dokončené)  
- ✅ **Pokročilý bezpečnostný modul**: Bezpečnostné vzory špecifické pre AI (Dokončené)  
- ✅ **Optimalizácia výkonu**: Stratégie ladenia pracovných zaťažení AI (Dokončené)  

### Verzia 2.1.0 (Plánovaná) - Čiastočne implementovaná vo verzii 3.0.0  
#### Menšie vylepšenia - Niektoré dokončené v aktuálnom vydaní  
- ✅ **Ďalšie príklady**: Scenáre nasadenia zamerané na AI (Dokončené)  
- ✅ **Rozšírené FAQ**: Otázky a riešenie problémov špecifické pre AI (Dokončené)  
- **Integrácia nástrojov**: Vylepšené návody na integráciu IDE a editorov  
- ✅ **Rozšírené monitorovanie**: Vzory monitorovania a upozorňovania špecifické pre AI (Dokončené)  

#### Stále plánované na budúce vydanie  
- **Dokumentácia prispôsobená mobilným zariadeniam**: Responzívny dizajn pre mobilné učenie  
- **Offline prístup**: Balíčky dokumentácie na stiahnutie  
- **Vylepšená integrácia IDE**: Rozšírenie pre VS Code pre pracovné postupy AZD + AI  
- **Komunitný dashboard**: Reálne metriky komunity a sledovanie príspevkov  

## Prispievanie do changelogu  

### Hlásenie zmien  
Pri prispievaní do tohto repozitára zabezpečte, aby záznamy v changelogu obsahovali:  

1. **Číslo verzie**: Podľa semantického verzovania (major.minor.patch)  
2. **Dátum**: Dátum vydania alebo aktualizácie vo formáte RRRR-MM-DD  
3. **Kategória**: Pridané, Zmenené, Zastarané, Odstránené, Opravené, Bezpečnosť  
4. **Jasný popis**: Stručný popis zmien  
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

#### Zastarané  
- Funkcie alebo prístupy, ktoré sa postupne vyraďujú  
- Sekcie dokumentácie plánované na odstránenie  
- Metódy, ktoré majú lepšie alternatívy  

#### Odstránené  
- Funkcie, dokumentácia alebo príklady, ktoré už nie sú relevantné  
- Zastarané informácie alebo prístupy  
- Redundantný alebo konsolidovaný obsah  

#### Opravené  
- Opravy chýb v dokumentácii alebo kóde  
- Riešenie nahlásených problémov alebo chýb  
- Zlepšenia presnosti alebo funkčnosti  

#### Bezpečnosť  
- Vylepšenia alebo opravy súvisiace s bezpečnosťou  
- Aktualizácie bezpečnostných najlepších postupov  
- Riešenie bezpečnostných zraniteľností  

### Pokyny pre semantické verzovanie  

#### Hlavná verzia (X.0.0)  
- Zmeny, ktoré narušujú kompatibilitu a vyžadujú zásah používateľa  
- Významné preštruktúrovanie obsahu alebo organizácie  
- Zmeny, ktoré menia základný prístup alebo metodológiu  

#### Menšia verzia (X.Y.0)  
- Nové funkcie alebo doplnky obsahu  
- Vylepšenia, ktoré zachovávajú spätnú kompatibilitu  
- Dodatočné príklady, nástroje alebo zdroje  

#### Opravná verzia (X.Y.Z)  
- Opravy chýb a korekcie  
- Menšie vylepšenia existujúceho obsahu  
- Ujasnenia a malé vylepšenia  

## Spätná väzba a návrhy komunity  

Aktívne podporujeme spätnú väzbu komunity na zlepšenie tohto vzdelávacieho zdroja:  

### Ako poskytnúť spätnú väzbu  
- **GitHub Issues**: Hlásenie problémov alebo návrhy na zlepšenie (AI-špecifické problémy vítané)  
- **Diskusie na Discorde**: Zdieľanie nápadov a zapojenie sa do komunity Azure AI Foundry  
- **Pull Requesty**: Priame príspevky na zlepšenie obsahu, najmä šablón a návodov pre AI  
- **Azure AI Foundry Discord**: Účasť v kanáli #Azure pre diskusie o AZD + AI  
- **Komunitné fóra**: Účasť na širších diskusiách vývojárov Azure  

### Kategórie spätnej väzby  
- **Presnosť AI obsahu**: Opravy informácií o integrácii a nasadení AI služieb  
- **Vzdelávacia skúsenosť**: Návrhy na zlepšenie vzdelávacieho toku pre vývojárov AI  
- **Chýbajúci AI obsah**: Požiadavky na ďalšie šablóny, vzory alebo príklady AI  
- **Prístupnosť**: Vylepšenia pre rôzne vzdelávacie potreby  
- **Integrácia AI nástrojov**: Návrhy na lepšiu integráciu pracovných postupov vývoja AI  
- **Vzory pre produkčné AI**: Požiadavky na podnikové vzory nasadenia AI  

### Záväzok k odpovediam  
- **Odpoveď na problémy**: Do 48 hodín pre nahlásené problémy  
- **Požiadavky na funkcie**: Vyhodnotenie do jedného týždňa  
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
- **Aktualizácie technológií**: Zarovnanie s najnovšími službami Azure a vydaniami azd  
- **Audity prístupnosti**: Pravidelné kontroly pre inkluzívne dizajnové princípy  

## Politika podpory verzií  

### Podpora aktuálnej verzie  
- **Najnovšia hlavná verzia**: Plná podpora s pravidelnými aktualizáciami  
- **Predchádzajúca hlavná verzia**: Bezpečnostné aktualizácie a kritické opravy počas 12 mesiacov  
- **Staršie verzie**: Podpora komunity, bez oficiálnych aktualizácií  

### Pokyny na migráciu  
Keď sú vydané hlavné verzie, poskytujeme:  
- **Príručky na migráciu**: Krok za krokom inštrukcie na prechod  
- **Poznámky o kompatibilite**: Podrobnosti o zmenách, ktoré narúšajú kompatibilitu  
- **Podpora nástrojov**: Skripty alebo utility na pomoc s migráciou  
- **Podpora komunity**: Vyhradené fóra pre otázky o migrácii  

---

**Navigácia**  
- **Predchádzajúca lekcia**: [Študijný sprievodca](resources/study-guide.md)  
- **Nasledujúca lekcia**: Návrat na [Hlavné README](README.md)  

**Zostaňte informovaní**: Sledujte tento repozitár pre notifikácie o nových vydaniach a dôležitých aktualizáciách vzdelávacích materiálov.  

---

