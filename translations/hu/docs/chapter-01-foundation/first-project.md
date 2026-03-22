# Az első projekted - Gyakorlati útmutató

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 1. fejezet - Alapok & Gyors kezdés
- **⬅️ Előző**: [Telepítés & Beállítás](installation.md)
- **➡️ Következő**: [Konfiguráció](configuration.md)
- **🚀 Következő fejezet**: [2. fejezet: AI-First fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Bevezetés

Üdvözlünk az első Azure Developer CLI projektedben! Ez az átfogó gyakorlati útmutató teljes körűen végigvezeti az Azure-on egy teljeskörű alkalmazás létrehozásán, telepítésén és kezelésén az azd segítségével. Egy valós todo alkalmazással fogsz dolgozni, amely React frontendből, Node.js API backendből és MongoDB adatbázisból áll.

## Tanulási célok

A bemutató befejezésével:
- Elsajátítod az azd projekt inicializálásának munkafolyamatát sablonok használatával
- Megérted az Azure Developer CLI projekt szerkezetét és konfigurációs fájljait
- Végrehajtod az alkalmazás teljes körű telepítését Azure-ra infrastruktúra biztosításával
- Megvalósítod az alkalmazásfrissítéseket és újratelepítési stratégiákat
- Kezeled a több környezetet fejlesztéshez és élesítéshez
- Alkalmazod az erőforrás-tisztítás és költségkezelés legjobb gyakorlatait

## Tanulási eredmények

A befejezés után képes leszel:
- Saját maga inicializálni és konfigurálni az azd projekteket sablonok alapján
- Hatékonyan navigálni és módosítani az azd projekt szerkezetét
- Egyetlen parancs segítségével telepíteni teljeskörű alkalmazásokat Azure-ra
- Hibakeresni a gyakori telepítési és hitelesítési problémákat
- Több Azure környezetet kezelni különböző telepítési szakaszokhoz
- Folyamatos telepítési munkafolyamatokat megvalósítani az alkalmazásfrissítésekhez

## Kezdjük el

### Előfeltételek ellenőrzőlista
- ✅ Azure Developer CLI telepítve ([Telepítési útmutató](installation.md))
- ✅ Azure CLI telepítve és hitelesítve
- ✅ Git telepítve a rendszereden
- ✅ Node.js 16+ (ehhez a bemutatóhoz)
- ✅ Visual Studio Code (ajánlott)

### Ellenőrizd a beállításaidat
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

## 1. lépés: Válassz és inicializálj egy sablont

Kezdjünk egy népszerű todo alkalmazás sablonnal, amely React frontendet és Node.js API backendet tartalmaz.

```bash
# Böngésszen az elérhető sablonok között
azd template list

# Inicializálja a teendő alkalmazás sablonját
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Kövesse az utasításokat:
# - Adjon meg egy környezet nevét: "dev"
# - Válasszon egy előfizetést (ha több van)
# - Válasszon egy régiót: "East US 2" (vagy az Ön által preferált régió)
```

### Mi történt éppen?
- Letöltöttük a sablonkódot a helyi mappádba
- Létrehoztunk egy `azure.yaml` fájlt a szolgáltatásdefiníciókkal
- Beállítottuk az infrastruktúra kódot az `infra/` mappában
- Létrehoztunk egy környezeti konfigurációt

## 2. lépés: Vizsgáld meg a projekt szerkezetét

Nézzük meg, mit hozott létre az azd:

```bash
# Nézze meg a projekt szerkezetét
tree /f   # Windows
# vagy
find . -type f | head -20   # macOS/Linux
```

Ezeket kell látnod:
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
# A projekt konfigurációjának megtekintése
cat azure.yaml
```

**infra/main.bicep** - Infrastruktúra definíció:
```bash
# Tekintse meg az infrastruktúra kódját
head -30 infra/main.bicep
```

## 3. lépés: Testreszabás (opcionális)

A telepítés előtt testre szabhatod az alkalmazást:

### Frontend módosítása
```bash
# Nyissa meg a React alkalmazás komponenst
code src/web/src/App.tsx
```

Egyszerű módosítás:
```typescript
// Keresd meg a címet és változtasd meg
<h1>My Awesome Todo App</h1>
```

### Környezeti változók konfigurálása
```bash
# Egyedi környezeti változók beállítása
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Az összes környezeti változó megtekintése
azd env get-values
```

## 4. lépés: Telepítés Azure-ra

Itt az izgalmas rész – telepíts mindent Azure-ra!

```bash
# Infrastruktúra és alkalmazás telepítése
azd up

# Ez a parancs a következőket hajtja végre:
# 1. Azure-erőforrások létrehozása (App Service, Cosmos DB stb.)
# 2. Az alkalmazás felépítése
# 3. Telepítés a létrehozott erőforrásokra
# 4. Az alkalmazás URL-jének megjelenítése
```

### Mi történik a telepítés során?

Az `azd up` parancs a következő lépéseket hajtja végre:
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

## 5. lépés: Teszteld az alkalmazásodat

### Alkalmazás elérése
Kattints a telepítési kimenetben megadott URL-re, vagy később bármikor elérheted:
```bash
# Alkalmazás végpontjainak lekérése
azd show

# Nyissa meg az alkalmazást a böngészőjében
azd show --output json | jq -r '.services.web.endpoint'
```

### Teszteld a Todo alkalmazást
1. **Hozzáadás** - Kattints az "Add Todo" gombra és írj be egy feladatot
2. **Jelöld késznek** - Pipáld ki a teljesített tételeket
3. **Törlés** - Távolítsd el a már nem szükséges todo-kat

### Alkalmazás figyelése
```bash
# Nyissa meg az Azure portált az erőforrásaihoz
azd monitor

# Alkalmazásnaplók megtekintése
azd monitor --logs

# Élő mérőszámok megtekintése
azd monitor --live
```

## 6. lépés: Változtatások és újratelepítés

Tegyük meg a módosítást, és nézzük meg, milyen egyszerű frissíteni:

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

### Csak a kód módosításainak telepítése
```bash
# Csak az alkalmazáskód telepítése (hagyja ki az infrastruktúrát)
azd deploy

# Ez sokkal gyorsabb, mint az 'azd up', mivel az infrastruktúra már létezik
```

## 7. lépés: Több környezet kezelése

Hozz létre egy staging környezetet a változtatások élesítés előtti teszteléséhez:

```bash
# Hozzon létre egy új tesztkörnyezetet
azd env new staging

# Telepítés a tesztkörnyezetbe
azd up

# Váltás vissza a fejlesztői környezetre
azd env select dev

# Az összes környezet listázása
azd env list
```

### Környezetek összehasonlítása
```bash
# Fejlesztői környezet megtekintése
azd env select dev
azd show

# Tesztkörnyezet megtekintése
azd env select staging
azd show
```

## 8. lépés: Erőforrások tisztítása

Ha végzett az ember a kísérletezéssel, takarítsa ki a környezetet, hogy elkerülje a további költségeket:

```bash
# Töröld az összes Azure erőforrást az aktuális környezethez
azd down

# Erőltetett törlés megerősítés nélkül és a lágyan törölt erőforrások végleges eltávolítása
azd down --force --purge

# Egy adott környezet törlése
azd env select staging
azd down --force --purge
```

## Klasszikus alkalmazás vs. AI-alapú alkalmazás: Ugyanaz a munkafolyamat

Éppen egy hagyományos webalkalmazást telepítettél. De mi lenne, ha egy AI-alapú appot, például egy Microsoft Foundry Modellek által támogatott chat alkalmazást szeretnél telepíteni?

A jó hír: **a munkafolyamat teljesen azonos.**

| Lépés | Klasszikus Todo alkalmazás | AI Chat alkalmazás |
|------|-----------------|-------------|
| Inicializálás | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Hitelesítés | `azd auth login` | `azd auth login` |
| Telepítés | `azd up` | `azd up` |
| Figyelés | `azd monitor` | `azd monitor` |
| Takarítás | `azd down --force --purge` | `azd down --force --purge` |

Az egyetlen különbség az a **sablon**, amellyel indulsz. Egy AI sablon további infrastruktúrát tartalmaz (például Microsoft Foundry Models forrást vagy AI Search indexet), de azd mindent kezel helyetted. Nem kell új parancsokat tanulnod, más eszközt használnod, vagy újra gondolkodnod a telepítésről.

Ez az azd alapelve: **egy munkafolyamat, bármilyen terhelés.** Az ebben a bemutatóban gyakorolt készségek – inicializálás, telepítés, monitorozás, újratelepítés és takarítás – egyaránt alkalmazhatók AI alkalmazásokra és ügynökökre.

---

## Amit megtanultál

Gratulálunk! Sikeresen:
- ✅ Inicializáltál egy azd projektet sablonból
- ✅ Felfedezted a projekt szerkezetét és kulcsfontosságú fájljait
- ✅ Telepítettél egy teljeskörű alkalmazást Azure-ra
- ✅ Végeztél kódmódosításokat és újratelepítést
- ✅ Kezeltél több környezetet
- ✅ Tisztítottál az erőforrások között

## 🎯 Készség-ellenőrző feladatok

### Feladat 1: Egy másik sablon telepítése (15 perc)
**Cél**: Bemutatni az azd init és telepítési munkafolyamat ismeretét

```bash
# Próbáld ki a Python + MongoDB stack-et
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Ellenőrizd a telepítést
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Takarítsd ki
azd down --force --purge
```

**Siker kritérium:**
- [ ] Az alkalmazás hiba nélkül települ
- [ ] El tudod érni az alkalmazás URL-jét böngészőben
- [ ] Az alkalmazás hibátlanul működik (todo-k hozzáadása/törlése)
- [ ] Sikeresen kitakarítottad az összes erőforrást

### Feladat 2: Konfiguráció testreszabása (20 perc)
**Cél**: Gyakorolni a környezeti változók konfigurálását

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

**Siker kritérium:**
- [ ] Egyedi környezet létrehozva sikeresen
- [ ] Környezeti változók beállítva és lekérdezhetők
- [ ] Az alkalmazás egyedi konfigurációval települ
- [ ] Ellenőrizni tudod az egyedi beállításokat a telepített alkalmazásban

### Feladat 3: Több-környezetes munkafolyamat (25 perc)
**Cél**: Mélyíteni a környezetkezelést és telepítési stratégiákat

```bash
# Fejlesztői környezet létrehozása
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Fejlesztői URL megjegyzése
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Tesztkörnyezet létrehozása
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Tesztkörnyezeti URL megjegyzése
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

**Siker kritérium:**
- [ ] Két különböző konfigurációjú környezet létrehozva
- [ ] Mindkét környezet sikeresen telepítve
- [ ] Tudsz váltani a környezetek között az `azd env select` használatával
- [ ] A környezeti változók különböznek a környezetek között
- [ ] Sikeresen kitakarítottad mindkét környezetet

## 📊 Haladásod

**Befektetett idő**: ~60-90 perc  
**Elsajátított készségek**:
- ✅ Sablonalapú projekt inicializálás
- ✅ Azure erőforrás biztosítása
- ✅ Alkalmazás telepítési munkafolyamatok
- ✅ Környezetkezelés
- ✅ Konfigurációkezelés
- ✅ Erőforrás tisztítás és költségmenedzsment

**Következő szint**: Készen állsz a [Konfigurációs útmutató](configuration.md) megismerésére az előrehaladott konfigurációs mintákhoz!

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

# Alkalmazásnaplók megtekintése Azure-ban
azd monitor --logs

# Konténer alkalmazásokhoz használja az Azure CLI-t:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Erőforrásnév ütközések
```bash
# Használjon egyedi környezeti nevet
azd env new dev-$(whoami)-$(date +%s)
```

### Port/hálózati problémák
```bash
# Ellenőrizze, hogy a portok elérhetők-e
netstat -an | grep :3000
netstat -an | grep :3100
```

## Következő lépések

Most, hogy befejezted az első projekted, fedezd fel ezeket a haladó témákat:

### 1. Infrastruktúra testreszabása
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Adja hozzá az adatbázisokat, tárhelyet és más szolgáltatásokat](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD beállítása
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md) - Teljes CI/CD munkafolyamatok
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline konfiguráció

### 3. Éles környezet legjobb gyakorlatai
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md) - Biztonság, teljesítmény és monitorozás

### 4. Több sablon felfedezése
```bash
# Böngésszen a sablonok között kategória szerint
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Próbáljon ki különböző technológiai készleteket
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## További források

### Tananyagok
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected keretrendszer](https://learn.microsoft.com/en-us/azure/well-architected/)

### Közösség & Támogatás
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure fejlesztői közösség](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Sablonok & példák
- [Hivatalos sablongyűjtemény](https://azure.github.io/awesome-azd/)
- [Közösségi sablonok](https://github.com/Azure-Samples/azd-templates)
- [Vállalati minták](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulálunk az első azd projekted befejezéséhez!** Mostantól magabiztosan építhetsz és telepíthetsz lenyűgöző alkalmazásokat Azure-on.

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 1. fejezet - Alapok & Gyors kezdés
- **⬅️ Előző**: [Telepítés & Beállítás](installation.md)
- **➡️ Következő**: [Konfiguráció](configuration.md)
- **🚀 Következő fejezet**: [2. fejezet: AI-First fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Következő lecke**: [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Nyilatkozat**:  
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) használatával készült. Bár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum anyanyelvi verziója tekintendő hiteles forrásnak. Kritikus információk esetén professzionális emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->