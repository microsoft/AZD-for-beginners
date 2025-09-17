<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e131a5271d4c8eb0d44ae82302f8fd1a",
  "translation_date": "2025-09-12T22:15:33+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "hu"
}
-->
# Az első projekted - Gyakorlati útmutató

**Előző:** [Konfiguráció](configuration.md) | **Következő:** [Azure AI Foundry integráció](../ai-foundry/azure-ai-foundry-integration.md)

## Bevezetés

Üdvözlünk az első Azure Developer CLI projektedben! Ez az átfogó gyakorlati útmutató végigvezet egy teljes körű alkalmazás létrehozásán, telepítésén és kezelésén az Azure-on az azd használatával. Egy valós todo alkalmazással fogsz dolgozni, amely React frontendet, Node.js API backendet és MongoDB adatbázist tartalmaz.

## Tanulási célok

A tutorial elvégzésével:
- Elsajátítod az azd projekt inicializálási folyamatát sablonok használatával
- Megérted az Azure Developer CLI projektstruktúráját és konfigurációs fájljait
- Teljes alkalmazást telepítesz az Azure-ra, beleértve az infrastruktúra létrehozását
- Alkalmazásfrissítési és újratelepítési stratégiákat valósítasz meg
- Több környezetet kezelsz fejlesztéshez és teszteléshez
- Erőforrások tisztítását és költségkezelési gyakorlatokat alkalmazol

## Tanulási eredmények

A tutorial befejezése után képes leszel:
- Önállóan inicializálni és konfigurálni azd projekteket sablonokból
- Hatékonyan navigálni és módosítani azd projektstruktúrákat
- Teljes körű alkalmazásokat telepíteni az Azure-ra egyetlen parancs segítségével
- Gyakori telepítési problémákat és hitelesítési hibákat elhárítani
- Több Azure környezetet kezelni különböző telepítési szakaszokhoz
- Folyamatos telepítési munkafolyamatokat megvalósítani alkalmazásfrissítésekhez

## Első lépések

### Előfeltételek ellenőrzőlistája
- ✅ Azure Developer CLI telepítve ([Telepítési útmutató](installation.md))
- ✅ Azure CLI telepítve és hitelesítve
- ✅ Git telepítve a rendszereden
- ✅ Node.js 16+ (ehhez a tutorialhoz)
- ✅ Visual Studio Code (ajánlott)

### Ellenőrizd a beállításokat
```bash
# Check azd installation
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
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Mi történt?
- Letöltöttük a sablonkódot a helyi könyvtáradba
- Létrehoztunk egy `azure.yaml` fájlt szolgáltatásdefiníciókkal
- Beállítottuk az infrastruktúra kódot az `infra/` könyvtárban
- Létrehoztunk egy környezetkonfigurációt

## 2. lépés: Fedezd fel a projekt struktúráját

Nézzük meg, mit hozott létre az azd:

```bash
# View the project structure
tree /f   # Windows
# or
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

**azure.yaml** - Az azd projekt központi eleme:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastruktúra definíció:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## 3. lépés: Testreszabás (opcionális)

A telepítés előtt testreszabhatod az alkalmazást:

### Frontend módosítása
```bash
# Open the React app component
code src/web/src/App.tsx
```

Végezzen egy egyszerű változtatást:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Környezeti változók konfigurálása
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## 4. lépés: Telepítés az Azure-ra

Most jön az izgalmas rész - telepítsd mindent az Azure-ra!

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

Az `azd up` parancs a következő lépéseket hajtja végre:
1. **Provision** (`azd provision`) - Azure erőforrások létrehozása
2. **Package** - Az alkalmazáskód összeállítása
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
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Teszteld a Todo alkalmazást
1. **Adj hozzá egy todo elemet** - Kattints az "Add Todo" gombra, és adj meg egy feladatot
2. **Jelöld késznek** - Pipáld ki a kész elemeket
3. **Töröld az elemeket** - Távolítsd el a már nem szükséges todo-kat

### Az alkalmazás monitorozása
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## 6. lépés: Változtatások és újratelepítés

Végezzünk egy változtatást, és nézzük meg, milyen egyszerű frissíteni:

### API módosítása
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Adj hozzá egy egyedi válaszfejlécet:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Csak a kódváltozások telepítése
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## 7. lépés: Több környezet kezelése

Hozz létre egy tesztkörnyezetet, hogy a változtatásokat élesítés előtt tesztelhesd:

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

Ha végeztél a kísérletezéssel, tisztítsd meg az erőforrásokat, hogy elkerüld a folyamatos költségeket:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Amit megtanultál

Gratulálunk! Sikeresen:
- Inicializáltál egy azd projektet sablonból
- Felfedezted a projekt struktúráját és kulcsfontosságú fájljait
- Telepítettél egy teljes körű alkalmazást az Azure-ra
- Kódváltoztatásokat végeztél és újratelepítettél
- Több környezetet kezeltél
- Erőforrásokat tisztítottál meg

## Gyakori problémák elhárítása

### Hitelesítési hibák
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Telepítési hibák
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Erőforrásnév ütközések
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Hálózati problémák
```bash
# Check if ports are available
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

### 3. Éles környezet legjobb gyakorlatai
- [Biztonsági konfigurációk](../deployment/best-practices.md#security)
- [Teljesítmény optimalizálás](../deployment/best-practices.md#performance)
- [Monitorozás és naplózás](../deployment/best-practices.md#monitoring)

### 4. További sablonok felfedezése
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
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
- [Azure Developer Közösség](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Sablonok és példák
- [Hivatalos sablongaléria](https://azure.github.io/awesome-azd/)
- [Közösségi sablonok](https://github.com/Azure-Samples/azd-templates)
- [Vállalati minták](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulálunk az első azd projekted befejezéséhez!** Most már magabiztosan építhetsz és telepíthetsz lenyűgöző alkalmazásokat az Azure-on.

---

**Előző:** [Konfiguráció](configuration.md) | **Következő:** [Azure AI Foundry integráció](../ai-foundry/azure-ai-foundry-integration.md)
- **Következő lecke**: [Telepítési útmutató](../deployment/deployment-guide.md)

---

**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.