# AZD juurutuste silumise juhend

**Lõigu navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 7 - Tõrkeotsing ja silumine
- **⬅️ Eelmine**: [Tavalised probleemid](common-issues.md)
- **➡️ Järgmine**: [AI-spetsiifiline tõrkeotsing](ai-troubleshooting.md)
- **🚀 Järgmine peatükk**: [Peatükk 8: Toote- ja ettevõtte mustrid](../chapter-08-production/production-ai-practices.md)

## Sissejuhatus

See põhjalik juhend pakub edasijõudnutele suunatud silumisstrateegiaid, tööriistu ja tehnikaid Azure Developer CLI juurutustega seotud keeruliste probleemide diagnoosimiseks ja lahendamiseks. Õppige süstemaatilisi tõrkeotsingu metoodikaid, logi analüüsi tehnikaid, jõudluse profiilimist ja täiustatud diagnostikavahendeid, et tõhusalt lahendada juurutus- ja käituseaegseid probleeme.

## Õpieesmärgid

- Valdada süstemaatilisi silumise metoodikaid Azure Developer CLI probleemide jaoks
- Mõista täiustatud logimise seadistust ja logi analüüsi tehnikaid
- Rakendada jõudluse profiilimise ja jälgimise strateegiaid
- Kasutada Azure'i diagnostikavahendeid ja -teenuseid keeruliste probleemide lahendamiseks
- Rakendada võrgu silumise ja turvalisuse tõrkeotsingu tehnikaid
- Konfigureerida põhjalik jälgimine ja teavitused proaktiivseks probleemide avastamiseks

## Õpitulemused

Pärast lõpetamist suudate:
- Rakendada TRIAGE-metoodikat keeruliste juurutusprobleemide süstemaatiliseks silumiseks
- Seadistada ja analüüsida põhjalikku logimist ja jälgimisinfot
- Kasutada tõhusalt Azure Monitorit, Application Insightsi ja diagnostikavahendeid
- Siluda võrguühenduse, autentimise ja õiguste probleeme iseseisvalt
- Rakendada jõudluse jälgimise ja optimeerimise strateegiaid
- Luua kohandatud silumisskripte ja automatiseerimist korduvate probleemide jaoks

## Silumise metoodika

### TRIAGE lähenemine
- **T**ime: Millal probleem algas?
- **R**eproduce: Kas seda saab järjepidevalt uuesti tekitada?
- **I**solate: Milline komponent ebaõnnestub?
- **A**nalyze: Mida logid meile ütlevad?
- **G**ather: Koguge kõik asjakohane info
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

### Silumise konfiguratsioon
```bash
# Määra silumise konfiguratsioon globaalselt
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Luba jälgimislogimine
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Logi analüüsi tehnikad

### Logitasemete mõistmine
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Struktureeritud logi analüüs
```bash
# Vaata logisid Azure Monitoriga (azd monitori kaudu)
azd monitor --logs

# Vaata rakenduse logisid reaalajas
azd monitor --live

# Põhjalikuks logianalüüsiks kasuta Azure CLI-d koos oma App Service'i või Container Appiga:
# App Service'i logid
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App'i logid
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Ekspordi Application Insightsi logid analüüsimiseks
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Logide korrelatsioon
```bash
#!/bin/bash
# correlate-logs.sh - Seosta logisid teenuste vahel, kasutades Azure Monitorit

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Otsi Application Insightsist korreleeritud logisid
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Otsi Azure'i tegevuslogisid
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Täiustatud silumistööriistad

### Azure Resource Graph päringud
```bash
# Otsi ressursse siltide järgi
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Leia ebaõnnestunud juurutused
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Kontrolli ressursi tervist
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Võrgu silumine
```bash
# Testi teenustevahelist ühenduvust
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
# Konteinerirakenduse probleemide silumine
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

### Andmebaasi ühenduse silumine
```bash
# Siluda andmebaasi ühenduvust
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
# Luba Application Insightsi silumine
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

### Resursside kasutamise analüüs
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
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Määra silumiskeskkond
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

# Käivita kohandatud integratsioonitestid
npm run test:integration
```

### Laadimistestimine silumise jaoks
```bash
# Lihtne koormustest jõudluse kitsaskohtade tuvastamiseks
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Kasutab Apache Bench'i (paigaldamine: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Võtmemõõdikute väljavõtmine
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Kontrolli ebaõnnestumisi
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastruktuuri silumine

### Bicep-malli silumine
```bash
# Valideeri Bicep-mallid üksikasjaliku väljundiga
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Süntaksi valideerimine
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint-valideerimine
    az bicep lint --file "$template_file"
    
    # Mis juhtuks juurutamisel
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Mallide juurutamise silumine
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

### Ressursside oleku analüüs
```bash
# Analüüsi ressursside olekuid ebakõlade suhtes
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Loetle kõik ressursid koos nende olekutega
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Kontrolli ebaõnnestunud ressursse
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

### Autentimise voogude silumine
```bash
# Azure'i autentimise silumine
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Dekodeeri JWT-token (nõuab jq ja base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vaulti juurdepääsu silumine
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
# Siluda võrgu turvagruppe
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

## 📱 Rakenduspõhine silumine

### Node.js rakenduse silumine
```javascript
// debug-middleware.js - Expressi silumisvahekiht
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Logi päringu üksikasju
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Asenda res.json, et logida vastuseid
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

## 🚨 Hädaolukorra silumise protseduurid

### Tootmiskeskkonna probleemidele reageerimine
```bash
#!/bin/bash
# emergency-debug.sh - Hädaolukorra tõrkeotsing tootmises

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

# Lülitu õigele keskkonnale
azd env select "$ENVIRONMENT"

# Kogu kriitilist teavet
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Kasuta Azure Monitorit vealogide jaoks
azd monitor --logs
echo "Check Application Insights for detailed error analysis"

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

### Tagasi pööramise protseduurid
```bash
# Kiire tagasikerimise skript
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Vaheta keskkonda
    azd env select "$environment"
    
    # Tagasikerimine Gitiga (AZD-l ei ole sisseehitatud tagasikerimist)
    git checkout "$previous_commit"
    azd deploy
    
    # Kontrolli tagasikerimist
    echo "Verifying rollback..."
    azd show
    
    # Testi kriitilisi lõpp-punkte
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Silumise armatuurlauad

### Kohandatud jälgimisarmatuurlaud
```bash
# Loo Application Insightsi päringud silumiseks
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

### Logi koondamine
```bash
# Koonda logisid mitmest Azure'i allikast
aggregate_logs() {
    local output_file="aggregated-logs-$(date +%Y%m%d_%H%M%S).json"
    local app_insights_name=$1
    
    echo "Aggregating logs to $output_file"
    
    {
        echo '{"source": "azure-activity", "logs": '
        az monitor activity-log list --start-time "$(date -d '1 hour ago' -Iseconds)" --output json
        echo '}'
        
        if [ -n "$app_insights_name" ]; then
            echo ',{"source": "app-insights", "logs": '
            az monitor app-insights query --app "$app_insights_name" \
                --analytics-query "union traces, exceptions | where timestamp > ago(1h)" --output json
            echo '}'
        fi
    } > "$output_file"
    
    echo "Logs aggregated in $output_file"
}
```

## 🔗 Täiustatud ressursid

### Kohandatud silumisskriptid
Loo kataloog `scripts/debug/`, mis sisaldab:
- `health-check.sh` - Põhjalik tervisekontroll
- `performance-test.sh` - Automatiseeritud jõudlustestimine
- `log-analyzer.py` - Täiustatud logi parsimine ja analüüs
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

1. **Lülitage silumise logimine alati sisse** mitte-tootmiskeskkondades
2. **Looge reprodutseeritavad testjuhtumid** probleemide jaoks
3. **Dokumenteerige silumise protseduurid** oma meeskonnale
4. **Automatiseerige tervisekontrolle** ja jälgimist
5. **Hoidke silumistööriistad ajakohasena** vastavalt rakenduse muudatustele
6. **Harjutage silumise protseduure** mitteintsidentide perioodidel

## Järgmised sammud

- [Võimsuse planeerimine](../chapter-06-pre-deployment/capacity-planning.md) - Planeeri ressursside nõuded
- [SKU valik](../chapter-06-pre-deployment/sku-selection.md) - Vali sobivad teenuse tasemed
- [Eelkontrollid](../chapter-06-pre-deployment/preflight-checks.md) - Eeljuurutuse valideerimine
- [Kiirjuhend](../../resources/cheat-sheet.md) - Kiirviited käskudele

---

**Pea meeles**: Hea silumine tähendab süstemaatilisust, põhjalikkust ja kannatlikkust. Need tööriistad ja tehnikad aitavad teil probleeme kiiremini ja tõhusamalt diagnoosida.

---

**Navigeerimine**
- **Eelnev õppetund**: [Tavalised probleemid](common-issues.md)

- **Järgmine õppetund**: [Võimsuse planeerimine](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Lahtiütlus:
See dokument on tõlgitud tehisintellekti tõlketeenuse Co-op Translator (https://github.com/Azure/co-op-translator) abil. Kuigi me püüame tagada täpsust, palun pidage meeles, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta ühegi arusaamatuse ega valesti tõlgendamise eest, mis tuleneb selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->