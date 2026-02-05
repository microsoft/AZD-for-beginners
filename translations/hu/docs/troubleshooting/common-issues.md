# Gyakori problémák és megoldások

**Fejezet navigáció:**
- **📚 Kurzus kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 7. fejezet - Hibakeresés és hibaelhárítás
- **⬅️ Előző fejezet**: [6. fejezet: Előzetes ellenőrzések](../pre-deployment/preflight-checks.md)
- **➡️ Következő**: [Hibakeresési útmutató](debugging.md)
- **🚀 Következő fejezet**: [8. fejezet: Produkciós és vállalati minták](../microsoft-foundry/production-ai-practices.md)

## Bevezetés

Ez az átfogó hibaelhárítási útmutató az Azure Developer CLI használata során leggyakrabban előforduló problémákat tárgyalja. Tanulja meg azonosítani, elhárítani és megoldani az autentikációval, telepítéssel, infrastruktúra létrehozással és alkalmazás konfigurációval kapcsolatos problémákat. Minden probléma részletes tüneteket, okokat és lépésről lépésre megoldási eljárásokat tartalmaz.

## Tanulási célok

Az útmutató elvégzésével:
- Elsajátítja az Azure Developer CLI problémák diagnosztikai technikáit
- Megérti az autentikációval és jogosultságokkal kapcsolatos gyakori problémákat és megoldásaikat
- Megoldja a telepítési hibákat, infrastruktúra létrehozási problémákat és konfigurációs nehézségeket
- Proaktív monitorozási és hibakeresési stratégiákat alkalmaz
- Szisztematikus hibaelhárítási módszereket alkalmaz összetett problémák esetén
- Megfelelő naplózást és monitorozást állít be a jövőbeli problémák megelőzése érdekében

## Tanulási eredmények

Az útmutató elvégzése után képes lesz:
- Diagnosztizálni az Azure Developer CLI problémáit beépített diagnosztikai eszközökkel
- Önállóan megoldani az autentikációval, előfizetéssel és jogosultságokkal kapcsolatos problémákat
- Hatékonyan elhárítani telepítési hibákat és infrastruktúra létrehozási problémákat
- Hibakeresni alkalmazás konfigurációs problémákat és környezet-specifikus nehézségeket
- Monitorozást és riasztásokat beállítani a potenciális problémák proaktív azonosításához
- Legjobb gyakorlatokat alkalmazni naplózás, hibakeresés és problémamegoldási munkafolyamatok során

## Gyors diagnosztika

Mielőtt konkrét problémákba merülne, futtassa ezeket a parancsokat diagnosztikai információk gyűjtéséhez:

```bash
# Ellenőrizze az azd verziót és állapotát
azd version
azd config list

# Ellenőrizze az Azure hitelesítést
az account show
az account list

# Ellenőrizze az aktuális környezetet
azd env show
azd env get-values

# Engedélyezze a hibakeresési naplózást
export AZD_DEBUG=true
azd <command> --debug
```

## Autentikációs problémák

### Probléma: "Nem sikerült hozzáférési tokent szerezni"
**Tünetek:**
- Az `azd up` autentikációs hibákkal meghiúsul
- Parancsok "nem engedélyezett" vagy "hozzáférés megtagadva" üzenetet adnak vissza

**Megoldások:**
```bash
# 1. Újrahitelesítés az Azure CLI-vel
az login
az account show

# 2. Gyorsítótárazott hitelesítő adatok törlése
az account clear
az login

# 3. Eszközkód-alapú hitelesítési folyamat használata (fej nélküli rendszerekhez)
az login --use-device-code

# 4. Kifejezett előfizetés beállítása
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Probléma: "Elégtelen jogosultságok" telepítés közben
**Tünetek:**
- A telepítés jogosultsági hibákkal meghiúsul
- Nem lehet bizonyos Azure erőforrásokat létrehozni

**Megoldások:**
```bash
# 1. Ellenőrizze az Azure szerepkör-hozzárendeléseit
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Győződjön meg róla, hogy rendelkezik a szükséges szerepkörökkel
# - Közreműködő (erőforrás létrehozásához)
# - Felhasználói hozzáférés adminisztrátor (szerepkör-hozzárendelésekhez)

# 3. Lépjen kapcsolatba az Azure rendszergazdájával a megfelelő jogosultságokért
```

### Probléma: Több bérlős autentikációs problémák
**Megoldások:**
```bash
# 1. Jelentkezzen be egy adott bérlővel
az login --tenant "your-tenant-id"

# 2. Állítsa be a bérlőt a konfigurációban
azd config set auth.tenantId "your-tenant-id"

# 3. Törölje a bérlő gyorsítótárát, ha bérlőt vált
az account clear
```

## 🏗️ Infrastruktúra létrehozási hibák

### Probléma: Erőforrás név ütközések
**Tünetek:**
- "Az erőforrás név már létezik" hibák
- A telepítés meghiúsul az erőforrás létrehozás során

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

### Probléma: Helyszín/régió nem elérhető
**Tünetek:**
- "A(z) 'xyz' helyszín nem elérhető az erőforrás típushoz"
- Bizonyos SKU-k nem elérhetők a kiválasztott régióban

**Megoldások:**
```bash
# 1. Ellenőrizze az elérhető helyeket az erőforrástípusokhoz
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Használjon általánosan elérhető régiókat
azd config set defaults.location eastus2
# vagy
azd env set AZURE_LOCATION eastus2

# 3. Ellenőrizze a szolgáltatás elérhetőségét régiónként
# Látogasson el ide: https://azure.microsoft.com/global-infrastructure/services/
```

### Probléma: Kvóta túllépési hibák
**Tünetek:**
- "Kvóta túllépve az erőforrás típushoz"
- "Az erőforrások maximális száma elérve"

**Megoldások:**
```bash
# 1. Ellenőrizze az aktuális kvóta használatot
az vm list-usage --location eastus2 -o table

# 2. Kérjen kvóta növelést az Azure portálon keresztül
# Menjen ide: Előfizetések > Használat + kvóták

# 3. Használjon kisebb SKU-kat fejlesztéshez
# A main.parameters.json fájlban:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Takarítsa el a nem használt erőforrásokat
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Probléma: Bicep sablon hibák
**Tünetek:**
- Sablon érvényesítési hibák
- Szintaktikai hibák a Bicep fájlokban

**Megoldások:**
```bash
# 1. Ellenőrizze a Bicep szintaxist
az bicep build --file infra/main.bicep

# 2. Használja a Bicep lintet
az bicep lint --file infra/main.bicep

# 3. Ellenőrizze a paraméterfájl szintaxisát
cat infra/main.parameters.json | jq '.'

# 4. Tekintse meg a telepítési változásokat
azd provision --preview
```

## 🚀 Telepítési hibák

### Probléma: Build hibák
**Tünetek:**
- Az alkalmazás nem épül fel telepítés közben
- Csomag telepítési hibák

**Megoldások:**
```bash
# 1. Ellenőrizze az építési naplókat
azd logs --service web
azd deploy --service web --debug

# 2. Tesztelje az építést helyben
cd src/web
npm install
npm run build

# 3. Ellenőrizze a Node.js/Python verzió kompatibilitást
node --version  # Meg kell egyeznie az azure.yaml beállításokkal
python --version

# 4. Törölje az építési gyorsítótárat
rm -rf node_modules package-lock.json
npm install

# 5. Ellenőrizze a Dockerfile-t, ha konténereket használ
docker build -t test-image .
docker run --rm test-image
```

### Probléma: Konténer telepítési hibák
**Tünetek:**
- Konténer alkalmazások nem indulnak el
- Kép letöltési hibák

**Megoldások:**
```bash
# 1. Tesztelje a Docker buildet helyben
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Ellenőrizze a konténer naplóit
azd logs --service api --follow

# 3. Ellenőrizze a konténer regisztrációs hozzáférést
az acr login --name myregistry

# 4. Ellenőrizze a konténer alkalmazás konfigurációját
az containerapp show --name my-app --resource-group my-rg
```

### Probléma: Adatbázis kapcsolat hibák
**Tünetek:**
- Az alkalmazás nem tud csatlakozni az adatbázishoz
- Kapcsolati időtúllépési hibák

**Megoldások:**
```bash
# 1. Ellenőrizze az adatbázis tűzfal szabályait
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Tesztelje az alkalmazásból való csatlakozást
# Adja hozzá ideiglenesen az alkalmazásához:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Ellenőrizze a kapcsolat karakterlánc formátumát
azd env get-values | grep DATABASE

# 4. Ellenőrizze az adatbázis szerver állapotát
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfigurációs problémák

### Probléma: Környezeti változók nem működnek
**Tünetek:**
- Az alkalmazás nem tudja olvasni a konfigurációs értékeket
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

# 4. Ellenőrizze az alkalmazásszolgáltatás konfigurációját
az webapp config appsettings list --name myapp --resource-group myrg
```

### Probléma: SSL/TLS tanúsítvány problémák
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

### Probléma: CORS konfigurációs problémák
**Tünetek:**
- A frontend nem tudja hívni az API-t
- Kereszt-domain kérések blokkolva

**Megoldások:**
```bash
# 1. Konfigurálja a CORS-t az App Service-hez
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Frissítse az API-t a CORS kezeléséhez
# Az Express.js-ben:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Ellenőrizze, hogy a megfelelő URL-eken fut-e
azd show
```

## 🌍 Környezetkezelési problémák

### Probléma: Környezet váltási problémák
**Tünetek:**
- Rossz környezet kerül használatra
- A konfiguráció nem vált megfelelően

**Megoldások:**
```bash
# 1. Listázza az összes környezetet
azd env list

# 2. Környezet kifejezett kiválasztása
azd env select production

# 3. Ellenőrizze az aktuális környezetet
azd env show

# 4. Hozzon létre új környezetet, ha sérült
azd env new production-new
azd env select production-new
```

### Probléma: Környezet sérülése
**Tünetek:**
- A környezet érvénytelen állapotot mutat
- Az erőforrások nem egyeznek a konfigurációval

**Megoldások:**
```bash
# 1. Frissítse a környezet állapotát
azd env refresh

# 2. Állítsa vissza a környezet konfigurációját
azd env new production-reset
# Másolja át a szükséges környezeti változókat
azd env set DATABASE_URL "your-value"

# 3. Importálja a meglévő erőforrásokat (ha lehetséges)
# Kézzel frissítse a .azure/production/config.json fájlt az erőforrás-azonosítókkal
```

## 🔍 Teljesítmény problémák

### Probléma: Lassú telepítési idők
**Tünetek:**
- A telepítések túl sokáig tartanak
- Időtúllépések telepítés közben

**Megoldások:**
```bash
# 1. Engedélyezze a párhuzamos telepítést
azd config set deploy.parallelism 5

# 2. Használjon fokozatos telepítéseket
azd deploy --incremental

# 3. Optimalizálja az építési folyamatot
# A package.json fájlban:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Ellenőrizze az erőforrások helyét (ugyanazt a régiót használja)
azd config set defaults.location eastus2
```

### Probléma: Alkalmazás teljesítmény problémák
**Tünetek:**
- Lassú válaszidők
- Magas erőforrás-használat

**Megoldások:**
```bash
# 1. Növelje az erőforrásokat
# Frissítse az SKU-t a main.parameters.json fájlban:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Engedélyezze az Application Insights monitorozást
azd monitor

# 3. Ellenőrizze az alkalmazásnaplókat a szűk keresztmetszetek miatt
azd logs --service api --follow

# 4. Valósítson meg gyorsítótárazást
# Adjon hozzá Redis gyorsítótárat az infrastruktúrájához
```

## 🛠️ Hibakeresési eszközök és parancsok

### Hibakeresési parancsok
```bash
# Átfogó hibakeresés
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Rendszerinformáció ellenőrzése
azd info

# Konfiguráció érvényesítése
azd config validate

# Kapcsolat tesztelése
curl -v https://myapp.azurewebsites.net/health
```

### Naplóelemzés
```bash
# Alkalmazásnaplók
azd logs --service web --follow
azd logs --service api --since 1h

# Azure erőforrásnaplók
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Konténernaplók (Konténeralkalmazásokhoz)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Erőforrás vizsgálat
```bash
# Listázza az összes erőforrást
az resource list --resource-group myrg -o table

# Ellenőrizze az erőforrás állapotát
az webapp show --name myapp --resource-group myrg --query state

# Hálózati diagnosztika
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 További segítség kérése

### Mikor kell továbbítani
- Az autentikációs problémák továbbra is fennállnak az összes megoldás kipróbálása után
- Infrastruktúra problémák az Azure szolgáltatásokkal
- Számlázási vagy előfizetési problémák
- Biztonsági aggályok vagy incidensek

### Támogatási csatornák
```bash
# 1. Ellenőrizze az Azure Szolgáltatás Egészségét
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Hozzon létre Azure támogatási jegyet
# Menjen ide: https://portal.azure.com -> Súgó + támogatás

# 3. Közösségi erőforrások
# - Stack Overflow: azure-developer-cli címke
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Összegyűjtendő információk
Mielőtt kapcsolatba lépne a támogatással, gyűjtse össze:
- `azd version` kimenet
- `azd info` kimenet
- Hibaüzenetek (teljes szöveg)
- A probléma reprodukálásának lépései
- Környezet részletei (`azd env show`)
- Idővonal, amikor a probléma elkezdődött

### Naplógyűjtési script
```bash
#!/bin/bash
# gyűjtsd össze a hibakeresési információkat.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Problémamegelőzés

### Telepítés előtti ellenőrzőlista
```bash
# 1. Hitelesítés ellenőrzése
az account show

# 2. Kvóták és korlátok ellenőrzése
az vm list-usage --location eastus2

# 3. Sablonok ellenőrzése
az bicep build --file infra/main.bicep

# 4. Először helyben tesztelés
npm run build
npm run test

# 5. Száraz futtatású telepítések használata
azd provision --preview
```

### Monitorozási beállítás
```bash
# Engedélyezze az Application Insights-t
# Adja hozzá a main.bicep-hez:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Állítson be riasztásokat
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Rendszeres karbantartás
```bash
# Heti egészségügyi ellenőrzések
./scripts/health-check.sh

# Havi költségfelülvizsgálat
az consumption usage list --billing-period-name 202401

# Negyedéves biztonsági felülvizsgálat
az security assessment list --resource-group myrg
```

## Kapcsolódó források

- [Hibakeresési útmutató](debugging.md) - Haladó hibakeresési technikák
- [Erőforrások létrehozása](../deployment/provisioning.md) - Infrastruktúra hibaelhárítás
- [Kapacitás tervezés](../pre-deployment/capacity-planning.md) - Erőforrás tervezési útmutató
- [SKU kiválasztás](../pre-deployment/sku-selection.md) - Szolgáltatási szint ajánlások

---

**Tipp**: Tartsa ezt az útmutatót könyvjelzőben, és hivatkozzon rá, amikor problémákba ütközik. A legtöbb probléma már előfordult korábban, és van rájuk bevált megoldás!

---

**Navigáció**
- **Előző lecke**: [Erőforrások létrehozása](../deployment/provisioning.md)
- **Következő lecke**: [Hibakeresési útmutató](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy félremagyarázásért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->