# Vodnik za odpravljanje napak pri razmestitvah AZD

**Navigacija poglavij:**
- **📚 Domov tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 7 - Odpravljanje težav in odpravljanje napak
- **⬅️ Prejšnje**: [Pogoste težave](common-issues.md)
- **➡️ Naslednje**: [Odpravljanje težav za AI](ai-troubleshooting.md)
- **🚀 Naslednje poglavje**: [Poglavje 8: Produkcijski in podjetniški vzorci](../chapter-08-production/production-ai-practices.md)

## Uvod

Ta obsežen vodič ponuja napredne strategije za odpravljanje napak, orodja in tehnike za diagnosticiranje in reševanje zapletenih težav pri razmestitvah z Azure Developer CLI. Naučite se sistematičnih metodologij za odpravljanje težav, tehnik analize dnevnikov, profiliranja zmogljivosti in naprednih diagnostičnih orodij za učinkovito reševanje težav pri nameščanju in izvajanju.

## Cilji učenja

Z dokončanjem tega vodiča boste:
- Obvladali sistematične metodologije odpravljanja napak za težave z Azure Developer CLI
- Razumeli napredne nastavitve beleženja in tehnike analize dnevnikov
- Izvedli strategije profiliranja in spremljanja zmogljivosti
- Uporabljali Azure diagnostična orodja in storitve za reševanje zapletenih težav
- Uporabili tehnike odpravljanja napak omrežja in varnostnega odpravljanja težav
- Konfigurirali obsežno spremljanje in opozarjanje za proaktivno zaznavanje težav

## Pričakovani izidi učenja

Po zaključku boste sposobni:
- Uporabiti metodologijo TRIAGE za sistematično odpravljanje zapletenih težav pri razmestitvah
- Konfigurirati in analizirati obsežne informacije o beleženju in sledenju
- Učinkovito uporabljati Azure Monitor, Application Insights in diagnostična orodja
- Neodvisno odpravljati težave s omrežno povezanostjo, avtentikacijo in dovoljenji
- Implementirati strategije spremljanja in optimizacije zmogljivosti
- Ustvariti prilagojene skripte za odpravljanje napak in avtomatizacijo za ponavljajoče se težave

## Metodologija odpravljanja napak

### Pristop TRIAGE
- **T**ime: Kdaj se je težava začela?
- **R**eproduce: Ali jo lahko dosledno reproducirate?
- **I**solate: Katera komponenta odpoveduje?
- **A**nalyze: Kaj nam povedo dnevniki?
- **G**ather: Zberite vse ustrezne informacije
- **E**scalate: Kdaj poiskati dodatno pomoč

## Omogočanje načina odpravljanja napak

### Okoljske spremenljivke
```bash
# Omogoči celovito odpravljanje napak
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Odpravljanje napak v Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Onemogoči telemetrijo za čistejši izpis
export AZD_DISABLE_TELEMETRY=true
```

### Konfiguracija odpravljanja napak
```bash
# Nastavi globalno konfiguracijo za odpravljanje napak
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Omogoči podrobno beleženje
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Tehnike analize dnevnikov

### Razumevanje ravni dnevnikov
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Strukturirana analiza dnevnikov
```bash
# Ogled dnevnikov z Azure Monitor (prek azd monitor)
azd monitor --logs

# Ogled dnevnikov aplikacije v realnem času
azd monitor --live

# Za podrobno analizo dnevnikov uporabite Azure CLI z vašo App Service ali Container App:
# Dnevniki App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# Dnevniki Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Izvozi dnevnike Application Insights za analizo
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Korelacija dnevnikov
```bash
#!/bin/bash
# correlate-logs.sh - Poveži dnevnike med storitvami z uporabo Azure Monitorja

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Poišči v Application Insights povezane dnevnike
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Poišči dnevnike aktivnosti Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Napredna orodja za odpravljanje napak

### Poizvedbe Azure Resource Graph
```bash
# Poišči vire po oznakah
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Poišči neuspešne razmestitve
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Preveri stanje virov
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Odpravljanje napak omrežja
```bash
# Preizkus povezljivosti med storitvami
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

# Uporaba
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Odpravljanje napak v kontejnerjih
```bash
# Odpravljanje napak pri aplikaciji v kontejnerju
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

### Odpravljanje napak povezave do baze podatkov
```bash
# Odpravljanje napak pri povezljivosti z bazo podatkov
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

## 🔬 Odpravljanje napak zmogljivosti

### Spremljanje zmogljivosti aplikacij
```bash
# Omogoči odpravljanje napak za Application Insights
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

# Prilagojeno spremljanje zmogljivosti
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

### Analiza izrabe virov
```bash
# Spremljaj porabo virov
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

## 🧪 Testiranje in preverjanje

### Odpravljanje napak integracijskih testov
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Nastavi okolje za odpravljanje napak
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Pridobi končne točke storitev
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Preizkusi končne točke zdravja
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

# Zaženi teste
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Zaženi prilagojene integracijske teste
npm run test:integration
```

### Obremenitveno testiranje za odpravljanje napak
```bash
# Preprost test obremenitve za odkrivanje ozkih grl v zmogljivosti
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Uporaba Apache Bench (namestitev: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Izvleči ključne metrike
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Preverite morebitne napake
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Odpravljanje napak infrastrukture

### Odpravljanje napak predlog Bicep
```bash
# Preveri predloge Bicep s podrobnim izhodom
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Preverjanje sintakse
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Preverjanje linta
    az bicep lint --file "$template_file"
    
    # Simulacija uvajanja (what-if)
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Razhroščevanje uvajanja predloge
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

### Analiza stanja virov
```bash
# Analizirajte stanja virov glede neskladij
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Naštejte vse vire z njihovimi stanji
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Preverite neuspele vire
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

## 🔒 Odpravljanje varnostnih težav

### Odpravljanje napak poteka avtentikacije
```bash
# Odpravljanje napak pri overjanju v Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Dekodiraj JWT žeton (zahteva jq in base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Odpravljanje napak pri dostopu do Key Vault
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

### Odpravljanje varnostnih težav omrežja
```bash
# Odpravljanje napak v omrežnih varnostnih skupinah
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Preveri varnostna pravila
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Odpravljanje napak specifičnih za aplikacijo

### Odpravljanje napak aplikacij Node.js
```javascript
// debug-middleware.js - Express vmesna programska oprema za odpravljanje napak
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Zabeleži podrobnosti zahteve
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Prekrij res.json, da zabeleži odgovore
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Odpravljanje napak poizvedb v bazi podatkov
```javascript
// database-debug.js - pripomočki za odpravljanje napak v bazi podatkov
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

## 🚨 Postopki za nujno odpravljanje napak

### Reakcija na težave v produkciji
```bash
#!/bin/bash
# emergency-debug.sh - Nujno odpravljanje napak v produkciji

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

# Preklopi na pravilno okolje
azd env select "$ENVIRONMENT"

# Zberi kritične informacije
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Uporabi Azure Monitor za dnevniške zapise napak
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

### Postopki povrnitve (rollback)
```bash
# Hiter skript za povrnitev
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Preklopi okolje
    azd env select "$environment"
    
    # Povrnitev z uporabo Gita (AZD nima vgrajene funkcije za povrnitev)
    git checkout "$previous_commit"
    azd deploy
    
    # Preveri povrnitev
    echo "Verifying rollback..."
    azd show
    
    # Preizkusi kritične končne točke
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Nadzorne plošče za odpravljanje napak

### Prilagojena nadzorna plošča za spremljanje
```bash
# Ustvarite poizvedbe Application Insights za odpravljanje napak
create_debug_queries() {
    local app_insights_name=$1
    
    # Poizvedba za napake
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Poizvedba za težave z zmogljivostjo
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Poizvedba za napake odvisnosti
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Agregacija dnevnikov
```bash
# Zbiranje dnevnikov iz več virov Azure
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

## 🔗 Napredni viri

### Prilagojene skripte za odpravljanje napak
Ustvarite imenik `scripts/debug/` z:
- `health-check.sh` - Celovito preverjanje zdravja
- `performance-test.sh` - Avtomatizirano preizkušanje zmogljivosti
- `log-analyzer.py` - Napredno razčlenjevanje in analiza dnevnikov
- `resource-validator.sh` - Preverjanje infrastrukture

### Integracija spremljanja
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

## Najboljše prakse

1. **Vedno omogočite beleženje za odpravljanje napak** v neprodukcijskih okoljih
2. **Ustvarite ponovljive testne primere** za težave
3. **Dokumentirajte postopke odpravljanja napak** za vašo ekipo
4. **Avtomatizirajte preverjanja zdravja** in spremljanje
5. **Posodabljajte orodja za odpravljanje napak** skladno z spremembami aplikacije
6. **Vadite postopke odpravljanja napak** v času brez incidentov

## Naslednji koraki

- [Načrtovanje zmogljivosti](../chapter-06-pre-deployment/capacity-planning.md) - Načrtujte potrebe po virih
- [Izbira SKU](../chapter-06-pre-deployment/sku-selection.md) - Izberite ustrezne ravni storitev
- [Predhodni pregledi](../chapter-06-pre-deployment/preflight-checks.md) - Preverjanje pred nameščanjem
- [Priročni list](../../resources/cheat-sheet.md) - Hitri referenčni ukazi

---

**Zapomnite si**: Dobro odpravljanje napak je sistematično, temeljito in potrpežljivo. Ta orodja in tehnike vam bodo pomagala diagnosticirati težave hitreje in učinkoviteje.

---

**Navigacija**
- **Prejšnja lekcija**: [Pogoste težave](common-issues.md)

- **Naslednja lekcija**: [Načrtovanje zmogljivosti](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas opozarjamo, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku velja za avtoritativni vir. Za pomembne informacije priporočamo strokovni človeški prevod. Nismo odgovorni za morebitne nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->