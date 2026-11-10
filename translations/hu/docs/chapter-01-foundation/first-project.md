# Az első projekted – Gyakorlati útmutató

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 1. fejezet – Alapok & Gyors indulás
- **⬅️ Előző**: [Telepítés és beállítás](installation.md)
- **➡️ Következő**: [Vidd be a saját alkalmazásod](bring-your-own-app.md)
- **🚀 Következő fejezet**: [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Bevezetés

Üdvözlünk az első Azure Developer CLI projektedben! Telepíteni fogsz egy todo alkalmazást React frontenddel, Node.js API-val és Azure Cosmos DB-vel. A sablon megőrizte a történelmi `todo-nodejs-mongo` nevet; az infrastruktúra jelenleg Cosmos DB-t használ NoSQL-hez, így a letöltött README-t és `infra/`-et tekintsd át, a névből ne következtess az adatbázis API-ra.

> 2026 novemberében ellenőrizve a `azd 1.37.2` és a nyilvános sablon alapján. Az alábbi példák Bash használatával készültek; JSON kinyeréshez szükséges a `jq` is. Az Azure telepítések költséggel járnak, ezért ez a felülvizsgálat során nem történtek meg.

## Tanulási célok

Ezt az útmutatót követve:
- Elsajátítod az azd projekt inicializációs munkafolyamatát sablonokkal
- Megismered az Azure Developer CLI projekt struktúráját és konfigurációs fájljait
- Lépésről lépésre végrehajtod egy alkalmazás teljes telepítését Azure-ra, beleértve az infrastruktúra felállítását
- Alkalmazásfrissítési és újratelepítési stratégiákat valósítasz meg
- Több környezet (fejlesztési, staging) kezelését gyakorolod
- Erőforrás takarítást és költséggazdálkodást alkalmazol

## Tanulási eredmények

A végére képes leszel:
- Azd projekteket sablonból önállóan inicializálni és konfigurálni
- Az azd projekt struktúráját hatékonyan böngészni és módosítani
- Teljeskörű alkalmazásokat egy parancssal telepíteni Azure-ra
- Gyakori telepítési és hitelesítési hibákat diagnosztizálni
- Több Azure környezetet kezelni különböző telepítési fázisokhoz
- Folyamatos telepítési munkafolyamatot megvalósítani az alkalmazásfrissítésekhez

## Kezdés

### Előfeltételek ellenőrző lista
- ✅ Azure Developer CLI telepítve ([Telepítési útmutató](installation.md))
- ✅ Azd bejelentkezés kész `azd auth login`-gyel
- ✅ Git telepítve a rendszereden
- ✅ Node.js 22 LTS (vagy a letöltött sablon által megkövetelt támogatott verzió)
- ✅ Visual Studio Code (ajánlott)

Mielőtt továbbmennél, futtasd le a beállítás ellenőrzőjét a tárház gyökeréből:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Ellenőrizd a beállításodat
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Ellenőrizd az opcionális Azure CLI hitelesítést

```bash
az account show
```

### Ellenőrizd a Node.js verzióját
```bash
node --version
```

## 1. lépés: Válassz és inicializálj egy sablont

Kezdjük egy népszerű todo alkalmazás sablonnal React frontenddel és Node.js API backenddel.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Mi történt?
- Letöltötte a sablon kódját a helyi könyvtárba
- Létrehozott egy `azure.yaml` fájlt szolgáltatás definíciókkal
- Felállította az infrastruktúra kódot az `infra/` könyvtárban
- Környezeti konfigurációt hozott létre

## 2. lépés: Fedezd fel a projekt struktúráját

Nézzük meg, mit készített az azd:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Látni kell:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Fontos fájlok megértése

**azure.yaml** – Az azd projekt központi eleme:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastruktúra definíció:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## 3. lépés: Testreszabhatod a projektet (opcionális)

A telepítés előtt személyre szabhatod az alkalmazást:

### Módosítsd a frontendet
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Tegyél egy egyszerű változtatást:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Állíts be környezeti változókat
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Ezek a két egyedi érték csak helyi tárolást demonstrál. A sablon nem használja a `WEBSITE_TITLE` vagy `API_VERSION`-t, így nem változtatja az alkalmazást. A fent explicit forrásmódosítás megváltoztatja a megjelenített címet.

## 4. lépés: Telepíts Azure-ra

Most jön az izgalmas rész – mindent telepítesz Azure-ra!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Mi történik a telepítés során?

A munkafolyamat az infrastruktúrát állítja fel, majd becsomagolja és telepíti a kódot. A pontos sorrend a `workflows.up`-en keresztül testreszabható a `azure.yaml`-ben; ennél a sablonnál előbb protvízió, majd telepítés történik. Ne támaszkodj egyetlen univerzális szakaszrendre minden sablonnál.

### Várt kimenet
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 5. lépés: Teszteld az alkalmazásod

### Érj el az alkalmazásodhoz
Kattints a telepítési kimenetben megadott URL-re, vagy kérd le bármikor:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Teszteld a todo alkalmazást
1. **Adj hozzá egy tennivalót** – kattints az "Add Todo" gombra és írd be a feladatot
2. **Jelöld késznek** – pipáld ki a befejezett feladatokat
3. **Töröld a tételeket** – távolítsd el a felesleges feladatokat

### Figyeld az alkalmazásodat
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Ellenőrizd a telepítést

Mielőtt továbblépsz, fuss végig ezen a gyors ellenőrző listán, hogy biztosan minden működik – ne feltételezd, hogy a „telepítés sikeres” egyenlő azzal, hogy az alkalmazás működik:

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**A telepítés ellenőrzött, ha:**
- ✅ `azd show` elérhető végpont URL-t mutat
- ✅ Az URL hibamentesen nyílik meg a böngésződben
- ✅ A fő funkciók működnek (todo hozzáadása/készre jelölése/törlése)
- ✅ `azd monitor --logs` mutatja a sikeres lekéréseket hibák nélkül

Ha bármelyik ellenőrzés sikertelen, ugorj a [7. fejezet: Hibakeresés](../chapter-07-troubleshooting/README.md) részre.

## 6. lépés: Végezz módosításokat és telepíts újra

Tegyünk egy változtatást, és nézzük meg, milyen egyszerű a frissítés:

### Módosítsd az API-t
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Adj hozzá egy egyedi válaszfejlécet:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Telepítsd csak a kódváltozásokat
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## 7. lépés: Kezeld a több környezetet

Hozz létre egy staging környezetet a változások teszteléséhez élesítés előtt:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Környezetek összehasonlítása
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## 8. lépés: Erőforrások tisztítása

Ha befejezted a kísérletezést, töröld az erőforrásokat a fennmaradó költségek elkerülése érdekében:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Klasszikus alkalmazás vs. AI-alapú app: ugyanaz a munkafolyamat

Most egy hagyományos webalkalmazást telepítettél. De mi van, ha egy AI-alapú appot szeretnél telepíteni – például Microsoft Foundry Modellek által támogatott chat alkalmazást?

A jó hír: **a munkafolyamat ugyanaz.**

| Lépés | Klasszikus Todo App | AI Chat App |
|------|-----------------|-------------|
| Inicializálás (üres könyvtár) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Hitelesítés | `azd auth login` | `azd auth login` |
| Telepítés | `azd up` | `azd up` |
| Figyelés | `azd monitor` | `azd monitor` |
| Takarítás | `azd down --force --purge` | `azd down --force --purge` |

Az életciklus parancsok azonosak, de az előfeltételek különböznek. Egy AI sablon megkövetelheti a modell elérést, regionális kvótát, adatbefogadást és további konfigurációkat. Olvasd el a README-t telepítés előtt; a `azd up` nem pótolja a hiányzó jogosultságokat vagy kvótát.

Ez az azd alapelve: **egy munkafolyamat, bármilyen terhelés.** A gyakorolt képességek – inicializálás, telepítés, figyelés, újratelepítés és takarítás – egyformán vonatkoznak AI alkalmazásokra és ügynökökre.

---

## Amit megtanultál

Gratulálunk! Sikeresen:
- ✅ Inicializáltál azd projektet sablonból
- ✅ Megismerted a projekt szerkezetét és a kulcsfontosságú fájlokat
- ✅ Teljeskörű alkalmazást telepítettél Azure-ra
- ✅ Végeztél kódmódosításokat és újratelepítettél
- ✅ Kezeltél több környezetet
- ✅ Kitakarítottad az erőforrásokat

## 🎯 Készségellenőrző feladatok

### 1. feladat: Telepíts egy másik sablont (15 perc)
**Cél**: Az azd init és telepítési munkafolyamat elsajátítása

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Siker kritériumok:**
- [ ] Az alkalmazás hibamentesen települ
- [ ] Az alkalmazás URL-je elérhető böngészőben
- [ ] Az alkalmazás helyesen működik (todo hozzáadása/törlése)
- [ ] Az összes erőforrás sikeresen törölve

### 2. feladat: Testreszabott konfiguráció (20 perc)
**Cél**: Gyakorolni a helyi környezeti érték tárolását, nem összetévesztve az futásidejű konfigurációval

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Siker kritériumok:**
- [ ] Egyedi környezet sikeresen létrehozva
- [ ] Környezeti változók beállítva és lekérdezhetőek
- [ ] `azd env get-value APP_TITLE` kiírja a `My Custom Todo App`-t
- [ ] Meg tudja magyarázni, miért nem változtatják meg ezek az értékek az alap alkalmazást, hacsak a kód/infrastruktúra nem használja őket

### 3. feladat: Több környezetes munkafolyamat (25 perc)
**Cél**: Környezetkezelés és telepítési stratégiák elsajátítása

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Siker kritériumok:**
- [ ] Két környezet jött létre különböző konfigurációkkal
- [ ] Mindkét környezet sikeresen telepítve
- [ ] Átkapcsolás a környezetek között `azd env select` segítségével lehetséges
- [ ] A környezeti változók különböznek a környezetek között
- [ ] Mindkét környezet sikeresen le lett takarítva

## 📊 Haladásod

**Ráfordított idő**: kb. 60-90 perc  
**Sajátított készségek**:
- ✅ Sablon alapú projekt inicializáció
- ✅ Azure erőforrás biztosítás
- ✅ Alkalmazás telepítési munkafolyamatok
- ✅ Környezet kezelés
- ✅ Konfiguráció kezelés
- ✅ Erőforrás takarítás és költséggazdálkodás

**Következő szint**: Készen állsz a [Konfigurációs útmutató](../chapter-03-configuration/configuration.md) tanulmányozására az előrehaladott konfigurációs mintákért!

## Gyakori problémák elhárítása

### Hitelesítési hibák
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Telepítési hibák
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Erőforrás névütközések
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Port/hálózati problémák
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Következő lépések

Miután befejezted az első projektet, fedezd fel ezeket a haladó témaköröket:

### 1. Infrastruktúra személyre szabása
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Adatbázis infrastruktúra hozzáadása](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. CI/CD beállítása
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md) – Komplett CI/CD munkafolyamatok
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) – Pipeline konfiguráció

### 3. Éles üzem legjobb gyakorlatai
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md) – Biztonság, teljesítmény és monitorozás

### 4. Több sablon felfedezése
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## További források

### Tananyagok
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Építészeti Központ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Közösség és támogatás
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow – azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Sablonok & Példák
- [Hivatalos sablongyűjtemény](https://azure.github.io/awesome-azd/)
- [Közösségi sablon hozzájárulások](https://github.com/Azure/awesome-azd)
- [Todo sablon forrása](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Gratulálunk első azd projekted befejezéséhez!** Most már magabiztosan építhetsz és telepíthetsz nagyszerű alkalmazásokat Azure-on.

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 1. fejezet – Alapok & Gyors indulás
- **⬅️ Előző**: [Telepítés és beállítás](installation.md)
- **➡️ Következő**: [Vidd be a saját alkalmazásod](bring-your-own-app.md)
- **🚀 Következő fejezet**: [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->