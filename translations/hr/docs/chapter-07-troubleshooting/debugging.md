# Vodič za otklanjanje pogrešaka za AZD implementacije

**Navigacija poglavljem:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 7 - Rješavanje problema i otklanjanje pogrešaka
- **⬅️ Prethodno**: [Uobičajeni problemi](common-issues.md)
- **➡️ Sljedeće**: [Rješavanje problema specifičnih za AI](ai-troubleshooting.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 8: Obrasci za produkciju i poslovne primjene](../chapter-08-production/production-ai-practices.md)

## Uvod

Ovaj sveobuhvatni vodič pruža napredne strategije za otklanjanje pogrešaka, alate i tehnike za dijagnostiku i rješavanje složenih problema s implementacijama Azure Developer CLI-ja. Naučite sistematične metodologije rješavanja problema, tehnike analize zapisa, profiliranja performansi i napredne dijagnostičke alate kako biste učinkovito riješili probleme pri implementaciji i za vrijeme rada.

## Ciljevi učenja

Nakon završetka ovog vodiča, moći ćete:
- Savladati sistematične metodologije otklanjanja pogrešaka za probleme s Azure Developer CLI-jem
- Razumjeti naprednu konfiguraciju zapisivanja i tehnike analize zapisa
- Implementirati profiliranje performansi i strategije nadzora
- Koristiti Azure dijagnostičke alate i usluge za rješavanje složenih problema
- Primijeniti tehnike otklanjanja mrežnih i sigurnosnih problema
- Konfigurirati sveobuhvatan nadzor i uzbunjivanje za proaktivno otkrivanje problema

## Ishodi učenja

Po dovršetku, moći ćete:
- Primijeniti metodologiju TRIAGE za sistematično otklanjanje složenih problema implementacije
- Konfigurirati i analizirati sveobuhvatne informacije o zapisivanju i praćenju
- Učinkovito koristiti Azure Monitor, Application Insights i dijagnostičke alate
- Samostalno otklanjati probleme mrežne povezanosti, autentikacije i dozvola
- Implementirati strategije praćenja performansi i optimizacije
- Kreirati prilagođene skripte za otklanjanje pogrešaka i automatizaciju za ponavljajuće probleme

## Metodologija otklanjanja pogrešaka

### Pristup TRIAGE
- **T**ime: Kada je problem počeo?
- **R**eproduce: Možete li ga dosljedno reproducirati?
- **I**solate: Koja komponenta ne radi?
- **A**nalyze: Što nam zapisnici (logovi) govore?
- **G**ather: Prikupite sve relevantne informacije
- **E**scalate: Kada potražiti dodatnu pomoć

## Omogućavanje debug načina

### Varijable okruženja
```bash
# Omogući sveobuhvatno otklanjanje pogrešaka
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Otklanjanje pogrešaka Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Onemogući telemetriju za čišći izlaz
export AZD_DISABLE_TELEMETRY=true
```

### Konfiguracija za debug
```bash
# Postavi globalnu konfiguraciju za otklanjanje pogrešaka
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Omogući detaljno zapisivanje (trace)
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Tehnike analize zapisa

### Razumijevanje razina zapisivanja
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Analiza strukturiranih zapisa
```bash
# Prikažite dnevnike pomoću usluge Azure Monitor (putem azd monitor)
azd monitor --logs

# Prikažite dnevnike aplikacije u stvarnom vremenu
azd monitor --live

# Za detaljnu analizu dnevnika koristite Azure CLI s vašim App Serviceom ili Container Appom:
# Dnevnici za App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# Dnevnici za Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Izvezite dnevnike iz Application Insights za analizu
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Korelacija zapisa
```bash
#!/bin/bash
# correlate-logs.sh - Korelacija zapisa dnevnika između servisa pomoću Azure Monitora

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Pretraži Application Insights za korelirane zapise dnevnika
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Pretraži Azure dnevnike aktivnosti
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Napredni alati za otklanjanje pogrešaka

### Upiti Azure Resource Grapha
```bash
# Pretraži resurse po oznakama
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Pronađi neuspjela raspoređivanja
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Provjeri zdravlje resursa
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Mrežno otklanjanje pogrešaka
```bash
# Testiraj povezivost između servisa
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

# Upotreba
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Otklanjanje pogrešaka kontejnera
```bash
# Otklanjanje problema s kontejnerskom aplikacijom
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

### Otklanjanje pogrešaka veze s bazom podataka
```bash
# Otklanjanje pogrešaka u povezivanju s bazom podataka
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

## 🔬 Otklanjanje pogrešaka performansi

### Praćenje performansi aplikacije
```bash
# Omogući debugiranje Application Insightsa
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

# Prilagođeno praćenje performansi
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

### Analiza iskorištenosti resursa
```bash
# Prati korištenje resursa
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

## 🧪 Testiranje i validacija

### Otklanjanje pogrešaka integracijskih testova
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Postavi okruženje za otklanjanje pogrešaka
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Dohvati krajnje točke servisa
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Testiraj krajnje točke za provjeru stanja
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

# Pokreni testove
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Pokreni prilagođene integracijske testove
npm run test:integration
```

### Testiranje opterećenja za otklanjanje pogrešaka
```bash
# Jednostavan test opterećenja za otkrivanje uskih grla u performansama
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Koristi Apache Bench (instalirajte: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Izdvojite ključne metrike
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Provjerite ima li pogrešaka
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Otklanjanje pogrešaka infrastrukture

### Otklanjanje pogrešaka Bicep predložaka
```bash
# Provjeri Bicep predloške s detaljnim izlazom
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Provjera sintakse
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Provjera lint-a
    az bicep lint --file "$template_file"
    
    # Simulacija raspoređivanja (what-if)
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Otklanjanje pogrešaka pri raspoređivanju predloška
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

### Analiza stanja resursa
```bash
# Analizirajte stanja resursa radi nedosljednosti
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Navedite sve resurse s njihovim stanjima
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Provjerite ima li neuspjelih resursa
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

## 🔒 Sigurnosno otklanjanje pogrešaka

### Otklanjanje pogrešaka tijeka autentikacije
```bash
# Otklanjanje pogrešaka autentifikacije za Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Dekodiraj JWT token (zahtijeva jq i base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Otklanjanje pogrešaka pristupa Key Vaultu
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

### Otklanjanje pogrešaka mrežne sigurnosti
```bash
# Otkloni pogreške u mrežnim sigurnosnim grupama
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Provjeri sigurnosna pravila
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Otklanjanje pogrešaka specifičnih za aplikaciju

### Otklanjanje pogrešaka Node.js aplikacija
```javascript
// debug-middleware.js - Express middleware za otklanjanje pogrešaka
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Zabilježi detalje zahtjeva
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Prepiši res.json kako bi zapisivao odgovore
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Otklanjanje pogrešaka upita baze podataka
```javascript
// database-debug.js - Alati za otklanjanje pogrešaka baze podataka
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

## 🚨 Postupci hitnog otklanjanja pogrešaka

### Postupak odgovora na probleme u produkciji
```bash
#!/bin/bash
# emergency-debug.sh - Hitno otklanjanje pogrešaka u produkciji

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

# Prebacite se na ispravno okruženje
azd env select "$ENVIRONMENT"

# Prikupite kritične informacije
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Koristite Azure Monitor za zapisnike pogrešaka
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

### Postupci povrata (rollback)
```bash
# Brz skript za vraćanje na prethodnu verziju
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Promijeni okruženje
    azd env select "$environment"
    
    # Vraćanje pomoću Gita (AZD nema ugrađenu mogućnost povratka)
    git checkout "$previous_commit"
    azd deploy
    
    # Provjeri vraćanje
    echo "Verifying rollback..."
    azd show
    
    # Testiraj kritične krajnje točke
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Nadzorne ploče za otklanjanje pogrešaka

### Prilagođena nadzorna ploča
```bash
# Kreirajte upite u Application Insightsu za otklanjanje pogrešaka
create_debug_queries() {
    local app_insights_name=$1
    
    # Upit za pogreške
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Upit za probleme s performansama
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Upit za neuspjehe ovisnosti
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Agregacija zapisa
```bash
# Agregirajte zapise iz više Azure izvora
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

## 🔗 Napredni resursi

### Prilagođeni skripti za otklanjanje pogrešaka
Stvorite direktorij `scripts/debug/` sa:
- `health-check.sh` - Sveobuhvatna provjera zdravlja
- `performance-test.sh` - Automatizirano testiranje performansi
- `log-analyzer.py` - Napredno parsiranje i analiza zapisa
- `resource-validator.sh` - Validacija infrastrukture

### Integracija nadzora
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

## Najbolje prakse

1. **Uvijek omogućite debug zapisivanje** u neprodukcijskim okruženjima
2. **Stvorite reproducibilne testne slučajeve** za probleme
3. **Dokumentirajte postupke otklanjanja pogrešaka** za svoj tim
4. **Automatizirajte provjere zdravlja** i nadzor
5. **Održavajte alate za otklanjanje pogrešaka ažurnima** s promjenama aplikacije
6. **Vježbajte postupke otklanjanja pogrešaka** u trenucima bez incidenata

## Sljedeći koraci

- [Planiranje kapaciteta](../chapter-06-pre-deployment/capacity-planning.md) - Planirajte zahtjeve za resursima
- [Odabir SKU-a](../chapter-06-pre-deployment/sku-selection.md) - Odaberite odgovarajuće razine usluga
- [Provjere prije implementacije](../chapter-06-pre-deployment/preflight-checks.md) - Validacija prije implementacije
- [Priručnik (Cheat Sheet)](../../resources/cheat-sheet.md) - Brzi pregled naredbi

---

**Zapamtite**: Dobar pristup otklanjanju pogrešaka znači biti sustavan, temeljit i strpljiv. Ovi alati i tehnike pomoći će vam dijagnosticirati probleme brže i učinkovitije.

---

**Navigacija**
- **Prethodna lekcija**: [Uobičajeni problemi](common-issues.md)

- **Sljedeća lekcija**: [Planiranje kapaciteta](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o odricanju odgovornosti**:
Ovaj dokument preveden je pomoću AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatizirani prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati mjerodavnim izvorom. Za kritične informacije preporučuje se profesionalni prijevod od strane ljudskog prevoditelja. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->