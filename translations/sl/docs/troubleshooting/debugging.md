<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5395583c1a88847b97d186dd5f5b1a69",
  "translation_date": "2025-11-23T21:28:54+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "sl"
}
-->
# Vodnik za odpravljanje napak pri AZD namestitvah

**Navigacija po poglavjih:**
- **📚 Domov**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 7 - Odpravljanje težav in napak
- **⬅️ Prejšnje**: [Pogoste težave](common-issues.md)
- **➡️ Naslednje**: [Odpravljanje težav, povezanih z AI](ai-troubleshooting.md)
- **🚀 Naslednje poglavje**: [Poglavje 8: Vzorci za produkcijo in podjetja](../microsoft-foundry/production-ai-practices.md)

## Uvod

Ta obsežen vodnik ponuja napredne strategije, orodja in tehnike za diagnosticiranje in reševanje kompleksnih težav pri namestitvah Azure Developer CLI. Naučite se sistematičnih metodologij odpravljanja težav, tehnik analize dnevnikov, profiliranja zmogljivosti in uporabe naprednih diagnostičnih orodij za učinkovito reševanje težav pri namestitvah in med izvajanjem.

## Cilji učenja

Z zaključkom tega vodnika boste:
- Obvladali sistematične metodologije odpravljanja napak pri težavah z Azure Developer CLI
- Razumeli napredno konfiguracijo dnevnikov in tehnike analize dnevnikov
- Uvedli strategije za profiliranje zmogljivosti in spremljanje
- Uporabili diagnostična orodja in storitve Azure za reševanje kompleksnih težav
- Uporabili tehnike odpravljanja težav z omrežjem in varnostjo
- Konfigurirali celovito spremljanje in opozarjanje za proaktivno odkrivanje težav

## Rezultati učenja

Po zaključku boste sposobni:
- Uporabiti metodologijo TRIAGE za sistematično odpravljanje kompleksnih težav pri namestitvah
- Konfigurirati in analizirati celovite informacije o beleženju in sledenju
- Učinkovito uporabljati Azure Monitor, Application Insights in diagnostična orodja
- Samostojno odpravljati težave z omrežno povezljivostjo, avtentikacijo in dovoljenji
- Uvesti strategije za spremljanje zmogljivosti in optimizacijo
- Ustvariti prilagojene skripte za odpravljanje napak in avtomatizacijo ponavljajočih se težav

## Metodologija odpravljanja napak

### Pristop TRIAGE
- **T**ime: Kdaj se je težava začela?
- **R**eproduce: Ali jo lahko dosledno reproducirate?
- **I**solate: Katera komponenta ne deluje?
- **A**nalyze: Kaj nam povedo dnevniki?
- **G**ather: Zberite vse ustrezne informacije
- **E**scalate: Kdaj poiskati dodatno pomoč

## Omogočanje načina za odpravljanje napak

### Spremenljivke okolja
```bash
# Omogoči celovito odpravljanje napak
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Odpravljanje napak Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Onemogoči telemetrijo za čistejši izhod
export AZD_DISABLE_TELEMETRY=true
```

### Konfiguracija za odpravljanje napak
```bash
# Nastavi konfiguracijo za odpravljanje napak globalno
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Omogoči sledenje zapisovanja logov
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

### Strukturna analiza dnevnikov
```bash
# Filtriraj dnevnike po ravni
azd logs --level error --since 1h

# Filtriraj po storitvi
azd logs --service api --level debug

# Izvozi dnevnike za analizo
azd logs --output json > deployment-logs.json

# Razčleni JSON dnevnike z jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Korelacija dnevnikov
```bash
#!/bin/bash
# correlate-logs.sh - Korelacija dnevnikov med storitvami

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Iskanje med vsemi storitvami
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Iskanje dnevnikov Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Napredna orodja za odpravljanje napak

### Poizvedbe Azure Resource Graph
```bash
# Poizvedba virov po oznakah
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Poišči neuspele namestitve
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Preveri stanje virov
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Odpravljanje težav z omrežjem
```bash
# Preizkusite povezljivost med storitvami
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

### Odpravljanje težav s kontejnerji
```bash
# Odpravljanje težav z aplikacijo vsebnika
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

### Odpravljanje težav s povezavo z bazo podatkov
```bash
# Odpravljanje napak pri povezavi z bazo podatkov
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

## 🔬 Odpravljanje težav z zmogljivostjo

### Spremljanje zmogljivosti aplikacij
```bash
# Omogoči odpravljanje napak v Application Insights
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

### Analiza uporabe virov
```bash
# Spremljajte uporabo virov
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

## 🧪 Testiranje in validacija

### Odpravljanje težav pri integracijskih testih
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Nastavi okolje za razhroščevanje
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Pridobi končne točke storitve
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

### Testiranje obremenitve za odpravljanje napak
```bash
# Preprost test obremenitve za prepoznavanje ozkih grl zmogljivosti
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
    
    # Preveri napake
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Odpravljanje težav z infrastrukturo

### Odpravljanje težav s predlogami Bicep
```bash
# Preverite predloge Bicep s podrobnim izpisom
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Preverjanje sintakse
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Preverjanje pravilnosti
    az bicep lint --file "$template_file"
    
    # Kaj-če uvajanje
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Odpravljanje napak pri uvajanju predloge
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
# Analiziraj stanja virov za neskladnosti
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Naštej vse vire z njihovimi stanji
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Preveri neuspele vire
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

### Odpravljanje težav z avtentikacijo
```bash
# Odpravljanje napak pri avtentikaciji Azure
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

### Odpravljanje težav z omrežno varnostjo
```bash
# Odpravljanje napak pri varnostnih skupinah omrežja
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

## 📱 Odpravljanje težav, specifičnih za aplikacije

### Odpravljanje težav z aplikacijami Node.js
```javascript
// debug-middleware.js - Express odpravljalnik napak middleware
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
    
    // Prepiši res.json za beleženje odgovorov
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Odpravljanje težav z poizvedbami v bazi podatkov
```javascript
// database-debug.js - Orodja za odpravljanje napak v podatkovni bazi
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

### Odziv na težave v produkciji
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

# Zberi ključne informacije
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

### Postopki za povrnitev
```bash
# Hitri skript za povrnitev
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Preklopi okolje
    azd env select "$environment"
    
    # Povrni aplikacijo
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Preveri povrnitev
    echo "Verifying rollback..."
    azd show
    
    # Testiraj kritične končne točke
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
    
    # Poizvedba za neuspehe odvisnosti
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Združevanje dnevnikov
```bash
# Združi dnevnike iz več virov
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

## 🔗 Napredni viri

### Prilagojeni skripti za odpravljanje napak
Ustvarite imenik `scripts/debug/` z:
- `health-check.sh` - Celovito preverjanje stanja
- `performance-test.sh` - Avtomatizirano testiranje zmogljivosti
- `log-analyzer.py` - Napredna analiza in razčlenjevanje dnevnikov
- `resource-validator.sh` - Validacija infrastrukture

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

1. **Vedno omogočite beleženje napak** v neprodukcijskih okoljih
2. **Ustvarite reproducibilne testne primere** za težave
3. **Dokumentirajte postopke odpravljanja napak** za svojo ekipo
4. **Avtomatizirajte preverjanje stanja** in spremljanje
5. **Posodabljajte orodja za odpravljanje napak** skladno s spremembami aplikacije
6. **Vadite postopke odpravljanja napak** v času, ko ni incidentov

## Naslednji koraki

- [Načrtovanje zmogljivosti](../pre-deployment/capacity-planning.md) - Načrtujte zahteve za vire
- [Izbira SKU](../pre-deployment/sku-selection.md) - Izberite ustrezne nivoje storitev
- [Preflight preverjanja](../pre-deployment/preflight-checks.md) - Validacija pred namestitvijo
- [Pomožni list](../../resources/cheat-sheet.md) - Hitri referenčni ukazi

---

**Zapomnite si**: Dobro odpravljanje napak zahteva sistematičnost, temeljitost in potrpežljivost. Ta orodja in tehnike vam bodo pomagale hitreje in učinkoviteje diagnosticirati težave.

---

**Navigacija**
- **Prejšnja lekcija**: [Pogoste težave](common-issues.md)

- **Naslednja lekcija**: [Načrtovanje zmogljivosti](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve AI za prevajanje [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->