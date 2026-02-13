# Gyakori problémák és megoldások

**Fejezet navigáció:**
- **📚 Course Home**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 7. fejezet - Hibaelhárítás és hibakeresés
- **⬅️ Previous Chapter**: [6. fejezet: Előkészítő ellenőrzések](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [Hibakeresési útmutató](debugging.md)
- **🚀 Next Chapter**: [8. fejezet: Termelési és vállalati minták](../chapter-08-production/production-ai-practices.md)

## Bevezetés

Ez az átfogó hibaelhárítási útmutató lefedi az Azure Developer CLI használata során leggyakrabban előforduló problémákat. Tanulja meg diagnosztizálni, elhárítani és megoldani a hitelesítési, telepítési, infrastruktúra-létrehozási és alkalmazáskonfigurációs problémákat. Minden problémánál részletes tünetek, alapvető okok és lépésről lépésre követhető megoldási eljárások találhatók.

## Tanulási célok

A guide elvégzése után képes lesz:
- Az Azure Developer CLI problémáinak diagnosztikai technikáinak elsajátítására
- A közös hitelesítési és jogosultsági problémák és megoldásaik megértésére
- A telepítési hibák, infrastruktúra-létrehozási hibák és konfigurációs problémák megoldására
- Proaktív megfigyelési és hibakeresési stratégiák bevezetésére
- Rendszeres hibaelhárítási módszertanok alkalmazására összetett problémák esetén
- A megfelelő naplózás és monitorozás beállítására a jövőbeni problémák megelőzéséhez

## Tanulási eredmények

A kurzus elvégzése után képes lesz:
- Az Azure Developer CLI problémáinak beépített diagnosztikai eszközökkel történő diagnosztizálására
- A hitelesítési, előfizetés- és jogosultságokkal kapcsolatos problémák önálló megoldására
- A telepítési hibák és infrastruktúra-létrehozási hibák hatékony hibaelhárítására
- Az alkalmazáskonfigurációs problémák és környezetspecifikus hibák hibakeresésére
- Monitorozás és riasztás bevezetésére a potenciális problémák proaktív észleléséhez
- Hibakeresésre, naplózásra és problémamegoldási munkafolyamatokra vonatkozó legjobb gyakorlatok alkalmazására

## Gyors diagnosztika

Mielőtt belekezdene a konkrét problémákba, futtassa ezeket a parancsokat diagnosztikai információk gyűjtéséhez:

```bash
# Ellenőrizze az azd verzióját és állapotát
azd version
azd config list

# Ellenőrizze az Azure hitelesítését
az account show
az account list

# Ellenőrizze a jelenlegi környezetet
azd env show
azd env get-values

# Engedélyezze a hibakeresési naplózást
export AZD_DEBUG=true
azd <command> --debug
```

## Hitelesítési problémák

### Probléma: "Failed to get access token"
**Tünetek:**
- `azd up` meghiúsul hitelesítési hibákkal
- A parancsok "unauthorized" vagy "access denied" hibaüzenetet adnak vissza

**Megoldások:**
```bash
# 1. Jelentkezzen újra az Azure CLI segítségével
az login
az account show

# 2. Törölje a gyorsítótárazott hitelesítő adatokat
az account clear
az login

# 3. Használja az eszközkódos folyamatot (felhasználói felület nélküli rendszerekhez)
az login --use-device-code

# 4. Állítson be konkrét előfizetést
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Probléma: "Insufficient privileges" during deployment
**Tünetek:**
- A telepítés jogosultsági hibával sikertelen
- Nem lehet bizonyos Azure-erőforrásokat létrehozni

**Megoldások:**
```bash
# 1. Ellenőrizze az Azure szerepkiosztásait
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Győződjön meg róla, hogy rendelkezik a szükséges szerepekkel
# - Contributor (erőforrások létrehozásához)
# - User Access Administrator (a szerepkiosztásokhoz)

# 3. Lépjen kapcsolatba az Azure-rendszergazdával a megfelelő jogosultságokért
```

### Probléma: Multi-tenant authentication problems
**Megoldások:**
```bash
# 1. Bejelentkezés egy adott bérlővel
az login --tenant "your-tenant-id"

# 2. Állítsa be a bérlőt a konfigurációban
azd config set auth.tenantId "your-tenant-id"

# 3. Törölje a bérlő gyorsítótárát, ha bérlőt vált
az account clear
```

## 🏗️ Infrastruktúra létrehozási hibák

### Probléma: Resource name conflicts
**Tünetek:**
- "The resource name already exists" típusú hibák
- A telepítés meghiúsul az erőforrás létrehozásakor

**Megoldások:**
```bash
# 1. Használjon egyedi erőforrásneveket tokenekkel
# A Bicep sablonjában:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Módosítsa a környezet nevét
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Tisztítsa meg a meglévő erőforrásokat
azd down --force --purge
```

### Probléma: Location/Region not available
**Tünetek:**
- "The location 'xyz' is not available for resource type"
- Bizonyos SKU-k nem érhetők el a kiválasztott régióban

**Megoldások:**
```bash
# 1. Ellenőrizze az erőforrástípusokhoz elérhető helyszíneket
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Használjon általánosan elérhető régiókat
azd config set defaults.location eastus2
# vagy
azd env set AZURE_LOCATION eastus2

# 3. Ellenőrizze a szolgáltatás elérhetőségét régiónként
# Látogasson el: https://azure.microsoft.com/global-infrastructure/services/
```

### Probléma: Quota exceeded errors
**Tünetek:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Megoldások:**
```bash
# 1. Ellenőrizze a jelenlegi kvótahasználatot
az vm list-usage --location eastus2 -o table

# 2. Kvótaemelés kérése az Azure portálon keresztül
# Nyissa meg: Előfizetések > Használat és kvóták

# 3. Használjon kisebb SKU-kat fejlesztéshez
# A main.parameters.json fájlban:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Törölje a nem használt erőforrásokat
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Probléma: Bicep template errors
**Tünetek:**
- Sablon érvényesítési hibák
- Szintaktikai hibák a Bicep fájlokban

**Megoldások:**
```bash
# 1. Ellenőrizze a Bicep szintaxisát
az bicep build --file infra/main.bicep

# 2. Használja a Bicep lintert
az bicep lint --file infra/main.bicep

# 3. Ellenőrizze a paraméterfájl szintaxisát
cat infra/main.parameters.json | jq '.'

# 4. Tekintse át a telepítés változásait
azd provision --preview
```

## 🚀 Telepítési hibák

### Probléma: Build failures
**Tünetek:**
- Az alkalmazás összeállítása meghiúsul a telepítés során
- Csomagtelepítési hibák

**Megoldások:**
```bash
# 1. Ellenőrizze a build kimenetét a debug kapcsolóval
azd deploy --service web --debug

# 2. Tekintse meg a telepített szolgáltatás állapotát
azd show

# 3. Tesztelje a buildet lokálisan
cd src/web
npm install
npm run build

# 3. Ellenőrizze a Node.js/Python verziók kompatibilitását
node --version  # Meg kell egyeznie az azure.yaml beállításaival
python --version

# 4. Törölje a build gyorsítótárát
rm -rf node_modules package-lock.json
npm install

# 5. Ellenőrizze a Dockerfile-t, ha konténereket használ
docker build -t test-image .
docker run --rm test-image
```

### Probléma: Container deployment failures
**Tünetek:**
- A konténeralkalmazások nem indulnak el
- Image pull hibák

**Megoldások:**
```bash
# 1. A Docker build helyi tesztelése
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Konténer naplók ellenőrzése Azure CLI használatával
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Az alkalmazás figyelése az azd segítségével
azd monitor --logs

# 3. A konténerregiszter hozzáférésének ellenőrzése
az acr login --name myregistry

# 4. A konténeralkalmazás konfigurációjának ellenőrzése
az containerapp show --name my-app --resource-group my-rg
```

### Probléma: Database connection failures
**Tünetek:**
- Az alkalmazás nem tud kapcsolódni az adatbázishoz
- Kapcsolódási timeout hibák

**Megoldások:**
```bash
# 1. Ellenőrizze az adatbázis tűzfalszabályait
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Tesztelje az alkalmazásból a kapcsolódást
# Adja hozzá ideiglenesen az alkalmazásához:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Ellenőrizze a kapcsolati karakterlánc formátumát
azd env get-values | grep DATABASE

# 4. Ellenőrizze az adatbázisszerver állapotát
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfigurációs problémák

### Probléma: Environment variables not working
**Tünetek:**
- Az alkalmazás nem olvassa a konfigurációs értékeket
- A környezeti változók üresnek tűnnek

**Megoldások:**
```bash
# 1. Ellenőrizze, hogy a környezeti változók be vannak-e állítva
azd env get-values
azd env get DATABASE_URL

# 2. Ellenőrizze a változóneveket az azure.yaml fájlban
cat azure.yaml | grep -A 5 env:

# 3. Indítsa újra az alkalmazást
azd deploy --service web

# 4. Ellenőrizze az App Service konfigurációját
az webapp config appsettings list --name myapp --resource-group myrg
```

### Probléma: SSL/TLS certificate problems
**Tünetek:**
- HTTPS nem működik
- Tanúsítvány érvényesítési hibák

**Megoldások:**
```bash
# 1. Ellenőrizze az SSL tanúsítvány állapotát
az webapp config ssl list --resource-group myrg

# 2. Csak HTTPS engedélyezése
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Egyéni domain hozzáadása (ha szükséges)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Probléma: CORS configuration problems
**Tünetek:**
- A frontend nem tudja hívni az API-t
- Cross-origin kérés blokkolva

**Megoldások:**
```bash
# 1. Konfigurálja a CORS-t az App Service számára
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Frissítse az API-t, hogy kezelje a CORS-t
# Express.js-ben:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Ellenőrizze, hogy a megfelelő URL-eken fut-e
azd show
```

## 🌍 Környezetkezelési problémák

### Probléma: Environment switching problems
**Tünetek:**
- Hibás környezet van használatban
- A konfiguráció nem vált megfelelően

**Megoldások:**
```bash
# 1. Az összes környezet listázása
azd env list

# 2. Környezet kifejezett kiválasztása
azd env select production

# 3. Jelenlegi környezet ellenőrzése
azd env show

# 4. Új környezet létrehozása, ha sérült
azd env new production-new
azd env select production-new
```

### Probléma: Environment corruption
**Tünetek:**
- A környezet érvénytelen állapotot mutat
- Az erőforrások nem egyeznek a konfigurációval

**Megoldások:**
```bash
# 1. Frissítse a környezeti állapotot
azd env refresh

# 2. Állítsa vissza a környezeti konfigurációt
azd env new production-reset
# Másolja át a szükséges környezeti változókat
azd env set DATABASE_URL "your-value"

# 3. Importálja a meglévő erőforrásokat (ha lehetséges)
# Manuálisan frissítse a .azure/production/config.json fájlt az erőforrásazonosítókkal
```

## 🔍 Teljesítményproblémák

### Probléma: Slow deployment times
**Tünetek:**
- A telepítések túl sokáig tartanak
- Timeoutok előfordulnak a telepítés során

**Megoldások:**
```bash
# 1. Konkrét szolgáltatások telepítése a gyorsabb iterációhoz
azd deploy --service web
azd deploy --service api

# 2. Használjon kizárólag kódalapú telepítést, ha az infrastruktúra változatlan
azd deploy  # Gyorsabb, mint az azd up

# 3. Optimalizálja a build-folyamatot
# A package.json fájlban:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Ellenőrizze az erőforrások helyét (használjon ugyanazt a régiót)
azd config set defaults.location eastus2
```

### Probléma: Application performance problems
**Tünetek:**
- Lassú válaszidők
- Magas erőforrás-használat

**Megoldások:**
```bash
# 1. Növelje az erőforrásokat
# Frissítse a SKU-t a main.parameters.json fájlban:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Engedélyezze az Application Insights figyelését
azd monitor --overview

# 3. Ellenőrizze az alkalmazás naplóit az Azure-ban
az webapp log tail --name myapp --resource-group myrg
# vagy Container Apps esetén:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Valósítsa meg a gyorsítótárazást
# Adjon Redis gyorsítótárat az infrastruktúrájához
```

## 🛠️ Hibaelhárító eszközök és parancsok

### Hibakereső parancsok
```bash
# Átfogó hibakeresés
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Az azd verzió ellenőrzése
azd version

# Jelenlegi konfiguráció megtekintése
azd config list

# Kapcsolat tesztelése
curl -v https://myapp.azurewebsites.net/health
```

### Naplóelemzés
```bash
# Alkalmazásnaplók az Azure CLI-n keresztül
az webapp log tail --name myapp --resource-group myrg

# Alkalmazás figyelése az azd segítségével
azd monitor --logs
azd monitor --live

# Azure-erőforrások naplói
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Konténernaplók (Container Apps esetében)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Erőforrás vizsgálat
```bash
# Az összes erőforrás listázása
az resource list --resource-group myrg -o table

# Erőforrás állapotának ellenőrzése
az webapp show --name myapp --resource-group myrg --query state

# Hálózati diagnosztika
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 További segítség kérése

### Mikor szükséges eszkalálni
- A hitelesítési problémák továbbra is fennállnak minden megoldási kísérlet után
- Infrastruktúra-problémák az Azure szolgáltatások oldalán
- Számlázással vagy előfizetéssel kapcsolatos problémák
- Biztonsági aggályok vagy incidensek

### Támogatási csatornák
```bash
# 1. Ellenőrizze az Azure Service Health állapotát
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Hozzon létre Azure támogatási jegyet
# Látogasson el ide: https://portal.azure.com -> Súgó + támogatás

# 3. Közösségi források
# - Stack Overflow: azure-developer-cli címke
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Összegyűjtendő információk
Mielőtt kapcsolatba lép a támogatással, gyűjtse össze:
- `azd version` kimenet
- `azd config list` kimenet
- `azd show` kimenet (aktuális telepítési állapot)
- Hibák üzenetei (teljes szöveg)
- A hiba reprodukálásának lépései
- Környezeti részletek (`azd env show`)
- A probléma megjelenésének idővonala

### Naplógyűjtő szkript
```bash
#!/bin/bash
# hibakeresési-információ-gyűjtés.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Problémamegelőzés

### Előtelepítési ellenőrzőlista
```bash
# 1. Ellenőrizze a hitelesítést
az account show

# 2. Ellenőrizze a kvótákat és korlátokat
az vm list-usage --location eastus2

# 3. Ellenőrizze a sablonokat
az bicep build --file infra/main.bicep

# 4. Először helyileg tesztelje
npm run build
npm run test

# 5. Használjon próbatelepítéseket
azd provision --preview
```

### Monitoring beállítása
```bash
# Engedélyezze az Application Insights szolgáltatást
# Adja hozzá a main.bicep fájlhoz:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Riasztások beállítása
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Rendszeres karbantartás
```bash
# Heti állapotellenőrzések
./scripts/health-check.sh

# Havi költségfelülvizsgálat
az consumption usage list --billing-period-name 202401

# Negyedéves biztonsági felülvizsgálat
az security assessment list --resource-group myrg
```

## Kapcsolódó források

- [Hibakeresési útmutató](debugging.md) - Haladó hibakeresési technikák
- [Erőforrások előállítása](../chapter-04-infrastructure/provisioning.md) - Infrastruktúra hibaelhárítás
- [Kapacitástervezés](../chapter-06-pre-deployment/capacity-planning.md) - Erőforrástervezési útmutató
- [SKU kiválasztása](../chapter-06-pre-deployment/sku-selection.md) - Szolgáltatási szint ajánlások

---

**Tipp**: Jelölje meg könyvjelzővel ezt az útmutatót, és hivatkozzon rá, amikor problémába ütközik. A legtöbb problémát korábban már láttuk, és ismert megoldások léteznek!

---

**Navigáció**
- **Previous Lesson**: [Erőforrások előállítása](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [Hibakeresési útmutató](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Felelősségkizárás:
Ezt a dokumentumot az [Co-op Translator] (https://github.com/Azure/co-op-translator) mesterséges intelligencia alapú fordító szolgáltatással fordították le. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. A dokumentum eredeti nyelvű változatát kell tekinteni a hiteles forrásnak. Kritikus jelentőségű információk esetén szakmai, emberi fordítást javasolunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy helytelen értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->