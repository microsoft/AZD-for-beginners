# Változásnapló - AZD Kezdőknek

## Bevezetés

Ez a változásnapló dokumentálja az AZD Kezdőknek tároló minden jelentős változását, frissítését és fejlesztését. A szemantikus verziózás elveit követjük, és fenntartjuk ezt a naplót, hogy segítsük a felhasználókat megérteni, mi változott a verziók között.

## Tanulási célok

A változásnapló áttekintésével Ön:
- Naprakész lesz az új funkciókról és tartalomhozzáadásokró
- Megérti a meglévő dokumentáció fejlesztéseit
- Nyomon követi a hibajavításokat és korrekciókat a pontosság érdekében
- Követi a tananyagok fejlődését az idő során

## Tanulási eredmények

A változásnapló bejegyzéseinek áttekintése után képes lesz:
- Azonosítani az új tananyagokat és erőforrásokat
- Megérteni, mely szakaszok frissültek vagy javultak
- Megtervezni tanulási útját a legfrissebb anyagok alapján
- Visszajelzést és javaslatokat adni a jövőbeli fejlesztésekhez

## Verziótörténet

### [v3.18.0] - 2026-03-16

#### AZD AI CLI parancsok, tartalom validáció és sablonbővítés
**Ez a verzió kiterjeszti az `azd ai`, `azd extension`, és `azd mcp` parancsok lefedettségét az összes AI-val kapcsolatos fejezetben, javítja az agents.md törött linkjeit és elavult kódját, frissíti az összevont parancslistát, valamint átdolgozza a Példasablonok szakaszt validált leírásokkal és új Azure AI AZD sablonokkal.**

#### Hozzáadva
- **🤖 AZD AI CLI lefedettség** 7 fájlban (korábban csak a 8. fejezetben):
  - `docs/chapter-01-foundation/azd-basics.md` — Új "Bővítmények és AI parancsok" szakasz, amely bemutatja az `azd extension`, `azd ai agent init` és `azd mcp` parancsokat
  - `docs/chapter-02-ai-development/agents.md` — 4. lehetőség: `azd ai agent init` összehasonlító táblázattal (sablon vs. manifeszt megközelítés)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD bővítmények a Foundry-hoz" és "Agent-First Telepítés" alfejezetek
  - `docs/chapter-05-multi-agent/README.md` — Gyorsindítás most mind a sablon, mind a manifeszt alapú telepítési utakat bemutatja
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Telepítés szakasz most tartalmazza az `azd ai agent init` opciót
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Bővítmény Parancsok Diagnosztikához" alfejezet
  - `resources/cheat-sheet.md` — Új "AI & Bővítmény Parancsok" szakasz az `azd extension`, `azd ai agent init`, `azd mcp`, és `azd infra generate` parancsokkal
- **📦 Új AZD AI példasablonok** a `microsoft-foundry-integration.md`-ben:
  - **azure-search-openai-demo-csharp** — .NET alapú RAG chat Blazor WebAssembly-vel, Semantic Kernel-lel és hangalapú chat támogatással
  - **azure-search-openai-demo-java** — Java RAG chat Langchain4J-vel, ACA/AKS telepítési lehetőségekkel
  - **contoso-creative-writer** — Többagent kreatív író alkalmazás Azure AI Agent Servicel, Bing Groundinggel és Prompty-vel
  - **serverless-chat-langchainjs** — Serverless RAG Azure Functionökkel + LangChain.js + Cosmos DB, Ollama helyi fejlesztési támogatással
  - **chat-with-your-data-solution-accelerator** — Vállalati RAG gyorsító admin portállal, Teams integrációval, PostgreSQL/Cosmos DB opciókkal
  - **azure-ai-travel-agents** — Többagent MCP orchestrációs referencia alkalmazás szerverekkel .NET, Python, Java és TypeScript nyelveken
  - **azd-ai-starter** — Minimális Azure AI infrastruktúra Bicep indító sablon
  - **🔗 Awesome AZD AI Galéria link** — Hivatkozás az [awesome-azd AI galériára](https://azure.github.io/awesome-azd/?tags=ai) (80+ sablon)

#### Javítva
- **🔗 agents.md navigáció**: Előző/Következő linkek most már megfelelnek a 2. fejezet README tanulási sorrendjének (Microsoft Foundry Integráció → Ügynökök → AI modell telepítés)
- **🔗 agents.md törött linkek**: `production-ai-practices.md` javítva `../chapter-08-production/production-ai-practices.md` (3 előfordulás)
- **📦 agents.md elavult kód**: Az `opencensus` lecserélve `azure-monitor-opentelemetry` + OpenTelemetry SDK-ra
- **🐛 agents.md érvénytelen API**: A `max_tokens` átkerült a `create_agent()`-ből a `create_run()`-ba `max_completion_tokens` néven
- **🔢 agents.md token számlálás**: A durva `len//4` becslés helyett a `tiktoken.encoding_for_model()` használata
- **azure-search-openai-demo**: Szolgáltatások javítva "Cognitive Search + App Service"-ről "Azure AI Search + Azure Container Apps"-re (alapértelmezett host módosult 2024 októberében)
- **contoso-chat**: Leírás frissítve az Azure AI Foundry + Prompty-ra, amely illeszkedik a tároló tényleges címéhez és technológiai stackjéhez

#### Eltávolítva
- **ai-document-processing**: Nem működő sablonhivatkozás eltávolítva (a tároló nem elérhető nyilvánosan AZD sablonként)

#### Fejlesztve
- **📝 agents.md gyakorlatok**: Az 1. gyakorlat megmutatja a várt kimenetet és az `azd monitor` lépést; a 2. gyakorlat tartalmazza a teljes `FunctionTool` regisztrációs kódot; a 3. gyakorlat konkrét `prepdocs.py` parancsokra cseréli a homályos útmutatást
- **📚 agents.md erőforrások**: Dokumentációs linkek frissítve az aktuális Azure AI Agent Service dokumentációra és gyors indításra
- **📋 agents.md Következő lépések táblázat**: Hozzáadva AI Workshop Lab link a teljes fejezet lefedettséghez

#### Frissített fájlok
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Tanfolyam navigáció fejlesztése
**Ez a verzió fejleszti a README.md fejezeti navigációját egy kibővített táblázatformátummal.**

#### Változtatások
- **Tanfolyam térkép táblázat**: Kibővítve közvetlen leckelinkekkel, időtartam becslésekkel és összetettségi értékelésekkel
- **Mappatisztítás**: Régi, fölösleges mappák eltávolítva (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkellenőrzés**: Több mint 21 belső link a Tanfolyam térkép táblázatban ellenőrizve

### [v3.16.0] - 2026-02-05

#### Terméknév frissítések
**Ez a verzió frissíti a termék hivatkozásokat a jelenlegi Microsoft márkázásnak megfelelően.**

#### Változtatások
- **Microsoft Foundry → Microsoft Foundry**: Minden hivatkozás frissítve nem fordító fájlokban
- **Azure AI Agent Service → Foundry Agents**: A szolgáltatás neve frissítve az aktuális márka szerint

#### Frissített fájlok
- `README.md` - Fő tanfolyam kezdőoldal
- `changelog.md` - Verziótörténet
- `course-outline.md` - Tanfolyam felépítés
- `docs/chapter-02-ai-development/agents.md` - AI ügynökök útmutatója
- `examples/README.md` - Példák dokumentációja
- `workshop/README.md` - Workshop kezdőoldal
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - Minden workshop utasítás fájl

---

### [v3.15.0] - 2026-02-05

#### Jelentős tároló átszervezés: fejezet-alapú mappanév változtatások
**Ez a verzió dokumentációs mappákat rendez fejezetenként, egyértelműbb navigáció érdekében.**

#### Mappa átnevezések
Régi mappák lecserélve fejezet-sorszámos mappákra:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Újonnan hozzáadva: `docs/chapter-05-multi-agent/`

#### Fájl áthelyezések
| Fájl | Eredeti hely | Új hely |
|------|--------------|---------|
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
- **📚 Fejezet README fájlok**: Minden fejezetmappában létrehozva README.md az alábbiakkal:
  - Tanulási célok és időtartam
  - Lecketábla leírásokkal
  - Gyorsindítási parancsok
  - Navigáció más fejezetekhez

#### Változtatások
- **🔗 Minden belső link frissítve**: Több mint 78 útvonal frissítve az összes dokumentációs fájlban
- **🗺️ Fő README.md**: Tanfolyam térkép frissítve az új fejezetstruktúrával
- **📝 examples/README.md**: Kereszthivatkozások frissítve fejezet mappákra

#### Eltávolítva
- Régi mappastruktúra (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Tároló átszervezés: fejezet navigáció
**Ez a verzió fejezet navigációs README fájlokat adott hozzá (jelen verzió által felváltva v3.15.0-ban).**

---

### [v3.13.0] - 2026-02-05

#### Új AI Ügynökök Útmutató
**Ez a verzió átfogó útmutatót ad az AI ügynökök Azure Developer CLI-vel történő telepítéséhez.**

#### Hozzáadva
- **🤖 docs/microsoft-foundry/agents.md**: Teljes útmutató az alábbiakról:
  - Mi az AI ügynök és miben különbözik a chatbotoktól
  - Három gyorsindítási ügynök sablon (Foundry Agents, Prompty, RAG)
  - Ügynök architektúra minták (egyesített ügynök, RAG, több ügynök)
  - Eszköz konfiguráció és testreszabás
  - Monitorozás és metrikák nyomon követése
  - Költségszempontok és optimalizáció
  - Gyakori hibakeresési helyzetek
  - Három gyakorlati feladat sikerességi kritériumokkal

#### Tartalmi felépítés
- **Bevezetés**: Ügynöki fogalmak kezdőknek
- **Gyors kezdés**: Ügynökök telepítése `azd init --template get-started-with-ai-agents` paranccsal
- **Architektúra minták**: Ügynöki minták vizuális diagramjai
- **Konfiguráció**: Eszközbeállítások és környezeti változók
- **Monitorozás**: Application Insights integráció
- **Gyakorlatok**: Fokozatos kéz-a-kézben tanulás (20-45 perc / gyakorlat)

---

### [v3.12.0] - 2026-02-05

#### DevContainer környezet frissítés
**Ez a verzió frissíti a fejlesztői konténer konfigurációját modern eszközökkel és jobb alapértelmezett beállításokkal az AZD tanulási élményhez.**

#### Változtatások
- **🐳 Alap image**: Frissítve `python:3.12-bullseye`-ről `python:3.12-bookworm`-re (a legfrissebb Debian stabil kiadás)
- **📛 Konténer név**: Átnevezve "Python 3"-ról "AZD for Beginners"-re az egyértelműség érdekében

#### Hozzáadva
- **🔧 Új fejlesztői konténer funkciók**:
  - `azure-cli` engedélyezett Bicep támogatással
  - `node:20` (LTS verzió AZD sablonokhoz)
  - `github-cli` sablonkezeléshez
  - `docker-in-docker` konténer alkalmazás telepítésekhez

- **🔌 Port Továbbítás**: Előre konfigurált portok közös fejlesztési célokra:
  - 8000 (MkDocs előnézet)
  - 3000 (Web appok)
  - 5000 (Python Flask)
  - 8080 (API-k)

- **🧩 Új VS Code bővítmények**:
  - `ms-python.vscode-pylance` - Fejlett Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions támogatás
  - `ms-azuretools.vscode-docker` - Docker támogatás
  - `ms-azuretools.vscode-bicep` - Bicep nyelvi támogatás
  - `ms-azure-devtools.azure-resource-groups` - Azure erőforráskezelés
  - `yzhang.markdown-all-in-one` - Markdown szerkesztés
  - `DavidAnson.vscode-markdownlint` - Markdown lintelés
  - `bierner.markdown-mermaid` - Mermaid diagram támogatás
  - `redhat.vscode-yaml` - YAML támogatás (azure.yaml-hoz)
  - `eamodio.gitlens` - Git vizualizáció
  - `mhutchie.git-graph` - Git előzmények

- **⚙️ VS Code beállítások**: Alapértelmezett beállítások hozzáadva Python interpretálóhoz, formázás mentéskor és szóközök levágása

- **📦 Frissített requirements-dev.txt**:
  - Hozzáadva MkDocs minify plugin
  - Hozzáadva pre-commit a kódminőséghez
  - Azure SDK csomagok hozzáadva (azure-identity, azure-mgmt-resource)

#### Javítva
- **Post-Create Parancs**: Most ellenőrzi az AZD és Azure CLI telepítést a konténer indításakor

---

### [v3.11.0] - 2026-02-05

#### Kezdőknek barátságos README átdolgozás
**Ez a verzió jelentősen javítja a README.md fájlt a kezdők számára, valamint alapvető erőforrásokat ad AI fejlesztőknek.**

#### Hozzáadva
- **🆚 Azure CLI vs AZD összehasonlítás**: Világos magyarázat mikor melyik eszközt használjuk gyakorlati példákkal
- **🌟 Kiváló AZD linkek**: Közvetlen hivatkozások közösségi sablongalériára és hozzájárulási forrásokra:
  - [Awesome AZD Galéria](https://azure.github.io/awesome-azd/) - 200+ készen álló sablon telepítésre
  - [Sablon Beküldése](https://github.com/Azure/awesome-azd/issues) - Közösségi hozzájárulás
- **🎯 Gyors kezdési útmutató**: Egyszerűsített 3 lépéses kezdő szakasz (Telepítés → Bejelentkezés → Telepítés)
- **📊 Tapasztalati alapú navigációs táblázat**: Világos útmutatás kezdési pontokról fejlesztői tapasztalat alapján

#### Módosítva
- **README szerkezet**: Újrendezve fokozatos leleplezéshez – a kulcsfontosságú információk elöl
- **Bevezető szakasz**: Újraírás a "Az `azd up` varázsa" teljes kezdők számára történő megmagyarázásához
- **Ismétlődő tartalom eltávolítása**: Duplikált hibakeresési szakasz törlése
- **Hibakeresési parancsok**: Javítva az `azd logs` hivatkozás, érvényes `azd monitor --logs` használatával

#### Javítva
- **🔐 Hitelesítési parancsok**: Hozzáadva `azd auth login` és `azd auth logout` a cheat-sheet.md-hez
- **Érvénytelen parancs hivatkozások eltávolítása**: Maradék `azd logs` eltávolítva a README hibakeresési szakaszából

#### Megjegyzések
- **Hatókör**: Változások a fő README.md és resources/cheat-sheet.md fájlokra vonatkoznak
- **Célközönség**: Kifejezetten AZD-ben új fejlesztők számára készült fejlesztések

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI parancs pontosság frissítés
**Ez a verzió javítja az összes nem létező AZD parancsot a dokumentációban, biztosítva hogy minden kódpélda érvényes Azure Developer CLI szintaxist használjon.**

#### Javítva
- **🔧 Nem létező AZD parancsok eltávolítása**: Átfogó audit és érvénytelen parancsok javítása:
  - `azd logs` (nem létezik) → helyette `azd monitor --logs` vagy Azure CLI alternatívák
  - `azd service` alkparancsok (nem léteznek) → helyett `azd show` és Azure CLI
  - `azd infra import/export/validate` (nem léteznek) → eltávolítva vagy helyettesítve
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` kapcsolók (nem léteznek) → eltávolítva
  - `azd provision --what-if/--rollback` kapcsolók (nem léteznek) → `--preview` használatra frissítve
  - `azd config validate` (nem létezik) → `azd config list` használva
  - `azd info`, `azd history`, `azd metrics` (nem léteznek) → eltávolítva

- **📚 Parancsjavításokat tartalmazó fájlok**:
  - `resources/cheat-sheet.md`: Parancs hivatkozás jelentős átdolgozása
  - `docs/deployment/deployment-guide.md`: Rollback és telepítési stratégiák javítása
  - `docs/troubleshooting/debugging.md`: Napló-elemzési szakaszok javítása
  - `docs/troubleshooting/common-issues.md`: Hibakeresési parancsok frissítése
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD hibakeresési rész javítása
  - `docs/getting-started/azd-basics.md`: Monitoring parancsok javítása
  - `docs/getting-started/first-project.md`: Monitoring és hibakeresési példák frissítése
  - `docs/getting-started/installation.md`: Súgó és verzió példák javítása
  - `docs/pre-deployment/application-insights.md`: Napló megtekintési parancsok javítása
  - `docs/pre-deployment/coordination-patterns.md`: Ügynök hibakeresési parancsok javítása

- **📝 Verzió hivatkozás frissítve**: 
  - `docs/getting-started/installation.md`: Keménykódolt `1.5.0` verzió helyett generikus `1.x.x` link a kiadásokhoz

#### Módosítva
- **Rollback stratégiák**: Dokumentáció frissítve Git alapú rollback használatára (AZD nem támogat natív rollback-et)
- **Napló megtekintés**: `azd logs` hivatkozások kicserélése `azd monitor --logs`, `azd monitor --live`, illetve Azure CLI parancsokra
- **Teljesítmény szekció**: Nem létező párhuzamos/incrementális telepítési kapcsolók eltávolítása, érvényes alternatívák biztosítása

#### Technikai részletek
- **Érvényes AZD parancsok**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Érvényes azd monitor kapcsolók**: `--live`, `--logs`, `--overview`
- **Eltávolított funkciók**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Megjegyzések
- **Ellenőrzés**: Parancsok validálva Azure Developer CLI v1.23.x verzióval

---

### [v3.9.0] - 2026-02-05

#### Workshop befejezése és dokumentáció minőségjavítás
**Ez a verzió befejezi az interaktív workshop modulokat, javít minden törött dokumentációs linket, és javítja az általános tartalmi minőséget AI fejlesztők számára Microsoft AZD-vel.**

#### Hozzáadva
- **📝 CONTRIBUTING.md**: Új hozzájárulási útmutató dokumentum:
  - Világos útmutatás hibajelentéshez és változtatás javaslathoz
  - Új tartalom dokumentációs sztenderdek
  - Kódpélda szabályok és commit üzenet konvenciók
  - Közösségi részvétel információi

#### Befejezve
- **🎯 Workshop Modul 7 (Összefoglaló)**: Teljes összegező modul:
  - Workshop eredmények részletes összefoglalója
  - Alapfogalmak szekció AZD, sablonok, Microsoft Foundry témákban
  - Tanulási út folytatására ajánlások
  - Workshop kihívások nehézségi besorolással
  - Közösségi visszajelzés és támogatási linkek

- **📚 Workshop Modul 3 (Dekonstrukció)**: Tanulási célok frissítése:
  - GitHub Copilot MCP szerverekkel aktiválás
  - AZD sablon mappaszerkezet megértése
  - Infrastrukturális kód (Bicep) szervezési minták
  - Gyakorlati labor utasítások

- **🔧 Workshop Modul 6 (Leállítás)**: Befejezve:
  - Erőforrás takarítás és költségkezelési célok
  - `azd down` használata biztonságos infrastruktúra leszereléshez
  - Soft-delete-elt kognitív szolgáltatások helyreállítása
  - Bónusz felfedező feladatok GitHub Copilot és Azure Portal használatával

#### Javítva
- **🔗 Törött Linkek Javítása**: 15+ törött belső dokumentációs link javítása:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md útvonal javítása
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md és production-ai-practices.md utak javítása
  - `docs/getting-started/first-project.md`: nem létező cicd-integration.md helyett deployment-guide.md
  - `examples/retail-scenario.md`: FAQ és hibakeresési útmutató hivatkozások javítása
  - `examples/container-app/microservices/README.md`: kurzus kezdő és telepítési útmutató utak javítása
  - `resources/faq.md` és `resources/glossary.md`: AI fejezet hivatkozások frissítése
  - `course-outline.md`: oktató útmutató és AI workshop labor hivatkozások javítása

- **📅 Workshop állapot banner**: „Építés alatt” jelzés cseréje aktív workshop státuszra, 2026 februári dátummal

- **🔗 Workshop navigáció javítások**: Töredezett navigációs linkek javítása workshop README.md-ben, nem létező lab-1-azd-basics mappára mutató hivatkozás korrekciója

#### Módosítva
- **Workshop bemutatás**: „Építés alatt” figyelmeztetés eltávolítva, workshop kész és használatra kész
- **Navigációs konzisztencia**: Biztosított modulok közti megfelelő navigáció
- **Tanulási út hivatkozások**: fejezetkereszt-hivatkozások frissítése a helyes microsoft-foundry utakra

#### Validálva
- ✅ Minden angol markdown fájlban érvényes belső linkek
- ✅ Workshop modulok 0-7 teljesek tanulási célokkal
- ✅ Fejezetek és modulok közti navigáció rendben működik
- ✅ Tartalom alkalmas AI fejlesztők számára Microsoft AZD-vel
- ✅ Kezdőbarát nyelvezet és szerkezet végig fenntartva
- ✅ CONTRIBUTING.md világos útmutatást nyújt közösségi hozzájárulóknak

#### Technikai megvalósítás
- **Link validálás**: Automatikus PowerShell szkript ellenőrizte az összes .md belső linket
- **Tartalom audit**: Manuális áttekintés a workshop teljességére és kezdőbarát jellemére
- **Navigációs rendszer**: Következetes fejezet és modul navigációs minták alkalmazása

#### Megjegyzések
- **Hatókör**: Módosítások kizárólag angol dokumentációban
- **Fordítások**: Fordítási mappák nem frissültek ebben a verzióban (automatikus fordítás később szinkronizál)
- **Workshop időtartam**: A kész workshop 3-4 óra kézibeletős tanulást biztosít

---

### [v3.8.0] - 2025-11-19

#### Haladó dokumentáció: Monitoring, biztonság és multi-agent minták
**Ez a verzió átfogó A-minőségű leckéket ad hozzá az Application Insights integrációról, hitelesítési mintákról és multi-agent koordinációról gyártási telepítésekhez.**

#### Hozzáadva
- **📊 Application Insights integrációs lecke**: a `docs/pre-deployment/application-insights.md` fájlban:
  - AZD-központú telepítés automatikus provisioninggal
  - Teljes Bicep sablonok Application Insights + Log Analyticshez
  - Működő Python alkalmazások egyedi telemetriával (1200+ sor)
  - AI/LLM monitoring minták (Microsoft Foundry modellek token- és költségkövető)
  - 6 Mermaid diagram (architektúra, elosztott tracing, telemetria áramlás)
  - 3 gyakorlati feladat (riasztások, irányítópultok, AI monitoring)
  - Kusto lekérdezés példák és költségoptimalizálási stratégiák
  - Élő metrikák streamelése és valós idejű hibakeresés
  - 40-50 perces tanulási idő gyártásra kész mintákkal

- **🔐 Hitelesítési és biztonsági minták lecke**: a `docs/getting-started/authsecurity.md` fájlban:
  - 3 hitelesítési minta (connection stringek, Key Vault, kezelőazonosság)
  - Teljes Bicep infrastruktúra sablonok biztonságos telepítéshez
  - Node.js alkalmazáskód Azure SDK integrációval
  - 3 komplett gyakorlat (kezelőazonosság engedélyezése, felhasználó-alapú identitás, Key Vault forgatás)
  - Biztonsági legjobb gyakorlatok és RBAC beállítások
  - Hibakeresési útmutató és költségelemzés
  - Gyártásra kész jelszó nélküli hitelesítési minták

- **🤖 Multi-agent koordinációs minták lecke**: a `docs/pre-deployment/coordination-patterns.md` fájlban:
  - 5 koordinációs minta (soros, párhuzamos, hierarchikus, eseményvezérelt, konszenzus)
  - Teljes orchestrátor szolgáltatás implementáció (Python/Flask, 1500+ sor)
  - 3 specializált ügynök implementáció (Kutató, Író, Szerkesztő)
  - Service Bus integráció üzenetsorhoz
  - Cosmos DB állapotkezelés elosztott rendszerekhez
  - 6 Mermaid diagram az ügynökök interakcióiról
  - 3 haladó gyakorlat (időtúllépés kezelése, újrapróbálkozás logika, körkapcsoló)
  - Költségbontás ($240-$565/hónap) optimalizációs stratégiákkal
  - Application Insights integráció a monitorozáshoz

#### Bővítve
- **Pre-deployment fejezet**: Most már tartalmaz átfogó monitorozási és koordinációs mintákat
- **Getting Started fejezet**: Fejlettebb professzionális hitelesítési mintákkal bővítve
- **Gyártásra kész állapot**: Teljes lefedettség a biztonságtól az észlelhetőségig
- **Tanfolyamvázlat**: Frissítve, hogy hivatkozzon az új leckékre a 3. és 6. fejezetekben

#### Módosítva
- **Tanulási folyamat**: Jobb integráció a biztonság és monitorozás között a tanfolyamban
- **Dokumentáció minőség**: Következetes A-minőségű sztenderdek (95-97%) az új leckékben
- **Gyártási minták**: Teljes körű, végponttól végpontig lefedettség vállalati telepítésekhez

#### Javítva
- **Fejlesztői élmény**: Tiszta útvonal a fejlesztéstől a gyártásmonitorozásig
- **Biztonsági szabványok**: Professzionális minták hitelesítéshez és titkok kezeléséhez
- **Megfigyelhetőség**: Teljes Application Insights integráció az AZD-vel
- **MI feladatok**: Specializált monitorozás a Microsoft Foundry modellekhez és többügynökös rendszerekhez

#### Érvényesített
- ✅ Minden lecke teljes, működő kódot tartalmaz (nem csak részleteket)
- ✅ Mermaid diagramok a vizuális tanuláshoz (összesen 19 három leckében)
- ✅ Gyakorlati feladatok ellenőrző lépésekkel (összesen 9)
- ✅ Gyártásra kész Bicep sablonok, telepíthetők `azd up` parancssal
- ✅ Költségelemzés és optimalizációs stratégiák
- ✅ Hibakeresési útmutatók és bevált gyakorlatok
- ✅ Tudásellenőrző pontok ellenőrző parancsokkal

#### Dokumentáció visszajelzések
- **docs/pre-deployment/application-insights.md**: - Átfogó monitorozási útmutató
- **docs/getting-started/authsecurity.md**: - Professzionális biztonsági minták
- **docs/pre-deployment/coordination-patterns.md**: - Fejlett többügynökös architektúrák
- **Összességében új tartalom**: - Következetes magas színvonal

#### Műszaki megvalósítás
- **Application Insights**: Log Analytics + egyedi telemetria + elosztott nyomkövetés
- **Hitelesítés**: Kezelt identitás + Key Vault + RBAC minták
- **Többügynökös**: Service Bus + Cosmos DB + Container Apps + összehangolás
- **Monitorozás**: Élő metrikák + Kusto lekérdezések + riasztások + irányítópultok
- **Költségkezelés**: Mintavételezési stratégiák, megtartási szabályok, költségvetési kontrollok

### [v3.7.0] - 2025-11-19

#### Dokumentáció minőségfejlesztések és új Microsoft Foundry Models példa
**Ez a verzió javítja a dokumentáció minőségét az egész tárolóban, és egy teljes Microsoft Foundry Models telepítési példát ad hozzá gpt-4.1 chat felülettel.**

#### Hozzáadott
- **🤖 Microsoft Foundry Models chat példa**: Teljes gpt-4.1 telepítés működő megvalósítással `examples/azure-openai-chat/`:
  - Teljes Microsoft Foundry Models infrastruktúra (gpt-4.1 modell telepítés)
  - Python parancssoros chat felület beszélgetési előzményekkel
  - Key Vault integráció biztonságos API kulcs tároláshoz
  - Tokenhasználat nyomon követése és költségbecslés
  - Sebességkorlátozás és hibakezelés
  - Átfogó README 35-45 perces telepítési útmutatóval
  - 11 gyártásra kész fájl (Bicep sablonok, Python alkalmazás, konfiguráció)
- **📚 Dokumentációs gyakorlatok**: Gyakorlati feladatok hozzáadva a konfigurációs útmutatóhoz:
  - Feladat 1: Több-környezetű konfiguráció (15 perc)
  - Feladat 2: Titkok kezelése gyakorlatban (10 perc)
  - Egyértelmű siker kritériumok és ellenőrző lépések
- **✅ Telepítés ellenőrzése**: Ellenőrzési szakasz hozzáadva a telepítési útmutatóhoz:
  - Állapotellenőrzési eljárások
  - Siker kritériumok listája
  - Várt kimenetek az összes telepítési parancshoz
  - Gyors hibaelhárítási referencia

#### Fejlesztett
- **examples/README.md**: A minőség az A szintre frissítve (93%):
  - Hozzáadva az azure-openai-chat minden releváns szakaszhoz
  - Helyi példák száma 3-ról 4-re nőtt
  - Hozzáadva az MI alkalmazás példák táblázathoz
  - Integrálva a középhaladó felhasználók gyorsindítójába
  - Hozzáadva a Microsoft Foundry sablonok szekcióhoz
  - Frissítve az összehasonlító mátrix és technológia keresési szakaszok
- **Dokumentáció minőség**: B+ (87%) → A- (92%) javítás a docs mappában:
  - Hozzáadott várható kimenetek kritikus parancspéldákhoz
  - Tartalmaz ellenőrző lépéseket konfigurációs változásokhoz
  - Fejlesztett gyakorlati tanulás feladatokkal

#### Megváltozott
- **Tanulási folyamat**: Jobb AI példák integrálása középhaladó tanulók számára
- **Dokumentációs szerkezet**: Több cselekvő feladat egyértelmű eredményekkel
- **Ellenőrzési folyamat**: Kiemelt siker kritériumok a kulcs munkafolyamatokban

#### Fejlesztett
- **Fejlesztői élmény**: Microsoft Foundry Models telepítés most 35-45 perc (a korábbi 60-90 helyett)
- **Költség átláthatóság**: Egyértelmű költségbecslések ($50-200/hó) a Microsoft Foundry Models példához
- **Tanulási út**: MI fejlesztők tiszta belépési pontja az azure-openai-chat
- **Dokumentációs szabványok**: Következetes várt kimenetek és ellenőrző lépések

#### Érvényesített
- ✅ Microsoft Foundry Models példa teljesen működőképes `azd up` használatával
- ✅ Mind a 11 megvalósítási fájl szintaktikailag helyes
- ✅ README utasítások megfelelnek a valós telepítési élménynek
- ✅ Dokumentációs hivatkozások 8+ helyen frissítve
- ✅ Példák indexe pontosan tükrözi a 4 helyi példát
- ✅ Egyetlen külső hivatkozás sem ismétlődik táblázatokban
- ✅ Minden navigációs hivatkozás helyes

#### Műszaki megvalósítás
- **Microsoft Foundry Models architektúra**: gpt-4.1 + Key Vault + Container Apps minta
- **Biztonság**: Kezelt identitás kész, titkok Key Vaultban
- **Monitorozás**: Application Insights integráció
- **Költségkezelés**: Token követés és felhasználás optimalizálás
- **Telepítés**: Egyetlen `azd up` parancs a teljes beállításhoz

### [v3.6.0] - 2025-11-19

#### Jelentős frissítés: Container App telepítési példák
**Ez a verzió átfogó, gyártásra készen álló konténeralkalmazás telepítési példákat vezet be Azure Developer CLI-vel (AZD), teljes dokumentációval és tanulási út integrációval.**

#### Hozzáadott
- **🚀 Container App példák**: Új helyi példák a `examples/container-app/` könyvtárban:
  - [Master útmutató](examples/container-app/README.md): Teljes áttekintés konténeres telepítésekről, gyorsindítás, gyártás, fejlett minták
  - [Egyszerű Flask API](../../examples/container-app/simple-flask-api): Kezdőbarát REST API skálázás nullára, állapotellenőrzések, monitorozás és hibakeresés
  - [Mikroszolgáltatások architektúrája](../../examples/container-app/microservices): Gyártásra kész több-szolgáltatásos telepítés (API Gateway, Termék, Rendelés, Felhasználó, Értesítés), aszinkron üzenetküldés, Service Bus, Cosmos DB, Azure SQL, elosztott nyomkövetés, blue-green/canary telepítés
- **Legjobb gyakorlatok**: Biztonság, monitorozás, költségoptimalizáció és CI/CD útmutató konténeres munkaterhelésekhez
- **Kódminták**: Teljes `azure.yaml`, Bicep sablonok, többnyelvű szolgáltatás megvalósítások (Python, Node.js, C#, Go)
- **Tesztelés & Hibakeresés**: Végponttól végpontig történő teszt forgatókönyvek, monitorozó parancsok, hibakeresési útmutató

#### Megváltozott
- **README.md**: Frissítve új container app példák bemutatására és linkelésére az „Helyi példák - Konténeralkalmazások” alatt
- **examples/README.md**: Frissítve a container app példákat kiemelve, összehasonlító mátrix bejegyzéseket hozzáadva, technológia/architektúra hivatkozások frissítve
- **Tanfolyam áttekintő & tanulási útmutató**: Frissítve új container app példák és telepítési minták hivatkozásával a releváns fejezetekben

#### Érvényesített
- ✅ Minden új példa telepíthető `azd up` használatával és követi a legjobb gyakorlatokat
- ✅ Dokumentációs kereszthivatkozások és navigáció frissítve
- ✅ Példák kezdőtől haladó szintig lefedik a forgatókönyveket, beleértve a gyártási mikroszolgáltatásokat is

#### Megjegyzések
- **Hatókör**: Csak angol nyelvű dokumentáció és példák
- **Következő lépések**: További fejlett konténer minták és CI/CD automatizálás bővítése a jövőbeni kiadásokban

### [v3.5.0] - 2025-11-19

#### Termékátnevezés: Microsoft Foundry
**Ez a verzió teljeskörű terméknév-cserét hajt végre az „Microsoft Foundry” névre az összes angol nyelvű dokumentációban, tükrözve a Microsoft hivatalos átnevezését.**

#### Megváltozott
- **🔄 Terméknév frissítés**: Teljes átnevezés „Microsoft Foundry”-ra
  - Minden hivatkozás frissítve az angol dokumentációkban a `docs/` mappában
  - Mappa átnevezve: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Fájl átnevezve: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Összesen 23 tartalmi hivatkozás frissítve 7 dokumentációs fájlban

- **📁 Mappastruktúra változások**:
  - `docs/ai-foundry/` átnevezve `docs/microsoft-foundry/`-ra
  - Minden kereszt-hivatkozás frissítve az új struktúrára
  - Navigációs linkek ellenőrizve minden dokumentumban

- **📄 Fájl átnevezések**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Minden belső link frissítve az új fájlnévre

#### Frissített fájlok
- **Fejezet dokumentációk** (7 fájl):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigációs link frissítve
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 terméknév hivatkozás frissítve
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Már Microsoft Foundry-t használ (korábbi frissítésekből)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 hivatkozás frissítve (áttekintés, közösségi visszajelzés, dokumentáció)
  - `docs/getting-started/azd-basics.md` - 4 kereszthivatkozás frissítve
  - `docs/getting-started/first-project.md` - 2 fejezeti navigációs hivatkozás frissítve
  - `docs/getting-started/installation.md` - 2 következő fejezet link frissítve
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 hivatkozás frissítve (navigáció, Discord közösség)
  - `docs/troubleshooting/common-issues.md` - 1 navigációs link frissítve
  - `docs/troubleshooting/debugging.md` - 1 navigációs link frissítve

- **Tanfolyam szerkezet fájlok** (2 fájl):
  - `README.md` - 17 hivatkozás frissítve (tanfolyam áttekintő, fejezetcímek, sablon szekció, közösségi betekintések)
  - `course-outline.md` - 14 hivatkozás frissítve (áttekintés, tanulási célok, fejezeti erőforrások)

#### Érvényesített
- ✅ Nincs több „ai-foundry” mappa elérési hivatkozás az angol doksikban
- ✅ Nincs több „Microsoft Foundry” terméknév hivatkozás az angol doksikban
- ✅ Minden navigációs link működik az új mappastruktúrával
- ✅ Fájl- és mappaátnevezések sikeresen végrehajtva
- ✅ Kereszthivatkozások a fejezetek között ellenőrizve

#### Megjegyzések
- **Hatókör**: Változások csak az angol `docs/` mappában
- **Fordítások**: A fordítókönyvtárak (`translations/`) nem frissültek ebben a verzióban
- **Workshop anyagok**: `workshop/` nem frissült ebben a verzióban
- **Példák**: Példafájlok továbbra is használhatnak régi neveket (a jövőbeni frissítésben javítandó)
- **Külső hivatkozások**: Külső URL-ek és GitHub repo hivatkozások változatlanok

#### Migrációs útmutató közreműködőknek
Ha helyi ágak vagy dokumentációk hivatkoznak a régi struktúrára:
1. Frissítsd a mappa hivatkozásokat: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Frissítsd a fájl hivatkozásokat: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Cseréld le a termék nevét: „Microsoft Foundry” → „Microsoft Foundry”
4. Ellenőrizd, hogy minden belső dokumentációs link működik

---

### [v3.4.0] - 2025-10-24

#### Infrastrukturális előnézet és érvényesítés fejlesztések
**Ez a verzió teljeskörű támogatást vezet be az új Azure Developer CLI előnézeti funkcióhoz és javítja a workshop felhasználói élményt.**

#### Hozzáadott
- **🧪 azd provision --preview funkció dokumentáció**: Teljes lefedettség az új infrastrukturális előnézeti képességhez
  - Parancs referencia és használati példák cheat sheet-ben
  - Részletes integráció a provisioning útmutatóban esettanulmányokkal és előnyökkel
  - Pre-flight ellenőrzés integrálva a telepítés biztonságosabbá tételéhez
  - Kezdő útmutató frissítve biztonság-központú telepítési gyakorlatokkal
- **🚧 Workshop állapot sáv**: Professzionális HTML sáv a workshop fejlesztési státuszának jelzésére
  - Gradiens dizájn és építési indikátorok a világos felhasználói kommunikáció érdekében
  - Utolsó frissítés időbélyeg a transzparenciához
  - Mobilbarát kialakítás minden eszköztípusra

#### Fejlesztett
- **Infrastrukturális biztonság**: Az előnézeti funkció végig integrálva a telepítési dokumentációban
- **Előtelepítési érvényesítés**: Automatizált szkriptek immár tartalmaznak előnézeti teszteket
- **Fejlesztői munkafolyamat**: Frissített parancsminták az előnézet használatával mint bevált gyakorlat
- **Workshop élmény**: Világos elvárások a felhasználók számára a tartalom fejlesztési státuszáról

#### Megváltozott
- **Telepítési leggyakoribb gyakorlatok**: Az előnézeti első munkafolyamat ajánlott megközelítés
- **Dokumentációs folyamat**: Infrastrukturális validáció korábbi helyre került a tanulási folyamatban
- **Workshop bemutatás**: Professzionális státusz kommunikáció világos fejlesztési idővonallal

#### Fejlesztett
- **Biztonság-központú megközelítés**: Infrastrukturális változtatások most előzetesen ellenőrizhetők telepítés előtt
- **Csapatmunka**: Az előnézeti eredmények megoszthatók átvizsgálásra és jóváhagyásra
- **Költségtudatosság**: Jobb áttekintés az erőforrás-költségekről provisioning előtt
- **Kockázatcsökkentés**: Csökkentett telepítési hibák előzetes validációval

#### Műszaki megvalósítás
- **Több dokumentumos integráció**: Az előnézeti funkció négy fő fájlban dokumentált
- **Parancs minták**: Következetes szintaxis és példák a dokumentációban
- **Legjobb gyakorlat integráció**: Előnézet integrálva validációs munkafolyamatokba és szkriptekbe
- **Vizualizációs indikátorok**: Egyértelmű ÚJ funkció jelölések a jobb felfedezhetőség érdekében

#### Workshop infrastruktúra
- **Státusz kommunikáció**: Professzionális HTML sáv gradiens stílussal
- **Felhasználói élmény**: Világos fejlesztési státusz megakadályozza a félreértéseket
- **Professzionális bemutatás**: Megőrzi a tároló hitelességét és világos elvárásokat állít fel
- **Idővonal átláthatóság**: 2025 októberi utolsó frissítés időbélyeg az elszámoltathatóságért

### [v3.3.0] - 2025-09-24

#### Fejlesztett workshop anyagok és interaktív tanulási élmény
**Ez a verzió átfogó workshop anyagokat vezet be böngésző alapú interaktív útmutatókkal és strukturált tanulási utakkal.**

#### Hozzáadott
- **🎥 Interaktív Workshop Útmutató**: Böngészőalapú workshop élmény MkDocs előnézeti képességgel
- **📝 Strukturált Workshop Utasítások**: 7 lépéses vezetett tanulási út felfedezéstől az egyedi beállításig
  - 0-Bevezető: Workshop áttekintése és beállítása
  - 1-Mesterséges-Intelligencia-Sablon-Kiválasztás: Sablon felfedezése és kiválasztási folyamat
  - 2-Mesterséges-Intelligencia-Sablon-Érvényesítés: Telepítési és érvényesítési eljárások
  - 3-Mesterséges-Intelligencia-Sablon-Felbontás: A sablon architektúrájának megértése
  - 4-Mesterséges-Intelligencia-Sablon-Beállítás: Konfigurálás és testreszabás
  - 5-Mesterséges-Intelligencia-Sablon-Testreszabás: Haladó módosítások és iterációk
  - 6-Infrastruktúra-Lebontás: Takarítás és erőforrás menedzsment
  - 7-Összefoglalás: Összegzés és következő lépések
- **🛠️ Workshop Eszközök**: MkDocs konfiguráció Material témával a jobb tanulási élményért
- **🎯 Gyakorlati Tanulási Út**: 3 lépéses módszertan (Felfedezés → Telepítés → Testreszabás)
- **📱 GitHub Codespaces Integráció**: Zökkenőmentes fejlesztői környezet beállítás

#### Kibővítve
- **AI Workshop Labor**: Kiterjesztve átfogó 2-3 órás strukturált tanulási élménnyel
- **Workshop Dokumentáció**: Professzionális bemutatás navigációval és vizuális segédletekkel
- **Tanulási Menet**: Világos, lépésenkénti útmutatás a sablon kiválasztásától a gyártási telepítésig
- **Fejlesztői Élmény**: Integrált eszközök a gördülékeny fejlesztési munkafolyamatokhoz

#### Javítva
- **Megközelíthetőség**: Böngészőalapú felület kereséssel, másolási funkcióval és téma váltással
- **Önálló Ütemezésű Tanulás**: Rugalmas workshop struktúra, amely támogatja a különböző tanulási sebességeket
- **Gyakorlati Alkalmazás**: Valós AI sablon telepítési szcenáriók
- **Közösségi Integráció**: Discord integráció workshop támogatáshoz és együttműködéshez

#### Workshop Jellemzők
- **Beépített Keresés**: Gyors kulcsszó- és léckeletár
- **Kódblokkok Másolása**: Egér fölé húzva másolási funkció minden kódpéldánál
- **Téma Váltás**: Sötét/világos mód támogatás különböző preferenciákhoz
- **Vizuális Segédletek**: Képernyőképek és diagramok a jobb megértésért
- **Segítség Integráció**: Közvetlen Discord hozzáférés a közösségi támogatáshoz

### [v3.2.0] - 2025-09-17

#### Jelentős Navigációs Átszervezés és Fejezetalapú Tanulási Rendszer  
**Ez a verzió átfogó fejezetalapú tanulási struktúrát vezet be, megerősített navigációval az egész tárolón belül.**

#### Hozzáadva
- **📚 Fejezetalapú Tanulási Rendszer**: Az egész tanfolyam átszervezve 8 progresszív tanulási fejezetre
  - 1. Fejezet: Alapok és Gyorskezdés (⭐ - 30-45 perc)
  - 2. Fejezet: AI-Központú Fejlesztés (⭐⭐ - 1-2 óra)
  - 3. Fejezet: Konfiguráció és Hitelesítés (⭐⭐ - 45-60 perc)
  - 4. Fejezet: Infrastruktúra Kód formájában & Telepítés (⭐⭐⭐ - 1-1,5 óra)
  - 5. Fejezet: Többügynökös AI Megoldások (⭐⭐⭐⭐ - 2-3 óra)
  - 6. Fejezet: Előzetes Telepítési Érvényesítés és Tervezés (⭐⭐ - 1 óra)
  - 7. Fejezet: Hibakeresés és Hibajavítás (⭐⭐ - 1-1,5 óra)
  - 8. Fejezet: Gyártás és Vállalati Minták (⭐⭐⭐⭐ - 2-3 óra)
- **📚 Átfogó Navigációs Rendszer**: Következetes navigációs fejléc és lábléc az összes dokumentációban
- **🎯 Haladás Követés**: Tanfolyam befejezési ellenőrzőlista és tanulási hitelesítési rendszer
- **🗺️ Tanulási Útvonal Útmutatás**: Világos belépési pontok különböző tapasztalati szintekhez és célokhoz
- **🔗 Kereszthivatkozásos Navigáció**: Kapcsolódó fejezetek és előfeltételek egyértelműen összekapcsolva

#### Kibővítve
- **README Felépítés**: Fejezetalapú szervezésű, strukturált tanulási platformmá alakítva
- **Dokumentáció Navigáció**: Minden oldal tartalmazza a fejezet kontextust és haladási útmutatást
- **Sablon Szervezés**: Példák és sablonok az adott tanulási fejezetekhez társítva
- **Erőforrás Integráció**: Segédletek, GYIK-ek és tanulási útmutatók kapcsolódnak a releváns fejezetekhez
- **Workshop Integráció**: Gyakorlati laborok több fejezet tanulási céljaihoz rendelve

#### Megváltozott
- **Tanulási Menet**: Lineáris dokumentációról rugalmas, fejezetalapú tanulásra váltás
- **Konfiguráció Elhelyezés**: A konfigurációs útmutató a 3. fejezet pozíciójára áthelyezve a jobb tanulási folyamat érdekében
- **AI Tartalom Integráció**: AI-specifikus tartalom jobb integrációja a tanulási úton
- **Gyártási Tartalom**: Haladó minták összevonva a 8. fejezetben vállalati tanulók számára

#### Javítva
- **Felhasználói Élmény**: Egyértelmű navigációs morzsák és fejezet haladási mutatók
- **Megközelíthetőség**: Konzekvens navigációs minták a könnyebb tanfolyami haladáshoz
- **Professzionális Megjelenés**: Egyetemista-stílusú tanfolyamstruktúra, alkalmas akadémiai és vállalati képzésre
- **Tanulási Hatékonyság**: Javított szervezéssel rövidebb idő a releváns tartalom megtalálásához

#### Technikai Megvalósítás
- **Navigációs Fejlécek**: Szabványosított fejezet navigáció több mint 40 dokumentációs fájlban
- **Navigációs Lábléc**: Következetes haladási útmutatás és fejezet befejezési mutatók
- **Kereszthivatkozások**: Átfogó belső hivatkozási rendszer kapcsolódó fogalmak összekötésére
- **Fejezet Leképezés**: Sablonok és példák világosan társítva a tanulási célokhoz

#### Tanulási Útmutató Fejlesztése
- **📚 Átfogó Tanulási Célok**: Átszerkesztett útmutató az 8 fejezetes rendszerhez igazítva
- **🎯 Fejezetalapú Értékelés**: Minden fejezet konkrét tanulási célokat és gyakorlati feladatokat tartalmaz
- **📋 Haladás Követés**: Heti tanulási ütemterv mérhető eredményekkel és teljesítési ellenőrzőlistával
- **❓ Értékelési Kérdések**: Tudás validációs kérdések fejezetenként, profi eredményekkel
- **🛠️ Gyakorlati Feladatok**: Gyakorlati tevékenységek valós telepítési szcenáriókkal és hibakereséssel
- **📊 Készségfejlődés**: Egyértelmű előrehaladás alapfogalmaktól a vállalati mintákig, karrier fejlesztési fókusz
- **🎓 Tanúsítási Keretrendszer**: Profi fejlődési eredmények és közösségi elismerés
- **⏱️ Időbeosztás Menedzsment**: Strukturált, 10 hetes tanulási terv mérföldkő ellenőrzéssel

### [v3.1.0] - 2025-09-17

#### Fejlesztett Többügynökös AI Megoldások  
**Ez a verzió javítja a többügynökös kiskereskedelmi megoldást jobb ügynök elnevezésekkel és kibővített dokumentációval.**

#### Megváltozott
- **Többügynökös Terminológia**: A “Cora agent” mindenütt “Customer agent”-re cserélve a kiskereskedelmi multi-ügynökös megoldásban az átláthatóság érdekében
- **Ügynök Architektúra**: Minden dokumentáció, ARM sablon és kódpélda egységesen “Customer agent” névhasználattal frissítve
- **Konfigurációs Példák**: Modernizált ügynök konfigurációs minták frissített elnevezésekkel
- **Dokumentáció Egységesség**: Biztosítva, hogy minden hivatkozás profi, leíró ügynök elnevezést használjon

#### Kibővítve
- **ARM Sablon Csomag**: A retail-multiagent-arm-template frissítve "Customer agent" hivatkozásokkal
- **Architektúra Diagramok**: Megújított Mermaid diagramok a frissített ügynök elnevezésekkel
- **Kódpéldák**: Python osztályok és implementációs példák most CustomerAgent névhasználattal
- **Környezeti Változók**: Minden telepítési script CUSTOMER_AGENT_NAME konvenciót használ

#### Javítva
- **Fejlesztői Élmény**: Világosabb ügynöki szerepek és felelősségek a dokumentációban
- **Gyártásra Alkalmasság**: Jobb összhang a vállalati elnevezési konvenciókkal
- **Tananyagok**: Oktatási célra intuitívabb ügynök elnevezés
- **Sablon Használhatóság**: Egyszerűbb az ügynök funkciók és telepítési minták megértése

#### Technikai Részletek
- Mermaid architektúra diagramok frissítve CustomerAgent hivatkozásokkal
- CoraAgent osztálynevek lecserélve CustomerAgent-re Python példákban
- ARM sablon JSON konfigurációk módosítva, hogy "customer" ügynöktípust használjanak
- Környezeti változók módosítva CORA_AGENT_* helyett CUSTOMER_AGENT_* mintára
- Minden telepítő parancs és konténer konfiguráció frissítve

### [v3.0.0] - 2025-09-12

#### Jelentős Változások - AI Fejlesztői Fókusz és Microsoft Foundry Integráció  
**Ez a verzió a tárolót átfogó AI-központú tanulási erőforrássá alakítja Microsoft Foundry integrációval.**

#### Hozzáadva
- **🤖 AI-Központú Tanulási Út**: Teljes átszervezés AI fejlesztők és mérnökök prioritásával
- **Microsoft Foundry Integrációs Útmutató**: Átfogó dokumentáció az AZD és Microsoft Foundry szolgáltatások összekapcsolásához
- **AI Modell Telepítési Minták**: Részletes útmutató modellválasztásról, konfigurációról és gyártási telepítésről
- **AI Workshop Labor**: 2-3 órás gyakorlati workshop AI alkalmazások AZD-vel történő telepítéséhez
- **Gyártási AI Legjobb Gyakorlatok**: Vállalati szintű minták méretezéshez, monitorozáshoz és biztonsághoz
- **AI Specifikus Hibakeresési Útmutató**: Átfogó Microsoft Foundry Modellek, Cognitive Services és AI telepítési hibák kezelése
- **AI Sablon Galéria**: Kiemelt Microsoft Foundry sablonok gyűjteménye bonyolultsági értékeléssel
- **Workshop Anyagok**: Teljes workshop struktúra gyakorlati laborokkal és referenciákkal

#### Kibővítve
- **README Felépítés**: AI fejlesztőkre fókuszálva, 45% közösségi érdeklődés Microsoft Foundry Discord adat alapján
- **Tanulási Utak**: Dedikált AI fejlesztői út együtt a hagyományos tanulói és DevOps mérnöki utak mellett
- **Sablon Ajánlások**: Kiemelt AI sablonok, mint azure-search-openai-demo, contoso-chat és openai-chat-app-quickstart
- **Közösségi Integráció**: Megrendült Discord közösségi támogatás AI specifikus csatornákkal és beszélgetésekkel

#### Biztonság és Gyártási Fókusz
- **Kezelt Identitás Minták**: AI-specifikus hitelesítési és biztonsági konfigurációk
- **Költségoptimalizálás**: Tokenhasználat követése és költségkontroll AI munkaterheléseknél
- **Több Régiós Telepítés**: Stratégiák globális AI alkalmazás telepítéshez
- **Teljesítmény Monitorozás**: AI-specifikus metrikák és Application Insights integráció

#### Dokumentáció Minőség
- **Lineáris Tanfolyam Struktúra**: Logikus előrehaladás kezdőtől haladó AI telepítési mintákig
- **Érvényesített URL-ek**: Minden külső tárolói link ellenőrizve és elérhető
- **Teljes Referencia**: Minden belső dokumentációs link ellenőrizve és működő
- **Gyártásra Kész**: Vállalati telepítési minták valós példákkal

### [v2.0.0] - 2025-09-09

#### Jelentős Változások - Tároló Átszervezés és Professzionális Fejlesztés  
**Ez a verzió jelentős átalakítást hoz a tároló szerkezetében és tartalom bemutatásában.**

#### Hozzáadva
- **Strukturált Tanulási Keretrendszer**: Minden dokumentációs oldal most tartalmazza a Bevezetést, Tanulási Célokat és Elvárt Eredményeket
- **Navigációs Rendszer**: Korábbi/Következő leckékre mutató linkek minden dokumentációs oldalon a vezetett tanuláshoz
- **Tanulási Útmutató**: Átfogó study-guide.md tanulási célokkal, gyakorlati feladatokkal és értékelési anyagokkal
- **Professzionális Megjelenés**: Minden emoji ikon eltávolítva jobb megközelíthetőség és professzionális kinézet érdekében
- **Kibővített Tartalomstruktúra**: Javított szervezés és tananyag folyamatosság

#### Megváltozott
- **Dokumentáció Formátum**: Egységes tanulás-központú felépítésre szabványosítva
- **Navigációs Folyamat**: Logikus előrehaladás megvalósítva a teljes tananyagon át
- **Tartalom Megjelenítés**: Dekoratív elemek eltávolítása, tiszta, profi formázás érdekében
- **Link Struktúra**: Minden belső hivatkozás frissítve az új navigációs rendszer támogatására

#### Javítva
- **Megközelíthetőség**: Emoji függőségek törölve jobb képernyőolvasó kompatibilitásért
- **Professzionális Megjelenés**: Tiszta, akadémiai stílusú megjelenés, vállalati tanulásra alkalmas
- **Tanulási Élmény**: Strukturált megközelítés világos célokkal és eredményekkel minden leckénél
- **Tartalom Szervezés**: Jobb logikai folyamatosság és kapcsolódás a témák között

### [v1.0.0] - 2025-09-09

#### Kezdeti Kiadás - Átfogó AZD Tanulási Tároló

#### Hozzáadva
- **Alap Dokumentációs Struktúra**
  - Teljes kezdő útmutató sorozat
  - Átfogó telepítési és szolgáltatásellátási dokumentáció
  - Részletes hibajavítási források és hibakeresési útmutatók
  - Előzetes érvényesítési eszközök és eljárások

- **Kezdeti Modul**
  - AZD alapok: Alapfogalmak és terminológia
  - Telepítési Útmutató: Platform specifikus beállítási instrukciók
  - Konfigurációs Útmutató: Környezet beállítása és hitelesítés
  - Első Projekt Oktatóanyag: Lépésenkénti gyakorlati tanulás

- **Telepítési és Szolgáltatásellátási Modul**
  - Telepítési Útmutató: Teljes munkafolyamat dokumentáció
  - Szolgáltatásellátási Útmutató: Infrastruktúra Kódként Bicep-pel
  - Gyártási telepítések legjobb gyakorlatai
  - Többszolgáltatásos architektúra minták

- **Előzetes Érvényesítési Modul**
  - Kapacitástervezés: Azure erőforrás elérhetőség ellenőrzése
  - SKU kiválasztás: Átfogó szolgáltatás szint útmutató
  - Átvizsgálási Tesztek: Automatizált érvényesítési szkriptek (PowerShell és Bash)
  - Költségbecslési és költségtervezési eszközök

- **Hibajavítási Modul**
  - Gyakori Problémák: Gyakran előforduló hibák és megoldások
  - Hibakeresési Útmutató: Szisztematikus hibakeresési módszertanok
  - Haladó diagnosztikai technikák és eszközök
  - Teljesítmény monitorozás és optimalizálás

- **Erőforrások és Hivatkozások**
  - Parancs Gyorssegédlet: Gyors hivatkozás alapvető parancsokra
  - Szószedet: Teljes körű terminológia és rövidítés definíciók
  - GYIK: Részletes válaszok gyakori kérdésekre
  - Külső forrás linkek és közösségi kapcsolatok

- **Példák és Sablonok**
  - Egyszerű Webalkalmazás példa
  - Statikus weboldal telepítési sablon
  - Konténeres alkalmazás konfiguráció
  - Adatbázis integrációs minták
  - Mikroservices architektúra példák
  - Serverless funkció implementációk

#### Jellemzők
- **Többplatformos Támogatás**: Telepítési és konfigurációs útmutatók Windows, macOS és Linux rendszerekre
- **Különböző Képességi Szintek**: Tartalom diákoktól profi fejlesztőkig
- **Gyakorlati Fókusz**: Gyakorlati példák és valós szituációk
- **Átfogó Lefedettség**: Alapfogalmaktól haladó vállalati mintákig
- **Biztonsági Elsőbbség**: Biztonsági legjobb gyakorlatok beépítve
- **Költséghatékonyság**: Útmutatás költséghatékony telepítésekhez és erőforrás menedzsmenthez

#### Dokumentáció Minőség
- **Részletes Kódpéldák**: Gyakorlati, tesztelt kódminták
- **Lépésenkénti Utasítások**: Világos, megvalósítható útmutatás
- **Átfogó Hibakezelés**: Gyakori hibák javítása
- **Legjobb Gyakorlatok Integrálása**: Iparági szabványok és ajánlások
- **Verziókompatibilitás**: Legfrissebb Azure szolgáltatásokkal és azd funkciókkal naprakész

## Tervezett Jövőbeli Fejlesztések

### Verzió 3.1.0 (Tervezett)  
#### AI Platform Bővítés
- **Többmodell-támogatás**: Integrációs minták Hugging Face, Azure Machine Learning és egyéni modellek számára  
- **AI Ügynök Keretrendszerek**: Sablonok LangChain, Semantic Kernel és AutoGen telepítésekhez  
- **Fejlett RAG Minták**: Vektoralapú adatbázis lehetőségek az Azure AI Search-en túl (Pinecone, Weaviate stb.)  
- **AI Megfigyelhetőség**: Fejlesztett monitorozás a modell teljesítményére, tokenhasználatra és válaszminőségre  

#### Fejlesztői Élmény  
- **VS Code Kiterjesztés**: Integrált AZD + Microsoft Foundry fejlesztői élmény  
- **GitHub Copilot Integráció**: AI által támogatott AZD sablongenerálás  
- **Interaktív Oktatóanyagok**: Gyakorlati kódolási gyakorlatok automatikus validálással AI forgatókönyvekhez  
- **Videós Tartalom**: Kiegészítő videós oktatóanyagok vizuális tanulóknak, az AI telepítésekre fókuszálva  

### 4.0.0 Verzió (Tervezett)  
#### Vállalati AI Minták  
- **Irányítási Keretrendszer**: AI modellirányítás, megfelelőség és audit nyomvonalak  
- **Több-bérlős AI**: Minták több ügyfél elkülönített AI szolgáltatásokkal való kiszolgálására  
- **Edge AI Telepítés**: Integráció az Azure IoT Edge és konténer példányokkal  
- **Hibrid Felhő AI**: Többfelhős és hibrid telepítési minták AI munkaterhelésekhez  

#### Fejlett Funkciók  
- **AI Folyamat Automatizálás**: MLOps integráció Azure Machine Learning pipeline-okon keresztül  
- **Fejlett Biztonság**: Zero-trust minták, privát végpontok és fejlett fenyegetésvédelem  
- **Teljesítményoptimalizálás**: Fejlett hangolási és skálázási stratégiák nagy áteresztőképességű AI alkalmazásokhoz  
- **Globális Elosztás**: Tartalomkézbesítő és edge cache minták AI alkalmazásokhoz  

### 3.0.0 Verzió (Tervezett) - Felváltva a Jelenlegi Kiadással  
#### Javasolt Kiegészítések - Most Megvalósítva a v3.0.0-ban  
- ✅ **AI-Központú Tartalom**: Átfogó Microsoft Foundry integráció (Befejezve)  
- ✅ **Interaktív Oktatóanyagok**: Gyakorlati AI workshop labor (Befejezve)  
- ✅ **Fejlett Biztonsági Modul**: AI-specifikus biztonsági minták (Befejezve)  
- ✅ **Teljesítményoptimalizálás**: AI munkaterhelés hangolási stratégiák (Befejezve)  

### 2.1.0 Verzió (Tervezett) - Részben Megvalósítva a v3.0.0-ban  
#### Kisebb Fejlesztések - Néhány Befejezve a Jelenlegi Kiadásban  
- ✅ **További Példák**: AI-központú telepítési forgatókönyvek (Befejezve)  
- ✅ **Kiterjesztett GYIK**: AI-specifikus kérdések és hibakeresés (Befejezve)  
- **Eszköz Integráció**: Fejlesztett IDE és szerkesztő integrációs útmutatók  
- ✅ **Monitorozás Bővítés**: AI-specifikus monitorozási és riasztási minták (Befejezve)  

#### Még Tervezett Jövőbeli Kiadáshoz  
- **Mobilbarát Dokumentáció**: Reszponzív dizájn mobil tanuláshoz  
- **Offline Hozzáférés**: Letölthető dokumentációs csomagok  
- **Fejlesztett IDE Integráció**: VS Code kiterjesztés AZD + AI munkafolyamatokhoz  
- **Közösségi Irányítópult**: Valós idejű közösségi metrikák és hozzájárulás követés  

## Változásnaplóhoz Való Hozzájárulás

### Változások Jelentése  
Amikor ehhez a tárolóhoz járulsz hozzá, kérjük győződj meg arról, hogy a változásnapló bejegyzések tartalmazzák:

1. **Verziószám**: A szemantikus verziózást követve (fő.kis.jav)  
2. **Dátum**: Kiadás vagy frissítés dátuma ÉÉÉÉ-HH-NN formátumban  
3. **Kategória**: Hozzáadva, Módosítva, Elavult, Eltávolítva, Javítva, Biztonság  
4. **Egyértelmű Leírás**: Rövid leírás a változásokról  
5. **Hatásértékelés**: Hogyan érintik a változások a meglévő felhasználókat  

### Változási Kategóriák

#### Hozzáadva  
- Új funkciók, dokumentációs szakaszok vagy képességek  
- Új példák, sablonok vagy tanulási anyagok  
- Kiegészítő eszközök, szkriptek vagy segédprogramok  

#### Módosítva  
- Létező funkciók vagy dokumentáció módosításai  
- Frissítések a világosság vagy pontosság javítása érdekében  
- Tartalom vagy szerkezet átszervezése  

#### Elavult  
- Folyamatban lévő funkciók vagy megközelítések eltávolítása  
- Eltávolításra kijelölt dokumentációs szakaszok  
- Olyan módszerek, amelyek jobb alternatívákkal rendelkeznek  

#### Eltávolítva  
- Már nem releváns funkciók, dokumentáció vagy példák  
- Elavult információk vagy elavult megközelítések  
- Ismétlődő vagy összevonható tartalom  

#### Javítva  
- Hibák javítása a dokumentációban vagy kódban  
- Jelentett problémák vagy hibák megoldása  
- Pontosság vagy működés javítása  

#### Biztonság  
- Biztonsággal kapcsolatos fejlesztések vagy javítások  
- Biztonsági legjobb gyakorlatok frissítése  
- Biztonsági sebezhetőségek elhárítása  

### Szemantikus Verziózás Útmutató

#### Főverzió (X.0.0)  
- Olyan törést okozó változások, amelyek felhasználói beavatkozást igényelnek  
- Jelentős tartalmi vagy szervezeti átszervezések  
- Alapvető megközelítés vagy módszertan megváltoztatása  

#### Kisebb Verzió (X.Y.0)  
- Új funkciók vagy tartalomkiegészítések  
- Visszafelé kompatibilis fejlesztések  
- További példák, eszközök vagy erőforrások  

#### Javító Verzió (X.Y.Z)  
- Hibajavítások és korrekciók  
- Kis mértékű fejlesztések meglévő tartalomban  
- Pontosítások és kisebb fejlesztések  

## Közösségi Visszajelzések és Javaslatok  

Aktívan ösztönözzük a közösség visszajelzéseit a tanulási erőforrás fejlesztéséhez:

### Hogyan Adj Visszajelzést  
- **GitHub Issues**: Problémák jelentése vagy fejlesztési javaslatok (AI-specifikus kérdések különösen szívesen)  
- **Discord Beszélgetések**: Ötletek megosztása és részvétel a Microsoft Foundry közösségben  
- **Pull Kérések**: Közvetlen fejlesztések hozzájárulása, különösen AI sablonok és útmutatók esetén  
- **Microsoft Foundry Discord**: Részvétel az #Azure csatornán AZD + AI témákban  
- **Közösségi Fórumok**: Szélesebb Azure fejlesztői beszélgetésekhez való csatlakozás  

### Visszajelzési Kategóriák  
- **AI Tartalom Pontossága**: AI szolgáltatás integráció és telepítési információk javításai  
- **Tanulási Élmény**: Javaslatok AI fejlesztői tanulási folyamat fejlesztésére  
- **Hiányzó AI Tartalom**: Kérések további AI sablonokra, mintákra vagy példákra  
- **Akadálymentesítés**: Fejlesztések a sokféle tanulói igény kiszolgálására  
- **AI Eszköz Integráció**: Javaslatok jobb AI fejlesztési munkafolyamat integrációra  
- **Éles AI Minták**: Vállalati AI telepítési minta kérések  

### Válaszadási Elkötelezettség  
- **Probléma Válaszadás**: 48 órán belül a jelentett problémákra  
- **Funkciókérések**: Egy héten belüli értékelés  
- **Közösségi Hozzájárulások**: Egy héten belüli átnézés  
- **Biztonsági Problémák**: Azonnali prioritás, gyors reagálás  

## Karbantartási Ütemterv  

### Rendszeres Frissítések  
- **Havi Felülvizsgálatok**: Tartalom pontosság és linkellenőrzés  
- **Negyedéves Frissítések**: Jelentős tartalmi bővítések és fejlesztések  
- **Féléves Átdolgozások**: Átfogó átszervezés és fejlesztés  
- **Éves Kiadások**: Főverzió frissítések jelentős fejlesztésekkel  

### Monitorozás és Minőségbiztosítás  
- **Automatizált Tesztelés**: Kódpéldák és hivatkozások rendszeres ellenőrzése  
- **Közösségi Visszajelzés Integrációja**: Felhasználói javaslatok folyamatos beépítése  
- **Technológiai Frissítések**: A legújabb Azure szolgáltatások és az azd kiadások tükrözése  
- **Akadálymentesítési Auditok**: Rendszeres felülvizsgálatok az inkluzív tervezési elvek érdekében  

## Verziótámogatási Szabályzat  

### Jelenlegi Verzió Támogatás  
- **Legújabb Főverzió**: Teljes támogatás rendszeres frissítésekkel  
- **Előző Főverzió**: Biztonsági frissítések és kritikus javítások 12 hónapig  
- **Régi Verziók**: Csak közösségi támogatás, hivatalos frissítések nélkül  

### Migrációs Útmutató  
Amikor főverziók jelennek meg, biztosítjuk:  
- **Migrációs Útmutatók**: Lépésenkénti átállási instrukciók  
- **Kompatibilitási Megjegyzések**: Törést okozó változások részletei  
- **Eszköztámogatás**: Migrációt segítő szkriptek vagy segédprogramok  
- **Közösségi Támogatás**: Dedikált fórumok migrációs kérdésekhez  

---

**Navigáció**  
- **Előző Lecke**: [Study Guide](resources/study-guide.md)  
- **Következő Lecke**: Vissza a [Fő README](README.md) -hez  

**Maradj naprakész**: Kövesd ezt a tárolót az új kiadások és a tananyagot érintő fontos frissítések értesítéseiért.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:  
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) használatával készült. Bár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Kritikus információk esetén szakmai emberi fordítást ajánlunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy helytelen értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->