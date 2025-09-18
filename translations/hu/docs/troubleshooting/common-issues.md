<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-18T09:20:57+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "hu"
}
-->
# Gyakori problémák és megoldások

**Fejezet navigáció:**
- **📚 Kurzus kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 7. fejezet - Hibakeresés és hibaelhárítás
- **⬅️ Előző fejezet**: [6. fejezet: Előzetes ellenőrzések](../pre-deployment/preflight-checks.md)
- **➡️ Következő**: [Hibakeresési útmutató](debugging.md)
- **🚀 Következő fejezet**: [8. fejezet: Produkciós és vállalati minták](../ai-foundry/production-ai-practices.md)

## Bevezetés

Ez az átfogó hibaelhárítási útmutató bemutatja a leggyakrabban előforduló problémákat az Azure Developer CLI használata során. Megtanulhatja, hogyan diagnosztizálja, hárítsa el és oldja meg az autentikációval, telepítéssel, infrastruktúra létrehozással és alkalmazáskonfigurációval kapcsolatos problémákat. Minden probléma részletes tüneteket, okokat és lépésről lépésre történő megoldási eljárásokat tartalmaz.

## Tanulási célok

Az útmutató elvégzésével:
- Elsajátítja az Azure Developer CLI problémák diagnosztikai technikáit
- Megérti az autentikációval és jogosultságokkal kapcsolatos gyakori problémákat és megoldásaikat
- Megoldja a telepítési hibákat, infrastruktúra létrehozási problémákat és konfigurációs nehézségeket
- Proaktív monitoring és hibakeresési stratégiákat alkalmaz
- Szisztematikus hibaelhárítási módszereket alkalmaz összetett problémák esetén
- Megfelelő naplózást és monitorozást állít be a jövőbeli problémák megelőzése érdekében

## Tanulási eredmények

Az útmutató elvégzése után képes lesz:
- Diagnosztizálni az Azure Developer CLI problémáit beépített diagnosztikai eszközökkel
- Önállóan megoldani az autentikációval, előfizetéssel és jogosultságokkal kapcsolatos problémákat
- Hatékonyan hibaelhárítani a telepítési hibákat és infrastruktúra létrehozási problémákat
- Hibakeresni az alkalmazáskonfigurációs és környezet-specifikus problémákat
- Monitoringot és riasztásokat beállítani a potenciális problémák proaktív azonosítására
- Alkalmazni a naplózás, hibakeresés és problémamegoldási munkafolyamatok legjobb gyakorlatait

## Gyors diagnosztika

Mielőtt konkrét problémákba merülne, futtassa ezeket a parancsokat diagnosztikai információk gyűjtéséhez:

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## Autentikációs problémák

### Probléma: "Nem sikerült hozzáférési tokent szerezni"
**Tünetek:**
- Az `azd up` autentikációs hibákkal meghiúsul
- A parancsok "nem engedélyezett" vagy "hozzáférés megtagadva" üzeneteket adnak vissza

**Megoldások:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Probléma: "Elégtelen jogosultságok" telepítés közben
**Tünetek:**
- A telepítés jogosultsági hibákkal meghiúsul
- Nem lehet bizonyos Azure erőforrásokat létrehozni

**Megoldások:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Probléma: Több bérlős autentikációs problémák
**Megoldások:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastruktúra létrehozási hibák

### Probléma: Erőforrásnév ütközések
**Tünetek:**
- "Az erőforrásnév már létezik" hibák
- A telepítés meghiúsul az erőforrás létrehozása során

**Megoldások:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### Probléma: Helyszín/régió nem elérhető
**Tünetek:**
- "A 'xyz' helyszín nem elérhető az erőforrástípushoz"
- Bizonyos SKU-k nem elérhetők a kiválasztott régióban

**Megoldások:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### Probléma: Kvóta túllépési hibák
**Tünetek:**
- "Kvóta túllépve az erőforrástípushoz"
- "Az erőforrások maximális száma elérve"

**Megoldások:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Probléma: Bicep sablon hibák
**Tünetek:**
- Sablon érvényesítési hibák
- Szintaktikai hibák a Bicep fájlokban

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

### Probléma: Build hibák
**Tünetek:**
- Az alkalmazás nem épül fel telepítés közben
- Csomagtelepítési hibák

**Megoldások:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Probléma: Konténer telepítési hibák
**Tünetek:**
- A konténeres alkalmazások nem indulnak el
- Képfelhúzási hibák

**Megoldások:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Probléma: Adatbázis kapcsolat hibák
**Tünetek:**
- Az alkalmazás nem tud csatlakozni az adatbázishoz
- Kapcsolati időtúllépési hibák

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
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Probléma: SSL/TLS tanúsítvány problémák
**Tünetek:**
- HTTPS nem működik
- Tanúsítvány érvényesítési hibák

**Megoldások:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Probléma: CORS konfigurációs problémák
**Tünetek:**
- A frontend nem tudja hívni az API-t
- Kereszt-domain kérések blokkolva

**Megoldások:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 Környezetkezelési problémák

### Probléma: Környezetváltási problémák
**Tünetek:**
- Rossz környezet kerül használatra
- A konfiguráció nem vált megfelelően

**Megoldások:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

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

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 Teljesítményproblémák

### Probléma: Lassú telepítési idők
**Tünetek:**
- A telepítések túl sokáig tartanak
- Időtúllépések telepítés közben

**Megoldások:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### Probléma: Alkalmazás teljesítményproblémák
**Tünetek:**
- Lassú válaszidők
- Magas erőforrás-felhasználás

**Megoldások:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Hibakeresési eszközök és parancsok

### Hibakeresési parancsok
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Naplóelemzés
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

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

### Mikor kell továbbítani
- Az autentikációs problémák nem oldódnak meg az összes megoldás kipróbálása után
- Infrastruktúra problémák az Azure szolgáltatásokkal
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
Mielőtt kapcsolatba lépne a támogatással, gyűjtse össze:
- `azd version` kimenet
- `azd info` kimenet
- Hibaüzenetek (teljes szöveg)
- A probléma reprodukálásának lépései
- Környezet részletei (`azd env show`)
- A probléma kezdési idővonala

### Naplógyűjtési script
```bash
#!/bin/bash
# collect-debug-info.sh

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

### Monitoring beállítása
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Rendszeres karbantartás
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Kapcsolódó források

- [Hibakeresési útmutató](debugging.md) - Haladó hibakeresési technikák
- [Erőforrások létrehozása](../deployment/provisioning.md) - Infrastruktúra hibaelhárítás
- [Kapacitástervezés](../pre-deployment/capacity-planning.md) - Erőforrás-tervezési útmutató
- [SKU kiválasztása](../pre-deployment/sku-selection.md) - Szolgáltatási szint ajánlások

---

**Tipp**: Tartsa ezt az útmutatót könyvjelzőben, és hivatkozzon rá, amikor problémákba ütközik. A legtöbb probléma már előfordult korábban, és van rá megoldás!

---

**Navigáció**
- **Előző lecke**: [Erőforrások létrehozása](../deployment/provisioning.md)
- **Következő lecke**: [Hibakeresési útmutató](debugging.md)

---

**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.