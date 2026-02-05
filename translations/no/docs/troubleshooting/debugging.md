# Feilsøkingsguide for AZD-distribusjoner

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD for nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 7 - Feilsøking og debugging
- **⬅️ Forrige**: [Vanlige problemer](common-issues.md)
- **➡️ Neste**: [AI-spesifikk feilsøking](ai-troubleshooting.md)
- **🚀 Neste kapittel**: [Kapittel 8: Produksjon og bedriftsmønstre](../microsoft-foundry/production-ai-practices.md)

## Introduksjon

Denne omfattende guiden gir avanserte strategier, verktøy og teknikker for feilsøking og løsning av komplekse problemer med Azure Developer CLI-distribusjoner. Lær systematiske feilsøkingsmetoder, logganalyseteknikker, ytelsesprofilering og avanserte diagnostiske verktøy for effektivt å løse distribusjons- og kjøretidsproblemer.

## Læringsmål

Ved å fullføre denne guiden vil du:
- Mestre systematiske feilsøkingsmetoder for Azure Developer CLI-problemer
- Forstå avansert loggkonfigurasjon og logganalyseteknikker
- Implementere strategier for ytelsesprofilering og overvåking
- Bruke Azure-diagnostiske verktøy og tjenester for å løse komplekse problemer
- Anvende nettverksfeilsøking og sikkerhetsfeilsøkingsteknikker
- Konfigurere omfattende overvåking og varsling for proaktiv oppdagelse av problemer

## Læringsutbytte

Etter fullføring vil du kunne:
- Bruke TRIAGE-metodikken for systematisk feilsøking av komplekse distribusjonsproblemer
- Konfigurere og analysere omfattende logg- og sporingsinformasjon
- Effektivt bruke Azure Monitor, Application Insights og diagnostiske verktøy
- Feilsøke nettverkstilkobling, autentisering og tillatelsesproblemer selvstendig
- Implementere strategier for ytelsesovervåking og optimalisering
- Lage tilpassede feilsøkingsskript og automatisering for tilbakevendende problemer

## Feilsøkingsmetodikk

### TRIAGE-tilnærmingen
- **T**id: Når startet problemet?
- **R**eproduser: Kan du konsekvent reprodusere det?
- **I**soler: Hvilken komponent feiler?
- **A**nalyser: Hva forteller loggene oss?
- **S**amle: Samle all relevant informasjon
- **E**skalere: Når skal du søke ytterligere hjelp

## Aktivere feilsøkingsmodus

### Miljøvariabler
```bash
# Aktiver omfattende feilsøking
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI feilsøking
export AZURE_CLI_DIAGNOSTICS=true

# Deaktiver telemetri for renere output
export AZD_DISABLE_TELEMETRY=true
```

### Feilsøkingskonfigurasjon
```bash
# Sett feilsøkingskonfigurasjon globalt
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
# Filtrer logger etter nivå
azd logs --level error --since 1h

# Filtrer etter tjeneste
azd logs --service api --level debug

# Eksporter logger for analyse
azd logs --output json > deployment-logs.json

# Analyser JSON-logger med jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Loggkorrelasjon
```bash
#!/bin/bash
# correlate-logs.sh - Korrelere logger på tvers av tjenester

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Søk på tvers av alle tjenester
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Søk Azure-logger
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Avanserte feilsøkingsverktøy

### Azure Resource Graph-spørringer
```bash
# Spør ressursene etter tagger
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

### Container-feilsøking
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

### Feilsøking av databaseforbindelser
```bash
# Feilsøk databaseforbindelse
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

### Overvåking av applikasjonsytelse
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
# debug-integrasjonstester.sh

set -e

echo "Running integration tests with debugging..."

# Sett opp feilsøkingsmiljø
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

# Kjør tilpassede integrasjonstester
npm run test:integration
```

### Belastningstesting for feilsøking
```bash
# Enkel lasttest for å identifisere ytelsesflaskehalser
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Bruker Apache Bench (installer: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Ekstraher nøkkelmetrikker
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Sjekk etter feil
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastrukturfeilsøking

### Feilsøking av Bicep-maler
```bash
# Valider Bicep-maler med detaljert output
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Syntaksvalidering
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lintvalidering
    az bicep lint --file "$template_file"
    
    # Hva-hvis distribusjon
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Feilsøk maldistribusjon
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
# Analyser ressursstatuser for uoverensstemmelser
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # List alle ressurser med deres statuser
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Sjekk etter mislykkede ressurser
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
    
    # Dekrypter JWT-token (krever jq og base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Feilsøk tilgang til Key Vault
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

### Feilsøking av nettverkssikkerhet
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

### Feilsøking av Node.js-applikasjoner
```javascript
// debug-middleware.js - Express feilsøkings-mellomvare
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
    
    // Overstyr res.json for å logge svar
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Feilsøking av databasespørringer
```javascript
// database-debug.js - Verktøy for feilsøking av database
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

## 🚨 Nødprosedyrer for feilsøking

### Respons på produksjonsproblemer
```bash
#!/bin/bash
# emergency-debug.sh - Nødproduksjonsfeilsøking

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

### Tilbakerullingsprosedyrer
```bash
# Rask tilbakestillingsskript
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Bytt miljø
    azd env select "$environment"
    
    # Tilbakestill applikasjon
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Verifiser tilbakestilling
    echo "Verifying rollback..."
    azd show
    
    # Test kritiske endepunkter
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Feilsøkingsdashbord

### Tilpasset overvåkingsdashbord
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
    
    # Spørring etter avhengighetsfeil
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Loggaggregasjon
```bash
# Samle logger fra flere kilder
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

## 🔗 Avanserte ressurser

### Tilpassede feilsøkingsskript
Opprett en `scripts/debug/`-mappe med:
- `health-check.sh` - Omfattende helsesjekk
- `performance-test.sh` - Automatisert ytelsestesting
- `log-analyzer.py` - Avansert logganalyse
- `resource-validator.sh` - Validering av infrastruktur

### Overvåkingsintegrasjon
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

1. **Aktiver alltid feilsøkingslogging** i ikke-produksjonsmiljøer
2. **Lag reproducerbare testtilfeller** for problemer
3. **Dokumenter feilsøkingsprosedyrer** for teamet ditt
4. **Automatiser helsesjekker** og overvåking
5. **Hold feilsøkingsverktøy oppdatert** med applikasjonsendringer
6. **Øv på feilsøkingsprosedyrer** i ikke-krisesituasjoner

## Neste steg

- [Kapasitetsplanlegging](../pre-deployment/capacity-planning.md) - Planlegg ressursbehov
- [Valg av SKU](../pre-deployment/sku-selection.md) - Velg passende tjenestenivåer
- [Forhåndssjekker](../pre-deployment/preflight-checks.md) - Validering før distribusjon
- [Hurtigreferanse](../../resources/cheat-sheet.md) - Kommandoer for rask referanse

---

**Husk**: God feilsøking handler om å være systematisk, grundig og tålmodig. Disse verktøyene og teknikkene vil hjelpe deg med å diagnostisere problemer raskere og mer effektivt.

---

**Navigasjon**
- **Forrige leksjon**: [Vanlige problemer](common-issues.md)

- **Neste leksjon**: [Kapasitetsplanlegging](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på dets opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->