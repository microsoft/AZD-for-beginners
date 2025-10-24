<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T17:58:39+00:00",
  "source_file": "changelog.md",
  "language_code": "sk"
}
-->
# Zmeny - AZD pre začiatočníkov

## Úvod

Tento zoznam zmien dokumentuje všetky významné zmeny, aktualizácie a vylepšenia v repozitári AZD pre začiatočníkov. Dodržiavame princípy semantického verzovania a udržiavame tento log, aby sme používateľom pomohli pochopiť, čo sa zmenilo medzi jednotlivými verziami.

## Ciele učenia

Preskúmaním tohto zoznamu zmien:
- Získate informácie o nových funkciách a pridanom obsahu
- Pochopíte vylepšenia existujúcej dokumentácie
- Budete sledovať opravy chýb a zmeny pre zabezpečenie presnosti
- Budete sledovať vývoj vzdelávacích materiálov v priebehu času

## Výsledky učenia

Po preskúmaní záznamov v zozname zmien budete schopní:
- Identifikovať nový obsah a dostupné zdroje na učenie
- Pochopiť, ktoré sekcie boli aktualizované alebo vylepšené
- Naplánovať si svoju vzdelávaciu cestu na základe najaktuálnejších materiálov
- Poskytnúť spätnú väzbu a návrhy na budúce vylepšenia

## História verzií

### [v3.4.0] - 24.10.2025

#### Vylepšenia náhľadu infraštruktúry a validácie
**Táto verzia prináša komplexnú podporu novej funkcie náhľadu Azure Developer CLI a zlepšuje používateľskú skúsenosť workshopov.**

#### Pridané
- **🧪 Dokumentácia funkcie azd provision --preview**: Komplexné pokrytie novej schopnosti náhľadu infraštruktúry
  - Referencia príkazov a príklady použitia v cheat sheet
  - Podrobné začlenenie do príručky pre provisioning s prípadmi použitia a výhodami
  - Integrácia kontroly pred nasadením pre bezpečnejšiu validáciu nasadenia
  - Aktualizácie príručky pre začiatočníkov s postupmi bezpečného nasadenia
- **🚧 Banner stavu workshopu**: Profesionálny HTML banner indikujúci stav vývoja workshopu
  - Dizajn s gradientom a indikátormi výstavby pre jasnú komunikáciu s používateľmi
  - Časová pečiatka poslednej aktualizácie pre transparentnosť
  - Responzívny dizajn pre všetky typy zariadení

#### Vylepšené
- **Bezpečnosť infraštruktúry**: Funkcionalita náhľadu integrovaná do celej dokumentácie nasadenia
- **Validácia pred nasadením**: Automatizované skripty teraz zahŕňajú testovanie náhľadu infraštruktúry
- **Pracovný postup vývojára**: Aktualizované sekvencie príkazov zahŕňajú náhľad ako najlepšiu prax
- **Workshopová skúsenosť**: Jasné očakávania pre používateľov o stave vývoja obsahu

#### Zmenené
- **Najlepšie postupy nasadenia**: Pracovný postup s náhľadom je teraz odporúčaný prístup
- **Tok dokumentácie**: Validácia infraštruktúry presunutá na začiatok vzdelávacieho procesu
- **Prezentácia workshopu**: Profesionálna komunikácia stavu s jasnou časovou osou vývoja

#### Zlepšené
- **Prístup bezpečnosti na prvom mieste**: Zmeny infraštruktúry je teraz možné validovať pred nasadením
- **Tímová spolupráca**: Výsledky náhľadu je možné zdieľať na preskúmanie a schválenie
- **Povedomie o nákladoch**: Lepšie pochopenie nákladov na zdroje pred provisioningom
- **Zníženie rizika**: Zníženie zlyhaní nasadenia prostredníctvom predbežnej validácie

#### Technická implementácia
- **Integrácia viacerých dokumentov**: Funkcia náhľadu zdokumentovaná v 4 kľúčových súboroch
- **Vzory príkazov**: Konzistentná syntax a príklady v celej dokumentácii
- **Integrácia najlepších postupov**: Náhľad zahrnutý do validačných pracovných postupov a skriptov
- **Vizualizácia**: Jasné označenie NOVÝCH funkcií pre lepšiu viditeľnosť

#### Workshopová infraštruktúra
- **Komunikácia stavu**: Profesionálny HTML banner s gradientovým štýlom
- **Používateľská skúsenosť**: Jasný stav vývoja zabraňuje zmätku
- **Profesionálna prezentácia**: Zachováva dôveryhodnosť repozitára a nastavuje očakávania
- **Transparentnosť časovej osi**: Časová pečiatka poslednej aktualizácie z októbra 2025 pre zodpovednosť

### [v3.3.0] - 24.09.2025

#### Vylepšené materiály workshopu a interaktívna vzdelávacia skúsenosť
**Táto verzia prináša komplexné materiály workshopu s interaktívnymi prehliadačovými sprievodcami a štruktúrovanými vzdelávacími cestami.**

#### Pridané
- **🎥 Interaktívny sprievodca workshopom**: Prehliadačová skúsenosť workshopu s funkciou náhľadu MkDocs
- **📝 Štruktúrované pokyny pre workshop**: 7-kroková vedená vzdelávacia cesta od objavovania po prispôsobenie
  - 0-Úvod: Prehľad a nastavenie workshopu
  - 1-Výber AI šablóny: Proces objavovania a výberu šablóny
  - 2-Validácia AI šablóny: Postupy nasadenia a validácie
  - 3-Deštrukcia AI šablóny: Pochopenie architektúry šablóny
  - 4-Konfigurácia AI šablóny: Konfigurácia a prispôsobenie
  - 5-Prispôsobenie AI šablóny: Pokročilé úpravy a iterácie
  - 6-Odstránenie infraštruktúry: Čistenie a správa zdrojov
  - 7-Zhrnutie: Zhrnutie a ďalšie kroky
- **🛠️ Nástroje pre workshop**: Konfigurácia MkDocs s Material témou pre vylepšenú vzdelávaciu skúsenosť
- **🎯 Praktická vzdelávacia cesta**: 3-kroková metodológia (Objavovanie → Nasadenie → Prispôsobenie)
- **📱 Integrácia GitHub Codespaces**: Bezproblémové nastavenie vývojového prostredia

#### Vylepšené
- **AI Workshop Lab**: Rozšírený o komplexnú 2-3 hodinovú štruktúrovanú vzdelávaciu skúsenosť
- **Dokumentácia workshopu**: Profesionálna prezentácia s navigáciou a vizuálnymi pomôckami
- **Postup učenia**: Jasné krok za krokom vedenie od výberu šablóny po nasadenie do produkcie
- **Skúsenosť vývojára**: Integrované nástroje pre zjednodušené pracovné postupy vývoja

#### Zlepšené
- **Prístupnosť**: Prehliadačové rozhranie s vyhľadávaním, funkciou kopírovania a prepínaním témy
- **Samostatné učenie**: Flexibilná štruktúra workshopu prispôsobená rôznym tempám učenia
- **Praktická aplikácia**: Scenáre nasadenia AI šablón v reálnom svete
- **Integrácia komunity**: Integrácia Discordu pre podporu workshopu a spoluprácu

#### Funkcie workshopu
- **Vstavané vyhľadávanie**: Rýchle vyhľadávanie kľúčových slov a lekcií
- **Kopírovanie blokov kódu**: Funkcia kopírovania na všetkých príkladoch kódu
- **Prepínanie témy**: Podpora tmavého/svetlého režimu pre rôzne preferencie
- **Vizuálne prvky**: Screenshoty a diagramy pre lepšie pochopenie
- **Integrácia pomoci**: Priamy prístup na Discord pre podporu komunity

### [v3.2.0] - 17.09.2025

#### Hlavná reštrukturalizácia navigácie a systém učenia podľa kapitol
**Táto verzia prináša komplexnú štruktúru učenia podľa kapitol s vylepšenou navigáciou v celom repozitári.**

#### Pridané
- **📚 Systém učenia podľa kapitol**: Reštrukturalizácia celého kurzu do 8 progresívnych kapitol učenia
  - Kapitola 1: Základy a rýchly štart (⭐ - 30-45 minút)
  - Kapitola 2: AI-prvé vývojové prostredie (⭐⭐ - 1-2 hodiny)
  - Kapitola 3: Konfigurácia a autentifikácia (⭐⭐ - 45-60 minút)
  - Kapitola 4: Infraštruktúra ako kód a nasadenie (⭐⭐⭐ - 1-1,5 hodiny)
  - Kapitola 5: Multi-agentné AI riešenia (⭐⭐⭐⭐ - 2-3 hodiny)
  - Kapitola 6: Validácia pred nasadením a plánovanie (⭐⭐ - 1 hodina)
  - Kapitola 7: Riešenie problémov a ladenie (⭐⭐ - 1-1,5 hodiny)
  - Kapitola 8: Produkčné a podnikové vzory (⭐⭐⭐⭐ - 2-3 hodiny)
- **📚 Komplexný navigačný systém**: Konzistentné navigačné hlavičky a päty vo všetkých dokumentoch
- **🎯 Sledovanie pokroku**: Kontrolný zoznam dokončenia kurzu a systém overovania učenia
- **🗺️ Usmernenie vzdelávacej cesty**: Jasné vstupné body pre rôzne úrovne skúseností a ciele
- **🔗 Navigácia medzi kapitolami**: Jasne prepojené súvisiace kapitoly a predpoklady

#### Vylepšené
- **Štruktúra README**: Transformovaná na štruktúrovanú vzdelávaciu platformu s organizáciou podľa kapitol
- **Navigácia dokumentácie**: Každá stránka teraz obsahuje kontext kapitoly a usmernenie pre postup
- **Organizácia šablón**: Príklady a šablóny mapované na príslušné kapitoly učenia
- **Integrácia zdrojov**: Cheat sheet, FAQ a študijné príručky prepojené s relevantnými kapitolami
- **Integrácia workshopu**: Praktické laboratóriá mapované na viacero cieľov učenia kapitol

#### Zmenené
- **Postup učenia**: Presunuté z lineárnej dokumentácie na flexibilné učenie podľa kapitol
- **Umiestnenie konfigurácie**: Presunutá príručka konfigurácie ako Kapitola 3 pre lepší tok učenia
- **Integrácia AI obsahu**: Lepšia integrácia AI-špecifického obsahu v celej vzdelávacej ceste
- **Produkčný obsah**: Pokročilé vzory konsolidované v Kapitole 8 pre podnikových študentov

#### Zlepšené
- **Používateľská skúsenosť**: Jasné navigačné stopy a indikátory postupu kapitol
- **Prístupnosť**: Konzistentné navigačné vzory pre jednoduchšie prechádzanie kurzom
- **Profesionálna prezentácia**: Univerzitný štýl štruktúry kurzu vhodný pre akademické a firemné školenia
- **Efektivita učenia**: Znížený čas na nájdenie relevantného obsahu prostredníctvom vylepšenej organizácie

#### Technická implementácia
- **Navigačné hlavičky**: Štandardizovaná navigácia kapitol vo viac ako 40 dokumentačných súboroch
- **Navigácia v päte**: Konzistentné usmernenie pre postup a indikátory dokončenia kapitol
- **Prepojenie kapitol**: Komplexný interný systém prepojenia súvisiacich konceptov
- **Mapovanie kapitol**: Šablóny a príklady jasne spojené s cieľmi učenia

#### Vylepšenie študijného sprievodcu
- **📚 Komplexné ciele učenia**: Reštrukturalizovaný študijný sprievodca v súlade so systémom 8 kapitol
- **🎯 Hodnotenie podľa kapitol**: Každá kapitola obsahuje špecifické ciele učenia a praktické cvičenia
- **📋 Sledovanie pokroku**: Týždenný plán učenia s merateľnými výsledkami a kontrolnými zoznamami dokončenia
- **❓ Otázky na hodnotenie**: Validácia znalostí pre každú kapitolu s profesionálnymi výsledkami
- **🛠️ Praktické cvičenia**: Praktické aktivity s reálnymi scenármi nasadenia a riešenia problémov
- **📊 Postup zručností**: Jasný pokrok od základných konceptov po podnikové vzory s dôrazom na kariérny rozvoj
- **🎓 Rámec certifikácie**: Profesionálne výsledky rozvoja a systém uznania komunity
- **⏱️ Riadenie časovej osi**: Štruktúrovaný 10-týždňový plán učenia s validáciou míľnikov

### [v3.1.0] - 17.09.2025

#### Vylepšené multi-agentné AI riešenia
**Táto verzia zlepšuje multi-agentné riešenie pre maloobchod s lepším pomenovaním agentov a vylepšenou dokumentáciou.**

#### Zmenené
- **Terminológia multi-agentov**: Nahradenie "Cora agent" za "Customer agent" v celom riešení pre maloobchodné multi-agentné systémy pre jasnejšie pochopenie
- **Architektúra agentov**: Aktualizácia celej dokumentácie, ARM šablón a príkladov kódu na konzistentné pomenovanie "Customer agent"
- **Príklady konfigurácie**: Modernizované vzory konfigurácie agentov s aktualizovanými názvami
- **Konzistencia dokumentácie**: Zabezpečenie, že všetky odkazy používajú profesionálne, popisné názvy agentov

#### Vylepšené
- **Balík ARM šablón**: Aktualizované retail-multiagent-arm-template s odkazmi na Customer agent
- **Diagramy architektúry**: Obnovené diagramy Mermaid s aktualizovaným pomenovaním agentov
- **Príklady kódu**: Python triedy a implementačné príklady teraz používajú pomenovanie CustomerAgent
- **Premenné prostredia**: Aktualizované všetky skripty nasadenia na používanie konvencií CUSTOMER_AGENT_NAME

#### Zlepšené
- **Skúsenosť vývojára**: Jasnejšie úlohy a zodpovednosti agentov v dokumentácii
- **Pripravenosť na produkciu**: Lepšie zosúladenie s podnikovými konvenciami pomenovania
- **Vzdelávacie materiály**: Intuitívnejšie pomenovanie agentov pre vzdelávacie účely
- **Použiteľnosť šablón**: Zjednodušené pochopenie funkcií agentov a vzorov nasadenia

#### Technické detaily
- Aktualizované diagramy architektúry Mermaid s odkazmi na CustomerAgent
- Nahradené názvy tried CoraAgent za CustomerAgent v Python príkladoch
- Upravené konfigurácie ARM šablón JSON na používanie typu agenta "customer"
- Aktualizované premenné prostredia z CORA_AGENT_* na CUSTOMER_AGENT_* vzory
- Obnovené všetky príkazy nasadenia a konfigurácie kontajnerov

### [v3.0.0] - 12.09.2025

#### Hlavné zmeny - Zameranie na AI vývojárov a integrácia Azure AI Foundry
**Táto verzia transformuje repozitár na komplexný vzdelávací zdroj zameraný na AI vývojárov s integráciou Azure AI Foundry.**

#### Pridané
- **🤖 AI-prvá vzdelávacia cesta**: Kompletná reštrukturalizácia s prioritou na AI vývojárov a inžinierov
- **Príručka integrácie Azure AI Foundry**: Komplexná dokumentácia pre pripojenie AZD k službám Azure AI Foundry
- **Vzory nasaden
- **Formát dokumentácie**: Štandardizácia všetkej dokumentácie s konzistentnou štruktúrou zameranou na učenie
- **Navigačný tok**: Implementácia logického postupu cez všetky vzdelávacie materiály
- **Prezentácia obsahu**: Odstránenie dekoratívnych prvkov v prospech jasného, profesionálneho formátovania
- **Štruktúra odkazov**: Aktualizácia všetkých interných odkazov na podporu nového navigačného systému

#### Vylepšené
- **Prístupnosť**: Odstránenie závislosti na emoji pre lepšiu kompatibilitu s čítačkami obrazovky
- **Profesionálny vzhľad**: Čistá prezentácia v akademickom štýle vhodná pre firemné vzdelávanie
- **Vzdelávacia skúsenosť**: Štruktúrovaný prístup s jasnými cieľmi a výsledkami pre každú lekciu
- **Organizácia obsahu**: Lepší logický tok a prepojenie medzi súvisiacimi témami

### [v1.0.0] - 2025-09-09

#### Počiatočné vydanie - Komplexný AZD vzdelávací repozitár

#### Pridané
- **Základná štruktúra dokumentácie**
  - Kompletná séria sprievodcov pre začiatok
  - Komplexná dokumentácia nasadenia a poskytovania
  - Podrobné zdroje na riešenie problémov a sprievodcovia ladením
  - Nástroje a postupy na validáciu pred nasadením

- **Modul Začíname**
  - AZD základy: Základné koncepty a terminológia
  - Sprievodca inštaláciou: Pokyny na nastavenie pre konkrétne platformy
  - Sprievodca konfiguráciou: Nastavenie prostredia a autentifikácia
  - Prvý projekt: Praktická výučba krok za krokom

- **Modul nasadenia a poskytovania**
  - Sprievodca nasadením: Kompletná dokumentácia pracovného postupu
  - Sprievodca poskytovaním: Infrastruktúra ako kód s Bicep
  - Najlepšie postupy pre produkčné nasadenia
  - Vzory architektúry pre viac služieb

- **Modul validácie pred nasadením**
  - Plánovanie kapacity: Validácia dostupnosti zdrojov Azure
  - Výber SKU: Komplexné pokyny pre výber úrovne služieb
  - Kontroly pred nasadením: Automatizované validačné skripty (PowerShell a Bash)
  - Nástroje na odhad nákladov a plánovanie rozpočtu

- **Modul riešenia problémov**
  - Bežné problémy: Často sa vyskytujúce problémy a ich riešenia
  - Sprievodca ladením: Systematické metodológie riešenia problémov
  - Pokročilé diagnostické techniky a nástroje
  - Monitorovanie výkonu a optimalizácia

- **Zdroje a referencie**
  - Cheat Sheet príkazov: Rýchly odkaz na základné príkazy
  - Slovník: Komplexné definície terminológie a skratiek
  - FAQ: Podrobné odpovede na bežné otázky
  - Odkazy na externé zdroje a komunitné spojenia

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
- **Bezpečnostný prístup**: Najlepšie bezpečnostné postupy integrované do celého obsahu
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
- **Pokročilé vzory RAG**: Možnosti vektorových databáz mimo Azure AI Search (Pinecone, Weaviate, atď.)
- **Pozorovateľnosť AI**: Vylepšené monitorovanie výkonu modelov, používania tokenov a kvality odpovedí

#### Skúsenosť vývojára
- **Rozšírenie VS Code**: Integrované prostredie AZD + AI Foundry
- **Integrácia GitHub Copilot**: Generovanie šablón AZD pomocou AI
- **Interaktívne tutoriály**: Praktické cvičenia s automatizovanou validáciou pre AI scenáre
- **Video obsah**: Doplnkové video tutoriály pre vizuálnych študentov zamerané na nasadenia AI

### Verzia 4.0.0 (Plánovaná)
#### Podnikové vzory AI
- **Rámec správy**: Správa modelov AI, súlad a auditné stopy
- **AI pre viacerých nájomcov**: Vzory pre poskytovanie služieb AI viacerým zákazníkom s izolovanými službami
- **Nasadenie AI na okraji siete**: Integrácia s Azure IoT Edge a kontajnerovými inštanciami
- **Hybridné cloudové AI**: Vzory nasadenia AI pre multi-cloudové a hybridné prostredia

#### Pokročilé funkcie
- **Automatizácia AI pipeline**: Integrácia MLOps s pipeline Azure Machine Learning
- **Pokročilá bezpečnosť**: Vzory zero-trust, privátne koncové body a pokročilá ochrana pred hrozbami
- **Optimalizácia výkonu**: Pokročilé stratégie ladenia a škálovania pre aplikácie AI s vysokou priepustnosťou
- **Globálna distribúcia**: Vzory doručovania obsahu a vyrovnávania záťaže pre aplikácie AI

### Verzia 3.0.0 (Plánovaná) - Nahradená aktuálnym vydaním
#### Navrhované doplnky - Teraz implementované vo verzii 3.0.0
- ✅ **Obsah zameraný na AI**: Komplexná integrácia Azure AI Foundry (Dokončené)
- ✅ **Interaktívne tutoriály**: Praktické laboratórium AI workshopu (Dokončené)
- ✅ **Pokročilý bezpečnostný modul**: Bezpečnostné vzory špecifické pre AI (Dokončené)
- ✅ **Optimalizácia výkonu**: Stratégie ladenia pracovných záťaží AI (Dokončené)

### Verzia 2.1.0 (Plánovaná) - Čiastočne implementovaná vo verzii 3.0.0
#### Menšie vylepšenia - Niektoré dokončené v aktuálnom vydaní
- ✅ **Ďalšie príklady**: Scenáre nasadenia zamerané na AI (Dokončené)
- ✅ **Rozšírené FAQ**: Otázky a riešenie problémov špecifické pre AI (Dokončené)
- **Integrácia nástrojov**: Vylepšené pokyny pre integráciu IDE a editorov
- ✅ **Rozšírené monitorovanie**: Vzory monitorovania a upozornení špecifické pre AI (Dokončené)

#### Stále plánované pre budúce vydanie
- **Mobilná dokumentácia**: Responzívny dizajn pre mobilné vzdelávanie
- **Offline prístup**: Balíčky dokumentácie na stiahnutie
- **Vylepšená integrácia IDE**: Rozšírenie VS Code pre pracovné postupy AZD + AI
- **Komunitný dashboard**: Reálne časové metriky komunity a sledovanie príspevkov

## Prispievanie do changelogu

### Hlásenie zmien
Pri prispievaní do tohto repozitára zabezpečte, aby záznamy changelogu obsahovali:

1. **Číslo verzie**: Podľa semantického verzovania (major.minor.patch)
2. **Dátum**: Dátum vydania alebo aktualizácie vo formáte YYYY-MM-DD
3. **Kategória**: Pridané, Zmenené, Zastaralé, Odstránené, Opravené, Bezpečnosť
4. **Jasný popis**: Stručný popis zmien
5. **Hodnotenie dopadu**: Ako zmeny ovplyvňujú existujúcich používateľov

### Kategórie zmien

#### Pridané
- Nové funkcie, sekcie dokumentácie alebo schopnosti
- Nové príklady, šablóny alebo vzdelávacie zdroje
- Dodatočné nástroje, skripty alebo pomôcky

#### Zmenené
- Úpravy existujúcej funkcionality alebo dokumentácie
- Aktualizácie na zlepšenie jasnosti alebo presnosti
- Preorganizovanie obsahu alebo štruktúry

#### Zastaralé
- Funkcie alebo prístupy, ktoré sa postupne rušia
- Sekcie dokumentácie plánované na odstránenie
- Metódy, ktoré majú lepšie alternatívy

#### Odstránené
- Funkcie, dokumentácia alebo príklady, ktoré už nie sú relevantné
- Zastarané informácie alebo zastarané prístupy
- Redundantný alebo konsolidovaný obsah

#### Opravené
- Opravy chýb v dokumentácii alebo kóde
- Riešenie nahlásených problémov alebo chýb
- Zlepšenia presnosti alebo funkčnosti

#### Bezpečnosť
- Vylepšenia alebo opravy týkajúce sa bezpečnosti
- Aktualizácie najlepších bezpečnostných postupov
- Riešenie bezpečnostných zraniteľností

### Pokyny pre semantické verzovanie

#### Hlavná verzia (X.0.0)
- Zmeny, ktoré vyžadujú akciu používateľa
- Významné preorganizovanie obsahu alebo štruktúry
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
- **GitHub Issues**: Nahláste problémy alebo navrhnite vylepšenia (AI špecifické problémy vítané)
- **Diskusie na Discorde**: Podeľte sa o nápady a zapojte sa do komunity Azure AI Foundry
- **Pull Requests**: Prispievajte priamo k zlepšeniu obsahu, najmä AI šablón a sprievodcov
- **Discord Azure AI Foundry**: Zapojte sa do kanála #Azure pre diskusie o AZD + AI
- **Komunitné fóra**: Zúčastnite sa širších diskusií vývojárov Azure

### Kategórie spätnej väzby
- **Presnosť AI obsahu**: Opravy informácií o integrácii a nasadení služieb AI
- **Vzdelávacia skúsenosť**: Návrhy na zlepšenie vzdelávacieho toku pre vývojárov AI
- **Chýbajúci AI obsah**: Požiadavky na ďalšie šablóny, vzory alebo príklady AI
- **Prístupnosť**: Vylepšenia pre rôzne vzdelávacie potreby
- **Integrácia AI nástrojov**: Návrhy na lepšiu integráciu pracovného postupu vývoja AI
- **Vzory produkčného AI**: Požiadavky na podnikové vzory nasadenia AI

### Záväzok odpovedať
- **Odpoveď na problémy**: Do 48 hodín od nahlásenia problémov
- **Požiadavky na funkcie**: Vyhodnotenie do jedného týždňa
- **Príspevky komunity**: Preskúmanie do jedného týždňa
- **Bezpečnostné problémy**: Okamžitá priorita s urýchlenou odpoveďou

## Plán údržby

### Pravidelné aktualizácie
- **Mesačné kontroly**: Presnosť obsahu a validácia odkazov
- **Štvrťročné aktualizácie**: Hlavné doplnky a vylepšenia obsahu
- **Polročné kontroly**: Komplexné preorganizovanie a vylepšenie
- **Ročné vydania**: Hlavné aktualizácie verzií s významnými vylepšeniami

### Monitorovanie a zabezpečenie kvality
- **Automatizované testovanie**: Pravidelná validácia ukážok kódu a odkazov
- **Integrácia spätnej väzby komunity**: Pravidelné zapracovanie návrhov používateľov
- **Technologické aktualizácie**: Zarovnanie s najnovšími službami Azure a vydaniami azd
- **Audity prístupnosti**: Pravidelné kontroly inkluzívnych dizajnových princípov

## Politika podpory verzií

### Podpora aktuálnej verzie
- **Najnovšia hlavná verzia**: Plná podpora s pravidelnými aktualizáciami
- **Predchádzajúca hlavná verzia**: Bezpečnostné aktualizácie a kritické opravy na 12 mesiacov
- **Staršie verzie**: Iba podpora komunity, bez oficiálnych aktualizácií

### Pokyny k migrácii
Keď sú vydané hlavné verzie, poskytujeme:
- **Sprievodcovia migráciou**: Pokyny krok za krokom pre prechod
- **Poznámky o kompatibilite**: Podrobnosti o zmenách, ktoré môžu narušiť kompatibilitu
- **Podpora nástrojov**: Skripty alebo pomôcky na pomoc pri migrácii
- **Podpora komunity**: Vyhradené fóra pre otázky týkajúce sa migrácie

---

**Navigácia**
- **Predchádzajúca lekcia**: [Študijný sprievodca](resources/study-guide.md)
- **Nasledujúca lekcia**: Návrat na [Hlavný README](README.md)

**Zostaňte informovaní**: Sledujte tento repozitár pre upozornenia o nových vydaniach a dôležitých aktualizáciách vzdelávacích materiálov.

---

**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, uvedomte si, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.