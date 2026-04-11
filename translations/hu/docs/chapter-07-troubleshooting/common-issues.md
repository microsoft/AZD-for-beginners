# Általános problémák és megoldások

**Fejezet navigáció:**
- **📚 Kurzus kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 7. fejezet - Hibakeresés és hibaelhárítás
- **⬅️ Előző fejezet**: [6. fejezet: Előzetes ellenőrzések](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Következő**: [Hibakeresési útmutató](debugging.md)
- **🚀 Következő fejezet**: [8. fejezet: Termelési és vállalati minták](../chapter-08-production/production-ai-practices.md)

## Bevezetés

Ez a átfogó hibakeresési útmutató az Azure Developer CLI használata során leggyakrabban előforduló problémákat tárgyalja. Tanulja meg, hogyan diagnosztizálja, hárítsa el és oldja meg a hitelesítéssel, telepítéssel, infrastruktúra provisionálással és alkalmazáskonfigurációval kapcsolatos gyakori gondokat. Minden problémánál részletes tünetek, kiváltó okok és lépésenkénti megoldási eljárások találhatók.

## Tanulási célok

Az útmutató elvégzése során elsajátítja a következőket:
- Az Azure Developer CLI hibáinak diagnosztikai technikáit
- A leggyakoribb hitelesítési és jogosultsági problémák és azok megoldásainak ismeretét
- A telepítési hibák, infrastruktúra provisionálási hibák és konfigurációs problémák megoldását
- Proaktív megfigyelési és hibakeresési stratégiák alkalmazását
- Szisztematikus hibakeresési módszertanok használatát összetett problémák esetén
- Megfelelő naplózási és megfigyelési beállításokat a jövőbeli problémák megelőzésére

## Tanulási eredmények

Az útmutató elvégzése után képes lesz:
- Az Azure Developer CLI problémáit beépített diagnosztikai eszközök segítségével azonosítani
- Hitelesítési, előfizetési és jogosultsági problémákat önállóan megoldani
- Hatékonyan hibakeresni telepítési hibákat és infrastruktúra provisionálási problémákat
- Alkalmazáskonfigurációs és környezetspecifikus problémákat hibajavítani
- Megfigyelést és értesítést végrehajtani a potenciális problémák előzetes észlelésére
- Legjobb gyakorlatokat alkalmazni a naplózásban, hibakeresésben és problémamegoldásban

## Gyors diagnosztika

Mielőtt a konkrét problémákkal foglalkozna, futtassa az alábbi parancsokat diagnosztikai információk gyűjtéséhez:

```bash
# Az azd verzió és állapot ellenőrzése
azd version
azd config show

# Azure hitelesítés ellenőrzése
az account show
az account list

# Az aktuális környezet ellenőrzése
azd env list
azd env get-values

# Hibakeresési naplózás engedélyezése
export AZD_DEBUG=true
azd <command> --debug
```

## Hitelesítési problémák

### Probléma: „Hozzáférési token lekérése sikertelen”
**Tünetek:**
- `azd up` hitelesítési hibákkal elbukik
- Parancsok „nem engedélyezett” vagy „hozzáférés megtagadva” üzeneteket adnak

**Megoldások:**
```bash
# 1. Újra hitelesítés az Azure CLI-vel
az login
az account show

# 2. Gyorsítótárazott hitelesítő adatok törlése
az account clear
az login

# 3. Eszközkód alapú hitelesítés használata (fej nélküli rendszerekhez)
az login --use-device-code

# 4. Egyértelmű előfizetés beállítása
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Probléma: „Elégtelen jogosultság” telepítés közben
**Tünetek:**
- Telepítés jogosultsági hibák miatt sikertelen
- Bizonyos Azure erőforrások létrehozása nem lehetséges

**Megoldások:**
```bash
# 1. Ellenőrizze az Azure szerepkör hozzárendeléseit
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Győződjön meg arról, hogy rendelkezik a szükséges szerepkörökkel
# - Közreműködő (erőforrás létrehozásához)
# - Felhasználói hozzáférés adminisztrátor (szerepkör hozzárendelésekhez)

# 3. Forduljon az Azure rendszergazdájához a megfelelő jogosultságokért
```

### Probléma: Több-bérlős hitelesítési gondok
**Megoldások:**
```bash
# 1. Bejelentkezés egy adott bérlővel
az login --tenant "your-tenant-id"

# 2. Bérlő beállítása a konfigurációban
azd config set auth.tenantId "your-tenant-id"

# 3. Bérlő gyorsítótár törlése, ha bérlőt váltasz
az account clear
```

## 🏗️ Infrastruktúra provisionálási hibák

### Probléma: Erőforrás névütközések
**Tünetek:**
- „Az erőforrás név már létezik” hibák
- Telepítés sikertelen az erőforrás létrehozásakor

**Megoldások:**
```bash
# 1. Használjon egyedi erőforrásneveket tokenekkel
# A Bicep sablonjában:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Változtassa meg a környezet nevét
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Tisztítsa meg a meglévő erőforrásokat
azd down --force --purge
```

### Probléma: Elérhetetlen hely / régió
**Tünetek:**
- „A(z) 'xyz' hely nem elérhető az erőforrás-típus számára”
- Bizonyos SKU-k nem elérhetők az adott régióban

**Megoldások:**
```bash
# 1. Ellenőrizze az erőforrástípusok elérhető helyszíneit
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Használjon általánosan elérhető régiókat
azd config set defaults.location eastus2
# vagy
azd env set AZURE_LOCATION eastus2

# 3. Ellenőrizze a szolgáltatás elérhetőségét régiónként
# Látogasson el ide: https://azure.microsoft.com/global-infrastructure/services/
```

### Probléma: Kvóta túllépése
**Tünetek:**
- „Kvóta túllépve az erőforrás-típusra”
- „Elérhető erőforrások maximális száma elérve”

**Megoldások:**
```bash
# 1. Ellenőrizze a jelenlegi kvótahasználatot
az vm list-usage --location eastus2 -o table

# 2. Kérjen kvótanövelést az Azure portálon keresztül
# Menjen ide: Előfizetések > Használat + kvóták

# 3. Használjon kisebb SKU-kat fejlesztéshez
# A main.parameters.json fájlban:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Tisztítsa meg a nem használt erőforrásokat
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Probléma: Bicep sablonhibák
**Tünetek:**
- Sablon érvényesítési hibák
- Szintaktikai hibák Bicep fájlokban

**Megoldások:**
```bash
# 1. Ellenőrizze a Bicep szintaxisát
az bicep build --file infra/main.bicep

# 2. Használja a Bicep lintelőt
az bicep lint --file infra/main.bicep

# 3. Ellenőrizze a paraméterfájl szintaxisát
cat infra/main.parameters.json | jq '.'

# 4. Tekintse át a telepítési módosításokat
azd provision --preview
```

## 🚀 Telepítési hibák

### Probléma: Build hibák
**Tünetek:**
- Alkalmazás build sikertelen telepítés során
- Csomag telepítési hibák

**Megoldások:**
```bash
# 1. Ellenőrizze az építési kimenetet debug kapcsolóval
azd deploy --service web --debug

# 2. Tekintse meg a telepített szolgáltatás állapotát
azd show

# 3. Tesztelje az építést helyileg
cd src/web
npm install
npm run build

# 3. Ellenőrizze a Node.js/Python verzió kompatibilitását
node --version  # Meg kell egyeznie az azure.yaml beállításaival
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
# 1. Docker build helyi tesztelése
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Konténer naplóinak ellenőrzése Azure CLI segítségével
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Alkalmazás figyelése az azd használatával
azd monitor --logs

# 3. Konténer regiszter hozzáférésének ellenőrzése
az acr login --name myregistry

# 4. Konténer alkalmazás konfigurációjának ellenőrzése
az containerapp show --name my-app --resource-group my-rg
```

### Probléma: Adatbázis kapcsolódási hibák
**Tünetek:**
- Alkalmazás nem tud adatbázishoz kapcsolódni
- Kapcsolódási időtúllépések

**Megoldások:**
```bash
# 1. Ellenőrizze az adatbázis tűzfalszabályait
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Tesztelje az alkalmazásból történő kapcsolódást
# Ideiglenesen adja hozzá az alkalmazásához:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Ellenőrizze a kapcsolati lánc formátumát
azd env get-values | grep DATABASE

# 4. Ellenőrizze az adatbázisszerver állapotát
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfigurációs problémák

### Probléma: Környezeti változók nem működnek
**Tünetek:**
- Az alkalmazás nem tudja beolvasni a konfigurációs értékeket
- Környezeti változók üresnek tűnnek

**Megoldások:**
```bash
# 1. Ellenőrizze, hogy a környezeti változók be vannak-e állítva
azd env get-values
azd env get DATABASE_URL

# 2. Ellenőrizze a változók neveit az azure.yaml fájlban
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
- Frontend nem tudja hívni az API-t
- Cross-origin kérés blokkolva

**Megoldások:**
```bash
# 1. CORS beállítása az App Service számára
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. API frissítése CORS kezeléséhez
# Express.js-ben:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Ellenőrizze, hogy helyes URL-eken fut-e
azd show
```

## 🌍 Környezetkezelési problémák

### Probléma: Környezet váltási hibák
**Tünetek:**
- Rossz környezet használata
- Konfiguráció nem vált megfelelően

**Megoldások:**
```bash
# 1. Az összes környezet listázása
azd env list

# 2. Környezet explicit kiválasztása
azd env select production

# 3. Az aktuális környezet ellenőrzése
azd env list

# 4. Új környezet létrehozása, ha a meglévő sérült
azd env new production-new
azd env select production-new
```

### Probléma: Környezet sérülése
**Tünetek:**
- Környezet érvénytelen állapotot mutat
- Erőforrások nem egyeznek a konfigurációval

**Megoldások:**
```bash
# 1. Környezeti állapot frissítése
azd env refresh

# 2. Környezet konfigurációjának visszaállítása
azd env new production-reset
# Szükséges környezeti változók másolása
azd env set DATABASE_URL "your-value"

# 3. Létező erőforrások importálása (ha lehetséges)
# A .azure/production/config.json kézi frissítése az erőforrásazonosítókkal
```

## 🔍 Teljesítmény problémák

### Probléma: Lassú telepítési idők
**Tünetek:**
- A telepítések túl sokáig tartanak
- Időtúllépések telepítés közben

**Megoldások:**
```bash
# 1. Telepítsen specifikus szolgáltatásokat a gyorsabb iteráció érdekében
azd deploy --service web
azd deploy --service api

# 2. Használjon csak kód telepítést, ha az infrastruktúra változatlan
azd deploy  # Gyorsabb, mint az azd up

# 3. Optimalizálja a build folyamatot
# A package.json fájlban:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Ellenőrizze az erőforrás helyét (ugyanazt a régiót használja)
azd config set defaults.location eastus2
```

### Probléma: Alkalmazás teljesítmény problémák
**Tünetek:**
- Lassú válaszidők
- Magas erőforrás-felhasználás

**Megoldások:**
```bash
# 1. Erőforrások bővítése
# Frissítse a SKU-t a main.parameters.json fájlban:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Engedélyezze az Application Insights megfigyelést
azd monitor --overview

# 3. Ellenőrizze az alkalmazás naplóit az Azure-ban
az webapp log tail --name myapp --resource-group myrg
# vagy konténer alkalmazások esetén:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Gyorsítótárazás megvalósítása
# Adjon hozzá Redis gyorsítótárat az infrastruktúrájához
```

## 🛠️ Hibakeresési eszközök és parancsok

### Hibakereső parancsok
```bash
# Átfogó hibakeresés
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Ellenőrizze az azd verzióját
azd version

# Aktuális konfiguráció megtekintése
azd config show

# Kapcsolat tesztelése
curl -v https://myapp.azurewebsites.net/health
```

### Napló elemzés
```bash
# Alkalmazásnaplók az Azure CLI-n keresztül
az webapp log tail --name myapp --resource-group myrg

# Alkalmazás figyelése az azd-vel
azd monitor --logs
azd monitor --live

# Azure erőforrásnaplók
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Konténer naplók (Container Apps számára)
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

### Mikor kell továbbítania
- Ha a hitelesítési problémák megoldási kísérletek után is fennállnak
- Infrastruktúra problémák az Azure szolgáltatásokkal kapcsolatban
- Számlázási vagy előfizetéshez kötődő gondok
- Biztonsági aggályok vagy incidensek

### Támogatási csatornák
```bash
# 1. Ellenőrizze az Azure szolgáltatás állapotát
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Hozzon létre Azure támogatási jegyet
# Lépjen a következőre: https://portal.azure.com -> Súgó + támogatás

# 3. Közösségi források
# - Stack Overflow: azure-developer-cli címke
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Kérdések és válaszok: https://learn.microsoft.com/en-us/answers/
```

### Gyűjtsön információkat
A támogatás megkeresése előtt gyűjtse össze:
- `azd version` kimenet
- `azd config show` kimenet
- `azd show` kimenet (aktuális telepítési állapot)
- Hibák üzenetei (teljes szöveg)
- A probléma reprodukálásának lépései
- Környezeti adatok (`azd env get-values`)
- A probléma kialakulásának idővonala

### Naplógyűjtő szkript
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Probléma megelőzés

### Telepítés előtti ellenőrzőlista
```bash
# 1. Hitelesítés ellenőrzése
az account show

# 2. Kvóták és korlátok ellenőrzése
az vm list-usage --location eastus2

# 3. Sablonok érvényesítése
az bicep build --file infra/main.bicep

# 4. Először helyi tesztelés
npm run build
npm run test

# 5. Száraz futtatásos telepítések használata
azd provision --preview
```

### Megfigyelés beállítása
```bash
# Engedélyezze az Application Insightset
# Adja hozzá a main.bicep-hez:
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
# Heti egészségügyi ellenőrzések
./scripts/health-check.sh

# Havi költségfelülvizsgálat
az consumption usage list --billing-period-name 202401

# Negyedéves biztonsági felülvizsgálat
az security assessment list --resource-group myrg
```

## Kapcsolódó források

- [Hibakeresési útmutató](debugging.md) - Haladó hibakeresési technikák
- [Erőforrások provisionálása](../chapter-04-infrastructure/provisioning.md) - Infrastruktúrás hibakeresés
- [Kapacitástervezés](../chapter-06-pre-deployment/capacity-planning.md) - Erőforrás tervezési útmutató
- [SKU választás](../chapter-06-pre-deployment/sku-selection.md) - Szolgáltatási szint ajánlások

---

**Tipp**: Jegyezze le ezt az útmutatót könyvjelzőként, és használja bármikor, amikor problémákba ütközik. A legtöbb gondot már ismerjük, és bevált megoldások állnak rendelkezésre!

---

**Navigáció**
- **Előző tananyag**: [Erőforrások provisionálása](../chapter-04-infrastructure/provisioning.md)
- **Következő tananyag**: [Hibakeresési útmutató](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ezt a dokumentumot az AI fordító szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével fordítottuk le. Bár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hivatalos forrásnak. Kritikus információk esetén szakmai emberi fordítást javasolunk. Nem vállalunk felelősséget az ebből a fordításból eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->