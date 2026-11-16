# సామర్థ్య ప్రణాళిక - Azure వనరు అందుబాటును మరియు పరిమితులు

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 6 - మొదటి-డిప్లాయ్‌మెంట్ ధృవీకరణ & ప్రణాళిక
- **⬅️ గత అధ్యాయం**: [అధ్యాయం 5: బహుళ-ఏజెంట్ AI పరిష్కారాలు](../../examples/retail-scenario.md)
- **➡️ తదుపరి**: [SKU ఎంపిక](sku-selection.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 7: సమస్యల పరిష్కారం](../chapter-07-troubleshooting/common-issues.md)

## పరిచయం

ఈ సమగ్ర గైడ్ Azure Developer CLI ను ఉపయోగించి డిప్లాయ్‌మెంట్ ముందు Azure వనరుల సామర్థ్యాన్ని ప్రణాళిక చేసి ధృవీకరించడంలో సహాయపడుతుంది. ఉత్తమ ఫలితాల కోసం క్వోటాలు, అందుబాటు, ప్రాంతీయ పరిమితులను అంచనా వేయడం మరియు ఖర్చులు, పనితీరు మెరుగుపరచడం నేర్చుకోండి. వివిధ అప్లికేషన్ శిల్పాలు మరియు స్కేలింగ్ పరిస్థితుల కోసం సామర్థ్య ప్రణాళిక సాంకేతికతలను ఆర్జించండి.

## అభ్యాస లక్ష్యాలు

ఈ గైడ్ పూర్తి చేసిన తరువాత మీరు:
- Azure క్వోటాలు, పరిమితులు మరియు ప్రాంతీయ అందుబాటు నియమాలను అర్థం చేసుకోవాలి
- డిప్లాయ్‌మెంట్ ముందు వనరు అందుబాటు మరియు సామర్థ్యాన్ని తనిఖీ చేయడానికి సాంకేతికతలపై పట్టండి
- ఆటోమేటిక్ సామర్థ్య ధృవీకరణ మరియు పర్యవేక్షణ వ్యూహాలను అమలు చేయండి
- సరైన వనరు కొలత మరియు స్కేలింగ్ పరిగణనలతో అప్లికేషన్లను రూపకల్పన చేయండి
- తెలివైన సామర్థ్య ప్రణాళిక ద్వారా ఖర్చు ఆప్టిమైజేషన్ వ్యూహాలను వర్తించండి
- క్వోటా వాడకం మరియు వనరు అందుబాటు గురించి అలెర్ట్లు మరియు పర్యవేక్షణను సెట్ చేయండి

## అభ్యాస ఫలితాలు

పూర్తి చేసిన తరువాత, మీరు చేయగలిగే పనులు:
- డిప్లాయ్‌మెంట్ ముందు Azure వనరుల సామర్థ్య అవసరాలను అంచనా వేత్తు మరియు ధృవీకరించండి
- సామర్థ్య తనిఖీలు మరియు క్వోటా పర్యవేక్షణ కోసం ఆటోమేటెడ్ స్క్రిప్ట్స్ సృష్టించండి
- ప్రాంతీయ మరియు సబ్‌స్క్రిప్షన్ పరిమితులను పరిగణలోకి తీసుకొని స్కేలబుల్ ఆర్కిటెక్చర్లను డిజైన్ చేయండి
- వివిధ వర్క్లోడ్ రకాల కోసం ఖర్చు-సమర్థవంతమైన వనరు కొలత వ్యూహాలను అమలు చేయండి
- సామర్థ్య సంబంధ సమస్యల కోసం ప్రాథమిక పర్యవేక్షణ మరియు అలెర్టింగ్‌ను సెట్ చేయండి
- సరైన సామర్థ్య పంపిణీతో బహు-ప్రాంతీయ డిప్లాయ్‌మెంట్ల ను ప్రణాళిక చేయండి

## సామర్థ్య ప్రణాళిక ఎందుకు ముఖ్యం

> **వ్యాప్తి:** ఈ Bash ఉదాహరణల కోసం Azure CLI, `jq` మరియు ఎంపికైన సబ్‌స్క్రిప్షన్ అవసరం. ఇవి ప్రచురించిన ఆఫరింగులు మరియు క్వోటాను పరిశీలిస్తాయి; ఇవి భౌతిక సామర్థ్యాన్ని నిరూపించవు లేదా వనరులను రిజర్వ్ చేయవు. మీ స్వంత ప్రాజెక్ట్‌లో స్నిపెట్లను సేవ్/అనుకూలపరిచండి—క్రింద ఉన్న స్క్రిప్ట్/కాన్ఫిగ్ ఫైల్ పేర్లు ఉదాహరణలు మాత్రమే, అప్‌లోడ్ చేయబడలేదు. VM క్వోటాలు కంటెయినర్ యాప్స్, యాప్స్ సర్వీస్, లేదా Azure OpenAI క్వోటాలకు వర్తించవు.

అప్లికేషన్లను డిప్లాయ్‌ చేయడానికి ముందు, మీరు నిర్ధారించుకోవాలి:
- **అవసరమైన వనరులకు సరిపోని క్వోటాలు**
- **మీ లక్ష్య ప్రాంతంలో వనరు అందుబాటు**
- **మీ సబ్‌స్క్రిప్షన్ రకం కోసం సర్వీస్ టియర్ అందుబాటు**
- **అంచనా ట్రాఫిక్ కోసం నెట్వర్క్ సామర్థ్యం**
- **సరైన కొలత ద్వారా ఖర్చు ఆప్టిమైజేషన్**

## 📊 Azure క్వోటాలు మరియు పరిమితులను అర్థం చేసుకోండి

### పరిమితుల రకాలు
1. **సబ్‌స్క్రిప్షన్ స్థాయి క్వోటాలు** - ప్రతి సబ్‌స్క్రిప్షన్‌కు గరిష్ట వనరులు
2. **ప్రాంతీయ క్వోటాలు** - ప్రతి ప్రాంతానికి గరిష్ట వనరులు
3. **వనరు-స్పెసిఫిక్ పరిమితులు** - వ్యక్తిగత వనరు రకాలపై పరిమితులు
4. **సర్వీస్ టియర్ పరిమితులు** - మీ సర్వీస్ ప్లాన్ ఆధారంగా పరిమితులు

### సాధారణ వనరు క్వోటాలు
```bash
# Check current quota usage
az vm list-usage --location eastus2 --output table

# Check specific resource quotas
az network list-usages --location eastus2 --output table
az storage account show-usage --location eastus2 --output table
```

## ముందస్తు-డిప్లాయ్ సామర్థ్య తనిఖీలు

### ఆటోమేటెడ్ సామర్థ్య ధృవీకరణ స్క్రిప్ట్
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

### సర్వీస్-స్పెసిఫిక్ సామర్థ్య తనిఖీలు

#### యాప్ సర్వీస్ సామర్థ్యం
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

#### డేటాబేస్ సామర్థ్యం
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

#### కంటెయినర్ యాప్స్ సామర్థ్యం
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

## 📍 ప్రాంతీయ అందుబాటు ధృవీకరణ

### ప్రాంతం ప్రకారం సర్వీస్ అందుబాటు
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

### ప్రాంత ఎంపిక చర్చ (ఉదాహరణ)

క్రింది లేబుల్లు అన్వేషణ కోసం సూచనలు, నిర్ధారించిన ధరలు, హార్డ్‌వేర్ లేదా అనుగుణత ర‍్యాంకింగ్‌లు కాదు. ప్రస్తుత ప్రాంతీయ ధరలు మరియు కొలిచిన మధ్యవర్తిత్వాన్ని పోల్చండి. GDPR జర్మనీ ప్రాంతాన్ని తప్పనిసరిగా కోరుకోదు; నివాసం, సేవా ఫీచర్లు, సంస్థ/చట్ట అవసరాలు కలిసి అంచనా వేయాలి.
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

## 💰 ఖర్చు ప్రణాళిక మరియు అంచనా

### వనరు ఖర్చు అంచనా
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

### SKU ఆప్టిమైజేషన్ సూచనలు
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

## 🚀 ఆటోమేటెడ్ ముందస్తు-ఫ్లైట్ తనిఖీలు

### సమగ్ర ముందస్తు-ఫ్లైట్ స్క్రిప్ట్
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

### కాన్ఫిగరేషన్ ఫైల్ టెంప్లేట్
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

## 📈 డిప్లాయ్‌మెంట్ సమయంలో సామర్థ్య పర్యవేక్షణ

### రియల్టైమ్ సామర్థ్య పర్యవేక్షణ
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

## 🔗 AZD తో ఐక్యకరణ

### azure.yaml కి ముందస్తు-ఫ్లైట్ హూక్స్ జోడించండి
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

## ఉత్తమ ఆచారాలు

1. **కొత్త ప్రాంతాల్లో డిప్లాయ్‌మెంట్‌కు ముందు ఎప్పుడూ సామర్థ్య తనిఖీలు జరపండి**
2. **అనూహ్య పరిస్థితులను నివారించేందుకు క్వోటా వినియోగాన్ని తరచూ పర్యవేక్షించండి**
3. **వృద్ధి కోసం ప్రణాళిక చేయండి, భవిష్యత్తు సామర్థ్య అవసరాలను తనిఖీ చేయండి**
4. **బిల్ షాక్ నివారించడానికి ఖర్చు అంచనా సాధనాలు ఉపయోగించండి**
5. **మీ బృందం కోసం సామర్థ్య అవసరాలను డాక్యుమెంట్ చేయండి**
6. **CI/CD పైప్లైన్లలో సామర్థ్య ధృవీకరణను ఆటోమేట్లు చేయండి**
7. **ప్రాంతీయ ఫెయిలోవర్ సామర్థ్య అవసరాలను పరిగణించండి**

## తదుపరి చర్యలు

- [SKU ఎంపిక గైడ్](sku-selection.md) - ఉత్తమ సర్వీస్ టియర్‌లను ఎంచుకోవాలి
- [ముందస్తు-ఫ్లైట్ తనిఖీలు](preflight-checks.md) - ఆటోమేటెడ్ ధృవీకరణ స్క్రిప్టులు
- [చీట్ షీటు](../../resources/cheat-sheet.md) - త్వరిత సూచన ఆదేశాలు
- [పదకోశం](../../resources/glossary.md) - పదాలు మరియు నిర్వచనాలు

## అదనపు వనరులు

- [Azure సబ్‌స్క్రిప్షన్ పరిమితులు](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure ధర లెక్కింపయంత్రం](https://azure.microsoft.com/pricing/calculator/)
- [Azure ఖర్చు నిర్వహణ](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure ప్రాంతీయ అందుబాటు](https://azure.microsoft.com/global-infrastructure/services/)

---

**నావిగేషన్**
- **గత పాఠం**: [డిబగ్గింగ్ గైడ్](../chapter-07-troubleshooting/debugging.md)

- **తదుపరి పాఠం**: [SKU ఎంపిక](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->