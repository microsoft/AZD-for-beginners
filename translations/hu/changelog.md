# Változásnapló - AZD Kezdőknek

## Bevezetés

Ez a változásnapló dokumentálja az AZD Kezdőknek tároló minden jelentős változtatását, frissítését és fejlesztését. A szemantikus verziókezelés elveit követjük, és fenntartjuk ezt a naplót, hogy segítsük a felhasználókat megérteni, mi változott a verziók között.

## Tanulási Célok

A változásnapló áttekintésével Ön:
- Tájékozódik az új funkciókról és tartalomhozzáadásokól
- Megérti a meglévő dokumentáció fejlesztéseit
- Nyomon követi a hibajavításokat és korrekciókat a pontosság érdekében
- Követi a tananyagok fejlődését az idő során

## Tanulási Eredmények

A változásnapló bejegyzéseinek átnézése után képes lesz:
- Azonosítani az új tartalmakat és forrásokat a tanuláshoz
- Megérteni, mely szakaszok frissültek vagy javultak
- Megtervezni tanulási útját a legaktuálisabb anyagok alapján
- Visszajelzést és javaslatokat adni a jövőbeli fejlesztésekhez

## Verziótörténet

### [v3.19.1] - 2026-03-27

#### Kezdői Bevezető pontosítás, Beállítás érvényesítés és az utolsó AZD parancs gyorstisztítás
**Ez a verzió folytatja az AZD 1.23 érvényesítési átvizsgálást egy kezdőkre fókuszáló dokumentációs körrel: tisztázza az AZD első hitelesítési iránymutatást, helyi telepítés-ellenőrző szkripteket ad hozzá, ellenőrzi a kulcsparancsokat az élő AZD CLI-vel, és eltávolítja az utolsó elavult angol forrású parancs hivatkozásokat a változásnaplón kívül.**

#### Hozzáadva
- **🧪 Kezdői beállítás-ellenőrző szkriptek** `validate-setup.ps1` és `validate-setup.sh` segítségével, hogy a tanulók megerősíthessék a szükséges eszközöket az 1. fejezet megkezdése előtt
- **✅ Előzetes telepítés-ellenőrzési lépések** a gyökér README-ben és az 1. fejezet README-jében, hogy a hiányzó előfeltételek az `azd up` előtt észrevehetők legyenek

#### Módosítva
- **🔐 Kezdői hitelesítési útmutató** most már következetesen az `azd auth login` parancsot tekinti elsődlegesnek az AZD munkafolyamatokhoz, az `az login` opcionálisként van megjelölve, kivéve ha közvetlenül Azure CLI parancsokat használnak
- **📚 Az 1. fejezet bevezetési folyamata** most már a tanulókat arra irányítja, hogy a helyi telepítésüket ellenőrizzék az installáció, hitelesítés és első telepítés előtt
- **🛠️ Érvényesítő üzenetek** most világosan elkülönítik a blokkoló követelményeket az opcionális Azure CLI figyelmeztetésektől az AZD-only kezdői úton
- **📖 Konfigurációs, hibakeresési és példa dokumentumok** most elkülönítik a kötelező AZD hitelesítést az opcionális Azure CLI bejelentkezéstől, ahol előtte kontextus nélkül voltak bemutatva

#### Javítva
- **📋 Megmaradt angol forrású parancs hivatkozások** frissítve az aktuális AZD formákra, beleértve az `azd config show` parancsot a gyorsreferenciában és az `azd monitor --overview` parancsot, ahol az Azure Portal összefoglaló útmutatás volt szándékolt
- **🧭 Kezdői állítások az 1. fejezetben** enyhítve, hogy elkerüljék az összes sablonra és Azure erőforrásra érvényes hibamentes vagy visszagörgetés garantálását
- **🔎 Élő CLI validáció** megerősítette a jelenlegi támogatást az `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` és `azd down --force --purge` parancsokra

#### Frissített fájlok
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12 Érvényesítés, Workshop környezet bővítés és AI Modellfrissítés
**Ez a verzió az `azd` `1.23.12` verzióval végzett dokumentáció-ellenőrzést hajt végre, frissíti a elavult AZD parancs példákat, frissíti az AI modell útmutatásokat az aktuális alapértelmezettekre, és kiterjeszti a workshop utasításokat a GitHub Codespaces-en túl a fejlesztői konténerekre és helyi klónokra is.**

#### Hozzáadva
- **✅ Érvényesítési megjegyzések a fő fejezetek és workshop dokumentációk között**, hogy a vizsgált AZD alapverzió egyértelmű legyen a különböző CLI változatokat használó tanulók számára
- **⏱️ Telepítési időtúllépés iránymutatás** hosszú ideig futó AI alkalmazás telepítésekhez az `azd deploy --timeout 1800` használatával
- **🔎 Kiterjesztés ellenőrzési lépések** az AI munkafolyamat dokumentumban az `azd extension show azure.ai.agents` paranccsal
- **🌐 Szélesebb workshop környezeti iránymutatás** GitHub Codespaces, fejlesztői konténerek és helyi klónok támogatásával MkDocs használatával

#### Módosítva
- **📚 Fejezet bevezető README-k** most konzisztensen jelzik az `azd 1.23.12` érvényesítést az alapok, konfiguráció, infrastruktúra, multi-agent, előtelepítés, hibakeresés és termelési részekben
- **🛠️ AZD parancs hivatkozások** frissítve az aktuális formákra a dokumentációban:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` vagy `azd env get-value(s)` a kontextustól függően
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` ahol az Application Insights összefoglaló az irányadó
- **🧪 Telepítés előnézet példák** egyszerűsítve a jelenleg támogatott használatra, mint az `azd provision --preview` és `azd provision --preview -e production`
- **🧭 Workshop folyamat** frissítve, hogy a tanulók befejezhessék a laborokat Codespaces-ben, fejlesztői konténerben vagy helyi klónban, nem csak kizárólag Codespaces-re alapozva
- **🔐 Hitelesítési útmutatás** most előnyben részesíti az `azd auth login` használatát AZD munkafolyamatokhoz, az `az login` opcionális, ha közvetlenül Azure CLI parancsokat használnak

#### Javítva
- **🪟 Windows telepítési parancsok** egységesítve a jelenlegi `winget` csomagformázás szerint a telepítési útmutatóban
- **🐧 Linux telepítési útmutatás** javítva, hogy elkerülje az esetleg nem támogatott disztribúcióspecifikus `azd` csomagkezelő utasításokat és helyette a kiadási eszközökre irányítson ahol alkalmas
- **📦 AI modell példák** frissítve a régebbi alapértelmezett értékekről, mint `gpt-35-turbo` és `text-embedding-ada-002` az aktuális példákra, például `gpt-4.1-mini`, `gpt-4.1` és `text-embedding-3-large`
- **📋 Telepítési és diagnosztikai kódrészletek** javítva, hogy az aktuális környezeti és állapot parancsokat használják a naplókban, szkriptekben és hibakeresési lépésekben
- **⚙️ GitHub Actions útmutató** frissítve az `Azure/setup-azd@v1.0.0` verzióról az `Azure/setup-azd@v2` verzióra
- **🤖 MCP/Copilot beleegyezési útmutató** frissítve az `azd mcp consent` parancsról az `azd copilot consent list` parancsra

#### Fejlesztve
- **🧠 AI fejezet útmutatás** most jobban magyarázza az előnézet-érzékeny `azd ai` viselkedést, a bérlőspecifikus bejelentkezést, az aktuális kiterjesztés használatot és a frissített modell telepítési ajánlásokat
- **🧪 Workshop utasítások** most valósághűbb verzió példákat és világosabb környezeti beállítási nyelvezetet használnak a kézhezálló laborokhoz
- **📈 Termelés és hibakeresési dokumentumok** jobban igazodnak az aktuális monitorozási, visszaesési modell és költségszint példákhoz

#### Frissített fájlok
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### AZD AI CLI Parancsok, Tartalom Érvényesítés és Sablonbővítés
**Ez a verzió hozzáadja az `azd ai`, `azd extension` és `azd mcp` parancsok lefedettségét minden AI-hoz kapcsolódó fejezetben, javítja a törött linkeket és elavult kódokat az agents.md-ben, frissíti a gyorsreferenciát, és átdolgozza a Példa Sablonok részt érvényesített leírásokkal és új Azure AI AZD sablonokkal.**

#### Hozzáadva
- **🤖 AZD AI CLI lefedettség** 7 fájlban (korábban csak a 8. fejezetben):
  - `docs/chapter-01-foundation/azd-basics.md` — Új "Kiterjesztések és AI parancsok" rész az `azd extension`, `azd ai agent init` és `azd mcp` bevezetésével
  - `docs/chapter-02-ai-development/agents.md` — 4. opció: `azd ai agent init` összehasonlító táblázattal (sablon kontra manifest megközelítés)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — „AZD kiterjesztések a Foundryhez” és „Agent-első Telepítés” alfejezetek
  - `docs/chapter-05-multi-agent/README.md` — Gyorskezdés most mutat sablon és manifest alapú telepítési utakat is
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Telepítés szakasz most tartalmazza az `azd ai agent init` opciót
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — „AZD AI kiterjesztés parancsok diagnosztikához” alfejezet
  - `resources/cheat-sheet.md` — Új „AI és kiterjesztés parancsok” rész az `azd extension`, `azd ai agent init`, `azd mcp` és `azd infra generate` parancsokkal
- **📦 Új AZD AI példa sablonok** a `microsoft-foundry-integration.md`-ben:
  - **azure-search-openai-demo-csharp** — .NET RAG chat Blazor WebAssembly-vel, Semantic Kernel-lel és hangos csevegéstámogatással
  - **azure-search-openai-demo-java** — Java RAG chat Langchain4J-vel ACA/AKS telepítési opciókkal
  - **contoso-creative-writer** — Több ügynökös kreatív író alkalmazás Azure AI Agent Service-szel, Bing Groundinggel és Prompty-val
  - **serverless-chat-langchainjs** — Szerver nélküli RAG Azure Functions + LangChain.js + Cosmos DB és Ollama helyi fejlesztői támogatással
  - **chat-with-your-data-solution-accelerator** — Vállalati RAG gyorsító admin portállal, Teams integrációval és PostgreSQL/Cosmos DB opciókkal
  - **azure-ai-travel-agents** — Több ügynökös MCP orchestrációs referencia alkalmazás szerverekkel .NET, Python, Java és TypeScript nyelveken
  - **azd-ai-starter** — Minimalista Azure AI infrastruktúra Bicep kezdő sablon
  - **🔗 Klassz AZD AI Galéria link** — Hivatkozás az [awesome-azd AI galériára](https://azure.github.io/awesome-azd/?tags=ai) (80+ sablon)

#### Javítva
- **🔗 agents.md navigáció**: Előző/Következő linkek most már egyeznek a 2. fejezet README leckéinek sorrendjével (Microsoft Foundry Integráció → Ügynökök → AI modell telepítés)
- **🔗 agents.md törött linkek**: `production-ai-practices.md` javítva `../chapter-08-production/production-ai-practices.md`-re (3 előfordulás)
- **📦 agents.md elavult kódok**: `opencensus` helyett `azure-monitor-opentelemetry` + OpenTelemetry SDK használata
- **🐛 agents.md érvénytelen API**: `max_tokens` áthelyezve a `create_agent()`-ről a `create_run()`-ra `max_completion_tokens`-ként
- **🔢 agents.md token számlálás**: Kb. `len//4` becslés helyett `tiktoken.encoding_for_model()` használata
- **azure-search-openai-demo**: Szolgáltatások javítva „Cognitive Search + App Service”-ről „Azure AI Search + Azure Container Apps”-re (alapértelmezett host változás 2024 október)
- **contoso-chat**: Leírás frissítve, hogy utaljon Azure AI Foundry + Prompty, megfelel a repo tényleges címének és technológiai stack-jének

#### Eltávolítva
- **ai-document-processing**: Nem működő sablon hivatkozás eltávolítva (repo nem elérhető nyilvánosan AZD sablonként)

#### Fejlesztve

- **📝 agents.md gyakorlatok**: Az 1. gyakorlat most mutatja a várt kimenetet és az `azd monitor` lépést; a 2. gyakorlat teljes `FunctionTool` regisztrációs kódot tartalmaz; a 3. gyakorlat homályos útmutatás helyett konkrét `prepdocs.py` parancsokat ad meg  
- **📚 agents.md források**: Frissítve a dokumentációs linkek a jelenlegi Azure AI Agent Service dokumentációra és gyorsindításra  
- **📋 agents.md Következő lépések táblázat**: Hozzáadva az AI Workshop Lab link a teljes fejezet lefedettséghez  

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

#### Tanfolyam navigációs fejlesztés  
**Ez a verzió javítja a README.md fejezet navigációját egy továbbfejlesztett táblázatos formátummal.**

#### Változtatások  
- **Tanfolyam térkép táblázat**: Közvetlen leckelinkekkel, időbecsléssel és komplexitás értékeléssel bővítve  
- **Mappatakarítás**: Felesleges régi mappák eltávolítása (deployment/, getting-started/, pre-deployment/, troubleshooting/)  
- **Linkellenőrzés**: A Tanfolyam térkép táblázat összes 21+ belső linkje ellenőrizve  

### [v3.16.0] - 2026-02-05

#### Terméknév frissítések  
**Ez a verzió frissíti a termék hivatkozásokat a Microsoft jelenlegi márkázására.**

#### Változtatások  
- **Microsoft Foundry → Microsoft Foundry**: Minden hivatkozás frissítve a nem fordítandó fájlokban  
- **Azure AI Agent Service → Foundry Agents**: A szolgáltatás neve frissítve az aktuális márkázáshoz  

#### Frissített fájlok  
- `README.md` - Fő tanfolyam kezdőlap  
- `changelog.md` - Verziótörténet  
- `course-outline.md` - Tanfolyam felépítése  
- `docs/chapter-02-ai-development/agents.md` - AI ügynök útmutató  
- `examples/README.md` - Példák dokumentációja  
- `workshop/README.md` - Workshop kezdőlap  
- `workshop/docs/index.md` - Workshop index  
- `workshop/docs/instructions/*.md` - Az összes workshop utasítás fájl  

---

### [v3.15.0] - 2026-02-05

#### Főbb tárrendezési átalakítás: fejezet alapú mappanevek  
**Ez a verzió a dokumentációt dedikált fejezetmappákba szervezi át a jobb navigáció érdekében.**

#### Mappanevek átalakítása  
A régi mappák helyett fejezet-számozott mappák lettek:  
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`  
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`  
- `docs/deployment/` → `docs/chapter-04-infrastructure/`  
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`  
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`  
- Újként hozzáadva: `docs/chapter-05-multi-agent/`  

#### Fájl áthelyezések  
| Fájl | Korábbi hely | Új hely |  
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
- **📚 Fejezet README fájlok**: Minden fejezetmappában README.md létrehozva, amely tartalmazza:  
  - Tanulási célokat és időtartamot  
  - Lecke táblázat leírásokkal  
  - Gyorsindítási parancsok  
  - Navigáció más fejezetekhez  

#### Változtatások  
- **🔗 Minden belső link frissítve**: Több mint 78 elérési út változva az összes dokumentációs fájlban  
- **🗺️ Fő README.md**: Tanfolyam térkép frissítve az új fejezetszerkezetnek megfelelően  
- **📝 examples/README.md**: Kereszt-hivatkozások frissítve fejezetmappákra  

#### Eltávolítva  
- Régi mappaszerkezet (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)  

---

### [v3.14.0] - 2026-02-05

#### Tárrendezési átalakítás: fejezet navigáció  
**Ez a verzió fejezeti navigációs README fájlokat adott hozzá (felülírva a v3.15.0 által).**

---

### [v3.13.0] - 2026-02-05

#### Új AI Ügynök Útmutató  
**Ez a verzió egy átfogó útmutatót ad hozzá AI ügynökök telepítéséhez az Azure Developer CLI-vel.**

#### Hozzáadva  
- **🤖 docs/microsoft-foundry/agents.md**: Teljes útmutató, amely lefedi:  
  - Mi az AI ügynök és miben különbözik a chatbotoktól  
  - Három gyorsindítási ügynök sablon (Foundry Agents, Prompty, RAG)  
  - Ügynök architektúra minták (egyedi ügynök, RAG, többügynök)  
  - Eszköz konfiguráció és testreszabás  
  - Monitorozás és mérőszám követés  
  - Költség szempontok és optimalizálás  
  - Gyakori hibakeresési forgatókönyvek  
  - Három gyakorlati feladat siker-kritériumokkal  

#### Tartalmi struktúra  
- **Bevezetés**: Alapfogalmak kezdőknek  
- **Gyorsindítás**: Ügynök telepítése `azd init --template get-started-with-ai-agents` paranccsal  
- **Architektúra Minták**: Ügynök minták vizuális diagramjai  
- **Konfiguráció**: Eszköz beállítása és környezeti változók  
- **Monitorozás**: Application Insights integráció  
- **Gyakorlatok**: Fokozatos, kézzelfogható tanulás (20-45 perc/gyakorlat)  

---

### [v3.12.0] - 2026-02-05

#### DevContainer környezet frissítés  
**Ez a verzió frissíti a fejlesztői konténer konfigurációt modern eszközökkel és jobb alapbeállításokkal az AZD tanulási élményhez.**

#### Változtatások  
- **🐳 Alapkép**: Frissítve `python:3.12-bullseye`-ről `python:3.12-bookworm`-re (legfrissebb Debian stabil)  
- **📛 Konténer név**: Átnevezve "Python 3"-ról "AZD for Beginners"-re az egyértelműségért  

#### Hozzáadva  
- **🔧 Új Dev Container funkciók**:  
  - `azure-cli` Bicep támogatással  
  - `node:20` (AZD sablonokhoz LTS verzió)  
  - `github-cli` sablonkezeléshez  
  - `docker-in-docker` konténer alkalmazás telepítéshez  

- **🔌 Porttovábbítás**: Előre konfigurált portok gyakori fejlesztéshez:  
  - 8000 (MkDocs előnézet)  
  - 3000 (Webalkalmazások)  
  - 5000 (Python Flask)  
  - 8080 (API-k)  

- **🧩 Új VS Code kiterjesztések**:  
  - `ms-python.vscode-pylance` - Fejlett Python IntelliSense  
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions támogatás  
  - `ms-azuretools.vscode-docker` - Docker támogatás  
  - `ms-azuretools.vscode-bicep` - Bicep nyelv támogatás  
  - `ms-azure-devtools.azure-resource-groups` - Azure erőforrás kezelés  
  - `yzhang.markdown-all-in-one` - Markdown szerkesztés  
  - `DavidAnson.vscode-markdownlint` - Markdown lintelés  
  - `bierner.markdown-mermaid` - Mermaid diagram támogatás  
  - `redhat.vscode-yaml` - YAML támogatás (azure.yaml-hoz)  
  - `eamodio.gitlens` - Git vizualizáció  
  - `mhutchie.git-graph` - Git történet  

- **⚙️ VS Code beállítások**: Alapértelmezett beállítások Python interpreterhez, mentéskor formázás, és szóközök eltávolítása  

- **📦 requirements-dev.txt frissítve**:  
  - Hozzáadva MkDocs minify plugin  
  - Hozzáadva pre-commit kódminőséghez  
  - Hozzáadva Azure SDK csomagok (azure-identity, azure-mgmt-resource)  

#### Javítva  
- **Post-Create parancs**: Most ellenőrzi az AZD és az Azure CLI telepítését konténer indításkor  

---

### [v3.11.0] - 2026-02-05

#### Kezdőbarát README átdolgozás  
**Ez a verzió jelentősen javítja a README.md-t a kezdők számára és fontos forrásokat ad AI fejlesztőknek.**

#### Hozzáadva  
- **🆚 Azure CLI vs AZD Összehasonlítás**: Egyértelmű magyarázat mikor melyik eszközt használjuk gyakorlati példákkal  
- **🌟 Szuper AZD Linkek**: Közvetlen linkek közösségi sablon galériához és hozzájárulási forrásokhoz:  
  - [Awesome AZD Galéria](https://azure.github.io/awesome-azd/) - 200+ készen telepíthető sablon  
  - [Sablon beküldése](https://github.com/Azure/awesome-azd/issues) - Közösségi hozzájárulás  
- **🎯 Gyorsindítási Útmutató**: Egyszerűsített 3 lépéses kezdő rész (Telepítés → Bejelentkezés → Telepítés)  
- **📊 Tapasztalat alapú navigációs táblázat**: Egyértelmű iránymutatás, honnan érdemes indítani fejlesztői tapasztalat függvényében  

#### Változtatások  
- **README struktúra**: Átszerkesztve folyamatos információkiadás szerint – kulcs információk elöl  
- **Bevezető rész**: Újravezetve, magyarázva az „`azd up` varázsát” teljes kezdőknek  
- **Duplikált tartalom eltávolítva**: Hibakeresési szekcióból párhuzamos rész törölve  
- **Hibakeresési parancsok**: Javítva az `azd logs` hivatkozás `azd monitor --logs`-ra  

#### Javítva  
- **🔐 Hitelesítési parancsok**: Hozzáadva `azd auth login` és `azd auth logout` a cheat-sheet.md-hez  
- **Érvénytelen parancs hivatkozások**: Kitörölve az összes maradék `azd logs` hivatkozás a README hibakeresési szekcióból  

#### Megjegyzések  
- **Hatókör**: Változások a fő README.md-re és resources/cheat-sheet.md-re vonatkoznak  
- **Célközönség**: Kifejezetten AZD-ben új fejlesztők számára készült fejlesztések  

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI parancs pontosság frissítés  
**Ez a verzió javítja az érvénytelen AZD parancsokat a dokumentációban, biztosítva, hogy minden példában valódi Azure Developer CLI szintaxis legyen használva.**

#### Javítva  
- **🔧 Nem létező AZD parancsok eltávolítva**: Átfogó ellenőrzés és javítás érvénytelen parancsok esetén:  
  - `azd logs` (nem létezik) → `azd monitor --logs` vagy Azure CLI alternatívákra cserélve  
  - `azd service` alparancsok (nem léteznek) → `azd show` és Azure CLI választható  
  - `azd infra import/export/validate` (nem létezik) → eltávolítva vagy érvényes alternatívára cserélve  
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` kapcsolók (nem léteznek) → eltávolítva  
  - `azd provision --what-if/--rollback` kapcsolók (nem léteznek) → `--preview` használata  
  - `azd config validate` (nem létezik) → `azd config list`-re cserélve  
  - `azd info`, `azd history`, `azd metrics` (nem léteznek) → eltávolítva  

- **📚 Parancs javításokkal frissített állományok**:  
  - `resources/cheat-sheet.md`: Parancs referencia teljes átdolgozása  
  - `docs/deployment/deployment-guide.md`: Rollback és telepítési stratégiák javítása  
  - `docs/troubleshooting/debugging.md`: Naplóelemzési részek javítása  
  - `docs/troubleshooting/common-issues.md`: Hibakeresési parancsok frissítve  
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD debug szekció javítása  
  - `docs/getting-started/azd-basics.md`: Monitorozási parancsok javítása  
  - `docs/getting-started/first-project.md`: Monitorozási és hibakeresési példák javítása  
  - `docs/getting-started/installation.md`: Segítség és verzió példák javítása  
  - `docs/pre-deployment/application-insights.md`: Napló megtekintési parancsok javítása  
  - `docs/pre-deployment/coordination-patterns.md`: Ügynök hibakeresési parancsok javítása  

- **📝 Verzió hivatkozás frissítve**:  
  - `docs/getting-started/installation.md`: Fix `1.5.0` verzió helyett `1.x.x` általános verzió és link a kiadásokhoz  

#### Változtatások  
- **Rollback stratégiák**: Dokumentáció frissítve Git-alapú rollback támogatásra (az AZD natív rollback nélkül)  
- **Napló megtekintés**: `azd logs` hivatkozások helyett `azd monitor --logs`, `azd monitor --live` és az Azure CLI parancsok használata  
- **Teljesítmény szekció**: Nem létező párhuzamos/incrementális telepítési kapcsolók eltávolítása, helyett érvényes alternatívák megadása  

#### Technikai részletek
- **Érvényes AZD parancsok**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Érvényes azd monitor kapcsolók**: `--live`, `--logs`, `--overview`
- **Eltávolított funkciók**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Megjegyzések
- **Ellenőrzés**: Parancsok az Azure Developer CLI v1.23.x alapján lettek validálva

---

### [v3.9.0] - 2026-02-05

#### Műhely befejezése és dokumentáció minőségfrissítés
**Ez a verzió befejezi az interaktív műhely modulokat, kijavít minden törött dokumentációs linket, és javítja az általános tartalom minőségét az AI fejlesztők számára, akik a Microsoft AZD-t használják.**

#### Hozzáadott
- **📝 CONTRIBUTING.md**: Új hozzájárulási irányelvek dokumentum, amely tartalmazza:
  - Egyértelmű útmutatást hibajelentéshez és változtatásjavaslatokhoz
  - Dokumentációs szabványokat az új tartalomhoz
  - Kódpéldák irányelveit és commit üzenet konvenciókat
  - Közösségi részvételi információkat

#### Befejezett
- **🎯 Műhely Modul 7 (Összegzés)**: Teljesen befejezett összegző modul, amely tartalmazza:
  - Átfogó összegzést a műhely eredményeiről
  - AZD, sablonok és Microsoft Foundry kulcsfontosságú fogalmak szekciója
  - Tanulási út folytatására vonatkozó ajánlásokat
  - Műhely kihívás gyakorlatokat nehézségi szintekkel
  - Közösségi visszajelzési és támogatási linkeket

- **📚 Műhely Modul 3 (Szétszedés)**: Frissített tanulási célokkal:
  - GitHub Copilot aktiválása MCP szerverekkel
  - AZD sablon mappaszerkezet megértése
  - Infrastrukturális kód (Bicep) szervezési minták
  - Gyakorlati labor útmutatók

- **🔧 Műhely Modul 6 (Bontás)**: Befejezett:
  - Erőforrás takarítás és költségkezelési célok
  - `azd down` használata biztonságos infrastruktúra leállításhoz
  - Soft-delete cognitive service-ek visszaállítási útmutatója
  - Bónusz felfedezési ötletek GitHub Copilot és Azure Portal használatához

#### Javított
- **🔗 Törött linkek javítása**: Több mint 15 belső dokumentációs hivatkozás javítva:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md elérési utak javítva
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md és production-ai-practices.md helyesbítve
  - `docs/getting-started/first-project.md`: nem létező cicd-integration.md helyett deployment-guide.md
  - `examples/retail-scenario.md`: FAQ és hibaelhárítási útmutató linkek javítva
  - `examples/container-app/microservices/README.md`: kurzus kezdőoldal és deployment guide elérési utak javítva
  - `resources/faq.md` és `resources/glossary.md`: AI fejezet hivatkozások frissítve
  - `course-outline.md`: oktató útmutató és AI műhely labor hivatkozások javítva

- **📅 Műhely állapot banner**: "Folyamatban" helyett aktív státusz, dátum frissítve 2026 februárra

- **🔗 Műhely navigáció**: `README.md` hibás navigációs link javítva a nem létező lab-1-azd-basics mappára mutatva

#### Változtatott
- **Műhely bemutató**: Eltávolítva a „felépítés alatt áll” figyelmeztetés, a műhely teljes és használatra kész
- **Navigáció konzisztencia**: Minden műhely modul egymáshoz navigációja helyes
- **Tanulási út hivatkozások**: fejezet kereszt-hivatkozások frissítve microsoft-foundry helyes utakra

#### Validált
- ✅ Minden angol nyelvű markdown fájl érvényes belső linkekkel rendelkezik
- ✅ Műhely modulok 0-tól 7-ig teljesek tanulási célokkal
- ✅ Fejezetek és modulok közötti navigáció megfelelő
- ✅ A tartalom alkalmas AI fejlesztők számára Microsoft AZD-vel
- ✅ Kezdők számára érthető nyelvezet és szerkezet
- ✅ CONTRIBUTING.md világos útmutatást ad a közösségi hozzájárulók részére

#### Műszaki megvalósítás
- **Link-validálás**: Automata PowerShell szkript ellenőrizte az összes .md belső linket
- **Tartalmi audit**: Manuális áttekintés a műhely teljességéről és kezdőbarát mivoltáról
- **Navigációs rendszer**: Egységes fejezet és modul navigációs minták alkalmazva

#### Megjegyzések
- **Hatókör**: Változtatások kizárólag az angol dokumentációra vonatkoznak
- **Fordítások**: Fordítási mappák nem frissültek ebben a verzióban (automatizált fordítás később szinkronizálódik)
- **Műhely időtartama**: A teljes műhely most 3-4 óra gyakorlati tanulást biztosít

---

### [v3.8.0] - 2025-11-19

#### Haladó dokumentáció: Monitorozás, biztonság és több ügynökös minták
**Ez a verzió átfogó, A-minőségű leckéket ad hozzá az Application Insights integrációról, hitelesítési mintákról és több ügynökös koordinációról gyártási környezetekhez.**

#### Hozzáadott
- **📊 Application Insights integráció lecke** a `docs/pre-deployment/application-insights.md` fájlban:
  - AZD központú telepítés automatikus előkészítéssel
  - Teljes Bicep sablonok Application Insights + Log Analytics-hez
  - Működő Python alkalmazások egyéni telemetriával (1,200+ sor)
  - AI/LLM monitorozási minták (Microsoft Foundry Models token/költség nyomon követése)
  - 6 Mermaid diagram (architektúra, elosztott követés, telemetria folyam)
  - 3 gyakorlati feladat (riasztások, dashboardok, AI figyelés)
  - Kusto lekérdezés példák és költség optimalizálási stratégiák
  - Élő metrikák folyamat streaming és valós idejű hibakeresés
  - 40-50 perces tanulási idő, gyártásra kész mintákkal

- **🔐 Hitelesítés és biztonsági minták lecke** a `docs/getting-started/authsecurity.md` fájlban:
  - 3 hitelesítési minta (kapcsolati karakterláncok, Key Vault, kezelt identitás)
  - Teljes Bicep infrastruktúra sablonok biztonságos telepítéshez
  - Node.js alkalmazáskód Azure SDK integrációval
  - 3 komplett gyakorlat (kezelt identitás engedélyezése, felhasználó által hozzárendelt identitás, Key Vault kulcs forgatás)
  - Biztonsági legjobb gyakorlatok és RBAC konfigurációk
  - Hibakeresési útmutató és költségelemzés
  - Gyártásra kész jelszó nélküli hitelesítési minták

- **🤖 Több ügynök koordinációs minták lecke** a `docs/pre-deployment/coordination-patterns.md` állományban:
  - 5 koordinációs minta (sorrend, párhuzamos, hierarchikus, esemény-vezérelt, konszenzus)
  - Teljes orchestrator szolgáltatás implementáció (Python/Flask, 1,500+ sor)
  - 3 speciális ügynök megvalósítás (Kutató, Író, Szerkesztő)
  - Service Bus integráció üzenetsorozáshoz
  - Cosmos DB állapotkezelés elosztott rendszerekhez
  - 6 Mermaid diagram az ügynök interakciókról
  - 3 haladó gyakorlat (időtúllépés kezelése, újrapróbálkozási logika, áramkörmegszakító)
  - Költség részletezés ($240-565/hó) optimalizálási javaslatokkal
  - Application Insights integráció monitorozáshoz

#### Javított
- **Előtelepítési fejezet**: Most átfogó monitorozási és koordinációs mintákat tartalmaz
- **Első lépések fejezet**: Bővítve professzionális hitelesítési mintákkal
- **Gyártásra kész állapot**: Teljes lefedettség a biztonságtól az observabilitásig
- **Tanfolyam vázlat**: Frissítve az új leckék hivatkozásával a 3. és 6. fejezetben

#### Változtatott
- **Tanulási sorrend**: Jobb integráció a biztonság és monitorozás területén az egész tanfolyamon
- **Dokumentáció minőség**: Folyamatos A-minőségű sztenderdek (95-97%) az új leckékben
- **Gyártási minták**: Teljes végponttól végpontig lefedettség vállalati telepítésekhez

#### Fejlesztett
- **Fejlesztői élmény**: Világos út a fejlesztéstől a gyártási monitorozásig
- **Biztonsági szabványok**: Professzionális minták hitelesítéshez és titokkezeléshez
- **Observabilitás**: Teljes Application Insights integráció AZD-vel
- **AI munkaterhelések**: Speciális monitorozás Microsoft Foundry Models és több ügynökös rendszerekhez

#### Validált
- ✅ Minden lecke teljes működő kódot tartalmaz (nem csak töredék)
- ✅ Mermaid diagramok a vizuális tanuláshoz (összesen 19 három leckében)
- ✅ Gyakorlati feladatok ellenőrző lépésekkel (összesen 9)
- ✅ Gyártásra kész Bicep sablonok, melyek `azd up`-pal telepíthetők
- ✅ Költségelemzés és optimalizációs stratégiák
- ✅ Hibakeresési útmutatók és legjobb gyakorlatok
- ✅ Tudásellenőrző parancsokkal

#### Dokumentáció értékelés eredmények
- **docs/pre-deployment/application-insights.md**: Átfogó monitorozási útmutató
- **docs/getting-started/authsecurity.md**: Professzionális biztonsági minták
- **docs/pre-deployment/coordination-patterns.md**: Haladó több ügynök architektúrák
- **Új tartalom összesen**: Folyamatos magas minőségi szabványok

#### Műszaki megvalósítás
- **Application Insights**: Log Analytics + egyéni telemetria + elosztott követés
- **Hitelesítés**: Kezelt identitás + Key Vault + RBAC minták
- **Több ügynök**: Service Bus + Cosmos DB + Container Apps + orchestráció
- **Monitorozás**: Élő metrikák + Kusto lekérdezések + riasztások + dashboardok
- **Költségmenedzsment**: Mintavétel, megőrzési szabályok, költségvetési kontrollok

### [v3.7.0] - 2025-11-19

#### Dokumentáció minőségjavítás és új Microsoft Foundry Models példa
**Ez a verzió javítja a dokumentáció minőségét a teljes tárhelyen és hozzáad egy teljes Microsoft Foundry Models telepítési példát gpt-4.1 chat interfésszel.**

#### Hozzáadott
- **🤖 Microsoft Foundry Models chat példa**: Teljes gpt-4.1 telepítés működő implementációval a `examples/azure-openai-chat/` mappában:
  - Teljes Microsoft Foundry Models infrastruktúra (gpt-4.1 modell telepítés)
  - Python parancssori chat felület beszélgetési előzményekkel
  - Key Vault integráció biztonságos API kulcs tároláshoz
  - Token használat követése és költségbecslés
  - Rate limitálás és hibakezelés
  - Átfogó README 35-45 perces telepítési útmutatóval
  - 11 gyártásra kész fájl (Bicep sablonok, Python app, konfiguráció)
- **📚 Dokumentációs gyakorlatok**: Gyakorlati feladatok hozzáadva a konfigurációs útmutatóhoz:
  - Feladat 1: Több környezet konfiguráció (15 perc)
  - Feladat 2: Titokkezelési gyakorlat (10 perc)
  - Egyértelmű siker-kritériumok és ellenőrző lépések
- **✅ Telepítés ellenőrzése**: Ellenőrzési szakasz a telepítési útmutatóhoz:
  - Állapotellenőrzési lépések
  - Siker kritériumok listája
  - Várt kimenetek minden telepítési parancshoz
  - Gyors hibaelhárítási referencia

#### Javított
- **examples/README.md**: Frissítve A-minőségűre (93%):
  - azure-openai-chat hozzáadva minden megfelelő szekcióhoz
  - Helyi példák száma 3-ról 4-re nőtt
  - AI alkalmazás példák táblázatához hozzáadva
  - Középhaladóknak készült gyors indulási útmutatóba integrált
  - Microsoft Foundry sablonok részhez hozzáfűzve
  - Összehasonlító mátrix és technológia keresési szekciók frissítve
- **Dokumentáció minőség**: B+ (87%) → A- (92%) javult a docs mappában:
  - Kritikus parancspéldák várt kimenetekkel bővítve
  - Konfigurációs változtatásokhoz ellenőrző lépések beillesztve
  - Gyakorlati tanulás fejlesztve

#### Változtatott
- **Tanulási folyamat**: AI példák jobb integrálása középhaladó tanulóknak
- **Dokumentáció szerkezete**: Több gyakorlati feladat és egyértelmű eredmények
- **Ellenőrzési folyamat**: Kiemelt siker kritériumok a kulcsfolyamatokhoz

#### Fejlesztett
- **Fejlesztői élmény**: Microsoft Foundry Models telepítés 35-45 perc alatt (szemben a 60-90 perces alternatívákkal)
- **Költségátláthatóság**: Egyértelmű költségbecslések ($50-200/hó) a Microsoft Foundry Models példánál
- **Tanulási útvonal**: AI fejlesztők világos belépési pontot kapnak azure-openai-chat segítségével
- **Dokumentációs szabványok**: Folyamatos várt kimenetek és ellenőrző lépések alkalmazása

#### Validált
- ✅ Microsoft Foundry Models példa teljesen működőképes `azd up` parancsal
- ✅ Minden 11 megvalósítási fájl szintaktikailag helyes
- ✅ README utasítások megfelelnek a valós telepítési élménynek
- ✅ Dokumentációs linkek nyolc+ helyen frissítve
- ✅ Példa index pontosan 4 helyi példát tartalmaz
- ✅ Nincsenek duplikált külső linkek a táblázatokban
- ✅ Minden navigációs hivatkozás helyes

#### Műszaki megvalósítás
- **Microsoft Foundry Models architektúra**: gpt-4.1 + Key Vault + Container Apps minta
- **Biztonság**: Kezelt identitással készen, titkok Key Vault-ban
- **Monitorozás**: Application Insights integráció
- **Költség menedzsment**: Token követés és használat optimalizálása
- **Telepítés**: Egyetlen `azd up` parancs a teljes beállításhoz

### [v3.6.0] - 2025-11-19

#### Jelentős frissítés: Container App telepítési példák
**Ez a verzió bemutat átfogó, gyártásra kész konténeres alkalmazás telepítési példákat Azure Developer CLI-vel (AZD), teljes dokumentációval és beépítve a tanulási útvonalba.**

#### Hozzáadott
- **🚀 Container App példák**: Új helyi példák a `examples/container-app/` mappában:
  - [Fő útmutató](examples/container-app/README.md): Teljes áttekintés konténeres telepítésekről, gyors indulás, gyártás és haladó minták
  - [Egyszerű Flask API](../../examples/container-app/simple-flask-api): Kezdőbarát REST API skálázódással nullára, egészség probe-okkal, monitorozással és hibakereséssel
  - [Microservices architektúra](../../examples/container-app/microservices): Gyártásra kész több szolgáltatásos telepítés (API Gateway, Termék, Rendelés, Felhasználó, Értesítés), aszinkron üzenetküldés, Service Bus, Cosmos DB, Azure SQL, elosztott követés, blue-green/canary telepítés
- **Legjobb gyakorlatok**: Biztonság, monitorozás, költségoptimalizáció és CI/CD útmutatás konténeres munkaterhelésekhez
- **Kódminták**: Teljes `azure.yaml`, Bicep sablonok és több nyelvű szolgáltatás implementációk (Python, Node.js, C#, Go)
- **Tesztelés és hibakeresés**: End-to-end teszt forgatókönyvek, monitorozó parancsok, hibakeresési útmutató

#### Változtatott
- **README.md**: Frissítve, hogy új tárolóalkalmazás példákat mutasson be és azokra hivatkozzon a „Helyi példák – Konténer alkalmazások” alatt
- **examples/README.md**: Frissítve a tárolóalkalmazás példák kiemeléséhez, összehasonlító mátrix bejegyzések hozzáadásához és technológia/architektúra hivatkozások frissítéséhez
- **Tanfolyam vázlat és tanulmányi útmutató**: Frissítve új tárolóalkalmazás példákra és telepítési mintákra való hivatkozásokkal az érintett fejezetekben

#### Ellenőrizve
- ✅ Minden új példa telepíthető az `azd up` paranccsal és követi a legjobb gyakorlatokat
- ✅ Dokumentáció kereszthivatkozások és navigáció frissítve
- ✅ A példák a kezdőtől a haladó felhasználói szintig fedik le az eseteket, beleértve a termelési mikroszolgáltatásokat is

#### Megjegyzések
- **Hatókör**: Csak angol dokumentáció és példák
- **Következő lépések**: Későbbi kiadásokban újabb haladó tárolóminták és CI/CD automatizálás bővítése

### [v3.5.0] - 2025-11-19

#### Termék újra márkázás: Microsoft Foundry
**Ez a verzió átfogó terméknév változtatást hajt végre „Microsoft Foundry” névre az összes angol dokumentációban, tükrözve a Microsoft hivatalos újra márkázását.**

#### Változtatások
- **🔄 Terméknév frissítés**: Teljes átnevezés „Microsoft Foundry”-ra
  - Minden hivatkozás frissítve az angol `docs/` mappában
  - Mappa átnevezése: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Fájl átnevezése: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Összesen 23 tartalmi hivatkozás frissítve 7 dokumentációs fájlban

- **📁 Mappastruktúra változások**:
  - `docs/ai-foundry/` átnevezve `docs/microsoft-foundry/`-ra
  - Minden kereszt hivatkozás frissítve az új mappastruktúrának megfelelően
  - Navigációs linkek validálva az összes dokumentációban

- **📄 Fájl átnevezések**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Minden belső hivatkozás frissítve az új fájlnévre

#### Frissített fájlok
- **Fejezet dokumentációk** (7 fájl):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigációs link frissítve
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 terméknév hivatkozás frissítve
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Már használja a Microsoft Foundry-t (korábbi frissítésekből)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 hivatkozás frissítve (áttekintés, közösségi visszajelzés, dokumentáció)
  - `docs/getting-started/azd-basics.md` - 4 kereszt hivatkozás frissítve
  - `docs/getting-started/first-project.md` - 2 fejezeti navigációs link frissítve
  - `docs/getting-started/installation.md` - 2 következő fejezet link frissítve
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 hivatkozás frissítve (navigáció, Discord közösség)
  - `docs/troubleshooting/common-issues.md` - 1 navigációs link frissítve
  - `docs/troubleshooting/debugging.md` - 1 navigációs link frissítve

- **Tanfolyam szerkezeti fájlok** (2 fájl):
  - `README.md` - 17 hivatkozás frissítve (tanfolyam áttekintés, fejezetcímek, sablon szakasz, közösségi betekintések)
  - `course-outline.md` - 14 hivatkozás frissítve (áttekintés, tanulási célok, fejezeti erőforrások)

#### Ellenőrizve
- ✅ Nincs több „ai-foundry” mappaút hivatkozás az angol dokumentációban
- ✅ Nincs több „Microsoft Foundry” terméknév hivatkozás az angol dokumentációban
- ✅ Minden navigációs link működik az új mappastruktúrával
- ✅ Fájl- és mappanév átnevezések sikeresen végrehajtva
- ✅ Kereshivatkozások fejezetek között validálva

#### Megjegyzések
- **Hatókör**: Csak a `docs/` mappában angol dokumentációra alkalmazva
- **Fordítások**: A `translations/` mappa nem frissült ebben a verzióban
- **Workshop**: A `workshop/` anyagok nem frissültek ebben a verzióban
- **Példák**: Példafájlok lehet, hogy még régi nevezéktant használnak (későbbi frissítés tárgya)
- **Külső hivatkozások**: Külső URL-ek és GitHub tároló hivatkozások változatlanok maradnak

#### Migrációs útmutató közreműködőknek
Ha helyi ágak vagy dokumentációk hivatkoznak a régi struktúrára:
1. Frissítse a mappa hivatkozásokat: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Frissítse a fájl hivatkozásokat: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Cserélje le a terméknevet: „Microsoft Foundry” → „Microsoft Foundry”
4. Ellenőrizze, hogy minden belső dokumentációs link működik

---

### [v3.4.0] - 2025-10-24

#### Infrastruktúra előnézet és validáció fejlesztések
**Ez a verzió átfogó támogatást vezet be az új Azure Developer CLI előnézeti funkcióhoz, és javítja a workshop felhasználói élményét.**

#### Hozzáadott
- **🧪 azd provision --preview funkció dokumentációja**: Átfogó leírás az új infrastruktúra előnézet képességről
  - Parancs hivatkozás és használati példák a cheat sheet-ben
  - Részletes integráció a telepítési útmutatóban esettanulmányokkal és előnyökkel
  - Előzetes ellenőrzés integráció a biztonságosabb telepítéshez
  - Kezdő útmutató frissítések a biztonságos telepítési gyakorlatokkal
- **🚧 Workshop állapot banner**: Professzionális HTML banner a workshop fejlesztési állapotának jelzésére
  - Gradiens dizájn és építés jelzők a felhasználók tájékoztatására
  - Utolsó frissítés időbélyeggel a transzparencia érdekében
  - Mobilbarát dizájn minden eszköztípushoz

#### Fejlesztett
- **Infrastruktúra biztonság**: Az előnézeti funkció integrálva a telepítési dokumentációkba
- **Telepítés előtti validáció**: Automatikus szkriptek immár infrastruktúra előnézet teszteléssel bővítve
- **Fejlesztői munkafolyamat**: Frissített parancssorozatok az előnézet használatával mint legjobb gyakorlat
- **Workshop élmény**: Egyértelmű felhasználói elvárások a fejlesztés állapotáról

#### Módosított
- **Telepítési legjobb gyakorlatok**: Előnézet elsőként munkafolyamat most ajánlott megközelítés
- **Dokumentációs folyamat**: Infrastrukturális validáció korábbi szakaszba emelése a tanulás során
- **Workshop bemutatás**: Professzionális státusz kommunikáció, világos fejlesztési ütemtervvel

#### Javított
- **Biztonság központú megközelítés**: Infrastrukturális változások előzetes validálhatósága telepítés előtt
- **Csapat együttműködés**: Előnézeti eredmények megoszthatók véleményezésre és jóváhagyásra
- **Költségtudatosság**: Jobb erőforrásköltség megértés telepítés előtt
- **Kockázat csökkentése**: Telepítési hibák csökkenése előzetes ellenőrzéssel

#### Technikai megvalósítás
- **Több dokumentum integráció**: Előnézeti funkció dokumentálva 4 kulcsfontosságú fájlban
- **Parancsminták**: Következetes szintaxis és példák minden dokumentációban
- **Legjobb gyakorlat integráció**: Előnézet beépítve az ellenőrző munkafolyamatokba és szkriptekbe
- **Vizuális jelölők**: ÚJ funkció világos jelölése a könnyű felismeréshez

#### Workshop infrastruktúra
- **Állapot kommunikáció**: Professzionális HTML banner gradiens stílusban
- **Felhasználói élmény**: Egyértelmű fejlesztési státusz megelőzi a félreértéseket
- **Professzionális bemutatás**: Megőrzi a tárház hitelességét és beállítja az elvárásokat
- **Idővonal átláthatóság**: 2025 októberi utolsó frissítés időbélyeg a felelősség miatt

### [v3.3.0] - 2025-09-24

#### Fejlesztett workshop anyagok és interaktív tanulási élmény
**Ez a verzió átfogó workshop anyagokat vezet be böngészőben futtatható interaktív útmutatókkal és strukturált tanulási utak kialakításával.**

#### Hozzáadott
- **🎥 Interaktív workshop útmutató**: Böngésző-alapú workshop élmény MkDocs előnézeti képességgel
- **📝 Strukturált workshop használati útmutatók**: 7 lépéses útmutató tanulási út a felfedezéstől az testreszabásig
  - 0-Bevezetés: Workshop áttekintés és beállítás
  - 1-AI-sablon kiválasztása: Sablon felfedezés és választási folyamat
  - 2-AI-sablon validálása: Telepítési és ellenőrzési eljárások
  - 3-AI-sablon lebontása: Sablon architektúra megértése
  - 4-AI-sablon konfigurálása: Beállítások és testreszabás
  - 5-AI-sablon testreszabása: Haladó módosítások és iterációk
  - 6-Infrastruktúra bontás: Takarítás és erőforrás kezelés
  - 7-Összefoglalás: Összegzés és további lépések
- **🛠️ Workshop eszközök**: MkDocs konfiguráció Material témával a jobb tanulási élményért
- **🎯 Gyakorlati tanulási út**: 3 lépéses módszertan (Felfedezés → Telepítés → Testreszabás)
- **📱 GitHub Codespaces integráció**: Zökkenőmentes fejlesztői környezet beállítás

#### Fejlesztett
- **AI workshop labor**: Kiterjesztett 2-3 órás strukturált tanulási élménnyel
- **Workshop dokumentáció**: Professzionális bemutatás navigációval és vizuális segédletekkel
- **Tanulási folyamat**: Lépésenkénti útmutatás a sablon kiválasztástól a termelési telepítésig
- **Fejlesztői élmény**: Integrált eszközök a gördülékeny fejlesztési munkafolyamatokhoz

#### Javított
- **Hozzáférhetőség**: Böngészőalapú felület kereséssel, másolási funkcióval és téma váltóval
- **Önkiszolgáló tanulás**: Rugalmas workshop struktúra különböző tanulási tempóknak
- **Gyakorlati alkalmazás**: Valós AI sablon telepítési példák
- **Közösségi integráció**: Discord támogatás workshophoz és együttműködéshez

#### Workshop funkciók
- **Beépített keresés**: Gyors kulcsszó és leckefelfedezés
- **Kódblokkok másolása**: Egér fölé húzva másolási funkció minden kódpéldánál
- **Téma váltó**: Sötét/világos mód támogatás különböző preferenciákhoz
- **Vizuális eszközök**: Képernyőképek és diagramok jobb megértéshez
- **Segítség integráció**: Közvetlen Discord hozzáférés közösségi támogatáshoz

### [v3.2.0] - 2025-09-17

#### Nagyarányú navigáció átalakítás és fejezet-alapú tanulási rendszer
**Ez a verzió átfogó, fejezetek alapján strukturált tanulási rendszert vezet be, és javított navigációt a teljes tárolóban.**

#### Hozzáadott
- **📚 Fejezet-alapú tanulási rendszer**: Az egész tanfolyam 8 előrehaladó tanulási fejezetbe rendezve
  - 1. fejezet: Alapok és gyors kezdés (⭐ – 30-45 perc)
  - 2. fejezet: AI-központú fejlesztés (⭐⭐ – 1-2 óra)
  - 3. fejezet: Konfiguráció és hitelesítés (⭐⭐ – 45-60 perc)
  - 4. fejezet: Infrastrukturális kód és telepítés (⭐⭐⭐ – 1-1,5 óra)
  - 5. fejezet: Több-ügynökös AI megoldások (⭐⭐⭐⭐ – 2-3 óra)
  - 6. fejezet: Telepítés előtti validáció és tervezés (⭐⭐ – 1 óra)
  - 7. fejezet: Hibakeresés és debug (⭐⭐ – 1-1,5 óra)
  - 8. fejezet: Termelési és vállalati minták (⭐⭐⭐⭐ – 2-3 óra)
- **📚 Átfogó navigációs rendszer**: Egységes navigációs fejléc és lábléc az összes dokumentációs oldalnál
- **🎯 Haladáskövetés**: Tanfolyam teljesítési ellenőrző lista és tanulási validációs rendszer
- **🗺️ Tanulási útmutató**: Világos belépési pontok különböző tapasztalati szinteknek és céloknak
- **🔗 Keresztnavigáció**: Kapcsolódó fejezetek és előfeltételek explicit hivatkozásai

#### Fejlesztett
- **README szerkezet**: Strukturált tanulási platformmá alakítva fejezet-alapú szerkezettel
- **Dokumentáció navigáció**: Minden oldalon szerepel fejezeti kontextus és haladási útmutató
- **Sablon rendezés**: Példák és sablonok hozzárendelve az adott tanulási fejezetekhez
- **Erőforrás integráció**: Cheat sheet-ek, GYIK, tanulmányi útmutatók releváns fejezetekhez kötve
- **Workshop integráció**: Gyakorlati laborok több fejezet tanulási céljaihoz társítva

#### Változtatások
- **Tanulási sorrend**: Lineáris dokumentációról rugalmas fejezet-alapú tanulásra váltás
- **Konfigurációs anyag elhelyezése**: Konfigurációs útmutató a 3. fejezetbe helyezve jobb tanulási folyamatért
- **AI tartalom integrációja**: AI-specifikus tartalom jobb integrációja a tanulási úton
- **Termelési tartalom**: Haladó minták összefoglalva a 8. fejezetben vállalati tanulóknak

#### Javított
- **Felhasználói élmény**: Világos navigációs útvonalak és fejezeti előrehaladás jelzők
- **Hozzáférhetőség**: Egységes navigáció a könnyebb tanfolyam bejáráshoz
- **Professzionális megjelenítés**: Egyetemi stílusú tanfolyam struktúra akadémiai és vállalati képzéshez
- **Tanulási hatékonyság**: Rövidebb idő releváns tartalom megtalálásához a jobb szervezés miatt

#### Műszaki megvalósítás
- **Navigációs fejléc**: Standardizált fejezeti navigáció 40+ dokumentációs fájlban
- **Navigációs lábléc**: Következetes haladási útmutató és fejezeti teljesítés jelzők
- **Kereszthivatkozás**: Átfogó belső linkrendszer kapcsolódó fogalmak összekapcsolására
- **Fejezeti hozzárendelés**: Sablonok és példák világosan társítva tanulási célokhoz

#### Tanulmányi útmutató fejlesztés
- **📚 Átfogó tanulási célok**: Újrastrukturált tanulmányi útmutató a 8 fejezet rendszerhez igazítva
- **🎯 Fejezeti értékelés**: Minden fejezet konkrét tanulási eredményekkel és gyakorlati feladatokkal
- **📋 Haladáskövetés**: Heti tanulási ütemterv mérhető eredményekkel és ellenőrzőlistákkal
- **❓ Értékelő kérdések**: Tudásvalidációs kérdések minden fejezethez szakmai eredményekkel
- **🛠️ Gyakorlati feladatok**: Valós telepítési szcenáriók és hibakeresési gyakorlatok
- **📊 Készségfejlesztés**: Világos fejlődés az alapfogalmakból a vállalati minták felé karrier fókuszú megközelítéssel
- **🎓 Minősítési keretrendszer**: Szakmai fejlesztési eredmények és közösségi elismerési rendszer
- **⏱️ Időbeosztás kezelése**: Strukturált 10 hetes tanulási terv mérföldkövek validálásával

### [v3.1.0] - 2025-09-17

#### Fejlesztett több-ügynökös AI megoldások
**Ez a verzió javítja a több-ügynökös kiskereskedelem megoldást jobb ügynök megnevezésekkel és fejlettebb dokumentációval.**

#### Változások
- **Több-ügynök terminológia**: A „Cora agent” kifejezést „Customer agent”-re cseréltük a kiskereskedelmi több-ügynök megoldásban az érthetőség érdekében
- **Ügynök architektúra**: Minden dokumentáció, ARM sablon és kód példa frissítve, hogy egységesen a „Customer agent” elnevezést használja
- **Konfigurációs példák**: Korszerűsített ügynök konfigurációs minták új nevezéktannal
- **Dokumentáció egységessége**: Minden hivatkozás professzionális, leíró ügynökneveket használ

#### Fejlesztett
- **ARM Template Csomag**: Frissített retail-multiagent-arm-template a Customer agent hivatkozásokkal
- **Architektúra Diagramok**: Frissített Mermaid diagramok a frissített agent elnevezésekkel
- **Kód Példák**: Python osztályok és implementációs példák mostantól CustomerAgent elnevezést használnak
- **Környezeti Változók**: Minden telepítési szkriptet frissítve a CUSTOMER_AGENT_NAME konvenciók szerint

#### Javított
- **Fejlesztői Élmény**: Világosabb ügynök szerepek és felelősségek a dokumentációban
- **Termelési Készültség**: Jobb összhang a vállalati elnevezési szabályokkal
- **Tananyagtartalom**: Intuitívabb agent elnevezések oktatási célokra
- **Sablon Használhatóság**: Egyszerűbb az ügynök funkciók és telepítési minták megértése

#### Technikai Részletek
- Frissített Mermaid architektúra diagramok CustomerAgent hivatkozásokkal
- Python példákban lecserélve a CoraAgent osztálynevek CustomerAgent-re
- ARM template JSON konfigurációk módosítása a "customer" agent típus használatára
- Környezeti változók frissítve CORA_AGENT_* helyett CUSTOMER_AGENT_* mintákra
- Minden telepítési parancs és konténer konfiguráció frissítve

### [v3.0.0] - 2025-09-12

#### Jelentős Változások - AI Fejlesztői Fókusz és Microsoft Foundry Integráció
**Ez a verzió az adattárat átalakítja átfogó, mesterséges intelligenciára fókuszáló tananyagforrássá Microsoft Foundry integrációval.**

#### Hozzáadva
- **🤖 AI-Központú Tanulási Út**: Teljes átszerkezetelés AI fejlesztők és mérnökök prioritásával
- **Microsoft Foundry Integrációs Útmutató**: Átfogó dokumentáció az AZD és Microsoft Foundry szolgáltatások összekapcsolásához
- **AI Modell Telepítési Minták**: Részletes útmutató modellválasztásról, konfigurációról és éles telepítési stratégiákról
- **AI Műhely Labor**: 2-3 órás gyakorlatias workshop AI alkalmazások AZD-re történő átültetéséhez
- **Éles AI Legjobb Gyakorlatok**: Vállalati méretű minták AI munkaterhelések skálázásához, figyeléséhez és biztonságához
- **AI Specifikus Hibakeresési Útmutató**: Teljes körű hibaelhárítás Microsoft Foundry modellekhez, Cognitive Services-hez és AI telepítési problémákhoz
- **AI Sablongyűjtemény**: Kiemelt Microsoft Foundry sablonok gyűjteménye komplexitási besorolással
- **Műhely Anyagok**: Teljes workshop struktúra gyakorlati laborokkal és referencia anyagokkal

#### Fejlesztve
- **README Szerkezet**: AI fejlesztőkre fókuszálva, 45% közösségi érdeklődési adattal a Microsoft Foundry Discord alapján
- **Tanulási Útvonalak**: Dedikált AI fejlesztői útvonal a hagyományos diákok és DevOps mérnökök útvonalai mellett
- **Sablon Ajánlások**: Kiemelt AI sablonok, mint az azure-search-openai-demo, contoso-chat és openai-chat-app-quickstart
- **Közösségi Integráció**: Javított Discord közösségi támogatás AI-specifikus csatornákkal és vitákkal

#### Biztonság és Éles Használat Fókusz
- **Kezelt Identitás Minták**: AI-specifikus hitelesítési és biztonsági konfigurációk
- **Költségoptimalizálás**: Token felhasználás nyomon követése és költségkeret szabályozás AI munkaterhelésekhez
- **Több Régiós Telepítés**: Globális AI alkalmazás telepítési stratégiák
- **Teljesítményfigyelés**: AI-specifikus metrikák és Application Insights integráció

#### Dokumentáció Minőség
- **Lineáris Tanfolyam Szerkezet**: Logikus haladás kezdőtől haladó AI telepítési mintákig
- **Érvényesített URL-ek**: Minden külső adattári hivatkozás ellenőrzött és elérhető
- **Teljes Referencia**: Minden belső dokumentációs link érvényes és működő
- **Éles Kész**: Vállalati telepítési minták valós példákkal

### [v2.0.0] - 2025-09-09

#### Jelentős Változások - Adattár Átszervezés és Professzionális Fejlesztés
**Ez a verzió jelentős átalakítást képvisel az adattár struktúrájában és tartalmi bemutatásában.**

#### Hozzáadva
- **Strukturált Tanulási Keretrendszer**: Minden dokumentációs oldal most tartalmaz bevezetést, tanulási célokat és eredményeket
- **Navigációs Rendszer**: Előző/Következő leckére mutató linkek hozzáadása a teljes dokumentációban a vezetett tanuláshoz
- **Tanulmányi Útmutató**: Átfogó study-guide.md tanulási célokkal, gyakorlófeladatokkal és értékelő anyagokkal
- **Professzionális Megjelenés**: Minden emoji ikon eltávolítva a jobb elérhetőség és profi megjelenés érdekében
- **Fejlesztett Tartalomszerkezet**: Jobb szervezés és haladás a tananyagtartalmak között

#### Módosítva
- **Dokumentáció Formátum**: Minden dokumentum egységes tanulásközpontú szerkezettel szabványosítva
- **Navigációs Áramlás**: Logikus haladás megvalósítása a tananyagokon keresztül
- **Tartalom Megjelenítés**: Díszítő elemek eltávolítása a tiszta, professzionális formázás érdekében
- **Link Strukturálás**: Belső linkek frissítése az új navigációs rendszer támogatására

#### Javított
- **Akadálymentesség**: Emoji függőségek eltávolítása jobb képernyőolvasó kompatibilitásért
- **Professzionális Megjelenés**: Tiszta, akadémiai stílusú megjelenés vállalati tanuláshoz
- **Tanulási Élmény**: Strukturált megközelítés világos célokkal és eredményekkel minden leckében
- **Tartalomszervezés**: Jobb logikai összefüggés és kapcsolat a témák között

### [v1.0.0] - 2025-09-09

#### Kezdeti Kiadás - Átfogó AZD Tanulási Adaptár

#### Hozzáadva
- **Alap Dokumentációs Struktúra**
  - Teljes kezdő útmutató sorozat
  - Átfogó telepítési és előkészítési dokumentáció
  - Részletes hibakeresési források és debugging útmutatók
  - Előtelepítési ellenőrző eszközök és eljárások

- **Kezdő Modul**
  - AZD Alapok: Core koncepciók és terminológia
  - Telepítési Útmutató: Platform specifikus beállítási lépések
  - Konfigurációs Útmutató: Környezet beállítása és hitelesítés
  - Első Projekt Bemutató: Lépésről lépésre gyakorlati tanulás

- **Telepítés és Előkészítés Modul**
  - Telepítési Útmutató: Teljes munkafolyamat dokumentációja
  - Előkészítési Útmutató: Infrastrukturakód Bicep-pel
  - Termelési telepítési legjobb gyakorlatok
  - Többszolgáltatásos architektúra minták

- **Előtelepítési Ellenőrzési Modul**
  - Kapacitástervezés: Azure erőforrás elérhetőség ellenőrzés
  - SKU Kiválasztás: Átfogó szolgáltatási szint útmutató
  - Pre-flight ellenőrzések: Automatizált validáló szkriptek (PowerShell és Bash)
  - Költségbecslés és költségvetési tervező eszközök

- **Hibakeresési Modul**
  - Gyakori problémák: Gyakran előforduló hibák és megoldásaik
  - Hibakeresési Útmutató: Szisztematikus hibaelhárítási módszerek
  - Fejlett diagnosztikai eszközök és technikák
  - Teljesítményfigyelés és optimalizálás

- **Források és Referenciák**
  - Parancs Gyorssegédlet: Gyors hivatkozás alapvető parancsokra
  - Szójegyzék: Átfogó terminológia és rövidítés lista
  - GYIK: Részletes válaszok gyakori kérdésekre
  - Külső forrás linkek és közösségi kapcsolatok

- **Példák és Sablonok**
  - Egyszerű webalkalmazás példa
  - Statikus weboldal telepítési sablon
  - Konténer alkalmazás konfiguráció
  - Adatbázis integrációs minták
  - Mikroservice architektúra példák
  - Serverless függvény implementációk

#### Főbb Jellemzők
- **Többplatformos Támogatás**: Telepítési és konfigurációs útmutatók Windows, macOS és Linux rendszerekhez
- **Több Képzettségi Szint**: Tartalom diákoktól professzionális fejlesztőkig
- **Gyakorlati Fókusz**: Gyakorlati példák és valós helyzetek
- **Átfogó Lefedettség**: Alapoktól a fejlett vállalati mintákig
- **Biztonság-központúság**: Biztonsági legjobb gyakorlatok beépítve
- **Költségoptimalizálás**: Költséghatékony telepítés és erőforrás-kezelés útmutatás

#### Dokumentáció Minőség
- **Részletes Kód Példák**: Gyakorlati, tesztelt kódminták
- **Lépésről Lépésre Útmutatók**: Világos, végrehajtható javaslatok
- **Teljes Körű Hibakezelés**: Átfogó problémaelhárítás
- **Legjobb Gyakorlatok Integrációja**: Iparági szabványok és ajánlások
- **Verzió Kompatibilitás**: Naprakész Azure szolgáltatásokkal és az azd funkciókkal

## Tervezett Jövőbeli Fejlesztések

### Verzió 3.1.0 (Tervezett)
#### AI Platform Bővítés
- **Többmodell Támogatás**: Integrációs minták Hugging Face, Azure Machine Learning és egyedi modellekhez
- **AI Agent Keretrendszerek**: Sablonok LangChain, Semantic Kernel és AutoGen telepítésekhez
- **Fejlett RAG Minták**: Vektor adatbázis opciók az Azure AI Search-en túl (Pinecone, Weaviate stb.)
- **AI Megfigyelhetőség**: Fejlesztett monitorozás modell teljesítményre, token használatra és válasz minőségére

#### Fejlesztői Élmény
- **VS Code Kiterjesztés**: Integrált AZD + Microsoft Foundry fejlesztői élmény
- **GitHub Copilot Integráció**: AI által támogatott AZD sablon generálás
- **Interaktív Oktatóanyagok**: Gyakorlati kódolási feladatok automatizált validálással AI forgatókönyvekhez
- **Videós Tartalom**: Kiegészítő videós oktatók AI telepítésekhez vizuális tanulóknak

### Verzió 4.0.0 (Tervezett)
#### Vállalati AI Minták
- **Governance Keretrendszer**: AI modell kormányzás, megfelelőség és auditálás
- **Többbérlős AI**: Minták több ügyfél kiszolgálására izolált AI szolgáltatásokkal
- **Edge AI Telepítés**: Integráció Azure IoT Edge és konténer példányokkal
- **Hibrid Felhő AI**: Többfelhős és hibrid telepítési minták AI munkaterhelésekhez

#### Fejlett Funkciók
- **AI Pipeline Automatizálás**: MLOps integráció Azure Machine Learning pipeline-okkal
- **Fejlett Biztonság**: Zero-trust minták, privát végpontok és fejlett fenyegetésvédelmi megoldások
- **Teljesítményoptimalizálás**: Haladó hangolás és skálázási stratégiák nagyforgalmú AI alkalmazásokhoz
- **Globális Terjesztés**: Tartalom szolgáltatás és edge cache minták AI alkalmazásokhoz

### Verzió 3.0.0 (Tervezett) - Megelőzve a Jelenlegi Kiadás Által
#### Javasolt Kiegészítések - Most Már Megvalósítva v3.0.0-ban
- ✅ **AI-központú Tartalom**: Átfogó Microsoft Foundry integráció (Befejezve)
- ✅ **Interaktív Oktatók**: Gyakorlati AI műhely labor (Befejezve)
- ✅ **Fejlett Biztonsági Modul**: AI-specifikus biztonsági minták (Befejezve)
- ✅ **Teljesítmény-optimalizálás**: AI munkaterhelés hangolási stratégiák (Befejezve)

### Verzió 2.1.0 (Tervezett) - Részben Megvalósítva v3.0.0-ban
#### Apró Fejlesztések - Néhány Már Elkészült a Jelenlegi Kiadásban
- ✅ **További Példák**: AI-központú telepítési forgatókönyvek (Befejezve)
- ✅ **Bővített GYIK**: AI-specifikus kérdések és hibakeresés (Befejezve)
- **Eszköz Integráció**: Fejlesztett IDE és szerkesztő integrációs útmutatók
- ✅ **Monitorozás Kiterjesztése**: AI-specifikus monitorozási és riasztási minták (Befejezve)

#### Továbbra Is Tervezve a Jövőbeli Kiadáshoz
- **Mobilbarát Dokumentáció**: Reszponzív kialakítás mobil tanuláshoz
- **Offline Hozzáférés**: Letölthető dokumentációs csomagok
- **Fejlesztett IDE Integráció**: VS Code bővítmény AZD + AI munkafolyamatokhoz
- **Közösségi Műszerfal**: Valós idejű közösségi metrikák és hozzájárulás követés

## Változásnapló Hozzájárulás

### Változtatások Jelentése
Ha hozzájárulsz ehhez az adattárhoz, kérjük, hogy a változásnapló bejegyzései tartalmazzák:

1. **Verzió Szám**: Szemantikus verziókezelés szerint (fő.verzió.javítás)
2. **Dátum**: Kiadás vagy frissítés dátuma ÉÉÉÉ-HH-NN formátumban
3. **Kategória**: Hozzáadott, Módosított, Elavult, Eltávolított, Javított, Biztonsági
4. **Egyértelmű Leírás**: Rövid összefoglaló a változásról
5. **Hatásfelmérés**: Hogyan befolyásolja a változás a meglévő felhasználókat

### Változáskategóriák

#### Hozzáadott
- Új funkciók, dokumentációs részek vagy képességek
- Új példák, sablonok vagy tananyagok
- További eszközök, szkriptek vagy segédprogramok

#### Módosított
- Meglévő funkciók vagy dokumentáció változtatásai
- Frissítések a tisztaság vagy pontosság javítására
- Tartalom vagy szervezés átszervezése

#### Elavult
- Kiiktatandó funkciók vagy megközelítések
- Eltávolítandó dokumentációs részek
- Jobb alternatívák által kiváltott módszerek

#### Eltávolított
- Már nem releváns funkciók, dokumentáció vagy példák
- Elavult információk vagy megközelítések
- Ismétlődő vagy összevonásra került tartalom

#### Javított
- Dokumentációs vagy kódhibák javítása
- Jelentett problémák megoldása
- Pontosság vagy működés javítása

#### Biztonsági
- Biztonsági javítások vagy fejlesztések
- Biztonsági legjobb gyakorlatok frissítése
- Biztonsági sebezhetőségek kezelése

### Szemantikus Verziózási Útmutató

#### Fő Verzió (X.0.0)
- Visszafelé nem kompatibilis változások, amelyek felhasználói beavatkozást igényelnek
- Jelentős tartalmi vagy szervezeti átalakítások
- Alapvető megközelítés vagy módszertan változása

#### Kisebb Verzió (X.Y.0)
- Új funkciók vagy tartalom bővítések
- Visszafelé kompatibilis fejlesztések
- További példák, eszközök vagy erőforrások

#### Javító Verzió (X.Y.Z)
- Hibajavítások és korrekciók
- Kis fejlesztések meglévő tartalomhoz
- Pontosítások és apróbb javítások

## Közösségi Visszajelzések és Javaslatok

Aktívan ösztönözzük a közösségi visszajelzéseket a tananyagfejlesztéshez:

### Hogyan Adj Visszajelzést
- **GitHub Issues**: Problémajelentés és javaslatok (AI-specifikus problémák is welcome)
- **Discord Beszélgetések**: Ötletmegosztás és Microsoft Foundry közösségi részvétel
- **Pull Requestek**: Közvetlen fejlesztések hozzájárulása, különösen AI sablonokhoz és útmutatókhoz
- **Microsoft Foundry Discord**: Részvétel a #Azure csatornán AZD + AI témákban
- **Közösségi Fórumok**: Szélesebb Azure fejlesztői közösségi részvétel

### Visszajelzés Kategóriák
- **AI Tartalom Pontosság**: Javítások AI szolgáltatás integrációhoz és telepítéshez
- **Tanulási Élmény**: Javaslatok az AI fejlesztői tanulási folyamat javítására
- **Hiányzó AI Tartalom**: Kérések további AI sablonokra, mintákra vagy példákra
- **Akadálymentesség**: Fejlesztések a változatos tanulási igényekhez
- **AI Eszköz Integráció**: Javaslatok jobb AI fejlesztői munkafolyamat integrációhoz
- **Éles AI Minták**: Vállalati AI telepítési mintaigények

### Válaszadási Elkötelezettség
- **Probléma Válasz**: 48 órán belül
- **Funkció Kérések**: Egy héten belül kiértékelve
- **Közösségi Hozzájárulások**: Egy héten belüli áttekintés
- **Biztonsági Problémák**: Azonnali prioritású és gyors válasz

## Karbantartási Ütemterv

### Rendszeres Frissítések
- **Havi Ellenőrzések**: Tartalom pontosság és linkek validálása
- **Negyedéves Frissítések**: Jelentős tartalom bővítések és fejlesztések
- **Féléves Felülvizsgálatok**: Átfogó átszervezések és fejlesztések
- **Éves Kiadások**: Főverziós frissítések jelentős fejlesztésekkel

### Monitorozás és Minőségbiztosítás
- **Automatizált Tesztelés**: Kód példák és linkek rendszeres ellenőrzése
- **Közösségi Visszacsatolás Integráció**: Felhasználói javaslatok rendszeres beépítése
- **Technológiai Frissítések**: Naprakészség a legújabb Azure szolgáltatásokkal és az azd fejlesztésekkel
- **Akadálymentességi Auditok**: Rendszeres felülvizsgálat inkluzív tervezési elvek alapján

## Verzió Támogatási Szabályzat

### Jelenlegi Verzió Támogatás
- **Legújabb főverzió**: Teljes támogatás rendszeres frissítésekkel  
- **Előző főverzió**: Biztonsági frissítések és kritikus javítások 12 hónapig  
- **Régebbi verziók**: Csak közösségi támogatás, hivatalos frissítések nélkül  

### Áttelepítési útmutató  
Amikor új főverziók jelennek meg, biztosítjuk:  
- **Áttelepítési útmutatók**: Lépésről lépésre szóló átmeneti utasítások  
- **Kompatibilitási megjegyzések**: Információk a törő változásokról  
- **Eszköztámogatás**: Áttelepítést segítő scriptek vagy eszközök  
- **Közösségi támogatás**: Dedikált fórumok az áttelepítéssel kapcsolatos kérdésekhez  

---

**Navigáció**  
- **Előző lecke**: [Tanulmányi útmutató](resources/study-guide.md)  
- **Következő lecke**: Vissza a [Fő README-hez](README.md)  

**Friss hírekért kövess minket**: Figyeld ezt a repozitóriumot az új kiadásokkal és a tananyag fontos frissítéseivel kapcsolatos értesítésekért.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősségkizárás**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordító szolgáltatásával készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális, emberi fordítást javaslunk. Nem vállalunk felelősséget az ebből eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->