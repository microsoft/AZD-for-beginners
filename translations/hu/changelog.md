# Változási napló - AZD Kezdőknek

## Bevezetés

Ez a változási napló dokumentálja az összes figyelemre méltó változást, frissítést és fejlesztést az AZD Kezdőknek adattárban. A szemantikus verziózás elveit követjük, és ezt a naplót vezetjük, hogy segítsük a felhasználókat megérteni, mi változott a verziók között.

## Tanulási célok

A változási napló átnézése során Ön:
- Tájékozott marad az új funkciókról és tartalmi bővítésekről
- Megérti a meglévő dokumentációban történt fejlesztéseket
- Nyomon követi a hibajavításokat és korrekciókat a pontosság biztosítása érdekében
- Követi a tananyagtartalmak fejlődését az idő múlásával

## Tanulási eredmények

A változási napló bejegyzéseinek átnézése után képes lesz:
- Azonosítani az új tananyagot és elérhető forrásokat
- Megérteni, hogy mely részek frissültek vagy javultak
- Megtervezni tanulási útvonalát a legfrissebb anyagok alapján
- Visszajelzést adni és javaslatokat tenni a jövőbeli fejlesztésekhez

## Verziótörténet

### [v3.17.0] - 2026-02-05

#### Tanfolyam navigáció fejlesztése
**Ez a verzió továbbfejleszti a README.md fejezetszintű navigációját egy kibővített táblázatos formával.**

#### Megváltozott
- **Tanfolyamtérkép táblázat**: Közvetlen leckelinkel, időtartam becslésekkel és összetettségi értékeléssel bővítve
- **Mappatisztítás**: Eltávolítva a fölösleges régi mappák (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkellenőrzés**: A tanfolyamtérkép táblázat 21+ belső linkje ellenőrizve

### [v3.16.0] - 2026-02-05

#### Terméknév frissítések
**Ez a verzió frissíti a termék hivatkozásokat a jelenlegi Microsoft márkázásnak megfelelően.**

#### Megváltozott
- **Azure AI Foundry → Microsoft Foundry**: Minden hivatkozás frissítve a nem fordítandó fájlokban
- **Azure AI Agent Service → Foundry Agents**: Szolgáltatás neve frissítve az aktuális márka szerint

#### Frissített fájlok
- `README.md` - Fő tanfolyam kezdőoldal
- `changelog.md` - Verziótörténet
- `course-outline.md` - Tanfolyam szerkezete
- `docs/chapter-02-ai-development/agents.md` - AI agent útmutató
- `examples/README.md` - Példák dokumentációja
- `workshop/README.md` - Workshop kezdőoldal
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - Minden workshop utasítás fájl

---

### [v3.15.0] - 2026-02-05

#### Jelentős adattárrendezés: fejezetalapú mappanevek
**Ez a verzió a dokumentációt dedikált fejezetszám szerinti mappákba szervezi át, hogy átláthatóbb legyen a navigáció.**

#### Mappanevek módosítása
A régi mappák helyett számozott fejezetmappák kerültek bevezetésre:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Új mappa hozzáadva: `docs/chapter-05-multi-agent/`

#### Fájlt áthelyezések
| Fájl | Eredeti | Új hely |
|------|---------|---------|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| Minden pre-deployment fájl | pre-deployment/ | chapter-06-pre-deployment/ |
| Minden troubleshooting fájl | troubleshooting/ | chapter-07-troubleshooting/ |

#### Hozzáadva
- **📚 Fejezeti README fájlok**: Minden fejezetmappában létrehozva README.md a következőkkel:
  - Tanulási célok és időtartam
  - Lecke tábla leírásokkal
  - Gyorsindítás parancsok
  - Navigáció más fejezetekhez

#### Megváltozott
- **🔗 Minden belső link frissítve**: Több mint 78 útvonal módosítva az összes dokumentumban
- **🗺️ Fő README.md**: Tanfolyamtérkép frissítve az új fejezetszerkezettel
- **📝 examples/README.md**: Kereszthivatkozások frissítve a fejezetmappákra

#### Eltávolítva
- Régi mappastruktúra (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Adattárrendezés: fejezetszintű navigáció
**Ez a verzió fejezetszintű navigációs README fájlokat adott hozzá (aztán a v3.15.0 felülírta).**

---

### [v3.13.0] - 2026-02-05

#### Új AI agent útmutató
**Ez a verzió átfogó útmutatót ad az AI agentek Azure Developer CLI-vel történő telepítéséhez.**

#### Hozzáadva
- **🤖 docs/microsoft-foundry/agents.md**: Teljes útmutató a következő témákkal:
  - Mi az AI agent és miben különbözik a chatbotoktól
  - Három gyorsindító agent sablon (Foundry Agents, Prompty, RAG)
  - Agent architektúra minták (egyagent, RAG, többagent)
  - Eszköz konfiguráció és testreszabás
  - Felügyelet és metrikák követése
  - Költségszempontok és optimalizáció
  - Gyakori hibakeresési esetek
  - Három gyakorlati gyakorlat sikerességi kritériummal

#### Tartalomszerkezet
- **Bevezető**: Agent fogalmak kezdőknek
- **Gyorsindítás**: Agentek telepítése `azd init --template get-started-with-ai-agents` paranccsal
- **Architektúra minták**: Vizualizált diagramok agent mintákról
- **Konfiguráció**: Eszköz beállítások és környezeti változók
- **Felügyelet**: Application Insights integráció
- **Gyakorlatok**: Fokozatos gyakorlati tanulás (20-45 perc mindegyik)

---

### [v3.12.0] - 2026-02-05

#### DevContainer környezet frissítés
**Ez a verzió frissíti a fejlesztői konténer konfigurációját modern eszközökkel és jobb alapbeállításokkal az AZD tanulási élményhez.**

#### Megváltozott
- **🐳 Alapkép**: Frissítve `python:3.12-bullseye` helyett `python:3.12-bookworm` (legfrissebb stabil Debian)
- **📛 Konténer név**: Átnevezve "Python 3"-ról "AZD for Beginners"-re az áttekinthetőség kedvéért

#### Hozzáadva
- **🔧 Új Dev Container funkciók**:
  - `azure-cli` Bicep támogatással engedélyezve
  - `node:20` (LTS verzió AZD sablonokhoz)
  - `github-cli` sablonkezeléshez
  - `docker-in-docker` konténeralkalmazás deploy-hoz

- **🔌 Port továbbítások**: Előre beállított portok tipikus fejlesztéshez:
  - 8000 (MkDocs előnézet)
  - 3000 (Webalkalmazások)
  - 5000 (Python Flask)
  - 8080 (API-k)

- **🧩 Új VS Code bővítmények**:
  - `ms-python.vscode-pylance` - Fejlett Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions támogatás
  - `ms-azuretools.vscode-docker` - Docker támogatás
  - `ms-azuretools.vscode-bicep` - Bicep nyelvi támogatás
  - `ms-azure-devtools.azure-resource-groups` - Azure erőforrás kezelő
  - `yzhang.markdown-all-in-one` - Markdown szerkesztés
  - `DavidAnson.vscode-markdownlint` - Markdown lintelés
  - `bierner.markdown-mermaid` - Mermaid diagram támogatás
  - `redhat.vscode-yaml` - YAML támogatás (az azure.yaml-hoz)
  - `eamodio.gitlens` - Git vizualizáció
  - `mhutchie.git-graph` - Git előzmények

- **⚙️ VS Code beállítások**: Alapértelmezett beállítások hozzáadva Python értelmezőhöz, mentéskor formázáshoz, szóközök eltávolításához

- **📦 requirements-dev.txt frissítve**:
  - MkDocs minify plugin hozzáadva
  - pre-commit kódminőség ellenőrző hozzáadva
  - Azure SDK csomagok hozzáadva (azure-identity, azure-mgmt-resource)

#### Javítva
- **Post-Create parancs**: Most ellenőrzi az AZD és Azure CLI telepítését a konténer indításakor

---

### [v3.11.0] - 2026-02-05

#### Kezdőknek szóló README átdolgozás
**Ez a verzió jelentősen javítja a README.md-t, hogy kezdők számára is érthető legyen, valamint alapvető erőforrásokat ad AI fejlesztőknek.**

#### Hozzáadva
- **🆚 Azure CLI vs AZD összehasonlítás**: Egyértelmű magyarázat mikor melyik eszközt használjuk, gyakorlati példákkal
- **🌟 Kiváló AZD linkek**: Közösségi sablongaléria és hozzájárulási források közvetlen linkjei:
  - [Awesome AZD Galéria](https://azure.github.io/awesome-azd/) - Több mint 200 azonnal telepíthető sablon
  - [Sablon beküldése](https://github.com/Azure/awesome-azd/issues) - Közösségi hozzájárulás
- **🎯 Gyors indítási útmutató**: Egyszerűsített 3 lépéses kezdő szakasz (Telepítés → Bejelentkezés → Telepítés)
- **📊 Tapasztalatalapú navigációs tábla**: Világos iránymutatás, hogy hol kezdjen az adott fejlesztői tapasztalat alapján

#### Megváltozott
- **README struktúra**: Lépésenként feltáruló információs elrendezés - az alapvető infó az elején
- **Bevezető szakasz**: Újratervezve, hogy elmagyarázza a „`azd up` varázsát” teljesen kezdőknek
- **Duplikált tartalom eltávolítása**: Elhárítva a kétszeres hibakeresési rész
- **Hibakeresési parancsok javítása**: `azd logs` helyett érvényes `azd monitor --logs` használata

#### Javítva
- **🔐 Hitelesítési parancsok**: Hozzáadva `azd auth login` és `azd auth logout` a cheat-sheet.md-hez
- **Érvénytelen parancs hivatkozások**: Eltávolítva a maradék `azd logs` a README hibakeresési részéből

#### Megjegyzések
- **Hatókör**: Változások a fő README.md-ben és a resources/cheat-sheet.md-ben
- **Célközönség**: Speciálisan AZD-t kezdő fejlesztőknek szánt fejlesztések

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI parancs pontosság frissítés
**Ez a verzió javítja az összes nem létező AZD parancsot a dokumentációban, biztosítva, hogy minden kódpélda érvényes Azure Developer CLI szintaxist használ.**

#### Javítva
- **🔧 Nem létező AZD parancsok eltávolítása**: Átfogó audit és helyesbítés:
  - `azd logs` (nem létezik) → helyettesítve `azd monitor --logs` vagy Azure CLI alternatívákkal
  - `azd service` alparancsok (nem léteznek) → helyettesítve `azd show` és Azure CLI-vel
  - `azd infra import/export/validate` (nem létezik) → eltávolítva vagy érvényes alternatívára cserélve
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` kapcsolók (nem léteznek) → eltávolítva
  - `azd provision --what-if/--rollback` kapcsolók (nem léteznek) → `--preview` használatára módosítva
  - `azd config validate` (nem létezik) → helyettesítve `azd config list`-tel
  - `azd info`, `azd history`, `azd metrics` (nem léteznek) → eltávolítva

- **📚 Parancs javításokkal frissített fájlok**:
  - `resources/cheat-sheet.md`: Parancsreferencia teljes áttekintése
  - `docs/deployment/deployment-guide.md`: Visszavonás és telepítési stratégiák javítása
  - `docs/troubleshooting/debugging.md`: Naplóelemzés szakasz javítása
  - `docs/troubleshooting/common-issues.md`: Hibakeresési parancsok frissítése
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD hibakeresési rész javítása
  - `docs/getting-started/azd-basics.md`: Felügyeleti parancsok javítása
  - `docs/getting-started/first-project.md`: Felügyeleti és hibakeresési példák frissítése
  - `docs/getting-started/installation.md`: Segítség és verzió példák javítása
  - `docs/pre-deployment/application-insights.md`: Naplómegtekintési parancsok javítása
  - `docs/pre-deployment/coordination-patterns.md`: Agent hibakeresési parancsok javítása

- **📝 Verzió hivatkozás frissítés**:
  - `docs/getting-started/installation.md`: A keménykódolt `1.5.0` verzió általános `1.x.x`-re cserélve a kiadások linkjével

#### Megváltozott
- **Rollback stratégiák**: Dokumentáció frissítve Git alapú visszavonásra (AZD nincs beépített rollback funkciója)
- **Napló megtekintés**: `azd logs` hivatkozások helyett `azd monitor --logs`, `azd monitor --live` és Azure CLI parancsok
- **Teljesítmény szakasz**: Nem létező párhuzamos/incrementális telepítési kapcsolók eltávolítva, érvényes alternatívákat sorol fel

#### Műszaki részletek
- **Érvényes AZD parancsok**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Érvényes azd monitor Kapcsolók**: `--live`, `--logs`, `--overview`
- **Eltávolított funkciók**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Megjegyzések
- **Ellenőrzés**: Parancsok az Azure Developer CLI v1.23.x ellenőrizve

---

### [v3.9.0] - 2026-02-05

#### Workshop befejezése és dokumentáció minőségének frissítése
**Ez a verzió befejezi az interaktív workshop modulokat, kijavítja az összes törött dokumentációs linket, és javítja az AI fejlesztők számára a Microsoft AZD használatával kapcsolatos tartalom általános minőségét.**

#### Hozzáadva
- **📝 CONTRIBUTING.md**: Új hozzájárulási irányelvek dokumentuma:
  - Világos utasítások hibajelentéshez és változtatási javaslatokhoz
  - Dokumentációs szabványok új tartalomhoz
  - Kódpélda útmutatók és commit üzenet konvenciók
  - Közösségi részvétel információi

#### Befejezve
- **🎯 Workshop Modul 7 (Lezárás)**: Teljesen befejezett lezáró modul:
  - Átfogó összefoglaló a workshop eredményeiről
  - Alapvető fogalmak elsajátítása AZD, sablonok és AI Foundry témákban
  - Tanulási út folytatására vonatkozó ajánlások
  - Workshop kihívás gyakorlatok nehézségi szintekkel
  - Közösségi visszajelzés és támogatási linkek

- **📚 Workshop Modul 3 (Szétszedés)**: Frissített tanulási célok:
  - GitHub Copilot MCP szerverekkel való aktiválása
  - AZD sablon mappaszerkezet megértése
  - Infrastruktúra-kód (Bicep) szervezési minták
  - Gyakorlati labor utasítások

- **🔧 Workshop Modul 6 (Leszerelés)**: Befejezve:
  - Erőforrás takarítás és költségkezelési célok
  - `azd down` használata az infrastruktúra biztonságos leszereléséhez
  - Lágyan törölt kognitív szolgáltatások visszaállításának útmutatója
  - Bónusz felfedező feladatok GitHub Copilot és Azure Portal témákban

#### Javítva
- **🔗 Törött linkek javítása**: Több mint 15 belső dokumentációs link javítása:
  - `docs/ai-foundry/ai-model-deployment.md`: Elérési utak javítása a microsoft-foundry-integration.md-hez
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md és production-ai-practices.md útvonalak korrigálása
  - `docs/getting-started/first-project.md`: Nem létező cicd-integration.md lecserélése deployment-guide.md-re
  - `examples/retail-scenario.md`: GyIK és hibakeresési útmutató elérési utak javítása
  - `examples/container-app/microservices/README.md`: Tanfolyam kezdőlap és deployment guide helyes elérési utak
  - `resources/faq.md` és `resources/glossary.md`: AI fejezet hivatkozások frissítése
  - `course-outline.md`: Oktatói útmutató és AI workshop lab hivatkozások javítása

- **📅 Workshop státusz zászló**: „Under Construction” helyett aktív workshop státuszra frissítve, 2026 februári dátummal

- **🔗 Workshop navigáció**: Törött navigációs linkek javítása a workshop README.md-ben, amelyek nem létező lab-1-azd-basics mappára mutattak

#### Megváltoztatva
- **Workshop bemutató**: Az „építés alatt áll” figyelmeztetés eltávolítása, a workshop most már kész és használatra kész
- **Navigációs konzisztencia**: Biztosítva, hogy minden workshop modul megfelelő modulok közti navigációval rendelkezzen
- **Tanulási útmutató hivatkozások**: Fejezetek közti hivatkozások frissítése a helyes microsoft-foundry elérési utakra

#### Ellenőrizve
- ✅ Minden angol nyelvű markdown fájl érvényes belső linkekkel rendelkezik
- ✅ A 0-7 számú workshop modulok teljesek a tanulási célokkal együtt
- ✅ Fejezetek és modulok közti navigáció megfelelően működik
- ✅ A tartalom megfelel az AI fejlesztők igényeinek a Microsoft AZD használatával
- ✅ Kezdők számára is érthető nyelvezet és szerkezet
- ✅ A CONTRIBUTING.md egyértelmű útmutatást ad a közösségi hozzájárulók számára

#### Műszaki kivitelezés
- **Link ellenőrzés**: Automatikus PowerShell szkript az összes .md belső link felülvizsgálatára
- **Tartalom audit**: Kézi áttekintés a workshop teljessége és kezdőbarát jellege érdekében
- **Navigációs rendszer**: Egységes fejezet és modul navigációs minta alkalmazása

#### Megjegyzések
- **Hatókör**: Csak az angol dokumentációra vonatkozó módosítások
- **Fordítások**: Fordító mappák nem frissültek ebben a verzióban (automatikus szinkronizáció később várható)
- **Workshop időtartama**: Az egész workshop most 3-4 órányi gyakorlati tanulást kínál

---

### [v3.8.0] - 2025-11-19

#### Fejlett dokumentáció: Monitorozás, Biztonság és Több ügynökös minták
**Ez a verzió átfogó A-minősítésű leckéket ad hozzá az Application Insights integrációról, hitelesítési mintákról és több ügynökös koordinációs mintákról a gyártási telepítésekhez.**

#### Hozzáadva
- **📊 Application Insights integrációs lecke**: a `docs/pre-deployment/application-insights.md` fájlban:
  - AZD-orientált telepítés automatikus előkészítéssel
  - Teljes Bicep sablonok Application Insights + Log Analytics-hez
  - Működő Python alkalmazások egyedi telemetriával (1,200+ sor)
  - AI/LLM monitorozási minták (Azure OpenAI token / költségkövetés)
  - 6 Mermaid diagram (architektúra, elosztott trace, telemetria folyamat)
  - 3 gyakorlati feladat (riasztások, műszerfalak, AI monitorozás)
  - Kusto lekérdezési példák és költségoptimalizálás stratégiák
  - Élő mérőszám folyam streaming és valós idejű hibakeresés
  - 40-50 perc tanulási idő gyártási készen álló mintákkal

- **🔐 Hitelesítési és biztonsági minták lecke**: a `docs/getting-started/authsecurity.md` fájlban:
  - 3 hitelesítési minta (kapcsolati stringek, Key Vault, kezelt identitás)
  - Teljes Bicep infrastruktúra sablonok biztonságos telepítésekhez
  - Node.js alkalmazás kód Azure SDK integrációval
  - 3 teljes gyakorlati feladat (kezelt identitás engedélyezése, felhasználói azonosított identitás, Key Vault forgatás)
  - Biztonsági legjobb gyakorlatok és RBAC konfigurációk
  - Hibakeresési útmutató és költségelemzés
  - Gyártási készen álló jelszó nélküli hitelesítési minták

- **🤖 Több ügynökös koordinációs minták lecke**: a `docs/pre-deployment/coordination-patterns.md` fájlban:
  - 5 koordinációs minta (szekvenciális, párhuzamos, hierarchikus, eseményvezérelt, konszenzus)
  - Teljes orchestrator szolgáltatás implementáció (Python/Flask, 1,500+ sor)
  - 3 szakosodott ügynök implementáció (Kutató, Író, Szerkesztő)
  - Service Bus integráció üzenetküldéshez
  - Cosmos DB állapotkezelés elosztott rendszerekhez
  - 6 Mermaid diagram az ügynök interakciókról
  - 3 haladó gyakorlat (időkorlát kezelés, újrapróbálkozás, áramkör-megszakító)
  - Költség bontás (240-565 $/hónap) optimalizációs stratégiákkal
  - Application Insights integráció monitorozáshoz

#### Bővítve
- **Előtelepítési fejezet**: Most átfogó monitorozási és koordinációs mintákat tartalmaz
- **Bevezető fejezet**: Professzionális hitelesítési mintákkal bővült
- **Gyártási készenlét**: Teljes körű lefedettség biztonságtól megfigyelhetőségig
- **Tanfolyam vázlat**: Új leckékre hivatkozás a 3. és 6. fejezetben

#### Megváltoztatva
- **Tanulási folyamat**: Jobb integráció a biztonság és monitorozás területén a kurzus alatt
- **Dokumentáció minősége**: Egységes A-minőség (95-97%) az új leckékben
- **Gyártási minták**: Teljes körű végponttól végpontig lefedettség vállalati telepítésekhez

#### Javítva
- **Fejlesztői élmény**: Világos út a fejlesztéstől a gyártási monitorozásig
- **Biztonsági szabványok**: Professzionális minták hitelesítéshez és titkok kezeléséhez
- **Megfigyelhetőség**: Teljes Application Insights integráció AZD-vel
- **AI munkaterhelések**: Speciális monitorozás Azure OpenAI és több ügynökös rendszerekhez

#### Ellenőrizve
- ✅ Minden lecke teljes, működő kódot tartalmaz (nem csak részleteket)
- ✅ Mermaid diagramok a vizuális tanuláshoz (összesen 19 az 3 leckében)
- ✅ Gyakorlati feladatok ellenőrzési lépésekkel (összesen 9)
- ✅ Gyártási készen álló Bicep sablonok `azd up` által telepíthetők
- ✅ Költségelemzés és optimalizációs stratégiák
- ✅ Hibakeresési útmutatók és legjobb gyakorlatok
- ✅ Tudásellenőrzési pontok és megerősítő parancsok

#### Dokumentációs értékelés eredmények
- **docs/pre-deployment/application-insights.md**: Átfogó monitorozási útmutató
- **docs/getting-started/authsecurity.md**: Professzionális biztonsági minták
- **docs/pre-deployment/coordination-patterns.md**: Haladó több ügynökös architektúrák
- **Összesen Új Tartalom**: Állandó magas minőségi színvonal

#### Műszaki kivitelezés
- **Application Insights**: Log Analytics + egyedi telemetria + elosztott trace
- **Hitelesítés**: Kezelt identitás + Key Vault + RBAC minták
- **Több ügynök**: Service Bus + Cosmos DB + Konténer appok + orchestráció
- **Monitorozás**: Élő mérőszámok + Kusto lekérdezések + riasztások + műszerfalak
- **Költségkezelés**: Mintavételi stratégiák, megtartási szabályok, költségkeret ellenőrzések

### [v3.7.0] - 2025-11-19

#### Dokumentáció minőségjavítások és új Azure OpenAI példa
**Ez a verzió javítja a dokumentáció minőségét egész tárolón belül, továbbá hozzáad egy teljes Azure OpenAI telepítési példát GPT-4 chat felülettel.**

#### Hozzáadva
- **🤖 Azure OpenAI Chat példa**: Teljes GPT-4 telepítés működő megvalósítással az `examples/azure-openai-chat/` mappában:
  - Teljes Azure OpenAI infrastruktúra (GPT-4 modell telepítés)
  - Python parancssori chat felület beszélgetési előzményekkel
  - Key Vault integráció biztonságos API kulcs tároláshoz
  - Tokenhasználat követése és költségbecslés
  - Rate limit és hiba kezelés
  - Átfogó README 35-45 perces telepítési útmutatóval
  - 11 gyártásra kész fájl (Bicep sablonok, Python app, konfiguráció)
- **📚 Dokumentációs gyakorlatok**: Gyakorlati elemek hozzáadva a konfigurációs útmutatóhoz:
  - 1. gyakorlat: Több környezet konfiguráció (15 perc)
  - 2. gyakorlat: Titokkezelési gyakorlat (10 perc)
  - Világos sikerfeltételek és ellenőrzési lépések
- **✅ Telepítés ellenőrzés**: Ellenőrző szakasz a telepítési útmutatóban:
  - Egészségellenőrzési eljárások
  - Sikerfeltételek listája
  - Várt kimenetek minden telepítési parancshoz
  - Gyors hibakeresési referencia

#### Bővítve
- **examples/README.md**: Átadva A-minőségre (93%):
  - azure-openai-chat hozzáadása minden releváns szakaszban
  - Helyi példák számának frissítése 3-ról 4-re
  - AI Alkalmazás példák táblázatához hozzáadva
  - Beillesztve középhaladó felhasználók Gyors Indulásába
  - Microsoft Foundry sablonok közé felvéve
  - Frissítve az Összehasonlító Mátrix és technológiai hivatkozások

- **Dokumentáció minőség**: B+ (87%) → A- (92%) javítás az egész docs mappán belül:
  - Kritikus parancspéldák várt kimenet hozzáadása
  - Konfigurációs változtatások ellenőrzési lépései
  - Gyakorlati tanulást segítő gyakorlatok bővítése

#### Megváltoztatva
- **Tanulási előrehaladás**: Jobb AI példák integrációja középhaladó tanulók számára
- **Dokumentáció szerkezet**: Több cselekvésre ösztönző gyakorlat világos eredményekkel
- **Ellenőrzési folyamat**: Kiemelt sikerfeltételek a kulcsfontosságú munkafolyamatokban

#### Javítva
- **Fejlesztői élmény**: Azure OpenAI telepítés most 35-45 percig tart (vs 60-90 perc komplex alternatívák)
- **Költségátláthatóság**: Egyértelmű költségbecslések ($50-200/hónap) az Azure OpenAI példához
- **Tanulási út**: AI fejlesztők számára világos belépési pont az azure-openai-chat révén
- **Dokumentációs szabványok**: Egyöntetű várt kimenetek és ellenőrzési lépések

#### Ellenőrizve
- ✅ Azure OpenAI példa teljesen működőképes `azd up` segítségével
- ✅ Minden 11 implementációs fájl szintaxisa helyes
- ✅ README utasítások megfelelnek a tényleges telepítési élménynek
- ✅ Dokumentációs linkek 8+ helyen frissítve
- ✅ Példák indexe pontosan tükrözi a 4 helyi példát
- ✅ Nincs duplikált külső link a táblázatokban
- ✅ Minden navigációs hivatkozás helyes

#### Műszaki kivitelezés
- **Azure OpenAI architektúra**: GPT-4 + Key Vault + Konténer app mintázat
- **Biztonság**: Kezelt identitás készen áll, titkok Key Vault-ban
- **Monitorozás**: Application Insights integráció
- **Költségmenedzsment**: Token követés és használat optimalizálás
- **Telepítés**: Egyszerű `azd up` parancs a teljes beállításhoz

### [v3.6.0] - 2025-11-19

#### Nagyszabású frissítés: Konténer alkalmazás telepítési példák
**Ez a verzió átfogó, gyártásra kész konténer alkalmazás telepítési példákat vezet be az Azure Developer CLI (AZD) használatával, teljes dokumentációval és integrálva a tanulási útra.**

#### Hozzáadva
- **🚀 Konténer alkalmazás példák**: Új helyi példák az `examples/container-app/` mappában:
  - [Mester útmutató](examples/container-app/README.md): Teljes áttekintés a konténeres telepítésekről, gyors kezdés, gyártás, és haladó minták
  - [Egyszerű Flask API](../../examples/container-app/simple-flask-api): Kezdőknek szánt REST API, skálázás nullára, egészségellenőrzések, monitorozás, hibakeresés
  - [Microservices architektúra](../../examples/container-app/microservices): Gyártásra kész több szolgáltatás telepítés (API Gateway, Product, Order, User, Notification), aszinkron üzenetküldés, Service Bus, Cosmos DB, Azure SQL, elosztott követés, kék-zöld / kanári telepítés
- **Legjobb gyakorlatok**: Biztonság, monitorozás, költségoptimalizálás és CI/CD útmutatás konténerizált munkaterhelésekhez
- **Kódminták**: Teljes `azure.yaml`, Bicep sablonok, többszörös nyelvű szolgáltatás implementációk (Python, Node.js, C#, Go)
- **Tesztelés és hibakeresés**: Végponttól végpontig tesztesetek, monitorozási parancsok, hibakeresési útmutató

#### Megváltoztatva
- **README.md**: Frissítve, hogy az új konténer alkalmazás példákat kiemelje és azokhoz linkeket adjon a "Local Examples - Container Applications" alatt
- **examples/README.md**: Frissítve a konténer alkalmazás példák hangsúlyozásával, összehasonlító mátrix bejegyzések hozzáadásával és technológiai/architektúra hivatkozások frissítésével
- **Tanfolyam vázlata és tanulmányi útmutató**: Frissítve az új konténer alkalmazás példákra és telepítési mintákra vonatkozó hivatkozásokkal az érintett fejezetekben

#### Érvényesítve
- ✅ Minden új példa telepíthető `azd up` paranccsal, és követi a legjobb gyakorlatokat
- ✅ Dokumentációs kereszt-hivatkozások és navigáció frissítve
- ✅ A példák az alap szinttől a haladó szcenáriókig terjednek, beleértve a gyártásban használt mikroszolgáltatásokat is

#### Megjegyzések
- **Hatókör**: Csak angol nyelvű dokumentáció és példák
- **Következő lépések**: További haladó konténer minták és CI/CD automatizálás bővítése a jövőbeni kiadásokban

### [v3.5.0] - 2025-11-19

#### Termék újra márkázása: Microsoft Foundry
**Ez a verzió átfogó terméknév változtatást hajt végre az angol dokumentációban a "Microsoft Foundry" névre, tükrözve a Microsoft hivatalos arculatváltását.**

#### Módosítva
- **🔄 Termék név frissítés**: Teljes körű újra márkázás "Microsoft Foundry"-ra
  - Minden hivatkozás frissítve az angol dokumentáció `docs/` mappájában
  - Mappa átnevezve: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Fájl átnevezve: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Összesen 23 tartalom hivatkozás frissítve 7 dokumentum fájlban

- **📁 Mappaszerkezet változások**:
  - `docs/ai-foundry/` átnevezve `docs/microsoft-foundry/`-ra
  - Minden kereszt-hivatkozás frissítve az új mappastruktúrára
  - Navigációs linkek elfogadva az egész dokumentációban

- **📄 Fájl átnév fel**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Minden belső hivatkozás frissítve az új fájlnévre

#### Frissített fájlok
- **Fejezet dokumentációk** (7 fájl):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigációs link frissítve
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 terméknév hivatkozás frissítve
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Már Microsoft Foundry használatban (korábbi frissítésekből)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 hivatkozás frissítve (áttekintés, közösségi visszajelzés, dokumentáció)
  - `docs/getting-started/azd-basics.md` - 4 kereszt-hivatkozás frissítve
  - `docs/getting-started/first-project.md` - 2 fejezeti navigációs link frissítve
  - `docs/getting-started/installation.md` - 2 következő fejezet hivatkozás frissítve
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 hivatkozás frissítve (navigáció, Discord közösség)
  - `docs/troubleshooting/common-issues.md` - 1 navigációs link frissítve
  - `docs/troubleshooting/debugging.md` - 1 navigációs link frissítve

- **Tanfolyam szerkezet fájlok** (2 fájl):
  - `README.md` - 17 hivatkozás frissítve (tanfolyam áttekintés, fejezet címek, sablon szekció, közösségi betekintések)
  - `course-outline.md` - 14 hivatkozás frissítve (áttekintés, tanulási célok, fejezeti erőforrások)

#### Érvényesítve
- ✅ Nincs több "ai-foundry" mappa elérési útvonal hivatkozás angol doksiban
- ✅ Nincs több "Microsoft Foundry" terméknév hivatkozás angol doksiban
- ✅ Minden navigációs link működik az új mappaszerkezettel
- ✅ Fájl és mappa átnevezések sikeresen befejezve
- ✅ Kereszt-hivatkozások a fejezetek között érvényesítve

#### Megjegyzések
- **Hatókör**: Csak az angol dokumentáció `docs/` mappájában történt változtatás
- **Fordítások**: A fordító mappák (`translations/`) nincsenek frissítve ebben a verzióban
- **Workshop**: A workshop anyagok (`workshop/`) nem frissítettek ebben a verzióban
- **Példák**: A példa fájlokban előfordulhatnak még régi elnevezések (a jövőbeli frissítés tárgyai)
- **Külső hivatkozások**: Külső URL-ek és GitHub repo hivatkozások változatlanok

#### Migrációs útmutató közreműködőknek
Ha helyi ágai vagy dokumentációi a régi szerkezetet használják:
1. Frissítse a mappa hivatkozásokat: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Frissítse a fájl hivatkozásokat: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Cserélje a terméknevet: "Microsoft Foundry" → "Microsoft Foundry"
4. Ellenőrizze, hogy minden belső dokumentációs link működik

---

### [v3.4.0] - 2025-10-24

#### Infrastruktúra Előnézet és Érvényesítési Fejlesztések
**Ez a verzió bevezeti az Azure Developer CLI új előnézeti funkciójának átfogó támogatását és fejleszti a workshop felhasználói élményt.**

#### Hozzáadva
- **🧪 azd provision --preview funkció dokumentációja**: Az új infrastruktúra előnézeti képesség részletes ismertetése
  - Parancs referencia és használati példák a segédlapon
  - Részletes integráció az üzembe helyezési útmutatóban esettanulmányokkal és előnyökkel
  - Pre-flight ellenőrzés integrálva a biztonságosabb telepítés érdekében
  - Kezdő lépések útmutató frissítése az elsőbbséget élvező biztonságos telepítéssel
- **🚧 Workshop állapot szalag**: Professzionális HTML banner, amely jelzi a workshop fejlesztési állapotát
  - Gradiens dizájn kivitelezési jelzőkkel a felhasználók egyértelmű tájékoztatásához
  - Utolsó frissítés időbélyeggel az átláthatóság érdekében
  - Mobilra reszponzív kialakítás minden eszközre

#### Fejlesztve
- **Infrastruktúra biztonság**: Az előnézeti funkció végig integrálva a telepítési dokumentációban
- **Elő telepítési ellenőrzés**: Automatizált szkriptek már tartalmazzák az infrastruktúra előnézeti tesztelését
- **Fejlesztői munkafolyamat**: Frissített parancs szekvenciák az előnézet használatával mint legjobb gyakorlat
- **Workshop élmény**: Egyértelműen kommunikált fejlesztési státusz a felhasználók számára

#### Módosítva
- **Telepítési legjobb gyakorlatok**: Mostantól előnézeti első munkafolyamat ajánlott
- **Dokumentációs folyamat**: Az infrastruktúra érvényesítés korábbi helyre került a tanulási folyamatban
- **Workshop megjelenítés**: Professzionális státusz kommunikáció egyértelmű fejlesztési idővonallal

#### Javítva
- **Biztonság-első megközelítés**: Az infrastruktúra változások előzetesen ellenőrizhetők telepítés előtt
- **Csapatmunka támogatása**: Az előnézeti eredmények megoszthatók átnézés és jóváhagyás céljából
- **Költségtudatosság**: Jobb erőforrásköltség megértés az előkészítés előtt
- **Kockázatcsökkentés**: Csökken a telepítési hibák előre történő érvényesítéssel

#### Technikai megvalósítás
- **Több dokumentum integrációja**: Az előnézeti funkció 4 kulcsfájlban dokumentált
- **Parancs minták**: Konzekvens szintaxis és példák a teljes dokumentációban
- **Legjobb gyakorlat integráció**: Az előnézet beépítve az érvényesítési munkafolyamatokba és szkriptekbe
- **Vizualizációs jelzők**: Egyértelmű ÚJ funkció jelölések a felfedezhetőség érdekében

#### Workshop infrastruktúra
- **Állapot kommunikáció**: Professzionális HTML banner gradiens stílusban
- **Felhasználói élmény**: Meghatározott fejlesztési státusz megelőzi a félreértéseket
- **Professzionális bemutatás**: Megőrzi a repository hitelességét, miközben elvárásokat állít fel
- **Idővonal átláthatóság**: Október 2025 utolsó frissítés időbélyeg az elszámoltathatóságért

### [v3.3.0] - 2025-09-24

#### Fejlesztett workshop anyagok és interaktív tanulási élmény
**Ez a verzió átfogó workshop anyagokat vezet be böngésző-alapú interaktív útmutatókkal és strukturált tanulási útvonalakkal.**

#### Hozzáadva
- **🎥 Interaktív workshop útmutató**: Böngésző alapú workshop élmény MkDocs előnézeti lehetőséggel
- **📝 Strukturált workshop utasítások**: 7 lépéses tanulási útvonal az felfedezéstől a testreszabásig
  - 0-Bevezető: Workshop áttekintése és beállítás
  - 1-Sablon kiválasztása: Sablon felfedezés és választási folyamat
  - 2-Sablon ellenőrzése: Telepítés és érvényesítés
  - 3-Sablon lebontása: Architektúra megértése
  - 4-Sablon konfigurálása: Beállítás és testreszabás
  - 5-Sablon testreszabása: Haladó módosítások és iterációk
  - 6-Infrastruktúra lebontása: Takarítás és erőforrás menedzsment
  - 7-Összegzés: Áttekintés és következő lépések
- **🛠️ Workshop eszközök**: MkDocs konfiguráció Material témával az élmény fokozására
- **🎯 Gyakorlati tanulási útvonal**: 3 lépéses módszertan (Felfedezés → Telepítés → Testreszabás)
- **📱 GitHub Codespaces integráció**: Zökkenőmentes fejlesztői környezet beállítás

#### Fejlesztve
- **AI Workshop labor**: Kiterjesztve átfogó 2-3 órás strukturált tanulási élménnyel
- **Workshop dokumentáció**: Professzionális megjelenés navigációval és vizuális segédletekkel
- **Tanulási folyamat**: Egyértelmű lépésről lépésre vezetés a sablon kiválasztástól a gyártásra telepítésig
- **Fejlesztői élmény**: Integrált eszközök az egyszerűsített fejlesztési folyamatokhoz

#### Javítva
- **Elérhetőség**: Böngésző alapú felület kereséssel, másolási lehetőséggel és témaváltóval
- **Önálló tanulás**: Rugalmas workshop szerkezet, alkalmazkodva a különböző tanulási sebességekhez
- **Gyakorlati alkalmazás**: Valós AI sablon telepítési szcenáriók
- **Közösségi integráció**: Discord integráció workshop támogatás és együttműködés céljából

#### Workshop jellemzők
- **Beépített keresés**: Gyors kulcsszó- és leckefelderítés
- **Kódblokk másolás**: Egér fölé helyezve másolási lehetőség minden kód példánál
- **Téma váltó**: Sötét/fény mód támogatás különböző preferenciákhoz
- **Vizuális eszközök**: Képernyőfotók és diagramok a jobb megértéshez
- **Segítség integráció**: Közvetlen Discord hozzáférés közösségi támogatáshoz

### [v3.2.0] - 2025-09-17

#### Nagyszabású navigáció átalakítás és fejezet alapú tanulási rendszer
**Ez a verzió átfogó fejezet alapú tanulási struktúrát vezet be kiterjedt navigációval az egész repositoryban.**

#### Hozzáadva
- **📚 Fejezet alapú tanulási rendszer**: Teljes tanfolyam átszervezése 8 progresszív tanulási fejezetre
  - 1. fejezet: Alapok és gyors kezdés (⭐ - 30-45 perc)
  - 2. fejezet: AI-első fejlesztés (⭐⭐ - 1-2 óra)
  - 3. fejezet: Konfiguráció és hitelesítés (⭐⭐ - 45-60 perc)
  - 4. fejezet: Infrastructure as Code & Telepítés (⭐⭐⭐ - 1-1,5 óra)
  - 5. fejezet: Több-ügynökös AI megoldások (⭐⭐⭐⭐ - 2-3 óra)
  - 6. fejezet: Előzetes telepítési ellenőrzés és tervezés (⭐⭐ - 1 óra)
  - 7. fejezet: Hibakeresés és debug (⭐⭐ - 1-1,5 óra)
  - 8. fejezet: Gyártási és vállalati minták (⭐⭐⭐⭐ - 2-3 óra)
- **📚 Átfogó navigációs rendszer**: Egységes navigációs fejléc és lábléc az összes dokumentáción
- **🎯 Haladás nyomon követés**: Tanfolyam teljesítési ellenőrző lista és tanulási visszaigazolás
- **🗺️ Tanulási útmutató**: Egyértelmű belépési pontok különböző tapasztalati szintek és célok szerint
- **🔗 Kereszthivatkozás navigáció**: Kapcsolódó fejezetek és előfeltételek egyértelmű összekötése

#### Fejlesztve
- **README szerkezet**: Strukturált tanulási platformmá alakítva fejezet alapú szervezéssel
- **Dokumentációs navigáció**: Minden oldalon megjelenik a fejezeti kontextus és haladási útmutató
- **Sablonok rendszerezése**: Példák és sablonok a megfelelő tanulási fejezetekhez rendelve
- **Erőforrás integráció**: Segédanyagok, gyakori kérdések, tanulmányi útmutatók kapcsolva a releváns fejezetekhez
- **Workshop integráció**: Gyakorlati laborokat kötve több fejezeti tanulási célhoz

#### Módosítva
- **Tanulási folyamat átalakítása**: Lineáris dokumentációról rugalmas fejezet alapú tanulásra váltás
- **Konfiguráció elhelyezkedése**: Konfigurációs útmutató átkerült a 3. fejezetbe a jobb tanulási folyamat érdekében
- **AI tartalom integrációja**: AI-specifikus tartalmak jobb beépítése a tanulási út során
- **Gyártási tartalom**: Haladó minták összevonva a 8. fejezetben az üzleti felhasználók számára

#### Javítva
- **Felhasználói élmény**: Egyértelmű navigációs morzsák és fejezeti előrehaladási jelzések
- **Elérhetőség**: Konzisztens navigációs minták az egyszerűbb tanfolyam bejáráshoz
- **Professzionális megjelenés**: Egyetemi stílusú tanfolyam struktúra alkalmas oktatási és vállalati képzésre
- **Tanulási hatékonyság**: Rövidebb idő a releváns tartalom megtalálására jobb szervezéssel

#### Technikai megvalósítás
- **Navigációs fejlécek**: Szabványosított fejezeti navigáció 40+ dokumentációs fájlban
- **Lábléc navigáció**: Konzisztens haladási útmutatás és fejezeti teljesítési jelzések
- **Kereszt linkek**: Átfogó belső hivatkozási rendszer a kapcsolódó fogalmak összeköttetéséhez
- **Fejezeti térképezés**: Sablonok és példák egyértelmű társítása a tanulási célokkal

#### Tanulmányi útmutató fejlesztése
- **📚 Átfogó tanulási célok**: Tanulmányi útmutató átstrukturálva az 8 fejezet rendszeréhez igazítva
- **🎯 Fejezeti értékelések**: Minden fejezet tartalmaz konkrét tanulási célokat és gyakorlati feladatokat
- **📋 Haladás nyomon követés**: Heti tanulási ütemterv mérhető eredményekkel és teljesítési listákkal
- **❓ Értékelési kérdések**: Tudás ellenőrző kérdések minden fejezethez professzionális eredményekkel
- **🛠️ Gyakorlati feladatok**: Gyakorlati tevékenységek valós telepítési szcenáriókkal és hibakezeléssel
- **📊 Képesség fejlődés**: Egyértelmű haladás az alapfogalmaktól a vállalati mintákig karrierfejlesztési fókusz mellett
- **🎓 Tanúsítási keretrendszer**: Szakmai fejlődési eredmények és közösségi elismerés rendszere
- **⏱️ Időmenedzsment**: Strukturált 10 hetes tanulási terv mérföldkövek érvényesítésével

### [v3.1.0] - 2025-09-17

#### Fejlesztett több-ügynökös AI megoldások
**Ez a verzió javítja a több-ügynökös kiskereskedelmi megoldást jobb ügynök elnevezésekkel és fejlettebb dokumentációval.**

#### Módosítva
- **Több-ügynökös terminológia**: A "Cora ügynök" helyett "Vevő ügynök" lett mindenhol használva a könnyebb megértés érdekében
- **Ügynök architektúra**: Minden dokumentáció, ARM sablon és kód példa megtisztítva egységes "Vevő ügynök" névhasználatra
- **Konfigurációs példák**: Modernizált ügynök konfigurációs minták új elnevezési konvenciókkal
- **Dokumentáció konzisztencia**: Minden hivatkozás profi, leíró ügynök neveket használ

#### Fejlesztve
- **ARM sablon csomag**: Frissítve retail-multiagent-arm-template a Vevő ügynök hivatkozásokkal
- **Architektúra diagramok**: Frissített Mermaid diagramok új ügynök elnevezéssel
- **Kód példák**: Python osztályok és megvalósítási példák most már CustomerAgent névvel
- **Környezeti változók**: Frissítve minden telepítési szkript CUSTOMER_AGENT_NAME konvencióra

#### Javítva
- **Fejlesztői élmény**: Világosabb ügynök szerepek és felelősségek a dokumentációban  
- **Éles környezetre felkészültség**: Jobb összhang a vállalati névkonvenciókkal  
- **Tananyagok**: Intuitívabb ügynök elnevezések oktatási célokra  
- **Sablon használhatósága**: Egyszerűsített megértés az ügynök funkcióiról és telepítési mintáiról  

#### Műszaki részletek  
- Frissített Mermaid architektúra diagramok CustomerAgent hivatkozásokkal  
- CoraAgent osztálynevek cseréje CustomerAgent-re Python példákban  
- ARM sablon JSON konfigurációk módosítása "customer" ügynök típus használatára  
- Környezeti változók frissítése CORA_AGENT_* mintáról CUSTOMER_AGENT_* mintára  
- Minden telepítési parancs és konténer konfiguráció frissítése  

### [v3.0.0] - 2025-09-12  

#### Jelentős változások - AI fejlesztői fókusz és Microsoft Foundry integráció  
**Ez a verzió a tárolót átfogó, mesterséges intelligenciára fókuszáló tananyaggá alakítja Microsoft Foundry integrációval.**  

#### Hozzáadva  
- **🤖 AI-első tanulási útvonal**: Teljes átszervezés, amely prioritást ad az AI fejlesztőknek és mérnököknek  
- **Microsoft Foundry integrációs útmutató**: Átfogó dokumentáció AZD és Microsoft Foundry szolgáltatások összekapcsolásához  
- **AI modell telepítési minták**: Részletes útmutató modellválasztásról, konfigurációról és termelési telepítési stratégiákról  
- **AI Műhely labor**: 2-3 órás gyakorlati műhely az AI alkalmazások AZD-be telepíthető megoldásokká alakításához  
- **Production AI legjobb gyakorlatok**: Vállalati szintű minták AI skálázásához, monitorozásához és biztonságához  
- **AI-specifikus hibakeresési útmutató**: Átfogó hibaelhárítás Azure OpenAI, Kognitív szolgáltatások és AI telepítési problémákhoz  
- **AI sablongaléria**: Kiemelt Microsoft Foundry sablongyűjtemény komplexitás-besorolással  
- **Műhely anyagok**: Teljes műhely felépítés gyakorlati laborokkal és referenciákkal  

#### Fejlesztve  
- **README szerkezet**: AI fejlesztőkre fókuszálva, 45%-os közösségi érdeklődési adatokkal a Microsoft Foundry Discordból  
- **Tanulási utak**: Külön AI fejlesztői útvonal a hagyományos hallgatói és DevOps mérnök utak mellett  
- **Sablon ajánlások**: Kiemelt AI sablonok, beleértve azure-search-openai-demo, contoso-chat és openai-chat-app-quickstart  
- **Közösségi integráció**: Javított Discord közösségi támogatás AI-specifikus csatornákkal és beszélgetésekkel  

#### Biztonság és termelési fókusz  
- **Kezelt identitás minták**: AI-specifikus hitelesítési és biztonsági konfigurációk  
- **Költségoptimalizáció**: Token használat nyomon követése és költségvetési korlátok AI munkaterhelésekhez  
- **Több régiós telepítés**: Stratégiák globális AI alkalmazás telepítéshez  
- **Teljesítmény monitorozás**: AI-specifikus metrikák és Application Insights integráció  

#### Dokumentáció minőség  
- **Lineáris tanfolyam struktúra**: Logikus előrehaladás kezdőtől haladó AI telepítési mintákig  
- **Ellenőrzött URL-ek**: Minden külső tároló link érvényes és elérhető  
- **Teljes referencia**: Minden belső dokumentációs link validált és működő  
- **Éles használatra kész**: Vállalati telepítési minták valós példákkal  

### [v2.0.0] - 2025-09-09  

#### Jelentős változások - Tároló átszervezés és professzionális fejlesztés  
**Ez a verzió jelentős átalakítást hajtott végre a tároló szerkezetében és tartalom bemutatásában.**  

#### Hozzáadva  
- **Strukturált tanulási keretrendszer**: Minden dokumentációs oldal bevezető, tanulási célok és tanulási eredmények szekcióval  
- **Navigációs rendszer**: Előző/Következő lecke linkek hozzáadása a dokumentáció kísérteties tanulási előrehaladásához  
- **Tanulási segédlet**: Átfogó study-guide.md tanulási célokkal, gyakorlati feladatokkal és értékelő anyagokkal  
- **Professzionális megjelenés**: Minden emoji ikon eltávolítása a jobb hozzáférhetőség és professzionális megjelenés érdekében  
- **Fejlettebb tartalmi szerkezet**: Tananyagok jobb szervezése és áramlása  

#### Megváltoztatva  
- **Dokumentáció formátum**: Minden dokumentáció egységes, tanulásközpontú szerkezettel  
- **Navigációs áramlás**: Logikus előrehaladás megvalósítása a tananyagokon keresztül  
- **Tartalom bemutatás**: Díszítő elemek eltávolítása tiszta, professzionális formázásért  
- **Link struktúra**: Minden belső link frissítése az új navigációs rendszer támogatására  

#### Javítva  
- **Hozzáférhetőség**: Emoji függőségek eltávolítása jobb képernyőolvasó kompatibilitásért  
- **Professzionális megjelenés**: Tiszta, akadémiai stílusú prezentáció, vállalati tanuláshoz megfelelő  
- **Tanulási élmény**: Strukturált megközelítés világos célokkal és eredményekkel minden leckében  
- **Tartalom szervezése**: Jobb logikai kapcsolat és áramlás a kapcsolódó témák között  

### [v1.0.0] - 2025-09-09  

#### Kezdeti kiadás - Átfogó AZD tanulási tároló  

#### Hozzáadva  
- **Alap dokumentációs szerkezet**  
  - Teljes kezdő útmutató sorozat  
  - Átfogó telepítési és üzemeltetési dokumentáció  
  - Részletes hibakeresési források és hibakeresési útmutatók  
  - Előtelepítési ellenőrző eszközök és eljárások  

- **Kezdő modul**  
  - AZD alapok: Alapfogalmak és terminológia  
  - Telepítési útmutató: Platform specifikus beállítási útmutatók  
  - Konfigurációs útmutató: Környezet beállítása és hitelesítés  
  - Első projekt oktatóanyag: Lépésről lépésre gyakorlati tanulás  

- **Telepítési és üzemeltetési modul**  
  - Telepítési útmutató: Teljes munkafolyamat dokumentáció  
  - Üzemeltetési útmutató: Infrastructure as Code Bicep-pel  
  - Legjobb gyakorlatok termelési telepítéshez  
  - Több szolgáltatás architektúra minták  

- **Előtelepítési ellenőrzési modul**  
  - Kapacitástervezés: Azure erőforrás elérhetőség validálása  
  - SKU választás: Átfogó szolgáltatási szint útmutatás  
  - Előzetes ellenőrzések: Automatikus validációs szkriptek (PowerShell és Bash)  
  - Költségbecslő és költségvetési tervező eszközök  

- **Hibakeresési modul**  
  - Gyakori problémák: Gyorsták problémák és megoldások  
  - Hibakeresési útmutató: Rendszeres hibakeresési módszerek  
  - Haladó diagnosztikai technikák és eszközök  
  - Teljesítménymonitorozás és optimalizálás  

- **Források és hivatkozások**  
  - Parancs összefoglaló: Gyors hivatkozás alapvető parancsokra  
  - Gloszszárium: Átfogó fogalom- és rövidítésjegyzék  
  - GYIK: Gyakori kérdések részletes válaszokkal  
  - Külső forrás linkek és közösségi kapcsolatok  

- **Példák és sablonok**  
  - Egyszerű webalkalmazás példa  
  - Statikus weboldal telepítési sablon  
  - Konténer alkalmazás konfiguráció  
  - Adatbázis integrációs minták  
  - Mikroservices architektúra példák  
  - Serverless funkció implementációk  

#### Jellemzők  
- **Többplatformos támogatás**: Telepítési és konfigurációs útmutatók Windows, macOS és Linux rendszerekhez  
- **Több szakmai szint**: Tartalom diákoktól profi fejlesztőkig  
- **Gyakorlati fókusz**: Gyakorlati példák és valós életbeli szcenáriók  
- **Átfogó lefedettség**: Alapfogalmaktól a haladó vállalati mintákig  
- **Biztonság-központú megközelítés**: Biztonsági legjobb gyakorlatok beépítve  
- **Költségoptimalizáció**: Útmutatás költséghatékony telepítésekhez és erőforrás menedzsmenthez  

#### Dokumentáció minőség  
- **Részletes kódpéldák**: Gyakorlati, tesztelt kódrészletek  
- **Lépésről lépésre utasítások**: Egyértelmű, cselekvő útmutató  
- **Átfogó hibakezelés**: Gyakori problémák hibakeresése  
- **Legjobb gyakorlatok integrációja**: Iparági szabványok és ajánlások  
- **Verzió kompatibilitás**: Legfrissebb Azure szolgáltatásokkal és az azd verzióival harmonizálva  

## Tervezett jövőbeni fejlesztések  

### Verzió 3.1.0 (Tervezett)  
#### AI platform bővítés  
- **Több modell támogatás**: Integrációs minták Hugging Face, Azure Machine Learning és egyedi modellekhez  
- **AI ügynök keretrendszerek**: Sablonok LangChain, Semantic Kernel és AutoGen telepítésekhez  
- **Fejlett RAG minták**: Vektor adatbázis opciók az Azure AI Search mellett (Pinecone, Weaviate, stb.)  
- **AI megfigyelhetőség**: Javított monitorozás modell teljesítmény, token használat és válaszminőség tekintetében  

#### Fejlesztői élmény  
- **VS Code bővítmény**: Integrált AZD + AI Foundry fejlesztési élmény  
- **GitHub Copilot integráció**: AI által támogatott AZD sablon generálás  
- **Interaktív oktatóanyagok**: Gyakorlati kódolási feladatok automatikus validációval AI szcenáriókhoz  
- **Videós tartalmak**: Kiegészítő videós oktatóanyagok vizuális tanulók részére AI telepítések fókuszával  

### Verzió 4.0.0 (Tervezett)  
#### Vállalati AI minták  
- **Irányítási keretrendszer**: AI modellirányítás, megfelelés és auditálás  
- **Több bérlős AI**: Több ügyfél kiszolgálása elkülönített AI szolgáltatásokkal  
- **Edge AI telepítés**: Integráció Azure IoT Edge és konténer példányokkal  
- **Hibrid felhő AI**: Multi-cloud és hibrid telepítési minták AI munkaterhelésekhez  

#### Fejlettebb funkciók  
- **AI munkafolyamat automatizálás**: MLOps integráció Azure Machine Learning pipeline-okkal  
- **Fejlett biztonság**: Zero-trust minták, privát végpontok és haladó fenyegetésvédelem  
- **Teljesítmény optimalizáció**: Fejlett hangolás és skálázás nagy terhelésű AI alkalmazásokhoz  
- **Globális terjesztés**: Tartalomelosztó és edge caching minták AI alkalmazásokhoz  

### Verzió 3.0.0 (Tervezett) - Az aktuális kiadás által váltva fel  
#### Javasolt bővítések - Most megvalósítva a v3.0.0-ban  
- ✅ **AI-központú tartalom**: Átfogó Microsoft Foundry integráció (Kész)  
- ✅ **Interaktív oktatóanyagok**: Gyakorlati AI műhely labor (Kész)  
- ✅ **Fejlett biztonsági modul**: AI-specifikus biztonsági minták (Kész)  
- ✅ **Teljesítmény optimalizáció**: AI munkaterhelési hangolási stratégiák (Kész)  

### Verzió 2.1.0 (Tervezett) - Részben megvalósítva a v3.0.0-ban  
#### Apróbb fejlesztések - Néhány az aktuális kiadásban kész  
- ✅ **További példák**: AI-központú telepítési szcenáriók (Kész)  
- ✅ **Bővített GYIK**: AI-specifikus kérdések és hibakeresés (Kész)  
- **Eszköz integráció**: Fejlesztett IDE és szerkesztő integrációs útmutatók  
- ✅ **Monitorozás bővítés**: AI-specifikus monitorozási és riasztási minták (Kész)  

#### Még tervezett a jövőbeli kiadásokhoz  
- **Mobilbarát dokumentáció**: Reszponzív kialakítás mobil tanuláshoz  
- **Offline hozzáférés**: Letölthető dokumentációs csomagok  
- **Fejlesztett IDE integráció**: VS Code bővítmény AZD + AI munkafolyamatokhoz  
- **Közösségi irányítópult**: Valós idejű közösségi mérőszámok és hozzájárulás követése  

## Útmutató a változásnaplóhoz történő hozzájáruláshoz  

### Változások jelentése  
A tárolóhoz történő hozzájáruláskor kérem, hogy a változásnapló bejegyzései tartalmazzák:  

1. **Verziószám**: A sémás verziókövetés szerint (fő.kisebb.javítás)  
2. **Dátum**: Kiadás vagy frissítés dátuma ÉÉÉÉ-HH-NN formátumban  
3. **Kategória**: Hozzáadott, Megváltoztatott, Elavult, Eltávolított, Javított, Biztonsági  
4. **Világos leírás**: Rövid összefoglaló a változásról  
5. **Hatásértékelés**: Hogyan hatnak a változások meglévő felhasználókra  

### Változási kategóriák  

#### Hozzáadott  
- Új funkciók, dokumentációs részek vagy képességek  
- Új példák, sablonok vagy tananyagok  
- További eszközök, szkriptek vagy segédprogramok  

#### Megváltoztatott  
- Meglévő funkciók vagy dokumentáció módosítása  
- Frissítések a világosság vagy pontosság érdekében  
- Tartalom vagy szervezet átszervezése  

#### Elavult  
- Fázisban lévő funkciók vagy megközelítések  
- Eltávolításra kijelölt dokumentációs részek  
- Olyan módszerek, amelyekhez jobb alternatívák léteznek  

#### Eltávolított  
- Már nem releváns funkciók, dokumentumok vagy példák  
- Elavult információk vagy megközelítések  
- Felesleges vagy összevont tartalom  

#### Javított  
- Hibajavítások dokumentációban vagy kódban  
- Jelentett problémák vagy hibák megoldása  
- Pontosság vagy működés javítása  

#### Biztonság  
- Biztonsági fejlesztések vagy hibajavítások  
- Biztonsági legjobb gyakorlat frissítések  
- Biztonsági sebezhetőségek kezelése  

### Sémás verziókövetés irányelvek  

#### Fő verzió (X.0.0)  
- Visszafelé nem kompatibilis változások, melyek felhasználói beavatkozást igényelnek  
- Jelentős tartalmi vagy szervezeti átszervezés  
- Alapkoncepciót vagy módszertant módosító változások  

#### Kisebb verzió (X.Y.0)  
- Új funkciók vagy tartalom bővítések  
- Visszafelé kompatibilis fejlesztések  
- További példák, eszközök vagy források  

#### Javítási verzió (X.Y.Z)  
- Hibajavítások és korrekciók  
- Meglévő tartalom kisebb fejlesztései  
- Pontosítások és apróbb bővítések  

## Közösségi visszajelzés és javaslatok  

Aktívan ösztönözzük a közösségi visszajelzéseket a tanulási erőforrás javítása érdekében:  

### Hogyan adj visszajelzést  
- **GitHub Issues**: Problémák jelentése vagy fejlesztési javaslatok (AI-specifikus problémák szívesen)  
- **Discord beszélgetések**: Ötletek megosztása és részvétel a Microsoft Foundry közösségben  
- **Pull kérések**: Közvetlen fejlesztések beküldése, különösen AI sablonok és útmutatók esetén  
- **Microsoft Foundry Discord**: Részvétel az #Azure csatornán AZD + AI beszélgetésekhez  
- **Közösségi fórumok**: Szélesebb Azure fejlesztői beszélgetésekben való részvétel  

### Visszajelzés kategóriák  
- **AI tartalom pontossága**: AI szolgáltatás integráció és telepítés javítások  
- **Tanulási élmény**: Javaslatok az AI fejlesztői tanulási folyamat javítására  
- **Hiányzó AI tartalom**: További AI sablonok, minták vagy példák kérése  
- **Hozzáférhetőség**: Javítások különböző tanulási igényekhez  
- **AI eszköz integráció**: Jobb AI fejlesztési munkafolyamat integrációjának javaslatai  
- **Termelési AI minták**: Vállalati AI telepítési minta kérések  

### Válaszadási elkötelezettség  
- **Hibák válaszadása**: Jelentett problémák 48 órán belül  
- **Funkciókérések értékelése**: Egy héten belül  
- **Közösségi hozzájárulások átvizsgálása**: Egy héten belül  
- **Biztonsági ügyek**: Azonnali kezelési prioritás  

## Karbantartási ütemterv  

### Rendszeres frissítések  
- **Havi átvizsgálás**: Tartalom pontosság és link ellenőrzés  
- **Negyedéves frissítések**: Jelentős tartalom bővítések és fejlesztések  
- **Féléves átszervezések**: Átfogó szerkezetátrendezés és fejlesztés  
- **Éves kiadások**: Főverziós frissítések jelentős fejlesztésekkel  

### Monitorozás és minőségbiztosítás  
- **Automatizált tesztelés**: Kód példák és linkek rendszeres validálása  
- **Közösségi visszajelzés beépítése**: Felhasználói javaslatok rendszeres integrálása  
- **Technológiai frissítések**: Legújabb Azure szolgáltatások és azd verziókhoz igazítás  
- **Hozzáférhetőségi auditok**: Rendszeres felülvizsgálat az inkluzív tervezési elvek szerint  

## Verzió támogatási politika  

### Jelenlegi verzió támogatás  
- **Legfrissebb főverzió**: Teljes támogatás rendszeres frissítésekkel  
- **Előző főverzió**: Biztonsági frissítések és kritikus javítások 12 hónapig  
- **Régebbi verziók**: Csak közösségi támogatás, hivatalos frissítések nélkül  

### Migrációs útmutató  
Amikor főverziók jelennek meg, biztosítjuk:
- **Áttelepítési Útmutatók**: Lépésről lépésre áttekintő utasítások
- **Kompatibilitási Megjegyzések**: Információk a visszafelé nem kompatibilis változásokról
- **Eszköztámogatás**: Szkriptek vagy segédprogramok az áttelepítés megkönnyítéséhez
- **Közösségi Támogatás**: Külön fórumok az áttelepítési kérdésekhez

---

**Navigáció**
- **Előző Lecke**: [Tanulmányi Útmutató](resources/study-guide.md)
- **Következő Lecke**: Vissza a [Fő README-hez](README.md)

**Maradj Naprakész**: Kövesd ezt a tárat, hogy értesítéseket kapj az új kiadásokról és a tananyagot érintő fontos frissítésekről.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) használatával készült. Bár igyekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hivatalos forrásnak. Kritikus információk esetén professzionális emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->