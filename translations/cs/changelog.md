<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "73f4ab6147d5fac5f8c5ad72742e8e1d",
  "translation_date": "2025-09-18T09:36:05+00:00",
  "source_file": "changelog.md",
  "language_code": "cs"
}
-->
# Changelog - AZD Pro Začátečníky

## Úvod

Tento changelog dokumentuje všechny významné změny, aktualizace a vylepšení v repozitáři AZD Pro Začátečníky. Dodržujeme principy semantického verzování a udržujeme tento log, aby uživatelé mohli snadno pochopit, co se změnilo mezi verzemi.

## Cíle učení

Při procházení tohoto changelogu:
- Zůstanete informováni o nových funkcích a přidaném obsahu
- Porozumíte vylepšením stávající dokumentace
- Sledujete opravy chyb a zajišťujete přesnost
- Sledujete vývoj vzdělávacích materiálů v průběhu času

## Výsledky učení

Po prostudování záznamů v changelogu budete schopni:
- Identifikovat nový obsah a dostupné zdroje pro učení
- Porozumět, které sekce byly aktualizovány nebo vylepšeny
- Plánovat svou vzdělávací cestu na základě nejaktuálnějších materiálů
- Poskytovat zpětnou vazbu a návrhy na budoucí vylepšení

## Historie verzí

### [v3.2.0] - 2025-09-17

#### Hlavní restrukturalizace navigace a systém kapitolového učení
**Tato verze zavádí komplexní strukturu kapitolového učení s vylepšenou navigací napříč celým repozitářem.**

#### Přidáno
- **📚 Systém kapitolového učení**: Restrukturalizace celého kurzu do 8 progresivních kapitol:
  - Kapitola 1: Základy & Rychlý start (⭐ - 30-45 minut)
  - Kapitola 2: Vývoj orientovaný na AI (⭐⭐ - 1-2 hodiny)
  - Kapitola 3: Konfigurace & Autentizace (⭐⭐ - 45-60 minut)
  - Kapitola 4: Infrastruktura jako kód & Nasazení (⭐⭐⭐ - 1-1,5 hodiny)
  - Kapitola 5: Řešení s více AI agenty (⭐⭐⭐⭐ - 2-3 hodiny)
  - Kapitola 6: Validace & Plánování před nasazením (⭐⭐ - 1 hodina)
  - Kapitola 7: Řešení problémů & Ladění (⭐⭐ - 1-1,5 hodiny)
  - Kapitola 8: Produkční & Enterprise vzory (⭐⭐⭐⭐ - 2-3 hodiny)
- **📚 Komplexní navigační systém**: Konzistentní navigační záhlaví a zápatí napříč celou dokumentací
- **🎯 Sledování pokroku**: Kontrolní seznam dokončení kurzu a systém ověřování učení
- **🗺️ Směrnice vzdělávací cesty**: Jasné vstupní body pro různé úrovně zkušeností a cíle
- **🔗 Navigace mezi kapitolami**: Jasně propojené související kapitoly a předpoklady

#### Vylepšeno
- **Struktura README**: Transformováno do strukturované vzdělávací platformy s organizací podle kapitol
- **Navigace dokumentace**: Každá stránka nyní obsahuje kontext kapitoly a směrnici pro postup
- **Organizace šablon**: Příklady a šablony mapovány na odpovídající kapitoly učení
- **Integrace zdrojů**: Taháky, FAQ a studijní příručky propojeny s relevantními kapitolami
- **Integrace workshopů**: Praktické laboratoře mapovány na cíle učení více kapitol

#### Změněno
- **Progrese učení**: Přechod z lineární dokumentace na flexibilní kapitolové učení
- **Umístění konfigurace**: Přesun průvodce konfigurací na kapitolu 3 pro lepší tok učení
- **Integrace AI obsahu**: Lepší začlenění obsahu zaměřeného na AI napříč vzdělávací cestou
- **Produkční obsah**: Pokročilé vzory konsolidovány v kapitole 8 pro enterprise uživatele

#### Zlepšeno
- **Uživatelský zážitek**: Jasné navigační ukazatele a indikátory postupu kapitol
- **Přístupnost**: Konzistentní navigační vzory pro snadnější průchod kurzem
- **Profesionální prezentace**: Univerzitní struktura kurzu vhodná pro akademické i firemní školení
- **Efektivita učení**: Snížený čas na nalezení relevantního obsahu díky lepší organizaci

#### Technická implementace
- **Navigační záhlaví**: Standardizovaná navigace kapitol napříč více než 40 dokumentačními soubory
- **Navigační zápatí**: Konzistentní směrnice pro postup a indikátory dokončení kapitol
- **Propojování**: Komplexní interní propojení souvisejících konceptů
- **Mapování kapitol**: Šablony a příklady jasně spojeny s cíli učení

#### Vylepšení studijní příručky
- **📚 Komplexní cíle učení**: Restrukturalizovaná studijní příručka v souladu se systémem 8 kapitol
- **🎯 Hodnocení podle kapitol**: Každá kapitola obsahuje specifické cíle učení a praktická cvičení
- **📋 Sledování pokroku**: Týdenní vzdělávací plán s měřitelnými výsledky a kontrolními seznamy
- **❓ Otázky k hodnocení**: Ověřovací otázky pro každou kapitolu s profesionálními výsledky
- **🛠️ Praktická cvičení**: Praktické aktivity s reálnými scénáři nasazení a řešení problémů
- **📊 Progrese dovedností**: Jasný postup od základních konceptů k enterprise vzorům s důrazem na kariérní rozvoj
- **🎓 Certifikační rámec**: Výsledky profesionálního rozvoje a systém uznání v komunitě
- **⏱️ Řízení časové osy**: Strukturovaný 10týdenní vzdělávací plán s validací milníků

### [v3.1.0] - 2025-09-17

#### Vylepšená řešení s více AI agenty
**Tato verze zlepšuje řešení pro maloobchodní multi-agentní systém s lepším pojmenováním agentů a vylepšenou dokumentací.**

#### Změněno
- **Terminologie multi-agentů**: Nahrazení "agent Cora" za "agent zákazník" v celém maloobchodním multi-agentním řešení pro jasnější pochopení
- **Architektura agentů**: Aktualizace veškeré dokumentace, ARM šablon a příkladů kódu pro konzistentní pojmenování "agent zákazník"
- **Konfigurační příklady**: Modernizované vzory konfigurace agentů s aktualizovanými názvy
- **Konzistence dokumentace**: Zajištění, že všechny odkazy používají profesionální a popisná jména agentů

#### Vylepšeno
- **Balíček ARM šablon**: Aktualizovaná retail-multiagent-arm-template s odkazy na agenta zákazníka
- **Diagramy architektury**: Obnovené diagramy Mermaid s aktualizovaným pojmenováním agentů
- **Příklady kódu**: Python třídy a implementační příklady nyní používají pojmenování CustomerAgent
- **Proměnné prostředí**: Aktualizace všech skriptů nasazení na konvence CUSTOMER_AGENT_NAME

#### Zlepšeno
- **Zkušenost vývojáře**: Jasnější role a odpovědnosti agentů v dokumentaci
- **Připravenost na produkci**: Lepší sladění s enterprise konvencemi pojmenování
- **Vzdělávací materiály**: Intuitivnější pojmenování agentů pro vzdělávací účely
- **Použitelnost šablon**: Zjednodušené pochopení funkcí agentů a vzorů nasazení

#### Technické detaily
- Aktualizované diagramy architektury Mermaid s odkazy na CustomerAgent
- Nahrazení názvů tříd CoraAgent za CustomerAgent v Python příkladech
- Úprava konfigurací ARM šablon JSON na typ agenta "customer"
- Aktualizace proměnných prostředí z CORA_AGENT_* na CUSTOMER_AGENT_* vzory
- Obnovení všech příkazů nasazení a konfigurací kontejnerů

### [v3.0.0] - 2025-09-12

#### Hlavní změny - Zaměření na AI vývojáře a integrace Azure AI Foundry
**Tato verze transformuje repozitář na komplexní vzdělávací zdroj zaměřený na AI s integrací Azure AI Foundry.**

#### Přidáno
- **🤖 Cesta učení zaměřená na AI**: Kompletní restrukturalizace s prioritou pro AI vývojáře a inženýry
- **Průvodce integrací Azure AI Foundry**: Komplexní dokumentace pro propojení AZD s Azure AI Foundry službami
- **Vzory nasazení AI modelů**: Podrobný průvodce pokrývající výběr modelů, konfiguraci a strategie produkčního nasazení
- **Workshop AI**: 2-3 hodinový praktický workshop pro konverzi AI aplikací na AZD nasaditelné řešení
- **Nejlepší praktiky pro produkční AI**: Enterprise-ready vzory pro škálování, monitorování a zabezpečení AI pracovních zátěží
- **Průvodce řešením problémů specifických pro AI**: Komplexní řešení problémů pro Azure OpenAI, Cognitive Services a nasazení AI
- **Galerie šablon AI**: Doporučená kolekce šablon Azure AI Foundry s hodnocením složitosti
- **Materiály workshopu**: Kompletní struktura workshopu s praktickými laboratořemi a referenčními materiály

#### Vylepšeno
- **Struktura README**: Zaměřeno na AI vývojáře s 45% dat zájmu komunity z Azure AI Foundry Discord
- **Cesty učení**: Dedikovaná cesta pro AI vývojáře vedle tradičních cest pro studenty a DevOps inženýry
- **Doporučení šablon**: Doporučené AI šablony včetně azure-search-openai-demo, contoso-chat a openai-chat-app-quickstart
- **Integrace komunity**: Vylepšená podpora Discord komunity s AI-specifickými kanály a diskuzemi

#### Zaměření na bezpečnost a produkci
- **Vzory spravované identity**: Autentizace a bezpečnostní konfigurace specifické pro AI
- **Optimalizace nákladů**: Sledování využití tokenů a kontrola rozpočtu pro AI pracovní zátěže
- **Nasazení do více regionů**: Strategie pro globální nasazení AI aplikací
- **Monitorování výkonu**: AI-specifické metriky a integrace Application Insights

#### Kvalita dokumentace
- **Lineární struktura kurzu**: Logický postup od začátečníků k pokročilým vzorům nasazení AI
- **Validované URL**: Všechny externí odkazy na repozitáře ověřeny a přístupné
- **Kompletní reference**: Všechny interní odkazy na dokumentaci ověřeny a funkční
- **Připravenost na produkci**: Enterprise vzory nasazení s příklady z reálného světa

### [v2.0.0] - 2025-09-09

#### Hlavní změny - Restrukturalizace repozitáře a profesionální vylepšení
**Tato verze představuje významnou restrukturalizaci repozitáře a prezentace obsahu.**

#### Přidáno
- **Strukturovaný vzdělávací rámec**: Všechny stránky dokumentace nyní obsahují sekce Úvod, Cíle učení a Výsledky učení
- **Navigační systém**: Přidány odkazy na předchozí/následující lekce napříč dokumentací pro vedený postup učení
- **Studijní příručka**: Komplexní studijní příručka s cíli učení, praktickými cvičeními a hodnotícími materiály
- **Profesionální prezentace**: Odstraněny všechny emoji ikony pro lepší přístupnost a profesionální vzhled
- **Vylepšená struktura obsahu**: Zlepšená organizace a tok vzdělávacích materiálů

#### Změněno
- **Formát dokumentace**: Standardizace všech dokumentů s konzistentní strukturou zaměřenou na učení
- **Tok navigace**: Implementace logického postupu napříč všemi vzdělávacími materiály
- **Prezentace obsahu**: Odstranění dekorativních prvků ve prospěch jasného a profesionálního formátování
- **Struktura odkazů**: Aktualizace všech interních odkazů pro podporu nového navigačního systému

#### Zlepšeno
- **Přístupnost**: Odstranění závislosti na emoji pro lepší kompatibilitu se čtečkami obrazovky
- **Profesionální vzhled**: Čistá, akademická prezentace vhodná pro firemní vzdělávání
- **Zážitek z učení**: Strukturovaný přístup s jasnými cíli a výsledky pro každou lekci
- **Organizace obsahu**: Lepší logický tok a propojení mezi souvisejícími tématy

### [v1.0.0] - 2025-09-09

#### První vydání - Komplexní vzdělávací repozitář AZD

#### Přidáno
- **Základní struktura dokumentace**
  - Kompletní série průvodců pro začátečníky
  - Komplexní dokumentace nasazení a zajištění infrastruktury
  - Podrobné zdroje pro řešení problémů a ladění
  - Nástroje a postupy pro validaci před nasazením

- **Modul Začínáme**
  - Základy AZD: Klíčové koncepty a terminologie
  - Průvodce instalací: Pokyny pro nastavení specifické pro platformu
  - Průvodce konfigurací: Nastavení prostředí a autentizace
  - První projekt: Krok za krokem praktické učení

- **Modul Nasazení a zajištění infrastruktury**
  - Průvodce nasazením: Kompletní dokumentace pracovního postupu
  - Průvodce zajištěním infrastruktury: Infrastruktura jako kód s Bicep
  - Nejlepší praktiky pro produkční nasazení
  - Vzory architektury pro více služeb

- **Modul Validace před nasazením**
  - Plánování kapacity: Validace dostupnosti zdrojů Azure
  - Výběr SKU: Komplexní pokyny pro výběr úrovní služeb
  - Kontroly před nasazením: Automatizované validační skripty (PowerShell a Bash)
  - Nástroje pro odhad nákladů a plánování rozpočtu

- **Modul Řešení problémů**
  - Běžné problémy: Často se vyskytující problémy a jejich řešení
  - Průvodce laděním: Systematické metodiky řešení problémů
  - Pokročilé diagnostické techniky a nástroje
  - Monitorování výkonu a optimalizace

- **Zdroje a reference**
  - Tahák příkazů: Rychlá reference pro základní příkazy
  - Slovník: Komplexní definice terminologie a zkratek
  - FAQ: Podrobné odpovědi na běžné otázky
  - Odkazy na externí zdroje a komunitní spojení

- **Příklady a šablony**
  - Příklad jednoduché webové aplikace
  - Šablona nasazení statické webové stránky
  - Konfigurace aplikace v kontejneru
  - Vzory integrace databází
  - Příklady architektury mikroslužeb
  - Implementace serverless funkcí

#### Funkce
- **Podpora více platforem**: Průvodce instalací a konfigurací pro Windows, macOS a Linux
- **Různé úrovně dovedností**: Obsah navržený pro studenty i profesionální vývojáře
- **Praktické zaměření**: Praktické příklady a scénáře z reálného světa
- **Komplexní pokrytí**: Od základních konceptů po pokročilé enterprise vzory
- **Bezpečnost na prvním místě**: Nejlepší praktiky bezpečnosti integrované napříč obsahem
- **Optimalizace nákladů**: Pokyny pro nákladově efektivní nasazení a správu zdrojů

#### Kvalita dokument
- **Automatizace AI Pipeline**: Integrace MLOps s Azure Machine Learning pipelines  
- **Pokročilá bezpečnost**: Vzory nulové důvěry, privátní koncové body a pokročilá ochrana proti hrozbám  
- **Optimalizace výkonu**: Pokročilé strategie ladění a škálování pro aplikace AI s vysokým průtokem  
- **Globální distribuce**: Vzory doručování obsahu a ukládání na okraji sítě pro AI aplikace  

### Verze 3.0.0 (Plánováno) - Nahrazeno aktuálním vydáním  
#### Navrhované doplňky - Nyní implementováno ve verzi 3.0.0  
- ✅ **Obsah zaměřený na AI**: Komplexní integrace Azure AI Foundry (Dokončeno)  
- ✅ **Interaktivní tutoriály**: Praktické AI workshopy (Dokončeno)  
- ✅ **Modul pokročilé bezpečnosti**: Bezpečnostní vzory specifické pro AI (Dokončeno)  
- ✅ **Optimalizace výkonu**: Strategie ladění pracovních zátěží AI (Dokončeno)  

### Verze 2.1.0 (Plánováno) - Částečně implementováno ve verzi 3.0.0  
#### Menší vylepšení - Některé dokončeny v aktuálním vydání  
- ✅ **Další příklady**: Scénáře nasazení zaměřené na AI (Dokončeno)  
- ✅ **Rozšířená FAQ**: Otázky a řešení specifické pro AI (Dokončeno)  
- **Integrace nástrojů**: Vylepšené průvodce integrací IDE a editorů  
- ✅ **Rozšíření monitorování**: Vzory monitorování a upozornění specifické pro AI (Dokončeno)  

#### Stále plánováno pro budoucí vydání  
- **Dokumentace přizpůsobená mobilním zařízením**: Responzivní design pro mobilní učení  
- **Offline přístup**: Balíčky dokumentace ke stažení  
- **Vylepšená integrace IDE**: Rozšíření VS Code pro AZD + AI pracovní postupy  
- **Komunitní dashboard**: Metriky komunity v reálném čase a sledování příspěvků  

## Přispívání do changelogu  

### Hlášení změn  
Při přispívání do tohoto repozitáře zajistěte, aby záznamy v changelogu obsahovaly:  

1. **Číslo verze**: Podle semantického verzování (major.minor.patch)  
2. **Datum**: Datum vydání nebo aktualizace ve formátu YYYY-MM-DD  
3. **Kategorie**: Přidáno, Změněno, Zastaralé, Odstraněno, Opraveno, Bezpečnost  
4. **Jasný popis**: Stručný popis změny  
5. **Hodnocení dopadu**: Jak změny ovlivňují stávající uživatele  

### Kategorie změn  

#### Přidáno  
- Nové funkce, sekce dokumentace nebo schopnosti  
- Nové příklady, šablony nebo vzdělávací zdroje  
- Další nástroje, skripty nebo utility  

#### Změněno  
- Úpravy stávající funkčnosti nebo dokumentace  
- Aktualizace pro zlepšení jasnosti nebo přesnosti  
- Restrukturalizace obsahu nebo organizace  

#### Zastaralé  
- Funkce nebo přístupy, které se postupně vyřazují  
- Sekce dokumentace plánované k odstranění  
- Metody, které mají lepší alternativy  

#### Odstraněno  
- Funkce, dokumentace nebo příklady, které již nejsou relevantní  
- Zastaralé informace nebo vyřazené přístupy  
- Redundantní nebo konsolidovaný obsah  

#### Opraveno  
- Opravy chyb v dokumentaci nebo kódu  
- Řešení hlášených problémů nebo potíží  
- Zlepšení přesnosti nebo funkčnosti  

#### Bezpečnost  
- Vylepšení nebo opravy související s bezpečností  
- Aktualizace bezpečnostních osvědčených postupů  
- Řešení bezpečnostních zranitelností  

### Pokyny pro semantické verzování  

#### Hlavní verze (X.0.0)  
- Změny, které vyžadují akci uživatele  
- Významná restrukturalizace obsahu nebo organizace  
- Změny, které mění základní přístup nebo metodologii  

#### Menší verze (X.Y.0)  
- Nové funkce nebo přídavky obsahu  
- Vylepšení, která zachovávají zpětnou kompatibilitu  
- Další příklady, nástroje nebo zdroje  

#### Oprava (X.Y.Z)  
- Opravy chyb a korekce  
- Menší vylepšení stávajícího obsahu  
- Upřesnění a drobná vylepšení  

## Zpětná vazba a návrhy od komunity  

Aktivně podporujeme zpětnou vazbu od komunity, abychom zlepšili tento vzdělávací zdroj:  

### Jak poskytnout zpětnou vazbu  
- **GitHub Issues**: Hlášení problémů nebo návrhy na zlepšení (vítány problémy specifické pro AI)  
- **Diskuse na Discordu**: Sdílení nápadů a zapojení do komunity Azure AI Foundry  
- **Pull Requests**: Přímé příspěvky ke zlepšení obsahu, zejména šablon a průvodců pro AI  
- **Azure AI Foundry Discord**: Účast v kanálu #Azure pro diskuse o AZD + AI  
- **Komunitní fóra**: Účast v širších diskusích vývojářů Azure  

### Kategorie zpětné vazby  
- **Přesnost obsahu AI**: Opravy informací o integraci a nasazení AI služeb  
- **Vzdělávací zkušenost**: Návrhy na zlepšení učebního toku pro vývojáře AI  
- **Chybějící obsah AI**: Požadavky na další šablony, vzory nebo příklady AI  
- **Přístupnost**: Vylepšení pro různé vzdělávací potřeby  
- **Integrace AI nástrojů**: Návrhy na lepší integraci pracovních postupů vývoje AI  
- **Vzory pro produkční AI**: Požadavky na vzory nasazení AI pro podniky  

### Závazek k odpovědím  
- **Reakce na problémy**: Do 48 hodin u hlášených problémů  
- **Požadavky na funkce**: Vyhodnocení do jednoho týdne  
- **Příspěvky od komunity**: Revize do jednoho týdne  
- **Bezpečnostní problémy**: Okamžitá priorita s urychlenou reakcí  

## Plán údržby  

### Pravidelné aktualizace  
- **Měsíční revize**: Přesnost obsahu a validace odkazů  
- **Čtvrtletní aktualizace**: Hlavní přídavky obsahu a vylepšení  
- **Půlroční revize**: Komplexní restrukturalizace a vylepšení  
- **Roční vydání**: Hlavní aktualizace verzí s významnými vylepšeními  

### Monitorování a zajištění kvality  
- **Automatické testování**: Pravidelná validace příkladů kódu a odkazů  
- **Integrace zpětné vazby od komunity**: Pravidelné začlenění návrhů uživatelů  
- **Aktualizace technologií**: Slučování s nejnovějšími službami Azure a vydáními azd  
- **Audity přístupnosti**: Pravidelné revize pro inkluzivní designové principy  

## Politika podpory verzí  

### Podpora aktuální verze  
- **Nejnovější hlavní verze**: Plná podpora s pravidelnými aktualizacemi  
- **Předchozí hlavní verze**: Aktualizace bezpečnosti a kritické opravy po dobu 12 měsíců  
- **Starší verze**: Pouze podpora komunity, žádné oficiální aktualizace  

### Pokyny pro migraci  
Když jsou vydány hlavní verze, poskytujeme:  
- **Průvodce migrací**: Krok za krokem instrukce pro přechod  
- **Poznámky o kompatibilitě**: Podrobnosti o zásadních změnách  
- **Podpora nástrojů**: Skripty nebo utility pro usnadnění migrace  
- **Podpora komunity**: Vyhrazená fóra pro otázky týkající se migrace  

---

**Navigace**  
- **Předchozí lekce**: [Studijní průvodce](resources/study-guide.md)  
- **Další lekce**: Návrat na [Hlavní README](README.md)  

**Zůstaňte informováni**: Sledujte tento repozitář pro oznámení o nových vydáních a důležitých aktualizacích vzdělávacích materiálů.  

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.