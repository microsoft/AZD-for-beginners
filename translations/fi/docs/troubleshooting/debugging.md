<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5395583c1a88847b97d186dd5f5b1a69",
  "translation_date": "2025-11-21T15:52:53+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "fi"
}
-->
# Vianetsintäopas AZD-julkaisuille

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 7 - Vianetsintä ja virheenkorjaus
- **⬅️ Edellinen**: [Yleiset ongelmat](common-issues.md)
- **➡️ Seuraava**: [AI-spesifinen vianetsintä](ai-troubleshooting.md)
- **🚀 Seuraava luku**: [Luku 8: Tuotanto- ja yrityskäytännöt](../microsoft-foundry/production-ai-practices.md)

## Johdanto

Tämä kattava opas tarjoaa edistyneitä vianetsintästrategioita, työkaluja ja tekniikoita monimutkaisten ongelmien diagnosointiin ja ratkaisemiseen Azure Developer CLI -julkaisuissa. Opit järjestelmällisiä vianetsintämenetelmiä, lokianalyysitekniikoita, suorituskyvyn profilointia ja edistyneitä diagnostiikkatyökaluja, joiden avulla voit tehokkaasti ratkaista julkaisu- ja suoritusongelmia.

## Oppimistavoitteet

Tämän oppaan suorittamisen jälkeen osaat:
- Hallita järjestelmällisiä vianetsintämenetelmiä Azure Developer CLI -ongelmille
- Ymmärtää edistyneen lokikonfiguraation ja lokianalyysitekniikat
- Toteuttaa suorituskyvyn profilointi- ja seurantastrategioita
- Käyttää Azure-diagnostiikkatyökaluja ja -palveluita monimutkaisten ongelmien ratkaisemiseen
- Soveltaa verkon vianetsintä- ja tietoturvaongelmien ratkaisumenetelmiä
- Konfiguroida kattavaa seurantaa ja hälytyksiä ongelmien ennakoivaan havaitsemiseen

## Oppimistulokset

Oppaan suorittamisen jälkeen pystyt:
- Soveltamaan TRIAGE-menetelmää monimutkaisten julkaisujen ongelmien järjestelmälliseen vianetsintään
- Konfiguroimaan ja analysoimaan kattavia loki- ja jäljitystietoja
- Käyttämään tehokkaasti Azure Monitoria, Application Insightsia ja diagnostiikkatyökaluja
- Vianetsimään itsenäisesti verkon yhteys-, todennus- ja käyttöoikeusongelmia
- Toteuttamaan suorituskyvyn seurantaa ja optimointistrategioita
- Luomaan mukautettuja vianetsintäskriptejä ja automaatioita toistuville ongelmille

## Vianetsintämenetelmä

### TRIAGE-lähestymistapa
- **T**ime: Milloin ongelma alkoi?
- **R**eproduce: Voitko toistaa ongelman johdonmukaisesti?
- **I**solate: Mikä komponentti epäonnistuu?
- **A**nalyze: Mitä lokit kertovat?
- **G**ather: Kerää kaikki asiaankuuluvat tiedot
- **E**scalate: Milloin pyytää lisäapua

## Vianetsintätilan käyttöönotto

### Ympäristömuuttujat
```bash
# Ota käyttöön kattava virheenkorjaus
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI -virheenkorjaus
export AZURE_CLI_DIAGNOSTICS=true

# Poista telemetria puhtaamman tulosteen vuoksi
export AZD_DISABLE_TELEMETRY=true
```

### Vianetsintäkonfiguraatio
```bash
# Aseta virheenkorjauskonfiguraatio globaalisti
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Ota jäljityslokitus käyttöön
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Lokianalyysitekniikat

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
# Suodata lokit tason mukaan
azd logs --level error --since 1h

# Suodata palvelun mukaan
azd logs --service api --level debug

# Vie lokit analysointia varten
azd logs --output json > deployment-logs.json

# Jäsennä JSON-lokit jq:lla
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Lokien korrelaatio
```bash
#!/bin/bash
# correlate-logs.sh - Korreloi lokit palveluiden välillä

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Etsi kaikista palveluista
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Etsi Azuren lokit
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Edistyneet vianetsintätyökalut

### Azure Resource Graph -kyselyt
```bash
# Kysy resursseja tunnisteiden perusteella
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Etsi epäonnistuneet käyttöönotot
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Tarkista resurssien tila
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Verkon vianetsintä
```bash
# Testaa yhteyttä palveluiden välillä
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

### Säilöjen vianetsintä
```bash
# Vianmääritys säilösovelluksen ongelmissa
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

### Tietokantayhteyksien vianetsintä
```bash
# Vianmääritys tietokantayhteydessä
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

## 🔬 Suorituskyvyn vianetsintä

### Sovelluksen suorituskyvyn seuranta
```bash
# Ota käyttöön Application Insights -virheenkorjaus
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

### Integraatiotestien vianetsintä
```bash
#!/bin/bash
# debug-integraatiotestit.sh

set -e

echo "Running integration tests with debugging..."

# Aseta debug-ympäristö
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Hae palvelun päätepisteet
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Testaa terveyspäätepisteet
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

### Kuormitustestauksen vianetsintä
```bash
# Yksinkertainen kuormitustesti suorituskykyongelmien tunnistamiseksi
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
    
    # Tarkista virheet
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastruktuurin vianetsintä

### Bicep-mallien vianetsintä
```bash
# Vahvista Bicep-mallit yksityiskohtaisella tulosteella
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Syntaksin validointi
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint-validointi
    az bicep lint --file "$template_file"
    
    # Mitä-jos käyttöönotto
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Vianmääritys mallin käyttöönotossa
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

### Resurssitilan analyysi
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

## 🔒 Tietoturvan vianetsintä

### Todennusprosessin vianetsintä
```bash
# Vianmääritys Azure-todennuksessa
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Purkaa JWT-tunnus (vaatii jq:n ja base64:n)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Vianmääritys Key Vault -pääsyssä
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

### Verkon tietoturvan vianetsintä
```bash
# Vianmääritys verkon suojausryhmille
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Tarkista suojaussäännöt
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Sovelluskohtainen vianetsintä

### Node.js-sovellusten vianetsintä
```javascript
// debug-middleware.js - Expressin virheenkorjausväliohjelma
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
    
    // Korvaa res.json kirjatakseen vastaukset
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Tietokantakyselyjen vianetsintä
```javascript
// database-debug.js - Tietokannan vianetsintätyökalut
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

## 🚨 Hätätilanteiden vianetsintämenetelmät

### Tuotanto-ongelmiin reagointi
```bash
#!/bin/bash
# emergency-debug.sh - Hätätilanteen tuotannon vianmääritys

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

# Kerää kriittistä tietoa
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

### Palautusmenettelyt
```bash
# Nopea palautusskripti
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Vaihda ympäristö
    azd env select "$environment"
    
    # Palauta sovellus
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Vahvista palautus
    echo "Verifying rollback..."
    azd show
    
    # Testaa kriittiset päätepisteet
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Vianetsintäkojelautat

### Mukautettu seurantakojelauta
```bash
# Luo Application Insights -kyselyitä vianmääritystä varten
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

### Lokien yhdistäminen
```bash
# Kerää lokit useista lähteistä
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

## 🔗 Edistyneet resurssit

### Mukautetut vianetsintäskriptit
Luo `scripts/debug/`-hakemisto, jossa on:
- `health-check.sh` - Kattava terveystarkistus
- `performance-test.sh` - Automaattinen suorituskykytestaus
- `log-analyzer.py` - Edistynyt lokien jäsentäminen ja analyysi
- `resource-validator.sh` - Infrastruktuurin validointi

### Seurannan integrointi
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

1. **Ota aina käyttöön vianetsintälokit** ei-tuotantoympäristöissä
2. **Luo toistettavia testitapauksia** ongelmille
3. **Dokumentoi vianetsintämenettelyt** tiimillesi
4. **Automatisoi terveystarkistukset** ja seuranta
5. **Pidä vianetsintätyökalut ajan tasalla** sovelluksesi muutosten kanssa
6. **Harjoittele vianetsintämenettelyjä** ei-ongelmatilanteissa

## Seuraavat vaiheet

- [Kapasiteettisuunnittelu](../pre-deployment/capacity-planning.md) - Suunnittele resurssivaatimukset
- [SKU-valinta](../pre-deployment/sku-selection.md) - Valitse sopivat palvelutasot
- [Esitarkistukset](../pre-deployment/preflight-checks.md) - Julkaisun esivarmistus
- [Pikaopas](../../resources/cheat-sheet.md) - Pikaohjeet ja komennot

---

**Muista**: Hyvä vianetsintä on järjestelmällistä, perusteellista ja kärsivällistä. Nämä työkalut ja tekniikat auttavat sinua diagnosoimaan ongelmia nopeammin ja tehokkaammin.

---

**Navigointi**
- **Edellinen oppitunti**: [Yleiset ongelmat](common-issues.md)

- **Seuraava oppitunti**: [Kapasiteettisuunnittelu](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->