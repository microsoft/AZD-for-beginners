# Gyakori problémák és megoldások

**Fejezet navigáció:**
- **📚 Tanfolyam főoldal**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 7. fejezet - Hibakeresés és hibajavítás
- **⬅️ Előző fejezet**: [6. fejezet: Előkészítő ellenőrzések](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Következő**: [Hibakeresési útmutató](debugging.md)
- **🚀 Következő fejezet**: [8. fejezet: Termelési és vállalati minták](../chapter-08-production/production-ai-practices.md)

## Bevezetés

Ez az átfogó hibakeresési útmutató a leggyakrabban előforduló problémákat tárgyalja az Azure Developer CLI használata során. Tanulja meg, hogyan diagnosztizálja, hárítsa el és oldja meg a hitelesítéssel, telepítéssel, infrastruktúra előkészítéssel és alkalmazáskonfigurációval kapcsolatos gyakori problémákat. Minden probléma részletes tüneteit, alapvető okait és lépésről lépésre követhető megoldási eljárásait tartalmazza.

## Tanulási célok

Az útmutató elvégzése után képes lesz:
- Elsajátítani az Azure Developer CLI problémák diagnosztikai technikáit
- Megérteni a gyakori hitelesítési és jogosultsági problémákat és azok megoldásait
- Megoldani a telepítési hibákat, infrastruktúra előkészítési hibákat és konfigurációs problémákat
- Alkalmazni proaktív monitorozási és hibakeresési stratégiákat
- Rendszeres hibakeresési módszertanokat alkalmazni összetett problémák esetén
- Beállítani a megfelelő naplózást és monitorozást a jövőbeni problémák megelőzésére

## Eredmények

Az útmutató végére képes lesz:
- Diagnosztizálni az Azure Developer CLI problémákat beépített diagnosztikai eszközökkel
- Egyedül megoldani hitelesítési, előfizetési és jogosultsági problémákat
- Hatékonyan hárítani telepítési hibákat és infrastruktúra előkészítési problémákat
- Hibakeresni alkalmazáskonfigurációs problémákat és környezetfüggő hibákat
- Megvalósítani monitorozást és riasztást a potenciális problémák proaktív azonosítására
- Alkalmazni a legjobb gyakorlatokat naplózásban, hibakeresésben és problémamegoldási munkafolyamatokban

## Gyors diagnosztika

> Cserélje ki a példában szereplő neveket/azonosítókat a saját környezete értékeire. A Bash, Bicep, JavaScript és paraméterfájl töredékeket külön jelöljük alább; ezek nem egy futtatható szkript. Vizsgálja át a destruktív műveleteket, és törölje az érzékeny adatokat a diagnosztikák megosztása előtt. `azd monitor --logs` megnyit egy böngészőt; nem streameli a terminál naplóit.

Mielőtt belevágna egyedi problémákba, futtassa le ezeket a parancsokat diagnosztikai információk gyűjtéséhez:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## Hitelesítési problémák

### Probléma: "Nem sikerült hozzáférési tokent szerezni"
**Tünetek:**
- `azd up` hitelesítési hibákkal bukik meg
- Parancsok "nem engedélyezett" vagy "hozzáférés megtagadva" hibát adnak vissza

**Megoldások:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### Probléma: "Elégtelen jogosultság" telepítés közben
**Tünetek:**
- A telepítés jogosultsági hibával meghiúsul
- Bizonyos Azure erőforrásokat nem lehet létrehozni

**Megoldások:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Probléma: Több-bérlős hitelesítési problémák
**Megoldások:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastruktúra előkészítési hibák

### Probléma: Erőforrásnév-ütközések
**Tünetek:**
- "Az erőforrásnév már létezik" hibaüzenetek
- A telepítés meghiúsul az erőforrás létrehozása közben

**Megoldások:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### Probléma: Nem elérhető hely/régió
**Tünetek:**
- "Az 'xyz' hely nem elérhető az erőforrástípushoz"
- Bizonyos SKU-k nem elérhetőek a kiválasztott régióban

**Megoldások:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

A hely változó megváltoztatása nem migrálja a meglévő erőforrásokat. Egy meglévő erőforráscsoport vagy erőforrás elutasíthatja a helyváltást; használjon külön környezetet a régiós újratelepítéshez.

### Probléma: Kvóta túllépés hibák
**Tünetek:**
- "Kvóta túllépve az erőforrástípusra"
- "Elérték az erőforrások maximális számát"

**Megoldások:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Fejlesztéshez válasszon egy kisebb, támogatott SKU-t `infra/main.parameters.json`-ben:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Probléma: Bicep sablonhibák
**Tünetek:**
- Sablon-ellenőrzési hibák
- Szintaktikai hibák Bicep fájlokban

**Megoldások:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 Telepítési hibák

### Probléma: Fordítási hibák
**Tünetek:**
- Az alkalmazás nem fordul le telepítés közben
- Csomagtelepítési hibák

**Megoldások:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Probléma: Konténer telepítési hibák
**Tünetek:**
- Konténeralkalmazások nem indulnak el
- Kép letöltési hibák

**Megoldások:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Probléma: Adatbázis-kapcsolati hibák
**Tünetek:**
- Az alkalmazás nem tud kapcsolódni az adatbázishoz
- Kapcsolati időtúllépések

**Megoldások:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfigurációs problémák

### Probléma: Környezeti változók nem működnek
**Tünetek:**
- Az alkalmazás nem tudja olvasni a konfigurációs értékeket
- A környezeti változók üresnek tűnnek

**Megoldások:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Probléma: SSL/TLS tanúsítvány problémák
**Tünetek:**
- HTTPS nem működik
- Tanúsítvány-ellenőrzési hibák

**Megoldások:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Probléma: CORS konfigurációs hibák
**Tünetek:**
- A frontend nem tud hívni API-t
- Kereszt-origin kérés blokkolva

**Megoldások:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Frissítse meglévő Express alkalmazását (amelybe be van importálva `cors`):

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 Környezetkezelési problémák

### Probléma: Környezetváltási problémák
**Tünetek:**
- Rossz környezet használata
- A konfiguráció nem vált megfelelően

**Megoldások:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Probléma: Környezet sérülése
**Tünetek:**
- A környezet érvénytelen állapotot mutat
- Az erőforrások nem egyeznek a konfigurációval

**Megoldások:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 Teljesítményproblémák

### Probléma: Lassú telepítési idők
**Tünetek:**
- A telepítések túl sokáig tartanak
- Időtúllépések telepítés közben

**Megoldások:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### Probléma: Alkalmazás teljesítményproblémák
**Tünetek:**
- Lassú válaszidők
- Magas erőforrás-felhasználás

**Megoldások:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Hibakeresési eszközök és parancsok

### Hibakeresési parancsok
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Naplóelemzés
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Erőforrás vizsgálat
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 További segítség kérése

### Mikor emeljünk szintet a problémával
- Hitelesítési problémák tartósan fennállnak minden megoldási kísérlet után is
- Infrastruktúra problémák Azure szolgáltatásokkal kapcsolatban
- Számlázási vagy előfizetési problémák
- Biztonsági aggályok vagy incidensek

### Támogatási csatornák
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Összegyűjtendő információk
A támogatás felkeresése előtt gyűjtse össze:
- `azd version` kimenet
- `azd config show` kimenet
- `azd show` kimenet (aktuális telepítési állapot)
- Hibák üzenetei (teljes szöveg)
- A probléma reprodukálásának lépései
- Érzékeny környezeti adatok kiszűrve (soha ne osszon meg nyers `azd env get-values` fájlokat, amelyek titkokat tartalmazhatnak)
- Idővonal arról, mikor kezdődött a probléma

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
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Problémák megelőzése

### Előtelepítési ellenőrző lista
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### Monitorozási beállítások
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### Rendszeres karbantartás
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Kapcsolódó források

- [Hibakeresési útmutató](debugging.md) - Haladó hibakeresési technikák
- [Erőforrások előkészítése](../chapter-04-infrastructure/provisioning.md) - Infrastruktúra hibakeresés
- [Kapacitástervezés](../chapter-06-pre-deployment/capacity-planning.md) - Erőforrás-tervezési útmutató
- [SKU kiválasztás](../chapter-06-pre-deployment/sku-selection.md) - Szolgáltatási szint ajánlások

---

**Tipp**: Jegyezze fel ezt az útmutatót könyvjelzőként, és hivatkozzon rá, amikor problémába ütközik. A legtöbb problémát már látták korábban, és megoldásuk ismert!

---

**Navigáció**
- **Előző lecke**: [Erőforrások előkészítése](../chapter-04-infrastructure/provisioning.md)
- **Következő lecke**: [Hibakeresési útmutató](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->