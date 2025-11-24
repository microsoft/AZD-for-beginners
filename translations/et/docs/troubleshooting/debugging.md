<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5395583c1a88847b97d186dd5f5b1a69",
  "translation_date": "2025-11-24T13:02:14+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "et"
}
-->
# AZD juurutuste silumise juhend

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 7 - Tõrkeotsing ja silumine
- **⬅️ Eelmine**: [Levinud probleemid](common-issues.md)
- **➡️ Järgmine**: [AI-spetsiifiline tõrkeotsing](ai-troubleshooting.md)
- **🚀 Järgmine peatükk**: [Peatükk 8: Tootmise ja ettevõtte mustrid](../microsoft-foundry/production-ai-practices.md)

## Sissejuhatus

See põhjalik juhend pakub edasijõudnud silumisstrateegiaid, tööriistu ja tehnikaid keeruliste probleemide diagnoosimiseks ja lahendamiseks Azure Developer CLI juurutustes. Õppige süsteemseid tõrkeotsingu meetodeid, logianalüüsi tehnikaid, jõudluse profiilimist ja täiustatud diagnostikavahendeid, et tõhusalt lahendada juurutamise ja käitamise probleeme.

## Õpieesmärgid

Selle juhendi läbimisega õpite:
- Valdama süsteemseid silumismeetodeid Azure Developer CLI probleemide lahendamiseks
- Mõistma täiustatud logide konfigureerimist ja logianalüüsi tehnikaid
- Rakendama jõudluse profiilimist ja jälgimisstrateegiaid
- Kasutama Azure diagnostikavahendeid ja teenuseid keeruliste probleemide lahendamiseks
- Rakendama võrgu silumist ja turvalisuse tõrkeotsingu tehnikaid
- Konfigureerima terviklikku jälgimist ja hoiatusi probleemide ennetavaks tuvastamiseks

## Õpitulemused

Pärast juhendi läbimist suudate:
- Rakendada TRIAGE metoodikat keeruliste juurutusprobleemide süsteemseks silumiseks
- Konfigureerida ja analüüsida põhjalikku logimist ja jälgimisteavet
- Kasutada tõhusalt Azure Monitori, Application Insightsi ja diagnostikavahendeid
- Iseseisvalt siluda võrguühenduse, autentimise ja õiguste probleeme
- Rakendada jõudluse jälgimise ja optimeerimise strateegiaid
- Luua kohandatud silumisskripte ja automatiseerimist korduvate probleemide lahendamiseks

## Silumismetoodika

### TRIAGE lähenemine
- **T**ime: Millal probleem algas?
- **R**eproduce: Kas saate seda järjepidevalt taastada?
- **I**solate: Milline komponent ei tööta?
- **A**nalyze: Mida logid meile räägivad?
- **G**ather: Koguge kõik asjakohased andmed
- **E**scalate: Millal otsida täiendavat abi

## Silumisrežiimi lubamine

### Keskkonnamuutujad
```bash
# Luba põhjalik silumine
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI silumine
export AZURE_CLI_DIAGNOSTICS=true

# Keela telemeetria puhtama väljundi jaoks
export AZD_DISABLE_TELEMETRY=true
```

### Silumiskonfiguratsioon
```bash
# Määra silumise konfiguratsioon globaalselt
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Luba jälituse logimine
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Logianalüüsi tehnikad

### Logitasemete mõistmine
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Struktureeritud logianalüüs
```bash
# Filtreeri logisid taseme järgi
azd logs --level error --since 1h

# Filtreeri teenuse järgi
azd logs --service api --level debug

# Ekspordi logid analüüsimiseks
azd logs --output json > deployment-logs.json

# Parsige JSON logisid jq-ga
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Logide korrelatsioon
```bash
#!/bin/bash
# correlate-logs.sh - Korrelatsiooni logid teenuste vahel

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Otsi kõigi teenuste vahel
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Otsi Azure'i logisid
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Täiustatud silumisvahendid

### Azure Resource Graph päringud
```bash
# Päring ressurside kohta siltide järgi
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Leia ebaõnnestunud juurutused
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Kontrolli ressursside tervist
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Võrgu silumine
```bash
# Testi ühenduvust teenuste vahel
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

# Kasutamine
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Konteineri silumine
```bash
# Siluge konteinerirakenduse probleeme
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

### Andmebaasiühenduse silumine
```bash
# Silu andmebaasi ühenduvust
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

## 🔬 Jõudluse silumine

### Rakenduse jõudluse jälgimine
```bash
# Luba rakenduse Insights silumine
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

# Kohandatud jõudluse jälgimine
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

### Ressursikasutuse analüüs
```bash
# Jälgi ressursikasutust
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

## 🧪 Testimine ja valideerimine

### Integratsioonitestide silumine
```bash
#!/bin/bash
# debug-integratsiooni-testid.sh

set -e

echo "Running integration tests with debugging..."

# Määra silumise keskkond
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Hangi teenuse lõpp-punktid
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Testi tervise lõpp-punkte
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

# Käivita testid
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Käivita kohandatud integratsiooni testid
npm run test:integration
```

### Koormustestimine silumiseks
```bash
# Lihtne koormustest jõudlusprobleemide tuvastamiseks
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Kasutades Apache Bench'i (installimine: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Ekstrakti võtmemõõdikud
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Kontrolli vigade esinemist
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastruktuuri silumine

### Bicep mallide silumine
```bash
# Kontrolli Bicep mallide kehtivust üksikasjaliku väljundiga
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Süntaksi kontroll
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lindi kontroll
    az bicep lint --file "$template_file"
    
    # Mis-juhtub-kui juurutamine
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Silu malli juurutamist
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

### Ressursi oleku analüüs
```bash
# Analüüsige ressursside olekuid ebakõlade suhtes
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Loetlege kõik ressursid koos nende olekutega
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Kontrollige ebaõnnestunud ressursse
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

## 🔒 Turvalisuse silumine

### Autentimisvoo silumine
```bash
# Silu Azure autentimist
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Dekodeeri JWT token (vajab jq ja base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Silu Key Vaulti ligipääsu
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

### Võrgu turvalisuse silumine
```bash
# Silu võrgu turberühmi
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Kontrolli turvareegleid
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Rakenduse-spetsiifiline silumine

### Node.js rakenduse silumine
```javascript
// debug-middleware.js - Expressi silumisvahend
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Logi päringu üksikasjad
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Kirjuta üle res.json, et logida vastuseid
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Andmebaasi päringute silumine
```javascript
// database-debug.js - Andmebaasi silumise tööriistad
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

## 🚨 Hädaolukorra silumisprotseduurid

### Tootmisprobleemide lahendamine
```bash
#!/bin/bash
# emergency-debug.sh - Hädaolukorra tootmise silumine

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

# Lülitu õigesse keskkonda
azd env select "$ENVIRONMENT"

# Kogu kriitiline teave
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

### Tagasipööramise protseduurid
```bash
# Kiire tagasipööramise skript
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Keskkonna vahetamine
    azd env select "$environment"
    
    # Rakenduse tagasipööramine
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Tagasipööramise kontrollimine
    echo "Verifying rollback..."
    azd show
    
    # Kriitiliste lõpp-punktide testimine
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Silumise juhtpaneelid

### Kohandatud jälgimisjuhtpaneel
```bash
# Loo Application Insights päringud silumiseks
create_debug_queries() {
    local app_insights_name=$1
    
    # Päring vigade jaoks
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Päring jõudlusprobleemide jaoks
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Päring sõltuvuste tõrgete jaoks
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Logide koondamine
```bash
# Koguge logisid mitmest allikast
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

## 🔗 Täiustatud ressursid

### Kohandatud silumisskriptid
Looge kataloog `scripts/debug/` koos:
- `health-check.sh` - Põhjalik tervisekontroll
- `performance-test.sh` - Automatiseeritud jõudluse testimine
- `log-analyzer.py` - Täiustatud logide parsimine ja analüüs
- `resource-validator.sh` - Infrastruktuuri valideerimine

### Jälgimise integreerimine
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

## Parimad tavad

1. **Lubage alati silumislogimine** mitte-tootmiskeskkondades
2. **Looge korduvtestitavad juhtumid** probleemide jaoks
3. **Dokumenteerige silumisprotseduurid** oma meeskonnale
4. **Automatiseerige tervisekontrollid** ja jälgimine
5. **Hoidke silumisvahendid ajakohased** vastavalt rakenduse muudatustele
6. **Harjutage silumisprotseduure** mitte-intsidentide ajal

## Järgmised sammud

- [Mahutavuse planeerimine](../pre-deployment/capacity-planning.md) - Planeerige ressursinõuded
- [SKU valik](../pre-deployment/sku-selection.md) - Valige sobivad teenusetasemed
- [Eelkontrollid](../pre-deployment/preflight-checks.md) - Eeljuurutuse valideerimine
- [Spikri leht](../../resources/cheat-sheet.md) - Kiirviited käskudele

---

**Pidage meeles**: Hea silumine seisneb süsteemsuses, põhjalikkuses ja kannatlikkuses. Need tööriistad ja tehnikad aitavad teil probleeme kiiremini ja tõhusamalt diagnoosida.

---

**Navigeerimine**
- **Eelmine õppetund**: [Levinud probleemid](common-issues.md)

- **Järgmine õppetund**: [Mahutavuse planeerimine](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->