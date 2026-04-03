# Az első projekted - Gyakorlati útmutató

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 1. fejezet - Alapok & Gyors kezdés
- **⬅️ Előző**: [Telepítés és beállítás](installation.md)
- **➡️ Következő**: [Konfiguráció](configuration.md)
- **🚀 Következő fejezet**: [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Bevezetés

Üdvözlünk az első Azure Developer CLI projektedben! Ez a részletes gyakorlati útmutató teljes körű végigvezeti egy full-stack alkalmazás létrehozásán, telepítésén és kezelésén az Azure-on az azd használatával. Egy valós todo alkalmazáson dolgozol, amely tartalmaz egy React frontend, Node.js API backend és MongoDB adatbázist.

## Tanulási célok

A tutorial elvégzésével:
- Mesteri szintre fejleszted az azd projekt inicializálását sablonok használatával
- Megérted az Azure Developer CLI projekt szerkezetét és konfigurációs fájljait
- Teljes alkalmazás telepítést végzel Azure-ra, infrastruktúra előkészítéssel
- Megvalósítod az alkalmazásfrissítési és újratelepítési stratégiákat
- Kezeled a fejlesztési és staging környezeteket
- Alkalmazod az erőforrás-takarítási és költségkezelési gyakorlatokat

## Tanulási eredmények

A befejezés után képes leszel:
- Sablonokból önállóan inicializálni és konfigurálni azd projekteket
- Hatékonyan navigálni és módosítani az azd projekt struktúráját
- Egyszeri parancsokkal full-stack alkalmazásokat telepíteni Azure-ra
- Hibaelhárítani gyakori telepítési és hitelesítési problémákat
- Több Azure környezetet kezelni különböző telepítési szakaszokra
- Folyamatos telepítési munkafolyamatokat megvalósítani alkalmazásfrissítésekhez

## Kezdés

### Előfeltételek ellenőrző lista
- ✅ Azure Developer CLI telepítve ([Telepítési útmutató](installation.md))
- ✅ AZD hitelesítés elvégezve `azd auth login`-nal
- ✅ Git telepítve a rendszereden
- ✅ Node.js 16+ (ehhez a tutorialhoz)
- ✅ Visual Studio Code (ajánlott)

Mielőtt folytatnád, futtasd le a beállítás ellenőrzőt a tároló gyökeréből:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Ellenőrizd a beállítást
```bash
# Az azd telepítés ellenőrzése
azd version

# Az AZD hitelesítés ellenőrzése
azd auth login --check-status
```

### Ellenőrizd az opcionális Azure CLI hitelesítést

```bash
az account show
```

### Nézd meg a Node.js verziót
```bash
node --version
```

## 1. lépés: Válassz és inicializálj egy sablont

Kezdjünk egy népszerű todo alkalmazás sablonnal, amely tartalmaz React frontendet és Node.js API backendet.

```bash
# Böngészés az elérhető sablonok között
azd template list

# Todo alkalmazás sablon inicializálása
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Kövesd az utasításokat:
# - Írd be a környezet nevét: "dev"
# - Válassz egy előfizetést (ha több is van)
# - Válassz egy régiót: "East US 2" (vagy a preferált régiód)
```

### Mi történt éppen?
- Letöltöttük a sablon kódját a helyi könyvtáradba
- Létrejött egy `azure.yaml` fájl szolgáltatás definíciókkal
- Beállítottuk az infrastruktúra kódot az `infra/` könyvtárban
- Létrehoztunk egy környezeti konfigurációt

## 2. lépés: Ismerkedj meg a projekt szerkezetével

Nézzük meg, mit hozott létre az azd számunkra:

```bash
# Nézd meg a projekt felépítését
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

**azure.yaml** - az azd projekted lelke:
```bash
# Tekintse meg a projekt konfigurációját
cat azure.yaml
```

**infra/main.bicep** - Infrastruktúra definíció:
```bash
# Tekintse meg az infrastruktúra kódját
head -30 infra/main.bicep
```

## 3. lépés: Testreszabhatod a projekted (opcionális)

A telepítés előtt testreszabhatod az alkalmazást:

### Módosítsd a frontendet
```bash
# Nyisd meg a React alkalmazás komponenst
code src/web/src/App.tsx
```

Egyszerű változtatás:
```typescript
// Találd meg a címet, és változtasd meg azt
<h1>My Awesome Todo App</h1>
```

### Állítsd be a környezeti változókat
```bash
# Egyéni környezeti változók beállítása
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Az összes környezeti változó megtekintése
azd env get-values
```

## 4. lépés: Telepítés Azure-ra

Most jön az izgalmas rész – telepíts mindent Azure-ra!

```bash
# Infrastruktúra és alkalmazás telepítése
azd up

# Ez a parancs a következőket végzi el:
# 1. Azure-erőforrások létrehozása (App Service, Cosmos DB, stb.)
# 2. Az alkalmazás felépítése
# 3. Telepítés a létrehozott erőforrásokra
# 4. Az alkalmazás URL-jének megjelenítése
```

### Mi történik a telepítés során?

Az `azd up` parancs az alábbiakat végzi:
1. **Provisionálás** (`azd provision`) - Azure erőforrások létrehozása
2. **Csomagolás** - az alkalmazás kódjának felépítése
3. **Telepítés** (`azd deploy`) - a kód telepítése az Azure erőforrásokra

### Várt kimenet
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 5. lépés: Teszteld az alkalmazást

### Érd el az alkalmazásod
Kattints a telepítés kimenetében megadott URL-re, vagy bármikor lekérheted:
```bash
# Alkalmazás végpontjainak lekérése
azd show

# Nyissa meg az alkalmazást a böngészőjében
azd show --output json | jq -r '.services.web.endpoint'
```

### Teszteld a Todo alkalmazást
1. **Adj hozzá egy tennivalót** - Kattints az „Add Todo”-ra és írj be egy feladatot
2. **Jelöld késznek** - Pipáld ki a kész feladatokat
3. **Töröld a tennivalókat** - Távolítsd el a már nem szükségeseket

### Monitorozd az alkalmazást
```bash
# Nyissa meg az Azure portált az erőforrásaihoz
azd monitor

# Alkalmazásnaplók megtekintése
azd monitor --logs

# Élő metrikák megtekintése
azd monitor --live
```

## 6. lépés: Végezz változtatásokat és telepíts újra

Tegyük próbára, milyen egyszerű frissíteni az alkalmazást:

### Módosítsd az API-t
```bash
# Szerkessze az API kódot
code src/api/src/routes/lists.js
```

Adj hozzá egy egyedi válasz fejlécet:
```javascript
// Keress meg egy útvonalkezelőt, és add hozzá:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Csak a kódváltoztatásokat telepítsd
```bash
# Csak az alkalmazáskód telepítése (kihagyva az infrastruktúrát)
azd deploy

# Ez sokkal gyorsabb, mint az 'azd up', mivel az infrastruktúra már létezik
```

## 7. lépés: Több környezet kezelése

Hozz létre egy staging környezetet a változtatások teszteléséhez éles előtt:

```bash
# Hozzon létre egy új staging környezetet
azd env new staging

# Telepítés staging környezetbe
azd up

# Váltás vissza a fejlesztői környezetre
azd env select dev

# Az összes környezet listázása
azd env list
```

### Környezetek összehasonlítása
```bash
# Fejlesztési környezet megtekintése
azd env select dev
azd show

# Tesztelési környezet megtekintése
azd env select staging
azd show
```

## 8. lépés: Erőforrások tisztítása

Ha befejezted a próbálgatást, takarítsd rendbe az erőforrásokat a további költségek elkerülése érdekében:

```bash
# Törölje az összes Azure erőforrást az aktuális környezethez
azd down

# Erőltetett törlés megerősítés nélkül, és lágontörölt erőforrások végleges eltávolítása
azd down --force --purge

# Megadott környezet törlése
azd env select staging
azd down --force --purge
```

## Klasszikus alkalmazás vs. AI-alapú alkalmazás: ugyanaz a munkafolyamat

Most telepítettél egy hagyományos webalkalmazást. De mi van akkor, ha egy AI-alapú alkalmazást szeretnél telepíteni – például egy Microsoft Foundry Modellek által működtetett chat alkalmazást?

A jó hír: **a munkafolyamat teljesen ugyanaz.**

| Lépés | Klasszikus Todo App | AI Chat App |
|------|---------------------|-------------|
| Inicializálás | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Hitelesítés | `azd auth login` | `azd auth login` |
| Telepítés | `azd up` | `azd up` |
| Monitorozás | `azd monitor` | `azd monitor` |
| Takarítás | `azd down --force --purge` | `azd down --force --purge` |

Az egyetlen különbség a **sablon**, amivel indulsz. Az AI sablon további infrastruktúrát tartalmaz (például Microsoft Foundry Models erőforrás vagy AI Search index), de azd ezt mind kezeli helyetted. Nem kell új parancsokat tanulnod, új eszközöket használnod vagy megváltoztatni a telepítés gondolkodásmódját.

Ez az azd alapelve: **egy munkafolyamat, bármilyen terhelés**. Az itt gyakorolt készségek – inicializálás, telepítés, monitorozás, újratelepítés és takarítás – ugyanúgy alkalmazhatók AI alkalmazásokra és ügynökökre is.

---

## Amit tanultál

Gratulálunk! Sikeresen:
- ✅ Inicializáltál egy azd projektet sablonból
- ✅ Felfedezted a projekt struktúráját és kulcsfájljait
- ✅ Telepítettél egy full-stack alkalmazást Azure-ra
- ✅ Végeztél kódmódosításokat és újratelepítést
- ✅ Kezeltél több környezetet
- ✅ Kitakarítottad az erőforrásokat

## 🎯 Készségellenőrző gyakorlatok

### Gyakorlat 1: Másik sablon telepítése (15 perc)
**Cél**: Az azd init és telepítési munkafolyamat magabiztos működtetésének bizonyítása

```bash
# Próbáld ki a Python + MongoDB stack-et
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Telepítés ellenőrzése
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Takarítás
azd down --force --purge
```

**Sikerfeltételek:**
- [ ] Az alkalmazás hibamentesen települ
- [ ] Elérhető a böngészőben az alkalmazás URL-je
- [ ] Az alkalmazás megfelelően működik (todo hozzáadása/törlése)
- [ ] Sikeresen kitakarítottad az összes erőforrást

### Gyakorlat 2: Konfiguráció testreszabása (20 perc)
**Cél**: Környezeti változók konfigurációjának gyakorlása

```bash
cd my-first-azd-app

# Egyedi környezet létrehozása
azd env new custom-config

# Egyedi változók beállítása
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Változók ellenőrzése
azd env get-values | grep APP_TITLE

# Telepítés egyedi konfigurációval
azd up
```

**Sikerfeltételek:**
- [ ] Egyedi környezet sikeresen létrejött
- [ ] Környezeti változók beállíthatók és lekérhetők
- [ ] Az alkalmazás az egyedi beállításokkal települ
- [ ] Ellenőrizhetőek az egyedi beállítások a telepített alkalmazásban

### Gyakorlat 3: Több környezet munkafolyamat (25 perc)
**Cél**: Környezetkezelés és telepítési stratégiák elsajátítása

```bash
# Dev környezet létrehozása
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Dev URL megjegyzése
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

# Mindkettő megtisztítása
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Sikerfeltételek:**
- [ ] Két különböző konfigurációjú környezet létrehozása
- [ ] Mindkét környezet sikeresen telepítve
- [ ] Képes váltani a környezetek között `azd env select` használatával
- [ ] A környezeti változók eltérnek a két környezet között
- [ ] Mindkét környezet sikeresen kitakarítva

## 📊 A haladásod

**Ráfordított idő**: ~60-90 perc  
**Saját készségek**:
- ✅ Sablon alapú projekt inicializálás
- ✅ Azure erőforrás előkészítés
- ✅ Alkalmazás telepítési munkafolyamatok
- ✅ Környezetkezelés
- ✅ Konfiguráció menedzsment
- ✅ Erőforrás-takarítás és költségkezelés

**Következő szint**: Készen állsz a [Konfigurációs útmutató](configuration.md) elsajátítására, hogy haladó beállítási mintákat tanulj!

## Gyakori problémák elhárítása

### Hitelesítési hibák
```bash
# Újra hitelesítés az Azure-val
az login

# Előfizetési hozzáférés ellenőrzése
az account show
```

### Telepítési hibák
```bash
# Hibaelhárító naplózás engedélyezése
export AZD_DEBUG=true
azd up --debug

# Alkalmazásnaplók megtekintése az Azure-ban
azd monitor --logs

# Konténeralkalmazások esetén használja az Azure CLI-t:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Erőforrásnév ütközések
```bash
# Használjon egyedi környezetnevet
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Hálózati problémák
```bash
# Ellenőrizze, hogy a portok elérhetők-e
netstat -an | grep :3000
netstat -an | grep :3100
```

## Következő lépések

Most, hogy befejezted az első projekted, fedezd fel ezeket a haladó témákat:

### 1. Testreszabott infrastruktúra
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Adatbázisok, tárolók és más szolgáltatások hozzáadása](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD beállítása
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md) - Teljes CI/CD munkafolyamatok
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline konfiguráció

### 3. Éles környezet legjobb gyakorlatai
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md) - Biztonság, teljesítmény és monitorozás

### 4. Több sablon felfedezése
```bash
# Böngésszen sablonokat kategóriák szerint
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Próbáljon ki különböző technológiai halmazokat
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## További források

### Tananyagok
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure architektúra központ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure jól megtervezett keretrendszer](https://learn.microsoft.com/en-us/azure/well-architected/)

### Közösség és támogatás
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure fejlesztői közösség](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Sablonok és példák
- [Hivatalos sablon galéria](https://azure.github.io/awesome-azd/)
- [Közösségi sablonok](https://github.com/Azure-Samples/azd-templates)
- [Vállalati minták](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulálunk az első azd projekted elkészítéséhez!** Most már magabiztosan építhetsz és telepíthetsz csodálatos alkalmazásokat Azure-on.

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 1. fejezet - Alapok & Gyors kezdés
- **⬅️ Előző**: [Telepítés és beállítás](installation.md)
- **➡️ Következő**: [Konfiguráció](configuration.md)
- **🚀 Következő fejezet**: [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Következő lecke**: [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kizáró nyilatkozat**:  
Ez a dokumentum az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár igyekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum anyanyelvi változata tekintendő hivatalos forrásnak. Kritikus információk esetén professzionális, emberi fordítást javaslunk. Nem vállalunk felelősséget az ebből eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->