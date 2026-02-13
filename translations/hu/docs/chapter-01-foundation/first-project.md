# Az első projekted - Gyakorlati útmutató

**Fejezet-navigáció:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Bevezetés

Üdv a első Azure Developer CLI projektedben! Ez az átfogó, gyakorlati útmutató lépésről lépésre bemutatja, hogyan hozz létre, telepíts és kezelj egy teljes stack alkalmazást Azure-on az azd segítségével. Egy valós todo alkalmazással dolgozol, amely tartalmaz egy React frontendet, Node.js API backendet és MongoDB adatbázist.

## Tanulási célok

A bemutató elvégzésével:
- Sajátítsd el az azd projekt inicializálásának munkafolyamatát sablonok használatával
- Értsd meg az Azure Developer CLI projekt szerkezetét és konfigurációs fájljait
- Végezd el az alkalmazás teljes telepítését Azure-ra infrastruktúra kiépítésével
- Valósíts meg alkalmazásfrissítési és újratelepítési stratégiákat
- Kezeld a több környezetet fejlesztéshez és staginghez
- Alkalmazd az erőforrások takarítására és költségkezelésre vonatkozó gyakorlatokat

## Tanulási eredmények

A befejezés után képes leszel:
- Önállóan inicializálni és konfigurálni az azd projekteket sablonokból
- Hatékonyan navigálni és módosítani az azd projektstruktúrát
- Teljes stack alkalmazásokat telepíteni Azure-ra egyetlen parancsokkal
- Gyakori telepítési problémákat és hitelesítési hibákat elhárítani
- Több Azure-környezetet kezelni különböző telepítési szakaszokhoz
- Folyamatos telepítési munkafolyamatokat megvalósítani alkalmazásfrissítésekhez

## Kezdés

### Előfeltételek ellenőrzőlista
- ✅ Azure Developer CLI telepítve ([Telepítési útmutató](installation.md))
- ✅ Azure CLI telepítve és hitelesítve
- ✅ Git telepítve a rendszeren
- ✅ Node.js 16+ (ehhez a bemutatóhoz)
- ✅ Visual Studio Code (ajánlott)

### A beállítás ellenőrzése
```bash
# Ellenőrizze az azd telepítését
azd version
```
### Azure hitelesítés ellenőrzése

```bash
az account show
```

### Node.js verzió ellenőrzése
```bash
node --version
```

## 1. lépés: Sablon választása és inicializálása

Kezdjünk egy népszerű todo alkalmazás sablonnal, amely tartalmaz egy React frontendet és Node.js API backendet.

```bash
# Elérhető sablonok böngészése
azd template list

# Inicializáld a teendőalkalmazás sablonját
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Kövesd az utasításokat:
# - Add meg a környezet nevét: "dev"
# - Válassz előfizetést (ha több is van)
# - Válassz régiót: "East US 2" (vagy a preferált régiód)
```

### Mi történt most?
- Letöltötte a sablonkódot a helyi könyvtárba
- Létrejött egy `azure.yaml` fájl a szolgáltatásdefiníciókkal
- Beállította az infrastruktúra kódot az `infra/` könyvtárban
- Létrehozott egy környezeti konfigurációt

## 2. lépés: Projektstruktúra felfedezése

Vizsgáljuk meg, mit hozott létre az azd számunkra:

```bash
# A projekt szerkezetének megtekintése
tree /f   # Windows
# vagy
find . -type f | head -20   # macOS/Linux
```

Látnod kell:
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

### Fontos fájlok

**azure.yaml** - Az azd projekt szíve:
```bash
# Projekt konfiguráció megtekintése
cat azure.yaml
```

**infra/main.bicep** - Infrastruktúra definíció:
```bash
# Tekintse meg az infrastruktúra kódját
head -30 infra/main.bicep
```

## 3. lépés: Projekt testreszabása (opcionális)

A telepítés előtt testreszabhatod az alkalmazást:

### Frontend módosítása
```bash
# Nyisd meg a React-alkalmazás komponenst
code src/web/src/App.tsx
```

Végezzen egy egyszerű módosítást:
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

## 4. lépés: Telepítés Azure-ra

Most jön az izgalmas rész - telepíts mindent Azure-ra!

```bash
# Infrastruktúra és alkalmazás telepítése
azd up

# Ez a parancs a következőket végzi:
# 1. Azure-erőforrások létrehozása (App Service, Cosmos DB stb.)
# 2. Az alkalmazásod összeállítása
# 3. Telepítés a létrehozott erőforrásokra
# 4. Az alkalmazás URL-jének megjelenítése
```

### Mi történik a telepítés során?

Az `azd up` parancs a következő lépéseket végrehajtja:
1. **Provision** (`azd provision`) - Azure-erőforrások létrehozása
2. **Package** - Felépíti az alkalmazás kódját
3. **Deploy** (`azd deploy`) - Kód telepítése az Azure-erőforrásokra

### Várható kimenet
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 5. lépés: Alkalmazás tesztelése

### Alkalmazás elérése
Kattints a telepítési kimenetben megadott URL-re, vagy szerezd meg bármikor:
```bash
# Szerezze meg az alkalmazás végpontjait
azd show

# Nyissa meg az alkalmazást a böngészőjében
azd show --output json | jq -r '.services.web.endpoint'
```

### A Todo alkalmazás tesztelése
1. **Todo tétel hozzáadása** - Kattints az "Add Todo" gombra és írj be egy feladatot
2. **Jelöld késznek** - Pipáld ki a befejezett elemeket
3. **Tételek törlése** - Távolítsd el azokat a todo-kat, amelyekre már nincs szükséged

### Alkalmazás monitorozása
```bash
# Azure-portál megnyitása az erőforrásaihoz
azd monitor

# Alkalmazásnaplók megtekintése
azd monitor --logs

# Élő metrikák megtekintése
azd monitor --live
```

## 6. lépés: Változtatások és újratelepítés

Hajtsunk végre egy módosítást, és nézzük meg, milyen egyszerű frissíteni:

### API módosítása
```bash
# Szerkessze az API-kódot
code src/api/src/routes/lists.js
```

Egy egyedi válaszfejléc hozzáadása:
```javascript
// Keress egy útvonalkezelőt és add hozzá:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Csak a kódváltoztatások telepítése
```bash
# Csak az alkalmazáskód telepítése (az infrastruktúra kihagyása)
azd deploy

# Ez sokkal gyorsabb, mint 'azd up', mivel az infrastruktúra már létezik
```

## 7. lépés: Több környezet kezelése

Hozz létre egy staging környezetet, hogy teszteld a változtatásokat élesítés előtt:

```bash
# Hozzon létre egy új staging környezetet
azd env new staging

# Telepítse a staging környezetbe
azd up

# Váltson vissza a dev környezetre
azd env select dev

# Sorolja fel az összes környezetet
azd env list
```

### Környezeti összehasonlítás
```bash
# Fejlesztési környezet megtekintése
azd env select dev
azd show

# Staging környezet megtekintése
azd env select staging
azd show
```

## 8. lépés: Erőforrások tisztítása

Ha végeztél a kísérletezéssel, takarítsd el az erőforrásokat, hogy elkerüld a tartós költségeket:

```bash
# Az összes Azure-erőforrás törlése az aktuális környezetből
azd down

# Kényszerített törlés megerősítés nélkül és a lágyan törölt erőforrások végleges eltávolítása
azd down --force --purge

# Egy adott környezet törlése
azd env select staging
azd down --force --purge
```

## Mit tanultál

Gratulálunk! Sikeresen:
- ✅ Inicializáltál egy azd projektet sablonból
- ✅ Felfedezted a projekt szerkezetét és a kulcsfájlokat
- ✅ Telepítettél egy teljes stack alkalmazást Azure-ra
- ✅ Végeztél kódmódosításokat és újratelepítetted
- ✅ Több környezetet kezeltél
- ✅ Eltávolítottad az erőforrásokat

## 🎯 Készség-ellenőrző feladatok

### 1. Feladat: Egy másik sablon telepítése (15 perc)
**Cél**: Bizonyítsd be az azd init és a telepítési munkafolyamat magabiztos használatát

```bash
# Próbáld ki a Python + MongoDB stacket
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Ellenőrizd a telepítést
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Tisztítsd meg
azd down --force --purge
```

**Siker kritériumok:**
- [ ] Az alkalmazás hibamentesen települ
- [ ] Az alkalmazás URL-je elérhető a böngészőben
- [ ] Az alkalmazás megfelelően működik (todo-k hozzáadása/törlése)
- [ ] Minden erőforrást sikeresen eltávolítottál

### 2. Feladat: Konfiguráció testreszabása (20 perc)
**Cél**: Gyakorold a környezeti változók konfigurálását

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

**Siker kritériumok:**
- [ ] Egyedi környezet sikeresen létrehozva
- [ ] A környezeti változók beállíthatók és lekérdezhetők
- [ ] Az alkalmazás a testreszabott konfigurációval települ
- [ ] Ellenőrizhetőek a testreszabott beállítások a telepített alkalmazásban

### 3. Feladat: Többkörnyezetes munkafolyamat (25 perc)
**Cél**: Sajátítsd el a környezetkezelést és telepítési stratégiákat

```bash
# Hozd létre a fejlesztési környezetet
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Jegyezd fel a fejlesztési URL-t
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Hozd létre a staging környezetet
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Jegyezd fel a staging URL-t
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Hasonlítsd össze a környezeteket
azd env list

# Teszteld mindkét környezetet
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Tisztítsd meg mindkét környezetet
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Siker kritériumok:**
- [ ] Két eltérő konfigurációjú környezet létrehozva
- [ ] Mindkét környezet sikeresen telepítve
- [ ] Képes váltani a környezetek között az `azd env select` paranccsal
- [ ] A környezeti változók eltérnek a két környezet között
- [ ] Mindkét környezet erőforrásait sikeresen eltávolítottad

## 📊 Előrehaladásod

**Befektetett idő**: ~60-90 perc  
**Sajátított készségek**:
- ✅ Sablon alapú projekt inicializálás
- ✅ Azure-erőforrások kiépítése
- ✅ Alkalmazás telepítési munkafolyamatok
- ✅ Környezetkezelés
- ✅ Konfigurációkezelés
- ✅ Erőforrások tisztítása és költségkezelés

**Következő szint**: Készen állsz a [Konfigurációs útmutatóra](configuration.md), hogy megtanuld a haladó konfigurációs mintákat!

## Gyakori problémák elhárítása

### Hitelesítési hibák
```bash
# Jelentkezzen be újra az Azure-ba
az login

# Ellenőrizze az előfizetéshez való hozzáférést
az account show
```

### Telepítési hibák
```bash
# Hibakeresési naplózás engedélyezése
export AZD_DEBUG=true
azd up --debug

# Az alkalmazás naplóinak megtekintése az Azure-ban
azd monitor --logs

# Container Apps esetén használja az Azure CLI-t:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Erőforrásnév-ütközések
```bash
# Használjon egyedi környezetnevet
azd env new dev-$(whoami)-$(date +%s)
```

### Port/hálózati problémák
```bash
# Ellenőrizze, hogy a portok szabadok-e
netstat -an | grep :3000
netstat -an | grep :3100
```

## Következő lépések

Most, hogy befejezted az első projektedet, fedezd fel ezeket a haladó témákat:

### 1. Infrastruktúra testreszabása
- [Infrastruktúra mint kód](../chapter-04-infrastructure/provisioning.md)
- [Adjon hozzá adatbázisokat, tárhelyet és egyéb szolgáltatásokat](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD beállítása
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md) - Teljes CI/CD munkafolyamatok
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline konfigurálása

### 3. Éles üzem legjobb gyakorlatai
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md) - Biztonság, teljesítmény és figyelés

### 4. Több sablon felfedezése
```bash
# Sablonok böngészése kategória szerint
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Próbáljon ki különböző technológiai stackeket
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## További források

### Tananyagok
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Közösség és támogatás
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Sablonok és példák
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulálunk, hogy befejezted az első azd projektedet!** Most már készen állsz arra, hogy magabiztosan építs és telepíts lenyűgöző alkalmazásokat Azure-on.

---

**Fejezet-navigáció:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Felelősségkizárás:
Ezt a dokumentumot az AI-alapú fordítószolgáltatás, a Co-op Translator (https://github.com/Azure/co-op-translator) segítségével fordítottuk. Bár igyekszünk a pontosságra, felhívjuk a figyelmét, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti, anyanyelvi dokumentum tekintendő a hiteles forrásnak. Kritikus jelentőségű információk esetén professzionális, emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->