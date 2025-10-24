<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T17:55:41+00:00",
  "source_file": "changelog.md",
  "language_code": "cs"
}
-->
# Změny - AZD pro začátečníky

## Úvod

Tento seznam změn dokumentuje všechny významné změny, aktualizace a vylepšení v repozitáři AZD pro začátečníky. Dodržujeme principy semantického verzování a udržujeme tento log, aby uživatelé mohli snadno pochopit, co se změnilo mezi jednotlivými verzemi.

## Cíle učení

Při procházení tohoto seznamu změn:
- Budete informováni o nových funkcích a přidaném obsahu
- Pochopíte vylepšení provedená v existující dokumentaci
- Budete sledovat opravy chyb a úpravy pro zajištění přesnosti
- Budete sledovat vývoj vzdělávacích materiálů v průběhu času

## Výsledky učení

Po prostudování záznamů změn budete schopni:
- Identifikovat nový obsah a dostupné zdroje pro učení
- Pochopit, které sekce byly aktualizovány nebo vylepšeny
- Plánovat svou vzdělávací cestu na základě nejaktuálnějších materiálů
- Poskytovat zpětnou vazbu a návrhy na budoucí vylepšení

## Historie verzí

### [v3.4.0] - 2025-10-24

#### Vylepšení náhledu infrastruktury a validace
**Tato verze přináší komplexní podporu nové funkce náhledu Azure Developer CLI a zlepšuje uživatelskou zkušenost workshopu.**

#### Přidáno
- **🧪 Dokumentace funkce azd provision --preview**: Komplexní pokrytí nové schopnosti náhledu infrastruktury
  - Referenční příručka příkazů a příklady použití v taháku
  - Podrobné začlenění do průvodce nasazením s případy použití a výhodami
  - Integrace kontroly před nasazením pro bezpečnější validaci
  - Aktualizace průvodce začátkem s postupy bezpečného nasazení
- **🚧 Banner stavu workshopu**: Profesionální HTML banner indikující stav vývoje workshopu
  - Design s gradientem a indikátory výstavby pro jasnou komunikaci s uživateli
  - Časová značka poslední aktualizace pro transparentnost
  - Responzivní design pro mobilní zařízení

#### Vylepšeno
- **Bezpečnost infrastruktury**: Funkce náhledu integrovaná do dokumentace nasazení
- **Validace před nasazením**: Automatizované skripty nyní zahrnují testování náhledu infrastruktury
- **Workflow vývojáře**: Aktualizované sekvence příkazů zahrnují náhled jako nejlepší praxi
- **Zkušenost workshopu**: Jasně stanovená očekávání pro uživatele ohledně stavu vývoje obsahu

#### Změněno
- **Nejlepší praxe nasazení**: Workflow s náhledem nyní doporučený přístup
- **Tok dokumentace**: Validace infrastruktury přesunuta dříve v procesu učení
- **Prezentace workshopu**: Profesionální komunikace stavu s jasnou časovou osou vývoje

#### Zlepšeno
- **Přístup "bezpečnost na prvním místě"**: Změny infrastruktury lze nyní validovat před nasazením
- **Týmová spolupráce**: Výsledky náhledu lze sdílet pro revizi a schválení
- **Povědomí o nákladech**: Lepší pochopení nákladů na zdroje před nasazením
- **Snížení rizik**: Snížení selhání nasazení díky předběžné validaci

#### Technická implementace
- **Integrace více dokumentů**: Funkce náhledu dokumentována ve 4 klíčových souborech
- **Vzory příkazů**: Konzistentní syntaxe a příklady v celé dokumentaci
- **Začlenění nejlepší praxe**: Náhled zahrnutý do validace workflow a skriptů
- **Vizualní indikátory**: Jasné označení NOVÉ funkce pro snadné nalezení

#### Infrastruktura workshopu
- **Komunikace stavu**: Profesionální HTML banner se stylováním gradientu
- **Uživatelská zkušenost**: Jasný stav vývoje zabraňuje zmatkům
- **Profesionální prezentace**: Udržuje důvěryhodnost repozitáře při stanovování očekávání
- **Transparentnost časové osy**: Časová značka poslední aktualizace říjen 2025 pro odpovědnost

### [v3.3.0] - 2025-09-24

#### Vylepšené materiály workshopu a interaktivní vzdělávací zkušenost
**Tato verze přináší komplexní materiály workshopu s interaktivními průvodci v prohlížeči a strukturovanými vzdělávacími cestami.**

#### Přidáno
- **🎥 Interaktivní průvodce workshopem**: Zkušenost workshopu v prohlížeči s možností náhledu MkDocs
- **📝 Strukturované instrukce workshopu**: 7-kroková vedená vzdělávací cesta od objevu po přizpůsobení
  - 0-Úvod: Přehled workshopu a nastavení
  - 1-Výběr šablony AI: Proces objevu a výběru šablony
  - 2-Validace šablony AI: Postupy nasazení a validace
  - 3-Rozbor šablony AI: Porozumění architektuře šablony
  - 4-Konfigurace šablony AI: Konfigurace a přizpůsobení
  - 5-Přizpůsobení šablony AI: Pokročilé úpravy a iterace
  - 6-Odstranění infrastruktury: Úklid a správa zdrojů
  - 7-Závěr: Shrnutí a další kroky
- **🛠️ Nástroje workshopu**: Konfigurace MkDocs s Material tématem pro vylepšenou vzdělávací zkušenost
- **🎯 Praktická vzdělávací cesta**: 3-kroková metodologie (Objev → Nasazení → Přizpůsobení)
- **📱 Integrace GitHub Codespaces**: Bezproblémové nastavení vývojového prostředí

#### Vylepšeno
- **Laboratoř AI workshopu**: Rozšířena o komplexní 2-3 hodinovou strukturovanou vzdělávací zkušenost
- **Dokumentace workshopu**: Profesionální prezentace s navigací a vizuálními pomůckami
- **Postup učení**: Jasné vedení krok za krokem od výběru šablony po nasazení do produkce
- **Zkušenost vývojáře**: Integrované nástroje pro zjednodušení vývojových workflow

#### Zlepšeno
- **Přístupnost**: Rozhraní v prohlížeči s vyhledáváním, funkcí kopírování a přepínáním témat
- **Samostatné učení**: Flexibilní struktura workshopu přizpůsobená různým rychlostem učení
- **Praktická aplikace**: Scénáře nasazení šablon AI v reálném světě
- **Integrace komunity**: Integrace Discordu pro podporu workshopu a spolupráci

#### Funkce workshopu
- **Vestavěné vyhledávání**: Rychlé nalezení klíčových slov a lekcí
- **Kopírování bloků kódu**: Funkce kopírování na hover pro všechny příklady kódu
- **Přepínání témat**: Podpora tmavého/světlého režimu pro různé preference
- **Vizuální prvky**: Snímky obrazovky a diagramy pro lepší pochopení
- **Integrace nápovědy**: Přímý přístup na Discord pro podporu komunity

### [v3.2.0] - 2025-09-17

#### Hlavní restrukturalizace navigace a systém učení podle kapitol
**Tato verze přináší komplexní strukturu učení podle kapitol s vylepšenou navigací v celém repozitáři.**

#### Přidáno
- **📚 Systém učení podle kapitol**: Restrukturalizace celého kurzu do 8 progresivních kapitol učení
  - Kapitola 1: Základy a rychlý start (⭐ - 30-45 min)
  - Kapitola 2: Vývoj zaměřený na AI (⭐⭐ - 1-2 hodiny)
  - Kapitola 3: Konfigurace a autentizace (⭐⭐ - 45-60 min)
  - Kapitola 4: Infrastruktura jako kód a nasazení (⭐⭐⭐ - 1-1,5 hodiny)
  - Kapitola 5: Řešení AI s více agenty (⭐⭐⭐⭐ - 2-3 hodiny)
  - Kapitola 6: Validace před nasazením a plánování (⭐⭐ - 1 hodina)
  - Kapitola 7: Řešení problémů a ladění (⭐⭐ - 1-1,5 hodiny)
  - Kapitola 8: Produkční a podnikové vzory (⭐⭐⭐⭐ - 2-3 hodiny)
- **📚 Komplexní navigační systém**: Konzistentní navigační záhlaví a zápatí ve všech dokumentech
- **🎯 Sledování pokroku**: Kontrolní seznam dokončení kurzu a systém ověření učení
- **🗺️ Vedení vzdělávací cesty**: Jasné vstupní body pro různé úrovně zkušeností a cíle
- **🔗 Navigace mezi kapitolami**: Jasně propojené související kapitoly a předpoklady

#### Vylepšeno
- **Struktura README**: Transformována na strukturovanou vzdělávací platformu s organizací podle kapitol
- **Navigace dokumentace**: Každá stránka nyní obsahuje kontext kapitoly a vedení v postupu
- **Organizace šablon**: Příklady a šablony mapovány na odpovídající kapitoly učení
- **Integrace zdrojů**: Taháky, FAQ a studijní příručky propojeny s relevantními kapitolami
- **Integrace workshopu**: Praktické laboratoře mapovány na cíle učení více kapitol

#### Změněno
- **Postup učení**: Přechod z lineární dokumentace na flexibilní učení podle kapitol
- **Umístění konfigurace**: Přesun průvodce konfigurací na kapitolu 3 pro lepší tok učení
- **Integrace obsahu AI**: Lepší začlenění obsahu specifického pro AI v průběhu vzdělávací cesty
- **Obsah pro produkci**: Pokročilé vzory konsolidovány v kapitole 8 pro podnikové studenty

#### Zlepšeno
- **Uživatelská zkušenost**: Jasné navigační stopy a indikátory postupu kapitol
- **Přístupnost**: Konzistentní navigační vzory pro snadnější pohyb v kurzu
- **Profesionální prezentace**: Struktura kurzu ve stylu univerzity vhodná pro akademické i firemní školení
- **Efektivita učení**: Snížený čas na nalezení relevantního obsahu díky vylepšené organizaci

#### Technická implementace
- **Navigační záhlaví**: Standardizovaná navigace kapitol ve více než 40 dokumentačních souborech
- **Navigační zápatí**: Konzistentní vedení postupu a indikátory dokončení kapitol
- **Propojení**: Komplexní interní propojení souvisejících konceptů
- **Mapování kapitol**: Šablony a příklady jasně spojeny s cíli učení

#### Vylepšení studijní příručky
- **📚 Komplexní cíle učení**: Restrukturalizace studijní příručky pro sladění se systémem 8 kapitol
- **🎯 Hodnocení podle kapitol**: Každá kapitola obsahuje specifické cíle učení a praktická cvičení
- **📋 Sledování pokroku**: Týdenní plán učení s měřitelnými výsledky a kontrolními seznamy dokončení
- **❓ Otázky k hodnocení**: Otázky pro ověření znalostí pro každou kapitolu s profesionálními výsledky
- **🛠️ Praktická cvičení**: Praktické aktivity s reálnými scénáři nasazení a řešení problémů
- **📊 Postup dovedností**: Jasný pokrok od základních konceptů k podnikovým vzorům s důrazem na rozvoj kariéry
- **🎓 Rámec certifikace**: Výsledky profesního rozvoje a systém uznání komunity
- **⏱️ Řízení časové osy**: Strukturovaný 10týdenní plán učení s validací milníků

### [v3.1.0] - 2025-09-17

#### Vylepšená řešení AI s více agenty
**Tato verze zlepšuje řešení pro maloobchod s více agenty díky lepším názvům agentů a vylepšené dokumentaci.**

#### Změněno
- **Terminologie více agentů**: Nahrazení "agent Cora" za "zákaznický agent" v celém řešení pro maloobchod s více agenty pro jasnější pochopení
- **Architektura agentů**: Aktualizace veškeré dokumentace, ARM šablon a příkladů kódu pro konzistentní používání názvu "zákaznický agent"
- **Příklady konfigurace**: Modernizované vzory konfigurace agentů s aktualizovanými názvy
- **Konzistence dokumentace**: Zajištění, že všechny odkazy používají profesionální, popisné názvy agentů

#### Vylepšeno
- **Balíček ARM šablon**: Aktualizace retail-multiagent-arm-template s odkazy na zákaznického agenta
- **Diagramy architektury**: Obnovené diagramy Mermaid s aktualizovanými názvy agentů
- **Příklady kódu**: Třídy Pythonu a příklady implementace nyní používají názvy CustomerAgent
- **Proměnné prostředí**: Aktualizace všech skriptů nasazení na konvence CUSTOMER_AGENT_NAME

#### Zlepšeno
- **Zkušenost vývojáře**: Jasnější role a odpovědnosti agentů v dokumentaci
- **Připravenost na produkci**: Lepší sladění s podnikovými konvencemi pojmenování
- **Vzdělávací materiály**: Intuitivnější názvy agentů pro vzdělávací účely
- **Použitelnost šablon**: Zjednodušené pochopení funkcí agentů a vzorů nasazení

#### Technické detaily
- Aktualizované diagramy architektury Mermaid s odkazy na CustomerAgent
- Nahrazení názvů tříd CoraAgent za CustomerAgent v příkladech Pythonu
- Úprava konfigurací ARM šablon JSON na typ agenta "customer"
- Aktualizace proměnných prostředí z CORA_AGENT_* na CUSTOMER_AGENT_* vzory
- Obnovení všech příkazů nasazení a konfigurací kontejnerů

### [v3.0.0] - 2025-09-12

#### Hlavní změny - Zaměření na vývoj AI a integrace Azure AI Foundry
**Tato verze transformuje repozitář na komplexní vzdělávací zdroj zaměřený na AI s integrací Azure AI Foundry.**

#### Přidáno
- **🤖 Vzdělávací cesta zaměřená na AI**: Kompletní restrukturalizace s prioritou pro vývojáře a inženýry AI
- **Průvodce integrací Azure AI Foundry**: Komplexní dokumentace pro propojení AZD se službami Azure AI Foundry
- **Vzory nasazení modelů AI**: Podrobný průvodce pokrývající výběr modelu, konfiguraci a strategie nasazení do produkce
- **Laboratoř AI workshopu**: 2-3 hodinový praktický workshop pro konverzi AI aplikací na řešení nasaditelná pomocí AZD
- **Nejlepší praxe pro produkční AI**: Vzory připravené pro podniky pro škálování, monitorování a zabezpečení AI zátěží
- **Průvodce řešením problémů specifických pro AI**: Komplexní řešení problémů pro Azure OpenAI, Cognitive Services a problémy s nasazením AI
- **Galerie šablon AI**: Doporučená kolekce šablon Azure AI Foundry s hodnocením složitosti
- **Materiály workshopu**: Kompletní struktura workshopu s praktickými laboratořemi a referenčními materiály

#### Vylepšeno
- **Str
- **Formát dokumentace**: Standardizace veškeré dokumentace s konzistentní strukturou zaměřenou na učení
- **Navigační tok**: Implementace logického postupu ve všech vzdělávacích materiálech
- **Prezentace obsahu**: Odstranění dekorativních prvků ve prospěch jasného, profesionálního formátování
- **Struktura odkazů**: Aktualizace všech interních odkazů pro podporu nového navigačního systému

#### Vylepšeno
- **Přístupnost**: Odstranění závislosti na emoji pro lepší kompatibilitu s čtečkami obrazovky
- **Profesionální vzhled**: Čistá prezentace ve stylu akademického prostředí vhodná pro firemní vzdělávání
- **Vzdělávací zážitek**: Strukturovaný přístup s jasnými cíli a výsledky pro každou lekci
- **Organizace obsahu**: Lepší logický tok a propojení mezi souvisejícími tématy

### [v1.0.0] - 2025-09-09

#### První vydání - Komplexní AZD vzdělávací úložiště

#### Přidáno
- **Základní struktura dokumentace**
  - Kompletní série průvodců pro začátečníky
  - Komplexní dokumentace k nasazení a zajištění prostředí
  - Podrobné zdroje pro řešení problémů a průvodce laděním
  - Nástroje a postupy pro ověření před nasazením

- **Modul pro začátečníky**
  - Základy AZD: Klíčové koncepty a terminologie
  - Průvodce instalací: Pokyny pro nastavení specifické pro platformu
  - Průvodce konfigurací: Nastavení prostředí a autentizace
  - První projekt: Praktický návod krok za krokem

- **Modul nasazení a zajištění prostředí**
  - Průvodce nasazením: Kompletní dokumentace pracovního postupu
  - Průvodce zajištěním prostředí: Infrastruktura jako kód s Bicep
  - Nejlepší postupy pro nasazení do produkčního prostředí
  - Vzory architektury pro více služeb

- **Modul ověření před nasazením**
  - Plánování kapacity: Ověření dostupnosti zdrojů Azure
  - Výběr SKU: Podrobné pokyny pro výběr úrovní služeb
  - Kontroly před spuštěním: Automatizované validační skripty (PowerShell a Bash)
  - Nástroje pro odhad nákladů a plánování rozpočtu

- **Modul řešení problémů**
  - Běžné problémy: Často se vyskytující problémy a jejich řešení
  - Průvodce laděním: Systematické metodiky řešení problémů
  - Pokročilé diagnostické techniky a nástroje
  - Monitorování výkonu a optimalizace

- **Zdroje a reference**
  - Tahák příkazů: Rychlý přehled základních příkazů
  - Slovníček: Komplexní definice terminologie a zkratek
  - FAQ: Podrobné odpovědi na běžné otázky
  - Odkazy na externí zdroje a komunitní spojení

- **Příklady a šablony**
  - Příklad jednoduché webové aplikace
  - Šablona pro nasazení statické webové stránky
  - Konfigurace aplikace v kontejnerech
  - Vzory integrace databází
  - Příklady architektury mikroslužeb
  - Implementace serverless funkcí

#### Funkce
- **Podpora více platforem**: Průvodce instalací a konfigurací pro Windows, macOS a Linux
- **Různé úrovně dovedností**: Obsah určený pro studenty i profesionální vývojáře
- **Praktické zaměření**: Praktické příklady a scénáře z reálného světa
- **Komplexní pokrytí**: Od základních konceptů po pokročilé firemní vzory
- **Bezpečnost na prvním místě**: Nejlepší bezpečnostní postupy integrované do celého obsahu
- **Optimalizace nákladů**: Pokyny pro efektivní nasazení a správu zdrojů

#### Kvalita dokumentace
- **Podrobné příklady kódu**: Praktické, otestované ukázky kódu
- **Pokyny krok za krokem**: Jasné, proveditelné instrukce
- **Komplexní řešení chyb**: Řešení běžných problémů
- **Integrace nejlepších postupů**: Průmyslové standardy a doporučení
- **Kompatibilita verzí**: Aktualizováno podle nejnovějších služeb Azure a funkcí azd

## Plánovaná budoucí vylepšení

### Verze 3.1.0 (Plánováno)
#### Rozšíření AI platformy
- **Podpora více modelů**: Vzory integrace pro Hugging Face, Azure Machine Learning a vlastní modely
- **Rámce pro AI agenty**: Šablony pro nasazení LangChain, Semantic Kernel a AutoGen
- **Pokročilé RAG vzory**: Možnosti vektorových databází mimo Azure AI Search (Pinecone, Weaviate atd.)
- **Pozorovatelnost AI**: Vylepšené monitorování výkonu modelů, využití tokenů a kvality odpovědí

#### Zkušenost vývojáře
- **Rozšíření VS Code**: Integrované prostředí pro vývoj AZD + AI Foundry
- **Integrace GitHub Copilot**: Generování šablon AZD asistované AI
- **Interaktivní tutoriály**: Praktická cvičení s automatizovaným ověřováním pro AI scénáře
- **Video obsah**: Doplňkové video tutoriály pro vizuální studenty zaměřené na nasazení AI

### Verze 4.0.0 (Plánováno)
#### Firemní AI vzory
- **Rámec správy**: Správa modelů AI, shoda s předpisy a auditní stopy
- **AI pro více nájemců**: Vzory pro poskytování služeb AI více zákazníkům s oddělenými službami
- **Nasazení AI na okraji**: Integrace s Azure IoT Edge a instancemi kontejnerů
- **Hybridní cloud AI**: Vzory nasazení AI na více cloudech a v hybridním prostředí

#### Pokročilé funkce
- **Automatizace AI pipeline**: Integrace MLOps s pipeline Azure Machine Learning
- **Pokročilá bezpečnost**: Vzory nulové důvěry, privátní koncové body a pokročilá ochrana proti hrozbám
- **Optimalizace výkonu**: Pokročilé strategie ladění a škálování pro aplikace AI s vysokou propustností
- **Globální distribuce**: Vzory doručování obsahu a ukládání do mezipaměti na okraji pro aplikace AI

### Verze 3.0.0 (Plánováno) - Nahrazeno aktuálním vydáním
#### Navrhované doplňky - Nyní implementováno ve verzi 3.0.0
- ✅ **Obsah zaměřený na AI**: Komplexní integrace Azure AI Foundry (Dokončeno)
- ✅ **Interaktivní tutoriály**: Praktická laboratoř pro AI (Dokončeno)
- ✅ **Pokročilý bezpečnostní modul**: Bezpečnostní vzory specifické pro AI (Dokončeno)
- ✅ **Optimalizace výkonu**: Strategie ladění pracovních zátěží AI (Dokončeno)

### Verze 2.1.0 (Plánováno) - Částečně implementováno ve verzi 3.0.0
#### Menší vylepšení - Některé dokončeny v aktuálním vydání
- ✅ **Další příklady**: Scénáře nasazení zaměřené na AI (Dokončeno)
- ✅ **Rozšířené FAQ**: Otázky a řešení specifické pro AI (Dokončeno)
- **Integrace nástrojů**: Rozšířené průvodce integrací IDE a editorů
- ✅ **Rozšíření monitorování**: Vzory monitorování a upozornění specifické pro AI (Dokončeno)

#### Stále plánováno pro budoucí vydání
- **Dokumentace přizpůsobená mobilním zařízením**: Responzivní design pro mobilní učení
- **Offline přístup**: Balíčky dokumentace ke stažení
- **Vylepšená integrace IDE**: Rozšíření VS Code pro pracovní postupy AZD + AI
- **Komunitní panel**: Metriky komunity v reálném čase a sledování příspěvků

## Přispívání do changelogu

### Hlášení změn
Při přispívání do tohoto úložiště prosím zajistěte, aby záznamy v changelogu obsahovaly:

1. **Číslo verze**: Podle semantického verzování (major.minor.patch)
2. **Datum**: Datum vydání nebo aktualizace ve formátu YYYY-MM-DD
3. **Kategorie**: Přidáno, Změněno, Zastaralé, Odstraněno, Opraveno, Bezpečnost
4. **Jasný popis**: Stručný popis změny
5. **Hodnocení dopadu**: Jak změny ovlivní stávající uživatele

### Kategorie změn

#### Přidáno
- Nové funkce, sekce dokumentace nebo schopnosti
- Nové příklady, šablony nebo vzdělávací zdroje
- Další nástroje, skripty nebo pomůcky

#### Změněno
- Úpravy stávající funkčnosti nebo dokumentace
- Aktualizace pro zlepšení jasnosti nebo přesnosti
- Restrukturalizace obsahu nebo organizace

#### Zastaralé
- Funkce nebo přístupy, které se postupně vyřazují
- Sekce dokumentace určené k odstranění
- Metody, které mají lepší alternativy

#### Odstraněno
- Funkce, dokumentace nebo příklady, které již nejsou relevantní
- Zastaralé informace nebo vyřazené přístupy
- Nadbytečný nebo konsolidovaný obsah

#### Opraveno
- Opravy chyb v dokumentaci nebo kódu
- Řešení hlášených problémů nebo potíží
- Zlepšení přesnosti nebo funkčnosti

#### Bezpečnost
- Vylepšení nebo opravy související s bezpečností
- Aktualizace bezpečnostních nejlepších postupů
- Řešení bezpečnostních zranitelností

### Pokyny pro semantické verzování

#### Hlavní verze (X.0.0)
- Změny, které vyžadují zásah uživatele
- Významná restrukturalizace obsahu nebo organizace
- Změny, které mění základní přístup nebo metodologii

#### Menší verze (X.Y.0)
- Nové funkce nebo přídavky obsahu
- Vylepšení, která zachovávají zpětnou kompatibilitu
- Další příklady, nástroje nebo zdroje

#### Oprava verze (X.Y.Z)
- Opravy chyb a korekce
- Menší vylepšení stávajícího obsahu
- Upřesnění a drobná vylepšení

## Zpětná vazba a návrhy od komunity

Aktivně podporujeme zpětnou vazbu od komunity, abychom zlepšili tento vzdělávací zdroj:

### Jak poskytnout zpětnou vazbu
- **GitHub Issues**: Nahlaste problémy nebo navrhněte vylepšení (vítány jsou i problémy specifické pro AI)
- **Diskuse na Discordu**: Sdílejte nápady a zapojte se do komunity Azure AI Foundry
- **Pull Requests**: Přispějte přímými vylepšeními obsahu, zejména šablonami a průvodci pro AI
- **Azure AI Foundry Discord**: Účastněte se diskuzí na kanálu #Azure pro AZD + AI
- **Komunitní fóra**: Účastněte se širších diskuzí mezi vývojáři Azure

### Kategorie zpětné vazby
- **Přesnost obsahu AI**: Opravy informací o integraci a nasazení služeb AI
- **Vzdělávací zážitek**: Návrhy na zlepšení vzdělávacího toku pro vývojáře AI
- **Chybějící obsah AI**: Požadavky na další šablony, vzory nebo příklady AI
- **Přístupnost**: Vylepšení pro různé vzdělávací potřeby
- **Integrace nástrojů AI**: Návrhy na lepší integraci pracovního postupu vývoje AI
- **Vzory pro produkční AI**: Požadavky na vzory nasazení AI pro podnikové prostředí

### Závazek k odpovědím
- **Odpověď na problémy**: Do 48 hodin od nahlášení problémů
- **Požadavky na funkce**: Vyhodnocení do jednoho týdne
- **Příspěvky komunity**: Revize do jednoho týdne
- **Bezpečnostní problémy**: Okamžitá priorita s urychlenou odpovědí

## Plán údržby

### Pravidelné aktualizace
- **Měsíční revize**: Přesnost obsahu a validace odkazů
- **Čtvrtletní aktualizace**: Hlavní přídavky a vylepšení obsahu
- **Půlroční revize**: Komplexní restrukturalizace a vylepšení
- **Roční vydání**: Hlavní aktualizace verzí s významnými vylepšeními

### Monitorování a zajištění kvality
- **Automatizované testování**: Pravidelná validace příkladů kódu a odkazů
- **Integrace zpětné vazby od komunity**: Pravidelné začlenění návrhů uživatelů
- **Technologické aktualizace**: Slučitelnost s nejnovějšími službami Azure a verzemi azd
- **Audity přístupnosti**: Pravidelné revize principů inkluzivního designu

## Politika podpory verzí

### Podpora aktuální verze
- **Nejnovější hlavní verze**: Plná podpora s pravidelnými aktualizacemi
- **Předchozí hlavní verze**: Aktualizace bezpečnosti a kritické opravy po dobu 12 měsíců
- **Starší verze**: Pouze podpora komunity, bez oficiálních aktualizací

### Pokyny pro migraci
Při vydání hlavních verzí poskytujeme:
- **Průvodce migrací**: Pokyny pro přechod krok za krokem
- **Poznámky ke kompatibilitě**: Podrobnosti o změnách, které mohou způsobit problémy
- **Podpora nástrojů**: Skripty nebo pomůcky pro usnadnění migrace
- **Podpora komunity**: Vyhrazená fóra pro otázky týkající se migrace

---

**Navigace**
- **Předchozí lekce**: [Studijní průvodce](resources/study-guide.md)
- **Další lekce**: Zpět na [Hlavní README](README.md)

**Zůstaňte informováni**: Sledujte toto úložiště pro oznámení o nových vydáních a důležitých aktualizacích vzdělávacích materiálů.

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.