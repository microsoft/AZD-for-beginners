<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5395583c1a88847b97d186dd5f5b1a69",
  "translation_date": "2025-11-23T10:33:00+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "hu"
}
-->
# Hibakeresési útmutató AZD telepítésekhez

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 7. fejezet - Hibakeresés és hibaelhárítás
- **⬅️ Előző**: [Gyakori problémák](common-issues.md)
- **➡️ Következő**: [AI-specifikus hibakeresés](ai-troubleshooting.md)
- **🚀 Következő fejezet**: [8. fejezet: Gyártási és vállalati minták](../microsoft-foundry/production-ai-practices.md)

## Bevezetés

Ez az átfogó útmutató fejlett hibakeresési stratégiákat, eszközöket és technikákat mutat be az Azure Developer CLI telepítésekkel kapcsolatos összetett problémák diagnosztizálására és megoldására. Ismerje meg a szisztematikus hibakeresési módszertanokat, a naplóelemzési technikákat, a teljesítményprofilozást és a fejlett diagnosztikai eszközöket, hogy hatékonyan oldhassa meg a telepítési és futásidejű problémákat.

## Tanulási célok

Az útmutató elvégzése után képes lesz:
- Mesteri szinten alkalmazni a szisztematikus hibakeresési módszertanokat az Azure Developer CLI problémák megoldására
- Megérteni a fejlett naplózási konfigurációkat és naplóelemzési technikákat
- Teljesítményprofilozási és monitorozási stratégiákat alkalmazni
- Az Azure diagnosztikai eszközeit és szolgáltatásait használni az összetett problémák megoldására
- Hálózati hibakeresési és biztonsági hibaelhárítási technikákat alkalmazni
- Átfogó monitorozást és riasztásokat konfigurálni a proaktív problémák észlelésére

## Tanulási eredmények

Az útmutató elvégzése után képes lesz:
- Alkalmazni a TRIAGE módszertant az összetett telepítési problémák szisztematikus hibakeresésére
- Konfigurálni és elemezni az átfogó naplózási és nyomkövetési információkat
- Hatékonyan használni az Azure Monitor, Application Insights és diagnosztikai eszközöket
- Önállóan hibakeresni hálózati kapcsolódási, hitelesítési és jogosultsági problémákat
- Teljesítményfigyelési és optimalizálási stratégiákat megvalósítani
- Egyedi hibakeresési szkripteket és automatizálást létrehozni ismétlődő problémákhoz

## Hibakeresési módszertan

### A TRIAGE megközelítés
- **T**ime: Mikor kezdődött a probléma?
- **R**eproduce: Meg lehet-e következetesen ismételni?
- **I**solate: Melyik komponens hibás?
- **A**nalyze: Mit mondanak a naplók?
- **G**ather: Gyűjts össze minden releváns információt
- **E**scalate: Mikor kell további segítséget kérni?

## Hibakeresési mód engedélyezése

### Környezeti változók
```bash
# Engedélyezze az átfogó hibakeresést
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI hibakeresés
export AZURE_CLI_DIAGNOSTICS=true

# Tiltsa le a telemetriát a tisztább kimenet érdekében
export AZD_DISABLE_TELEMETRY=true
```

### Hibakeresési konfiguráció
```bash
# Állítsa be a hibakeresési konfigurációt globálisan
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Engedélyezze a nyomkövetési naplózást
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Naplóelemzési technikák

### Naplószintek megértése
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Strukturált naplóelemzés
```bash
# Szűrje a naplókat szint szerint
azd logs --level error --since 1h

# Szűrés szolgáltatás szerint
azd logs --service api --level debug

# Naplók exportálása elemzéshez
azd logs --output json > deployment-logs.json

# JSON naplók elemzése jq-val
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Naplókorreláció
```bash
#!/bin/bash
# correlate-logs.sh - Naplófájlok korrelálása szolgáltatások között

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Keresés az összes szolgáltatásban
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Keresés Azure naplókban
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Fejlett hibakeresési eszközök

### Azure Resource Graph lekérdezések
```bash
# Erőforrások lekérdezése címkék alapján
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Sikertelen telepítések keresése
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Az erőforrások állapotának ellenőrzése
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Hálózati hibakeresés
```bash
# Tesztelje a szolgáltatások közötti kapcsolatot
test_connectivity() {
    local source=$1
    local dest=$2
    local port=$3
    
    echo "Testing connectivity from $source to $dest:$port"
    
    az network watcher test-connectivity \
        --source-resource "$source" \
        --dest-address "$dest" \
        --dest-port "$port" \
        --output table
}

# Használat
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Konténer hibakeresés
```bash
# Hibakeresés a konténer alkalmazás problémáival kapcsolatban
debug_container() {
    local app_name=$1
    local resource_group=$2
    
    echo "=== Container App Status ==="
    az containerapp show --name "$app_name" --resource-group "$resource_group" \
        --query "properties.{provisioningState:provisioningState,runningState:runningState}"
    
    echo "=== Container App Revisions ==="
    az containerapp revision list --name "$app_name" --resource-group "$resource_group" \
        --query "[].{name:name,active:properties.active,createdTime:properties.createdTime}"
    
    echo "=== Container Logs ==="
    az containerapp logs show --name "$app_name" --resource-group "$resource_group" --follow
}
```

### Adatbázis-kapcsolat hibakeresés
```bash
# Hibakeresés az adatbázis-kapcsolatban
debug_database() {
    local db_server=$1
    local db_name=$2
    
    echo "=== Database Server Status ==="
    az postgres flexible-server show --name "$db_server" --resource-group "$resource_group" \
        --query "{state:state,version:version,location:location}"
    
    echo "=== Firewall Rules ==="
    az postgres flexible-server firewall-rule list --name "$db_server" --resource-group "$resource_group"
    
    echo "=== Connection Test ==="
    timeout 10 bash -c "</dev/tcp/$db_server.postgres.database.azure.com/5432" && echo "Port 5432 is open" || echo "Port 5432 is closed"
}
```

## 🔬 Teljesítmény hibakeresés

### Alkalmazás teljesítményfigyelés
```bash
# Engedélyezze az Application Insights hibakeresést
export APPLICATIONINSIGHTS_CONFIGURATION_CONTENT='{
  "role": {
    "name": "myapp-debug"
  },
  "sampling": {
    "percentage": 100
  },
  "instrumentation": {
    "logging": {
      "level": "DEBUG"
    }
  }
}'

# Egyedi teljesítményfigyelés
monitor_performance() {
    local endpoint=$1
    local duration=${2:-60}
    
    echo "Monitoring $endpoint for $duration seconds..."
    
    for i in $(seq 1 $duration); do
        response_time=$(curl -o /dev/null -s -w "%{time_total}" "$endpoint")
        status_code=$(curl -o /dev/null -s -w "%{http_code}" "$endpoint")
        
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Status: $status_code, Response Time: ${response_time}s"
        sleep 1
    done
}
```

### Erőforrás-használat elemzése
```bash
# Figyelje az erőforrás-használatot
monitor_resources() {
    local resource_group=$1
    
    echo "=== CPU Usage ==="
    az monitor metrics list \
        --resource-group "$resource_group" \
        --resource-type "Microsoft.Web/sites" \
        --metric "CpuPercentage" \
        --interval PT1M \
        --aggregation Average
    
    echo "=== Memory Usage ==="
    az monitor metrics list \
        --resource-group "$resource_group" \
        --resource-type "Microsoft.Web/sites" \
        --metric "MemoryPercentage" \
        --interval PT1M \
        --aggregation Average
}
```

## 🧪 Tesztelés és validáció

### Integrációs teszt hibakeresés
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Állítsa be a hibakeresési környezetet
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Szerezze meg a szolgáltatás végpontjait
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Tesztelje az egészségügyi végpontokat
test_health() {
    local service=$1
    local url=$2
    
    echo "Testing $service health..."
    
    response=$(curl -s -o /dev/null -w "%{http_code},%{time_total}" "$url/health")
    status_code=$(echo $response | cut -d',' -f1)
    response_time=$(echo $response | cut -d',' -f2)
    
    if [ "$status_code" = "200" ]; then
        echo "✅ $service is healthy (${response_time}s)"
    else
        echo "❌ $service health check failed ($status_code)"
        return 1
    fi
}

# Futtassa a teszteket
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Futtassa az egyedi integrációs teszteket
npm run test:integration
```

### Terhelési tesztelés hibakereséshez
```bash
# Egyszerű terhelési teszt a teljesítmény szűk keresztmetszeteinek azonosítására
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench használata (telepítés: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Kulcsfontosságú metrikák kinyerése
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Hibák ellenőrzése
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastruktúra hibakeresés

### Bicep sablon hibakeresés
```bash
# Érvényesítse a Bicep sablonokat részletes kimenettel
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Szintaxis érvényesítés
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint érvényesítés
    az bicep lint --file "$template_file"
    
    # Mi lenne, ha telepítés
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Hibakeresési sablon telepítés
debug_deployment() {
    local deployment_name=$1
    local resource_group=$2
    
    echo "=== Deployment Status ==="
    az deployment group show \
        --name "$deployment_name" \
        --resource-group "$resource_group" \
        --query "properties.{provisioningState:provisioningState,timestamp:timestamp}"
    
    echo "=== Deployment Operations ==="
    az deployment operation group list \
        --name "$deployment_name" \
        --resource-group "$resource_group" \
        --query "[].{operationId:operationId,provisioningState:properties.provisioningState,resourceType:properties.targetResource.resourceType,error:properties.statusMessage.error}"
}
```

### Erőforrás állapotának elemzése
```bash
# Elemezze az erőforrások állapotát az inkonzisztenciák miatt
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Sorolja fel az összes erőforrást az állapotukkal együtt
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Ellenőrizze a sikertelen erőforrásokat
    failed_resources=$(az resource list --resource-group "$resource_group" \
        --query "[?properties.provisioningState != 'Succeeded'].{name:name,state:properties.provisioningState}" \
        --output tsv)
    
    if [ -n "$failed_resources" ]; then
        echo "❌ Failed resources found:"
        echo "$failed_resources"
    else
        echo "✅ All resources provisioned successfully"
    fi
}
```

## 🔒 Biztonsági hibakeresés

### Hitelesítési folyamat hibakeresés
```bash
# Hibakeresés Azure hitelesítéshez
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT token dekódolása (jq és base64 szükséges)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Hibakeresés Key Vault hozzáféréshez
debug_keyvault() {
    local vault_name=$1
    
    echo "=== Key Vault Access Policies ==="
    az keyvault show --name "$vault_name" --query "properties.accessPolicies[].{objectId:objectId,permissions:permissions}"
    
    echo "=== RBAC Assignments ==="
    vault_id=$(az keyvault show --name "$vault_name" --query id -o tsv)
    az role assignment list --scope "$vault_id"
    
    echo "=== Test Secret Access ==="
    az keyvault secret list --vault-name "$vault_name" --query "[].name" || echo "❌ Cannot access secrets"
}
```

### Hálózati biztonsági hibakeresés
```bash
# Hibakeresés hálózati biztonsági csoportoknál
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Ellenőrizze a biztonsági szabályokat
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Alkalmazás-specifikus hibakeresés

### Node.js alkalmazás hibakeresés
```javascript
// debug-middleware.js - Express hibakeresési köztes szoftver
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Naplózza a kérés részleteit
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Felülírja a res.json-t a válaszok naplózásához
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Adatbázis-lekérdezés hibakeresés
```javascript
// database-debug.js - Adatbázis hibakeresési segédprogramok
const { Pool } = require('pg');
const debug = require('debug')('app:db');

class DebuggingPool extends Pool {
    async query(text, params) {
        const start = Date.now();
        debug('Executing query:', { text, params });
        
        try {
            const result = await super.query(text, params);
            const duration = Date.now() - start;
            debug(`Query completed in ${duration}ms`, {
                rowCount: result.rowCount,
                command: result.command
            });
            return result;
        } catch (error) {
            const duration = Date.now() - start;
            debug(`Query failed after ${duration}ms:`, error.message);
            throw error;
        }
    }
}

module.exports = DebuggingPool;
```

## 🚨 Vészhelyzeti hibakeresési eljárások

### Gyártási probléma kezelése
```bash
#!/bin/bash
# emergency-debug.sh - Vészhelyzeti produkciós hibakeresés

set -e

RESOURCE_GROUP=$1
ENVIRONMENT=$2

if [ -z "$RESOURCE_GROUP" ] || [ -z "$ENVIRONMENT" ]; then
    echo "Usage: $0 <resource-group> <environment>"
    exit 1
fi

echo "🚨 EMERGENCY DEBUGGING STARTED: $(date)"
echo "Resource Group: $RESOURCE_GROUP"
echo "Environment: $ENVIRONMENT"

# Váltás a megfelelő környezetre
azd env select "$ENVIRONMENT"

# Kritikus információk gyűjtése
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
azd logs --level error --since 30m > emergency-errors.log
echo "Error count: $(wc -l < emergency-errors.log)"

echo "=== 4. Resource Status ==="
az resource list --resource-group "$RESOURCE_GROUP" \
    --query "[?properties.provisioningState != 'Succeeded']" > failed-resources.json

if [ -s failed-resources.json ]; then
    echo "❌ Failed resources found!"
    cat failed-resources.json
else
    echo "✅ All resources are healthy"
fi

echo "=== 5. Recent Deployments ==="
az deployment group list --resource-group "$RESOURCE_GROUP" \
    --query "[?properties.timestamp >= '$(date -d '1 hour ago' -Iseconds)']" \
    > recent-deployments.json

echo "Emergency debugging completed: $(date)"
echo "Files generated:"
echo "  - emergency-status.json"
echo "  - emergency-errors.log"
echo "  - failed-resources.json"
echo "  - recent-deployments.json"
```

### Visszaállítási eljárások
```bash
# Gyors visszaállítási szkript
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Környezet váltása
    azd env select "$environment"
    
    # Alkalmazás visszaállítása
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Visszaállítás ellenőrzése
    echo "Verifying rollback..."
    azd show
    
    # Kritikus végpontok tesztelése
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Hibakeresési irányítópultok

### Egyedi monitorozási irányítópult
```bash
# Hozzon létre Application Insights lekérdezéseket hibakereséshez
create_debug_queries() {
    local app_insights_name=$1
    
    # Lekérdezés hibákra
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Lekérdezés teljesítményproblémákra
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Lekérdezés függőségi hibákra
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Naplóösszesítés
```bash
# Naplófájlok összesítése több forrásból
aggregate_logs() {
    local output_file="aggregated-logs-$(date +%Y%m%d_%H%M%S).json"
    
    echo "Aggregating logs to $output_file"
    
    {
        echo '{"source": "azd", "logs": ['
        azd logs --output json --since 1h | sed '$ ! s/$/,/'
        echo ']}'
        
        echo ',{"source": "azure", "logs": ['
        az monitor activity-log list --start-time "$(date -d '1 hour ago' -Iseconds)" --output json | sed '$ ! s/$/,/'
        echo ']}'
    } > "$output_file"
    
    echo "Logs aggregated in $output_file"
}
```

## 🔗 Fejlett források

### Egyedi hibakeresési szkriptek
Hozzon létre egy `scripts/debug/` könyvtárat az alábbiakkal:
- `health-check.sh` - Átfogó állapotellenőrzés
- `performance-test.sh` - Automatizált teljesítménytesztelés
- `log-analyzer.py` - Fejlett naplóelemzés
- `resource-validator.sh` - Infrastruktúra validáció

### Monitorozási integráció
```yaml
# azure.yaml - Add debugging hooks
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running post-deployment debugging..."
      ./scripts/debug/health-check.sh
      ./scripts/debug/performance-test.sh
      
      if [ "$?" -ne 0 ]; then
        echo "❌ Post-deployment checks failed"
        exit 1
      fi
```

## Legjobb gyakorlatok

1. **Mindig engedélyezze a hibakeresési naplózást** nem éles környezetekben
2. **Hozzon létre reprodukálható teszteseteket** a problémákhoz
3. **Dokumentálja a hibakeresési eljárásokat** a csapat számára
4. **Automatizálja az állapotellenőrzéseket** és a monitorozást
5. **Tartsa naprakészen a hibakeresési eszközöket** az alkalmazás változásaival
6. **Gyakorolja a hibakeresési eljárásokat** nem vészhelyzeti időszakokban

## Következő lépések

- [Kapacitástervezés](../pre-deployment/capacity-planning.md) - Erőforrásigények tervezése
- [SKU kiválasztása](../pre-deployment/sku-selection.md) - Megfelelő szolgáltatási szintek kiválasztása
- [Előzetes ellenőrzések](../pre-deployment/preflight-checks.md) - Telepítés előtti validáció
- [Gyorsreferencia](../../resources/cheat-sheet.md) - Gyors parancsreferencia

---

**Ne feledje**: A jó hibakeresés a szisztematikus, alapos és türelmes munkáról szól. Ezek az eszközök és technikák segítenek gyorsabban és hatékonyabban diagnosztizálni a problémákat.

---

**Navigáció**
- **Előző lecke**: [Gyakori problémák](common-issues.md)

- **Következő lecke**: [Kapacitástervezés](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősségi nyilatkozat**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Fontos információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->