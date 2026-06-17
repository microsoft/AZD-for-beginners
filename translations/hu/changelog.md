# Verziókövetés - AZD Kezdőknek

## Bevezetés

Ez a verziókövetési napló dokumentálja az AZD Kezdőknek tárházban történt jelentős változásokat, frissítéseket és fejlesztéseket. A szemantikai verziózás elveit követjük, és fenntartjuk ezt a naplót, hogy segítsük a felhasználókat megérteni, mi változott a verziók között.

## Tanulási célok

A verziókövetési napló áttekintésével Ön:
- Naprakész marad az új funkciókról és tartalombővítésekről
- Megérti a meglévő dokumentáció javításait
- Követheti a hibajavításokat és korrekciókat a pontosság érdekében
- Nyomon követi az oktatási anyagok fejlődését az idő során

## Tanulási eredmények

A verziókövetési bejegyzések áttekintése után képes lesz:
- Azonosítani az új elérhető tartalmakat és forrásokat a tanuláshoz
- Megérteni, mely részek lettek frissítve vagy fejlesztve
- Megtervezni a tanulási útját a legfrissebb anyagok alapján
- Visszajelzést adni és javaslatokat tenni a jövőbeli fejlesztésekhez

## Verziótörténet

### [v3.22.0] - 2026-06-16

#### Kezdő hiánypótlás #2: Sablon készítés, fejlesztői konténerek, Pulumi, Azure DevOps, szolgáltatási főfelhasználók és még sok más
**Ez a verzió lezárja az azd-coverage elemzés által feltárt fennmaradó középhaladó hiányosságokat: hogyan készítsünk és tegyünk közzé saját sablont, reprodukálható fejlesztői-konténer/Codespaces környezeteket, a Pulumi infrastruktúrális szolgáltatót, Azure DevOps CI/CD bemutatót, szolgáltatási főfelhasználó hitelesítést, gazdagép kiválasztási útmutatót (AKS/Spring Apps), az `azd restore`/`azd package` magyarázatokat, horgok hibakezelését, valamint csapat és megosztott környezet gyakorlatokat.**

#### Hozzáadott
- **🧱 Új 4. fejezet lecke** `docs/chapter-04-infrastructure/custom-templates.md` — saját azd sablon készítése: szükséges struktúra (`azure.yaml`, `infra/`, `src/`), `metadata.template` mező, az infrastruktúra paraméterezése a `uniqueString()` erőforrástaggal és `azd-env-name` címkével, helyi tesztelés az `azd init --template <local-path>` paranccsal, GitHub-ra való közzététel és az Awesome AZD galériába való beküldés
- **📦 Új 1. fejezet lecke** `docs/chapter-01-foundation/dev-containers.md` — reprodukálható azd környezetek fejlesztői konténerekkel és GitHub Codespaces-szel: minimális `.devcontainer/devcontainer.json` az hivatalos `ghcr.io/azure/azure-dev/azd` funkcióval, nyelvspecifikus képességek, `docker-in-docker` a konténer gazdagépekhez, valamint `azd auth login --use-device-code` távoli bejelentkezéshez
- **🧩 Pulumi az azd-vel** rész a `docs/chapter-04-infrastructure/provisioning.md` fájlban — `infra.provider: pulumi`, Pulumi mappa felépítés, azd környezetekhez rendelt stackek, szükséges outputok/címkézés, és az azonos `azd up` / `azd down` munkafolyamat
- **🎯 Gazdagép kiválasztási útmutató** a `docs/chapter-04-infrastructure/provisioning.md` fájlban — kezdőbarát összehasonlítás az `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` és `springapp` között, valamint útmutatás, mikor válasszuk az AKS-t vagy az Azure Spring Apps-t
- **🛠️ Azure DevOps CI/CD bemutató** a `docs/chapter-08-production/production-ai-practices.md` fájlban — `azd pipeline config --provider azdo`, szolgáltatáskapcsolat munkaterhelési identitás federációval (OIDC), a generált `azure-dev.yml`, és változó csoport beállítás
- **🔑 Szolgáltatási főfelhasználók (Minta 4)** hozzáadva a `docs/chapter-03-configuration/authsecurity.md` fájlhoz — `az ad sp create-for-rbac`, nem interaktív `azd auth login` kliens titkos jelszóval szemben federált/OIDC hitelesítéssel, mikor használjuk, és biztonságos hitelesítő adat tárolás
- **🪝 Horgok hibakezelése** alfejezet a `docs/chapter-04-infrastructure/deployment-guide.md` fájlban — kilépési kódok és `set -e`, `continueOnError`, horgok egyedi tesztelése az `azd hooks run` parancs segítségével, operációs rendszer specifikus shell-ek, és a `--debug`
- **👥 Csapat / megosztott környezetek** rész a `docs/chapter-03-configuration/configuration.md` fájlban — mi található a `.azure/` könyvtárban, mit kell gitignore-olni, fejlesztőnkénti környezetek, `azd env list`/`select`, és környezeti értékek biztosítása CI/CD-ben
- **🧰 `azd restore` és kibővített `azd package`** magyarázatok a `resources/cheat-sheet.md` fájlban — függőségek visszaállítása és telepíthető csomag készítése telepítés nélkül

#### Változtatott
- **🧭 4. fejezet leckék táblázata** frissítve, hogy tartalmazza az új „Saját sablon készítése” leckét (3. lecke)
- **🧭 1. fejezet leckék táblázata** frissítve az új „Fejlesztői konténerek & Codespaces” leckével (5. lecke); navigációs láblécek összekötve a `bring-your-own-app.md` és a `dev-containers.md` között

### [v3.21.0] - 2026-06-16

#### Kezdő hiánypótlás: Gyakorlati több-ügynökös lecke, "Hozd a saját appodat", Terraform és CI/CD bemutató
**Ez a verzió lezárja a legnagyobb hiányosságokat egy teljes kezdő útmutatóban két új gyakorlati leckével (egy telepíthető több-ügynökös bemutató és az azd hozzáadása egy meglévő alkalmazáshoz), kezdőbarát horgok bevezetővel, Terraform-azd integrációval, lépésről-lépésre GitHub Actions pipeline bemutatóval, az új előzetes kiterjesztések magyarázatával és egy explicit telepítés-ellenőrzési ellenőrzőlistával.**

#### Hozzáadott
- **🤝 Új 5. fejezet lecke** `docs/chapter-05-multi-agent/multi-agent-basics.md` — teljesen gyakorlati, telepíthető két-ügynökös bemutató (orchestrátor + specialisták) valós sablonnal (`contoso-creative-writer`), lefedve mikor használjunk több-ügynököt, az `azd up` munkafolyamatot, a telepített erőforrások megértését, ügynökök közötti követést, testreszabást és takarítást
- **📦 Új 1. fejezet lecke** `docs/chapter-01-foundation/bring-your-own-app.md` — hogyan adjuk hozzá az azd-t egy meglévő projekthez az `azd init` használatával („kód használata a jelenlegi könyvtárban”), az `azure.yaml` és `infra/` megértése, `azd infra generate`, gazdagép érzékelése és telepítés `azd up` -val
- **🌐 Terraform az azd-vel** rész hozzáadva a `docs/chapter-04-infrastructure/provisioning.md` fájlhoz — `infra.provider: terraform` konfiguráció, `.tf` mappa felépítés, szükséges `AZURE_*` outputok és `azd-env-name` címkézés, valamint azonos `azd up` / `azd down` munkafolyamat (lezárja azt a rést, ahol a Terraform támogatás ígért volt, de csak Bicep mutatva)
- **⚙️ Lépésről-lépésre GitHub Actions bemutató** a `docs/chapter-08-production/production-ai-practices.md` fájlban — GitHub repótól az automatizált telepítésig: `azd pipeline config`, OIDC federált hitelesítő adatok (nincs tárolt titok), a generált `azure-dev.yml`, titkok vs változók útmutató
- **🪝 Kezdő „Új a horgokban?” bevezető** a `docs/chapter-04-infrastructure/deployment-guide.md` fájlban — mi az a horog, egy horog-fázis táblázat, minimális első horog, és horgok kézi futtatása az `azd hooks run` segítségével
- **✅ „Telepítés ellenőrzése” ellenőrzőlista** hozzáadva az 5. lépéshez a `docs/chapter-01-foundation/first-project.md` fájlban — alapteszt, egészségügyi végpont ellenőrzés és egyértelmű siker kritériumok
- **🧩 Új preview kiterjesztések magyarázata**: `azure.ai.skills` és `azure.ai.connections` (mik ezek és mikor használjuk őket) a `docs/chapter-08-production/production-ai-practices.md` fájlban

#### Változtatott
- **🧭 5. fejezet leckék táblázata** javítva: a `multi-agent-basics.md` most az 1. lecke (az egyetlen teljesen gyakorlati lecke), őszinte jelöléssel, hogy a 2. lecke a 6. fejezetben van, és a Retail forgatókönyv egy architektúra tervrajz, nem egy egylépéses sablon
- **🧭 1. fejezet leckék táblázata** most tartalmazza az új „Hozd a saját appodat” leckét (4. lecke)
- **🔗 Navigációs láblécek** frissítve: a `first-project.md` most a `bring-your-own-app.md` felé mutat tovább

#### Javított
- **🧱 „Ígért, de hiányzó” Terraform hiány bezárva** — a tanfolyam korábban utalt Terraform támogatásra, de nem mutatta be azt
- **🔀 Félrevezető 5. fejezet kereszt-linkek javítása** amelyek azt sugallták, hogy létezik teljes több-ügynökös implementáció, amikor csak architektúra tervvolt

#### Frissített fájlok
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(új)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(új)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 frissítés, Teljes ügynök életciklus parancsok & Aspire rebranding
**Ez a verzió újraellenőrzi a tanfolyamot az `azd` `1.25.6` (2026 június) és az `azure.ai.agents` `0.1.40-preview` kiterjesztés alapján, kibővíti a mesterséges intelligencia útmutatást az „ügynök alap létrehozása” helyett a teljes ügynök életciklusra (teszt → értékel → optimalizál → ellenőriz → töröl), megjeleníti az új `azure.ai.skills` és `azure.ai.connections` preview kiterjesztéseket, és megemlíti a ".NET Aspire" → "Aspire" termék márkaváltást.**

#### Hozzáadott
- **🔁 Teljes ügynök életciklus lefedettség** kezdők és AI mérnökök számára az összes dokumentumban:
  - `docs/chapter-01-foundation/azd-basics.md` — Életciklus táblázat (alkotás → teszt → mérés → fejlesztés → ellenőrzés → takarítás) hozzáadva a Kiterjesztések és AI parancsok részhez
  - `docs/chapter-08-production/production-ai-practices.md` — Új „Ügynök életciklus kezelése” rész, amely lefedi az `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` és `delete --force` parancsokat
  - `resources/cheat-sheet.md` — Kibővített AI Ügynök parancsok az `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` és `delete --force` parancsokkal
- **🧩 Új preview kiterjesztések** dokumentálva: `azure.ai.skills` (újrahasználható ügynök képességek) és `azure.ai.connections` (Foundry kapcsolatok) hozzáadva a kiterjesztés táblához és a cheat sheet-hez
- **⏱️ Válaszidő útmutató** — az `azd ai agent invoke` példák most megjegyzik, hogy kiírja a teljes késleltetést és az első bájtig eltelt időt
- **📌 Verzió banner** a gyökér README-ben, amely a felhasználókat az `azd version` és az `azd upgrade` parancsok felé irányítja

#### Változtatott
- **✅ Érvényesítési alap frissítve** `azd 1.23.12` (2026 március) verzióról `azd 1.25.6` (2026 június) verzióra minden fejezet README-jében és a workshop dokumentumokban
- **🤖 2. fejezet kiterjesztési megjegyzés** frissítve `azure.ai.agents` `0.1.18-preview` verzióról `0.1.40-preview` verzióra
- **🧪 Workshop érvényesítési példa** (`azd version` kimenet) frissítve `1.25.6` verzióra
- **🧭 README „Mi újság ma az azd-ben”** frissítve, hogy kiemelje az ügynök teljes életciklust, új AI kiterjesztéseket és újabb használhatósági javításokat (`azd init` ismételhetőség, `azd auth login` elavult token törlése, `azd tool` első futtatási kérés)
- **📖 2. fejezet agents.md (Opció 4)** most a telepítés utáni életciklus parancsokra irányít, nem csak az `azd up`-ig tart megáll

#### Javított
- **🏷️ Termék névhasználat** — Aspire márkaváltás megjegyzés hozzáadva („.NET Aspire” most már egyszerűen „Aspire”); az azd Aspire támogatás változatlan
- **🔎 Élő kiadás érvényesítés** megerősítve az Azure Developer CLI kiadási feed alapján: stabil CLI `1.25.6` (2026-06-12) és `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Frissített fájlok
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### Kezdői bevezető tisztázás, telepítés ellenőrzése és végső AZD parancs tisztítás  
**Ez a verzió követi az AZD 1.23-as validációs áttekintést egy kezdőkre fókuszáló dokumentációs felülvizsgálattal: tisztázza az AZD-alapú hitelesítési útmutatást, helyi telepítés-ellenőrző szkripteket ad hozzá, ellenőrzi a fontos parancsokat az aktuális AZD CLI-vel, és eltávolítja az utolsó elavult angol forrású parancs hivatkozásokat a changelog kivételével.**

#### Hozzáadva  
- **🧪 Kezdői telepítés-ellenőrző szkriptek** a `validate-setup.ps1` és `validate-setup.sh` segítségével, hogy a tanulók megerősíthessék a szükséges eszközök meglétét az 1. fejezet megkezdése előtt  
- **✅ Előzetes telepítés-ellenőrzési lépések** a gyökér README-ben és az 1. fejezet README-jében, hogy a hiányzó előfeltételek a `azd up` futtatása előtt beazonosíthatók legyenek  

#### Módosítva  
- **🔐 Kezdői hitelesítési útmutató** mostantól következetesen az `azd auth login` parancsot kezeli elsődleges útvonalnak az AZD munkafolyamatokhoz, míg az `az login` opcionálisként jelenik meg, hacsak nem közvetlenül az Azure CLI parancsokat használják  
- **📚 Az 1. fejezet bevezető menete** most a tanulókat a helyi környezetük ellenőrzésére irányítja az installáció, hitelesítés és első telepítés előtt  
- **🛠️ Ellenőrző üzenetek** világosan elkülönítik a blokkoló követelményeket az opcionális Azure CLI figyelmeztetésektől az kizárólag AZD kezdői úton  
- **📖 Konfiguráció, hibakeresés és példadokumentáció** a szükséges AZD hitelesítés és az opcionális Azure CLI bejelentkezés között tesz különbséget, ahol korábban mindkettő kontextus nélkül szerepelt  

#### Javítva  
- **📋 Meglévő angol forrású parancs hivatkozások** frissítve az aktuális AZD formákra, beleértve az `azd config show` parancsot a segédletben és az `azd monitor --overview`-t ott, ahol az Azure Portal összefoglaló útmutatás volt szándékolva  
- **🧭 Kezdői állítások az 1. fejezetben** enyhítve, hogy elkerülje a garantált hibamentes vagy visszagördülési viselkedés túlzott ígéretét minden sablonnál és Azure erőforrás esetén  
- **🔎 Élő CLI validáció** megerősítve az `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` és `azd down --force --purge` jelenlegi támogatásával  

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

#### AZD 1.23.12 validáció, workshop környezet bővítés és AI modell frissítés  
**Ez a verzió dokumentációs validációs keresztellenőrzést végez az `azd` `1.23.12` verzióhoz, frissíti a elavult AZD parancspéldákat, az AI modell útmutatást jelenlegi alapértelmezettekre hozza, és a workshop utasításokat a GitHub Codespaces mellett kiterjeszti fejlesztői konténerekre és helyi klónokra is.**

#### Hozzáadva  
- **✅ Validációs megjegyzések a főbb fejezetekben és workshop dokumentációban**, hogy a tesztelt AZD alapvonal egyértelmű legyen a tanulók számára, akár újabb, akár régebbi CLI verziót használnak  
- **⏱️ Telepítési időkorlát útmutatás** hosszú futású AI alkalmazások telepítéséhez az `azd deploy --timeout 1800` használatával  
- **🔎 Kiterjesztés ellenőrzési lépések** az `azd extension show azure.ai.agents` parancs segítségével az AI munkafolyamat dokumentációkban  
- **🌐 Szélesebb workshop környezet útmutató** lefedve a GitHub Codespaces, fejlesztői konténerek és helyi klónok használatát MkDocs dokumentációval  

#### Módosítva  
- **📚 Fejezet eleji README fájlok** következetesen jegyzik, hogy az `azd 1.23.12` verzióval validálták az alap, konfiguráció, infrastruktúra, többügynök, előtelepítési, hibakeresési és éles környezeti részeket  
- **🛠️ AZD parancs hivatkozások** frissítve az aktuális formákra a dokumentációban:  
  - `azd config list` → `azd config show`  
  - `azd env show` → `azd env list` vagy `azd env get-value(s)` a kontextustól függően  
  - `azd auth whoami` → `azd auth status`  
  - `azd monitor` → `azd monitor --overview` ahol az Application Insights összefoglaló célzott  
- **🧪 Provision preview példák** egyszerűsítve az aktuálisan támogatott használatra, pl. `azd provision --preview` és `azd provision --preview -e production`  
- **🧭 Workshop menete** frissítve, hogy a tanulók teljesíthessék a laborgyakorlatokat Codespaces-ben, fejlesztői konténerben vagy helyi klónban, nem csak Codespaces kizárólagosan  
- **🔐 Hitelesítési útmutatás** most már az `azd auth login` használatát preferálja AZD munkafolyamatokhoz, az `az login` opcionálissá téve, ha közvetlen Azure CLI parancsokat használnak  

#### Javítva  
- **🪟 Windows telepítési parancsok** normalizálva az aktuális `winget` csomagkezelő kis- és nagybetűs írására az telepítési útmutatóban  
- **🐧 Linux telepítési útmutatás** javítva, hogy elkerülje a nem támogatott disztribúció-specifikus `azd` csomagkezelő utasításokat, helyette a kiadási eszközökre mutat ahol szükséges  
- **📦 AI modell példák** frissítve a régi alapértelmezettekről mint `gpt-35-turbo` és `text-embedding-ada-002` a jelenlegi példákra, pl. `gpt-4.1-mini`, `gpt-4.1`, és `text-embedding-3-large`  
- **📋 Telepítési és diagnosztikai szkriptek** javítva, hogy az aktuális környezeti és állapot parancsokat használják a naplókban, szkriptekben és hibakeresési lépésekben  
- **⚙️ GitHub Actions útmutatás** frissítve az `Azure/setup-azd@v1.0.0`-ról `Azure/setup-azd@v2`-re  
- **🤖 MCP/Copilot hozzájárulási útmutatás** frissítve az `azd mcp consent`-ről `azd copilot consent list`-re  

#### Fejlesztve  
- **🧠 AI fejezet útmutató** jobban magyarázza a preview-érzékeny `azd ai` viselkedést, bérlőspecifikus bejelentkezést, az aktuális kiterjesztés használatot és frissített modell telepítési ajánlásokat  
- **🧪 Workshop utasítások** most reálisabb verzió példákat és világosabb környezeti telepítési nyelvezetet használnak a gyakorlati laborgyakorlatokhoz  
- **📈 Éles környezeti és hibakeresési dokumentációk** jobban összhangban vannak az aktuális monitorozási, visszafallback modell és költségszint példákkal  

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

#### AZD AI CLI parancsok, tartalom ellenőrzés és sablon bővítés  
**Ez a verzió hozzáadja az `azd ai`, `azd extension` és `azd mcp` parancsok lefedettségét az összes AI témájú fejezetben, javítja az agents.md hibás hivatkozásait és elavult kódját, frissíti a segédletet, és átdolgozza a Példasablonok részt validált leírásokkal és új Azure AI AZD sablonokkal.**

#### Hozzáadva  
- **🤖 AZD AI CLI lefedettség** 7 fájlban (korábban csak a 8. fejezetben):  
  - `docs/chapter-01-foundation/azd-basics.md` — Új "Kiterjesztések és AI parancsok" szakasz, bemutatva az `azd extension`, `azd ai agent init` és `azd mcp` parancsokat  
  - `docs/chapter-02-ai-development/agents.md` — 4. opcióként az `azd ai agent init` összehasonlító táblázattal (sablon vs manifest megközelítés)  
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD kiterjesztések a Foundryhez" és "Ügynök-első telepítés" alfejezetek  
  - `docs/chapter-05-multi-agent/README.md` — Gyors kezdés most mutatja mind a sablon-, mind a manifest-alapú telepítési útvonalakat  
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — A telepítés szakasz tartalmazza az `azd ai agent init` opciót  
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI kiterjesztés parancsok diagnosztikához" alfejezet  
  - `resources/cheat-sheet.md` — Új "AI és kiterjesztés parancsok" szakasz az `azd extension`, `azd ai agent init`, `azd mcp` és `azd infra generate` parancsokkal  
- **📦 Új AZD AI példasablonok** a `microsoft-foundry-integration.md`-ben:  
  - **azure-search-openai-demo-csharp** — .NET RAG chat Blazor WebAssembly-vel, Semantic Kernel-lel és hangalapú chat támogatással  
  - **azure-search-openai-demo-java** — Java RAG chat Langchain4J-vel ACA/AKS telepítési lehetőségekkel  
  - **contoso-creative-writer** — Többügynökös kreatív író alkalmazás Azure AI Agent Service-szel, Bing Grounding-gal és Prompty-val  
  - **serverless-chat-langchainjs** — Serverless RAG Azure Functions + LangChain.js + Cosmos DB-vel, Ollama helyi fejlesztési támogatással  
  - **chat-with-your-data-solution-accelerator** — Vállalati RAG gyorsító admin portállal, Teams integrációval és PostgreSQL/Cosmos DB opciókkal  
  - **azure-ai-travel-agents** — Többügynökös MCP irányító referencia app szerverekkel .NET, Python, Java és TypeScript nyelveken  
  - **azd-ai-starter** — Minimális Azure AI infrastruktúra Bicep kezdősablon  
  - **🔗 Awesome AZD AI galéria hivatkozás** — Hivatkozás az [awesome-azd AI galériára](https://azure.github.io/awesome-azd/?tags=ai) (80+ sablon)  

#### Javítva  
- **🔗 agents.md navigáció**: Előző/Következő linkek most illeszkednek a 2. fejezet README leckesorához (Microsoft Foundry integráció → Ügynökök → AI modell telepítés)  
- **🔗 agents.md törött linkek**: `production-ai-practices.md` javítva `../chapter-08-production/production-ai-practices.md` (3 előfordulás)  
- **📦 agents.md elavult kód**: `opencensus` helyett `azure-monitor-opentelemetry` + OpenTelemetry SDK használata  
- **🐛 agents.md érvénytelen API**: A `max_tokens` átkerült a `create_agent()`-ből a `create_run()`-ba `max_completion_tokens` néven  
- **🔢 agents.md token számlálás**: A durva `len//4` becslést kiváltotta a `tiktoken.encoding_for_model()`  
- **azure-search-openai-demo**: Szolgáltatások javítva "Cognitive Search + App Service"-ről "Azure AI Search + Azure Container Apps"-re (alapértelmezett hoszt változás 2024 októberében)  
- **contoso-chat**: Leírás frissítve Azure AI Foundry + Prompty hivatkozással, hogy illeszkedjen a repo tényleges címéhez és technológiai stackjéhez  

#### Eltávolítva  
- **ai-document-processing**: Nem működő sablonhivatkozás törölve (a repo nem publikus AZD sablonként)  

#### Fejlesztve  
- **📝 agents.md gyakorlatok**: 1. gyakorlat mutatja a várt kimenetet és az `azd monitor` lépést; 2. gyakorlat teljes `FunctionTool` regisztrációs kódot tartalmaz; 3. gyakorlat pontatlan útmutatását konkrét `prepdocs.py` parancsok váltják fel  
- **📚 agents.md források**: Dokumentációs linkek frissítve az aktuális Azure AI Agent Service dokumentációra és gyorsindítóra  
- **📋 agents.md Következő lépések táblázata**: Hozzáadva AI Workshop Lab link, hogy teljes fejezet lefedettséget nyújtson  

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
#### Tanfolyam Navigáció Fejlesztés
**Ez a verzió javítja a README.md fejezeti navigációját egy továbbfejlesztett táblázatos formátummal.**

#### Változtatások
- **Tanfolyam Térkép Táblázat**: Közvetlen leckelinkekkel, időtartam becsléssel és összetettségi értékeléssel bővítve
- **Mappa Tisztítás**: Eltávolítva a felesleges régi mappák (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Ellenőrzés**: A Tanfolyam Térkép táblázat összes 21+ belső linkje ellenőrizve

### [v3.16.0] - 2026-02-05

#### Terméknév Frissítések
**Ez a verzió frissíti a termékhivatkozásokat a jelenlegi Microsoft márkanévre.**

#### Változtatások
- **Microsoft Foundry → Microsoft Foundry**: Minden hivatkozás frissítve a fordításon kívüli fájlokban
- **Azure AI Agent Service → Foundry Agents**: A szolgáltatás neve az aktuális márkahoz igazítva

#### Frissített fájlok
- `README.md` - Fő tanfolyam kezdőlap
- `changelog.md` - Verziótörténet
- `course-outline.md` - Tanfolyam szerkezet
- `docs/chapter-02-ai-development/agents.md` - AI ügynökök útmutatója
- `examples/README.md` - Példák dokumentációja
- `workshop/README.md` - Műhely kezdőlapja
- `workshop/docs/index.md` - Műhely index
- `workshop/docs/instructions/*.md` - Minden műhely utasítási fájl

---

### [v3.15.0] - 2026-02-05

#### Jelentős Tároló Átszervezés: Fejezet alapú Mappanevek
**Ez a verzió külön fejezet mappákra szervezi az dokumentációt a tisztább navigáció érdekében.**

#### Mappa Átnevezések
A régi mappák helyett fejezet-számozott mappák kerültek:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Újonnan létrehozva: `docs/chapter-05-multi-agent/`

#### Fájl Áthelyezések
| Fájl | Innen | Ide |
|------|-------|-----|
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
| Minden előtelepítési fájl | pre-deployment/ | chapter-06-pre-deployment/ |
| Minden hibakeresési fájl | troubleshooting/ | chapter-07-troubleshooting/ |

#### Hozzáadott
- **📚 Fejezet README fájlok**: Minden fejezet mappában készült README.md:
  - Tanulási célok és időtartam
  - Lecke táblázat leírásokkal
  - Gyorsindító parancsok
  - Navigáció más fejezetekhez

#### Változtatott
- **🔗 Minden belső link frissítve**: Több mint 78 útvonal módosítva az összes dokumentációs fájlban
- **🗺️ Fő README.md**: Tanfolyam térkép frissítve az új fejezeti szerkezet szerint
- **📝 examples/README.md**: Frissítve a fejezet mappákra mutató hivatkozások

#### Eltávolítva
- Régi mappaszerkezet (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Tároló Átszervezés: Fejezeti Navigáció
**Ez a verzió hozzáadta a fejezeti navigációs README fájlokat (felülírva a v3.15.0 által).**

---

### [v3.13.0] - 2026-02-05

#### Új AI Ügynök Útmutató
**Ez a verzió egy átfogó útmutatót ad az AI ügynökök telepítéséhez Azure Developer CLI-vel.**

#### Hozzáadott
- **🤖 docs/microsoft-foundry/agents.md**: Teljes útmutató a következőkről:
  - Mi az AI ügynök és miben különbözik a chatbotoktól
  - Három gyorsindító ügynök sablon (Foundry Agents, Prompty, RAG)
  - Ügynök architektúra minták (egy ügynök, RAG, több ügynök)
  - Eszköz konfiguráció és testreszabás
  - Monitorozás és metrikakövetés
  - Költségfigyelés és optimalizálás
  - Gyakori hibakeresési esetek
  - Három gyakorlati feladat sikerkritériummal

#### Tartalmi Felépítés
- **Bevezető**: Ügynök fogalmak kezdőknek
- **Gyors Indítás**: Ügynökök telepítése `azd init --template get-started-with-ai-agents` parancsal
- **Architektúra Minták**: Ügynök minták vizuális ábrái
- **Konfiguráció**: Eszköz beállítása és környezeti változók
- **Monitorozás**: Application Insights integráció
- **Gyakorlatok**: Fokozatos kézhezálló tanulás (20-45 perc/feladat)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Környezet Frissítés
**Ez a verzió frissíti a fejlesztői konténer konfigurációt modern eszközökkel és jobb alapbeállításokkal az AZD tanulási élményhez.**

#### Változtatások
- **🐳 Alapkép**: Frissítve a `python:3.12-bullseye` verzióról `python:3.12-bookworm`-re (legfrissebb Debian stabil)
- **📛 Konténer Név**: Átnevezve "Python 3"-ról "AZD for Beginners"-re a jobb érthetőségért

#### Hozzáadott
- **🔧 Új Dev Container funkciók**:
  - `azure-cli` Bicep támogatással
  - `node:20` (AZD sablonokhoz LTS verzió)
  - `github-cli` sablonkezeléshez
  - `docker-in-docker` konténer alkalmazás telepítésekhez

- **🔌 Port Továbbítás**: Előre konfigurált portok megszokott fejlesztéshez:
  - 8000 (MkDocs előnézet)
  - 3000 (Webalkalmazások)
  - 5000 (Python Flask)
  - 8080 (API-k)

- **🧩 Új VS Code Kiterjesztések**:
  - `ms-python.vscode-pylance` - Fejlett Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions támogatás
  - `ms-azuretools.vscode-docker` - Docker támogatás
  - `ms-azuretools.vscode-bicep` - Bicep nyelvtámogatás
  - `ms-azure-devtools.azure-resource-groups` - Azure erőforrás menedzsment
  - `yzhang.markdown-all-in-one` - Markdown szerkesztés
  - `DavidAnson.vscode-markdownlint` - Markdown ellenőrzés
  - `bierner.markdown-mermaid` - Mermaid diagramok támogatása
  - `redhat.vscode-yaml` - YAML támogatás (azure.yaml-hoz)
  - `eamodio.gitlens` - Git vizualizáció
  - `mhutchie.git-graph` - Git történet

- **⚙️ VS Code Beállítások**: Alapértelmezett beállítások a Python interpreterhez, automatikus formázáshoz mentéskor és szóközök vágásához

- **📦 Frissített requirements-dev.txt**:
  - MkDocs minify plugin hozzáadva
  - pre-commit a kódminőséghez hozzáadva
  - Azure SDK csomagok hozzáadva (azure-identity, azure-mgmt-resource)

#### Javítva
- **Post-Create Parancs**: Most ellenőrzi az AZD és Azure CLI telepítését a konténer indításakor

---

### [v3.11.0] - 2026-02-05

#### Kezdőbarát README Átalakítás
**Ez a verzió jelentősen javítja a README.md fájlt kezdők számára és alapvető forrásokat ad az AI fejlesztőknek.**

#### Hozzáadott
- **🆚 Azure CLI vs AZD összehasonlítás**: Világos magyarázat mikor melyik eszközt használjuk, gyakorlati példákkal
- **🌟 Nagyszerű AZD linkek**: Közvetlen linkek a közösségi sablongaléria és hozzájárulások erőforrásaihoz:
  - [Awesome AZD Galéria](https://azure.github.io/awesome-azd/) - Több mint 200 telepítésre kész sablon
  - [Sablon Beküldése](https://github.com/Azure/awesome-azd/issues) - Közösségi hozzájárulás
- **🎯 Gyors Indítás Útmutató**: Egyszerűsített 3 lépéses kezdés (Telepítés → Bejelentkezés → Telepítés)
- **📊 Tapasztalat alapú navigációs táblázat**: Világos útmutatás fejlesztői tapasztalat szerint hol kezdjünk

#### Változtatott
- **README Strukturálás**: Progresszív feltárás az alapvető információkkal először
- **Bevezető Szekció**: Újranyírva az "azd up varázslatáról" teljesen kezdőknek
- **Duplikált Tartalom Eltávolítása**: Ismétlődő hibakeresési szakasz törölve
- **Hibakeresési Parancsok**: Javítva `azd logs` hivatkozás `azd monitor --logs` helyett

#### Javítva
- **🔐 Hitelesítési Parancsok**: Hozzáadva `azd auth login` és `azd auth logout` a cheat-sheet.md-hez
- **Érvénytelen Parancs Hivatkozások**: Minden maradék `azd logs` eltávolítva a README hibakeresési szakaszból

#### Megjegyzések
- **Hatókör**: Változások a fő README.md és resources/cheat-sheet.md fájlokban
- **Célközönség**: Kifejezetten AZD-t kezdő fejlesztőknek szánt fejlesztések

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Parancs Pontosság Frissítés
**Ez a verzió javítja az érvénytelen AZD parancsokat a dokumentációban, így minden példa érvényes Azure Developer CLI szintaxist használ.**

#### Javítva
- **🔧 Nem létező AZD parancsok eltávolítása**: Átfogó audit és javítás:
  - `azd logs` (nem létezik) → helyette `azd monitor --logs` vagy Azure CLI alternatívák
  - `azd service` alparancsok (nem léteznek) → helyett `azd show` és Azure CLI
  - `azd infra import/export/validate` (nem léteznek) → eltávolítva vagy helyettesítve
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flag-ek (nem léteznek) → eltávolítva
  - `azd provision --what-if/--rollback` flag-ek (nem léteznek) → módosítva `--preview` használatra
  - `azd config validate` (nem létezik) → helyett `azd config list`
  - `azd info`, `azd history`, `azd metrics` (nem léteznek) → eltávolítva

- **📚 Parancs javításokat tartalmazó fájlok**:
  - `resources/cheat-sheet.md`: Komoly parancs referencia átdolgozás
  - `docs/deployment/deployment-guide.md`: Javítva rollback és telepítési stratégiák
  - `docs/troubleshooting/debugging.md`: Log elemzési szakasz javítása
  - `docs/troubleshooting/common-issues.md`: Hibakeresési parancsok frissítve
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD hibakeresési szakasz javítva
  - `docs/getting-started/azd-basics.md`: Monitorozási parancsok javítva
  - `docs/getting-started/first-project.md`: Monitorozási és hibakeresési példák frissítve
  - `docs/getting-started/installation.md`: Segítség és verzió példák javítva
  - `docs/pre-deployment/application-insights.md`: Naplómegtekintő parancsok javítva
  - `docs/pre-deployment/coordination-patterns.md`: Ügynök hibakeresési parancsok javítva

- **📝 Verzió Hivatkozás Frissítve**: 
  - `docs/getting-started/installation.md`: Keménykódolt `1.5.0` verzió helyett generikus `1.x.x` linkkel a kiadásokhoz

#### Változtatott
- **Rollback Stratégiák**: Dokumentáció frissítve Git alapú rollback-re (AZD natív rollback nélkül)
- **Napló Megtekintés**: `azd logs` hivatkozások helyett `azd monitor --logs`, `azd monitor --live` és Azure CLI parancsok
- **Teljesítmény Szekció**: Nem létező párhuzamos/incrementális telepítési flag-ek eltávolítva, helyettesítve érvényes alternatívákkal

#### Műszaki Részletek
- **Érvényes AZD parancsok**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Érvényes azd monitor flag-ek**: `--live`, `--logs`, `--overview`
- **Eltávolított funkciók**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Megjegyzések
- **Ellenőrzés**: Parancsok validálva Azure Developer CLI v1.23.x verzióval

---

### [v3.9.0] - 2026-02-05

#### Műhely Befejezés és Dokumentáció Minőség Frissítés
**Ez a verzió befejezi az interaktív műhely modulokat, javítja az összes hibás dokumentációs linket, és növeli az AI fejlesztők Microsoft AZD használati élményét.**

#### Hozzáadott
- **📝 CONTRIBUTING.md**: Új hozzájárulási irányelveket tartalmazó dokumentum:
  - Világos útmutatás hibajelentéshez és módosítási javaslatokhoz
  - Dokumentációs szabványok új tartalomhoz
  - Kódpélda irányelvek és commit üzenet konvenciók
  - Közösségi részvételi információk

#### Elkészült
- **🎯 Workshop Modul 7 (Összefoglaló)**: Teljesen elkészült összefoglaló modul a következőkkel:
  - Átfogó összefoglaló a workshop eredményeiről
  - Alapvető fogalmak elsajátítása rész AZD, sablonok és Microsoft Foundry témakörében
  - Tanulási út folytatására vonatkozó ajánlások
  - Workshop kihívás gyakorlatok nehézségi besorolásokkal
  - Közösségi visszajelzések és támogatási linkek

- **📚 Workshop Modul 3 (Szétbontás)**: Frissített tanulási célok a következőkkel:
  - GitHub Copilot MCP szerverekkel való aktiválásának útmutatója
  - AZD sablon mappastruktúra megértése
  - Infrastruktúra mint kód (Bicep) szervezési minták
  - Gyakorlati labor utasítások

- **🔧 Workshop Modul 6 (Lebontás)**: Elkészült a következőkkel:
  - Erőforrás tisztítás és költségkezelési célok
  - `azd down` használata biztonságos infrastruktúra felszámoláshoz
  - Lágyan törölt kognitív szolgáltatások visszaállításának útmutatója
  - Bónusz felfedező feladatok GitHub Copilot és Azure Portal használatával

#### Javítva
- **🔗 Törött Linkek Javítása**: Több mint 15 törött belső dokumentációs link javítása:
  - `docs/ai-foundry/ai-model-deployment.md`: Helyes útvonalak microsoft-foundry-integration.md-re
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md és production-ai-practices.md helyes elérési útvonalainak javítása
  - `docs/getting-started/first-project.md`: Nem létező cicd-integration.md helyébe deployment-guide.md beillesztése
  - `examples/retail-scenario.md`: Gyakran ismételt kérdések és hibakeresési útmutató útvonalainak javítása
  - `examples/container-app/microservices/README.md`: Tanfolyam kezdőlap és telepítési útmutató elérési útvonalainak helyesbítése
  - `resources/faq.md` és `resources/glossary.md`: AI fejezet hivatkozások frissítése
  - `course-outline.md`: Oktatói útmutató és AI workshop labor hivatkozások javítása

- **📅 Workshop Állapot Bannner**: Frissítve "Építés alatt" státuszról aktív workshop státuszra, dátum: 2026 február

- **🔗 Workshop Navigáció**: Javítva törött navigációs linkek a workshop README.md-ben, amelyek a nem létező lab-1-azd-basics mappára mutattak

#### Módosítva
- **Workshop Bemutató**: Eltávolítva az "építés alatt" figyelmeztetés, a workshop most már teljes és használatra kész
- **Navigáció Összhang**: Biztosítva, hogy minden workshop modul megfelelő modulok közötti navigációval rendelkezzen
- **Tanulási Út Hivatkozások**: Frissítve a fejezeti hivatkozások microsoft-foundry helyes útvonalakra

#### Ellenőrizve
- ✅ Minden angol nyelvű markdown fájl érvényes belső linkekkel rendelkezik
- ✅ A 0-7 workshop modulok teljes tanulási célokat tartalmaznak
- ✅ A fejezetek és modulok közötti navigáció megfelelően működik
- ✅ A tartalom alkalmas AI fejlesztők számára, akik Microsoft AZD-t használnak
- ✅ Kezdőbarát nyelvezet és struktúra végig fenntartva
- ✅ CONTRIBUTING.md világos útmutatást kínál a közösségi hozzájárulóknak

#### Műszaki Megvalósítás
- **Linkellenőrzés**: Automatizált PowerShell szkript ellenőrizte az összes .md belső linket
- **Tartalom Audit**: Manuális áttekintés a workshop teljességének és kezdőknek való alkalmasságának ellenőrzésére
- **Navigációs Rendszer**: Egységes fejezet- és modul navigációs minták alkalmazása

#### Megjegyzések
- **Hatókör**: Csak az angol nyelvű dokumentációra alkalmazott változtatások
- **Fordítások**: A fordítási mappák nem frissültek ebben a verzióban (automatizált fordítás később szinkronizálódik)
- **Workshop Időtartama**: A teljes workshop most 3-4 órányi gyakorlati tanulást biztosít

---

### [v3.8.0] - 2025-11-19

#### Fejlett Dokumentáció: Monitorozás, Biztonság és Többügynökös Minták
**Ez a verzió átfogó A szintű leckéket tartalmaz az Application Insights integrációról, hitelesítési mintákról és többügynökös koordinációról termelési környezetben.**

#### Hozzáadva
- **📊 Application Insights Integrációs Lecke**: a `docs/pre-deployment/application-insights.md` fájlban:
  - AZD-központú telepítés automatikus erőforrás létrehozással
  - Teljes Bicep sablonok az Application Insights + Log Analytics-hez
  - Működő Python alkalmazások egyedi telemetriával (1,200+ sor)
  - AI/LLM monitorozási minták (Microsoft Foundry Modellek token/költség nyomon követése)
  - 6 Mermaid diagram (architektúra, elosztott követés, telemetria folyamat)
  - 3 gyakorlati feladat (riasztások, műszerfalak, AI monitorozás)
  - Kusto lekérdezési példák és költségoptimalizálási stratégiák
  - Élő metrikák streamelése és valós idejű hibakeresés
  - 40-50 perces tanulási idő, termelésre kész minták

- **🔐 Hitelesítési és Biztonsági Minták Lecke**: a `docs/getting-started/authsecurity.md` fájlban:
  - 3 hitelesítési minta (kapcsolati karakterláncok, Key Vault, kezelt azonosító)
  - Teljes Bicep infrastruktúra sablonok biztonságos telepítéshez
  - Node.js alkalmazáskód Azure SDK integrációval
  - 3 teljes gyakorlat (kezelt azonosító engedélyezése, felhasználóhoz rendelt azonosító, Key Vault forgatás)
  - Biztonsági legjobb gyakorlatok és RBAC konfigurációk
  - Hibakeresési útmutató és költségelemzés
  - Termelésre kész jelszó nélküli hitelesítési minták

- **🤖 Többügynökös Koordinációs Minták Lecke**: a `docs/pre-deployment/coordination-patterns.md` fájlban:
  - 5 koordinációs minta (sorozatos, párhuzamos, hierarchikus, eseményvezérelt, konszenzus)
  - Teljes orchestrator szolgáltatás implementáció (Python/Flask, 1,500+ sor)
  - 3 specializált ügynök implementáció (Kutató, Író, Szerkesztő)
  - Service Bus integráció üzenetküldéshez
  - Cosmos DB állapotkezelés elosztott rendszerekhez
  - 6 Mermaid diagram az ügynökök kölcsönhatásairól
  - 3 haladó gyakorlat (timeout kezelés, újrapróbálkozás, áramkör megszakító)
  - Költség bontás (240-565 USD/hónap) optimalizálási stratégiákkal
  - Application Insights integráció monitorozáshoz

#### Fejlesztve
- **Előtelepítési Fejezet**: Most átfogó monitorozási és koordinációs mintákat tartalmaz
- **Kezdő lépések** Fejezet: Professzionális hitelesítési mintákkal bővítve
- **Termelésre készség**: Teljes körű lefedettség a biztonságtól az észlelhetőségig
- **Tanfolyam Vázlat**: Frissítve az új leckékre való utalásokkal a 3. és 6. fejezetben

#### Módosítva
- **Tanulási Folyamat**: Jobb biztonsági és monitorozási integráció a tanfolyam során
- **Dokumentáció Minőség**: Következetes A szintű szabványok (95-97%) az új leckékben
- **Termelési Minták**: Teljes körű, end-to-end lefedettség vállalati telepítésekhez

#### Fejlesztve
- **Fejlesztői Élmény**: Tiszta út a fejlesztéstől a termelési monitorozásig
- **Biztonsági Szabványok**: Professzionális minták hitelesítéshez és titokkezeléshez
- **Észlelhetőség**: Teljes Application Insights integráció AZD-vel
- **AI Munkaterhelések**: Specializált monitorozás Microsoft Foundry Modellek és többügynökös rendszerek számára

#### Ellenőrizve
- ✅ Minden lecke komplett működő kóddal rendelkezik (nem csak részletek)
- ✅ Mermaid diagramok a vizuális tanuláshoz (összesen 19 3 leckében)
- ✅ Gyakorlati feladatok ellenőrzési lépésekkel (összesen 9)
- ✅ Termelésre kész Bicep sablonok telepíthetők `azd up` segítségével
- ✅ Költségelemzés és optimalizálási stratégiák
- ✅ Hibakeresési útmutatók és legjobb gyakorlatok
- ✅ Tudásellenőrző parancsokkal

#### Dokumentáció Minősítés Eredményei
- **docs/pre-deployment/application-insights.md**: - Átfogó monitorozási útmutató
- **docs/getting-started/authsecurity.md**: - Professzionális biztonsági minták
- **docs/pre-deployment/coordination-patterns.md**: - Fejlett többügynökös architektúrák
- **Összességében Új Tartalom**: - Következetesen magas minőségi szabványok

#### Műszaki Megvalósítás
- **Application Insights**: Log Analytics + egyedi telemetria + elosztott követés
- **Hitelesítés**: Kezelt azonosító + Key Vault + RBAC minták
- **Többügynökös**: Service Bus + Cosmos DB + Container Apps + orchestráció
- **Monitorozás**: Élő metrikák + Kusto lekérdezések + riasztások + műszerfalak
- **Költségkezelés**: Mintavételi stratégiák, megőrzési szabályok, költségkeret ellenőrzése

### [v3.7.0] - 2025-11-19

#### Dokumentáció Minőségjavítások és Új Microsoft Foundry Modellek Példa
**Ez a verzió a dokumentáció minőségét javítja a teljes tárban és hozzáad egy teljes Microsoft Foundry Modellek telepítési példát gpt-4.1 chat felülettel.**

#### Hozzáadva
- **🤖 Microsoft Foundry Modellek Chat Példa**: Teljes gpt-4.1 telepítés működő implementációval az `examples/azure-openai-chat/` mappában:
  - Teljes Microsoft Foundry Modellek infrastruktúra (gpt-4.1 modell telepítés)
  - Python parancssoros chat felület beszélgetési előzményekkel
  - Key Vault integráció biztonságos API kulcs tároláshoz
  - Token használat nyomon követése és költségbecslés
  - Sebességkorlátozás és hibakezelés
  - Átfogó README 35-45 perces telepítési útmutatóval
  - 11 termelésre kész fájl (Bicep sablonok, Python alkalmazás, konfiguráció)
- **📚 Dokumentációs Gyakorlatok**: Gyakorlati példák hozzáadása a konfigurációs útmutatóhoz:
  - Gyakorlat 1: Több környezet konfigurációja (15 perc)
  - Gyakorlat 2: Titokkezelési gyakorlat (10 perc)
  - Egyértelmű sikerfeltételek és ellenőrzési lépések
- **✅ Telepítés Ellenőrzés**: Ellenőrzési szekció hozzáadva a telepítési útmutatóhoz:
  - Állapot ellenőrzési eljárások
  - Sikerfeltételek listája
  - Várt eredmények az összes telepítési parancshoz
  - Gyors hibakeresési hivatkozás

#### Fejlesztve
- **examples/README.md**: A-szintű minőségre frissítve (93%):
  - azure-openai-chat hozzáadása minden releváns szakaszhoz
  - Helyi példák száma 3-ról 4-re frissítve
  - AI alkalmazási példák táblázatába beillesztve
  - Középhaladó gyors indulás integrációja
  - Microsoft Foundry Sablonok szekcióba integrálva
  - Összehasonlító mátrix és technológia/architektúra hivatkozások frissítve
- **Dokumentáció Minőség**: B+ (87%) → A- (92%) javítva a docs mappában:
  - Várt eredmények hozzáadva kritikus parancs példákhoz
  - Ellenőrzési lépések a konfiguráció változásokhoz
  - Gyakorlati tanulás fejlesztése gyakorlati feladatokkal

#### Módosítva
- **Tanulási Folyamat**: Jobb AI példák integrálása középhaladó tanulók számára
- **Dokumentáció Struktúra**: Több cselekvésorientált gyakorlat világos eredményekkel
- **Ellenőrzési Folyamat**: Egyértelmű sikerfeltételek hozzárendelése kulcsfolyamatokhoz

#### Fejlesztve
- **Fejlesztői Élmény**: Microsoft Foundry Modellek telepítése 35-45 percig tart most (a korábbi 60-90 helyett)
- **Költség Átláthatóság**: Egyértelmű költségbecslés ($50-200/hó) a Microsoft Foundry Modellek példához
- **Tanulási Út**: AI fejlesztőknek világos belépési pont az azure-openai-chat segítségével
- **Dokumentációs Szabványok**: Következetes várt eredmények és ellenőrzési lépések

#### Ellenőrizve
- ✅ Microsoft Foundry Modellek példa teljesen működőképes `azd up`-pal
- ✅ Minden 11 implementációs fájl szintaktikailag helyes
- ✅ README utasítások megfelelnek a tényleges telepítési élménynek
- ✅ Dokumentációs linkek frissítve több mint 8 helyen
- ✅ Példák indexe pontosan tükrözi a 4 helyi példát
- ✅ Nincs duplikált külső link a táblázatokban
- ✅ Minden navigációs hivatkozás helyes

#### Műszaki Megvalósítás
- **Microsoft Foundry Modellek Architektúra**: gpt-4.1 + Key Vault + Container Apps minta
- **Biztonság**: Kezelt azonosító készen áll, titkok Key Vault-ban
- **Monitorozás**: Application Insights integráció
- **Költségkezelés**: Token nyomon követés és használat optimalizálása
- **Telepítés**: Egyetlen `azd up` parancs teljes beállításhoz

### [v3.6.0] - 2025-11-19

#### Nagy Frissítés: Container App Telepítési Példák
**Ez a verzió átfogó, termelésre kész konténer alkalmazás telepítési példákat mutat be Azure Developer CLI (AZD) használatával, teljes dokumentációval és a tanulási útvonalba integrálva.**

#### Hozzáadva
- **🚀 Container App Példák**: Új helyi példák az `examples/container-app/` mappában:
  - [Mester Útmutató](examples/container-app/README.md): Teljes áttekintés konténeres telepítésekről, gyors indulás, termelés, és haladó minták
  - [Egyszerű Flask API](../../examples/container-app/simple-flask-api): Kezdőbarát REST API skálázással nullára, egészség probe-okkal, monitorozással és hibakereséssel
  - [Microservices Architektúra](../../examples/container-app/microservices): Termelésre kész több-szolgáltatásos telepítés (API Gateway, Termék, Rendelés, Felhasználó, Értesítés), aszinkron üzenetküldés, Service Bus, Cosmos DB, Azure SQL, elosztott követés, kék-zöld/kanaáris telepítés
- **Legjobb Gyakorlatok**: Biztonság, monitorozás, költségoptimalizálás és CI/CD útmutatás konténeres munkaterhelésekhez
- **Kódminták**: Teljes `azure.yaml`, Bicep sablonok, többnyelvű szolgáltatás implementációk (Python, Node.js, C#, Go)
- **Tesztelés & Hibakeresés**: End-to-end tesztesetek, monitorozó parancsok, hibakeresési útmutató

#### Módosítva
- **README.md**: Frissítve az új container app példák bemutatásával és linkelésével a "Local Examples - Container Applications" alatt
- **examples/README.md**: Frissítve, hogy hangsúlyozza a container app példákat, összehasonlító mátrix bejegyzések hozzáadása, valamint technológia/architektúra hivatkozások frissítése
- **Tanfolyam Vázlat & Tanulmányi Útmutató**: Frissítve, hogy hivatkozzon az új container app példákra és telepítési mintákra a releváns fejezetekben

#### Ellenőrizve
- ✅ Minden új példa telepíthető `azd up`-pal és követi a legjobb gyakorlatokat
- ✅ Dokumentációs kereszt-linkek és navigációk frissítve
- ✅ Példák kezdőtől haladó szcenáriókig terjednek, beleértve termelésre kész mikroszolgáltatásokat

#### Megjegyzések
- **Hatókör**: Csak angol nyelvű dokumentáció és példák
- **Következő Lépések**: További haladó konténer minták és CI/CD automatizálás bővítése a jövőbeli kiadásokban

### [v3.5.0] - 2025-11-19

#### Termék Újramárkázás: Microsoft Foundry
**Ez a verzió teljes körű terméknév változtatást hajt végre a „Microsoft Foundry” névre minden angol nyelvű dokumentációban, tükrözve a Microsoft hivatalos újramárkázását.**

#### Módosítva
- **🔄 Terméknév Frissítés**: Teljes újramárkázás „Microsoft Foundry” névre
  - Frissítve minden hivatkozás az angol dokumentációban a `docs/` mappában
  - Mappa átnevezése: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Átnevezett fájl: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Összesen: 23 tartalmi hivatkozás frissítve 7 dokumentációs fájlban

- **📁 Mappaszerkezet változások**:
  - `docs/ai-foundry/` átnevezve `docs/microsoft-foundry/`-ra
  - Minden kereszt-hivatkozás frissítve az új mappastruktúrának megfelelően
  - Navigációs linkek ellenőrizve minden dokumentációban

- **📄 Fájlátnevezések**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Minden belső link frissítve az új fájlnévre hivatkozva

#### Frissített fájlok
- **Fejezet dokumentáció** (7 fájl):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigációs link frissítve
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 terméknév hivatkozás frissítve
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Már Microsoft Foundry használat (korábbi frissítésekből)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 hivatkozás frissítve (áttekintés, közösségi visszajelzés, dokumentáció)
  - `docs/getting-started/azd-basics.md` - 4 kereszt-hivatkozás frissítve
  - `docs/getting-started/first-project.md` - 2 fejezet navigációs link frissítve
  - `docs/getting-started/installation.md` - 2 következő fejezet link frissítve
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 hivatkozás frissítve (navigáció, Discord közösség)
  - `docs/troubleshooting/common-issues.md` - 1 navigációs link frissítve
  - `docs/troubleshooting/debugging.md` - 1 navigációs link frissítve

- **Kurzus struktúra fájlok** (2 fájl):
  - `README.md` - 17 hivatkozás frissítve (kurzus áttekintés, fejezetcímek, sablonok szekció, közösségi betekintések)
  - `course-outline.md` - 14 hivatkozás frissítve (áttekintés, tanulási célok, fejezet erőforrások)

#### Ellenőrizve
- ✅ Nulla maradék "ai-foundry" mappa útvonal hivatkozás az angol dokumentációkban
- ✅ Nulla maradék "Microsoft Foundry" terméknév hivatkozás az angol dokumentációkban
- ✅ Minden navigációs link működik az új mappastruktúrával
- ✅ Fájl- és mappanév átnevezések sikeresen megtörténtek
- ✅ Fejezetek közötti kereszt-hivatkozások validálva

#### Megjegyzések
- **Hatókör**: Változtatások csak az angol dokumentációra a `docs/` mappában
- **Fordítások**: Fordítási mappák (`translations/`) nem frissültek ebben a verzióban
- **Workshop**: Workshop anyagok (`workshop/`) nem frissültek ebben a verzióban
- **Példák**: Példafájlok még hivatkozhatnak régi elnevezésekre (a későbbi frissítés során javítandó)
- **Külső linkek**: Külső URL-ek és GitHub repozitórium hivatkozások változatlanok maradtak

#### Migrációs útmutató közreműködőknek
Ha helyi ágak vagy dokumentáció a régi struktúrát hivatkozza:
1. Frissítse a mappa hivatkozásokat: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Frissítse a fájl hivatkozásokat: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Cserélje a termék nevet: "Microsoft Foundry" → "Microsoft Foundry"
4. Ellenőrizze, hogy minden belső dokumentációs link működik

---

### [v3.4.0] - 2025-10-24

#### Infrastruktúra előnézet és validáció fejlesztések
**Ez a verzió átfogó támogatást nyújt az új Azure Developer CLI előnézeti funkcióhoz, továbbá javítja a workshop felhasználói élményt.**

#### Hozzáadva
- **🧪 azd provision --preview funkció dokumentációja**: Teljes lefedettség az új infrastruktúra előnézeti képességhez
  - Parancs hivatkozás és használati példák a cheat sheet-ben
  - Részletes integráció a provisioning útmutatóban példákkal és előnyökkel
  - Pre-flight ellenőrzés beépítve a biztonságosabb telepítéshez
  - Kezdő útmutató frissítése a biztonságos telepítési gyakorlatokkal
- **🚧 Workshop állapot banner**: Professzionális HTML banner a workshop fejlesztési státuszáról
  - Gradiensek tervvel és építés jelzőkkel a felhasználók tájékoztatására
  - Utolsó frissítés időbélyege átláthatóságért
  - Mobil eszközökre optimalizált megjelenés

#### Fejlesztve
- **Infrastruktúra biztonság**: Az előnézeti funkció integrálva a telepítési dokumentációkba
- **Előtelepítési validáció**: Automatizált szkriptek tartalmazzák az infrastruktúra előnézeti teszteket
- **Fejlesztői munkafolyamat**: Parancsok frissítése az előnézet használatával ajánlott gyakorlatként
- **Workshop élmény**: Egyértelmű kommunikáció a tartalom fejlesztési állapotáról

#### Változtatva
- **Telepítési legjobb gyakorlatok**: Az előnézet első munkafolyamat mostantól ajánlott megközelítés
- **Dokumentáció folyamata**: Az infrastruktúra validáció korábbra került a tanulási folyamatban
- **Workshop bemutatás**: Profi státusz kommunikáció világos fejlesztési idővonal mellett

#### Javított
- **Biztonság-központú megközelítés**: Az infrastruktúra változtatások telepítés előtti validálhatósága
- **Csapat együttműködés**: Az előnézeti eredmények megoszthatók véleményezésre és jóváhagyásra
- **Költségtudatosság**: Jobb megértés az erőforrás-költségekről előzetesen
- **Kockázatcsökkentés**: Csökkentett telepítési hibák előzetes validációval

#### Műszaki megvalósítás
- **Több dokumentum integráció**: Az előnézeti funkció dokumentálva 4 fő fájlban
- **Parancs minták**: Egységes szintaxis és példák a dokumentáció minden részén
- **Legjobb gyakorlat integráció**: Előnézet beépítve a validációs munkafolyamatokba és szkriptekbe
- **Vizuális jelzések**: Egyértelmű ÚJ funkció jelölések a könnyű felfedezhetőségért

#### Workshop infrastruktúra
- **Állapot kommunikáció**: Professzionális HTML banner gradient stílusban
- **Felhasználói élmény**: Egyértelmű fejlesztési státusz a félreértések elkerülésére
- **Professzionális megjelenés**: Megőrzi a repozitórium hitelességét és elvárások beállítása
- **Idővonal átláthatóság**: 2025 októberi utolsó frissítés időbélyege a felelősség biztosítására

### [v3.3.0] - 2025-09-24

#### Kibővített workshop anyagok és interaktív tanulási élmény
**Ez a verzió átfogó workshop anyagokat vezet be böngésző alapú interaktív útmutatókkal és strukturált tanulási utakra.**

#### Hozzáadva
- **🎥 Interaktív workshop útmutató**: Böngésző alapú workshop élmény MkDocs előnézettel
- **📝 Strukturált workshop utasítások**: 7 lépésből álló vezetett tanulási út a felfedezéstől a testreszabásig
  - 0-Bevezetés: Workshop áttekintés és beállítás
  - 1-Select-AI-Template: Sablon felfedezés és kiválasztás folyamata
  - 2-Validate-AI-Template: Telepítési és validálási eljárások
  - 3-Deconstruct-AI-Template: Sablon architektúra megértése
  - 4-Configure-AI-Template: Konfiguráció és testreszabás
  - 5-Customize-AI-Template: Fejlett módosítások és iterációk
  - 6-Teardown-Infrastructure: Takarítás és erőforrás menedzsment
  - 7-Összegzés: Összefoglalás és további lépések
- **🛠️ Workshop eszközök**: MkDocs anyag Material témával a jobb tanulási élményért
- **🎯 Gyakorlati tanulási út**: 3 lépéses módszertan (Felfedezés → Telepítés → Testreszabás)
- **📱 GitHub Codespaces integráció**: Zökkenőmentes fejlesztői környezet beállítás

#### Fejlesztve
- **AI Workshop labor**: Kiterjesztve átfogó 2-3 órás strukturált tanulási élménnyel
- **Workshop dokumentáció**: Professzionális bemutatás navigációval és vizuális segédletekkel
- **Tanulási folyamat**: Egyértelmű lépésről-lépésre útmutatás a sablon kiválasztástól a gyártásra telepítésig
- **Fejlesztői élmény**: Integrált eszközök egyszerűsített fejlesztési munkafolyamatokhoz

#### Javított
- **Hozzáférhetőség**: Böngésző alapú felület kereséssel, kód másolási funkcióval és téma kapcsolóval
- **Önálló tanulás**: Rugalmas workshop struktúra különböző tanulási sebességekhez
- **Gyakorlati alkalmazás**: Valós AI sablon telepítési forgatókönyvek
- **Közösségi integráció**: Discord integráció workshop támogatásra és együttműködésre

#### Workshop funkciók
- **Beépített keresés**: Gyors kulcsszó és lecke felfedezés
- **Kódrészlet másolás**: Egér fölé vitt másolás minden kód példához
- **Téma váltás**: Sötét/világos mód támogatás eltérő preferenciákhoz
- **Vizuális elemek**: Képernyőképek és diagramok a jobb megértésért
- **Segítség integráció**: Közvetlen Discord elérés közösségi támogatáshoz

### [v3.2.0] - 2025-09-17

#### Jelentős navigációs átalakítás és fejezet-alapú tanulási rendszer
**Ez a verzió egy átfogó fejezet-alapú tanulási struktúrát vezet be a teljes repozitóriumban fejlesztett navigációval.**

#### Hozzáadva
- **📚 Fejezet-alapú tanulási rendszer**: Teljes kurzus átszervezése 8 egymásra épülő tanulási fejezetre
  - 1. fejezet: Alapok & Gyors kezdés (⭐ - 30-45 perc)
  - 2. fejezet: AI-első fejlesztés (⭐⭐ - 1-2 óra)
  - 3. fejezet: Konfiguráció & Hitelesítés (⭐⭐ - 45-60 perc)
  - 4. fejezet: Infrastruktúra mint kód & Telepítés (⭐⭐⭐ - 1-1,5 óra)
  - 5. fejezet: Több-ügynökös AI megoldások (⭐⭐⭐⭐ - 2-3 óra)
  - 6. fejezet: Előtelepítési validáció & tervezés (⭐⭐ - 1 óra)
  - 7. fejezet: Hibaelhárítás & Debug (⭐⭐ - 1-1,5 óra)
  - 8. fejezet: Gyártás & Vállalati minták (⭐⭐⭐⭐ - 2-3 óra)
- **📚 Átfogó navigációs rendszer**: Egységes navigációs fejléc és lábléc minden dokumentumban
- **🎯 Előrehaladás követés**: Kurzus befejezési lista és tanulási ellenőrző rendszer
- **🗺️ Tanulási útirányítás**: Egyértelmű belépési pontok különböző tapasztalati szintek és célok szerint
- **🔗 Kereszt-hivatkozás navigáció**: Kapcsolódó fejezetek és előfeltételek világos linkeléssel

#### Fejlesztve
- **README struktúra**: Szerkezetet kapott tanulási platformként, fejezet-alapú szervezéssel
- **Dokumentáció navigáció**: Minden oldal tartalmazza a fejezet kontextust és haladási útmutatást
- **Sablonok szervezése**: Példák és sablonok hozzárendelve a megfelelő tanulási fejezetekhez
- **Erőforrás integráció**: Cheat sheet-ek, GYIK és tanulmányi segédletek fejezetekhez kapcsolva
- **Workshop integráció**: Gyakorlati laborok több fejezet tanulási céljaihoz rendelve

#### Változtatva
- **Tanulási folyamat**: Lineáris dokumentációról rugalmas, fejezet-alapú tanulásra váltás
- **Konfiguráció elhelyezés**: Konfigurációs útmutató áthelyezése a 3. fejezetbe jobb tanulási folyamat érdekében
- **AI tartalom integráció**: Jobb AI-specifikus tartalom átfogó integráció a tanulási folyamatban
- **Gyártási tartalom**: Fejlett minták összefoglalva a 8. fejezetben vállalati tanulók számára

#### Javított
- **Felhasználói élmény**: Egyértelmű navigációs morzsák és fejezet haladási jelek
- **Hozzáférhetőség**: Egységes navigációs minták a könnyebb tanulási út átjárhatóságért
- **Professzionális bemutatás**: Egyetemi stílusú kurzus szerkezet akadémiai és vállalati képzéshez
- **Tanulási hatékonyság**: Csökkentett idő a releváns tartalom megtalálásához jobb szervezéssel

#### Műszaki megvalósítás
- **Navigációs fejléc**: Standardizált fejezet navigáció 40+ dokumentációs fájlban
- **Lábléc navigáció**: Egységes haladási útmutatás és fejezet lezárási jelek
- **Kereszt-linkelés**: Átfogó belső linkrendszer az összefüggő fogalmak kapcsolására
- **Fejezet hozzárendelés**: Sablonok és példák egyértelműen társítva tanulási célokhoz

#### Tanulmányi segédlet fejlesztés
- **📚 Átfogó tanulási célok**: Tanulmányi segédlet átszervezve a 8-fejezetes rendszerhez
- **🎯 Fejezet-alapú értékelés**: Minden fejezethez specifikus tanulási célok és gyakorlati feladatok tartoznak
- **📋 Előrehaladás követés**: Heti tanulási ütemterv mérhető eredményekkel és befejezési listával
- **❓ Értékelési kérdések**: Tudásellenőrző kérdések minden fejezethez professzionális kimenetekkel
- **🛠️ Gyakorlati feladatok**: Gyakorlati tevékenységek valós telepítési forgatókönyvekkel és hibakereséssel
- **📊 Képességfejlesztés**: Egyértelmű előrehaladás az alapfogalmaktól a vállalati mintákig karrierfejlesztési fókuszáltsággal
- **🎓 Tanúsítási keretrendszer**: Professzionális fejlődési eredmények és közösségi elismerési rendszer
- **⏱️ Időzítés menedzsment**: Strukturált 10 hetes tanulási terv mérföldkő ellenőrzésekkel

### [v3.1.0] - 2025-09-17

#### Fejlesztett több-ügynökös AI megoldások
**Ez a verzió javítja a több-ügynökös kiskereskedelmi megoldást jobb ügynök elnevezéssel és fejlettebb dokumentációval.**

#### Változtatva
- **Több-ügynökös terminológia**: Az „Cora agent” helyett „Customer agent” használata az egész kiskereskedelmi több-ügynökös megoldásban az egyértelműség érdekében
- **Ügynök architektúra**: Minden dokumentáció, ARM sablon és kód példa frissítve egységes „Customer agent” elnevezésre
- **Konfigurációs példák**: Modernizált ügynök konfigurációs minták frissített elnevezésekkel
- **Dokumentáció konzisztencia**: Minden hivatkozás egységes, professzionális, leíró ügynök nevet használ

#### Fejlesztve
- **ARM sablon csomag**: Frissítve retail-multiagent-arm-template Customer agent hivatkozásokkal
- **Architektúra diagramok**: Frissített Mermaid diagramok új ügynök nevek használatával
- **Kódpéldák**: Python osztályok és implementációs példák most CustomerAgent elnevezéssel
- **Környezeti változók**: Minden telepítési szkript frissítve CUSTOMER_AGENT_NAME konvencióval

#### Javított
- **Fejlesztői élmény**: Egyértelműbb ügynök szerepek és felelősségek a dokumentációban
- **Gyártásra készség**: Jobb illeszkedés vállalati elnevezési szabványokhoz
- **Tananyagok**: Érthetőbb ügynök elnevezés oktatási célokra
- **Sablon használhatóság**: Egyszerűbb ügynök funkciók megértése és telepítési minták

#### Műszaki részletek
- Frissített Mermaid architektúra diagramok CustomerAgent hivatkozásokkal
- CoraAgent osztálynév helyett CustomerAgent Python példákban
- ARM sablon JSON konfigurációk módosítva „customer” ügynök típus használatára
- Környezeti változók CORA_AGENT_* helyett CUSTOMER_AGENT_* mintákra cserélve
- Minden telepítő parancs és konténer konfiguráció frissítve

### [v3.0.0] - 2025-09-12

#### Jelentős változások - AI fejlesztő fókusz és Microsoft Foundry integráció
**Ez a verzió teljesen átalakítja a repozitóriumot átfogó AI-fókuszú tanulási forrássá Microsoft Foundry integrációval.**

#### Hozzáadva
- **🤖 AI-első tanulási út**: Teljes átrendezés AI fejlesztők és mérnökök előtérbe helyezésével
- **Microsoft Foundry integrációs útmutató**: Átfogó dokumentáció AZD és Microsoft Foundry szolgáltatások összekapcsolásához
- **AI modell telepítési minták**: Részletes útmutató modell kiválasztásról, konfigurációról és gyártásba helyezési stratégiákról
- **AI Műhely Labor**: 2-3 órás gyakorlati workshop AI-alkalmazások AZD-be telepíthető megoldásokká alakításához
- **Termelési AI Legjobb Gyakorlatok**: Vállalati szintű minták az AI munkaterhelések skálázásához, figyeléséhez és biztonságához
- **AI-specifikus Hibakeresési Útmutató**: Átfogó hibakeresés a Microsoft Foundry modellekhez, Kognitív Szolgáltatásokhoz és AI telepítési problémákhoz
- **AI Sablon Galéria**: Kiemelt Microsoft Foundry sablongyűjtemény komplexitási értékeléssel
- **Workshop Anyagok**: Teljes workshop struktúra gyakorlati laborokkal és referencia anyagokkal

#### Fejlesztett
- **README Struktúra**: AI fejlesztőknek szóló, 45% közösségi érdeklődési adattal a Microsoft Foundry Discord alapján
- **Tanulási Útvonalak**: Dedikált AI fejlesztői útvonalak a hagyományos hallgatói és DevOps mérnöki utak mellett
- **Sablonjavaslatok**: Kiemelt AI sablonok, többek között azure-search-openai-demo, contoso-chat és openai-chat-app-quickstart
- **Közösségi Integráció**: Fejlesztett Discord közösségi támogatás AI-specifikus csatornákkal és megbeszélésekkel

#### Biztonság & Termelési Fókusz
- **Kezelt Identitás Minták**: AI-specifikus hitelesítési és biztonsági beállítások
- **Költségoptimalizálás**: Tokenhasználat nyomon követése és költségkeret kontrollok az AI munkaterhelésekhez
- **Több-régiós Telepítés**: Stratégiák globális AI alkalmazások telepítéséhez
- **Teljesítményfigyelés**: AI-specifikus metrikák és Application Insights integráció

#### Dokumentáció Minőség
- **Lineáris Tanfolyam Struktúra**: Logikus előrehaladás kezdőtől haladó AI telepítési mintákig
- **Ellenőrzött URL-ek**: Minden külső tárhely link ellenőrzött és elérhető
- **Teljes Referencia**: Minden belső dokumentációs link ellenőrzött és működőképes
- **Termelésre Kész**: Vállalati telepítési minták valós példákkal

### [v2.0.0] - 2025-09-09

#### Főbb Változások - Tárhely Struktúra és Szakmai Fejlesztés  
**Ez a verzió jelentős átalakítást jelent a tárhely szerkezetében és a tartalom bemutatásában.**

#### Hozzáadva
- **Strukturált Tanulási Keretrendszer**: Minden dokumentációs oldal tartalmaz most Bevezetést, Tanulási Célokat és Eredményeket
- **Navigációs Rendszer**: Minden dokumentációs anyagban előző/következő leckék linkjei a vezetett tanuláshoz
- **Tanulmányi Útmutató**: Átfogó study-guide.md tanulási célokkal, gyakorlati feladatokkal és értékelési anyagokkal
- **Szakmai Megjelenés**: Minden emoji ikon eltávolítva jobb hozzáférhetőség és professzionális külalak érdekében
- **Fejlesztett Tartalom Struktúra**: Javított szervezettség és anyagáramlás

#### Módosítva
- **Dokumentáció Formátum**: Minden dokumentum egységes tanulás-központú struktúrára egységesítve
- **Navigációs Áramlás**: Logikus előrehaladás az összes tananyagon keresztül megvalósítva
- **Tartalom Bemutatás**: Dekoratív elemek eltávolítása, tiszta, professzionális formázásra váltás
- **Link Struktúra**: Minden belső link frissítve az új navigációs rendszer támogatására

#### Fejlesztve
- **Hozzáférhetőség**: Emoji-függőségek eltávolítása jobb képernyőolvasó kompatibilitásért
- **Szakmai Megjelenés**: Tiszta, akadémiai stílusú megjelenés vállalati tanuláshoz
- **Tanulási Élmény**: Strukturált megközelítés egyértelmű célokkal minden leckéhez
- **Tartalom Szervezés**: Jobb logikai összefüggés és kapcsolódás a témák között

### [v1.0.0] - 2025-09-09

#### Kezdő Kiadás - Átfogó AZD Tanulási Tárhely

#### Hozzáadva
- **Alapvető Dokumentációs Struktúra**
  - Teljes kezdő útmutató sorozat
  - Átfogó telepítési és előkészítési dokumentáció
  - Részletes hibakeresési források és hibakeresési útmutatók
  - Előtelepítési validációs eszközök és eljárások

- **Kezdő Modul**
  - AZD Alapok: Alapfogalmak és terminológia
  - Telepítési Útmutató: Platform-specifikus telepítési instrukciók
  - Konfigurációs Útmutató: Környezet beállítás és hitelesítés
  - Első Projekt Bemutató: Lépésről-lépésre gyakorlati tanulás

- **Telepítési és Előkészítési Modul**
  - Telepítési Útmutató: Teljes munkafolyamat dokumentáció
  - Előkészítési Útmutató: Infrastruktúra kód formájában Bicep-pel
  - Termelési telepítések legjobb gyakorlatai
  - Több szolgáltatásos architektúra minták

- **Előtelepítési Validációs Modul**
  - Kapacitástervezés: Azure erőforráselérhetőség érvényesítése
  - SKU választás: Átfogó szolgáltatási szint útmutató
  - Előzetes ellenőrzések: Automatikus validációs szkriptek (PowerShell és Bash)
  - Költségbecslés és költségvetés-tervező eszközök

- **Hibakeresési Modul**
  - Gyakori Problémák: Gyakran előforduló hibák és megoldások
  - Hibakeresési Útmutató: Rendszeres hibakeresési módszertanok
  - Fejlett diagnosztikai technikák és eszközök
  - Teljesítményfigyelés és optimalizálás

- **Források és Referenciák**
  - Parancs Gyorslap: Gyors referencia alapvető parancsokhoz
  - Szószedet: Átfogó terminológia és rövidítésjegyzék
  - GYIK: Részletes válaszok gyakori kérdésekre
  - Külső forrás linkek és közösségi kapcsolatok

- **Példák és Sablonok**
  - Egyszerű webalkalmazás példa
  - Statikus weboldal telepítési sablon
  - Konténeres alkalmazás konfiguráció
  - Adatbázis integrációs minták
  - Mikroszolgáltatások architektúra példák
  - Szerver nélküli függvény implementációk

#### Főbb Jellemzők
- **Többplatformos Támogatás**: Telepítési és konfigurációs útmutatók Windows, macOS és Linux rendszereken
- **Több Szintű Képesség**: Tartalom hallgatóktól a szakértő fejlesztőkig terjedően
- **Gyakorlati Fókusz**: Gyakorlati példák és valós életbeli forgatókönyvek
- **Átfogó Lefedettség**: Alapfogalmaktól a haladó vállalati mintákig
- **Biztonság Elsődlegessége**: Biztonsági legjobb gyakorlatok beépítve
- **Költségoptimalizálás**: Útmutatás költséghatékony telepítésekhez és erőforrás-menedzsmenthez

#### Dokumentáció Minőség
- **Részletes Kódpéldák**: Gyakorlati, tesztelt kódminták
- **Lépésről-lépésre Utasítások**: Világos, megvalósítható útmutatók
- **Átfogó Hibakezelés**: Gyakori hibákra megoldások
- **Legjobb Gyakorlatok Integrálása**: Iparági szabványok és ajánlások
- **Verzió-Kompatibilitás**: Naprakész az Azure legújabb szolgáltatásaival és az azd funkcióival

## Tervezett Jövőbeli Fejlesztések

### Verzió 3.1.0 (Tervezett)
#### AI Platform Bővítés
- **Többmodell Támogatás**: Integrációs minták Hugging Face, Azure Machine Learning és egyedi modellekhez
- **AI Ügynök Keretrendszerek**: Sablonok LangChain, Semantic Kernel és AutoGen telepítésekhez
- **Fejlett RAG Minták**: Vector adatbázis opciók az Azure AI Search mellett (Pinecone, Weaviate, stb.)
- **AI Megfigyelhetőség**: Fejlett model teljesítmény, tokenhasználat és válaszminőség figyelés

#### Fejlesztői Élmény
- **VS Code Kiterjesztés**: Integrált AZD + Microsoft Foundry fejlesztői élmény
- **GitHub Copilot Integráció**: AI által segített AZD sablon generálás
- **Interaktív Oktatóanyagok**: Gyakorlati kódolási gyakorlatok automatikus validálással AI forgatókönyvekhez
- **Videós Tartalom**: Kiegészítő videós oktatóanyagok vizuális tanulóknak AI telepítések témakörében

### Verzió 4.0.0 (Tervezett)
#### Vállalati AI Minták
- **Kormányzási Keretrendszer**: AI modell kormányzás, megfelelőség és audit nyomvonalak
- **Több-bérlős AI**: Minták több ügyfél kiszolgálására izolált AI szolgáltatásokkal
- **Edge AI Telepítés**: Integráció Azure IoT Edge és konténer példányokkal
- **Hibrid Felhő AI**: Többfelhős és hibrid telepítési minták AI munkaterhelésekhez

#### Haladó Funkciók
- **AI Pipeline Automatizálás**: MLOps integráció Azure Machine Learning pipeline-okra
- **Haladó Biztonság**: Zero-trust minták, privát végpontok és fejlett fenyegetésvédelem
- **Teljesítményoptimalizálás**: Haladó finomhangolás és skálázási stratégiák magas áteresztőképességű AI alkalmazásokhoz
- **Globális Terjesztés**: Tartalomkézbesítési és edge cache minták AI alkalmazásokhoz

### Verzió 3.0.0 (Tervezett) - Felülírva a Jelenlegi Kiadással  
#### Javasolt Hozzáadások – Most Implementálva v3.0.0-ban
- ✅ **AI-fókuszú Tartalom**: Átfogó Microsoft Foundry integráció (Befejezett)
- ✅ **Interaktív Oktatóanyagok**: Gyakorlati AI műhely labor (Befejezett)
- ✅ **Fejlett Biztonsági Modul**: AI-specifikus biztonsági minták (Befejezett)
- ✅ **Teljesítményoptimalizálás**: AI munkaterhelési hangolási stratégiák (Befejezett)

### Verzió 2.1.0 (Tervezett) – Részben Megvalósítva v3.0.0-ban  
#### Kis Fejlesztések – Egyesek Befejezve a Jelenlegi Kiadásban
- ✅ **További Példák**: AI-fókuszú telepítési forgatókönyvek (Befejezett)
- ✅ **Bővített GYIK**: AI-specifikus kérdések és hibakeresés (Befejezett)
- **Eszköz Integráció**: Fejlesztett IDE és szerkesztő integrációs útmutatók
- ✅ **Figyelés Kibővítése**: AI-specifikus figyelési és riasztási minták (Befejezett)

#### Még Tervezett Jövőbeli Kiadáshoz
- **Mobilbarát Dokumentáció**: Reszponzív design mobil tanuláshoz
- **Offline Hozzáférés**: Letölthető dokumentáció csomagok
- **Fejlesztett IDE Integráció**: VS Code kiterjesztés AZD + AI munkafolyamatokhoz
- **Közösségi Műszerfal**: Valós idejű közösségi metrikák és hozzájárulások nyomon követése

## Hozzájárulás a Változásnaplóhoz

### Változások Jelentése
Ha hozzájárulsz ehhez a tárhelyhez, kérjük, hogy a változásnapló bejegyzések tartalmazzák:

1. **Verziószám**: Semver szabvány szerint (fő.mellék.folt)
2. **Dátum**: Kiadás vagy frissítés dátuma YYYY-MM-DD formátumban
3. **Kategória**: Hozzáadva, Módosítva, Elavult, Eltávolítva, Javítva, Biztonság
4. **Egyértelmű Leírás**: Röviden hogy mit változtattál
5. **Hatás Értékelés**: Hogyan hat a változás a meglévő felhasználókra

### Változás Kategóriák

#### Hozzáadva
- Új funkciók, dokumentációs szekciók vagy képességek
- Új példák, sablonok vagy tananyagok
- További eszközök, szkriptek vagy segédprogramok

#### Módosítva
- Meglévő funkciók vagy dokumentumok módosítása
- Frissítések a világosság vagy pontosság javítása érdekében
- Tartalom vagy szervezet átszervezése

#### Elavult
- Kivezetés alatt álló funkciók vagy megközelítések
- Eltávolításra tervezett dokumentum szekciók
- Jobb alternatívákkal rendelkező módszerek

#### Eltávolítva
- Már nem releváns funkciók, dokumentumok vagy példák
- Elavult információk vagy régi megközelítések
- Ismétlődő vagy összevont tartalom

#### Javítva
- Hibajavítások dokumentációban vagy kódban
- Jelentett problémák vagy hibák megoldása
- Pontosság és működés javítása

#### Biztonság
- Biztonsági fejlesztések vagy hibajavítások
- Biztonsági legjobb gyakorlatok frissítései
- Biztonsági sérülékenységek megoldása

### Fő Verziozási Irányelvek

#### Fő Verzió (X.0.0)
- Változások, melyek a felhasználók aktív beavatkozását igénylik
- Jelentős szerkezeti vagy tartalmi átalakítások
- Módszertani alapvető megváltoztatások

#### Mellék Verzió (X.Y.0)
- Új funkciók vagy tartalom bővítések
- Visszafelé kompatibilis bővítések
- További példák, eszközök vagy források

#### Hibajavító Verzió (X.Y.Z)
- Hibajavítások és korrigálások
- Kis fejlesztések meglévő tartalomban
- Pontosítások és apró javítások

## Közösségi Visszajelzés és Javaslatok

Aktívan bátorítjuk a közösségi visszajelzéseket a tananyag fejlesztéséhez:

### Hogyan Adj Visszajelzést
- **GitHub Issues**: Problémák jelentése vagy fejlesztési javaslatok (AI-specifikus problémák szívesen)
- **Discord Beszélgetések**: Ötletek megosztása, részvétel a Microsoft Foundry közösségben
- **Pull Requestek**: Közvetlen fejlesztések hozzájárulása, különösen AI sablonok és útmutatók esetén
- **Microsoft Foundry Discord**: Részvétel az #Azure csatornában AZD + AI témában
- **Közösségi Fórumok**: Szélesebb Azure fejlesztői beszélgetésekben részvétel

### Visszajelzési Kategóriák
- **AI Tartalom Pontosság**: AI szolgáltatás integrációs és telepítési információk javítása
- **Tanulási Élmény**: Javaslatok AI fejlesztői tanulási folyamat javítására
- **Hiányzó AI Tartalom**: További AI sablonok, minták vagy példák kérése
- **Hozzáférhetőség**: Fejlesztések sokféle tanulói igényhez
- **AI Eszköz Integráció**: Jobb AI fejlesztési munkafolyamat integrációs javaslatok
- **Termelési AI Minták**: Vállalati AI telepítési minta kérések

### Válaszadási Elköteleződés
- **Hibajelentésekre válasz**: 48 órán belül
- **Funkciókérések értékelése**: Egy héten belül
- **Közösségi hozzájárulások átnézése**: Egy héten belül
- **Biztonsági problémák kezelése**: Azonnali prioritással, gyors válaszadással

## Karbantartási Ütemterv

### Rendszeres Frissítések
- **Havi Áttekintések**: Tartalom pontosság és linkellenőrzés
- **Negyedéves Frissítések**: Jelentős tartalombővítések és fejlesztések
- **Féléves Átstrukturálások**: Átfogó tartalom átszervezés és fejlesztés
- **Éves Kiadások**: Fő verzió frissítések jelentős fejlesztésekkel

### Monitorozás és Minőségbiztosítás
- **Automatizált Tesztelés**: Kódpéldák és linkek rendszeres ellenőrzése
- **Közösségi Visszajelzés Integrálás**: Felhasználói javaslatok rendszeres beépítése
- **Technológiai Frissítések**: Az Azure legújabb szolgáltatásaival és az azd kiadásokkal való összhang
- **Hozzáférhetőségi Auditok**: Rendszeres áttekintés befogadó tervezési elvek szerint

## Verzió Támogatási Irányelvek

### Jelenlegi Verzió Támogatása
- **Legújabb Főverzió**: Teljes támogatás és rendszeres frissítések
- **Előző Főverzió**: Biztonsági frissítések és kritikus javítások 12 hónapig
- **Régebbi Verziók**: Csak közösségi támogatás, hivatalos frissítés nélkül

### Migrációs Útmutatók
Főverziók megjelenésekor biztosítjuk:
- **Migrációs Útmutatók**: Lépésről-lépésre átállási instrukciók
- **Kompatibilitási Megjegyzések**: Részletek a visszafordíthatatlan változásokról
- **Eszköztámogatás**: Szkriptek vagy segédprogramok migrációhoz
- **Közösségi Támogatás**: Dedikált fórumok migrációs kérdésekhez

---

**Navigáció**  
- **Előző Lecke**: [Tanulmányi Útmutató](resources/study-guide.md)  
- **Következő Lecke**: Vissza a [Fő README](README.md) oldalhoz  

**Maradj Frissítve**: Kövesd ezt a tárhelyet az új kiadások és fontos tananyag frissítések értesítéseiért.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->