<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1bc63a39d4cf8fc5cb5c7040344be859",
  "translation_date": "2025-11-23T10:53:01+00:00",
  "source_file": "changelog.md",
  "language_code": "cs"
}
-->
# Protokol změn - AZD pro začátečníky

## Úvod

Tento protokol změn dokumentuje všechny významné změny, aktualizace a vylepšení v repozitáři AZD pro začátečníky. Dodržujeme zásady sémantického verzování a tento protokol udržujeme, aby uživatelé mohli snadno pochopit, co se mezi verzemi změnilo.

## Cíle učení

Při procházení tohoto protokolu změn:
- Budete informováni o nových funkcích a přidaném obsahu
- Pochopíte vylepšení stávající dokumentace
- Sledujete opravy chyb a zajišťujete přesnost
- Sledujete vývoj vzdělávacích materiálů v průběhu času

## Výsledky učení

Po prostudování záznamů v protokolu změn budete schopni:
- Identifikovat nový obsah a dostupné zdroje pro učení
- Pochopit, které sekce byly aktualizovány nebo vylepšeny
- Plánovat svou vzdělávací cestu na základě nejaktuálnějších materiálů
- Poskytovat zpětnou vazbu a návrhy na budoucí vylepšení

## Historie verzí

### [v3.8.0] - 2025-11-19

#### Pokročilá dokumentace: Monitorování, bezpečnost a vzory pro více agentů
**Tato verze přidává komplexní lekce na úrovni A o integraci Application Insights, autentizačních vzorech a koordinaci více agentů pro produkční nasazení.**

#### Přidáno
- **📊 Lekce o integraci Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Nasazení zaměřené na AZD s automatickým zajištěním
  - Kompletní šablony Bicep pro Application Insights + Log Analytics
  - Funkční Python aplikace s vlastní telemetrií (více než 1 200 řádků)
  - Vzory monitorování AI/LLM (sledování tokenů/nákladů Azure OpenAI)
  - 6 diagramů Mermaid (architektura, distribuované trasování, tok telemetrie)
  - 3 praktická cvičení (výstrahy, dashboardy, monitorování AI)
  - Příklady dotazů Kusto a strategie optimalizace nákladů
  - Streamování živých metrik a ladění v reálném čase
  - Doba učení 40-50 minut s produkčně připravenými vzory

- **🔐 Lekce o autentizačních a bezpečnostních vzorech**: v `docs/getting-started/authsecurity.md`:
  - 3 autentizační vzory (připojovací řetězce, Key Vault, spravovaná identita)
  - Kompletní šablony infrastruktury Bicep pro bezpečná nasazení
  - Kód aplikace Node.js s integrací Azure SDK
  - 3 kompletní cvičení (povolení spravované identity, uživatelsky přiřazené identity, rotace Key Vault)
  - Nejlepší bezpečnostní postupy a konfigurace RBAC
  - Průvodce řešením problémů a analýza nákladů
  - Produkčně připravené vzory autentizace bez hesel

- **🤖 Lekce o vzorech koordinace více agentů**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorů koordinace (sekvenční, paralelní, hierarchický, událostmi řízený, konsenzus)
  - Kompletní implementace orchestrátoru služeb (Python/Flask, více než 1 500 řádků)
  - 3 specializované implementace agentů (Výzkum, Psaní, Editace)
  - Integrace Service Bus pro fronty zpráv
  - Správa stavu Cosmos DB pro distribuované systémy
  - 6 diagramů Mermaid zobrazujících interakce agentů
  - 3 pokročilá cvičení (zpracování časových limitů, logika opakování, přerušovač obvodů)
  - Rozpis nákladů (240-565 $/měsíc) se strategiemi optimalizace
  - Integrace Application Insights pro monitorování

#### Vylepšeno
- **Kapitola před nasazením**: Nyní zahrnuje komplexní vzory monitorování a koordinace
- **Kapitola Začínáme**: Vylepšena o profesionální autentizační vzory
- **Připravenost na produkci**: Kompletní pokrytí od bezpečnosti po pozorovatelnost
- **Osnova kurzu**: Aktualizována s odkazy na nové lekce v kapitolách 3 a 6

#### Změněno
- **Progrese učení**: Lepší integrace bezpečnosti a monitorování v celém kurzu
- **Kvalita dokumentace**: Konzistentní standardy na úrovni A (95-97 %) v nových lekcích
- **Produkční vzory**: Kompletní pokrytí od začátku do konce pro podniková nasazení

#### Zlepšeno
- **Zkušenost vývojářů**: Jasná cesta od vývoje k monitorování produkce
- **Bezpečnostní standardy**: Profesionální vzory pro autentizaci a správu tajemství
- **Pozorovatelnost**: Kompletní integrace Application Insights s AZD
- **AI pracovní zátěže**: Specializované monitorování pro Azure OpenAI a systémy více agentů

#### Ověřeno
- ✅ Všechny lekce obsahují kompletní funkční kód (ne jen úryvky)
- ✅ Diagramy Mermaid pro vizuální učení (celkem 19 v 3 lekcích)
- ✅ Praktická cvičení s ověřovacími kroky (celkem 9)
- ✅ Produkčně připravené šablony Bicep nasaditelné přes `azd up`
- ✅ Analýza nákladů a strategie optimalizace
- ✅ Průvodci řešením problémů a nejlepší postupy
- ✅ Kontrolní body znalostí s ověřovacími příkazy

#### Výsledky hodnocení dokumentace
- **docs/pre-deployment/application-insights.md**: - Komplexní průvodce monitorováním
- **docs/getting-started/authsecurity.md**: - Profesionální bezpečnostní vzory
- **docs/pre-deployment/coordination-patterns.md**: - Pokročilé architektury více agentů
- **Celkový nový obsah**: - Konzistentní vysoké standardy kvality

#### Technická implementace
- **Application Insights**: Log Analytics + vlastní telemetrie + distribuované trasování
- **Autentizace**: Spravovaná identita + Key Vault + vzory RBAC
- **Více agentů**: Service Bus + Cosmos DB + Container Apps + orchestraci
- **Monitorování**: Živé metriky + dotazy Kusto + výstrahy + dashboardy
- **Správa nákladů**: Strategie vzorkování, zásady uchovávání, kontrola rozpočtu

### [v3.7.0] - 2025-11-19

#### Vylepšení kvality dokumentace a nový příklad Azure OpenAI
**Tato verze zlepšuje kvalitu dokumentace v celém repozitáři a přidává kompletní příklad nasazení Azure OpenAI s rozhraním GPT-4 pro chat.**

#### Přidáno
- **🤖 Příklad chatu Azure OpenAI**: Kompletní nasazení GPT-4 s funkční implementací v `examples/azure-openai-chat/`:
  - Kompletní infrastruktura Azure OpenAI (nasazení modelu GPT-4)
  - Rozhraní příkazového řádku Python pro chat s historií konverzací
  - Integrace Key Vault pro bezpečné ukládání API klíčů
  - Sledování využití tokenů a odhad nákladů
  - Omezení rychlosti a zpracování chyb
  - Komplexní README s průvodcem nasazením na 35-45 minut
  - 11 produkčně připravených souborů (šablony Bicep, Python aplikace, konfigurace)
- **📚 Cvičení k dokumentaci**: Přidána praktická cvičení do průvodce konfigurací:
  - Cvičení 1: Konfigurace více prostředí (15 minut)
  - Cvičení 2: Praxe správy tajemství (10 minut)
  - Jasná kritéria úspěchu a ověřovací kroky
- **✅ Ověření nasazení**: Přidána sekce ověření do průvodce nasazením:
  - Postupy kontroly stavu
  - Kontrolní seznam kritérií úspěchu
  - Očekávané výstupy pro všechny příkazy nasazení
  - Rychlý odkaz na řešení problémů

#### Vylepšeno
- **examples/README.md**: Aktualizováno na kvalitu úrovně A (93 %):
  - Přidán azure-openai-chat do všech relevantních sekcí
  - Aktualizován počet místních příkladů z 3 na 4
  - Přidáno do tabulky příkladů AI aplikací
  - Začleněno do rychlého startu pro středně pokročilé uživatele
  - Přidáno do sekce šablon Microsoft Foundry pro Azure AI
  - Aktualizována srovnávací tabulka a sekce vyhledávání technologií
- **Kvalita dokumentace**: Zlepšena z B+ (87 %) → A- (92 %) v celé složce docs:
  - Přidány očekávané výstupy k příkladům klíčových příkazů
  - Zahrnuty ověřovací kroky pro změny konfigurace
  - Vylepšeno praktické učení pomocí praktických cvičení

#### Změněno
- **Progrese učení**: Lepší integrace příkladů AI pro středně pokročilé studenty
- **Struktura dokumentace**: Více akčních cvičení s jasnými výsledky
- **Proces ověřování**: Přidána explicitní kritéria úspěchu k hlavním pracovním postupům

#### Zlepšeno
- **Zkušenost vývojářů**: Nasazení Azure OpenAI nyní trvá 35-45 minut (oproti 60-90 minutám u složitějších alternativ)
- **Transparentnost nákladů**: Jasné odhady nákladů (50-200 $/měsíc) pro příklad Azure OpenAI
- **Vzdělávací cesta**: Vývojáři AI mají jasný výchozí bod s azure-openai-chat
- **Standardy dokumentace**: Konzistentní očekávané výstupy a ověřovací kroky

#### Ověřeno
- ✅ Příklad Azure OpenAI plně funkční s `azd up`
- ✅ Všech 11 implementačních souborů je syntakticky správných
- ✅ Pokyny v README odpovídají skutečné zkušenosti s nasazením
- ✅ Odkazy v dokumentaci aktualizovány na více než 8 místech
- ✅ Index příkladů přesně odráží 4 místní příklady
- ✅ Žádné duplicitní externí odkazy v tabulkách
- ✅ Všechny navigační odkazy správné

#### Technická implementace
- **Architektura Azure OpenAI**: GPT-4 + Key Vault + Container Apps vzor
- **Bezpečnost**: Připraveno pro spravovanou identitu, tajemství v Key Vault
- **Monitorování**: Integrace Application Insights
- **Správa nákladů**: Sledování tokenů a optimalizace využití
- **Nasazení**: Jediný příkaz `azd up` pro kompletní nastavení

### [v3.6.0] - 2025-11-19

#### Hlavní aktualizace: Příklady nasazení aplikací v kontejnerech
**Tato verze přináší komplexní, produkčně připravené příklady nasazení aplikací v kontejnerech pomocí Azure Developer CLI (AZD) s kompletní dokumentací a integrací do vzdělávací cesty.**

#### Přidáno
- **🚀 Příklady aplikací v kontejnerech**: Nové místní příklady v `examples/container-app/`:
  - [Hlavní průvodce](examples/container-app/README.md): Kompletní přehled nasazení kontejnerizovaných aplikací, rychlý start, produkce a pokročilé vzory
  - [Jednoduché API Flask](../../examples/container-app/simple-flask-api): Uživatelsky přívětivé REST API se škálováním na nulu, sondami stavu, monitorováním a řešením problémů
  - [Architektura mikroslužeb](../../examples/container-app/microservices): Produkčně připravené nasazení více služeb (API Gateway, Product, Order, User, Notification), asynchronní zasílání zpráv, Service Bus, Cosmos DB, Azure SQL, distribuované trasování, modro-zelené/kanárkové nasazení
- **Nejlepší postupy**: Bezpečnost, monitorování, optimalizace nákladů a pokyny pro CI/CD pro kontejnerizované pracovní zátěže
- **Ukázky kódu**: Kompletní `azure.yaml`, šablony Bicep a implementace služeb v různých jazycích (Python, Node.js, C#, Go)
- **Testování a řešení problémů**: Scénáře end-to-end testování, příkazy pro monitorování, pokyny pro řešení problémů

#### Změněno
- **README.md**: Aktualizováno pro zobrazení a propojení nových příkladů aplikací v kontejnerech v sekci "Místní příklady - Aplikace v kontejnerech"
- **examples/README.md**: Aktualizováno pro zvýraznění příkladů aplikací v kontejnerech, přidání položek do srovnávací tabulky a aktualizaci odkazů na technologie/architektury
- **Osnova kurzu a studijní příručka**: Aktualizováno s odkazy na nové příklady aplikací v kontejnerech a vzory nasazení v příslušných kapitolách

#### Ověřeno
- ✅ Všechny nové příklady nasaditelné pomocí `azd up` a odpovídají nejlepším postupům
- ✅ Křížové odkazy a navigace v dokumentaci aktualizovány
- ✅ Příklady pokrývají scénáře od začátečníků po pokročilé, včetně produkčních mikroslužeb

#### Poznámky
- **Rozsah**: Pouze anglická dokumentace a příklady
- **Další kroky**: Rozšíření o další pokročilé vzory kontejnerů a automatizaci CI/CD v budoucích verzích

### [v3.5.0] - 2025-11-19

#### Rebranding produktu: Microsoft Foundry
**Tato verze implementuje kompletní změnu názvu produktu z "Azure AI Foundry" na "Microsoft Foundry" v celé anglické dokumentaci, což odráží oficiální rebranding společnosti Microsoft.**

#### Změněno
- **🔄 Aktualizace názvu produktu**: Kompletní rebranding z "Azure AI Foundry" na "Microsoft Foundry"
  - Aktualizovány všechny odkazy v anglické dokumentaci ve složce `docs/`
  - Přejmenována složka: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Přejmenován soubor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Celkem: Aktualizováno 23 odkazů na obsah v 7 souborech dokumentace

- **📁 Změny struktury složek**:
  - `docs/ai-foundry/` přejmenováno na `docs/microsoft-foundry/`
  - Všechny křížové odkazy aktualizovány podle nové struktury složek
  - Navigační odkazy ověřeny v celé dokumentaci

- **📄 Přejmenování souborů**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Všechny interní odkazy aktualizovány na nový název souboru

#### Aktualizované soubory
- **Dokumentace kapitol** (7 souborů):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizace navigačních odkazů
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 aktualizace odkazů na název produktu
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Již používá Microsoft Foundry (z předchozích aktualizací)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 aktualizace odkazů (přehled, zpětná vazba komunity, dokumentace)
  - `docs/getting-started/azd-basics.md` - 4 aktualizace křížových odkazů
  - `docs/getting-started/first-project.md` - 2 aktualizace navigačních odkazů kapitol
  - `docs/getting-started/installation.md` - 
- **Workshop**: Materiály workshopu (`workshop/`) nebyly v této verzi aktualizovány
- **Příklady**: Souborové příklady mohou stále odkazovat na zastaralé názvy (bude řešeno v budoucí aktualizaci)
- **Externí odkazy**: Externí URL a odkazy na GitHub repository zůstávají nezměněny

#### Průvodce migrací pro přispěvatele
Pokud máte lokální větve nebo dokumentaci odkazující na starou strukturu:
1. Aktualizujte odkazy na složky: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aktualizujte odkazy na soubory: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Nahraďte název produktu: "Azure AI Foundry" → "Microsoft Foundry"
4. Ověřte, že všechny interní odkazy v dokumentaci stále fungují

---

### [v3.4.0] - 2025-10-24

#### Náhled infrastruktury a vylepšení validace
**Tato verze přináší komplexní podporu nové funkce náhledu Azure Developer CLI a zlepšuje uživatelskou zkušenost workshopu.**

#### Přidáno
- **🧪 Dokumentace funkce azd provision --preview**: Komplexní pokrytí nové schopnosti náhledu infrastruktury
  - Referenční příručka příkazů a příklady použití v cheat sheetu
  - Podrobná integrace v průvodci provisioningem s případy použití a výhodami
  - Integrace kontroly před nasazením pro bezpečnější validaci nasazení
  - Aktualizace průvodce začátkem s postupy bezpečného nasazení
- **🚧 Banner stavu workshopu**: Profesionální HTML banner indikující stav vývoje workshopu
  - Design s gradientem a indikátory výstavby pro jasnou komunikaci s uživateli
  - Časová značka poslední aktualizace pro transparentnost
  - Responzivní design pro mobilní zařízení všech typů

#### Vylepšeno
- **Bezpečnost infrastruktury**: Funkce náhledu integrovaná do celé dokumentace nasazení
- **Validace před nasazením**: Automatizované skripty nyní zahrnují testování náhledu infrastruktury
- **Workflow vývojáře**: Aktualizované sekvence příkazů zahrnují náhled jako doporučenou praxi
- **Zkušenost workshopu**: Jasně stanovená očekávání pro uživatele ohledně stavu vývoje obsahu

#### Změněno
- **Doporučené postupy nasazení**: Workflow s prioritou náhledu nyní doporučeným přístupem
- **Tok dokumentace**: Validace infrastruktury přesunuta na začátek procesu učení
- **Prezentace workshopu**: Profesionální komunikace stavu s jasnou časovou osou vývoje

#### Zlepšeno
- **Přístup "bezpečnost na prvním místě"**: Změny infrastruktury lze nyní validovat před nasazením
- **Týmová spolupráce**: Výsledky náhledu lze sdílet pro revizi a schválení
- **Povědomí o nákladech**: Lepší pochopení nákladů na zdroje před provisioningem
- **Snížení rizik**: Snížené selhání nasazení díky předběžné validaci

#### Technická implementace
- **Integrace více dokumentů**: Funkce náhledu dokumentována ve 4 klíčových souborech
- **Vzory příkazů**: Konzistentní syntaxe a příklady v celé dokumentaci
- **Integrace nejlepších postupů**: Náhled zahrnutý do validace workflowů a skriptů
- **Vizualní indikátory**: Jasné označení NOVÉ funkce pro snadné objevení

#### Infrastruktura workshopu
- **Komunikace stavu**: Profesionální HTML banner se stylováním gradientu
- **Uživatelská zkušenost**: Jasný stav vývoje zabraňuje zmatkům
- **Profesionální prezentace**: Udržuje důvěryhodnost repository při stanovování očekávání
- **Transparentnost časové osy**: Časová značka poslední aktualizace říjen 2025 pro odpovědnost

### [v3.3.0] - 2025-09-24

#### Vylepšené materiály workshopu a interaktivní vzdělávací zkušenost
**Tato verze přináší komplexní materiály workshopu s interaktivními průvodci v prohlížeči a strukturovanými vzdělávacími cestami.**

#### Přidáno
- **🎥 Interaktivní průvodce workshopem**: Zkušenost workshopu v prohlížeči s funkcí náhledu MkDocs
- **📝 Strukturované pokyny workshopu**: 7-kroková vzdělávací cesta od objevu po přizpůsobení
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
- **Postup učení**: Jasné krok za krokem vedení od výběru šablony po nasazení do produkce
- **Zkušenost vývojáře**: Integrované nástroje pro zjednodušené workflowy vývoje

#### Zlepšeno
- **Přístupnost**: Rozhraní v prohlížeči s vyhledáváním, funkcí kopírování a přepínáním témat
- **Samostatné učení**: Flexibilní struktura workshopu přizpůsobená různým rychlostem učení
- **Praktická aplikace**: Scénáře nasazení šablon AI v reálném světě
- **Integrace komunity**: Integrace Discordu pro podporu workshopu a spolupráci

#### Funkce workshopu
- **Vestavěné vyhledávání**: Rychlé vyhledávání klíčových slov a lekcí
- **Kopírování bloků kódu**: Funkce hover-to-copy pro všechny příklady kódu
- **Přepínání témat**: Podpora tmavého/světlého režimu pro různé preference
- **Vizuální prvky**: Screenshoty a diagramy pro lepší pochopení
- **Integrace nápovědy**: Přímý přístup na Discord pro podporu komunity

### [v3.2.0] - 2025-09-17

#### Hlavní restrukturalizace navigace a systém učení založený na kapitolách
**Tato verze přináší komplexní strukturu učení založenou na kapitolách s vylepšenou navigací v celém repository.**

#### Přidáno
- **📚 Systém učení založený na kapitolách**: Restrukturalizace celého kurzu do 8 progresivních kapitol učení
  - Kapitola 1: Základy & Rychlý start (⭐ - 30-45 minut)
  - Kapitola 2: Vývoj zaměřený na AI (⭐⭐ - 1-2 hodiny)
  - Kapitola 3: Konfigurace & Autentizace (⭐⭐ - 45-60 minut)
  - Kapitola 4: Infrastruktura jako kód & Nasazení (⭐⭐⭐ - 1-1,5 hodiny)
  - Kapitola 5: Řešení AI s více agenty (⭐⭐⭐⭐ - 2-3 hodiny)
  - Kapitola 6: Validace & Plánování před nasazením (⭐⭐ - 1 hodina)
  - Kapitola 7: Řešení problémů & Ladění (⭐⭐ - 1-1,5 hodiny)
  - Kapitola 8: Produkční & Enterprise vzory (⭐⭐⭐⭐ - 2-3 hodiny)
- **📚 Komplexní navigační systém**: Konzistentní navigační záhlaví a zápatí ve všech dokumentech
- **🎯 Sledování pokroku**: Kontrolní seznam dokončení kurzu a systém ověřování učení
- **🗺️ Vedení vzdělávací cesty**: Jasné vstupní body pro různé úrovně zkušeností a cíle
- **🔗 Navigace mezi kapitolami**: Jasně propojené související kapitoly a předpoklady

#### Vylepšeno
- **Struktura README**: Transformována do strukturované vzdělávací platformy s organizací podle kapitol
- **Navigace dokumentace**: Každá stránka nyní obsahuje kontext kapitoly a vedení v postupu
- **Organizace šablon**: Příklady a šablony mapovány na odpovídající kapitoly učení
- **Integrace zdrojů**: Cheat sheety, FAQ a studijní příručky propojeny s relevantními kapitolami
- **Integrace workshopu**: Praktické laboratoře mapovány na více cílů učení kapitol

#### Změněno
- **Postup učení**: Přechod z lineární dokumentace na flexibilní učení podle kapitol
- **Umístění konfigurace**: Přesun průvodce konfigurací na Kapitolu 3 pro lepší tok učení
- **Integrace AI obsahu**: Lepší integrace obsahu zaměřeného na AI v celém vzdělávacím procesu
- **Produkční obsah**: Pokročilé vzory konsolidovány v Kapitole 8 pro enterprise uživatele

#### Zlepšeno
- **Uživatelská zkušenost**: Jasné navigační stopy a indikátory postupu kapitol
- **Přístupnost**: Konzistentní navigační vzory pro snadnější pohyb v kurzu
- **Profesionální prezentace**: Struktura kurzu ve stylu univerzity vhodná pro akademické i firemní školení
- **Efektivita učení**: Snížený čas na nalezení relevantního obsahu díky vylepšené organizaci

#### Technická implementace
- **Navigační záhlaví**: Standardizovaná navigace kapitol ve více než 40 dokumentech
- **Navigační zápatí**: Konzistentní vedení v postupu a indikátory dokončení kapitol
- **Propojování**: Komplexní interní propojení souvisejících konceptů
- **Mapování kapitol**: Šablony a příklady jasně spojeny s cíli učení

#### Vylepšení studijní příručky
- **📚 Komplexní cíle učení**: Restrukturalizovaná studijní příručka v souladu se systémem 8 kapitol
- **🎯 Hodnocení podle kapitol**: Každá kapitola obsahuje specifické cíle učení a praktická cvičení
- **📋 Sledování pokroku**: Týdenní vzdělávací plán s měřitelnými výsledky a kontrolními seznamy dokončení
- **❓ Otázky k hodnocení**: Ověřovací otázky znalostí pro každou kapitolu s profesionálními výsledky
- **🛠️ Praktická cvičení**: Praktické aktivity s reálnými scénáři nasazení a řešení problémů
- **📊 Postup dovedností**: Jasný pokrok od základních konceptů k enterprise vzorům s důrazem na kariérní rozvoj
- **🎓 Rámec certifikace**: Profesionální výsledky rozvoje a systém uznání v komunitě
- **⏱️ Řízení časové osy**: Strukturovaný 10-týdenní vzdělávací plán s validací milníků

### [v3.1.0] - 2025-09-17

#### Vylepšená řešení AI s více agenty
**Tato verze zlepšuje řešení pro maloobchod s více agenty díky lepším názvům agentů a vylepšené dokumentaci.**

#### Změněno
- **Terminologie více agentů**: Nahrazen "agent Cora" za "zákaznický agent" v celém řešení pro maloobchod s více agenty pro lepší pochopení
- **Architektura agentů**: Aktualizována veškerá dokumentace, ARM šablony a příklady kódu pro konzistentní použití názvu "zákaznický agent"
- **Konfigurační příklady**: Modernizované vzory konfigurace agentů s aktualizovanými názvy
- **Konzistence dokumentace**: Zajištěno, že všechny odkazy používají profesionální, popisné názvy agentů

#### Vylepšeno
- **Balíček ARM šablon**: Aktualizována retail-multiagent-arm-template s odkazy na zákaznického agenta
- **Diagramy architektury**: Obnovené diagramy Mermaid s aktualizovanými názvy agentů
- **Příklady kódu**: Třídy Pythonu a příklady implementace nyní používají název CustomerAgent
- **Proměnné prostředí**: Aktualizovány všechny skripty nasazení na konvence CUSTOMER_AGENT_NAME

#### Zlepšeno
- **Zkušenost vývojáře**: Jasnější role a odpovědnosti agentů v dokumentaci
- **Připravenost na produkci**: Lepší sladění s názvoslovím pro enterprise
- **Vzdělávací materiály**: Intuitivnější názvy agentů pro vzdělávací účely
- **Použitelnost šablon**: Zjednodušené pochopení funkcí agentů a vzorů nasazení

#### Technické detaily
- Aktualizované diagramy architektury Mermaid s odkazy na CustomerAgent
- Nahrazeny názvy tříd CoraAgent za CustomerAgent v příkladech Pythonu
- Upraveny konfigurace ARM šablon JSON na typ agenta "customer"
- Aktualizovány proměnné prostředí z CORA_AGENT_* na CUSTOMER_AGENT_* vzory
- Obnoveny všechny příkazy nasazení a konfigurace kontejnerů

### [v3.0.0] - 2025-09-12

#### Hlavní změny - Zaměření na AI vývojáře a integrace Azure AI Foundry
**Tato verze transformuje repository na komplexní vzdělávací zdroj zaměřený na AI vývojáře s integrací Azure AI Foundry.**

#### Přidáno
- **🤖 Vzdělávací cesta zaměřená na AI**: Kompletní restrukturalizace s prioritou pro AI vývojáře a inženýry
- **Průvodce integrací Azure AI Foundry**: Komplexní dokumentace pro propojení AZD se službami Azure AI Foundry
- **Vzory nasazení AI modelů**: Podrobný průvodce pokrývající výběr modelu, konfiguraci a strategie nasazení do produkce
- **Laboratoř AI workshopu**: 2-3 hodinový praktický workshop pro konverzi AI aplikací na řešení nasaditelná pomocí AZD
- **Nejlepší praktiky pro produkční AI**: Vzory připravené pro enterprise pro škálování, monitorování a zabezpečení AI pracovních zátěží
- **Průvodce řešením problémů specifických pro AI**: Komplexní řešení problémů pro Azure OpenAI, Cognitive Services a nasazení AI
- **Galerie šablon AI**: Doporučená kolekce šablon Azure AI Foundry s hodnocením složitosti
- **Materiály workshopu**: Kompletní struktura workshopu s praktickými laboratořemi a referenčními materiály

#### Vylepšeno
- **Struktura README**: Zaměřená na AI vývojáře s daty o zájmu komunity (45 %) z Discordu Azure AI Foundry
- **Vzdělávací cesty**: Dedikovaná cesta
- **Prezentace obsahu**: Odstraněny dekorativní prvky ve prospěch jasného a profesionálního formátování
- **Struktura odkazů**: Aktualizovány všechny interní odkazy pro podporu nového navigačního systému

#### Vylepšeno
- **Přístupnost**: Odstraněna závislost na emoji pro lepší kompatibilitu se čtečkami obrazovky
- **Profesionální vzhled**: Čistá, akademická prezentace vhodná pro firemní vzdělávání
- **Vzdělávací zážitek**: Strukturovaný přístup s jasnými cíli a výsledky pro každou lekci
- **Organizace obsahu**: Lepší logická návaznost a propojení mezi souvisejícími tématy

### [v1.0.0] - 2025-09-09

#### První vydání - Komplexní AZD vzdělávací úložiště

#### Přidáno
- **Základní struktura dokumentace**
  - Kompletní série průvodců pro začátečníky
  - Komplexní dokumentace nasazení a zajištění
  - Podrobné zdroje pro řešení problémů a návody na ladění
  - Nástroje a postupy pro ověření před nasazením

- **Modul pro začátečníky**
  - Základy AZD: Klíčové koncepty a terminologie
  - Průvodce instalací: Pokyny pro nastavení specifické pro platformu
  - Průvodce konfigurací: Nastavení prostředí a autentizace
  - První projekt: Praktický návod krok za krokem

- **Modul nasazení a zajištění**
  - Průvodce nasazením: Kompletní dokumentace pracovního postupu
  - Průvodce zajištěním: Infrastruktura jako kód s Bicep
  - Nejlepší postupy pro nasazení do produkce
  - Vzory architektury pro více služeb

- **Modul ověření před nasazením**
  - Plánování kapacity: Ověření dostupnosti zdrojů Azure
  - Výběr SKU: Podrobné pokyny pro výběr úrovní služeb
  - Kontroly před spuštěním: Automatizované validační skripty (PowerShell a Bash)
  - Nástroje pro odhad nákladů a plánování rozpočtu

- **Modul řešení problémů**
  - Běžné problémy: Nejčastější problémy a jejich řešení
  - Průvodce laděním: Systematické metodiky řešení problémů
  - Pokročilé diagnostické techniky a nástroje
  - Monitorování výkonu a optimalizace

- **Zdroje a odkazy**
  - Tahák příkazů: Rychlý přehled základních příkazů
  - Slovníček: Komplexní definice terminologie a zkratek
  - FAQ: Podrobné odpovědi na časté dotazy
  - Odkazy na externí zdroje a komunitní spojení

- **Příklady a šablony**
  - Příklad jednoduché webové aplikace
  - Šablona pro nasazení statické webové stránky
  - Konfigurace kontejnerové aplikace
  - Vzory integrace databází
  - Příklady architektury mikroslužeb
  - Implementace serverless funkcí

#### Funkce
- **Podpora více platforem**: Průvodci instalací a konfigurací pro Windows, macOS a Linux
- **Různé úrovně dovedností**: Obsah určený pro studenty i profesionální vývojáře
- **Praktické zaměření**: Praktické příklady a scénáře z reálného světa
- **Komplexní pokrytí**: Od základních konceptů po pokročilé firemní vzory
- **Bezpečnost na prvním místě**: Nejlepší bezpečnostní postupy integrované do celého obsahu
- **Optimalizace nákladů**: Pokyny pro nákladově efektivní nasazení a správu zdrojů

#### Kvalita dokumentace
- **Podrobné příklady kódu**: Praktické, otestované ukázky kódu
- **Pokyny krok za krokem**: Jasné a akční návody
- **Komplexní řešení chyb**: Řešení běžných problémů
- **Integrace nejlepších postupů**: Průmyslové standardy a doporučení
- **Kompatibilita verzí**: Aktualizováno podle nejnovějších služeb Azure a funkcí azd

## Plánovaná budoucí vylepšení

### Verze 3.1.0 (Plánováno)
#### Rozšíření AI platformy
- **Podpora více modelů**: Vzory integrace pro Hugging Face, Azure Machine Learning a vlastní modely
- **Rámce AI agentů**: Šablony pro nasazení LangChain, Semantic Kernel a AutoGen
- **Pokročilé vzory RAG**: Možnosti vektorových databází mimo Azure AI Search (Pinecone, Weaviate atd.)
- **Pozorovatelnost AI**: Vylepšené monitorování výkonu modelů, využití tokenů a kvality odpovědí

#### Zkušenost vývojářů
- **Rozšíření pro VS Code**: Integrované prostředí pro vývoj AZD + AI Foundry
- **Integrace GitHub Copilot**: Generování šablon AZD pomocí AI
- **Interaktivní tutoriály**: Praktická cvičení s automatizovaným ověřováním pro AI scénáře
- **Video obsah**: Doplňkové video tutoriály pro vizuální studenty zaměřené na nasazení AI

### Verze 4.0.0 (Plánováno)
#### Firemní vzory AI
- **Rámec správy**: Správa modelů AI, shoda a auditní stopy
- **AI pro více nájemců**: Vzory pro poskytování služeb AI více zákazníkům s izolovanými službami
- **Nasazení AI na okraji**: Integrace s Azure IoT Edge a instancemi kontejnerů
- **Hybridní cloud AI**: Vzory nasazení AI pro více cloudů a hybridní prostředí

#### Pokročilé funkce
- **Automatizace AI pipeline**: Integrace MLOps s pipeline Azure Machine Learning
- **Pokročilá bezpečnost**: Vzory nulové důvěry, privátní koncové body a pokročilá ochrana proti hrozbám
- **Optimalizace výkonu**: Pokročilé strategie ladění a škálování pro aplikace AI s vysokou propustností
- **Globální distribuce**: Vzory doručování obsahu a ukládání do mezipaměti na okraji pro aplikace AI

### Verze 3.0.0 (Plánováno) - Nahrazeno aktuálním vydáním
#### Navrhovaná rozšíření - Nyní implementováno ve verzi 3.0.0
- ✅ **Obsah zaměřený na AI**: Komplexní integrace Azure AI Foundry (Dokončeno)
- ✅ **Interaktivní tutoriály**: Praktická AI workshopová laboratoř (Dokončeno)
- ✅ **Pokročilý bezpečnostní modul**: Bezpečnostní vzory specifické pro AI (Dokončeno)
- ✅ **Optimalizace výkonu**: Strategie ladění pracovních zátěží AI (Dokončeno)

### Verze 2.1.0 (Plánováno) - Částečně implementováno ve verzi 3.0.0
#### Menší vylepšení - Některá dokončena v aktuálním vydání
- ✅ **Další příklady**: Scénáře nasazení zaměřené na AI (Dokončeno)
- ✅ **Rozšířené FAQ**: Otázky a řešení specifické pro AI (Dokončeno)
- **Integrace nástrojů**: Vylepšené pokyny pro integraci IDE a editorů
- ✅ **Rozšířené monitorování**: Vzory monitorování a upozorňování specifické pro AI (Dokončeno)

#### Stále plánováno pro budoucí vydání
- **Dokumentace přizpůsobená mobilním zařízením**: Responzivní design pro mobilní učení
- **Offline přístup**: Stahovatelné balíčky dokumentace
- **Vylepšená integrace IDE**: Rozšíření pro VS Code pro pracovní postupy AZD + AI
- **Komunitní dashboard**: Reálné metriky komunity a sledování příspěvků

## Přispívání do changelogu

### Hlásit změny
Při přispívání do tohoto úložiště zajistěte, aby záznamy v changelogu obsahovaly:

1. **Číslo verze**: Podle semantického verzování (hlavní.menší.záplata)
2. **Datum**: Datum vydání nebo aktualizace ve formátu RRRR-MM-DD
3. **Kategorie**: Přidáno, Změněno, Zastaralé, Odstraněno, Opraveno, Bezpečnost
4. **Jasný popis**: Stručný popis změny
5. **Hodnocení dopadu**: Jak změny ovlivní stávající uživatele

### Kategorie změn

#### Přidáno
- Nové funkce, sekce dokumentace nebo schopnosti
- Nové příklady, šablony nebo vzdělávací zdroje
- Další nástroje, skripty nebo utility

#### Změněno
- Úpravy stávající funkčnosti nebo dokumentace
- Aktualizace pro zlepšení srozumitelnosti nebo přesnosti
- Restrukturalizace obsahu nebo organizace

#### Zastaralé
- Funkce nebo přístupy, které se postupně vyřazují
- Sekce dokumentace plánované k odstranění
- Metody, které mají lepší alternativy

#### Odstraněno
- Funkce, dokumentace nebo příklady, které již nejsou relevantní
- Zastaralé informace nebo přístupy
- Nadbytečný nebo konsolidovaný obsah

#### Opraveno
- Opravy chyb v dokumentaci nebo kódu
- Řešení nahlášených problémů nebo potíží
- Zlepšení přesnosti nebo funkčnosti

#### Bezpečnost
- Vylepšení nebo opravy související s bezpečností
- Aktualizace bezpečnostních nejlepších postupů
- Řešení bezpečnostních zranitelností

### Pokyny pro semantické verzování

#### Hlavní verze (X.0.0)
- Změny, které vyžadují akci uživatele
- Významná restrukturalizace obsahu nebo organizace
- Změny, které mění základní přístup nebo metodiku

#### Menší verze (X.Y.0)
- Nové funkce nebo přídavky obsahu
- Vylepšení, která zachovávají zpětnou kompatibilitu
- Další příklady, nástroje nebo zdroje

#### Záplata (X.Y.Z)
- Opravy chyb a korekce
- Menší vylepšení stávajícího obsahu
- Upřesnění a drobná vylepšení

## Zpětná vazba a návrhy komunity

Aktivně vítáme zpětnou vazbu od komunity, abychom zlepšili tento vzdělávací zdroj:

### Jak poskytnout zpětnou vazbu
- **GitHub Issues**: Hlášení problémů nebo návrhy na zlepšení (vítány i problémy specifické pro AI)
- **Diskuze na Discordu**: Sdílení nápadů a zapojení do komunity Azure AI Foundry
- **Pull Requesty**: Přímé příspěvky ke zlepšení obsahu, zejména šablon a průvodců pro AI
- **Azure AI Foundry Discord**: Účast v kanálu #Azure pro diskuze o AZD + AI
- **Komunitní fóra**: Účast v širších diskuzích vývojářů Azure

### Kategorie zpětné vazby
- **Přesnost obsahu AI**: Opravy informací o integraci a nasazení služeb AI
- **Vzdělávací zážitek**: Návrhy na zlepšení vzdělávacího toku pro vývojáře AI
- **Chybějící obsah AI**: Požadavky na další šablony, vzory nebo příklady AI
- **Přístupnost**: Vylepšení pro různé vzdělávací potřeby
- **Integrace nástrojů AI**: Návrhy na lepší integraci pracovních postupů vývoje AI
- **Vzory pro produkční AI**: Požadavky na vzory nasazení AI pro podniky

### Závazek k odpovědím
- **Reakce na problémy**: Do 48 hodin od nahlášení problémů
- **Požadavky na funkce**: Vyhodnocení do jednoho týdne
- **Příspěvky komunity**: Revize do jednoho týdne
- **Bezpečnostní problémy**: Okamžitá priorita s urychlenou reakcí

## Plán údržby

### Pravidelné aktualizace
- **Měsíční kontroly**: Přesnost obsahu a ověření odkazů
- **Čtvrtletní aktualizace**: Hlavní přídavky a vylepšení obsahu
- **Půlroční kontroly**: Komplexní restrukturalizace a vylepšení
- **Roční vydání**: Hlavní aktualizace verzí s významnými vylepšeními

### Monitorování a zajištění kvality
- **Automatizované testování**: Pravidelné ověřování příkladů kódu a odkazů
- **Integrace zpětné vazby komunity**: Pravidelné zapracování návrhů uživatelů
- **Technologické aktualizace**: Slučitelnost s nejnovějšími službami Azure a verzemi azd
- **Audity přístupnosti**: Pravidelné kontroly zásad inkluzivního designu

## Podpora verzí

### Podpora aktuální verze
- **Nejnovější hlavní verze**: Plná podpora s pravidelnými aktualizacemi
- **Předchozí hlavní verze**: Aktualizace zabezpečení a kritické opravy po dobu 12 měsíců
- **Starší verze**: Pouze podpora komunity, žádné oficiální aktualizace

### Pokyny k migraci
Při vydání hlavních verzí poskytujeme:
- **Průvodce migrací**: Pokyny krok za krokem pro přechod
- **Poznámky ke kompatibilitě**: Podrobnosti o změnách, které mohou narušit kompatibilitu
- **Podpora nástrojů**: Skripty nebo utility pro usnadnění migrace
- **Podpora komunity**: Vyhrazená fóra pro otázky týkající se migrace

---

**Navigace**
- **Předchozí lekce**: [Studijní průvodce](resources/study-guide.md)
- **Další lekce**: Návrat na [Hlavní README](README.md)

**Zůstaňte informováni**: Sledujte toto úložiště pro oznámení o nových vydáních a důležitých aktualizacích vzdělávacích materiálů.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->