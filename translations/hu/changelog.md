<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T17:52:30+00:00",
  "source_file": "changelog.md",
  "language_code": "hu"
}
-->
# Változások naplója - AZD kezdőknek

## Bevezetés

Ez a változások naplója dokumentálja az AZD kezdőknek repository összes jelentős változását, frissítését és fejlesztését. Követjük a szemantikus verziózás elveit, és fenntartjuk ezt a naplót, hogy segítsük a felhasználókat megérteni, mi változott a verziók között.

## Tanulási célok

A változások naplójának áttekintésével:
- Tájékozódhat az új funkciókról és tartalmi bővítésekről
- Megértheti a meglévő dokumentációban végrehajtott fejlesztéseket
- Nyomon követheti a hibajavításokat és korrekciókat a pontosság érdekében
- Követheti a tananyagok fejlődését az idő múlásával

## Tanulási eredmények

A változások naplóbejegyzéseinek áttekintése után képes lesz:
- Azonosítani az új tartalmakat és tanulási forrásokat
- Megérteni, mely szakaszokat frissítették vagy fejlesztették
- Megtervezni tanulási útját a legfrissebb anyagok alapján
- Visszajelzést és javaslatokat adni a jövőbeli fejlesztésekhez

## Verziótörténet

### [v3.4.0] - 2025-10-24

#### Infrastruktúra előnézet és validációs fejlesztések
**Ez a verzió átfogó támogatást nyújt az új Azure Developer CLI előnézeti funkcióhoz, és javítja a workshop felhasználói élményét.**

#### Hozzáadva
- **🧪 azd provision --preview funkció dokumentáció**: Átfogó leírás az új infrastruktúra előnézeti képességről
  - Parancsreferencia és használati példák a segédletben
  - Részletes integráció a telepítési útmutatóban, esettanulmányokkal és előnyökkel
  - Előzetes ellenőrzés integrációja a biztonságosabb telepítési validáció érdekében
  - Kezdő útmutató frissítése biztonságos telepítési gyakorlatokkal
- **🚧 Workshop állapot banner**: Professzionális HTML banner, amely jelzi a workshop fejlesztési állapotát
  - Gradiens dizájn építési indikátorokkal a felhasználók egyértelmű tájékoztatása érdekében
  - Utolsó frissítés időbélyeg az átláthatóság érdekében
  - Mobilbarát dizájn minden eszköztípushoz

#### Fejlesztve
- **Infrastruktúra biztonság**: Az előnézeti funkció integrálva a telepítési dokumentációba
- **Telepítés előtti validáció**: Az automatikus szkriptek mostantól tartalmazzák az infrastruktúra előnézeti tesztelését
- **Fejlesztői munkafolyamat**: Frissített parancssorozatok, amelyek az előnézetet ajánlott gyakorlatként tartalmazzák
- **Workshop élmény**: Egyértelmű elvárások a felhasználók számára a tartalom fejlesztési állapotáról

#### Módosítva
- **Telepítési legjobb gyakorlatok**: Az előnézet-alapú munkafolyamat mostantól ajánlott megközelítés
- **Dokumentációs folyamat**: Az infrastruktúra validáció korábban helyezve a tanulási folyamatban
- **Workshop bemutatás**: Professzionális állapotkommunikáció egyértelmű fejlesztési idővonallal

#### Javítva
- **Biztonságos megközelítés**: Az infrastruktúra változásai mostantól validálhatók a telepítés előtt
- **Csapatmunka**: Az előnézeti eredmények megoszthatók felülvizsgálat és jóváhagyás céljából
- **Költségtudatosság**: Jobb megértés az erőforrás költségeiről a telepítés előtt
- **Kockázatcsökkentés**: Csökkentett telepítési hibák az előzetes validáció révén

#### Technikai megvalósítás
- **Több dokumentum integráció**: Az előnézeti funkció dokumentálva 4 kulcsfontosságú fájlban
- **Parancsminták**: Konzisztens szintaxis és példák a dokumentációban
- **Legjobb gyakorlat integráció**: Az előnézet beépítve a validációs munkafolyamatokba és szkriptekbe
- **Vizualizációs indikátorok**: Egyértelmű ÚJ funkció jelölések a felfedezhetőség érdekében

#### Workshop infrastruktúra
- **Állapotkommunikáció**: Professzionális HTML banner gradiens stílussal
- **Felhasználói élmény**: Egyértelmű fejlesztési állapot elkerüli a zavart
- **Professzionális bemutatás**: Fenntartja a repository hitelességét, miközben elvárásokat állít
- **Idővonal átláthatóság**: 2025 októberi utolsó frissítés időbélyeg az elszámoltathatóság érdekében

### [v3.3.0] - 2025-09-24

#### Workshop anyagok és interaktív tanulási élmény fejlesztése
**Ez a verzió átfogó workshop anyagokat vezet be böngészőalapú interaktív útmutatókkal és strukturált tanulási utakkal.**

#### Hozzáadva
- **🎥 Interaktív workshop útmutató**: Böngészőalapú workshop élmény MkDocs előnézeti képességgel
- **📝 Strukturált workshop utasítások**: 7 lépéses irányított tanulási út a felfedezéstől a testreszabásig
  - 0-Bevezetés: Workshop áttekintés és beállítás
  - 1-Válassz-AI-Sablont: Sablon felfedezési és kiválasztási folyamat
  - 2-Ellenőrizd-AI-Sablont: Telepítési és validációs eljárások
  - 3-Bontsd-le-AI-Sablont: Sablon architektúra megértése
  - 4-Konfiguráld-AI-Sablont: Konfiguráció és testreszabás
  - 5-Testreszabás-AI-Sablon: Haladó módosítások és iterációk
  - 6-Infrastruktúra-Lebontás: Tisztítás és erőforrás-kezelés
  - 7-Összegzés: Összefoglaló és következő lépések
- **🛠️ Workshop eszközök**: MkDocs konfiguráció Material témával a tanulási élmény fokozására
- **🎯 Gyakorlati tanulási út**: 3 lépéses módszertan (Felfedezés → Telepítés → Testreszabás)
- **📱 GitHub Codespaces integráció**: Zökkenőmentes fejlesztési környezet beállítás

#### Fejlesztve
- **AI Workshop Lab**: Kiterjesztve átfogó 2-3 órás strukturált tanulási élménnyel
- **Workshop dokumentáció**: Professzionális bemutatás navigációval és vizuális segédletekkel
- **Tanulási előrehaladás**: Egyértelmű lépésről lépésre útmutatás a sablon kiválasztástól a termelési telepítésig
- **Fejlesztői élmény**: Integrált eszközök a zökkenőmentes fejlesztési munkafolyamatokhoz

#### Javítva
- **Hozzáférhetőség**: Böngészőalapú felület kereséssel, másolási funkcióval és téma váltással
- **Önálló tanulás**: Rugalmas workshop struktúra, amely különböző tanulási sebességeket támogat
- **Gyakorlati alkalmazás**: Valós AI sablon telepítési forgatókönyvek
- **Közösségi integráció**: Discord integráció workshop támogatás és együttműködés céljából

#### Workshop funkciók
- **Beépített keresés**: Gyors kulcsszó és lecke felfedezés
- **Kódblokkok másolása**: Hover-to-copy funkció minden kódpéldához
- **Téma váltás**: Sötét/világos mód támogatás különböző preferenciákhoz
- **Vizuális elemek**: Képernyőképek és diagramok a megértés fokozására
- **Segítség integráció**: Közvetlen Discord hozzáférés közösségi támogatáshoz

### [v3.2.0] - 2025-09-17

#### Jelentős navigációs átalakítás és fejezet-alapú tanulási rendszer
**Ez a verzió átfogó fejezet-alapú tanulási struktúrát vezet be, amely javítja a navigációt az egész repository-ban.**

#### Hozzáadva
- **📚 Fejezet-alapú tanulási rendszer**: Az egész kurzus átszervezése 8 progresszív tanulási fejezetbe
  - 1. fejezet: Alapok és gyors kezdés (⭐ - 30-45 perc)
  - 2. fejezet: AI-első fejlesztés (⭐⭐ - 1-2 óra)
  - 3. fejezet: Konfiguráció és hitelesítés (⭐⭐ - 45-60 perc)
  - 4. fejezet: Infrastruktúra mint kód és telepítés (⭐⭐⭐ - 1-1,5 óra)
  - 5. fejezet: Többügynökös AI megoldások (⭐⭐⭐⭐ - 2-3 óra)
  - 6. fejezet: Telepítés előtti validáció és tervezés (⭐⭐ - 1 óra)
  - 7. fejezet: Hibakeresés és hibaelhárítás (⭐⭐ - 1-1,5 óra)
  - 8. fejezet: Termelési és vállalati minták (⭐⭐⭐⭐ - 2-3 óra)
- **📚 Átfogó navigációs rendszer**: Konzisztens navigációs fejlécek és láblécek az összes dokumentációban
- **🎯 Haladáskövetés**: Kurzus befejezési ellenőrzőlista és tanulási igazolási rendszer
- **🗺️ Tanulási útmutató**: Egyértelmű belépési pontok különböző tapasztalati szintekhez és célokhoz
- **🔗 Kereszthivatkozás navigáció**: Kapcsolódó fejezetek és előfeltételek egyértelműen összekapcsolva

#### Fejlesztve
- **README struktúra**: Átalakítva strukturált tanulási platformmá fejezet-alapú szervezéssel
- **Dokumentáció navigáció**: Minden oldal mostantól tartalmazza a fejezet kontextusát és előrehaladási útmutatót
- **Sablon szervezés**: Példák és sablonok megfelelő tanulási fejezetekhez rendelve
- **Erőforrás integráció**: Segédletek, GYIK és tanulmányi útmutatók kapcsolva a releváns fejezetekhez
- **Workshop integráció**: Gyakorlati laborok több fejezet tanulási céljaihoz igazítva

#### Módosítva
- **Tanulási előrehaladás**: Lineáris dokumentációról rugalmas fejezet-alapú tanulásra váltva
- **Konfiguráció elhelyezés**: Konfigurációs útmutató áthelyezve a 3. fejezetbe a jobb tanulási folyamat érdekében
- **AI tartalom integráció**: Jobb integráció AI-specifikus tartalommal a tanulási út során
- **Termelési tartalom**: Haladó minták összevonva a 8. fejezetbe vállalati tanulók számára

#### Javítva
- **Felhasználói élmény**: Egyértelmű navigációs morzsák és fejezet előrehaladási indikátorok
- **Hozzáférhetőség**: Konzisztens navigációs minták az egyszerűbb kurzus bejárás érdekében
- **Professzionális bemutatás**: Egyetemi stílusú kurzus struktúra, amely alkalmas akadémiai és vállalati képzésre
- **Tanulási hatékonyság**: Csökkentett idő a releváns tartalom megtalálásához a jobb szervezés révén

#### Technikai megvalósítás
- **Navigációs fejlécek**: Standardizált fejezet navigáció több mint 40 dokumentációs fájlban
- **Lábléc navigáció**: Konzisztens előrehaladási útmutató és fejezet befejezési indikátorok
- **Kereszthivatkozás**: Átfogó belső hivatkozási rendszer, amely összekapcsolja a kapcsolódó fogalmakat
- **Fejezet térkép**: Sablonok és példák egyértelműen társítva a tanulási célokhoz

#### Tanulmányi útmutató fejlesztés
- **📚 Átfogó tanulási célok**: Átszervezett tanulmányi útmutató az 8 fejezetes rendszerhez igazítva
- **🎯 Fejezet-alapú értékelés**: Minden fejezet tartalmaz konkrét tanulási célokat és gyakorlati feladatokat
- **📋 Haladáskövetés**: Heti tanulási ütemterv mérhető eredményekkel és befejezési ellenőrzőlistákkal
- **❓ Értékelési kérdések**: Tudásellenőrző kérdések minden fejezethez professzionális eredményekkel
- **🛠️ Gyakorlati feladatok**: Gyakorlati tevékenységek valós telepítési forgatókönyvekkel és hibaelhárítással
- **📊 Készségfejlesztés**: Egyértelmű előrehaladás az alapfogalmaktól a vállalati mintákig karrierfejlesztési fókuszban
- **🎓 Tanúsítási keretrendszer**: Professzionális fejlődési eredmények és közösségi elismerési rendszer
- **⏱️ Idővonal kezelés**: Strukturált 10 hetes tanulási terv mérföldkő validációval

### [v3.1.0] - 2025-09-17

#### Többügynökös AI megoldások fejlesztése
**Ez a verzió javítja a többügynökös kiskereskedelmi megoldást jobb ügynök elnevezéssel és fejlesztett dokumentációval.**

#### Módosítva
- **Többügynökös terminológia**: A "Cora ügynök" kifejezés helyett "Ügyfél ügynök" került bevezetésre a kiskereskedelmi többügynökös megoldásban az egyértelműbb megértés érdekében
- **Ügynök architektúra**: Az összes dokumentáció, ARM sablon és kódpélda frissítve az egységes "Ügyfél ügynök" elnevezés használatával
- **Konfigurációs példák**: Modernizált ügynök konfigurációs minták frissített elnevezési konvenciókkal
- **Dokumentációs konzisztencia**: Minden hivatkozás professzionális, leíró ügynökneveket használ

#### Fejlesztve
- **ARM sablon csomag**: Frissített kiskereskedelmi-multiagent-arm-template Ügyfél ügynök hivatkozásokkal
- **Architektúra diagramok**: Frissített Mermaid diagramok az új ügynök elnevezéssel
- **Kódpéldák**: Python osztályok és implementációs példák mostantól CustomerAgent elnevezést használnak
- **Környezeti változók**: Az összes telepítési szkript frissítve CUSTOMER_AGENT_NAME konvenciók használatára

#### Javítva
- **Fejlesztői élmény**: Egyértelműbb ügynök szerepek és felelősségek a dokumentációban
- **Termelési készség**: Jobb igazodás a vállalati elnevezési konvenciókhoz
- **Tanulási anyag
- **Dokumentáció formátuma**: Az összes dokumentáció egységes, tanulásközpontú struktúrával lett szabványosítva
- **Navigációs folyamat**: Logikus sorrend kialakítása az összes tananyagban
- **Tartalom bemutatása**: Dekoratív elemek eltávolítása a tiszta, professzionális formázás érdekében
- **Hivatkozási struktúra**: Az összes belső hivatkozás frissítése az új navigációs rendszer támogatására

#### Fejlesztések
- **Hozzáférhetőség**: Az emoji-függőségek eltávolítása a képernyőolvasók jobb kompatibilitása érdekében
- **Professzionális megjelenés**: Tiszta, akadémiai stílusú prezentáció, amely alkalmas vállalati tanulásra
- **Tanulási élmény**: Strukturált megközelítés, világos célokkal és eredményekkel minden leckéhez
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
  - AZD alapok: Alapvető fogalmak és terminológia
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
  - Parancsok gyors útmutatója: Alapvető parancsok gyors referencia
  - Szószedet: Átfogó terminológia és rövidítések meghatározása
  - GYIK: Részletes válaszok gyakori kérdésekre
  - Külső források hivatkozásai és közösségi kapcsolatok

- **Példák és sablonok**
  - Egyszerű webalkalmazás példa
  - Statikus weboldal telepítési sablon
  - Konténeralkalmazás konfiguráció
  - Adatbázis integrációs minták
  - Mikroszolgáltatások architektúra példák
  - Szerver nélküli funkciók megvalósítása

#### Funkciók
- **Többplatformos támogatás**: Telepítési és konfigurációs útmutatók Windows, macOS és Linux rendszerekhez
- **Több szintű készség**: Tartalom diákoknak és professzionális fejlesztőknek
- **Gyakorlati fókusz**: Gyakorlati példák és valós forgatókönyvek
- **Átfogó lefedettség**: Alapvető fogalmaktól a fejlett vállalati mintákig
- **Biztonságközpontú megközelítés**: Biztonsági legjobb gyakorlatok integrálva
- **Költségoptimalizálás**: Útmutató költséghatékony telepítésekhez és erőforrás-kezeléshez

#### Dokumentáció minősége
- **Részletes kódpéldák**: Gyakorlati, tesztelt kódminták
- **Lépésről lépésre utasítások**: Világos, cselekvésre ösztönző útmutatók
- **Átfogó hibaelhárítás**: Gyakori problémák megoldása
- **Legjobb gyakorlatok integrációja**: Iparági szabványok és ajánlások
- **Verziókompatibilitás**: Naprakész az Azure legújabb szolgáltatásaival és az azd funkcióival

## Tervezett jövőbeli fejlesztések

### Verzió 3.1.0 (Tervezett)
#### AI platform bővítése
- **Többmodell támogatás**: Integrációs minták Hugging Face, Azure Machine Learning és egyedi modellek számára
- **AI ügynök keretrendszerek**: Sablonok LangChain, Semantic Kernel és AutoGen telepítésekhez
- **Fejlett RAG minták**: Vektordatabase opciók az Azure AI Search-en túl (Pinecone, Weaviate stb.)
- **AI megfigyelhetőség**: Fejlett monitorozás a modell teljesítményéhez, tokenhasználathoz és válaszminőséghez

#### Fejlesztői élmény
- **VS Code bővítmény**: Integrált AZD + AI Foundry fejlesztési élmény
- **GitHub Copilot integráció**: AI által támogatott AZD sablongenerálás
- **Interaktív oktatóanyagok**: Gyakorlati kódolási gyakorlatok automatikus validációval AI forgatókönyvekhez
- **Videós tartalom**: Kiegészítő videós oktatóanyagok vizuális tanulók számára, AI telepítésekre fókuszálva

### Verzió 4.0.0 (Tervezett)
#### Vállalati AI minták
- **Irányítási keretrendszer**: AI modellek irányítása, megfelelőség és audit nyomvonalak
- **Több bérlős AI**: Minták több ügyfél kiszolgálására izolált AI szolgáltatásokkal
- **Edge AI telepítés**: Integráció az Azure IoT Edge és konténeres példányokkal
- **Hibrid felhő AI**: Többfelhős és hibrid telepítési minták AI munkaterhelésekhez

#### Fejlett funkciók
- **AI pipeline automatizálás**: MLOps integráció az Azure Machine Learning pipeline-okkal
- **Fejlett biztonság**: Zero-trust minták, privát végpontok és fejlett fenyegetésvédelem
- **Teljesítményoptimalizálás**: Fejlett hangolási és skálázási stratégiák nagy áteresztőképességű AI alkalmazásokhoz
- **Globális elosztás**: Tartalomkézbesítési és edge caching minták AI alkalmazásokhoz

### Verzió 3.0.0 (Tervezett) - Felülírva az aktuális kiadással
#### Javasolt kiegészítések - Most megvalósítva a v3.0.0-ban
- ✅ **AI-központú tartalom**: Átfogó Azure AI Foundry integráció (Befejezve)
- ✅ **Interaktív oktatóanyagok**: Gyakorlati AI workshop labor (Befejezve)
- ✅ **Fejlett biztonsági modul**: AI-specifikus biztonsági minták (Befejezve)
- ✅ **Teljesítményoptimalizálás**: AI munkaterhelés hangolási stratégiák (Befejezve)

### Verzió 2.1.0 (Tervezett) - Részben megvalósítva a v3.0.0-ban
#### Kisebb fejlesztések - Néhány befejezve az aktuális kiadásban
- ✅ **További példák**: AI-központú telepítési forgatókönyvek (Befejezve)
- ✅ **Kibővített GYIK**: AI-specifikus kérdések és hibaelhárítás (Befejezve)
- **Eszközintegráció**: Fejlettebb IDE és szerkesztő integrációs útmutatók
- ✅ **Monitorozás bővítése**: AI-specifikus monitorozási és riasztási minták (Befejezve)

#### Még tervezett jövőbeli kiadásra
- **Mobilbarát dokumentáció**: Reszponzív dizájn mobil tanuláshoz
- **Offline hozzáférés**: Letölthető dokumentációs csomagok
- **Fejlett IDE integráció**: VS Code bővítmény AZD + AI munkafolyamatokhoz
- **Közösségi irányítópult**: Valós idejű közösségi metrikák és hozzájárulás nyomon követése

## Hozzájárulás a változásnaplóhoz

### Változások jelentése
Amikor hozzájárul ehhez a tárolóhoz, kérjük, győződjön meg róla, hogy a változásnapló bejegyzései tartalmazzák:

1. **Verziószám**: Szemantikus verziózás szerint (major.minor.patch)
2. **Dátum**: Kiadás vagy frissítés dátuma YYYY-MM-DD formátumban
3. **Kategória**: Hozzáadva, Módosítva, Elavult, Eltávolítva, Javítva, Biztonság
4. **Világos leírás**: Tömör leírás a változásról
5. **Hatásértékelés**: Hogyan érinti a változás a meglévő felhasználókat

### Változás kategóriák

#### Hozzáadva
- Új funkciók, dokumentációs szakaszok vagy képességek
- Új példák, sablonok vagy tanulási források
- További eszközök, szkriptek vagy segédprogramok

#### Módosítva
- A meglévő funkciók vagy dokumentáció módosítása
- Frissítések a tisztaság vagy pontosság javítása érdekében
- Tartalom vagy szervezet átalakítása

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

### Szemantikus verziózás irányelvei

#### Fő verzió (X.0.0)
- Felhasználói beavatkozást igénylő változások
- Jelentős tartalmi vagy szervezeti átalakítás
- Az alapvető megközelítés vagy módszertan megváltoztatása

#### Kisebb verzió (X.Y.0)
- Új funkciók vagy tartalmi kiegészítések
- Javítások, amelyek megőrzik a visszafelé kompatibilitást
- További példák, eszközök vagy források

#### Javító verzió (X.Y.Z)
- Hibajavítások és korrekciók
- Kisebb fejlesztések a meglévő tartalomban
- Tisztázások és apró fejlesztések

## Közösségi visszajelzések és javaslatok

Aktívan ösztönözzük a közösségi visszajelzéseket, hogy javítsuk ezt a tanulási forrást:

### Hogyan adhat visszajelzést
- **GitHub Issues**: Problémák jelentése vagy fejlesztési javaslatok (AI-specifikus problémák is szívesen látottak)
- **Discord beszélgetések**: Ötletek megosztása és részvétel az Azure AI Foundry közösségben
- **Pull Requests**: Közvetlen javítások hozzájárulása a tartalomhoz, különösen AI sablonokhoz és útmutatókhoz
- **Azure AI Foundry Discord**: Részvétel az #Azure csatornán az AZD + AI beszélgetésekhez
- **Közösségi fórumok**: Részvétel az általános Azure fejlesztői beszélgetésekben

### Visszajelzési kategóriák
- **AI tartalom pontossága**: Javítások az AI szolgáltatások integrációjával és telepítésével kapcsolatos információkhoz
- **Tanulási élmény**: Javaslatok az AI fejlesztői tanulási folyamat javítására
- **Hiányzó AI tartalom**: Kérések további AI sablonok, minták vagy példák hozzáadására
- **Hozzáférhetőség**: Fejlesztések a különböző tanulási igényekhez
- **AI eszköz integráció**: Javaslatok a jobb AI fejlesztési munkafolyamat integrációhoz
- **Termelési AI minták**: Vállalati AI telepítési minták iránti igények

### Válaszadási kötelezettségvállalás
- **Problémákra adott válasz**: 48 órán belül a jelentett problémákra
- **Funkciókérések**: Értékelés egy héten belül
- **Közösségi hozzájárulások**: Áttekintés egy héten belül
- **Biztonsági problémák**: Azonnali prioritás gyorsított válasszal

## Karbantartási ütemterv

### Rendszeres frissítések
- **Havi ellenőrzések**: Tartalom pontossága és hivatkozások validációja
- **Negyedéves frissítések**: Jelentős tartalmi kiegészítések és fejlesztések
- **Féléves ellenőrzések**: Átfogó átalakítás és fejlesztés
- **Éves kiadások**: Jelentős verziófrissítések jelentős fejlesztésekkel

### Monitorozás és minőségbiztosítás
- **Automatikus tesztelés**: Rendszeres kódpéldák és hivatkozások validációja
- **Közösségi visszajelzések integrációja**: Felhasználói javaslatok rendszeres beépítése
- **Technológiai frissítések**: Igazítás a legújabb Azure szolgáltatásokhoz és az azd kiadásokhoz
- **Hozzáférhetőségi auditok**: Rendszeres felülvizsgálat az inkluzív tervezési elvek szerint

## Verziótámogatási politika

### Aktuális verzió támogatása
- **Legújabb fő verzió**: Teljes támogatás rendszeres frissítésekkel
- **Előző fő verzió**: Biztonsági frissítések és kritikus javítások 12 hónapig
- **Régi verziók**: Csak közösségi támogatás, hivatalos frissítések nélkül

### Migrációs útmutató
Amikor új fő verziók jelennek meg, biztosítunk:
- **Migrációs útmutatók**: Lépésről lépésre történő átállási utasítások
- **Kompatibilitási megjegyzések**: Részletek a törött változásokról
- **Eszköztámogatás**: Szkriptek vagy segédprogramok az átállás segítésére
- **Közösségi támogatás**: Dedikált fórumok

---

**Felelősség kizárása**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.