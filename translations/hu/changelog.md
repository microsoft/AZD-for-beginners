<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1bc63a39d4cf8fc5cb5c7040344be859",
  "translation_date": "2025-11-23T10:11:47+00:00",
  "source_file": "changelog.md",
  "language_code": "hu"
}
-->
# Változások naplója - AZD Kezdőknek

## Bevezetés

Ez a változások naplója dokumentálja az AZD Kezdőknek tárhely minden jelentős változását, frissítését és fejlesztését. Követjük a szemantikus verziózás elveit, és fenntartjuk ezt a naplót, hogy segítsük a felhasználókat megérteni, mi változott a verziók között.

## Tanulási célok

A változások naplójának áttekintésével:
- Tájékozódhat az új funkciókról és tartalmi bővítésekről
- Megértheti a meglévő dokumentációban végrehajtott fejlesztéseket
- Nyomon követheti a hibajavításokat és korrekciókat a pontosság érdekében
- Követheti a tananyagok fejlődését az idő múlásával

## Tanulási eredmények

A változások naplójának áttekintése után képes lesz:
- Azonosítani az új tananyagokat és erőforrásokat
- Megérteni, hogy mely szakaszok lettek frissítve vagy fejlesztve
- Megtervezni tanulási útját a legfrissebb anyagok alapján
- Visszajelzést és javaslatokat adni a jövőbeli fejlesztésekhez

## Verziótörténet

### [v3.8.0] - 2025-11-19

#### Haladó dokumentáció: Monitoring, biztonság és több ügynökös minták
**Ez a verzió átfogó, A-minősítésű leckéket ad hozzá az Application Insights integrációról, hitelesítési mintákról és több ügynökös koordinációról a termelési telepítésekhez.**

#### Hozzáadva
- **📊 Application Insights Integráció Lecke**: a `docs/pre-deployment/application-insights.md` fájlban:
  - AZD-központú telepítés automatikus előkészítéssel
  - Teljes Bicep sablonok az Application Insights + Log Analytics számára
  - Működő Python alkalmazások egyedi telemetriával (1200+ sor)
  - AI/LLM monitoring minták (Azure OpenAI token/költségkövetés)
  - 6 Mermaid diagram (architektúra, elosztott nyomkövetés, telemetria áramlás)
  - 3 gyakorlati feladat (riasztások, irányítópultok, AI monitoring)
  - Kusto lekérdezési példák és költségoptimalizálási stratégiák
  - Élő metrikák streamingje és valós idejű hibakeresés
  - 40-50 perces tanulási idő termelésre kész mintákkal

- **🔐 Hitelesítési és biztonsági minták lecke**: a `docs/getting-started/authsecurity.md` fájlban:
  - 3 hitelesítési minta (kapcsolati karakterláncok, Key Vault, kezelt identitás)
  - Teljes Bicep infrastruktúra sablonok biztonságos telepítésekhez
  - Node.js alkalmazáskód Azure SDK integrációval
  - 3 teljes gyakorlat (kezelt identitás engedélyezése, felhasználó által hozzárendelt identitás, Key Vault rotáció)
  - Biztonsági legjobb gyakorlatok és RBAC konfigurációk
  - Hibakeresési útmutató és költségelemzés
  - Termelésre kész jelszó nélküli hitelesítési minták

- **🤖 Több ügynökös koordinációs minták lecke**: a `docs/pre-deployment/coordination-patterns.md` fájlban:
  - 5 koordinációs minta (sorrendi, párhuzamos, hierarchikus, eseményvezérelt, konszenzus)
  - Teljes orchestrator szolgáltatás implementáció (Python/Flask, 1500+ sor)
  - 3 specializált ügynök implementáció (Kutató, Író, Szerkesztő)
  - Service Bus integráció üzenet sorba állításhoz
  - Cosmos DB állapotkezelés elosztott rendszerekhez
  - 6 Mermaid diagram az ügynökök interakcióiról
  - 3 haladó gyakorlat (időtúllépés kezelése, újrapróbálkozási logika, áramkör megszakító)
  - Költségbontás ($240-565/hó) optimalizálási stratégiákkal
  - Application Insights integráció monitoringhoz

#### Fejlesztve
- **Előtelepítési fejezet**: Mostantól átfogó monitoring és koordinációs mintákat tartalmaz
- **Kezdő lépések fejezet**: Professzionális hitelesítési mintákkal bővítve
- **Termelési készség**: Teljes körű lefedettség a biztonságtól az észlelésig
- **Tanfolyam vázlat**: Frissítve az új leckék hivatkozásával a 3. és 6. fejezetben

#### Módosítva
- **Tanulási folyamat**: Jobb integráció a biztonság és monitoring között a tanfolyam során
- **Dokumentáció minősége**: Következetes A-minősítés (95-97%) az új leckékben
- **Termelési minták**: Teljes körű lefedettség vállalati telepítésekhez

#### Javítva
- **Fejlesztői élmény**: Tiszta út a fejlesztéstől a termelési monitoringig
- **Biztonsági szabványok**: Professzionális minták hitelesítéshez és titkok kezeléséhez
- **Észlelhetőség**: Teljes Application Insights integráció AZD-vel
- **AI terhelések**: Speciális monitoring Azure OpenAI és több ügynökös rendszerekhez

#### Validálva
- ✅ Minden lecke teljes működő kódot tartalmaz (nem csak részleteket)
- ✅ Mermaid diagramok vizuális tanuláshoz (összesen 19 az új leckékben)
- ✅ Gyakorlati feladatok ellenőrzési lépésekkel (összesen 9)
- ✅ Termelésre kész Bicep sablonok telepíthetők `azd up` parancs segítségével
- ✅ Költségelemzés és optimalizálási stratégiák
- ✅ Hibakeresési útmutatók és legjobb gyakorlatok
- ✅ Tudásellenőrzési pontok ellenőrzési parancsokkal

#### Dokumentáció minősítési eredmények
- **docs/pre-deployment/application-insights.md**: - Átfogó monitoring útmutató
- **docs/getting-started/authsecurity.md**: - Professzionális biztonsági minták
- **docs/pre-deployment/coordination-patterns.md**: - Haladó több ügynökös architektúrák
- **Új tartalom összességében**: - Következetesen magas minőségi színvonal

#### Technikai megvalósítás
- **Application Insights**: Log Analytics + egyedi telemetria + elosztott nyomkövetés
- **Hitelesítés**: Kezelt identitás + Key Vault + RBAC minták
- **Több ügynökös**: Service Bus + Cosmos DB + Container Apps + orkesztráció
- **Monitoring**: Élő metrikák + Kusto lekérdezések + riasztások + irányítópultok
- **Költségkezelés**: Mintavételi stratégiák, megőrzési szabályok, költségkontroll

### [v3.7.0] - 2025-11-19

#### Dokumentáció minőségi fejlesztések és új Azure OpenAI példa
**Ez a verzió javítja a dokumentáció minőségét a tárhelyen, és hozzáad egy teljes Azure OpenAI telepítési példát GPT-4 chat interfésszel.**

#### Hozzáadva
- **🤖 Azure OpenAI Chat Példa**: Teljes GPT-4 telepítés működő implementációval az `examples/azure-openai-chat/` mappában:
  - Teljes Azure OpenAI infrastruktúra (GPT-4 modell telepítés)
  - Python parancssori chat interfész beszélgetési előzményekkel
  - Key Vault integráció biztonságos API kulcs tároláshoz
  - Token használat követése és költségbecslés
  - Sebességkorlátozás és hibakezelés
  - Átfogó README 35-45 perces telepítési útmutatóval
  - 11 termelésre kész fájl (Bicep sablonok, Python alkalmazás, konfiguráció)
- **📚 Dokumentációs gyakorlatok**: Gyakorlati feladatok hozzáadva a konfigurációs útmutatóhoz:
  - 1. gyakorlat: Több környezet konfiguráció (15 perc)
  - 2. gyakorlat: Titokkezelési gyakorlat (10 perc)
  - Tiszta siker kritériumok és ellenőrzési lépések
- **✅ Telepítési ellenőrzés**: Ellenőrzési szekció hozzáadva a telepítési útmutatóhoz:
  - Egészségügyi ellenőrzési eljárások
  - Siker kritériumok ellenőrzőlista
  - Várható kimenetek minden telepítési parancshoz
  - Gyors hibakeresési referencia

#### Fejlesztve
- **examples/README.md**: Frissítve A-minőségre (93%):
  - Hozzáadva azure-openai-chat minden releváns szekcióhoz
  - Helyi példák száma frissítve 3-ról 4-re
  - Hozzáadva az AI Alkalmazási Példák táblázathoz
  - Integrálva a Gyors Kezdés középhaladó felhasználók számára
  - Hozzáadva az Azure AI Foundry Sablonok szekcióhoz
  - Frissítve összehasonlító mátrix és technológiai keresési szekciók
- **Dokumentáció minősége**: Javítva B+ (87%) → A- (92%) a docs mappában:
  - Várható kimenetek hozzáadva kritikus parancs példákhoz
  - Ellenőrzési lépések beépítve konfigurációs változásokhoz
  - Gyakorlati tanulás javítva gyakorlati feladatokkal

#### Módosítva
- **Tanulási folyamat**: Jobb integráció AI példákkal középhaladó tanulók számára
- **Dokumentáció struktúra**: Akcióorientáltabb gyakorlatok tiszta eredményekkel
- **Ellenőrzési folyamat**: Kifejezett siker kritériumok hozzáadva kulcsfontosságú munkafolyamatokhoz

#### Javítva
- **Fejlesztői élmény**: Azure OpenAI telepítés most 35-45 perc (vs 60-90 komplex alternatívák esetén)
- **Költség átláthatóság**: Tiszta költségbecslések ($50-200/hó) az Azure OpenAI példához
- **Tanulási út**: AI fejlesztőknek tiszta belépési pont az azure-openai-chat példával
- **Dokumentációs szabványok**: Következetes várható kimenetek és ellenőrzési lépések

#### Validálva
- ✅ Azure OpenAI példa teljesen működőképes az `azd up` parancs segítségével
- ✅ Mind a 11 implementációs fájl szintaktikailag helyes
- ✅ README utasítások megfelelnek a tényleges telepítési élménynek
- ✅ Dokumentációs hivatkozások frissítve 8+ helyen
- ✅ Példák indexe pontosan tükrözi a 4 helyi példát
- ✅ Nincsenek duplikált külső hivatkozások a táblázatokban
- ✅ Minden navigációs hivatkozás helyes

#### Technikai megvalósítás
- **Azure OpenAI Architektúra**: GPT-4 + Key Vault + Container Apps minta
- **Biztonság**: Kezelt identitás kész, titkok Key Vault-ban
- **Monitoring**: Application Insights integráció
- **Költségkezelés**: Token követés és használati optimalizálás
- **Telepítés**: Egyetlen `azd up` parancs a teljes beállításhoz

### [v3.6.0] - 2025-11-19

#### Nagy frissítés: Container App telepítési példák
**Ez a verzió átfogó, termelésre kész konténeres alkalmazás telepítési példákat vezet be az Azure Developer CLI (AZD) használatával, teljes dokumentációval és integrációval a tanulási útvonalba.**

#### Hozzáadva
- **🚀 Container App Példák**: Új helyi példák az `examples/container-app/` mappában:
  - [Fő útmutató](examples/container-app/README.md): Teljes áttekintés a konténeres telepítésekről, gyors kezdés, termelés és haladó minták
  - [Egyszerű Flask API](../../examples/container-app/simple-flask-api): Kezdőbarát REST API nullára skálázással, egészségügyi próbákkal, monitoringgal és hibakereséssel
  - [Mikroszolgáltatások architektúra](../../examples/container-app/microservices): Termelésre kész több szolgáltatás telepítés (API Gateway, Product, Order, User, Notification), aszinkron üzenetküldés, Service Bus, Cosmos DB, Azure SQL, elosztott nyomkövetés, kék-zöld/kanári telepítés
- **Legjobb gyakorlatok**: Biztonság, monitoring, költségoptimalizálás és CI/CD útmutató konténeres munkaterhelésekhez
- **Kódminták**: Teljes `azure.yaml`, Bicep sablonok és többnyelvű szolgáltatás implementációk (Python, Node.js, C#, Go)
- **Tesztelés és hibakeresés**: Végponttól végig tesztelési forgatókönyvek, monitoring parancsok, hibakeresési útmutató

#### Módosítva
- **README.md**: Frissítve, hogy kiemelje és hivatkozzon az új konténeres alkalmazás példákra a "Helyi példák - Konténeres alkalmazások" alatt
- **examples/README.md**: Frissítve, hogy kiemelje a konténeres alkalmazás példákat, hozzáadja az összehasonlító mátrix bejegyzéseit, és frissítse a technológiai/architektúra hivatkozásokat
- **Tanfolyam vázlat és tanulási útmutató**: Frissítve, hogy hivatkozzon az új konténeres alkalmazás példákra és telepítési mintákra a releváns fejezetekben

#### Validálva
- ✅ Minden új példa telepíthető az `azd up` parancs segítségével és követi a legjobb gyakorlatokat
- ✅ Dokumentációs keresztlinkek és navigáció frissítve
- ✅ Példák lefedik a kezdőtől a haladó forgatókönyveket, beleértve a termelési mikroszolgáltatásokat

#### Megjegyzések
- **Hatókör**: Csak angol dokumentáció és példák
- **Következő lépések**: Bővítés további haladó konténer mintákkal és CI/CD automatizálással a jövőbeli kiadásokban

### [v3.5.0] - 2025-11-19

#### Termék újramárkázás: Microsoft Foundry
**Ez a verzió átfogó terméknév-változtatást hajt végre az "Azure AI Foundry"-ról "Microsoft Foundry"-ra az összes angol dokumentációban, tükrözve a Microsoft hivatalos újramárkázását.**

#### Módosítva
- **🔄 Terméknév frissítés**: Teljes újramárkázás "Azure AI Foundry"-ról "Microsoft Foundry"-ra
  - Minden hivatkozás frissítve az angol dokumentációban a `docs/` mappában
  - Mappa átnevezve: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Fájl átnevezve: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Összesen: 23 tartalmi hivatkozás frissítve 7 dokumentációs fájlban

- **📁 Mappastruktúra változások**:
  - `docs/ai-foundry/` átnevezve `docs/microsoft-foundry/
- **Workshop**: A workshop anyagai (`workshop/`) ebben a verzióban nem frissültek
- **Példák**: A példafájlok még mindig hivatkozhatnak régi elnevezésekre (a jövőbeni frissítések során kerülnek javításra)
- **Külső hivatkozások**: A külső URL-ek és a GitHub-tárház hivatkozásai változatlanok maradnak

#### Migrációs útmutató közreműködők számára
Ha helyi ágaid vagy dokumentációid a régi struktúrára hivatkoznak:
1. Frissítsd a mappahivatkozásokat: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Frissítsd a fájlhivatkozásokat: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Cseréld ki a termék nevét: "Azure AI Foundry" → "Microsoft Foundry"
4. Ellenőrizd, hogy az összes belső dokumentációs hivatkozás továbbra is működik

---

### [v3.4.0] - 2025-10-24

#### Infrastruktúra előnézet és validáció fejlesztések
**Ez a verzió átfogó támogatást nyújt az új Azure Developer CLI előnézeti funkcióhoz, és javítja a workshop felhasználói élményt.**

#### Hozzáadva
- **🧪 azd provision --preview funkció dokumentációja**: Az új infrastruktúra előnézeti képesség teljes körű lefedése
  - Parancsreferencia és használati példák egy gyorsreferenciában
  - Részletes integráció az előkészítési útmutatóban, esettanulmányokkal és előnyökkel
  - Előzetes ellenőrzési integráció a biztonságosabb telepítési validáció érdekében
  - Kezdő útmutató frissítései a biztonságos telepítési gyakorlatokkal
- **🚧 Workshop állapotjelző banner**: Professzionális HTML banner, amely jelzi a workshop fejlesztési állapotát
  - Gradiens dizájn építési jelzőkkel a felhasználók egyértelmű tájékoztatására
  - Utolsó frissítési időbélyeg az átláthatóság érdekében
  - Mobilbarát dizájn minden eszköztípushoz

#### Fejlesztve
- **Infrastruktúra biztonság**: Az előnézeti funkció integrálása a telepítési dokumentációban
- **Telepítés előtti validáció**: Az automatizált szkriptek mostantól tartalmazzák az infrastruktúra előnézeti tesztelését
- **Fejlesztői munkafolyamat**: Frissített parancssorozatok, amelyek az előnézetet a legjobb gyakorlatként tartalmazzák
- **Workshop élmény**: Egyértelmű elvárások a felhasználók számára a tartalomfejlesztési állapotról

#### Módosítva
- **Telepítési legjobb gyakorlatok**: Az előnézet-alapú munkafolyamat most ajánlott megközelítés
- **Dokumentációs folyamat**: Az infrastruktúra validáció korábban kerül bemutatásra a tanulási folyamatban
- **Workshop prezentáció**: Professzionális állapotkommunikáció egyértelmű fejlesztési idővonallal

#### Javítva
- **Biztonság-központú megközelítés**: Az infrastruktúra változásai most validálhatók a telepítés előtt
- **Csapatmunka**: Az előnézeti eredmények megoszthatók felülvizsgálatra és jóváhagyásra
- **Költségtudatosság**: Jobb megértés az erőforrásköltségekről az előkészítés előtt
- **Kockázatcsökkentés**: Csökkentett telepítési hibák az előzetes validáció révén

#### Technikai megvalósítás
- **Több dokumentum integráció**: Az előnézeti funkció dokumentálása 4 kulcsfontosságú fájlban
- **Parancsminták**: Konzisztens szintaxis és példák a dokumentációban
- **Legjobb gyakorlat integráció**: Az előnézet beépítése a validációs munkafolyamatokba és szkriptekbe
- **Vizuális jelölők**: Egyértelmű ÚJ funkció jelölések a felfedezhetőség érdekében

#### Workshop infrastruktúra
- **Állapotkommunikáció**: Professzionális HTML banner gradiens stílussal
- **Felhasználói élmény**: Egyértelmű fejlesztési állapot, amely elkerüli a zavart
- **Professzionális prezentáció**: Megőrzi a tárház hitelességét, miközben elvárásokat állít fel
- **Idővonal átláthatóság**: 2025 októberi utolsó frissítési időbélyeg a felelősségvállalás érdekében

### [v3.3.0] - 2025-09-24

#### Fejlesztett workshop anyagok és interaktív tanulási élmény
**Ez a verzió átfogó workshop anyagokat vezet be böngészőalapú interaktív útmutatókkal és strukturált tanulási utakkal.**

#### Hozzáadva
- **🎥 Interaktív workshop útmutató**: Böngészőalapú workshop élmény MkDocs előnézeti képességgel
- **📝 Strukturált workshop utasítások**: 7 lépéses irányított tanulási út a felfedezéstől a testreszabásig
  - 0-Bevezetés: Workshop áttekintés és beállítás
  - 1-Válassz-AI-Sablont: Sablon felfedezési és kiválasztási folyamat
  - 2-Ellenőrizd-AI-Sablont: Telepítési és validációs eljárások
  - 3-Bontsd-le-AI-Sablont: A sablon architektúrájának megértése
  - 4-Konfiguráld-AI-Sablont: Konfiguráció és testreszabás
  - 5-Testreszabás-AI-Sablon: Haladó módosítások és iterációk
  - 6-Infrastruktúra-Lebontás: Tisztítás és erőforráskezelés
  - 7-Összegzés: Összefoglalás és következő lépések
- **🛠️ Workshop eszközök**: MkDocs konfiguráció Material témával a tanulási élmény javítására
- **🎯 Gyakorlati tanulási út**: 3 lépéses módszertan (Felfedezés → Telepítés → Testreszabás)
- **📱 GitHub Codespaces integráció**: Zökkenőmentes fejlesztési környezet beállítás

#### Fejlesztve
- **AI Workshop Lab**: Kiterjesztve átfogó 2-3 órás strukturált tanulási élménnyel
- **Workshop dokumentáció**: Professzionális prezentáció navigációval és vizuális segédletekkel
- **Tanulási haladás**: Egyértelmű lépésről lépésre útmutatás a sablon kiválasztásától a termelési telepítésig
- **Fejlesztői élmény**: Integrált eszközök a fejlesztési munkafolyamatok egyszerűsítésére

#### Javítva
- **Hozzáférhetőség**: Böngészőalapú felület kereséssel, másolási funkcióval és téma váltással
- **Önálló tanulás**: Rugalmas workshop struktúra, amely alkalmazkodik a különböző tanulási sebességekhez
- **Gyakorlati alkalmazás**: Valós AI sablon telepítési forgatókönyvek
- **Közösségi integráció**: Discord integráció workshop támogatásra és együttműködésre

#### Workshop funkciók
- **Beépített keresés**: Gyors kulcsszó és lecke felfedezés
- **Kódblokkok másolása**: Lebegésre másolható funkció minden kódpéldához
- **Téma váltás**: Sötét/világos mód támogatás különböző preferenciákhoz
- **Vizuális elemek**: Képernyőképek és diagramok a jobb megértés érdekében
- **Segítség integráció**: Közvetlen Discord hozzáférés közösségi támogatáshoz

### [v3.2.0] - 2025-09-17

#### Jelentős navigációs átszervezés és fejezet-alapú tanulási rendszer
**Ez a verzió átfogó fejezet-alapú tanulási struktúrát vezet be, javított navigációval az egész tárházban.**

#### Hozzáadva
- **📚 Fejezet-alapú tanulási rendszer**: Az egész kurzus átszervezése 8 progresszív tanulási fejezetre
  - 1. fejezet: Alapok és gyors kezdés (⭐ - 30-45 perc)
  - 2. fejezet: AI-első fejlesztés (⭐⭐ - 1-2 óra)
  - 3. fejezet: Konfiguráció és hitelesítés (⭐⭐ - 45-60 perc)
  - 4. fejezet: Infrastruktúra mint kód és telepítés (⭐⭐⭐ - 1-1,5 óra)
  - 5. fejezet: Többügynökös AI megoldások (⭐⭐⭐⭐ - 2-3 óra)
  - 6. fejezet: Telepítés előtti validáció és tervezés (⭐⭐ - 1 óra)
  - 7. fejezet: Hibakeresés és hibaelhárítás (⭐⭐ - 1-1,5 óra)
  - 8. fejezet: Termelési és vállalati minták (⭐⭐⭐⭐ - 2-3 óra)
- **📚 Átfogó navigációs rendszer**: Konzisztens navigációs fejlécek és láblécek az összes dokumentációban
- **🎯 Haladáskövetés**: Kurzus befejezési ellenőrzőlista és tanulási ellenőrzési rendszer
- **🗺️ Tanulási útmutató**: Egyértelmű belépési pontok különböző tapasztalati szintekhez és célokhoz
- **🔗 Kereszthivatkozásos navigáció**: Kapcsolódó fejezetek és előfeltételek egyértelműen összekapcsolva

#### Fejlesztve
- **README struktúra**: Átalakítva strukturált tanulási platformmá fejezet-alapú szervezéssel
- **Dokumentációs navigáció**: Minden oldal most tartalmaz fejezetkörnyezetet és haladási útmutatót
- **Sablon szervezés**: Példák és sablonok a megfelelő tanulási fejezetekhez rendelve
- **Erőforrás integráció**: Gyorsreferenciák, GYIK és tanulmányi útmutatók kapcsolva a releváns fejezetekhez
- **Workshop integráció**: Gyakorlati laborok több fejezet tanulási céljaihoz igazítva

#### Módosítva
- **Tanulási haladás**: Lineáris dokumentáció helyett rugalmas fejezet-alapú tanulásra váltás
- **Konfiguráció elhelyezése**: A konfigurációs útmutató áthelyezése a 3. fejezetbe a jobb tanulási folyamat érdekében
- **AI tartalom integráció**: Jobb integráció az AI-specifikus tartalommal a tanulási út során
- **Termelési tartalom**: Haladó minták konszolidálása a 8. fejezetben a vállalati tanulók számára

#### Javítva
- **Felhasználói élmény**: Egyértelmű navigációs morzsák és fejezet haladási jelzők
- **Hozzáférhetőség**: Konzisztens navigációs minták az egyszerűbb kurzus bejárás érdekében
- **Professzionális prezentáció**: Egyetemi stílusú kurzusstruktúra, amely alkalmas akadémiai és vállalati képzésre
- **Tanulási hatékonyság**: Csökkentett idő a releváns tartalom megtalálásához a jobb szervezés révén

#### Technikai megvalósítás
- **Navigációs fejlécek**: Standardizált fejezet navigáció több mint 40 dokumentációs fájlban
- **Lábléc navigáció**: Konzisztens haladási útmutató és fejezet befejezési jelzők
- **Kereszthivatkozás**: Átfogó belső hivatkozási rendszer, amely összekapcsolja a kapcsolódó fogalmakat
- **Fejezet térképezés**: Sablonok és példák egyértelműen társítva a tanulási célokhoz

#### Tanulmányi útmutató fejlesztés
- **📚 Átfogó tanulási célok**: Átszervezett tanulmányi útmutató az 8 fejezetes rendszerhez igazítva
- **🎯 Fejezet-alapú értékelés**: Minden fejezet tartalmaz specifikus tanulási célokat és gyakorlati feladatokat
- **📋 Haladáskövetés**: Heti tanulási ütemterv mérhető eredményekkel és befejezési ellenőrzőlistákkal
- **❓ Értékelési kérdések**: Tudásellenőrző kérdések minden fejezethez professzionális eredményekkel
- **🛠️ Gyakorlati feladatok**: Gyakorlati tevékenységek valós telepítési forgatókönyvekkel és hibaelhárítással
- **📊 Készségfejlesztés**: Egyértelmű előrelépés az alapfogalmaktól a vállalati mintákig karrierfejlesztési fókuszban
- **🎓 Tanúsítási keretrendszer**: Professzionális fejlődési eredmények és közösségi elismerési rendszer
- **⏱️ Idővonal kezelés**: Strukturált 10 hetes tanulási terv mérföldkő-ellenőrzéssel

### [v3.1.0] - 2025-09-17

#### Fejlesztett többügynökös AI megoldások
**Ez a verzió javítja a többügynökös kiskereskedelmi megoldást jobb ügynöknevekkel és fejlettebb dokumentációval.**

#### Módosítva
- **Többügynökös terminológia**: A "Cora agent" kifejezés helyett "Customer agent" került használatra a kiskereskedelmi többügynökös megoldásban az egyértelműség érdekében
- **Ügynök architektúra**: Az összes dokumentáció, ARM sablon és kódpélda frissítve a "Customer agent" elnevezés használatával
- **Konfigurációs példák**: Modernizált ügynök konfigurációs minták frissített elnevezési konvenciókkal
- **Dokumentációs konzisztencia**: Minden hivatkozás professzionális, leíró ügynökneveket használ

#### Fejlesztve
- **ARM sablon csomag**: Frissített retail-multiagent-arm-template Customer agent hivatkozásokkal
- **Architektúra diagramok**: Frissített Mermaid diagramok az új ügynöknevekkel
- **Kódpéldák**: Python osztályok és implementációs példák most CustomerAgent elnevezést használnak
- **Környezeti változók**: Az összes telepítési szkript frissítve CUSTOMER_AGENT_NAME konvenciók használatára

#### Javítva
- **Fejlesztői élmény**: Egyértelműbb ügynökszerepek és felelősségek a dokumentációban
- **Termelési készenlét**: Jobb igazodás a vállalati elnevezési konvenciókhoz
- **Tanulási anyagok**: Intuitívabb ügynöknevek az oktatási célokra
- **Sablon használhatóság**: Egyszerűbb megértés az ügynök funkciókról és telepítési mintákról

#### Technikai részletek
- Frissített Mermaid architektúra diagramok CustomerAgent hivatkozásokkal
- CoraAgent osztálynevek c
- **Tartalom bemutatása**: Dekoratív elemek eltávolítása a tiszta, professzionális formázás érdekében
- **Linkstruktúra**: Az összes belső link frissítése az új navigációs rendszer támogatására

#### Fejlesztések
- **Hozzáférhetőség**: Emoji-függőségek eltávolítása a képernyőolvasók jobb kompatibilitása érdekében
- **Professzionális megjelenés**: Tiszta, akadémiai stílusú bemutatás, amely alkalmas vállalati tanulásra
- **Tanulási élmény**: Strukturált megközelítés, egyértelmű célokkal és eredményekkel minden leckéhez
- **Tartalom szervezése**: Jobb logikai folyamat és kapcsolódás a kapcsolódó témák között

### [v1.0.0] - 2025-09-09

#### Első kiadás - Átfogó AZD tanulási adattár

#### Hozzáadva
- **Alapvető dokumentációs struktúra**
  - Teljes kezdő útmutató sorozat
  - Átfogó telepítési és előkészítési dokumentáció
  - Részletes hibaelhárítási források és hibakeresési útmutatók
  - Előtelepítési validációs eszközök és eljárások

- **Kezdő modul**
  - AZD alapok: Alapfogalmak és terminológia
  - Telepítési útmutató: Platform-specifikus beállítási utasítások
  - Konfigurációs útmutató: Környezet beállítása és hitelesítés
  - Első projekt bemutató: Lépésről lépésre gyakorlati tanulás

- **Telepítési és előkészítési modul**
  - Telepítési útmutató: Teljes munkafolyamat dokumentáció
  - Előkészítési útmutató: Infrastruktúra kód formájában Bicep segítségével
  - Legjobb gyakorlatok a termelési telepítésekhez
  - Több szolgáltatásból álló architektúra minták

- **Előtelepítési validációs modul**
  - Kapacitástervezés: Azure erőforrások elérhetőségének validációja
  - SKU kiválasztás: Átfogó szolgáltatási szint útmutató
  - Előzetes ellenőrzések: Automatikus validációs szkriptek (PowerShell és Bash)
  - Költségbecslési és költségvetési tervezési eszközök

- **Hibaelhárítási modul**
  - Gyakori problémák: Gyakran előforduló problémák és megoldások
  - Hibakeresési útmutató: Szisztematikus hibaelhárítási módszerek
  - Fejlett diagnosztikai technikák és eszközök
  - Teljesítményfigyelés és optimalizálás

- **Források és hivatkozások**
  - Parancsok gyorsreferenciája: Alapvető parancsok gyors elérése
  - Szószedet: Átfogó terminológia és rövidítések meghatározása
  - GYIK: Részletes válaszok gyakori kérdésekre
  - Külső források linkjei és közösségi kapcsolatok

- **Példák és sablonok**
  - Egyszerű webalkalmazás példa
  - Statikus weboldal telepítési sablon
  - Konténeralkalmazás konfiguráció
  - Adatbázis integrációs minták
  - Mikroszolgáltatások architektúra példák
  - Szerver nélküli funkciók implementációi

#### Funkciók
- **Többplatformos támogatás**: Telepítési és konfigurációs útmutatók Windows, macOS és Linux rendszerekhez
- **Több szintű készségek**: Tartalom diákoknak és professzionális fejlesztőknek
- **Gyakorlati fókusz**: Gyakorlati példák és valós forgatókönyvek
- **Átfogó lefedettség**: Alapfogalmaktól a fejlett vállalati mintákig
- **Biztonságközpontú megközelítés**: Biztonsági legjobb gyakorlatok integrálva
- **Költségoptimalizálás**: Útmutató költséghatékony telepítésekhez és erőforrás-kezeléshez

#### Dokumentáció minősége
- **Részletes kódpéldák**: Gyakorlati, tesztelt kódminták
- **Lépésről lépésre utasítások**: Tiszta, cselekvésre ösztönző útmutatók
- **Átfogó hibaelhárítás**: Gyakori problémák megoldása
- **Legjobb gyakorlatok integrációja**: Iparági szabványok és ajánlások
- **Verziókompatibilitás**: Naprakész a legújabb Azure szolgáltatásokkal és azd funkciókkal

## Tervezett jövőbeli fejlesztések

### Verzió 3.1.0 (Tervezett)
#### AI platform bővítése
- **Többmodell támogatás**: Integrációs minták Hugging Face, Azure Machine Learning és egyedi modellek számára
- **AI ügynök keretrendszerek**: Sablonok LangChain, Semantic Kernel és AutoGen telepítésekhez
- **Fejlett RAG minták**: Vektordatabase opciók az Azure AI Search-en túl (Pinecone, Weaviate stb.)
- **AI megfigyelhetőség**: Fejlett monitorozás a modell teljesítményére, tokenhasználatra és válaszminőségre

#### Fejlesztői élmény
- **VS Code bővítmény**: Integrált AZD + AI Foundry fejlesztési élmény
- **GitHub Copilot integráció**: AI által támogatott AZD sablongenerálás
- **Interaktív bemutatók**: Gyakorlati kódolási gyakorlatok automatikus validációval AI forgatókönyvekhez
- **Videós tartalom**: Kiegészítő videós bemutatók vizuális tanulók számára, AI telepítésekre fókuszálva

### Verzió 4.0.0 (Tervezett)
#### Vállalati AI minták
- **Irányítási keretrendszer**: AI modell irányítás, megfelelőség és audit nyomvonalak
- **Több bérlős AI**: Minták több ügyfél kiszolgálására izolált AI szolgáltatásokkal
- **Edge AI telepítés**: Integráció Azure IoT Edge és konténerpéldányokkal
- **Hibrid felhő AI**: Többfelhős és hibrid telepítési minták AI munkaterhelésekhez

#### Fejlett funkciók
- **AI csővezeték automatizálás**: MLOps integráció Azure Machine Learning csővezetékekkel
- **Fejlett biztonság**: Zero-trust minták, privát végpontok és fejlett fenyegetésvédelem
- **Teljesítményoptimalizálás**: Fejlett hangolási és skálázási stratégiák nagy áteresztőképességű AI alkalmazásokhoz
- **Globális elosztás**: Tartalomkézbesítési és edge caching minták AI alkalmazásokhoz

### Verzió 3.0.0 (Tervezett) - Felülírva az aktuális kiadással
#### Javasolt kiegészítések - Most megvalósítva a v3.0.0-ban
- ✅ **AI-központú tartalom**: Átfogó Azure AI Foundry integráció (Befejezve)
- ✅ **Interaktív bemutatók**: Gyakorlati AI workshop labor (Befejezve)
- ✅ **Fejlett biztonsági modul**: AI-specifikus biztonsági minták (Befejezve)
- ✅ **Teljesítményoptimalizálás**: AI munkaterhelés hangolási stratégiák (Befejezve)

### Verzió 2.1.0 (Tervezett) - Részben megvalósítva a v3.0.0-ban
#### Kisebb fejlesztések - Néhány befejezve az aktuális kiadásban
- ✅ **További példák**: AI-központú telepítési forgatókönyvek (Befejezve)
- ✅ **Kibővített GYIK**: AI-specifikus kérdések és hibaelhárítás (Befejezve)
- **Eszközintegráció**: Fejlesztett IDE és szerkesztő integrációs útmutatók
- ✅ **Monitorozás bővítése**: AI-specifikus monitorozási és riasztási minták (Befejezve)

#### Még tervezett jövőbeli kiadásra
- **Mobilbarát dokumentáció**: Reszponzív design mobil tanuláshoz
- **Offline hozzáférés**: Letölthető dokumentációs csomagok
- **Fejlesztett IDE integráció**: VS Code bővítmény AZD + AI munkafolyamatokhoz
- **Közösségi irányítópult**: Valós idejű közösségi metrikák és hozzájáruláskövetés

## Hozzájárulás a változásnaplóhoz

### Változások jelentése
Amikor hozzájárulsz ehhez az adattárhoz, győződj meg róla, hogy a változásnapló bejegyzései tartalmazzák:

1. **Verziószám**: Szemantikus verziózás szerint (major.minor.patch)
2. **Dátum**: Kiadás vagy frissítés dátuma YYYY-MM-DD formátumban
3. **Kategória**: Hozzáadva, Módosítva, Elavult, Eltávolítva, Javítva, Biztonság
4. **Tiszta leírás**: Rövid leírás arról, mi változott
5. **Hatásértékelés**: Hogyan érinti a változás a meglévő felhasználókat

### Változás kategóriák

#### Hozzáadva
- Új funkciók, dokumentációs szakaszok vagy képességek
- Új példák, sablonok vagy tanulási források
- További eszközök, szkriptek vagy segédprogramok

#### Módosítva
- Meglévő funkciók vagy dokumentáció módosítása
- Frissítések a tisztaság vagy pontosság javítása érdekében
- Tartalom vagy szervezés átalakítása

#### Elavult
- Funkciók vagy megközelítések, amelyek kivezetésre kerülnek
- Dokumentációs szakaszok, amelyek eltávolításra kerülnek
- Módszerek, amelyeknek jobb alternatívái vannak

#### Eltávolítva
- Funkciók, dokumentáció vagy példák, amelyek már nem relevánsak
- Elavult információk vagy elavult megközelítések
- Felesleges vagy összevont tartalom

#### Javítva
- Hibák javítása a dokumentációban vagy kódban
- Jelentett problémák vagy hibák megoldása
- Pontosság vagy funkcionalitás javítása

#### Biztonság
- Biztonsággal kapcsolatos fejlesztések vagy javítások
- Frissítések a biztonsági legjobb gyakorlatokhoz
- Biztonsági sebezhetőségek megoldása

### Szemantikus verziózási irányelvek

#### Fő verzió (X.0.0)
- Törő változások, amelyek felhasználói beavatkozást igényelnek
- Jelentős tartalom vagy szervezés átalakítása
- Változások, amelyek megváltoztatják az alapvető megközelítést vagy módszertant

#### Kisebb verzió (X.Y.0)
- Új funkciók vagy tartalom hozzáadása
- Fejlesztések, amelyek visszafelé kompatibilisek maradnak
- További példák, eszközök vagy források

#### Javítás verzió (X.Y.Z)
- Hibajavítások és korrekciók
- Kisebb fejlesztések meglévő tartalomhoz
- Tisztázások és apró fejlesztések

## Közösségi visszajelzés és javaslatok

Aktívan ösztönözzük a közösségi visszajelzést, hogy javítsuk ezt a tanulási forrást:

### Hogyan adhat visszajelzést
- **GitHub Issues**: Jelents problémákat vagy javasolj fejlesztéseket (AI-specifikus problémák is szívesen látottak)
- **Discord Discussions**: Oszd meg ötleteidet és vegyél részt az Azure AI Foundry közösségben
- **Pull Requests**: Közvetlen fejlesztések hozzájárulása a tartalomhoz, különösen AI sablonokhoz és útmutatókhoz
- **Azure AI Foundry Discord**: Vegyél részt az #Azure csatornán AZD + AI beszélgetésekben
- **Közösségi fórumok**: Vegyél részt szélesebb Azure fejlesztői beszélgetésekben

### Visszajelzési kategóriák
- **AI tartalom pontossága**: Javítások az AI szolgáltatások integrációjára és telepítési információira
- **Tanulási élmény**: Javaslatok az AI fejlesztői tanulási folyamat javítására
- **Hiányzó AI tartalom**: Kérések további AI sablonokra, mintákra vagy példákra
- **Hozzáférhetőség**: Fejlesztések a különböző tanulási igényekhez
- **AI eszköz integráció**: Javaslatok az AI fejlesztési munkafolyamatok jobb integrációjára
- **Termelési AI minták**: Vállalati AI telepítési minták kérései

### Válasz kötelezettségvállalás
- **Probléma válasz**: 48 órán belül a jelentett problémákra
- **Funkciókérések**: Értékelés egy héten belül
- **Közösségi hozzájárulások**: Áttekintés egy héten belül
- **Biztonsági problémák**: Azonnali prioritás gyorsított válasszal

## Karbantartási ütemterv

### Rendszeres frissítések
- **Havi áttekintések**: Tartalom pontossága és linkek validációja
- **Negyedéves frissítések**: Jelentős tartalom hozzáadások és fejlesztések
- **Féléves áttekintések**: Átfogó átszervezés és fejlesztés
- **Éves kiadások**: Jelentős verziófrissítések jelentős fejlesztésekkel

### Monitorozás és minőségbiztosítás
- **Automatikus tesztelés**: Kódpéldák és linkek rendszeres validációja
- **Közösségi visszajelzés integrációja**: Felhasználói javaslatok rendszeres beépítése
- **Technológiai frissítések**: Igazítás a legújabb Azure szolgáltatásokkal és azd kiadásokkal
- **Hozzáférhetőségi auditok**: Rendszeres áttekintés az inkluzív tervezési elvek érdekében

## Verzió támogatási politika

### Aktuális verzió támogatás
- **Legújabb fő verzió**: Teljes támogatás rendszeres frissítésekkel
- **Előző fő verzió**: Biztonsági frissítések és kritikus javítások 12 hónapig
- **Régi verziók**: Csak közösségi támogatás, hivatalos frissítések nélkül

### Migrációs útmutatás
Amikor fő verziók jelennek meg, biztosítunk:
- **Migrációs útmutatók**: Lépésről lépésre átállási utasítások
- **Kompatibilitási megjegyzések**: Részletek a törő változásokról
- **Eszköztámogatás**: Szkriptek vagy segédprogramok a migráció segítésére
- **Közösségi támogatás**: Dedikált fórumok migrációs kérdésekhez

---

**Navigáció**
- **Előző lecke**: [Tanulmányi útmutató](resources/study-guide.md)
- **Következő lecke**: Vissza a [Fő README](README.md)

**Maradj naprakész**: Kövesd ezt az adattárat értesítésekért az új kiadásokról és a tananyagok fontos frissítéseiről.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősségi nyilatkozat**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Fontos információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->