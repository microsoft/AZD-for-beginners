# Fejlfindingsvejledning for AZD-udrulninger

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD for begyndere](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 7 - Fejlfinding & Debugging
- **⬅️ Forrige**: [Almindelige problemer](common-issues.md)
- **➡️ Næste**: [AI-specifik fejlfinding](ai-troubleshooting.md)
- **🚀 Næste kapitel**: [Kapitel 8: Produktions- og virksomhedsmønstre](../chapter-08-production/production-ai-practices.md)

## Introduktion

Denne omfattende vejledning giver avancerede strategier, værktøjer og teknikker til fejlfinding for at diagnosticere og løse komplekse problemer med Azure Developer CLI-udrulninger. Lær systematiske fejlfindingsmetodologier, teknikker til loganalyse, ydeevneprofilering og avancerede diagnostiske værktøjer for effektivt at løse udrulnings- og runtime-problemer.

## Læringsmål

Efter at have gennemført denne vejledning vil du:
- Mestre systematiske fejlfindingmetoder for Azure Developer CLI-problemer
- Forstå avanceret logkonfiguration og teknikker til loganalyse
- Implementere strategier for ydeevneprofilering og overvågning
- Bruge Azure-diagnostiske værktøjer og tjenester til komplekse problemløsninger
- Anvende netværksfejlfinding og sikkerhedsteknikker
- Konfigurere omfattende overvågning og alarmering for proaktiv fejldetektion

## Læringsresultater

Efter gennemførelse vil du være i stand til at:
- Anvende TRIAGE-metodologien til systematisk fejlfinding af komplekse udrulningsproblemer
- Konfigurere og analysere omfattende log- og sporingsinformation
- Bruge Azure Monitor, Application Insights og diagnostiske værktøjer effektivt
- Fejlfinde netværksforbindelse, autentificering og tilladelsesproblemer selvstændigt
- Implementere overvågnings- og optimeringsstrategier for ydeevne
- Oprette brugerdefinerede fejlfinding scripts og automatisering til tilbagevendende problemer

## Fejlfindingmetode

### TRIAGE-tilgangen
- **T**id: Hvornår startede problemet?
- **R**eproducer: Kan du konsekvent reproducere det?
- **I**solér: Hvilken komponent fejler?
- **A**nalyser: Hvad fortæller loggene os?
- **G**ennemgå: Indsaml alle relevante oplysninger
- **E**skaler: Hvornår skal der søges yderligere hjælp?

## Aktivering af debug-tilstand

### Miljøvariabler
```bash
# Aktivér omfattende fejlfinding
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI-fejlfinding
export AZURE_CLI_DIAGNOSTICS=true

# Deaktiver telemetri for renere output
export AZD_DISABLE_TELEMETRY=true
```

### Debug-konfiguration
```bash
# Indstil debug-konfiguration globalt
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Aktiver sporingslogning
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Loganalyse-teknikker

### Forstå logniveauer
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Struktureret loganalyse
```bash
# Vis logfiler med Azure Monitor (via azd monitor)
azd monitor --logs

# Vis applikationslogfiler i realtid
azd monitor --live

# For detaljeret loganalyse, brug Azure CLI med din App Service eller Container App:
# App Service-logfiler
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App-logfiler
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Eksporter Application Insights-logfiler til analyse
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Logkorrelation
```bash
#!/bin/bash
# correlate-logs.sh - Korrelér logfiler på tværs af tjenester ved hjælp af Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Søg i Application Insights efter korrelerede logfiler
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Søg i Azure aktivitetslogfiler
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Avancerede fejlfindingsværktøjer

### Azure Resource Graph-forespørgsler
```bash
# Forespørg ressourcer efter tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find mislykkede udrulninger
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Kontroller ressourcestatus
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Netværksfejlfinding
```bash
# Test forbindelsen mellem tjenester
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

# Brug
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Container-fejlfinding
```bash
# Fejlfind problemer med container-appen
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

### Fejlfinding af databaseforbindelser
```bash
# Fejlsøg databaseforbindelse
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

## 🔬 Ydelsesfejlfinding

### Overvågning af applikationsydelse
```bash
# Aktivér fejlsøgning for Application Insights
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

# Brugerdefineret ydeevneovervågning
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

### Analyse af ressourceudnyttelse
```bash
# Overvåg ressourceforbrug
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

## 🧪 Test og validering

### Fejlfinding af integrationstests
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Indstil debug-miljø
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Hent serviceendepunkter
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Test sundhedsendepunkter
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

# Kør tests
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Kør brugerdefinerede integrationstests
npm run test:integration
```

### Belastningstest til fejlfinding
```bash
# Simpel belastningstest til at identificere ydeevneflaskehalse
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Brug af Apache Bench (installer: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Udtræk nøglemålinger
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Kontroller for fejl
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastrukturfejlfinding

### Fejlfinding af Bicep-skabeloner
```bash
# Valider Bicep-skabeloner med detaljeret output
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Syntaksvalidering
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint-validering
    az bicep lint --file "$template_file"
    
    # Hvad-hvis-udrulning
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Fejlsøg skabelonudrulning
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

### Analyse af resourcetilstand
```bash
# Analyser ressourcetilstande for uoverensstemmelser
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Vis alle ressourcer med deres tilstande
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Kontroller for fejlede ressourcer
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

## 🔒 Sikkerhedsfejlfinding

### Fejlfinding af autentificeringsflow
```bash
# Fejlsøg Azure-autentificering
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Dekod JWT-token (kræver jq og base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Fejlsøg adgang til Key Vault
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

### Fejlfinding af netværkssikkerhed
```bash
# Fejlfinding af netværkssikkerhedsgrupper
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Kontroller sikkerhedsregler
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Applikationsspecifik fejlfinding

### Fejlfinding af Node.js-applikationer
```javascript
// debug-middleware.js - Express fejlsøgnings-middleware
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Log anmodningsdetaljer
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Overskriv res.json for at logge svar
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Fejlfinding af databaseforespørgsler
```javascript
// database-debug.js - Database-fejlfindingsværktøjer
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

## 🚨 Nødprocedurer for fejlfinding

### Respons ved produktionsproblemer
```bash
#!/bin/bash
# emergency-debug.sh - Nødfejlfinding i produktion

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

# Skift til korrekt miljø
azd env select "$ENVIRONMENT"

# Indsaml kritisk information
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Brug Azure Monitor til fejllogfiler
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

### Rollback-procedurer
```bash
# Hurtigt rollback-script
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Skift miljø
    azd env select "$environment"
    
    # Tilbageførsel ved hjælp af Git (AZD har ikke indbygget tilbageførsel)
    git checkout "$previous_commit"
    azd deploy
    
    # Bekræft tilbageførsel
    echo "Verifying rollback..."
    azd show
    
    # Test kritiske endepunkter
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Fejlfindingsdashboards

### Tilpasset overvågningsdashboard
```bash
# Opret forespørgsler i Application Insights til fejlfinding
create_debug_queries() {
    local app_insights_name=$1
    
    # Forespørgsel efter fejl
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Forespørgsel efter ydeevneproblemer
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Forespørgsel efter afhængighedsfejl
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Logaggregation
```bash
# Aggreger logfiler fra flere Azure-kilder
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

## 🔗 Avancerede ressourcer

### Tilpassede debug-scripts
Opret en `scripts/debug/`-mappe med:
- `health-check.sh` - Omfattende sundhedskontrol
- `performance-test.sh` - Automatiseret ydeevnetest
- `log-analyzer.py` - Avanceret logparsing og analyse
- `resource-validator.sh` - Infrastrukturvalidering

### Overvågningsintegration
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

## Bedste praksis

1. **Aktiver altid debug-logging** i ikke-produktionsmiljøer
2. **Opret reproducerbare testsager** for problemer
3. **Dokumenter fejlsøgningsprocedurer** for dit team
4. **Automatiser sundhedskontroller** og overvågning
5. **Hold debug-værktøjer opdaterede** i takt med dine applikationsændringer
6. **Øv fejlsøgningsprocedurer** i perioder uden hændelser

## Næste skridt

- [Kapacitetsplanlægning](../chapter-06-pre-deployment/capacity-planning.md) - Planlæg ressourcekravene
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Vælg passende serviceniveauer
- [Preflight Checks](../chapter-06-pre-deployment/preflight-checks.md) - Forudgående validering før udrulning
- [Hurtigreference](../../resources/cheat-sheet.md) - Hurtig referencekommandoer

---

**Husk**: God fejlfinding handler om at være systematisk, grundig og tålmodig. Disse værktøjer og teknikker hjælper dig med at diagnosticere problemer hurtigere og mere effektivt.

---

**Navigation**
- **Forrige lektion**: [Almindelige problemer](common-issues.md)

- **Næste lektion**: [Kapacitetsplanlægning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på originalsproget bør betragtes som den autoritative kilde. For kritiske oplysninger anbefales en professionel menneskelig oversættelse. Vi påtager os intet ansvar for eventuelle misforståelser eller fejltolkninger, som opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->