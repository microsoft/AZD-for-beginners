# Sprievodca ladením pre nasadenia AZD

**Navigácia kapitoly:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 7 - Riešenie problémov a ladenie
- **⬅️ Predchádzajúca**: [Bežné problémy](common-issues.md)
- **➡️ Nasledujúca**: [Riešenie problémov špecifických pre AI](ai-troubleshooting.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 8: Produkčné & podnikové vzory](../chapter-08-production/production-ai-practices.md)

## Úvod

Tento komplexný sprievodca poskytuje pokročilé stratégie ladenia, nástroje a techniky na diagnostiku a riešenie zložitých problémov s nasadeniami Azure Developer CLI. Naučte sa systematické metodiky riešenia problémov, techniky analýzy logov, profilovanie výkonu a pokročilé diagnostické nástroje na efektívne riešenie problémov s nasadením a behom.

## Ciele učenia

Po dokončení tohto sprievodcu budete:
- Ovládať systematické metodiky ladenia problémov Azure Developer CLI
- Rozumieť pokročilej konfigurácii logovania a technikám analýzy logov
- Implementovať profilovanie výkonu a stratégie monitorovania
- Používať diagnostické nástroje a služby Azure na riešenie zložitých problémov
- Aplikovať ladenie siete a techniky riešenia bezpečnostných problémov
- Konfigurovať komplexné monitorovanie a upozornenia pre proaktívne zistenie problémov

## Výsledky učenia

Po dokončení budete schopní:
- Aplikovať metodológiu TRIAGE na systematické ladenie zložitých problémov s nasadením
- Konfigurovať a analyzovať komplexné informácie o logovaní a trasovaní
- Efektívne používať Azure Monitor, Application Insights a diagnostické nástroje
- Samostatne ladiť problémy s sieťovou konektivitou, autentifikáciou a oprávneniami
- Implementovať monitorovanie výkonu a stratégie optimalizácie
- Vytvárať vlastné skripty na ladenie a automatizáciu pre opakujúce sa problémy

## Metodológia ladenia

### Prístup TRIAGE
- **T**ime: Kedy sa problém začal vyskytovať?
- **R**eproduce: Viete ho dôsledne reprodukovať?
- **I**solate: Ktorá súčasť zlyháva?
- **A**nalyze: Čo nám hovoria logy?
- **G**ather: Zozbierajte všetky relevantné informácie
- **E**scalate: Kedy vyhľadať dodatočnú pomoc

## Povolenie režimu ladenia

### Premenné prostredia
```bash
# Povoliť podrobné ladenie
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Ladenie Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Zakázať telemetriu pre čistejší výstup
export AZD_DISABLE_TELEMETRY=true
```

### Konfigurácia ladenia
```bash
# Nastaviť globálnu konfiguráciu ladenia
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Povoliť detailné zaznamenávanie (trace)
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Techniky analýzy protokolov

### Pochopenie úrovní protokolov
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Štruktúrovaná analýza protokolov
```bash
# Zobraziť protokoly pomocou Azure Monitor (cez azd monitor)
azd monitor --logs

# Zobraziť protokoly aplikácie v reálnom čase
azd monitor --live

# Pre podrobnú analýzu protokolov použite Azure CLI s vaším App Service alebo Container App:
# Protokoly App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# Protokoly Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Exportovať protokoly Application Insights na analýzu
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Korelovanie protokolov
```bash
#!/bin/bash
# correlate-logs.sh - Korelovanie záznamov naprieč službami pomocou Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Vyhľadať korelované záznamy v Application Insights
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Vyhľadať protokoly aktivity v Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Pokročilé nástroje na ladenie

### Dopyty Azure Resource Graph
```bash
# Vyhľadať prostriedky podľa značiek
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Nájsť neúspešné nasadenia
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Skontrolovať stav prostriedkov
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Ladenie siete
```bash
# Otestovať pripojenie medzi službami
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

# Použitie
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Ladenie kontajnerov
```bash
# Ladiť problémy s kontajnerovou aplikáciou
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

### Ladenie pripojenia k databáze
```bash
# Ladiť pripojenie k databáze
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

## 🔬 Ladenie výkonu

### Monitorovanie výkonu aplikácie
```bash
# Povoliť ladenie služby Application Insights
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

# Vlastné monitorovanie výkonu
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

### Analýza využitia zdrojov
```bash
# Monitorovanie využitia zdrojov
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

## 🧪 Testovanie a validácia

### Ladenie integračných testov
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Nastaviť prostredie na ladenie
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Získať koncové body služby
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Otestovať koncové body stavu služby
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

# Spustiť testy
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Spustiť vlastné integračné testy
npm run test:integration
```

### Záťažové testovanie pre ladenie
```bash
# Jednoduchý záťažový test na identifikáciu výkonových úzkych miest
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Používanie Apache Bench (inštalácia: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Extrahovať kľúčové metriky
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Skontrolovať zlyhania
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Ladenie infraštruktúry

### Ladenie Bicep šablón
```bash
# Overenie Bicep šablón s podrobným výstupom
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Overenie syntaxe
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Overenie pomocou lintera
    az bicep lint --file "$template_file"
    
    # Simulované nasadenie (what-if)
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Ladenie nasadenia šablóny
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

### Analýza stavu zdrojov
```bash
# Analyzovať stavy zdrojov kvôli nezrovnalostiam
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Vypísať všetky zdroje s ich stavmi
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Skontrolovať zlyhané zdroje
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

## 🔒 Ladenie bezpečnosti

### Ladenie autentifikačného toku
```bash
# Ladenie autentifikácie Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Dekódovanie JWT tokenu (vyžaduje jq a base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Ladenie prístupu k Key Vault
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

### Ladenie bezpečnosti siete
```bash
# Ladiť sieťové bezpečnostné skupiny
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Skontrolovať bezpečnostné pravidlá
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Ladenie špecifické pre aplikáciu

### Ladenie Node.js aplikácií
```javascript
// debug-middleware.js - middleware na ladenie pre Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Zaznamenať podrobnosti požiadavky
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Prepísať res.json na zaznamenávanie odpovedí
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Ladenie dotazov do databázy
```javascript
// database-debug.js - Nástroje na ladenie databázy
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

## 🚨 Núdzové postupy ladenia

### Reakcia na problém v produkcii
```bash
#!/bin/bash
# emergency-debug.sh - Núdzové ladenie produkcie

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

# Prepnúť na správne prostredie
azd env select "$ENVIRONMENT"

# Zozbierať kritické informácie
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Použiť Azure Monitor na záznamy chýb
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

### Postupy spätného nasadenia
```bash
# Rýchly skript na vrátenie zmien
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Prepnutie prostredia
    azd env select "$environment"
    
    # Vrátenie zmien pomocou Gitu (AZD nemá vstavané vrátenie zmien)
    git checkout "$previous_commit"
    azd deploy
    
    # Overenie vrátenia zmien
    echo "Verifying rollback..."
    azd show
    
    # Otestovať kritické koncové body
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Dashboardy pre ladenie

### Vlastný monitorovací dashboard
```bash
# Vytvorte dotazy Application Insights na ladenie
create_debug_queries() {
    local app_insights_name=$1
    
    # Dotaz na chyby
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Dotaz na problémy s výkonom
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Dotaz na zlyhania závislostí
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Agregácia protokolov
```bash
# Agregovať denníky z viacerých zdrojov Azure
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

## 🔗 Pokročilé zdroje

### Vlastné skripty na ladenie
Vytvorte adresár `scripts/debug/` s:
- `health-check.sh` - Komplexné kontroly stavu
- `performance-test.sh` - Automatizované výkonové testovanie
- `log-analyzer.py` - Pokročilé rozparsovanie a analýza protokolov
- `resource-validator.sh` - Validácia infraštruktúry

### Integrácia monitorovania
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

## Najlepšie postupy

1. **Vždy povoľte protokolovanie ladenia** v neprodukčných prostrediach
2. **Vytvárajte reprodukovateľné testovacie prípady** pre problémy
3. **Dokumentujte postupy ladenia** pre váš tím
4. **Automatizujte kontroly stavu** a monitorovanie
5. **Udržiavajte nástroje na ladenie aktualizované** s vašimi zmenami aplikácie
6. **Precvičujte postupy ladenia** mimo časov incidentov

## Ďalšie kroky

- [Plánovanie kapacít](../chapter-06-pre-deployment/capacity-planning.md) - Plánovanie požiadaviek na zdroje
- [Výber SKU](../chapter-06-pre-deployment/sku-selection.md) - Výber vhodných úrovní služieb
- [Predbežné kontroly](../chapter-06-pre-deployment/preflight-checks.md) - Overenie pred nasadením
- [Rýchla príručka](../../resources/cheat-sheet.md) - Rýchle referenčné príkazy

---

**Pamätajte**: Dobré ladenie je o systematickosti, dôkladnosti a trpezlivosti. Tieto nástroje a techniky vám pomôžu diagnostikovať problémy rýchlejšie a efektívnejšie.

---

**Navigácia**
- **Predchádzajúca lekcia**: [Bežné problémy](common-issues.md)

- **Nasledujúca lekcia**: [Plánovanie kapacít](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vylúčenie zodpovednosti:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa usilujeme o presnosť, prosím berte na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho originálnom jazyku by sa mal považovať za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nepreberáme žiadnu zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vzniknuté použitím tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->