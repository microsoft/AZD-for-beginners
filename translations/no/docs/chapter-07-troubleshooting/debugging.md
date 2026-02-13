# Feilsøkingsguide for AZD-distribusjoner

**Chapter Navigation:**
- **📚 Course Home**: [AZD for nybegynnere](../../README.md)
- **📖 Current Chapter**: Kapittel 7 - Feilsøking og debugging
- **⬅️ Previous**: [Vanlige problemer](common-issues.md)
- **➡️ Next**: [AI-spesifikk feilsøking](ai-troubleshooting.md)
- **🚀 Next Chapter**: [Kapittel 8: Produksjon og bedriftsmønstre](../chapter-08-production/production-ai-practices.md)

## Introduksjon

Denne omfattende guiden gir avanserte strategier, verktøy og teknikker for feilsøking for å diagnostisere og løse komplekse problemer med Azure Developer CLI-distribusjoner. Lær systematiske feilsøkingsmetodikker, logganalyseteknikker, ytelsesprofilering og avanserte diagnostiske verktøy for effektivt å løse distribusjons- og kjøretidsproblemer.

## Læringsmål

Etter å ha fullført denne guiden vil du:
- Mestre systematiske feilsøkingsmetodikker for Azure Developer CLI-problemer
- Forstå avansert loggkonfigurasjon og logganalyseteknikker
- Implementere strategier for ytelsesprofilering og overvåking
- Bruke Azure diagnostiske verktøy og tjenester for komplekse problemløsninger
- Anvende nettverksfeilsøking og sikkerhetsfeilsøkingsteknikker
- Konfigurere omfattende overvåking og varsling for proaktiv feiloppdagelse

## Læringsutbytte

Ved fullføring vil du kunne:
- Bruke TRIAGE-metodikken for systematisk å feilsøke komplekse distribusjonsproblemer
- Konfigurere og analysere omfattende logg- og sporeringsinformasjon
- Bruke Azure Monitor, Application Insights og diagnostiske verktøy effektivt
- Feilsøke nettverkstilkobling, autentisering og tillatelsesproblemer selvstendig
- Implementere ytelsesovervåking og optimaliseringsstrategier
- Lage egendefinerte feilsøkingsskript og automatisering for tilbakevendende problemer

## Feilsøkingsmetodikk

### The TRIAGE Approach
- **T**id: Når startet problemet?
- **R**eprodusere: Kan du konsekvent gjenskape det?
- **I**solere: Hvilken komponent feiler?
- **A**nalisere: Hva forteller loggene oss?
- **G**samle: Samle all relevant informasjon
- **E**skalere: Når bør du søke ekstra hjelp

## Aktivering av feilsøkingsmodus

### Environment Variables
```bash
# Aktiver omfattende feilsøking
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Feilsøking for Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Deaktiver telemetri for renere utdata
export AZD_DISABLE_TELEMETRY=true
```

### Debug Configuration
```bash
# Angi feilsøkingskonfigurasjon globalt
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Aktiver sporingslogging
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Logganalyseteknikker

### Forstå loggnivåer
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Strukturert logganalyse
```bash
# Vis logger med Azure Monitor (via azd monitor)
azd monitor --logs

# Vis applikasjonslogger i sanntid
azd monitor --live

# For detaljert logganalyse, bruk Azure CLI med din App Service eller Container App:
# App Service-logger
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App-logger
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Eksporter Application Insights-logger for analyse
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Loggkorrelasjon
```bash
#!/bin/bash
# correlate-logs.sh - Korrelere logger på tvers av tjenester ved hjelp av Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Søk i Application Insights etter korrelerte logger
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Søk i Azure aktivitetslogger
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Avanserte feilsøkingsverktøy

### Azure Resource Graph-spørringer
```bash
# Søk etter ressurser basert på tagger
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Finn mislykkede distribusjoner
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Sjekk ressurshelse
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Nettverksfeilsøking
```bash
# Test tilkobling mellom tjenester
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

# Bruk
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Containerfeilsøking
```bash
# Feilsøk problemer med containerappen
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

### Databaseforbindelsesfeilsøking
```bash
# Feilsøk databasetilkobling
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

## 🔬 Ytelsesfeilsøking

### Applikasjonsytelsesovervåking
```bash
# Aktiver feilsøking for Application Insights
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

# Tilpasset ytelsesovervåking
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

### Analyse av ressursbruk
```bash
# Overvåk ressursbruk
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

## 🧪 Testing og validering

### Feilsøking av integrasjonstester
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Sett opp debug-miljø
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Hent tjenesteendepunkter
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Test helseendepunkter
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

# Kjør tester
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Kjør egendefinerte integrasjonstester
npm run test:integration
```

### Belastningstesting for feilsøking
```bash
# En enkel belastningstest for å identifisere ytelsesflaskehalser
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Bruker Apache Bench (installer: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Trekk ut viktige måledata
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Sjekk etter feil
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastrukturfeilsøking

### Feilsøking av Bicep-maler
```bash
# Valider Bicep-maler med detaljert utdata
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Syntaksvalidering
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint-validering
    az bicep lint --file "$template_file"
    
    # Hva-hvis-distribusjon
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Feilsøk distribusjon av mal
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

### Analyse av ressursstatus
```bash
# Analyser ressursenes tilstander for inkonsistenser
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # List opp alle ressurser med deres tilstander
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Sjekk etter ressurser som har feilet
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

## 🔒 Sikkerhetsfeilsøking

### Feilsøking av autentiseringsflyt
```bash
# Feilsøk Azure-autentisering
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Dekod JWT-token (krever jq og base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Feilsøk Key Vault-tilgang
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

### Nettverkssikkerhetsfeilsøking
```bash
# Feilsøk nettverkssikkerhetsgrupper
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Sjekk sikkerhetsregler
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Applikasjonsspesifikk feilsøking

### Node.js-applikasjonsfeilsøking
```javascript
// debug-middleware.js - Express feilsøkings-middleware
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Logg forespørselsdetaljer
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Overskriv res.json for å logge svar
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Feilsøking av databaseforespørsler
```javascript
// database-debug.js - Verktøy for databasefeilsøking
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

## 🚨 Nødfeilsøkingsprosedyrer

### Respons ved produksjonsproblemer
```bash
#!/bin/bash
# emergency-debug.sh - Nødfeilsøking i produksjon

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

# Bytt til riktig miljø
azd env select "$ENVIRONMENT"

# Samle kritisk informasjon
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Bruk Azure Monitor for feillogger
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

### Tilbakerullingsprosedyrer
```bash
# Rask skript for tilbakerulling
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Bytt miljø
    azd env select "$environment"
    
    # Tilbakerulling ved bruk av Git (AZD har ikke innebygd tilbakerulling)
    git checkout "$previous_commit"
    azd deploy
    
    # Bekreft tilbakerulling
    echo "Verifying rollback..."
    azd show
    
    # Test kritiske endepunkter
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Feilsøkingsdashboards

### Egendefinert overvåkingsdashboard
```bash
# Opprett Application Insights-spørringer for feilsøking
create_debug_queries() {
    local app_insights_name=$1
    
    # Spørring etter feil
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Spørring etter ytelsesproblemer
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Spørring etter avhengighetssvikt
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Loggsamling
```bash
# Aggreger logger fra flere Azure-kilder
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

## 🔗 Avanserte ressurser

### Egne feilsøkingsskript
Opprett en `scripts/debug/`-katalog med:
- `health-check.sh` - Omfattende helsesjekk
- `performance-test.sh` - Automatisert ytelsestesting
- `log-analyzer.py` - Avansert logganalyse og parsing
- `resource-validator.sh` - Infrastrukturvalidering

### Monitoring Integration
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

## Beste praksis

1. **Aktiver alltid debug-logging** i ikke-produksjonsmiljøer
2. **Opprett reproduserbare testtilfeller** for problemer
3. **Dokumenter feilsøkingsprosedyrer** for teamet ditt
4. **Automatiser helsesjekker** og overvåkning
5. **Hold feilsøkingsverktøy oppdatert** i takt med applikasjonsendringer
6. **Øv på feilsøkingsprosedyrer** når det ikke er hendelser

## Neste steg

- [Kapasitetsplanlegging](../chapter-06-pre-deployment/capacity-planning.md) - Planlegg ressursbehov
- [Valg av SKU](../chapter-06-pre-deployment/sku-selection.md) - Velg passende tjenestenivåer
- [Forhåndskontroller](../chapter-06-pre-deployment/preflight-checks.md) - Validering før distribusjon
- [Hurtigreferanse](../../resources/cheat-sheet.md) - Rask referanse for kommandoer

---

**Husk**: God feilsøking handler om å være systematisk, grundig og tålmodig. Disse verktøyene og teknikkene vil hjelpe deg med å diagnostisere problemer raskere og mer effektivt.

---

**Navigation**
- **Previous Lesson**: [Vanlige problemer](common-issues.md)

- **Next Lesson**: [Kapasitetsplanlegging](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Originaldokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->