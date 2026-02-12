# Kapaciteto planavimas - Azure išteklių prieinamumas ir ribojimai

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 6 skyrius - Išankstinis patikrinimas ir planavimas prieš diegimą
- **⬅️ Ankstesnis skyrius**: [5 skyrius: Daugiaagentės AI sprendimai](../../examples/retail-scenario.md)
- **➡️ Kitas**: [SKU parinkimas](sku-selection.md)
- **🚀 Kitas skyrius**: [7 skyrius: Trikčių šalinimas](../chapter-07-troubleshooting/common-issues.md)

## Įvadas

Šis išsamus vadovas padės jums planuoti ir patvirtinti Azure išteklių talpą prieš diegiant naudojant Azure Developer CLI. Išmoksite įvertinti kvotas, prieinamumą ir regioninius apribojimus, kad užtikrintumėte sėkmingus diegimus tuo pačiu optimizuodami išlaidas ir našumą. Įvaldykite kapaciteto planavimo metodus skirtingoms programų architektūroms ir mastelio keitimo scenarijams.

## Mokymosi tikslai

Užbaigę šį vadovą, sugebėsite:
- Suprasti Azure kvotas, ribojimus ir regioninius prieinamumo apribojimus
- Įvaldyti technikas patikrinti išteklių prieinamumą ir talpą prieš diegimą
- Įgyvendinti automatizuotas talpos patikros ir stebėjimo strategijas
- Kurti programas atsižvelgiant į tinkamą išteklių dydinimą ir mastelio keitimo aspektus
- Taikyti išlaidų optimizavimo strategijas naudojant protingą kapaciteto planavimą
- Konfigūruoti įspėjimus ir stebėjimą kvotų naudojimui ir išteklių prieinamumui

## Mokymosi rezultatai

Baigę, sugebėsite:
- Įvertinti ir patvirtinti Azure išteklių talpos reikalavimus prieš diegimą
- Sukurti automatizuotus skriptus talpos tikrinimui ir kvotų stebėsenai
- Kurti mastelio keičiamas architektūras, atsižvelgiančias į regioninius ir prenumeratos ribojimus
- Įgyvendinti ekonomiškas išteklių dydžio nustatymo strategijas skirtingiems darbo krūviams
- Konfigūruoti proaktyvų stebėjimą ir įspėjimus su talpa susijusioms problemoms
- Planuoti kelių regionų diegimus su tinkamu talpos paskirstymu

## Kodėl kapaciteto planavimas svarbus

Prieš diegiant programas, turite užtikrinti:
- **Pakankamos kvotos** reikiamiems ištekliams
- **Išteklių prieinamumas** jūsų tiksliniame regione
- **Paslaugų lygio prieinamumas** pagal jūsų prenumeratos tipą
- **Tinklo talpa** numatomam srautui
- **Išlaidų optimizavimas** tinkamai parenkant dydžius

## 📊 Azure kvotų ir ribojimų supratimas

### Ribojimų tipai
1. **Prenumeratos lygio kvotos** - Maksimalūs ištekliai vienai prenumeratai
2. **Regioninės kvotos** - Maksimalūs ištekliai regione
3. **Konkrečių išteklių ribojimai** - Ribojimai atskiriems išteklių tipams
4. **Paslaugų lygio ribojimai** - Ribojimai, priklausantys nuo jūsų paslaugų plano

### Dažnos išteklių kvotos
```bash
# Patikrinti esamą kvotos naudojimą
az vm list-usage --location eastus2 --output table

# Patikrinti konkrečių išteklių kvotas
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## Išankstiniai talpos patikrinimai prieš diegimą

### Automatizuotas talpos patikros skriptas
```bash
#!/bin/bash
# capacity-check.sh - Patikrinti Azure talpą prieš diegimą

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# Funkcija kvotos naudojimo tikrinimui
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

# Patikrinti įvairias išteklių kvotas
check_quota "compute" 4      # Reikia 4 vCPU
check_quota "storage" 2      # Reikia 2 saugyklų paskyrų
check_quota "network" 1      # Reikia 1 virtualaus tinklo

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### Paslaugai specifiniai talpos patikrinimai

#### App Service talpa
```bash
# Patikrinti App Service plano prieinamumą
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # Patikrinti prieinamus SKU regione
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # Pasiūlyti alternatyvius regionus
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # Patikrinti dabartinį naudojimą
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# Naudojimas
check_app_service_capacity "eastus2" "P1v3"
```

#### Duomenų bazės talpa
```bash
# Patikrinti PostgreSQL pajėgumą
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # Patikrinti, ar SKU prieinamas
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # Rodyti prieinamus SKU
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Patikrinti Cosmos DB pajėgumą
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # Patikrinti regiono prieinamumą
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # Patikrinti, ar serverless palaikomas (jei reikia)
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

#### Container Apps talpa
```bash
# Patikrinti Container Apps pajėgumą
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Patikrinti, ar Container Apps yra prieinamas regione
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # Patikrinti dabartinį aplinkų skaičių
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Apps leidžia ne daugiau kaip 15 aplinkų viename regione
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # Rodyti prieinamus regionus
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 Regioninio prieinamumo patikrinimas

### Paslaugų prieinamumas pagal regioną
```bash
# Patikrinkite paslaugos prieinamumą skirtinguose regionuose
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

# Patikrinkite visas paslaugas
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### Regiono pasirinkimo rekomendacijos
```bash
# Rekomenduoti optimalius regionus pagal reikalavimus
recommend_region() {
    local requirements=$1  # "žemos_sąnaudos" | "našumas" | "atitiktis"
    
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

## 💰 Išlaidų planavimas ir įvertinimas

### Išteklių sąnaudų įvertinimas
```bash
# Įvertinti diegimo kaštus
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # Sukurti laikiną išteklių grupę įvertinimui
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # Diegti infrastruktūrą tikrinimo režimu
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # Ištrinti laikiną išteklių grupę
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### SKU optimizavimo rekomendacijos
```bash
# Rekomenduoti optimalias SKU pagal reikalavimus
recommend_sku() {
    local service=$1
    local workload_type=$2  # "vystymas" | "testavimas" | "produkcija"
    
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

## 🚀 Automatizuoti išankstiniai patikrinimai

### Visapusiškas išankstinis skriptas
```bash
#!/bin/bash
# preflight-check.sh - Išsamus prieš diegimą atliekamas patikrinimas

set -e

# Konfigūracija
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# Išvesties spalvos
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # Be spalvų

# Logavimo funkcijos
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# Įkelti konfigūraciją
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

# Patikra 1: Autentifikacija
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# Patikra 2: Regioninis prieinamumas
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# Patikra 3: Kvotos patikra
log_info "Checking quota availability..."

# vCPU kvota
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

# Saugojimo paskyros kvota
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

# Patikra 4: Paslaugos prieinamumas
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

# Patikra 5: Tinklo pajėgumas
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

# Patikra 6: Išteklių pavadinimų patikra
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# Patikra 7: Sąnaudų įvertinimas
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

# Patikra 8: Šablono patikra
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

# Galutinė santrauka
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### Konfigūracijos failo šablonas
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

## 📈 Talpos stebėjimas diegimo metu

### Realaus laiko talpos stebėjimas
```bash
# Stebėti pajėgumą diegiant
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # Patikrinti diegimo būseną
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
        
        # Patikrinti dabartinį išteklių naudojimą
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 Integracija su AZD

### Pridėti išankstinius patikrinimo (pre-flight) kablius į azure.yaml
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

## Geriausios praktikos

1. **Visada paleiskite talpos patikrinimus** prieš diegiant į naujus regionus
2. **Reguliariai stebėkite kvotų naudojimą**, kad išvengtumėte netikėtumų
3. **Planuokite augimą** tikrindami būsimus talpos poreikius
4. **Naudokite sąnaudų įvertinimo įrankius**, kad išvengtumėte staigių sąskaitų
5. **Dokumentuokite talpos reikalavimus** savo komandai
6. **Automatizuokite talpos patikrinimą** CI/CD vamzdynuose
7. **Apsvarstykite regioninio perjungimo (failover) talpos reikalavimus**

## Tolimesni žingsniai

- [SKU parinkimų vadovas](sku-selection.md) - Pasirinkite optimalius paslaugų lygius
- [Išankstiniai patikrinimai](preflight-checks.md) - Automatizuoti patikros skriptai
- [Atmintinė](../../resources/cheat-sheet.md) - Greitosios komandos
- [Žodynas](../../resources/glossary.md) - Terminai ir apibrėžimai

## Papildomi ištekliai

- [Azure prenumeratos ribojimai](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure kainodaros skaičiuoklė](https://azure.microsoft.com/pricing/calculator/)
- [Azure išlaidų valdymas](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure regioninis prieinamumas](https://azure.microsoft.com/global-infrastructure/services/)

---

**Navigacija**
- **Ankstesnė pamoka**: [Derinimo vadovas](../chapter-07-troubleshooting/debugging.md)

- **Kita pamoka**: [SKU parinkimas](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl kritinės informacijos rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingas interpretacijas, kylančias dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->