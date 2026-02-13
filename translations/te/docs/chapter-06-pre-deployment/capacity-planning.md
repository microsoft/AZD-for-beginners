# సామర్థ్య ప్రణాళిక - Azure వనరు లభ్యత మరియు పరిమితులు

**Chapter Navigation:**
- **📚 Course Home**: [AZD ప్రారంభికులు](../../README.md)
- **📖 Current Chapter**: అధ్యాయం 6 - ప్రి-డిప్లాయ్‌మెంట్ ధృవీకరణ మరియు ప్రణాళిక
- **⬅️ Previous Chapter**: [అధ్యాయం 5: బహుళ-ఏజెంట్ AI పరిష్కారాలు](../../examples/retail-scenario.md)
- **➡️ Next**: [SKU ఎంపిక](sku-selection.md)
- **🚀 Next Chapter**: [అధ్యాయం 7: సమస్య పరిష్కారం](../chapter-07-troubleshooting/common-issues.md)

## పరిచయం

ఈ విస్తృత గైడ్ Azure Developer CLI తో డిప్లాయ్‌మెంట్ చేయక ముందు Azure వనరు సామర్థ్యాన్ని ప్లాన్ చేయడానికి మరియు ధృవీకరించడానికి సహాయపడుతుంది. విజయవంతమైన డిప్లాయ్‌మెంట్‌లను నిర్ధారించేందుకు ఖాతాదారులను, లభ్యతను మరియు ప్రాంతీయ పరిమితులను ఎలా నిర్ధారించాలో తెలుసుకోండి, ఖర్చులు మరియు పనితీరును ఆప్టిమైజ్ చేయండి. వివిధ అప్లికేషన్ ఆర్కిటెక్చర్ల మరియు స్కేలింగ్ సందర్భాల కోసం సామర్థ్య ప్రణాళిక సాంకేతికతలను నెరిపించండి.

## నేర్చుకునే లక్ష్యాలు

ఈ గైడ్ పూర్తి చేసిన తర్వాత, మీరు:
- Azure క్వోటాలు, పరిమితులు మరియు ప్రాంతీయ లభ్యత 관련 పరిమితుల గురించి అర్థం చేసుకుంటారు
- డిప్లాయ్‌మెంట్‌కు ముందు వనరు లభ్యత మరియు సామర్థ్యాన్ని పరిశీలించే సాంకేతికతలను ఆధిపత్యం చేస్తారు
- ఆటోమెటెడ్ సామర్థ్య ధృవీకరణ మరియు మానిటరింగ్ వ్యూహాలను అమలు చేస్తారు
- సరైన వనరు సైజింగ్ మరియు స్కేలింగ్ పరిగణనలు ఉపయోగించి అప్లికేషన్లను డిజైన్ చేస్తారు
- తెలివైన సామర్థ్య ప్రణాళిక ద్వారా ఖర్చు ఆప్టిమైజేషన్ వ్యూహాలను అన్వయిస్తారు
- క్వోటా వినియోగం మరియు వనరు లభ్యత కోసం అలెర్ట్‌లు మరియు మానిటరింగ్‌ను కాన్ఫిగర్ చేస్తారు

## నేర్పుకునే ఫలితాలు

పూర్తిగా చేసిన తరువాత, మీరు సాధించగలరు:
- డిప్లాయ్‌మెంట్‌కు ముందుగా Azure వనరు సామర్థ్య అవసరాలను ఆంకితం చేసి ధృవీకరించగలరు
- సామర్థ్య తనిఖీలు మరియు క్వోటా మానిటరింగ్ కోసం ఆటోమెటెడ్ స్క్రిప్ట్‌లు సృష్టించగలరు
- ప్రాంతీయ మరియు సబ్‌స్క్రిప్షన్ పరిమితులను పరిగణనలోకి తీసుకునే స్కేలబుల్ ఆర్కిటెక్చర్లు డిజైన్ చేయగలరు
- వివిధ వర్క్‌లోడ్ రకాల కోసం ఖర్చు-సరైన వనరు సైజింగ్ వ్యూహాలను అమలు చేయగలరు
- సామర్థ్య సంబంధిత సమస్యల కోసం ప్రాక్టివ్ మానిటరింగ్ మరియు అలర్టింగ్‌ను కాన్ఫిగర్ చేయగలరు
- సరైన సామర్థ్య పంపణీతో బహు-ప్రాంత డిప్లాయ్‌మెంట్‌లను ప్లాన్ చేయగలరు

## సామర్థ్య ప్రణాళిక ఎందుకు ముఖ్యమో

అప్లికేషన్లు డిప్లాయ్ చేయక ముందే, మీరు నిర్ధారించుకోవాలి:
- **ప్రయావశ్యకమైన క్వోటాలు** అవసరమైన వనరులకు
- **వనరు లభ్యత** మీ లక్ష్య ప్రాంతంలో
- **సేవా టియర్ లభ్యత** మీ సబ్స్క్రిప్షన్ రకానికి
- **అంచనా పెట్టిన ట్రాఫిక్ కోసం నెట్‌వర్క్ సామర్థ్యం**
- **సరైన సైజింగ్ ద్వారా ఖర్చు ఆప్టిమైజేషన్**

## 📊 Azure క్వోటాలు మరియు పరిమితుల అవగాహన

### పరిమితుల రకాలు
1. **సబ్‌స్క్రిప్షన్-స్తాయి క్వోటాలు** - ప్రతి సబ్‌స్క్రిప్షన్‌కు గరిష్ఠ వనరులు
2. **ప్రాంతీయ క్వోటాలు** - ప్రతి ప్రాంతానికి గరిష్ఠ వనరులు
3. **వనరు-నిర్దిష్ట పరిమితులు** - వ్యక్తిగత వనరు రకాల కోసం పరిమితులు
4. **సేవా టియర్ పరిమితులు** - మీ సేవా ప్రణాళికపై ఆధారపడి పరిమితులు

### సాధారణ వనరు క్వోటాలు
```bash
# ప్రస్తుత క్వోటా వినియోగాన్ని తనిఖీ చేయండి
az vm list-usage --location eastus2 --output table

# నిర్దిష్ట వనరు క్వోటాలను తనిఖీ చేయండి
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## ప్రి-డిప్లాయ్‌మెంట్ సామర్థ్య పరీక్షలు

### ఆటోమెటెడ్ సామర్థ్య ధృవీకరణ స్క్రిప్ట్
```bash
#!/bin/bash
# capacity-check.sh - డిప్లాయ్‌మెంట్ ముందు Azure సామర్థ్యాన్ని నిర్ధారించండి

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# క్వోటా వినియోగాన్ని తనిఖీ చేసే ఫంక్షన్
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

# వివిధ వనరుల క్వోటాలను తనిఖీ చేయండి
check_quota "compute" 4      # 4 vCPUలు అవసరం
check_quota "storage" 2      # 2 స్టోరేజ్ అకౌంట్లు అవసరం
check_quota "network" 1      # 1 వర్చువల్ నెట్‌వర్క్ అవసరం

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### సేవ-నిర్దిష్ట సామర్థ్య పరీక్షలు

#### App Service సామర్థ్యం
```bash
# App Service Plan యొక్క లభ్యతను తనిఖీ చేయండి
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # ప్రాంతంలో అందుబాటులో ఉన్న SKUs ను తనిఖీ చేయండి
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # ప్రత్యామ్నాయ ప్రాంతాలను సూచించండి
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # ప్రస్తుత వినియోగాన్ని తనిఖీ చేయండి
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# వినియోగం
check_app_service_capacity "eastus2" "P1v3"
```

#### డేటాబేస్ సామర్థ్యం
```bash
# PostgreSQL సామర్థ్యాన్ని తనిఖీ చేయండి
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # SKU అందుబాటులో ఉందో తనిఖీ చేయండి
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # అందుబాటులో ఉన్న SKUలను చూపించండి
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Cosmos DB సామర్థ్యాన్ని తనిఖీ చేయండి
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # ప్రాంతం అందుబాటును తనిఖీ చేయండి
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # సర్వర్‌లెస్ మద్దతు ఉన్నదో లేదో తనిఖీ చేయండి (అవసరమైతే)
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

#### Container Apps సామర్థ్యం
```bash
# Container Apps సామర్థ్యాన్ని తనిఖీ చేయండి
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # ప్రాంతంలో Container Apps అందుబాటులో ఉందో కాదో తనిఖీ చేయండి
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # ప్రస్తుత పర్యావరణాల సంఖ్యను తనిఖీ చేయండి
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Apps కు ప్రతి ప్రాంతానికి 15 పర్యావరణాల పరిమితి ఉంది
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # అందుబాటులో ఉన్న ప్రాంతాలను చూపించండి
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 ప్రాంతీయ లభ్యత ధృవీకరణ

### ప్రాంతం ద్వారా సేవల లభ్యత
```bash
# ప్రాంతాల అంతటా సేవల అందుబాటును తనిఖీ చేయండి
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

# అన్ని సేవలను తనిఖీ చేయండి
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### ప్రాంతం ఎంపిక కోసం సిఫార్సులు
```bash
# ఆవశ్యకతల ఆధారంగా ఉత్తమ ప్రాంతాలను సిఫార్సు చేయండి
recommend_region() {
    local requirements=$1  # "తక్కువ ఖర్చు" | "పనితీరు" | "అనుగుణత"
    
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

## 💰 ఖర్చు ప్రణాళిక మరియు అంచనా

### వనరు ఖర్చు అంచనా
```bash
# డిప్లాయ్‌మెంట్ ఖర్చులను అంచనా వేయండి
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # అంచనా కోసం తాత్కాలిక రిసోర్స్ గ్రూప్‌ను సృష్టించండి
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # వాలిడేషన్ మోడ్‌లో ఇన్‌ఫ్రాస్ట్రక్చర్‌ను డిప్లాయ్ చేయండి
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # తాత్కాలిక రిసోర్స్ గ్రూప్‌ను తొలగించండి
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### SKU ఆప్టిమైజేషన్ సిఫార్సులు
```bash
# అవసరాల ప్రకారం ఉత్తమ SKUs ను సిఫార్సు చేయండి
recommend_sku() {
    local service=$1
    local workload_type=$2  # "డెవ్" | "స్టేజింగ్" | "ప్రొడక్షన్"
    
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

## 🚀 ఆటోమెటెడ్ ప్రీ-ఫ్లైట్ చెక్సు

### సమగ్ర ప్రీ-ఫ్లైట్ స్క్రిప్ట్
```bash
#!/bin/bash
# preflight-check.sh - డిప్లాయ్‌మెంట్‌కు ముందు పూర్తి ధృవీకరణ

set -e

# కాన్ఫిగరేషన్
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# ఫలితాల కోసం రంగులు
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # రంగు లేదు

# లాగ్ ఫంక్షన్లు
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# కాన్ఫిగరేషన్ లోడ్ చేయండి
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

# తనిఖీ 1: ప్రామాణీకరణ
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# తనిఖీ 2: ప్రాంతీయ అందుబాటుదల
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# తనిఖీ 3: కోటా ధృవీకరణ
log_info "Checking quota availability..."

# vCPU కోటా
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

# స్టోరేజ్ ఖాతా కోటా
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

# తనిఖీ 4: సేవా అందుబాటుదల
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

# తనిఖీ 5: నెట్‌వర్క్ సామర్థ్యం
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

# తనిఖీ 6: వనరుల నామకరణ ధృవీకరణ
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# తనిఖీ 7: ఖర్చు అంచనా
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

# తనిఖీ 8: టెంప్లేట్ ధృవీకరణ
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

# తుది సారాంశం
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
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

## 📈 డిప్లాయ్‌మెంట్ సమయంలో సామర్థ్యాన్ని పర్యవేక్షించడం

### రియల్-టైమ్ సామర్థ్యం పర్యవేక్షణ
```bash
# డిప్లాయ్‌మెంట్ సమయంలో సామర్థ్యాన్ని పర్యవేక్షించండి
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # డిప్లాయ్‌మెంట్ స్థితిని తనిఖీ చేయండి
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
        
        # ప్రస్తుత వనరుల వినియోగాన్ని తనిఖీ చేయండి
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 AZDతో ఇంటిగ్రేషన్

### azure.yaml లో ప్రీ-ఫ్లైట్ హుక్స్ జోడించండి
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

## ఉత్తమ పద్ధతులు

1. **ఎల్లప్పుడూ సామర్థ్య పరీక్షలు నిర్వహించండి** కొత్త ప్రాంతాల్లో డిప్లాయ్ చేయముందు
2. **క్వోటా వినియోగాన్ని నియమితంగా పర్యవేక్షించండి** ఆశ్చర్యకరం రాకుండా
3. **వృద్ధి కోసం ప్రణాళిక చేయండి** భవిష్యత్ సామర్థ్య అవసరాలను తనిఖీ చేయండి
4. **ఖర్చు అంచనా సాధనాలను ఉపయోగించండి** బిల్ షాక్ నివారించడానికి
5. **మీ టీమ్ కోసం సామర్థ్య అవసరాలను డాక్యుమెంట్ చేయండి**
6. **CI/CD పైప్లైన్లలో సామర్థ్య ధృవీకరణను ఆటోమేట్ చేయండి**
7. **ప్రాంతీయ ఫెయిల్‌ఓవర్ సామర్థ్య అవసరాలను పరిగణనలోకి తీసుకోండి**

## తదుపరి దశలు

- [SKU ఎంపిక మార్గదర్శి](sku-selection.md) - ఆప్టిమల్ సర్వీస్ టియర్‌లను ఎంచుకోండి
- [ప్రీ-ఫ్లైట్ చెక్సు](preflight-checks.md) - ఆటోమెటెడ్ ధృవీకరణ స్క్రిప్ట్‌లు
- [చీట్ షీట్](../../resources/cheat-sheet.md) - తక్షణ సూచన కమాండ్లు
- [పదకోశం](../../resources/glossary.md) - పదాలు మరియు నిర్వచనాలు

## అదనపు వనరులు

- [Azure Subscription Limits](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Cost Management](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure Regional Availability](https://azure.microsoft.com/global-infrastructure/services/)

---

**Navigation**
- **Previous Lesson**: [డీబగ్గింగ్ గైడ్](../chapter-07-troubleshooting/debugging.md)

- **Next Lesson**: [SKU ఎంపిక](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
డిస్క్లెయిమర్:
ఈ డాక్యుమెంట్‌ను AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడినది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాలలో తప్పులు లేదా అసత్యతలు ఉండవచ్చు అనే విషయాన్ని దయచేసి గమనించండి. మూల భాషలోని అసలు డాక్యుమెంట్‌ను అధికారిక మూలంగా పరిగణించాలి. ముఖ్యమైన సమాచారానికి వృత్తిపరమైన మానవ అనువాదాన్ని సిఫార్సు చేస్తాము. ఈ అనువాదాన్ని ఉపయోగించటం వలన ఏర్పడే ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాలకు మేము బాధ్యులు కాదని గమనించండి.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->