# திறன் திட்டமிடல் - Azure வளங்கள் கிடைக்கும் நிலை மற்றும் வரம்புகள்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [ஆரம்பக்காரர்களுக்கான AZD](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 6 - முன்-வெளியீடு சரிபார்ப்பு மற்றும் திட்டமிடல்
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 5: பல-ஏஜென்ட் AI தீர்வுகள்](../../examples/retail-scenario.md)
- **➡️ அடுத்தது**: [SKU தேர்வு](sku-selection.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 7: பிழை தீர்வு](../chapter-07-troubleshooting/common-issues.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டு நீங்கள் Azure Developer CLI உடன் வெளியிடுவதற்கு முன் Azure வள திறனைக் திட்டமிடவும் சரிபார்க்கவும் உதவுகிறது. வெற்றிகரமான வெளியீடுகளை உறுதி செய்வதற்காக கோட்டாக்கள், கிடைக்கும்தன்மை மற்றும் பிராந்திய பயன்பாட்டு வரம்புகளை மதிப்பீடு செய்வதையும் செலவு மற்றும் செயல்திறன் ஒப்புரவுகளை tốiமைப்படுத்துவதை கற்றுக் கொள்ளுங்கள். பல்வேறு பயன்பாட்டு கட்டமைப்புகள் மற்றும் அளவீட்டு senarios க்கான திறன் திட்டமிடல் நுட்பங்களை ஆத்த்மீகப்படுத்துங்கள்.

## கற்றல்நோக்கங்கள்

இந்த வழிகாட்டை முடித்தவுடன், நீங்கள்:
- Azure கோட்டாக்கள், வரம்புகள் மற்றும் பிராந்திய கிடைக்கும்தன்மை கட்டுப்பாடுகளைப் புரிந்து கொள்வீர்கள்
- வெளியிடுவதற்கு முன்னர் வளக் கிடைக்கும்தன்மை மற்றும் திறனைச் சரிபார்ப்பதற்கான நுட்பங்களில் தேர்ச்சி பெறுவீர்கள்
- தானியங்கி திறன் சரிபார்ப்பும் கண்காணிப்பு STRategies களை அமல்படுத்துவீர்கள்
- சரியான வள அளவை மற்றும் அளவுரு கருதுகோள்களுடன் பயன்பாடுகளை வடிவமைப்பீர்கள்
- புத்திசாலித்தனமான திறன் திட்டமிடலின் மூலம் செலவு tốiமைப்படுத்தல் STRategies களை பயன்படுத்துீர்கள்
- கோட்டா பயன்பாடு மற்றும் வள கிடைக்கும்தன்மைக்காக எச்சரிக்கைகள் மற்றும் கண்காணிப்புகளை அமைப்பீர்கள்

## கற்றல் முடிவுகள்

முடித்தவுடன், நீங்கள் செய்யக்கூடியவை:
- வெளியிடுவதற்கு முன்னர் Azure வள திறன் தேவைகளை மதிப்பிடவும் சரிபார்க்கவும்
- திறன் செக் மற்றும் கோட்டா கண்காணிப்புக்கான தானியங்கி ஸ்கிரிப்ட்களை உருவாக்கவும்
- பிராந்திய மற்றும் சந்தா வரம்புகளை கருத்தில் கொண்ட அளவிடக்கூடிய கட்டமைப்புகளை வடிவமைக்கவும்
- பல்வேறு வேலைபாடுகளுக்கான செலவுச் சிறந்த வள அளவைத் திட்டமிடல் STRategies ஐ செயல்படுத்தவும்
- திறன் சம்பந்தமான பிரச்சினைகளுக்காக ப்ரோக்டிவ் கண்காணிப்பு மற்றும் எச்சரிப்புகளை கட்டமைக்கவும்
- சரியான திறன் பகிர்வு கொண்ட பல-பிராந்திய வெளியீடுகளை திட்டமிடவும்

## திறன் திட்டமிடல் ஏன் முக்கியம்

பயன்பாடுகளை வெளியிடுவதற்கு முன், நீங்கள் உறுதிசெய்ய வேண்டும்:
- **தேவையான வளங்களுக்கு போதுமான கோட்டாக்கள்**
- **உங்கள் இலக்கு பிராந்தியத்தில் வள கிடைக்கும்தன்மை**
- **உங்கள் சந்தா வகைக்கான சேவை தர கிடைக்கும்தன்மை**
- **எதிர்பார்க்கப்படும் போக்குவரத்திற்கான நெட்வொர்க் திறன்**
- **சகுந்த அளவை மூலம் செலவுத் tốiமைப்படுத்தல்**

## 📊 Azure கோட்டாக்கள் மற்றும் வரம்புகளை புரிதல்

### வரம்பு வகைகள்
1. **சப்ஸ்கிரிப்ஷன்-நிலையான கோட்டாக்கள்** - ஒவ்வொரு சப்ஸ்கிரிப்ஷனிற்குமான அதிகபட்ச வளங்கள்
2. **பிராந்திய கோட்டாக்கள்** - ஒவ்வொரு பிராந்தியத்திற்குமான அதிகபட்ச வளங்கள்
3. **வள-குறித்த வரம்புகள்** - தனித்தனியான வள வகைகளுக்கான வரம்புகள்
4. **சேவை தர வரம்புகள்** - உங்கள் சேவை திட்டத்தின் அடிப்படையில் வரம்புகள்

### பொதுவான வளக் கோட்டாக்கள்
```bash
# தற்போதைய குவோட்டா பயன்பாட்டைக் சரிபார்க்கவும்
az vm list-usage --location eastus2 --output table

# குறிப்பிட்ட வள குவோட்டாக்களைச் சரிபார்க்கவும்
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## முன்-வெளியீட்டிற்கான திறன் சரிபார்ப்பு

### தானியங்கி திறன் சரிபார்ப்பு ஸ்கிரிப்ட்
```bash
#!/bin/bash
# capacity-check.sh - நிறுவுவதற்கு முன் Azure திறனை சரிபார்க்க

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# குவோட்டா பயன்பாட்டைச் சரிபார்க்கும் செயல்பாடு
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

# பல்வேறு வளங்களின் குவோட்டாக்களைச் சரிபார்க்கவும்
check_quota "compute" 4      # 4 vCPUகள் தேவை
check_quota "storage" 2      # 2 சேமிப்பு கணக்குகள் தேவை
check_quota "network" 1      # 1 மெய்நிகர் நெட்வொர்க் ஒன்று தேவை

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### சேவை-குறித்த திறன் சரிபார்ப்பு

#### App Service திறன்
```bash
# App Service Plan கிடைப்பை சரிபார்க்கவும்
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # மண்டலத்தில் கிடைக்கும் SKU-களை சரிபார்க்கவும்
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # மாற்று மண்டலங்களை பரிந்துரைக்கவும்
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # தற்போதைய பயன்பாட்டை சரிபார்க்கவும்
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# பயன்பாடு
check_app_service_capacity "eastus2" "P1v3"
```

#### தரவுத்தளம் திறன்
```bash
# PostgreSQL திறனை சரிபார்க்கவும்
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # SKU கிடைப்பதாக உள்ளதா என்பதைச் சரிபார்க்கவும்
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # கிடைக்கும் SKUகளை காட்டவும்
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Cosmos DB திறனை சரிபார்க்கவும்
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # மண்டல கிடைப்பைச் சரிபார்க்கவும்
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # தேவையானால் serverless ஆதரிக்கப்படுகிறதா என்பதைச் சரிபார்க்கவும்
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

#### Container Apps திறன்
```bash
# Container Apps திறனைக் சரிபார்க்கவும்
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Container Apps அந்த பிராந்தியத்தில் கிடைக்கிறதா என்பதைச் சரிபார்க்கவும்
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # தற்போதைய சூழல்களின் எண்ணிக்கையை சரிபார்க்கவும்
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Apps-க்கு ஒரு பிராந்தியத்திற்கு 15 சூழல்கள் வரை வரம்பு உள்ளது
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # கிடைக்கக்கூடிய பிராந்தியங்களை காட்டவும்
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 பிராந்திய கிடைக்கும்தன்மை சரிபார்ப்பு

### பிராந்தியத்தின்படி சேவை கிடைக்கும்தன்மை
```bash
# பிராந்தியங்கள் இடையே சேவை கிடைமையை சரிபார்
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

# அனைத்து சேவைகளையும் சரிபார்
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### பிராந்திய தேர்வு பரிந்துரைகள்
```bash
# தேவைகளின் அடிப்படையில் சிறந்த மண்டலங்களை பரிந்துரைக்கவும்
recommend_region() {
    local requirements=$1  # "குறைந்த செலவு" | "செயல்திறன்" | "பின்பற்றுதல்"
    
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

## 💰 செலவு திட்டமிடல் மற்றும் கணக்கீடு

### வள செலவுத் கணக்கீடு
```bash
# நிறுவலுக்கான செலவுகளை மதிப்பிடவும்
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # மதிப்பீட்டிற்காக ஒரு தற்காலிக வளக் குழுவை உருவாக்கவும்
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # சரிபார்ப்பு நிலைமையில் கட்டமைப்பை நிறுவவும்
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # தற்காலிக வளக் குழுவை நீக்கவும்
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### SKU ஒப்டிமைசேஷன் பரிந்துரைகள்
```bash
# தேவைகளின் அடிப்படையில் உகந்த SKU-களை பரிந்துரைக்கவும்
recommend_sku() {
    local service=$1
    local workload_type=$2  # "dev" | "staging" | "production"
    
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

## 🚀 தானியங்கி முன்-பரிசோதனைச் சரிபார்ப்புகள்

### விரிவான முன்-பரிசோதனை ஸ்கிரிப்ட்
```bash
#!/bin/bash
# preflight-check.sh - முழுமையான முன்-பணியிடல் சரிபார்ப்பு

set -e

# கட்டமைப்பு
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# வெளியீட்டுக்கான வண்ணங்கள்
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # வண்ணமில்லை

# பதிவு செயல்பாடுகள்
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# கட்டமைப்பை ஏற்றுதல்
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

# சோதனை 1: அங்கீகாரம்
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# சோதனை 2: பிராந்திய கிடைப்புத்தன்மை
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# சோதனை 3: ஒதுக்கீட்டு சரிபார்த்தல்
log_info "Checking quota availability..."

# vCPU ஒதுக்கீடு
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

# சேமிப்பு கணக்கு ஒதுக்கீடு
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

# சோதனை 4: சேவை கிடைப்புத்தன்மை
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

# சோதனை 5: பிணைய திறன்
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

# சோதனை 6: வள பெயரிடல் சரிபார்ப்பு
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# சோதனை 7: செலவு மதிப்பீடு
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

# சோதனை 8: வார்ப்புரு சரிபார்ப்பு
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

# இறுதி சுருக்கம்
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### கட்டமைப்பு கோப்பு மாதிரி
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

## 📈 வெளியீட்டு போது திறன் கண்காணிப்பு

### நேரடி திறன் கண்காணிப்பு
```bash
# வெளியீட்டின் போது திறனைக் கண்காணிக்கவும்
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # வெளியீட்டு நிலையைச் சரிபார்க்கவும்
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
        
        # தற்போதைய வளப் பயன்பாட்டை சரிபார்க்கவும்
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 AZD உடன் ஒருங்கிணைப்பு

### azure.yaml இல் முன்-பரிசோதனை ஹூக்களை சேர்க்கவும்
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

## சிறந்த நடைமுறை

1. **எப்பொழுதும் திறன் சரிபார்ப்புகளை இயக்கவும்** புதிய பிராந்தியங்களுக்கு வெளியிடுவதற்கு முன்
2. **கோட்டா பயன்பாட்டை முறைபடி கண்காணிக்கவும்** அதிர்ச்சிகளைத் தவிர்க்க
3. **வளர்ச்சிக்கு திட்டமிடவும்** எதிர்கால திறன் தேவைகளை சரிபார்த்தல் மூலம்
4. **செலவு கணக்கீட்டு கருவிகளை பயன்படுத்தவும்** விலை அதிர்ச்சிகளைத் தவிர்க்க
5. **உங்கள் குழுவிற்கான திறன் தேவைகளை ஆவணப்படுத்தவும்**
6. **CI/CD குழாய்களில் திறன் சரிபார்ப்பை தானியக்கப்படுத்தவும்**
7. **பிராந்திய ஃபெய்ல்ஓவர் திறன் தேவைகளைக் கருத்தில் கொள்ளவும்**

## அடுத்த படிகள்

- [SKU தேர்வு வழிகாட்டு](sku-selection.md) - சிறந்த சேவை நிலைகளை தேர்ந்தெடுக்கவும்
- [முன்-பரிசோதனை சரிபார்ப்புகள்](preflight-checks.md) - தானியங்கி சரிபார்ப்பு ஸ்கிரிப்டுகள்
- [சுருக்கக் குறிப்புகள்](../../resources/cheat-sheet.md) - விரைவான குறிப்பு கட்டளைகள்
- [அகராதி](../../resources/glossary.md) - சொற்கள் மற்றும் வரையறைகள்

## கூடுதல் வளங்கள்

- [Azure Subscription Limits](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Cost Management](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure Regional Availability](https://azure.microsoft.com/global-infrastructure/services/)

---

**வழிசெலுத்தல்**
- **முந்தைய பாடம்**: [பிழைதிருத்த வழிகாட்டு](../chapter-07-troubleshooting/debugging.md)

- **அடுத்த பாடம்**: [SKU தேர்வு](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது துல்லியமின்மைகள் இருக்கலாம் என்பதை தயவுசெய்து கவனத்தில் கொள்ளுங்கள். அசல் ஆவணம் அதன் சொந்த மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பின் பயன்படுத்துவதால் ஏற்படும் எந்தவொரு தவறான புரிதல்கள் அல்லது தவறான அர்த்தமீட்டல்களுக்காக நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->