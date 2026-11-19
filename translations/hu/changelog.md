# Változásnapló - AZD Kezdőknek

## Bevezetés

Ez a változásnapló dokumentálja az AZD Kezdőknek tároló összes lényeges változását, frissítését és fejlesztését. A szemantikus verziózási elveket követjük, és ezt a naplót vezetjük, hogy segítsük a felhasználókat megérteni, mi változott a verziók között.

## Tanulási célok

A változásnapló átnézése után Ön:
- Tájékozódik az új funkciókról és tartalmi bővítésekről
- Megérti a meglévő dokumentáció javításait
- Követi a hibajavításokat és korrekciókat a pontosság érdekében
- Nyomon követi a tananyagtartalmak fejlődését időben

## Tanulmányi eredmények

A változásnapló bejegyzéseinek áttekintése után képes lesz:
- Azonosítani az új tartalmakat és tanulási forrásokat
- Megérteni, mely részek lettek frissítve vagy fejlesztve
- Megtervezni tanulási útját a legfrissebb anyagok alapján
- Visszajelzést és javaslatokat adni a jövőbeli fejlesztésekhez

## Verziótörténet

### [v3.25.0] - 2026-11-09

#### A Microsoft Foundry kiterjesztés 1.0 most már általánosan elérhető

A `microsoft.foundry` 1.0 csomag **élő és általánosan elérhető**, amint azt a [2026. november 5-én](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/) bejelentettük. A tanfolyam most már a kiadott GA munkafolyamatot tanítja, nem egy közelgő verziót. Kezdje az AZD **1.37.0 vagy újabb** verzióval és `azd ext install microsoft.foundry`.

#### Ebben a tanfolyamfrissítésben elérhető
- Az angol útmutatás alapértelmezett telepítési útként a GA csomagot használja, és elmagyarázza a hét független verziózott alapkiterjesztést.
- Egy [hostolt ügynök bemutató](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) lefedi az upstream Python Agent Framework Responses API mintát, jelenlegi uv-t, Python 3.13+-t, új/meglévő projekt kiválasztását, modell újrahasználatot és a `azure.yaml` áttekintését.
- A helyi-felhős munkafolyamat lefedi az Agent Inspector tesztelést, az Azure-alapú modellhívási költségeket, távoli kódfordításokat, telepített meghívásokat, felhő nyomkövetést, telepítés előnézetet, naplókat és diagnosztikát.
- Külön értékelési útmutatás tartalmazza az adatkészletek/értékelőskálák generálását és áttekintését, nevezzük el az értékelést, eszközök regisztrálását és az eredmények megtekintését. A régebbi értékelési/optimalizálási utasítások a migrációs előzmények között maradnak, nem a jelenlegi kiadási alap.
- A Foundry CI/CD útmutatás tartalmazza a runner kiterjesztések telepítését, hitelesített telepítést, értékelési eszközöket/hozzáférést és egy explicit minőségi kaput.
- A takarítási útmutatás megkülönbözteti az újonnan létrehozott és újrahasznált Foundry projekteket. A workshop a különálló GA gyakorlat linkjeit tartalmazza, anélkül, hogy lecserélné annak mintára szabott tesztjeit.
- A tanfolyam navigációja, tanulási céljai, beállítási előfeltételek, gyorssegédlet, GYIK és tanulmányi útmutató tükrözi a GA munkafolyamatot. A generált fordításokat nem szerkesztik kézzel.

#### Áttekintés terjedelme
- A GA bejelentés, a hivatkozott Microsoft Learn útmutatás és az upstream mintakonfiguráció alapján. Nem történt élő Azure szolgáltatás létrehozás, telepítés, modell meghívás vagy értékelés.
- A csomag GA nem jelenti minden opcionális funkció, független kiterjesztés vagy SDK GA státuszát, és nem tanúsítja a példákat éles használatra.

### [v3.24.0]- 2026-11-04

#### Javítva
- JAVÍTOTTUK az angol tanfolyam navigációt, az áthelyezett oldalak elérési útjait, hiányzó horgonyokat, valamint elavult külső hivatkozásokat, beleértve a 2. fejezet linkjét a termelési AI útmutatóhoz.
- ÁTNÉZÉSRE KERÜLT a jelenlegi útmutatás az AZD 1.37.2, az ügynökök 1.0.0-beta.23 és az értékelések 1.0.0-beta.2 kiadásokkal szemben. Dokumentáltuk a külön `azd ai eval` munkafolyamatot és az optimalizálási konfiguráció migrációját.
- Helyesbítettük a nem támogatott CLI kapcsolókat, hitelesítési határokat, szöveg alapú környezet-/titoktárolási útmutatást, infrastruktúra frissítéseket, modell konfigurációt és destruktív helyreállítási példákat.
- Frissítettük a workshopot a jelenlegi AI Ügynök minta alapján, beleértve valós horgonyokat, konfigurációs bemeneteket, értékelési teszteket, red-teaming belépési pontokat és megfigyelhetőséget.
- Kijavítottuk a példafeladat megvalósítási állításait és javítottuk az alkalmazás/infrastruktúra/konfiguráció kapcsolódó problémáit. A kereskedelmi architektúra anyag kifejezetten elkülönül a teljes működő alkalmazástól.
- Visszaállítottuk a CodeQL nyelvi mátrixot, a dev containerhez a Node.js 24-es támogatást választottuk ki, és a beállító validátorok most hibás verzióparancsokat jeleznek.

#### Hozzáadva
- Egy csak angol offline link/horgonyellenőrző, regressziós tesztek és egy dokumentációs munkafolyamat, ami szigorú módban is építi a workshopot. A generált fordítások és a lefordított képek kizártak.

#### Érvényességi kör
- A forrás, szintaxis, konfiguráció, helyi viselkedés és hálózati kapcsolat ellenőrzések nem biztosítanak élő Azure telepíthetőséget, kvótát, RBAC-ot, régió alapú modell elérhetőséget, számlázást, biztonsági megfelelést vagy éles üzemképességet.
- Az alábbi régebbi bejegyzések történeti feljegyzések, nem a jelenlegi parancs- vagy kiadási utasítások.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 frissítés: Verzió naprakészségi frissítés
**Ez a verzió újraellenőrzi a tanfolyamot az `azd` `1.27.1` (2026 július, legfrissebb stabil kiadás) és a jelenlegi előzetes AI ügynök kiterjesztés `azure.ai.agents` `1.0.0-beta.5` alapján, minden "validált" zászlót frissítve az 1.26.0, 1.27.0 és 1.27.1 kiadások után.**

#### Módosítva
- **✅ Érvényességi alapértelmezett frissítve** `azd 1.25.6`-ről (2026 június) `azd 1.27.1`-re (2026 július), az összes fő README, a fejezetek README-jei, az 1. fejezet dev-container leckéje (beleértve a rögzített verzió példákat), a 4. fejezet egyedi sablonok leckéje, az 5. fejezet multi-ügynök leckéje és a workshop dokumentációja területén
- **🤖 A 2. fejezet alapfrissítése** `azd 1.23.12`-ról (2026 március) `azd 1.27.1`-re `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` és `microsoft-foundry-integration.md` kapcsán; az érvényességi megjegyzések dátuma frissült 2026-07-13-ra
- **🧩 AI ügynök kiterjesztés verzió emelkedése** `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview`-ról a jelenlegi `1.0.0-beta.5` kiadásra a 2. fejezet README-jében és `agents.md`
- **🧪 Workshop érvényességi példa** (`azd version` kimenet) frissítve `1.27.1`-re

#### Megjegyzések a releváns azd kiadásokhoz (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go támogatás az Azure Functions Flex Consumption-ön, `azd config sub-filter` bérlő szerinti előfizetés szűrők, önálló kiterjesztéscsomagok (`azd x pack --bundle`) és `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modell Azure AI Foundry projektek/ügynökök közvetlenül `azure.yaml`-ban (Bicep nélküli/Terraform nélküli inicializálás), konténer telepítés támogatása App Service-hez (`host: appservice` + `language: docker`), közvetlen `-s/--source` `azd extension` parancsokhoz, és `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` kapcsoló `azd extension install` számára, alapértelmezetten kizárva az elavult modelleket a katalógusból/kvóta kérésekből, és több hibajavítás

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

#### Kezdő Hiánypótlás #2: Sablonszerkesztés, Dev Containers, Pulumi, Azure DevOps, Szolgáltatási Szerepkörök és Továbbiak
**Ez a verzió lezárja az azd-fedezet-elemzés által megmutatott köztes hiányosságokat: hogyan írjon és tegyen közzé saját sablont, reprodukálható dev-container/Codespaces környezeteket, a Pulumi infrastruktúra szolgáltatót, egy Azure DevOps CI/CD bemutatót, szolgáltatási szerepkör hitelesítést, hoszt kiválasztási útmutatást (AKS/Spring Apps), `azd restore`/`azd package` magyarázatokat, hook hiba kezelést és csapat/megosztott környezeti gyakorlatokat.**

#### Hozzáadva
- **🧱 Új 4. fejezet lecke** `docs/chapter-04-infrastructure/custom-templates.md` — saját azd sablon létrehozása: szükséges struktúra (`azure.yaml`, `infra/`, `src/`), a `metadata.template` mező, infrastruktúra paraméterezése a `uniqueString()` erőforrás token és a `azd-env-name` címke segítségével, helyi tesztelés `azd init --template <local-path>`-val, GitHub-ra publikálás és benyújtás az Awesome AZD galériába
- **📦 Új 1. fejezet lecke** `docs/chapter-01-foundation/dev-containers.md` — reprodukálható azd környezetek Dev Containers és GitHub Codespaces használatával: egy minimális `.devcontainer/devcontainer.json` az hivatalos `ghcr.io/azure/azure-dev/azd` funkció alkalmazásával, nyelvspecifikus funkciókkal, `docker-in-docker` konténer hosztokhoz és `azd auth login --use-device-code` távoli bejelentkezéshez
- **🧩 Pulumi az azd-vel** szakasz a `docs/chapter-04-infrastructure/provisioning.md`-ban — `infra.provider: pulumi`, Pulumi mappa felépítés, halmazok leképezése az azd környezetekre, szükséges kimenetek/címkézés, és azonos `azd up` / `azd down` munkafolyamat
- **🎯 Hoszt kiválasztási útmutató** a `docs/chapter-04-infrastructure/provisioning.md`-ban — kezdőknek szóló összehasonlítás `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` és `springapp` között, útmutatással, mikor válasszuk az AKS-t vagy az Azure Spring Apps-t
- **🛠️ Azure DevOps CI/CD bemutató** a `docs/chapter-08-production/production-ai-practices.md`-ban — `azd pipeline config --provider azdo`, szolgáltatáskapcsolat munka terhelési identitás szövetséggel (OIDC), a generált `azure-dev.yml` és változó csoport beállítása
- **🔑 Szolgáltatás Szerepkörök (Minta 4)** hozzáadva a `docs/chapter-03-configuration/authsecurity.md`-hoz — `az ad sp create-for-rbac`, interakció nélküli `azd auth login` kliens titokkal vs. federált/OIDC hitelesítőkkel, mikor használjuk, és biztonságos hitelesítő tárolás
- **🪝 Hook hiba-kezelés** alfejezet a `docs/chapter-04-infrastructure/deployment-guide.md`-ban — kilépési kódok és `set -e`, `continueOnError`, horgonyok izolált tesztelése `azd hooks run`-vel, operációs rendszer-specifikus shellek és `--debug`
- **👥 Csapat/megosztott környezetek** rész a `docs/chapter-03-configuration/configuration.md`-ben — mi van a `.azure/`-ben, mit kell gitignore-olni, fejlesztői környezetenkénti beállítások, `azd env list`/`select` és környezeti értékek biztosítása CI/CD-ben
- **🧰 `azd restore` és bővített `azd package`** magyarázatok a `resources/cheat-sheet.md`-ben — függőségek visszaállítása és egy telepíthető artefaktum építése telepítés nélkül

#### Módosítva
- **🧭 A 4. fejezet lecketáblája** frissítve az új „Saját sablon létrehozása” leckével (3. lecke)
- **🧭 Az 1. fejezet lecketáblája** frissítve az új „Dev Containers & Codespaces” leckével (5. lecke); navigációs láblécek összekötve `bring-your-own-app.md` és `dev-containers.md` között

### [v3.21.0] - 2026-06-16

#### Kezdő Hiánypótlás: Gyakorlati Multi-ügynök lecke, "Hozd a saját alkalmazásod", Terraform és CI/CD bemutató
**Ez a verzió lezárja a kezdők teljes útmutatójának legnagyobb hiányosságait azáltal, hogy két új gyakorlati leckét ad hozzá (egy telepíthető multi-ügynök bemutatót és az azd hozzáadását egy meglévő alkalmazáshoz), kezdők számára készült hook bevezetőt, Terraform az azd-vel részt, lépésről lépésre GitHub Actions pipeline bemutatót, az új előzetes kiterjesztések magyarázatát és egy explicit telepítés-ellenőrzési listát.**

#### Hozzáadva
- **🤝 Új 5. fejezet lecke** `docs/chapter-05-multi-agent/multi-agent-basics.md` — teljesen gyakorlati, telepíthető két-ügynökös bemutató (orchestrátor + specialisták) valós sablonnal (`contoso-creative-writer`), lefedve, mikor használjuk a multi-ügynököt, a `azd up` munkafolyamatot, a telepített erőforrások megértését, kereszt-ügynök nyomkövetést, testreszabást és takarítást
- **📦 Új 1. fejezet lecke** `docs/chapter-01-foundation/bring-your-own-app.md` — hogyan adjuk hozzá az azd-t meglévő projekthez `azd init` ("használja a jelenlegi könyvtár kódját"), `azure.yaml` és `infra/` megértése, `azd infra generate`, hoszt észlelés és telepítés `azd up` használatával
- **🌐 Terraform az azd-vel** szakasz hozzáadva a `docs/chapter-04-infrastructure/provisioning.md`-hoz — `infra.provider: terraform` konfiguráció, `.tf` mappa felépítés, szükséges `AZURE_*` kimenetek és `azd-env-name` címkézés, és azonos `azd up` / `azd down` munkafolyamat (lezárja azt a hiányt, ahol Terraform támogatást ígértek, de csak Bicep került bemutatásra)
- **⚙️ Lépésről lépésre GitHub Actions bemutató** `docs/chapter-08-production/production-ai-practices.md` — a GitHub repo-tól az automatikus telepítésekig: `azd pipeline config`, OIDC szövetségi hitelesítő adatok (nincs tárolt titok), a generált `azure-dev.yml` és a titkok vs. változók útmutató
- **🪝 Kezdőknek "Új a hook-okban?" bevezető** `docs/chapter-04-infrastructure/deployment-guide.md` — mi az a hook, hook-stádium tábla, egy minimális első hook, és a hook-ok kézi futtatása `azd hooks run` segítségével
- **✅ „Ellenőrizze a telepítését” ellenőrzőlista** hozzáadva az `docs/chapter-01-foundation/first-project.md` 5. lépéséhez — smoke test, egészség-ellenőrző végpont és egyértelmű siker kritériumok
- **🧩 Magyarázat az új előnézeti kiterjesztésekhez** `azure.ai.skills` és `azure.ai.connections` (mik azok és mikor érdemes használni őket) az `docs/chapter-08-production/production-ai-practices.md` dokumentációban

#### Módosítva
- **🧭 Az 5. fejezet tananyag táblázat** javítva: `multi-agent-basics.md` most már 1. lecke (az egyetlen teljes mértékben gyakorlati lecke), őszinte megjelöléssel, hogy a 2. lecke a 6. fejezetben van, és a Retail forgatókönyv egy architektúra tervrajz, nem egy parancs-alapú sablon
- **🧭 Az 1. fejezet tananyag táblázata** most tartalmazza az új "Hozd a saját applikációdat" leckét (4. lecke)
- **🔗 Navigációs láblécek** frissítve: `first-project.md` most tovább mutat a `bring-your-own-app.md`

#### Javítva
- **🧱 Bezárva az „állították, hogy van, de hiányzott” Terraform hiányosság** — a tanfolyam korábban említette a Terraform támogatást anélkül, hogy bemutatta volna azt
- **🔀 Javított félrevezető 5. fejezetbeli kereszthivatkozások** amelyek arra utaltak, hogy van teljes multi-ügynök implementáció, miközben csak architektúra tervrajz készült

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

#### AZD 1.25.6 frissítés, Teljes Agent Életciklus parancsok & Aspire Rebrand
**Ez a verzió újravalidálja a tanfolyamot a `azd` `1.25.6` (2026 június) és a `azure.ai.agents` `0.1.40-preview` kiterjesztés szerint, kibővíti az AI útmutatást a „agent felépítése” fázistól a teljes agent életciklusig (teszt → értékel → optimalizál → ellenőriz → töröl), bemutatja az új `azure.ai.skills` és `azure.ai.connections` előnézeti kiterjesztéseket, és megemlíti a „.NET Aspire” → „Aspire” termék arculatváltást.**

#### Hozzáadva
- **🔁 Teljes agent életciklus lefedettség** a kezdőknek és AI mérnököknek az összes dokumentumban:
  - `docs/chapter-01-foundation/azd-basics.md` — Életciklus tábla (felépít → teszt → mér → fejleszt → ellenőriz → takarít) hozzáadva a Kiterjesztések és AI Parancsok részhez
  - `docs/chapter-08-production/production-ai-practices.md` — Új „Agent Életciklus kezelése” rész, lefedve `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, és `delete --force` témákat
  - `resources/cheat-sheet.md` — Kibővített AI Agent parancsok `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, és `delete --force` hozzáadásával
- **🧩 Új előnézeti kiterjesztések** dokumentáltak: `azure.ai.skills` (újrahasználható agent képességek) és `azure.ai.connections` (Foundry kapcsolatok) hozzáadva a kiterjesztés táblázathoz és a segédlethez
- **⏱️ Válaszidő útmutató** — `azd ai agent invoke` példák most jelzik, hogy összes késleltetést és az első bájt idejét is kiírja
- **📌 Verzió banner** a gyökér README fájlban az `azd version` és `azd upgrade` felé irányítja a tanulókat

#### Módosítva
- **✅ A validációs alapvonal frissítve** `azd 1.23.12`-ról (2026 március) `azd 1.25.6`-re (2026 június) minden fejezet README-jében és a workshop dokumentációkban
- **🤖 2. fejezet kiegészítő jegyzet** frissítve `azure.ai.agents` `0.1.18-preview`-ról `0.1.40-preview`-re
- **🧪 Workshop validációs példa** (`azd version` kimenet) frissítve `1.25.6`-re
- **🧭 README "Mi újság ma az azd-ben"** felfrissítve, kiemelve az ügynök életciklusának teljes lefedettségét, az új AI kiterjesztéseket és a legutóbbi életminőség javításokat (`azd init` idempotencia, `azd auth login` elavult token törlése, `azd tool` első futtatás visszajelzése)
- **📖 2. fejezet agents.md (4. opció)** most a telepítés utáni életciklus parancsokhoz irányítja a tanulókat `azd up`-nál való megállás helyett

#### Javítva
- **🏷️ Terméknév** — hozzáadva egy Aspire átnevezési megjegyzés (a ".NET Aspire" mostantól egyszerűen "Aspire"); az azd Aspire támogatása változatlan
- **🔎 Élő kiadás validáció** megerősítve az Azure Developer CLI kiadási adatfolyamával: stabil CLI `1.25.6` (2026-06-12) és `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Kezdő bevezetés tisztázása, telepítés validáció és végső AZD parancs takarítás
**Ez a verzió az AZD 1.23 validációs áttanulmányozását követi egy kezdőknek szánt dokumentációs átnézéssel: tisztázza az AZD első hitelesítési irányelveket, helyi telepítés validációs szkripteket ad hozzá, ellenőrzi a kulcsfontosságú parancsokat az élő AZD CLI-vel, és eltávolítja az utolsó elavult angol parancs hivatkozásokat a verziókövetésen kívül.**

#### Hozzáadva
- **🧪 Kezdő telepítés validációs szkriptek** `validate-setup.ps1` és `validate-setup.sh` segítségével, hogy a tanulók a 1. fejezet megkezdése előtt ellenőrizhessék a szükséges eszközöket
- **✅ Kezdeti telepítés validációs lépések** a gyökér README-ben és az 1. fejezet README-ben, hogy a hiányzó előfeltételek elcsíphetők legyenek `azd up` előtt

#### Megváltoztatva
- **🔐 Kezdő hitelesítési útmutatás** most következetesen kezeli `azd auth login`-t mint az elsődleges utat az AZD munkafolyamatokhoz, `az login` opcionálisként jelölve, kivéve ha közvetlenül Azure CLI parancsokat használnak
- **📚 1. fejezet bevezető folyamata** most arra irányítja a tanulókat, hogy telepítés, hitelesítés és első telepítés előtt validálják a helyi környezetüket
- **🛠️ Validátor üzenetek** most világosan elkülönítik a blokkoló követelményeket az opcionális Azure CLI figyelmeztetésektől az egyedüli AZD kezdő útvonal esetén
- **📖 Konfigurációs, hibakeresési és példa dokumentációk** most különbséget tesznek a szükséges AZD hitelesítés és az opcionális Azure CLI bejelentkezés között, ahol eddig mindkettő kontextus nélkül volt bemutatva

#### Javítva
- **📋 Fennmaradó angol parancs hivatkozások** frissítve az aktuális AZD formákra, beleértve `azd config show` a gyorsreferencia táblázatban és `azd monitor --overview` ott, ahol az Azure Portál áttekintő útmutató volt cél
- **🧭 Kezdő állítások az 1. fejezetben** enyhítve, hogy elkerüljék a garantált hibamentes vagy visszagörgetéses viselkedés túlígérkezését minden sablonra és Azure erőforrásra vonatkozóan
- **🔎 Élő CLI validáció** megerősítette a jelenlegi támogatást `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, és `azd down --force --purge` terén

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
**Ez a verzió dokumentáció-validációs átnézést végez `azd` `1.23.12` ellen, frissíti a régi AZD parancs példákat, frissíti az AI modell útmutatót az aktuális alapértelmezettre, és a workshop útmutatásokat bővíti a GitHub Codespaces-en túl dev container-ekre és helyi klónokra is.**

#### Hozzáadva
- **✅ Validációs megjegyzések az alapvető fejezeteken és workshop dokumentumokon** hogy a tesztelt AZD alapvonal egyértelmű legyen a régebbi vagy újabb CLI verziókat használóknak
- **⏱️ Telepítés időkorlát iránymutatás** hosszú futású AI alkalmazás telepítésekhez `azd deploy --timeout 1800` használatával
- **🔎 Kiterjesztés ellenőrzési lépések** az AI munkafolyamat dokumentációkban `azd extension show azure.ai.agents` használatával
- **🌐 Szélesebb workshop környezeti iránymutatások** a GitHub Codespaces, dev container-ek, és helyi klónok lefedésére MkDocs használatával

#### Megváltoztatva
- **📚 Fejezet bevezető README-k** most következetesen megjegyzik a validációt `azd 1.23.12` ellen az alap, konfigurációs, infrastruktúra, több-ügynök, telepítés előtti, hibakeresési és termelési szekciókban
- **🛠️ AZD parancs hivatkozások** frissítve az aktuális formákra a dokumentációkban:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` vagy `azd env get-value(s)` a kontextustól függően
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` ahol az Application Insights áttekintés a cél
- **🧪 Telepítés előnézeti példák** egyszerűsítve az aktuálisan támogatott használatra mint `azd provision --preview` és `azd provision --preview -e production`
- **🧭 Workshop folyamat** frissítve, hogy a tanulók elvégezhessék a labokat Codespaces-ben, dev containerben vagy helyi klónban, nemcsak Codespaces környezetben
- **🔐 Hitelesítési útmutatás** most előnyben részesíti `azd auth login`-t az AZD munkafolyamatokhoz, `az login` opcionálisként, ha közvetlenül Azure CLI parancsokat használnak

#### Javítva
- **🪟 Windows telepítő parancsok** normalizálva az aktuális `winget` csomagnév helyesíráshoz a telepítési útmutatóban
- **🐧 Linux telepítési útmutató** javítva, hogy elkerülje a nem támogatott disztribúció specifikus `azd` csomagkezelő parancsokat, helyette a kiadási csomagokra hivatkozzon megfelelő esetekben
- **📦 AI modell példák** felfrissítve régi alapértelmezettekről mint `gpt-35-turbo` és `text-embedding-ada-002` aktuális példákra mint `gpt-4.1-mini`, `gpt-4.1`, és `text-embedding-3-large`
- **📋 Telepítés és diagnosztika kódrészletek** korrigálva az aktuális környezeti és állapot parancsok használatával naplókban, szkriptekben és hibakeresési lépésekben
- **⚙️ GitHub Actions útmutatás** frissítve `Azure/setup-azd@v1.0.0`-ról `Azure/setup-azd@v2`-re
- **🤖 MCP/Copilot beleegyezés útmutatás** frissítve `azd mcp consent`-ról `azd copilot consent list`-re

#### Fejlesztve
- **🧠 AI fejezet útmutatás** most jobban magyarázza az előnézetre érzékeny `azd ai` viselkedést, bérlő-specifikus bejelentkezést, aktuális kiterjesztés használatot, és frissített modell telepítési ajánlásokat
- **🧪 Workshop utasítások** most valósághűbb verzió példákat és tisztább környezet beállítási nyelvezetet használnak a gyakorlati labokhoz
- **📈 Termelési és hibakeresési dokumentumok** most jobban igazodnak az aktuális megfigyelési, tartalék modell és költség szint példákhoz

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

#### AZD AI CLI parancsok, tartalom validáció és sablon bővítés
**Ez a verzió hozzáadja az `azd ai`, `azd extension` és `azd mcp` parancsok lefedettségét az összes AI-val kapcsolatos fejezetben, javítja a törött hivatkozásokat és elavult kódot az agents.md-ben, frissíti a csalólapot, valamint átdolgozza a Példa sablonok szakaszt érvényesített leírásokkal és új Azure AI AZD sablonokkal.**

#### Hozzáadva
- **🤖 AZD AI CLI lefedettség** 7 fájlban (korábban csak a 8. fejezetben):
  - `docs/chapter-01-foundation/azd-basics.md` — Új „Extensions and AI Commands” szakasz, amely bemutatja az `azd extension`, `azd ai agent init` és `azd mcp` parancsokat
  - `docs/chapter-02-ai-development/agents.md` — 4. opció: `azd ai agent init` összehasonlító táblázattal (sablon vs manifest megközelítés)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — „AZD Extensions for Foundry” és „Agent-First Deployment” alfejezetek
  - `docs/chapter-05-multi-agent/README.md` — Gyors kezdés immár megmutatja mind a sablon, mind a manifest alapú telepítési útvonalakat
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — A Telepítés szakasz most tartalmazza az `azd ai agent init` opciót
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — „AZD AI Extension Commands for Diagnostics” alfejezet
  - `resources/cheat-sheet.md` — Új „AI & Extensions Commands” szakasz az `azd extension`, `azd ai agent init`, `azd mcp` és `azd infra generate` parancsokkal
- **📦 Új AZD AI példa sablonok** a `microsoft-foundry-integration.md`-ban:
  - **azure-search-openai-demo-csharp** — .NET RAG chat Blazor WebAssembly-vel, Semantic Kernel-lel és hang alapú csevegés támogatással
  - **azure-search-openai-demo-java** — Java RAG chat Langchain4J-vel ACA/AKS telepítési lehetőségekkel
  - **contoso-creative-writer** — Többügynökös kreatív íróalkalmazás Azure AI Agent Service-szel, Bing Grounding-gel és Prompty-val
  - **serverless-chat-langchainjs** — Serverless RAG Azure Functions + LangChain.js + Cosmos DB-vel, Ollama helyi fejlesztői támogatással
  - **chat-with-your-data-solution-accelerator** — Vállalati RAG gyorsító admin portállal, Teams integrációval és PostgreSQL/Cosmos DB opciókkal
  - **azure-ai-travel-agents** — Többügynökös MCP orchestrációs referenciaalkalmazás szerverekkel .NET-ben, Pythonban, Javaban és TypeScriptben
  - **azd-ai-starter** — Minimális Azure AI infrastruktúra Bicep kezdősablon
  - **🔗 Awesome AZD AI Gallery link** — Hivatkozás az [awesome-azd AI galériára](https://azure.github.io/awesome-azd/?tags=ai) (80+ sablon)

#### Javítva
- **🔗 agents.md navigáció**: a Előző/Következő hivatkozások most már megfelelnek a 2. fejezet README leckeszámának (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md törött linkek**: az `production-ai-practices.md` javítva `../chapter-08-production/production-ai-practices.md`-re (3 előfordulás)
- **📦 agents.md elavult kód**: Az `opencensus` lecserélve `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md érvénytelen API**: Az `max_tokens` áthelyezve `create_agent()`-ból `create_run()`-ba, mint `max_completion_tokens`
- **🔢 agents.md token számlálás**: Az durva `len//4` becslés lecserélve `tiktoken.encoding_for_model()`-re
- **azure-search-openai-demo**: A szolgáltatások kijavítva „Cognitive Search + App Service”-ről „Azure AI Search + Azure Container Apps”-ra (alapértelmezett host 2024 októberétől változott)
- **contoso-chat**: A leírás frissítve, utalva az Azure AI Foundry + Prompty-ra, illeszkedve a repo tényleges címéhez és technológiai stackjéhez

#### Eltávolítva
- **ai-document-processing**: Funkció nélküli sablon hivatkozás eltávolítva (a repo nem nyilvánosan elérhető AZD sablonként)

#### Fejlesztve
- **📝 agents.md gyakorlatok**: Az 1. gyakorlat most már mutatja az elvárt kimenetet és az `azd monitor` lépést; a 2. gyakorlat teljes `FunctionTool` regisztrációs kódot tartalmaz; a 3. gyakorlat homályos útmutatásokat konkrét `prepdocs.py` parancsokra cserél
- **📚 agents.md erőforrások**: Dokumentációs hivatkozások frissítve a jelenlegi Azure AI Agent Service dokumentáció és gyorsindítás szerint
- **📋 agents.md Következő lépések táblázat**: AI Workshop Lab hivatkozás hozzáadva a teljes fejezeti lefedettséghez

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
**Ez a verzió javítja a README.md fejezeti navigációját egy továbbfejlesztett táblázatos formátummal.**

#### Módosítva
- **Tanfolyam térkép táblázat**: Közvetlen leckehivatkozásokkal, időtartam becslésekkel és összetettségi értékelésekkel bővítve
- **Mappa tisztítás**: Felesleges régi mappák eltávolítva (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Hivatkozás érvényesítés**: Az összes 21+ belső hivatkozás a Tanfolyam térkép táblázatban ellenőrizve

### [v3.16.0] - 2026-02-05

#### Termék neveinek frissítése
**Ez a verzió frissíti a termékhivatkozásokat a Microsoft aktuális márkajelzésének megfelelően.**

#### Módosítva
- **Microsoft Foundry → Microsoft Foundry**: Minden hivatkozás frissítve a nem fordítandó fájlokban
- **Azure AI Agent Service → Foundry Agents**: Szerviz név frissítve az aktuális márkajelzés szerint

#### Frissített fájlok
- `README.md` - Fő tanfolyam kezdőoldal
- `changelog.md` - Verziótörténet
- `course-outline.md` - Tanfolyam struktúra
- `docs/chapter-02-ai-development/agents.md` - AI ügynökök útmutatója
- `examples/README.md` - Példák dokumentációja
- `workshop/README.md` - Workshop kezdőoldal
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - Minden workshop oktatófájl

---

### [v3.15.0] - 2026-02-05

#### Jelentős tároló átszervezés: Fejezetszám szerinti mappanevek
**Ez a verzió az átláthatóbb navigáció érdekében dedikált fejezetszám szerinti mappákba szervezi a dokumentációt.**

#### Mappa átnevezések
Régi mappák helyett fejezetszám szerinti mappák léptek életbe:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Újonnan hozzáadva: `docs/chapter-05-multi-agent/`

#### Fájlmigrációk
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
| Minden pre-deployment fájl | pre-deployment/ | chapter-06-pre-deployment/ |
| Minden troubleshooting fájl | troubleshooting/ | chapter-07-troubleshooting/ |

#### Hozzáadva
- **📚 Fejezeti README fájlok**: README.md létrehozása minden fejezeti mappában az alábbiakkal:
  - Tanulási célok és időtartam
  - Leckétáblázat leírásokkal
  - Gyorsindítási parancsok
  - Navigáció más fejezetekhez

#### Módosítva
- **🔗 Az összes belső hivatkozás frissítve**: 78+ útvonal módosult az összes dokumentációs fájlban
- **🗺️ Fő README.md**: A Tanfolyam térkép frissítve az új fejezetszerkezettel
- **📝 examples/README.md**: Frissített kereszthivatkozások a fejezeti mappákhoz

#### Eltávolítva
- Régi mappastruktúra (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Tárolószerkezet átszervezése: Fejezeti navigáció
**Ez a verzió hozzáadta a fejezeti navigációt segítő README fájlokat (a v3.15.0 verzió váltotta fel).**

---

### [v3.13.0] - 2026-02-05

#### Új AI ügynökök útmutató
**Ez a verzió átfogó útmutatót ad az AI ügynökök telepítéséhez az Azure Developer CLI használatával.**

#### Hozzáadva
- **🤖 docs/microsoft-foundry/agents.md**: Teljes körű útmutató:
  - Mi az az AI ügynök és hogyan különböznek a chatbotoktól
  - Három gyorsindítási ügynöksablon (Foundry Agents, Prompty, RAG)
  - Ügynök architektúra minták (egy ügynök, RAG, több ügynök)
  - Eszköz konfiguráció és testreszabás
  - Megfigyelés és metrikák követése
  - Költségszempontok és optimalizálás
  - Gyakori hibakeresési szcenáriók
  - Három gyakorlati feladat siker kritériumokkal

#### Tartalmi felépítés
- **Bevezető**: Ügynök fogalmak kezdőknek
- **Gyors kezdés**: Ügynökök telepítése `azd init --template get-started-with-ai-agents`-fel
- **Architektúra minták**: Ügynök minták vizuális ábrázolása
- **Konfiguráció**: Eszköz beállítás és környezeti változók
- **Megfigyelés**: Application Insights integráció
- **Gyakorlatok**: Fokozatos gyakorlati tanulás (20-45 percenként)

---

### [v3.12.0] - 2026-02-05

#### DevContainer környezet frissítés
**Ez a verzió frissíti a fejlesztői tároló konfigurációját modern eszközökkel és jobb alapértelmezett beállításokkal az AZD tanulási élményhez.**

#### Módosítva
- **🐳 Alapkép**: Frissítve `python:3.12-bullseye`-ről `python:3.12-bookworm`-re (legfrissebb Debian stabil)
- **📛 Konténer neve**: Átnevezve a „Python 3”-ról „AZD for Beginners”-re az átláthatóságért

#### Hozzáadva
- **🔧 Új devcontainer funkciók**:
  - `azure-cli` engedélyezett Bicep támogatással
  - `node:20` (LTS verzió az AZD sablonokhoz)
  - `github-cli` a sablonkezeléshez
  - `docker-in-docker` a konténeralkalmazás telepítésekhez

- **🔌 Port továbbítás**: Előkonfigurált portok a gyakori fejlesztési igényekhez:
  - 8000 (MkDocs előnézet)
  - 3000 (Webalkalmazások)
  - 5000 (Python Flask)
  - 8080 (API-k)

- **🧩 Új VS Code kiterjesztések**:
  - `ms-python.vscode-pylance` - Fejlesztett Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions támogatás
  - `ms-azuretools.vscode-docker` - Docker támogatás
  - `ms-azuretools.vscode-bicep` - Bicep nyelvi támogatás
  - `ms-azure-devtools.azure-resource-groups` - Azure erőforrás kezelés
  - `yzhang.markdown-all-in-one` - Markdown szerkesztés
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagram támogatás
  - `redhat.vscode-yaml` - YAML támogatás (azure.yaml-hoz)
  - `eamodio.gitlens` - Git vizualizáció
  - `mhutchie.git-graph` - Git történelem

- **⚙️ VS Code beállítások**: Alapértelmezett beállítások hozzáadva a Python értelmezőhöz, automatikus formázás mentéskor és whitespace levágás

- **📦 Frissített requirements-dev.txt**:
  - Hozzáadva MkDocs minify plugin
  - Hozzáadva pre-commit a kódminőséghez
  - Hozzáadva Azure SDK csomagok (azure-identity, azure-mgmt-resource)

#### Javítva
- **Post-Create parancs**: Most ellenőrzi az AZD és Azure CLI telepítését konténer indításkor

---

### [v3.11.0] - 2026-02-05

#### Kezdők számára barátságos README átdolgozás
**Ez a verzió jelentősen javítja a README.md fájlt, hogy könnyebben érthető legyen kezdők számára, és alapvető erőforrásokat ad az AI fejlesztőknek.**

#### Hozzáadva
- **🆚 Azure CLI és AZD összehasonlítás**: Egyértelmű magyarázat, mikor melyik eszközt használjuk gyakorlati példákkal
- **🌟 Awesome AZD linkek**: Közvetlen hivatkozások a közösségi sablongalériára és hozzájárulási erőforrásokra:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ készen álló telepítésre kész sablon
  - [Sablon beküldése](https://github.com/Azure/awesome-azd/issues) - Közösségi hozzájárulás
- **🎯 Gyors kezdési útmutató**: Egyszerűsített 3 lépéses kezdés (Telepítés → Bejelentkezés → Telepítés)
- **📊 Tapasztalati alapú navigációs táblázat**: Világos útmutatás, honnan kezdjen a fejlesztő a tapasztalati szintje alapján

#### Módosítva
- **README szerkezet**: Átszervezve a fokozatos felfedés érdekében - a legfontosabb információk először
- **Bevezető szakasz**: Újraírásra került, hogy elmagyarázza „Az `azd up` varázsát” teljesen kezdőknek
- **Ismétlődő tartalom eltávolítása**: Eltávolítva a duplikált hibakeresési szakasz
- **Hibaelhárító parancsok**: Javított `azd logs` hivatkozás, hogy érvényes `azd monitor --logs`-t használjon

#### Javítva
- **🔐 Hitelesítési parancsok**: Hozzáadva `azd auth login` és `azd auth logout` a cheat-sheet.md-hez
- **Érvénytelen parancs hivatkozások**: Eltávolítva a fennmaradó `azd logs` a README hibaelhárítási szekcióból

#### Megjegyzések
- **Hatókör**: Változtatások alkalmazva a fő README.md és resources/cheat-sheet.md fájlokon
- **Célközönség**: Javítások kifejezetten az AZD-vel ismerkedő fejlesztők számára

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI parancs pontossági frissítés
**Ez a kiadás kijavítja a nem létező AZD parancsokat az egész dokumentációban, biztosítva, hogy minden kódpélda érvényes Azure Developer CLI szintaxist használjon.**

#### Javítva
- **🔧 Nem létező AZD parancsok eltávolítva**: Átfogó audit és javítás érvénytelen parancsokból:
  - `azd logs` (nem létezik) → cserélve `azd monitor --logs`-re vagy Azure CLI alternatívákra
  - `azd service` alparancsok (nem léteznek) → cserélve `azd show`-ra és Azure CLI-re
  - `azd infra import/export/validate` (nem léteznek) → eltávolítva vagy érvényes alternatívával helyettesítve
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` zászlók (nem léteznek) → eltávolítva
  - `azd provision --what-if/--rollback` zászlók (nem léteznek) → frissítve `--preview` használatára
  - `azd config validate` (nem létezik) → cserélve `azd config list`-re
  - `azd info`, `azd history`, `azd metrics` (nem léteznek) → eltávolítva

- **📚 Parancsjavításokkal frissített fájlok**:
  - `resources/cheat-sheet.md`: Jelentős átdolgozás a parancsreferenciában
  - `docs/deployment/deployment-guide.md`: Javított visszagörgetési és telepítési stratégiák
  - `docs/troubleshooting/debugging.md`: Kijavított naplóelemző szekciók
  - `docs/troubleshooting/common-issues.md`: Frissített hibaelhárító parancsok
  - `docs/troubleshooting/ai-troubleshooting.md`: Javított AZD hibakeresési rész
  - `docs/getting-started/azd-basics.md`: Kijavított monitorozási parancsok
  - `docs/getting-started/first-project.md`: Frissített monitorozási és hibakeresési példák
  - `docs/getting-started/installation.md`: Javított segítség és verzió példák
  - `docs/pre-deployment/application-insights.md`: Kijavított naplómegtekintési parancsok
  - `docs/pre-deployment/coordination-patterns.md`: Javított ügynök hibakereső parancsok

- **📝 Verzióhivatkozás frissítve**: 
  - `docs/getting-started/installation.md`: A keménykódolt `1.5.0` verziót generikus `1.x.x`-ra cseréltük, linkkel a kiadásokhoz

#### Megváltozott
- **Rollback stratégiák**: Dokumentáció frissítve Git-alapú rollback használatára (AZD nem támogatja natív rollback funkciót)
- **Naplómegtekintés**: `azd logs` hivatkozások lecserélve `azd monitor --logs`, `azd monitor --live` és Azure CLI parancsokra
- **Teljesítmény szekció**: Eltávolítva nem létező párhuzamos/incrementális telepítési zászlók, helyettesítve érvényes alternatívákkal

#### Műszaki részletek
- **Érvényes AZD parancsok**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Érvényes azd monitor zászlók**: `--live`, `--logs`, `--overview`
- **Eltávolított funkciók**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Megjegyzések
- **Ellenőrzés**: Parancsok validálva Azure Developer CLI v1.23.x verzióval

---

### [v3.9.0] - 2026-02-05

#### Műhely befejezése és dokumentáció minőségi frissítése
**Ez a verzió befejezi az interaktív műhely modulokat, javítja a törött dokumentációs linkeket, és növeli az általános tartalom minőségét a Microsoft AZD-t használó MI fejlesztők számára.**

#### Hozzáadva
- **📝 CONTRIBUTING.md**: Új hozzájárulási útmutató dokumentum tartalommal:
  - Egyértelmű utasítások hibák bejelentéséhez és módosítások javaslatához
  - Dokumentációs szabványok új tartalomra
  - Kódpéldák iránymutatásai és commit üzenet konvenciók
  - Közösségi részvétel információk

#### Befejezve
- **🎯 Műhely modul 7 (Összefoglalás)**: Teljesen befejezett összefoglaló modul:
  - Átfogó összefoglaló a műhely eredményeiről
  - Fontos fogalmak magyarázata az AZD-ről, sablonokról és Microsoft Foundry-ról
  - Tanulási út folytatási ajánlások
  - Műhely kihívás gyakorlatok nehézségi besorolással
  - Közösségi visszajelzések és támogatási linkek

- **📚 Műhely modul 3 (Szétszedés)**: Frissített tanulási célok:
  - GitHub Copilot aktiválás MCP szerverekkel
  - AZD sablon mappa szerkezeti megértése
  - Infrastructure-as-code (Bicep) szervezési minták
  - Gyakorlati lab instrukciók

- **🔧 Műhely modul 6 (Lebontás)**: Befejezve:
  - Erőforrás takarítás és költségmenedzsment célok
  - `azd down` használata biztonságos infrastruktúra felszámoláshoz
  - Puha törlésű kognitív szolgáltatások helyreállítási útmutató
  - Bónusz felfedező feladatok GitHub Copilot és Azure Portal használatával

#### Javítva
- **🔗 Törött linkek javítása**: Több mint 15 törött belső dokumentációs link javítva:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md útvonalak javítva
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md és production-ai-practices.md útvonalak javítva
  - `docs/getting-started/first-project.md`: Nem létező cicd-integration.md helyett deployment-guide.md
  - `examples/retail-scenario.md`: FAQ és hibaelhárítási útmutató útvonalak javítva
  - `examples/container-app/microservices/README.md`: Tanfolyam főoldal és deployment guide útvonalak javítva
  - `resources/faq.md` és `resources/glossary.md`: AI fejezet hivatkozások frissítve
  - `course-outline.md`: Oktatói útmutató és AI műhely lab hivatkozások javítva

- **📅 Műhely állapot banner**: Frissítve "Építés alatt" helyett aktív műhely státuszra, dátum: 2026 február

- **🔗 Műhely navigáció**: Javított törött navigációs linkek a műhely README.md-ben, amelyek nem létező lab-1-azd-basics mappára mutattak

#### Megváltozott
- **Műhely bemutató**: Eltávolítva az "építés alatt" figyelmeztetés, a műhely most már kész és használatra kész
- **Navigációs konzisztencia**: Biztosítva, hogy minden műhely modul megfelelő modulközi navigációval rendelkezzen
- **Tanulási útvonal hivatkozások**: Frissítve a fejezet áthivatkozások a helyes microsoft-foundry útvonalak használatára

#### Ellenőrizve
- ✅ Minden angol markdown fájl érvényes belső linkekkel rendelkezik
- ✅ A 0-7 műhely modulok teljesek a tanulási célokkal
- ✅ A fejezetek és modulok közötti navigáció megfelelően működik
- ✅ Tartalom alkalmas Microsoft AZD-t használó AI fejlesztők számára
- ✅ Kezdők számára is barátságos nyelvezet és struktúra
- ✅ A CONTRIBUTING.md egyértelmű útmutatást nyújt a közösségi hozzájárulóknak

#### Műszaki megvalósítás
- **Link ellenőrzés**: Automatizált PowerShell szkript ellenőrizte az összes .md belső linket
- **Tartalom átvizsgálás**: Kézi áttekintés a műhely teljességére és kezdőbarátságára
- **Navigációs rendszer**: Konzisztens fejezet és modul navigációs minták alkalmazva

#### Megjegyzések
- **Hatókör**: Változtatások kizárólag az angol dokumentációban
- **Fordítások**: Fordítási mappák ebben a verzióban nem frissültek (automatikus fordítás később szinkronizálva lesz)
- **Műhely időtartam**: Mostantól a teljes műhely 3-4 órányi gyakorlatot biztosít

---

### [v3.8.0] - 2025-11-19

#### Haladó dokumentáció: Monitorozás, biztonság és több ügynökös minták
**Ez a verzió átfogó A kategóriás leckéket ad az Application Insights integrációról, hitelesítési mintákról és több ügynök kooperációról produkciós telepítésekhez.**

#### Hozzáadva
- **📊 Application Insights integrációs lecke**: a `docs/pre-deployment/application-insights.md`-ban:
  - AZD-központú telepítés automatikus előkészítéssel
  - Teljes Bicep sablonok az Application Insights + Log Analytics számára
  - Működő Python alkalmazások egyedi telemetriával (1,200+ sor)
  - AI/LLM monitorozási minták (Microsoft Foundry Modellek token/költség nyomon követése)
  - 6 Mermaid diagram (architektúra, elosztott lekövetés, telemetria folyamat)
  - 3 gyakorlati feladat (riasztások, irányítópultok, AI monitorozás)
  - Kusto lekérdezés példák és költségoptimalizációs stratégiák
  - Élő mérőszám streaming és valós idejű hibakeresés
  - 40-50 perces tanulási idő, produkcióra kész mintákkal

- **🔐 Hitelesítési és biztonsági minták leckéje**: a `docs/getting-started/authsecurity.md`-ben:
  - 3 hitelesítési minta (kapcsolati stringek, Key Vault, kezelt azonosító)
  - Teljes Bicep infrastruktúra-sablonok biztonságos telepítéshez
  - Node.js alkalmazás-kód Azure SDK integrációval
  - 3 teljes gyakorlat (kezelt azonosító engedélyezése, felhasználó hozzárendelt azonosító, Key Vault forgatás)
  - Biztonsági legjobb gyakorlatok és RBAC konfigurációk
  - Hibaelhárítási útmutató és költségelemzés
  - Produkcióra kész jelszó nélküli hitelesítési minták

- **🤖 Több ügynök együttműködési minták leckéje**: a `docs/pre-deployment/coordination-patterns.md`-ban:
  - 5 koordinációs minta (sorozatos, párhuzamos, hierarchikus, eseményvezérelt, konszenzus)
  - Teljes orchestrátor szolgáltatás implementáció (Python/Flask, 1,500+ sor)
  - 3 specializált ügynök implementáció (Kutató, Író, Szerkesztő)
  - Service Bus integráció üzenetsorozáshoz
  - Cosmos DB állapotkezelés elosztott rendszerekhez
  - 6 Mermaid diagram az ügynök interakciókról
  - 3 haladó gyakorlat (timeout kezelés, újrapróbálkozási logika, áramkör megszakító)
  - Költség lebontás (240-565 $/hónap) optimalizációs stratégiákkal
  - Application Insights integráció monitorozáshoz

#### Fejlesztve
- **Telepítés előtti fejezet**: Most átfogó monitorozási és koordinációs mintákat tartalmaz
- **Kezdő lépések fejezet**: Fejlesztve professzionális hitelesítési mintákkal
- **Produckiós érettség**: Teljes lefedettség biztonságtól megfigyelhetőségig
- **Kurzus vázlat**: Frissítve az új leckék hivatkozására a 3. és 6. fejezetben

#### Megváltozott
- **Tanulási folyamat**: Jobb integráció a biztonság és monitorozás terén a kurzus során
- **Dokumentáció minőség**: Következetes A kategóriás színvonal (95-97%) az új leckéknél
- **Termelési minták**: Teljes körű lefedettség vállalati telepítésekhez

#### Javítva
- **Fejlesztői élmény**: Egyértelmű út a fejlesztéstől a termelési monitorozásig
- **Biztonsági szabványok**: Professzionális hitelesítési és titokkezelési minták
- **Megfigyelhetőség**: Teljes Application Insights integráció AZD-vel
- **AI munkaterhelések**: Speciális monitorozás Microsoft Foundry Modelleknek és több ügynökös rendszereknek

#### Ellenőrizve
- ✅ Minden lecke teljes működő kódot tartalmaz (nem csak részleteket)
- ✅ Mermaid diagramok a vizuális tanuláshoz (összesen 19 három leckében)
- ✅ Gyakorlati feladatok ellenőrzési lépésekkel (összesen 9)
- ✅ Produkcióra kész Bicep sablonok telepíthetők `azd up` használatával
- ✅ Költségelemzés és optimalizációs stratégiák
- ✅ Hibaelhárítási útmutatók és legjobb gyakorlatok
- ✅ Tudásellenőrző pontok parancsokkal

#### Dokumentáció értékelési eredmények
- **docs/pre-deployment/application-insights.md**: - Átfogó monitorozási útmutató
- **docs/getting-started/authsecurity.md**: - Professzionális biztonsági minták
- **docs/pre-deployment/coordination-patterns.md**: - Haladó több ügynök architektúrák
- **Összesen új tartalom**: - Következetes magas minőségi színvonal

#### Műszaki megvalósítás
- **Application Insights**: Log Analytics + egyedi telemetria + elosztott lekövetés
- **Hitelesítés**: Kezelt azonosító + Key Vault + RBAC minták
- **Több ügynök**: Service Bus + Cosmos DB + Container Apps + orchestráció
- **Monitorozás**: Élő metríkák + Kusto lekérdezések + riasztások + irányítópultok
- **Költségmenedzsment**: Mintavételi stratégiák, adatmegőrzési szabályok, költségkeret szabályozás

### [v3.7.0] - 2025-11-19

#### Dokumentáció minőségjavítások és új Microsoft Foundry Models példa
**Ez a verzió javítja a dokumentáció minőségét az egész tárolóban, és hozzáad egy teljes Microsoft Foundry Models telepítési példát gpt-4.1 csevegőfelülettel.**

#### Hozzáadva
- **🤖 Microsoft Foundry Models csevegő példa**: Teljes gpt-4.1 telepítés működő implementációval a `examples/azure-openai-chat/`-ban:
  - Teljes Microsoft Foundry Models infrastruktúra (gpt-4.1 modell telepítés)
  - Python parancssoros csevegőfelület beszélgetési előzményekkel
  - Key Vault integráció biztonságos API kulcs tároláshoz
  - Token használat követése és költségbecslés
  - Korlátozás és hibakezelés
  - Átfogó README 35-45 perces telepítési útmutatóval
  - 11 produkcióra kész fájl (Bicep sablonok, Python alkalmazás, konfiguráció)
- **📚 Dokumentációs gyakorlatok**: Hozzáadva gyakorlati feladatok a konfigurációs útmutatóhoz:
  - 1. gyakorlat: Több környezet konfiguráció (15 perc)
  - 2. gyakorlat: Titokkezelési gyakorlat (10 perc)
  - Egyértelmű sikerkritériumok és ellenőrzési lépések
- **✅ Telepítés ellenőrzése**: Hozzáadva ellenőrzési rész a telepítési útmutatóhoz:
  - Állapotellenőrzési eljárások
  - Sikerkritérium lista
  - Minden telepítési parancs várható kimenetei
  - Gyors hibaelhárítási referencia

#### Fejlesztve
- **examples/README.md**: Frissítve A kategóriás minőségre (93%):
  - Hozzáadva azure-openai-chat az összes releváns szekcióhoz
  - Egyedi példák száma 3-ról 4-re növelve
  - Hozzáadva az AI Alkalmazás példák táblázatához
  - Beillesztve az Intermedier felhasználóknak szóló Gyors indulásba
  - Beillesztve a Microsoft Foundry Sablonok szekcióba
  - Frissítve az Összehasonlító mátrix és technológiai keresések szekciók
- **Dokumentáció minősége**: Javított B+ (87%) → A- (92%) a docs mappában:
  - Várt kimenetek hozzáadva kritikus parancs példákhoz
  - Ellenőrzési lépések beillesztve konfigurációs változásokhoz
  - Gyakorlati feladatokkal bővített tapasztalati tanulás

#### Megváltozott
- **Tanulási előrehaladás**: Jobb AI példák integrációja középhaladó tanulók számára
- **Dokumentációs struktúra**: Több cselekvőképes gyakorlat egyértelmű eredményekkel
- **Ellenőrzési folyamat**: Nyilvánvaló sikerfeltételek hozzáadva kulcsfontosságú munkafolyamatokhoz

#### Fejlesztett
- **Fejlesztői élmény**: Microsoft Foundry Models telepítése most 35-45 perc (összetett alternatívákhoz képest 60-90)
- **Költség átláthatóság**: Egyértelmű költségbecslés ($50-200/hónap) a Microsoft Foundry Models példához
- **Tanulási út**: AI fejlesztők számára világos belépési pont az azure-openai-chat segítségével
- **Dokumentációs szabványok**: Következetes várt kimenetek és ellenőrzési lépések

#### Ellenőrzött
- ✅ Microsoft Foundry Models példa teljesen működőképes `azd up`-val
- ✅ Mind a 11 megvalósítási fájl szintaktikailag helyes
- ✅ README utasítások megfelelnek a tényleges telepítési tapasztalnak
- ✅ Dokumentáció linkek frissítve több mint 8 helyen
- ✅ Példa index pontosan tükrözi a 4 helyi példát
- ✅ Nincsenek duplikált külső linkek a táblázatokban
- ✅ Minden navigációs hivatkozás helyes

#### Technikai megvalósítás
- **Microsoft Foundry Models architektúra**: gpt-4.1 + Key Vault + Container Apps minta
- **Biztonság**: Managed Identity használatra kész, titkok Key Vault-ban
- **Monitorozás**: Application Insights integráció
- **Költségkezelés**: Token követés és használat optimalizálása
- **Telepítés**: Egyetlen `azd up` parancs a teljes beállításhoz

### [v3.6.0] - 2025-11-19

#### Nagy frissítés: Container App telepítési példák
**Ez a verzió átfogó, éles használatra kész konténeralkalmazás telepítési példákat mutat be Azure Developer CLI (AZD) használatával, teljes dokumentációval és a tanulási útba történő integrációval.**

#### Hozzáadva
- **🚀 Container App példák**: Új helyi példák a `examples/container-app/`-ban:
  - [Master Guide](examples/container-app/README.md): Teljes áttekintés konténerizált telepítésekről, gyors indítás, éles környezet és fejlett minták
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Kezdőknek szánt REST API skálázáshoz nulláig, egészségvizsgálatokkal, monitorozással és hibakereséssel
  - [Microservices Architecture](../../examples/container-app/microservices): Éles kész többszolgáltatásos telepítés (API Gateway, Product, Order, User, Notification), aszinkron üzenetküldés, Service Bus, Cosmos DB, Azure SQL, elosztott lekövetés, blue-green/canary telepítés
- **Legjobb gyakorlatok**: Biztonság, monitorozás, költségoptimalizálás és CI/CD útmutató konténerizált munkaterhelésekhez
- **Kód példák**: Teljes `azure.yaml`, Bicep sablonok és többnyelvű szolgáltatásmegvalósítások (Python, Node.js, C#, Go)
- **Tesztelés és hibakeresés**: Végpontokat lefedő teszt forgatókönyvek, monitorozó parancsok, hibakeresési útmutató

#### Megváltozott
- **README.md**: Frissítve, hogy a "Local Examples - Container Applications" alatt új konténer app példákat tartalmazzon és linkeljen
- **examples/README.md**: Frissítve, hogy kiemelje a konténer app példákat, összehasonlító mátrix bejegyzéseket adjon hozzá, és frissítse a technológiai/architektúra hivatkozásokat
- **Tanfolyam vázlat & tanulási útmutató**: Frissítve, hogy hivatkozzon az új konténer app példákra és telepítési mintákra a releváns fejezetekben

#### Ellenőrzött
- ✅ Minden új példa telepíthető `azd up`-val és követi a legjobb gyakorlatokat
- ✅ Dokumentáció keresztlinkek és navigáció frissítve
- ✅ A példák kezdőtől a fejlett forgatókönyvekig fednek le, éles mikroszolgáltatásokkal együtt

#### Megjegyzések
- **Hatókör**: Csak angol dokumentáció és példák
- **Következő lépések**: További fejlett konténer minták és CI/CD automatizálás bővítése a jövőbeli kiadásokban

### [v3.5.0] - 2025-11-19

#### Termék újranyitás: Microsoft Foundry
**Ez a verzió átfogó terméknév váltást hajt végre a "Microsoft Foundry" névről "Microsoft Foundry" névre az összes angol dokumentációban, tükrözve a Microsoft hivatalos márkaváltását.**

#### Megváltozott
- **🔄 Terméknév frissítés**: Teljes újranyitás "Microsoft Foundry" névre
  - Minden hivatkozás frissítve az összes angol dokumentumokban a `docs/` mappában
  - Mappanév átnevezve: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Fájlnév átnevezve: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Összesen: 23 tartalomhivatkozás frissítve 7 dokumentációs fájlban

- **📁 Mappastruktúra változások**:
  - `docs/ai-foundry/` átnevezve `docs/microsoft-foundry/`-ra
  - Minden kereszt-hivatkozás frissítve új mappastruktúra szerint
  - Navigációs linkek ellenőrizve az összes dokumentációban

- **📄 Fájl átnevezések**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Minden belső link frissítve az új fájlnévre

#### Frissített fájlok
- **Fejezet dokumentáció** (7 fájl):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigációs link frissítve
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 termék név hivatkozás frissítve
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Már Microsoft Foundry (korábbi frissítésekből)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 hivatkozás frissítve (áttekintés, közösségi visszajelzés, dokumentáció)
  - `docs/getting-started/azd-basics.md` - 4 kereszt-hivatkozás frissítve
  - `docs/getting-started/first-project.md` - 2 fejezeti navigációs link frissítve
  - `docs/getting-started/installation.md` - 2 következő fejezet link frissítve
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 hivatkozás frissítve (navigáció, Discord közösség)
  - `docs/troubleshooting/common-issues.md` - 1 navigációs link frissítve
  - `docs/troubleshooting/debugging.md` - 1 navigációs link frissítve

- **Tanfolyam struktúra fájlok** (2 fájl):
  - `README.md` - 17 hivatkozás frissítve (tanfolyam áttekintés, fejezet címek, sablon rész, közösségi betekintés)
  - `course-outline.md` - 14 hivatkozás frissítve (áttekintés, tanulási célok, fejezet erőforrások)

#### Ellenőrzött
- ✅ Nulla megmaradt "ai-foundry" mappára utalás az angol doksikban
- ✅ Nulla megmaradt "Microsoft Foundry" terméknévre utalás az angol doksikban
- ✅ Minden navigációs link működik az új mappastruktúrával
- ✅ Fájl- és mappa átnevezések sikeresen befejezve
- ✅ Kereszt-hivatkozások a fejezetek között ellenőrizve

#### Megjegyzések
- **Hatókör**: Változások csak az angol dokumentációra érvényesek a `docs/` mappában
- **Fordítások**: Fordítási mappák (`translations/`) nem frissültek ebben a verzióban
- **Műhely**: Műhely anyagok (`workshop/`) nem frissültek ebben a verzióban
- **Példák**: Példa fájlok még tartalmazhatnak régi névhasználatot (ezt jövőbeli frissítés kezeli)
- **Külső linkek**: Külső URL-ek és GitHub tárház hivatkozások változatlanok maradnak

#### Migrációs útmutató közreműködőknek
Ha helyi ágak vagy dokumentációk hivatkoznak a régi struktúrára:
1. Frissítse a mappahivatkozásokat: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Frissítse a fájl hivatkozásokat: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Cserélje a termék nevet: "Microsoft Foundry" → "Microsoft Foundry"
4. Ellenőrizze, hogy minden belső dokumentációs link működik-e még

---

### [v3.4.0] - 2025-10-24

#### Infrastruktúra előnézet és érvényesítési fejlesztések
**Ez a verzió átfogó támogatást vezet be az új Azure Developer CLI előnézeti funkciójához és javítja a műhely felhasználói élményét.**

#### Hozzáadva
- **🧪 azd provision --preview funkció dokumentáció**: Átfogó lefedettség az új infrastruktúra előnézeti képességhez
  - Parancs referencia és használati példák a cheat sheet-ben
  - Részletes integráció az előkészítési útmutatóban esettanulmányokkal és előnyökkel
  - Pre-flight ellenőrzés integrációja a biztonságosabb telepítés érdekében
  - Kezdő útmutató frissítése a biztonság központú telepítési gyakorlatokkal
- **🚧 Műhely státusz banner**: Professzionális HTML banner a műhely fejlesztési állapotáról
  - Gradiens dizájn építkezési jelekkel a világos felhasználói kommunikációért
  - Utolsó frissítés időbélyeg a transzparenciáért
  - Mobilra reszponzív dizájn minden eszköztípushoz

#### Fejlesztett
- **Infrastruktúra biztonság**: Előnézet funkció integrálva a telepítési dokumentációban
- **Telepítés előtti érvényesítés**: Automatizált szkriptek most előnézeti teszteléssel is kiegészülnek
- **Fejlesztői munkafolyamat**: Frissített parancssorozatok, az előnézet a legjobb gyakorlat része
- **Műhely élmény**: Világos elvárások a tartalom fejlesztési állapotáról a felhasználóknak

#### Megváltozott
- **Telepítési legjobb gyakorlatok**: Az előnézet első munkafolyamat most ajánlott megközelítés
- **Dokumentációs folyamat**: Infrastruktúra érvényesítés a tanulási folyamat korábbi szakaszába került
- **Műhely prezentáció**: Professzionális állapot kommunikáció világos fejlesztési ütemtervvel

#### Fejlesztett
- **Biztonságközpontú megközelítés**: Az infrastruktúra változtatások most már telepítés előtt érvényesíthetőek
- **Csapatmunka**: Az előnézeti eredmények megoszthatóak felülvizsgálat és jóváhagyás céljából
- **Költségtudatosság**: Jobb erőforrásköltség megértés telepítés előtt
- **Kockázatcsökkentés**: Telepítési hibák csökkentése előzetes érvényesítéssel

#### Technikai megvalósítás
- **Több dokumentum integráció**: Előnézet funkció dokumentálva 4 kulcs fájlban
- **Parancs minták**: Következetes szintaxis és példák a dokumentációban
- **Legjobb gyakorlat integráció**: Előnézet beépítve az érvényesítési munkafolyamatokba és szkriptekbe
- **Vizualizációs jelölések**: Világos ÚJ funkció jelölések felfedezhetőséghez

#### Műhely infrastruktúra
- **Állapot kommunikáció**: Professzionális HTML banner gradiens stílusban
- **Felhasználói élmény**: Egyértelmű fejlesztési státusz megelőzi a zavart
- **Professzionális bemutatás**: Megőrzi a tárház hitelességét és egyben elvárásokat állít fel
- **Idővonal transzparencia**: Október 2025 utolsó frissítés időbélyeg felelősségvállalásért

### [v3.3.0] - 2025-09-24

#### Fejlesztett műhely anyagok és interaktív tanulási élmény
**Ez a verzió átfogó műhely anyagokat vezet be böngésző alapú interaktív útmutatókkal és strukturált tanulási utakkal.**

#### Hozzáadva
- **🎥 Interaktív műhely útmutató**: Böngésző alapú műhely élmény MkDocs előnézeti képességgel
- **📝 Strukturált műhely utasítások**: 7 lépéses végig vezető tanulási út az felfedezéstől a testreszabásig
  - 0-Bevezetés: Műhely áttekintés és beállítás
  - 1-AI sablon kiválasztás: Sablon felfedezés és kiválasztási folyamat
  - 2-AI sablon validálás: Telepítési és ellenőrzési eljárások
  - 3-AI sablon szétszerelés: Sablon architektúra megértése
  - 4-AI sablon konfigurálás: Beállítás és testreszabás
  - 5-AI sablon személyre szabás: Fejlett módosítások és iterációk
  - 6-Infrastruktúra bontás: Takarítás és erőforrás menedzsment
  - 7-Összefoglalás: Áttekintés és következő lépések
- **🛠️ Műhely eszközök**: MkDocs konfiguráció Material témával a jobb tanulási élményért
- **🎯 Gyakorlati tanulási út**: 3 lépéses módszertan (Felfedezés → Telepítés → Testreszabás)
- **📱 GitHub Codespaces integráció**: Zökkenőmentes fejlesztői környezet beállítás

#### Fejlesztett
- **AI műhely labor**: Kibővített átfogó, 2-3 órás strukturált tanulási élménnyel
- **Műhely dokumentáció**: Professzionális megjelenés navigációval és vizuális segédletekkel
- **Tanulási előrehaladás**: Világos lépésről lépésre útmutatás a sablon kiválasztástól az éles telepítésig
- **Fejlesztői élmény**: Integrált eszközök az egyszerűsített fejlesztői munkafolyamatokhoz

#### Javított
- **Hozzáférhetőség**: Böngésző alapú felület kereséssel, másolási funkcióval, és téma váltással
- **Önvezető tanulás**: Rugalmas műhely szerkezet a különböző tanulási sebességekhez igazodva
- **Gyakorlati alkalmazás**: Valós AI sablon telepítési forgatókönyvek
- **Közösségi integráció**: Discord integráció a műhely támogatás és együttműködés érdekében

#### Műhely jellemzők
- **Beépített kereső**: Gyors kulcsszó és lecke felfedezés
- **Kód blokkok másolása**: Minden kódpéldánál lebegtetésre megjelenő másolási funkció
- **Téma váltás**: Sötét/fényes mód támogatás különböző preferenciákhoz
- **Vizuális anyagok**: Képernyőképek és diagramok jobb megértéshez
- **Segítség integráció**: Közvetlen Discord elérés a közösségi támogatáshoz

### [v3.2.0] - 2025-09-17

#### Jelentős navigációs átszervezés és fejezet alapú tanulási rendszer
**Ez a verzió átfogó, fejezet alapú tanulási struktúrát vezet be, továbbá fejlett navigációt az egész tárházban.**

#### Hozzáadva
- **📚 Fejezet alapú tanulási rendszer**: Az egész tanfolyam átalakítva 8 progresszív tanulási fejezetre
  - 1. fejezet: Alapok & Gyors indítás (⭐ - 30-45 perc)
  - 2. fejezet: AI-első fejlesztés (⭐⭐ - 1-2 óra)
  - 3. fejezet: Konfiguráció & hitelesítés (⭐⭐ - 45-60 perc)
  - 4. fejezet: Infrastruktúra mint kód & telepítés (⭐⭐⭐ - 1-1,5 óra)
  - 5. fejezet: Több ügynökös AI megoldások (⭐⭐⭐⭐ - 2-3 óra)
  - 6. fejezet: Telepítés előtti ellenőrzés & tervezés (⭐⭐ - 1 óra)
  - 7. fejezet: Hibakeresés & debuggolás (⭐⭐ - 1-1,5 óra)
  - 8. fejezet: Éles & vállalati minták (⭐⭐⭐⭐ - 2-3 óra)
- **📚 Átfogó navigációs rendszer**: Következetes navigációs fejlécek és láblécek az összes dokumentációban
- **🎯 Előrehaladás követése**: Tanfolyam befejezési ellenőrző lista és tanulás igazoló rendszer
- **🗺️ Tanulási út szemléltetés**: Világos belépési pontok különböző tapasztalati szinteknek és céloknak
- **🔗 Kereszt-hivatkozás navigáció**: Kapcsolódó fejezetek és előfeltételek világosan összekapcsolva

#### Fejlesztett
- **README felépítés**: Átalakítva strukturált tanulási platformmá fejezet alapú szerkezettel
- **Dokumentáció navigáció**: Minden oldalon szerepel a fejezet kontextus és előrehaladási útmutató
- **Sablon rendezés**: Példák és sablonok hozzárendelve a megfelelő tanulási fejezetekhez
- **Erőforrás integráció**: Cheat sheet-ek, GYIK és tanulási segédletek kapcsolódnak az adott fejezetekhez
- **Műhely integráció**: Gyakorlati labor feladatok hozzárendelve több fejezet tanulási céljaihoz

#### Megváltozott
- **Tanulási fejlődés**: Lineáris dokumentációról rugalmas fejezetalapú tanulásra váltás
- **Konfiguráció elhelyezése**: Konfigurációs útmutató áthelyezése a 3. fejezetbe a jobb tanulási folyamat érdekében
- **Mesterséges intelligencia tartalom integrációja**: AI-specifikus tartalmak jobb integrálása a tanulási folyamat során
- **Produkcós tartalom**: Haladó minták összegzése a 8. fejezetben vállalati tanulók számára

#### Fejlesztve
- **Felhasználói élmény**: Átlátható navigációs útvonalak és fejezet előrehaladás jelzők
- **Akadálymentesség**: Következetes navigációs minták a tananyag könnyebb bejárásához
- **Szakmai megjelenés**: Egyetemi stílusú tanfolyamfelépítés akadémiai és vállalati képzésekhez
- **Tanulási hatékonyság**: Csökkentett idő a releváns tartalom eléréséhez az átgondoltabb szervezés révén

#### Műszaki megvalósítás
- **Navigációs fejléc**: Szabványosított fejezeti navigáció több mint 40 dokumentációs fájlban
- **Lábléc navigáció**: Következetes előrehaladási útmutatás és fejezetkész állapot jelzők
- **Kereszt-hivatkozások**: Átfogó belső hivatkozási rendszer kapcsolódó fogalmak összekapcsolására
- **Fejezet térkép**: Sablonok és példák egyértelmű összekapcsolása a tanulási célokkal

#### Tanulási segédlet fejlesztés
- **📚 Átfogó tanulási célok**: Átszervezett tanulmányi útmutató az 8 fejezetes rendszerhez igazítva
- **🎯 Fejezetalapú értékelés**: Minden fejezet tartalmaz specifikus tanulási célokat és gyakorlati feladatokat
- **📋 Előrehaladás nyomon követése**: Heti tanulási ütemterv mérhető eredményekkel és teljesítési listákkal
- **❓ Értékelő kérdések**: Tudásvalidáló kérdések minden fejezethez szakmai eredményekkel
- **🛠️ Gyakorlati feladatok**: Gyakorlati tevékenységek valós bevetési forgatókönyvekkel és hibakereséssel
- **📊 Készségfejlődés**: Egyértelmű előrehaladás az alapfogalmaktól a vállalati mintákig, karrierfejlesztési fókusz mellett
- **🎓 Tanúsítási keretrendszer**: Szakmai fejlődési eredmények és közösségi elismerési rendszer
- **⏱️ Ütemterv kezelése**: Strukturált 10 hetes tanulási terv mérföldkő ellenőrzéssel

### [v3.1.0] - 2025-09-17

#### Fejlesztett több ügynökös AI megoldások
**Ez a verzió javítja a többrésztvevős kiskereskedelmi megoldást jobb ügynök elnevezésekkel és megerősített dokumentációval.**

#### Változtatások
- **Több ügynökös terminológia**: A "Cora ügynök" helyett "Vevő ügynök" kifejezésekre váltás az átláthatóság érdekében a kiskereskedelmi többrésztvevős megoldásban
- **Ügynök architektúra**: Minden dokumentáció, ARM sablon és kódpélda egységes "Vevő ügynök" megnevezést kapott
- **Konfigurációs példák**: Modernizált ügynök konfigurációs minták frissített névadási konvenciókkal
- **Dokumentációs következetesség**: Minden hivatkozás szakmai, leíró ügynök neveket használ

#### Fejlesztve
- **ARM sablon csomag**: frissített retail-multiagent-arm-template a Vevő ügynök hivatkozásokkal
- **Architektúra rajzok**: Frissített Mermaid diagramok a megújított ügynök elnevezésekkel
- **Kódpéldák**: Python osztályok és megvalósítási példák most VevőAgent névhasználattal
- **Környezeti változók**: Minden telepítési szkript frissítve CUSTOMER_AGENT_NAME konvenciókra

#### Fejlesztve
- **Fejlesztői élmény**: Átláthatóbb ügynök szerepek és felelősségek a dokumentációban
- **Termelési készség**: Jobb összhang vállalati névadási konvenciókkal
- **Tananyagtartalmak**: Intuitívabb ügynök névhasználat oktatási célokra
- **Sablon használhatóság**: Egyszerűsített ügynök funkciók és telepítési minták megértése

#### Műszaki részletek
- Frissített Mermaid architektúra diagramok CustomerAgent hivatkozásokkal
- CoraAgent osztálynevek helyett Python példákban CustomerAgent használata
- ARM sablon JSON konfigurációk módosítása "customer" ügynök típusra
- Környezeti változók aktualizálása CORA_AGENT_* helyett CUSTOMER_AGENT_* mintákra
- Frissített minden telepítési parancsot és konténer konfigurációt

### [v3.0.0] - 2025-09-12

#### Jelentős változások - AI fejlesztő fókusz és Microsoft Foundry integráció
**Ez a verzió teljesen átalakítja a tárhelyet AI-központú tanulási forrássá Microsoft Foundry integrációval.**

#### Hozzáadva
- **🤖 AI-első tanulási útvonal**: Teljes átstrukturálás AI fejlesztők és mérnökök prioritásával
- **Microsoft Foundry Integrációs útmutató**: Átfogó dokumentáció az AZD és Microsoft Foundry szolgáltatások összekapcsolásához
- **AI modell telepítési minták**: Részletes útmutató a modell kiválasztáshoz, konfigurációhoz és termelési bevetési stratégiákhoz
- **AI Workshop Labor**: 2-3 órás gyakorlati műhely az AI alkalmazások AZD-vel telepíthető megoldássá alakításához
- **Termelési AI bevált gyakorlatok**: Vállalati szintű minták AI munkaterhelések skálázásához, monitorozásához és biztonságához
- **AI-specifikus hibakeresési útmutató**: Átfogó hibaelhárítás Microsoft Foundry modellekhez, kognitív szolgáltatásokhoz és AI telepítési problémákhoz
- **AI sablongyűjtemény**: Kiemelt Microsoft Foundry sablonok komplexitási besorolással
- **Műhely anyagok**: Teljes műhely szerkezet gyakorlati laborokkal és referencia anyagokkal

#### Fejlesztve
- **README felépítés**: AI fejlesztő központú, 45%-os közösségi érdeklődés adatokkal Microsoft Foundry Discord alapján
- **Tanulási utak**: Dedikált AI fejlesztői útszakasz a hagyományos diákok és DevOps mérnökök mellett
- **Sablon ajánlások**: Kiemelt AI sablonok, beleértve azure-search-openai-demo, contoso-chat és openai-chat-app-quickstart
- **Közösségi integráció**: Fejlesztett Discord közösségi támogatás AI-specifikus csatornákkal és beszélgetésekkel

#### Biztonság és termelési fókusz
- **Kezelt identitás minták**: AI-specifikus hitelesítési és biztonsági konfigurációk
- **Költségoptimalizálás**: Tokenhasználat nyomon követése és költségkeret ellenőrzések AI munkaterhelésekhez
- **Több régiós telepítés**: Globális AI alkalmazás bevetési stratégiák
- **Teljesítmény monitorozása**: AI-specifikus metrikák és Application Insights integráció

#### Dokumentáció minősége
- **Lineáris tanfolyam struktúra**: Logikus haladás kezdőtől haladó AI telepítési mintákig
- **Ellenőrzött URL-ek**: Minden külső tárhely link ellenőrzött és elérhető
- **Teljes referencia**: Minden belső dokumentációs link validált és működőképes
- **Termelésre kész**: Vállalati telepítési minták valós példákkal

### [v2.0.0] - 2025-09-09

#### Jelentős változások - Tárhely átstrukturálás és szakmai fejlesztés
**Ez a verzió jelentős átalakítást jelent a tárhely szerkezetében és tartalom megjelenítésében.**

#### Hozzáadva
- **Strukturált tanulási keret**: Minden dokumentációs oldal most tartalmaz Bevezetőt, Tanulási célokat és Tanulási eredményeket
- **Navigációs rendszer**: Hozzáadott Előző/Következő lecke linkek az egész dokumentációban az irányított tanulási előrehaladáshoz
- **Tanulmányi segédlet**: Átfogó study-guide.md tanulási célokkal, gyakorlati feladatokkal és értékelési anyagokkal
- **Szakmai megjelenés**: Minden emoji ikon eltávolítása jobb akadálymentesség és professzionális megjelenés érdekében
- **Fejlesztett tartalomszerkezet**: Javított tananyagszervezés és folyamat

#### Változtatás
- **Dokumentáció formátum**: Minden dokumentáció egységes tanulásközpontú felépítéssel
- **Navigációs folyamat**: Logikus előrehaladás megvalósítása az összes tananyagon át
- **Tartalom megjelenítés**: Dekoratív elemek eltávolítása a tiszta, professzionális formázás érdekében
- **Link struktúra**: Minden belső link frissítése az új navigációs rendszer támogatására

#### Fejlesztve
- **Akadálymentesség**: Emoji függőségek eltávolítása jobb képernyőolvasó kompatibilitás érdekében
- **Szakmai megjelenés**: Tiszta, akadémiai stílusú megjelenés vállalati tanuláshoz
- **Tanulási élmény**: Strukturált megközelítés világos célokkal és eredményekkel minden leckéhez
- **Tartalom szervezés**: Jobb logikai folyamat és kapcsolódás a témák között

### [v1.0.0] - 2025-09-09

#### Első kiadás - Átfogó AZD tanulási tárhely

#### Hozzáadva
- **Alap dokumentáció szerkezet**
  - Teljes kezdő útmutató sorozat
  - Átfogó telepítési és előkészítési dokumentáció
  - Részletes hibakeresési források és útmutatók
  - Telepítés előtti ellenőrző eszközök és eljárások

- **Kezdő modul**
  - AZD alapok: Alapfogalmak és terminológia
  - Telepítési útmutató: Platform-specifikus beállítási utasítások
  - Konfigurációs útmutató: Környezet beállítás és hitelesítés
  - Első projekt oktatóanyag: Lépésről lépésre kézzel fogható tanulás

- **Telepítés és előkészítés modul**
  - Telepítési útmutató: Teljes munkafolyamat dokumentációja
  - Előkészítési útmutató: Infrastructure as Code Biceppel
  - Legjobb gyakorlatok termelési telepítésekhez
  - Több szolgáltatásos architektúra minták

- **Telepítés előtti ellenőrző modul**
  - Kapacitástervezés: Azure erőforrás elérhetőség validálása
  - SKU kiválasztás: Átfogó szolgáltatási szint útmutató
  - Pre-flight ellenőrzések: Automatikus validációs scriptek (PowerShell és Bash)
  - Költségbecslés és költségvetés tervezési eszközök

- **Hibakeresési modul**
  - Gyakori hibák: Gyakran előforduló problémák és megoldások
  - Hibakeresési útmutató: Rendszeres hibakeresési módszertanok
  - Fejlett diagnosztikai technikák és eszközök
  - Teljesítmény monitorozás és optimalizálás

- **Források és hivatkozások**
  - Parancs összefoglaló: Gyors referencia lényeges parancsokról
  - Szószedet: Kifejezések és rövidítések átfogó definíciói
  - GYIK: Részletes válaszok gyakori kérdésekre
  - Külső forrás linkek és közösségi kapcsolatok

- **Példák és sablonok**
  - Egyszerű webalkalmazás példa
  - Statikus weboldal telepítési sablon
  - Konténeres alkalmazás konfiguráció
  - Adatbázis integrációs minták
  - Mikroszolgáltatás architektúra példák
  - Serverless funkciók megvalósításai

#### Funkciók
- **Többplatformos támogatás**: Telepítési és konfigurációs útmutatók Windows, macOS és Linux rendszerekhez
- **Több készségszint**: Tartalom diákoktól a szakmai fejlesztőkig tervezve
- **Gyakorlati fókusz**: Gyakorlati példák és valós forgatókönyvek
- **Átfogó lefedettség**: Alaptól haladó vállalati mintákig
- **Biztonság-központú megközelítés**: Biztonsági legjobb gyakorlatok integrálva
- **Költségoptimalizálás**: Útmutatás költséghatékony telepítésekhez és erőforrás-kezeléshez

#### Dokumentáció minősége
- **Részletes kódpéldák**: Gyakorlati, tesztelt kódminták
- **Lépésről lépésre útmutatók**: Világos, megvalósítható instrukciók
- **Átfogó hibakezelés**: Gyakori problémák hibakeresése
- **Legjobb gyakorlatok integrálása**: Iparági szabványok és ajánlások
- **Verzió kompatibilitás**: Naprakész legújabb Azure szolgáltatásokkal és az azd funkciókkal

## Tervezett jövőbeli fejlesztések

### Verzió 3.1.0 (tervezett)
#### AI platform bővítés
- **Többmodell támogatás**: Integrációs minták Hugging Face, Azure Machine Learning és egyedi modellek számára
- **AI ügynök keretrendszerek**: Sablonok LangChain, Semantic Kernel és AutoGen telepítésekhez
- **Fejlett RAG minták**: Vektor adatbázis lehetőségek az Azure AI Search mellett (Pinecone, Weaviate stb.)
- **AI megfigyelhetőség**: Fejlett monitorozás modell teljesítményhez, tokenhasználathoz és válaszminőséghez

#### Fejlesztői élmény
- **VS Code bővítmény**: Integrált AZD + Microsoft Foundry fejlesztési élmény
- **GitHub Copilot integráció**: AI által támogatott AZD sablongenerálás
- **Interaktív oktatóanyagok**: Gyakorlati kódolási feladatok automatizált validációval AI forgatókönyvekhez
- **Videó tartalmak**: Kiegészítő videós oktatóanyagok vizuális tanulók számára AI telepítés témában

### Verzió 4.0.0 (tervezett)
#### Vállalati AI minták
- **Irányítási keretrendszer**: AI modell irányítás, megfelelőség és auditálási nyomvonalak
- **Több bérlős AI**: Több ügyfelet kiszolgáló, izolált AI szolgáltatások mintái
- **Edge AI telepítés**: Integráció Azure IoT Edge-del és konténer példányokkal
- **Hibrid felhő AI**: Több felhős és hibrid telepítési minták AI munkaterhelésekhez

#### Fejlett funkciók
- **AI csővezeték automatizálás**: MLOps integráció Azure Machine Learning csővezetékkel
- **Fejlett biztonság**: Zéró bizalom minták, privát végpontok és fejlett fenyegetésvédelem
- **Teljesítmény optimalizálás**: Haladó hangolási és skálázási stratégiák nagy áteresztőképességű AI alkalmazásokhoz
- **Globális terjesztés**: Tartalomkézbesítési és él szintű cache minták AI alkalmazásokhoz

### Verzió 3.0.0 (tervezett) - Felülírva a jelenlegi kiadással
#### Javasolt kiegészítések - Most megvalósítva v3.0.0
- ✅ **AI-központú tartalom**: Átfogó Microsoft Foundry integráció (elkészült)
- ✅ **Interaktív oktatóanyagok**: Gyakorlati AI workshop labor (elkészült)
- ✅ **Fejlett biztonsági modul**: AI-specifikus biztonsági minták (elkészült)
- ✅ **Teljesítmény optimalizálás**: AI munkaterhelés hangolási stratégiák (elkészült)

### Verzió 2.1.0 (tervezett) - Részben megvalósítva v3.0.0-ban
#### Kis fejlesztések - Néhány kész a jelenlegi kiadásban
- ✅ **További példák**: AI-központú telepítési forgatókönyvek (elkészült)
- ✅ **Bővített GYIK**: AI-specifikus kérdések és hibakezelés (elkészült)
- **Eszköz integráció**: Fejlesztett IDE és szerkesztő integrációs útmutatók
- ✅ **Monitorozás bővítés**: AI-specifikus monitorozási és riasztási minták (elkészült)

#### Még tervezett a jövőbeli kiadáshoz
- **Mobilbarát dokumentáció**: Reszponzív dizájn mobil tanuláshoz
- **Offline hozzáférés**: Letölthető dokumentációs csomagok
- **Fejlesztett IDE integráció**: VS Code bővítmény AZD + AI munkafolyamatokhoz
- **Közösségi irányítópult**: Valós idejű közösségi metrikák és hozzájárulási nyomon követés

## Hozzájárulás a változásnaplóhoz

### Változások jelentése
Amikor hozzájárulsz ehhez a tárhelyhez, kérjük, hogy a változásnapló bejegyzések tartalmazzák:

1. **Verziószám**: A szemantikus verziózásnak megfelelően (major.minor.patch)
2. **Dátum**: Kiadási vagy frissítési dátum YYYY-MM-DD formátumban
3. **Kategória**: Hozzáadva, Megváltoztatva, Elavult, Eltávolítva, Javítva, Biztonság
4. **Egyértelmű leírás**: Tömör összefoglaló a változásról
5. **Hatáselemzés**: Hogyan befolyásolják a változások a meglévő felhasználókat

### Változások kategóriái

#### Hozzáadva
- Új funkciók, dokumentációs részek vagy képességek
- Új példák, sablonok vagy tanulási források
- További eszközök, scriptek vagy segédprogramok

#### Megváltoztatva
- Meglévő funkciók vagy dokumentáció módosításai
- Pontosítások vagy világosabbá tételek frissítése
- Tartalom vagy szervezet átalakítása

#### Elavult
- Fázisból kivont funkciók vagy megközelítések
- Eltávolításra tervezett dokumentációs részek
- Módszerek, amelyeknek jobb alternatívái vannak

#### Eltávolítva
- Funkciók, dokumentációk vagy példák, amelyek már nem relevánsak
- Elavult információk vagy elavult megközelítések
- Felesleges vagy összevont tartalom

#### Javítva
- Hibák javítása a dokumentációban vagy kódban
- Jelentett problémák vagy hibák megoldása
- Pontosság vagy működés javítása

#### Biztonság
- Biztonsági fejlesztések vagy javítások
- Biztonsági legjobb gyakorlatok frissítései
- Biztonsági sérülékenységek megszüntetése

### Szemantikus verziózási irányelvek

#### Fő verzió (X.0.0)
- Olyan jelentős változások, amelyek felhasználói beavatkozást igényelnek
- Jelentős tartalmi vagy szervezeti átalakítások
- Alapvető megközelítést vagy módszertant megváltoztató módosítások

#### Minor verzió (X.Y.0)
- Új funkciók vagy tartalmi kiegészítések
- Visszafelé kompatibilis fejlesztések
- További példák, eszközök vagy források

#### Hibajavító verzió (X.Y.Z)
- Hibajavítások és korrekciók
- Kisebb fejlesztések a meglévő tartalomban
- Pontosítások és apró fejlesztések

## Közösségi visszajelzések és javaslatok

Aktívan ösztönözzük a közösségi visszajelzéseket a tananyagot javító fejlesztésekhez:

### Hogyan adj visszajelzést
- **GitHub Issues**: Problémák jelentése vagy fejlesztési javaslatok (minden AI-specifikus probléma szívesen fogadva)
- **Discord Beszélgetések**: Ossz meg ötleteket és vegyél részt a Microsoft Foundry közösségi beszélgetéseiben
- **Pull Requestek**: Közvetlen tartalomfejlesztések beküldése, különösen AI sablonok és útmutatók esetében
- **Microsoft Foundry Discord**: Vegyél részt az #Azure csatornán AZD + AI témákban
- **Közösségi Fórumok**: Szélesebb körű Azure fejlesztői beszélgetésekben való részvétel

### Visszajelzési kategóriák
- **AI Tartalom Pontossága**: Javítások az AI szolgáltatás integrációjával és telepítésével kapcsolatban
- **Tanulási élmény**: Javaslatok az AI fejlesztők tanulási folyamatának javítására
- **Hiányzó AI Tartalom**: Kérések további AI sablonokra, mintákra vagy példákra
- **Akadálymentesség**: Fejlesztések a különböző tanulási igényekhez
- **AI Eszköz Integráció**: Javaslatok az AI fejlesztési munkafolyamat jobb integrációjára
- **Produkcioni AI Minták**: Vállalati AI telepítési minta kérések

### Válaszadási elkötelezettség
- **Problémákra válaszadás**: 48 órán belül a bejelentett problémák esetén
- **Funkciókérések**: Egy héten belüli értékelés
- **Közösségi hozzájárulások**: Egy héten belüli átnézés
- **Biztonsági problémák**: Kiemelt prioritás, gyorsított válaszadás

## Karbantartási ütemterv

### Rendszeres frissítések
- **Havi ellenőrzések**: Tartalom pontosságának és linkek érvényességének vizsgálata
- **Negyedéves frissítések**: Jelentős tartalmi kiegészítések és fejlesztések
- **Féléves ellenőrzések**: Átfogó átalakítás és fejlesztés
- **Éves kiadások**: Jelentős verziófrissítések nagyobb fejlesztésekkel

### Megfigyelés és minőségbiztosítás
- **Automatizált tesztelés**: Rendszeres kódpéldák és linkek ellenőrzése
- **Közösségi visszajelzések beépítése**: Felhasználói javaslatok rendszeres integrálása
- **Technológiai frissítések**: Legújabb Azure szolgáltatásokkal és az azd kiadásokkal való összehangolás
- **Akadálymentességi auditok**: Rendszeres felülvizsgálat az inkluzív tervezési elvekhez

## Verzió támogatási irányelv

### Aktuális verzió támogatás
- **Legújabb nagy verzió**: Teljes támogatás rendszeres frissítésekkel
- **Előző nagy verzió**: Biztonsági frissítések és kritikus javítások 12 hónapig
- **Régi verziók**: Csak közösségi támogatás, hivatalos frissítések nélkül

### Migrációs útmutatás
Nagy verziók kiadása esetén biztosítjuk:
- **Migrációs útmutatók**: Lépésről lépésre szóló átállási utasítások
- **Kompatibilitási megjegyzések**: A megtörő változások részletei
- **Eszköztámogatás**: Szkriptek vagy eszközök a migráció megkönnyítésére
- **Közösségi támogatás**: Dedikált fórumok migrációs kérdésekhez

---

**Navigáció**
- **Előző lecke**: [Tanulási kalauz](resources/study-guide.md)
- **Következő lecke**: Vissza a [Fő README-hez](README.md)

**Maradj naprakész**: Kövesd ezt a tárolót az értesítésekért az új kiadásokról és a tananyagot érintő fontos frissítésekről.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->