# Változásnapló - AZD Kezdőknek

## Bevezetés

Ez a változásnapló dokumentál minden jelentős változást, frissítést és fejlesztést az AZD Kezdőknek tárházban. Az szemantikus verziókövetés elveit követjük, és ezt a naplót karbantartjuk, hogy segítsük a felhasználókat megérteni, mi változott a verziók között.

## Tanulási célok

A változásnapló áttekintésével Ön:
- Értesül az új funkciókról és tartalomkiegészítésekről
- Megérti a meglévő dokumentáció fejlesztéseit
- Követi a hibajavításokat és korrekciókat a pontosság érdekében
- Nyomon követi a tananyagok időbeli fejlődését

## Tanulási eredmények

A változásnapló bejegyzéseinek áttekintése után képes lesz:
- Azonosítani az új tartalmakat és tanulási forrásokat
- Megérteni, mely részek frissültek vagy fejlődtek
- Megtervezni a tanulási útvonalat a legaktuálisabb anyagok alapján
- Visszajelzést és javaslatokat adni a jövőbeli fejlesztésekhez

## Verziótörténet

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Frissítés: Verziófrissítés
**Ez a verzió újraellenőrzi a kurzust az `azd` `1.27.1` (2026. július, legfrissebb stabil kiadás) és a jelenlegi előzetes AI ügynök kiterjesztés `azure.ai.agents` `1.0.0-beta.5` verziói alapján, naprakésszé téve minden „ellenőrizve” címet az 1.26.0, 1.27.0 és 1.27.1 kiadások után.**

#### Változások
- **✅ Érvényesítési alapvonal frissítve** az `azd 1.25.6` (2026. június) verzióról `azd 1.27.1` (2026. július) verzióra az összes fő README-ben, az összes fejezet README-jében, az 1. fejezet fejlesztői-konténer leckében (beleértve a rögzített verziójú példákat), a 4. fejezet egyedi sablonok leckében, az 5. fejezet több ügynök leckében és a műhely dokumentációkban
- **🤖 2. fejezet alapvonalának frissítése** az `azd 1.23.12` (2026. március) verzióról `azd 1.27.1` verzióra az `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` és `microsoft-foundry-integration.md` fájlokban; az érvényesítési megjegyzések dátumai frissültek 2026-07-13-ra
- **🧩 AI ügynök kiterjesztés frissítve** az `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` verzióról a jelenlegi `1.0.0-beta.5` kiadásra a 2. fejezet README-jében és az `agents.md` fájlban
- **🧪 Műhely érvényesítési példa** (`azd version` kimenet) frissítve `1.27.1` verzióra

#### Megjegyzések a releváns azd kiadásokhoz (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go támogatás Azure Functions-hoz Flex Consumption alatt, `azd config sub-filter` bérlőnkénti előfizetés szűrők, önálló kiterjesztés csomagok (`azd x pack --bundle`), és `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Azure AI Foundry projektek/ügynökök modellezése közvetlenül `azure.yaml`-ban (Bicep nélküli/Terraform nélküli inicializálás), App Service konténer telepítési támogatás (`host: appservice` + `language: docker`), közvetlen `-s/--source` az `azd extension` parancsokban, és `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` flag az `azd extension install`-hoz, alapértelmezettként kizárt elavult modellek a katalógus/kvóta kérésekből, és több hibajavítás

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

#### Kezdő Hiánypótlás #2: Sablonszerkesztés, Dev konténerek, Pulumi, Azure DevOps, Szolgáltatás-felhasználók és Több
**Ez a verzió lezárja az azd-lefedettség elemzés által feltárt közbenső hiányosságokat: hogyan lehet saját sablont szerkeszteni és közzétenni, reprodukálható dev-konténer/Codespaces környezetek, Pulumi infrastruktúra szolgáltató, Azure DevOps CI/CD bemutató, szolgáltatás-felhasználói hitelesítés, hoszt választási útmutató (AKS/Spring Apps), `azd restore`/`azd package` magyarázatok, hook hibakezelés, és csapat/megosztott környezeti gyakorlatok.**

#### Hozzáadott
- **🧱 Új 4. fejezet lecke** `docs/chapter-04-infrastructure/custom-templates.md` — saját azd sablon szerkesztése: elvárt struktúra (`azure.yaml`, `infra/`, `src/`), a `metadata.template` mező, infrastruktúra paraméterezése a `uniqueString()` erőforrás tokennel és `azd-env-name` címkével, helyi tesztelés `azd init --template <local-path>` parancsal, GitHub-ra való közzététel, és benyújtás az Awesome AZD galériába
- **📦 Új 1. fejezet lecke** `docs/chapter-01-foundation/dev-containers.md` — reprodukálható azd környezetek Dev konténerekkel és GitHub Codespaces-szel: minimális `.devcontainer/devcontainer.json` az hivatalos `ghcr.io/azure/azure-dev/azd` funkcióval, nyelvspecifikus funkciók, `docker-in-docker` konténer hosztokhoz, és `azd auth login --use-device-code` távoli bejelentkezéshez
- **🧩 Pulumi az azd-vel** szekció a `docs/chapter-04-infrastructure/provisioning.md` fájlban — `infra.provider: pulumi`, Pulumi mappa szerkezet, stack-ek hozzárendelése azd környezetekhez, kötelező kimenetek/címkézés, és az azonos `azd up` / `azd down` munkafolyamat
- **🎯 Hoszt-választási útmutató** a `docs/chapter-04-infrastructure/provisioning.md` fájlban — kezdőbarát összehasonlítás az `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` és `springapp` között, útmutatás, mikor válasszuk az AKS-t vagy az Azure Spring Appset
- **🛠️ Azure DevOps CI/CD bemutató** a `docs/chapter-08-production/production-ai-practices.md` fájlban — `azd pipeline config --provider azdo`, szolgáltatási kapcsolat terhelésazonosító szövetséggel (OIDC), generált `azure-dev.yml`, és változó-csoport beállítás
- **🔑 Szolgáltatás-felhasználók (4. minta)** hozzáadva a `docs/chapter-03-configuration/authsecurity.md` fájlhoz — `az ad sp create-for-rbac`, nem interaktív `azd auth login` kliens titokkal vs. federált/OIDC hitelesítőkkel, mikor használjuk, és biztonságos hitelesítő tárolás
- **🪝 Hook hibakezelés** alfejezet a `docs/chapter-04-infrastructure/deployment-guide.md` fájlban — kilépési kódok és `set -e`, `continueOnError`, hookok izolált tesztelése `azd hooks run` paranccsal, operációs rendszer specifikus shell-ek, és `--debug`
- **👥 Csapat / megosztott környezetek** szekció a `docs/chapter-03-configuration/configuration.md` fájlban — mi található a `.azure/` könyvtárban, mit kell gitignore-ba tenni, fejlesztőnkénti környezetek, `azd env list`/`select`, és környezeti értékek biztosítása CI/CD-ben
- **🧰 A `azd restore` és bővített `azd package` magyarázat** a `resources/cheat-sheet.md` fájlban — függőségek visszaállítása és telepíthető eredmény előállítása telepítés nélkül

#### Módosítások
- **🧭 4. fejezet lecketábla** frissítve az új „Saját Sablon Szerkesztése” leckével (3. lecke)
- **🧭 1. fejezet lecketábla** frissítve az új „Dev Konténerek & Codespaces” leckével (5. lecke); navigációs láblécek kapcsolatban a `bring-your-own-app.md` és a `dev-containers.md` között

### [v3.21.0] - 2026-06-16

#### Kezdő Hiánypótlás: Gyakorlati Többügynökös lecke, „Bring Your Own App,” Terraform és CI/CD bemutató
**Ez a verzió lezárja a legnagyobb hiányosságokat egy teljes kezdő útmutatóhoz két új gyakorlati leckével (egy telepíthető többügynökös bemutató és az azd hozzáadása egy meglévő alkalmazáshoz), kezdőbarát hook bevezetéssel, Terraform az azd-vel szekcióval, lépésről-lépésre GitHub Actions pipeline bemutatóval, új előzetes kiterjesztések magyarázatával, és egy explicit telepítés-ellenőrzési ellenőrzőlistával.**

#### Hozzáadott
- **🤝 Új 5. fejezet lecke** `docs/chapter-05-multi-agent/multi-agent-basics.md` — teljesen gyakorlati, telepíthető kétügynökös bemutató (irányító + specialisták) egy valódi sablonnal (`contoso-creative-writer`), kitérve mikor használjunk több ügynököt, az `azd up` munkafolyamat, a telepített erőforrások megértése, ügynökök közötti nyomonkövetés, testreszabás és takarítás
- **📦 Új 1. fejezet lecke** `docs/chapter-01-foundation/bring-your-own-app.md` — hogyan adjuk hozzá azz azd-t egy meglévő projekthez az `azd init` segítségével („használja a jelenlegi könyvtár kódját”), az `azure.yaml` és az `infra/` megértése, `azd infra generate`, hoszt érzékelés, és telepítés `azd up`-pal
- **🌐 Terraform az azd-vel** szekció hozzáadva a `docs/chapter-04-infrastructure/provisioning.md` fájlhoz — `infra.provider: terraform` konfiguráció, `.tf` mappa szerkezet, kötelező `AZURE_*` kimenetek és `azd-env-name` címkézés, és az azonos `azd up` / `azd down` munkafolyamat (lezárja azt a hiányosságot, ahol Terraform támogatást említettek, de csak Bicep-et mutattak)
- **⚙️ Lépésről lépésre GitHub Actions bemutató** a `docs/chapter-08-production/production-ai-practices.md` fájlban — GitHub repótól az automatikus telepítésig, `azd pipeline config`, OIDC szövetségi hitelesítők (nincsenek tárolt titkok), generált `azure-dev.yml`, és titkok vs. változók útmutató
- **🪝 Kezdőknek „Új a hook-okban?” bevezető** a `docs/chapter-04-infrastructure/deployment-guide.md` fájlban — mi az a hook, hook fázistábla, egy minimális első hook, és hook-ok kézi futtatása `azd hooks run`-nal
- **✅ „Telepítés ellenőrzése” ellenőrzőlista** hozzáadva az 5. lépéshez a `docs/chapter-01-foundation/first-project.md` fájlban — gyors teszt, állapot-végpont ellenőrzés, és explicit siker kritériumok
- **🧩 Új előzetes kiterjesztések magyarázata** `azure.ai.skills` és `azure.ai.connections` (mik azok és mikor használjuk őket) a `docs/chapter-08-production/production-ai-practices.md` fájlban

#### Módosítások
- **🧭 5. fejezet lecketábla** javítva: a `multi-agent-basics.md` most az 1. lecke (az egyetlen teljesen gyakorlati lecke), őszinte megjelöléssel, hogy a 2. lecke a 6. fejezetben van, és a Retail forgatókönyv egy architekturális tervrajz, nem egy parancssoros sablon
- **🧭 1. fejezet lecketábla** most tartalmazza az új „Bring Your Own App” leckét (4. lecke)
- **🔗 Navigációs láblécek** frissítve: a `first-project.md` most előre mutat a `bring-your-own-app.md` fájlra

#### Javítva
- **🧱 Bezárva a „megígért, de hiányzó” Terraform hiányosság** — a kurzus korábban említette a Terraform támogatást anélkül, hogy azt bemutatta volna
- **🔀 Javítva a félrevezető 5. fejezet keresztlinkek** amely azt sugallták, hogy létezik teljes többügynök implementáció, holott csak egy architekturális tervrajz volt

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

#### AZD 1.25.6 Frissítés, Teljes Ügynök Életciklus Parancsok & Aspire Márkaátnevezés

**Ez a verzió újraellenőrzi a tanfolyamot a `azd` `1.25.6` (2026 június) és az `azure.ai.agents` `0.1.40-preview` kiterjesztés ellen, kibővíti a mesterséges intelligencia iránymutatást a „ügynök felállítása” témakörtől az ügynök teljes életciklusáig (teszt → értékel → optimalizál → átvizsgál → töröl), bemutatja az új `azure.ai.skills` és `azure.ai.connections` előzetes kiterjesztéseket, továbbá megemlíti a „.NET Aspire” → „Aspire” termékátnevezést.**

#### Hozzáadva
- **🔁 Teljes ügynök életciklus lefedettség** kezdők és AI mérnökök számára a dokumentációkban:
  - `docs/chapter-01-foundation/azd-basics.md` — Életciklus táblázat (felállítás → teszt → mérés → javítás → átvizsgálás → takarítás) hozzáadva a Kiterjesztések és AI parancsok szekcióhoz
  - `docs/chapter-08-production/production-ai-practices.md` — Új „Az ügynök életciklusának kezelése” szakasz, amely lefedi az `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` és `delete --force` parancsokat
  - `resources/cheat-sheet.md` — Bővített AI Ügynök parancsok az `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` és `delete --force` parancsokkal
- **🧩 Új előzetes kiterjesztések** dokumentálva: `azure.ai.skills` (újrahasználható ügynök képességek) és `azure.ai.connections` (Foundry kapcsolatok) hozzáadva a kiterjesztés táblázathoz és a cheat sheethez
- **⏱️ Válaszidő iránymutatás** — az `azd ai agent invoke` példák most jelzik, hogy megjeleníti az összes késleltetést és az első bájt időzítését
- **📌 Verzió banner** a gyökér README-ben, ami a tanulókat az `azd version` és `azd upgrade` parancsokra irányítja

#### Módosítva
- **✅ Érvényesítési alap frissítve** `azd 1.23.12` (2026 március) verzióról `azd 1.25.6` (2026 június) verzióra az összes fejezet README-jében és a workshop dokumentációkban
- **🤖 2. fejezet kiterjesztési megjegyzés** frissítve `azure.ai.agents` `0.1.18-preview` verzióról `0.1.40-preview` verzióra
- **🧪 Workshop érvényesítési példa** (`azd version` kimenet) frissítve `1.25.6` verzióra
- **🧭 README "Mi újság ma az azd-ben"** frissítve, hogy hangsúlyozza az ügynök életciklusának teljes lefedettségét, az új AI kiterjesztéseket és a nemrégiben történt életminőség javításokat (`azd init` idempotencia, `azd auth login` elavult token törlés, `azd tool` első futtatáskor kérdés)
- **📖 2. fejezet agents.md (4. opció)** most a telepítés utáni életciklus parancsokra irányítja a tanulókat ahelyett, hogy az `azd up` parancsnál megállna

#### Javítva
- **🏷️ Terméknév változás** — Aspire márkaváltás megjegyzés hozzáadva („.NET Aspire” mostantól csak „Aspire”); az `azd` Aspire támogatása változatlan
- **🔎 Élő kiadás ellenőrzés** megerősítve az Azure Developer CLI kiadási adatfolyamán keresztül: stabil CLI `1.25.6` (2026-06-12) és `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Kezdők bevezetése, Beállítás ellenőrzése és az utolsó AZD parancsok tisztítása
**Ez a verzió az AZD 1.23 validációs ellenőrzése után egy kezdőkre fókuszáló dokumentációs felülvizsgálatot tartalmaz: tisztázza az AZD első bejelentkezési lépéseit, hozzáad helyi beállítás ellenőrző skripteket, ellenőrzi a fontos parancsokat az élő AZD CLI-vel, és eltávolítja az utolsó elavult angol parancs hivatkozásokat a changelog-on kívül.**

#### Hozzáadva
- **🧪 Kezdő setup ellenőrző skriptek** `validate-setup.ps1` és `validate-setup.sh` fájlokkal, hogy a tanulók leellenőrizhessék a szükséges eszközöket az 1. fejezet megkezdése előtt
- **✅ Előzetes setup ellenőrző lépések** a gyökér README-ben és az 1. fejezet README-ben, hogy a hiányzó előfeltételeket a `azd up` előtt észlelje a rendszer

#### Módosítva
- **🔐 Kezdő hitelesítési útmutató** mostantól következetesen az `azd auth login` parancsot javasolja elsődleges AZD munkafolyamatokhoz, míg az `az login` használata opcionális, kivéve, ha közvetlenül Azure CLI parancsokat használnak
- **📚 1. fejezet bevezető folyamat** most már a telepítés, hitelesítés és első telepítés előtt a helyi környezet validálására irányítja a tanulókat
- **🛠️ Érvényesítő üzenetek** elkülönítik a kötelező blokkoló követelményeket az opcionális Azure CLI figyelmeztetésektől az csak AZD kezdő útvonalon
- **📖 Konfigurációs, hibakeresési és példa dokumentumok** most megkülönböztetik a kötelező AZD hitelesítést és az opcionális Azure CLI bejelentkezést ott, ahol eddig kontextus nélkül szerepeltek együtt

#### Javítva
- **📋 Megmaradt angol parancshivatkozások** frissítve az aktuális AZD formákra, beleértve az `azd config show` parancsot a cheat sheetben és az `azd monitor --overview` parancsot, ahol Azure Portal áttekintést céloztak meg
- **🧭 Kezdők kijelentései az 1. fejezetben** enyhítve a túlzott ígéreteket, hogy ne garantálják a hibamentes vagy visszagörgethető viselkedést minden sablon és Azure erőforrás esetén
- **🔎 Élő CLI vizsgálat** megerősítette a támogatást az `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` és `azd down --force --purge` parancsokra

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

#### AZD 1.23.12 ellenőrzés, workshop környezet bővítés és AI modell frissítés
**Ez a verzió dokumentációs ellenőrzést hajt végre a `azd` `1.23.12` verzióval, frissíti az elavult AZD parancs példákat, frissíti az AI modell iránymutatásokat a jelenlegi alapértelmezettekre, és kibővíti a workshop utasításokat a GitHub Codespaces mellett fejlesztői konténerekre és helyi klónokra is.**

#### Hozzáadva
- **✅ Érvényesítési megjegyzések alapvető fejezetek és workshop dokumentációk között**, hogy a tesztelt AZD alapvonal egyértelmű legyen az újabb vagy régebbi CLI verziókat használók számára
- **⏱️ Telepítési időkorlát iránymutatás** hosszú futású AI alkalmazások számára az `azd deploy --timeout 1800` használatával
- **🔎 Kiterjesztés ellenőrzési lépések** az `azd extension show azure.ai.agents` használatával az AI munkafolyamat dokumentációkban
- **🌐 Szélesebb workshop környezet iránymutatás** a GitHub Codespaces, fejlesztői konténerek és helyi klónok MkDocs alapú támogatásával

#### Módosítva
- **📚 Fejezet bevezető README-k** következetesen megjegyzik az érvényesítést `azd 1.23.12` verzióval az alap, konfigurációs, infrastruktúra, több ügynökös, előtelepítési, hibakeresési és üzemeltetési szakaszokban
- **🛠️ AZD parancshivatkozások** frissítve a jelenlegi formákra az összes dokumentumban:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` vagy `azd env get-value(s)` kontextustól függően
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` ahol az Application Insights áttekintése a cél
- **🧪 Preview provisioning példák** egyszerűsítve a támogatott jelenlegi használatra, például `azd provision --preview` és `azd provision --preview -e production`
- **🧭 Workshop folyamat** frissítve, hogy a tanulók Codespaces, fejlesztői konténer vagy helyi klón használatával is elvégezhessék a gyakorlatokat, ne feltételezve kizárólag Codespaces futtatást
- **🔐 Hitelesítési útmutató** most előnyben részesíti az `azd auth login` használatát AZD munkafolyamatokban, az `az login` opcionális, ha közvetlenül Azure CLI parancsokat használnak

#### Javítva
- **🪟 Windows telepítési parancsok** normalizálva az aktuális `winget` csomag nagybetűzéshez a telepítési útmutatóban
- **🐧 Linux telepítési útmutatás** javítva, hogy elkerülje az alátámaszatlan disztribúció-specifikus `azd` csomagkezelői utasításokat, helyette a megfelelő kiadási eszközökre mutat
- **📦 AI modell példák** frissítve a régebbi alapértelmezettekről (`gpt-35-turbo`, `text-embedding-ada-002`) a jelenlegiekre, mint `gpt-4.1-mini`, `gpt-4.1` és `text-embedding-3-large`
- **📋 Telepítési és diagnosztikai kódrészletek** módosítva, hogy az aktuális környezeti és állapot parancsokat használják a naplókban, szkriptekben és hibakeresési lépésekben
- **⚙️ GitHub Actions útmutató** frissítve az `Azure/setup-azd@v1.0.0`-ról az `Azure/setup-azd@v2` verzióra
- **🤖 MCP/Copilot hozzájárulási útmutató** frissítve az `azd mcp consent`-ről az `azd copilot consent list` parancsra

#### Javított
- **🧠 AI fejezet iránymutatás** most jobban magyarázza az előzetes (preview) érzékeny `azd ai` viselkedést, a bérlői bejelentkezést, az aktuális kiterjesztés használatot és a frissített modell telepítési ajánlásokat
- **🧪 Workshop utasítások** most valósághűbb verzió példákat és világosabb környezet beállítási kifejezéseket használnak a gyakorlatokhoz
- **📈 Üzemeltetési és hibakeresési dokumentumok** jobban igazodnak a jelenlegi monitorozási, tartalék modell és költségszint példákhoz

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

#### AZD AI CLI parancsok, tartalom ellenőrzés és sablonbővítés
**Ez a verzió hozzáadja az `azd ai`, `azd extension` és `azd mcp` parancsokat minden AI-val kapcsolatos fejezethez, javítja az agents.md-ben található törött hivatkozásokat és elavult kódokat, frissíti a cheat sheet-et, és átdolgozza a Példa Sablonok részt validált leírásokkal és új Azure AI AZD sablonokkal.**

#### Hozzáadva
- **🤖 AZD AI CLI lefedettség** 7 fájlban (korábban csak a 8. fejezetben):
  - `docs/chapter-01-foundation/azd-basics.md` — Új „Kiterjesztések és AI parancsok” szekció az `azd extension`, `azd ai agent init` és `azd mcp` bevezetésével
  - `docs/chapter-02-ai-development/agents.md` — 4. opció: `azd ai agent init` összehasonlító táblázattal (sablon vs manifeszt megközelítés)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — „AZD kiterjesztések Foundry-hoz” és „Ügynök-első telepítés” alfejezetek

  - `docs/chapter-05-multi-agent/README.md` — A Gyors kezdés most mind a sablon, mind a manifeszt alapú telepítési útvonalakat mutatja
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — A Telepítés szakasz most tartalmazza az `azd ai agent init` opciót
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — „AZD AI bővítmény parancsok diagnosztikához” alfejezet
  - `resources/cheat-sheet.md` — Új „AI & bővítmény parancsok” szakasz az `azd extension`, `azd ai agent init`, `azd mcp` és `azd infra generate` parancsokkal
- **📦 Új AZD AI példa sablonok** a `microsoft-foundry-integration.md` fájlban:
  - **azure-search-openai-demo-csharp** — .NET RAG chat Blazor WebAssembly-vel, Semantic Kernel-lel és hangalapú chat támogatással
  - **azure-search-openai-demo-java** — Java RAG chat Langchain4J-vel, ACA/AKS telepítési lehetőségekkel
  - **contoso-creative-writer** — Többügynökös kreatív írási alkalmazás Azure AI Agent Service, Bing Grounding és Prompty használatával
  - **serverless-chat-langchainjs** — Szerver nélküli RAG Azure Functions + LangChain.js + Cosmos DB-vel, Ollama helyi fejlesztői támogatással
  - **chat-with-your-data-solution-accelerator** — Vállalati RAG gyorsító admin portállal, Teams integrációval és PostgreSQL/Cosmos DB opciókkal
  - **azure-ai-travel-agents** — Többügynökös MCP szervezési referenciaalkalmazás .NET, Python, Java és TypeScript szerverekkel
  - **azd-ai-starter** — Minimális Azure AI infrastruktúra Bicep kezdősablon
  - **🔗 Nagyszerű AZD AI galéria link** — Hivatkozás a [awesome-azd AI galériára](https://azure.github.io/awesome-azd/?tags=ai) (80+ sablon)

#### Javítva
- **🔗 agents.md navigáció**: A korábbi/következő linkek most megegyeznek a 2. fejezet README leckéinek sorrendjével (Microsoft Foundry Integration → Ügynökök → AI modell telepítés)
- **🔗 agents.md törött linkek**: A `production-ai-practices.md` javítva lett `../chapter-08-production/production-ai-practices.md`-re (3 előfordulás)
- **📦 agents.md elavult kód**: Az `opencensus` helyébe az `azure-monitor-opentelemetry` + OpenTelemetry SDK került
- **🐛 agents.md érvénytelen API**: Az `max_tokens` átkerült a `create_agent()`-ből a `create_run()`-ba mint `max_completion_tokens`
- **🔢 agents.md token számlálás**: A durva `len//4` becslést a `tiktoken.encoding_for_model()` váltotta fel
- **azure-search-openai-demo**: A szolgáltatásokat javítottuk „Cognitive Search + App Service”-ről „Azure AI Search + Azure Container Apps”-re (alapértelmezett host változás 2024 október)
- **contoso-chat**: A leírást frissítettük, hogy hivatkozzon az Azure AI Foundry + Prompty-ra, megfelelve a repó aktuális címének és technológiai stackjének

#### Eltávolítva
- **ai-document-processing**: Nem működő sablonhivatkozás eltávolítva (a repó nem nyilvánosan elérhető AZD sablonként)

#### Fejlesztve
- **📝 agents.md feladatok**: Az 1. feladat most megmutatja a várt kimenetet és az `azd monitor` lépést; a 2. feladat tartalmazza a teljes `FunctionTool` regisztrációs kódot; a 3. feladat általános útmutatást konkrét `prepdocs.py` parancsokra cseréli
- **📚 agents.md erőforrások**: Frissített dokumentációs linkek az aktuális Azure AI Agent Service dokumentációhoz és gyors kezdéshez
- **📋 agents.md Következő lépések táblázat**: AI Workshop Lab link hozzáadva a teljes fejezet lefedettséghez

#### Módosított fájlok
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
**Ez a verzió javítja a README.md fejezeti navigációját továbbfejlesztett táblázatos formátummal.**

#### Változott
- **Tanfolyam térkép táblázat**: Közvetlen leckelinkek, időtartam becslések és bonyolultsági besorolások hozzáadva
- **Mappa tisztítás**: Felesleges régi mappák eltávolítva (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link érvényesítés**: A Tanfolyam térkép táblázat több mint 21 belső linkje ellenőrizve

### [v3.16.0] - 2026-02-05

#### Termék neveinek frissítése
**Ez a verzió frissíti a termék hivatkozásokat az aktuális Microsoft márkára.**

#### Változott
- **Microsoft Foundry → Microsoft Foundry**: Minden hivatkozás frissítve nem fordítási fájlokban
- **Azure AI Agent Service → Foundry Agents**: Szolgáltatásnév frissítve az aktuális márka szerint

#### Módosított fájlok
- `README.md` - Fő tanfolyam kezdőlap
- `changelog.md` - Verziótörténet
- `course-outline.md` - Tanfolyam felépítés
- `docs/chapter-02-ai-development/agents.md` - AI ügynökök útmutató
- `examples/README.md` - Példák dokumentációja
- `workshop/README.md` - Workshop kezdőlap
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - Minden workshop utasítás fájl

---

### [v3.15.0] - 2026-02-05

#### Jelentős repozitórium átszervezés: fejezet-alapú mappanevek
**Ez a verzió átszervezi a dokumentációt dedikált fejezeti mappákba az átláthatóbb navigáció érdekében.**

#### Mappanevek átnevezése
Régi mappák helyett fejezet-számozott mappák:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Újként hozzáadva: `docs/chapter-05-multi-agent/`

#### Fájl áthelyezések
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
- **📚 Fejezeti README fájlok**: README.md létrehozva minden fejezeti mappában a következőkkel:
  - Tanulási célok és időtartam
  - Leckék táblázata leírásokkal
  - Gyorsindítás parancsok
  - Navigáció más fejezetekhez

#### Változott
- **🔗 Minden belső link frissítve**: Több mint 78 útvonal valamennyi dokumentációs fájlban
- **🗺️ Fő README.md**: Tanfolyam térkép frissítve az új fejezetstruktúrával
- **📝 examples/README.md**: Kereszthivatkozások frissítve a fejezeti mappák szerint

#### Eltávolítva
- Régi mappa struktúrák (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repozitórium átrendezés: fejezeti navigáció
**Ez a verzió fejezeti navigációs README fájlokat adott hozzá (a v3.15.0 verzió ezzel felváltva).**

---

### [v3.13.0] - 2026-02-05

#### Új AI ügynökök útmutató
**Ez a verzió átfogó útmutatót ad az AI ügynökök Azure Developer CLI-vel történő telepítéséhez.**

#### Hozzáadva
- **🤖 docs/microsoft-foundry/agents.md**: Teljes útmutató tartalommal:
  - Mi az az AI ügynök és hogyan különbözik a chatbottól
  - Három gyorsindítási ügynöksablon (Foundry Agents, Prompty, RAG)
  - Ügynök architektúra minták (egygazda, RAG, többügynökös)
  - Eszköz konfiguráció és testreszabás
  - Monitorozás és metrikakövetés
  - Költségszempontok és optimalizálás
  - Gyakori hibakeresési helyzetek
  - Három gyakorlati feladat sikerkritériumokkal

#### Tartalmi szerkezet
- **Bevezetés**: Ügynök koncepciók kezdőknek
- **Gyors kezdés**: Ügynökök telepítése `azd init --template get-started-with-ai-agents` paranccsal
- **Architektúra minták**: Vizualizált ügynök minták
- **Konfiguráció**: Eszköz beállítás és környezeti változók
- **Monitorozás**: Application Insights integráció
- **Feladatok**: Fokozatos, kézzel végzett tanulás (20-45 perc/gyakorlás)

---

### [v3.12.0] - 2026-02-05

#### DevContainer környezet frissítés
**Ez a verzió frissíti a fejlesztői konténer konfigurációt modern eszközökkel és jobb alapbeállításokkal az AZD tanulási élményhez.**

#### Változott
- **🐳 Alap kép**: Frissítve `python:3.12-bullseye`-ről `python:3.12-bookworm`-ra (legújabb stabil Debian)
- **📛 Konténer név**: „Python 3”-ról átnevezve „AZD kezdőknek”-re a világosság érdekében

#### Hozzáadva
- **🔧 Új Dev Container funkciók**:
  - `azure-cli` Bicep támogatással
  - `node:20` (Hosszú távú támogatás AZD sablonokhoz)
  - `github-cli` sablonkezeléshez
  - `docker-in-docker` konténeralkalmazás telepítésekhez

- **🔌 Port továbbítás**: Előre konfigurált portok a tipikus fejlesztéshez:
  - 8000 (MkDocs előnézet)
  - 3000 (Web alkalmazások)
  - 5000 (Python Flask)
  - 8080 (API-k)

- **🧩 Új VS Code bővítmények**:
  - `ms-python.vscode-pylance` - Javított Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions támogatás
  - `ms-azuretools.vscode-docker` - Docker támogatás
  - `ms-azuretools.vscode-bicep` - Bicep nyelvtámogatás
  - `ms-azure-devtools.azure-resource-groups` - Azure erőforráskezelés
  - `yzhang.markdown-all-in-one` - Markdown szerkesztés
  - `DavidAnson.vscode-markdownlint` - Markdown ellenőrzés
  - `bierner.markdown-mermaid` - Mermaid diagram támogatás
  - `redhat.vscode-yaml` - YAML támogatás (azure.yaml-hoz)
  - `eamodio.gitlens` - Git vizualizáció
  - `mhutchie.git-graph` - Git előzmények

- **⚙️ VS Code beállítások**: Alapértelmezett beállítások hozzáadva Python interpreterre, mentéskor formázásra és whitespace vágásra

- **📦 Updated requirements-dev.txt**:
  - MkDocs minify plugint hozzáadva
  - Pre-commit kódminőség eszközként hozzáadva
  - Azure SDK csomagok (azure-identity, azure-mgmt-resource) hozzáadva

#### Javítva
- **Poszt-létrehozási parancs**: Most ellenőrzi az AZD és Azure CLI telepítést a konténer indításakor

---

### [v3.11.0] - 2026-02-05

#### Kezdőknek szóló README átdolgozás
**Ez a verzió jelentősen javítja a README.md fájlt, hogy könnyebben érthető legyen kezdők számára, és hozzáad alapvető erőforrásokat AI fejlesztőknek.**

#### Hozzáadva
- **🆚 Azure CLI vs AZD összehasonlítás**: Egyértelmű magyarázat, mikor melyik eszközt használjuk gyakorlati példákkal
- **🌟 Nagyszerű AZD linkek**: Közvetlen hivatkozások a közösségi sablongalériára és hozzájárulási forrásokra:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Több mint 200 készen álló telepíthető sablon
  - [Sablon beküldése](https://github.com/Azure/awesome-azd/issues) - Közösségi hozzájárulás
- **🎯 Gyors kezdés útmutató**: Egyszerűsített, 3 lépéses kezdő szakasz (Telepítés → Bejelentkezés → Telepítés)
- **📊 Tapasztalati alapon navigáló táblázat**: Egyértelmű útmutatás, hogy az egyéni fejlesztői tapasztalat alapján hol érdemes kezdeni

#### Változott
- **README felépítés**: Átszervezve fokozatosan nyilvánossá téve a kulcsinformációkat először
- **Bevezető szakasz**: Újratervezve, hogy elmagyarázza „az `azd up` varázsát” teljesen kezdőknek
- **Ismétlődő tartalom eltávolítása**: Duplikált hibakeresési szakasz eltávolítva
- **Hibakeresési parancsok**: Javítva a `azd logs` hivatkozás, hogy a helyes `azd monitor --logs` álljon rendelkezésre

#### Javítva

- **🔐 Hitelesítési parancsok**: Hozzáadva `azd auth login` és `azd auth logout` a cheat-sheet.md fájlhoz
- **Érvénytelen parancs hivatkozások**: Eltávolítva a maradék `azd logs` a README hibakeresési szakaszából

#### Megjegyzések
- **Hatókör**: Változtatások főleg a fő README.md és a resources/cheat-sheet.md fájlokon
- **Célközönség**: Kifejezetten az AZD-vel még ismerkedő fejlesztők számára készült fejlesztések

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Parancspontosság Frissítés
**Ez a verzió javítja a nem létező AZD parancsokat a dokumentációban, biztosítva, hogy minden kódpélda érvényes Azure Developer CLI szintaxist használjon.**

#### Javítva
- **🔧 Nem létező AZD parancsok eltávolítva**: Átfogó ellenőrzés és javítás az érvénytelen parancsokkal kapcsolatban:
  - `azd logs` (nem létezik) → helyettesítve `azd monitor --logs` vagy Azure CLI alternatívákkal
  - `azd service` alparancsok (nem léteznek) → helyettesítve `azd show` és Azure CLI parancsokkal
  - `azd infra import/export/validate` (nem léteznek) → eltávolítva vagy érvényes alternatívákkal helyettesítve
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` zászlók (nem léteznek) → eltávolítva
  - `azd provision --what-if/--rollback` zászlók (nem léteznek) → frissítve a `--preview` használatára
  - `azd config validate` (nem létezik) → helyettesítve `azd config list`-tel
  - `azd info`, `azd history`, `azd metrics` (nem léteznek) → eltávolítva

- **📚 Parancsjavításokat tartalmazó frissített fájlok**:
  - `resources/cheat-sheet.md`: Teljes parancshivatkozás átdolgozás
  - `docs/deployment/deployment-guide.md`: Visszagörgetési és telepítési stratégiák javítása
  - `docs/troubleshooting/debugging.md`: Napló elemzési szakaszok javítása
  - `docs/troubleshooting/common-issues.md`: Hibakeresési parancsok frissítése
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD hibakeresési rész javítása
  - `docs/getting-started/azd-basics.md`: Monitorozási parancsok javítása
  - `docs/getting-started/first-project.md`: Monitorozási és hibakeresési példák frissítése
  - `docs/getting-started/installation.md`: Segítség és verzió példák javítása
  - `docs/pre-deployment/application-insights.md`: Napló megtekintési parancsok javítása
  - `docs/pre-deployment/coordination-patterns.md`: Ügynök hibakeresési parancsok javítása

- **📝 Verzió referenciák frissítve**: 
  - `docs/getting-started/installation.md`: A keménykódolt `1.5.0` verziót általános `1.x.x` verzióra cserélve, linkkel a kiadásokhoz

#### Módosítva
- **Visszagörgetési stratégiák**: Dokumentáció frissítve Git alapú visszagörgetés használatára (AZD nem rendelkezik natív visszagörgetési funkcióval)
- **Napló megtekintése**: `azd logs` hivatkozások helyett `azd monitor --logs`, `azd monitor --live`, és Azure CLI parancsok kerültek használatra
- **Teljesítmény szakasz**: Nem létező párhuzamos/incrementális telepítési zászlók eltávolítva, érvényes alternatívák megadva

#### Műszaki részletek
- **Érvényes AZD parancsok**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Érvényes azd monitor zászlók**: `--live`, `--logs`, `--overview`
- **Eltávolított funkciók**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Megjegyzések
- **Ellenőrzés**: Parancsok validálva az Azure Developer CLI v1.23.x verzióval

---

### [v3.9.0] - 2026-02-05

#### Műhely Befejezése és Dokumentációs Minőség Frissítése
**Ez a verzió befejezi az interaktív műhely modulokat, kijavítja az összes törött dokumentációs linket, és javítja az általános tartalom minőségét az AI fejlesztők számára, akik a Microsoft AZD-t használják.**

#### Hozzáadva
- **📝 CONTRIBUTING.md**: Új közreműködési szabályzat dokumentum:
  - Egyértelmű utasítások hibajelentéshez és módosítási javaslatokhoz
  - Dokumentációs szabványok új tartalomhoz
  - Kódpélda irányelvek és commit üzenet konvenciók
  - Közösségi elkötelezettség információk

#### Befejezve
- **🎯 Műhely Modul 7 (Zárás)**: Teljesen befejezett záró modul:
  - Átfogó összefoglaló a műhely eredményeiről
  - Főbb fogalmak szekció AZD-ről, sablonokról, és Microsoft Foundry-ről
  - Ajánlások a további tanulási útvonalhoz
  - Műhely kihívás gyakorlatai nehézségi besorolással
  - Közösségi visszajelzések és támogatási linkek

- **📚 Műhely Modul 3 (Elemzés)**: Frissített tanulási célok:
  - GitHub Copilot MCP szerverek aktiválási útmutatóval
  - AZD sablon mappaszerkezet megértése
  - Infrastruktúra-kód (Bicep) szervezési minták
  - Gyakorlati labor utasítások

- **🔧 Műhely Modul 6 (Bontás)**: Befejezve a következőkkel:
  - Erőforrás takarítás és költségmenedzsment célok
  - `azd down` használata biztonságos infrastruktúra leszereléshez
  - Lágy törlésű kognitív szolgáltatások helyreállítása
  - Extra felfedező feladatok GitHub Copilot és Azure Portal számára

#### Javítva
- **🔗 Tört link javítások**: Több mint 15 belső dokumentációs link javítva:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md elérési utak javítása
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md és production-ai-practices.md elérési utak javítása
  - `docs/getting-started/first-project.md`: Nem létező cicd-integration.md helyett deployment-guide.md használata
  - `examples/retail-scenario.md`: GYIK és hibakeresési útmutató elérési utak javítva
  - `examples/container-app/microservices/README.md`: Tanfolyam főoldal és telepítési útmutató elérési utak javítása
  - `resources/faq.md` és `resources/glossary.md`: AI fejezet hivatkozások frissítve
  - `course-outline.md`: Oktatói útmutató és AI műhely labor hivatkozások javítása

- **📅 Műhely státusz banner**: Frissítve "Építés alatt" állapotról aktív műhely státuszra 2026 február dátummal

- **🔗 Műhely navigáció**: Törött navigációs linkek javítva a műhely README.md-ben, amelyek nem létező lab-1-azd-basics mappára mutattak

#### Módosítva
- **Műhely bemutató**: Eltávolítva az "építés alatt áll" figyelmeztetés, a műhely most teljes és használatra kész
- **Navigációs konzisztencia**: Biztosított minden műhely modulban a megfelelő modulok közötti navigáció
- **Tanulási útvonal hivatkozások**: Frissítve a fejezeti kereszthivatkozások a megfelelő microsoft-foundry elérési utakra

#### Validálva
- ✅ Minden angol nyelvű markdown fájl érvényes belső hivatkozásokkal rendelkezik
- ✅ A műhely modulok 0-7 teljesek, és tartalmazzák a tanulási célokat
- ✅ Fejezetek és modulok közötti navigáció megfelelően működik
- ✅ A tartalom megfelel az AI fejlesztők igényeinek, akik Microsoft AZD-t használnak
- ✅ Kezdőbarát nyelvezet és szerkezet fenntartva az egész dokumentumban
- ✅ CONTRIBUTING.md világos útmutatást ad a közösségi közreműködőknek

#### Műszaki megvalósítás
- **Link ellenőrzés**: Automatikus PowerShell szkript ellenőrizte az összes .md fájl belső hivatkozását
- **Tartalom átvizsgálás**: Kézi revízió a műhely teljességének és kezdőbarátságának vizsgálatára
- **Navigációs rendszer**: Konzisztens fejezet- és modul navigációs minták alkalmazva

#### Megjegyzések
- **Hatókör**: Változtatások kizárólag az angol dokumentációra vonatkoznak
- **Fordítások**: Fordítási mappák nem frissültek ebben a verzióban (automatikus fordítás később szinkronizálva lesz)
- **Műhely időtartama**: Mostantól a teljes műhely 3-4 órányi gyakorlati tanulást biztosít

---

### [v3.8.0] - 2025-11-19

#### Haladó dokumentáció: Monitorozás, Biztonság és Többügynökös minták
**Ez a verzió átfogó A-minősítésű leckéket tartalmaz az Application Insights integráció, hitelesítési minták, és többügynökös koordináció témakörében a termelési telepítésekhez.**

#### Hozzáadva
- **📊 Application Insights integrációs lecke**: a `docs/pre-deployment/application-insights.md` fájlban:
  - AZD-központú telepítés automatikus előkészítéssel
  - Teljes Bicep sablonok az Application Insights + Log Analytics számára
  - Működő Python alkalmazások egyéni telemetriával (1,200+ sor)
  - AI/LLM monitorozási minták (Microsoft Foundry modellek token/költség nyomon követése)
  - 6 Mermaid diagram (architektúra, elosztott követés, telemetria folyam)
  - 3 gyakorlati feladat (riasztások, dashboardok, AI monitorozás)
  - Kusto lekérdezés példák és költségoptimalizálási stratégiák
  - Élő metrikák streaming és valós idejű hibakeresés
  - 40-50 perces tanulási idő produkcióra kész mintákkal

- **🔐 Hitelesítési és biztonsági minták lecke**: a `docs/getting-started/authsecurity.md` fájlban:
  - 3 hitelesítési minta (kapcsolati stringek, Key Vault, kezelt identitás)
  - Teljes Bicep infrastruktúra sablonok biztonságos telepítésekhez
  - Node.js alkalmazás kód Azure SDK integrációval
  - 3 teljes feladat (kezelő identitás engedélyezése, felhasználó-hozzárendelt identitás, Key Vault forgatás)
  - Biztonsági bevált gyakorlatok és RBAC konfigurációk
  - Hibakeresési útmutató és költségelemzés
  - Üzemkész jelszó nélküli hitelesítési minták

- **🤖 Többügynökös koordinációs minták lecke**: a `docs/pre-deployment/coordination-patterns.md` fájlban:
  - 5 koordinációs minta (szekvenciális, párhuzamos, hierarchikus, eseményvezérelt, konszenzus)
  - Teljes orchestrator szolgáltatás megvalósítás (Python/Flask, 1,500+ sor)
  - 3 speciális ügynök megvalósítás (Kutató, Író, Szerkesztő)
  - Service Bus integráció üzenet sorba állításhoz
  - Cosmos DB állapotkezelés elosztott rendszerekhez
  - 6 Mermaid diagram az ügynöki interakciókról
  - 3 haladó feladat (időkorlát kezelése, ismétlési logika, kapcsoló megszakító)
  - Költség bontás (240-565 USD/hó) optimalizálási stratégiákkal
  - Application Insights integráció monitorozáshoz

#### Fejlesztve
- **Pre-deployment fejezet**: Mostantól átfogó monitorozási és koordinációs mintákat tartalmaz
- **Első lépések fejezet**: Profibb hitelesítési mintákkal bővítve
- **Termelési készültség**: Teljes lefedettség a biztonságtól az megfigyelhetőségig
- **Tanfolyam vázlat**: Frissítve az új leckék hivatkozásával a 3. és 6. fejezetekben

#### Módosítva
- **Tanulási folyamat**: Jobb integráció biztonság és monitorozás terén az egész tanfolyamon
- **Dokumentáció minőség**: Következetes A-minőségű szabványok (95-97%) az új leckék között
- **Termelési minták**: Teljes körű végpontok közötti lefedettség vállalati telepítésekhez

#### Javítva
- **Fejlesztői élmény**: Egyértelmű út a fejlesztéstől a termelési monitorozásig
- **Biztonsági szabványok**: Professzionális minták hitelesítéshez és titkok kezeléséhez
- **Megfigyelhetőség**: Teljes Application Insights integráció az AZD-vel
- **AI munkaterhelések**: Speciális monitorozás Microsoft Foundry modellekhez és többügynökös rendszerekhez

#### Validálva
- ✅ Minden lecke teljes működő kódot tartalmaz (nem csak töredékeket)
- ✅ Mermaid diagramok a vizuális tanuláshoz (összesen 19 három leckében)
- ✅ Gyakorlati feladatok ellenőrzési lépésekkel (összesen 9)
- ✅ Üzemkész Bicep sablonok telepíthetők `azd up` paranccsal
- ✅ Költséganalízis és optimalizációs stratégiák
- ✅ Hibakeresési útmutatók és bevált gyakorlatok
- ✅ Tudásellenőrző pontok ellenőrző parancsokkal

#### Dokumentáció Értékelési Eredmények
- **docs/pre-deployment/application-insights.md**: - Átfogó monitorozási útmutató
- **docs/getting-started/authsecurity.md**: - Professzionális biztonsági minták
- **docs/pre-deployment/coordination-patterns.md**: - Haladó többügynökös architektúrák
- **Összes új tartalom**: - Következetes, magas minőségi szabványok

#### Műszaki megvalósítás
- **Application Insights**: Log Analytics + egyéni telemetria + elosztott követés
- **Hitelesítés**: Kezelt identitás + Key Vault + RBAC minták
- **Többügynökös**: Service Bus + Cosmos DB + Konténer Alkalmazások + orchestration
- **Monitorozás**: Élő metrikák + Kusto lekérdezések + riasztások + dashboardok
- **Költség menedzsment**: Mintavételezési stratégiák, megtartási szabályok, költségvetési kontrollok

### [v3.7.0] - 2025-11-19

#### Dokumentációs minőségjavítások és új Microsoft Foundry Modellek példa
**Ez a verzió javítja a dokumentáció minőségét az egész tárolóban, és hozzáad egy teljes Microsoft Foundry Modellek telepítési példát gpt-4.1 chat felülettel.**

#### Hozzáadva
- **🤖 Microsoft Foundry Modellek Chat példa**: Teljes gpt-4.1 telepítés működő implementációval az `examples/azure-openai-chat/` könyvtárban:
  - Teljes Microsoft Foundry Modellek infrastruktúra (gpt-4.1 modell telepítés)
  - Python parancssoros chat felület beszélgetési előzményekkel
  - Key Vault integráció biztonságos API kulcs tároláshoz
  - Token használat nyomon követés és költségbecslés
  - Sebességkorlátozás és hibakezelés
  - Átfogó README 35-45 perces telepítési útmutatóval
  - 11 termelésre kész fájl (Bicep sablonok, Python alkalmazás, konfiguráció)
- **📚 Dokumentációs gyakorlatok**: Gyakorlati feladatok hozzáadva a konfigurációs útmutatóhoz:
  - 1. gyakorlat: Több környezeti konfiguráció (15 perc)
  - 2. gyakorlat: Titokkezelési gyakorlat (10 perc)
  - Egyértelmű siker kritériumok és ellenőrzési lépések
- **✅ Telepítés ellenőrzése**: Ellenőrzési szakasz hozzáadva a telepítési útmutatóhoz:
  - Egészségellenőrzési eljárások
  - Siker kritérium lista
  - Várt kimenetek minden telepítési parancshoz
  - Gyors hibakeresési hivatkozás

#### Fejlesztve
- **examples/README.md**: Frissítve A-mínőségre (93%):
  - Hozzáadva azure-openai-chat minden érintett részhez
  - Helyi példák száma 3-ról 4-re növelve
  - Hozzáadva az AI Alkalmazás Példák táblázathoz
  - Integrálva a középhaladó gyors kezdésbe
  - Hozzáadva a Microsoft Foundry Sablonok szekcióhoz
  - Frissítve az Összehasonlító Mátrix és technológiai talált szakaszok
- **Dokumentáció minőség**: Fejlesztve B+ (87%) → A- (92%) a docs mappában:

  - Hozzáadott várható kimenetek kritikus parancspéldákhoz
  - Konfigurációs változások ellenőrzési lépéseinek bevonása
  - Gyakorlati feladatokkal gazdagított kézzelfogható tanulás

#### Megváltozott
- **Tanulási haladás**: Jobb AI példák integrációja középhaladó tanulók számára
- **Dokumentációs szerkezet**: Több cselekvőképes gyakorlat egyértelmű eredményekkel
- **Ellenőrzési folyamat**: Egyértelmű sikerkritériumok hozzáadva kulcsfontosságú munkafolyamatokhoz

#### Fejlesztett
- **Fejlesztői élmény**: Microsoft Foundry Modellek telepítése most 35-45 percet vesz igénybe (összetett alternatívák esetén 60-90 perc helyett)
- **Költségátláthatóság**: Tiszta költségbecslések ($50-200/hó) a Microsoft Foundry Modellek példához
- **Tanulási útvonal**: AI fejlesztőknek egyértelmű belépési pont az azure-openai-chat segítségével
- **Dokumentációs szabványok**: Következetes várt kimenetek és ellenőrzési lépések

#### Ellenőrzött
- ✅ A Microsoft Foundry Modellek példa teljesen működőképes az `azd up` használatával
- ✅ Mind a 11 implementációs fájl szintaxisilag helyes
- ✅ A README utasítások megfelelnek a tényleges telepítési tapasztalatnak
- ✅ Dokumentációs hivatkozások frissítve több mint 8 helyen
- ✅ A példák indexe pontosan tükrözi a 4 helyi példát
- ✅ Nincs ismétlődő külső hivatkozás a táblázatokban
- ✅ Minden navigációs hivatkozás helyes

#### Műszaki megvalósítás
- **Microsoft Foundry Modellek architektúrája**: gpt-4.1 + Key Vault + Container Apps minta
- **Biztonság**: Kezelt identitásra készen, titkok a Key Vaultban
- **Monitorozás**: Alkalmazásfigyelés integrációja
- **Költséggazdálkodás**: Token követés és használat optimalizálás
- **Telepítés**: Egyetlen `azd up` parancs a teljes beállításhoz

### [v3.6.0] - 2025-11-19

#### Nagy frissítés: Container App telepítési példák
**Ez a verzió átfogó, éles használatra kész, konténeralkalmazás-telepítési példákat vezet be Azure Developer CLI (AZD) használatával, teljes dokumentációval és integrációval a tanulási útvonalba.**

#### Hozzáadva
- **🚀 Container App példák**: Új helyi példák a `examples/container-app/` mappában:
  - [Mester Útmutató](examples/container-app/README.md): Teljes áttekintés a konténerizált telepítésekről, gyors kezdés, éles és haladó minták
  - [Egyszerű Flask API](../../examples/container-app/simple-flask-api): Kezdőknek szánt REST API skálázással nullára, egészségügyi próbak, monitorozás és hibakeresés
  - [Mikroszolgáltatás architektúra](../../examples/container-app/microservices): Éles használatra kész több szolgáltatás integráció (API Gateway, Product, Order, User, Notification), aszinkron üzenetküldés, Service Bus, Cosmos DB, Azure SQL, elosztott nyomkövetés, blue-green/canary telepítés
- **Legjobb gyakorlatok**: Biztonság, monitorozás, költségoptimalizáció, és CI/CD útmutató konténerizált munkaterhelésekhez
- **Kód példák**: Teljes `azure.yaml`, Bicep sablonok és többnyelvű szolgáltatásmegvalósítások (Python, Node.js, C#, Go)
- **Tesztelés és hibakeresés**: End-to-end tesztesetek, monitorozási parancsok, hibakeresési útmutató

#### Megváltozott
- **README.md**: Frissítve, hogy bemutassa és linkelje az új konténeralkalmazás példákat a "Helyi példák - Konténer alkalmazások" alatt
- **examples/README.md**: Frissítve az új konténerapp példák kiemeléséhez, összehasonlító mátrix bejegyzések hozzáadásához, és technológia/architektúra hivatkozások frissítéséhez
- **Tananyag vázlat & tanulmányi útmutató**: Frissítve az új konténerapp példák és telepítési minták hivatkozásával a releváns fejezetekben

#### Ellenőrzött
- ✅ Minden új példa telepíthető az `azd up` segítségével, és követi a legjobb gyakorlatokat
- ✅ Dokumentációs kereszthivatkozások és navigáció frissítve
- ✅ A példák lefedik a kezdőtől a haladó szintig terjedő forgatókönyveket, beleértve az éles mikroszolgáltatásokat is

#### Megjegyzések
- **Hatókör**: Csak angol nyelvű dokumentáció és példák
- **Következő lépések**: Kiterjesztés további haladó konténer mintákkal és CI/CD automatizálással a jövőbeli kiadásokban

### [v3.5.0] - 2025-11-19

#### Termék újramárkázás: Microsoft Foundry
**Ez a verzió átfogó terméknév váltást hajt végre az "Microsoft Foundry"-ra az összes angol dokumentációban, tükrözve a Microsoft hivatalos újramárkázását.**

#### Megváltozott
- **🔄 Terméknév frissítés**: Teljes újramárkázás az "Microsoft Foundry" névre
  - Minden hivatkozás frissítve az angol dokumentációkban a `docs/` mappában
  - Mappa átnevezve: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Fájl átnevezve: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Összesen 23 tartalmi hivatkozás frissítve 7 dokumentációs fájlban

- **📁 Mappaszerkezet változások**:
  - `docs/ai-foundry/` átnevezve `docs/microsoft-foundry/`-re
  - Minden kereszthivatkozás frissítve az új mappastruktúrának megfelelően
  - Navigációs linkek validálva az összes dokumentációban

- **📄 Fájlnevek átnevezése**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Minden belső link frissítve az új fájlnévre

#### Frissített fájlok
- **Fejezet dokumentációk** (7 fájl):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigációs link frissítés
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 terméknév hivatkozás frissítés
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Már Microsoft Foundryt használ (korábbi frissítésekből)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 hivatkozás frissítve (áttekintés, közösségi visszajelzés, dokumentáció)
  - `docs/getting-started/azd-basics.md` - 4 kereszthivatkozás frissítés
  - `docs/getting-started/first-project.md` - 2 fejezeti navigációs link frissítés
  - `docs/getting-started/installation.md` - 2 következő fejezet link frissítés
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 hivatkozás frissítés (navigáció, Discord közösség)
  - `docs/troubleshooting/common-issues.md` - 1 navigációs link frissítés
  - `docs/troubleshooting/debugging.md` - 1 navigációs link frissítés

- **Tananyag szerkezeti fájlok** (2 fájl):
  - `README.md` - 17 hivatkozás frissítve (tanfolyam áttekintés, fejezetcímek, sablonok szekció, közösségi vélemények)
  - `course-outline.md` - 14 hivatkozás frissítve (áttekintés, tanulási célok, fejezetforrások)

#### Ellenőrzött
- ✅ Nincs maradék "ai-foundry" mappahivatkozás az angol dokumentációkban
- ✅ Nincs maradék "Microsoft Foundry" terméknév hivatkozás az angol dokumentációkban
- ✅ Minden navigációs link működik az új mappastruktúrával
- ✅ Fájl- és mappanevek átnevezése sikeresen megtörtént
- ✅ Fejezetek közötti kereszthivatkozások validálva

#### Megjegyzések
- **Hatókör**: Csak az angol nyelvű dokumentációra a `docs/` mappán belül alkalmazva
- **Fordítások**: Fordítási mappák (`translations/`) nincsenek frissítve ebben a kiadásban
- **Workshop**: Workshop anyagok (`workshop/`) nincsenek frissítve ebben a verzióban
- **Példák**: A példa fájlok még tartalmazhatnak régi neveket (ezt jövőbeli frissítés fogja kezelni)
- **Külső linkek**: Külső URL-ek és GitHub tárház hivatkozások változatlanok maradnak

#### Migrációs útmutató közreműködőknek
Ha helyi ágai vagy dokumentációi hivatkoznak a régi struktúrára:
1. Frissítse a mappahivatkozásokat: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Frissítse a fájl hivatkozásokat: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Cserélje a termék nevét: "Microsoft Foundry" → "Microsoft Foundry"
4. Ellenőrizze, hogy minden belső dokumentációs link továbbra is működik

---

### [v3.4.0] - 2025-10-24

#### Infrastruktúra előnézet és érvényesítés fejlesztések
**Ez a verzió átfogó támogatást vezet be az új Azure Developer CLI előnézeti funkcióhoz, továbbá javítja a workshop felhasználói élményét.**

#### Hozzáadva
- **🧪 azd provision --preview funkció dokumentáció**: Részletes lefedettség az új infrastruktúra előnézeti képességhez
  - Parancs referencia és használati példák a csalólapon
  - Részletes integráció a telepítési útmutatóban esetpéldákkal és előnyökkel
  - Bevezető ellenőrzés integrációja a biztonságosabb telepítéshez
  - Kezdő útmutató frissítése biztonsági szemléletű telepítési gyakorlatokkal
- **🚧 Workshop állapot banner**: Professzionális HTML banner jelzi a workshop fejlesztési státuszát
  - Színátmenetes dizájn építkezési indikátorokkal a tiszta felhasználói kommunikációért
  - Utolsó frissítés időbélyeg a transzparencia érdekében
  - Mobilbarát kialakítás minden eszköztípusra

#### Fejlesztett
- **Infrastruktúra biztonság**: Az előnézeti funkció beépítve a telepítési dokumentációkba
- **Előzetes telepítési ellenőrzés**: Automatikus szkriptek most tartalmazzák az infrastruktúra előnézeti tesztelést
- **Fejlesztői munkafolyamat**: A parancs sorozatok frissítve az előnézet befogadásával, mint legjobb gyakorlat
- **Workshop élmény**: Egyértelmű tartalomfejlesztési státusz kommunikálva a felhasználóknak

#### Megváltozott
- **Telepítési legjobb gyakorlatok**: Előnézet első munkafolyamat most ajánlott megközelítés
- **Dokumentációs áramlás**: Infrastruktúra érvényesítés a tanulás korábbi szakaszaiba áthelyezve
- **Workshop bemutatás**: Professzionális státusz kommunikáció egyértelmű fejlesztési ütemtervvel

#### Fejlesztett
- **Biztonság-központú megközelítés**: Az infrastruktúra változásai most már telepítés előtt érvényesíthetők
- **Csapat együttműködés**: Az előnézeti eredmények megoszthatók felülvizsgálatra és jóváhagyásra
- **Költségtudatosság**: Erőforrás költségek jobb megértése a provisioning előtt
- **Kockázatcsökkentés**: Csökkentett telepítési hibák előzetes érvényesítéssel

#### Műszaki megvalósítás
- **Több dokumentumos integráció**: Előnézeti funkció dokumentálva 4 kulcsfontosságú fájlban
- **Parancs minták**: Következetes szintaxis és példák az egész dokumentációban
- **Legjobb gyakorlat integráció**: Előnézet beépítve az érvényesítési munkafolyamatokba és szkriptekbe
- **Vizuális jelzők**: Egyértelmű ÚJ funkció jelölések a jobb felismerhetőségért

#### Workshop infrastruktúra
- **Státusz kommunikáció**: Professzionális HTML banner színátmenetes stílusban
- **Felhasználói élmény**: Egyértelmű fejlesztési státusz megakadályozza a félreértéseket
- **Professzionális bemutatás**: Megőrzi a tárház hitelességét miközben elvárásokat állít
- **Átlátható idővonal**: 2025 októberi utolsó frissítés időbélyeg az elszámoltathatóságért

### [v3.3.0] - 2025-09-24

#### Fejlesztett workshop anyagok és interaktív tanulási élmény
**Ez a verzió átfogó workshop anyagokat vezet be böngésző-alapú interaktív útmutatókkal és strukturált tanulási útvonalakkal.**

#### Hozzáadva
- **🎥 Interaktív workshop útmutató**: Böngésző alapú workshop élmény MkDocs előnézeti képességgel
- **📝 Strukturált workshop utasítások**: 7 lépéses vezetett tanulási útvonal a felfedezéstől a testreszabásig
  - 0-Bevezetés: Workshop áttekintés és beállítás
  - 1-AI sablon kiválasztása: Sablonfelfedezés és kiválasztási folyamat
  - 2-AI sablon érvényesítése: Telepítési és validációs eljárások
  - 3-AI sablon elemzése: A sablon architektúrájának megértése
  - 4-AI sablon konfigurálása: Beállítások és testreszabás
  - 5-AI sablon testreszabása: Haladó módosítások és iterációk
  - 6-Infrastruktúra lebontása: Takarítás és erőforrás menedzsment
  - 7-Összefoglalás: Összegzés és további lépések
- **🛠️ Workshop eszköztár**: MkDocs konfiguráció Material témával a fejlesztett tanulási élményért
- **🎯 Kézzelfogható tanulási útvonal**: 3 lépéses módszertan (Felfedezés → Telepítés → Testreszabás)
- **📱 GitHub Codespaces integráció**: Zökkenőmentes fejlesztési környezet beállítás

#### Fejlesztett
- **AI workshop labor**: Kiterjesztve átfogó, 2-3 órás strukturált tanulási élménnyel
- **Workshop dokumentáció**: Professzionális bemutatás navigációval és vizuális segédletekkel
- **Tanulási haladás**: Egyértelmű lépésről lépésre útmutatás a sablonválasztástól az éles telepítésig
- **Fejlesztői élmény**: Integrált eszköztár az egyszerűbb fejlesztési munkafolyamatokhoz

#### Fejlesztett
- **Elérhetőség**: Böngésző alapú felület kereséssel, másolás funkcióval, és téma váltóval
- **Önálló tanulás**: Rugalmas workshop struktúra, amely alkalmazkodik a különböző tanulási tempókhoz
- **Gyakorlati alkalmazás**: Valós AI sablon telepítési forgatókönyvek
- **Közösségi integráció**: Discord integráció a workshop támogatásához és együttműködéshez

#### Workshop funkciók
- **Beépített kereső**: Gyors kulcsszó és tananyag keresés
- **Kódblokk másolás**: Ugrásra másolás funkció minden kód példánál
- **Téma váltó**: Sötét/világos mód támogatás különböző preferenciákhoz
- **Vizuális segédletek**: Képernyőképek és diagramok a jobb megértésért
- **Segítség integráció**: Közvetlen Discord hozzáférés közösségi támogatáshoz

### [v3.2.0] - 2025-09-17

#### Jelentős navigációs átrendezés és fejezet-alapú tanulási rendszer
**Ez a verzió átfogó fejezet-alapú tanulási struktúrát vezet be fokozott navigációval az egész tárházban.**

#### Hozzáadva
- **📚 Fejezet-alapú tanulási rendszer**: Egész tanfolyam átszervezése 8 progresszív tanulási fejezetre
  - 1. fejezet: Alapok & Gyors kezdés (⭐ - 30-45 perc)
  - 2. fejezet: AI-Központú fejlesztés (⭐⭐ - 1-2 óra)
  - 3. fejezet: Konfiguráció & hitelesítés (⭐⭐ - 45-60 perc)
  - 4. fejezet: Infrastruktúra kódként & telepítés (⭐⭐⭐ - 1-1,5 óra)
  - 5. fejezet: Több-ügynök AI megoldások (⭐⭐⭐⭐ - 2-3 óra)
  - 6. fejezet: Előzetes telepítési érvényesítés & tervezés (⭐⭐ - 1 óra)
  - 7. fejezet: Hibakeresés & Debug (⭐⭐ - 1-1,5 óra)
  - 8. fejezet: Éles & vállalati minták (⭐⭐⭐⭐ - 2-3 óra)
- **📚 Átfogó navigációs rendszer**: Következetes navigációs fejlécek és láblécek az összes dokumentációnál
- **🎯 Haladás követése**: Tanfolyam teljesítési ellenőrzőlista és tanulás érvényesítési rendszer
- **🗺️ Tanulási útmutatás**: Egyértelmű belépési pontok különböző tapasztalati szintekhez és célokhoz
- **🔗 Kereszthivatkozás navigáció**: Kapcsolódó fejezetek és előfeltételek egyértelmű összekapcsolása

#### Fejlesztett
- **README szerkezet**: Átalakítva strukturált tanulási platformmá fejezet alapú szervezéssel
- **Dokumentáció navigáció**: Minden oldal most fejezeti kontextust és haladási útmutatást tartalmaz
- **Sablonok szervezése**: Példák és sablonok hozzárendelve a megfelelő tanulási fejezetekhez

- **Erőforrás integráció**: Csalólapok, GYIK és tanulmányi útmutatók kapcsolódnak a releváns fejezetekhez
- **Műhelyintegráció**: Gyakorlati laborok több fejezet tanulási céljaihoz igazítva

#### Megváltozott
- **Tanulási előrehaladás**: Lineáris dokumentációról rugalmas, fejezetalapú tanulásra váltás
- **Konfiguráció elhelyezése**: A konfigurációs útmutató a jobb tanulási folyamat érdekében a 3. fejezetbe került
- **MI-tartalom integrációja**: Jobb integráció az MI-specifikus tartalmaknál a tanulási folyamat során
- **Produkciós tartalom**: Fejlett minták az 8. fejezetben egyes vállalati tanulóknak

#### Javított
- **Felhasználói élmény**: Világos navigációs morzsák és fejezeti előrehaladásjelzők
- **Elérhetőség**: Következetes navigációs minták a tanfolyam könnyebb bejárásához
- **Professzionális megjelenés**: Egyetemi stílusú tanfolyamstruktúra alkalmas akadémiai és vállalati képzésekhez
- **Tanulási hatékonyság**: Csökkent idő a releváns tartalom megtalálására a jobb szervezés révén

#### Műszaki megvalósítás
- **Navigációs fejléc**: Standardizált fejezeti navigáció több mint 40 dokumentációs fájlban
- **Lábléc navigáció**: Következetes előrehaladási útmutatás és fejezetlezárási jelzők
- **Keresztlinkelés**: Átfogó belső hivatkozási rendszer a kapcsolódó fogalmak összekapcsolására
- **Fejezeti térképezés**: Sablonok és példák egyértelműen tanulási célokhoz kötve

#### Tanulmányi útmutató fejlesztése
- **📚 Átfogó tanulási célok**: Átalakított tanulmányi útmutató a 8 fejezetes rendszerhez igazítva
- **🎯 Fejezetalapú értékelés**: Minden fejezet tartalmaz konkrét tanulási célokat és gyakorlati feladatokat
- **📋 Előrehaladás követése**: Heti tanulási ütemterv mérhető eredményekkel és teljesítési ellenőrzőlistákkal
- **❓ Értékelő kérdések**: Tudásellenőrző kérdések minden fejezethez szakmai eredményekkel
- **🛠️ Gyakorlati feladatok**: Gyakorlati tevékenységek valódi telepítési forgatókönyvekkel és hibakereséssel
- **📊 Készségfejlődés**: Világos előrehaladás az alapvető fogalmaktól a vállalati mintákig karrierfejlesztési fókusz mellett
- **🎓 Tanúsító keretrendszer**: Szakmai fejlődési eredmények és közösségi elismerési rendszer
- **⏱️ Időmenedzsment**: Strukturált 10 hetes tanulási terv mérföldkő-ellenőrzéssel

### [v3.1.0] - 2025-09-17

#### Fejlesztett többügynökös MI-megoldások
**Ez a verzió javítja a többügynökös kiskereskedelmi megoldást jobb ügynöknevezéssel és fejlettebb dokumentációval.**

#### Megváltozott
- **Többügynökös terminológia**: A „Cora ügynök” helyett „Ügyfél ügynök” kifejezés a kiskereskedelmi többügynökös megoldásban a könnyebb megértés érdekében
- **Ügynök architektúra**: Minden dokumentáció, ARM sablon és kódpélda a következetes „Ügyfél ügynök” névhasználat szerint frissítve
- **Konfigurációs példák**: Modernizált ügynök konfigurációs minták frissített névkonvenciókkal
- **Dokumentációs következetesség**: Minden hivatkozás szakmailag, egyértelműen leíró ügynökneveket használ

#### Fejlesztett
- **ARM sablon csomag**: retail-multiagent-arm-template frissítve Ügyfél ügynök hivatkozásokkal
- **Architektúra diagramok**: Frissített Mermaid diagramok a javított ügynöknevezésekkel
- **Kódpéldák**: Python osztályok és megvalósítási példák most ÜgyfélÜgynök (CustomerAgent) névvel
- **Környezeti változók**: Minden telepítési szkript frissítve, hogy CUSTOMER_AGENT_NAME konvenciókat használjon

#### Javított
- **Fejlesztői élmény**: Világosabb ügynök szerepek és felelősségek a dokumentációban
- **Produkcióra készség**: Jobb illeszkedés a vállalati névkonvenciókhoz
- **Tananyagok**: Intuitívabb ügynöknevezés az oktatási célokra
- **Sablon használhatóság**: Egyszerűbb megértés az ügynök funkcióiról és telepítési mintáiról

#### Műszaki részletek
- Frissített Mermaid architektúra diagramok CustomerAgent hivatkozásokkal
- CoraAgent osztálynevek lecserélve CustomerAgent nevére Python példákban
- ARM sablon JSON konfigurációk módosítva, hogy „customer” típusú ügynököt használjanak
- Környezeti változók frissítve a CORA_AGENT_* mintákról CUSTOMER_AGENT_* mintákra
- Minden telepítési parancs és konténer konfiguráció frissítve

### [v3.0.0] - 2025-09-12

#### Jelentős változások - MI fejlesztői fókusz és Microsoft Foundry integráció
**Ez a verzió átalakítja a tárházat átfogó MI-központú tanulási forrássá Microsoft Foundry integrációval.**

#### Hozzáadva
- **🤖 MI-első tanulási útvonal**: Teljes átszervezés a MI fejlesztők és mérnökök prioritásával
- **Microsoft Foundry integrációs útmutató**: Átfogó dokumentáció az AZD és Microsoft Foundry szolgáltatások összekapcsolására
- **MI modell telepítési minták**: Részletes útmutató a modell kiválasztásához, konfigurációjához és produkciós telepítéséhez
- **MI gyakorlat műhely**: 2-3 órás gyakorlati műhely az MI alkalmazások AZD telepíthető megoldássá alakítására
- **Termelési MI legjobb gyakorlatok**: Vállalati szintű minták MI munkaterhelések skálázásához, monitorozásához és biztosításához
- **MI-specifikus hibakeresési útmutató**: Átfogó hibaelhárítás Microsoft Foundry modellekhez, Kognitív szolgáltatásokhoz és MI telepítési problémákhoz
- **MI sablongyűjtemény**: Kiemelt Microsoft Foundry sablon gyűjtemény komplexitás besorolással
- **Műhely anyagok**: Teljes műhelystruktúra gyakorlati laborgyakorlatokkal és referenciaanyagokkal

#### Fejlesztett
- **README felépítés**: MI fejlesztőkre fókuszálva, 45%-os közösségi érdeklődés adatokkal a Microsoft Foundry Discordon
- **Tanulási utak**: Dedikált MI fejlesztői útvonal mellett hagyományos utak hallgatóknak és DevOps mérnököknek
- **Sablon ajánlások**: Kiemelt MI sablonok, beleértve az azure-search-openai-demo, contoso-chat és openai-chat-app-quickstart csomagokat
- **Közösségi integráció**: Fejlesztett Discord közösségi támogatás MI-specifikus csatornákkal és vitákkal

#### Biztonság és termelési fókusz
- **Kezelt identitás minták**: MI-specifikus hitelesítési és biztonsági konfigurációk
- **Költségoptimalizálás**: Tokenhasználat követése és költségvetési kontrollok MI munkaterhelésekhez
- **Multi-regionális telepítés**: Globális MI alkalmazás telepítési stratégiák
- **Teljesítmény monitorozás**: MI specifikus metrikák és Application Insights integráció

#### Dokumentáció minősége
- **Lineáris tanfolyam struktúra**: Logikus előrehaladás kezdőtől haladó MI telepítési mintákig
- **Ellenőrzött URL-ek**: Minden külső tárházi hivatkozás ellenőrzött és elérhető
- **Teljes körű referencia**: A belső dokumentációs hivatkozások ellenőrzöttek és működőképesek
- **Produkcióra kész**: Vállalati telepítési minták valós példákkal

### [v2.0.0] - 2025-09-09

#### Jelentős változások - Tárházi átszervezés és professzionális fejlesztés
**Ez a verzió jelentős átalakítást képvisel a tárház struktúrájában és a tartalom bemutatásában.**

#### Hozzáadva
- **Strukturált tanulási keretrendszer**: Minden dokumentációs oldal mostantól tartalmaz bevezetőt, tanulási célokat és eredményeket
- **Navigációs rendszer**: Előző/Következő leckék linkjei az egész dokumentációban az irányított tanuláshoz
- **Tanulmányi útmutató**: Átfogó study-guide.md tanulási célokkal, gyakorlati feladatokkal és értékelési anyagokkal
- **Professzionális megjelenés**: Minden emoji ikon eltávolítva az elérhetőség és profizmus javítása érdekében
- **Fejlesztett tartalmi struktúra**: Jobb szervezés és tananyag-áramlás

#### Megváltozott
- **Dokumentáció formátum**: Minden dokumentáció egységes, tanulásközpontú szerkezettel
- **Navigációs folyamat**: Logikus előrehaladási út az összes tananyagban
- **Tartalom bemutatás**: Dekoratív elemek eltávolítása a tiszta, professzionális formázás javára
- **Link struktúra**: Minden belső link frissítve az új navigációs rendszerhez igazítva

#### Javított
- **Elérhetőség**: Emoji függőségek eltávolítása jobb képernyőolvasó kompatibilitás érdekében
- **Professzionális megjelenés**: Tiszta, akadémiai stílusú bemutatás vállalati tanuláshoz
- **Tanulási élmény**: Strukturált megközelítés világos célokkal és eredményekkel minden leckéhez
- **Tartalom szervezés**: Jobb logikai összefüggés és kapcsolat a témakörök között

### [v1.0.0] - 2025-09-09

#### Kezdeti kiadás - Átfogó AZD tanulási tárház

#### Hozzáadva
- **Alap dokumentációs struktúra**
  - Teljes kezdő útmutató sorozat
  - Átfogó telepítési és előkészítési dokumentáció
  - Részletes hibakeresési erőforrások és hibakeresési útmutatók
  - Telepítés előtti ellenőrző eszközök és eljárások

- **Kezdés modul**
  - AZD alapok: alapfogalmak és terminológia
  - Telepítési útmutató: platform-specifikus beállítási utasítások
  - Konfigurációs útmutató: környezetbeállítás és hitelesítés
  - Első projekt oktatóanyag: lépésenkénti gyakorlati tanulás

- **Telepítés és előkészítés modul**
  - Telepítési útmutató: teljes munkafolyamat dokumentáció
  - Előkészítési útmutató: Infrastrukturakód Biceppel
  - Legjobb gyakorlatok termelési telepítésekhez
  - Többcélú szolgáltatási architektúra minták

- **Telepítés előtti validációs modul**
  - Kapacitástervezés: Azure erőforrás elérhetőség validálása
  - SKU kiválasztás: átfogó szolgáltatási szint útmutató
  - Előellenőrzések: automatizált validációs szkriptek (PowerShell és Bash)
  - Költségbecslés és költségvetési tervező eszközök

- **Hibakeresési modul**
  - Gyakori problémák: gyakran előforduló gondok és megoldások
  - Hibakeresési útmutató: szisztematikus hibaelhárítási módszerek
  - Fejlett diagnosztikai technikák és eszközök
  - Teljesítmény monitorozás és optimalizálás

- **Erőforrások és hivatkozások**
  - Parancs csalólap: gyorsreferencia alapvető parancsokhoz
  - Szószedet: átfogó terminológiai és rövidítés definíciók
  - GYIK: részletes válaszok gyakran ismételt kérdésekre
  - Külső erőforrás linkek és közösségi kapcsolatok

- **Példák és sablonok**
  - Egyszerű webalkalmazás példa
  - Statikus weboldal telepítési sablon
  - Konténeres alkalmazás konfiguráció
  - Adatbázis integrációs minták
  - Mikroszerviz architektúra példák
  - Serverless funkció megvalósítások

#### Főbb jellemzők
- **Többplatformos támogatás**: Telepítési és konfigurációs útmutatók Windows, macOS és Linux rendszerekhez
- **Többféle képzettségi szint**: Tartalom hallgatóktól profi fejlesztőkig
- **Gyakorlati fókusz**: Gyakorlati példák és valós forgatókönyvek
- **Átfogó lefedettség**: Alapvető fogalmaktól haladó vállalati mintákig
- **Biztonságközpontú megközelítés**: Biztonsági legjobb gyakorlatok integrálva egész dokumentációban
- **Költségoptimalizálás**: Útmutatás költséghatékony telepítésekhez és erőforrás gazdálkodáshoz

#### Dokumentáció minősége
- **Részletes kódpéldák**: Gyakorlati, tesztelt kódminták
- **Lépésről lépésre utasítások**: Világos, alkalmazható útmutatás
- **Átfogó hibakezelés**: Gyakori problémák hibaelhárítása
- **Legjobb gyakorlatok integrációja**: Ipari szabványok és ajánlások
- **Verzió kompatibilitás**: Naprakész az Azure legújabb szolgáltatásaival és az azd funkciókkal

## Tervezett jövőbeli fejlesztések

### Verzió 3.1.0 (tervezett)
#### MI platform bővítés
- **Többmodell támogatás**: Integrációs minták Hugging Face, Azure Machine Learning és egyéni modellekhez
- **MI ügynök keretrendszerek**: Sablonok LangChain, Semantic Kernel és AutoGen telepítésekhez
- **Fejlett RAG minták**: Vektor adatbázis opciók Azure AI Search-en túl (Pinecone, Weaviate stb.)
- **MI megfigyelhetőség**: Fejlett monitorozás modell teljesítményre, tokenhasználatra és válaszminőségre

#### Fejlesztői élmény
- **VS Code kiterjesztés**: Integrált AZD + Microsoft Foundry fejlesztési élmény
- **GitHub Copilot integráció**: MI által támogatott AZD sablongenerálás
- **Interaktív oktatóanyagok**: Gyakorlati kódolási feladatok automatikus validálással MI forgatókönyvekhez
- **Videó tartalom**: Kiegészítő videós oktatóanyagok vizuális tanulóknak MI telepítésekhez

### Verzió 4.0.0 (tervezett)
#### Vállalati MI minták
- **Governance keretrendszer**: MI modell kormányzás, megfelelőség és auditálás
- **Multi-tenant MI**: Több ügyfelet kiszolgáló elszigetelt MI szolgáltatások mintái
- **Edge MI telepítés**: Integráció az Azure IoT Edge és konténer példányokkal
- **Hibrid felhő MI**: Többfelhős és hibrid telepítési minták MI munkaterhelésekhez

#### Fejlett funkciók
- **MI folyamat automatizálás**: MLOps integráció Azure Machine Learning pipeline-okkal
- **Fejlett biztonság**: Zero-trust minták, privát végpontok és fejlett fenyegetésvédelem
- **Teljesítmény optimalizálás**: Fejlett hangolás és skálázási stratégiák nagy átviteli MI alkalmazásokhoz
- **Globális terjesztés**: Tartalom kézbesítés és edge cache minták MI alkalmazásokhoz

### Verzió 3.0.0 (tervezett) - Jelenlegi kiadás által kiváltva
#### Javasolt hozzáadások - Most megvalósítva a v3.0.0 verzióban
- ✅ **MI-központú tartalom**: Átfogó Microsoft Foundry integráció (Befejezve)
- ✅ **Interaktív oktatóanyagok**: Gyakorlati MI műhely labor (Befejezve)
- ✅ **Fejlett biztonsági modul**: MI specifikus biztonsági minták (Befejezve)
- ✅ **Teljesítmény optimalizálás**: MI munkaterhelés hangolási stratégiák (Befejezve)

### Verzió 2.1.0 (tervezett) - Részben megvalósítva a v3.0.0-ban
#### Kis fejlesztések - Néhány elkészült a jelenlegi kiadásban
- ✅ **További példák**: MI-központú telepítési forgatókönyvek (Befejezve)
- ✅ **Kiterjesztett GYIK**: MI-specifikus kérdések és hibakeresés (Befejezve)
- **Eszköz integráció**: Fejlesztett IDE és szerkesztő integrációs útmutatók
- ✅ **Monitorozás bővítés**: MI-specifikus monitorozási és riasztási minták (Befejezve)

#### Még tervezett a jövőbeli kiadásra
- **Mobilbarát dokumentáció**: Reszponzív dizájn mobil tanuláshoz
- **Offline hozzáférés**: Letölthető dokumentációs csomagok
- **Fejlesztett IDE integráció**: VS Code kiterjesztés AZD + MI munkafolyamatokhoz
- **Közösségi irányítópult**: Valós idejű közösségi metrikák és hozzájárulás követés

## Hozzájárulás a verziókövetéshez

### Változások jelentése
Amikor hozzájárulsz ehhez a tárházhoz, kérjük, hogy a verziókövetési bejegyzések tartalmazzák:

1. **Verziószám**: A szemantikus verziókövetés szabályainak megfelelően (major.minor.patch)
2. **Dátum**: Kiadás vagy frissítés dátuma YYYY-MM-DD formátumban
3. **Kategória**: Hozzáadva, Megváltozott, Elavult, Eltávolított, Javított, Biztonság
4. **Világos leírás**: Rövid, tömör leírás a változásokról
5. **Hatásértékelés**: Hogyan érinti a változtatás a meglévő felhasználókat

### Változáskategóriák

#### Hozzáadva
- Új funkciók, dokumentációs részek vagy képességek
- Új példák, sablonok vagy tanulási erőforrások
- További eszközök, szkriptek vagy segédprogramok

#### Megváltozott
- Meglévő funkciók vagy dokumentáció módosításai
- Frissítések a világosság vagy pontosság javítására
- Tartalom vagy szervezés átszervezése

#### Elavult
- Fázisban kivezetett funkciók vagy megközelítések
- Eltávolításra kijelölt dokumentációs részek
- Olyan módszerek, amelyekre jobb alternatívák léteznek

#### Eltávolított
- Funkciók, dokumentáció vagy példák, amelyek már nem relevánsak
- Elavult információk vagy kifutó megközelítések
- Felesleges vagy összevont tartalom

#### Javított
- Hibajavítások a dokumentációban vagy kódban
- Jelentett problémák megoldása
- Pontosság vagy funkcionalitás javítása


#### Biztonság
- Biztonsággal kapcsolatos fejlesztések vagy javítások
- A biztonsági legjobb gyakorlatok frissítései
- Biztonsági sebezhetőségek megoldása

### Szemantikus verziózás irányelvek

#### Főverzió (X.0.0)
- Olyan visszafelé nem kompatibilis változások, amik felhasználói beavatkozást igényelnek
- Jelentős tartalmi vagy szervezeti átalakítások
- Olyan változások, melyek megváltoztatják az alapvető megközelítést vagy módszertant

#### Alverzió (X.Y.0)
- Új funkciók vagy tartalom hozzáadások
- Visszafelé kompatibilis fejlesztések
- További példák, eszközök vagy erőforrások

#### Javítóverzió (X.Y.Z)
- Hibajavítások és korrekciók
- Kis mértékű javítások meglévő tartalomban
- Tisztázások és kisebb fejlesztések

## Közösségi visszajelzések és javaslatok

Aktívan ösztönözzük a közösségi visszajelzéseket a tananyag fejlesztése érdekében:

### Hogyan adhat visszajelzést
- **GitHub Issues**: Problémák bejelentése vagy fejlesztések javaslata (AI-specifikus problémák szívesen fogadottak)
- **Discord Beszélgetések**: Ossza meg ötleteit és vegyen részt a Microsoft Foundry közösségében
- **Pull Requestek**: Közvetlen hozzájárulások a tartalomhoz, különösen AI sablonokhoz és útmutatókhoz
- **Microsoft Foundry Discord**: Vegyen részt az #Azure csatornán AZD + AI beszélgetésekben
- **Közösségi Fórumok**: Vegyen részt szélesebb Azure-fejlesztői beszélgetésekben

### Visszajelzési kategóriák
- **AI tartalom pontossága**: Javítások az AI szolgáltatás integrációját és telepítését illetően
- **Tanulási élmény**: Javaslatok az AI fejlesztői tanulási folyamat javítására
- **Hiányzó AI tartalom**: Kérések további AI sablonokra, mintákra vagy példákra
- **Akadálymentesség**: Fejlesztések sokféle tanulási igény kielégítésére
- **AI eszköz integráció**: Javaslatok az AI fejlesztési munkafolyamat jobb integrációjára
- **Éles AI minták**: Vállalati AI telepítési minták kérései

### Válaszadási elkötelezettség
- **Probléma válaszadás**: Bejelentett problémákra 48 órán belül
- **Funkciókérések**: Kiértékelés egy héten belül
- **Közösségi hozzájárulások**: Áttekintés egy héten belül
- **Biztonsági problémák**: Azonnali prioritás gyors reagálással

## Karbantartási ütemterv

### Rendszeres frissítések
- **Havi felülvizsgálatok**: Tartalom pontosságának és linkek ellenőrzése
- **Negyedéves frissítések**: Jelentős tartalom hozzáadások és fejlesztések
- **Féléves felülvizsgálatok**: Átfogó átszervezés és fejlesztés
- **Éves kiadások**: Főverzió frissítések jelentős fejlesztésekkel

### Monitorozás és minőségbiztosítás
- **Automatikus tesztelés**: Kódpéldák és linkek rendszeres ellenőrzése
- **Közösségi visszajelzés beépítése**: Felhasználói javaslatok rendszeres integrálása
- **Technológiai frissítések**: Összhang a legújabb Azure szolgáltatásokkal és az azd kiadásokkal
- **Akadálymentességi auditok**: Rendszeres áttekintés az inkluzív tervezési elvekért

## Verzió támogatási szabályzat

### Jelenlegi verzió támogatás
- **Legújabb főverzió**: Teljes támogatás rendszeres frissítésekkel
- **Előző főverzió**: Biztonsági frissítések és kritikus javítások 12 hónapig
- **Régebbi verziók**: Csak közösségi támogatás, hivatalos frissítések nélkül

### Migrációs útmutatás
A főverziók kiadásakor biztosítjuk:
- **Migrációs útmutatók**: Lépésről lépésre átállási utasítások
- **Kompatibilitási megjegyzések**: Részletek a visszafelé nem kompatibilis változásokról
- **Eszköztámogatás**: Szkriptek vagy segédprogramok a migrációhoz
- **Közösségi támogatás**: Dedikált fórumok migrációs kérdésekhez

---

**Navigáció**
- **Előző leckéhez**: [Study Guide](resources/study-guide.md)
- **Következő leckéhez**: Vissza a [Fő README-hez](README.md)

**Maradjon naprakész**: Kövesse ezt a tárolót, hogy értesítéseket kapjon új kiadásokról és fontos frissítésekről a tananyagokhoz.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->