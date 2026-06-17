# Az első projekted - Gyakorlati útmutató

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 1. fejezet - Alapok és gyors kezdés
- **⬅️ Előző**: [Telepítés és beállítás](installation.md)
- **➡️ Következő**: [Konfiguráció](configuration.md)
- **🚀 Következő fejezet**: [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Bevezetés

Üdvözölünk az első Azure Developer CLI projektedben! Ez az átfogó gyakorlati útmutató teljes körű végigvezetést nyújt egy teljeskörű alkalmazás létrehozásában, telepítésében és kezelésében az Azure-on az azd használatával. Egy valós todo alkalmazással dolgozol, amely tartalmaz egy React frontend felületet, Node.js API háttérrendszert és MongoDB adatbázist.

## Tanulási célok

Ennek az útmutatónak a segítségével:
- Elsajátítod az azd projekt inicializációs munkafolyamatát sablonok segítségével
- Megérted az Azure Developer CLI projekt felépítését és konfigurációs fájljait
- Végrehajtod az alkalmazás teljes telepítését az Azure-ra infrastruktúra kiépítésével egybekötve
- Megvalósítod az alkalmazásfrissítések és újratelepítési stratégiákat
- Kezeled a fejlesztési és staging környezeteket
- Alkalmazod az erőforrás-takarítási és költségkezelési gyakorlatokat

## Tanulási eredmények

A befejezés után képes leszel:
- Önállóan inicializálni és konfigurálni az azd projekteket sablonokból
- Hatékonyan navigálni és módosítani az azd projekt struktúráját
- Egysoros parancsokkal telepíteni full-stack alkalmazásokat az Azure-ra
- Hibakeresni gyakori telepítési és hitelesítési problémákat
- Több Azure környezetet kezelni különböző telepítési fázisokhoz
- Folyamatos telepítési munkafolyamatokat megvalósítani az alkalmazásfrissítésekhez

## Kezdés

### Előfeltételek ellenőrzőlista
- ✅ Azure Developer CLI telepítve ([Telepítési útmutató](installation.md))
- ✅ AZD hitelesítés befejezve `azd auth login` parancs használatával
- ✅ Git telepítve a rendszeren
- ✅ Node.js 16+ (ehhez az útmutatóhoz)
- ✅ Visual Studio Code (ajánlott)

Folytatás előtt futtasd a setup ellenőrzőt a repository gyökeréből:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Ellenőrizd a beállítást
```bash
# Ellenőrizze az azd telepítést
azd version

# Ellenőrizze az AZD hitelesítést
azd auth login --check-status
```

### Opcionális Azure CLI hitelesítés ellenőrzése

```bash
az account show
```

### Node.js verzió ellenőrzése
```bash
node --version
```

## 1. lépés: Sablon választása és inicializálása

Kezdjünk egy népszerű todo alkalmazás sablonnal, amely tartalmaz egy React frontendet és Node.js API hátteret.

```bash
# Böngésszen az elérhető sablonok között
azd template list

# Inicializálja a teendők alkalmazás sablonját
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Kövesse az utasításokat:
# - Adjon meg egy környezetnevet: "dev"
# - Válasszon előfizetést (ha több van)
# - Válasszon régiót: "East US 2" (vagy az Ön által preferált régió)
```

### Mi történt most?
- Letöltöttük a sablonkódot a helyi könyvtárba
- Létrehoztunk egy `azure.yaml` fájlt a szolgáltatás definíciókkal
- Beállítottuk az infrastruktúra kódot az `infra/` könyvtárban
- Létrehoztunk egy környezet konfigurációt

## 2. lépés: A projekt struktúrájának felfedezése

Nézzük meg, mit hozott létre az azd:

```bash
# Nézze meg a projekt szerkezetét
tree /f   # Windows
# vagy
find . -type f | head -20   # macOS/Linux
```

Ezt kell látnod:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Fontos fájlok megértése

**azure.yaml** - Az azd projekt szíve:
```bash
# Projektnézet konfiguráció megtekintése
cat azure.yaml
```

**infra/main.bicep** - Infrastruktúra definíció:
```bash
# Tekintse meg az infrastruktúra kódját
head -30 infra/main.bicep
```

## 3. lépés: Projekt személyre szabása (opcionális)

A telepítés előtt testre szabhatod az alkalmazást:

### Frontend módosítása
```bash
# Nyisd meg a React alkalmazás komponenst
code src/web/src/App.tsx
```

Készíts egy egyszerű módosítást:
```typescript
// Találd meg a címet és változtasd meg
<h1>My Awesome Todo App</h1>
```

### Környezeti változók konfigurálása
```bash
# Egyéni környezeti változók beállítása
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Az összes környezeti változó megtekintése
azd env get-values
```

## 4. lépés: Telepítés az Azure-ra

Most jön az izgalmas rész – telepíts mindent az Azure-ra!

```bash
# Infrastruktúra és alkalmazás telepítése
azd up

# Ez a parancs a következőket végzi el:
# 1. Azure erőforrások biztosítása (App Service, Cosmos DB, stb.)
# 2. Az alkalmazás felépítése
# 3. Telepítés a biztosított erőforrásokra
# 4. Az alkalmazás URL-jének megjelenítése
```

### Mi történik telepítés közben?

Az `azd up` parancs ezekkel a lépésekkel dolgozik:
1. **Provision** (`azd provision`) - Azure erőforrások létrehozása
2. **Package** - Az alkalmazáskód felépítése
3. **Deploy** (`azd deploy`) - Kód telepítése az Azure erőforrásokra

### Várt kimenet
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 5. lépés: Az alkalmazás tesztelése

### Hozzáférés az alkalmazáshoz
Kattints a telepítési kimenetben megadott URL-re, vagy bármikor elérheted azt:
```bash
# Alkalmazás végpontok lekérése
azd show

# Nyissa meg az alkalmazást a böngészőjében
azd show --output json | jq -r '.services.web.endpoint'
```

### A Todo alkalmazás tesztelése
1. **Todo elem hozzáadása** - Kattints az „Add Todo”-ra és adj meg egy feladatot
2. **Jelöld készre** - Pipáld ki a teljesített elemeket
3. **Törlés** - Távolítsd el a már nem szükséges todo-kat

### Alkalmazás monitorozása
```bash
# Nyissa meg az Azure portált az erőforrásaihoz
azd monitor

# Alkalmazás naplók megtekintése
azd monitor --logs

# Élő mérések megtekintése
azd monitor --live
```

### ✅ Telepítés ellenőrzése

Mielőtt tovább mennél, fuss végig ezen az egyszerű ellenőrző listán, hogy megbizonyosodj, hogy tényleg működik mindez — ne feltételezd, hogy a „telepítés sikeres” egyenlő az „alkalmazás működik”-kel:

```bash
# 1. Erősítse meg, hogy a végpont létezik és elérhető
azd show

# 2. Alap tesztelje a végpontot (HTTP 200 választ vár)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Ellenőrizze az egészségügyi végpontot, ha az alkalmazás rendelkezik ilyennel
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**A telepítés akkor igazolt, ha:**
- ✅ Az `azd show` elérhető végpont URL-t listáz
- ✅ Az URL böngészőben hibamentesen megnyílik
- ✅ Az alapvető funkciók működnek (todo hozzáadása/készre jelölése/törlése)
- ✅ Az `azd monitor --logs` kéréseket mutat be váratlan hibák nélkül

Ha bármelyik ellenőrzés sikertelen, ugorj a [7. fejezet: Hibakeresés](../chapter-07-troubleshooting/README.md) részre.

## 6. lépés: Változtatások és újratelepítés

Csináljunk egy módosítást, és nézzük meg milyen egyszerű a frissítés:

### API módosítása
```bash
# Szerkessze az API kódot
code src/api/src/routes/lists.js
```

Adj hozzá egy egyedi válaszfejlécet:
```javascript
// Keress egy útvonalkezelőt, és add hozzá:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Csak a kódváltoztatások telepítése
```bash
# Csak az alkalmazáskód telepítése (infrastruktúra kihagyása)
azd deploy

# Ez sokkal gyorsabb, mint az 'azd up', mivel az infrastruktúra már létezik
```

## 7. lépés: Több környezet kezelése

Hozz létre egy staging környezetet, hogy teszteld a változásokat a produkció előtt:

```bash
# Új staging környezet létrehozása
azd env new staging

# Kiszállítás a stagingre
azd up

# Visszakapcsolás a fejlesztői környezetre
azd env select dev

# Az összes környezet listázása
azd env list
```

### Környezetek összehasonlítása
```bash
# Fejlesztői környezet megtekintése
azd env select dev
azd show

# Tesztelési környezet megtekintése
azd env select staging
azd show
```

## 8. lépés: Erőforrások takarítása

Ha végeztél a kísérletezéssel, takarítsd el az erőforrásokat, hogy elkerüld a folyamatos költségeket:

```bash
# Az összes Azure erőforrás törlése az aktuális környezethez
azd down

# Kényszerített törlés megerősítés nélkül és a lágyan törölt erőforrások törlése
azd down --force --purge

# Egy adott környezet törlése
azd env select staging
azd down --force --purge
```

## Klasszikus alkalmazás vs. AI-vezérelt alkalmazás: ugyanaz a munkafolyamat

Most telepítettél egy hagyományos webalkalmazást. De mi lenne, ha inkább egy AI-vezérelt alkalmazást akarnál telepíteni — például egy Microsoft Foundry modelleken alapuló chatalkalmazást?

A jó hír: **a munkafolyamat teljesen ugyanaz.**

| Lépés | Klasszikus Todo App | AI Chat App |
|------|---------------------|-------------|
| Inicializálás | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Hitelesítés | `azd auth login` | `azd auth login` |
| Telepítés | `azd up` | `azd up` |
| Monitorozás | `azd monitor` | `azd monitor` |
| Takarítás | `azd down --force --purge` | `azd down --force --purge` |

Az egyetlen különbség az, hogy **milyen sablonnal indulsz**. Egy AI sablon tartalmaz további infrastruktúrát (például Microsoft Foundry Models erőforrást vagy AI Search indexet), de az azd mindezt kezeli helyetted. Nem kell új parancsokat megtanulnod, más eszközt használnod vagy másként gondolkodnod a telepítésről.

Ez az azd alapelve: **egy munkafolyamat, bármilyen terhelés.** Az ebben az útmutatóban gyakorolt képességek – inicializálás, telepítés, monitorozás, újratelepítés és takarítás – egyformán alkalmazhatók AI alkalmazásokra és ügynökökre.

---

## Amit megtanultál

Gratulálunk! Sikeresen:
- ✅ Inicializáltál egy azd projektet sablonból
- ✅ Felfedezted a projekt struktúráját és a kulcsfontosságú fájlokat
- ✅ Telepítettél egy teljes alkalmazást az Azure-ra
- ✅ Változtatásokat hajtottál végre és újratelepítettél
- ✅ Több környezetet kezeltél
- ✅ Erőforrásokat töröltél

## 🎯 Készségellenőrző feladatok

### 1. feladat: Másik sablon telepítése (15 perc)
**Cél**: Az azd init és telepítési folyamatok alapos ismeretének demonstrálása

```bash
# Próbáld ki a Python + MongoDB technológiát
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Ellenőrizd a telepítést
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Tisztítás
azd down --force --purge
```

**Siker kritériumok:**
- [ ] Az alkalmazás hibamentesen települ
- [ ] Az alkalmazás URL-je elérhető böngészőben
- [ ] Az alkalmazás helyesen működik (todo elemek hozzáadása/törlése)
- [ ] Minden erőforrás sikeresen törölve lett

### 2. feladat: Konfiguráció testreszabása (20 perc)
**Cél**: Környezeti változók konfigurálásának gyakorlása

```bash
cd my-first-azd-app

# Egyéni környezet létrehozása
azd env new custom-config

# Egyéni változók beállítása
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Változók ellenőrzése
azd env get-values | grep APP_TITLE

# Telepítés egyedi konfigurációval
azd up
```

**Siker kritériumok:**
- [ ] Egyéni környezet sikeresen létrehozva
- [ ] Környezeti változók beállítva és lekérdezhetők
- [ ] Az alkalmazás az egyéni konfigurációval települ
- [ ] Egyéni beállítások ellenőrizhetők a telepített alkalmazásban

### 3. feladat: Több környezet kezelése (25 perc)
**Cél**: Környezetkezelés és telepítési stratégiák elsajátítása

```bash
# Fejlesztői környezet létrehozása
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Fejlesztői URL megjegyzése
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Staging környezet létrehozása
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Staging URL megjegyzése
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Környezetek összehasonlítása
azd env list

# Mindkét környezet tesztelése
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Mindkettő takarítása
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Siker kritériumok:**
- [ ] Két különböző konfigurációjú környezet létrehozva
- [ ] Mindkét környezet sikeresen telepítve
- [ ] Képes váltani a környezetek között az `azd env select` paranccsal
- [ ] Egyedi környezeti változók mindkét környezethez eltérőek
- [ ] Mindkét környezet sikeresen törölve

## 📊 Előrehaladásod

**Befektetett idő**: ~60-90 perc  
**Megszerezett készségek**:
- ✅ Sablonalapú projekt inicializálás
- ✅ Azure erőforrások kiépítése
- ✅ Alkalmazás telepítési munkafolyamatok
- ✅ Környezetkezelés
- ✅ Konfiguráció menedzsment
- ✅ Erőforrás takarítás és költségmenedzsment

**Következő szint**: Készen állsz a [Konfigurációs útmutató](configuration.md) megtanulására, ahol fejlettebb beállításokat ismerhetsz meg!

## Gyakori problémák hibaelhárítása

### Hitelesítési hibák
```bash
# Újra hitelesítés az Azure-lal
az login

# Előfizetési hozzáférés ellenőrzése
az account show
```

### Telepítési kudarcok
```bash
# Engedélyezze a hibakeresési naplózást
export AZD_DEBUG=true
azd up --debug

# Az alkalmazás naplóinak megtekintése az Azure-ban
azd monitor --logs

# Konténeralkalmazások esetén használja az Azure CLI-t:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Erőforrásnév ütközések
```bash
# Használjon egyedi környezeti nevet
azd env new dev-$(whoami)-$(date +%s)
```

### Port/hálózati hibák
```bash
# Ellenőrizze, hogy a portok elérhetők-e
netstat -an | grep :3000
netstat -an | grep :3100
```

## Következő lépések

Most, hogy befejezted az első projekted, ismerd meg a haladó témákat:

### 1. Infrastruktúra testreszabása
- [Infrastruktúra mint kód](../chapter-04-infrastructure/provisioning.md)
- [Adatbázisok, tárhely és egyéb szolgáltatások hozzáadása](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD beállítása
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md) - Teljes CI/CD munkafolyamatok
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline konfiguráció

### 3. Termelési bevált gyakorlatok
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md) - Biztonság, teljesítmény és monitorozás

### 4. Több sablon felfedezése
```bash
# Böngésszen a sablonok között kategória szerint
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Próbáljon ki különböző technológiai halmazokat
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## További források

### Tananyagtárak
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Közösség és támogatás
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer közösség](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Sablonok és példák
- [Hivatalos sablongyűjtemény](https://azure.github.io/awesome-azd/)
- [Közösségi sablonok](https://github.com/Azure-Samples/azd-templates)
- [Enterprise minták](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulálunk az első azd projekted befejezéséhez!** Most már magabiztosan építhetsz és telepíthetsz fantasztikus alkalmazásokat az Azure-on.

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 1. fejezet - Alapok és gyors kezdés
- **⬅️ Előző**: [Telepítés és beállítás](installation.md)
- **➡️ Következő**: [Hozd a saját alkalmazásod](bring-your-own-app.md)
- **🚀 Következő fejezet**: [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->