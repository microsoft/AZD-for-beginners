# AZD-käyttöönottojen vianmääritysopas

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 7 - Vianmääritys ja debuggaus
- **⬅️ Edellinen**: [Yleiset ongelmat](common-issues.md)
- **➡️ Seuraava**: [AI-kohtainen vianmääritys](ai-troubleshooting.md)
- **🚀 Seuraava luku**: [Luku 8: Tuotanto- ja yritysmallit](../chapter-08-production/production-ai-practices.md)

## Johdanto

Tämä kattava opas tarjoaa edistyneitä vianmääritysstrategioita, työkaluja ja tekniikoita Azure Developer CLI -käyttöönottojen monimutkaisten ongelmien diagnosointiin ja ratkaisemiseen. Opit systemaattisia vikojen etsintämenetelmiä, lokien analysointitekniikoita, suorituskyvyn profilointia ja edistyneitä diagnostiikkatyökaluja, joiden avulla voit ratkaista käyttöönotto- ja ajonaikaisia ongelmia tehokkaasti.

## Oppimistavoitteet

Kun suoritat tämän oppaan loppuun, osaat:
- Hallita systemaattisia vianmääritysmenetelmiä Azure Developer CLI -ongelmille
- Ymmärtää edistyneen lokituksen asetukset ja lokianalyysitekniikat
- Toteuttaa suorituskyvyn profilointi- ja valvontastrategioita
- Käyttää Azuren diagnostiikkatyökaluja ja -palveluja monimutkaisten ongelmien ratkaisemiseen
- Soveltaa verkon vianmääritystä ja tietoturvan vianetsintätekniikoita
- Konfiguroida kattavan valvonnan ja hälytykset proaktiiviseen ongelmien havaitsemiseen

## Oppimistulokset

Suoritettuasi oppaan pystyt:
- Soveltamaan TRIAGE-menetelmää monimutkaisten käyttöönotto-ongelmien järjestelmälliseen vianmääritykseen
- Konfiguroimaan ja analysoimaan kattavia loki- ja jäljitystietoja
- Käyttämään Azure Monitoria, Application Insightsia ja diagnostiikkatyökaluja tehokkaasti
- Vianmäärityään verkon yhteyksiin, todennukseen ja käyttöoikeuksiin itsenäisesti
- Toteuttamaan suorituskyvyn valvonta- ja optimointistrategioita
- Luomaan mukautettuja vianmääritysskriptejä ja automaatiota toistuviin ongelmiin

## Vianmääritysmenetelmä

### TRIAGE-lähestymistapa
- **T**ime: Milloin ongelma alkoi?
- **R**eproduce: Voitko toistaa sen johdonmukaisesti?
- **I**solate: Mikä komponentti epäonnistuu?
- **A**nalyze: Mitä lokit kertovat?
- **G**ather: Kerää kaikki olennaiset tiedot
- **E**scalate: Milloin pyytää lisäapua

## Debug-tilan ottaminen käyttöön

### Ympäristömuuttujat
```bash
# Ota kattava virheenkorjaus käyttöön
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI -virheenkorjaus
export AZURE_CLI_DIAGNOSTICS=true

# Poista telemetria käytöstä puhtaamman tulosteen saamiseksi
export AZD_DISABLE_TELEMETRY=true
```

### Debug-kokoonpano
```bash
# Aseta virheenkorjausasetukset globaalisti
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Ota jäljityslokitus käyttöön
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Lokien analysointitekniikat

### Lokitasojen ymmärtäminen
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Rakenteellinen lokianalyysi
```bash
# Näytä lokit Azure Monitorilla (azd monitor -komennolla)
azd monitor --logs

# Näytä sovelluksen lokit reaaliajassa
azd monitor --live

# Yksityiskohtaista lokkien analyysiä varten käytä Azure CLI:tä yhdessä App Servicen tai Container Appin kanssa:
# App Servicen lokit
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container Appin lokit
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Vie Application Insightsin lokit analyysiä varten
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Lokien korrelaatio
```bash
#!/bin/bash
# correlate-logs.sh - Korreloi lokit palveluiden välillä Azure Monitorin avulla

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Etsi Application Insightsista korreloituja lokitapahtumia
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Etsi Azuren toimintalokeja
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Edistyneet vianmääritystyökalut

### Azure Resource Graph -kyselyt
```bash
# Hae resursseja tageilla
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Etsi epäonnistuneet käyttöönotot
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Tarkista resurssien kunto
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Verkon vianmääritys
```bash
# Testaa palveluiden välinen yhteys
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

# Käyttö
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Konttien vianmääritys
```bash
# Säiliösovelluksen ongelmien vianmääritys
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

### Tietokantayhteyksien vianmääritys
```bash
# Vianmääritys tietokantayhteyksiin
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

## 🔬 Suorituskyvyn vianmääritys

### Sovelluksen suorituskyvyn valvonta
```bash
# Ota käyttöön Application Insightsin virheenkorjaus
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

# Mukautettu suorituskyvyn seuranta
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

### Resurssien käytön analyysi
```bash
# Seuraa resurssien käyttöä
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

## 🧪 Testaus ja validointi

### Integraatiotestauksen vianmääritys
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Aseta virheenkorjausympäristö
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Hae palvelun päätepisteet
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Testaa terveystarkastuksen päätepisteet
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

# Suorita testit
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Suorita mukautetut integraatiotestit
npm run test:integration
```

### Kuormitustestaus vianmääritystä varten
```bash
# Yksinkertainen kuormitustesti suorituskykypullonkaulojen tunnistamiseksi
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Käytetään Apache Benchia (asennus: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Poimi keskeiset mittarit
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Tarkista epäonnistumiset
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastruktuurin vianmääritys

### Bicep-mallien vianmääritys
```bash
# Tarkista Bicep-mallit yksityiskohtaisella tulostuksella
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Syntaksin tarkistus
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint-tarkistus
    az bicep lint --file "$template_file"
    
    # Mitä jos -käyttöönotto
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Mallin käyttöönoton vianmääritys
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

### Resurssien tilan analyysi
```bash
# Analysoi resurssien tilat epäjohdonmukaisuuksien varalta
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Listaa kaikki resurssit ja niiden tilat
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Tarkista epäonnistuneet resurssit
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

## 🔒 Tietoturvan vianmääritys

### Todennusvirran vianmääritys
```bash
# Azure-todennuksen vianmääritys
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Dekoodaa JWT-tunniste (vaatii jq:n ja base64:n)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vault -käytön vianmääritys
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

### Verkon tietoturvan vianmääritys
```bash
# Vianmääritys verkkoturvaryhmille
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Tarkista turvallisuussäännöt
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Sovelluskohtainen vianmääritys

### Node.js-sovellusten vianmääritys
```javascript
// debug-middleware.js - Expressin virheenkorjausvälikerros
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Kirjaa pyynnön tiedot
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Korvaa res.json niin, että vastaukset kirjataan
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Tietokantakyselyjen vianmääritys
```javascript
// database-debug.js - Tietokannan virheenkorjaustyökalut
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

## 🚨 Hätätilanteen vianmääritysprosessit

### Tuotantovirheiden vaste
```bash
#!/bin/bash
# emergency-debug.sh - Hätätilainen tuotannon vianmääritys

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

# Vaihda oikeaan ympäristöön
azd env select "$ENVIRONMENT"

# Kerää kriittiset tiedot
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Käytä Azure Monitoria virhelokeihin
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

### Palautusmenettelyt
```bash
# Nopea palautusskripti
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Vaihda ympäristö
    azd env select "$environment"
    
    # Palautus Gitillä (AZD:ssä ei ole sisäänrakennettua palautustoimintoa)
    git checkout "$previous_commit"
    azd deploy
    
    # Varmista palautus
    echo "Verifying rollback..."
    azd show
    
    # Testaa kriittiset päätepisteet
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Vianmäärityshallintapaneelit

### Mukautettu valvontapaneeli
```bash
# Luo Application Insights -kyselyjä virheenkorjaukseen
create_debug_queries() {
    local app_insights_name=$1
    
    # Kysely virheistä
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Kysely suorituskykyongelmista
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Kysely riippuvuuksien epäonnistumisista
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Lokkien aggregointi
```bash
# Kerää lokit useista Azure-lähteistä
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

## 🔗 Edistyneet resurssit

### Mukautetut vianmääritysskriptit
Luo kansio `scripts/debug/` ja lisää:
- `health-check.sh` - Kattavat terveystarkistukset
- `performance-test.sh` - Automaattinen suorituskyvyn testaus
- `log-analyzer.py` - Edistynyt lokien jäsennys ja analyysi
- `resource-validator.sh` - Infrastruktuurin validointi

### Valvonnan integrointi
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

## Parhaat käytännöt

1. **Ota debug-lokitus aina käyttöön** ei-tuotantoympäristöissä
2. **Luo toistettavat testitapaukset** ongelmille
3. **Dokumentoi vianmääritysprosessit** tiimillesi
4. **Automatisoi terveystarkistukset** ja valvonta
5. **Pidä vianmääritystyökalut ajan tasalla** sovelluksesi muutosten kanssa
6. **Harjoittele vianmääritysmenettelyitä** ei-hätätilanteina

## Seuraavat askeleet

- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Suunnittele resurssivaatimukset
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Valitse sopivat palvelutasot
- [Preflight Checks](../chapter-06-pre-deployment/preflight-checks.md) - Ennen käyttöönottoa tehtävät tarkistukset
- [Cheat Sheet](../../resources/cheat-sheet.md) - Pikakomentovihjeet

---

**Muista**: Hyvä vianmääritys on systemaattista, perusteellista ja kärsivällistä. Nämä työkalut ja tekniikat auttavat sinua diagnosoimaan ongelmat nopeammin ja tehokkaammin.

---

**Navigointi**
- **Edellinen oppitunti**: [Yleiset ongelmat](common-issues.md)

- **Seuraava oppitunti**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälypohjaisen käännöspalvelun [Co-op Translator](https://github.com/Azure/co-op-translator) avulla. Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää auktoriteettisena lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa mistään väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->