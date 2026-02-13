# Felsökningsguide för AZD-distributioner

**Kapitelnavigering:**
- **📚 Kursens startsida**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 7 - Felsökning och Debugging
- **⬅️ Föregående**: [Vanliga problem](common-issues.md)
- **➡️ Nästa**: [AI-specifik felsökning](ai-troubleshooting.md)
- **🚀 Nästa kapitel**: [Kapitel 8: Produktion & Företagsmönster](../chapter-08-production/production-ai-practices.md)

## Introduktion

Denna omfattande guide erbjuder avancerade felsökningsstrategier, verktyg och tekniker för att diagnostisera och lösa komplexa problem med Azure Developer CLI-distributioner. Lär dig systematiska felsökningsmetoder, tekniker för logganalys, prestandaprofilering och avancerade diagnostikverktyg för att effektivt åtgärda distributions- och runtime-problem.

## Lärandemål

Genom att slutföra denna guide kommer du att:
- Bemästra systematiska felsökningsmetoder för Azure Developer CLI-problem
- Förstå avancerad loggkonfiguration och tekniker för logganalys
- Implementera strategier för prestandaprofilering och övervakning
- Använda Azures diagnostikverktyg och tjänster för komplex problemlösning
- Tillämpa nätverksfelsökning och säkerhetsfelsökningstekniker
- Konfigurera omfattande övervakning och larm för proaktiv felupptäckt

## Läranderesultat

Efter slutförandet kommer du att kunna:
- Tillämpa TRIAGE-metodiken för att systematiskt felsöka komplexa distributionsproblem
- Konfigurera och analysera omfattande logg- och spårningsinformation
- Använda Azure Monitor, Application Insights och diagnostikverktyg effektivt
- Felsöka nätverksanslutning, autentisering och behörighetsproblem självständigt
- Implementera övervakning och optimeringsstrategier för prestanda
- Skapa anpassade felsökningsskript och automatisering för återkommande problem

## Felsökningsmetodik

### TRIAGE-metoden
- **T**id: När började problemet?
- **R**eproducera: Kan du konsekvent reproducera det?
- **I**solera: Vilken komponent misslyckas?
- **A**nalysera: Vad säger loggarna?
- **G**ather: Samla all relevant information
- **E**skalera: När ska man söka ytterligare hjälp

## Aktivera felsökningsläge

### Miljövariabler
```bash
# Aktivera omfattande felsökning
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI-felsökning
export AZURE_CLI_DIAGNOSTICS=true

# Inaktivera telemetri för renare utdata
export AZD_DISABLE_TELEMETRY=true
```

### Debug-konfiguration
```bash
# Ställ in felsökningskonfiguration globalt
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Aktivera spårningsloggning
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Logganalysmetoder

### Förstå loggnivåer
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Strukturerad logganalys
```bash
# Visa loggar med Azure Monitor (via azd monitor)
azd monitor --logs

# Visa applikationsloggar i realtid
azd monitor --live

# För detaljerad logganalys, använd Azure CLI med din App Service eller Container App:
# App Service-loggar
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App-loggar
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Exportera Application Insights-loggar för analys
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Loggkorrelation
```bash
#!/bin/bash
# correlate-logs.sh - Korrelatera loggar mellan tjänster med Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Sök i Application Insights efter korrelerade loggar
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Sök i Azure-aktivitetsloggar
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Avancerade felsökningsverktyg

### Azure Resource Graph-frågor
```bash
# Sök resurser efter taggar
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Hitta misslyckade distributioner
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Kontrollera resursernas hälsa
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Nätverksfelsökning
```bash
# Testa anslutning mellan tjänster
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

# Användning
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Containerfelsökning
```bash
# Felsök problem med containerappen
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

### Felsökning av databasanslutningar
```bash
# Felsök databasanslutning
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

## 🔬 Prestandafelsökning

### Applikationsprestandaövervakning
```bash
# Aktivera felsökning för Application Insights
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

# Anpassad prestandaövervakning
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

### Analys av resursanvändning
```bash
# Övervaka resursanvändning
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

## 🧪 Testning och validering

### Felsökning av integrationstester
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Ställ in felsökningsmiljön
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Hämta tjänstens ändpunkter
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Testa hälsokontroller
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

# Kör tester
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Kör anpassade integrationstester
npm run test:integration
```

### Belastningstestning för felsökning
```bash
# Enkelt belastningstest för att identifiera prestandaflaskhalsar
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Använder Apache Bench (installera: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Extrahera viktiga mätvärden
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Kontrollera efter fel
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastrukturfelsökning

### Felsökning av Bicep-mallar
```bash
# Validera Bicep-mallar med detaljerad utdata
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Syntaxvalidering
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lintvalidering
    az bicep lint --file "$template_file"
    
    # What-if-utplacering
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Felsök mallutplacering
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

### Analys av resursstatus
```bash
# Analysera resurstillstånd för inkonsekvenser
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Lista alla resurser med sina tillstånd
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Kontrollera efter misslyckade resurser
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

## 🔒 Säkerhetsfelsökning

### Felsökning av autentiseringsflöden
```bash
# Felsök Azure-autentisering
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Dekoda JWT-token (kräver jq och base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Felsök åtkomst till Key Vault
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

### Felsökning av nätverkssäkerhet
```bash
# Felsök nätverkssäkerhetsgrupper
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Kontrollera säkerhetsregler
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Applikationsspecifik felsökning

### Felsökning av Node.js-applikationer
```javascript
// debug-middleware.js - Express felsökningsmiddleware
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Logga detaljer om förfrågan
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Åsidosätt res.json för att logga svar
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Felsökning av databasfrågor
```javascript
// database-debug.js - Databasfelsökningsverktyg
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

## 🚨 Akuta felsökningsrutiner

### Åtgärd vid produktionsproblem
```bash
#!/bin/bash
# emergency-debug.sh - Akut felsökning i produktion

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

# Byt till rätt miljö
azd env select "$ENVIRONMENT"

# Samla in kritisk information
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Använd Azure Monitor för felloggar
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

### Återställningsprocedurer
```bash
# Snabbt återställningsskript
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Byt miljö
    azd env select "$environment"
    
    # Återställ med Git (AZD har ingen inbyggd återställningsfunktion)
    git checkout "$previous_commit"
    azd deploy
    
    # Verifiera återställning
    echo "Verifying rollback..."
    azd show
    
    # Testa kritiska ändpunkter
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Felsökningsinstrumentpaneler

### Anpassad övervakningspanel
```bash
# Skapa Application Insights-frågor för felsökning
create_debug_queries() {
    local app_insights_name=$1
    
    # Sök efter fel
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Sök efter prestandaproblem
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Sök efter beroendefel
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Loggaggregering
```bash
# Aggregera loggar från flera Azure-källor
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

## 🔗 Avancerade resurser

### Anpassade felsökningsskript
Skapa en `scripts/debug/`-katalog med:
- `health-check.sh` - Omfattande hälsokontroller
- `performance-test.sh` - Automatiserade prestandatester
- `log-analyzer.py` - Avancerad loggparsning och analys
- `resource-validator.sh` - Infrastrukturvalidering

### Övervakningsintegration
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

## Bästa praxis

1. **Aktivera alltid felsökningsloggning** i icke-produktionsmiljöer
2. **Skapa reproducerbara testfall** för problem
3. **Dokumentera felsökningsprocedurer** för ditt team
4. **Automatisera hälsokontroller** och övervakning
5. **Håll felsökningsverktyg uppdaterade** med dina applikationsändringar
6. **Öva felsökningsprocedurer** under icke-incidenttider

## Nästa steg

- [Kapacitetsplanering](../chapter-06-pre-deployment/capacity-planning.md) - Planera resursbehov
- [Val av SKU](../chapter-06-pre-deployment/sku-selection.md) - Välj lämpliga tjänstenivåer
- [Förkontroller](../chapter-06-pre-deployment/preflight-checks.md) - Förvalidering innan distribution
- [Snabbreferens](../../resources/cheat-sheet.md) - Snabbreferens för kommandon

---

**Kom ihåg**: Bra felsökning handlar om att vara systematisk, grundlig och tålmodig. Dessa verktyg och tekniker hjälper dig att diagnostisera problem snabbare och mer effektivt.

---

**Navigering**
- **Föregående lektion**: [Vanliga problem](common-issues.md)

- **Nästa lektion**: [Kapacitetsplanering](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Vi strävar efter noggrannhet, men var medveten om att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->