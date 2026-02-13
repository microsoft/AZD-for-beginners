# Mipango ya Uwezo - Upatikanaji wa Rasilimali za Azure na Vizingiti

**Urambazaji wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 6 - Uthibitishaji na Mipango Kabla ya Uenezaji
- **⬅️ Sura Iliyopita**: [Sura 5: Suluhisho za AI za Wakala-Wengi](../../examples/retail-scenario.md)
- **➡️ Ifuatayo**: [Uchaguzi wa SKU](sku-selection.md)
- **🚀 Sura Ifuatayo**: [Sura 7: Kutatua Matatizo](../chapter-07-troubleshooting/common-issues.md)

## Utangulizi

Mwongozo huu kamili utakusaidia kupanga na kuthibitisha uwezo wa rasilimali za Azure kabla ya kueneza kwa kutumia Azure Developer CLI. Jifunze jinsi ya kutathmini vikoa, upatikanaji, na vizingiti vya kikanda ili kuhakikisha uenezaji wenye mafanikio huku ukiboresha gharama na utendaji. Tumia mbinu za mipango ya uwezo kwa usanifu mbalimbali wa programu na hali za upanuaji.

## Malengo ya Kujifunza

Kwa kumaliza mwongozo huu, utakuwa na uwezo wa:
- Kuelewa vikoa, vizingiti, na vikwazo vya upatikanaji vya kanda vya Azure
- Kumaster mbinu za kuangalia upatikanaji wa rasilimali na uwezo kabla ya uenezaji
- Kutekeleza mikakati ya uthibitishaji wa uwezo na ufuatiliaji yaliyo otomatishwa
- Kubuni programu kwa urefusho sahihi wa rasilimali na kuzingatia upanuaji
- Kutumia mbinu za uboreshaji wa gharama kupitia mipango ya uwezo yenye busara
- Kusanidi onyo na ufuatiliaji kwa matumizi ya vikoa na upatikanaji wa rasilimali

## Matokeo ya Kujifunza

Baada ya kumaliza, utaweza:
- Kutathmini na kuthibitisha mahitaji ya uwezo wa rasilimali za Azure kabla ya uenezaji
- Kuunda skripti zilizootomatishwa za ukaguzi wa uwezo na ufuatiliaji wa vikoa
- Kubuni usanifu unaoweza kupanuka unaochukua vizingiti vya kikanda na usajili
- Kutekeleza mikakati ya ukadiriaji wa rasilimali yenye gharama nafuu kwa aina tofauti za mzigo wa kazi
- Kusanidi ufuatiliaji wa wakati wa kulenga na onyo kwa masuala yanayohusiana na uwezo
- Kupanga uenezaji wa maeneo mengi kwa mgawanyo sahihi wa uwezo

## Kwa Nini Mipango ya Uwezo ni Muhimu

Kabla ya kueneza programu, unahitaji kuhakikisha:
- **Vikoa vya kutosha** kwa rasilimali zinazohitajika
- **Upatikanaji wa rasilimali** katika kanda yako lengwa
- **Upatikanaji wa ngazi ya huduma** kwa aina ya usajili wako
- **Uwezo wa mtandao** kwa trafiki inayotarajiwa
- **Uboreshaji wa gharama** kupitia urefusho sahihi

## 📊 Kuelewa Vikoa na Vizingiti vya Azure

### Aina za Vizingiti
1. **Vikoa vya ngazi ya usajili** - Rasilimali za juu kwa usajili
2. **Vikoa vya kikanda** - Rasilimali za juu kwa kanda
3. **Vizingiti maalum kwa rasilimali** - Vizingiti kwa aina za rasilimali binafsi
4. **Vizingiti vya ngazi ya huduma** - Vizingiti kulingana na mpango wako wa huduma

### Vikoa vya Rasilimali Vinavyojirudia
```bash
# Angalia matumizi ya kwota ya sasa
az vm list-usage --location eastus2 --output table

# Angalia kwota maalum za rasilimali
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## Ukaguzi wa Uwezo Kabla ya Uenezaji

### Skripti ya Uthibitishaji wa Uwezo Iliyootomatishwa
```bash
#!/bin/bash
# capacity-check.sh - Thibitisha uwezo wa Azure kabla ya utekelezaji

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# Kazi ya kukagua matumizi ya ukomo
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

# Angalia vigezo mbalimbali vya ukomo wa rasilimali
check_quota "compute" 4      # Zinahitajika vCPU 4
check_quota "storage" 2      # Zinahitajika akaunti 2 za hifadhi
check_quota "network" 1      # Inahitajika mtandao wa virtuali 1

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### Ukaguzi wa Uwezo wa Huduma-Maalum

#### Uwezo wa App Service
```bash
# Angalia upatikanaji wa Mpango wa Huduma ya App
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # Angalia SKU zinazopatikana katika eneo
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # Pendekeza mikoa mbadala
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # Angalia matumizi ya sasa
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# Matumizi
check_app_service_capacity "eastus2" "P1v3"
```

#### Uwezo wa Hifadhidata
```bash
# Angalia uwezo wa PostgreSQL
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # Angalia kama SKU inapatikana
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # Onyesha SKU zinazopatikana
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Angalia uwezo wa Cosmos DB
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # Angalia upatikanaji wa mkoa
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # Angalia kama serverless inasaidiwa (ikiwa inahitajika)
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

#### Uwezo wa Container Apps
```bash
# Angalia uwezo wa Container Apps
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Angalia kama Container Apps inapatikana katika eneo
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # Angalia idadi ya mazingira ya sasa
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Apps ina kikomo cha mazingira 15 kwa kila eneo
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # Onyesha maeneo yanayopatikana
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 Uthibitishaji wa Upatikanaji wa Kanda

### Upatikanaji wa Huduma kwa Kanda
```bash
# Kagua upatikanaji wa huduma katika mikoa yote
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

# Kagua huduma zote
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### Mapendekezo ya Uchaguzi wa Kanda
```bash
# Pendekeza mikoa bora kulingana na mahitaji
recommend_region() {
    local requirements=$1  # "gharama-chini" | "utendaji" | "uzingatiaji"
    
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

## 💰 Mipango na Makadirio ya Gharama

### Makadirio ya Gharama za Rasilimali
```bash
# Kadiria gharama za uanzishaji
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # Unda kikundi cha rasilimali cha muda kwa ajili ya makadirio
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # Tekeleza miundombinu katika hali ya uhakiki
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # Futa kikundi cha rasilimali cha muda
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### Mapendekezo ya Uboreshaji wa SKU
```bash
# Pendekeza SKUs bora kulingana na mahitaji
recommend_sku() {
    local service=$1
    local workload_type=$2  # "utengenezaji" | "maandalizi" | "uzalishaji"
    
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

## 🚀 Ukaguzi wa Kabla ya Uzinduaji Uliotomatishwa

### Skripti Kamili ya Kabla ya Uzinduaji
```bash
#!/bin/bash
# preflight-check.sh - Uthibitisho kamili kabla ya utekelezaji

set -e

# Usanidi
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# Rangi za matokeo
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # Hakuna Rangi

# Kazi za uandishi wa logi
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# Pakia usanidi
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

# Ukaguzi 1: Uthibitishaji
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# Ukaguzi 2: Upatikanaji wa kikanda
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# Ukaguzi 3: Uthibitisho wa kikomo
log_info "Checking quota availability..."

# Kikomo cha vCPU
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

# Kikomo cha akaunti ya uhifadhi
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

# Ukaguzi 4: Upatikanaji wa huduma
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

# Ukaguzi 5: Uwezo wa mtandao
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

# Ukaguzi 6: Uthibitisho wa majina ya rasilimali
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# Ukaguzi 7: Makadirio ya gharama
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

# Ukaguzi 8: Uthibitisho wa kiolezo
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

# Muhtasari wa mwisho
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### Kiolezo cha Faili la Usanidi
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

## 📈 Ufuatiliaji wa Uwezo Wakati wa Uenezaji

### Ufuatiliaji wa Uwezo kwa Wakati Halisi
```bash
# Fuatilia uwezo wakati wa uanzishaji
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # Kagua hali ya uanzishaji
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
        
        # Angalia matumizi ya rasilimali ya sasa
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 Uunganishaji na AZD

### Ongeza hatua za ukaguzi wa kabla ya uzinduaji kwenye azure.yaml
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

## Mbinu Bora

1. **Kimbia kila wakati ukaguzi wa uwezo** kabla ya kueneza kwenye kanda mpya
2. **Fuatilia matumizi ya vikoa mara kwa mara** ili kuepuka mshangao
3. **Panga kukua** kwa kuangalia mahitaji ya uwezo ya baadaye
4. **Tumia zana za makadirio ya gharama** ili kuepuka mshtuko wa bili
5. **Andika mahitaji ya uwezo** kwa timu yako
6. **Otomatisha uthibitishaji wa uwezo** katika mizunguko ya CI/CD
7. **Zingatia mahitaji ya uwezo kwa kuhamisha kikanda** kama mpango wa kukabiliana na hitilafu

## Hatua Zifuatazo

- [Uchaguzi wa SKU](sku-selection.md) - Chagua ngazi za huduma zinazofaa
- [Ukaguzi wa kabla ya uzinduaji](preflight-checks.md) - Skripti za uthibitishaji zilizootomatishwa
- [Karatasi ya Mbinu Fupi](../../resources/cheat-sheet.md) - Amri za kumbukumbu ya haraka
- [Kamusi ya Maneno](../../resources/glossary.md) - Maneno na maana

## Rasilimali Zaidi

- [Vizingiti vya Usajili wa Azure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Kalkuleta ya Bei ya Azure](https://azure.microsoft.com/pricing/calculator/)
- [Usimamizi wa Gharama wa Azure](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Upatikanaji wa Kanda za Azure](https://azure.microsoft.com/global-infrastructure/services/)

---

**Urambazaji**
- **Somo Lililopita**: [Mwongozo wa Kurekebisha Makosa](../chapter-07-troubleshooting/debugging.md)

- **Somo Lifuatayo**: [Uchaguzi wa SKU](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kauli ya kutokuwa na dhamana**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya utafsiri wa AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuwa sahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka ya asili katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo cha kuaminika. Kwa taarifa muhimu, inapendekezwa kutumia utafsiri wa kitaalamu kutoka kwa mtafsiri wa binadamu. Hatuwajibiki kwa kutoelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->