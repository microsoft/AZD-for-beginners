<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5395583c1a88847b97d186dd5f5b1a69",
  "translation_date": "2025-11-21T16:39:44+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "nl"
}
-->
# Debuggengids voor AZD-Deployments

**Hoofdstuknavigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 7 - Problemen Oplossen & Debuggen
- **⬅️ Vorige**: [Veelvoorkomende Problemen](common-issues.md)
- **➡️ Volgende**: [AI-Specifieke Probleemoplossing](ai-troubleshooting.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 8: Productie & Enterprise Patronen](../microsoft-foundry/production-ai-practices.md)

## Introductie

Deze uitgebreide gids biedt geavanceerde debugstrategieën, tools en technieken voor het diagnosticeren en oplossen van complexe problemen met Azure Developer CLI-deployments. Leer systematische probleemoplossingsmethodologieën, loganalyse-technieken, prestatieprofilering en geavanceerde diagnostische tools om deployment- en runtimeproblemen efficiënt op te lossen.

## Leerdoelen

Na het doorlopen van deze gids kun je:
- Systematische debugmethodologieën voor Azure Developer CLI-problemen beheersen
- Geavanceerde logconfiguratie en loganalyse-technieken begrijpen
- Prestatieprofilering en monitoringstrategieën implementeren
- Azure-diagnosetools en -services gebruiken voor complexe probleemoplossing
- Netwerkdebugging en beveiligingsproblemen oplossen
- Uitgebreide monitoring en waarschuwingen configureren voor proactieve probleemdetectie

## Leerresultaten

Na voltooiing ben je in staat om:
- De TRIAGE-methodologie toe te passen om complexe deploymentproblemen systematisch op te lossen
- Uitgebreide log- en traceerinformatie te configureren en analyseren
- Azure Monitor, Application Insights en diagnostische tools effectief te gebruiken
- Netwerkconnectiviteit, authenticatie- en machtigingsproblemen zelfstandig te debuggen
- Prestatiemonitoring en optimalisatiestrategieën te implementeren
- Aangepaste debugscripts en automatisering te maken voor terugkerende problemen

## Debugmethodologie

### De TRIAGE-aanpak
- **T**ijd: Wanneer begon het probleem?
- **R**eproduceren: Kun je het probleem consistent reproduceren?
- **I**soleren: Welk onderdeel faalt?
- **A**nalyseren: Wat vertellen de logs ons?
- **V**erzamelen: Verzamel alle relevante informatie
- **E**scaleren: Wanneer moet je extra hulp inschakelen?

## Debugmodus inschakelen

### Omgevingsvariabelen
```bash
# Schakel uitgebreide debugging in
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI debugging
export AZURE_CLI_DIAGNOSTICS=true

# Schakel telemetrie uit voor schonere output
export AZD_DISABLE_TELEMETRY=true
```

### Debugconfiguratie
```bash
# Stel debugconfiguratie wereldwijd in
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Schakel trace logging in
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Loganalyse-technieken

### Begrijpen van logniveaus
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Gestructureerde loganalyse
```bash
# Filter logs op niveau
azd logs --level error --since 1h

# Filter op service
azd logs --service api --level debug

# Exporteer logs voor analyse
azd logs --output json > deployment-logs.json

# Parseer JSON-logs met jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Logcorrelatie
```bash
#!/bin/bash
# correlate-logs.sh - Correleren van logs tussen services

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Zoeken in alle services
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Zoeken in Azure-logs
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Geavanceerde Debugging Tools

### Azure Resource Graph Queries
```bash
# Query bronnen op tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Zoek mislukte implementaties
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Controleer de gezondheid van bronnen
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Netwerkdebugging
```bash
# Test connectiviteit tussen services
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

# Gebruik
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Containerdebugging
```bash
# Problemen met container-app debuggen
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

### Databaseverbinding debuggen
```bash
# Foutopsporing databaseconnectiviteit
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

## 🔬 Prestatie-debugging

### Applicatieprestatiemonitoring
```bash
# Inschakelen van Application Insights debugging
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

# Aangepaste prestatiemonitoring
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

### Analyse van resourcegebruik
```bash
# Bewaak het gebruik van middelen
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

## 🧪 Testen en Validatie

### Debuggen van integratietests
```bash
#!/bin/bash
# debug-integratietests.sh

set -e

echo "Running integration tests with debugging..."

# Stel debugomgeving in
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Verkrijg service-eindpunten
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Test gezondheids-eindpunten
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

# Voer tests uit
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Voer aangepaste integratietests uit
npm run test:integration
```

### Loadtesten voor debugging
```bash
# Eenvoudige belastingtest om prestatieknelpunten te identificeren
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Gebruik Apache Bench (installeren: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Haal belangrijke statistieken op
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Controleer op fouten
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastructuurdebugging

### Debuggen van Bicep-sjablonen
```bash
# Valideer Bicep-sjablonen met gedetailleerde output
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Syntaxisvalidatie
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lintvalidatie
    az bicep lint --file "$template_file"
    
    # Wat-als implementatie
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Debug sjabloonimplementatie
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

### Analyse van resourcestatus
```bash
# Analyseer de toestanden van bronnen op inconsistenties
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Lijst alle bronnen met hun toestanden
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Controleer op mislukte bronnen
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

## 🔒 Beveiligingsdebugging

### Debuggen van authenticatiestromen
```bash
# Debug Azure-authenticatie
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Decode JWT-token (vereist jq en base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Debug toegang tot Key Vault
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

### Debuggen van netwerkbeveiliging
```bash
# Debug netwerkbeveiligingsgroepen
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Controleer beveiligingsregels
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Applicatiespecifieke Debugging

### Debuggen van Node.js-applicaties
```javascript
// debug-middleware.js - Express debugging middleware
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Log verzoekdetails
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Overschrijf res.json om reacties te loggen
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Debuggen van databasequery's
```javascript
// database-debug.js - Hulpprogramma's voor database-debugging
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

## 🚨 Noodprocedures voor Debugging

### Reactie op productieproblemen
```bash
#!/bin/bash
# emergency-debug.sh - Noodproductiedebugging

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

# Schakel over naar de juiste omgeving
azd env select "$ENVIRONMENT"

# Verzamel kritieke informatie
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

### Terugrolprocedures
```bash
# Snelle rollback-script
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Wissel omgeving
    azd env select "$environment"
    
    # Rollback applicatie
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Verifieer rollback
    echo "Verifying rollback..."
    azd show
    
    # Test kritieke eindpunten
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Debugging Dashboards

### Aangepast monitoringdashboard
```bash
# Maak Application Insights-query's voor debugging
create_debug_queries() {
    local app_insights_name=$1
    
    # Query voor fouten
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Query voor prestatieproblemen
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Query voor afhankelijkheidsfouten
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Logaggregatie
```bash
# Verzamel logboeken van meerdere bronnen
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

## 🔗 Geavanceerde Bronnen

### Aangepaste Debugscripts
Maak een `scripts/debug/`-map met:
- `health-check.sh` - Uitgebreide gezondheidscontrole
- `performance-test.sh` - Geautomatiseerde prestatietests
- `log-analyzer.py` - Geavanceerde logparsing en analyse
- `resource-validator.sh` - Infrastructuurvalidatie

### Monitoringintegratie
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

## Best Practices

1. **Schakel altijd debuglogging in** in niet-productieomgevingen
2. **Maak reproduceerbare testcases** voor problemen
3. **Documenteer debugprocedures** voor je team
4. **Automatiseer gezondheidscontroles** en monitoring
5. **Houd debugtools up-to-date** met je applicatiewijzigingen
6. **Oefen debugprocedures** tijdens niet-incidenttijden

## Volgende Stappen

- [Capaciteitsplanning](../pre-deployment/capacity-planning.md) - Plan resourcevereisten
- [SKU-selectie](../pre-deployment/sku-selection.md) - Kies geschikte servicetiers
- [Preflight-controles](../pre-deployment/preflight-checks.md) - Validatie vóór deployment
- [Cheat Sheet](../../resources/cheat-sheet.md) - Snelreferentiecommando's

---

**Onthoud**: Goed debuggen draait om systematisch, grondig en geduldig werken. Deze tools en technieken helpen je om problemen sneller en effectiever te diagnosticeren.

---

**Navigatie**
- **Vorige Les**: [Veelvoorkomende Problemen](common-issues.md)

- **Volgende Les**: [Capaciteitsplanning](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->