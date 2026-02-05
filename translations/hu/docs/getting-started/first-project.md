# Az első projekted - Gyakorlati útmutató

**Fejezet navigáció:**
- **📚 Kurzus kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 1. fejezet - Alapok és gyors kezdés
- **⬅️ Előző**: [Telepítés és beállítás](installation.md)
- **➡️ Következő**: [Konfiguráció](configuration.md)
- **🚀 Következő fejezet**: [2. fejezet: AI-első fejlesztés](../microsoft-foundry/microsoft-foundry-integration.md)

## Bevezetés

Üdvözlünk az első Azure Developer CLI projektedben! Ez az átfogó gyakorlati útmutató bemutatja, hogyan hozhatsz létre, telepíthetsz és kezelhetsz egy teljes stack alkalmazást az Azure-on az azd segítségével. Egy valós todo alkalmazással fogsz dolgozni, amely React frontendet, Node.js API backendet és MongoDB adatbázist tartalmaz.

## Tanulási célok

A tutorial elvégzésével:
- Elsajátítod az azd projekt inicializálási folyamatát sablonok használatával
- Megérted az Azure Developer CLI projekt struktúráját és konfigurációs fájljait
- Teljes alkalmazás telepítést hajtasz végre az Azure-ra, beleértve az infrastruktúra létrehozását
- Alkalmazás frissítéseket és újratelepítési stratégiákat valósítasz meg
- Több környezetet kezelsz fejlesztéshez és teszteléshez
- Erőforrások tisztítását és költségkezelési gyakorlatokat alkalmazol

## Tanulási eredmények

A tutorial befejezése után képes leszel:
- Önállóan inicializálni és konfigurálni azd projekteket sablonokból
- Hatékonyan navigálni és módosítani az azd projekt struktúrákat
- Teljes stack alkalmazásokat telepíteni az Azure-ra egyetlen parancs segítségével
- Gyakori telepítési problémákat és hitelesítési hibákat elhárítani
- Több Azure környezetet kezelni különböző telepítési szakaszokhoz
- Folyamatos telepítési munkafolyamatokat megvalósítani alkalmazás frissítésekhez

## Első lépések

### Előfeltételek ellenőrzőlista
- ✅ Azure Developer CLI telepítve ([Telepítési útmutató](installation.md))
- ✅ Azure CLI telepítve és hitelesítve
- ✅ Git telepítve a rendszereden
- ✅ Node.js 16+ (ehhez a tutorialhoz)
- ✅ Visual Studio Code (ajánlott)

### Ellenőrizd a beállításokat
```bash
# Ellenőrizze az azd telepítést
azd version
```
### Ellenőrizd az Azure hitelesítést

```bash
az account show
```

### Ellenőrizd a Node.js verziót
```bash
node --version
```

## 1. lépés: Válassz és inicializálj egy sablont

Kezdjünk egy népszerű todo alkalmazás sablonnal, amely React frontendet és Node.js API backendet tartalmaz.

```bash
# Böngésszen az elérhető sablonok között
azd template list

# Inicializálja a teendő alkalmazás sablont
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Kövesse az utasításokat:
# - Adja meg a környezet nevét: "dev"
# - Válasszon egy előfizetést (ha több van)
# - Válasszon egy régiót: "East US 2" (vagy az Ön által preferált régiót)
```

### Mi történt?
- Letöltötted a sablon kódot a helyi könyvtáradba
- Létrehoztál egy `azure.yaml` fájlt szolgáltatás definíciókkal
- Beállítottad az infrastruktúra kódot az `infra/` könyvtárban
- Létrehoztál egy környezet konfigurációt

## 2. lépés: Fedezd fel a projekt struktúrát

Nézzük meg, mit hozott létre az azd:

```bash
# Tekintse meg a projekt struktúráját
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

### Fontos fájlok, amelyeket meg kell érteni

**azure.yaml** - Az azd projekt szíve:
```bash
# Tekintse meg a projekt konfigurációját
cat azure.yaml
```

**infra/main.bicep** - Infrastruktúra definíció:
```bash
# Tekintse meg az infrastruktúra kódját
head -30 infra/main.bicep
```

## 3. lépés: Testreszabás (opcionális)

A telepítés előtt testreszabhatod az alkalmazást:

### Frontend módosítása
```bash
# Nyissa meg a React alkalmazás komponenst
code src/web/src/App.tsx
```

Végezzen egy egyszerű változtatást:
```typescript
// Keresse meg a címet és változtassa meg
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

Most jön az izgalmas rész - telepítsd mindent az Azure-ra!

```bash
# Infrastruktúra és alkalmazás telepítése
azd up

# Ez a parancs:
# 1. Azure erőforrások biztosítása (App Service, Cosmos DB, stb.)
# 2. Az alkalmazás felépítése
# 3. Telepítés a biztosított erőforrásokra
# 4. Az alkalmazás URL-jének megjelenítése
```

### Mi történik a telepítés során?

Az `azd up` parancs a következő lépéseket hajtja végre:
1. **Provision** (`azd provision`) - Azure erőforrások létrehozása
2. **Package** - Az alkalmazás kódjának összeállítása
3. **Deploy** (`azd deploy`) - Kód telepítése az Azure erőforrásokra

### Várható kimenet
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 5. lépés: Teszteld az alkalmazást

### Az alkalmazás elérése
Kattints a telepítési kimenetben megadott URL-re, vagy bármikor lekérheted:
```bash
# Szerezze meg az alkalmazás végpontjait
azd show

# Nyissa meg az alkalmazást a böngészőjében
azd show --output json | jq -r '.services.web.endpoint'
```

### Teszteld a Todo alkalmazást
1. **Adj hozzá egy todo elemet** - Kattints az "Add Todo" gombra, és adj meg egy feladatot
2. **Jelöld késznek** - Pipáld ki a kész elemeket
3. **Töröld az elemeket** - Távolítsd el a már nem szükséges todo-kat

### Az alkalmazás monitorozása
```bash
# Nyissa meg az Azure portált az erőforrásaihoz
azd monitor

# Tekintse meg az alkalmazásnaplókat
azd logs
```

## 6. lépés: Változtatások és újratelepítés

Végezzünk egy változtatást, és nézzük meg, milyen egyszerű frissíteni:

### API módosítása
```bash
# Szerkeszd az API kódot
code src/api/src/routes/lists.js
```

Adj hozzá egy egyedi válaszfejlécet:
```javascript
// Keressen egy útvonalkezelőt, és adja hozzá:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Csak a kódváltozásokat telepítsd
```bash
# Csak az alkalmazáskódot telepítse (kihagyja az infrastruktúrát)
azd deploy

# Ez sokkal gyorsabb, mint az 'azd up', mivel az infrastruktúra már létezik
```

## 7. lépés: Több környezet kezelése

Hozz létre egy tesztkörnyezetet, hogy a változtatásokat élesítés előtt tesztelhesd:

```bash
# Hozzon létre egy új staging környezetet
azd env new staging

# Telepítés staging környezetbe
azd up

# Váltás vissza a fejlesztői környezetre
azd env select dev

# Az összes környezet felsorolása
azd env list
```

### Környezetek összehasonlítása
```bash
# Nézd meg a fejlesztési környezetet
azd env select dev
azd show

# Nézd meg a tesztelési környezetet
azd env select staging
azd show
```

## 8. lépés: Erőforrások tisztítása

Ha befejezted a kísérletezést, tisztítsd meg az erőforrásokat, hogy elkerüld a folyamatos költségeket:

```bash
# Törölje az összes Azure erőforrást az aktuális környezethez
azd down

# Kényszerített törlés megerősítés nélkül és a lágyan törölt erőforrások végleges törlése
azd down --force --purge

# Adott környezet törlése
azd env select staging
azd down --force --purge
```

## Amit megtanultál

Gratulálunk! Sikeresen:
- ✅ Inicializáltál egy azd projektet sablonból
- ✅ Felfedezted a projekt struktúrát és kulcsfontosságú fájlokat
- ✅ Telepítettél egy teljes stack alkalmazást az Azure-ra
- ✅ Kódváltoztatásokat végeztél és újratelepítettél
- ✅ Több környezetet kezeltél
- ✅ Tisztítottad az erőforrásokat

## 🎯 Képességellenőrző gyakorlatok

### Gyakorlat 1: Telepíts egy másik sablont (15 perc)
**Cél**: Az azd inicializálási és telepítési munkafolyamat elsajátítása

```bash
# Próbáld ki a Python + MongoDB stackot
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Ellenőrizd a telepítést
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Takarítsd el
azd down --force --purge
```

**Siker kritériumok:**
- [ ] Az alkalmazás hibamentesen települ
- [ ] Az alkalmazás URL-je elérhető a böngészőben
- [ ] Az alkalmazás megfelelően működik (todo-k hozzáadása/törlése)
- [ ] Az összes erőforrás sikeresen tisztítva

### Gyakorlat 2: Konfiguráció testreszabása (20 perc)
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

# Telepítés egyéni konfigurációval
azd up
```

**Siker kritériumok:**
- [ ] Egyedi környezet sikeresen létrehozva
- [ ] Környezeti változók beállítva és lekérhetők
- [ ] Az alkalmazás egyedi konfigurációval települ
- [ ] Az egyedi beállítások ellenőrizhetők a telepített alkalmazásban

### Gyakorlat 3: Több környezet munkafolyamat (25 perc)
**Cél**: Környezetkezelési és telepítési stratégiák elsajátítása

```bash
# Hozzon létre fejlesztési környezetet
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Jegyezze fel a fejlesztési URL-t
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Hozzon létre tesztelési környezetet
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Jegyezze fel a tesztelési URL-t
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Hasonlítsa össze a környezeteket
azd env list

# Tesztelje mindkét környezetet
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Takarítsa el mindkettőt
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Siker kritériumok:**
- [ ] Két környezet létrehozva különböző konfigurációkkal
- [ ] Mindkét környezet sikeresen telepítve
- [ ] Környezetek közötti váltás az `azd env select` használatával
- [ ] Környezeti változók eltérnek a környezetek között
- [ ] Mindkét környezet sikeresen tisztítva

## 📊 Haladásod

**Befektetett idő**: ~60-90 perc  
**Elsajátított készségek**:
- ✅ Sablon alapú projekt inicializálás
- ✅ Azure erőforrások létrehozása
- ✅ Alkalmazás telepítési munkafolyamatok
- ✅ Környezetkezelés
- ✅ Konfigurációkezelés
- ✅ Erőforrás tisztítás és költségkezelés

**Következő szint**: Készen állsz a [Konfigurációs útmutató](configuration.md) elvégzésére, hogy fejlett konfigurációs mintákat tanulj!

## Gyakori problémák elhárítása

### Hitelesítési hibák
```bash
# Újrahitelesítés az Azure-val
az login

# Előfizetési hozzáférés ellenőrzése
az account show
```

### Telepítési hibák
```bash
# Engedélyezze a hibakeresési naplózást
export AZD_DEBUG=true
azd up --debug

# Részletes naplók megtekintése
azd logs --service api
azd logs --service web
```

### Erőforrás névütközések
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

Most, hogy befejezted az első projektedet, fedezd fel ezeket a haladó témákat:

### 1. Infrastruktúra testreszabása
- [Infrastruktúra mint kód](../deployment/provisioning.md)
- [Adatbázisok, tárolók és egyéb szolgáltatások hozzáadása](../deployment/provisioning.md#adding-services)

### 2. CI/CD beállítása
- [GitHub Actions integráció](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Éles környezet legjobb gyakorlatok
- [Biztonsági konfigurációk](../deployment/best-practices.md#security)
- [Teljesítmény optimalizálás](../deployment/best-practices.md#performance)
- [Monitorozás és naplózás](../deployment/best-practices.md#monitoring)

### 4. További sablonok felfedezése
```bash
# Böngésszen sablonokat kategóriák szerint
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
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architektúra Központ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Közösség és támogatás
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Fejlesztői Közösség](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Sablonok és példák
- [Hivatalos sablongaléria](https://azure.github.io/awesome-azd/)
- [Közösségi sablonok](https://github.com/Azure-Samples/azd-templates)
- [Vállalati minták](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulálunk az első azd projekted befejezéséhez!** Most már magabiztosan építhetsz és telepíthetsz lenyűgöző alkalmazásokat az Azure-on.

---

**Fejezet navigáció:**
- **📚 Kurzus kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 1. fejezet - Alapok és gyors kezdés
- **⬅️ Előző**: [Telepítés és beállítás](installation.md)
- **➡️ Következő**: [Konfiguráció](configuration.md)
- **🚀 Következő fejezet**: [2. fejezet: AI-első fejlesztés](../microsoft-foundry/microsoft-foundry-integration.md)
- **Következő lecke**: [Telepítési útmutató](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Fontos információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->