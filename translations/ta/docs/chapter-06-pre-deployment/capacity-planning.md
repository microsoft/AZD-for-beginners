# திறன் திட்டமிடல் - அஸ்யூர் வள இருப்புத்தன்மை மற்றும் வரம்புகள்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாட கோப்பு முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 6 - முன்-பதிவு சரிபார்ப்பு மற்றும் திட்டமிடல்
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 5: பன்முக உதவியாளர் AI தீர்வுகள்](../../examples/retail-scenario.md)
- **➡️ அடுத்தது**: [SKU தேர்வு](sku-selection.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 7: பிழைதிருத்தல்](../chapter-07-troubleshooting/common-issues.md)

## அறிமுகம்

இந்த விரிவான கையேடு, அஸ்யூர் டெவலப்பர் CLI உடன் இடவமைப்பதற்கு முன்னர் Azure வள திறனை திட்டமிட்டு சரிபார்க்க உதவுகிறது. பங்களிப்புக்களை, இருப்புத்தன்மையை மற்றும் பிராந்திய வரம்புகளை மதிப்பிட கற்றுக்கொள்ளுங்கள்; இது வெற்றிகரமான இடவமைப்புகளை உறுதிப்படுத்தும் போது செலவு மற்றும் செயல்திறனையும் மேம்படுத்தும். விதவிதமான விண்ணப்ப கட்டமைப்புகள் மற்றும் பரவல் சூழல்களுக்கு திறன் திட்டமிடல் முறைகளை ஆற்றுபவர் ஆகுங்கள்.

## கற்றல் குறிக்கோள்கள்

இந்த கையேடு முடித்தால், நீங்கள்:
- அஸ்யூர் குவாடாக்கள், வரம்புகள் மற்றும் பிராந்திய இருப்புத்தன்மை கட்டுப்பாடுகளை புரிந்து கொள்வீர்கள்
- இடவமைப்புக்கு முன்னுரிமையாக வள இருப்புத்தன்மையை மற்றும் திறனை சரிபார்க்கும் முறைகளை கற்றுக்கொள்வீர்கள்
- தானாக திறன் சரிபார்ப்பு மற்றும் கண்காணிப்பு யுக்திகளை நடைமுறைப்படுத்துவீர்கள்
- சரியான வள பருமன் மற்றும் பரவல் கருத்துக்களுடன் விண்ணப்பங்களை வடிவமைப்பீர்கள்
- புத்திசாலித்தனமான திறன் திட்டமிடல் மூலம் செலவு தகுந்தமையாக குறைக்கவும்
- குவாடா பயன்பாடு மற்றும் வள இருப்புத்தன்மைக்கு எச்சரிக்கை மற்றும் கண்காணிப்பை அமைப்பீர்கள்

## கற்றல் முடிவுகள்

முடிக்கும்போது, நீங்கள் துணிந்து செய்ய முடியும்:
- இடவமைப்பிற்கு முன்னரே அஸ்யூர் வள திறன் தேவைகளை மதிப்பிட்டு சரிபார்க்க
- திறன் சோதனை மற்றும் குவாடா கண்காணிப்பு தானியங்கி ஸ்கிரிப்ட்களை உருவாக்க
- பிராந்திய மற்றும் சந்தா வரம்புகளை கருத்தில் கொண்டு பரவக்கூடிய கட்டமைப்புகளை வடிவமைக்க
- வித்தியாசமான பணிமுறை வகைகளுக்கான செலவு-தகுந்த வள அளவை திட்டமிட
- திறன் தொடர்பான பிரச்சினைகளுக்கு முன்கூட்டியே கண்காணிப்பு மற்றும் எச்சரிக்கை அமைக்க
- சரியான திறன் வகைப்படுத்தலுடன் பன்முக பிராந்திய இடவமைப்புகளை திட்டமிட

## திறன் திட்டமிடல் ஏன் முக்கியம்?

> **பரப்பு:** இந்த Bash உதாரணங்களுக்கு Azure CLI, `jq` மற்றும் தேர்ந்தெடுக்கப்பட்ட சந்தா தேவைப்படுகின்றது. வெளியிடப்பட்ட வழங்கல்களையும் குவாடாவையும் பரிசீலிக்கின்றன; உட்பொருள் திறன் அல்லது வளங்களை நிச்சயமாக்குவதில்லை. கீழே உள்ள ஸ்கிரிப்ட்/கான்ஃபிக் கோப்புகள் உதாரணங்களாகும், சேமித்து/மாற்றி உங்கள் திட்டத்தில் பயன்படுத்துங்கள் - இவை பதிவு செய்யப்படவில்லை. VM குவாடாக்கள் Container Apps, App Service, அல்லது Azure OpenAI குவாடாக்களை கொண்டாடவில்லை.

விண்ணப்பங்களை நிறுவுவதற்கு முன், நீங்கள் உறுதிசெய்ய வேண்டும்:
- தேவையான வளங்களுக்கு **போதுமான குவாடாக்கள்**
- உங்கள் இலக்கு பிராந்தியத்தில் **வள இருப்புத்தன்மை**
- உங்கள் சந்தா வகைக்கு **சேவை நிலை இருப்புத்தன்மை**
- எதிர்பார்க்கப்படும் போக்குவரத்துக்கு **நெட்வொர்க் திறன்**
- சரியான அளவிடல் மூலம் **செலவு தகுதிப்படுத்தல்**

## 📊 அஸ்யூர் குவாடாக்கள் மற்றும் வரம்புகளைப் புரிந்து கொள்வது

### வரம்புகளின் வகைகள்
1. **சந்தா நிலை குவாடாக்கள்** - ஒரு சந்தாவிற்கு அதிகபட்ச வளங்கள்
2. **பிராந்திய குவாடாக்கள்** - ஒரு பிராந்தியத்திற்கு அதிகபட்ச வளங்கள்
3. **வள-சார்ந்த வரம்புகள்** - தனித்தனியாய் வள வகைகளுக்கு வரம்புகள்
4. **சேவை நிலை வரம்புகள்** - உங்கள் சேவை திட்டத்தின் அடிப்படையில் வரம்புகள்

### பொதுவான வள குவாடாக்கள்
```bash
# Check current quota usage
az vm list-usage --location eastus2 --output table

# Check specific resource quotas
az network list-usages --location eastus2 --output table
az storage account show-usage --location eastus2 --output table
```

## முன்-இடவமைப்பு திறன் சோதனைகள்

### தானியங்கி திறன் சரிபார்ப்பு ஸ்கிரிப்ட்
```bash
#!/bin/bash
# capacity-check.sh - Validate Azure capacity before deployment

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# Function to check quota usage
check_quota() {
    local resource_type=$1
    local required=$2
    
    echo "Checking $resource_type quota..."
    
    case $resource_type in
        "compute")
            usage=$(az vm list-usage --location "$LOCATION" --query "[?name.value=='cores'].{current:currentValue,limit:limit}" -o json)
            current=$(echo "$usage" | jq -r '.[0].current')
            limit=$(echo "$usage" | jq -r '.[0].limit')
            ;;
        "storage")
            usage=$(az storage account show-usage --location "$LOCATION" --query "{current:currentValue,limit:limit}" -o json)
            current=$(echo "$usage" | jq -r '.current')
            limit=$(echo "$usage" | jq -r '.limit')
            ;;
        "network")
            usage=$(az network list-usages --location "$LOCATION" --query "[?name.value=='VirtualNetworks'].{current:currentValue,limit:limit}" -o json)
            current=$(echo "$usage" | jq -r '.[0].current')
            limit=$(echo "$usage" | jq -r '.[0].limit')
            ;;
    esac
    
    if ! [[ "$current" =~ ^[0-9]+$ && "$limit" =~ ^[0-9]+$ ]]; then
        echo "❌ Quota data missing or unrecognized for $resource_type"
        return 1
    fi
    available=$((limit - current))
    
    if [ "$available" -ge "$required" ]; then
        echo "✅ $resource_type: $available/$limit available (need $required)"
    else
        echo "❌ $resource_type: Only $available/$limit available (need $required)"
        return 1
    fi
}

# Check various resource quotas
check_quota "compute" 4      # Need 4 vCPUs
check_quota "storage" 2      # Need 2 storage accounts
check_quota "network" 1      # Need 1 virtual network

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### சேவை-சார்ந்த திறன் சோதனைகள்

#### App Service திறன்
```bash
# Check App Service Plan availability
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # Check available SKUs in region
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location' || name=='$(az account list-locations --query "[?name=='$location'].displayName | [0]" -o tsv)']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is listed for $location (not a capacity guarantee)"
    else
        echo "❌ $sku is not available in $location"
        
        # Suggest alternative regions
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # Check current usage
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# Usage
check_app_service_capacity "eastus2" "P1v3"
```

#### தரவுத்தளம் திறன்
```bash
# Check PostgreSQL capacity
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # Inspect the nested regional capability catalog; do not assume top-level
    # entries are VM SKU names. Select supported tier/version/SKU combinations.
    available=$(az postgres flexible-server list-skus --location "$location" \
        --output json)
    
    if [ -n "$available" ] && [ "$available" != "[]" ]; then
        echo "$available" | jq .
        echo "Inspect the catalog for $sku; this does not verify physical capacity."
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # Show available SKUs
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --output json
        return 1
    fi
}

# Check Cosmos DB capacity
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # Check region availability
    display_location=$(az account list-locations --query "[?name=='$location'].displayName | [0]" -o tsv)
    available_regions=$(az cosmosdb locations list --query "[?name=='$display_location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # Check if serverless is supported (if needed)
        if [ "$tier" = "serverless" ]; then
            echo "Verify serverless support and limits separately in Cosmos DB documentation."
            echo "Availability-zone support is NOT a serverless-support signal."
        fi
    else
        echo "❌ Cosmos DB is not available in $location"
        return 1
    fi
}
```

#### கன்டெய்னர் செயலிகள் திறன்
```bash
# Check Container Apps capacity
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Check if Container Apps is available in region
    display_location=$(az account list-locations --query "[?name=='$location'].displayName | [0]" -o tsv)
    if az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations[]" \
        --output tsv | grep -Fxq "$display_location"; then
        echo "✅ Container Apps is available in $location"
        
        # Check current environment count
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        echo "Check Microsoft.App quotas for this subscription/region in Azure Quotas."
        echo "An environment count alone does not establish available quota."
    else
        echo "❌ Container Apps is not available in $location"
        
        # Show available regions
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 பிராந்திய இருப்புத்தன்மை சரிபார்ப்பு

### பிராந்தியத்தில் சேவை இருப்புத்தன்மை
```bash
# Check service availability across regions
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
            echo "PostgreSQL offerings for candidate region eastus2:"
            az postgres flexible-server list-skus --location eastus2 --output json
            ;;
        "cosmosdb")
            az cosmosdb locations list --query "[].{name:name,documentationUrl:documentationUrl}" -o table
            ;;
    esac
}

# Check all services
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### பிராந்தியத் தேர்வு விவாதம் (உதாரணம்)

கீழ்க்காணும் லேபிள்கள் ஆராய்ச்சிக்கான தூண்டுகோல்கள், சரிபார்க்கப்பட்ட விலை, இயந்திரப்பாதுகாப்பு அல்லது பொருந்துமான தரவரிசைகள் அல்ல. தற்போதைய பிராந்திய விலைகள் மற்றும் அளவிடப்பட்ட ஒத்திக்கோலாய்ப்பை ஒப்பிடுங்கள். GDPR குறிப்பிடுவதில்லை ஜெர்மனி பிராந்தியத்தை மட்டும்; குடியிருந்தல், சேவை அம்சங்கள் மற்றும் நிறுவன/சட்ட தேவைகள் ஒன்றியமைக்கப்பட வேண்டும்.
```bash
# Recommend optimal regions based on requirements
recommend_region() {
    local requirements=$1  # "lowcost" | "performance" | "compliance"
    
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
            echo "  - East US 2 (Virginia) - Measure latency to your users"
            echo "  - West US 2 (Washington) - Verify required SKUs"
            echo "  - North Europe (Ireland) - For EU users"
            ;;
        "compliance")
            echo "🔒 Compliance-focused regions:"
            echo "  - US Gov regions - For government workloads"
            echo "  - EU regions - Assess residency and contractual requirements"
            echo "  - Australia regions - For data sovereignty"
            ;;
    esac
}
```

## 💰 செலவுத் திட்டமிடல் மற்றும் மதிப்பீடு

### வள செலவு மதிப்பீடு
```bash
# Estimate deployment costs
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # Review declared resources locally. ARM validate/what-if do NOT price them.
    # Do not create/delete a resource group just to estimate cost.
    az bicep build --file infra/main.bicep --stdout |
      jq -r '.resources[] | [.type, (.sku.name // "see module/parameters")] | @tsv'
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### SKU சரியானபடுத்தல் பரிந்துரைகள்
```bash
# Recommend optimal SKUs based on requirements
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

## 🚀 தானியங்கி முன்-பரிசோதனைகள்

### விரிவான முன்-பரிசோதனை ஸ்கிரிப்ட்
```bash
#!/bin/bash
# preflight-check.sh - Complete pre-deployment validation
# Starting-point example: adapt service checks and supply project-specific costs.

set -e

# Configuration
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Logging functions
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# Load configuration
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

# Check 1: Authentication
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_ID=$(az account show --query id -o tsv)
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# Check 2: Regional availability
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# Check 3: Quota validation
log_info "Checking quota availability..."

# vCPU quota
vcpu_usage=$(az vm list-usage --location "$LOCATION" \
    --query "[?name.value=='cores'].{current:currentValue,limit:limit}" -o json)
vcpu_current=$(echo "$vcpu_usage" | jq -r '.[0].current')
vcpu_limit=$(echo "$vcpu_usage" | jq -r '.[0].limit')
[[ "$vcpu_current" =~ ^[0-9]+$ && "$vcpu_limit" =~ ^[0-9]+$ ]] || { log_error "Missing VM quota data"; exit 1; }
vcpu_available=$((vcpu_limit - vcpu_current))

if [ "$vcpu_available" -ge "$REQUIRED_VCPUS" ]; then
    log_info "vCPU quota: $vcpu_available/$vcpu_limit available (need $REQUIRED_VCPUS)"
else
    log_error "Insufficient vCPU quota: $vcpu_available/$vcpu_limit available (need $REQUIRED_VCPUS)"
    exit 1
fi

# Storage account quota
storage_usage=$(az storage account show-usage --location "$LOCATION" --query "{current:currentValue,limit:limit}" -o json)
storage_current=$(echo "$storage_usage" | jq -r '.current')
storage_limit=$(echo "$storage_usage" | jq -r '.limit')
[[ "$storage_current" =~ ^[0-9]+$ && "$storage_limit" =~ ^[0-9]+$ ]] || { log_error "Missing storage quota data"; exit 1; }
storage_available=$((storage_limit - storage_current))

if [ "$storage_available" -ge "$REQUIRED_STORAGE" ]; then
    log_info "Storage quota: $storage_available/$storage_limit available (need $REQUIRED_STORAGE)"
else
    log_error "Insufficient storage quota: $storage_available/$storage_limit available (need $REQUIRED_STORAGE)"
    exit 1
fi

# Check 4: Service availability
log_info "Checking service availability..."
DISPLAY_LOCATION=$(az account list-locations --query "[?name=='$LOCATION'].displayName | [0]" -o tsv)

for service in "${REQUIRED_SERVICES[@]}"; do
    case $service in
        "appservice")
            if az appservice list-locations --sku B1 --query "[?name=='$LOCATION' || name=='$DISPLAY_LOCATION']" -o tsv | grep -q .; then
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
                --output tsv | grep -Fxq "$DISPLAY_LOCATION"; then
                log_info "Container Apps is available in $LOCATION"
            else
                log_error "Container Apps is not available in $LOCATION"
                exit 1
            fi
            ;;
        "cosmosdb")
            if az cosmosdb locations list --query "[?name=='$DISPLAY_LOCATION']" -o tsv | grep -q .; then
                log_info "Cosmos DB is available in $LOCATION"
            else
                log_error "Cosmos DB is not available in $LOCATION"
                exit 1
            fi
            ;;
        "storage")
            log_info "Storage account quota checked above; validate the selected SKU separately."
            ;;
        *)
            log_error "No check implemented for service: $service"; exit 1
            ;;
    esac
done

# Check 5: Network capacity
log_info "Checking network capacity..."
vnet_usage=$(az network list-usages --location "$LOCATION" \
    --query "[?name.value=='VirtualNetworks'].{current:currentValue,limit:limit}" -o json)
vnet_current=$(echo "$vnet_usage" | jq -r '.[0].current')
vnet_limit=$(echo "$vnet_usage" | jq -r '.[0].limit')
[[ "$vnet_current" =~ ^[0-9]+$ && "$vnet_limit" =~ ^[0-9]+$ ]] || { log_error "Missing network quota data"; exit 1; }
vnet_available=$((vnet_limit - vnet_current))

if [ "$vnet_available" -gt 0 ]; then
    log_info "Virtual Network quota: $vnet_available/$vnet_limit available"
else
    log_warn "Virtual Network quota: $vnet_available/$vnet_limit available (may need cleanup)"
fi

# Check 6: Resource naming validation
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# Check 7: Cost estimation
log_info "Performing cost estimation..."
# Set this from a reviewed Pricing Calculator estimate; no built-in pricing API
# is implemented by this example.
: "${ESTIMATED_MONTHLY_COST:?Set ESTIMATED_MONTHLY_COST to your reviewed estimate}"
[[ "$ESTIMATED_MONTHLY_COST" =~ ^[0-9]+$ ]] || { log_error "Use an integer cost estimate"; exit 1; }
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

# Check 8: Template validation
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

# Final summary
echo "=================================="
log_info "✅ Implemented checks passed; review remaining service-specific limits."
log_info "Quota is not a reservation or guarantee of capacity in $LOCATION."
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

## 📈 இடவமைப்பு போது திறன் கண்காணிப்பு

### நேரடி திறன் கண்காணிப்பு
```bash
# Monitor capacity during deployment
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # Check deployment status
        deployment_status=$(az deployment group list \
            --resource-group "$resource_group" \
            --query "sort_by(@, &properties.timestamp)[-1].properties.provisioningState" -o tsv)
        
        if [ "$deployment_status" = "Succeeded" ]; then
            log_info "Deployment completed successfully"
            break
        elif [ "$deployment_status" = "Failed" ] || [ "$deployment_status" = "Canceled" ]; then
            log_error "Deployment failed"
            break
        fi
        
        # Check current resource usage
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 AZD உடன் ஒருங்கிணைப்பு

### azure.yaml இல் முன்-பரிசோதனை ஹுக்குகளை சேர்க்க
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      set -e
      echo "Running pre-flight capacity checks..."
      bash ./scripts/preflight-check.sh "${AZURE_LOCATION}" "${AZURE_ENV_NAME}"
      
      if [ $? -ne 0 ]; then
        echo "Pre-flight checks failed"
        exit 1
      fi
      
      echo "Pre-flight checks passed, proceeding with deployment"
```

## சிறந்த நடைமுறைகள்

1. **புதிய பிராந்தியங்களுக்கு இடவமைப்பதற்கு முன் எப்போதும் திறன் சோதனைகளை இயக்குங்கள்**
2. **கவனத்தை தடுக்க குவாடா பயன்பாட்டை முறையான முறையில் கண்காணிக்கவும்**
3. **எதிர்கால திறன் தேவைகளை சோதித்து வளர்ச்சி திட்டமிடுங்கள்**
4. **மட்டக கணக்கீட்டு கருவிகளை பயன்படுத்தி செலவு அதிர்ச்சியைத் தவிர்க்கவும்**
5. **உங்கள் குழுவிற்கு திறன் தேவைகளை ஆவணப்படுத்தவும்**
6. **CI/CD குழாய்களில் திறன் சரிபார்ப்பை தானியக்கம்செய்யவும்**
7. **பிராந்திய வீழ்ச்சி திறன் தேவைகளை கருத்தில் கொள்ளவும்**

## அடுத்த படிகள்

- [SKU தேர்வு கையேடு](sku-selection.md) - சிறந்த சேவை நிலைகளைத் தேர்வு செய்க
- [முன்-பரிசோதனைகள்](preflight-checks.md) - தானியங்கி சரிபார்ப்பு ஸ்கிரிப்ட்கள்
- [சீட்டு பட்டியல்](../../resources/cheat-sheet.md) - விரைவு குறிப்படிகளுக்கான கட்டளைகள்
- [அகராதி](../../resources/glossary.md) - சொற்கள் மற்றும் வரையறைகள்

## கூடுதல் வளங்கள்

- [அஸ்யார் சந்தா வரம்புகள்](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [அஸ்யார் விலை கணக்கீட்டு](https://azure.microsoft.com/pricing/calculator/)
- [அஸ்யார் செலவு மேலாண்மை](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [அஸ்யார் பிராந்திய இருப்புத்தன்மை](https://azure.microsoft.com/global-infrastructure/services/)

---

**வழிசெலுத்தல்**
- **முந்தைய பாடம்**: [பிழைதிருத்தல் கையேடு](../chapter-07-troubleshooting/debugging.md)

- **அடுத்த பாடம்**: [SKU தேர்வு](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->