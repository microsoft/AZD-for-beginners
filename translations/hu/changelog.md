# Változásnapló - AZD Kezdőknek

## Bevezetés

Ez a változásnapló dokumentálja az AZD Kezdőknek tároló minden jelentős változását, frissítését és fejlesztését. Szolgáltatunk szemantikus verziókövetést, és naprakészen tartjuk ezt a logot, hogy segítsük a felhasználókat megérteni, mi változott a verziók között.

## Tanulási célok

A változásnapló áttekintésével Ön:
- Értesül az új funkciókról és tartalmak bővítéséről
- Megérti a meglévő dokumentációkban történt fejlesztéseket
- Nyomon követi a hibajavításokat és korrekciókat a pontosság biztosítása érdekében
- Követi a tananyagok fejlődését az idő múlásával

## Tanulási eredmények

A változásnapló bejegyzéseinek megtekintése után képes lesz:
- Azonosítani az új, tanuláshoz elérhető tartalmakat és forrásokat
- Megérteni, mely szakaszok frissültek vagy fejlődtek
- Megtervezni tanulási útját a legfrissebb anyagok alapján
- Visszajelzéseket és javaslatokat adni a jövőbeni fejlesztésekhez

## Verziótörténet

### [v3.24.0]- 2026-11-04

#### Javított
- Javítottuk az angol tanfolyam navigációt, áthelyezett oldalak útvonalait, hiányzó horgonyokat és elavult külső hivatkozásokat, beleértve a 2. fejezet linkjét a termelési AI útmutatóhoz.
- Áttekintettük a jelenlegi útmutatásokat az AZD 1.37.2, agentek 1.0.0-beta.23 és értékelések 1.0.0-beta.2 hivatalos verzióival összevetve. Dokumentáltuk a külön `azd ai eval` munkafolyamatot és az optimalizációs konfiguráció migrációját.
- Kijavítottuk a nem támogatott CLI kapcsolókat, hitelesítési határokat, tiszta szöveges környezeti/titkos útmutatásokat, infrastruktúra frissítéseket, modellkonfigurációt és pusztító helyreállítási példákat.
- Frissítettük a workshopot a jelenlegi AI Agent mintára, beleértve a tényleges hookokat, konfigurációs bemeneteket, értékelési teszteket, red-teaming belépési pontokat és megfigyelhetőséget.
- Kijavítottuk a példa megvalósítási állításokat és javítottuk az alkalmazáshoz/infrastruktúrához/konfigurációhoz kapcsolódó problémákat. A kiskereskedelmi architektúra anyagát egyértelműen elkülönítettük a teljes, működő alkalmazástól.
- Visszaállítottuk a CodeQL nyelvi mátrixot, kiválasztottuk a támogatott Node.js 24-et a fejlesztői konténerhez, és beállítottuk, hogy a telepítési ellenőrzők hibás verzióparancs esetén jelentést tegyenek.

#### Hozzáadott
- Csak angol nyelvű offline link/horgony ellenőrzőt, regressziós teszteket és egy dokumentációs munkafolyamatot, amely szigorú módban is építi a workshopot. A generált fordítások és a lefordított képek ki vannak zárva.

#### Érvényességi kör
- A forrás, szintaxis, konfiguráció, helyi viselkedés és hálózati link ellenőrzések nem állapítják meg az Azure valós telepíthetőségét, kvótáját, RBAC-ját, régiós modell elérhetőségét, számlázását, biztonsági megfelelőségét vagy éles üzemkészségét.
- Az alábbi régebbi bejegyzések történelmi feljegyzések, nem aktuális parancs- vagy kiadási utasítások.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 frissítés: Verziófrissítés
**Ez a verzió újraellenőrzi a kurzust a `azd` `1.27.1` (2026. július, legfrissebb stabil kiadás) és a jelenlegi előzetes AI agent kiterjesztéssel `azure.ai.agents` `1.0.0-beta.5`, így minden "ellenőrizve ezzel a verzióval" jelvény naprakész lett az 1.26.0, 1.27.0 és 1.27.1 kiadások után.**

#### Megváltoztatva
- **✅ A validációs alapvonal frissítve** az `azd 1.25.6` (2026 június) verzióról az `azd 1.27.1` (2026 július) verzióra a gyökér README-ben, az összes fejezet README-jében, az 1. fejezet dev-container leckéjében (beleértve a rögzített verziójú példákat), a 4. fejezet egyedi sablon leckéjében, az 5. fejezet multi-agent leckéjében és a workshop dokumentációkban
- **🤖 A 2. fejezet alapvonala frissítve** az `azd 1.23.12` (2026 március) verzióról az `azd 1.27.1` verzióra az `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` és `microsoft-foundry-integration.md` állományokban; a validációs megjegyzés dátumai frissítve 2026-07-13-ra
- **🧩 Az AI ügynök kiterjesztés frissítve** az `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` verzióról a jelenlegi `1.0.0-beta.5` kiadásra a 2. fejezet README-jében és `agents.md`-ban
- **🧪 Workshop validációs példa** (`azd version` kimenet) frissítve az `1.27.1` verzióra

#### Megjegyzések a releváns azd kiadásokhoz (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go támogatás az Azure Functions Flex Consumption-on, `azd config sub-filter` bérlőnkénti előfizetés szűrők, önálló kiterjesztés csomagok (`azd x pack --bundle`), és `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modellezd közvetlenül az Azure AI Foundry projektjeit/ügynökeit `azure.yaml`-ban (Bicep- és Terraform nélküli inicializálás), konténer deployment támogatás App Service-hez (`host: appservice` + `language: docker`), közvetlen `-s/--source` a `azd extension` parancsokhoz, és `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` kapcsoló az `azd extension install`-hoz, alapértelmezettként kizárva az elavult modelleket a katalógus/kvóta promptból, és több hibajavítás

#### Frissített fájlok
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Kezdő Hiánypótló #2: Sablonszerkesztés, Dev Containerek, Pulumi, Azure DevOps, Szolgáltatásképesek és Több
**Ez a verzió bezárja a fennmaradó középhaladó hiányosságokat az azd-coverage elemzés alapján: hogyan szerkeszd és publikáld a saját sablonodat, reprodukálható dev-container/Codespaces környezetek, a Pulumi infrastruktúra szolgáltató, Azure DevOps CI/CD bemutató, szolgáltatásképes hitelesítés, a hosztválasztás útmutatója (AKS/Spring Apps), `azd restore`/`azd package` magyarázatok, hook hibakezelés és csapat-/megosztott környezet gyakorlatok.**

#### Hozzáadott
- **🧱 Új 4. fejezet lecke** `docs/chapter-04-infrastructure/custom-templates.md` — a saját azd sablonod szerkesztése: szükséges szerkezet (`azure.yaml`, `infra/`, `src/`), az `metadata.template` mező, infrastruktúra paraméterezése `uniqueString()` erőforrás tokennel és `azd-env-name` címkével, helyi tesztelés `azd init --template <local-path>`-val, publikálás GitHubra, és beküldés az Awesome AZD galériába
- **📦 Új 1. fejezet lecke** `docs/chapter-01-foundation/dev-containers.md` — reprodukálható azd környezetek Dev Containerekkel és GitHub Codespaces-szel: egy minimális `.devcontainer/devcontainer.json` az hivatalos `ghcr.io/azure/azure-dev/azd` funkció használatával, nyelvspecifikus funkciók, `docker-in-docker` konténer hosztoknak, és `azd auth login --use-device-code` távoli bejelentkezéshez
- **🧩 Pulumi az azd-vel** szekció a `docs/chapter-04-infrastructure/provisioning.md`-ban — `infra.provider: pulumi`, Pulumi mappa struktúra, stackek leképezve az azd környezetekhez, szükséges outputok/címkézés, és ugyanolyan `azd up` / `azd down` munkafolyamat
- **🎯 Hoszt-választási útmutató** a `docs/chapter-04-infrastructure/provisioning.md`-ban — kezdőknek szóló összehasonlítás `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` és `springapp` között, útmutatással, mikor válasszuk az AKS-t vagy az Azure Spring Appset
- **🛠️ Azure DevOps CI/CD bemutató** a `docs/chapter-08-production/production-ai-practices.md`-ben — `azd pipeline config --provider azdo`, szolgáltatáskapcsolat workload identity federation-nel (OIDC), a generált `azure-dev.yml` és változó-csoport beállítások
- **🔑 Szolgáltatásképesek (Minta 4)** hozzáadva a `docs/chapter-03-configuration/authsecurity.md`-hoz — `az ad sp create-for-rbac`, nem interaktív `azd auth login` kliens titokkal versus federált/OIDC hitelesítőkkel, mikor használd, és biztonságos hitelesítő tárolás
- **🪝 Hook hibakezelés** alszekció a `docs/chapter-04-infrastructure/deployment-guide.md`-ban — kilépési kódok és `set -e`, `continueOnError`, hookok izolált tesztelése `azd hooks run`-val, OS-specifikus shell-ek és `--debug`
- **👥 Csapat / megosztott környezetek** szekció a `docs/chapter-03-configuration/configuration.md`-ban — mi kerül a `.azure/`-ba, mi kerüljön gitignore-ba, fejlesztőnkénti környezetek, `azd env list`/`select`, és környezet értékek biztosítása CI/CD-ben
- **🧰 `azd restore` és bővített `azd package`** magyarázatok a `resources/cheat-sheet.md`-ben — függőségek visszaállítása és telepíthető artefaktum építése telepítés nélkül

#### Változtatott
- **🧭 4. fejezet lecketáblázat** frissítve, hogy tartalmazza az új "Saját Sablon Szerkesztése" leckét (3. lecke)
- **🧭 1. fejezet lecketáblázat** frissítve, hogy tartalmazza az új "Dev Containerek és Codespaces" leckét (5. lecke); navigációs láblécek összekötve `bring-your-own-app.md` és `dev-containers.md` között

### [v3.21.0] - 2026-06-16

#### Kezdő Hiánypótló: Gyakorlati Multi-Agent lecke, "Saját App Hozzáadása", Terraform és CI/CD Bemutató
**Ez a verzió bezárja a legnagyobb hiányosságokat egy teljes kezdő útmutatóhoz két új gyakorlati leckével (egy telepíthető multi-agent bemutatóval és az azd hozzáadásával meglévő applikációhoz), kezdőknek szóló hook bevezetővel, egy Terraform az azd-vel szekcióval, lépésről lépésre GitHub Actions pipeline bemutatóval, új előnézeti kiterjesztések magyarázatával, és explicit telepítés-ellenőrzési ellenőrzőlistával.**

#### Hozzáadott
- **🤝 Új 5. fejezet lecke** `docs/chapter-05-multi-agent/multi-agent-basics.md` — teljesen gyakorlati, telepíthető két-ügynökös bemutató (orchestrátor + specialisták) valódi sablonnal (`contoso-creative-writer`), lefedve mikor használj multi-agent rendszert, a `azd up` munkafolyamatot, a telepített erőforrások megértését, cross-agent nyomkövetést, testreszabást és takarítást
- **📦 Új 1. fejezet lecke** `docs/chapter-01-foundation/bring-your-own-app.md` — hogyan adjuk hozzá az azd-t meglévő projekthez `azd init` ("használd a kódot az aktuális könyvtárban"), `azure.yaml` és `infra/` megértése, `azd infra generate`, hoszt érzékelés, és telepítés `azd up`-vel
- **🌐 Terraform az azd-vel** szekció hozzáadva a `docs/chapter-04-infrastructure/provisioning.md`-hoz — `infra.provider: terraform` konfiguráció, `.tf` mappastruktúra, szükséges `AZURE_*` outputok és `azd-env-name` címkézés, és ugyanaz a `azd up` / `azd down` munkafolyamat (bezárja azt a rést, ahol a Terraform támogatás igényelt volt, de csak Bicep mutatva volt)
- **⚙️ Lépésről lépésre GitHub Actions bemutató** a `docs/chapter-08-production/production-ai-practices.md`-ban — GitHub repótól az automatizált telepítésekig: `azd pipeline config`, OIDC federált hitelesítők (nincs tárolt titok), a generált `azure-dev.yml` és titkok-vs-változók útmutatás
- **🪝 Kezdő "Új a hook-ok világában?" bevezető** a `docs/chapter-04-infrastructure/deployment-guide.md`-ban — mi az a hook, hook-fázis táblázat, minimális első hook és manuális hook futtatás `azd hooks run`-vel
- **✅ "Ellenőrizd a telepítésed" ellenőrzőlista** hozzáadva a `docs/chapter-01-foundation/first-project.md` 5. lépéséhez — smoke teszt, egészség-ellenőrzési végpont és explicit siker kritériumok
- **🧩 Új előnézeti kiterjesztések magyarázata** `azure.ai.skills` és `azure.ai.connections` (mik ezek és mikor használd őket) a `docs/chapter-08-production/production-ai-practices.md`-ban

#### Változtatott
- **🧭 5. fejezet lecketáblázat** korrigálva: `multi-agent-basics.md` most az 1. lecke (az egyetlen teljesen gyakorlati lecke), őszinte megjelöléssel, hogy a 2. lecke a 6. fejezetben van és a Kiskereskedelmi forgatókönyv egy architekturális tervrajz, nem egy egylépéses sablon
- **🧭 1. fejezet lecketáblázat** most tartalmazza az új "Saját App Hozzáadása" leckét (4. lecke)
- **🔗 Navigációs láblécek** frissítve: `first-project.md` most előre linkel `bring-your-own-app.md`-re

#### Javítva
- **🧱 Bezártuk a "ígért, de hiányzó" Terraform rést** — a kurzus korábban hivatkozott Terraform támogatásra anélkül, hogy azt megmutatta volna
- **🔀 Kijavítottuk az 5. fejezet félrevezető kereszt-linkjeit** amelyek azt sugallták, hogy egy teljes multi-agent implementáció van, miközben csak egy architekturális terv volt

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

#### AZD 1.25.6 frissítés, teljes ügynök élettartam parancsok és Aspire márkaváltás
**Ez a verzió újraellenőrzi a kurzust az `azd` `1.25.6` (2026 június) és az `azure.ai.agents` `0.1.40-preview` kiterjesztés alapján, kibővíti a mesterséges intelligencia útmutatást a "ügynök vázolása" témakörtől a teljes ügynök életciklusig (teszt → értékel → optimalizál → ellenőriz → töröl), megjeleníti az új `azure.ai.skills` és `azure.ai.connections` előnézeti kiterjesztéseket, és megemlíti a ".NET Aspire" → "Aspire" termék márkaváltást.**

#### Hozzáadva
- **🔁 Teljes ügynök élettartam lefedettség** kezdőknek és AI mérnököknek a dokumentációkban:
  - `docs/chapter-01-foundation/azd-basics.md` — Élettartam táblázat (vázolás → tesztelés → mérés → javítás → ellenőrzés → tisztítás) hozzáadva a Kiterjesztések és AI Parancsok szekcióhoz
  - `docs/chapter-08-production/production-ai-practices.md` — Új "Az ügynök életciklusának kezelése" szakasz, amely lefedi `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` és `delete --force` témákat
  - `resources/cheat-sheet.md` — Bővített AI Ügynök Parancsok `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` és `delete --force` hozzáadásával
- **🧩 Új előnézeti kiterjesztések** dokumentálva: `azure.ai.skills` (újrahasználható ügynök képességek) és `azure.ai.connections` (Foundry kapcsolatok) hozzáadva a kiterjesztési táblázathoz és gyorsreferenciához
- **⏱️ Válaszidő-útmutatás** — az `azd ai agent invoke` példák most megjegyzik, hogy az össz-latenciát és az első bájtig eltelt időt is kiírja
- **📌 Verzió banner** a root README-ben, amely a tanulókat az `azd version`-hoz és `azd upgrade`-hoz irányítja

#### Módosítva
- **✅ Érvényesítési alap frissítve** az `azd 1.23.12` (2026 március) verzióról az `azd 1.25.6` (2026 június) verzióra minden fejezeti README-ben és a workshop dokumentációban
- **🤖 A 2. fejezet kiterjesztési megjegyzése** frissítve az `azure.ai.agents` `0.1.18-preview`-ról az `0.1.40-preview`-ra
- **🧪 Workshop érvényesítési példa** (`azd version` kimenet) frissítve az `1.25.6`-ra
- **🧭 README "Mi újság az azd-ben ma"** frissítve a teljes ügynök életciklus, új AI kiterjesztések és a nemrégiben javított életminőség hibák kiemelésével (`azd init` idempotencia, `azd auth login` elavult token tisztítás, `azd tool` első futtatás parancs)
- **📖 A 2. fejezet agents.md (4. opció)** most a telepítés utáni életciklus parancsokra irányítja a tanulókat az `azd up` helyett

#### Javítva
- **🏷️ Terméknév megjegyzés** — hozzáadva egy Aspire márkaváltás megjegyzés (a ".NET Aspire" most már egyszerűen csak "Aspire"); az azd Aspire támogatása változatlan
- **🔎 Élő kiadás érvényesítés** megerősítve az Azure Developer CLI kiadási csatornáján: stabil CLI `1.25.6` (2026-06-12) és `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Kezdő felhasználói eligazítás, beállítás érvényesítés és végső AZD parancs takarítás
**Ez a verzió az AZD 1.23 érvényesítési kör után következik, kezdő fókuszú dokumentációs átdolgozással: tisztázza az AZD első hitelesítési útmutatást, hozzáad helyi beállítás ellenőrző szkripteket, megerősíti a kulcsfontosságú parancsokat az élő AZD CLI-vel, és eltávolítja az utolsó elavult angol nyelvű parancs hivatkozásokat a changelogon kívül.**

#### Hozzáadva
- **🧪 Kezdők beállítás érvényesítő szkriptek** az `validate-setup.ps1` és `validate-setup.sh` használatával, hogy a tanulók megerősíthessék a szükséges eszközök meglétét az 1. fejezet megkezdése előtt
- **✅ Kezdeti beállítás érvényesítési lépések** a root README-ben és az 1. fejezet README-jében, hogy a hiányzó előfeltételek még a `azd up` előtt észrevehetők legyenek

#### Módosítva
- **🔐 Kezdő hitelesítési útmutatás** mostantól következetesen `azd auth login`-ot kezeli elsődleges útként az AZD munkafolyamatokban, az `az login` pedig opcionális megemlítésként, kivéve ha közvetlenül Azure CLI parancsokat használnak
- **📚 Az 1. fejezet onboarding folyamata** most a tanulókat a helyi beállítás ellenőrzésére irányítja az installáció, hitelesítés és első telepítés lépések előtt
- **🛠️ Érvényesítő üzenetek** most egyértelműen elkülönítik a blokkoló követelményeket az opcionális Azure CLI figyelmeztetésektől az kizárólagos AZD kezdő úton
- **📖 Konfigurációs, hibakeresési és példadokumentációk** most megkülönböztetik a kötelező AZD hitelesítést az opcionális Azure CLI bejelentkezéstől, ahol ez korábban kontextus nélkül volt megadva

#### Javítva
- **📋 Maradék angol nyelvű parancshivatkozások** frissítve a jelenlegi AZD formákra, beleértve az `azd config show`-t a gyorsreferenciában és az `azd monitor --overview`-t, ahol Azure Portal áttekintési útmutatás szerepelt
- **🧭 Kezdő állítások az 1. fejezetben** enyhítve, hogy elkerüljék az abszolút hibamentes vagy visszagörgetés garantálását minden sablon és Azure erőforrás esetén
- **🔎 Élő CLI érvényesítés** megerősítve a jelenlegi támogatáshoz `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` és `azd down --force --purge` esetén

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

#### AZD 1.23.12 érvényesítés, workshop környezet bővítés és AI modell frissítés
**Ez a verzió dokumentációs érvényesítést hajt végre az `azd` `1.23.12` alapján, frissíti az elavult AZD parancs példákat, megújítja az AI modell útmutatást a jelenlegi alapértelmezésekhez, és kiterjeszti a workshop utasításokat a GitHub Codespaces-en túl fejlesztői konténerek és helyi klónok támogatására is.**

#### Hozzáadva
- **✅ Érvényesítési megjegyzések a főbb fejezetekben és workshop dokumentációban**, hogy a tesztelt AZD alapvonal explicit legyen a tanulók számára, függetlenül a CLI verziójától
- **⏱️ Telepítési időtúllépési útmutatás** hosszú ideig futó AI alkalmazások telepítéséhez az `azd deploy --timeout 1800` használatával
- **🔎 Kiterjesztés ellenőrzési lépések** az `azd extension show azure.ai.agents` használatával az AI munkafolyamat dokumentációban
- **🌐 Szélesebb workshop környezeti útmutató** a GitHub Codespaces, fejlesztői konténerek és helyi klónok kezelésével MkDocs-ban

#### Módosítva
- **📚 Fejezeti bevezető README-k** következetesen megjegyzik az `azd 1.23.12` elleni érvényesítést az alap, konfiguráció, infrastruktúra, multi-ügynök, telepítés előtti, hibakereső és termelési részekben
- **🛠️ AZD parancshivatkozások** frissítve a dokumentációkban jelenlegi formákra:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` vagy `azd env get-value(s)` a kontextustól függően
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview`, ahol az Application Insights áttekintés volt szándékolva
- **🧪 Előnézeti példák egyszerűsítve** a jelenlegi támogatott használatra, mint például `azd provision --preview` és `azd provision --preview -e production`
- **🧭 Workshop folyamat** frissítve úgy, hogy a tanulók befejezhessék a laborokat Codespaces-ben, fejlesztői konténerben vagy helyi klónban, nemcsak Codespaces-ben
- **🔐 Hitelesítési útmutatás** most előnyben részesíti az `azd auth login` használatát az AZD munkafolyamatokhoz, az `az login` pedig opcionális, amikor közvetlenül Azure CLI parancsokat használnak

#### Javítva
- **🪟 Windows telepítési parancsok** egységesítve a jelenlegi `winget` csomagnév kis- és nagybetűs használatával a telepítési útmutatóban
- **🐧 Linux telepítési útmutatás** javítva, hogy elkerülje a nem támogatott disztribúció-specifikus `azd` csomagkezelő utasításokat, helyette a megfelelő kiadási csomópontokra mutat
- **📦 AI modell példák** frissítve régebbi alapértelmezettekről, mint például `gpt-35-turbo` és `text-embedding-ada-002` a jelenlegi példákra, mint `gpt-4.1-mini`, `gpt-4.1` és `text-embedding-3-large`
- **📋 Telepítési és diagnosztikai kódrészletek** javítva a jelenlegi környezet és állapot parancsok használatára naplókban, szkriptekben és hibakereső lépésekben
- **⚙️ GitHub Actions útmutatás** frissítve az `Azure/setup-azd@v1.0.0`-ról az `Azure/setup-azd@v2`-ra
- **🤖 MCP/Copilot beleegyezési útmutatás** frissítve az `azd mcp consent`-ról az `azd copilot consent list`-ra

#### Fejlesztve
- **🧠 AI fejezeti útmutatás** most jobban magyarázza az előnézet érzékeny `azd ai` viselkedést, bérlőspecifikus bejelentkezést, jelenlegi kiterjesztés használatot és frissített modell telepítési ajánlásokat
- **🧪 Workshop utasítások** most valósághűbb verzió példákat és tisztább környezet beállítási nyelvezetet használnak a gyakorlati laborokhoz
- **📈 Termelési és hibakeresési dokumentációk** most jobban igazodnak a jelenlegi monitorozás, visszaesési modell és költség kategória példákhoz

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

#### AZD AI CLI parancsok, tartalom érvényesítés és sablon bővítés
**Ez a verzió hozzáadja az `azd ai`, `azd extension` és `azd mcp` parancs lefedettséget minden AI-hoz kapcsolódó fejezethez, javítja a törött linkeket és elavult kódokat az agents.md-ben, frissíti a gyorsreferenciát, és megújítja a Példa Sablonok részt validált leírásokkal és új Azure AI AZD sablonokkal.**

#### Hozzáadva
- **🤖 AZD AI CLI lefedettség** 7 fájlban (korábban csak a 8. fejezetben):
  - `docs/chapter-01-foundation/azd-basics.md` — Új "Kiterjesztések és AI Parancsok" szakasz, amely bemutatja a `azd extension`, `azd ai agent init` és `azd mcp` parancsokat
  - `docs/chapter-02-ai-development/agents.md` — 4. opció: `azd ai agent init` összehasonlító táblázattal (sablon vs manifest megközelítés)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD kiterjesztések a Foundry-hoz" és "Ügynök első telepítés" alfejezetek
  - `docs/chapter-05-multi-agent/README.md` — Gyorskezdés most mind a sablon, mind a manifest alapú telepítési útvonalakat mutatja
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Telepítési szakasz most tartalmazza az `azd ai agent init` opciót
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI kiterjesztés parancsok diagnosztikához" alfejezet
  - `resources/cheat-sheet.md` — Új "AI és kiterjesztés parancsok" szakasz az `azd extension`, `azd ai agent init`, `azd mcp`, és `azd infra generate`-al
- **📦 Új AZD AI példa sablonok** az `microsoft-foundry-integration.md` alatt:
  - **azure-search-openai-demo-csharp** — .NET RAG chat Blazor WebAssembly-vel, Semantic Kernellel és hang chat támogatással
  - **azure-search-openai-demo-java** — Java RAG chat Langchain4J-vel ACA/AKS telepítési lehetőségekkel
  - **contoso-creative-writer** — Több-ügynökös kreatív írás alkalmazás Azure AI Agent Service, Bing Grounding és Prompty használatával
  - **serverless-chat-langchainjs** — Serverless RAG Azure Functions + LangChain.js + Cosmos DB-vel, Ollama helyi fejlesztői támogatással
  - **chat-with-your-data-solution-accelerator** — Vállalati RAG gyorsító admin portállal, Teams integrációval és PostgreSQL/Cosmos DB opciókkal
  - **azure-ai-travel-agents** — Többügynökös MCP orchestration referencia alkalmazás .NET, Python, Java és TypeScript szerverekkel
  - **azd-ai-starter** — Minimális Azure AI infrastruktúra Bicep kezdő sablon
  - **🔗 Awesome AZD AI Gallery link** — Hivatkozás az [awesome-azd AI galériára](https://azure.github.io/awesome-azd/?tags=ai) (80+ sablon)

#### Javítva
- **🔗 agents.md navigáció**: Az előző/következő hivatkozások most már megfelelnek a 2. fejezet README leckéinek sorrendjének (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md törött linkek**: `production-ai-practices.md` javítva `../chapter-08-production/production-ai-practices.md`-ra (3 előfordulás)
- **📦 agents.md elavult kód**: `opencensus` helyett `azure-monitor-opentelemetry` + OpenTelemetry SDK használva
- **🐛 agents.md érvénytelen API**: `max_tokens` áthelyezve `create_agent()`-ról `create_run()`-ra mint `max_completion_tokens`
- **🔢 agents.md token számlálás**: Durva `len//4` becslést lecserélve `tiktoken.encoding_for_model()`-ra
- **azure-search-openai-demo**: Szolgáltatások javítva „Cognitive Search + App Service”-ről „Azure AI Search + Azure Container Apps”-re (alapértelmezett hoszt változott 2024 október)
- **contoso-chat**: Leírás frissítve, hogy tükrözze az Azure AI Foundry + Prompty használatát, megegyezve a repo tényleges címével és technológiai stack-jével

#### Eltávolítva
- **ai-document-processing**: Nem működő sablon referencia eltávolítva (repo nem nyilvános AZD sablonként)

#### Fejlesztve
- **📝 agents.md gyakorlatok**: Az 1. gyakorlat most már megmutatja a várt kimenetet és a `azd monitor` lépést; a 2. gyakorlathoz teljes `FunctionTool` regisztrációs kód tartozik; a 3. gyakorlatban homályos útmutatást konkrét `prepdocs.py` parancsok váltják fel
- **📚 agents.md források**: Dokumentációs linkek frissítve a jelenlegi Azure AI Agent Service dokumentációra és gyorsstart útmutatóra
- **📋 agents.md Következő lépések táblázat**: Hozzáadva AI Workshop Lab hivatkozás a fejezet teljes lefedettségéhez

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
**Ez a verzió javítja a README.md fejezet navigációt egy továbbfejlesztett táblázatos formátummal.**

#### Megváltozott
- **Tanfolyamtérkép táblázat**: Közvetlen lecke hivatkozásokkal, időtartam becslésekkel és komplexitási értékeléssel bővítve
- **Mappatakarítás**: Felesleges régi mappák eltávolítva (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link ellenőrzés**: Minden 21+ belső link ellenőrizve a Tanfolyamtérkép táblázatban

### [v3.16.0] - 2026-02-05

#### Terméknév frissítések
**Ez a verzió frissíti a termék hivatkozásokat a jelenlegi Microsoft márkára.**

#### Megváltozott
- **Microsoft Foundry → Microsoft Foundry**: Minden hivatkozás frissítve a nem fordítási fájlokban
- **Azure AI Agent Service → Foundry Agents**: Szolgáltatás neve frissítve a jelenlegi márka szerint

#### Frissített fájlok
- `README.md` - Fő tanfolyam kezdőlap
- `changelog.md` - Verziótörténet
- `course-outline.md` - Tanfolyam szerkezete
- `docs/chapter-02-ai-development/agents.md` - AI ügynökök útmutatója
- `examples/README.md` - Példadokumentáció
- `workshop/README.md` - Workshop kezdőlap
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - Minden workshop oktató fájl

---

### [v3.15.0] - 2026-02-05

#### Jelentős tárház átalakítás: Fejezet-alapú mappanevek
**Ez a verzió a dokumentációt dedikált fejezet mappákra osztja a világosabb navigáció érdekében.**

#### Mappa átnevezések
A régi mappák helyett fejezet számozott mappák kerültek:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Új hozzáadva: `docs/chapter-05-multi-agent/`

#### Fájl migrációk
| Fájl | Innen | Ide |
|------|------|---|
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
| Összes pre-deployment fájl | pre-deployment/ | chapter-06-pre-deployment/ |
| Összes hibakeresési fájl | troubleshooting/ | chapter-07-troubleshooting/ |

#### Hozzáadva
- **📚 Fejezeti README fájlok**: README.md létrehozva minden fejezet mappában az alábbiakkal:
  - Tanulási célok és időtartam
  - Leckék táblázata leírásokkal
  - Gyorsindítási parancsok
  - Navigáció más fejezetekhez

#### Megváltozott
- **🔗 Minden belső link frissítve**: 78+ elérési út frissítve minden dokumentációs fájlban
- **🗺️ Fő README.md**: Tanfolyamtérkép frissítve új fejezeti szerkezettel
- **📝 examples/README.md**: Kereszt hivatkozások frissítve a fejezet mappákra

#### Eltávolítva
- Régi mappaszerkezet (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Tárház átszervezés: Fejezeti navigáció
**Ez a verzió fejezeti navigációs README fájlokat adott hozzá (felülírva a v3.15.0 által).**

---

### [v3.13.0] - 2026-02-05

#### Új AI ügynök útmutató
**Ez a verzió átfogó útmutatót ad az AI ügynökök Azure Developer CLI-val történő telepítéséhez.**

#### Hozzáadva
- **🤖 docs/microsoft-foundry/agents.md**: Teljes útmutató:
  - Mi az AI ügynök és hogyan különbözik a chatbotoktól
  - Három gyorsindítási ügynök sablon (Foundry Agents, Prompty, RAG)
  - Ügynök architektúra minták (egyszerű ügynök, RAG, többügynökös)
  - Eszköz konfiguráció és testreszabás
  - Monitorozás és metrika követés
  - Költség szempontok és optimalizálás
  - Gyakori hibakeresési helyzetek
  - Három gyakorlati feladat sikerkritériumokkal

#### Tartalom szerkezet
- **Bevezető**: Ügynök fogalmak kezdőknek
- **Gyorsindítás**: Ügynök telepítése `azd init --template get-started-with-ai-agents` segítségével
- **Architektúra minták**: Ügynökminták vizuális ábrái
- **Konfiguráció**: Eszköz beállítás és környezeti változók
- **Monitorozás**: Application Insights integráció
- **Gyakorlatok**: Fokozatos kéz-a-kézben tanulás (20-45 perc mindegyik)

---

### [v3.12.0] - 2026-02-05

#### DevContainer környezet frissítés
**Ez a verzió modern eszközökkel és jobb alapbeállításokkal frissíti a fejlesztői konténer konfigurációt az AZD tanulási élményhez.**

#### Megváltozott
- **🐳 Alap kép**: Frissítve `python:3.12-bullseye`-ról `python:3.12-bookworm`-ra (legfrissebb Debian stabil)
- **📛 Konténer név**: Átnevezve "Python 3"-ról "AZD kezdőknek" a tisztább megértés érdekében

#### Hozzáadva
- **🔧 Új Dev Container funkciók**:
  - `azure-cli` Bicep támogatással engedélyezve
  - `node:20` (AZD sablonokhoz LTS verzió)
  - `github-cli` sablonkezeléshez
  - `docker-in-docker` konténeralkalmazás telepítéshez

- **🔌 Port továbbítás**: Előre konfigurált portok a gyakori fejlesztéshez:
  - 8000 (MkDocs előnézet)
  - 3000 (Web alkalmazások)
  - 5000 (Python Flask)
  - 8080 (API-k)

- **🧩 Új VS Code bővítmények**:
  - `ms-python.vscode-pylance` - Fejlesztett Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions támogatás
  - `ms-azuretools.vscode-docker` - Docker támogatás
  - `ms-azuretools.vscode-bicep` - Bicep nyelvi támogatás
  - `ms-azure-devtools.azure-resource-groups` - Azure erőforrás kezelés
  - `yzhang.markdown-all-in-one` - Markdown szerkesztés
  - `DavidAnson.vscode-markdownlint` - Markdown lintelés
  - `bierner.markdown-mermaid` - Mermaid diagram támogatás
  - `redhat.vscode-yaml` - YAML támogatás (azure.yaml-hoz)
  - `eamodio.gitlens` - Git vizualizáció
  - `mhutchie.git-graph` - Git történet

- **⚙️ VS Code beállítások**: Alapértelmezett beállítások hozzáadva Python értelmezőhöz, formázás mentéskor és whitespace levágás

- **📦 Frissített requirements-dev.txt**:
  - Hozzáadva MkDocs minify plugin
  - Hozzáadva pre-commit kódminőség ellenőrzés
  - Hozzáadva Azure SDK csomagok (azure-identity, azure-mgmt-resource)

#### Javítva
- **Post-Create parancs**: Mostantól ellenőrzi az AZD és Azure CLI telepítését konténer indításkor

---

### [v3.11.0] - 2026-02-05

#### Kezdőknek szóló README átalakítás
**Ez a verzió jelentősen javítja a README.md fájlt, hogy elérhetőbb legyen kezdők számára, és hozzáad alapvető erőforrásokat AI fejlesztők számára.**

#### Hozzáadva
- **🆚 Azure CLI vs AZD összehasonlítás**: Világos magyarázat, mikor melyik eszközt használjuk gyakorlati példákkal
- **🌟 Awesome AZD linkek**: Közvetlen linkek közösségi sablon galériához és hozzájárulási forrásokhoz:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ telepítésre kész sablon
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Közösségi hozzájárulás
- **🎯 Gyorsindítási útmutató**: Egyszerűsített 3 lépéses kezdő rész (Telepítés → Bejelentkezés → Telepítés)
- **📊 Tapasztalaton alapuló navigációs táblázat**: Világos útmutatás, hol kezdjen a fejlesztő tapasztalata alapján

#### Megváltozott
- **README szerkezet**: Átszervezve fokozatos feltárás érdekében - kulcsinformációk először
- **Bevezető rész**: Átírva a „The Magic of `azd up`” teljesen kezdők számára
- **Duplikált tartalom eltávolítása**: Ismétlődő hibakeresési szekció eltávolítva
- **Hibakeresési parancsok**: Javítva `azd logs` hivatkozás, érvényes `azd monitor --logs` használatával

#### Javítva
- **🔐 Hitelesítési parancsok**: Hozzáadva `azd auth login` és `azd auth logout` a cheat-sheet.md-hez
- **Érvénytelen parancs hivatkozások**: Maradék `azd logs` eltávolítva a README hibakeresési részéből

#### Megjegyzések
- **Hatókör**: Változások a fő README.md és resources/cheat-sheet.md fájlokra érvényesek
- **Célközönség**: Javítások kifejezetten AZD-vel most ismerkedő fejlesztőknek

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI parancspontosság frissítés
**Ez a verzió javítja az érvénytelen AZD parancsokat a dokumentációban, biztosítva, hogy minden kódpélda érvényes Azure Developer CLI szintaxist használjon.**

#### Javítva
- **🔧 Nem létező AZD parancsok eltávolítása**: Átfogó audit és javítás az érvénytelen parancsokon:
  - `azd logs` (nem létezik) → cserélve `azd monitor --logs`-ra vagy Azure CLI alternatívákra
  - `azd service` almenük (nem léteznek) → cserélve `azd show`-ra és Azure CLI-re
  - `azd infra import/export/validate` (nem léteznek) → eltávolítva vagy érvényes alternatívákra cserélve
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` kapcsolók (nem léteznek) → eltávolítva
  - `azd provision --what-if/--rollback` kapcsolók (nem léteznek) → frissítve `--preview` használatára
  - `azd config validate` (nem létezik) → cserélve `azd config list`-ra
  - `azd info`, `azd history`, `azd metrics` (nem léteznek) → eltávolítva

- **📚 Fájlok frissítve parancskorrekciókkal**:
  - `resources/cheat-sheet.md`: Jelentős parancs referencia átalakítás
  - `docs/deployment/deployment-guide.md`: Javított rollback és telepítési stratégiák
  - `docs/troubleshooting/debugging.md`: Korrigált napló elemzési szekciók
  - `docs/troubleshooting/common-issues.md`: Frissített hibakeresési parancsok
  - `docs/troubleshooting/ai-troubleshooting.md`: Javított AZD hibakeresési rész
  - `docs/getting-started/azd-basics.md`: Kijavított monitorozási parancsok
  - `docs/getting-started/first-project.md`: Frissített monitorozási és hibakeresési példák
  - `docs/getting-started/installation.md`: Javított súgó és verzió példák
  - `docs/pre-deployment/application-insights.md`: Kijavított naplómegtekintési parancsok
  - `docs/pre-deployment/coordination-patterns.md`: Javított ügynök hibakeresési parancsok

- **📝 Verzióhivatkozás frissítve**: 
  - `docs/getting-started/installation.md`: A keménykódolt `1.5.0` verziót generikus `1.x.x`-re cseréltük, a kiadásokhoz vezető linkkel

#### Módosítva
- **Visszaállítási stratégiák**: Dokumentáció frissítve Git-alapú visszaállítás használatára (AZD nem támogat eredeti visszaállítást)
- **Naplómegtekintés**: A `azd logs` hivatkozásokat cseréltük `azd monitor --logs`, `azd monitor --live` és Azure CLI parancsokra
- **Teljesítmény szekció**: Eltávolítottuk a nem létező párhuzamos/incrementális telepítési jelzőket, helyettük érvényes alternatívák

#### Műszaki részletek
- **Érvényes AZD parancsok**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Érvényes azd monitor kapcsolók**: `--live`, `--logs`, `--overview`
- **Eltávolított funkciók**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Megjegyzések
- **Ellenőrzés**: Parancsok ellenőrizve az Azure Developer CLI v1.23.x verzióval

---

### [v3.9.0] - 2026-02-05

#### Workshop befejezése és dokumentációs minőségfrissítés
**Ez a verzió befejezi az interaktív workshop modulokat, javítja az összes törött dokumentációs linket, valamint javítja az általános tartalom minőségét a Microsoft AZD-t használó AI fejlesztők számára.**

#### Hozzáadva
- **📝 CONTRIBUTING.md**: Új hozzájárulási irányelvek dokumentum:
  - Egyértelmű utasítások hibajelentéshez és módosítás-javaslatokhoz
  - Új tartalmak dokumentációs szabványai
  - Kódpéldák irányelvei és commit üzenet konvenciók
  - Közösségi részvétel információk

#### Befejezve
- **🎯 Workshop modul 7 (Összefoglaló)**: Teljesen befejezett összefoglaló modul:
  - Átfogó összefoglaló a workshop eredményeiről
  - Kulcsfogalmak szakasza az AZD-ről, sablonokról és Microsoft Foundry-ról
  - Ajánlások a tanulási út folytatásához
  - Workshop kihívás feladatok nehézségi besorolással
  - Közösségi visszajelzési és támogatási linkek

- **📚 Workshop modul 3 (Elemzés)**: Frissített tanulási célok:
  - GitHub Copilot MCP szerverek aktiválási útmutatója
  - AZD sablon mappaszerkezet megértése
  - Infrastrukturális kód (Bicep) szervezési minták
  - Gyakorlati labor utasítások

- **🔧 Workshop modul 6 (Leszerelés)**: Befejezve:
  - Erőforrás takarítás és költségmenedzsment célok
  - `azd down` használata a biztonságos infrastruktúra megszüntetéshez
  - Soft-delete cognitív szolgáltatások helyreállítási útmutatója
  - Bónusz felfedezési javaslatok GitHub Copilothoz és Azure Portalhoz

#### Javítva
- **🔗 Törött link javítások**: 15-nél több törött belső dokumentációs link javítva:
  - `docs/ai-foundry/ai-model-deployment.md`: Javítottuk a microsoft-foundry-integration.md elérési útját
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigáltuk az ai-model-deployment.md és production-ai-practices.md útvonalait
  - `docs/getting-started/first-project.md`: Lecseréltük a nem létező cicd-integration.md-t deployment-guide.md-re
  - `examples/retail-scenario.md`: Javítottuk a GYIK és hibakeresési útmutató útvonalait
  - `examples/container-app/microservices/README.md`: Korrigáltuk a kurzus kezdő oldal és telepítési útmutató elérési útját
  - `resources/faq.md` és `resources/glossary.md`: Frissítettük az MI témakör hivatkozásokat
  - `course-outline.md`: Javítottuk az oktatói útmutató és MI workshop labor hivatkozásokat

- **📅 Workshop státusz banner**: Módosítva "Építés alatt"-ról aktív workshop státuszra, 2026 februári dátummal

- **🔗 Workshop navigáció**: Javítottuk a törött navigációs linkeket a workshop README.md-ben, amelyek nem létező lab-1-azd-basics mappára mutattak

#### Módosítva
- **Workshop bemutató**: Eltávolítottuk az "építés alatt" figyelmeztetést, a workshop teljes és használatra kész
- **Navigációs konzisztencia**: Biztosítottuk, hogy az összes workshop modulnak megfelelő intermoduláris navigációja legyen
- **Tanulási út hivatkozások**: Frissítettük a fejezeteken belüli kereszt-hivatkozásokat a helyes microsoft-foundry útvonalakra

#### Ellenőrizve
- ✅ Minden angol markdown fájlban érvényes belső hivatkozások vannak
- ✅ A workshop modulok 0-tól 7-ig teljesek, tanulási célokkal
- ✅ Fejezetek és modulok közti navigáció helyesen működik
- ✅ Tartalom alkalmas Microsoft AZD-t használó AI fejlesztők számára
- ✅ Kezdőbarát nyelvezet és szerkezet végig fenntartva
- ✅ A CONTRIBUTING.md egyértelmű útmutatást ad a közösségi hozzájárulóknak

#### Műszaki megvalósítás
- **Linkellenőrzés**: Automatikus PowerShell szkript ellenőrizte az összes .md belső linket
- **Tartalom audit**: Manuális áttekintés a workshop teljességéről és kezdőbarátságáról
- **Navigációs rendszer**: Konzisztens fejezet- és modulnavigációs minták alkalmazva

#### Megjegyzések
- **Hatókör**: A változások kizárólag az angol dokumentációra vonatkoznak
- **Fordítások**: A fordítási mappák ebben a verzióban nem frissültek (automatikus fordítás később szinkronizálódik)
- **Workshop időtartama**: A teljes workshop most 3-4 óra gyakorlati tanulást biztosít

---

### [v3.8.0] - 2025-11-19

#### Fejlett dokumentáció: Monitorozás, Biztonság és Multi-ügynök minták
**Ez a verzió átfogó A-minősítésű leckéket ad az Application Insights integrációról, hitelesítési mintákról és multi-ügynök koordinációról gyártási telepítésekhez.**

#### Hozzáadva
- **📊 Application Insights integrációs lecke**: a `docs/pre-deployment/application-insights.md`-ban:
  - AZD-központú telepítés automatikus biztosítással
  - Teljes Bicep sablonok az Application Insights + Log Analytics számára
  - Működő Python alkalmazások egyedi telemetriával (1,200+ sor)
  - AI/LLM monitorozási minták (Microsoft Foundry Models token/költség követése)
  - 6 Mermaid diagram (architektúra, elosztott nyomon követés, telemetria folyamat)
  - 3 gyakorlati feladat (riadók, műszerfalak, AI monitorozás)
  - Kusto lekérdezés példák és költségoptimalizációs stratégiák
  - Élő metrikák streamingje és valós idejű hibakeresés
  - 40-50 perces tanulási idő, gyártásra készült mintákkal

- **🔐 Hitelesítési és biztonsági minták leckéje**: a `docs/getting-started/authsecurity.md`-ben:
  - 3 hitelesítési minta (kapcsolati láncok, Key Vault, kezelt identitás)
  - Teljes Bicep infrastruktúra sablonok biztonságos telepítéshez
  - Node.js alkalmazáskód Azure SDK integrációval
  - 3 teljes gyakorlat (kezeltek identitás engedélyezése, felhasználói hozzárendelt identitás, Key Vault forgatás)
  - Biztonsági legjobb gyakorlatok és RBAC konfigurációk
  - Hibakeresési útmutató és költségelemzés
  - Gyártásra kész jelszó nélküli hitelesítési minták

- **🤖 Multi-ügynök koordinációs minták leckéje**: a `docs/pre-deployment/coordination-patterns.md`-ban:
  - 5 koordinációs minta (sorrend, párhuzamos, hierarchikus, eseményvezérelt, konszenzus)
  - Teljes rendező szolgáltatás megvalósítás (Python/Flask, 1,500+ sor)
  - 3 speciális ügynök megvalósítás (Kutató, Író, Szerkesztő)
  - Service Bus integráció üzenetsorozáshoz
  - Cosmos DB állapotkezelés elosztott rendszerekhez
  - 6 Mermaid diagram az ügynök interakciókról
  - 3 haladó gyakorlat (időtúllépés kezelése, újrapróbálkozás logikája, megszakító kapcsoló)
  - Költségmegosztás ($240-565/hó) optimalizációs stratégiákkal
  - Application Insights integráció monitorozáshoz

#### Fejlesztve
- **Előtelepítési fejezet**: Most átfogó monitorozási és koordinációs mintákat tartalmaz
- **Első lépések fejezet**: Szakmai hitelesítési mintákkal bővítve
- **Gyártásképesség**: Teljes lefedettség a biztonságtól az megfigyelhetőségig
- **Tanfolyam vázlat**: Frissítve, hogy hivatkozzon az új leckékre a 3-as és 6-os fejezetekben

#### Módosítva
- **Tanulási előrehaladás**: Jobb integrációja a biztonságnak és monitorozásnak az egész tanfolyamban
- **Dokumentáció minősége**: Következetes A-minősítési szabványok (95-97%) az új leckékben
- **Gyártási minták**: Teljes, végponttól végpontig terjedő lefedettség vállalati telepítésekhez

#### Javított
- **Fejlesztői élmény**: Egyértelmű út a fejlesztéstől a gyártás monitorozásáig
- **Biztonsági szabványok**: Professzionális minták hitelesítéshez és titkok kezeléséhez
- **Megfigyelhetőség**: Teljes Application Insights integráció AZD-vel
- **AI munkaterhelések**: Specializált monitorozás Microsoft Foundry Modellekhez és multi-ügynök rendszerekhez

#### Ellenőrizve
- ✅ Minden lecke teljes működő kódot tartalmaz (nem csak részleteket)
- ✅ Mermaid diagramok a vizuális tanuláshoz (összesen 19 három leckében)
- ✅ Gyakorlati feladatok ellenőrzési lépésekkel (összesen 9)
- ✅ Gyártásra készült Bicep sablonok, telepíthetőek `azd up` segítségével
- ✅ Költségelemzés és optimalizációs stratégiák
- ✅ Hibakeresési útmutatók és legjobb gyakorlatok
- ✅ Tudásellenőrző pontok ellenőrző parancsokkal

#### Dokumentáció értékelési eredmények
- **docs/pre-deployment/application-insights.md**: - Átfogó monitorozási útmutató
- **docs/getting-started/authsecurity.md**: - Professzionális biztonsági minták
- **docs/pre-deployment/coordination-patterns.md**: - Fejlett multi-ügynök architektúrák
- **Összesített új tartalom**: - Következetes, magas minőségi szabványok

#### Műszaki megvalósítás
- **Application Insights**: Log Analytics + egyedi telemetria + elosztott nyomon követés
- **Hitelesítés**: Kezelt identitás + Key Vault + RBAC minták
- **Multi-ügynök**: Service Bus + Cosmos DB + Container Apps + koordináció
- **Monitorozás**: Élő metrikák + Kusto lekérdezések + riasztások + műszerfalak
- **Költségmenedzsment**: Mintavételezési stratégiák, megőrzési szabályok, költségvetés-ellenőrzések

### [v3.7.0] - 2025-11-19

#### Dokumentáció minőségjavítások és új Microsoft Foundry Models példa
**Ez a verzió javítja a dokumentáció minőségét a repozitóriumban, és teljes Microsoft Foundry Models telepítési példát ad gpt-4.1 chat interfésszel.**

#### Hozzáadva
- **🤖 Microsoft Foundry Models chat példa**: Teljes gpt-4.1 telepítés működő megvalósítással a `examples/azure-openai-chat/`-ban:
  - Teljes Microsoft Foundry Models infrastruktúra (gpt-4.1 modell telepítés)
  - Python parancssoros chat interfész beszélgetési előzményekkel
  - Key Vault integráció biztonságos API kulcs tároláshoz
  - Tokenhasználat követése és költségbecslés
  - Korlátozás és hiba kezelés
  - Átfogó README 35-45 perces telepítési útmutatóval
  - 11 gyártásra kész fájl (Bicep sablonok, Python app, konfiguráció)
- **📚 Dokumentációs gyakorlatok**: Hozzáadott gyakorlati gyakorlatok a konfigurációs útmutatóhoz:
  - Gyakorlat 1: Több környezet konfiguráció (15 perc)
  - Gyakorlat 2: Titokkezelési gyakorlat (10 perc)
  - Egyértelmű siker kritériumok és ellenőrzési lépések
- **✅ Telepítés ellenőrzése**: Ellenőrzési szakasz hozzáadva a telepítési útmutatóhoz:
  - Egészségügyi ellenőrzési eljárások
  - Siker kritériumok listája
  - Várt kimenetek minden telepítési parancshoz
  - Gyors hibaelhárítási hivatkozás

#### Fejlesztve
- **examples/README.md**: Frissítve A-minőségre (93%):
  - azure-openai-chat hozzáadva az összes releváns szakaszhoz
  - Helyi példák száma 3-ról 4-re növelve
  - Hozzáadva az AI Alkalmazás példák táblázathoz
  - Beillesztve a középhaladó felhasználói gyorsindítóba
  - Hozzáadva a Microsoft Foundry sablonok szekcióhoz
  - Frissítve az összehasonlító mátrix és technológiai találati részek
- **Dokumentáció minőség**: Javult B+ (87%) → A- (92%) a docs mappában:
  - Várt kimenetek hozzáadva kritikus parancspéldákhoz
  - Ellenőrzési lépések beépítve konfigurációs változtatásokhoz
  - Gyakorlati tanulás bővítve

#### Módosítva
- **Tanulási előrehaladás**: Jobb AI példaintegráció középhaladó tanulóknak
- **Dokumentációs szerkezet**: Több gyakorlati feladat, egyértelmű eredményekkel
- **Ellenőrzési folyamat**: Expliciten megadott siker kritériumok fő munkafolyamatokhoz

#### Javított
- **Fejlesztői élmény**: Microsoft Foundry Models telepítés most 35-45 perc (szemben a bonyolultabb alternatívák 60-90 percével)
- **Költségátláthatóság**: Egyértelmű költségbecslések ($50-200/hó) a Microsoft Foundry Models példához
- **Tanulási útvonal**: AI fejlesztőknek világos belépési pont az azure-openai-chat segítségével
- **Dokumentációs szabványok**: Következetes várt output és ellenőrzési lépések

#### Ellenőrizve
- ✅ A Microsoft Foundry Models példa teljesen működőképes, `azd up`-val
- ✅ Az összes 11 megvalósítási fájl szintaktikailag helyes
- ✅ README utasítások egyeznek a tényleges telepítési élménnyel
- ✅ Dokumentációs linkek 8+ helyen frissítve
- ✅ A példák index pontosan tükrözi a 4 helyi példát
- ✅ Nincs ismétlődő külső link táblázatokban
- ✅ Minden navigációs hivatkozás helyes

#### Műszaki megvalósítás
- **Microsoft Foundry Models architektúra**: gpt-4.1 + Key Vault + Container Apps minta
- **Biztonság**: Kezelt identitás készen áll, titkok Key Vault-ban
- **Monitorozás**: Application Insights integráció
- **Költségmenedzsment**: Token követés és használat optimalizálás
- **Telepítés**: Egyetlen `azd up` parancs a teljes beállításhoz

### [v3.6.0] - 2025-11-19

#### Jelentős frissítés: Container App telepítési példák
**Ez a verzió bemutatja az átfogó, gyártásra kész konténer alkalmazás telepítési példákat az Azure Developer CLI-vel (AZD), teljes dokumentációval integrálva a tanulási útba.**

#### Hozzáadva
- **🚀 Container App példák**: Új helyi példák a `examples/container-app/`-ban:
  - [Mesteri Útmutató](examples/container-app/README.md): Teljes áttekintés a konténerizált telepítésekről, gyors indításról, éles környezetről és haladó mintákról
  - [Egyszerű Flask API](../../examples/container-app/simple-flask-api): Kezdőbarát REST API skálázódással nullára, egészségügyi ellenőrzésekkel, monitorozással és hibakereséssel
  - [Mikroszolgáltatások architektúrája](../../examples/container-app/microservices): Éles környezetben használható, több szolgáltatásos telepítés (API Gateway, Termék, Megrendelés, Felhasználó, Értesítés), aszinkron üzenetküldés, Service Bus, Cosmos DB, Azure SQL, elosztott nyomon követés, blue-green/canary telepítés
- **Legjobb gyakorlatok**: Biztonság, monitorozás, költségoptimalizálás és CI/CD útmutató konténerizált terhelésekhez
- **Kódpéldák**: Teljes `azure.yaml`, Bicep sablonok és többnyelvű szolgáltatás megvalósítások (Python, Node.js, C#, Go)
- **Tesztelés és hibakeresés**: Végponttól végpontig tesztesetek, monitorozó parancsok, hibakeresési útmutató

#### Változások
- **README.md**: Frissítve új konténer alkalmazás példákkal és hivatkozásokkal a „Helyi példák – Konténer alkalmazások” alatt
- **examples/README.md**: Frissítve a konténer alkalmazás példák kiemelésével, összehasonlítási mátrix bejegyzésekkel és technológia/architektúra hivatkozásokkal
- **Tanfolyam vázlat és tanulmányi útmutató**: Frissítve új konténer alkalmazás példákra és telepítési mintákra hivatkozva a releváns fejezetekben

#### Ellenőrzött
- ✅ Minden új példa telepíthető `azd up` használatával és követi a legjobb gyakorlatokat
- ✅ Dokumentációs kereszt-linkek és navigáció frissítve
- ✅ Példák lefedik a kezdőtől a haladó szcenáriókig, beleértve az éles mikroszolgáltatásokat is

#### Megjegyzések
- **Hatókör**: Csak angol nyelvű dokumentáció és példák
- **Következő lépések**: Kiterjesztés további haladó konténer mintákkal és CI/CD automatizálással a későbbi verziókban

### [v3.5.0] - 2025-11-19

#### Termék újra márkázása: Microsoft Foundry
**Ez a verzió az „Microsoft Foundry” átfogó terméknév változtatását hajtja végre az összes angol dokumentációban, tükrözve a Microsoft hivatalos újra márkázását.**

#### Változások
- **🔄 Terméknév frissítés**: Teljes átnevezés „Microsoft Foundry”-ról „Microsoft Foundry”-ra
  - Minden hivatkozás frissítve az angol dokumentációban a `docs/` mappában
  - Átnevezett mappa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Átnevezett fájl: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Összesen: 23 tartalmi hivatkozás frissítve 7 dokumentációs fájlban

- **📁 Mappa struktúra változások**:
  - `docs/ai-foundry/` átnevezve `docs/microsoft-foundry/`-re
  - Minden kereszt-hivatkozás frissítve az új mappastruktúrának megfelelően
  - Navigációs linkek validálva minden dokumentációban

- **📄 Fájl átnevezések**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Minden belső link frissítve az új fájlnévre hivatkozva

#### Frissített fájlok
- **Fejezet dokumentációk** (7 fájl):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigációs link frissítés
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 terméknév hivatkozás frissítés
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Már Microsoft Foundryt használ (korábbi frissítésekből)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 hivatkozás frissítve (áttekintés, közösségi visszajelzés, dokumentáció)
  - `docs/getting-started/azd-basics.md` - 4 kereszt-hivatkozási link frissítés
  - `docs/getting-started/first-project.md` - 2 fejezet navigációs link frissítés
  - `docs/getting-started/installation.md` - 2 következő fejezet link frissítés
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 hivatkozás frissítve (navigáció, Discord közösség)
  - `docs/troubleshooting/common-issues.md` - 1 navigációs link frissítés
  - `docs/troubleshooting/debugging.md` - 1 navigációs link frissítés

- **Tanfolyam struktúra fájlok** (2 fájl):
  - `README.md` - 17 hivatkozás frissítés (tanfolyam áttekintés, fejezetcímek, sablonok szakasz, közösségi értékelések)
  - `course-outline.md` - 14 hivatkozás frissítés (áttekintés, tanulási célok, fejezeti erőforrások)

#### Ellenőrzött
- ✅ Nincs több „ai-foundry” mappa elérési hivatkozás az angol doksikban
- ✅ Nincs több „Microsoft Foundry” terméknév hivatkozás az angol doksikban
- ✅ Minden navigációs link működik az új mappastruktúrával
- ✅ Fájl és mappa átnevezések sikeresen végrehajtva
- ✅ Fejezetek közti kereszt-hivatkozások validálva

#### Megjegyzések
- **Hatókör**: Változtatások csak az angol dokumentációra vonatkoznak a `docs/` mappában
- **Fordítások**: A fordítási mappák (`translations/`) nem frissültek ebben a verzióban
- **Műhely**: A műhely anyagok (`workshop/`) nem frissültek ebben a verzióban
- **Példák**: Példafájlok még hivatkozhatnak a régi elnevezésekre (jövőbeni frissítés tárgya)
- **Külső linkek**: Külső URL-ek és GitHub tárhely hivatkozások változatlanok maradnak

#### Migrációs útmutató közreműködőknek
Ha helyi ágak vagy dokumentációk hivatkoznak a régi struktúrára:
1. Frissítse a mappa hivatkozásokat: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Frissítse a fájl hivatkozásokat: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Cserélje a terméknevet: „Microsoft Foundry” → „Microsoft Foundry”
4. Ellenőrizze, hogy minden belső dokumentációs link működik-e

---

### [v3.4.0] - 2025-10-24

#### Infrastruktúra előnézet és validációs fejlesztések
**Ez a verzió átfogó támogatást vezet be az új Azure Developer CLI előnézeti funkcióhoz, és javítja a műhely felhasználói élményét.**

#### Hozzáadva
- **🧪 azd provision --preview funkció dokumentáció**: Átfogó lefedettség az új infrastruktúra előnézeti képességhez
  - Parancs referencia és használati példák a gyors segédletben
  - Részletes integráció a telepítési útmutatóban, használati esetekkel és előnyökkel
  - Pre-flight ellenőrzés integráció a biztonságosabb telepítés validálásához
  - Kezdő útmutató frissítései a biztonságos telepítési gyakorlatokkal
- **🚧 Műhely állapot banner**: Professzionális HTML banner, amely jelzi a műhely fejlesztési állapotát
  - Áttűnéses dizájn építési indikátorokkal a felhasználói egyértelműségért
  - Utolsó frissítés időbélyeggel az átláthatóságért
  - Mobilra reszponzív minden eszköztípusra

#### Fejlesztve
- **Infrastruktúra biztonság**: Előnézeti funkció integrálva a telepítési dokumentációkban
- **Telepítés előtti validáció**: Automatizált szkriptek most tartalmaznak infrastruktúra előnézeti teszteket
- **Fejlesztői munkafolyamat**: Frissített parancssorozatok az előnézet bevonásával, mint legjobb gyakorlat
- **Műhely élmény**: Egyértelmű várakozások a tartalom fejlesztési állapotáról a felhasználók számára

#### Változtatva
- **Telepítési legjobb gyakorlatok**: Előnézeti munkafolyamat most ajánlott megközelítés
- **Dokumentáció folyamata**: Infrastruktúra validáció korábbra helyezése a tanulási folyamatban
- **Műhely bemutatása**: Professzionális státusz kommunikáció egyértelmű fejlesztési idővonallal

#### Javítva
- **Biztonság-első megközelítés**: Infrastruktúra változtatások most már validálhatók telepítés előtt
- **Csapatmunka**: Előnézeti eredmények megoszthatók átnézésre és jóváhagyásra
- **Költség tudatosság**: Forrásköltségek jobb megértése a szolgáltatás kiépítése előtt
- **Kockázatcsökkentés**: Csökkentett telepítési hibák előzetes validációval

#### Technikai megvalósítás
- **Több dokumentumos integráció**: Előnézeti funkció dokumentálva 4 kulcsfájlban
- **Parancs minták**: Konzisztens szintaxis és példák a dokumentációkban
- **Legjobb gyakorlat integráció**: Előnézet beépítve a validációs folyamatokba és szkriptekbe
- **Vizuális indikátorok**: Egyértelmű ÚJ funkció jelölés a könnyű felfedezés érdekében

#### Műhely infrastruktúra
- **Státusz kommunikáció**: Professzionális HTML banner áttűnéses stílussal
- **Felhasználói élmény**: Egyértelmű fejlesztési állapot megakadályozza a félreértéseket
- **Professzionális bemutatás**: Megőrzi a tárhely hitelességét miközben várakozásokat állít be
- **Idővonal átláthatóság**: 2025 októberi utolsó frissítés időbélyeg a felelősségre vonhatóságért

### [v3.3.0] - 2025-09-24

#### Fejlett műhely anyagok és interaktív tanulási élmény
**Ez a verzió átfogó műhely anyagokat vezet be böngészőalapú interaktív útmutatókkal és strukturált tanulási útvonalakkal.**

#### Hozzáadva
- **🎥 Interaktív műhely útmutató**: Böngészőalapú műhely élmény MkDocs előnézeti képességgel
- **📝 Strukturált műhely utasítások**: 7 lépéses vezetett tanulási út felfedezéstől a testreszabásig
  - 0-Bevezető: Műhely áttekintése és beállítás
  - 1-AI template kiválasztás: Sablon felfedezés és kiválasztási folyamat
  - 2-AI template validálás: Telepítési és validációs eljárások
  - 3-AI template bontás: Sablon architektúra megértése
  - 4-AI template konfigurálás: Konfiguráció és testreszabás
  - 5-AI template finomítás: Haladó módosítások és iterációk
  - 6-Infrastruktúra bontás: Takarítás és erőforrás menedzsment
  - 7-Összegzés: Összefoglalás és következő lépések
- **🛠️ Műhely eszközök**: MkDocs konfiguráció Material témával a fejlettebb tanulási élményért
- **🎯 Gyakorlati tanulási út**: 3 lépéses módszertan (Felfedezés → Telepítés → Testreszabás)
- **📱 GitHub Codespaces integráció**: Zökkenőmentes fejlesztői környezet beállítás

#### Fejlesztve
- **AI műhely labor**: Kiterjesztve átfogó 2-3 órás strukturált tanulási élménnyel
- **Műhely dokumentáció**: Professzionális bemutatás navigációval és vizuális segédletekkel
- **Tanulási előrehaladás**: Egyértelmű lépésről lépésre útmutatás a sablonválasztástól az éles telepítésig
- **Fejlesztői élmény**: Integrált eszközök a gördülékeny fejlesztési munkafolyamatokhoz

#### Javítva
- **Akadálymentesség**: Böngészőalapú felület kereséssel, másolás funkcióval és témaváltóval
- **Önirányított tanulás**: Rugalmas műhely struktúra eltérő tanulási tempókhoz
- **Gyakorlati alkalmazás**: Valós AI sablon telepítési szcenáriók
- **Közösségi integráció**: Discord integráció műhely támogatásra és együttműködésre

#### Műhely funkciók
- **Beépített keresés**: Gyors kulcsszó és lecke felfedezés
- **Kódblokk másolás**: Hover-to-copy funkció minden kódpélda esetén
- **Téma váltó**: Sötét/fény mód támogatás a különböző preferenciákhoz
- **Vizuális elemek**: Képernyőképek és diagramok a jobb megértéshez
- **Segítség integráció**: Közvetlen Discord elérés közösségi támogatáshoz

### [v3.2.0] - 2025-09-17

#### Jelentős navigációs átalakítás és fejezet alapú tanulási rendszer
**Ez a verzió átfogó fejezet alapú tanulási struktúrát vezet be, jelentősen javítva a navigációt az egész tárhelyen.**

#### Hozzáadva
- **📚 Fejezet alapú tanulási rendszer**: Teljes kurzus átalakítása 8 progresszív tanulási fejezetre
  - 1. fejezet: Alapok és gyors indítás (⭐ - 30-45 perc)
  - 2. fejezet: AI-központú fejlesztés (⭐⭐ - 1-2 óra)
  - 3. fejezet: Konfiguráció és hitelesítés (⭐⭐ - 45-60 perc)
  - 4. fejezet: Infrastruktúra kód formájában és telepítés (⭐⭐⭐ - 1-1.5 óra)
  - 5. fejezet: Többagent AI megoldások (⭐⭐⭐⭐ - 2-3 óra)
  - 6. fejezet: Telepítés előtti validáció és tervezés (⭐⭐ - 1 óra)
  - 7. fejezet: Hibakeresés és debuggolás (⭐⭐ - 1-1.5 óra)
  - 8. fejezet: Éles és vállalati minták (⭐⭐⭐⭐ - 2-3 óra)
- **📚 Átfogó navigációs rendszer**: Egységes navigációs fejléc és lábléc az összes dokumentációban
- **🎯 Előrehaladás nyomon követése**: Kurzus teljesítési ellenőrzőlista és tanulás igazolási rendszer
- **🗺️ Tanulási útvonal útmutatás**: Egyértelmű belépési pontok különböző tapasztalati szintekhez és célokhoz
- **🔗 Kereszt-referencia navigáció**: Kapcsolódó fejezetek és előfeltételek egyértelműen összekapcsolva

#### Fejlesztve
- **README felépítés**: Szervezett tanulási platformmá alakítva fejezet alapú szervezéssel
- **Dokumentáció navigáció**: Minden oldal tartalmazza a fejezet kontextust és előrehaladási útmutatót
- **Sablon szervezés**: Példák és sablonok hozzárendelve a megfelelő tanulási fejezetekhez
- **Erőforrás integráció**: Gyorssegédletek, GYIK és tanulmányi útmutatók kapcsolódva a releváns fejezetekhez
- **Műhely integráció**: Gyakorló laborok hozzárendelve több fejezet tanulási céljaihoz

#### Változtatva
- **Tanulási előrehaladás**: Lineáris dokumentációról rugalmas fejezet alapú tanulásra váltás
- **Konfiguráció elhelyezése**: Konfigurációs útmutató a 3. fejezetbe áthelyezve a jobb tanulási folyamat érdekében
- **AI tartalom integráció**: AI-specifikus tartalom jobb integrációja az egész tanulási úton át
- **Éles tartalom**: Haladó minták összesítve a 8. fejezetben vállalati tanulók számára

#### Javítva
- **Felhasználói élmény**: Egyértelmű navigációs morzsák és fejezet előrehaladási indikátorok
- **Akadálymentesség**: Egységes navigációs minták az egyszerűbb kurzus bejáráshoz
- **Professzionális bemutatás**: Egyetemi stílusú kurzus struktúra egyaránt alkalmas akadémiai és vállalati képzésekre
- **Tanulási hatékonyság**: Rövidebb idő az releváns tartalom megtalálásához a jobb szervezéssel

#### Technikai megvalósítás
- **Navigációs fejlécek**: Szabványos fejezet navigáció 40+ dokumentációs fájlban
- **Lábléces navigáció**: Egységes előrehaladási útmutató és fejezet befejezési jelzések
- **Kereszt-linkelés**: Átfogó belső hivatkozási rendszer összekötve kapcsolódó fogalmakat
- **Fejezet hozzárendelés**: Sablonok és példák egyértelműen társítva tanulási célokhoz

#### Tanulmányi útmutató fejlesztése
- **📚 Átfogó tanulási célok**: Tanulmányi útmutató átalakítása az 8-fejezetes rendszerhez igazítva
- **🎯 Fejezet alapon értékelés**: Minden fejezet konkrét tanulási célokat és gyakorlati feladatokat tartalmaz
- **📋 Előrehaladás követése**: Heti tanulási ütemterv mérhető eredményekkel és befejezési ellenőrzőlistákkal
- **❓ Értékelő kérdések**: Tudásvalidációs kérdések minden fejezethez szakmai eredményekkel
- **🛠️ Gyakorlati feladatok**: Gyakorlati tevékenységek valós telepítési szcenáriókkal és hibakereséssel
- **📊 Készség fejlődés**: Egyértelmű előrehaladás alapfogalmaktól vállalati mintákig, karrierfejlesztési fókusz
- **🎓 Tanúsítvány keretrendszer**: Szakmai fejlődési eredmények és közösségi elismerési rendszer
- **⏱️ Idővonal kezelése**: Strukturált 10 hetes tanulási terv mérföldkő ellenőrzésekkel

### [v3.1.0] - 2025-09-17

#### Fejlett több-agent AI megoldások
**Ez a verzió javítja a több-agentes kiskereskedelmi megoldást jobb agent elnevezéssel és részletesebb dokumentációval.**

#### Változtatva
- **Multi-agent terminológia**: A „Cora agent” kifejezést lecseréltük „Ügyfél agent”-re a kiskereskedelmi multi-agent megoldásban a világosabb megértés érdekében  
- **Agent architektúra**: Minden dokumentációt, ARM sablont és kódpéldát frissítettünk a következetes „Ügyfél agent” elnevezés használatára  
- **Konfigurációs példák**: Modernizáltuk az agent konfigurációs mintákat frissített elnevezési konvenciókkal  
- **Dokumentáció következetessége**: Biztosítottuk, hogy minden hivatkozás professzionális, leíró agent neveket használjon  

#### Fejlesztett  
- **ARM Sablon Csomag**: Frissítettük a retail-multiagent-arm-template-et Ügyfél agent hivatkozásokkal  
- **Architektúra Diagramok**: Megújítottuk a Mermaid diagramokat az agent elnevezések frissítésével  
- **Kódpéldák**: Python osztályok és implementációs példák immár CustomerAgent elnevezést használnak  
- **Környezet változók**: Minden telepítési scriptet frissítettünk a CUSTOMER_AGENT_NAME konvenciók használatára  

#### Javított  
- **Fejlesztői élmény**: Egyértelműbb agent szerepek és felelősségek a dokumentációban  
- **Termelési készenlét**: Jobb összhang a vállalati elnevezési konvenciókkal  
- **Tananyagok**: Intuitívabb agent elnevezések az oktatás céljára  
- **Sablon használhatóság**: Egyszerűbb megértés az agent funkciókról és telepítési mintákról  

#### Műszaki részletek  
- Frissítettük a Mermaid architektúra diagramokat CustomerAgent hivatkozásokkal  
- Lecseréltük a CoraAgent osztályneveket CustomerAgent-re a Python példákban  
- Módosítottuk az ARM sablon JSON konfigurációkat, hogy „customer” agent típust használjanak  
- Frissítettük a környezeti változókat a CORA_AGENT_* mintáról CUSTOMER_AGENT_* mintára  
- Megújítottuk az összes telepítési parancsot és konténer konfigurációt  

### [v3.0.0] - 2025-09-12  

#### Jelentős változások - AI fejlesztő fókusz és Microsoft Foundry integráció  
**Ez a verzió a tárházat átalakítja egy átfogó AI-központú tanulási forrássá Microsoft Foundry integrációval.**  

#### Hozzáadva  
- **🤖 AI-központú tanulási útvonal**: Teljes átszervezés az AI fejlesztők és mérnökök prioritásával  
- **Microsoft Foundry Integrációs Útmutató**: Átfogó dokumentáció az AZD és Microsoft Foundry szolgáltatások összekapcsolásához  
- **AI modell telepítési minták**: Részletes útmutató a modellválasztásról, konfigurációról és termelési telepítési stratégiákról  
- **AI Műhely Labor**: 2-3 órás gyakorlati workshop AI alkalmazások AZD-vel telepíthető megoldássá alakítására  
- **Termelési AI legjobb gyakorlatok**: Vállalati kész minták AI feladatok skálázására, monitorozására és biztosítására  
- **AI-specifikus hibaelhárítási útmutató**: Átfogó hibakeresés Microsoft Foundry modellekhez, Cognitive Services-hez és AI telepítési kérdésekhez  
- **AI sablon galéria**: Kiemelt Microsoft Foundry sablongyűjtemény bonyolultsági értékelésekkel  
- **Workshop anyagok**: Teljes workshop struktúra gyakorlati laborokkal és hivatkozási anyagokkal  

#### Fejlesztett  
- **README struktúra**: AI fejlesztő fókuszú, 45%-os közösségi érdeklődés adat a Microsoft Foundry Discordból  
- **Tanulási útvonalak**: Dedikált AI fejlesztői útvonal a hagyományos diák és DevOps mérnök utak mellett  
- **Sablon ajánlások**: Kiemelt AI sablonok, köztük azure-search-openai-demo, contoso-chat és openai-chat-app-quickstart  
- **Közösségi integráció**: Kiterjesztett Discord közösségi támogatás AI-specifikus csatornákkal és beszélgetésekkel  

#### Biztonság és termelési fókusz  
- **Kezelt identitás minták**: AI-specifikus hitelesítés és biztonsági konfigurációk  
- **Költségoptimalizálás**: Token használat nyomon követése és költségvetési kontroll AI feladatokhoz  
- **Több régiós telepítés**: Globális AI alkalmazás telepítési stratégiák  
- **Teljesítmény monitorozás**: AI-specifikus metrikák és Application Insights integráció  

#### Dokumentáció minősége  
- **Lineáris tanfolyam struktúra**: Logikus haladás kezdőtől haladó AI telepítési mintákig  
- **Ellenőrzött URL-ek**: Minden külső tárház hivatkozás ellenőrizve és elérhető  
- **Teljes körű hivatkozás**: Minden belső dokumentációs link validált és működőképes  
- **Termelésre kész**: Vállalati telepítési minták valós példákkal  

### [v2.0.0] - 2025-09-09  

#### Jelentős változások - Tárház átszervezés és professzionális fejlesztés  
**Ez a verzió jelentős átalakítást képvisel a tárház szerkezetében és tartalmának bemutatásában.**  

#### Hozzáadva  
- **Strukturált tanulási keret**: Minden dokumentációs oldalon immár Bevezetés, Tanulási célok és Tanulási eredmények szekciók találhatók  
- **Navigációs rendszer**: Hozzáadott Előző/Következő leckehivatkozások az összes dokumentációhoz a kísért tanulási haladáshoz  
- **Tanulmányi útmutató**: Átfogó study-guide.md tanulási célokkal, gyakorlati feladatokkal és értékelési anyagokkal  
- **Professzionális megjelenés**: Az emoji ikonok eltávolítása a jobb elérhetőség és professzionális megjelenés érdekében  
- **Fejlesztett tartalmi struktúra**: Javított tananyagszervezés és folyamat  

#### Módosítva  
- **Dokumentáció formátuma**: Minden dokumentáció egységes, tanulásközpontú struktúrát kapott  
- **Navigációs folyamat**: Logikus haladás az összes tananyagban bevezetve  
- **Tartalom bemutatása**: Díszítő elemek eltávolítása a tiszta, professzionális formázás érdekében  
- **Link struktúra**: Minden belső hivatkozás frissítve az új navigációs rendszer támogatására  

#### Javított  
- **Elérhetőség**: Emoji függőségek eltávolítása a jobb képernyőolvasó kompatibilitásért  
- **Professzionális megjelenés**: Tiszta, akadémiai stílusú megjelenítés, vállalati képzéshez megfelelő  
- **Tanulási élmény**: Strukturált megközelítés egyértelmű célkitűzésekkel és eredményekkel minden leckéhez  
- **Tartalom szervezése**: Jobb logikai folyamat és kapcsolódó témák összekapcsolása  

### [v1.0.0] - 2025-09-09  

#### Első kiadás - Átfogó AZD tanulási tárház  

#### Hozzáadva  
- **Alap dokumentációs struktúra**  
  - Teljes bevezető útmutató sorozat  
  - Átfogó telepítési és előkészítési dokumentáció  
  - Részletes hibakeresési források és debugger útmutatók  
  - Előtelepítési érvényesítő eszközök és eljárások  

- **Bevezető modul**  
  - AZD Alapok: Alapfogalmak és terminológia  
  - Telepítési útmutató: Platform specifikus beállítási utasítások  
  - Konfigurációs útmutató: Környezet beállítás és hitelesítés  
  - Első projekt bemutató: lépésről lépésre gyakorlati tanulás  

- **Telepítés és előkészítés modul**  
  - Telepítési útmutató: Teljes munkafolyamat dokumentáció  
  - Előkészítési útmutató: Infrastrukturakód Bicep-pel  
  - Legjobb gyakorlatok termelési telepítéshez  
  - Több szolgáltatásos architektúra minták  

- **Előtelepítési validációs modul**  
  - Kapacitástervezés: Azure erőforrás elérhetőség érvényesítése  
  - SKU választás: Átfogó szolgáltatási szint útmutató  
  - Előrepillantó ellenőrzések: Automatizált érvényesítő szkriptek (PowerShell és Bash)  
  - Költségbecslési és költségvetés tervező eszközök  

- **Hibaelhárítási modul**  
  - Gyakori problémák: Gyakran előforduló hibák és megoldásuk  
  - Hibakeresési útmutató: Rendszeres hibaelhárítási metodikák  
  - Fejlett diagnosztikai technikák és eszközök  
  - Teljesítményfigyelés és optimalizálás  

- **Források és hivatkozások**  
  - Parancs gyors segítség: Lényeges parancsok gyors áttekintése  
  - Szójegyzék: Teljes terminológia és rövidítésmagyarázat  
  - Gyakran ismételt kérdések: Részletes válaszok ismert kérdésekre  
  - Külső forrás linkek és közösségi kapcsolatok  

- **Példák és sablonok**  
  - Egyszerű webalkalmazás példa  
  - Statikus weboldal telepítési sablon  
  - Konténeralkalmazás konfiguráció  
  - Adatbázis integrációs minták  
  - Mikroszolgáltatás architektúra példák  
  - Serverless funkció implementációk  

#### Jellemzők  
- **Többplatformos támogatás**: Telepítési és konfigurációs útmutatók Windows, macOS és Linux rendszerekhez  
- **Több képzettségi szint**: Tartalom diákoktól professzionális fejlesztőkig  
- **Gyakorlati fókusz**: Gyakorlati példák és valós életbeli szcenáriók  
- **Átfogó lefedettség**: Az alapfogalmaktól a fejlett vállalati mintákig   
- **Biztonság központú megközelítés**: Biztonsági legjobb gyakorlatok beépítve mindenütt  
- **Költségoptimalizálás**: Útmutatás költséghatékony telepítésekhez és erőforrás kezelésekhez  

#### Dokumentáció minősége  
- **Részletes kódpéldák**: Gyakorlati, tesztelt kódminták  
- **Lépésről lépésre utasítások**: Világos, végrehajtható útmutatás  
- **Teljes körű hibakezelés**: Gyakori problémák hibaelhárítása  
- **Legjobb gyakorlatok beépítése**: Iparági szabványok és ajánlások  
- **Verzió kompatibilitás**: Naprakész az Azure legújabb szolgáltatásaival és az azd funkcióival  

## Tervezett jövőbeli fejlesztések  

### Verzió 3.1.0 (tervezett)  
#### AI platform bővítés  
- **Több modell támogatás**: Integrációs minták Hugging Face, Azure Machine Learning és egyedi modellekhez  
- **AI agent keretrendszerek**: Sablonok LangChain, Semantic Kernel és AutoGen telepítésekhez  
- **Fejlett RAG minták**: Vektor adatbázis opciók az Azure AI Search mellett (Pinecone, Weaviate, stb.)  
- **AI megfigyelhetőség**: Fejlettebb monitorozás a modell teljesítmény, token használat és válaszminőség szempontjából  

#### Fejlesztői élmény  
- **VS Code bővítmény**: Integrált AZD + Microsoft Foundry fejlesztői élmény  
- **GitHub Copilot integráció**: AI által támogatott AZD sablon generálás  
- **Interaktív oktatóanyagok**: Gyakorlati kódolási feladatok AI szcenáriók automatikus validálásával  
- **Videós tartalom**: Kiegészítő videós oktatóanyagok vizuális tanulóknak AI telepítési fókuszban  

### Verzió 4.0.0 (tervezett)  
#### Vállalati AI minták  
- **Irányítási keretrendszer**: AI modell kormányzás, megfelelőség és audit nyomvonalak  
- **Több bérlős AI**: Minták több ügyfél kiszolgálására izolált AI szolgáltatásokkal  
- **Edge AI telepítés**: Integráció Azure IoT Edge-del és konténer példányokkal  
- **Hibrid felhős AI**: Többfelhős és hibrid telepítési minták AI feladatokra  

#### Fejlett funkciók  
- **AI pipeline automatizálás**: MLOps integráció Azure Machine Learning pipeline-okkal  
- **Fejlett biztonság**: Nullakockázat minták, privát végpontok és fejlett fenyegetésvédelem  
- **Teljesítményoptimalizálás**: Fejlett hangolási és skálázási stratégiák nagy áteresztőképességű AI alkalmazásokhoz  
- **Globális terjesztés**: Tartalomszolgáltatás és edge cache minták AI alkalmazásokhoz  

### Verzió 3.0.0 (tervezett) - A jelenlegi kiadás által felülírva  
#### Javasolt kiegészítések - Most bevezetve a v3.0.0-ban  
- ✅ **AI-központú tartalom**: Átfogó Microsoft Foundry integráció (Teljesítve)  
- ✅ **Interaktív oktatóanyagok**: Gyakorlati AI műhely labor (Teljesítve)  
- ✅ **Fejlett biztonsági modul**: AI-specifikus biztonsági minták (Teljesítve)  
- ✅ **Teljesítmény optimalizálás**: AI terhelés hangolási stratégiák (Teljesítve)  

### Verzió 2.1.0 (tervezett) - Részben megvalósítva a v3.0.0-ban  
#### Kis fejlesztések - Néhány a jelenlegi kiadásban készült el  
- ✅ **További példák**: AI-központú telepítési szcenáriók (Teljesítve)  
- ✅ **Kibővített GYIK**: AI-specifikus kérdések és hibaelhárítás (Teljesítve)  
- **Eszköz integráció**: Fejlesztett IDE és szerkesztő integrációs útmutatók  
- ✅ **Monitorozás bővítés**: AI-specifikus monitorozási és riasztási minták (Teljesítve)  

#### Még tervezett a jövőbeni kiadásokra  
- **Mobilbarát dokumentáció**: Reszponzív dizájn mobil tanuláshoz  
- **Offline hozzáférés**: Letölthető dokumentáció csomagok  
- **Fejlesztett IDE integráció**: VS Code bővítmény AZD + AI munkafolyamatokhoz  
- **Közösségi irányítópult**: Valós idejű közösségi mutatók és hozzájárulás követés  

## Hogyan járulhat hozzá a Változásnaplóhoz  

### Változások jelentése  
Amikor hozzájárul ehhez a tárházhoz, kérjük, gondoskodjon róla, hogy a változásnapló bejegyzések tartalmazzák:  

1. **Verzió szám**: Szabályos szemantikus verziókezelés szerint (fő.kis.korrekció)  
2. **Dátum**: Kiadás vagy frissítés dátuma YYYY-MM-DD formátumban  
3. **Kategória**: Hozzáadva, Módosítva, Elavult, Eltávolítva, Javítva, Biztonság  
4. **Világos leírás**: Tömör leírás a változásról  
5. **Hatásértékelés**: Hogyan érinti a változás a meglévő felhasználókat  

### Változás kategóriák  

#### Hozzáadva  
- Új funkciók, dokumentációs szekciók vagy képességek  
- Új példák, sablonok vagy tanulási források  
- További eszközök, szkriptek vagy segédprogramok  

#### Módosítva  
- Meglévő funkció vagy dokumentáció módosításai  
- Frissítések a pontosabb vagy érthetőbb tartalom érdekében  
- Tartalom vagy szervezet átszervezése  

#### Elavult  
- Fázisban lévő jellemzők vagy megközelítések kifutása  
- Eltávolításra tervezett dokumentációs szekciók  
- Jobb alternatívákkal rendelkező módszerek  

#### Eltávolítva  
- Olyan funkciók, dokumentáció vagy példák, amelyek már nem relevánsak  
- Elavult információk vagy kifutó megközelítések  
- Fölösleges vagy összevont tartalom  

#### Javítva  
- Dokumentációs vagy kódbeli hibák javításai  
- Jelentett problémák megoldása  
- Pontosság vagy működés javítása  

#### Biztonság  
- Biztonsággal kapcsolatos fejlesztések vagy javítások  
- Biztonsági legjobb gyakorlatok frissítése  
- Biztonsági sérülékenységek megszüntetése  

### Szemantikus verziózás irányelvei  

#### Főverzió (X.0.0)  
- Törő változások, amelyek felhasználói beavatkozást igényelnek  
- Jelentős tartalom- vagy szervezeti átalakítások  
- Az alapvető megközelítést vagy módszertant érintő változások  

#### Kisverzió (X.Y.0)  
- Új funkciók vagy tartalom hozzáadása  
- Hátralék kompatibilitást megőrző fejlesztések  
- További példák, eszközök vagy források  

#### Javító verzió (X.Y.Z)  
- Hibajavítások és korrekciók  
- Kis fejlesztések meglévő tartalomban  
- Tisztázások és apró fejlesztések  

## Közösségi visszajelzések és javaslatok  

Aktívan ösztönözzük a közösségi visszajelzéseket a tanulási forrás fejlesztésére:  

### Hogyan adhat visszajelzést  
- **GitHub Issues**: Jelentsen problémákat vagy javasoljon fejlesztéseket (AI-specifikus problémák is szívesen)  
- **Discord Beszélgetések**: Ossza meg ötleteit és vegyen részt a Microsoft Foundry közösségben  
- **Pull Requestek**: Közvetlen fejlesztések hozzájárulása a tartalomhoz, különösen AI sablonokhoz és útmutatókhoz  
- **Microsoft Foundry Discord**: Vegyen részt az #Azure csatornán AZD + AI témájú beszélgetésekben  
- **Közösségi Fórumok**: Szélesebb Azure fejlesztői közösségi beszélgetésekben való részvétel  

### Visszajelzés kategóriák  
- **AI tartalom pontossága**: Javítások AI szolgáltatás integráció és telepítési információkra  
- **Tanulási élmény**: Javaslatok az AI fejlesztő tanulási folyamat javítására  
- **Hiányzó AI tartalom**: Kérések további AI sablonokra, mintákra vagy példákra  
- **Elérhetőség**: Fejlesztések a különböző tanulási igények számára  
- **AI eszköz integráció**: Javaslatok jobb AI fejlesztési munkafolyamat integrációkra  
- **Termelési AI minták**: Vállalati AI telepítési minták kérései  

### Válaszadási elkötelezettség  
- **Hibabejelentési válasz**: 48 órán belül megtörténik  
- **Funkció kérések**: Értékelés egy héten belül  
- **Közösségi hozzájárulások**: Áttekintés egy héten belül  
- **Biztonsági problémák**: Azonnali prioritás, gyorsított válasz  

## Karbantartási ütemterv  

### Rendszeres frissítések  
- **Havi felülvizsgálatok**: Tartalom pontosság és link ellenőrzés  
- **Negyedéves frissítések**: Jelentős tartalom hozzáadások és fejlesztések  
- **Féléves felülvizsgálatok**: Átfogó átszervezések és fejlesztések  
- **Éves kiadások**: Jelentős verziófrissítések jelentős fejlesztésekkel  

### Monitorozás és minőségbiztosítás  
- **Automatizált tesztelés**: A kódpéldák és linkek rendszeres ellenőrzése
- **Közösségi visszajelzések integrálása**: A felhasználói javaslatok rendszeres beépítése
- **Technológiai frissítések**: Az Azure legújabb szolgáltatásaival és az azd kiadásokkal való összhang
- **Hozzáférhetőségi auditok**: A befogadó tervezési elvek rendszeres áttekintése

## Verziótámogatási irányelv

### Jelenlegi verziótámogatás
- **Legújabb főverzió**: Teljes támogatás rendszeres frissítésekkel
- **Előző főverzió**: Biztonsági frissítések és kritikus javítások 12 hónapig
- **Régebbi verziók**: Csak közösségi támogatás, hivatalos frissítések nélkül

### Migrációs útmutatás
Főverziók megjelenésekor biztosítjuk:
- **Migrációs útmutatók**: Lépésről lépésre szóló átállási instrukciók
- **Kompatibilitási megjegyzések**: Részletek a kompatibilitást megtörő változásokról
- **Eszköztámogatás**: Szkriptek vagy segédprogramok a migráció megkönnyítésére
- **Közösségi támogatás**: Dedikált fórumok a migrációs kérdésekhez

---

**Navigáció**
- **Előző lecke**: [Tanulmányi útmutató](resources/study-guide.md)
- **Következő lecke**: Vissza a [Fő README-hez](README.md)

**Maradj képben**: Kövesd ezt a tárolót, hogy értesítéseket kapj az új kiadásokról és a tananyagot érintő fontos frissítésekről.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->