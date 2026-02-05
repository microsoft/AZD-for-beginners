# Kapasiteettisuunnittelu - Azure-resurssien saatavuus ja rajat

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 6 - Ennen käyttöönottoa tehtävä validointi ja suunnittelu
- **⬅️ Edellinen luku**: [Luku 5: Moniagenttiset tekoälyratkaisut](../../examples/retail-scenario.md)
- **➡️ Seuraava**: [SKU-valinta](sku-selection.md)
- **🚀 Seuraava luku**: [Luku 7: Vianetsintä](../troubleshooting/common-issues.md)

## Johdanto

Tämä kattava opas auttaa sinua suunnittelemaan ja validoimaan Azure-resurssien kapasiteettia ennen käyttöönottoa Azure Developer CLI:n avulla. Opit arvioimaan kiintiöitä, saatavuutta ja alueellisia rajoituksia varmistaaksesi onnistuneet käyttöönotot samalla kun optimoit kustannuksia ja suorituskykyä. Hallitse kapasiteettisuunnittelun tekniikat eri sovellusarkkitehtuureille ja skaalaustilanteille.

## Oppimistavoitteet

Tämän oppaan suorittamalla opit:
- Ymmärtämään Azuren kiintiöt, rajat ja alueelliset saatavuusrajoitukset
- Hallitsemaan tekniikoita resurssien saatavuuden ja kapasiteetin tarkistamiseksi ennen käyttöönottoa
- Toteuttamaan automatisoituja kapasiteetin validointi- ja seurantastrategioita
- Suunnittelemaan sovelluksia oikeilla resurssikoko- ja skaalausnäkökohdilla
- Soveltamaan kustannusoptimointistrategioita älykkään kapasiteettisuunnittelun avulla
- Konfiguroimaan hälytyksiä ja seurantaa kiintiöiden käytölle ja resurssien saatavuudelle

## Oppimistulokset

Oppaan suorittamisen jälkeen pystyt:
- Arvioimaan ja validoimaan Azuren resurssikapasiteettivaatimukset ennen käyttöönottoa
- Luomaan automatisoituja skriptejä kapasiteetin tarkistamiseen ja kiintiöiden seurantaan
- Suunnittelemaan skaalautuvia arkkitehtuureja, jotka huomioivat alueelliset ja tilauskohtaiset rajat
- Toteuttamaan kustannustehokkaita resurssikoko-strategioita eri työkuormatyypeille
- Konfiguroimaan ennakoivaa seurantaa ja hälytyksiä kapasiteettiin liittyville ongelmille
- Suunnittelemaan monialueellisia käyttöönottoja oikealla kapasiteetin jakautumisella

## Miksi kapasiteettisuunnittelu on tärkeää

Ennen sovellusten käyttöönottoa sinun tulee varmistaa:
- **Riittävät kiintiöt** tarvittaville resursseille
- **Resurssien saatavuus** kohdealueellasi
- **Palvelutason saatavuus** tilausmallisi mukaan
- **Verkkokapasiteetti** odotetulle liikenteelle
- **Kustannusoptimointi** oikean kokoisten resurssien avulla

## 📊 Azuren kiintiöiden ja rajojen ymmärtäminen

### Rajojen tyypit
1. **Tilauskohtaiset kiintiöt** - Maksimiresurssit per tilaus
2. **Aluekohtaiset kiintiöt** - Maksimiresurssit per alue
3. **Resurssikohtaiset rajat** - Rajat yksittäisille resurssityypeille
4. **Palvelutason rajat** - Rajat palvelusuunnitelmasi mukaan

### Yleiset resurssikiintiöt
```bash
# Tarkista nykyinen kiintiön käyttö
az vm list-usage --location eastus2 --output table

# Tarkista tiettyjen resurssien kiintiöt
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## Ennen käyttöönottoa tehtävät kapasiteettitarkistukset

### Automatisoitu kapasiteetin validointiskripti
```bash
#!/bin/bash
# capacity-check.sh - Vahvista Azuren kapasiteetti ennen käyttöönottoa

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# Funktio tarkistaa kiintiön käyttö
check_quota() {
    local resource_type=$1
    local required=$2
    
    echo "Checking $resource_type quota..."
    
    case $resource_type in
        "compute")
            usage=$(az vm list-usage --location "$LOCATION" --query "[?localName=='Total Regional vCPUs'].{current:currentValue,limit:limit}" -o json)
            current=$(echo "$usage" | jq -r '.[0].current')
            limit=$(echo "$usage" | jq -r '.[0].limit')
            ;;
        "storage")
            usage=$(az storage account show-usage --query "{current:value,limit:limit}" -o json)
            current=$(echo "$usage" | jq -r '.current')
            limit=$(echo "$usage" | jq -r '.limit')
            ;;
        "network")
            usage=$(az network list-usages --location "$LOCATION" --query "[?localName=='Virtual Networks'].{current:currentValue,limit:limit}" -o json)
            current=$(echo "$usage" | jq -r '.[0].current')
            limit=$(echo "$usage" | jq -r '.[0].limit')
            ;;
    esac
    
    available=$((limit - current))
    
    if [ "$available" -ge "$required" ]; then
        echo "✅ $resource_type: $available/$limit available (need $required)"
    else
        echo "❌ $resource_type: Only $available/$limit available (need $required)"
        return 1
    fi
}

# Tarkista eri resurssikiintiöt
check_quota "compute" 4      # Tarvitaan 4 vCPU:ta
check_quota "storage" 2      # Tarvitaan 2 tallennustiliä
check_quota "network" 1      # Tarvitaan 1 virtuaalinen verkko

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### Palvelukohtaiset kapasiteettitarkistukset

#### Sovelluspalvelun kapasiteetti
```bash
# Tarkista App Service Planin saatavuus
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # Tarkista saatavilla olevat SKU:t alueella
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # Ehdota vaihtoehtoisia alueita
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # Tarkista nykyinen käyttö
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# Käyttö
check_app_service_capacity "eastus2" "P1v3"
```

#### Tietokantakapasiteetti
```bash
# Tarkista PostgreSQL-kapasiteetti
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # Tarkista, onko SKU saatavilla
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # Näytä saatavilla olevat SKU:t
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Tarkista Cosmos DB -kapasiteetti
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # Tarkista alueen saatavuus
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # Tarkista, tukeeko palvelimetonta (tarvittaessa)
        if [ "$tier" = "serverless" ]; then
            serverless_regions=$(az cosmosdb locations list \
                --query "[?supportsAvailabilityZone==true && name=='$location']" -o tsv)
            
            if [ -n "$serverless_regions" ]; then
                echo "✅ Cosmos DB Serverless is supported in $location"
            else
                echo "⚠️  Cosmos DB Serverless may not be supported in $location"
            fi
        fi
    else
        echo "❌ Cosmos DB is not available in $location"
        return 1
    fi
}
```

#### Konttisovellusten kapasiteetti
```bash
# Tarkista Container Apps -kapasiteetti
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Tarkista, onko Container Apps saatavilla alueella
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # Tarkista nykyinen ympäristöjen määrä
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Apps -palvelulla on rajoitus, 15 ympäristöä per alue
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # Näytä saatavilla olevat alueet
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 Alueellisen saatavuuden validointi

### Palvelun saatavuus alueittain
```bash
# Tarkista palvelun saatavuus eri alueilla
check_service_availability() {
    local service=$1
    
    echo "Checking $service availability across regions..."
    
    case $service in
        "appservice")
            az appservice list-locations --query "[].{region:name,displayName:displayName}" -o table
            ;;
        "containerapp")
            az provider show --namespace Microsoft.App \
                --query "resourceTypes[?resourceType=='containerApps'].locations" -o table
            ;;
        "postgres")
            az postgres flexible-server list-skus --location eastus2 >/dev/null 2>&1 && \
            echo "PostgreSQL Flexible Server regions:" && \
            az account list-locations --query "[?metadata.regionType=='Physical'].{name:name,displayName:displayName}" -o table
            ;;
        "cosmosdb")
            az cosmosdb locations list --query "[].{name:name,documentationUrl:documentationUrl}" -o table
            ;;
    esac
}

# Tarkista kaikki palvelut
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### Aluevalintasuositukset
```bash
# Suosittele parhaita alueita vaatimusten perusteella
recommend_region() {
    local requirements=$1  # "edullinen" | "suorituskyky" | "vaatimustenmukaisuus"
    
    echo "Region recommendations for: $requirements"
    
    case $requirements in
        "lowcost")
            echo "💰 Cost-optimized regions:"
            echo "  - East US (Virginia)"
            echo "  - South Central US (Texas)"
            echo "  - West US 2 (Washington)"
            ;;
        "performance")
            echo "⚡ Performance-optimized regions:"
            echo "  - East US 2 (Virginia) - Latest hardware"
            echo "  - West US 2 (Washington) - Latest hardware"
            echo "  - North Europe (Ireland) - For EU users"
            ;;
        "compliance")
            echo "🔒 Compliance-focused regions:"
            echo "  - US Gov regions - For government workloads"
            echo "  - Germany regions - For GDPR compliance"
            echo "  - Australia regions - For data sovereignty"
            ;;
    esac
}
```

## 💰 Kustannussuunnittelu ja arviointi

### Resurssien kustannusarviointi
```bash
# Arvioi käyttöönoton kustannukset
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # Luo väliaikainen resurssiryhmä arviointia varten
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # Ota infrastruktuuri käyttöön validointitilassa
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # Poista väliaikainen resurssiryhmä
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### SKU-optimointisuositukset
```bash
# Suosittele optimaalisia SKU:ita vaatimusten perusteella
recommend_sku() {
    local service=$1
    local workload_type=$2  # "kehitys" | "testaus" | "tuotanto"
    
    echo "SKU recommendations for $service ($workload_type workload):"
    
    case $service in
        "appservice")
            case $workload_type in
                "dev")
                    echo "  Recommended: B1 (Basic)"
                    echo "  Alternative: F1 (Free) for temporary testing"
                    ;;
                "staging")
                    echo "  Recommended: S1 (Standard)"
                    echo "  Alternative: B2 (Basic) for cost savings"
                    ;;
                "production")
                    echo "  Recommended: P1v3 (Premium)"
                    echo "  High-traffic: P2v3 or P3v3"
                    echo "  Consider: App Service Environment for isolation"
                    ;;
            esac
            ;;
        "postgres")
            case $workload_type in
                "dev")
                    echo "  Recommended: Standard_B1ms (Burstable)"
                    echo "  Storage: 32 GB"
                    ;;
                "staging")
                    echo "  Recommended: Standard_B2s (Burstable)"
                    echo "  Storage: 64 GB"
                    ;;
                "production")
                    echo "  Recommended: Standard_D2s_v3 (General Purpose)"
                    echo "  High-performance: Standard_D4s_v3 or higher"
                    echo "  Storage: 128 GB or more with backup"
                    ;;
            esac
            ;;
        "cosmosdb")
            case $workload_type in
                "dev")
                    echo "  Recommended: Serverless"
                    echo "  Alternative: Provisioned 400 RU/s"
                    ;;
                "staging")
                    echo "  Recommended: Provisioned 400-1000 RU/s"
                    echo "  Enable autoscale for variable workloads"
                    ;;
                "production")
                    echo "  Recommended: Provisioned with autoscale"
                    echo "  High-availability: Multi-region writes"
                    echo "  Consider: Dedicated throughput for containers"
                    ;;
            esac
            ;;
    esac
}
```

## 🚀 Automatisoidut ennakkotarkistukset

### Kattava ennakkotarkistusskripti
```bash
#!/bin/bash
# preflight-check.sh - Täydellinen käyttöönoton esivarmistus

set -e

# Määritykset
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# Värit tulosteelle
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # Ei väriä

# Lokitoiminnot
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# Lataa määritykset
if [ -f "$CONFIG_FILE" ]; then
    REQUIRED_VCPUS=$(jq -r '.requirements.vcpus' "$CONFIG_FILE")
    REQUIRED_STORAGE=$(jq -r '.requirements.storage' "$CONFIG_FILE")
    REQUIRED_SERVICES=($(jq -r '.requirements.services[]' "$CONFIG_FILE"))
else
    log_warn "No configuration file found, using defaults"
    REQUIRED_VCPUS=4
    REQUIRED_STORAGE=2
    REQUIRED_SERVICES=("appservice" "postgres" "storage")
fi

echo "🚀 Starting pre-flight checks..."
echo "Location: $LOCATION"
echo "Environment: $ENVIRONMENT"
echo "Required vCPUs: $REQUIRED_VCPUS"
echo "Required Storage Accounts: $REQUIRED_STORAGE"
echo "Required Services: ${REQUIRED_SERVICES[*]}"
echo "=================================="

# Tarkistus 1: Todennus
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# Tarkistus 2: Alueellinen saatavuus
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# Tarkistus 3: Kiintiön tarkistus
log_info "Checking quota availability..."

# vCPU-kiintiö
vcpu_usage=$(az vm list-usage --location "$LOCATION" \
    --query "[?localName=='Total Regional vCPUs'].{current:currentValue,limit:limit}" -o json)
vcpu_current=$(echo "$vcpu_usage" | jq -r '.[0].current')
vcpu_limit=$(echo "$vcpu_usage" | jq -r '.[0].limit')
vcpu_available=$((vcpu_limit - vcpu_current))

if [ "$vcpu_available" -ge "$REQUIRED_VCPUS" ]; then
    log_info "vCPU quota: $vcpu_available/$vcpu_limit available (need $REQUIRED_VCPUS)"
else
    log_error "Insufficient vCPU quota: $vcpu_available/$vcpu_limit available (need $REQUIRED_VCPUS)"
    exit 1
fi

# Tallennustilin kiintiö
storage_usage=$(az storage account show-usage --query "{current:value,limit:limit}" -o json)
storage_current=$(echo "$storage_usage" | jq -r '.current')
storage_limit=$(echo "$storage_usage" | jq -r '.limit')
storage_available=$((storage_limit - storage_current))

if [ "$storage_available" -ge "$REQUIRED_STORAGE" ]; then
    log_info "Storage quota: $storage_available/$storage_limit available (need $REQUIRED_STORAGE)"
else
    log_error "Insufficient storage quota: $storage_available/$storage_limit available (need $REQUIRED_STORAGE)"
    exit 1
fi

# Tarkistus 4: Palvelun saatavuus
log_info "Checking service availability..."

for service in "${REQUIRED_SERVICES[@]}"; do
    case $service in
        "appservice")
            if az appservice list-locations --sku B1 --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
                log_info "App Service is available in $LOCATION"
            else
                log_error "App Service is not available in $LOCATION"
                exit 1
            fi
            ;;
        "postgres")
            if az postgres flexible-server list-skus --location "$LOCATION" >/dev/null 2>&1; then
                log_info "PostgreSQL is available in $LOCATION"
            else
                log_error "PostgreSQL is not available in $LOCATION"
                exit 1
            fi
            ;;
        "containerapp")
            if az provider show --namespace Microsoft.App \
                --query "resourceTypes[?resourceType=='containerApps'].locations" \
                --output tsv | grep -q "$LOCATION"; then
                log_info "Container Apps is available in $LOCATION"
            else
                log_error "Container Apps is not available in $LOCATION"
                exit 1
            fi
            ;;
        "cosmosdb")
            if az cosmosdb locations list --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
                log_info "Cosmos DB is available in $LOCATION"
            else
                log_error "Cosmos DB is not available in $LOCATION"
                exit 1
            fi
            ;;
    esac
done

# Tarkistus 5: Verkon kapasiteetti
log_info "Checking network capacity..."
vnet_usage=$(az network list-usages --location "$LOCATION" \
    --query "[?localName=='Virtual Networks'].{current:currentValue,limit:limit}" -o json)
vnet_current=$(echo "$vnet_usage" | jq -r '.[0].current')
vnet_limit=$(echo "$vnet_usage" | jq -r '.[0].limit')
vnet_available=$((vnet_limit - vnet_current))

if [ "$vnet_available" -gt 0 ]; then
    log_info "Virtual Network quota: $vnet_available/$vnet_limit available"
else
    log_warn "Virtual Network quota: $vnet_available/$vnet_limit available (may need cleanup)"
fi

# Tarkistus 6: Resurssien nimeämisen tarkistus
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# Tarkistus 7: Kustannusarvio
log_info "Performing cost estimation..."
ESTIMATED_MONTHLY_COST=$(calculate_estimated_cost "$ENVIRONMENT" "$LOCATION")
log_info "Estimated monthly cost: \$${ESTIMATED_MONTHLY_COST}"

if [ "$ENVIRONMENT" = "production" ] && [ "$ESTIMATED_MONTHLY_COST" -gt 1000 ]; then
    log_warn "High estimated cost for production environment: \$${ESTIMATED_MONTHLY_COST}/month"
    read -p "Continue with deployment? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        log_info "Deployment cancelled by user"
        exit 1
    fi
fi

# Tarkistus 8: Mallin tarkistus
log_info "Validating Bicep templates..."
if [ -f "infra/main.bicep" ]; then
    if az bicep build --file infra/main.bicep --stdout >/dev/null 2>&1; then
        log_info "Bicep template syntax is valid"
    else
        log_error "Bicep template has syntax errors"
        az bicep build --file infra/main.bicep
        exit 1
    fi
else
    log_warn "No Bicep template found at infra/main.bicep"
fi

# Lopullinen yhteenveto
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### Konfiguraatiotiedoston malli
```json
{
  "requirements": {
    "vcpus": 4,
    "storage": 2,
    "services": [
      "appservice",
      "postgres",
      "storage"
    ]
  },
  "preferences": {
    "region": "eastus2",
    "costOptimized": true,
    "highAvailability": false
  },
  "skus": {
    "dev": {
      "appServiceSku": "B1",
      "databaseSku": "Standard_B1ms"
    },
    "staging": {
      "appServiceSku": "S1",
      "databaseSku": "Standard_B2s"
    },
    "production": {
      "appServiceSku": "P1v3",
      "databaseSku": "Standard_D2s_v3"
    }
  }
}
```

## 📈 Kapasiteetin seuranta käyttöönoton aikana

### Reaaliaikainen kapasiteetin seuranta
```bash
# Seuraa kapasiteettia käyttöönoton aikana
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # Tarkista käyttöönoton tila
        deployment_status=$(az deployment group list \
            --resource-group "$resource_group" \
            --query "[0].properties.provisioningState" -o tsv)
        
        if [ "$deployment_status" = "Succeeded" ]; then
            log_info "Deployment completed successfully"
            break
        elif [ "$deployment_status" = "Failed" ]; then
            log_error "Deployment failed"
            break
        fi
        
        # Tarkista nykyinen resurssien käyttö
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 Integrointi AZD:n kanssa

### Lisää ennakkotarkistuskoukut azure.yaml-tiedostoon
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Running pre-flight capacity checks..."
      ./scripts/preflight-check.sh ${AZURE_LOCATION} ${AZURE_ENV_NAME}
      
      if [ $? -ne 0 ]; then
        echo "Pre-flight checks failed"
        exit 1
      fi
      
      echo "Pre-flight checks passed, proceeding with deployment"
```

## Parhaat käytännöt

1. **Suorita aina kapasiteettitarkistukset** ennen käyttöönottoa uusille alueille
2. **Seuraa kiintiöiden käyttöä säännöllisesti** välttääksesi yllätykset
3. **Suunnittele kasvua varten** tarkistamalla tulevat kapasiteettitarpeet
4. **Käytä kustannusarviotyökaluja** välttääksesi yllättävät laskut
5. **Dokumentoi kapasiteettivaatimukset** tiimillesi
6. **Automatisoi kapasiteetin validointi** CI/CD-putkistoissa
7. **Huomioi alueellinen varakapasiteetti** tarpeet

## Seuraavat askeleet

- [SKU-valintaopas](sku-selection.md) - Valitse optimaaliset palvelutasot
- [Ennakkotarkistukset](preflight-checks.md) - Automatisoidut validointiskriptit
- [Pikaopas](../../resources/cheat-sheet.md) - Nopeat viitekomennot
- [Sanasto](../../resources/glossary.md) - Termit ja määritelmät

## Lisäresurssit

- [Azuren tilausrajat](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azuren hinnoittelulaskuri](https://azure.microsoft.com/pricing/calculator/)
- [Azuren kustannusten hallinta](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azuren alueellinen saatavuus](https://azure.microsoft.com/global-infrastructure/services/)

---

**Navigointi**
- **Edellinen oppitunti**: [Vianetsintäopas](../troubleshooting/debugging.md)

- **Seuraava oppitunti**: [SKU-valinta](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Tärkeissä tiedoissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->