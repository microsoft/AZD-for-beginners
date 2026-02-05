# Průvodce laděním nasazení AZD

**Navigace kapitol:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 7 - Řešení problémů a ladění
- **⬅️ Předchozí**: [Běžné problémy](common-issues.md)
- **➡️ Další**: [Řešení problémů specifických pro AI](ai-troubleshooting.md)
- **🚀 Další kapitola**: [Kapitola 8: Produkční a podnikové vzory](../microsoft-foundry/production-ai-practices.md)

## Úvod

Tento komplexní průvodce poskytuje pokročilé strategie ladění, nástroje a techniky pro diagnostiku a řešení složitých problémů s nasazením Azure Developer CLI. Naučte se systematické metodiky řešení problémů, techniky analýzy logů, profilování výkonu a pokročilé diagnostické nástroje pro efektivní řešení problémů při nasazení a běhu aplikací.

## Cíle učení

Po dokončení tohoto průvodce budete:
- Ovládat systematické metodiky ladění problémů s Azure Developer CLI
- Rozumět pokročilé konfiguraci logování a technikám analýzy logů
- Implementovat strategie profilování výkonu a monitorování
- Používat diagnostické nástroje a služby Azure pro řešení složitých problémů
- Aplikovat techniky ladění sítě a řešení problémů se zabezpečením
- Konfigurovat komplexní monitorování a upozornění pro proaktivní detekci problémů

## Výsledky učení

Po dokončení budete schopni:
- Používat metodiku TRIAGE pro systematické ladění složitých problémů s nasazením
- Konfigurovat a analyzovat komplexní informace o logování a trasování
- Efektivně používat Azure Monitor, Application Insights a diagnostické nástroje
- Samostatně ladit problémy s konektivitou sítě, autentizací a oprávněními
- Implementovat strategie monitorování výkonu a optimalizace
- Vytvářet vlastní skripty pro ladění a automatizaci opakujících se problémů

## Metodika ladění

### Přístup TRIAGE
- **T**ime: Kdy problém začal?
- **R**eproduce: Lze problém konzistentně reprodukovat?
- **I**solate: Která komponenta selhává?
- **A**nalyze: Co nám říkají logy?
- **G**ather: Shromážděte všechny relevantní informace
- **E**scalate: Kdy požádat o další pomoc

## Aktivace režimu ladění

### Proměnné prostředí
```bash
# Povolit komplexní ladění
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Ladění Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Zakázat telemetrii pro čistší výstup
export AZD_DISABLE_TELEMETRY=true
```

### Konfigurace ladění
```bash
# Nastavit globální konfiguraci ladění
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Povolit sledování logování
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Techniky analýzy logů

### Porozumění úrovním logů
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Strukturovaná analýza logů
```bash
# Filtrovat logy podle úrovně
azd logs --level error --since 1h

# Filtrovat podle služby
azd logs --service api --level debug

# Exportovat logy pro analýzu
azd logs --output json > deployment-logs.json

# Parsovat JSON logy pomocí jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Korelace logů
```bash
#!/bin/bash
# correlate-logs.sh - Korelujte logy mezi službami

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Hledat napříč všemi službami
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Hledat logy Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Pokročilé nástroje pro ladění

### Dotazy na Azure Resource Graph
```bash
# Dotaz na zdroje podle štítků
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Najít neúspěšné nasazení
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Zkontrolovat stav zdrojů
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Ladění sítě
```bash
# Otestujte konektivitu mezi službami
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

# Použití
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Ladění kontejnerů
```bash
# Ladění problémů s aplikací kontejneru
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

### Ladění připojení k databázi
```bash
# Ladění připojení k databázi
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

## 🔬 Ladění výkonu

### Monitorování výkonu aplikací
```bash
# Povolit ladění Application Insights
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

# Vlastní monitorování výkonu
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

### Analýza využití zdrojů
```bash
# Sledovat využití zdrojů
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

## 🧪 Testování a validace

### Ladění integračních testů
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Nastavit ladicí prostředí
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Získat koncové body služby
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Testovat koncové body zdraví
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

# Spustit testy
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Spustit vlastní integrační testy
npm run test:integration
```

### Zátěžové testování pro ladění
```bash
# Jednoduchý zátěžový test k identifikaci výkonových úzkých míst
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Použití Apache Bench (instalace: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Extrahovat klíčové metriky
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Zkontrolovat chyby
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Ladění infrastruktury

### Ladění šablon Bicep
```bash
# Ověřte šablony Bicep s podrobným výstupem
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Ověření syntaxe
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Ověření lintu
    az bicep lint --file "$template_file"
    
    # Co-kdyby nasazení
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Ladění nasazení šablony
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

### Analýza stavu zdrojů
```bash
# Analyzujte stavy zdrojů na nesrovnalosti
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Seznamte všechny zdroje s jejich stavy
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Zkontrolujte neúspěšné zdroje
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

## 🔒 Ladění zabezpečení

### Ladění autentizačních toků
```bash
# Ladění ověřování Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Dekódovat JWT token (vyžaduje jq a base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Ladění přístupu k Key Vault
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

### Ladění zabezpečení sítě
```bash
# Ladit bezpečnostní skupiny sítě
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Zkontrolovat bezpečnostní pravidla
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Ladění specifické pro aplikace

### Ladění aplikací Node.js
```javascript
// debug-middleware.js - Express ladicí middleware
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Zaznamenat podrobnosti požadavku
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Přepsat res.json pro zaznamenání odpovědí
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Ladění dotazů na databázi
```javascript
// database-debug.js - Nástroje pro ladění databáze
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

## 🚨 Postupy pro nouzové ladění

### Reakce na problémy v produkci
```bash
#!/bin/bash
# emergency-debug.sh - Nouzové ladění produkce

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

# Přepněte na správné prostředí
azd env select "$ENVIRONMENT"

# Shromážděte kritické informace
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

### Postupy pro návrat zpět
```bash
# Skript pro rychlé vrácení změn
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Přepnout prostředí
    azd env select "$environment"
    
    # Vrátit aplikaci zpět
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Ověřit vrácení změn
    echo "Verifying rollback..."
    azd show
    
    # Otestovat kritické koncové body
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Panely pro ladění

### Vlastní monitorovací panel
```bash
# Vytvořte dotazy Application Insights pro ladění
create_debug_queries() {
    local app_insights_name=$1
    
    # Dotaz na chyby
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Dotaz na problémy s výkonem
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Dotaz na selhání závislostí
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Agregace logů
```bash
# Shromáždit logy z více zdrojů
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

## 🔗 Pokročilé zdroje

### Vlastní skripty pro ladění
Vytvořte adresář `scripts/debug/` s:
- `health-check.sh` - Komplexní kontrola zdraví
- `performance-test.sh` - Automatizované testování výkonu
- `log-analyzer.py` - Pokročilá analýza logů
- `resource-validator.sh` - Validace infrastruktury

### Integrace monitorování
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

## Nejlepší postupy

1. **Vždy aktivujte ladění logů** v neprodukčních prostředích
2. **Vytvářejte reprodukovatelné testovací případy** pro problémy
3. **Dokumentujte postupy ladění** pro váš tým
4. **Automatizujte kontroly zdraví** a monitorování
5. **Udržujte nástroje pro ladění aktuální** s vašimi změnami aplikace
6. **Procvičujte postupy ladění** mimo dobu incidentů

## Další kroky

- [Plánování kapacity](../pre-deployment/capacity-planning.md) - Plánování požadavků na zdroje
- [Výběr SKU](../pre-deployment/sku-selection.md) - Výběr vhodných úrovní služeb
- [Kontroly před nasazením](../pre-deployment/preflight-checks.md) - Validace před nasazením
- [Tahák](../../resources/cheat-sheet.md) - Rychlé referenční příkazy

---

**Pamatujte**: Dobré ladění spočívá v systematickém, důkladném a trpělivém přístupu. Tyto nástroje a techniky vám pomohou diagnostikovat problémy rychleji a efektivněji.

---

**Navigace**
- **Předchozí lekce**: [Běžné problémy](common-issues.md)

- **Další lekce**: [Plánování kapacity](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlad [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->